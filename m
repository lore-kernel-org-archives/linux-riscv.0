From: hch@lst.de (Christoph Hellwig)
Date: Fri, 27 Jul 2018 16:41:48 +0200
Subject: [PATCH 9/9] clocksource: new RISC-V SBI timer driver
In-Reply-To: <972dacda-75d6-83cd-45e0-c7526a4e02ba@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-10-hch@lst.de>
 <972dacda-75d6-83cd-45e0-c7526a4e02ba@wdc.com>
Message-ID: <20180727144148.GA29626@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jul 26, 2018 at 11:51:56AM -0700, Atish Patra wrote:
> Should we follow the same prefix for these functions?
> either timer_riscv* or riscv_timer* ?
>
> Apologies for overlooking this in my timer patch as well.

riscv_timer_* sounds saner to me, I can update that.

>> +	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
>> +
>
> The comment about the purpose of clearing the interrupt in the original 
> patch is removed here. If that's intentional, it's fine.
>
> I thought having that comment helps understanding the distinction between 
> clearing the timer interrupt in SBI call & here.

Yes, that was intentional.  But given that I don't even understand why
not using an ABI for architectural interrupt source enable/disable maybe
I'm confused and should revisit that decision.
