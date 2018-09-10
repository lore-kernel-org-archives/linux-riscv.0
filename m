From: anup@brainfault.org (Anup Patel)
Date: Mon, 10 Sep 2018 22:02:09 +0530
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180910161328.GA13171@infradead.org>
References: <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <20180910161328.GA13171@infradead.org>
Message-ID: <CAAhSdy2Y-XTZ12i5aV+SzraMZP1YQBhAArpER-YssPcBJNOPOA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 9:43 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Sep 10, 2018 at 07:59:15PM +0530, Anup Patel wrote:
>> > Yes.  external is chained and IPI is still handled explicitly.
>>
>> On riscv64, there are 64 local interrupts (i.e. per-CPU interrupts).
>
> There aren't.  There are 9 right now, which are your three below:

You are thinking very much in-context of SiFive CPUs only.

Lot of SOC vendors are trying to come-up with their own CPUs
and RISC-V spec does not restrict the use of local interrupts.

The mie/mip/sie/sip/uie/uip are all machine word size so on
riscv64 we can theoretically have maximum 64 local interrupts.

>
>> Three of these local interrupts have clearly defined use:
>> 1. Software interrupt (inter-processor interrupt)
>> 2. External interrupt (interrupt from PLIC)
>> 3. Timer interrupt (interrupt from per-CPU timer)
>
> multiplied by 3 for machine, supervisor, user.

Yes, 3 per-CPU interrupts for each CPU mode which
makes it 9 per-CPU interrupts.

In fact, initial intention was to have these separate for
each mode but there is not restriction as explained by
Andrew Waterman on ISA-DEV:

"One key point is that UIRQ, SIRQ, and MIRQ are just names; the letters
U, S, and M don't actually connote anything about privilege.  UIRQ,
SIRQ, and MIRQ are three different interrupt lines on equal footing.
The prefix letters merely reflect the intended use case.  So only one
version of this description is necessary.  I'll try to rewrite a
version with a few corrections."

>
>> Other local interrupts are available for future use.
>
> The others aren't even defined as other interrupts, but just reserved
> fields.  And only one bit per privilege level would even fit into the
> encoding scheme used right now.

That's how it is implemented on SiFive CPUs.

This does not mean we will not have more per-CPU interrupts
in-future.

Regards,
Anup
