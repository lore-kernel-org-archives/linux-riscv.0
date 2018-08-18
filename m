From: linux@roeck-us.net (Guenter Roeck)
Date: Sat, 18 Aug 2018 06:37:59 -0700
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <mhng-4afb9897-29ed-4eb4-88d7-6cfb09a0a65c@palmer-si-x1c4>
References: <mhng-4afb9897-29ed-4eb4-88d7-6cfb09a0a65c@palmer-si-x1c4>
Message-ID: <20180818133759.GA20049@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

On Fri, Aug 17, 2018 at 01:28:11PM -0700, Palmer Dabbelt wrote:
[ ... ]

> 
> This tag boots a Fedora root filesystem on QEMU's master branch for me,
> and before this morning's rebase (from 4.18-rc8 to 4.18) it booted on
> the HiFive Unleashed.
> 

Do you have vmlinux embedded in bbl ?

With separate bbl and vmlinux, and the following qemu command line 
(with qemu 3.0)

qemu-system-riscv64 -M virt -m 512M -no-reboot \
	-bios bbl -kernel vmlinux \
	-netdev user,id=net0 -device virtio-net-device,netdev=net0 \
	-device virtio-blk-device,drive=d0 \
	-drive file=rootfs.ext2,if=none,id=d0,format=raw \
	-append 'root=/dev/vda rw console=ttyS0,115200' \
	-nographic -monitor none

all I get is

rom: requested regions overlap (rom mrom.reset. free=0x000000000001cbe8, addr=0x0000000000001000)

However, the she system boots fine with the same qemu command line if I use qemu
built from https://github.com/riscv/riscv-qemu.git, branch qemu-for-upstream.

Excellent - once this series hits mainline, I'll add riscv to my
boot tests.

Thanks,
Guenter
