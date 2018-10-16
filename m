From: rjones@redhat.com (Richard W.M. Jones)
Date: Tue, 16 Oct 2018 14:30:29 +0100
Subject: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
In-Reply-To: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
References: <20181015211451.GC31130@redhat.com>
 <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
 <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
Message-ID: <20181016133029.GY27120@redhat.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 16, 2018 at 06:42:11PM +0530, Pintu Kumar wrote:
> On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones at redhat.com wrote:
> 
> > >
> > >> > virtio_blk: probe of virtio0 failed with error -22
> > >
> > > ... I saw this exact error when I was using the upstream kernel
> > > instead of the one which supported interrupt handling.  Interrupt
> > > handling for RISC-V was added upstream after 4.18 so wouldn't be
> > > included in upstream 4.18.0-rc6.
> >
> > Your best bet today is to run 4.19-rc8, which should be pretty stable.
> 
> Yes, I checked with mainline linux-kernel 4.19.
> Now I am able to boot successfully and login into qemu-riscv shell.
> Thank you so much :)
> 
> But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
> Which is the exact patch in mainline, that fixes this issue?

It'll be one of the interrupt or irqchip patches here:

  https://github.com/riscv/riscv-linux/commits/riscv-linux-4.18

You should follow Palmer's advice and use the kernel he recommends
rather than trying to cherry pick patches.

Rich.

> Because at times during the development, it will be difficult to
> simply upgrade the kernel version.
> So, I wanted to stick to 4.18 itself, however I can back port the
> patches from 4.19 to fix the issue.
> So, if you can point me to the exact patch, it will be of great help.
> 
> Thanks,
> Pintu

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html
