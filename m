Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D57C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LbUz5Gn4rlhWTYM+SJAjvKhAeylmjseYH2cc4rDq/A=; b=CYea6PGIax+vCi
	rV6vZyGb1Jbm7N3+jcPvEcU91osMy5XWOl8kvenJzqnz0BMaXbdKfd4E1TdjoemJvSbU19esiz9rH
	EG3lcbljI/oFb5ABhYblCv52P+gQDCZubIUhY1SB1hHkFfzV5UHKvJ9sU9KvLZlRKoZu+03kUGHpz
	G+X5xhg10i1qtj5SWP4v7JcluU202wMj55D4qBWGQ8YOYdS5bjzX5dN6DpUEsfNOBATnVXVM6T+HF
	jBl+EEz7v3TwLJ8q4SY+aMfL3NlmrgXzO7FXFy7Oq558l0gvPYq8/YRbDzoCFfXv9Anxt6fEJYhIO
	P3zPD7WvqV2udMWMbIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paQDM-00CPfH-36; Fri, 10 Mar 2023 00:02:28 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paQDI-00CPeY-4U
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 00:02:26 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 02BA33F591
	for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 00:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678406539;
	bh=BoSkneUy12T8t+j3LhsvuTkbzqLXyS0o4aZ72Mu8r5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SairPqm+dG5DflxecNB57vQ9HD7udPdi26TCCt9oGaWSE6snFFjszhLBgjfOGdljL
	 wSTbFITTVn8QBkoZ1P4l8+w5egl2Z41Qj2YKmLAVMQbxE0pymsRF1BxP+N+1dn1MnG
	 zm0tCDWBrEjjTbEndz1p9xDe/x1jfQDLhKl8eagOgOyaRdos7Adpj+iHpiCag5kOJc
	 TKfaOmTJ4FI8daUCUzwFwuFFsejzWYA9GUAaKgRLqoiCSs6TClWzn2b37aM/oUD3QR
	 IYsLl+u8jWVxJXj8G7ZqwPQXU9/DopxKuCW6TeoTWhcAc1my88Tpv5vgSEIRm7H5pD
	 SNoYB5wEJzB6A==
Received: by mail-qt1-f197.google.com with SMTP id k13-20020ac8074d000000b003bfd04a3cbcso2009212qth.16
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 16:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678406538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoSkneUy12T8t+j3LhsvuTkbzqLXyS0o4aZ72Mu8r5A=;
        b=0qIIQbmuqPveg3GuBXbux1X4UrlQCN6zbznpxKxFPGllqyWA9SZ8JpyVY4hw+a3u+4
         NsiK/woZeptAaVFhNvDwBcD2gFzVw5TMOkZNT93RNQ3p1L/Cof9yrw3Q6qitHShShr74
         I6jwtxTuRmaUGOoMGqYOm63y+59AoyZkqh3NWnBYzq5Ibh1rC7Rq2pgwq86dp2vHtpRV
         qFJ2vQ+PUaR5t8Wej97U3xWbEeN2t6fy1C/0uG0uBfoepsNDI51SXyWDLhfo8KCrCHa9
         jLY6+kCNjTfmhiK3VXVwVHltkzJXVAQnxtQxVFWQW+q55gwdC6qyT5eTqTE5Qp8FKVxV
         eVlg==
X-Gm-Message-State: AO0yUKW3iUI631y2DCfNInyvALSyc6f0pQTLkBQj2TwA0szCkZymCcjG
	1acJJROtneFsGmXzw3IYgjHGyyq7rtCMxQLjKqrI/bJ4gS0VVtYxUJczpelaPquJP4mhObAp8jB
	wWh0v/kD87qIsaH9WuEwsOFQ6C/U0zt6/8VdEBhXmFfp+4mi/fOxOGfuUp5UUJg==
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id o26-20020ac8429a000000b003bfbba869b0mr6312070qtl.5.1678406538049;
        Thu, 09 Mar 2023 16:02:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8fRvxdpfPVM2OPFg9A6xTfRqxPsgiTT/xuGVJfVz9pB5Ua2+ICgn69kaCOjlMNrWxSkchQ8EYhFTim0wfP3xE=
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id
 o26-20020ac8429a000000b003bfbba869b0mr6312054qtl.5.1678406537745; Thu, 09 Mar
 2023 16:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-7-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-7-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 10 Mar 2023 01:02:01 +0100
Message-ID: <CAJM55Z_YUXbny3NR7xLRu1ekzkgOsx2wgBWmCoQ5peMkN+fV_Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] net: stmmac: Add glue layer for StarFive JH7110 SoC
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_160224_576216_B9794137 
X-CRM114-Status: GOOD (  40.83  )
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

On Fri, 3 Mar 2023 at 10:01, Samin Guo <samin.guo@starfivetech.com> wrote:
>
> This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 125 ++++++++++++++++++
>  4 files changed, 139 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e236b7c7fd2..91a4f190c827 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19916,6 +19916,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Samin Guo <samin.guo@starfivetech.com>
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/net/dwmac-starfive.c
>  F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>
>  STARFIVE JH71X0 CLOCK DRIVERS
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index f77511fe4e87..47fbccef9d04 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
>           for the stmmac device driver. This driver is used for
>           arria5 and cyclone5 FPGA SoCs.
>
> +config DWMAC_STARFIVE
> +       tristate "StarFive dwmac support"
> +       depends on OF  && (ARCH_STARFIVE || COMPILE_TEST)
> +       depends on STMMAC_ETH
> +       default ARCH_STARFIVE
> +       help
> +         Support for ethernet controllers on StarFive RISC-V SoCs
> +
> +         This selects the StarFive platform specific glue layer support for
> +         the stmmac device driver. This driver is used for StarFive JH7110
> +         ethernet controller.
> +
>  config DWMAC_STI
>         tristate "STi GMAC support"
>         default ARCH_STI
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 057e4bab5c08..8738fdbb4b2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_OXNAS)     += dwmac-oxnas.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        += dwmac-qcom-ethqos.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)   += dwmac-rk.o
>  obj-$(CONFIG_DWMAC_SOCFPGA)    += dwmac-altr-socfpga.o
> +obj-$(CONFIG_DWMAC_STARFIVE)   += dwmac-starfive.o
>  obj-$(CONFIG_DWMAC_STI)                += dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)      += dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)      += dwmac-sunxi.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> new file mode 100644
> index 000000000000..566378306f67
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * StarFive DWMAC platform driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + *
> + */
> +
> +#include <linux/of_device.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct starfive_dwmac {
> +       struct device *dev;
> +       struct clk *clk_tx;
> +       struct clk *clk_gtx;
> +       bool tx_use_rgmii_rxin_clk;
> +};
> +
> +static void starfive_eth_fix_mac_speed(void *priv, unsigned int speed)
> +{
> +       struct starfive_dwmac *dwmac = priv;
> +       unsigned long rate;
> +       int err;
> +
> +       /* Generally, the rgmii_tx clock is provided by the internal clock,
> +        * which needs to match the corresponding clock frequency according
> +        * to different speeds. If the rgmii_tx clock is provided by the
> +        * external rgmii_rxin, there is no need to configure the clock
> +        * internally, because rgmii_rxin will be adaptively adjusted.
> +        */
> +       if (dwmac->tx_use_rgmii_rxin_clk)
> +               return;
> +
> +       switch (speed) {
> +       case SPEED_1000:
> +               rate = 125000000;
> +               break;
> +       case SPEED_100:
> +               rate = 25000000;
> +               break;
> +       case SPEED_10:
> +               rate = 2500000;
> +               break;
> +       default:
> +               dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +               break;
> +       }
> +
> +       err = clk_set_rate(dwmac->clk_tx, rate);

Hi Samin,

I tried exercising this code by forcing the interface to downgrade
from 1000Mbps to 100Mbps (ethtool -s end0 speed 100), and it doesn't
seem to work. The reason is that clk_tx is a mux, and when you call
clk_set_rate it will try to find the parent with the closest clock
rate instead of adjusting the current parent as is needed here.
However that is easily fixed by calling clk_set_rate on clk_gtx which
is just a gate that *will* propagate the rate change to the parent.

With this change, this piece of code and downgrading from 1000Mbps to
100Mbps works on the JH7100. However on the JH7110 there is a second
problem. The parent of clk_gtx, confusingly called
clk_gmac{0,1}_gtxclk is a divider (and gate) that takes the 1GHz PLL0
clock and divides it by some integer. But according to [1] it can at
most divide by 15 which is not enough to generate the 25MHz clock
needed for 100Mbps. So now I wonder how this is supposed to work on
the JH7110.

[1]: https://doc-en.rvspace.org/JH7110/TRM/JH7110_TRM/sys_crg.html#sys_crg__section_skz_fxm_wsb

> +       if (err)
> +               dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +}
> +
> +static int starfive_dwmac_probe(struct platform_device *pdev)
> +{
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct stmmac_resources stmmac_res;
> +       struct starfive_dwmac *dwmac;
> +       int err;
> +
> +       err = stmmac_get_platform_resources(pdev, &stmmac_res);
> +       if (err)
> +               return err;
> +
> +       plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +       if (IS_ERR(plat_dat)) {
> +               dev_err(&pdev->dev, "dt configuration failed\n");
> +               return PTR_ERR(plat_dat);
> +       }
> +
> +       dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +       if (!dwmac)
> +               return -ENOMEM;
> +
> +       dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> +       if (IS_ERR(dwmac->clk_tx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> +                                   "error getting tx clock\n");
> +
> +       dwmac->clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
> +       if (IS_ERR(dwmac->clk_gtx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtx),
> +                                   "error getting gtx clock\n");
> +
> +       if (device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
> +               dwmac->tx_use_rgmii_rxin_clk = true;
> +
> +       dwmac->dev = &pdev->dev;
> +       plat_dat->fix_mac_speed = starfive_eth_fix_mac_speed;
> +       plat_dat->init = NULL;
> +       plat_dat->bsp_priv = dwmac;
> +       plat_dat->dma_cfg->dche = true;
> +
> +       err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +       if (err) {
> +               stmmac_remove_config_dt(pdev, plat_dat);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id starfive_dwmac_match[] = {
> +       { .compatible = "starfive,jh7110-dwmac" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> +
> +static struct platform_driver starfive_dwmac_driver = {
> +       .probe  = starfive_dwmac_probe,
> +       .remove = stmmac_pltfr_remove,
> +       .driver = {
> +               .name = "starfive-dwmac",
> +               .pm = &stmmac_pltfr_pm_ops,
> +               .of_match_table = starfive_dwmac_match,
> +       },
> +};
> +module_platform_driver(starfive_dwmac_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("StarFive DWMAC platform driver");
> +MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
> +MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
> --
> 2.17.1
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
