From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 27 Feb 2018 15:38:24 -0800
Subject: Building Risc-V Linux kernel images for qemu without rebuilding
 bbl
In-Reply-To: <CADJ6UvN5iqcm5o2=swC5oryaJif-phqu8RBiQrbEFHn0hZ2ezA@mail.gmail.com>
References: <20180227225549.GA20986@roeck-us.net>
 <CADJ6UvN5iqcm5o2=swC5oryaJif-phqu8RBiQrbEFHn0hZ2ezA@mail.gmail.com>
Message-ID: <20180227233824.GA21354@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Feb 27, 2018 at 03:12:36PM -0800, Stef O'Rear wrote:
> On Tue, Feb 27, 2018 at 2:55 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > Hi folks,
> >
> > I have been trying to set up Risc-V qemu test builds on kerneltests.org.
> > Major hold-up at this point is the need to continuously rebuild bbl images
> > with embedded kernel images. Due to various reasons, this is all but
> > impossible with my auto-build system.
> >
> > Is there a means to load bbl and vmlinux images separately into qemu,
> > or maybe a tool to attach the kernel to a pre-built bbl image ?
> > Of course, it would be even better if it was possible to just specify
> > "-kernel vmlinux" or something similar on the kernel command line.
> 
> This isn't currently possible, but several people have expressed an
> interest in it.
> 
> Recent discussion:
> 
> https://github.com/sifive/freedom-u-sdk/issues/33#issuecomment-368260995
> 
> https://github.com/riscv/riscv-qemu/pull/109#issuecomment-367885879
> 
Excellent. I am looking forward for it to be available in some form. 

Something to consider in this context might be to ship bbl with qemu
and hide it behind the qemu command line. This is done for various other
architectures, so I would assume it should be possible for Risc-V as well.
This way the user could specify "-kernel vmlinux" or similar without
having to bother about the bootloader in the first place.

Thanks,
Guenter
