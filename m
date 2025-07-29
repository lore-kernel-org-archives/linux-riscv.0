Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FC5C87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYltIA77kEQnBLu3nV0RI4kRO4Z3Xkti2e1jxQTG+Tk=; b=v1uNEAr0/ENd2+
	a3xyTPYKQuGVqAGTyPQr92myoBjHZdM6bR8us4T6uCGDmhb4r9kgW6E7OsCoK01f/cz7HwEylw3NX
	Ge+f5OxRsPG6XTkjHRb9mVGfDA3YrxRTKaYVY4n4ogdfCak4e8mPkpVXGwiJbp+tXagFQ+0Lcgb82
	Wrf2xPCOdPrUKrSBjh0EMeU38LRhAb6lAmwz0thKMCI4yxpXnDagh4W4r0HTFE7asgW40HsmKHB1B
	50PI67YYInK4OVwXgjufoy6x/3nFXgemXHxVzLIAyfw8uIeD1EP5RZ2t731F4vaNv4pJcQ0lWyIYP
	3GkPoEV8o78cG8q3ZG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtA7-00000000DQO-2o1e;
	Tue, 29 Jul 2025 22:51:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtA5-00000000DQ4-1B8s
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 22:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 888935C65DE;
	Tue, 29 Jul 2025 22:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9581C4CEEF;
	Tue, 29 Jul 2025 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753829468;
	bh=OM3Q7mjzFS6WpKuFOdQ8rpL1svxcPBy75KNBmRDUGPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtyfdu20PeMusrQZMS2tyBqPUBo99pb2+uNdjGk3I0ARdUqX33ozFPZk0/Myejbja
	 moC/ZVnAwNLMGLLzBPNL4xq3JureGn9EE94SIUyeadtqDOD61kRKrub2QUHE4nV8jX
	 5wBX59KQdxOWNYxjUwc9U9RWUJhnthmVfwoLGDO9izDN6WPt1YGgnYng3olcqNKzIi
	 XyixxBfCpjODfLmd1DFOuhCAwi4PuaG1XdQQF8iNxlHLIQI8xlawjlz1Xj88JnmqPJ
	 mIhRLrcWeu/rb16F7DDCDInwsFlJkBH+1+j5g3aASaoEKqdmE3LuEnax1HLYfrDonR
	 MchH7pwg8plhg==
Date: Tue, 29 Jul 2025 15:51:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/3] net: stmmac: thead: Get and enable APB clock on
 initialization
Message-ID: <aIlQWmKY4Hhe/erO@x1>
References: <20250729093734.40132-1-ziyao@disroot.org>
 <20250729093734.40132-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729093734.40132-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155109_362473_4DAA0E71 
X-CRM114-Status: GOOD (  19.79  )
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

On Tue, Jul 29, 2025 at 09:37:33AM +0000, Yao Zi wrote:
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
> +	if (IS_ERR(apb_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(apb_clk),
> +				     "failed to get apb clock\n");
> +
>  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
>  	if (!dwmac)
>  		return -ENOMEM;
> -- 
> 2.50.1
> 

Thank you for tracking down root cause and fixing it.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
