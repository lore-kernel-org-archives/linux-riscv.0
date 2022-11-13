Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EFDC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opd2N3uFkimI/Ta+t7reYBLG4xUjPXy36+Ky9rM9VVA=; b=NEEjGQ8RYLlCwC
	lFhRgHcUplKMy+k+2uY+Fb9VOKk7hE3L+ktNbISnihTgYQE3UYzphMDnjMKaI90refWmnYhl1Vsld
	WXoOw9LDNQjH4YR+SD6GlKlsdlonFqaySyPglUci3D7Y2Ekp4fUzIXBqAJ1XgllTzDGqOzUv958jy
	UZv2dStWsaM6jwEWZE6OP6ML+DBxnlOO3WMVf91wMNTiMYa0jdR44VJ7XrtzTstF9QkknYkKx9MY7
	1TSpxjLgrAp+BBmYgdZLuESoauV5Tf83wzYEa4ZVBXa02kWW9QO90ooSJpJfuyIMEgJOPdFEBkgC0
	IwPHranqD6DdzGUX5uvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouL8B-00EXWa-3F; Sun, 13 Nov 2022 22:07:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouL88-00EXVY-9r
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 22:07:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 923FC60BD6;
	Sun, 13 Nov 2022 22:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204B7C433D6;
	Sun, 13 Nov 2022 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668377227;
	bh=jNE8zIkyI1+HYEriWAuflYaEe1PmvFmWvfhpPo0vco0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRVAt/G3ypRylBjmFk5OJPxe2w+IIRRnpcDQp9drDChqtvqQ2ALAj1CBwoY81W07D
	 zOXMZg3cwuqCHyM7BTtOKxiXD8NJwRMzXn8vCHHwjoBm0jkGaZhErRDBvWSGDa/e8y
	 PKP7yKT0jYJJ1/NV0s0nsEkerOBiyeWX7SZhMMhsfue9V63XorWO7H6QC15tUOWAh5
	 7sDPqaFwobBLcxgi+btC7aWiWtsSsLTsFWAgEsZ0N6vBYicvlDUwoCt2z0gFubxPiI
	 kYGzu98G2MxUn84eNI7K9m61dz8T7uh6hqjaD1BYWw1n9P2XxqAJY8QHdJUPd1IhMK
	 p6w9wj5y5B5cQ==
Date: Sun, 13 Nov 2022 22:07:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 6/7] RISC-V: add infrastructure to allow different str*
 implementations
Message-ID: <Y3FqhkLzYfARO8xf@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-7-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-7-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_140708_447567_4B1F7F3C 
X-CRM114-Status: GOOD (  28.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 10, 2022 at 05:49:23PM +0100, Heiko Stuebner wrote:
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
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/string.h | 66 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/image-vars.h  |  6 +--
>  arch/riscv/lib/Makefile         |  3 ++
>  arch/riscv/lib/strcmp.S         | 39 +++++++++++++++++++
>  arch/riscv/lib/strlen.S         | 29 +++++++++++++++
>  arch/riscv/lib/strncmp.S        | 41 ++++++++++++++++++++
>  6 files changed, 181 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strncmp.S
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
> index 000000000000..f23a5c5e39d8
> --- /dev/null
> +++ b/arch/riscv/lib/strcmp.S
> @@ -0,0 +1,39 @@
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
> +	 *   a0 - comparison result, like strncmp

The strncmp_generic one below says "like strncmp" too. Given the below
copy paste stuff, is this one copy paste or intentional?

> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *   a2 - number of characters to compare

Above line is a copy paste error?

> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2, t3, t4, t5

As is this one?

Other than those, seems to make sense?

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

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
> index 000000000000..8d271cd0df72
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
> +	 *   a0 - comparison result, like strncmp
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
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
