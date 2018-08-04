From: hch@lst.de (Christoph Hellwig)
Date: Sat,  4 Aug 2018 12:14:02 +0200
Subject: [PATCH 3/3] PCI/xilinx: Depend on OF instead of the ARCH
In-Reply-To: <20180804101402.10022-1-hch@lst.de>
References: <20180804101402.10022-1-hch@lst.de>
Message-ID: <20180804101402.10022-4-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

There isn't a hard dependency of the Xilinx AXI-PCIe host bridge on any
architecture.  For example: at SiFive we map RISC-V cores to Xilinx FPGAs
and connect the Xilinx IP via a TileLink adapter, so the RISC-V Linux
port will need to be able to enable PCIE_XILINX in order to have PCIe
support.

This patch decouples the PCIE_XILINX support from ARCH.  Instead it just
depends on OF, which I believe is the only true dependency.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
[hch: switch to OF instead of OF_PCI now that the latter is gone]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pci/controller/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index cc9fa02d32a0..0f7ce5eaeac8 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -102,7 +102,7 @@ config PCI_HOST_GENERIC
 
 config PCIE_XILINX
 	bool "Xilinx AXI PCIe host bridge support"
-	depends on ARCH_ZYNQ || MICROBLAZE || (MIPS && PCI_DRIVERS_GENERIC) || COMPILE_TEST
+	depends on OF || COMPILE_TEST
 	help
 	  Say 'Y' here if you want kernel to support the Xilinx AXI PCIe
 	  Host Bridge driver.
-- 
2.18.0
