Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C5C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciugfkiWpYHITDQB451gaW6+XFRbgZ/wIp7fvvu7aGY=; b=Kei/IUf68L3zqH
	22u9yYnuJgKMKjDc7nbE8raxA9Prf4kKSfGBelfdhuVmrtT+yjV0u/s1w+fsH03v/rHVG4C0d9a+/
	aQXude3it1nOAdRSFtBb+atM+piyrGAN8fuMacwSlnB7hnaCWQBA6i8gL3Pui7qgqd47C5x7L2taw
	wdms/TaQxMqo6VFFmH2McgGz7pdFTzoOeli+KSsh0JvsZmmvQAHGFvgbkcZ8S4uXyIaqj8YnYnfWN
	A6dHZbWDcLQA4L3ZsmSlgafaPNCTBtI+sIS2EByfHebRdkfOWDOkgQtfVs/lF1INroPDDe9nneOfO
	VEWgqH1WlHP3trHK1LmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlH3w-00000001sF7-1Mex;
	Fri, 15 Mar 2024 23:34:08 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlH3p-00000001sDw-20l9
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 23:34:05 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3667c7a4600so14090675ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710545640; x=1711150440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LDRWf6+oq71bOQJEav3fd6gx7d0AmWvkWYm+qlF7/g=;
        b=ApSyaqIqSWXhWX3clSx78gc1yJlogiMJ1btJpNPvHhQHakH36Cq7EpOcAzYw4cbGnF
         wQ8EOEhqsNEiNz60OWbPNiqo3o/528zruoBqkx4nn0mRCX/8RleQSIVhCDLBtlaZJbem
         U/xlptLwHMr8mXGd/QOBHbEp0ACdvlzfo/kUKm1Nc8qVH8hIGgur2p/PLSQgsNmWPnOU
         6/U64y/Eh/i2VUL1W3+u9JV06vtmSq5ZDyvlrvp53ZU9DV7HJRpvvWONQuGd1K6fzEKx
         LvUFmMc/zgces861H8BUAuugmcGUzzt3SFjRU4ro9iqJXf1DHcX6CKC9MTyb2YWLD1be
         b1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710545640; x=1711150440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LDRWf6+oq71bOQJEav3fd6gx7d0AmWvkWYm+qlF7/g=;
        b=t//P1CZUs79dCXklZECpaPKp+ZSo3MSYCnjrUbzcfyr4ybn9PO1bXPoID+uv2joFPS
         SAgPhUH66vZBqsnquoEC6fdKLxAuyBSUG/p7bWb8m/NqbB9LPsTtG8BaCEgE+V0Upq31
         RcxGFm3IeRje9HcVilc+yIjg3waErxQXKsN2nIgXyE16NfxJBwD9R/lYYu82pPeRILVo
         neZi3K6YiP4fUxzuz4mr/9gwGZimQN1FwfqdqD9sIkyYV//KitprZvekFDVM6Irs3gCp
         3mntoJPzy7/uFRS0LhOubVNhP6EZ2pu8rJcM/LGy589w5yB0aI/vzH38aw+bWxDoyjhV
         qv/A==
X-Gm-Message-State: AOJu0YzGx6yCzvL/a1CsLrPGwyWfWK7X0R64HkKGI6R0ky5AIvQX/mKx
	OMRNje8DJ2Xioss/eTSPCUeMDMGEC7csoEnapkGack+UbYxXC4fEKtPWbdZEbkr1AB+RrpfKWhV
	1
X-Google-Smtp-Source: AGHT+IFwUcKQpE2li7mYbiKQQgp2djT1SRd++rglhX2dFpusLZBra2sOJKj9e4kDB2X9VfBh2zoICg==
X-Received: by 2002:a92:d68d:0:b0:366:ab6f:f63 with SMTP id p13-20020a92d68d000000b00366ab6f0f63mr716523iln.3.1710545640025;
        Fri, 15 Mar 2024 16:34:00 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id bf16-20020a056e02309000b0036662e12737sm1013540ilb.44.2024.03.15.16.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 16:33:59 -0700 (PDT)
Message-ID: <d8052cb1-d875-4d76-90ab-70b9944a0980@sifive.com>
Date: Fri, 15 Mar 2024 18:33:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] cache: Add StarLink-500 cache management for StarFive
 JH8100 RISC-V core
Content-Language: en-US
To: Joshua Yeong <joshua.yeong@starfivetech.com>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240314061205.26143-4-joshua.yeong@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240314061205.26143-4-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_163401_586072_DF368FF4 
X-CRM114-Status: GOOD (  24.27  )
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
> Add software workaround for StarFive StarLink-500
> on JH8100 SoC for CMO extension instructions.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  drivers/cache/Kconfig             |   9 ++
>  drivers/cache/Makefile            |   1 +
>  drivers/cache/starlink500_cache.c | 137 ++++++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 drivers/cache/starlink500_cache.c
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 9345ce4976d7..e215379f6a73 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -14,4 +14,13 @@ config SIFIVE_CCACHE
>  	help
>  	  Support for the composable cache controller on SiFive platforms.
>  
> +config STARLINK_500_CACHE
> +	bool "StarLink-500 Cache controller"
> +	depends on RISCV_DMA_NONCOHERENT
> +	depends on ERRATA_STARFIVE
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	default y
> +	help
> +	  Support for the StarLink-500 cache controller on StarFive platforms.
> +
>  endmenu
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index 7657cff3bd6c..c515eb5714ea 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-$(CONFIG_AX45MP_L2_CACHE)	+= ax45mp_cache.o
>  obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
> +obj-$(CONFIG_STARLINK_500_CACHE) += starlink500_cache.o
> diff --git a/drivers/cache/starlink500_cache.c b/drivers/cache/starlink500_cache.c
> new file mode 100644
> index 000000000000..eaf8303cb086
> --- /dev/null
> +++ b/drivers/cache/starlink500_cache.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Non-coherent cache functions for StarFive's StarLink-500 cache controller
> + *
> + * Copyright (C) 2024 Shanghai StarFive Technology Co., Ltd.
> + *
> + * Author: Joshua Yeong <joshua.yeong@starfivetech.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/delay.h>
> +#include <linux/dma-direction.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/processor.h>
> +
> +#include <asm/dma-noncoherent.h>
> +
> +#define STARFIVE_SL500_CMO_FLUSH_START_ADDR		0x0
> +#define STARFIVE_SL500_CMO_FLUSH_END_ADDR		0x8
> +#define STARFIVE_SL500_CMO_FLUSH_CTL			0x10
> +#define STARFIVE_SL500_CMO_CACHE_ALIGN			0x40
> +
> +#define STARFIVE_SL500_ADDRESS_RANGE_MASK		GENMASK(39, 0)
> +#define STARFIVE_SL500_FLUSH_CTL_MODE_MASK		GENMASK(2, 1)
> +#define STARFIVE_SL500_FLUSH_CTL_ENABLE_MASK		BIT(0)
> +
> +#define STARFIVE_SL500_FLUSH_CTL_CLEAN_INVALIDATE	0
> +#define STARFIVE_SL500_FLUSH_CTL_MAKE_INVALIDATE	1
> +#define STARFIVE_SL500_FLUSH_CTL_CLEAN_SHARED		2
> +
> +struct starfive_sl500_cache_priv {
> +	void __iomem *base_addr;
> +};
> +
> +static struct starfive_sl500_cache_priv starfive_sl500_cache_priv;
> +
> +static void starfive_sl500_cmo_flush_complete(void)
> +{
> +	ktime_t timeout;
> +
> +	volatile void __iomem *_ctl = starfive_sl500_cache_priv.base_addr +
> +                                      STARFIVE_SL500_CMO_FLUSH_CTL;
> +	timeout = ktime_add_ms(ktime_get(), 5000);
> +
> +	do {
> +		if(!(ioread64(_ctl) & STARFIVE_SL500_FLUSH_CTL_ENABLE_MASK))
> +			return;
> +		msleep(50);

These callbacks can be called from an atomic context, so you cannot use msleep()
here.

> +	} while (ktime_before(ktime_get(), timeout));

I suggest using one of the helpers from linux/iopoll.h, e.g. readq_poll_timeout().

> +
> +	pr_err("StarFive CMO operation timeout\n");
> +	dump_stack();

WARN or WARN_ON would be idiomatic here.

> +}
> +
> +void starfive_sl500_dma_cache_wback(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
> +	       STARFIVE_SL500_FLUSH_CTL_CLEAN_SHARED),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
> +
> +	starfive_sl500_cmo_flush_complete();
> +}
> +
> +void starfive_sl500_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
> +	       STARFIVE_SL500_FLUSH_CTL_MAKE_INVALIDATE),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
> +
> +	starfive_sl500_cmo_flush_complete();
> +}
> +
> +void starfive_sl500_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
> +	       STARFIVE_SL500_FLUSH_CTL_CLEAN_INVALIDATE),
> +	       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
> +
> +	starfive_sl500_cmo_flush_complete();
> +}
> +
> +static const struct riscv_nonstd_cache_ops starfive_sl500_cmo_ops = {
> +	.wback = &starfive_sl500_dma_cache_wback,
> +	.inv = &starfive_sl500_dma_cache_invalidate,
> +	.wback_inv = &starfive_sl500_dma_cache_wback_inv,
> +};
> +
> +static const struct of_device_id starfive_sl500_cache_ids[] = {
> +	{ .compatible = "starfive,starlink-500-cache" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init starfive_sl500_cache_init(void)
> +{
> +	struct device_node *np;
> +	struct resource res;
> +	int ret;
> +
> +	np = of_find_matching_node(NULL, starfive_sl500_cache_ids);
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret)
> +		return ret;
> +
> +	starfive_sl500_cache_priv.base_addr = ioremap(res.start, resource_size(&res));
> +	if (!starfive_sl500_cache_priv.base_addr)
> +		return -ENOMEM;

of_address_to_resource() + ioremap() simplifies to of_iomap().

Regards,
Samuel

> +
> +	riscv_noncoherent_register_cache_ops(&starfive_sl500_cmo_ops);
> +
> +	return 0;
> +}
> +early_initcall(starfive_sl500_cache_init);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
