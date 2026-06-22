Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE7CCDB466
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 02:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpr4rH+oZLdQZLV0lps5kstYIJStGCe/iszM65Bb+ho=; b=i0NbBW76H0t/xZ
	W5Tvel6qbfEd6sG0q8oZIRf2GJla4kh5B6HnzI5Lyhk1OcbuNL+2XKTjKzqEEAkUxgHxQ4kFW1nBp
	mnBHqGEUnLalvWHlAQxXp0/IiukO/dQ743YvaQaoVKjX4WYDWLjrFZNYy/bQrVcPMPilDXz73Ae9Q
	gjXIKbbp5QHGxef2VyEV5p7ccDMGT66n9YPGsJN/XYOwRNaYkt75QDZ80wTbPiRFn8ZBzyntlHk58
	T0bOD+B9vaLJryqOI5S2VksACWWluOCsSGdicgZsdqWDvcqA3q9Vk4Kdvu1PqNaNhtzTeyKAuzI8p
	Q2xTjewlniyz4fNV03TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUH3-00000004IUl-2FaL;
	Mon, 22 Jun 2026 02:20:33 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUGv-00000004IUJ-2xSh;
	Mon, 22 Jun 2026 02:20:31 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Maxime Chevallier" <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
Subject: Re: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII
 delay properties optional
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
 <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
MIME-Version: 1.0
Message-ID: <512b77d5.993b.19eed207fc9.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgDHW3DHmzhqEvksAA--.8326W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEGDGo4EpcWfAACs2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_192025_916163_D9166919 
X-CRM114-Status: GOOD (  24.95  )
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




> -----Original Messages-----
> From: "Andrew Lunn" <andrew@lunn.ch>
> Send time:Saturday, 13/06/2026 15:48:46
> To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
> Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
> Subject: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII delay properties optional
> 
> On Wed, Jun 10, 2026 at 10:26:50AM +0200, Maxime Chevallier wrote:
> > Hi,
> > 
> > On 6/10/26 03:29, lizhi2@eswincomputing.com wrote:
> > > From: Zhi Li <lizhi2@eswincomputing.com>
> > > 
> > > Make rx-internal-delay-ps and tx-internal-delay-ps optional in the
> > > EIC7700 DWMAC driver.
> > > 
> > > The driver previously required both properties to be present and would
> > > fail probe when they were missing. This restricts valid hardware
> > > configurations where RGMII timing is instead provided by the PHY or
> > > board design.
> > > 
> > > Update the driver to treat missing delay properties as zero delay,
> > > allowing systems without explicit MAC-side delay tuning to operate
> > > correctly.
> > > 
> > > This aligns the driver behavior with the updated device tree binding
> > > and provides a safe default configuration when MAC-side delay
> > > programming is not required.
> > > 
> > > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c | 6 ------
> > >  1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > index 4ac979d874d6..ec99b597aeaf 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > @@ -165,9 +165,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> > >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> > >  		dwc_priv->eth_clk_dly_param |=
> > >  				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> > > -	} else {
> > > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > > -			"missing required property rx-internal-delay-ps\n");
> > >  	}
> > >  
> > >  	/* Read tx-internal-delay-ps and update tx_clk delay */
> > > @@ -187,9 +184,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> > >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
> > >  		dwc_priv->eth_clk_dly_param |=
> > >  				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> > > -	} else {
> > > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > > -			"missing required property tx-internal-delay-ps\n");
> > >  	}
> > 
> > I think then you need to handle RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID,
> > by using default delays for these (usually around 2ns), as here all delays
> > will be set to 0, regardless of the RGMII mode in use.
> 
> No. By default, the MAC adds 0ns delay, and passes the phy-mode to the
> PHY. It will then add the 2ns delay. It is possible to use the
> tx-internal-delay-ps and rx-internal-delay-ps in the MAC to add small
> tuning delays, but not the full 2ns.
> 
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
> 

Thanks for the earlier discussion and for helping clarify the eth0
design.

I'm preparing a v9 of the series. The next revision will address the
issues reported by Sashiko review, mainly DT binding schema and DTS
warnings.

Before I post v9, I'd like to check whether you have any concerns or
suggestions regarding the driver changes.

Thanks,
Zhi
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
