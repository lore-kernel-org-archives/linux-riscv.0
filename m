Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C06CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXtBDBN3JzfmSloNygkUhELh23UeBd8iZaXdHir/PHE=; b=RLq4ct61/XlXAY
	uyT+fCyZfO8SU7djBhxKmkFJo9gbG3WZnGPoEKrJpaUkFYzolWrc8IbwJHcYsjWMCP+18jPh+a/15
	nzBNQ9nfC63t+gLeGJ54jGzhqenVwTjTHaE93Idn8L9utUD3MxktxT0g7Joky1BvpibHUQvhCZH8X
	RApYMI7ki0yD+eEA6wiaBP91D5ySIeCiMyleylMQRy/J/jp5iOD8C9n1ecgB41mD2aajYPBj0o6Zp
	/87Mgdgh+XkwGYzAaB0WW/WF4lnMFphKhyEDJ7D7oap7DE1u1CI9RMU/XhBeoghp8YtwC8XdFiO4X
	bqL/dUFiw0/BegaoJXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaGO-00000004uQB-2m7C;
	Thu, 30 Oct 2025 21:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaGO-00000004uPX-11ve
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vbEdMMd/alv82EZhs0oPuJJdyvSbCwrjtSlWnhwOMUI=; b=XnV8fq/v+IrpITYXi43CSzWMZK
	wJAzNwJ76EeSvK379gzKjHVSzKVuMseoi/8Z4LaJlR1ftdFGkcIw8CjwinFGumBLqiY4yq7qliBOm
	YLAgUHZsgKRV6oLUXuaBhVkkHaUoVYs2uvkjGkeEEEd+Fvg1/W9op59u+DDzWZMbtm26hWX92M4Hu
	QPR12PsugJHpEvN0pdbTDBTQPYFdvEanrHJENvmGIVYgrwZy3V/xLuzFKB2IR4rErPKai1dcwL7je
	79lmPfDCzpbjCgBIT9JihYjDgZuhZSZyfiiPG4gQHWiomwHG1ZX6NB2+aZkWlcTAMRMDXsTW/9EHz
	BNp1IYDg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOc-0000000A3TI-1Tpv
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vbEdMMd/alv82EZhs0oPuJJdyvSbCwrjtSlWnhwOMUI=; b=FQ5exwrph/BeEvhhVCtUCO2pqe
	iAck5hK/q3oIAN8VUYIHc1IpVEvI5rcN6QeW0NJyzn9xlrny4h8KQKJ3SRxHGKpwLqbjiK/9FIR9Y
	1rPE9XUw8D+fbci2VhjaEMDJP2sVgazYxVN92Z6/zI+S69Wzc3qOd+GFcDFkqSy9tRSg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEaFs-00CY1x-9Y; Thu, 30 Oct 2025 22:32:24 +0100
Date: Thu, 30 Oct 2025 22:32:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: spacemit: Implement emac_set_pauseparam properly
Message-ID: <2eb5f9fc-d173-4b9e-89a3-87ad17ddd163@lunn.ch>
References: <20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_203722_512942_AA52E847 
X-CRM114-Status: GOOD (  16.05  )
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

On Thu, Oct 30, 2025 at 10:31:44PM +0800, Vivian Wang wrote:
> emac_set_pauseparam (the set_pauseparam callback) didn't properly update
> phydev->advertising. Fix it by changing it to call phy_set_asym_pause.

This patch is doing a lot more than that.

Please break this patch up into smaller parts.

One obvious part you can break out is emac_get_pauseparam() reading
from hardware rather that state variables.

>  static int emac_set_pauseparam(struct net_device *dev,
>  			       struct ethtool_pauseparam *pause)
>  {
>  	struct emac_priv *priv = netdev_priv(dev);
> -	u8 fc = 0;
> +	struct phy_device *phydev = dev->phydev;
>  
> -	priv->flow_control_autoneg = pause->autoneg;
> +	if (!phydev)
> +		return -ENODEV;

I'm not sure that is the correct condition. emac_up() will fail if it
cannot find the PHY. What you need to be testing here is if the
interface is admin down, and so is not connected to the PHY. If so,
-ENETDOWN would be more appropriate.

> -	if (pause->autoneg) {
> -		emac_set_fc_autoneg(priv);
> -	} else {
> -		if (pause->tx_pause)
> -			fc |= FLOW_CTRL_TX;
> +	if (!phy_validate_pause(phydev, pause))
> +		return -EINVAL;
>  
> -		if (pause->rx_pause)
> -			fc |= FLOW_CTRL_RX;
> +	priv->flow_control_autoneg = pause->autoneg;
>  
> -		emac_set_fc(priv, fc);
> -	}
> +	phy_set_asym_pause(dev->phydev, pause->rx_pause, pause->tx_pause);

It is hard to read what this patch is doing, but there are 3 use cases.

1) general autoneg for link speed etc, and pause autoneg
2) general autoneg for link speed etc, and forced pause
3) forced link speed etc, and forced pause.

I don't see all these being handled. It gets much easier to get this
right if you make use of phylink, since phylink handles all the
business logic for you.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
