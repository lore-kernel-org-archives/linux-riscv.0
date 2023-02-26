Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A3C6FA8E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AcNg3xm05wTX7G1wXcjX+/EoLwjwBSwH4eS1x30GPs=; b=LBhvJGWoxYDIAg
	80gSTdED6XPqqjBEAZMYRP/Ozt1zYwYZTBWOGsxj3Sbp5XlOuwXWtWhuSifLiWlTazy0aGOPu82VK
	fbjyySKja7PYm9ZLPztf1TyrJ2Ek6qZhj2kl+VLO4/UBoTk/zf/FN1NxQk0r7O5uX+uYp0SPMDpq+
	L7PE5CkKF4IXMwIUSTMZFhaFqLRTlJlPnaw+Pd7GTt7yC7Rmi8h234STH9x37xOfdnbitPs2gEgFj
	4iwm3ifNUjZ82xJoTTSoTh7/SSnPr20CciyIQY7WC739qSzZJgElxtg0gNG4S6fMw4I2sW03NkrCg
	F147n+KOuNoqKDxVaHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWKvj-007dK3-O9; Sun, 26 Feb 2023 17:35:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWKvg-007dJ2-BU
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 17:35:22 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D99463F59A
	for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677432909;
	bh=YzJInT96pTA+ymOnmGE57Cqc0IdxWM9wsQYeSdM/SNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sN4/rLZA2zZhs9vv+iIP/LjaRHiqnIT7I4DHIS+KnxLQ+VVlxdP/r8bDy7ErmG8sD
	 AueWMTtfe09bkixHGCtGdH5c77fDpiJBs7PNXu3lD3AFijBJ8P2vlrE32wuv9x6P/c
	 44JhyV1bdJC0NwHdCtnvwijRofx8CtEd2Y/kiG9+QsA94WHOKzJQc1y+pxnNfipILS
	 a9IuicETLkgTfOWlpVwAcpMIhddC549icRF7gWazfnIrLSZ3NGMaG3Yq3vFmsD7KAS
	 BwYpSuEbbl4wPjefdcJYGcZy+Y3W58VlIWl9i3Y7SAxhN3csrAwBMi9LXMBEWGn4t7
	 Sho12M6ATyEhw==
Received: by mail-qv1-f71.google.com with SMTP id d27-20020a0caa1b000000b00572765a687cso2223550qvb.19
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 09:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzJInT96pTA+ymOnmGE57Cqc0IdxWM9wsQYeSdM/SNk=;
        b=3/xBZanqFlfGZqFKK78c7o6sSkQLcdrt7edPebL/fP0eq5PEQOGCjbyKX2cr3vTduS
         2bDDgVtfaR503L4Dk/LHRV5h5itcHgQMLc8oiG7fn7vRG/IqOpVzmaOkpaqH1LZCKYLT
         nFQ+KpRr49fQ8kQlaiB0tVwTI7QlgtvYhMkN4J5xsxn8v9WDouO8jR/tx+3TrzT38tb/
         ph2TKQd4FPj4NJdFTosaH3LsCJmwQSn6z5CysMENXUXbdTkRGVzdre+8fn368PW9+aUf
         qYEAzUCPxtcBdehS3ypuHlnVmetF3uo2rza81e6ZHJ37RoHQZLN5WXM5dpXKqKz1uXMB
         iAzg==
X-Gm-Message-State: AO0yUKWhIsbqdgSmOFruYBmNZEOayfXg4z9B9wZeU44MYFUaeSNi0/mT
	LQ1qXNnsQZGIPnXwhPgR2bFUHr+gtJpMWUqPkgguIjR36JOO+pxyxdENMq2PCdFgf4UL9riN/W1
	5gfL+G2U62RtvoFWPwlb0NLQA+p+zbUijEYyJ59fz8B8CWEuv4B4rFafsoVRoHw==
X-Received: by 2002:ae9:e313:0:b0:742:8868:bfd1 with SMTP id v19-20020ae9e313000000b007428868bfd1mr1166143qkf.7.1677432908731;
        Sun, 26 Feb 2023 09:35:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9BXYFSOOlk2zOJO6RrcT38DTR0BZk0TAwIX1vzvwZTnIkrIdaNkQp74wf07gDqRON2gxEvF2Ad+MAIDgNUu1g=
X-Received: by 2002:ae9:e313:0:b0:742:8868:bfd1 with SMTP id
 v19-20020ae9e313000000b007428868bfd1mr1166127qkf.7.1677432908466; Sun, 26 Feb
 2023 09:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com> <20230221024645.127922-13-hal.feng@starfivetech.com>
In-Reply-To: <20230221024645.127922-13-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 26 Feb 2023 18:34:52 +0100
Message-ID: <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_093520_572844_E7C525A4 
X-CRM114-Status: GOOD (  33.64  )
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

On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add driver for the StarFive JH7110 always-on clock controller
> and register an auxiliary device for always-on reset controller
> which is named as "reset-aon".
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  11 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-aon.c    | 156 ++++++++++++++++++
>  3 files changed, 168 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 4640d0665d1c..2aa664f2cdee 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -31,3 +31,14 @@ config CLK_STARFIVE_JH7110_SYS
>         help
>           Say yes here to support the system clock controller on the
>           StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_AON
> +       tristate "StarFive JH7110 always-on clock support"
> +       depends on CLK_STARFIVE_JH7110_SYS
> +       select AUXILIARY_BUS
> +       select CLK_STARFIVE_JH71X0
> +       select RESET_STARFIVE_JH7110
> +       default CLK_STARFIVE_JH7110_SYS

As far as I can tell the JH7110 boots fine without this driver and it
already depends on the _SYS driver above, so please do

default m if SOC_STARFIVE

And consider helping Conor by changing all the SOC_STARFIVE instances
to ARCH_STARFIVE for the next version.

> +       help
> +         Say yes here to support the always-on clock controller on the
> +         StarFive JH7110 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 5ca4e887fb9c..f3df7d957b1e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100)       += clk-starfive-jh7100.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)        += clk-starfive-jh7100-audio.o
>
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)  += clk-starfive-jh7110-sys.o
> +obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-aon.c b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
> new file mode 100644
> index 000000000000..da808dc93048
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 Always-On Clock Driver
> + *
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +/* external clocks */
> +#define JH7110_AONCLK_OSC              (JH7110_AONCLK_END + 0)
> +#define JH7110_AONCLK_RTC_OSC          (JH7110_AONCLK_END + 1)
> +#define JH7110_AONCLK_GMAC0_RMII_REFIN (JH7110_AONCLK_END + 2)
> +#define JH7110_AONCLK_GMAC0_RGMII_RXIN (JH7110_AONCLK_END + 3)
> +#define JH7110_AONCLK_STG_AXIAHB       (JH7110_AONCLK_END + 4)
> +#define JH7110_AONCLK_APB_BUS          (JH7110_AONCLK_END + 5)
> +#define JH7110_AONCLK_GMAC0_GTXCLK     (JH7110_AONCLK_END + 6)
> +
> +static const struct jh71x0_clk_data jh7110_aonclk_data[] = {
> +       /* source */
> +       JH71X0__DIV(JH7110_AONCLK_OSC_DIV4, "osc_div4", 4, JH7110_AONCLK_OSC),
> +       JH71X0__MUX(JH7110_AONCLK_APB_FUNC, "apb_func", 2,
> +                   JH7110_AONCLK_OSC_DIV4,
> +                   JH7110_AONCLK_OSC),
> +       /* gmac0 */
> +       JH71X0_GATE(JH7110_AONCLK_GMAC0_AHB, "gmac0_ahb", 0, JH7110_AONCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_AONCLK_GMAC0_AXI, "gmac0_axi", 0, JH7110_AONCLK_STG_AXIAHB),
> +       JH71X0__DIV(JH7110_AONCLK_GMAC0_RMII_RTX, "gmac0_rmii_rtx", 30,
> +                   JH7110_AONCLK_GMAC0_RMII_REFIN),
> +       JH71X0_GMUX(JH7110_AONCLK_GMAC0_TX, "gmac0_tx", 0, 2,
> +                   JH7110_AONCLK_GMAC0_GTXCLK,
> +                   JH7110_AONCLK_GMAC0_RMII_RTX),
> +       JH71X0__INV(JH7110_AONCLK_GMAC0_TX_INV, "gmac0_tx_inv", JH7110_AONCLK_GMAC0_TX),
> +       JH71X0__MUX(JH7110_AONCLK_GMAC0_RX, "gmac0_rx", 2,
> +                   JH7110_AONCLK_GMAC0_RGMII_RXIN,
> +                   JH7110_AONCLK_GMAC0_RMII_RTX),
> +       JH71X0__INV(JH7110_AONCLK_GMAC0_RX_INV, "gmac0_rx_inv", JH7110_AONCLK_GMAC0_RX),
> +       /* otpc */
> +       JH71X0_GATE(JH7110_AONCLK_OTPC_APB, "otpc_apb", CLK_IGNORE_UNUSED, JH7110_AONCLK_APB_BUS),
> +       /* rtc */
> +       JH71X0_GATE(JH7110_AONCLK_RTC_APB, "rtc_apb", CLK_IGNORE_UNUSED, JH7110_AONCLK_APB_BUS),
> +       JH71X0__DIV(JH7110_AONCLK_RTC_INTERNAL, "rtc_internal", 1022, JH7110_AONCLK_OSC),
> +       JH71X0__MUX(JH7110_AONCLK_RTC_32K, "rtc_32k", 2,
> +                   JH7110_AONCLK_RTC_OSC,
> +                   JH7110_AONCLK_RTC_INTERNAL),
> +       JH71X0_GATE(JH7110_AONCLK_RTC_CAL, "rtc_cal", 0, JH7110_AONCLK_OSC),
> +};

This list also contains instances of the CLK_IGNORE_UNUSED flag. Again
please go through them and figure out which clocks are critical and
which are fine to turn off when not used.

> +
> +static struct clk_hw *jh7110_aonclk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct jh71x0_clk_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7110_AONCLK_END)
> +               return &priv->reg[idx].hw;
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int jh7110_aoncrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_AONCLK_END),
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
> +       for (idx = 0; idx < JH7110_AONCLK_END; idx++) {
> +               u32 max = jh7110_aonclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_aonclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_aonclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_aonclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_AONCLK_END)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx == JH7110_AONCLK_OSC)
> +                               parents[i].fw_name = "osc";
> +                       else if (pidx == JH7110_AONCLK_RTC_OSC)
> +                               parents[i].fw_name = "rtc_osc";
> +                       else if (pidx == JH7110_AONCLK_GMAC0_RMII_REFIN)
> +                               parents[i].fw_name = "gmac0_rmii_refin";
> +                       else if (pidx == JH7110_AONCLK_GMAC0_RGMII_RXIN)
> +                               parents[i].fw_name = "gmac0_rgmii_rxin";
> +                       else if (pidx == JH7110_AONCLK_STG_AXIAHB)
> +                               parents[i].fw_name = "stg_axiahb";
> +                       else if (pidx == JH7110_AONCLK_APB_BUS)
> +                               parents[i].fw_name = "apb_bus";
> +                       else if (pidx == JH7110_AONCLK_GMAC0_GTXCLK)
> +                               parents[i].fw_name = "gmac0_gtxclk";
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
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_aonclk_get, priv);
> +       if (ret)
> +               return ret;
> +
> +       return jh7110_reset_controller_register(priv, "reset-aon", 1);
> +}
> +
> +static const struct of_device_id jh7110_aoncrg_match[] = {
> +       { .compatible = "starfive,jh7110-aoncrg" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_aoncrg_match);
> +
> +static struct platform_driver jh7110_aoncrg_driver = {
> +       .probe = jh7110_aoncrg_probe,
> +       .driver = {
> +               .name = "clk-starfive-jh7110-aon",
> +               .of_match_table = jh7110_aoncrg_match,
> +       },
> +};
> +module_platform_driver(jh7110_aoncrg_driver);
> +
> +MODULE_AUTHOR("Emil Renner Berthing");
> +MODULE_DESCRIPTION("StarFive JH7110 always-on clock driver");
> +MODULE_LICENSE("GPL");
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
