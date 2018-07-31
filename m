From: hch@lst.de (Christoph Hellwig)
Date: Tue, 31 Jul 2018 18:37:41 +0200
Subject: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
In-Reply-To: <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
Message-ID: <20180731163741.GA2359@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jul 27, 2018 at 05:04:52PM -0700, Atish Patra wrote:
>> +#define MAX_DEVICES			1024
>> +#define MAX_CONTEXTS			15872
>> +
>
> Is there any way we can preserve some of the comments in the original patch 
> about memory-mapped control registers or at least a reference where to find 
> the register offset calculations?

The comments really do not help to describe a why or how.  I'd love to
add a reference to a spec, but I could not find anything that looks
like an authoritative spec for the SiFive PLIC layout.

>> +	u32 __iomem *reg = plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
>
> shouldn't it be
> u32 __iomem *reg = plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART + 
> (hwirq / 32) * 4;

Yes, it should.  Fixed.

>> +		if (unlikely(irq <= 0)) {
>> +			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
>> +					hwirq);
>
> Ratlimiting the warning message here didn't help as ack_bad_irq() still 
> print message still flooded the console without any useful info.

I've dropped the somewhat pointless ack_bad_irq call, thanks.
