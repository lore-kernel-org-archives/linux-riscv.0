Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A94C87FCB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+18jxk0iTA9sBwtazZAU3XJ1Mvf60JnOx70IF0eW6KA=; b=SP8RnYeBUHeCnp
	tOU84+MkkZ4FVZp5tcOQ004Di0PKCNdyZmsekEYYtiGXx5MGaPH+KaklkVLy25QQWFulxJ2ZVjEnM
	errMZiDHnJ0aZrIcJQWS7+oX0fWn5uhrWbdtIy9/MVioN1a9z8Qa1mm1ckN6ddsIB6s4kfbTkBiri
	YTLTJu3DfXB1ZbUFS5MHARTDVx3o6kq45tQZbBqzn/pkh2gu495AFnsCm8dcyumLRadrKO14cn1S0
	mbgKJVCdKLghuIr/62yhBHrOZQi3d5Jnsp7GZucmvaSn37kizUJ95UAwop6hqQZOILHFVGOVuaxcp
	duZLiE0xSCNsg8nG1A8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uidik-00000008y62-1mkp;
	Sun, 03 Aug 2025 18:46:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uidii-00000008y5a-18Y7
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 18:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C66F94329A;
	Sun,  3 Aug 2025 18:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF1C4CEEB;
	Sun,  3 Aug 2025 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754246767;
	bh=otAKeqlFXtkIQt27io/cIsPeuZzPBPKAvYiQNoQ3YCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJPYsnLd8uSZeRjOt/Yd+mRmyOOQC247UfdgdYfR9pOvWudmYW5TMBA9Qc0rKhqCi
	 jpgZBWSLoRukVVKu9dFghpJZRK/ZF1cL5wpN8TzVK8eOrM4OcOjMPNx452eny3tBjP
	 U0lzTxYuzDnvLFwaCUTtkOcnclUGM69ZoHqAgba0h+f7mnrldwLxQCJ3Skux9CpdR+
	 NHwf4HU8osDsg0C7eHwpAfy+QhOxX3ZotZa4gIpp7REi3rCEMPxZXAjwH26XFP9Go1
	 HRbRuFqP66AK1HdT8QDglyqhEK4U84IU+b8zd90id+vS+T2wZ7q/HuHsIrvetnqRT1
	 XscfI0m3saNLw==
Date: Sun, 3 Aug 2025 11:46:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net: stmmac: thead: Get and enable APB clock
 on initialization
Message-ID: <aI-ubdx3FJj_wm3a@gen8>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-3-ziyao@disroot.org>
 <20250803170206.GA525144-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250803170206.GA525144-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_114608_349851_BD2D5C13 
X-CRM114-Status: GOOD (  23.30  )
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

On Sun, Aug 03, 2025 at 12:02:06PM -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 09:12:39AM +0000, Yao Zi wrote:
> > It's necessary to adjust the MAC TX clock when the linkspeed changes,
> > but it's noted such adjustment always fails on TH1520 SoC, and reading
> > back from APB glue registers that control clock generation results in
> > garbage, causing broken link.
> > 
> > With some testing, it's found a clock must be ungated for access to APB
> > glue registers. Without any consumer, the clock is automatically
> > disabled during late kernel startup. Let's get and enable it if it's
> > described in devicetree.
> > 
> > Fixes: 33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > Tested-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > index c72ee759aae5..95096244a846 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > @@ -211,6 +211,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> >  	struct stmmac_resources stmmac_res;
> >  	struct plat_stmmacenet_data *plat;
> >  	struct thead_dwmac *dwmac;
> > +	struct clk *apb_clk;
> >  	void __iomem *apb;
> >  	int ret;
> >  
> > @@ -224,6 +225,11 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> >  				     "dt configuration failed\n");
> >  
> > +	apb_clk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
> 
> The description sounds like this should not be optional. The binding 
> change also makes it not optional.

Good point, it should be devm_clk_get_enabled() otherwise the link speed
change bug will be possible. This series also changes the schema and dts
so I don't think compatibility is a problem.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
