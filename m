From: anup@brainfault.org (Anup Patel)
Date: Mon, 10 Sep 2018 22:05:42 +0530
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180910161143.GA1053@infradead.org>
References: <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <alpine.DEB.2.21.1809101805110.1419@nanos.tec.linutronix.de>
 <20180910161143.GA1053@infradead.org>
Message-ID: <CAAhSdy0kgsy0QFDQGYeVy6vxu8v7UwRGbdJC9Hhz+36TNYjyGA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 9:41 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Sep 10, 2018 at 06:07:12PM +0200, Thomas Gleixner wrote:
>> > Considering above, it is better to have a distinct irqchip and
>> > irq_domain for all local interrupts (just like this patch).
>>
>> If that's the future usage
>
> It's not, at least there has been no proposal for that so far, and I
> don't really think it is how the architecture was intended.
>
>> and that's what my impression was, under which I
>> changed my mind, yes, then having a domain model is certainly of advantage
>> especially when those things end up being different per SoC.
>
> And even if we went down the way of using the other bits it would
> be architectureal in the RISC-V spec - these are not available for
> vendor specific uses.

I am quite sure RISC-V spec does not restrict the use of other
local interrupts. Different CPU implementations can have their
own local interrupts.

Regards,
Anup
