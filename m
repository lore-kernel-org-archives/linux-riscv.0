Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 04:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=470SungIqG2SJwIE9NBe2zSWSqSBrui8RQT3X1zdYD0=; b=nLLKJVqKnfxJ0Y8bvvimtrDGFw
	0pCK2Jb7M8STegT12y+OnDYgcfTggc+Kd4JZIh2dw/OkwtZrzG5xewB5kvzmmt2PLfscvw3qrYKnu
	ETNK6T9+VpeYLxR47rTsSvmKIjy+4EljRbQk5D3f0O3dfc93A3rUgUV9yQCSTRPb9ichZViGvrwWb
	M7feIGAXYTD2w5ygiPB25tcGyAMaLFwaQdFxxoa7fbGc/vdZLhGsTvlJKaC/KBl09Loo4HioqfWtW
	fXWn1XomWRaTCvqzuFkAGXHAMMsWadaYRc/Q8Cnh9yY0yxdorGCGbGQFaWl67MMlxpVpel8srzDCh
	E/bcKC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xLo-00D62g-Qw; Fri, 02 Dec 2022 04:08:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xLl-00D5wz-2H
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 04:08:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id 140so3808452pfz.6
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 20:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zry2mLAT/UTvaqkVLSI4TlIz8A0irjjWeHKtNLHqmrA=;
        b=pMdOUCoMB88Tqk9tSscnj6myebMGLHSY7ndcbkgfemPSkvXuvcHi7weL0hqClilKKl
         kpSag2QVAeSyHnVvhhZsjcOn3jluOoAOroUpzhc3nW6MsNqJ+FbTBX9lUDo8o5H39FjT
         99JkNY+HW1ZSOzF0atHjqPjfIn80eXAoUOC6tCjZAj6Vx0Zc2mKEaSuS8wr61I4iOCjK
         yC3OB1fwi/iH/esn3DjxYxrW411I/pdI9VFT72Ebuc07Lf5kunWvyosIi2eZ+AjvazSq
         kjITVQKNuft/cK+zefcEOIDcLsoTd4XjZJaRaSiWttH4FX7MUEIU6N0cKo242zb/DrRV
         L44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zry2mLAT/UTvaqkVLSI4TlIz8A0irjjWeHKtNLHqmrA=;
        b=amRBOtWwyVhQ2l+Z1VB67ccFpIr+f4h9ufqvrU3vfjJ8bL95l9H2KtViwaRIY1GRdV
         q1K/W0rNwC8B5eJu1S7lWYgXVhmUQ0q5p2W9Yc+pFntx5/UUB30Z4gxEWacIBiMGC/lE
         E/EVHHMfqTMy1pMnMF/FeSndpBYOJTUwku2mT4RNkvrhxzeO1NEm4ZDXuqhuZmi33Sxv
         4jGoPlZxWw8Y111CMQOthrQIqjErdGXwp+4BgT6DxHCMK+JtYKvKiRf6hC+H7qixDdz2
         7bR8jiVTEaRIEnMO2ahqsAi0byWhnmndzrkIYi3H32nGthqL/crJKSJTqi8KZvdvT5Ql
         mXJg==
X-Gm-Message-State: ANoB5pmnO39Luz3fuywNfyWCFG+xS7MVAfTArkwpFDs5Xkk/uYtYhgjU
	9NxZnPj6ijBroUlMwffgRycRX152Vz+AzBjJ
X-Google-Smtp-Source: AA0mqf7+0Gleb+WYIGn2wR97Jtz22OaAIjx8B3DuQ8CDYZ7QiXYkDUGJ1kyL/7rjrEOHQqJ+Zu5qKA==
X-Received: by 2002:a65:6c11:0:b0:477:2bc0:f1b with SMTP id y17-20020a656c11000000b004772bc00f1bmr42854489pgu.566.1669954097088;
        Thu, 01 Dec 2022 20:08:17 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j9-20020a170903028900b00182a9c27acfsm4413378plr.227.2022.12.01.20.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 20:08:16 -0800 (PST)
Date: Thu, 01 Dec 2022 20:08:16 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 20:08:07 PST (-0800)
Subject: Re: [PATCH v3 13/14] RISC-V: add infrastructure to allow different str* implementations
In-Reply-To: <20221130225614.1594256-14-heiko@sntech.de>
CC: linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
  prabhakar.csengg@gmail.com, Conor Dooley <conor@kernel.org>, philipp.tomsich@vrull.eu,
  ajones@ventanamicro.com, heiko@sntech.de, emil.renner.berthing@canonical.com, ardb@kernel.org,
  linux-efi@vger.kernel.org, heiko.stuebner@vrull.eu, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de, Ard Biesheuvel <aardb@kernel.org>
Message-ID: <mhng-3dd5efb0-e79f-4978-89a8-f9ec02004a7e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_200833_136672_3D799AB6 
X-CRM114-Status: GOOD (  34.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 30 Nov 2022 14:56:13 PST (-0800), heiko@sntech.de wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Depending on supported extensions on specific RISC-V cores,
> optimized str* functions might make sense.
>
> This adds basic infrastructure to allow patching the function calls
> via alternatives later on.
>
> The main idea is to have the core str* functions be inline functions
> which then call the most optimized variant and this call then be
> replaced via alternatives.
>
> The big advantage is that we don't need additional calls.
> Though we need to duplicate the generic functions as the main code
> expects either itself or the architecture to provide the str* functions.
>
> The added *_generic functions are done in assembler (taken from
> disassembling the main-kernel functions for now) to allow us to control
> the used registers.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/Makefile             |  3 ++
>  arch/riscv/include/asm/string.h | 66 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/image-vars.h  |  6 +--
>  arch/riscv/lib/Makefile         |  3 ++
>  arch/riscv/lib/strcmp.S         | 38 +++++++++++++++++++
>  arch/riscv/lib/strlen.S         | 29 +++++++++++++++
>  arch/riscv/lib/strncmp.S        | 41 ++++++++++++++++++++
>  7 files changed, 183 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strncmp.S
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d13b597cb55..581e4370c2a6 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -80,6 +80,9 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>          KBUILD_CFLAGS += -fno-omit-frame-pointer
>  endif
>
> +# strchr is special case, as gcc might want to call its own strlen from there
> +KBUILD_CFLAGS += -fno-builtin-strlen -fno-builtin-strcmp -fno-builtin-strncmp -fno-builtin-strchr

I was poking around Ard's comment on that -DRISCV_EFI to try and figure 
out what it was doing, but I think this is the bigger issue.  I haven't 
benchmarked anything, but my guess is that turning off support for these 
builtin routines will outweigh the faster outline implementations of 
these routines.  I don't have any benchmarks to prove that, but in 
general compilers are pretty smart about handling these builtin routines 
in the common cases and deferring that to runtime is probably the wrong 
option.

I haven't looked all that closely at this patch set.  Is there some 
reason it's necessary to disable the builtin handling?  If not then my 
guess is it's better to leave that enabled unless some benchmarks show 
otherwise (and I don't know of any Zb* hardware to test against).

> +
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>  KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 909049366555..b98481d2d154 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,72 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>  #define __HAVE_ARCH_MEMMOVE
>  extern asmlinkage void *memmove(void *, const void *, size_t);
>  extern asmlinkage void *__memmove(void *, const void *, size_t);
> +
> +#define __HAVE_ARCH_STRCMP
> +extern asmlinkage int __strcmp_generic(const char *cs, const char *ct);
> +
> +static inline int strcmp(const char *cs, const char *ct)
> +{
> +#ifdef RISCV_EFISTUB
> +	return __strcmp_generic(cs, ct);
> +#else
> +	register const char *a0 asm("a0") = cs;
> +	register const char *a1 asm("a1") = ct;
> +	register int a0_out asm("a0");
> +
> +	asm volatile("call __strcmp_generic\n\t"
> +		: "=r"(a0_out)
> +		: "r"(a0), "r"(a1)
> +		: "ra", "t0", "t1", "t2");
> +
> +	return a0_out;
> +#endif
> +}
> +
> +#define __HAVE_ARCH_STRNCMP
> +extern asmlinkage int __strncmp_generic(const char *cs,
> +					const char *ct, size_t count);
> +
> +static inline int strncmp(const char *cs, const char *ct, size_t count)
> +{
> +#ifdef RISCV_EFISTUB
> +	return __strncmp_generic(cs, ct, count);
> +#else
> +	register const char *a0 asm("a0") = cs;
> +	register const char *a1 asm("a1") = ct;
> +	register size_t a2 asm("a2") = count;
> +	register int a0_out asm("a0");
> +
> +	asm volatile("call __strncmp_generic\n\t"
> +		: "=r"(a0_out)
> +		: "r"(a0), "r"(a1), "r"(a2)
> +		: "ra", "t0", "t1", "t2");
> +
> +	return a0_out;
> +#endif
> +}
> +
> +#define __HAVE_ARCH_STRLEN
> +extern asmlinkage __kernel_size_t __strlen_generic(const char *);
> +
> +static inline __kernel_size_t strlen(const char *s)
> +{
> +#ifdef RISCV_EFISTUB
> +	return __strlen_generic(s);
> +#else
> +	register const char *a0 asm("a0") = s;
> +	register int a0_out asm("a0");
> +
> +	asm volatile(
> +		"call __strlen_generic\n\t"
> +		: "=r"(a0_out)
> +		: "r"(a0)
> +		: "ra", "t0", "t1");
> +
> +	return a0_out;
> +#endif
> +}
> +
>  /* For those files which don't want to check by kasan. */
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index d6e5f739905e..2f270b9fde63 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -25,10 +25,10 @@
>   */
>  __efistub_memcmp		= memcmp;
>  __efistub_memchr		= memchr;
> -__efistub_strlen		= strlen;
> +__efistub___strlen_generic	= __strlen_generic;
>  __efistub_strnlen		= strnlen;
> -__efistub_strcmp		= strcmp;
> -__efistub_strncmp		= strncmp;
> +__efistub___strcmp_generic	= __strcmp_generic;
> +__efistub___strncmp_generic	= __strncmp_generic;
>  __efistub_strrchr		= strrchr;
>
>  __efistub__start		= _start;
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..6c74b0bedd60 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,9 @@ lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
>  lib-y			+= memmove.o
> +lib-y			+= strcmp.o
> +lib-y			+= strlen.o
> +lib-y			+= strncmp.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> new file mode 100644
> index 000000000000..f4b7f4e806f0
> --- /dev/null
> +++ b/arch/riscv/lib/strcmp.S
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int __strcmp_generic(const char *cs, const char *ct) */
> +ENTRY(__strcmp_generic)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strcmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	mv	t2, a1
> +1:
> +	lbu	t1, 0(a0)
> +	lbu	t0, 0(a1)
> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	beq	t1, t0, 3f
> +	li	a0, 1
> +	bgeu	t1, t0, 2f
> +	li	a0, -1
> +2:
> +	mv	a1, t2
> +	ret
> +3:
> +	bnez	t1, 1b
> +	li	a0, 0
> +	j	2b
> +END(__strcmp_generic)
> +EXPORT_SYMBOL(__strcmp_generic)
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> new file mode 100644
> index 000000000000..e0e7440ac724
> --- /dev/null
> +++ b/arch/riscv/lib/strlen.S
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int __strlen_generic(const char *s) */
> +ENTRY(__strlen_generic)
> +	/*
> +	 * Returns
> +	 *   a0 - string length
> +	 *
> +	 * Parameters
> +	 *   a0 - String to measure
> +	 *
> +	 * Clobbers:
> +	 *   t0, t1
> +	 */
> +	mv	t1, a0
> +1:
> +	lbu	t0, 0(t1)
> +	bnez	t0, 2f
> +	sub	a0, t1, a0
> +	ret
> +2:
> +	addi	t1, t1, 1
> +	j	1b
> +END(__strlen_generic)
> +EXPORT_SYMBOL(__strlen_generic)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> new file mode 100644
> index 000000000000..7e116d942265
> --- /dev/null
> +++ b/arch/riscv/lib/strncmp.S
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int __strncmp_generic(const char *cs, const char *ct, size_t count) */
> +ENTRY(__strncmp_generic)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strncmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *   a2 - number of characters to compare
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	li	t0, 0
> +1:
> +	beq	a2, t0, 4f
> +	add	t1, a0, t0
> +	add	t2, a1, t0
> +	lbu	t1, 0(t1)
> +	lbu	t2, 0(t2)
> +	beq	t1, t2, 3f
> +	li	a0, 1
> +	bgeu	t1, t2, 2f
> +	li	a0, -1
> +2:
> +	ret
> +3:
> +	addi	t0, t0, 1
> +	bnez	t1, 1b
> +4:
> +	li	a0, 0
> +	j	2b
> +END(__strncmp_generic)
> +EXPORT_SYMBOL(__strncmp_generic)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
