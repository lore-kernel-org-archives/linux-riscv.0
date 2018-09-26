From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 26 Sep 2018 08:38:53 -0700 (PDT)
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy3unGBSS9Xgozwt4so_RBOr1WSugiP-4J49q-GOub2mDQ@mail.gmail.com>
Message-ID: <mhng-0d0ee718-944f-4798-a6d8-e14f6ad51c37@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 25 Sep 2018 22:54:48 PDT (-0700), anup at brainfault.org wrote:
> On Mon, Sep 17, 2018 at 7:58 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Sep 17, 2018 at 7:44 PM Christoph Hellwig <hch@infradead.org> wrote:
>> >
>> > On Mon, Sep 10, 2018 at 10:08:58PM +0530, Anup Patel wrote:
>> > > > They could in theory IFF someone actually get the use case through
>> > > > the riscv privileged spec working group.
>> > >
>> > > Their is no point in having each and every possible local interrupts
>> > > defined by RISC-V spec because some of these will be CPU
>> > > implementation specific in which case these local interrupts will
>> > > be described in platform specific DT passed to Linux.
>> >
>> > Again, to legally have implementation specific local interrupt types
>> > you'll first need to convice the spec to change the status for those
>> > fields from reserved to implementation specific.
>>
>> I agree, this needs to be first clarified in RISC-V spec. May be this is
>> a good topic for discussion in any upcoming RISC-V meetup.
>>
>> Until then anyone can try these patches from riscv_intc_v2 branch of
>> https://github.com/avpatel/linux
>>
>
> I released that CLIC is going to be available for both M-mode and S-mode.
> Software can choose to use HLIC or CLIC based on it's own preference.
>
> If we are going to support both HLIC and CLIC in Linux kernel for per-CPU
> local interrupts then we should definitely have irqdomain and irqchip for
> per-CPU local interrupts. The selection between HLIC and CLIC will be
> based on which driver gets probed via DT.

Yes, and note that the CLIC is actually an extension of what is currently 
available.  Thus we could produce a single driver that supports both, with 
features selected based on a DT entry.

I'm not sure if a native CLIC driver buys us anything in Linux, though, as 
IIRC there aren't that many CLIC features that will be particularly useful in 
our space.
