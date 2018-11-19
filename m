From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 19 Nov 2018 08:53:35 -0800 (PST)
Subject: [PATCH v2] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAOesGMhgBxu+L-R5OaEdBjv4jGSY3AnB9LqaKvWKKUgEKBabjw@mail.gmail.com>
Message-ID: <mhng-b667387d-ef0f-45aa-8e22-ed828d410161@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 16 Nov 2018 18:39:45 PST (-0800), Olof Johansson wrote:
> On Thu, Nov 8, 2018 at 11:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
>>
>> Marcin Juszkiewicz reported issues while generating syscall table for riscv
>> using 4.20-rc1. The patch refactors our unistd.h files to match some other
>> architectures.
>>
>> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 64-bit
>> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
>> - Adjust kernel asm/unistd.h
>>
>> So now asm/unistd.h UAPI header should show all syscalls for riscv.
>>
>> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
>> generated asm/unistd.h UAPI header thus user didn't see:
>>
>> - __NR_riscv_flush_icache
>> - __NR_newfstatat
>> - __NR_fstat
>>
>> which are supported by riscv kernel.
>>
>> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
>> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>
> Acked-by: Olof Johansson <olof@lixom,net>
>
> This fixes the 32-bit build error I'm seeing here as well. Palmer, it
> would be nice to have 4.20 compile 32-bit kernels still.
>
> Per builder logs:
> http://arm-soc.lixom.net/buildlogs/mainline/v4.20-rc2-133-g1ce80e0fe98e7/buildall.riscv.rv32_defconfig.log.failed,
> actual errors are:
>
> include/uapi/asm-generic/unistd.h:247:29: error: 'sys_fstatat64'
> undeclared here (not in a function); did you mean 'sys_fstatfs64'?
> include/uapi/asm-generic/unistd.h:249:27: error: 'sys_fstat64'
> undeclared here (not in a function); did you mean 'sys_fstatat64'?

Sorry, I missed the v2 here.  I'll include it as part of this week's PR.
