From: anup@brainfault.org (Anup Patel)
Date: Wed, 5 Sep 2018 10:06:24 +0530
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <20180904185001.GA25119@infradead.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-2-anup@brainfault.org>
 <20180904185001.GA25119@infradead.org>
Message-ID: <CAAhSdy1iPZ_Y4opsXBE0o09uzgSxV8A9YKHawFB+knXH7FFLsQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 12:20 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Sep 04, 2018 at 06:15:10PM +0530, Anup Patel wrote:
>> The mechanism to trigger IPI is generally part of interrupt-controller
>> driver for various architectures. On RISC-V, we have an option to trigger
>> IPI using SBI or SOC vendor can implement RISC-V CPU where IPI will be
>> triggered using SOC interrupt-controller (e.g. custom PLIC).
>
> Which is exactly what we want to avoid, and should not make it easy.
>
> The last thing we need is non-standard whacky IPI mechanisms, and
> that is why we habe SBI calls for it.  I think we should simply
> stat that if an RISC-V cpu design bypasse the SBI for no good reason
> we'll simply not support it.

It's outrageous to call IPI mechanisms using interrupt-controller as "wacky".

Lot of architectures have well thought-out interrupt-controller designs with
IPI support.

In fact having IPIs through interrupt-controller drivers is much faster because
SBI call will have it's own overhead and M-mode code with eventually write
to some platform-specific/interrupt-controller register. The SBI call only makes
sense for very simple interrupt-controller (such as PLIC) which do not provide
IPI mechanism. It totally seems like SBI call for triggering IPIs was added as
workaround to address limitations of current PLIC.

RISC-V systems require a more mature and feature complete interrupt-controllers
which supports IPIs, PCI MSI, and Virtualization Extensions.

I am sure will see a much better interrupt controller (PLIC++ or something else)
soon.

>
> So NAK for this patch.

I think you jumped the gun to quickly here.

This patch does two things:
1. Adds a pluggable IPI triggering mechanism
2. Make IPI handling mechanism more generic so that we can
call IPI handler from interrupt-controller driver.

Your primary objection seems to be for point1 above. I will drop that
part only keep changes related to point2 above.

Regards,
Anup
