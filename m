Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08792C10F1E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YSOvURqNfMdK4tqUJxQ1TctkHywbkGY4eV+uMHJ0CA=; b=U8SyQi5dz/smWu
	W9KsnUWQxl331LEq2ZxrwzhY5JaT02oOaK6gkmhPkE8mYPR842NKd5koRxEFkur7qRk53LQgSM4ES
	GTgya21qDJqNIXkpf8ev+1XLi55XOHZW8ksrWKRLJ/eg+/uVapvKOYNZ8YuMqIY8mcanzUUN+MWv3
	TU4HC+wmJGfn8FD4I/sWi3qMmP+ln4LYYReX3LvCDUxJkmthtBqDz7vv/oI+BPhS42B1JjQ5UN4ck
	Ihf92ajBLKnqQv3U2e+lYwhcsfQP4qcZZE/y0jb4QqZ4n9I9xwxnXSD+gt2ej01wr5QBqhhfNGEuG
	XFCyRi2is+Vb6slklauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dUU-00Gb7a-0e; Tue, 20 Dec 2022 14:21:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dTo-00Gahb-EE
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 14:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ed6VG1SUV9HFxf34JgZ6AH3VGOZoZxogcfSaZTFZm9I=; b=zAdj56n/Xxduddp9qDLpkEzYSc
	GnDJte7DR8iWrFBthqvUh9jK2fKMPqeibjs/Ziu0nfsyDa/X/gKY3QQ8E82ryLF/ubmXUzxSLCv8l
	awdDAhSCnEKeP472VhCIcVoS/RJA89fzgYItFYUi6TAVto2IF1J7F+pHorubC+Y0Jc9A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p7dTg-0005wx-3p; Tue, 20 Dec 2022 15:20:20 +0100
Date: Tue, 20 Dec 2022 15:20:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2 6/9] net: phy: motorcomm: Add YT8531 phy support
Message-ID: <Y6HEpHBpK83f8UCw@lunn.ch>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-7-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216070632.11444-7-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_062028_513840_6884E9FC 
X-CRM114-Status: GOOD (  23.62  )
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

Please don't do this. Look at the other PHY drivers. How many have a
default like this?

Generally, if you are doing something which no other driver does, you
are doing something wrong.

> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -3,13 +3,17 @@
>   * Driver for Motorcomm PHYs
>   *
>   * Author: Peter Geis <pgwipeout@gmail.com>
> + *
>   */

Please avoid changes like this. It distracts from the real code
changes.

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

This should be next to where it is used. But once you have delay in
ps, i suspect you will throw this away.

>  
> +static int ytphy_config_init(struct phy_device *phydev)

Is this specific to the 8531? If so, put 8531 in the function name?

Do any of these delay configurations also apply to the 8511?

> +{
> +	struct device_node *of_node;
> +	u32 val;
> +	u32 mask;
> +	u32 cfg;
> +	int ret;
> +	int i = 0;

Reverse Christmas tree. i needs to be earlier, val needs to be later.

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

What about the case of the PHY is used on a board without device tree?
ACPI could be used, or there could be nothing because it is on a USB
dongle etc.

You should of defined in your device tree binding what the defaults
are when properties are missing. So apply them when there is no DT
available. Then we at least have the PHY in a known state.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
