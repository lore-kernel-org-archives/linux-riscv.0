From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 09 Aug 2018 18:03:54 -0700 (PDT)
Subject: [PATCH v2 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809212422.GB13675@roeck-us.net>
Message-ID: <mhng-80aa1c8e-e2ed-4662-8715-4bb9e6ba7598@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 09 Aug 2018 14:24:22 PDT (-0700), linux at roeck-us.net wrote:
> On Thu, Aug 09, 2018 at 01:25:24PM -0700, Palmer Dabbelt wrote:
>> This file is expected to be included multiple times in the same file in
>> order to allow the __SYSCALL macro to generate system call tables.  With
>> a global include guard we end up missing __NR_riscv_flush_icache in the
>> syscall table, which results in icache flushes that escape the vDSO call
>> to not actually do anything.
>>
>> The fix is to move to per-#define include guards, which allows the
>> system call tables to actually be populated.  Thanks to Macrus Comstedt
>> for finding and fixing the bug!
>>
>> I also went ahead and fixed the SPDX header to use a //-style comment,
>> which I've been told is the canonical way to do it.
>>
>> Cc: Marcus Comstedt <marcus@mc.pp.se>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> [Compile-]Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> on top of linux-next after reverting the version of the patch there.
>
> I also tried to run the resulting image (defconfig) with qemu (built
> from https://github.com/riscv/riscv-qemu.git), but that still doesn't
> work. I assume there are still some patches missing ?

Do you have the PLIC patches?  They'll be necessary to make this all work, and 
there's a v4 out now that when combined with for-next should get you to 
userspace.

    https://lore.kernel.org/lkml/20180809075602.989-1-hch at lst.de/T/#u

Also, what is your methodology?  I follow

    https://wiki.qemu.org/Documentation/Platforms/RISCV

and could could natively compile and run hello world with an earlier version of 
Christoph's patch set, which is really only cosmetically different than the v4.  
I use qemu's master branch as well, which when I tried was exactly 3.0.0-rc3.
