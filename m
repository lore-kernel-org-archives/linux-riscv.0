From: anup@brainfault.org (Anup Patel)
Date: Mon, 22 Oct 2018 17:15:13 +0530
Subject: [PATCH 0/4] IRQ affinity support in PLIC driver
Message-ID: <20181022114517.22748-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset primarily adds IRQ affinity support in PLIC driver and
other improvements.

The patchset gives mechanism for explicitly routing external interrupts to
particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
can now use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.19-rc2
and can be found at riscv_plic_irq_affinity_v1 branch of:
https://github.com/avpatel/linux.git

Anup Patel (4):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: More flexible plic_irq_toggle()
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 164 ++++++++++++++++++------------
 1 file changed, 99 insertions(+), 65 deletions(-)

-- 
2.17.1
