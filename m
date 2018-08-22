From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 22 Aug 2018 10:16:46 -0700 (PDT)
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <20180822060353.GA27106@infradead.org>
Message-ID: <mhng-fdb283aa-89d9-4de9-95f7-7886ed854df1@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 21 Aug 2018 23:03:53 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Aug 21, 2018 at 10:34:38PM +0530, Anup Patel wrote:
>> The cpu_operations is certainly required because SOC vendors will add
>> vendor-specific mechanism to selectively bringing-up CPUs/HARTs instead
>> of all CPUs entering Linux kernel simultaneously. In fact, we might also end-up
>> having CPU ON/OFF operations in SBI.
>
> Your forgot an essential part in your analysis:  Right now we only have
> one single way to deal with cpu on/offlining, and that is the dummy WFI
> kind.  Once other ways show up we can build proper infrastructure, but
> until then this is just a white elephant as we have no idea how these
> abstractions will look like.
>
> And my hope is that we'll just see new SBI calls, in which case we'll
> just need SBI and dummy version and can avoid all the indirect calls.

Yes, the goal here is to define one good interface via the SBI.  We've got a 
session at Plumbers this year and one of the blocks is to sit down and talk 
about this API, hopefully we can make some headway while there.
