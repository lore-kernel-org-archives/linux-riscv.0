Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5642DC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htKxTJApJtb5OuIgDkdEKBV4DYYwDFxCSKhGcmyZP5o=; b=4WIoz/hrJC6GMe
	xZAgTyosFYrj2HM1774Bc/UTgsBkRV9W5cNE7j3GIvM432Sx1/G+exWovGTDNffUWuV61Ty/Z2uuL
	32byti3yVfBLg6SvLUz8Gkl4toBWaoX4W2f+C7h+ns2hvejTrNnY/uXEiNf78T0dO2eDveXwGbCTD
	mGOBzgjgEdtN2XXHKlbUvqwPkL+2WWjZTtWjP7h/1rdnYsV3is+4UVfJeFCxDg+lF9y6NPLPc1QsJ
	9qFxF0kx1Tua8y4unN4++qEzx3AMsTXnWJ5TwLmjVb5B+POQUOKXM+1GXRxzcFRtA4yguUQQMPHfS
	gIMWcUgaYgEOZkJhGP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8d0-006qSJ-L2; Fri, 03 Mar 2023 16:51:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8cw-006qRO-Eo
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:51:28 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1813C4168E
	for <linux-riscv@lists.infradead.org>; Fri,  3 Mar 2023 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677862276;
	bh=8104o3BXBuCMBg1EpGwp3Vv0rGGYeWcwxreEU+Uex7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n+fPjrL3WkTrJYCNQc8fq38QIM/Wijq9b4aQR7osKIB1DBeSrosYHCYqs5WCSuHaL
	 IqYS5TQV3xrFqcBdRIz/zco/AfELkuEBLynvcMuoB+3edbiro07Mp67BGVqI7M8Ceh
	 Dvpb2k/jBtfM79y6G8rUCqsXp+LzxW/QcZjVuwbUqfZq0dFrScfpmbtpzH6UcdmurX
	 9ucp+YFChrfLaHnxMsSa1LDLXFGOSRF5EFKv/ftu4F2F4X48BawnDyyTidEb05Sn36
	 NlbB5RE31XYs0UtHVvQaIH/3pn0lrsEbcANOTc2ljl1RDn/tpmHjfDwERvVSGwE78w
	 ci/6wYJyftK1A==
Received: by mail-qv1-f72.google.com with SMTP id d27-20020a0caa1b000000b00572765a687cso1696666qvb.19
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 08:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677862271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8104o3BXBuCMBg1EpGwp3Vv0rGGYeWcwxreEU+Uex7M=;
        b=b+JKMUTkf6+/M1EyEkA7+KQ2xVf0HrNqk6C4+HpLg8JKJ9P4tiPjBB58KV7ePpPsV9
         sKih0a+XvNQbBjv1yBShQJmqhJQvnxNyHj5RizIdsr4CKX8v3e8SwIC68bC149B5fGmN
         QX3IIQEZkN785gQhnHVKA6qwlHXnyGECDzmFRUhXL/vxuQcaan+FId8cAcb2ggflJXua
         TYkH5OXUGF5QkmeL3Fdcn1+p30bsZYkG4tvWgT+ADP779pAJ1cGK7dAgeEU0IOZC06cC
         ROL3tTJu93d1O6T4A5BNSYR+el/aR8hjyq8ys2xUXhZM/e8+QhDQozFVUkLq6gDd47BI
         6Bhg==
X-Gm-Message-State: AO0yUKWrbLydgh2P8zvRq62z2CiIQVL9srzsDVAapTjjBVidLHWHgbBK
	346DrvUZ0QGG9CBYZICx3VM5X9BXvcqvyKy0OSY1QG6gbBXFbZukGCbDOZQF1KBy5JEd7CEc+iC
	PFKnVybY2fnS3MavmPySLBtghIwkgv+4bSJVfc2cjMQEmP+LF6O1ekqUYjljvnA==
X-Received: by 2002:a05:6214:4a45:b0:56e:fbea:9e9a with SMTP id ph5-20020a0562144a4500b0056efbea9e9amr582085qvb.0.1677862271321;
        Fri, 03 Mar 2023 08:51:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+UvCTIlmmgq2C8w/UG8U3QGIr2FvnAWY6e1IjhHGbnhoyZXgaQhdRhu7VVj9s+dyGlIuis3/tJJMBa0vv1UZ0=
X-Received: by 2002:a05:6214:4a45:b0:56e:fbea:9e9a with SMTP id
 ph5-20020a0562144a4500b0056efbea9e9amr582078qvb.0.1677862271002; Fri, 03 Mar
 2023 08:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-9-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-9-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 3 Mar 2023 17:50:54 +0100
Message-ID: <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface settings
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
X-CRM114-CacheID: sfid-20230303_085126_934555_7B2F0CB8 
X-CRM114-Status: GOOD (  27.94  )
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
> dwmac supports multiple modess. When working under rmii and rgmii,
> you need to set different phy interfaces.
>
> According to the dwmac document, when working in rmii, it needs to be
> set to 0x4, and rgmii needs to be set to 0x1.
>
> The phy interface needs to be set in syscon, the format is as follows:
> starfive,syscon: <&syscon, offset, mask>
>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 566378306f67..40fdd7036127 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -7,10 +7,15 @@
>   *
>   */
>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
> +#include <linux/regmap.h>
>
>  #include "stmmac_platform.h"
>
> +#define MACPHYC_PHY_INFT_RMII  0x4
> +#define MACPHYC_PHY_INFT_RGMII 0x1

Please prefix these with something like STARFIVE_DWMAC_

>  struct starfive_dwmac {
>         struct device *dev;
>         struct clk *clk_tx;
> @@ -53,6 +58,46 @@ static void starfive_eth_fix_mac_speed(void *priv, unsigned int speed)
>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>  }
>
> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +       struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> +       struct of_phandle_args args;
> +       struct regmap *regmap;
> +       unsigned int reg, mask, mode;
> +       int err;
> +
> +       switch (plat_dat->interface) {
> +       case PHY_INTERFACE_MODE_RMII:
> +               mode = MACPHYC_PHY_INFT_RMII;
> +               break;
> +
> +       case PHY_INTERFACE_MODE_RGMII:
> +       case PHY_INTERFACE_MODE_RGMII_ID:
> +               mode = MACPHYC_PHY_INFT_RGMII;
> +               break;
> +
> +       default:
> +               dev_err(dwmac->dev, "Unsupported interface %d\n",
> +                       plat_dat->interface);
> +       }
> +
> +       err = of_parse_phandle_with_fixed_args(dwmac->dev->of_node,
> +                                              "starfive,syscon", 2, 0, &args);
> +       if (err) {
> +               dev_dbg(dwmac->dev, "syscon reg not found\n");
> +               return -EINVAL;
> +       }
> +
> +       reg = args.args[0];
> +       mask = args.args[1];
> +       regmap = syscon_node_to_regmap(args.np);
> +       of_node_put(args.np);

I think the above is basically
unsigned int args[2];
syscon_regmap_lookup_by_phandle_args(dwmac->dev_of_node,
"starfive,syscon", 2, args);

..but as Andrew points out another solution is to use platform match
data for this. Eg.

static const struct starfive_dwmac_match_data starfive_dwmac_jh7110_data {
  .phy_interface_offset = 0xc,
  .phy_interface_mask = 0x1c0000,
};

static const struct of_device_id starfive_dwmac_match[] = {
  { .compatible = "starfive,jh7110-dwmac", .data =
&starfive_dwmac_jh7110_data },
  { /* sentinel */ }
};

and in the probe function:

struct starfive_dwmac_match_data *pdata = device_get_match_data(&pdev->dev);

> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return regmap_update_bits(regmap, reg, mask, mode << __ffs(mask));
> +}
> +
>  static int starfive_dwmac_probe(struct platform_device *pdev)
>  {
>         struct plat_stmmacenet_data *plat_dat;
> @@ -93,6 +138,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>         plat_dat->bsp_priv = dwmac;
>         plat_dat->dma_cfg->dche = true;
>
> +       starfive_dwmac_set_mode(plat_dat);

The function returns errors in an int, but you never check it :(

>         err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>         if (err) {
>                 stmmac_remove_config_dt(pdev, plat_dat);
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
