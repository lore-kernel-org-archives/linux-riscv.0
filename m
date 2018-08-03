From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 02 Aug 2018 18:26:58 -0700 (PDT)
Subject: [PATCH v3 3/7] riscv: Delete asm/compat.h
In-Reply-To: <20180707054247.19802-4-deepa.kernel@gmail.com>
Message-ID: <mhng-ca3e24c4-d59b-491d-a9c5-c8466168b638@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 06 Jul 2018 22:42:43 PDT (-0700), deepa.kernel at gmail.com wrote:
> riscv does not enable CONFIG_COMPAT in default configurations:
> defconfig, allmodconfig and allnoconfig.
> Remove the asm/compat.h as it does not seem to add any value to
> the architecture without CONFIG_COMPAT.
>
> Now that time compat syscalls are being reused in non CONFIG_COMPAT
> modes, asm-generic/compat.h provides definitions for riscv 32 bit
> mode.
>
> Alternative would be to make compat_time.h to be conditional on
> CONFIG_COMPAT_32BIT_TIME. But, since riscv does not does not need
> asm/compat.h, delete it instead.
>
> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
> Cc: palmer at sifive.com
> Cc: linux-riscv at lists.infradead.org
> ---
>  arch/riscv/include/asm/Kbuild   |  1 +
>  arch/riscv/include/asm/compat.h | 29 -----------------------------
>  2 files changed, 1 insertion(+), 29 deletions(-)
>  delete mode 100644 arch/riscv/include/asm/compat.h
>
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 576ffdca06ba..efdbe311e936 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -1,6 +1,7 @@
>  generic-y += bugs.h
>  generic-y += cacheflush.h
>  generic-y += checksum.h
> +generic-y += compat.h
>  generic-y += cputime.h
>  generic-y += device.h
>  generic-y += div64.h
> diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
> deleted file mode 100644
> index 044aecff8854..000000000000
> --- a/arch/riscv/include/asm/compat.h
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/*
> - * Copyright (C) 2012 ARM Ltd.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef __ASM_COMPAT_H
> -#define __ASM_COMPAT_H
> -#ifdef CONFIG_COMPAT
> -
> -#if defined(CONFIG_64BIT)
> -#define COMPAT_UTS_MACHINE "riscv64\0\0"
> -#elif defined(CONFIG_32BIT)
> -#define COMPAT_UTS_MACHINE "riscv32\0\0"
> -#else
> -#error "Unknown RISC-V base ISA"
> -#endif
> -
> -#endif /*CONFIG_COMPAT*/
> -#endif /*__ASM_COMPAT_H*/

I thought we were using this to make uname print "riscv64" (or "riscv32") 
instead of just "riscv"?  Is there another mechanism to do that?
