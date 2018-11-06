From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 5 Nov 2018 22:59:11 -0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <20181105090852.GA14924@infradead.org>
 <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
Message-ID: <20181106065911.GB13526@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 05, 2018 at 02:51:33PM +0100, Arnd Bergmann wrote:
> With the stricter policy you suggest, we'd loose the ability to support
> some extensions that might be common:
> 
> - an extension for user space that adds new registers that must be
>   saved and restored on a task switch, e.g. FPU, DSP or NPU
>   instructions. ARM supports several incompatible extensions like
>   that in one kernel, and this is really ugly, but I suspect RISC-V
>   will already need the same thing to support all combinations of
>   standard extensions, so from a practical perspective it's not
>   much different for custom extension, aside from the question
>   how far you want to go to discourage custom extensions by
>   requiring users to patch their kernels.

Palmer already explain that this is supposed to be handled by the
XS bit + SBI calls.  I'm personally not totally sold on the SBI call
and standard ways to save the state in the instruction set, similar
to modern x86 might be a better option, but that is something the
privileged spec working group will have to decide.

> - A crypto instruction for a cipher that is used in the kernel
>   for speeding up network or block data encryption.
>   This would typically be a standalone loadable module, so
>   the impact of allowing custom extensions in addition to
>   standard ones is minimal.

And that is a prime example for something that should never be vendor
specific.  If an instruction set extension is useful for something
entirely generic it should be standardized in a working group as an
extension.
