Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A763C87FCB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CapMv8fv/iJyD+iIoGerL/2faf5iy45QI141uULCTKA=; b=n6iJzxslC0rA0/
	2EEIWxB01dt+8/WhM95uOXhUzuQ9+4amDEtjJa6Pf2yoRyzRUZku0QwaTCvwPcnRoKe6r5MxEWALl
	2TupmsMBjNCbGEpxaXBo4t+Jr92YE7bfogj87a0FdRqsXGXsiyXZk7z9xSDNPdfNF+dhKtpSUTF90
	XY/1IoghJI00JlI+mPII0bF9+OJsycoMkiuppbGvh+/XszRZBIeqaEVfIfHYwFGuGkgDF8fC67IRU
	/N9jAUzeo74ly/T5YasrTH3MsoKdNaaHy8PKrmO4frWHX2uuGjvWhtDo29FBrk4C+aIDZSL5IbDnL
	m5qtniOYoRJlvQoO/iHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uic6A-00000008svs-2id0;
	Sun, 03 Aug 2025 17:02:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uic68-00000008svS-07aT
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 17:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6619143939;
	Sun,  3 Aug 2025 17:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13550C4CEEB;
	Sun,  3 Aug 2025 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754240527;
	bh=yeMd9S61zQJBzdMgfsYSWmeH8iA/N3MjZcTgFm57cVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/Df5T8MFbtXlP/svzW+LiMDaNunwgHen4dZ+lQobRJLDTWFQP56YOYFoGu3zJGpu
	 k26k+Zyh17a7lHe78llTk1oV9o8FhnghYz1D85DkY9wmrCFQkjitx7GwxQ9L0G8v2F
	 UHuha7W8laInDknD2T7FlS7d/7sq/H3poduKHeZJj37K934kw8wQIo8DGcie2AyVpU
	 bxOIIYv//jiptUr5gDINeNd3Ax8oMEVTKZmP1eOhcIOiyGGYuFOtBnQsfD8KCB8j9K
	 iNtwWb1rDT9KWVDvTHl7pRznXwMbInPxHcUKnQZ/UIz6jJ0qjVTKxOuuQGjINOEIto
	 uuwMy798nza+Q==
Date: Sun, 3 Aug 2025 12:02:06 -0500
From: Rob Herring <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
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
Message-ID: <20250803170206.GA525144-robh@kernel.org>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801091240.46114-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_100212_086543_C72418CF 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Aug 01, 2025 at 09:12:39AM +0000, Yao Zi wrote:
> It's necessary to adjust the MAC TX clock when the linkspeed changes,
> but it's noted such adjustment always fails on TH1520 SoC, and reading
> back from APB glue registers that control clock generation results in
> garbage, causing broken link.
> 
> With some testing, it's found a clock must be ungated for access to APB
> glue registers. Without any consumer, the clock is automatically
> disabled during late kernel startup. Let's get and enable it if it's
> described in devicetree.
> 
> Fixes: 33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> index c72ee759aae5..95096244a846 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> @@ -211,6 +211,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct plat_stmmacenet_data *plat;
>  	struct thead_dwmac *dwmac;
> +	struct clk *apb_clk;
>  	void __iomem *apb;
>  	int ret;
>  
> @@ -224,6 +225,11 @@ static int thead_dwmac_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
>  				     "dt configuration failed\n");
>  
> +	apb_clk = devm_clk_get_optional_enabled(&pdev->dev, "apb");

The description sounds like this should not be optional. The binding 
change also makes it not optional.

Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
