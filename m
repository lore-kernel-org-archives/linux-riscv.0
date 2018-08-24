From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Fri, 24 Aug 2018 17:33:53 +0900
Subject: [PATCH] riscv: move GCC version check for ARCH_SUPPORTS_INT128 to
 Kconfig
Message-ID: <1535099634-29439-1-git-send-email-yamada.masahiro@socionext.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This becomes much neater in Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/riscv/Kconfig  | 1 +
 arch/riscv/Makefile | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..ed81df4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -112,6 +112,7 @@ config ARCH_RV32I
 config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
+	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FTRACE_MCOUNT_RECORD
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 61ec424..33700e4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -25,8 +25,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
-	
-	KBUILD_CFLAGS	+= $(call cc-ifversion, -ge, 0500, -DCONFIG_ARCH_SUPPORTS_INT128)
 
 	KBUILD_MARCH = rv64im
 	KBUILD_LDFLAGS += -melf64lriscv
-- 
2.7.4
