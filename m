From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 9 Aug 2018 21:53:27 -0700
Subject: [PATCH v2 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <mhng-ef018453-7a99-48b3-bda5-5408383d9566@palmer-si-x1c4>
References: <mhng-ef018453-7a99-48b3-bda5-5408383d9566@palmer-si-x1c4>
Message-ID: <98730af5-701d-f0be-410c-29e74bb36ec3@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 08/09/2018 08:59 PM, Palmer Dabbelt wrote:
[ ... ]
>>> Also, what is your methodology?? I follow
>>>
>>> ??? https://wiki.qemu.org/Documentation/Platforms/RISCV

Here are my qemu command lines:

qemu-system-riscv64 -M virt -m 512M -no-reboot -bios bbl \
	-kernel vmlinux -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
	-initrd rootfs.cpio \
	-append 'rdinit=/sbin/init earlycon console=ttyS0,115200' \
	-nographic -monitor none

qemu-system-riscv64 -M virt -m 512M -no-reboot -bios bbl \
	-kernel vmlinux -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
	-device virtio-blk-device,drive=d0 \
	-drive file=rootfs.ext2,if=none,id=d0,format=raw \
	-append 'root=/dev/vda rw earlycon console=ttyS0,115200' \
	-nographic -monitor none

Root file systems and the bbl binary are published at
	https://github.com/groeck/linux-build-test/tree/master/rootfs/riscv64

Hint: If you specify "noreboot" as additional command line option, you'll end up in a shell.

Qemu version:
	https://github.com/riscv/riscv-qemu.git branch 'v3.0.0-local-riscv'

Guenter
