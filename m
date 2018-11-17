From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 17 Nov 2018 20:21:54 +0200
Subject: [PATCH v2] RISC-V: Update Kconfig to better handle CMDLINE
Message-ID: <20181117182154.14162-1-mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Add a menu to chose how the built-in command line will be
used and add CMDLINE_EXTEND for compatibility with FDT code.

v2: Improved help messages, removed references to bootloader
and make them more descriptive. I also asked help from a
friend who's a language expert just in case.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
---
 arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e..9e233627a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,39 +227,48 @@ endmenu
 
 menu "Boot options"
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
+config CMDLINE
+	string "Built-in kernel command line"
 	help
-	  For most platforms, it is firmware or second stage bootloader
-	  that by default specifies the kernel command line options.
-	  However, it might be necessary or advantageous to either override
-	  the default kernel command line or add a few extra options to it.
-	  For such cases, this option allows hardcoding command line options
-	  directly into the kernel.
+	  For most platforms, the arguments for the kernel's command line
+	  are provided at run-time, during boot. However there are cases
+	  where no arguments are being provided or the provided arguments
+	  are insufficient or even invalid.
 
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
+	  When that occurs, it is possible to define a built-in command
+	  line here and chose how the kernel should use it later on.
 
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
+choice
+	prompt "Built-in command line usage" if CMDLINE != ""
+	default CMDLINE_FALLBACK
+	help
+	  Chose how the kernel will handle the provided built-in command
+	  line.
 
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
+config CMDLINE_FALLBACK
+	bool "Fallback"
 	help
-	  Supply command-line options at build time by entering them here.
+	  Use the built-in command line as fallback in case we get nothing
+	  during boot. This is the default behaviour.
+
+config CMDLINE_EXTEND
+	bool "Extension"
+	help
+	  The command-line arguments provided during boot will be
+	  appended to the built-in command line. This is useful in
+	  cases where the provided arguments are insufficient and
+	  you don't want or cannot modify them.
+
 
 config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
+	bool "Forced"
 	help
-	  Set this option to 'Y' to have the kernel ignore the bootloader
-	  or firmware command line.  Instead, the built-in command line
-	  will be used exclusively.
+	  Always use the built-in command line, even if we get one during
+	  boot. This is useful in case you need to override the provided
+	  command line on systems where you don't have or want any
+	  control over it.
 
-	  If you don't know what to do here, say N.
+endchoice
 
 endmenu
 
-- 
2.16.4
