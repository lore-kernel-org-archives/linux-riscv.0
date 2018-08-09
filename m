From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 09 Aug 2018 13:58:47 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809132612.GA31058@roeck-us.net>
Message-ID: <mhng-0e048cc1-42e3-4552-88c5-00177db30a5c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 09 Aug 2018 06:26:12 PDT (-0700), linux at roeck-us.net wrote:
> On Fri, Aug 03, 2018 at 12:53:44PM -0700, Palmer Dabbelt wrote:
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
> Fails to build riscv:allnoconfig.
>
> CC      arch/riscv/kernel/syscall_table.o
> ./arch/riscv/include/uapi/asm/syscalls.h:29:36: error:
> ?sys_riscv_flush_icache? undeclared here (not in a function); did you mean ?__NR_riscv_flush_icache??

Thanks.  I added you to another patch set.
