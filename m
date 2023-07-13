Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0895C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoNHQzr3TzK4zkinBzSGOrKMInyF7pLSUkBkV5gjf28=; b=GykEK/1tedO/4a
	dUnUdGoWcb7HL6fnslPppCuUEK3ZbiGFA1IwcKhB/Yu3lu8nnV4MnrFD7dg0TbGxMzKb/W3CZ03GM
	LFtqrqVOPwM6j2mAXgyM7tMjfsiYS0lqNBMbpqj+6u5SeBWQiu4tSxVs6lcUWFEDTPPJ4ZXlwDA2D
	35dzl2FsRW3n5tX2Vrvlz+glh7MVUQ1bj/bd1OXqGH7NOTUDcWezcwF7HX+dG8RITNSU8AH+3ngv1
	DNqqkg1wRpi1seovffrRTSj7k1Zm8ZfC+LfpLG9mSUIGA3IV/sbpDMCztG3LkY4U2Grmw90moT0rL
	Vh6yLZhvavFn75Nclutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwAn-003Ngm-32;
	Thu, 13 Jul 2023 13:15:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwAk-003Nfg-1O
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:15:56 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4D0363F18D
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689254152;
	bh=lzWjLkz9jgGntegWn0jvL4sjWw5FNz46EKQK53j0qbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dlab18ZTlvOPTRt+i6sb53s16eMQi1SezGG9c06eew7yNfbBQb24LOw4dwdZimJgm
	 5C7DXGMa1j3Q4TR+0BbthYgSIrUC14Xa3VnSibr6pYu9KVIb05rSfuoHCY+mBSxlP0
	 PY2NFWAfF4vLZAbEVRBCFVChOPB0fGtXXdlPHNrXx9ruJhuYj7N1Mk5MbI4u44MpzG
	 AfpxYFqxIo06ia4D69YF+K6gntsHWl4Bd7UXlIt7xn9ssGF2i7XIxB/IRX5XIIeDSQ
	 6QehLhaq3Je+l18GUPfsVC+0AYSM4YLvgbvO0jlcBIEWYbsWfen4/dqT0K2k0qc22S
	 zTkX8pEkMXUug==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-403b066c6e7so9453451cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 06:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254149; x=1691846149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzWjLkz9jgGntegWn0jvL4sjWw5FNz46EKQK53j0qbY=;
        b=LKSmuSmEmjDY73hPt/GRlKu447HLU/yuAUfLWjxk+Bj5UC1/YQSWP4pAU4YKR2OeAh
         kawcbuBsuNXvxHTxTllbakdy6qnsyCIfq/QC4+sgPnNyvgUUttZcYzI1M9BnavngmxPM
         NILu31w3cvQd6QlY8xLjGYNgNr9qtI/+offhC3rgh2rqlJDgM7uhSkwlhwQzlhdm/4TQ
         IBn2ZPneJt/41V6XjDIH4aCyaOZpUwRcSDvVMl/3TczUAi8f2UU/j4VebGGNYFGQm+GE
         qXwuRB1DvGETp9evE4G8vUzb+g/CSA72fMFaSVc4K+esksN+4bDfZ0fPQYgeumR9NCds
         yuEw==
X-Gm-Message-State: ABy/qLY9328OFubcTmTmMcJP1OntlBS/t1Zy1nt0wdj+VLjk20chIam9
	rjFiZvKTAhejDIdk6nFew52YyvxOV9ulKn1ovGJYhEtTVGWH04n/BLNI5gQ7TGEHE22hdfiz/ba
	zNUbBFbzYTiQLigPoMEtnsTjL45XV5csPtDVBXmObkxO31FSWSsQRjJTcWLfsEA==
X-Received: by 2002:ac8:5dcf:0:b0:400:9a75:d868 with SMTP id e15-20020ac85dcf000000b004009a75d868mr1784484qtx.53.1689254149354;
        Thu, 13 Jul 2023 06:15:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFREZAUVHrD2WAPAOepNdisRg4PmYWg2KJmdiHvZLy8utdjhf7asfxlbZZKZpSBDSxQLR979i/SsgKi5ZyG1lw=
X-Received: by 2002:ac8:5dcf:0:b0:400:9a75:d868 with SMTP id
 e15-20020ac85dcf000000b004009a75d868mr1784462qtx.53.1689254149008; Thu, 13
 Jul 2023 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-6-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-6-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 15:15:32 +0200
Message-ID: <CAJM55Z-OSmQCV6mO+SD4R2eU5gfx9TArSqDy+d-M2aer6bKL_A@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 5/7] clk: starfive: jh7110-sys: Add PLL clocks
 source from DTS
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
X-CRM114-CacheID: sfid-20230713_061554_812474_67236787 
X-CRM114-Status: GOOD (  28.25  )
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

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Modify PLL clocks source to be got from DTS or
> the fixed factor clocks.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  1 +
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 45 +++++++++++--------
>  2 files changed, 28 insertions(+), 18 deletions(-)
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
> index e6031345ef05..d56f48013388 100644
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
> @@ -386,6 +387,7 @@ EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>
>  static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  {
> +       bool use_fixed_pll = true;      /* PLL clocks use fixed factor clocks or PLL driver */

nit: reverse christmas tree ordering, eg. move this below priv

>         struct jh71x0_clk_priv *priv;
>         unsigned int idx;
>         int ret;
> @@ -402,28 +404,29 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>
> -       /*
> -        * These PLL clocks are not actually fixed factor clocks and can be
> -        * controlled by the syscon registers of JH7110. They will be dropped
> -        * and registered in the PLL clock driver instead.
> -        */
> +       if (!IS_ERR(devm_clk_get(priv->dev, "pll0_out")))
> +               use_fixed_pll = false;  /* can get pll clocks from PLL driver */

The devm_clk_get() variant will allocate memory for a callback to call
clk_put() when the driver is unloaded, but proper references
associated with the consumers of the pll0_out clock are already taken
below. So unless we find a better way to detect if the pll references
are specified in the device tree or not, maybe something like this
instead:

priv->pll[0] = clk_get(priv->dev, "pll0_out);
if (IS_ERR(priv->pll[0])) {
  /* 24MHZ -> 1000.0MHz */
  priv->pll[0] = ...
  ...

} else {
  clk_put(priv->pll[0]);
  priv->pll[0] = NULL;
}

> +       /* Use fixed factor clocks if can not get the PLL clocks from DTS */
> +       if (use_fixed_pll) {
>         /* 24MHz -> 1000.0MHz */

These comments are not indented with the code, which just looks weird.

> -       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> -                                                        "osc", 0, 125, 3);
> -       if (IS_ERR(priv->pll[0]))
> -               return PTR_ERR(priv->pll[0]);
> +               priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> +                                                                "osc", 0, 125, 3);
> +               if (IS_ERR(priv->pll[0]))
> +                       return PTR_ERR(priv->pll[0]);
>
>         /* 24MHz -> 1066.0MHz */
> -       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> -                                                        "osc", 0, 533, 12);
> -       if (IS_ERR(priv->pll[1]))
> -               return PTR_ERR(priv->pll[1]);
> +               priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> +                                                                "osc", 0, 533, 12);
> +               if (IS_ERR(priv->pll[1]))
> +                       return PTR_ERR(priv->pll[1]);
>
>         /* 24MHz -> 1188.0MHz */
> -       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> -                                                        "osc", 0, 99, 2);
> -       if (IS_ERR(priv->pll[2]))
> -               return PTR_ERR(priv->pll[2]);
> +               priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> +                                                                "osc", 0, 99, 2);
> +               if (IS_ERR(priv->pll[2]))
> +                       return PTR_ERR(priv->pll[2]);
> +       }
>
>         for (idx = 0; idx < JH7110_SYSCLK_END; idx++) {
>                 u32 max = jh7110_sysclk_data[idx].max;
> @@ -462,8 +465,14 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>                                 parents[i].fw_name = "tdm_ext";
>                         else if (pidx == JH7110_SYSCLK_MCLK_EXT)
>                                 parents[i].fw_name = "mclk_ext";
> -                       else
> +                       else if (use_fixed_pll)

else if (priv->pll[0])

>                                 parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
> +                       else if (pidx == JH7110_SYSCLK_PLL0_OUT)
> +                               parents[i].fw_name = "pll0_out";
> +                       else if (pidx == JH7110_SYSCLK_PLL1_OUT)
> +                               parents[i].fw_name = "pll1_out";
> +                       else if (pidx == JH7110_SYSCLK_PLL2_OUT)
> +                               parents[i].fw_name = "pll2_out";
>                 }
>
>                 clk->hw.init = &init;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
