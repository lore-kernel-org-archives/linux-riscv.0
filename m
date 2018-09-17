From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 17 Sep 2018 16:52:44 +0200 (CEST)
Subject: [RFC 3/3] RISC-V: Remove per cpu clocksource
In-Reply-To: <20180917143550.GC15588@infradead.org>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
 <20180917143550.GC15588@infradead.org>
Message-ID: <alpine.DEB.2.21.1809171638560.16580@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 17 Sep 2018, Christoph Hellwig wrote:

> I think only having one clocksource is indeed the right thing.
> 
> But that makes the whole TIMER_OF_DECLARE for each hart (cpu core for
> those not RISC-V savvy) even more questionable than it already is.
> 
> I think we should just initialize the clocksource directly as it is
> architectually guaranteed to exist.  Below is a completely untested
> (not even compiled) version of your patch that does what I think
> we should be doing here.  But I'd rather hear from more timer and/or
> DT savvy folks before proceeding.

If this really does not need configuration and all actual implementations
are not "allowed" to screw the timer up, then this surely can do without
DT.

Just for the record, this would be the first (architected) timer ever which
just works. I'm having a hard time to believe this, but I'd certainly
welcome it.

> -TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> +core_initcall(riscv_timer_init);

Are you sure that core_initcall is not too late?

Thanks,

	tglx
