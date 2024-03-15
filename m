Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091ABC54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xl+I6pkruu2l/OAl+nOIUVwK0nBjD+bLL0UZfzPQQQ=; b=PCb7Zz/OVJkFul
	aksPU+NhGCy8vWy1Fw7myI8R9n/BoYzxRGBDYq4CX+R8H+GU+pFXBquNrK7zPIITxzOlAUcotPnZQ
	Fxzc319yUp4Zwi8I4Kb+m7VYS2MshpUpZc/MOtpTqlZjkQnDxiaicKjRkQvTDbk0t+sthP5k+S89o
	uGUa8boubh0ta1DBaOYCkzPW/7GLP4U2Gg6uOnoJcdQui2nXDLOouQaMnaYIvGoR0f7c+IvmNLH+h
	tHCDFofj8G/T/JNrq7aW75Jlljo02Sz1wMVGc9nCvJsN0AMrE3+GBjQ9pNPqgsWBXdAWmToXRLQ3v
	F2nFjvzFsa9mW8g8jSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlGkC-00000001qHp-1lPR;
	Fri, 15 Mar 2024 23:13:44 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlGk7-00000001qGd-1qol
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 23:13:43 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36678885723so16037955ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710544416; x=1711149216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ik0WgA0NYbsNgyUpEeTOF/vMyU1VZieyn2u6T3u4Jh4=;
        b=PE3YZYG7J7KTm+CVRdOKwclONVTb+quCCQNPaSepi6CoeREyXyuVqPd9eiSyiKKoYX
         BWwyzrzlDcukWuzTdqF6/aAsYITLHyZhL/7K/90bTkgomFQpx2GVpW2qBHNZ195VUBdM
         MAH9i2XBcX3Lm3MxmOGzHjUDC71hjXD+khr2iMy77wjiaZOcjIHzDUMb0KR1ZKpQcdyB
         q7ZAvHRJthXIRuHLjl+91kX7IWbPtD5IrObJc+2iWRtsL+60MVaeGe/J0TcEzLsvJdp1
         uER9rOX9qojfJNl/qQwIWqosUDy/ZA7Gh70WuzKO8yCzUSnflT7yXYM87Zk/mi9WWh3x
         VsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710544416; x=1711149216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ik0WgA0NYbsNgyUpEeTOF/vMyU1VZieyn2u6T3u4Jh4=;
        b=UMYvDmwSXaW41aSwHYPXrUkaH8RGk95odyMtDVtbPoZEVCItQhdFIgQdt6zzr7a8TV
         B1cz/25rIAsKBEMk4sv0CxzNa/LWu5Udkliex1dgficfcZfdc52NUP1AqPll4SkzZ3NN
         3BLjF9/m6xHTHUOfFlBcbN2+HSq3TZVX/p4dvo2SCtfF2ueJYs8WsgxGo5/9DaNf1d9L
         kku5NrD+8pN68OkZ4WPSZg3OmmK/6pzLgAX0h5vllIyxvohDLObhUiqtCYdQEcoDj2v/
         CPHzr5iBx4n1PY3fzrSpKABDU3mnHT32P+E5tK49Js0K4yVqDAbcBpK1X5bCWnG50xOq
         AnZQ==
X-Gm-Message-State: AOJu0Yz0RipHYhDjlJYDhaGUo12QjmbjwVWT8qx2Nsc83VhkNIVQbfnP
	K2CzumFRhuFrppGIQOv+KQ6/fxHNFACtDLEnrrMSn80MWbksV4Ot5EMgT8gPawM=
X-Google-Smtp-Source: AGHT+IGmWV+7gORxW1R384X6QiwEgLn1AxgnTY/2dOT9BBzXCSKh7z21EEUx/s44+ntxvgCJXtMhfQ==
X-Received: by 2002:a92:d952:0:b0:366:1f42:dc53 with SMTP id l18-20020a92d952000000b003661f42dc53mr6424138ilq.18.1710544416406;
        Fri, 15 Mar 2024 16:13:36 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id r5-20020a056638044500b004773027eee2sm964542jap.12.2024.03.15.16.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 16:13:36 -0700 (PDT)
Message-ID: <b662bb30-d5e2-4bf0-a156-ac38461fcea2@sifive.com>
Date: Fri, 15 Mar 2024 18:13:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] riscv: errata: Add StarFive alternative ports
Content-Language: en-US
To: Joshua Yeong <joshua.yeong@starfivetech.com>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240314061205.26143-3-joshua.yeong@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240314061205.26143-3-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_161339_568594_3F20CA95 
X-CRM114-Status: GOOD (  28.15  )
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
Cc: heiko@sntech.de, geert+renesas@glider.be, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, jeeheng.sia@starfivetech.com, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, leyfoon.tan@starfivetech.com, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, jszhang@kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, evan@rivosinc.com, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-03-14 1:12 AM, Joshua Yeong wrote:
> Add required ports of the Alternative scheme for
> StarFive CPU cores.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  arch/riscv/Kconfig.errata            | 21 ++++++
>  arch/riscv/errata/Makefile           |  1 +
>  arch/riscv/errata/starfive/Makefile  |  1 +
>  arch/riscv/errata/starfive/errata.c  | 95 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h |  3 +
>  arch/riscv/include/asm/errata_list.h |  5 ++
>  arch/riscv/kernel/alternative.c      |  5 ++
>  7 files changed, 131 insertions(+)
>  create mode 100644 arch/riscv/errata/starfive/Makefile
>  create mode 100644 arch/riscv/errata/starfive/errata.c
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 910ba8837add..1438dd09533b 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,6 +53,16 @@ config ERRATA_SIFIVE_CIP_1200
>  
>  	  If you don't know what to do here, say "Y".
>  
> +config ERRATA_STARFIVE
> +	bool "StarFive errata"
> +	depends on RISCV_ALTERNATIVE
> +	help
> +	  All StarFive errata Kconfig depend on this Kconfig. Disabling
> +	  this Kconfig will disable all StarFive errata. Please say "Y"
> +	  here if your platform uses StarFive CPU cores.
> +
> +	  Otherwise, please say "N" here to avoid unnecessary overhead.
> +
>  config ERRATA_STARFIVE_JH7100
>  	bool "StarFive JH7100 support"
>  	depends on ARCH_STARFIVE
> @@ -72,6 +82,17 @@ config ERRATA_STARFIVE_JH7100
>  	  Say "Y" if you want to support the BeagleV Starlight and/or
>  	  StarFive VisionFive V1 boards.
>  
> +config ERRATA_STARFIVE_CMO
> +	bool "Apply StarFive cache management errata"
> +	depends on ERRATA_STARFIVE && MMU
> +	select RISCV_DMA_NONCOHERENT
> +	default y
> +	help
> +	  This will apply the cache management errata to handle the
> +	  non-standard handling on non-coherent operations on StarFive cores.
> +
> +	  If you don't know what to do here, say "Y".
> +
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> index 8a2739485123..4713a686b9f7 100644
> --- a/arch/riscv/errata/Makefile
> +++ b/arch/riscv/errata/Makefile
> @@ -4,4 +4,5 @@ endif
>  
>  obj-$(CONFIG_ERRATA_ANDES) += andes/
>  obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> +obj-$(CONFIG_ERRATA_STARFIVE) += starfive/
>  obj-$(CONFIG_ERRATA_THEAD) += thead/
> diff --git a/arch/riscv/errata/starfive/Makefile b/arch/riscv/errata/starfive/Makefile
> new file mode 100644
> index 000000000000..2d644e19caef
> --- /dev/null
> +++ b/arch/riscv/errata/starfive/Makefile
> @@ -0,0 +1 @@
> +obj-y += errata.o
> diff --git a/arch/riscv/errata/starfive/errata.c b/arch/riscv/errata/starfive/errata.c
> new file mode 100644
> index 000000000000..3ee360cd5e81
> --- /dev/null
> +++ b/arch/riscv/errata/starfive/errata.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Erratas to be applied for StarFive CPU cores
> + *
> + * Copyright (C) 2024 Shanghai StarFive Technology Co., Ltd.
> + *
> + * Author: Joshua Yeong <joshua.yeong@starfivetech.com>
> + */
> +
> +#include <linux/memory.h>
> +#include <linux/module.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cacheflush.h>
> +#include <asm/errata_list.h>
> +#include <asm/patch.h>
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vendorid_list.h>
> +
> +#define STARFIVE_JH8100_DUBHE90_MARCHID	0x80000000DB000090UL
> +#define STARFIVE_JH8100_DUBHE90_MIMPID	0x0000000020230930UL
> +#define STARFIVE_JH8100_DUBHE80_MARCHID	0x80000000DB000080UL
> +#define STARFIVE_JH8100_DUBHE80_MIMPID	0x0000000020230831UL
> +#define STARFIVE_JH8100_L3		0x40
> +
> +static bool errata_probe_cmo(unsigned int stage, unsigned long arch_id,
> +			      unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_STARFIVE_CMO))
> +		return false;
> +
> +	if ((arch_id != STARFIVE_JH8100_DUBHE90_MARCHID ||
> +	    impid != STARFIVE_JH8100_DUBHE90_MIMPID) &&
> +	    (arch_id != STARFIVE_JH8100_DUBHE80_MARCHID ||
> +	    impid != STARFIVE_JH8100_DUBHE80_MIMPID))
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	riscv_cbom_block_size = STARFIVE_JH8100_L3;
> +	riscv_noncoherent_supported();

This patch doesn't add any alternatives, so you don't need to use the errata
framework. Please move these two lines to the cache driver -- see
drivers/cache/sifive_ccache.c -- and then you can drop this patch.

Regards,
Samuel

> +
> +	return true;
> +}
> +
> +static u32 starfive_errata_probe(unsigned int stage,
> +			      unsigned long archid, unsigned long impid)
> +{
> +	u32 cpu_req_errata = 0;
> +
> +	if (errata_probe_cmo(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_STARFIVE_CMO);
> +
> +	return cpu_req_errata;
> +}
> +
> +void __init_or_module starfive_errata_patch_func(struct alt_entry *begin,
> +					         struct alt_entry *end,
> +					         unsigned long archid,
> +						 unsigned long impid,
> +						 unsigned int stage)
> +{
> +	struct alt_entry *alt;
> +	u32 cpu_apply_errata = 0;
> +	u32 tmp;
> +	u32 cpu_req_errata;
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
> +	cpu_req_errata = starfive_errata_probe(stage, archid, impid);
> +
> +	for (alt = begin; alt < end; alt++) {
> +		if (alt->vendor_id != STARFIVE_VENDOR_ID)
> +			continue;
> +		if (alt->patch_id >= ERRATA_STARFIVE_NUMBER)
> +			continue;
> +
> +		tmp = (1U << alt->patch_id);
> +		if (cpu_req_errata & tmp) {
> +			mutex_lock(&text_mutex);
> +			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
> +					  alt->alt_len);
> +			mutex_unlock(&text_mutex);
> +			cpu_apply_errata |= tmp;
> +		}
> +	}
> +
> +	if (stage != RISCV_ALTERNATIVES_MODULE &&
> +	    cpu_apply_errata != cpu_req_errata) {
> +		pr_warn("WARNING: Missing StarFive errata patches! \n");
> +	    }
> +}
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 3c2b59b25017..8f5e6883db97 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -51,6 +51,9 @@ void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  			      unsigned long archid, unsigned long impid,
>  			      unsigned int stage);
> +void starfive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +			     unsigned long archid, unsigned long impid,
> +			     unsigned int stage);
>  void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  			     unsigned long archid, unsigned long impid,
>  			     unsigned int stage);
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index ea33288f8a25..1cd5ba3a1466 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -22,6 +22,11 @@
>  #define	ERRATA_SIFIVE_NUMBER 2
>  #endif
>  
> +#ifdef CONFIG_ERRATA_STARFIVE
> +#define	ERRATA_STARFIVE_CMO 0
> +#define	ERRATA_STARFIVE_NUMBER 1
> +#endif
> +
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_PBMT 0
>  #define	ERRATA_THEAD_PMU 1
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 319a1da0358b..deedd4b76472 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -52,6 +52,11 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
>  		cpu_mfr_info->patch_func = sifive_errata_patch_func;
>  		break;
>  #endif
> +#ifdef CONFIG_ERRATA_STARFIVE
> +	case STARFIVE_VENDOR_ID:
> +		cpu_mfr_info->patch_func = starfive_errata_patch_func;
> +		break;
> +#endif
>  #ifdef CONFIG_ERRATA_THEAD
>  	case THEAD_VENDOR_ID:
>  		cpu_mfr_info->patch_func = thead_errata_patch_func;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
