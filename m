From: rjones@redhat.com (Richard W.M. Jones)
Date: Mon, 15 Oct 2018 22:14:51 +0100
Subject: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
In-Reply-To: <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
References: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
 <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
Message-ID: <20181015211451.GC31130@redhat.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 16, 2018 at 09:26:20AM +1300, 'Michael Clark' via RISC-V SW Dev wrote:
> Dropping isa-dev, adding sw-dev
> 
> > On 16/10/2018, at 3:00 AM, Pintu Kumar <pintu.ping@gmail.com> wrote:
> > 
> > Hi,
> > I am trying to setup riscv-qemu booting on a new Ubuntu PC.
> > I dont want to use freedom-u-sdk, so I am preparing my own environment.
> > I could able to build the following:
> > - riscv-toolchain
> > - riscv-linux
> > - riscv-qemu
> > - riscv-pk
> > - busybear
> > 
> > After that, I am trying to boot riscv-qemu, using the following command:
> > # sudo qemu-system-riscv64 -nographic -machine virt -kernel
> > PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
> > file=busybear.bin,format=raw,id=hd0 -device
> > virtio-blk-device,drive=hd0
> 
> Note: sudo is not required. sudo is used in the busybear start-qemu.sh script as it uses bridged networking. The latest version of busybear points at linux-4.19-rc5 so the issue may have been fixed.
> 
> > But, I am getting kernel panic.
> > 
> > ---------
> > bbl loader
> > ....
> > Linux version 4.18.0-rc6...

It's a bit of a guess, but could this be the upstream kernel?  The
latest riscv-linux is 4.18.0 (not -rc6).

The reason I say it might be the upstream kernel is because ...

> > virtio_blk: probe of virtio0 failed with error -22

... I saw this exact error when I was using the upstream kernel
instead of the one which supported interrupt handling.  Interrupt
handling for RISC-V was added upstream after 4.18 so wouldn't be
included in upstream 4.18.0-rc6.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top
