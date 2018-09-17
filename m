From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 17 Sep 2018 11:32:31 -0700
Subject: [RFC 3/3] RISC-V: Remove per cpu clocksource
In-Reply-To: <20180917150149.GA25348@infradead.org>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
 <20180917143550.GC15588@infradead.org>
 <alpine.DEB.2.21.1809171638560.16580@nanos.tec.linutronix.de>
 <20180917150149.GA25348@infradead.org>
Message-ID: <c1773efc-d087-6dc2-0ba4-a71c8ae991be@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/17/18 8:01 AM, Christoph Hellwig wrote:
> On Mon, Sep 17, 2018 at 04:52:44PM +0200, Thomas Gleixner wrote:
>> If this really does not need configuration and all actual implementations
>> are not "allowed" to screw the timer up, then this surely can do without
>> DT.
> 
> That would be the plan.
> 
>>
>> Just for the record, this would be the first (architected) timer ever which
>> just works. I'm having a hard time to believe this, but I'd certainly
>> welcome it.
> 
> And that would be the contact with reality.  Note that the current
> scheme which just matches for the riscv hart (aka cpu core) nodes
> would not exactly help either.
> 

I thought we will have a dedicated timer node (like all other arch) 
sooner or later and we will just change TIMER_OF to match that node 
instead of riscv hart.

In this way, we will not do something entirely different from any other 
architecture.

Regards,
Atish
>>
>>> -TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
>>> +core_initcall(riscv_timer_init);
>>
>> Are you sure that core_initcall is not too late?
> 
> No, I'm not at all.  This is just intended as a quick throw-away draft.
> 
