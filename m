From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 9 Aug 2018 21:11:34 -0700
Subject: [PATCH v2 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <mhng-ef018453-7a99-48b3-bda5-5408383d9566@palmer-si-x1c4>
References: <mhng-ef018453-7a99-48b3-bda5-5408383d9566@palmer-si-x1c4>
Message-ID: <988c739c-a275-c018-2502-08f817b2f818@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 08/09/2018 08:59 PM, Palmer Dabbelt wrote:
> On Thu, 09 Aug 2018 19:40:55 PDT (-0700), linux at roeck-us.net wrote:
>> On 08/09/2018 06:03 PM, Palmer Dabbelt wrote:
>>> On Thu, 09 Aug 2018 14:24:22 PDT (-0700), linux at roeck-us.net wrote:
>>>> On Thu, Aug 09, 2018 at 01:25:24PM -0700, Palmer Dabbelt wrote:
>>>>> This file is expected to be included multiple times in the same file in
>>>>> order to allow the __SYSCALL macro to generate system call tables.? With
>>>>> a global include guard we end up missing __NR_riscv_flush_icache in the
>>>>> syscall table, which results in icache flushes that escape the vDSO call
>>>>> to not actually do anything.
>>>>>
>>>>> The fix is to move to per-#define include guards, which allows the
>>>>> system call tables to actually be populated.? Thanks to Macrus Comstedt
>>>>> for finding and fixing the bug!
>>>>>
>>>>> I also went ahead and fixed the SPDX header to use a //-style comment,
>>>>> which I've been told is the canonical way to do it.
>>>>>
>>>>> Cc: Marcus Comstedt <marcus@mc.pp.se>
>>>>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>>>
>>>> [Compile-]Tested-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> on top of linux-next after reverting the version of the patch there.
>>>>
>>>> I also tried to run the resulting image (defconfig) with qemu (built
>>>> from https://github.com/riscv/riscv-qemu.git), but that still doesn't
>>>> work. I assume there are still some patches missing ?
>>>
>>> Do you have the PLIC patches?? They'll be necessary to make this all work, and there's a v4 out now that when combined with for-next should get you to userspace.
>>>
>>> ??? https://lore.kernel.org/lkml/20180809075602.989-1-hch at lst.de/T/#u
>>>
>> Yes, after merging that branch on top of linux-next I can boot into Linux.
>> If I add my "riscv: Drop setup_initrd" patch as well, I can boot using
>> initrd, otherwise I have to use virtio-blk-device.
> 
> Awesome!? If you patch isn't on for-next then I must have missed it, do you mind sending me a pointer?? I can't find any references in my email.
> 
Hmm ... weird. I don't find it either. Maybe I sent it only in my dreams.
I'll send it out for review.

Guenter

>>> Also, what is your methodology?? I follow
>>>
>>> ??? https://wiki.qemu.org/Documentation/Platforms/RISCV
>>>
>>> and could could natively compile and run hello world with an earlier version of Christoph's patch set, which is really only cosmetically different than the v4. I use qemu's master branch as well, which when I tried was exactly 3.0.0-rc3.
>>>
>>
>> That doesn't work for me, possibly because I don't specify a bbl
>> image with -kernel but vmlinux (using -bios for the bbl image).
>> I use branch qemu-for-upstream of https://github.com/riscv/riscv-qemu.git.
>>
>> Guenter
> 
