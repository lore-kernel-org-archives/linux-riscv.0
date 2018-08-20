From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 14:04:47 -0700 (PDT)
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
Message-ID: <mhng-b2f871a4-be9c-4107-baef-52a6258dbe45@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Linus' master now boots on QEMU's master, which is big step forwards.  I've 
gone ahead and marked the riscv-linux-4.18 branch as protected in our GitHub, 
and I'd like to enforce that this branch only contains backports of patches 
that have at least made it into linux-next (and ideally master), as that will 
limit the difference between riscv-linux-4.18 and master as well as forcing me 
to do this the right way.

I have the following branches on kernel.org/palmer/linux.git:

* fix-delete_compat, fix-noinc: Suitable for this MW, in my PR.
* review-init_halt_cleanups: I need to review these before sending them out, 
  but I think they're suitable for RCs.
* wip-32bit_dma: I think this branch is defunct, but I haven't gotten a chance 
  to give it a proper check yet.  This is the patch set (from Christoph) that I 
  think obseletes this branch <https://lkml.org/lkml/2018/5/25/477>.
* wip-dma: I think we need the functionality here, but the code is a mess -- 
  it's a hodge-podge of a proper patch from Christoph and some hackery of mine 
  that I think can be dropped now in favor of the generic support.
* wip-fespi: This needs review, but is at least well split out so that's 
  feasible to do now.
* wip-futex_cmpxchg: Not sure what to do with this, but at least it's small.  
  If it's still necessary then I'm not opposed to throwing this in as it stands 
  (and during an RC), but if providing an SMP implementation is as quick as it 
  seems to be then we should fix it correctly.
* wip-gemgxl_clock_driver: Another one that's stand-alone and therefor suitable 
  for review.
* wip-is25wp256d: I sent this out here <https://lkml.org/lkml/2018/8/7/256> but 
  don't see it in master.  I just pinged it.
* wip-prci_clock: Another one that's stand-alone and therefor suitable for 
  review.
* wip-seccomp: This looks fine, I'll send it for review after the merge window 
  and target it for 4.20.
* wip-sifive_serial: Another one that's stand-alone and therefor suitable for 
  review.  Paul is at SiFive now, so he'll be taking it over.
* wip-timer: Here's another one that's a mess.  Christoph cleaned up the 
  driver and Atish has a better version out on the mailing list of what's left, 
  so my hope is that we're in decent shape for 4.20 here.

If your patches aren't on one of these branches then they're probably in my 
inbox.  If so then there's no reason to re-send it, but if it's not in my inbox 
then please re-send your patches as I must have lost them.  Assuming my list is 
complete, I think we've got a decent shot to get this all fixed up and in for 
4.20.  It looks like the major issues are the DMA mess (which Christoph might 
have mostly fixed already) and the timer mess (which Atish has a patch set out 
for) -- thanks for the help!

I've just tagged my last PR for the 4.19 merge window so I should be able to 
dig through my email now and sort out what's going on over the next few days.  
Here's the list on patch-related mails I still have to read:

        3 08/06 alistair.francis at wdc.com            [PATCH 2/4] riscv/smpboot: Fix mm_grab() typo
        4 08/06 alistair.francis at wdc.com            [PATCH 3/4] riscv/smpboot: Add missing include
        5 08/06 alistair.francis at wdc.com            [PATCH 4/4] irq-riscv-plic: Update function name
        6 08/06 alistair23 at gmail.com                Re: [PATCH 4/4] irq-riscv-plic: Update function name
        7 08/07 alankao at andestech.com               [PATCH v4 0/5] riscv: Add support to no-FPU systems
        8 08/07 alankao at andestech.com               [PATCH v4 1/5] Extract FPU context operations from entry.S
        9 08/07 alankao at andestech.com               [PATCH v4 2/5] Refactor FPU code in signal setup/return procedures
       10 08/07 alankao at andestech.com               [PATCH v4 3/5] Cleanup ISA string setting
       11 08/07 alankao at andestech.com               [PATCH v4 5/5] Auto-detect whether a FPU exists
       12 08/07 alankao at andestech.com               [PATCH v4 4/5] Allow to disable FPU support
       13 08/08 Christoph Hellwig                   Re: [PATCH v4 4/5] Allow to disable FPU support
       14 08/08 Christoph Hellwig                   Re: [PATCH v4 5/5] Auto-detect whether a FPU exists
       15 08/08 andrew.burgess at embecosm.com         Re: [PATCH 3/5] RISC-V: Add linux target support.
       18 08/09 alankao at andestech.com               [PATCH v6 5/5] Auto-detect whether a FPU exists
       19 08/09 Christoph Hellwig                   Re: [PATCH v6 5/5] Auto-detect whether a FPU exists
       20 08/09 linux at roeck-us.net                  Re: [PATCH v2 2/2] RISC-V: Don't use a global include guard for uapi/asm/syscalls.h
       21 08/09 linux at roeck-us.net                  [PATCH] riscv: Drop setup_initrd
       22 08/10 Christoph Hellwig                   Re: [PATCH] riscv: Drop setup_initrd
       26 08/14 Christoph Hellwig                   Re: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
       27 08/14 Christoph Hellwig                   Re: [PATCH v3 2/2] RISC-V: Don't use a global include guard for uapi/asm/syscalls.h
       29 08/15 atish.patra at wdc.com                 [RFC PATCH 0/5] RISC-V: Improve smp functionality & support cpu hotplug
       30 08/15 atish.patra at wdc.com                 [RFC PATCH 1/5] RISC-V: Add logical CPU indexing for RISC-V
       31 08/15 atish.patra at wdc.com                 [RFC PATCH 4/5] RISC-V: Move interrupt cause declarations to irq.h
       32 08/15 atish.patra at wdc.com                 [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       33 08/15 atish.patra at wdc.com                 [RFC PATCH 5/5] RISC-V: Support cpu hotplug.
       34 08/15 atish.patra at wdc.com                 [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
       36 08/15 anup at brainfault.org                 Re: [RFC PATCH 1/5] RISC-V: Add logical CPU indexing for RISC-V
       37 08/15 anup at brainfault.org                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       38 08/15 anup at brainfault.org                 Re: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
       39 08/15 atish.patra at wdc.com                 Re: [RFC PATCH 1/5] RISC-V: Add logical CPU indexing for RISC-V
       40 08/15 atish.patra at wdc.com                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       41 08/15 anup at brainfault.org                 Re: [RFC PATCH 1/5] RISC-V: Add logical CPU indexing for RISC-V
       42 08/15 atish.patra at wdc.com                 Re: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
       43 08/15 anup at brainfault.org                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       44 08/15 atish.patra at wdc.com                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       45 08/15 anup at brainfault.org                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       46 08/15 anup at brainfault.org                 Re: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
       47 08/16 lkp at intel.com                       Re: [PATCH v4 3/3] irqchip: add a SiFive PLIC driver
       50 08/16 aleksandar.markovic at rt-rk.com       [Qemu-devel] [PATCH v9 55/84] elf: Add EM_NANOMIPS value as a valid one for e_machine field
       52 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 0/6] Connect a PCIe host and graphics support to RISC-V
       53 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 2/6] hw/riscv/virt: Increase the number of interrupts
       54 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 4/6] hw/riscv/virt: Connect a VGA PCIe device
       56 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 5/6] hw/riscv/sifive_u: Connect the Xilinx PCIe
       59 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 1/6] hw/riscv/virtio: Set the soc device tree node as a simple-bus
       60 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 3/6] hw/riscv/virt: Connect the gpex PCIe
       61 08/16 alistair.francis at wdc.com            [Qemu-devel] [PATCH v3 6/6] hw/riscv/virt: Connect a VirtIO net PCIe device
       63 08/16 atish.patra at wdc.com                 Re: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of hartid
       83 08/16 helgaas at kernel.org                  Re: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for adding a new device
       84 08/16 Arnd Bergmann                       Re: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for adding a new device
      104 08/16 kraxel at redhat.com                   Re: [Qemu-devel] [PATCH v3 4/6] hw/riscv/virt: Connect a VGA PCIe device
      114 08/17 fweimer at redhat.com                  Re: [PATCH] Introduce ELF_INITFINI for all architectures
      123 08/17 aleksandar.markovic at rt-rk.com       [Qemu-devel] [PATCH v10 36/65] elf: Add EM_NANOMIPS value as a valid one for e_machine field
      129 08/17 lorenzo.pieralisi at arm.com           Re: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for adding a new device
      132 08/17 Arnd Bergmann                       Re: [PATCH 1/3] PCI: add a callback to struct pci_host_bridge for adding a new device
      136 08/17 rene at exactcode.com                  Re: [RESEND PATCH v2 0/2] Add support for ZSTD-compressed kernel
      137 08/17 ak at linux.intel.com                  Re: [RESEND PATCH v2 0/2] Add support for ZSTD-compressed kernel
      139 08/17 rene at exactcode.com                  Re: [RESEND PATCH v2 0/2] Add support for ZSTD-compressed kernel
      142 08/17 kilobyte at angband.pl                 Re: [RESEND PATCH v2 0/2] Add support for ZSTD-compressed kernel
      166 08/17 f4bug at amsat.org                     Re: [Qemu-devel] [PATCH v3 1/6] hw/riscv/virtio: Set the soc device tree node as a simple-bus
      168 08/17 atish.patra at wdc.com                 Re: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
      252 08/19 alex at ghiti.fr                       Re: [PATCH v6 00/11] hugetlb: Factorize hugetlb architecture primitives
      257 08/20 alan.hayward at arm.com                [PATCH 4/4] infcall-nested-structs: Test up to five fields
      261 08/20 lorenzo.pieralisi at arm.com           [PATCH] microblaze/PCI: Remove stale pcibios_align_resource() comment
