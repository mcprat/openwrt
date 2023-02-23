#!/bin/bash

# cat target-devices | wc -l
# 1726

# cat target-devices-disabled | wc -l
# git grep 'TARGET_DEVICES' | grep '#' | wc -l
# 27

# git grep 'define Device/' | wc -l
# 1970

# diff is 244 and 1699

# git grep 'define Device/Build' | wc -l
# 7

# git grep 'define Device/Check' | wc -l
# 2

# git grep 'define Device/Default' | wc -l
# 38

# git grep 'define Device/Dump' | wc -l
# 2

# git grep 'define Device/Export' | wc -l
# 2

# git grep 'define Device/Init' | wc -l
# 2

# sum is 53

# git grep 'define DeviceCommon' | wc -l
# 191 expected common device defines

# git grep 'define Device/' | wc -l
# -53=1699 expected device defines

# git grep 'define Disabled/' | wc -l
# 27 expected Disabled defines


# any discrepancy will be in device-vars-diff
# cat device-vars-diff | wc -l
# 1


git grep -h TARGET_DEVICES | grep '+=' > target-devices
sed -i 's/.*+=[ ]//g' target-devices
cat target-devices | sort > temp
mv temp target-devices

git grep -h TARGET_DEVICES | grep '#' > target-devices-disabled
sed -i 's/.*+=[ ]//g' target-devices-disabled
cat target-devices-disabled | sort > temp
mv temp target-devices-disabled

git grep -h TARGET_DEVICES | grep '+=' | grep -v '#' > target-devices-notdisabled
sed -i 's/.*+=[ ]//g' target-devices-notdisabled
cat target-devices-notdisabled | sort > temp
mv temp target-devices-notdisabled





git grep -h 'define Device/' > device-vars
sed -i '/Device\/Build/d' device-vars
sed -i '/Device\/Check/d' device-vars
sed -i '/Device\/Default/d' device-vars
sed -i '/Device\/Dump/d' device-vars
sed -i '/Device\/Export/d' device-vars
sed -i '/Device\/Init/d' device-vars
sed -i 's,.*Device/,,g' device-vars
cat device-vars | sort > temp
mv temp device-vars







diff device-vars target-devices | grep '<' > target-devices-diff
sed -i 's,.*<[ ],,g' target-devices-diff

diff device-vars target-devices | grep '>' > device-vars-diff
sed -i 's,.*>[ ],,g' device-vars-diff






for common in $(cat target-devices-diff); do \
	commonnew=${common////_}; \
	commonnew=${commonnew//-common/}; \
	commonnew=${commonnew//-Common/}; \
	commonnew=${commonnew//_common/}; \
	commonnew=${commonnew//_Common/}; \
	commonnew=${commonnew//-default/}; \
	commonnew=${commonnew//-Default/}; \
	commonnew=${commonnew//_default/}; \
	commonnew=${commonnew//_Default/}; \
	echo $commonnew; \
	for file in $(git grep --files-with-matches Device/$common); do \
		sed -i "s,Device/$common,DeviceCommon/$common,g" $file; \
		for device in $(cat target-devices | grep $common); do \
			sed -i "s,DeviceCommon/$device,Device/$device,g" $file; \
		done; \
		sed -i "s,DeviceCommon/$common,DeviceCommon/$commonnew,g" $file; \
	done; \
done









for disabled in $(cat target-devices-disabled); do \
	for makefile in $(git grep --files-with-matches Device/$disabled); do \
		echo sed -i "s,Device/$disabled,Disabled/$disabled,g" $makefile; \
		sed -i "s,Device/$disabled,Disabled/$disabled,g" $makefile; \
	done; \
done








for dev in $(cat device-vars); do \
	for profile in $(git grep --files-with-matches -E TARGET_DEVICES.*$dev); do \
		echo sed -i "/TARGET_DEVICES += $dev/d" $profile; \
		sed -i "/TARGET_DEVICES += $dev/d" $profile; \
	done; \
done




# rm target-devices target-devices-diff target-devices-files device-vars device-vars-diff device-vars-files target-devices-disabled target-devices-notdisabled
