From: marcin.juszkiewicz@linaro.org (Marcin Juszkiewicz)
Date: Mon, 5 Nov 2018 17:02:59 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
Message-ID: <10c6f266-12ce-9f1a-5859-52873ff329f1@linaro.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

W dniu 05.11.2018 o?15:26, David Abdurachmanov pisze:
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

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

With patch applied I got proper syscall data:

fstat  80
newfstatat     79
riscv_flush_icache     259
