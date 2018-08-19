From: merker@debian.org (Karsten Merker)
Date: Sun, 19 Aug 2018 09:26:14 +0200
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <20180818133759.GA20049@roeck-us.net>
References: <mhng-4afb9897-29ed-4eb4-88d7-6cfb09a0a65c@palmer-si-x1c4>
 <20180818133759.GA20049@roeck-us.net>
Message-ID: <20180819072614.etl7izdicabsffn3@excalibur.cnev.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Aug 18, 2018 at 06:37:59AM -0700, Guenter Roeck wrote:
> On Fri, Aug 17, 2018 at 01:28:11PM -0700, Palmer Dabbelt wrote:
> [ ... ]
> > 
> > This tag boots a Fedora root filesystem on QEMU's master branch for me,
> > and before this morning's rebase (from 4.18-rc8 to 4.18) it booted on
> > the HiFive Unleashed.
> 
> Do you have vmlinux embedded in bbl ?
> 
> With separate bbl and vmlinux, and the following qemu command line 
> (with qemu 3.0)
> 
> qemu-system-riscv64 -M virt -m 512M -no-reboot \
> 	-bios bbl -kernel vmlinux \
> 	-netdev user,id=net0 -device virtio-net-device,netdev=net0 \
> 	-device virtio-blk-device,drive=d0 \
> 	-drive file=rootfs.ext2,if=none,id=d0,format=raw \
> 	-append 'root=/dev/vda rw console=ttyS0,115200' \
> 	-nographic -monitor none
> 
> all I get is
> 
> rom: requested regions overlap (rom mrom.reset. free=0x000000000001cbe8, addr=0x0000000000001000)
> 
> However, the she system boots fine with the same qemu command line if I use qemu
> built from https://github.com/riscv/riscv-qemu.git, branch qemu-for-upstream.

Hello,

AFAICS the qemu patch that adds support for handling separate bbl
and kernel images, i.e.

  https://github.com/riscv/riscv-qemu/commit/6338416ecf4717197c635b5abf9c17465d2d0da0

hasn't yet made it into upstream qemu, so using the "-bios"
option for bbl generally doesn't work with (upstream) qemu 3.0.

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten f?r Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
