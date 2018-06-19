From: hch@lst.de (Christoph Hellwig)
Date: Tue, 19 Jun 2018 16:16:57 +0200
Subject: add support for Xilinx PCIe root ports on RISC-V
Message-ID: <20180619141700.7842-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi all,

this series with patches originally from Palmer and Wesley adds support
for the pcie-xilinx host driver on RISC-V boards.  The interesting part
about that is that the IP blocks is limited to 32-bit DMA internally,
which didn't seem to be an issue with the existing users, but shows
up easily with the Sifive RISC-V boards that have physical memory
wired up above 4G.  To support this the per-device flag I've added last
merge window is set through a new hook in struct pci_ops.
