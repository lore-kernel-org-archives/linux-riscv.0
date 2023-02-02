Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC4AC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=69T7IHyhudT5MJxxHeDAFKPpqColnv0KEaMjzK/Az3I=; b=rYVNi55dsrv8Gkh68OcIhxIIjw
	EZyfLpwiCk/HXuPatFc0PN0Fm+d0vfIvpSfPE3l5HFpQxYteqQOITERv0JnJQ2kshpBIARIJQfiEE
	valg3LB2d9/NI1J9yn8FQeiqQhDzS21OpCtxvSVpPZZ5Okv0zgbo+cEkAl/GVM7mhnRVqSRjtTGmq
	5JgVsih7LzpT5GmFjQEcELWx1TCXe322ytMFqtHzBTw/HBWw/ijRfDFVLeqmAeI71x0Eoon4Ww21z
	abgp7XTO9JLzYPyBVQnLiQF+gyV05/1RQN31TJvv0pTwZ/lRNsPv0ixQ5dcmtX+Y7sfAqIqXB/w3j
	NQgJ0JGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRKV-00ELwV-3g; Thu, 02 Feb 2023 04:36:11 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRKO-00ELuW-VN
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 04:36:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id m11so835569pji.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 20:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Gkj3ggiCbZ84l1wyhC/7UEwOHQf/756d2zbjoNC2xI=;
        b=tSWFxMLyPur9VVM50fXn79GYe93MgfsPKzfSizif+0vHEffezrLR3YcDXoOA6rGsLg
         MOBTDILMkZSEsNlYkGjhpRgdiJxvSsgSA1VSYAPqK3/GQ2qcf+Xxx2DhDrtwf21eFjKm
         j0RSfNrSKcCqjRkqRvkjvZPIiAybg44ogWSroRsToDsF1JfG65C6EcKMAx91Foa8ZOXh
         sbMyPIgY1fnz+y4OM1plJLMstbMHQJFLn36g14hhU7r9hNYYG214fQKFvlQpBQZfcTdO
         ltr1BW1fhDjzvqC5coJtii2YxxKlWZi71Uos1Vaw++ZqTwKDhOrGOlCsWwMl6wmxsP1T
         YS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gkj3ggiCbZ84l1wyhC/7UEwOHQf/756d2zbjoNC2xI=;
        b=S3a8DOR6+G+0zT/LCOECTWePkqbFg+Dw5a4em7vxZWldGM04r2oYIR/zOC9f9FD8gO
         Gf0V1tcJNNMy7FC70HkeUGYUcY9UXOC5XemOOPVFOp2ep6M9qwAHuSXTMhfVpWwdzhlE
         ocgIzeDXgBFwFR0ecKDRlovYdoTLwAXnesH3p+3kugXYt6s0MOExlIA/FMdOqycCEUyg
         jQdbKodgOfugyICIHNQlYmGoCfDmtH0blJp5zv+hOHc6lYR4xnQZgoOkqudBmhvRdoiX
         rUIC94f56AuSdoDMvZSF2QEKAke+OwxhPL+tUm0IQMK6wWp6be1cT6GnqxXmVZ8rGLSi
         N5wA==
X-Gm-Message-State: AO0yUKWT2KdxQeK1cWen3fvik84XBDMzDaxsmAMI3q77Qmb8TX8Vzldw
	ikmCcSBgYXPhwANGThvkFfokmra5sOwBooFh
X-Google-Smtp-Source: AK7set8f1+cC9uG76QNxKI3IoHCHwtn0yh/uZ8Peu6TYqhnAR5vbM7P0GbvjYHbUJXmDA+4KeDBYRg==
X-Received: by 2002:a05:6a20:428b:b0:be:982b:ed86 with SMTP id o11-20020a056a20428b00b000be982bed86mr6930315pzj.29.1675312554962;
        Wed, 01 Feb 2023 20:35:54 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id j26-20020a633c1a000000b004daae45558dsm11431697pga.8.2023.02.01.20.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 20:35:54 -0800 (PST)
Date: Wed, 01 Feb 2023 20:35:54 -0800 (PST)
X-Google-Original-Date: Wed, 01 Feb 2023 07:43:28 PST (-0800)
Subject: Re: [PATCH v3 4/6] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <20230130120128.1349464-5-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, apatel@ventanamicro.com,
  Atish Patra <atishp@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor.dooley@microchip.com>, robh@kernel.org, jszhang@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-39982208-6bbb-4be7-83c6-5c05da8bebc1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_203605_034203_98DEEDE2 
X-CRM114-Status: GOOD (  32.89  )
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

On Mon, 30 Jan 2023 04:01:26 PST (-0800), ajones@ventanamicro.com wrote:
> Using memset() to zero a 4K page takes 563 total instructions
> where 20 are branches. clear_page() with Zicboz takes 150 total
> instructions where 16 are branches. We could reduce the numbers
> by further unrolling, but, since the cboz block size isn't fixed,
> we'd need a Duff device to ensure we don't execute too many
> unrolled steps. Also, cbo.zero doesn't take an offset, so each
> unrolled step requires it and an add instruction. This increases
> the chance for icache misses if we unroll many times. For these
> reasons we only unroll four times. Unrolling four times should be
> safe as it supports cboz block sizes up to 1K when used with 4K
> pages and it's only 24 to 32 bytes of unrolled instructions.
>
> Another note about the Duff device idea is that it would probably
> be best to store the number of steps needed at boot time and then
> load the value in clear_page(). Calculating it in clear_page(),
> particularly without the Zbb extension, would not be efficient.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig                | 13 +++++++++++
>  arch/riscv/include/asm/insn-def.h |  4 ++++
>  arch/riscv/include/asm/page.h     |  6 +++++-
>  arch/riscv/lib/Makefile           |  1 +
>  arch/riscv/lib/clear_page.S       | 36 +++++++++++++++++++++++++++++++
>  5 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/lib/clear_page.S
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 33bbdc33cef8..3759a2f6edd5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,6 +432,19 @@ config RISCV_ISA_ZICBOM
>
>  	   If you don't know what to do here, say Y.
>
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> +	   when available.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index e01ab51f50d2..6960beb75f32 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -192,4 +192,8 @@
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(2))
>
> +#define CBO_zero(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 9f432c1b5289..ccd168fe29d2 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -49,10 +49,14 @@
>
>  #ifndef __ASSEMBLY__
>
> +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> +void clear_page(void *page);
> +#else
>  #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
> +#endif
>  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
>
> -#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
> +#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
>  #define copy_user_page(vto, vfrom, vaddr, topg) \
>  			memcpy((vto), (vfrom), PAGE_SIZE)
>
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..9ee5e2ab5143 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -5,5 +5,6 @@ lib-y			+= memset.o
>  lib-y			+= memmove.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
> +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> new file mode 100644
> index 000000000000..49f29139a5b6
> --- /dev/null
> +++ b/arch/riscv/lib/clear_page.S
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +#include <asm/page.h>
> +
> +/* void clear_page(void *page) */
> +ENTRY(__clear_page)
> +WEAK(clear_page)
> +	li	a2, PAGE_SIZE
> +	ALTERNATIVE("j .Lno_zicboz", "nop",
> +		    0, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
> +	la	a1, riscv_cboz_block_size
> +	lw	a1, 0(a1)

You should be able to just "lw a1, riscv_cboz_block_size", which can 
sometimes generate better code.

> +	add	a2, a0, a2
> +.Lzero_loop:
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1

We were talking about this in the patchwork call: this risks overflow if 
the block size is bigger than a quarter of a page.  That's probably 
pretty rare, but given that there's already an alternative for the jump 
it's easy to check.

> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	CBO_zero(a0)
> +	add	a0, a0, a1
> +	bltu	a0, a2, .Lzero_loop
> +	ret
> +.Lno_zicboz:
> +	li	a1, 0
> +	tail	__memset
> +END(__clear_page)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
