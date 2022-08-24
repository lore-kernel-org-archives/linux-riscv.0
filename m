Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48954C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlo4Y0u+o+P9nW2JsVL+gPbHTTFklrOdgeTtSe0SwVw=; b=HxvxGA+e5UZB5p
	JkhPmYwSMoEEn2/yqOr87CwHHkKqpoXUbFgrD+IdwDjCkl6/A0rITgiVA+eR8OW/xRZlqiLc2KpLb
	g55/s8odm4r40zBTDz/ayxRYG7ODHWmweL5gNLwXUqamAEK6qMUFtT3tLZjPOleOFlUpTzjZmUkr1
	9n9kV29AxDRSpI8Qms3bcMYz92bpGyzPJVfLIJGe+GQQJ7S3/RdBYde1B8UTo7sEz4ZIvizV2+YK2
	J8kl4AjL4/x5YSZWYwobH89X+7qMNeYqxZo+pKhv4moCt4yfi5vl1PD4V7OJkfbTzd4pWwzIJho3T
	KmG02cHct7Y/4grs80eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQq9p-00D8b7-Of; Wed, 24 Aug 2022 13:10:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQq9l-00D8Xg-2S
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 13:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N9oJQbbnL3ZPdfQrFIR3akJaO1v/S9XNtdetroi1fvA=; b=nd6buqrEq/WpLStrEkR+1pNf4s
	8wuhU32kQ/2Aw4VCyDQu12J576L66NpSmoH4rbKG6A69+M3JlSVGaeUGPJDrmwIaW7UCSfe2KLZjK
	zRG0frRccNECb0nSAcHXIAqIQwzAg2zVUe7c6JJ8AHb3dqWJfGTeNF59P2MCx3CjfwkMnd3tj2xJ2
	w6OxmMlGPIcAK4CTlXlHvX7EC4p36XnLZJAPjWRl3g0w8oYgHVm4+0UapUo5A2yD30y/n59FOZuxt
	mFDuu4TGzDki5+V3V6tGgsEqvE9T+zh39exnxox3pl0vF86csRx00W38vWmT5qhnESimeb/li7Haj
	ATYF4zVw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33914)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oQq9V-0004EH-Cf; Wed, 24 Aug 2022 14:10:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oQq9Q-00048p-LO; Wed, 24 Aug 2022 14:10:32 +0100
Date: Wed, 24 Aug 2022 14:10:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "xiaowu.ding" <xiaowu.ding@jaguarmicro.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nicolas.ferre@microchip.com,
	claudiu.beznea@microchip.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next] driver: cadence macb driver support acpi mode
Message-ID: <YwYjSPl7murFFpJG@shell.armlinux.org.uk>
References: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_061053_156684_B9326E67 
X-CRM114-Status: GOOD (  17.12  )
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

On Wed, Aug 24, 2022 at 08:13:51PM +0800, xiaowu.ding wrote:
> -static bool macb_phy_handle_exists(struct device_node *dn)
> +static bool macb_of_phy_handle_exists(struct device_node *dn)
>  {
>  	dn = of_parse_phandle(dn, "phy-handle", 0);
>  	of_node_put(dn);
>  	return dn != NULL;
>  }
>  
> -static int macb_phylink_connect(struct macb *bp)
> +static int macb_of_phylink_connect(struct macb *bp)
>  {
>  	struct device_node *dn = bp->pdev->dev.of_node;
>  	struct net_device *dev = bp->dev;
> @@ -765,7 +767,7 @@ static int macb_phylink_connect(struct macb *bp)
>  	if (dn)
>  		ret = phylink_of_phy_connect(bp->phylink, dn, 0);
>  
> -	if (!dn || (ret && !macb_phy_handle_exists(dn))) {
> +	if (!dn || (ret && !macb_of_phy_handle_exists(dn))) {
>  		phydev = phy_find_first(bp->mii_bus);
>  		if (!phydev) {
>  			netdev_err(dev, "no PHY found\n");
> @@ -786,6 +788,166 @@ static int macb_phylink_connect(struct macb *bp)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_ACPI
> +
> +static bool macb_acpi_phy_handle_exists(struct fwnode_handle *fwnd)
> +{
> +	struct fwnode_handle *phy_node;
> +	bool flag = false;
> +	/* Only phy-handle is used for ACPI */
> +	phy_node = fwnode_find_reference(fwnd, "phy-handle", 0);
> +	flag = !IS_ERR_OR_NULL(phy_node);
> +
> +	if (flag)
> +		fwnode_handle_put(phy_node);
> +
> +	return flag;
> +}
> +
> +static int macb_acpi_phylink_connect(struct macb *bp)
> +{
> +	struct fwnode_handle *fwnd = bp->pdev->dev.fwnode;
> +	struct net_device *dev = bp->dev;
> +	struct phy_device *phydev;
> +	int ret;
> +
> +	if (fwnd)
> +		ret = phylink_fwnode_phy_connect(bp->phylink, fwnd, 0);
> +
> +	if (!fwnd || (ret && !macb_acpi_phy_handle_exists(fwnd))) {
> +		phydev = phy_find_first(bp->mii_bus);
> +		if (!phydev) {
> +			netdev_err(dev, "no PHY found\n");
> +			return -ENXIO;
> +		}
> +
> +		/* attach the mac to the phy */
> +		ret = phylink_connect_phy(bp->phylink, phydev);
> +	}
> +
> +	if (ret) {
> +		netdev_err(dev, "Could not attach PHY (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	phylink_start(bp->phylink);
> +
> +	return 0;
> +}

You shouldn't need this duplication. phylink_fwnode_phy_connect() can be
used to connect DT-based PHYs just fine, so you should be able to use it
for both cases without needing to resort to two copies. This is one of
the reasons the fwnode API exists.

The functionality of your macb_acpi_phy_handle_exists() and
macb_of_phy_handle_exists() should also be the same. Not that
fwnode_handle_put() is safe to call with NULL or err-pointer fwnodes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
