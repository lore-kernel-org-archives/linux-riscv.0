From: anup@brainfault.org (Anup Patel)
Date: Tue,  4 Sep 2018 18:15:12 +0530
Subject: [RFC PATCH 3/5] RISC-V: Select useful GENERIC_IRQ kconfig options
In-Reply-To: <20180904124514.6290-1-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
Message-ID: <20180904124514.6290-4-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch selects following GENERIC_IRQ kconfig options:
GENERIC_IRQ_MULTI_HANDLER
GENERIC_IRQ_PROBE
GENERIC_IRQ_SHOW_LEVEL
HANDLE_DOMAIN_IRQ

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..026abe3d6cb0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -22,7 +22,10 @@ config RISCV
 	select DMA_DIRECT_OPS
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CPU_DEVICES
+	select GENERIC_IRQ_MULTI_HANDLER
+	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
@@ -33,6 +36,7 @@ config RISCV
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_PERF_EVENTS
+	select HANDLE_DOMAIN_IRQ
 	select IRQ_DOMAIN
 	select NO_BOOTMEM
 	select RISCV_ISA_A if SMP
-- 
2.17.1
