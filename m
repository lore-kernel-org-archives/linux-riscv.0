Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F4C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 21:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6Z4n+Pw1mqRN7qjj14CMe3y5w0QCW+MpFyaAUPVvI8=; b=bcsVp5s6ssipXM
	ab2iXBq4JrZNbtATc45l7zYwnfsqhRdgVu6YdAZjb3YUSYvXP0mwcA0Z/oHLHSFBu4UCf5lO+cjmL
	JCBNdQnn50TRT9fcwsrWOOd3yIiMq2KE2+cjGmytrf/a30nzEnQTpHtLjPfep5Mgzf7bqNe6IJocv
	xt4xm1e3TWmNM24Eoy6rfaqUXH4Q0KLL8OFXAuD+hk9RyEVr2dYh10tsO/ujuD+3NqieOGXeq1Amf
	z4rEeLJDzOLwQWja+OPLgJ2kEwToYHOX10znuQg/0HMNyT4EYbBzjLr+BGNsPMJn3f4cw5Fmvutns
	Tco3d2gcxVXS9RIEgl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNrz-00BiZp-4t; Fri, 30 Sep 2022 21:48:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNrv-00BiYO-Gg
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 21:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E8B86B82A3A;
	Fri, 30 Sep 2022 21:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14ACC433D6;
	Fri, 30 Sep 2022 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664574504;
	bh=izJxWplvzIJrIzy3GFzhPnsHaw/msyKEzMvL2GdfOdk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ulfKvln9/9OiPB0Yt7T+U2aiGnYSLYbQGreKUjNApStfnfj0mljm4baPsKq4Kjf2P
	 c8A9dAyvDuw/obUE4EhrVGxNosN0Kp30uST7roL0ZPVma1b7Hl4k3YiXJw3U6iu6mk
	 gWdXJhUwM6l+Yaz+2jmk7UsYaXj7VEtXdsJGSZUuRmoiKwWBY2RR9vOimsSZ39kcyl
	 KPlp5d4y1Us24706Fpojqn//wRfrVlq+lMPbhManGWzl0fZP0dZiRkT4JE4+I8g2y3
	 oWrC8avhCZAvXK/tfaVivy4Ddup6vU3AKqKmEbsOoPK6DsLAbpyDZlydpYHMaTB5Ox
	 I2elxjYH6qiog==
MIME-Version: 1.0
In-Reply-To: <20220929175602.19946-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175602.19946-1-hal.feng@linux.starfivetech.com>
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@linux.starfivetech.com>, linux-kernel@vger.kernel.org
To: Hal Feng <hal.feng@linux.starfivetech.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 30 Sep 2022 14:48:21 -0700
User-Agent: alot/0.10
Message-Id: <20220930214824.A14ACC433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_144827_854903_B4F32EE6 
X-CRM114-Status: GOOD (  17.69  )
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

Quoting Hal Feng (2022-09-29 10:56:02)
> Clock registers address region is shared with reset controller
> on the new StarFive JH7110 SoC. Change to use regmap framework
> to allow base address sharing and preparation for JH7110 clock
> support.

Do the reset and clk parts share actual registers, where we would need
to lock between rmw? Or is regmap just nice to have because it wraps up
the register APIs with some extra features?

> 
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
[...]
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 014e36f17595..410aa6e06842 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  
> @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>         if (!priv)
>                 return -ENOMEM;
>  
> -       spin_lock_init(&priv->rmw_lock);
>         priv->dev = &pdev->dev;
> -       priv->base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(priv->base))
> -               return PTR_ERR(priv->base);
> +       priv->regmap = device_node_to_regmap(priv->dev->of_node);

This is sad. Why do we need to make a syscon? Can we instead use the
auxiliary bus to make a reset device that either gets a regmap made here
in this driver or uses a void __iomem * mapped with ioremap
(priv->base)?

> +       if (IS_ERR(priv->regmap)) {
> +               dev_err(priv->dev, "failed to get regmap (error %ld)\n",
> +                       PTR_ERR(priv->regmap));
> +               return PTR_ERR(priv->regmap);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
