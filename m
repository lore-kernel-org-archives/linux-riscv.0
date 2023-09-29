Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD020E77345
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 22:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d92+65to36kaVaMqdK7IgYj8a6ECqRQzUEy9s//9OFo=; b=dFASqtcOuyIvsfBRPkBe4GiDVq
	OGyIS6Wa4duEALpiOJq3vpgehGL4B43IvPI24DrtvwNFIKQQ1yHa2F8yoQcfeeZAVgRuX/6Adzh0I
	9fddV5h6QnWVj6Ohu2G7OKOzHvQPL/S67TvUy+XBamzXKyGSu5Y3/LedOpqjOq6HibG49jbim1f/j
	8ttn/uBLv0Xu1CcZx54r0ZGdk9+Fk6eJ0RdoT3qZh53DLYOqLcbD4bBN+UCzGQouSi8GFK9UodRv4
	TxW2SRaBs1d7qynldKc449L3iVrxjT4Fx7x89ISHoWAE7Z5II9cyd3ghpOGgz1xpseDG/tTegUepa
	e5PkkOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLjQ-008dwL-0d;
	Fri, 29 Sep 2023 22:13:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLjM-008dvz-0C
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 22:13:06 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E5AA03F641
	for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696025580;
	bh=akEQpjnSaOCmVyFO6/j4VdCn72p157hzBoWjA60czn0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HBxYXRcBCyHg3cDy5W3O+GDB35zR7O30GrsqWDF3+5zOiWVX9sEc646WPj+qpbccY
	 +qyz8UmaRpyKI4OqvkMd03wcX4Ipq+EXNi+F6elI4/9y0pCYhIhVX0hJPqsDAwVInZ
	 CLEnXb53IdX5EbtdGawXqE9+qM2nxNRN7RxYP6aeHzXApbEsRCOQ4e0WajwasOZiuH
	 KNlEmQSKHrbAsHnUuoUHWzlxEx/YTzbWfpQcp6XPYmWfFS/rxzKQfMgnpj9N5y2bMl
	 if2etFA7cB6pSCcVxyxjqOXi1c49LEoMQMxL6drk5PNGLxDolrbveiXUZezNqU6Mje
	 unVz7v48PSS4Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-418134c43d7so8735011cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 15:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025580; x=1696630380;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akEQpjnSaOCmVyFO6/j4VdCn72p157hzBoWjA60czn0=;
        b=IfKdUiXHuGjkXDmcQCD36Yj+LMIErYe1nKGKVpc9NjCbzJ1GzyAol7ur5F0jDMvTDY
         xfAABvRAuaXqEQfb+nSyeP8z6TN+l2d5A1izVynyDQSgayC0rf9ERjHu8vrTyZgkuucf
         sMgpgjn6RIIeXKcgSft75WMfiF3ra0wVPETWaRE1caJrdUoUwVwhR4kUyQUHh/5o181/
         iKHRs+bxgUlqY+qj+osonMRhipQLO014ssDEVczzU0u0+LsHeRs+aNSmcHENes8SsaA9
         iy9BqZ7K61lgZFfVZIYUrUA7ef4GFgRBJMVPi1uJe+dQNcOVK/+nWrr2tUAncEeGgBzX
         m0/Q==
X-Gm-Message-State: AOJu0Yza6lDR/LAg2wXW35vANOLKSgE4s+ecujcYXgsJHv3oAwx2RNha
	SK5kF2MXsO63M3qNxF+f0vk/9I81sTi/ui9rSFtDk8CDSrJyWvjtgy//6kfPc+xc0USYecyBjpH
	8zIAL6Z5ePyte3AukrTyQaRQtomFu86NzTVOSxvIX/leLa+HyE0BiUq2I/e+1PtFfDpT9TA==
X-Received: by 2002:ac8:5b02:0:b0:418:11c9:ddb5 with SMTP id m2-20020ac85b02000000b0041811c9ddb5mr5685378qtw.25.1696025579745;
        Fri, 29 Sep 2023 15:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB4k+0zAFDt2sSwLYhrpY9z4bqBMrdow5w3FBKQoWQYu+kJM3gd7lbn/fBQ8vP2fJypw7YZZK5PghtHVTbwSw=
X-Received: by 2002:ac8:5b02:0:b0:418:11c9:ddb5 with SMTP id
 m2-20020ac85b02000000b0041811c9ddb5mr5685358qtw.25.1696025579473; Fri, 29 Sep
 2023 15:12:59 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Sep 2023 15:12:58 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230912072740.2544-1-jszhang@kernel.org>
References: <20230912072740.2544-1-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 29 Sep 2023 15:12:58 -0700
Message-ID: <CAJM55Z9-+qFMAzXbDOX==bYhU92x0bgjbzJiYEHS_yL0wF-SbQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_151304_454930_3935EF2E 
X-CRM114-Status: GOOD (  25.81  )
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

Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
>
> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."

Hi Jisheng,

Thank you for doing this! This boots fine on my Nezha board (Allwinner D1)
running btrfs on the sd-card which was quick to find bugs when this code
first went upstream.

Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig.errata            |  1 +
>  arch/riscv/errata/thead/errata.c     | 76 +++++++++++++++++++++++++++-
>  arch/riscv/include/asm/errata_list.h | 50 +++---------------
>  3 files changed, 81 insertions(+), 46 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 566bcefeab50..d7972914f9de 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -78,6 +78,7 @@ config ERRATA_THEAD_CMO
>  	bool "Apply T-Head cache management errata"
>  	depends on ERRATA_THEAD && MMU
>  	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
>  	default y
>  	help
>  	  This will apply the cache management errata to handle the
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 0554ed4bf087..1c320abfe446 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -12,8 +12,10 @@
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> +#include <asm/dma-noncoherent.h>
>  #include <asm/errata_list.h>
>  #include <asm/hwprobe.h>
> +#include <asm/io.h>
>  #include <asm/patch.h>
>  #include <asm/vendorid_list.h>
>
> @@ -33,6 +35,75 @@ static bool errata_probe_pbmt(unsigned int stage,
>  	return false;
>  }
>
> +/*
> + * dcache.ipa rs1 (invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01010      rs1       000      00000  0001011
> + * dache.iva rs1 (invalida, virtual address)
> + *   0000001    00110      rs1       000      00000  0001011
> + *
> + * dcache.cpa rs1 (clean, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01001      rs1       000      00000  0001011
> + * dcache.cva rs1 (clean, virtual address)
> + *   0000001    00101      rs1       000      00000  0001011
> + *
> + * dcache.cipa rs1 (clean then invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01011      rs1       000      00000  0001011
> + * dcache.civa rs1 (... virtual address)
> + *   0000001    00111      rs1       000      00000  0001011
> + *
> + * sync.s (make sure all cache operations finished)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000000    11001     00000      000      00000  0001011
> + */
> +#define THEAD_inval_A0	".long 0x0265000b"
> +#define THEAD_clean_A0	".long 0x0255000b"
> +#define THEAD_flush_A0	".long 0x0275000b"
> +#define THEAD_SYNC_S	".long 0x0190000b"
> +
> +#define THEAD_CMO_OP(_op, _start, _size, _cachesize)			\
> +asm volatile("mv a0, %1\n\t"						\
> +	     "j 2f\n\t"							\
> +	     "3:\n\t"							\
> +	     THEAD_##_op##_A0 "\n\t"					\
> +	     "add a0, a0, %0\n\t"					\
> +	     "2:\n\t"							\
> +	     "bltu a0, %2, 3b\n\t"					\
> +	     THEAD_SYNC_S						\
> +	     : : "r"(_cachesize),					\
> +		 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> +		 "r"((unsigned long)(_start) + (_size))			\
> +	     : "a0")
> +
> +static void thead_errata_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_errata_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	THEAD_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static const struct riscv_nonstd_cache_ops thead_errata_cmo_ops = {
> +	.wback = &thead_errata_cache_wback,
> +	.inv = &thead_errata_cache_inv,
> +	.wback_inv = &thead_errata_cache_wback_inv,
> +};
> +
>  static bool errata_probe_cmo(unsigned int stage,
>  			     unsigned long arch_id, unsigned long impid)
>  {
> @@ -48,6 +119,8 @@ static bool errata_probe_cmo(unsigned int stage,
>  	if (stage == RISCV_ALTERNATIVES_BOOT) {
>  		riscv_cbom_block_size = L1_CACHE_BYTES;
>  		riscv_noncoherent_supported();
> +		if (IS_ENABLED(CONFIG_RISCV_NONSTANDARD_CACHE_OPS))
> +			riscv_noncoherent_register_cache_ops(&thead_errata_cmo_ops);
>  	}
>
>  	return true;
> @@ -77,8 +150,7 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_pbmt(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_PBMT);
>
> -	if (errata_probe_cmo(stage, archid, impid))
> -		cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
> +	errata_probe_cmo(stage, archid, impid);
>
>  	if (errata_probe_pmu(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index b55b434f0059..ea33288f8a25 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -24,9 +24,8 @@
>
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_PBMT 0
> -#define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_PMU 2
> -#define	ERRATA_THEAD_NUMBER 3
> +#define	ERRATA_THEAD_PMU 1
> +#define	ERRATA_THEAD_NUMBER 2
>  #endif
>
>  #ifdef __ASSEMBLY__
> @@ -94,54 +93,17 @@ asm volatile(ALTERNATIVE(						\
>  #define ALT_THEAD_PMA(_val)
>  #endif
>
> -/*
> - * dcache.ipa rs1 (invalidate, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01010      rs1       000      00000  0001011
> - * dache.iva rs1 (invalida, virtual address)
> - *   0000001    00110      rs1       000      00000  0001011
> - *
> - * dcache.cpa rs1 (clean, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01001      rs1       000      00000  0001011
> - * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00101      rs1       000      00000  0001011
> - *
> - * dcache.cipa rs1 (clean then invalidate, physical address)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000001    01011      rs1       000      00000  0001011
> - * dcache.civa rs1 (... virtual address)
> - *   0000001    00111      rs1       000      00000  0001011
> - *
> - * sync.s (make sure all cache operations finished)
> - * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> - *   0000000    11001     00000      000      00000  0001011
> - */
> -#define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0255000b"
> -#define THEAD_flush_A0	".long 0x0275000b"
> -#define THEAD_SYNC_S	".long 0x0190000b"
> -
>  #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
> -asm volatile(ALTERNATIVE_2(						\
> -	__nops(6),							\
> +asm volatile(ALTERNATIVE(						\
> +	__nops(5),							\
>  	"mv a0, %1\n\t"							\
>  	"j 2f\n\t"							\
>  	"3:\n\t"							\
>  	CBO_##_op(a0)							\
>  	"add a0, a0, %0\n\t"						\
>  	"2:\n\t"							\
> -	"bltu a0, %2, 3b\n\t"						\
> -	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
> -	"mv a0, %1\n\t"							\
> -	"j 2f\n\t"							\
> -	"3:\n\t"							\
> -	THEAD_##_op##_A0 "\n\t"						\
> -	"add a0, a0, %0\n\t"						\
> -	"2:\n\t"							\
> -	"bltu a0, %2, 3b\n\t"						\
> -	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
> -			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
> +	"bltu a0, %2, 3b\n\t",						\
> +	0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM)		\
>  	: : "r"(_cachesize),						\
>  	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
>  	    "r"((unsigned long)(_start) + (_size))			\
> --
> 2.40.1
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
