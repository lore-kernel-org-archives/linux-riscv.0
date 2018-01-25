From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 19:07:52 -0800
Subject: Make set_handle_irq and handle_arch_irq generic
Message-ID: <20180125030756.21787-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This is the second version of a patch set titled "Use arm64's scheme for
registering first-level IRQ handlers on RISC-V".  That patch set's cover letter
is still the best way to describe what's going on, so I'm just copying it here:

    This patch set has been sitting around for a while, but it got a bit lost
    in the shuffle.  In RISC-V land we currently couple do_IRQ (the C entry
    point for interrupt handling) to our first-level interrupt controller.
    While this isn't completely crazy (as the first-level interrupt controller
    is specified by the ISA), it is a bit awkward.
    
    This patch set decouples our trap handler from our first-level IRQ chip
    driver by copying what a handful of other architectures are doing.  This
    does add an additional load to the interrupt handling path, but there's a
    handful of performance problems in there that I've been meaning to look at
    so I don't mind adding another one for now.  The advantage is that our
    irqchip driver is decoupled from our arch port, at least at compile time.

I've build tested this on arm, arm64, and openrisc but haven't run on any of
those systems.  The goal was to make no functional changes, but the
__ro_after_init addition does actaully change behavior.

Changes since v1:

* I based this on arm instead of arm64, which means we guard the selection of
  these routines with CONFIG_MULTI_IRQ_HANDLER.
* The changes are in kernel/irq/handle.c and include/linux/irq.h instead of
  lib.
* I've converted the arm, arm64, and openrisc ports to use the generic versions
  of these routines.
