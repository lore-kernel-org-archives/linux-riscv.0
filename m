From: anup@brainfault.org (Anup Patel)
Date: Mon, 9 Jul 2018 12:04:29 +0530
Subject: [RFC] Hypervisor extension emulation in QEMU or Spike
Message-ID: <CAAhSdy3yMZWNWsX8+PaYWU0CCYkJdKv-b0Re6X4yanAnJBZeag@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi All,

We have started porting Xvisor to RISC-V.

It's a GPLv2 Type-1 monolithic hypervisor (different from KVM which is Type-2).

For interested folks, here are few papers on Xvisor:
http://xhypervisor.org/pdf/Embedded_Hypervisor_Xvisor_A_comparative_analysis.pdf
http://xhypervisor.org/pdf/Xvisor_VirtIO_CAN_Fast_virtualized_CAN.pdf
http://xhypervisor.org/pdf/dual-ICIT18.pdf
http://xhypervisor.org/pdf/isol-ICIT18.pdf

At this point, we have managed to get Xvisor booting on QEMU but we
now need an emulator (QEMU/Spike) which can emulate hypervisor
extensions.

Is there any work-in-progress implementation of QEMU/Spike with RISC-V
hypervisor extensions?

Regards,
Anup
