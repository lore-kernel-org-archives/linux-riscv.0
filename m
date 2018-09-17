From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 08:01:49 -0700
Subject: [RFC 3/3] RISC-V: Remove per cpu clocksource
In-Reply-To: <alpine.DEB.2.21.1809171638560.16580@nanos.tec.linutronix.de>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
 <20180917143550.GC15588@infradead.org>
 <alpine.DEB.2.21.1809171638560.16580@nanos.tec.linutronix.de>
Message-ID: <20180917150149.GA25348@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 17, 2018 at 04:52:44PM +0200, Thomas Gleixner wrote:
> If this really does not need configuration and all actual implementations
> are not "allowed" to screw the timer up, then this surely can do without
> DT.

That would be the plan.

> 
> Just for the record, this would be the first (architected) timer ever which
> just works. I'm having a hard time to believe this, but I'd certainly
> welcome it.

And that would be the contact with reality.  Note that the current
scheme which just matches for the riscv hart (aka cpu core) nodes
would not exactly help either.

> 
> > -TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> > +core_initcall(riscv_timer_init);
> 
> Are you sure that core_initcall is not too late?

No, I'm not at all.  This is just intended as a quick throw-away draft.
