From: pintu.ping@gmail.com (Pintu Agarwal)
Date: Wed, 17 Oct 2018 17:33:36 +0530
Subject: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
In-Reply-To: <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
Message-ID: <CAOuPNLifWA0rihQp0PjhhzDcKy9BHYDr966tEqejWaMrLu2K4g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 17, 2018 at 12:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 16 Oct 2018 06:12:11 PDT (-0700), pintu.ping at gmail.com wrote:
> > On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones at redhat.com wrote:
> >
> >> >
> >> >> > virtio_blk: probe of virtio0 failed with error -22
> >> >
> >> > ... I saw this exact error when I was using the upstream kernel
> >> > instead of the one which supported interrupt handling.  Interrupt
> >> > handling for RISC-V was added upstream after 4.18 so wouldn't be
> >> > included in upstream 4.18.0-rc6.
> >>
> >> Your best bet today is to run 4.19-rc8, which should be pretty stable.
> >
> > Yes, I checked with mainline linux-kernel 4.19.
> > Now I am able to boot successfully and login into qemu-riscv shell.
> > Thank you so much :)
> >
> > But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
> > Which is the exact patch in mainline, that fixes this issue?
> > Because at times during the development, it will be difficult to
> > simply upgrade the kernel version.
>
> Yes, that's expected.  RISC-V Linux is still pretty bleeding edge, you just
> happened to catch it between when master started working and when there was a
> proper release that contained your patches.  Since master is very calm right
> now (there was an rc8 before release, but it's very close to a release) it's OK
> to use, but you best bet going forward is to use the release tarballs just like
> normal.
>
> > So, I wanted to stick to 4.18 itself, however I can back port the
> > patches from 4.19 to fix the issue.
>
> We have a backports branch, it's called "riscv-linux-4.18".  I'll continue to
> produce a backports branch for the latest upstream release until things get
> pretty stable.
>
> > So, if you can point me to the exact patch, it will be of great help.
>
> Here's the PLIC driver, but it depends on a bunch of other patches.  Like I
> said, that's what the backports branch is for :)
>
> $ git log drivers/irqchip/irq-sifive-plic.c | cat
> commit 8237f8bc4f6eb7e5ce2a19276079cfd3a7c6314a
> gpg: Signature made Mon 13 Aug 2018 08:31:32 AM PDT
> gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
> gpg:                issuer "palmer at dabbelt.com"
> gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
> gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Jul 26 16:27:00 2018 +0200
>
>     irqchip: add a SiFive PLIC driver
>
>     Add a driver for the SiFive implementation of the RISC-V Platform Level
>     Interrupt Controller (PLIC).  The PLIC connects global interrupt sources
>     to the local interrupt controller on each hart.
>
>     This driver is based on the driver in the RISC-V tree from Palmer Dabbelt,
>     but has been almost entirely rewritten since, and includes many fixes
>     from Atish Patra.
>

Ok thank you so much for the detailed explanation.
I roughly understood the changes.
I will continue to use 4.19 mainline kernel.
Yes I think it's petty stable :)
Hopefully, I will try to contribute few items for riscv linux kernel.

Thanks

>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Acked-by: Thomas Gleixner <tglx@linutronix.de>
>     Reviewed-by: Atish Patra <atish.patra@wdc.com>
>     [Binding update by Palmer]
>     Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> >
> > Thanks,
> > Pintu
