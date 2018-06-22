From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 21 Jun 2018 22:38:05 -0700
Subject: Risc-V, qemu, and initrd
In-Reply-To: <20180621220859.GA9268@roeck-us.net>
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
 <mvmpo0kjjog.fsf@suse.de> <20180621144821.GA15280@roeck-us.net>
 <20180621145217.GA12445@infradead.org>
 <20180621173314.GA7251@roeck-us.net>
 <20180621175509.GB23315@infradead.org>
 <20180621220859.GA9268@roeck-us.net>
Message-ID: <20180622053805.GA19304@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 03:08:59PM -0700, Guenter Roeck wrote:
> On Thu, Jun 21, 2018 at 10:55:09AM -0700, Christoph Hellwig wrote:
> > On Thu, Jun 21, 2018 at 10:33:14AM -0700, Guenter Roeck wrote:
> > > Are you able to boot anything but -M virt ? If yes, can you send me the
> > > necessary command line parameters ?
> > 
> > Just -m virt.  For the SiFive board emulations a lot more driver
> > support is required.
> 
> Ok. At least it is a start. Have you managed to connect a hard drive ?
> I was only able to get it to work with initrd.

Yes, I use virtio-blk.  Here is my qemu command line:

/opt/qemu-riscv/bin/qemu-system-riscv64 \
        -nographic \
        -machine virt \
        -kernel bbl \
        -append "root=/dev/vda ro console=ttyS0" \
        -drive file=../../busybear-linux/busybear.bin,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -netdev user,id=net0, \
        -device virtio-net-device,netdev=net0
