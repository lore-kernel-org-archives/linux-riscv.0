Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E77C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gX0ARZcGbWuBC57bHgBHzOI6vDn6UjPSHiFN+izIwGQ=; b=jjKaSVyWFpl1f1
	00a0sM0ILLkyijNl1pmIMnabcN6kfyj3JiCLnIWR6RsmhjItCMp62N6yD95MV5X36kpZdZDx07Wp9
	rPSGziLJgBeF+z3X1aMYRhDn+nedONO+Xo3qiScWrOQyc7fnidr0IWLh1RnW2GeUQo3EbmCqScQ3e
	HxMvptwlu5yI69dxB4wnx+awU1KbNppCQo4oRPd/YPmw1kYs0/+EnUtuYnYVzBlaZ9moEsmeVyFRs
	ycVVz85ez3JZoO+BfHqrKwnZnHCc8EIk6CKhTVOlcWhNHpTn6g0exQA87D0jYEIh9yKdO3BCcp70c
	TRYXP7Ib4X/z7B2HtpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkfu-002cjc-Pz; Thu, 02 Mar 2023 15:16:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkfr-002cfW-Et
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 15:16:53 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B8CA93F20F
	for <linux-riscv@lists.infradead.org>; Thu,  2 Mar 2023 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677770206;
	bh=4N07li82obP0Hkm70LaKXQjir2DSxDLKh74uJ58iLoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dfOfYjlNDCGBpSpa1+VT+SGA4OvNoFhyFocRU+Ro15w+UOUAwnWsGGSkQ0GDz8B+d
	 4W0uhbPVdxnHoo4orkyMDhpR0gLGHbbQnixBzNIwA5wAkiWGcyQwcLEgyn7OX3o+cO
	 QjQc0d4s+CYMprPOe0ho0HzoXfIVfnEZl8CVyKFGHxqSlpOT+0bExpwJ8rFlTi0EZ/
	 /UAPhcAnfhOXJ3kubUJXfGXYiFhh4ikHgXRGj4Jsx7DdgCTc4hdBWu1aod+hJQp9ZZ
	 4WoiaveqGytIeJgCL8zWN8Aw6hO2+jbmcZVianNg9+jsMEdc+zwl6B1+ui1d7OnCuN
	 kbaY9igI5uKVw==
Received: by mail-qv1-f72.google.com with SMTP id pv11-20020ad4548b000000b0056e96f4fd64so9002529qvb.15
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 07:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677770206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N07li82obP0Hkm70LaKXQjir2DSxDLKh74uJ58iLoE=;
        b=MEemeIrE9snAbfi0idghRDKfAxika3izNc7UmQL/TXr1Ok22YUxO2VpGj7UiSEEGfD
         ZpQ54VOpOjT5/Qlx3RBQb0/voXwYpMvX/Veh//1FT1ukuRQAoMpTbVbpdnd81UYxX1vA
         NL4rUASCqPVPOVbkgVFb5eKuiW2VSk/Y3jH3nMypAMqm5CUpsUrdc1GBbhzOoKqSXrsU
         su8Pam5mMfdO+GI/AgbIYun7B+M/8IrXfeLRxbR24iPcgK9XKYGBpnP9lxWduv6aRH3P
         RQAxKJj94YsnbLZcXY90xMJXvybsT8K/6e8Jndq/iqVPWO2RPUt6Kh91DjIZDd4m8NBv
         sZgQ==
X-Gm-Message-State: AO0yUKWvhlKnjfZIv4nCZeeF9P5LLMxNRCsTk4VnECdvF6iTm+xDpoAQ
	vVEp/1lyNiikYGXjFkGS/wcFY5UqwmzMDLv42175Mz4FHN2qcltwGBoVNrFm1mdjqZjsB27aAEO
	D4Rirrt2eZxml7F5yWL0CEuXC/0RelYJU2289pF0HaUpiwuUdw11jElUAKtm1cg==
X-Received: by 2002:ac8:435d:0:b0:3bf:c62b:4651 with SMTP id a29-20020ac8435d000000b003bfc62b4651mr2830136qtn.3.1677770205659;
        Thu, 02 Mar 2023 07:16:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9P9qEdPX03UeOBRsfVx/0HELk92uKiacehr2aZRU4XptLaHnvSXz+FLPXn36TXEmRxEXBQ2umO0ThbkivuWFs=
X-Received: by 2002:ac8:435d:0:b0:3bf:c62b:4651 with SMTP id
 a29-20020ac8435d000000b003bfc62b4651mr2830122qtn.3.1677770205382; Thu, 02 Mar
 2023 07:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com> <20230221083323.302471-4-xingyu.wu@starfivetech.com>
In-Reply-To: <20230221083323.302471-4-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 2 Mar 2023 16:16:29 +0100
Message-ID: <CAJM55Z9aXPzwT3vuJFjF+oD1enULzNzny-RiNuomx2=Fv+=a-w@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] clk: starfive: Add StarFive JH7110
 System-Top-Group clock driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_071651_906766_7A73DF56 
X-CRM114-Status: GOOD (  34.60  )
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

On Tue, 21 Feb 2023 at 09:38, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add driver for the StarFive JH7110 System-Top-Group clock controller.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Again, this driver is almost identical to the first STGCRG driver I
pushed. You really ought to have kept the authorship like Hal Feng did
for the SYSCRG and AONCRG drivers.

> ---
>  drivers/clk/starfive/Kconfig                  |  11 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-stg.c    | 176 ++++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 2aa664f2cdee..a462b6e53543 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -42,3 +42,14 @@ config CLK_STARFIVE_JH7110_AON
>         help
>           Say yes here to support the always-on clock controller on the
>           StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_STG
> +       tristate "StarFive JH7110 System-Top-Group clock support"
> +       depends on CLK_STARFIVE_JH7110_SYS
> +       select AUXILIARY_BUS
> +       select CLK_STARFIVE_JH71X0
> +       select RESET_STARFIVE_JH7110
> +       default CLK_STARFIVE_JH7110_SYS

The JH7110 boots perfectly fine without this driver built in, so just do
default m if ARCH_STARFIVE

> +       help
> +         Say yes here to support the System-Top-Group clock controller
> +         on the StarFive JH7110 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index f3df7d957b1e..b81e97ee2659 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO) += clk-starfive-jh7100-audio.o
>
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)  += clk-starfive-jh7110-sys.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
> +obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)  += clk-starfive-jh7110-stg.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> new file mode 100644
> index 000000000000..a39d2fdb8011
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 System-Top-Group Clock Driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.

Removing my copyright line is definitely not ok.

> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +/* external clocks */
> +#define JH7110_STGCLK_OSC                      (JH7110_STGCLK_END + 0)
> +#define JH7110_STGCLK_HIFI4_CORE               (JH7110_STGCLK_END + 1)
> +#define JH7110_STGCLK_STG_AXIAHB               (JH7110_STGCLK_END + 2)
> +#define JH7110_STGCLK_USB_125M                 (JH7110_STGCLK_END + 3)
> +#define JH7110_STGCLK_CPU_BUS                  (JH7110_STGCLK_END + 4)
> +#define JH7110_STGCLK_HIFI4_AXI                        (JH7110_STGCLK_END + 5)
> +#define JH7110_STGCLK_NOCSTG_BUS               (JH7110_STGCLK_END + 6)
> +#define JH7110_STGCLK_APB_BUS                  (JH7110_STGCLK_END + 7)
> +#define JH7110_STGCLK_EXT_END                  (JH7110_STGCLK_END + 8)
> +
> +static const struct jh71x0_clk_data jh7110_stgclk_data[] = {
> +       /* hifi4 */
> +       JH71X0_GATE(JH7110_STGCLK_HIFI4_CLK_CORE, "hifi4_clk_core", 0,
> +                   JH7110_STGCLK_HIFI4_CORE),
> +       /* usb */
> +       JH71X0_GATE(JH7110_STGCLK_USB0_APB, "usb0_apb", 0, JH7110_STGCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_USB0_UTMI_APB, "usb0_utmi_apb", 0, JH7110_STGCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_USB0_AXI, "usb0_axi", 0, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GDIV(JH7110_STGCLK_USB0_LPM, "usb0_lpm", 0, 2, JH7110_STGCLK_OSC),
> +       JH71X0_GDIV(JH7110_STGCLK_USB0_STB, "usb0_stb", 0, 4, JH7110_STGCLK_OSC),
> +       JH71X0_GATE(JH7110_STGCLK_USB0_APP_125, "usb0_app_125", 0, JH7110_STGCLK_USB_125M),
> +       JH71X0__DIV(JH7110_STGCLK_USB0_REFCLK, "usb0_refclk", 2, JH7110_STGCLK_OSC),
> +       /* pci-e */
> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_AXI_MST0, "pcie0_axi_mst0", 0,
> +                   JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_APB, "pcie0_apb", 0, JH7110_STGCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_TL, "pcie0_tl", 0, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_AXI_MST0, "pcie1_axi_mst0", 0,
> +                   JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_APB, "pcie1_apb", 0, JH7110_STGCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_TL, "pcie1_tl", 0, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK, "pcie01_slv_dec_mainclk",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
> +       /* security */
> +       JH71X0_GATE(JH7110_STGCLK_SEC_HCLK, "sec_hclk", 0, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_SEC_MISCAHB, "sec_miscahb", 0, JH7110_STGCLK_STG_AXIAHB),
> +       /* stg mtrx */
> +       JH71X0_GATE(JH7110_STGCLK_GRP0_MAIN, "mtrx_grp0_main",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_GRP0_BUS, "mtrx_grp0_bus",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_GRP0_STG, "mtrx_grp0_stg",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_GRP1_MAIN, "mtrx_grp1_main",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_GRP1_BUS, "mtrx_grp1_bus",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
> +       JH71X0_GATE(JH7110_STGCLK_GRP1_STG, "mtrx_grp1_stg",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_GRP1_HIFI, "mtrx_grp1_hifi",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_HIFI4_AXI),
> +       /* e24_rvpi */
> +       JH71X0_GDIV(JH7110_STGCLK_E2_RTC, "e2_rtc", 0, 24, JH7110_STGCLK_OSC),
> +       JH71X0_GATE(JH7110_STGCLK_E2_CORE, "e2_core",
> +                   CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_E2_DBG, "e2_dbg", 0, JH7110_STGCLK_STG_AXIAHB),
> +       /* dw_sgdma1p */
> +       JH71X0_GATE(JH7110_STGCLK_DMA1P_AXI, "dma1p_axi", 0, JH7110_STGCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_STGCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
> +};

Like the SYSCRG and AONCRG driver in Hal Feng's series I only added
the CLK_IGNORE_UNUSED flag as a placeholder for clocks where I didn't
yet know if
they were ok to turn off when unused. Please go through the clocks and
figure out if they're critical and mark them with CLK_IS_CRITICAL or
they are fine to turn off and just remove the CLK_IGNORE_UNUSED flag.

> +static struct clk_hw *jh7110_stgclk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct jh71x0_clk_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7110_STGCLK_END)
> +               return &priv->reg[idx].hw;
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int jh7110_stgcrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_STGCLK_END),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       dev_set_drvdata(priv->dev, (void *)(&priv->base));
> +
> +       for (idx = 0; idx < JH7110_STGCLK_END; idx++) {
> +               u32 max = jh7110_stgclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_stgclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_stgclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +               char *fw_name[JH7110_STGCLK_EXT_END - JH7110_STGCLK_END] = {
> +                       "osc",
> +                       "hifi4_core",
> +                       "stg_axiahb",
> +                       "usb_125m",
> +                       "cpu_bus",
> +                       "hifi4_axi",
> +                       "nocstg_bus",
> +                       "apb_bus"
> +               };
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_stgclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_STGCLK_END)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx < JH7110_STGCLK_EXT_END)
> +                               parents[i].fw_name = fw_name[pidx - JH7110_STGCLK_END];
> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
> +       if (ret)
> +               return ret;
> +
> +       return jh7110_reset_controller_register(priv, "reset-stg", 2);
> +}
> +
> +static const struct of_device_id jh7110_stgcrg_match[] = {
> +       { .compatible = "starfive,jh7110-stgcrg" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_stgcrg_match);
> +
> +static struct platform_driver jh7110_stgcrg_driver = {
> +       .probe = jh7110_stgcrg_probe,
> +       .driver = {
> +               .name = "clk-starfive-jh7110-stg",
> +               .of_match_table = jh7110_stgcrg_match,
> +       },
> +};
> +module_platform_driver(jh7110_stgcrg_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");

Again
MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");

> +MODULE_DESCRIPTION("StarFive JH7110 System-Top-Group clock driver");
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
