From: anup@brainfault.org (Anup Patel)
Date: Mon, 10 Sep 2018 22:08:58 +0530
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180910163543.GA13052@infradead.org>
References: <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <20180910161328.GA13171@infradead.org>
 <CAAhSdy2Y-XTZ12i5aV+SzraMZP1YQBhAArpER-YssPcBJNOPOA@mail.gmail.com>
 <20180910163543.GA13052@infradead.org>
Message-ID: <CAAhSdy2PSLjrtmSbkJ4w-v-zWm2hjii3XL6HE5Pe7u3wz4BmZA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 10:05 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Sep 10, 2018 at 10:02:09PM +0530, Anup Patel wrote:
>> You are thinking very much in-context of SiFive CPUs only.
>
> No.  I think in terms of the RISC-V spec.  I could care less about
> SiFive to be honest.
>
>> Lot of SOC vendors are trying to come-up with their own CPUs
>> and RISC-V spec does not restrict the use of local interrupts.
>
> Yes, it does.
>
>> The mie/mip/sie/sip/uie/uip are all machine word size so on
>> riscv64 we can theoretically have maximum 64 local interrupts.
>
> They could in theory IFF someone actually get the use case through
> the riscv privileged spec working group.

Their is no point in having each and every possible local interrupts
defined by RISC-V spec because some of these will be CPU
implementation specific in which case these local interrupts will
be described in platform specific DT passed to Linux.

Regards,
Anup
