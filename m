Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F286C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qX+PELH4iPV7FSd1xNoxJZZqL34J7oDTsg9kPfmmYkA=; b=PsYyfmzfQYJhrS
	gPGyoncbwXBQfvSJ5HdSVt1qp4UB0axfBXPllwOQmbURz0v9evOApj9DULexgKhtIUN5eNvBUqZ7a
	rshoarPz9hPX1T6eDKRl0MbR07rU7teyBrNi2ZGFsQx5gF43hSa8xzn3HsuoKhK3UXhsbQygGKXre
	QgUT0yKCsLUTWf8V1saFmohD7pQgNkiSQaBASEXb34PKntUrL7iQUOfdDf6JHZRqk5HFWFlIra1Xh
	ldGsArMtDX7MwffRtzlozU74hM+3DeOqlg4SgKKgwA7qN4L3APHvDLFsgA4d7XCdLVQHEqTUQFeqM
	XNU1TuYYj9W9FhioOdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsGn-00E2Jl-9F; Wed, 24 Aug 2022 15:26:17 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsGk-00E2HY-3S
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 15:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=U0I4VNyd6UEPv89YnVrPz+VloLo8M8ZsDyOs3TAfHhs=; b=MToQ2tSQN2DWtO2/j/lt0ak4bw
	x4XIRacCpnosU/jr3X3xc5n8JExVkuyWq3+tDjWw4NnG4PYSrt8x6+R22THzK/xwWdKq1O2l4EpcD
	NuUJ9cQIEr82HATZpEqTmaOr34RMkeQHwvTxHnCkv5zlJtvAigvzONztMJC+wzlDTt70=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oQsGR-00ESUS-80; Wed, 24 Aug 2022 17:25:55 +0200
Date: Wed, 24 Aug 2022 17:25:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "xiaowu.ding" <xiaowu.ding@jaguarmicro.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next] driver: cadence macb driver support acpi mode
Message-ID: <YwZDA0CuYwPE6DM2@lunn.ch>
References: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_082614_184236_D81EB94C 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Please don't use phy_find_first. That is somewhat historical. Since
this is a new binding, simply error out if
phylink_fwnode_phy_connect() fails.

> +static int macb_acpi_mdiobus_register(struct macb *bp)
> +{
> +	struct platform_device *pdev =	bp->pdev;
> +	struct fwnode_handle *fwnode = pdev->dev.fwnode;
> +	struct fwnode_handle *child;
> +	u32 addr;
> +	int ret;
> +
> +	if (!IS_ERR_OR_NULL(fwnode_find_reference(pdev->dev.fwnode, "fixed-link", 0)))
> +		return mdiobus_register(bp->mii_bus);
> +
> +	fwnode_for_each_child_node(fwnode, child) {
> +		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> +		if (ret || addr >= PHY_MAX_ADDR)
> +			continue;
> +		ret = acpi_mdiobus_register(bp->mii_bus, fwnode);
> +		if (!ret)
> +			return ret;
> +		break;

Why loop looking for a node with a register value < 32?

Please make sure you are conformant with Documentation/firmware-guide/acpi/dsd/phy.rst

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
