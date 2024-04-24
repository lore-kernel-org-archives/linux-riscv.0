Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C077C07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C9EemoalrmTvrYv286h6tBZ4FqUI61v+1uz/bPHQRrU=; b=uS2ez6jcMSvidOcDsJbhfhObm7
	QkQ7UdK6Q6Bc3zDQZUAIvqtqgw//t4k/pGHji9d5tmnnmEvUIKXyUb1oxk2OP6io5D8RIz85cbeX+
	EDMgaNLL/w8Totn8QS7zl5MlL/RfXCbwC1HwbHfyopny8QBobaPbP9way3nY1nrl825vAX7SRuMHg
	L6fBQBWruduX22XQEn7fnUXZKVWdWJXTLXQbObcmsF/Lk3HoKX2x1CfGnpxMjrZSmA1997oPV+UEy
	Qvf5FDJ54qEPDElf43hSWuF6kLs8phEYp4aFcYk2TCKvHPL0qVFbaPMOyqxGF836MpB29MtXAxFz+
	IaFTQLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZp7-00000003glL-3rdS;
	Wed, 24 Apr 2024 10:25:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZp0-00000003gg7-0e2z
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:25:55 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2C6A8411E1
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 10:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713954347;
	bh=ff6zudAy01M5cxJpcncnLJEP4pep/1TFdKyhsB47YJk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LCZqNXDsMi2t1xzInfupvZrgHBa6J7uMoPQVrgcaIuYos3bYJNKYv3UxohxPsgHM/
	 GpApHx0kSCZ9LcTthBJa1KT/VnjDTl00W4brUobiiuPaRcE94bsZaqEcRio6JmxeWj
	 ifLYQBr3FWTC+RObisILmzdTD1l8L2shh9eP0MKjkhkNdWL5+N2E8ZuE96aOOX8KCQ
	 QSYRzHO5mdbqWSgf9RnjO1vEzU1jVD6BL1m5bj+aLzWH/f8q2umFMe3yj3ZDExmUfn
	 OshNBBX3gK1h0DliZucXGYYIsimP4KEaBOkhj3oAMVzKAQs080wJLySPm5egqzNkTn
	 eq9zJp/82+PCw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-439755d2ca9so59960191cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 03:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954344; x=1714559144;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ff6zudAy01M5cxJpcncnLJEP4pep/1TFdKyhsB47YJk=;
        b=ja5b25shkAXEAUsA2XK3jmuNPlVfRXyIhGukV7F81pQB4fYxR56RX4fgkWpkTYezED
         KeyiGDpMZRuyM+bkPPkk7QqsxZzRba6Xy48+U1LZgTTRmfY+1op1y7Lpk/GD3N7M0LkP
         Yk0CeYB8ReD7Bbrp6KPZFr+rS5hjRzquLeY4X0KjPJt9fIeo+2qC74722n8AiQz/D2Kc
         2J2IFWUB1FRnYwjJdeSSLGko0oNJQqmXyvaA5+5KgMjVcDU3siOtLNBJYoMHbCmIwpag
         WUJuAL3czih+2T+jLrxJrblpF/WFTiJZmlad1hO0IfqKUcMMj0IrpyjOkCWTDRhk/dGS
         lCMg==
X-Forwarded-Encrypted: i=1; AJvYcCX1I6VLCZy1bJfR63heyNlNHyBPLh+ENSpQLy89K2gNjFoDtdbNZpCt6rLqmhk7p/RXBRvNpZJJoNiTs8WT6K/AfDqWtOwTJj9XX3vG0fKu
X-Gm-Message-State: AOJu0YyTbNhwJPQOullZRHcJheoDPt9Jkx8FPWio/tYdE1leIVIEfDGb
	kXPP7QAyP8yptAPrsr2eCEAxfz06xswuw7L/G1vwPJkbUYwuq5s6EEC4aikVbsL6TKBBryjMVy4
	4AClgY8RkeegyDAl1Qb002Os1eXNYG35gbOWtsZz1hziUmEWKGk6fXrEX3x5rboQ76x0gQ9xn7h
	adbQDsEVpwvg/fmVkd6bQ0QkI8l5CA1uzaOGUEyfN7pgIE4BstkceXt4E54aEybwlZ
X-Received: by 2002:a05:622a:547:b0:43a:160e:4f75 with SMTP id m7-20020a05622a054700b0043a160e4f75mr1866259qtx.53.1713954344252;
        Wed, 24 Apr 2024 03:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb9uxWOtvTpAqK5vA0FiOdPQX0wxDnCfd2amELYDZXgGZwWLVW6YuKcYyLRJYa9TCh0P6bVet1kl2aZ9Yq8iE=
X-Received: by 2002:a05:622a:547:b0:43a:160e:4f75 with SMTP id
 m7-20020a05622a054700b0043a160e4f75mr1866245qtx.53.1713954343986; Wed, 24 Apr
 2024 03:25:43 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 06:25:43 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240424075856.145850-2-joshua.yeong@starfivetech.com>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com> <20240424075856.145850-2-joshua.yeong@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 06:25:43 -0400
Message-ID: <CAJM55Z-C7XkFo4STk3rdLG4kvPfed-AfrHB1QJ-Tzt1LDoKw9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] cache: Add StarFive StarLink cache management for
 StarFive JH8100
To: Joshua Yeong <joshua.yeong@starfivetech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, conor@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_032550_775625_D29445BB 
X-CRM114-Status: GOOD (  27.87  )
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

Joshua Yeong wrote:
> Add StarFive Starlink cache management driver for
> JH8100 SoC. This driver enables RISC-V
> non-standard cache operation on JH8100 that does
> not support Zicbom extension instructions.
>
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  drivers/cache/Kconfig                   |   9 ++
>  drivers/cache/Makefile                  |   5 +-
>  drivers/cache/starfive_starlink_cache.c | 135 ++++++++++++++++++++++++
>  3 files changed, 147 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/cache/starfive_starlink_cache.c
>
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 9345ce4976d7..9181cd391f53 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -14,4 +14,13 @@ config SIFIVE_CCACHE
>  	help
>  	  Support for the composable cache controller on SiFive platforms.
>
> +config STARFIVE_STARLINK_CACHE
> +	bool "StarFive StarLink Cache controller"
> +	depends on RISCV
> +	depends on ARCH_STARFIVE
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	help
> +	  Support for the StarLink cache controller on StarFive platforms.

This is a bit misleading. The JH71x0s don't have this. It's only on the JH8100
so far, and hopefully later SoCs will just implement RISC-V standards for this.
So maybe something like

"Support for the StarLink cache controller on the StarFive JH8100 SoC."

> +
>  endmenu
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index 7657cff3bd6c..55c5e851034d 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -obj-$(CONFIG_AX45MP_L2_CACHE)	+= ax45mp_cache.o
> -obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
> +obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
> +obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
> +obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
> diff --git a/drivers/cache/starfive_starlink_cache.c b/drivers/cache/starfive_starlink_cache.c
> new file mode 100644
> index 000000000000..2f1fa6a923ee
> --- /dev/null
> +++ b/drivers/cache/starfive_starlink_cache.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cache Management Operations for StarFive's Starlink cache controller
> + *
> + * Copyright (C) 2024 Shanghai StarFive Technology Co., Ltd.
> + *
> + * Author: Joshua Yeong <joshua.yeong@starfivetech.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cacheflush.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_address.h>
> +
> +#include <asm/dma-noncoherent.h>
> +
> +#define STARLINK_CACHE_FLUSH_START_ADDR			0x0
> +#define STARLINK_CACHE_FLUSH_END_ADDR			0x8
> +#define STARLINK_CACHE_FLUSH_CTL			0x10
> +#define STARLINK_CACHE_ALIGN				0x40
> +
> +#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39, 0)
> +#define STARLINK_CACHE_FLUSH_CTL_MODE_MASK		GENMASK(2, 1)
> +#define STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK		BIT(0)
> +
> +#define STARLINK_CACHE_FLUSH_CTL_CLEAN_INVALIDATE	0
> +#define STARLINK_CACHE_FLUSH_CTL_MAKE_INVALIDATE	1
> +#define STARLINK_CACHE_FLUSH_CTL_CLEAN_SHARED		2
> +#define STARLINK_CACHE_FLUSH_POLL_DELAY_US		1
> +#define STARLINK_CACHE_FLUSH_TIMEOUT_US			5000000
> +
> +struct starlink_cache_priv {
> +	void __iomem *base_addr;
> +};
> +
> +static struct starlink_cache_priv starlink_cache_priv;

This could just be

static void __iomem *starlink_cache_base;

> +
> +static void starlink_cache_flush_complete(void)
> +{
> +	volatile void __iomem *ctl = starlink_cache_priv.base_addr +
> +				     STARLINK_CACHE_FLUSH_CTL;
> +	u64 v;
> +	int ret;
> +
> +	ret = readq_poll_timeout_atomic(ctl, v, !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK),
> +					STARLINK_CACHE_FLUSH_POLL_DELAY_US,
> +					STARLINK_CACHE_FLUSH_TIMEOUT_US);
> +	if (ret)
> +		WARN(1, "StarFive Starlink cache flush operation timeout\n");
> +}
> +
> +static void starlink_cache_dma_cache_wback(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
> +			  STARLINK_CACHE_FLUSH_CTL_CLEAN_SHARED),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_CTL);
> +
> +	starlink_cache_flush_complete();
> +}
> +
> +static void starlink_cache_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
> +			  STARLINK_CACHE_FLUSH_CTL_MAKE_INVALIDATE),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_CTL);
> +
> +	starlink_cache_flush_complete();
> +}
> +
> +static void starlink_cache_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
> +{
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_START_ADDR);
> +	writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_END_ADDR);
> +
> +	mb();
> +	writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
> +			  STARLINK_CACHE_FLUSH_CTL_CLEAN_INVALIDATE),
> +	       starlink_cache_priv.base_addr + STARLINK_CACHE_FLUSH_CTL);
> +
> +	starlink_cache_flush_complete();
> +}
> +
> +static const struct riscv_nonstd_cache_ops starlink_cache_ops = {
> +	.wback = &starlink_cache_dma_cache_wback,
> +	.inv = &starlink_cache_dma_cache_invalidate,
> +	.wback_inv = &starlink_cache_dma_cache_wback_inv,
> +};
> +
> +static const struct of_device_id starlink_cache_ids[] = {
> +	{ .compatible = "starfive,jh8100-starlink-cache" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init starlink_cache_init(void)
> +{
> +	struct device_node *np;
> +	u32 block_size = 0;

You return early if of_property_read_u32() fails, so this doesn't need to be
initialized.

> +	int ret;
> +
> +	np = of_find_matching_node(NULL, starlink_cache_ids);
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
> +	ret = of_property_read_u32(np, "cache-block-size", &block_size);
> +	if (ret)
> +		return ret;
> +
> +	if (block_size % STARLINK_CACHE_ALIGN)
> +		return -EINVAL;
> +
> +	starlink_cache_priv.base_addr = of_iomap(np, 0);
> +	if (!starlink_cache_priv.base_addr)
> +		return -ENOMEM;
> +
> +	riscv_cbom_block_size = block_size;
> +	riscv_noncoherent_supported();
> +	riscv_noncoherent_register_cache_ops(&starlink_cache_ops);
> +
> +	return 0;
> +}
> +early_initcall(starlink_cache_init);

The sifive driver gets away with arch_initcall() here. Any particular reason
you need this earlier?

> --
> 2.25.1
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
