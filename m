Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55855D3EE74
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm2B2meEsT3yD/lqCkoW1ApWLGHAr+zro3YQLgVvrS4=; b=Pal71t1Kr+GkBj
	Y4UNOni/JWq+K3lX9tbx0Z8lrhg1wg6KMrCrIHZiZ7NXE4bUo/JvrS2B0rBPwFBGtXADXq8cTw5dd
	4i2LiVMh5FUjYCv5Ket0VdlTl7Sg1PlFBMiSvV6BZebdvDUZVJMJyxNWMqD14pnwyKFotIqiVSNvg
	dxkscKaTr5oVW/Tz/LpDgsHhVM2iDWZ8/aDvrWbVglxwRiy0lFR7SoctC1W2/bJXJvFWJojF1/Qlv
	GKpnvfOWcf+nz8VBNQvvzpLIRQkh7KyiMSOfYLPWrd1s+6AXSQjFS5lLwJyLl031enqUIg3bbqS02
	Jnh9rp4br6X6ZLCRZTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwN4-00000007JGC-1n2L;
	Thu, 22 Jan 2026 15:13:18 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwN1-00000007JFg-37lz
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 15:13:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769094778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lEoIOIMYjotqF6pMogdQeeX3MKr4ENlCiD/zwjVHEz7oX/aBkcYEGsE/b+AyEz9/qHammd5PwkwUTjHgxSm4xUXMdfvKKymDrKfMO7XVkqxZwi0eFOFpycTX3Ph2VfjoBn2jh/PONyeioR4e3509GRDmI2FA+Je/43/yldSCFMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769094778; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Eo/IUXScxtTqfsnFKhZ0cMjvhBNV94SAmIf3IWc0PYg=; 
	b=AZzM73oOqgb/shBUa24qmbpxOMWgTlo1reLo+3afbd9Xl7CJMIRkBrYmPkdk2CdcDFwLdwbYH74ZtI+L0KF7ytTXDaUDxoTHzgoOcZUfzYExAF5bEEHSigbE2A63ghwesaif6vIXyb2O824EsoihePPHqysB3lNJrcO/mtWQ/qs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769094778;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Eo/IUXScxtTqfsnFKhZ0cMjvhBNV94SAmIf3IWc0PYg=;
	b=o+IZLkUHaUjCBLwjbbYzPaDnbsyf4n4RhgWAG2Yid5tjpLPXo8AzAvbFBQ/tDCoQ
	bpWF7sPLiJvteO0izmqf5tShsN/HlmNc/nFEa9bui9aQ2xILgsJQCEHu/zBdQxeznix
	ZOv63McBSVkhandjj20A1es/cJW+yfpOD64EoQ+4=
Received: by mx.zohomail.com with SMTPS id 1769094776105810.6311707654235;
	Thu, 22 Jan 2026 07:12:56 -0800 (PST)
Date: Thu, 22 Jan 2026 15:12:36 +0000
From: Yao Zi <me@ziyao.cc>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Yixun Lan <dlan@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 1/1] net: spacemit: display phy driver information
Message-ID: <aXI-ZMbwXHBX4XiT@pie>
References: <20260122080001.73921-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122080001.73921-1-amadeus@jmu.edu.cn>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_071315_949272_93D257A7 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, Jan 22, 2026 at 04:00:01PM +0800, Chukun Pan wrote:
> Print the PHY driver used and interrupt status after connection.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> index c85dc742c404..afb5b6a61c2c 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -1568,6 +1568,7 @@ static int emac_phy_connect(struct net_device *ndev)
>  	struct device *dev = &priv->pdev->dev;
>  	struct phy_device *phydev;
>  	struct device_node *np;
> +	char *irq_str;
>  	int ret;
>  
>  	ret = of_get_phy_mode(dev->of_node, &priv->phy_interface);
> @@ -1610,6 +1611,11 @@ static int emac_phy_connect(struct net_device *ndev)
>  		goto err_node_put;
>  	}
>  
> +	irq_str = phy_attached_info_irq(phydev);
> +	netdev_info(ndev, "PHY driver [%s] (irq=%s)\n",
> +		    phydev->drv->name, irq_str);
> +	kfree(irq_str);

Would phy_attached_print() simplify the code?

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
