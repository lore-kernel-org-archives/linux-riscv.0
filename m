From: alankao@andestech.com (Alan Kao)
Date: Thu, 9 Aug 2018 14:26:41 +0800
Subject: [PATCH v5 3/5] Cleanup ISA string setting
In-Reply-To: <1533796003-680-1-git-send-email-alankao@andestech.com>
References: <1533796003-680-1-git-send-email-alankao@andestech.com>
Message-ID: <1533796003-680-4-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Just a side note: (Assume that atomic and compressed is on)

Before this patch, assembler was always given the riscv64imafdc
MARCH string because there are fld/fsd's in entry.S; compiler was
always given riscv64imac because kernel doesn't need floating point
code generation.  After this, the MARCH string in AFLAGS and CFLAGS
become the same.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6d4a5f6c3f4f..e0fe6790624f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -26,7 +26,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
-	KBUILD_MARCH = rv64im
 	LDFLAGS += -melf64lriscv
 else
 	BITS := 32
@@ -34,22 +33,20 @@ else
 
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
+riscv-march-y				:= $(riscv-march-y)fd
+riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+KBUILD_CFLAGS += -march=$(riscv-march-y)
+KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-- 
2.18.0
