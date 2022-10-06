Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4996AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1v1Db2PPNmd5T/+vUSNsTXuoIcZr5WivBqzO/u5c/A=; b=zHYir4cjwOOZwY
	TZsQ6k2MibKUNDZ9iRQMUQy8Mupi9TmKmdCT59/ifJnMgPiCDJWGj0F6KSkyRVTsfbym96FM1d6s/
	BBaGpJRk5TbdpdJrYTewgi1KGpKVMl2FXFEClGbsuNy+uulWVnyea8k5LqBOoXPThZU6TAUk2FfnR
	EojottRs1qz1uVTDtKeFnXFwd+HAaUFqeM4wIg3C5joCdUAC1m4ay3tY6UgKTn/Pf2XuaLHhKY4AG
	89UiCfApw6D9yamCCA2ZqqbaXZNIcerjkg1JUVN9mVqi2FtzIsgAJLFPS7z0UEXwAIVtwlbGWqSFH
	ht0tVr8TJuggo8ESqZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQy0-002hBT-G5; Thu, 06 Oct 2022 13:31:12 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQxx-002h9I-W5
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:31:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a26so4619735ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jLWyENnFNe547LYKA1l7p+V/55M9Qg7wqXNSQA+tPh4=;
        b=nfG8TGPZxwjq9nowPYag+alN8xtu6pejhDtfYE3OhQch5uXaWTBml/QIGfPxYDUNwu
         +WXVC7j1jDM33vPzl1VBqXVPTPXxIrHOnIKLJPe6xptKo6mInngkiHKX3HJLCm09bDB+
         GyFh2WHI6SIl4eSfO8Evw75JTMX4gm3DxD5EZkGNGd6bTO9A3qjQrphbIJLLRWkFd7gQ
         ORT1z5SjhmXjqEQC5y3GIwMLELg1u6TK++pgfuJ2LYDNMSKRru9GVT8g7EcJWVQhvLhP
         nio6yB/9ntQLDq5Cn1fJIDTBxvrNKxtrxmlXJccLrjfYw24ZOqVhvybo3WUYcFfU1I+H
         t1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLWyENnFNe547LYKA1l7p+V/55M9Qg7wqXNSQA+tPh4=;
        b=HlHVEINTMoePVhdqItTX0V5wtzrpRgUU5libGCrt2CLnzAusc3QVYC8qPLDzdprddv
         VfrYxU3zXGKjlmDdUg7yyDDpgF7TRSwtNlIm2mxrCbH3ncZQFHdhkEqta/h9Ew26nXAI
         Z+T9cYylWK+YGCezpIus935xNt6jkjqdQf8z3Sntn85U9igCHtytCJxYysAP2IZ3Bgl8
         ZzX+/v8cqAiczPbJO0j4kz+oCPIWuM+aBu+sMW/rGHW3lGDrXumfS6PT555vFd19ah00
         ckooI94H5uU4nE8d+7iWExImsH2y2U/NKcafH3v5X3bJqgT+r/+YGyidzp9shlPRyoVi
         Yl/w==
X-Gm-Message-State: ACrzQf0UuWIFORh8SVoZtowOFtQjRGVTzRak9bLKs2yLoI0BOh6s3Wkp
	VM+wvFKS8JT2+PVPUScw3NSUrw==
X-Google-Smtp-Source: AMsMyM6YGeAonCo9d5iqTsdyfBooPTFkF3ZB935YD873xQHdht4JfA2MNitsVbozbRgnrNAha2YkmA==
X-Received: by 2002:a17:907:7210:b0:783:37b0:b5ca with SMTP id dr16-20020a170907721000b0078337b0b5camr3937247ejc.689.1665063067246;
        Thu, 06 Oct 2022 06:31:07 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id d1-20020a170906304100b00788c622fa2csm9459973ejd.135.2022.10.06.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:31:06 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:31:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <20221006133105.hj3r2z4loybsfeqe@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063110_070518_FE279BC0 
X-CRM114-Status: GOOD (  21.93  )
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

On Thu, Oct 06, 2022 at 03:08:14PM +0800, Jisheng Zhang wrote:
> make the riscv_cpufeature_patch_func() scan all ISA extensions rather
> than limited feature macros.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h |  9 ++--
>  arch/riscv/kernel/cpufeature.c       | 61 +++-------------------------
>  2 files changed, 9 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 19a771085781..722525f4fc96 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -6,6 +6,7 @@
>  #define ASM_ERRATA_LIST_H
>  
>  #include <asm/alternative.h>
> +#include <asm/hwcap.h>
>  #include <asm/vendorid_list.h>
>  
>  #ifdef CONFIG_ERRATA_SIFIVE
> @@ -20,10 +21,6 @@
>  #define	ERRATA_THEAD_NUMBER 2
>  #endif
>  
> -#define	CPUFEATURE_SVPBMT 0
> -#define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> -
>  #ifdef __ASSEMBLY__
>  
>  #define ALT_INSN_FAULT(x)						\
> @@ -53,7 +50,7 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
>  #define ALT_SVPBMT(_val, prot)						\
>  asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
>  		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
> -			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
> +			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
>  		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
>  			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
>  		: "=r"(_val)						\
> @@ -127,7 +124,7 @@ asm volatile(ALTERNATIVE_2(						\
>  	"add a0, a0, %0\n\t"						\
>  	"2:\n\t"							\
>  	"bltu a0, %2, 3b\n\t"						\
> -	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
> +	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
>  	"mv a0, %1\n\t"							\
>  	"j 2f\n\t"							\
>  	"3:\n\t"							\
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index afa54635c180..2b1f18f97253 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -251,61 +251,11 @@ void __init riscv_fill_hwcap(void)
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
> -{
> -#ifdef CONFIG_RISCV_ISA_SVPBMT
> -	switch (stage) {
> -	case RISCV_ALTERNATIVES_EARLY_BOOT:
> -		return false;
> -	default:
> -		return riscv_isa_extension_available(NULL, SVPBMT);
> -	}
> -#endif
> -
> -	return false;
> -}
> -
> -static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> -{
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -	switch (stage) {
> -	case RISCV_ALTERNATIVES_EARLY_BOOT:
> -		return false;
> -	default:
> -		return riscv_isa_extension_available(NULL, ZICBOM);
> -	}
> -#endif
> -
> -	return false;
> -}
> -
> -/*
> - * Probe presence of individual extensions.
> - *
> - * This code may also be executed before kernel relocation, so we cannot use
> - * addresses generated by the address-of operator as they won't be valid in
> - * this context.
> - */
> -static u32 __init_or_module cpufeature_probe(unsigned int stage)
> -{
> -	u32 cpu_req_feature = 0;
> -
> -	if (cpufeature_probe_svpbmt(stage))
> -		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
> -
> -	if (cpufeature_probe_zicbom(stage))
> -		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> -
> -	return cpu_req_feature;
> -}
> -
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
>  {
> -	u32 cpu_req_feature = cpufeature_probe(stage);
>  	struct alt_entry *alt;
> -	u32 tmp;
>  
>  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return;
> @@ -313,15 +263,16 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> -		if (alt->errata_id >= CPUFEATURE_NUMBER) {
> -			WARN(1, "This feature id:%d is not in kernel cpufeature list",
> +		if (alt->errata_id >= RISCV_ISA_EXT_ID_MAX) {

Ok, so RISCV_ISA_EXT_ID_MAX is used here now, but we could use
RISCV_ISA_EXT_MAX directly instead.

> +			WARN(1, "This extension id:%d is not in ISA extension list",
                                                               ^ the
>  				alt->errata_id);
>  			continue;
>  		}
>  
> -		tmp = (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp)
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +		if (!test_bit(alt->errata_id, riscv_isa))

Maybe avoid using riscv_isa directly in case we want to move this function
out of cpufeature.c some day?

  if (!__riscv_isa_extension_available(NULL, alt->errata_id))


> +			continue;
> +
> +		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
>  	}
>  }
>  #endif
> -- 
> 2.37.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
