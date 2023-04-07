Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937A5C76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rD5CRmq6+JyiSn4BZcF1dEOVfBm9ZSgIjbmsk1lTags=; b=FphFRUpJ3nB70m
	0mmN5Cm+e5N0ttDtkXKyamwx2HsE1PskzjHAda1PZ8uSKKG6pnIYOQyGeu3R7jVGEORsYICJzXZgk
	hj/V+2Kw5EBzwRdkVA18VltFSXDrckoETqmnVgRj8Ns0+aaFI7X60ZMhD6v+5tUiSpVcYnEoZu5eP
	7jQGggd1CSfE22cS1Ihb7XCuQzIuqXTMYB2tY7Wo2M+uzEuB2r5faClL5kZTtPaj5NZEr6/OOPtHi
	x8FKgIqfyPiFM3LHin9OjiXkBby0X6tHyVKN2M9ykaOERGbOFI3VPmSGwozZ0mwD0FsDWOCtgqzWN
	RbmUAOO50EQ7n6xocz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkrZm-00AxH0-2b;
	Fri, 07 Apr 2023 19:16:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkrZi-00AxGV-3A
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 19:16:44 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 08EE33F230
	for <linux-riscv@lists.infradead.org>; Fri,  7 Apr 2023 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680895000;
	bh=6sYEIBV5kXMam6UqwH6oM6O2pVhy0udkwjOT9QqT4is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fhiy6iZH0KuXk0Xa0W+FN2+H1k8UGgOWYfoVufbuHsEDU3fMB78MuKQ8ecB4PR9rj
	 GLyU19+Z5TgVUsmW1s5Y2zCbwgWVprFMq9bb8URGO9MCPNGrA4uNgRXY/UQD8RZY/e
	 ClMhg1dI0IBrm5IdXvSNkmknWQaj8EY8whEF6xWVT7KMWcJ5cCF+7ILivI8GcdVrwr
	 SWIAXbQigDBdPwAPp6B3JtHUze71pUdYC4UHtvtEOFw6KCMaKzjfUOLjXkpsnKlhV3
	 sBb8Q5BLSXDAcZkYd+jJSce+0n7By5Z0HRXYOVgVWW+ubVYSdoFTJpBk81F6UbQuIN
	 +bbH1kMwWi7Jw==
Received: by mail-qv1-f72.google.com with SMTP id oo15-20020a056214450f00b005a228adfcefso19892744qvb.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 12:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680894999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sYEIBV5kXMam6UqwH6oM6O2pVhy0udkwjOT9QqT4is=;
        b=p5tcFNzfiOZXjwiElhnbZeRJzyomhZDyNve5AOAGyajda/F1MARJiX+jodzKZZg/LO
         3A6oX8DQtkIavernht7SxNNras/PnNui/X7xcbJ2RLCUp6eBBQYpc+QKyU6m7u7BcWDF
         Q0TImXQhXDXbD/SUDxCMj2GAae7HYeYPSl4W/jiKp4sXgf/MeO2usU5TOjSdNI0QIc2+
         EFsfxY23CYPVf85SktpyhXgaR9nICeUAg0w8F0XJ5T7ssVqMhOGGqvxU85J66KzJFsVg
         27yU3oqXP/cEnZeiW8VcLd+LgzH+YzvCNY5l9oF44oekUAk01XS1fSVnYlnDvzFjr9Lz
         M8JA==
X-Gm-Message-State: AAQBX9c23W4W13WDub0mKsjOObGAMaeOcHaJZ1ApS+mqku3zj5coMAyC
	cIl3+5DqSPKH1fhTx3DwmU2PxDAtIgBG8y/KyTxC9MxwZySDlNL8hx+auAr0A0THaepv1Ph9sn8
	a1PUsYFqhHne6oavaWy8bARPIwn6+njzacGtZFbMbYiJAdv80v7CtR1hn/4M/Yw==
X-Received: by 2002:ac8:59cf:0:b0:3bf:e265:9bf with SMTP id f15-20020ac859cf000000b003bfe26509bfmr1125161qtf.5.1680894999095;
        Fri, 07 Apr 2023 12:16:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350azJsoHtLW5iJVxAs7mqBBFmK9URhRqiPq9rW03ZcwqNgq7AmVUNj2Sw8I4d2ImHV3rL/4EjmZmsUuSs4OrUPc=
X-Received: by 2002:ac8:59cf:0:b0:3bf:e265:9bf with SMTP id
 f15-20020ac859cf000000b003bfe26509bfmr1125140qtf.5.1680894998772; Fri, 07 Apr
 2023 12:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230407110356.8449-1-samin.guo@starfivetech.com> <20230407110356.8449-7-samin.guo@starfivetech.com>
In-Reply-To: <20230407110356.8449-7-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 7 Apr 2023 21:16:22 +0200
Message-ID: <CAJM55Z9LF+p-jWQkPzK=0ovfrXN0b-E5Ed49sbC9xOdrH5SuKA@mail.gmail.com>
Subject: Re: [-net-next v11 6/6] net: stmmac: starfive-dmac: Add phy interface settings
To: Samin Guo <samin.guo@starfivetech.com>
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
X-CRM114-CacheID: sfid-20230407_121643_168343_223521FF 
X-CRM114-Status: GOOD (  25.86  )
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

Hi Samin,

If you're respinning this series anyway, please use "net: stmmac:
dwmac-starfive:" to match the filename.

On Fri, 7 Apr 2023 at 13:05, Samin Guo <samin.guo@starfivetech.com> wrote:
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
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 4963d4008485..d6a1eddb51e8 100644
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
> @@ -46,6 +50,46 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>  }
>
> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +       struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> +       struct regmap *regmap;
> +       unsigned int args[2];
> +       unsigned int mode;
> +       int err;
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
> +       if (IS_ERR(regmap))
> +               return dev_err_probe(dwmac->dev, PTR_ERR(regmap), "syscon regmap failed\n");

This message is a bit misleading. It's not actually that the regmap
failed, but getting/looking up the regmap failed.

> +       /* args[0]:offset  args[1]: shift */
> +       err = regmap_update_bits(regmap, args[0],
> +                                STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
> +                                mode << args[1]);
> +       if (err)
> +               return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
> +
> +       return 0;
> +}
> +
>  static int starfive_dwmac_probe(struct platform_device *pdev)
>  {
>         struct plat_stmmacenet_data *plat_dat;
> @@ -91,6 +135,10 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>         plat_dat->bsp_priv = dwmac;
>         plat_dat->dma_cfg->dche = true;
>
> +       err = starfive_dwmac_set_mode(plat_dat);
> +       if (err)
> +               return err;
> +
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
