From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 5 Nov 2018 14:51:33 +0100
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181105090852.GA14924@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <20181105090852.GA14924@infradead.org>
Message-ID: <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/5/18, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Nov 05, 2018 at 09:52:52AM +0100, Arnd Bergmann wrote:
>> > I fundamentally disagree with this? and think it should be the
>> > contrary.
>> >
>> > 1. The kernel shall support no vendor specific instructions whatsoever,
>> > period.
>>
>> I think what was meant above is
>>
>> 1. If a vendor extension requires kernel support, that support
>> must be able to be built into a kernel image without breaking support
>> for CPUs that do not have that extension, to allow building a single
>> kernel image that works on all CPUs.
>
> No.  This literally means no vendor extensions involving instructions
> or CSRs in the kernel.  They are fine for userspace, or for the M-mode
> code including impementation of the SBI, but not for the kernel.

I was trying to interpret what Vincent wrote, not what you wrote,
you were pretty clear already ;-)

With the stricter policy you suggest, we'd loose the ability to support
some extensions that might be common:

- an extension for user space that adds new registers that must be
  saved and restored on a task switch, e.g. FPU, DSP or NPU
  instructions. ARM supports several incompatible extensions like
  that in one kernel, and this is really ugly, but I suspect RISC-V
  will already need the same thing to support all combinations of
  standard extensions, so from a practical perspective it's not
  much different for custom extension, aside from the question
  how far you want to go to discourage custom extensions by
  requiring users to patch their kernels.

- A crypto instruction for a cipher that is used in the kernel
  for speeding up network or block data encryption.
  This would typically be a standalone loadable module, so
  the impact of allowing custom extensions in addition to
  standard ones is minimal.

       Arnd
