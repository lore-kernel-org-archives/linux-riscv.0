Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464B5C77B6C
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+V9jsMOQC9deMi0t5pFIkOz5LYnLRnwk4TJ/0aP7ts=; b=GSwzbT8fSoMzzi
	fY1nteBEyH7uKNxEV/HOZwVG3SUKYY2Oh5vFy+1k1J24DCfFyF/+2EuOknak7t3eMfm+VSwJrrkYi
	5nMoNASKQbDTYeIQGraGLoByCv9WAKJvGY0BMz9D6uK0mIShw/4epOnZHGUYFE1ybumsESuDt3klA
	IXp/blGTihhMVJzDLmBX+OSv85b/MDk/kbH8eyKycTnvEQnwr0X1kjDE+R/MPHfQncGWjjz1iw6Un
	Q2B6cVo+9fOBfWeBkf/u/EFcFJsAFuNleEfX1bsF/nBx9bck8Bwr4dniwuCc7FKGsTMPnCxc2uD88
	H9aUhZwaq4QZYexRRNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plCP8-00Ccik-1m;
	Sat, 08 Apr 2023 17:31:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plCP3-00Ccgq-27
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 17:31:08 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9FC833F23B
	for <linux-riscv@lists.infradead.org>; Sat,  8 Apr 2023 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680975050;
	bh=x9KWRT4xog/ngy4GL49raWCNQIsW6oOkwv79lX+JQvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HpG2vxKjFUTGfqZPUpC4hEAdW3q1tKNov2o/TWi4SaxoopNFk3GVEOQV+sLJmxzB8
	 xUbz1rBdrCwLLFxG6tqQDkM9k9/m9N4+XZjoHJ4asU1i0MIp/+UjGMAQgrUPbKZGfw
	 6kfFBcPblWy6cW1aKrlbDRJuwcn49KQyJG6vTQ2KWxYPxk25cyhSieYXmMkCGyewdc
	 zJb+2zdXf0f+RhS0EFBO8jgtg1vQc/d/QKK1upD7nIim0uUT4ZLHzXejXb6evVjgpv
	 TONT34B19AclCtTqkJAUGqji5804xoQGcLqvJx7oYctzRDfqL2MpWmzTbW2BkcrBYb
	 Q1azrpZnrHx5A==
Received: by mail-qt1-f200.google.com with SMTP id h20-20020a05622a171400b003dfd61e8594so1132915qtk.15
        for <linux-riscv@lists.infradead.org>; Sat, 08 Apr 2023 10:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680975049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9KWRT4xog/ngy4GL49raWCNQIsW6oOkwv79lX+JQvg=;
        b=r7ZR7vMKtthmb9u/MY7MRbjjadXhi0CewmEwu2P/B0tIpUWVgmUWti6UKevXCxyBPZ
         BQ/nN8So3OVuRzVQRe1uQu+3IzCJma85/SpuTvEGWUII83yQ34NLTc4WJMku9xzMgnuy
         Rn/PB8QGmw/PwBth3J2BZ8DgBpWT7T6nimS1hgKTYcF8iX6xCkavzGBZtj4w8DqXlbZP
         VQ6CtpNucSWlVX5TC4O0xe8AaHUVq4ezOXJFvrntiAB4Z/4PN3zy2B7NBn10u1zroMKr
         l8XobZy4JtJ4nTzGruP3mGe5TVb4OFunBgpc6A3aTTYGD/taMC7Fu0CgY5R0vYbIOoM8
         mqtA==
X-Gm-Message-State: AAQBX9dq0Grfoiuuwee2dDXiYlGacxz6Hrp0LZgHckKoge46LPmXyyZC
	DWhpfwjXCdkOUfcEYd05A/BiY+IVx8JCPTeiTl+EiN0JeoOGhiYzHv9hiiS1Mxywq3y43DGdHCd
	POPK1EK54N6zth+ZpNNMx3uXQJbCIVyM7QyAqt2zGa3zht8J7rxVztT8Z50xuRA==
X-Received: by 2002:a05:620a:1a95:b0:746:9174:3d3c with SMTP id bl21-20020a05620a1a9500b0074691743d3cmr794289qkb.13.1680975049152;
        Sat, 08 Apr 2023 10:30:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aB0C5v/S2vwLF85CjFKwCbcNauCS5fF7OfaV3dGX3/2Xmx2wPoJxtTVSxZbRWbzfwrkOnTQmQoOH+2jlbwedU=
X-Received: by 2002:a05:620a:1a95:b0:746:9174:3d3c with SMTP id
 bl21-20020a05620a1a9500b0074691743d3cmr794264qkb.13.1680975048818; Sat, 08
 Apr 2023 10:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230407110356.8449-1-samin.guo@starfivetech.com>
 <20230407110356.8449-6-samin.guo@starfivetech.com> <CAJM55Z9jCdPASsk+fw_j+9QH3+Kj28tpCA4PgW_nB_ce7qWL8w@mail.gmail.com>
 <b8764e20-f983-177c-63c5-36bb3b57ba9e@starfivetech.com>
In-Reply-To: <b8764e20-f983-177c-63c5-36bb3b57ba9e@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sat, 8 Apr 2023 19:30:32 +0200
Message-ID: <CAJM55Z8jSPz70ri_sFnKMjZDoNvoA=K-o7VCeAMmXztzOKRxaA@mail.gmail.com>
Subject: Re: [-net-next v11 5/6] net: stmmac: Add glue layer for StarFive
 JH7110 SoC
To: Guo Samin <samin.guo@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Pedro Moreira <pmmoreir@synopsys.com>, Richard Cochran <richardcochran@gmail.com>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_103105_865695_E63F1F99 
X-CRM114-Status: GOOD (  46.19  )
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

On Sat, 8 Apr 2023 at 03:16, Guo Samin <samin.guo@starfivetech.com> wrote:
>
>  Re: [-net-next v11 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> to: Samin Guo <samin.guo@starfivetech.com>
> data: 2023/4/8
>
> > On Fri, 7 Apr 2023 at 13:05, Samin Guo <samin.guo@starfivetech.com> wrote:
> >>
> >> This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
> >>
> >> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> >> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> >> ---
> >>  MAINTAINERS                                   |   1 +
> >>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
> >>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 123 ++++++++++++++++++
> >>  4 files changed, 137 insertions(+)
> >>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 6b6b67468b8f..46b366456cee 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -19910,6 +19910,7 @@ M:      Emil Renner Berthing <kernel@esmil.dk>
> >>  M:     Samin Guo <samin.guo@starfivetech.com>
> >>  S:     Maintained
> >>  F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> >> +F:     drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> >>
> >>  STARFIVE JH7100 CLOCK DRIVERS
> >>  M:     Emil Renner Berthing <kernel@esmil.dk>
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> index f77511fe4e87..5f5a997f21f3 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
> >>           for the stmmac device driver. This driver is used for
> >>           arria5 and cyclone5 FPGA SoCs.
> >>
> >> +config DWMAC_STARFIVE
> >> +       tristate "StarFive dwmac support"
> >> +       depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
> >> +       select MFD_SYSCON
> >> +       default m if ARCH_STARFIVE
> >> +       help
> >> +         Support for ethernet controllers on StarFive RISC-V SoCs
> >> +
> >> +         This selects the StarFive platform specific glue layer support for
> >> +         the stmmac device driver. This driver is used for StarFive JH7110
> >> +         ethernet controller.
> >> +
> >>  config DWMAC_STI
> >>         tristate "STi GMAC support"
> >>         default ARCH_STI
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> index 057e4bab5c08..8738fdbb4b2d 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> @@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_OXNAS)     += dwmac-oxnas.o
> >>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        += dwmac-qcom-ethqos.o
> >>  obj-$(CONFIG_DWMAC_ROCKCHIP)   += dwmac-rk.o
> >>  obj-$(CONFIG_DWMAC_SOCFPGA)    += dwmac-altr-socfpga.o
> >> +obj-$(CONFIG_DWMAC_STARFIVE)   += dwmac-starfive.o
> >>  obj-$(CONFIG_DWMAC_STI)                += dwmac-sti.o
> >>  obj-$(CONFIG_DWMAC_STM32)      += dwmac-stm32.o
> >>  obj-$(CONFIG_DWMAC_SUNXI)      += dwmac-sunxi.o
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> >> new file mode 100644
> >> index 000000000000..4963d4008485
> >> --- /dev/null
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> >> @@ -0,0 +1,123 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * StarFive DWMAC platform driver
> >> + *
> >> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + *
> >> + */
> >> +
> >> +#include <linux/mfd/syscon.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/regmap.h>
> >> +
> >> +#include "stmmac_platform.h"
> >> +
> >> +struct starfive_dwmac {
> >> +       struct device *dev;
> >> +       struct clk *clk_tx;
> >> +};
> >> +
> >> +static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
> >> +{
> >> +       struct starfive_dwmac *dwmac = priv;
> >> +       unsigned long rate;
> >> +       int err;
> >> +
> >> +       rate = clk_get_rate(dwmac->clk_tx);
> >
> > Hi Samin,
> >
> > I'm not sure why you added this line in this revision. If it's just to
> > not call clk_set_rate on the uninitialized rate, I'd much rather you
> > just returned early and don't call clk_set_rate at all in case of
> > errors.
> >
> >> +
> >> +       switch (speed) {
> >> +       case SPEED_1000:
> >> +               rate = 125000000;
> >> +               break;
> >> +       case SPEED_100:
> >> +               rate = 25000000;
> >> +               break;
> >> +       case SPEED_10:
> >> +               rate = 2500000;
> >> +               break;
> >> +       default:
> >> +               dev_err(dwmac->dev, "invalid speed %u\n", speed);
> >> +               break;
> >
> > That is skip the clk_get_rate above and just change this break to a return.
> >
>
> Hi Emil,
>
> We used the solution you mentioned before V3, but Arun Ramadoss doesn't think that's great.
> (https://patchwork.kernel.org/project/linux-riscv/patch/20230106030001.1952-6-yanhong.wang@starfivetech.com)
>
>
> > +static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int
> > speed)
> > +{
> > +     struct starfive_dwmac *dwmac = priv;
> > +     unsigned long rate;
> > +     int err;
> > +
> > +     switch (speed) {
> > +     case SPEED_1000:
> > +             rate = 125000000;
> > +             break;
> > +     case SPEED_100:
> > +             rate = 25000000;
> > +             break;
> > +     case SPEED_10:
> > +             rate = 2500000;
> > +             break;
> > +     default:
> > +             dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +             return;
>
> Do we need to return value, since it is invalid speed. But the return
> value of function is void.(Arun Ramadoss)
>
>
> So in v9, after discussing with Jakub Kicinski, the clk_set_rate was used to initialize the rate.
> (It is a reference to Intel's scheme:    dwmac-intel-plat.c: kmb_eth_fix_mac_speed)
> (https://patchwork.kernel.org/project/linux-riscv/patch/20230328062009.25454-6-samin.guo@starfivetech.com)
>

Yeah, I think this is a misunderstanding and Arun is considering if we
ought to return the error which we can't without changing generic
dwmac code, and Jakub is rightly concerned about using a local
variable uninitialized. I don't think anyone is suggesting that
getting the rate just to set it to the exact same value is better than
just leaving the clock alone.

> Best regards,
> Samin
> >> +       }
> >> +
> >> +       err = clk_set_rate(dwmac->clk_tx, rate);
> >> +       if (err)
> >> +               dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> >> +}
> >> +
> >> +static int starfive_dwmac_probe(struct platform_device *pdev)
> >> +{
> >> +       struct plat_stmmacenet_data *plat_dat;
>  cons>> +       struct stmmac_resources stmmac_res;
> >> +       struct starfive_dwmac *dwmac;
> >> +       struct clk *clk_gtx;
> >> +       int err;
> >> +
> >> +       err = stmmac_get_platform_resources(pdev, &stmmac_res);
> >> +       if (err)
> >> +               return dev_err_probe(&pdev->dev, err,
> >> +                                    "failed to get resources\n");
> >> +
> >> +       plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> >> +       if (IS_ERR(plat_dat))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
> >> +                                    "dt configuration failed\n");
> >> +
> >> +       dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> >> +       if (!dwmac)
> >> +               return -ENOMEM;
> >> +
> >> +       dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> >> +       if (IS_ERR(dwmac->clk_tx))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> >> +                                    "error getting tx clock\n");
> >> +
> >> +       clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
> >> +       if (IS_ERR(clk_gtx))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
> >> +                                    "error getting gtx clock\n");
> >> +
> >> +       /* Generally, the rgmii_tx clock is provided by the internal clock,
> >> +        * which needs to match the corresponding clock frequency according
> >> +        * to different speeds. If the rgmii_tx clock is provided by the
> >> +        * external rgmii_rxin, there is no need to configure the clock
> >> +        * internally, because rgmii_rxin will be adaptively adjusted.
> >> +        */
> >> +       if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
> >> +               plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
> >> +
> >> +       dwmac->dev = &pdev->dev;
> >> +       plat_dat->bsp_priv = dwmac;
> >> +       plat_dat->dma_cfg->dche = true;
> >> +
> >> +       err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> >> +       if (err) {
> >> +               stmmac_remove_config_dt(pdev, plat_dat);
> >> +               return err;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct of_device_id starfive_dwmac_match[] = {
> >> +       { .compatible = "starfive,jh7110-dwmac" },
> >> +       { /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> >> +
> >> +static struct platform_driver starfive_dwmac_driver = {
> >> +       .probe  = starfive_dwmac_probe,
> >> +       .remove = stmmac_pltfr_remove,
> >> +       .driver = {
> >> +               .name = "starfive-dwmac",
> >> +               .pm = &stmmac_pltfr_pm_ops,
> >> +               .of_match_table = starfive_dwmac_match,
> >> +       },
> >> +};
> >> +module_platform_driver(starfive_dwmac_driver);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_DESCRIPTION("StarFive DWMAC platform driver");
> >> +MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
> >> +MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
> >> --
> >> 2.17.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> --
> Best regards,
> Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
