Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79741C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osQO7tgtjaM4Fpo2O3z5k7nJ1OVwDHZ1j2Pc8TrKwJY=; b=nxlyNbkXIcEA5w
	AnZsfP1vUed7tBjTaBDpnUF9pbkatpH/u4+yVPTV5Akr7of0LqB0WPKh8H/S1SF8N1/bXecLuRprq
	qfqYo15rnVi0eZBZL8L4QDM52F3ofmoGsag1GX3DBQnMaJJqYAAQfzLmMw++qza7cmcqFmeDLAoU7
	OxMkOTanH6YcMJ//mfnFH4oBEUDAQbaEUWpW45iMHV+dEZUPgj6sNfatqTbWTv3bnt0wmccP9G6eg
	xFVSwN5xwZRCTd2hFQkKT+ovDKE4ZL+kkT5UrXN+ZE6qOh7UCpTJa9rBzdcXE2iLoNHd5CuG69qY4
	fQkuE8lwfIVawX36nzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZT1J-00000004jq9-3zwF;
	Thu, 01 Aug 2024 10:26:53 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZT1G-00000004jp6-0bAk
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 10:26:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA3EB1BF209;
	Thu,  1 Aug 2024 10:26:45 +0000 (UTC)
Message-ID: <e935d5a3-1754-422c-aa92-08977ab9c929@ghiti.fr>
Date: Thu, 1 Aug 2024 12:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Omit optimized string routines when using
 KASAN
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org
References: <20240801033725.28816-1-samuel.holland@sifive.com>
 <20240801033725.28816-2-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240801033725.28816-2-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_032650_516438_ADBBDA99 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Samuel,

On 01/08/2024 05:36, Samuel Holland wrote:
> The optimized string routines are implemented in assembly, so they are
> not instrumented for use with KASAN. Fall back to the C version of the
> routines in order to improve KASAN coverage. This fixes the
> kasan_strings() unit test.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/include/asm/string.h | 2 ++
>   arch/riscv/kernel/riscv_ksyms.c | 3 ---
>   arch/riscv/lib/Makefile         | 2 ++
>   arch/riscv/lib/strcmp.S         | 1 +
>   arch/riscv/lib/strlen.S         | 1 +
>   arch/riscv/lib/strncmp.S        | 1 +
>   arch/riscv/purgatory/Makefile   | 2 ++
>   7 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index a96b1fea24fe..5ba77f60bf0b 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -19,6 +19,7 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>   extern asmlinkage void *memmove(void *, const void *, size_t);
>   extern asmlinkage void *__memmove(void *, const void *, size_t);
>   
> +#if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))


We do not support KASAN_SW_TAGS so there is no need for this #ifdef.


>   #define __HAVE_ARCH_STRCMP
>   extern asmlinkage int strcmp(const char *cs, const char *ct);
>   
> @@ -27,6 +28,7 @@ extern asmlinkage __kernel_size_t strlen(const char *);
>   
>   #define __HAVE_ARCH_STRNCMP
>   extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
> +#endif
>   
>   /* For those files which don't want to check by kasan. */
>   #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
> diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
> index a72879b4249a..5ab1c7e1a6ed 100644
> --- a/arch/riscv/kernel/riscv_ksyms.c
> +++ b/arch/riscv/kernel/riscv_ksyms.c
> @@ -12,9 +12,6 @@
>   EXPORT_SYMBOL(memset);
>   EXPORT_SYMBOL(memcpy);
>   EXPORT_SYMBOL(memmove);
> -EXPORT_SYMBOL(strcmp);
> -EXPORT_SYMBOL(strlen);
> -EXPORT_SYMBOL(strncmp);
>   EXPORT_SYMBOL(__memset);
>   EXPORT_SYMBOL(__memcpy);
>   EXPORT_SYMBOL(__memmove);
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 2b369f51b0a5..8eec6b69a875 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,9 +3,11 @@ lib-y			+= delay.o
>   lib-y			+= memcpy.o
>   lib-y			+= memset.o
>   lib-y			+= memmove.o
> +ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
>   lib-y			+= strcmp.o
>   lib-y			+= strlen.o
>   lib-y			+= strncmp.o
> +endif
>   lib-y			+= csum.o
>   ifeq ($(CONFIG_MMU), y)
>   lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 687b2bea5c43..542301a67a2f 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -120,3 +120,4 @@ strcmp_zbb:
>   .option pop
>   #endif
>   SYM_FUNC_END(strcmp)
> +EXPORT_SYMBOL(strcmp)
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> index 8ae3064e45ff..962983b73251 100644
> --- a/arch/riscv/lib/strlen.S
> +++ b/arch/riscv/lib/strlen.S
> @@ -131,3 +131,4 @@ strlen_zbb:
>   #endif
>   SYM_FUNC_END(strlen)
>   SYM_FUNC_ALIAS(__pi_strlen, strlen)
> +EXPORT_SYMBOL(strlen)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index aba5b3148621..0f359ea2f55b 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -136,3 +136,4 @@ strncmp_zbb:
>   .option pop
>   #endif
>   SYM_FUNC_END(strncmp)
> +EXPORT_SYMBOL(strncmp)
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index f11945ee2490..fb9c917c9b45 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -1,7 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
> +ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
>   purgatory-y += strcmp.o strlen.o strncmp.o
> +endif
>   
>   targets += $(purgatory-y)
>   PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))


With the removal of KASAN_SW_TAGS, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And since I have this testsuite in my CI, I gave it a try and it works so:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
