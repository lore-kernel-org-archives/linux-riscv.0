From: matt.redfearn@mips.com (Matt Redfearn)
Date: Thu, 29 Mar 2018 11:41:22 +0100
Subject: [PATCH v4 2/3] lib: Rename compiler intrinsic selects to GENERIC_LIB_*
In-Reply-To: <1522320083-27818-1-git-send-email-matt.redfearn@mips.com>
References: <1522320083-27818-1-git-send-email-matt.redfearn@mips.com>
Message-ID: <1522320083-27818-2-git-send-email-matt.redfearn@mips.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

When these are included into arch Kconfig files, maintaining
alphabetical ordering of the selects means these get split up. To allow
for keeping things tidier and alphabetical, rename the selects to
GENERIC_LIB_*

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

---

Changes in v4:
Rename Kconfig symbols GENERIC_* -> GENERIC_LIB_*

Changes in v3: None
Changes in v2: None

 arch/riscv/Kconfig |  6 +++---
 lib/Kconfig        | 12 ++++++------
 lib/Makefile       | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 04807c7f64cc..20185aaaf933 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,9 +104,9 @@ config ARCH_RV32I
 	bool "RV32I"
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select 32BIT
-	select GENERIC_ASHLDI3
-	select GENERIC_ASHRDI3
-	select GENERIC_LSHRDI3
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_LSHRDI3
 
 config ARCH_RV64I
 	bool "RV64I"
diff --git a/lib/Kconfig b/lib/Kconfig
index e96089499371..e54ebe00937e 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -588,20 +588,20 @@ config STRING_SELFTEST
 
 endmenu
 
-config GENERIC_ASHLDI3
+config GENERIC_LIB_ASHLDI3
 	bool
 
-config GENERIC_ASHRDI3
+config GENERIC_LIB_ASHRDI3
 	bool
 
-config GENERIC_LSHRDI3
+config GENERIC_LIB_LSHRDI3
 	bool
 
-config GENERIC_MULDI3
+config GENERIC_LIB_MULDI3
 	bool
 
-config GENERIC_CMPDI2
+config GENERIC_LIB_CMPDI2
 	bool
 
-config GENERIC_UCMPDI2
+config GENERIC_LIB_UCMPDI2
 	bool
diff --git a/lib/Makefile b/lib/Makefile
index a90d4fcd748f..7425e177f08c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -253,9 +253,9 @@ obj-$(CONFIG_SBITMAP) += sbitmap.o
 obj-$(CONFIG_PARMAN) += parman.o
 
 # GCC library routines
-obj-$(CONFIG_GENERIC_ASHLDI3) += ashldi3.o
-obj-$(CONFIG_GENERIC_ASHRDI3) += ashrdi3.o
-obj-$(CONFIG_GENERIC_LSHRDI3) += lshrdi3.o
-obj-$(CONFIG_GENERIC_MULDI3) += muldi3.o
-obj-$(CONFIG_GENERIC_CMPDI2) += cmpdi2.o
-obj-$(CONFIG_GENERIC_UCMPDI2) += ucmpdi2.o
+obj-$(CONFIG_GENERIC_LIB_ASHLDI3) += ashldi3.o
+obj-$(CONFIG_GENERIC_LIB_ASHRDI3) += ashrdi3.o
+obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
+obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
+obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
+obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
-- 
2.7.4
