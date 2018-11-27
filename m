From: anup@brainfault.org (Anup Patel)
Date: Tue, 27 Nov 2018 15:33:13 +0530
Subject: [PATCH v2 0/4] IRQ affinity support in PLIC driver
Message-ID: <20181127100317.12809-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset primarily adds IRQ affinity support in PLIC driver and
other improvements.

The patchset gives mechanism for explicitly routing external interrupts to
particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
can now use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc4
and can be found at riscv_plic_irq_affinity_v2 branch of:
https://github.com/avpatel/linux.git

Changes since v1:
 - Removed few whitspace changes from PATCH1
 - Keep use of DEFINE_PER_CPU() as it is

Anup Patel (4):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: More flexible plic_irq_toggle()
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 144 ++++++++++++++++++------------
 1 file changed, 86 insertions(+), 58 deletions(-)

-- 
2.17.1
