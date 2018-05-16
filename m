From: hch@lst.de (Christoph Hellwig)
Date: Wed, 16 May 2018 16:43:02 +0200
Subject: [PATCH 3/3] riscv: add swiotlb support
In-Reply-To: <20180516144302.823-1-hch@lst.de>
References: <20180516144302.823-1-hch@lst.de>
Message-ID: <20180516144302.823-4-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

All RISC-V platforms today lack an IOMMU. However, legacy PCI devices
sometimes require DMA-memory to be in the low 32 bits.  To make this work,
we enable the software-based bounce buffers from swiotlb.  They only impose
overhead when the device in question cannot address the full 64-bit address
space, so a perfect fit.

This patch assumes that DMA is coherent with the processor and the PCI
bus.  It also assumes that the processor and devices share a common
address space. This is true for all RISC-V platforms so far.

[changelog stolen from an earlier patch by Palmer Dabbelt that did the
 more complicated swiotlb wireup before the recent consolidation]

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/dma-mapping.h | 15 +++++++++++++++
 arch/riscv/kernel/setup.c            |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 arch/riscv/include/asm/dma-mapping.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c4488ce8c2fa..274bc064c41f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -114,6 +114,7 @@ config ARCH_RV64I
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
+	select SWIOTLB
 
 endchoice
 
diff --git a/arch/riscv/include/asm/dma-mapping.h b/arch/riscv/include/asm/dma-mapping.h
new file mode 100644
index 000000000000..8facc1c8fa05
--- /dev/null
+++ b/arch/riscv/include/asm/dma-mapping.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef _RISCV_ASM_DMA_MAPPING_H
+#define _RISCV_ASM_DMA_MAPPING_H 1
+
+#ifdef CONFIG_SWIOTLB
+#include <linux/swiotlb.h>
+static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
+{
+	return &swiotlb_dma_ops;
+}
+#else
+#include <asm-generic/dma-mapping.h>
+#endif /* CONFIG_SWIOTLB */
+
+#endif /* _RISCV_ASM_DMA_MAPPING_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c11f40c1b2a8..ee44a48faf79 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -29,6 +29,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/sched/task.h>
+#include <linux/swiotlb.h>
 
 #include <asm/setup.h>
 #include <asm/sections.h>
@@ -206,6 +207,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
+	swiotlb_init(1);
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.17.0
