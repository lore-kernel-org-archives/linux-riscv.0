Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F49C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpO+MRhmrxuwSi9bz/dHceQTzFs/YECIDDmonNinbhM=; b=nZI6VBqMnPTwfX
	W89lIqWeWibnTnV6raHaxra1V1WuaIpYTN3sKyZW3FvrUHh0sMOPDetuL1t6hG/uik2aodt6DP0x8
	xR/whCgMq4xBc3CK7BtH0Z9nXgNMUxAGqVECdYqVvnFmdCPNG8td11i6wSo3I2N/iEcuZbTQU+iHn
	j0pxp5iceG69Z7McT8ei+xy0ttyb4wbyiYBYuN4ejkgSdtsybvpmcPCvdxH8KURgvvPBQwaoauvFI
	zHB5Ydq32IwX3iSsjFkYgk5FsHnapqZZ+R1Rk1jrG93ZohoS/ygrpPp/jUc+nIN8okdy9fpSlS/79
	A09uRiRy2MnJwddXJr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69M0-00Ejuh-Hi; Fri, 16 Dec 2022 11:58:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69Lx-00Ejrm-C3
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:58:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id qk9so5634539ejc.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD3t5Xg86pWfgvKQ0karJrpnH0Km5Gvy1OvnVne8e6c=;
        b=OIVypMCStpFJDwnQPZwBz6MibYg0LnS+3dXXD3ddefadsnlVCLott852qgJymHALFH
         xdnWaSLD/AvG/EIL/z0QNnj6IodbiGTlWJkCRLAVRB4TT0ISWhEWeKbq5tbxTCWe9ZIF
         k/S5GyNdjWlADDApTVRT0KWVNEVB1KUagD9LiXUo3SpD6ImRQmukSfE2rcdgIgVNt2Ej
         JFWZGD47YWyDDnvZ8JDreWQnLqUPXo7sa3f3vr5i9M1qwbSUe52rptx9qdb1sEJabYVg
         uxHgE04vX7EZzlkZvJLJAVipv8BzPnP5ks0Qo7UfCerxBLqIptgqUjf6hgLi2S3HXwMH
         TtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD3t5Xg86pWfgvKQ0karJrpnH0Km5Gvy1OvnVne8e6c=;
        b=JEXZ/HlrHLLaHPHRGd2w5cHoHWc2TfjmFsFleZoM/UBWiYu2elFPQa5vcC+MwjG2+1
         9jqhVlU7LsYg9njasXkt0JBncqMCt7ck8PvFuooHq7Fb7Q5+YDWdsKaupjv/Z0Boc4AQ
         OMynUjd8rFogsvceLY3EqrAWwjGtm5Ja3WLrR+j63qoD8hKCWNhk5nTsbwtoSSGzqARe
         2mmITRCS+WNQ8pYumg5zF5zxuV9FFkdCApZYWd2ZnS/fkwQDV0hplwKKlTiayxrEcfxs
         Zj0wq2WU0GjX8qcqNAebZVdzLF7yzk8nUtrrXrZse31c5Li6FU55WzYpACZ3v6YF4neA
         5YIw==
X-Gm-Message-State: ANoB5pk53ZkNyVvUFsLO0igLghTF+L7K9uLU1xea9AHPg/mD0DuNiCNX
	O0javBgt9bS/D3PLUxYCFoI=
X-Google-Smtp-Source: AA0mqf6Qr6JCbTvn30yE3CWo6miOLsTIe2eS/4Lgs7jO1XL7U1Bc6dyg5yUiyoqbXTLh7G6TdWFRuA==
X-Received: by 2002:a17:906:6a84:b0:78d:f454:37a6 with SMTP id p4-20020a1709066a8400b0078df45437a6mr22540809ejr.73.1671191890513;
        Fri, 16 Dec 2022 03:58:10 -0800 (PST)
Received: from ?IPV6:2a01:c23:c47e:dc00:5d:c867:d92c:e0f3? (dynamic-2a01-0c23-c47e-dc00-005d-c867-d92c-e0f3.c23.pool.telefonica.de. [2a01:c23:c47e:dc00:5d:c867:d92c:e0f3])
        by smtp.googlemail.com with ESMTPSA id 9-20020a170906318900b0077a8fa8ba55sm750629ejy.210.2022.12.16.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:58:10 -0800 (PST)
Message-ID: <2542ec57-9de7-880c-c0d4-35f0aef738bc@gmail.com>
Date: Fri, 16 Dec 2022 12:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-7-yanhong.wang@starfivetech.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/9] net: phy: motorcomm: Add YT8531 phy support
In-Reply-To: <20221216070632.11444-7-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_035813_446111_8EE69814 
X-CRM114-Status: GOOD (  29.73  )
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

On 16.12.2022 08:06, Yanhong Wang wrote:
> This adds basic support for the Motorcomm YT8531
> Gigabit Ethernet PHY.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  drivers/net/phy/Kconfig     |   3 +-
>  drivers/net/phy/motorcomm.c | 202 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 204 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index c57a0262fb64..86399254d9ff 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -258,9 +258,10 @@ config MICROSEMI_PHY
>  
>  config MOTORCOMM_PHY
>  	tristate "Motorcomm PHYs"
> +	default SOC_STARFIVE

Both are completely independent. This default should be removed.

>  	help
>  	  Enables support for Motorcomm network PHYs.
> -	  Currently supports the YT8511 gigabit PHY.
> +	  Currently supports the YT8511 and YT8531 gigabit PHYs.
>  

This doesn't apply. Parts of your patch exist already in net-next.
Support for YT8531S has been added in the meantime. Please rebase
your patch on net-next and annotate your patch as net-next.

>  config NATIONAL_PHY
>  	tristate "National Semiconductor PHYs"
> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 7e6ac2c5e27e..bca03185b338 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -3,13 +3,17 @@
>   * Driver for Motorcomm PHYs
>   *
>   * Author: Peter Geis <pgwipeout@gmail.com>
> + *
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/phy.h>
>  
>  #define PHY_ID_YT8511		0x0000010a
> +#define PHY_ID_YT8531		0x4f51e91b
>  
>  #define YT8511_PAGE_SELECT	0x1e
>  #define YT8511_PAGE		0x1f
> @@ -17,6 +21,10 @@
>  #define YT8511_EXT_DELAY_DRIVE	0x0d
>  #define YT8511_EXT_SLEEP_CTRL	0x27
>  
> +#define YTPHY_EXT_SMI_SDS_PHY		0xa000
> +#define YTPHY_EXT_CHIP_CONFIG		0xa001
> +#define YTPHY_EXT_RGMII_CONFIG1	0xa003
> +
>  /* 2b00 25m from pll
>   * 2b01 25m from xtl *default*
>   * 2b10 62.m from pll
> @@ -38,6 +46,51 @@
>  #define YT8511_DELAY_FE_TX_EN	(0xf << 12)
>  #define YT8511_DELAY_FE_TX_DIS	(0x2 << 12)
>  
> +struct ytphy_reg_field {
> +	char *name;
> +	u32 mask;
> +	u8	dflt;	/* Default value */
> +};
> +
> +struct ytphy_priv_t {
> +	u32 tx_inverted_1000;
> +	u32 tx_inverted_100;
> +	u32 tx_inverted_10;
> +};
> +
> +/* rx_delay_sel: RGMII rx clock delay train configuration, about 150ps per
> + *               step. Delay = 150ps * N
> + *
> + * tx_delay_sel_fe: RGMII tx clock delay train configuration when speed is
> + *                  100Mbps or 10Mbps, it's 150ps per step. Delay = 150ps * N
> + *
> + * tx_delay_sel: RGMII tx clock delay train configuration when speed is
> + *               1000Mbps, it's 150ps per step. Delay = 150ps * N
> + */
> +static const struct ytphy_reg_field ytphy_rxtxd_grp[] = {
> +	{ "rx_delay_sel", GENMASK(13, 10), 0x0 },
> +	{ "tx_delay_sel_fe", GENMASK(7, 4), 0xf },
> +	{ "tx_delay_sel", GENMASK(3, 0), 0x1 }
> +};
> +
> +/* tx_inverted_x: Use original or inverted RGMII TX_CLK to drive the RGMII
> + *                TX_CLK delay train configuration when speed is
> + *                xMbps(10/100/1000Mbps).
> + *                0: original,  1: inverted
> + */
> +static const struct ytphy_reg_field ytphy_txinver_grp[] = {
> +	{ "tx_inverted_1000", BIT(14), 0x0 },
> +	{ "tx_inverted_100", BIT(14), 0x0 },
> +	{ "tx_inverted_10", BIT(14), 0x0 }

Copy & Paste error that mask is the same for all entries?

> +};
> +
> +/* rxc_dly_en: RGMII clk 2ns delay control bit.
> + *             0: disable   1: enable
> + */
> +static const struct ytphy_reg_field ytphy_rxden_grp[] = {
> +	{ "rxc_dly_en", BIT(8), 0x1 }
> +};
> +
>  static int yt8511_read_page(struct phy_device *phydev)
>  {
>  	return __phy_read(phydev, YT8511_PAGE_SELECT);
> @@ -48,6 +101,33 @@ static int yt8511_write_page(struct phy_device *phydev, int page)
>  	return __phy_write(phydev, YT8511_PAGE_SELECT, page);
>  };
>  
> +static int ytphy_read_ext(struct phy_device *phydev, u32 regnum)
> +{
> +	int ret;
> +	int val;
> +
> +	ret = __phy_write(phydev, YT8511_PAGE_SELECT, regnum);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = __phy_read(phydev, YT8511_PAGE);
> +
> +	return val;
> +}
> +
> +static int ytphy_write_ext(struct phy_device *phydev, u32 regnum, u16 val)
> +{
> +	int ret;
> +
> +	ret = __phy_write(phydev, YT8511_PAGE_SELECT, regnum);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = __phy_write(phydev, YT8511_PAGE, val);
> +
> +	return ret;
> +}
> +
>  static int yt8511_config_init(struct phy_device *phydev)
>  {
>  	int oldpage, ret = 0;
> @@ -111,6 +191,116 @@ static int yt8511_config_init(struct phy_device *phydev)
>  	return phy_restore_page(phydev, oldpage, ret);
>  }
>  
> +static int ytphy_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *of_node;
> +	u32 val;
> +	u32 mask;
> +	u32 cfg;
> +	int ret;
> +	int i = 0;
> +
> +	of_node = phydev->mdio.dev.of_node;
> +	if (of_node) {
> +		ret = of_property_read_u32(of_node, ytphy_rxden_grp[0].name, &cfg);
> +		if (!ret) {
> +			mask = ytphy_rxden_grp[0].mask;
> +			val = ytphy_read_ext(phydev, YTPHY_EXT_CHIP_CONFIG);
> +
> +			/* check the cfg overflow or not */
> +			cfg = cfg > mask >> (ffs(mask) - 1) ? mask : cfg;
> +
> +			val &= ~mask;
> +			val |= FIELD_PREP(mask, cfg);
> +			ytphy_write_ext(phydev, YTPHY_EXT_CHIP_CONFIG, val);

This is the unlocked version. MDIO bus locking is missing.

> +		}
> +
> +		val = ytphy_read_ext(phydev, YTPHY_EXT_RGMII_CONFIG1);
> +		for (i = 0; i < ARRAY_SIZE(ytphy_rxtxd_grp); i++) {
> +			ret = of_property_read_u32(of_node, ytphy_rxtxd_grp[i].name, &cfg);
> +			if (!ret) {
> +				mask = ytphy_rxtxd_grp[i].mask;
> +
> +				/* check the cfg overflow or not */
> +				cfg = cfg > mask >> (ffs(mask) - 1) ? mask : cfg;
> +
> +				val &= ~mask;
> +				val |= cfg << (ffs(mask) - 1);
> +			}
> +		}
> +		return ytphy_write_ext(phydev, YTPHY_EXT_RGMII_CONFIG1, val);
> +	}
> +
> +	phydev_err(phydev, "Get of node fail\n");
> +

Please consider that the PHY may be used on non-DT systems.

> +	return -EINVAL;
> +}
> +
> +static void ytphy_link_change_notify(struct phy_device *phydev)
> +{
> +	u32 val;
> +	struct ytphy_priv_t *ytphy_priv = phydev->priv;
> +
> +	if (phydev->speed < 0)
> +		return;
> +
> +	val = ytphy_read_ext(phydev, YTPHY_EXT_RGMII_CONFIG1);
> +	switch (phydev->speed) {
> +	case SPEED_1000:
> +		val  &= ~ytphy_txinver_grp[0].mask;
> +		val |= FIELD_PREP(ytphy_txinver_grp[0].mask,
> +				ytphy_priv->tx_inverted_1000);
> +		break;
> +
> +	case SPEED_100:
> +		val  &= ~ytphy_txinver_grp[1].mask;
> +		val |= FIELD_PREP(ytphy_txinver_grp[1].mask,
> +				ytphy_priv->tx_inverted_100);
> +		break;
> +
> +	case SPEED_10:
> +		val  &= ~ytphy_txinver_grp[2].mask;
> +		val |= FIELD_PREP(ytphy_txinver_grp[2].mask,
> +				ytphy_priv->tx_inverted_10);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	ytphy_write_ext(phydev, YTPHY_EXT_RGMII_CONFIG1, val);
> +}
> +
> +static int yt8531_probe(struct phy_device *phydev)
> +{
> +	struct ytphy_priv_t *priv;
> +	const struct device_node *of_node;
> +	u32 val;
> +	int ret;
> +
> +	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	of_node = phydev->mdio.dev.of_node;
> +	if (of_node) {
> +		ret = of_property_read_u32(of_node, ytphy_txinver_grp[0].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_1000 = val;
> +
> +		ret = of_property_read_u32(of_node, ytphy_txinver_grp[1].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_100 = val;
> +
> +		ret = of_property_read_u32(of_node, ytphy_txinver_grp[2].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_10 = val;
> +	}
> +	phydev->priv = priv;
> +
> +	return 0;
> +}
> +
>  static struct phy_driver motorcomm_phy_drvs[] = {
>  	{
>  		PHY_ID_MATCH_EXACT(PHY_ID_YT8511),
> @@ -120,6 +310,17 @@ static struct phy_driver motorcomm_phy_drvs[] = {
>  		.resume		= genphy_resume,
>  		.read_page	= yt8511_read_page,
>  		.write_page	= yt8511_write_page,
> +	}, {
> +		PHY_ID_MATCH_EXACT(PHY_ID_YT8531),
> +		.name		= "YT8531 Gigabit Ethernet",
> +		.probe		= yt8531_probe,
> +		.config_init	= ytphy_config_init,
> +		.read_status	= genphy_read_status,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= yt8511_read_page,
> +		.write_page	= yt8511_write_page,
> +		.link_change_notify = ytphy_link_change_notify,
>  	},
>  };
>  
> @@ -131,6 +332,7 @@ MODULE_LICENSE("GPL");
>  
>  static const struct mdio_device_id __maybe_unused motorcomm_tbl[] = {
>  	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8511) },
> +	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8531) },
>  	{ /* sentinal */ }
>  };
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
