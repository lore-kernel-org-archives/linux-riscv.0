From: shea@shealevy.com (Shea Levy)
Date: Mon, 19 Feb 2018 19:04:18 -0500
Subject: [PATCH] riscv: Add install target to Makefile.
Message-ID: <20180220000418.21039-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/Makefile   |  4 ++++
 arch/riscv/install.sh | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/riscv/install.sh

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6719dd30ec5b..26892daefa05 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -70,3 +70,7 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 libs-y += arch/riscv/lib/
 
 all: vmlinux
+
+PHONY += install
+install: vmlinux
+	sh $(srctree)/arch/riscv/install.sh $(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
diff --git a/arch/riscv/install.sh b/arch/riscv/install.sh
new file mode 100644
index 000000000000..8b3155a11a4a
--- /dev/null
+++ b/arch/riscv/install.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# arch/riscv/install.sh
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/ia64/Makefile by Shea Levy
+#
+# "make install" script for riscv architecture
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+#
+
+# User may have a custom install script
+
+if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
+if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
+
+# Default install - no bootloader configuration (yet?)
+base=$(basename $2)
+
+if [ -f $4/$base ]; then
+	mv $4/$base $4/$base.old
+fi
+
+if [ -f $4/System.map ]; then
+	mv $4/System.map $4/System.old
+fi
+
+cat $2 > $4/$base
+cp $3 $4/System.map
-- 
2.16.1
