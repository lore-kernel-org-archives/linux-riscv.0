Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC54EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOXk71hnteBdUwEvEuWUmJ4cudrU41NV6yTIHYkQk8c=; b=RVFa70ySpwKWcI
	TETZzXz5o2u/YvL21YVOL5EXXEtlv962uiHMreHV6jwjDZqZHHMWCw1U+54U3droU/13HwjDwv31e
	F2CwAuF/NUNrq+W9+Oa+giXB4UznKkpJRkjuXjEYsKAfBuQWWr5uhiGlrQa2Hrk3RUULrZ9laOeBu
	/LduHIW54FMrMWefg1I7zSvg4t8Cb08CGl+03PyDgmgh8b//TvtY9gxwR7Lzk3Depmh5uxhI9hSWm
	lDRMOyO8C3MOor8RPQokUasQjAEgWe/BCJSYd7XXMrsL/DKwZeEef+pAiAQ7Tky3LLQM7O0LVOGhH
	Zj8ZEMpSw2s0+/Oan58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9RU-0080Fb-2s;
	Wed, 19 Jul 2023 15:50:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9RQ-0080DO-1M
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 15:50:19 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE3943F230
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689781814;
	bh=lBkd8y3XOzT/fx92qUyW7CMl9N9JYFVT6xHfK84rRBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HTh/kn7cz/i69mP+J3LB5w2UsUT2ZSbx15XJNegwKZy05HupVZohPAUVLpgjfQS5/
	 ZsT+QrPjUoLBSa4fR+8gRLPhKn508XaX3+ZN3Bjf8n2ms0Nvn1PPen/XjNV4ywVzF0
	 gp2O0MpJ/aPZIoyx4uw8bQAVunnMeDNIa3HjDJpZFeOTU1Y+3mdCfGexdvf/7XG4sE
	 TTzrZ2HIgZjufKEkqTDMpsNB2HR4IbM7wo8r9UW0lqA/IrinMQLRlA9baq4LMObg7k
	 Q7E2+/uPrVfqbWL9U2EiIWtW8u4yPN6vEQ7ETVTysWSzAF6ODUuuQylz9cZQyDpWFr
	 aeEy2vypU5X0Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-403affb3404so7863621cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 08:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689781811; x=1690386611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBkd8y3XOzT/fx92qUyW7CMl9N9JYFVT6xHfK84rRBs=;
        b=CF16obwvlw0Wm/crJ8N3E2NpX7gAKGMnXU8hgb21WtPbB/98o243NSdm45l94tpaLg
         TEuf4jPlPWiHAUtRMV4rl/jYxOmCgFMegfda7KQfSFRuQt1NyHfbnrbnqi//Sbw/HyAE
         mMxu0LQdY0dnysWArmf4KpTYVnn55epAfb2RWQyNY0sWILESMNmqxKmcqXP/L06o7GpD
         beGM8YSfQ9EBDY9DttvriqC13AJOpSxiISqzPhO/E9Ohkd9ID0JAC1Q+fSl1tRISjsvt
         +rDj9aGOARpnyIsSHUS5NAs/zat9t6mWKdlzBCuh0AEwvMAqSEEi8WTMKwl6Qzh3Eccs
         7M/Q==
X-Gm-Message-State: ABy/qLbmFu8TQDskappZzpwkJtkOHq+wtLKRIKevUPxHM+z0I9CMpIxE
	UMHFAtzvCRwoPciemWcr0oWAiDi6+OLlzhchtfrmf7XSoZneBjcSzv0Iyc/FYxd5179MzfAiiFR
	UrqDUQuXmU17qzIY2zolkPXMhJaXoDhdC4a/KPwOEROTVOh7EFT3EwIHrp2zgXA==
X-Received: by 2002:a05:622a:1009:b0:402:d15e:2984 with SMTP id d9-20020a05622a100900b00402d15e2984mr2944875qte.32.1689781810925;
        Wed, 19 Jul 2023 08:50:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFLsdryo3l3HfOhrzOljHukZzudv9rHzS/TP/ey37QvguSJT9mRI3G5taBWNolBsF75e8Yi/YTmAsaRVIRiakk=
X-Received: by 2002:a05:622a:1009:b0:402:d15e:2984 with SMTP id
 d9-20020a05622a100900b00402d15e2984mr2944851qte.32.1689781810663; Wed, 19 Jul
 2023 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com> <20230717023040.78860-6-xingyu.wu@starfivetech.com>
In-Reply-To: <20230717023040.78860-6-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 19 Jul 2023 17:49:54 +0200
Message-ID: <CAJM55Z_cX09WQdxB+aNBXo+WVjoJYT5vQz5sbrNBmLikDiNJrQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] clk: starfive: jh7110-sys: Add PLL clocks source
 from DTS
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_085016_805320_C5B6B3C1 
X-CRM114-Status: GOOD (  25.14  )
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

On Mon, 17 Jul 2023 at 04:30, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Modify PLL clocks source to be got from DTS or
> the fixed factor clocks.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  1 +
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 66 ++++++++++++-------
>  2 files changed, 45 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 5195f7be5213..978b78ec08b1 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -35,6 +35,7 @@ config CLK_STARFIVE_JH7110_SYS
>         select AUXILIARY_BUS
>         select CLK_STARFIVE_JH71X0
>         select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> +       select CLK_STARFIVE_JH7110_PLL
>         default ARCH_STARFIVE
>         help
>           Say yes here to support the system clock controller on the
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index e6031345ef05..3884eff9fe93 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/auxiliary_bus.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -389,6 +390,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>         struct jh71x0_clk_priv *priv;
>         unsigned int idx;
>         int ret;
> +       struct clk *pllclk;
>
>         priv = devm_kzalloc(&pdev->dev,
>                             struct_size(priv, reg, JH7110_SYSCLK_END),
> @@ -402,28 +404,42 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>
> -       /*
> -        * These PLL clocks are not actually fixed factor clocks and can be
> -        * controlled by the syscon registers of JH7110. They will be dropped
> -        * and registered in the PLL clock driver instead.
> -        */
> -       /* 24MHz -> 1000.0MHz */
> -       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> -                                                        "osc", 0, 125, 3);
> -       if (IS_ERR(priv->pll[0]))
> -               return PTR_ERR(priv->pll[0]);
> -
> -       /* 24MHz -> 1066.0MHz */
> -       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> -                                                        "osc", 0, 533, 12);
> -       if (IS_ERR(priv->pll[1]))
> -               return PTR_ERR(priv->pll[1]);
> -
> -       /* 24MHz -> 1188.0MHz */
> -       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> -                                                        "osc", 0, 99, 2);
> -       if (IS_ERR(priv->pll[2]))
> -               return PTR_ERR(priv->pll[2]);
> +       /* Use fixed factor clocks if can not get the PLL clocks from DTS */
> +       pllclk = clk_get(priv->dev, "pll0_out");
> +       if (IS_ERR(pllclk)) {
> +               /* 24MHz -> 1000.0MHz */
> +               priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> +                                                                "osc", 0, 125, 3);
> +               if (IS_ERR(priv->pll[0]))
> +                       return PTR_ERR(priv->pll[0]);
> +       } else {
> +               clk_put(pllclk);
> +               priv->pll[0] = NULL;

Not really important enough for a respin, but setting these to NULL is
not needed as devm_kzalloc() already zeroes the memory allocated.

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> +       }
> +
> +       pllclk = clk_get(priv->dev, "pll1_out");
> +       if (IS_ERR(pllclk)) {
> +               /* 24MHz -> 1066.0MHz */
> +               priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> +                                                                "osc", 0, 533, 12);
> +               if (IS_ERR(priv->pll[1]))
> +                       return PTR_ERR(priv->pll[1]);
> +       } else {
> +               clk_put(pllclk);
> +               priv->pll[1] = NULL;
> +       }
> +
> +       pllclk = clk_get(priv->dev, "pll2_out");
> +       if (IS_ERR(pllclk)) {
> +               /* 24MHz -> 1188.0MHz */
> +               priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> +                                                                "osc", 0, 99, 2);
> +               if (IS_ERR(priv->pll[2]))
> +                       return PTR_ERR(priv->pll[2]);
> +       } else {
> +               clk_put(pllclk);
> +               priv->pll[2] = NULL;
> +       }
>
>         for (idx = 0; idx < JH7110_SYSCLK_END; idx++) {
>                 u32 max = jh7110_sysclk_data[idx].max;
> @@ -462,6 +478,12 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>                                 parents[i].fw_name = "tdm_ext";
>                         else if (pidx == JH7110_SYSCLK_MCLK_EXT)
>                                 parents[i].fw_name = "mclk_ext";
> +                       else if (pidx == JH7110_SYSCLK_PLL0_OUT && !priv->pll[0])
> +                               parents[i].fw_name = "pll0_out";
> +                       else if (pidx == JH7110_SYSCLK_PLL1_OUT && !priv->pll[1])
> +                               parents[i].fw_name = "pll1_out";
> +                       else if (pidx == JH7110_SYSCLK_PLL2_OUT && !priv->pll[2])
> +                               parents[i].fw_name = "pll2_out";
>                         else
>                                 parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
>                 }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
