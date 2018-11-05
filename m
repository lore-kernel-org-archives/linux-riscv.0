From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 5 Nov 2018 21:56:15 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
Message-ID: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> Marcin Juszkiewicz reported issues while generating syscall table for riscv
> using 4.20-rc1. The patch refactors our unistd.h files to match some other
> architectures.
>
> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> - Adjust kernel asm/unistd.h
>
> So now asm/unistd.h UAPI header should show all syscalls for riscv.
>
> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> generated asm/unistd.h UAPI header thus user didn't see:
>
> - __NR_riscv_flush_icache
> - __NR_newfstatat
> - __NR_fstat
>
> which are supported by riscv kernel.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Cc: Guenter Roeck <linux@roeck-us.net>

Thanks for addressing this, your patch correctly fixes riscv64, and
I should have noticed the mistake when I originally merged the
broken patch.

However, looking closer I found another problem with the original
patch that your fix does not address:

__ARCH_WANT_NEW_STAT should only be set on 64-bit
architectures.

For a 32-bit architecture, we only want __ARCH_WANT_STAT64 if
any. For 64-bit architectures with compat mode, we still need to
set __ARCH_WANT_STAT64 from the non-uapi file so we get
the syscall implementation.

If we don't care about the riscv32 ABI changing yet, we can
decide to leave out __ARCH_WANT_STAT64 here, and require
glibc to implement it using statx() like any new architecture.
stat64 is not y2038 safe, and statx replaces it because of that.

> Fixes: 67314ec7b025

That line should be formatted as

Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
