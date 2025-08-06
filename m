Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA87FC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 03:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqkHM080NM5dwrnh5g0hKHRuLpOKfyCtZ3wwC7PcohY=; b=VV4we2YXiNxHnu
	QbjjFbKUVy5v6AVgv4w2WL3rzJ/F3mYqL7JMAIusLaeq6LIolXxLmPbHhqwvGacFUuvPTVw3V3FP1
	ATTLPrJNz4vXFLuRyyAfgFNeaygUdcqH4z00F/7nrVzFmPIKHAOk2CZnsrJ6PhHDoEqGrwXbYaqAa
	rvbe21TtgqjwR1AlUUbi6aIB2GRSPwnvWgCmwrR5TyTpkiqy6iZGQe/+673hyTSlLyv4diVNuR8T0
	3k5v1sQuGloPcfdCQkKwpeeSwQTrn89mbn7fkdyQ2GKyyh8Z9eA6w0Lql7JUgjY9V34smbjVrbVkH
	4xxA5Q+0YOEJ5OFw1jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUQv-0000000EChH-3GD5;
	Wed, 06 Aug 2025 03:03:17 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUQs-0000000ECgu-3rnN
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 03:03:16 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B5984206A5;
	Wed,  6 Aug 2025 05:03:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiazYPl_U3fV; Wed,  6 Aug 2025 05:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754449383; bh=fyIkXN5YxBF92Jk3fC3dvGetl4/UPKeitt9ZBL/oLWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hdj7aSvwPl9zceSTDOp6/Ns1r+OOpra44MJmXsq39Mjf63o5V2uI9lLbYAU6KCf6s
	 s6qYgqE5FZTJzT9DCUkZH2Mh5WH4tw7OTHIcWpcOlpaDKotUBo3BVk+bkyWpfDDiKD
	 w+OrJYkDc+sDFG2WiBmivd1q4Ooq6ZMopyHa7x95KoRjhFXliP/4tYJAvfZ89YCSYR
	 NlLpc+XCQGuA7MaAGh+kgSOrYdzA3LHS3aaeGF+3RgeNoG9HseUgBy8Cs1APwH1Uys
	 sHrb05ZOsDzp3ou2CFUDEkaS2ypL1AxqwQPxy8At1PasNfyydI17yBn7yASO+hKJ9C
	 toKEEnEB9IA2w==
Date: Wed, 6 Aug 2025 03:02:43 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Guo Ren <guoren@kernel.org>,
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
Message-ID: <aJLF07Sw9IatHmUq@pie>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-3-ziyao@disroot.org>
 <20250803170206.GA525144-robh@kernel.org>
 <aJBBOptU4IXilK3I@pie>
 <aJDeZJrKkqH23V/V@x1>
 <aJJH6wLqMO5XRTeW@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJJH6wLqMO5XRTeW@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_200315_509261_BB460D20 
X-CRM114-Status: GOOD (  44.01  )
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

On Tue, Aug 05, 2025 at 11:05:31AM -0700, Drew Fustini wrote:
> On Mon, Aug 04, 2025 at 09:23:00AM -0700, Drew Fustini wrote:
> > On Mon, Aug 04, 2025 at 05:12:26AM +0000, Yao Zi wrote:
> > > On Sun, Aug 03, 2025 at 12:02:06PM -0500, Rob Herring wrote:
> > > > On Fri, Aug 01, 2025 at 09:12:39AM +0000, Yao Zi wrote:
> > > > > It's necessary to adjust the MAC TX clock when the linkspeed changes,
> > > > > but it's noted such adjustment always fails on TH1520 SoC, and reading
> > > > > back from APB glue registers that control clock generation results in
> > > > > garbage, causing broken link.
> > > > > 
> > > > > With some testing, it's found a clock must be ungated for access to APB
> > > > > glue registers. Without any consumer, the clock is automatically
> > > > > disabled during late kernel startup. Let's get and enable it if it's
> > > > > described in devicetree.
> > > > > 
> > > > > Fixes: 33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")
> > > > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > > > Tested-by: Drew Fustini <fustini@kernel.org>
> > > > > ---
> > > > >  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > index c72ee759aae5..95096244a846 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > @@ -211,6 +211,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> > > > >  	struct stmmac_resources stmmac_res;
> > > > >  	struct plat_stmmacenet_data *plat;
> > > > >  	struct thead_dwmac *dwmac;
> > > > > +	struct clk *apb_clk;
> > > > >  	void __iomem *apb;
> > > > >  	int ret;
> > > > >  
> > > > > @@ -224,6 +225,11 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> > > > >  		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > > > >  				     "dt configuration failed\n");
> > > > >  
> > > > > +	apb_clk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
> > > > 
> > > > The description sounds like this should not be optional. The binding 
> > > > change also makes it not optional.
> > > 
> > > Yes, it shouldn't be. But using the non-optional API will cause the
> > > driver fails to probe with the old (problematic) devicetree, IOW, it
> > > breaks the ABI. Comparing to unusable ethernet, failing to adjust the
> > > link speed sounds a minor point to me.
> > 
> > I've just read Conor's comment in the v1 again: 
> > 
> >  Nah, introduce the warnings. If the clock is required for operation, it
> >  should be marked as such. You've made it optional in the driver, which
> >  is the important part (backwards compatible) and you've got the dts
> >  patch in the series.
> > 
> > Thus I think the argument I made in my reply to this thread is
> > incorrect and the driver should remain backwards compatible.
> > 
> > > Maybe we could add a comment to explain why optional API is used, or
> > > just use the non-optional one if such ABI breakages are acceptable --
> > > for which I'd like to wait for more opinions.
> > 
> > I think a comment in the code about why it uses the optional variant of
> > the function is a good idea.
> 
> I was chatting on devicetree irc channel, and I think that it would be
> good to add something like this to the commit message:
> 
>  For the purposes of backwards compatibility, the probe will not fail if
>  'apb' is not found, but the link will break if the speed changes after
>  probe.
> 
> Also, if devm_clk_get_optional_enabled("apb") fails, then I think it
> would be a good idea to warn the user that changing the link speed will
> not be supported.

Both sound reasonable to me, and I'll add them in v3, thanks.

> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
