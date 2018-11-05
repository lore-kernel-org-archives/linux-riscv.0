From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 5 Nov 2018 01:08:52 -0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
Message-ID: <20181105090852.GA14924@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 05, 2018 at 09:52:52AM +0100, Arnd Bergmann wrote:
> > I fundamentally disagree with this? and think it should be the contrary.
> >
> > 1. The kernel shall support no vendor specific instructions whatsoever,
> > period.
> 
> I think what was meant above is
> 
> 1. If a vendor extension requires kernel support, that support
> must be able to be built into a kernel image without breaking support
> for CPUs that do not have that extension, to allow building a single
> kernel image that works on all CPUs.

No.  This literally means no vendor extensions involving instructions
or CSRs in the kernel.  They are fine for userspace, or for the M-mode
code including impementation of the SBI, but not for the kernel.
