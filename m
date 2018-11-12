From: anup@brainfault.org (Anup Patel)
Date: Mon, 12 Nov 2018 11:25:15 +0530
Subject: [PATCH] RISC-V: Build flat and compressed kernel images
Message-ID: <20181112055515.20341-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch extends Linux RISC-V build system to build and install:
Image - Flat uncompressed kernel image
Image.gz - Flat and GZip compressed kernel image

Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
booting flat and compressed kernel images. In case of Uboot, booting
Image or Image.gz is achieved using bootm command.

The flat and uncompressed kernel image (i.e. Image) is very useful
in pre-silicon developent and testing because we can create back-door
HEX files for RAM on FPGAs from Image.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Makefile             | 15 ++++++++-
 arch/riscv/boot/.gitignore      |  2 ++
 arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
 arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/head.S        | 10 ++++++
 arch/riscv/kernel/vmlinux.lds.S |  2 +-
 6 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/boot/.gitignore
 create mode 100644 arch/riscv/boot/Makefile
 create mode 100644 arch/riscv/boot/install.sh

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d10146197533..d117a60362eb 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -71,10 +71,23 @@ KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
 # arch specific predefines for sparse
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
 
+# Default target when executing plain make
+boot		:= arch/riscv/boot
+KBUILD_IMAGE	:= $(boot)/Image.gz
+
 head-y := arch/riscv/kernel/head.o
 
 core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
-all: vmlinux
+all: Image.gz
+
+Image: vmlinux
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
+Image.%: Image
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
+zinstall install:
+	$(Q)$(MAKE) $(build)=$(boot) $@
diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
new file mode 100644
index 000000000000..8dab0bb6ae66
--- /dev/null
+++ b/arch/riscv/boot/.gitignore
@@ -0,0 +1,2 @@
+Image
+Image.gz
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
new file mode 100644
index 000000000000..0990a9fdbe5d
--- /dev/null
+++ b/arch/riscv/boot/Makefile
@@ -0,0 +1,33 @@
+#
+# arch/riscv/boot/Makefile
+#
+# This file is included by the global makefile so that you can add your own
+# architecture-specific flags and dependencies.
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 2018, Anup Patel.
+# Author: Anup Patel <anup@brainfault.org>
+#
+# Based on the ia64 and arm64 boot/Makefile.
+#
+
+OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
+
+targets := Image
+
+$(obj)/Image: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/Image.gz: $(obj)/Image FORCE
+	$(call if_changed,gzip)
+
+install:
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(obj)/Image System.map "$(INSTALL_PATH)"
+
+zinstall:
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
new file mode 100644
index 000000000000..18c39159c0ff
--- /dev/null
+++ b/arch/riscv/boot/install.sh
@@ -0,0 +1,60 @@
+#!/bin/sh
+#
+# arch/riscv/boot/install.sh
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
+# Adapted from code in arch/i386/boot/install.sh by Russell King
+#
+# "make install" script for the RISC-V Linux port
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+#
+
+verify () {
+	if [ ! -f "$1" ]; then
+		echo ""                                                   1>&2
+		echo " *** Missing file: $1"                              1>&2
+		echo ' *** You need to run "make" before "make install".' 1>&2
+		echo ""                                                   1>&2
+		exit 1
+	fi
+}
+
+# Make sure the files actually exist
+verify "$2"
+verify "$3"
+
+# User may have a custom install script
+if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
+if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
+
+if [ "$(basename $2)" = "Image.gz" ]; then
+# Compressed install
+  echo "Installing compressed kernel"
+  base=vmlinuz
+else
+# Normal install
+  echo "Installing normal kernel"
+  base=vmlinux
+fi
+
+if [ -f $4/$base-$1 ]; then
+  mv $4/$base-$1 $4/$base-$1.old
+fi
+cat $2 > $4/$base-$1
+
+# Install system map file
+if [ -f $4/System.map-$1 ]; then
+  mv $4/System.map-$1 $4/System.map-$1.old
+fi
+cp $3 $4/System.map-$1
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 711190d473d4..fe884cd69abd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -44,6 +44,16 @@ ENTRY(_start)
 	amoadd.w a3, a2, (a3)
 	bnez a3, .Lsecondary_start
 
+	/* Clear BSS for flat non-ELF images */
+	la a3, __bss_start
+	la a4, __bss_stop
+	ble a4, a3, clear_bss_done
+clear_bss:
+	REG_S zero, (a3)
+	add a3, a3, RISCV_SZPTR
+	blt a3, a4, clear_bss
+clear_bss_done:
+
 	/* Save hart ID and DTB physical address */
 	mv s0, a0
 	mv s1, a1
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index ece84991609c..65df1dfdc303 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -74,7 +74,7 @@ SECTIONS
 		*(.sbss*)
 	}
 
-	BSS_SECTION(0, 0, 0)
+	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
 	EXCEPTION_TABLE(0x10)
 	NOTES
-- 
2.17.1
