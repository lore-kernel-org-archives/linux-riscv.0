From: alankao@andestech.com (Alan Kao)
Date: Mon, 27 Aug 2018 09:07:53 +0800
Subject: [PATCH 3/5] Cleanup ISA string setting
In-Reply-To: <1535332075-5727-1-git-send-email-alankao@andestech.com>
References: <1535332075-5727-1-git-send-email-alankao@andestech.com>
Message-ID: <1535332075-5727-4-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch cleanup the MARCH string passing to both compiler and
assembler.  Note that the CFLAGS should not contain "fd" before we
have mechnisms like kernel_fpu_begin/end in other architectures.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1f536a7784aa..33bd3b4dd926 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -29,7 +29,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 	
 	KBUILD_CFLAGS	+= $(call cc-ifversion, -ge, 0500, -DCONFIG_ARCH_SUPPORTS_INT128)
 
-	KBUILD_MARCH = rv64im
 	LDFLAGS += -melf64lriscv
 else
 	BITS := 32
@@ -37,22 +36,20 @@ else
 
 	KBUILD_CFLAGS += -mabi=ilp32
 	KBUILD_AFLAGS += -mabi=ilp32
-	KBUILD_MARCH = rv32im
 	LDFLAGS += -melf32lriscv
 endif
 
 KBUILD_CFLAGS += -Wall
 
-ifeq ($(CONFIG_RISCV_ISA_A),y)
-	KBUILD_ARCH_A = a
-endif
-ifeq ($(CONFIG_RISCV_ISA_C),y)
-	KBUILD_ARCH_C = c
-endif
-
-KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
+# ISA string setting
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
+riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
+riscv-march-y				:= fd
+riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
+KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-- 
2.18.0
