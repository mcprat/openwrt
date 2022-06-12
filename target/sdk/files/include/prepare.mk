#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

prepare: .git/config

.git/config:
	@( \
		printf "Initializing SDK ... "; \
		git init -q .; \
		find . '(' '!' -path "./*" -o -prune ')' '!' -name 'feeds' '(' '!' -path "./*" -o -print ')' | \
			xargs git add; \
		git commit -q -m "Initial state"; \
		echo "ok."; \
	)
