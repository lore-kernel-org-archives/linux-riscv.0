From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 21 Aug 2018 11:31:48 -0700 (PDT)
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <20180818133759.GA20049@roeck-us.net>
Message-ID: <mhng-d01c95f5-d4bb-49c5-addb-78b09911f6cd@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, 18 Aug 2018 06:37:59 PDT (-0700), linux at roeck-us.net wrote:
> Hi Palmer,
>
> On Fri, Aug 17, 2018 at 01:28:11PM -0700, Palmer Dabbelt wrote:
> [ ... ]
>
>>
>> This tag boots a Fedora root filesystem on QEMU's master branch for me,
>> and before this morning's rebase (from 4.18-rc8 to 4.18) it booted on
>> the HiFive Unleashed.
>>
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

Yes, I have a vmlinux built into my BBL.  I didn't actually look closely at the 
command line I was copying and see that vmlinux in there, my guess would be 
that it's getting ignored.  I don't remember if upstream BBL actually works 
with the split bbl/vmlinux setup, I've kind of stopped paying attention to BBL 
as I'm just waiting for someone to tell me instructions as to how to use a real 
bootloader... :)

I'm building master from QEMU as of a few weeks ago

    * f7502360397d - (HEAD -> master, tag: v3.0.0-rc3, origin/master, origin/HEAD) Update version for v3.0.0-rc3 release (3 weeks ago) <Peter Maydell>
    *   b89041647422 - Merge remote-tracking branch 'remotes/armbru/tags/pull-monitor-2018-07-31' into staging (3 weeks ago) <Peter Maydell>
    |\
    | * 9a1054061c62 - monitor: temporary fix for dead-lock on event recursion (3 weeks ago) <Marc-Andr? Lureau>
    |/
    *   42e76456cf68 - Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-3.0-pull-request' into staging (3 weeks ago) <Peter Maydell>
    |\
    | * 5d9f3ea08172 - linux-user: ppc64: don't use volatile register during safe_syscall (3 weeks ago) <Shivaprasad G Bhat>
    | * 28cbb997d66e - tests: add check_invalid_maps to test-mmap (3 weeks ago) <Alex Benn?e>
    | * 38138fab9358 - linux-user/mmap.c: handle invalid len maps correctly (3 weeks ago) <Alex Benn?e>
    * |   45a505d0a4b3 - Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (3 weeks ago) <Peter Maydell>

in general once we get a port upstream I jump over to using master from 
upstream as that way we'll find any bugs quickly.  Michael Clark has a pretty 
big QEMU patch queue, but nothing appears to be critical for Linux boot.

> Excellent - once this series hits mainline, I'll add riscv to my
> boot tests.

Thanks!  I'm super excited to get CI stuff up and running as now that we can 
boot I'm worried people will notice when I screw something up :)
