From: hch@infradead.org (Christoph Hellwig)
Date: Sat, 27 Oct 2018 00:55:59 -0700
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <20181024204036.8799-3-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
Message-ID: <20181027075559.GB7868@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I don't know much about seccomp, so just a few general nitpicks:

On Wed, Oct 24, 2018 at 01:40:36PM -0700, Palmer Dabbelt wrote:
> +	bool "Enable seccomp to safely compute untrusted bytecode"
> +
> +	help

The empty line above is odd, please drop it.

> +++ b/arch/riscv/include/asm/seccomp.h
> @@ -0,0 +1,10 @@
> +/* Copyright 2018 SiFive, Inc. */
> +/* SPDX-License-Identifier: GPL-2.0 */

The SPDX tag should go into the first line.

> +#ifndef _ASM_RISCV_SECCOMP_H
> +#define _ASM_RISCV_SECCOMP_H
> +
> +#include <asm/unistd.h>
> +
> +#include <asm-generic/seccomp.h>

And while at it I'd drop this empty line as well.
