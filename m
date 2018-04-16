From: hch@lst.de (Christoph Hellwig)
Date: Mon, 16 Apr 2018 14:53:51 +0200
Subject: [PATCH] riscv: select DMA_DIRECT_OPS instead of redefining it
Message-ID: <20180416125351.14216-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

DMA_DIRECT_OPS is defined in lib/Kconfig, so don't duplicate it in
arch/riscv/Kconfig.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 23d8acca5c90..cd4fd85fde84 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -11,6 +11,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select DMA_DIRECT_OPS
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_SHOW
@@ -89,9 +90,6 @@ config PGTABLE_LEVELS
 config HAVE_KPROBES
 	def_bool n
 
-config DMA_DIRECT_OPS
-	def_bool y
-
 menu "Platform type"
 
 choice
-- 
2.17.0
