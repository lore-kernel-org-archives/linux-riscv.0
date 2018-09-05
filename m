From: anup@brainfault.org (Anup Patel)
Date: Wed, 5 Sep 2018 10:22:27 +0530
Subject: [RFC PATCH 3/5] RISC-V: Select useful GENERIC_IRQ kconfig options
In-Reply-To: <20180904185629.GC25119@infradead.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-4-anup@brainfault.org>
 <20180904185629.GC25119@infradead.org>
Message-ID: <CAAhSdy3qUkDmV5deoy9x3sqdv8xTq37od6SzgF0hmN1JPThGgw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 12:26 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Sep 04, 2018 at 06:15:12PM +0530, Anup Patel wrote:
>> This patch selects following GENERIC_IRQ kconfig options:
>> GENERIC_IRQ_MULTI_HANDLER
>
> This is already selected by arch/riscv/Kconfig.
>
>> GENERIC_IRQ_PROBE
>
> This is something only used by ISA drivers.  Why would we want that
> on RISC-V?

Yes, thanks for pointing. GENERIC_IRQ_PROBE is not required at
this time. I will drop this selection. May be will re-consider later.

>
>> GENERIC_IRQ_SHOW_LEVEL
>
> We don't really have any special level triggerd irq handling in
> RISC-V.  That being said this is trivial and I don't see why it
> even is a Kconfig option.  Please have a discussion with Thomas
> and Marc on why we have this option instead of a default.

Most of MMIO device interrupts are level-interrupts. In fact, all
HW interrupt lines coming to PLIC will be level-interrupts. It's
just that PLIC does not implement state machine to sample
Level-IRQs and Edge-IRQs differently. Even the interrupt-controller
virtualization in hypervisors deal with Level and Edge interrupts
differently.

I am sure we will see both Level and Edge triggered interrupts
in RISC-V system. The MMIO device interrupts will be mostly
Level triggered and PCI MSIs will be mapped as Edge triggered
by MSI controller.

We should definitely select GENERIC_IRQ_SHOW_LEVEL
so that nature of IRQ interrupt line is evident in /proc/interrupts.

>
>> HANDLE_DOMAIN_IRQ
>
> We aren't using handle_domain_irq anywhere in RISC-V, no need to
> build this.

The new RISC-V local interrupt controller driver introduced by
this patchset uses handle_domain_irq().

The main advantage of handle_domain_irq() is that it helps reduce
few lines of code which is otherwise common across interrupt-controller
drivers (mostly code related to irq_enter(), irq_exit(), and set_irq_regs()).

Regards,
Anup
