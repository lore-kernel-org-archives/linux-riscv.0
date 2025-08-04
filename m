Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D17AC87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 05:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kqmkkdtvKQGQ/j5fiJv6yKIPA6mxjkxZ5xOUCDcY7A=; b=iUcKXp7y8l+Jd0
	GaTN8pIdyzYd+mFisGaqnyKSU+iaUrQ8/0yr+QcitWpnbW8c193hFYDQJSN5+31OHxxGVSK3ZU2Rm
	uXo/L2W2xzjH4+oems6/63thBVwP7GcijiNch7nuXXCMjk4rN+aRywUso+Y7ldBjKXRgAtnYx5Jex
	WoWfRkzDk0wvTMCUVUR/Q/olerfndBv2ck+RMnGmnV+Vzo1YozSXSJB3Kl0HOJLSikXG0suMjwpaM
	uU4IOpExtB7jkXYetx/v4TdYdOWSdVZe2AezyKQWFQEZJ4DlEq7x3Y/moEw5ds4zDMf6C5e6JQNq7
	CdVFBPAsX2xs0bsVE5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinVM-00000009eSg-3stI;
	Mon, 04 Aug 2025 05:13:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinVK-00000009eQn-399C
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 05:13:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5F48320A6A;
	Mon,  4 Aug 2025 07:12:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJneWLsAwyEm; Mon,  4 Aug 2025 07:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754284373; bh=SUW5D5b5WsWlP0YMXjvvOTVOjakybqdppS5vTfywQuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KnFuzqsZn6Eu779yf9Zjp2zeH9TzXtH0ko/GWr/qkEkXclWSEbOcY7RI51Y3Q02tY
	 v+YDuPEz3tihyNqYug7+rVri3pLwnVEmaImpCGBao2hWTPC/XTEZVfetkvLNYgbsp2
	 Bm47ovlo1P9xSqxzVTabKRShhrSLx+oNtJzGY56dgdJQaPHT9lPR8yk1X49EXRqvK/
	 b/kGzebPdI83cxvfkSHPJzCbuHPA3wJ6Y1ZdTHE51/2vmPoQK/1LhRwPDTXgs49qcP
	 glOhiTuCkiv7ddJG7du/Wjd+a0pxoRfrGKUHvcz+N/k4Tf9SYfr2fmoRZIZgSVYmME
	 mkS+if9wO21pA==
Date: Mon, 4 Aug 2025 05:12:26 +0000
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
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
Message-ID: <aJBBOptU4IXilK3I@pie>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-3-ziyao@disroot.org>
 <20250803170206.GA525144-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250803170206.GA525144-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_221259_207578_981FB5A6 
X-CRM114-Status: GOOD (  23.45  )
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

Yes, it shouldn't be. But using the non-optional API will cause the
driver fails to probe with the old (problematic) devicetree, IOW, it
breaks the ABI. Comparing to unusable ethernet, failing to adjust the
link speed sounds a minor point to me.

Maybe we could add a comment to explain why optional API is used, or
just use the non-optional one if such ABI breakages are acceptable --
for which I'd like to wait for more opinions.

> Rob
> 

Thanks,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
