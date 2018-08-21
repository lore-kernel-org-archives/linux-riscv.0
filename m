From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 21 Aug 2018 13:57:54 -0700 (PDT)
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <20180821194550.wrh3q2fkr6wmrovd@excalibur.cnev.de>
Message-ID: <mhng-d4882478-2772-4ef9-b79e-9b447a32cb8c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 21 Aug 2018 12:45:50 PDT (-0700), merker at debian.org wrote:
> On Tue, Aug 21, 2018 at 11:31:48AM -0700, Palmer Dabbelt wrote:
>> On Sat, 18 Aug 2018 06:37:59 PDT (-0700), linux at roeck-us.net wrote:
> [...]
>> > Do you have vmlinux embedded in bbl ?
>> >
>> > With separate bbl and vmlinux, and the following qemu command line
>> > (with qemu 3.0)
>> >
>> > qemu-system-riscv64 -M virt -m 512M -no-reboot \
>> > 	-bios bbl -kernel vmlinux \
>> > 	-netdev user,id=net0 -device virtio-net-device,netdev=net0 \
>> > 	-device virtio-blk-device,drive=d0 \
>> > 	-drive file=rootfs.ext2,if=none,id=d0,format=raw \
>> > 	-append 'root=/dev/vda rw console=ttyS0,115200' \
>> > 	-nographic -monitor none
>> >
>> > all I get is
>> >
>> > rom: requested regions overlap (rom mrom.reset. free=0x000000000001cbe8, addr=0x0000000000001000)
>> >
>> > However, the she system boots fine with the same qemu command line if I use qemu
>> > built from https://github.com/riscv/riscv-qemu.git, branch qemu-for-upstream.
>>
>> Yes, I have a vmlinux built into my BBL.  I didn't actually look closely at
>> the command line I was copying and see that vmlinux in there, my guess would
>> be that it's getting ignored.  I don't remember if upstream BBL actually
>> works with the split bbl/vmlinux setup, I've kind of stopped paying
>> attention to BBL as I'm just waiting for someone to tell me instructions as
>> to how to use a real bootloader... :)
>
> JFTR, upstream bbl supports the split bbl/vmlinux setup, it's just
> upstream qemu that lacks the support for now (qemu-riscv has it).

Thanks!
