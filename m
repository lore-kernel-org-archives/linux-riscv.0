Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD3C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68kslQx+jZxtuD7n0OUH5/ctq4L+sOEPvuYN4uxiHco=; b=y8Idyen9ycPucQ
	vTSwwgrSQ4x64Xvs+HmA8qSm8+/WSxI8cvlDf5Y2woNhKsxr9BVXVNXVc+idnPmzHtTrKN4kRJiNO
	OH5LNcogXFFKk7+AbldDmdK3rO8+eanOVKODUrQlt0dhv/dh/9+3+4yI4v+OfDUo9b1KfF6m3W/IC
	FmYJFS7LP6xSacMZdBIDpkgRZhJVoL1AqU8JI0SaDeNKwUGs2D09zhzd3Ls1bBXA/xwZqSE4ojbXu
	c6q/cRe/LZqYSauVqIK+EL51q1hqz5sMvuUSnewD7Rmi7VCVcQ+malm9PLSy4M1pPhaguJQMKJQ3Z
	Jwm5/qp8KtA5VF4bEMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhxI-004Z8Z-02;
	Fri, 24 Mar 2023 13:59:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhxE-004Z71-1M
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 13:59:42 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC1294430B
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1679666378;
	bh=0CzCezUBFius1/QvCjfVKLrX7WEPXSwgwzTCxhDCoiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OmUDwCnLqdBtqb3GFy9r6zh6719eF7W6DROxdNM7xgIYzyhAOmAeZzJ1bpxU3/q9C
	 0jfRabi9cOoeQvRqXIjTTWFf+cCqoZkxtwH4VnaXcNF8eFQiM/c5PKqSc13jabGdpJ
	 VfuPS/FOzJ3APRYZfOm0oxiTdBSYW+YPysQOtv0a+YnbfzR2lglz8QdkrxtxWqkpLh
	 jEjLbhBF2HkuJ9CQdD6DXjrNW6nQ9Ue6vNzbmljfxtyuLR2RtV8tNNBuSkYjRDd125
	 xm5VgwJPETDQ5o2xnm60EYEfNWgJRMT5YQGBvxnS/zY+4Q59NaD/qqUJKWI7nXIMJa
	 k7V0K1R74WqeA==
Received: by mail-qv1-f69.google.com with SMTP id z14-20020a0cd78e000000b005adc8684170so1051359qvi.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 06:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679666378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CzCezUBFius1/QvCjfVKLrX7WEPXSwgwzTCxhDCoiA=;
        b=wktOUXR93yRBfgLSEjD3nXbMaqdIMPWaLNExxw9bZtTKIRrBxxgs0XOsizMjIwk13+
         tn/anhcsqSCk+KSvNnp4XDciWApVc7rcCnvPGdwcdNGj1MNEW2f5jy3IHvm8Lx/RldiV
         +Cd6DusxHmRRCJh7SeBDtcqmNnwlXi1d1dFf6cM5qi2tYjWU7fxc0DXtig+qZKelkrU2
         lTT7458FA8eUXEZ36wifEK9xU1xBZtdWKZiJU5jwp7yaRhcVL+gI7XonXvsODUYDdmsY
         xz4xnSR19ZebmFOecCiBV/g5Dk2+6TpeWRDYhadrBps+Le3j7XixFuPrV7eQiGo/e5fR
         KCKg==
X-Gm-Message-State: AO0yUKXfikvtIIpi4aegOBc8+UF9mK5NNU7cLU8qIm/RShjsUBtRbxn1
	5YVf+vJCP0cvlRdREAlIC9R1+FGsnfs5QdplmcluN8uzg04ScQygKgNIsJIf1VLZRIUoFoItC+J
	uye8QuwF4oujSvC0CFE+e8+9KISF9kjQm9kacyKtI09v3spP8VXQg1BIhSTuwxQ==
X-Received: by 2002:a37:a8cf:0:b0:745:8c04:2777 with SMTP id r198-20020a37a8cf000000b007458c042777mr503409qke.13.1679666377807;
        Fri, 24 Mar 2023 06:59:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set+fYwdhVgyb9GNd32TrH8t4Pv6a28VQzyoEpE+xeNGm/T2XLuOweT5dKvtRVRvgDmnoGhBHVQhMCfEkxFGjGIU=
X-Received: by 2002:a37:a8cf:0:b0:745:8c04:2777 with SMTP id
 r198-20020a37a8cf000000b007458c042777mr503392qke.13.1679666377512; Fri, 24
 Mar 2023 06:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230324022819.2324-1-samin.guo@starfivetech.com> <20230324022819.2324-7-samin.guo@starfivetech.com>
In-Reply-To: <20230324022819.2324-7-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 24 Mar 2023 14:59:21 +0100
Message-ID: <CAJM55Z8_W9yOcL+yGAwB-qanD_-bbf16VjCP66P_xDFW6-c+3A@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] net: stmmac: starfive_dmac: Add phy interface settings
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran <richardcochran@gmail.com>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_065940_799566_4C26FCB3 
X-CRM114-Status: GOOD (  27.75  )
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

On Fri, 24 Mar 2023 at 03:30, Samin Guo <samin.guo@starfivetech.com> wrote:
>
> dwmac supports multiple modess. When working under rmii and rgmii,
> you need to set different phy interfaces.
>
> According to the dwmac document, when working in rmii, it needs to be
> set to 0x4, and rgmii needs to be set to 0x1.
>
> The phy interface needs to be set in syscon, the format is as follows:
> starfive,syscon: <&syscon, offset, shift>
>
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index ef5a769b1c75..84690c8f0250 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -13,6 +13,10 @@
>
>  #include "stmmac_platform.h"
>
> +#define STARFIVE_DWMAC_PHY_INFT_RGMII  0x1
> +#define STARFIVE_DWMAC_PHY_INFT_RMII   0x4
> +#define STARFIVE_DWMAC_PHY_INFT_FIELD  0x7U
> +
>  struct starfive_dwmac {
>         struct device *dev;
>         struct clk *clk_tx;
> @@ -44,6 +48,43 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>  }
>
> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +       struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> +       struct regmap *regmap;
> +       unsigned int args[2];
> +       unsigned int mode;
> +
> +       switch (plat_dat->interface) {
> +       case PHY_INTERFACE_MODE_RMII:
> +               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> +               break;
> +
> +       case PHY_INTERFACE_MODE_RGMII:
> +       case PHY_INTERFACE_MODE_RGMII_ID:
> +               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> +               break;
> +
> +       default:
> +               dev_err(dwmac->dev, "unsupported interface %d\n",
> +                       plat_dat->interface);
> +               return -EINVAL;
> +       }
> +
> +       regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
> +                                                     "starfive,syscon",
> +                                                     2, args);
> +       if (IS_ERR(regmap)) {
> +               dev_err(dwmac->dev, "syscon regmap failed.\n");
> +               return -ENXIO;
> +       }
> +
> +       /* args[0]:offset  args[1]: shift */
> +       return regmap_update_bits(regmap, args[0],
> +                                 STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
> +                                 mode << args[1]);
> +}
> +
>  static int starfive_dwmac_probe(struct platform_device *pdev)
>  {
>         struct plat_stmmacenet_data *plat_dat;
> @@ -89,6 +130,12 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>         plat_dat->bsp_priv = dwmac;
>         plat_dat->dma_cfg->dche = true;
>
> +       err = starfive_dwmac_set_mode(plat_dat);
> +       if (err) {
> +               dev_err(&pdev->dev, "dwmac set mode failed.\n");
> +               return err;
> +       }

Usually it's better to keep all error messages at the same "level".
Like this you'll get two error messages if
syscon_regmap_lookup_by_phandle_args fails. So I'd suggest moving this
message into the starfive_dwmac_set_mode function and while you're at
it you can do

err = regmap_update_bits(...);
if (err)
  return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");

Also the file is called dwmac-starfive.c, so I'd expect the patch
header to be "net: stmmac: dwmac-starfive: Add phy interface
settings".

/Emil

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
