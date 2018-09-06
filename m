From: anup@brainfault.org (Anup Patel)
Date: Thu, 6 Sep 2018 16:15:14 +0530
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <mhng-ba039ed5-dcff-41d3-b237-0708b5e117b2@palmer-si-x1c4>
References: <20180904185001.GA25119@infradead.org>
 <mhng-ba039ed5-dcff-41d3-b237-0708b5e117b2@palmer-si-x1c4>
Message-ID: <CAAhSdy3mOdxR9JpZyC9fCx5rphUBDxn2kbRpgtZp4h0_jYCxMA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 6, 2018 at 3:15 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Tue, 04 Sep 2018 11:50:02 PDT (-0700), Christoph Hellwig wrote:
>>
>> On Tue, Sep 04, 2018 at 06:15:10PM +0530, Anup Patel wrote:
>>>
>>> The mechanism to trigger IPI is generally part of interrupt-controller
>>> driver for various architectures. On RISC-V, we have an option to trigger
>>> IPI using SBI or SOC vendor can implement RISC-V CPU where IPI will be
>>> triggered using SOC interrupt-controller (e.g. custom PLIC).
>>
>>
>> Which is exactly what we want to avoid, and should not make it easy.
>>
>> The last thing we need is non-standard whacky IPI mechanisms, and
>> that is why we habe SBI calls for it.  I think we should simply
>> stat that if an RISC-V cpu design bypasse the SBI for no good reason
>> we'll simply not support it.
>
>
> I agree.  Hiding this sort of stuff is the whole point of the SBI.
>
> Anup: do you have some concrete reason for trying to avoid the SBI?  If it's
> just to add non-standard interrupt controllers then I don't think that's a
> sufficient reason, as you can just add support for whatever the non-standard
> interrupt mechanism is in the SBI implementation -- that's what we're doing
> with BBL's CLINT driver, though there's not a whole lot of wackiness there
> so at least the SBI implementation is pretty small.
>
>> So NAK for this patch.
>
>
> Certainly without a compelling reason, and even then I'd only want to take
> some standard interrupt controller -- for example, the CLIC (or whatever the
> result of the fast interrupts task group is called) could be a viable
> option.  Even with a standard interrupt controller, we'd need a really
> compelling reason to do so.

This patch is doing two things:
1. Allow IRQCHIP driver to provide IPI trigger mechanism
2. Have more generic IPI handler in arch/riscv so that IRQCHIP driver
can call it

The main intention behind point1 was to allow interrupt-controller
specific IPI triggering mechanism. I am totally fine in dropping changes
related to point1. May be we can revisit this if we find compelling use-case.

I will revise this patch to have changes related to point2 only. These
changes are required for the new RISCV local interrupt controller
driver introduced by this patchset.

Regards,
Anup
