From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 06 Sep 2018 02:45:26 -0700 (PDT)
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <20180904185001.GA25119@infradead.org>
Message-ID: <mhng-ba039ed5-dcff-41d3-b237-0708b5e117b2@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 04 Sep 2018 11:50:02 PDT (-0700), Christoph Hellwig wrote:
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

I agree.  Hiding this sort of stuff is the whole point of the SBI.

Anup: do you have some concrete reason for trying to avoid the SBI?  If it's 
just to add non-standard interrupt controllers then I don't think that's a 
sufficient reason, as you can just add support for whatever the non-standard 
interrupt mechanism is in the SBI implementation -- that's what we're doing 
with BBL's CLINT driver, though there's not a whole lot of wackiness there so 
at least the SBI implementation is pretty small.

> So NAK for this patch.

Certainly without a compelling reason, and even then I'd only want to take some 
standard interrupt controller -- for example, the CLIC (or whatever the result 
of the fast interrupts task group is called) could be a viable option.  Even 
with a standard interrupt controller, we'd need a really compelling reason to 
do so.
