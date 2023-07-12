Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D89EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMGT6ij7/MlCXlWe+uOfoOp/QJyMRnaxdjrYmYLWYko=; b=h462hjFNg8KiNj
	zwCHpxgISJXt3dZixRQe1ga6ku/H4RRd1rKP0uMUUuJ3uA1PvVZmGpEW4xHn5r98/FeHJzVrtTKe/
	ezTtymU+o4s2lZLIFCFkLv5p/IZzmy3QnGoFQqy+jwAWLm/onhoQx8K2Vm7Zn6XAvX2kJ49rP0W4y
	nZyjIYsIjtnQZ0BAVe3fTtoGaQwUD+OcWfN3098LvEr7+AkTLEcgwTteizxOrlPwKqxjz7mPiiA4c
	SSeMWQmrZK2YpYf6Qqeo8OILekkMw16P9Rhv3S4N4LVaPgnSQC9/GduxSKiO8LSrzAou7+JkvAUoV
	YQmAgE8fAG9+YvticT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeGX-000r0Q-2w;
	Wed, 12 Jul 2023 18:08:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeGU-000qyc-2v
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:08:41 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F94F3F438
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689185316;
	bh=Cl+G5cbkVCPn7iON0EOzFQQwFMGKI68SYt3m3IG1FQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bVhJsmwMvw+RuqLKxBv1gD6E66TDciRKtUAx3C7Upel7H6IPnpLvFRVFbC8TfWTtx
	 ptP+pHKpPe0uCm9XTt4zp8OfY/cmo/jregMOgWXtjXGRrxqs6kj+PGiQ2TXYUK6O7W
	 BK5ZU3swNHTVWEftt06qQ2tqFvJB/Y4FeU+lWmbzw5Q7pRhDqIr7dyNGPp88O4pkAc
	 woANtQiMEp603Krnl5dLKCoaYugWVC3gHnV6Rgk4M+DqTxCxd1+AaYfXjmUmV3jm8n
	 j8gFVqMlXy/UWF5t8r2SzuE40hQX0yifnTnvSyv5RBYB5gUPHqVylo6nfXs4KcQiJ9
	 HbuO6/FZDgHvw==
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-635e6c83cf0so80636956d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185315; x=1691777315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cl+G5cbkVCPn7iON0EOzFQQwFMGKI68SYt3m3IG1FQI=;
        b=Fd8OW5pZ0PmIOk5UubibuY3PSH10pP8Fn8pOcAiQavNUqRfvgqS5aKzYZFRW7lb/bp
         6qjz06cIH/kneOvzV+Fi/LqssNwI0CgS72C99kMXH8EhSGLR/CW9oNEIAKd7E1lZYfUv
         ixByMcQVhU2WOxZvgO5o4rdL/3BQjNFZpemQ+jde58xuZaPjXO2MgkctQMY9atOYEWuo
         0ZpTxb0f2+By77LF+lxBA7UvBqg2l0OlUt6I0Pf1E0yEpFj+phkpBhq8L3U6xxx2pTyq
         5ULoY196DoXe3dwS+/I3A6hKad2F0KuEoE/UBXdNzArZ2/rFYUBndi8BHuHoO65sfLiM
         OYjw==
X-Gm-Message-State: ABy/qLZVHCQtAf5WspNtelfR6ftsDK9RM03KSBqZ5wvR1tMrtwDBaohH
	TPI6cdHIlZiAQqG859mRgODRSDB/CZWU31YEi+CUH8H+k1HmRQbqtqDIOPbhZfz8nFdiU1AMQsB
	usHkB/Piaupu/fKBaAU+K9JchOmlsDgryWUUeC5SDaYns5mn1oeN7ghfm678J8A==
X-Received: by 2002:a05:622a:20e:b0:400:797e:d694 with SMTP id b14-20020a05622a020e00b00400797ed694mr26598470qtx.11.1689185315477;
        Wed, 12 Jul 2023 11:08:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGUv7hGasV8i5TU7IlzyJLXVueRn15aBPKv8jkeKfbhVvWNHzCSBIOoEnLmrUqxbfpHPw8NudH33idtbVNZAzs=
X-Received: by 2002:a05:622a:20e:b0:400:797e:d694 with SMTP id
 b14-20020a05622a020e00b00400797ed694mr26598455qtx.11.1689185315215; Wed, 12
 Jul 2023 11:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-7-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-7-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 20:08:18 +0200
Message-ID: <CAJM55Z8VorFJKME+RDvXfXKCzriK4BBpEtFQBrWTXnvX-AH_kQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] clk: starfive: Add StarFive JH7110 Video-Output
 clock driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_110839_120224_A6F203D0 
X-CRM114-Status: GOOD (  31.93  )
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

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add driver for the StarFive JH7110 Video-Output clock controller.
> And these clock controllers should power on and enable the clocks from
> SYSCRG first before registering.
>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |   8 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-vout.c   | 239 ++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 13b4d08cbcd2..3fa983eb7d32 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -55,3 +55,11 @@ config CLK_STARFIVE_JH7110_ISP
>         help
>           Say yes here to support the Image-Signal-Process clock controller
>           on the StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_VOUT
> +       tristate "StarFive JH7110 Video-Output clock support"
> +       depends on CLK_STARFIVE_JH7110_SYS && JH71XX_PMU
> +       default m if ARCH_STARFIVE
> +       help
> +         Say yes here to support the Video-Output clock controller
> +         on the StarFive JH7110 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 76fb9f8d628b..841377e45bb6 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)   += clk-starfive-jh7110-sys.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)  += clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)  += clk-starfive-jh7110-isp.o
> +obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT) += clk-starfive-jh7110-vout.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> new file mode 100644
> index 000000000000..743840e03d81
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 Video-Output Clock Driver
> + *
> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh7110.h"
> +
> +/* external clocks */
> +#define JH7110_VOUTCLK_VOUT_SRC                        (JH7110_VOUTCLK_END + 0)
> +#define JH7110_VOUTCLK_VOUT_TOP_AHB            (JH7110_VOUTCLK_END + 1)
> +#define JH7110_VOUTCLK_VOUT_TOP_AXI            (JH7110_VOUTCLK_END + 2)
> +#define JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK   (JH7110_VOUTCLK_END + 3)
> +#define JH7110_VOUTCLK_I2STX0_BCLK             (JH7110_VOUTCLK_END + 4)
> +#define JH7110_VOUTCLK_HDMITX0_PIXELCLK                (JH7110_VOUTCLK_END + 5)
> +#define JH7110_VOUTCLK_EXT_END                 (JH7110_VOUTCLK_END + 6)
> +
> +static struct clk_bulk_data jh7110_vout_top_clks[] = {
> +       { .id = "vout_src" },
> +       { .id = "vout_top_ahb" }
> +};
> +
> +static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
> +       /* divider */
> +       JH71X0__DIV(JH7110_VOUTCLK_APB, "apb", 8, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       JH71X0__DIV(JH7110_VOUTCLK_DC8200_PIX, "dc8200_pix", 63, JH7110_VOUTCLK_VOUT_SRC),
> +       JH71X0__DIV(JH7110_VOUTCLK_DSI_SYS, "dsi_sys", 31, JH7110_VOUTCLK_VOUT_SRC),
> +       JH71X0__DIV(JH7110_VOUTCLK_TX_ESC, "tx_esc", 31, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       /* dc8200 */
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       /* LCD */
> +       JH71X0_GMUX(JH7110_VOUTCLK_DOM_VOUT_TOP_LCD, "dom_vout_top_lcd", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX0,
> +                   JH7110_VOUTCLK_DC8200_PIX1),
> +       /* dsiTx */
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_APB, "dsiTx_apb", 0, JH7110_VOUTCLK_DSI_SYS),
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_SYS, "dsiTx_sys", 0, JH7110_VOUTCLK_DSI_SYS),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DSITX_DPI, "dsiTx_dpi", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_TXESC, "dsiTx_txesc", 0, JH7110_VOUTCLK_TX_ESC),
> +       /* mipitx DPHY */
> +       JH71X0_GATE(JH7110_VOUTCLK_MIPITX_DPHY_TXESC, "mipitx_dphy_txesc", 0,
> +                   JH7110_VOUTCLK_TX_ESC),
> +       /* hdmi */
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_MCLK, "hdmi_tx_mclk", 0,
> +                   JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_BCLK, "hdmi_tx_bclk", 0,
> +                   JH7110_VOUTCLK_I2STX0_BCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_SYS, "hdmi_tx_sys", 0, JH7110_VOUTCLK_APB),
> +};
> +
> +static int jh7110_vout_top_rst_init(struct jh71x0_clk_priv *priv)
> +{
> +       struct reset_control *top_rst;
> +
> +       /* The reset should be shared and other Vout modules will use its. */
> +       top_rst = devm_reset_control_get_shared(priv->dev, NULL);
> +       if (IS_ERR(top_rst))
> +               return dev_err_probe(priv->dev, PTR_ERR(top_rst), "failed to get top reset\n");
> +
> +       return reset_control_deassert(top_rst);
> +}
> +
> +static struct clk_hw *jh7110_voutclk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct jh71x0_clk_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7110_VOUTCLK_END)
> +               return &priv->reg[idx].hw;
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +#ifdef CONFIG_PM
> +static int jh7110_voutcrg_suspend(struct device *dev)
> +{
> +       struct top_sysclk *top = dev_get_drvdata(dev);
> +
> +       clk_bulk_disable_unprepare(top->top_clks_num, top->top_clks);
> +
> +       return 0;
> +}
> +
> +static int jh7110_voutcrg_resume(struct device *dev)
> +{
> +       struct top_sysclk *top = dev_get_drvdata(dev);
> +
> +       return clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
> +}
> +#endif

nit: you could move this #endif down below jh7110_voutcrg_pm_ops, and then do

  .pm = pm_ptr(&jh7110_voutcrg_pm_ops),

In any case
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> +static const struct dev_pm_ops jh7110_voutcrg_pm_ops = {
> +       SET_RUNTIME_PM_OPS(jh7110_voutcrg_suspend, jh7110_voutcrg_resume, NULL)
> +};
> +
> +static int jh7110_voutcrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       struct top_sysclk *top;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_VOUTCLK_END),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       top = devm_kzalloc(&pdev->dev, sizeof(*top), GFP_KERNEL);
> +       if (!top)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       top->top_clks = jh7110_vout_top_clks;
> +       top->top_clks_num = ARRAY_SIZE(jh7110_vout_top_clks);
> +       ret = devm_clk_bulk_get(priv->dev, top->top_clks_num, top->top_clks);
> +       if (ret)
> +               return dev_err_probe(priv->dev, ret, "failed to get top clocks\n");
> +       dev_set_drvdata(priv->dev, top);
> +
> +       /* enable power domain and clocks */
> +       pm_runtime_enable(priv->dev);
> +       ret = pm_runtime_get_sync(priv->dev);
> +       if (ret < 0)
> +               return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
> +
> +       ret = jh7110_vout_top_rst_init(priv);
> +       if (ret)
> +               goto err_exit;
> +
> +       for (idx = 0; idx < JH7110_VOUTCLK_END; idx++) {
> +               u32 max = jh7110_voutclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_voutclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_voutclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +               const char *fw_name[JH7110_VOUTCLK_EXT_END - JH7110_VOUTCLK_END] = {
> +                       "vout_src",
> +                       "vout_top_ahb",
> +                       "vout_top_axi",
> +                       "vout_top_hdmitx0_mclk",
> +                       "i2stx0_bclk",
> +                       "hdmitx0_pixelclk"
> +               };
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_voutclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_VOUTCLK_END)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx < JH7110_VOUTCLK_EXT_END)
> +                               parents[i].fw_name = fw_name[pidx - JH7110_VOUTCLK_END];
> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +               if (ret)
> +                       goto err_exit;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_voutclk_get, priv);
> +       if (ret)
> +               goto err_exit;
> +
> +       ret = jh7110_reset_controller_register(priv, "rst-vo", 4);
> +       if (ret)
> +               goto err_exit;
> +
> +       return 0;
> +
> +err_exit:
> +       pm_runtime_put_sync(priv->dev);
> +       pm_runtime_disable(priv->dev);
> +       return ret;
> +}
> +
> +static int jh7110_voutcrg_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_put_sync(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id jh7110_voutcrg_match[] = {
> +       { .compatible = "starfive,jh7110-voutcrg" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
> +
> +static struct platform_driver jh7110_voutcrg_driver = {
> +       .probe = jh7110_voutcrg_probe,
> +       .remove = jh7110_voutcrg_remove,
> +       .driver = {
> +               .name = "clk-starfive-jh7110-vout",
> +               .of_match_table = jh7110_voutcrg_match,
> +               .pm = &jh7110_voutcrg_pm_ops,
> +       },
> +};
> +module_platform_driver(jh7110_voutcrg_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 Video-Output clock driver");
> +MODULE_LICENSE("GPL");
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
