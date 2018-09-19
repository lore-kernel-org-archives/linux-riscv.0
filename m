From: mick@ics.forth.gr (Nick Kossifidis)
Date: Thu, 20 Sep 2018 01:48:15 +0300
Subject: [PATCH] RISC-V: Cosmetic menuconfig changes
Message-ID: <20180919224815.24688-1-mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

* Move the built-in cmdline configuration on a new menu entry "Boot
  options", it doesn't make much sense to be part of the debuging menu.

* Rename "Kernel Type" menu to "Kernel features" to be more consistent with
  what other architectures are using, plus "type" is a bit misleading here.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/Kconfig       | 40 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/Kconfig.debug | 35 -----------------------------------
 2 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a3449802..82172bf8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -210,12 +210,50 @@ endmenu
 
 endmenu
 
-menu "Kernel type"
+menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
 endmenu
 
+menu "Boot options"
+
+config CMDLINE_BOOL
+	bool "Built-in kernel command line"
+	help
+	  For most platforms, it is firmware or second stage bootloader
+	  that by default specifies the kernel command line options.
+	  However, it might be necessary or advantageous to either override
+	  the default kernel command line or add a few extra options to it.
+	  For such cases, this option allows hardcoding command line options
+	  directly into the kernel.
+
+	  For that, choose 'Y' here and fill in the extra boot parameters
+	  in CONFIG_CMDLINE.
+
+	  The built-in options will be concatenated to the default command
+	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
+	  command line will be ignored and replaced by the built-in string.
+
+config CMDLINE
+	string "Built-in kernel command string"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Supply command-line options at build time by entering them here.
+
+config CMDLINE_FORCE
+	bool "Built-in command line overrides bootloader arguments"
+	depends on CMDLINE_BOOL
+	help
+	  Set this option to 'Y' to have the kernel ignore the bootloader
+	  or firmware command line.  Instead, the built-in command line
+	  will be used exclusively.
+
+	  If you don't know what to do here, say N.
+
+endmenu
+
 menu "Bus support"
 
 config PCI
diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index 3224ff6e..c5a72f17 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -1,37 +1,2 @@
-
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
-	help
-	  For most platforms, it is firmware or second stage bootloader
-	  that by default specifies the kernel command line options.
-	  However, it might be necessary or advantageous to either override
-	  the default kernel command line or add a few extra options to it.
-	  For such cases, this option allows hardcoding command line options
-	  directly into the kernel.
-
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
-
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
-
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
-	help
-	  Supply command-line options at build time by entering them here.
-
-config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
-	help
-	  Set this option to 'Y' to have the kernel ignore the bootloader
-	  or firmware command line.  Instead, the built-in command line
-	  will be used exclusively.
-
-	  If you don't know what to do here, say N.
-
 config EARLY_PRINTK
 	def_bool y
-- 
2.16.4
