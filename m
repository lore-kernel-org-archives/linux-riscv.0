Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D90CCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSv6zqRpRmkkuWRyr3gKsNCdCWNC8bZVCrMdKHAHsbs=; b=fQH1kOZFlMF71P
	fBfN4DmSxuvFLpN4GNUrWaNayrW00nfziNjmI8P79ZwH/f3IsGuaVKbTl2UYYxdW5slAVErCDkvBU
	uA0KOil5DdMYV4rZFilor1OrY6QdpB5EyjkRsbjZTdCbtrYOEW3zgcIRcD9Li+5CVzLSQZWGa2qU1
	/1WiPcgALqTKwgv51lE/cHzgJEN6T14ELJ3iWMJGgzOGFdOF3QAVopkhGPHYS1CmvSAq7MdAuluEq
	UHqCeeNTpXtVYUo5QJTlxfYqd/10sDPeIOpmm1tTL61F+27WwjXA0YBeF9W4heN5Rcf2h+BLv0wj1
	l2FgI60p87UMZ7lr4Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjQt-00000005WQI-2OJf;
	Fri, 31 Oct 2025 07:20:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjQr-00000005WPk-1bpL
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 07:20:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so1229448f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761895219; x=1762500019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6jwEFLJ69MPfiwc21mJzxfsviakHrUqtdfEeBD68fU=;
        b=JvN7TbK+cKgIUG9ugFNPEa7J2MzG4aG+mk9G5RduazHClaUSUp/bR3Kq7A5QOtfHYM
         HR0BA7PSjQ8CcqEzrHOtWzUMNO9KGb/MiKQQfe+Nwd5aCfdO2nkHrR4FUIgy02szas9x
         GkWoZALfdfnmgXoFP4LL2ZWcgbP8NrFUvxvbxkbCoeoHRhQ+uXe/zCSUU50hZYC5EyBo
         MLd/2wBkHDByOgOx4pNLAKBvS8hnFTZ5E0ZcuOCQs2Zq9H87EhCSpTEH9NMjizwy3DvS
         8pnzxfwt8uTH31RT3GjXLFwt0aVQiYtB70OiDuonWNvuyedwVRLsORRRQ2n8FKwzjAgs
         EPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761895219; x=1762500019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6jwEFLJ69MPfiwc21mJzxfsviakHrUqtdfEeBD68fU=;
        b=JckZ8h1boeUuDiabc5KT5rDLTfMzswbGJ6kayKpSa5zFK/gE94cMiG7fRu2ix+whBt
         wffCHMvIkM0/pr1M16V+7nXlmo5CG5RtMzj4gAkbL5zm6SnGHw3ChYd3Tr2h6zXHOfNN
         WFbBMjsmErFvRIDqRpKDa04O57O1fBTsn5JQUGGhThnmY7I8q7XMn0OvIe0Yvth0Ll4s
         4pJywps3NgIzTxuA2aaMO/p4Sn3RH8lhSmtOcqkpAaBg+LP8ZmNQcXn5HCx2V6xTBons
         FPZQNZgYND8NIstzPDC9xbxX7LbysjRrHGVqyCKPTrkNe9sL/QEc3qwGIYCmp7xzdfe5
         0uQA==
X-Forwarded-Encrypted: i=1; AJvYcCVkUIq4G9GY2A6L4Tb4WJtoZdvrxUSIWd7LUxftH56EjhkZN6tGGz6k8kfs34Q8uM95SqmAfI2loixeKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKGLGJiZ5fslXrV2pdfiXgOyoXKooY/z+gazXvIv8/8hkH37GU
	qG8wF44rzdsS1cVBdC3AEWBCOWCHxBhubdDowC81R7B9Iobnx1mMc8H3sjK3TZkp56U=
X-Gm-Gg: ASbGncuNYKtkRrYzWABtjpP5wP+YA9LC+YbCXMylyMD3FqrrDwRRnFW8/FYIJkIEigE
	gPHNGvurJXjW3ZClSberhdI4kwqfI3c8G/pyzOswh+X9aJUqkIEJLUjQIHxsExyz/5UH9nVjt/U
	V27hBsLJU0RnqPbyr2vd3A9zS3bPKOumxsDMGEyi/f4LMcpjI9Jnr8vjiRI8BvxcsPcJsfP0GZu
	k6Ne9W1CbWb9iefg4SeULxMK4GN5oM5FLJGS/0jcA41aftNb9vZU0YA+Nv+n7OsmwI8hJQQvu+m
	3+8+E14WL6IaUiUO3yE4KtarOkQuWNWDTDSRNZsGUCIfYMuwR0LjFbxkvtQaKqBSdfM2aY5lm3c
	ZVsm3E09lm+KFeQiSlLCg/bDmfnspT8pkRbCG1uva3LdVSCxACw6FmZIxLmcuiDOQYa0d0swbHW
	v3NXyOqVRZC5iHzbzr7g==
X-Google-Smtp-Source: AGHT+IESPn1B27UDKqe6BRuoLyrklQLHzvgJJAtmUoGoNQEqfAcuNcYhohI3pcW3sVc+wl9uzkERfw==
X-Received: by 2002:a05:6000:2908:b0:3e7:5f26:f1e5 with SMTP id ffacd0b85a97d-429bd680e96mr1864170f8f.23.1761895219281;
        Fri, 31 Oct 2025 00:20:19 -0700 (PDT)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f192fsm1969656f8f.38.2025.10.31.00.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:20:18 -0700 (PDT)
Message-ID: <a996e76e-8201-4b72-b4fa-0ea9ac62e6b1@tuxon.dev>
Date: Fri, 31 Oct 2025 09:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] reset: mpfs: add non-auxiliary bus probing
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
 <20251029-macarena-neglector-318431fec367@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251029-macarena-neglector-318431fec367@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_002021_587077_D234CF3A 
X-CRM114-Status: GOOD (  27.93  )
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

Hi, Conor,

On 10/29/25 18:11, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v6:
> - depend on MFD_SYSCON
> - return regmap_update_bits() result directly instead of an additional
>    return 0
> 
> v4:
> - Only use driver specific lock for non-regmap writes
> 
> v2:
> - Implement the request to use regmap_update_bits(). I found that I then
>    hated the read/write helpers since they were just bloat, so I ripped
>    them out. I replaced the regular spin_lock_irqsave() stuff with a
>    guard(spinlock_irqsave), since that's a simpler way of handling the two
>    different paths through such a trivial pair of functions.
> ---
>   drivers/reset/Kconfig      |  1 +
>   drivers/reset/reset-mpfs.c | 79 ++++++++++++++++++++++++++++++--------
>   2 files changed, 63 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..0ec4b7cd08d6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -200,6 +200,7 @@ config RESET_PISTACHIO
>   config RESET_POLARFIRE_SOC
>   	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
>   	depends on MCHP_CLK_MPFS
> +	depends on MFD_SYSCON
>   	select AUXILIARY_BUS
>   	default MCHP_CLK_MPFS
>   	help
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index f6fa10e03ea8..25de7df55301 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>    *
>    */
>   #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>   #include <linux/delay.h>
>   #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> -#include <linux/slab.h>
> +#include <linux/regmap.h>
>   #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>   #include <dt-bindings/clock/microchip,mpfs-clock.h>
>   #include <soc/microchip/mpfs.h>
>   
> @@ -27,11 +30,14 @@
>   #define MPFS_SLEEP_MIN_US	100
>   #define MPFS_SLEEP_MAX_US	200
>   
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>   /* block concurrent access to the soft reset register */
>   static DEFINE_SPINLOCK(mpfs_reset_lock);
>   
>   struct mpfs_reset {
>   	void __iomem *base;
> +	struct regmap *regmap;
>   	struct reset_controller_dev rcdev;
>   };
>   
> @@ -46,41 +52,46 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
>   static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>   {
>   	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>   	u32 reg;
>   
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap)
> +		return regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>   
>   	reg = readl(rst->base);
>   	reg |= BIT(id);
>   	writel(reg, rst->base);
>   
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>   	return 0;
>   }
>   
>   static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>   {
>   	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>   	u32 reg;
>   
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap)
> +		return regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>   
>   	reg = readl(rst->base);
>   	reg &= ~BIT(id);
>   	writel(reg, rst->base);
>   
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>   	return 0;
>   }
>   
>   static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
>   {
>   	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	u32 reg = readl(rst->base);
> +	u32 reg;
> +
> +	if (rst->regmap)
> +		regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
> +	else
> +		reg = readl(rst->base);
>   
>   	/*
>   	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
> @@ -130,11 +141,45 @@ static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
>   	return index - MPFS_PERIPH_OFFSET;
>   }
>   
> -static int mpfs_reset_probe(struct auxiliary_device *adev,
> -			    const struct auxiliary_device_id *id)
> +static int mpfs_reset_mfd_probe(struct platform_device *pdev)
>   {
> -	struct device *dev = &adev->dev;
>   	struct reset_controller_dev *rcdev;
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_reset *rst;
> +
> +	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rcdev = &rst->rcdev;
> +	rcdev->dev = dev;
> +	rcdev->ops = &mpfs_reset_ops;
> +
> +	rcdev->of_node = pdev->dev.parent->of_node;
> +	rcdev->of_reset_n_cells = 1;
> +	rcdev->of_xlate = mpfs_reset_xlate;
> +	rcdev->nr_resets = MPFS_NUM_RESETS;
> +
> +	rst->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(rst->regmap))
> +		dev_err_probe(dev, PTR_ERR(rst->regmap), "Failed to find syscon regmap\n");

Do you want to continue registering the reset controller here? rcdev->base is 
NULL, thus the reset controller ops will fail, if I'm not wrong.

Thank you,
Claudiu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
