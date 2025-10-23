Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E9DCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 04:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkBAmYf6yPmRo9CczIIVNLMnrvngiTNyOGwjRaTBhSU=; b=aU/1SxPC0ztGD3
	YCK7rod4xPJYX73Bf58UPYzugATWyj0fLPgzWsWzqkvF5rclmfou8ACKNhU0kknMPDKTfGOhjJ/+e
	W35L9W2KSHeKLKtTAh0MCkhvbmLr/17UNWpU7n8mWUgY3iI15eamsaYv07GFCZn4KiR+0aE4OiRN+
	OrW+EeoU2bf9J12q68U03PwyGvvGf7XGpH+ugYhppxXMF0XzJBoONcnskXIancvlMrLM+llIgeiI0
	XtVIUJk425kmCdWASP65R+qiHHsK5NXofEWln7GkYb/EEoDJRWbWWy8pEKI+8peltnzOarG1H4bvK
	nTemiXEgMFFDBuTsCiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmbH-000000050L5-3YD2;
	Thu, 23 Oct 2025 04:06:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmbE-000000050KJ-1FP4
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 04:06:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-421851bcb25so169715f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761192410; x=1761797210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9LmGzf8lZ8AA4pnml32k/4kEpS62XT9jc9VmDFNvb0=;
        b=L/Zcgzze0/m+yWN6ttBDDLEt2VoUDqZpggom36rSc9VYNwzKJsvd3tDmMNUHhcDAI+
         fet0e2J1WTgA5GZ7XUqFdJSYolfzuNklEGUdu/JUs6RSWfEhhVML6j/WkdepBMRy/4pt
         +sTY09myf3DjjubhporzOA6o3Q8catp0yPsxCqxMvjoLMVRPWpHHRsgrJSG8zmW53y6R
         z13bT3HISN+H5Dans+1qUb/NTA/Jy6/XY0ZAfUXjNANntJeiaJDAypSj5Cp4IfWMnaEc
         fYHN6TgqCIBeiXHTqaXwLiWLe5UOdZKsMz9fJZiN2bVsBlI3xvoeJ/bLZSnDCVpei+L5
         7NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192410; x=1761797210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9LmGzf8lZ8AA4pnml32k/4kEpS62XT9jc9VmDFNvb0=;
        b=PgV/yFbi9G85ohZ9girzyVDgLQlbKDoRkDAG9LWxMa0WXpNnLNPio0uqjxYRCc4w2h
         jo5xuJINzrgprU0pKyWngTsmVAOMCW0TLkqKzPel/lIrNQ9UXsta6mh0hrb3h09U2dj5
         sHQ8CTseADOFrvzVBmt4TTVID2x7x3RTCAyO5Sc1SYpY6j5Ipu5uHI17k27bsdjrZck3
         wPhgjKHHhRhjFrYokv92jd7wd9pB2yggIF+WVs3j1R7Ges5f+zQR5/jhhZwgzC5Zjoq9
         8D2r9zuUFG9N/EehwsqEnk4FAr9nM7cfjOyyvga92UGBoJ6uZeiEfpG4j0V5dVjBqdjT
         c67A==
X-Forwarded-Encrypted: i=1; AJvYcCUL73D78WTh+Xc4/CQ54P7ccYwlKjUshgDQN/dfpHMg/7euLgqoIDDW2o6Q5YH6ytJEM3nHXKOuAoqSOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNSBwR7NIYAeXgXpcHPNNllp+kg16lz/7K0x9DIbJ7KVVI94JA
	u9gXrguVCEgTmPhcDVHlKNOMMR+Y4okto5pe52miZ0+NJ7Ji3WbCi7USLKFYiRTFYRQ=
X-Gm-Gg: ASbGncsQLt2Xan7Oxzdu3cVrZ2xEwnRstNFhR0zlXw7h8Y/PUEDdi9XKcmdW3KL6U7u
	t5j6pO9fiO9btkjs3TYBI7bAjkjuqAmN1R5YoVaz+3d2D/RE+lqIuuolsgAz7wONJs1VE8QKE00
	tDNDMsaRp9TqSzToFpsPO5Luh2v3yLmDBF53ZB8HjiVFiRAVudGJZ3WSZzRMKRGkz8YdviT35N0
	J0rW3jxvDf9VCwzMppw2wBYxPKFcmTDegeTweK6EGLMK99cij1Ac6xKeqSsQnPKHBye6TYKJpr2
	GplIWW2o6QyFDWQqrvlD8z9zygYNORZmqjHSJyTGGtpRg2JeMMncexxMdtlLtpaxHobiMowSUYW
	8/Xxp3JQ2gPk4lToPP/MgxQw5O0MvuznAse1EpZKeb7GP7gZz+fkhTW7XA0vNvTZdTxtdRC9/9u
	YoJwWQmvFp
X-Google-Smtp-Source: AGHT+IHLzTiBpHfQjhvlWTJj5VKysMH/PyHRD3J5uwhQAkstbuvehGbVgVMmpZfM+iZPn2D+iNdjkA==
X-Received: by 2002:a05:6000:3113:b0:427:7ad:466f with SMTP id ffacd0b85a97d-42707ad4680mr15906098f8f.39.1761192410406;
        Wed, 22 Oct 2025 21:06:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccc60sm1657768f8f.34.2025.10.22.21.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:06:49 -0700 (PDT)
Message-ID: <60544429-3eeb-41df-b42c-613da651b4a1@tuxon.dev>
Date: Thu, 23 Oct 2025 07:06:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] reset: mpfs: add non-auxiliary bus probing
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
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-crane-utilize-cff9298291a4@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251013-crane-utilize-cff9298291a4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_210652_845691_A24978E5 
X-CRM114-Status: GOOD (  28.89  )
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

Hi, Conor,

On 10/13/25 20:45, Conor Dooley wrote:
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
> v4:
> - Only use driver specific lock for non-regmap writes
> 
> v2:
> - Implement the request to use regmap_update_bits(). I found that I then
>   hated the read/write helpers since they were just bloat, so I ripped
>   them out. I replaced the regular spin_lock_irqsave() stuff with a
>   guard(spinlock_irqsave), since that's a simpler way of handling the two
>   different paths through such a trivial pair of functions.
> ---
>  drivers/reset/reset-mpfs.c | 83 ++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index f6fa10e03ea8..8e5ed4deecf3 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>

Should you add a depends on MFD_SYSCON ?

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
>  
> @@ -27,11 +30,14 @@
>  #define MPFS_SLEEP_MIN_US	100
>  #define MPFS_SLEEP_MAX_US	200
>  
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>  /* block concurrent access to the soft reset register */
>  static DEFINE_SPINLOCK(mpfs_reset_lock);
>  
>  struct mpfs_reset {
>  	void __iomem *base;
> +	struct regmap *regmap;
>  	struct reset_controller_dev rcdev;
>  };
>  
> @@ -46,41 +52,50 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
>  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));
> +		return 0;

You can:
		return regmap_update_bits();

> +	}
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>  
>  	reg = readl(rst->base);
>  	reg |= BIT(id);
>  	writel(reg, rst->base);
>  
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
>  
>  static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);
> +		return 0;
> +	}
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>  
>  	reg = readl(rst->base);
>  	reg &= ~BIT(id);
>  	writel(reg, rst->base);
>  
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
>  
>  static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	u32 reg = readl(rst->base);
> +	u32 reg;
> +
> +	if (rst->regmap)
> +		regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
> +	else
> +		reg = readl(rst->base);
>  
>  	/*
>  	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
> @@ -130,11 +145,45 @@ static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
>  	return index - MPFS_PERIPH_OFFSET;
>  }
>  
> -static int mpfs_reset_probe(struct auxiliary_device *adev,
> -			    const struct auxiliary_device_id *id)
> +static int mpfs_reset_mfd_probe(struct platform_device *pdev)
>  {
> -	struct device *dev = &adev->dev;
>  	struct reset_controller_dev *rcdev;
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
> +
> +	return devm_reset_controller_register(dev, rcdev);
> +}
> +
> +static struct platform_driver mpfs_reset_mfd_driver = {
> +	.probe		= mpfs_reset_mfd_probe,
> +	.driver = {
> +		.name = "mpfs-reset",
> +	},
> +};
> +module_platform_driver(mpfs_reset_mfd_driver);
> +
> +static int mpfs_reset_adev_probe(struct auxiliary_device *adev,
> +				 const struct auxiliary_device_id *id)
> +{
> +	struct reset_controller_dev *rcdev;
> +	struct device *dev = &adev->dev;
>  	struct mpfs_reset *rst;
>  
>  	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> @@ -145,8 +194,8 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>  
>  	rcdev = &rst->rcdev;
>  	rcdev->dev = dev;
> -	rcdev->dev->parent = dev->parent;
>  	rcdev->ops = &mpfs_reset_ops;
> +
>  	rcdev->of_node = dev->parent->of_node;
>  	rcdev->of_reset_n_cells = 1;
>  	rcdev->of_xlate = mpfs_reset_xlate;
> @@ -176,12 +225,12 @@ static const struct auxiliary_device_id mpfs_reset_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
>  
> -static struct auxiliary_driver mpfs_reset_driver = {
> -	.probe		= mpfs_reset_probe,
> +static struct auxiliary_driver mpfs_reset_aux_driver = {
> +	.probe		= mpfs_reset_adev_probe,
>  	.id_table	= mpfs_reset_ids,
>  };
>  
> -module_auxiliary_driver(mpfs_reset_driver);
> +module_auxiliary_driver(mpfs_reset_aux_driver);
>  
>  MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
