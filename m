From: anup@brainfault.org (Anup Patel)
Date: Mon, 17 Sep 2018 21:24:31 +0530
Subject: [RFC 3/3] RISC-V: Remove per cpu clocksource
In-Reply-To: <alpine.DEB.2.21.1809171703220.16580@nanos.tec.linutronix.de>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
 <20180917143550.GC15588@infradead.org>
 <alpine.DEB.2.21.1809171638560.16580@nanos.tec.linutronix.de>
 <20180917150149.GA25348@infradead.org>
 <alpine.DEB.2.21.1809171703220.16580@nanos.tec.linutronix.de>
Message-ID: <CAAhSdy3NSNn=YicWdnyos87A7gDq0O1BMvQQ0FVmCtv+rBo=vg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 17, 2018 at 8:35 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, 17 Sep 2018, Christoph Hellwig wrote:
> > > Just for the record, this would be the first (architected) timer ever which
> > > just works. I'm having a hard time to believe this, but I'd certainly
> > > welcome it.
> >
> > And that would be the contact with reality.
>
> I've dealt with the reality of timers for a long time ....

I think the problem is we don't have separate DT node
for RISC-V timer. Instead, we have been probing timer
for each CPU DT node.

Ideally, we should have one DT node for RISC-V timer
and the DT should should also describe the local interrupts
to be used for RISC-V timer.

Regards,
Anup
