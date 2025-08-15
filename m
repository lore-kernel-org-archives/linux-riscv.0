Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6965FCA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvn1IpAI0fjk50Ps3j3Gf0q2gGUCmGQVgAqlbPQPhkM=; b=39yHHtJlxpPxYK
	sUnhNo/P9pfO1RjvWw9PQSJkosNOtA6ADq4FEb+FxJZz+LATmnNb/SktXpbhuQAyA2pTqzhKa+JX1
	tDOnC86ygzuxsCM+FhYoctQNdtBy+GUnirXbsir3ODlHCYu4xBupfLAnsh8l+5R8zs9scKrVVnZOW
	pc3ziBgYrjetezLzcCLaxqBuWBN8p6vPptARd8Vm4skyU6vhyQhA84TeJtdgv+u8Fml4ElqndO15I
	45Osk6og1bmdBdWUGT4mHNukcfqYTKDaRkCmgvFlHI1Dw+UHiWMPY84JTHBUN0kCB3fEHB6doRDhA
	uk93xjjxRbMkrQsL3NcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiur-000000010JL-28om;
	Fri, 15 Aug 2025 01:07:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiMr-00000000uWP-3rL4
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DD775C71CE;
	Fri, 15 Aug 2025 00:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA15EC4CEED;
	Fri, 15 Aug 2025 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755217944;
	bh=137LREHYlf3O0nOm9QpaXT3ohL/dKVWc4fbvyJZAR2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8zbGxbIa1IvVDqW2E6Y08jD3EhIjoEBs0kLOAGBQ5AJpdUDpaxkM6AEgMCp/I+Rf
	 pEu+stkbCruZaRbD17WbvwEU0o6QhiqF1ulkBpFCULNoN+IV0JxslqN6vwxke2wUFr
	 DLs+vdzvTX1clE7UKCHHow8ajxCA78I1gCpHyDYwZmFs03f7m/M0hGNF0/D+beByiz
	 z8u8dsoqiJ8u7eXTxPrbUjy86s/O58Atwp0NmYwfrwhN92pOGUMF2Tn5nHvFqKgFZf
	 zIE+NetzGOfBPVNCv6onQFw9vgyOn9Pb1S+wgVclhGBDg9A0RXfhjYx6tdm25/3bNY
	 JI0SiQ38DytNQ==
Date: Thu, 14 Aug 2025 17:32:22 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: thead: support changing DPU pixel clock rate
Message-ID: <aJ6AFttcM+jUHHQy@x1>
References: <20250813072702.2176993-1-uwu@icenowy.me>
 <20250813072702.2176993-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813072702.2176993-3-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_173226_040881_686892C2 
X-CRM114-Status: GOOD (  23.00  )
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

On Wed, Aug 13, 2025 at 03:27:01PM +0800, Icenowy Zheng wrote:
> The DPU pixel clock rate corresponds to the required dot clock of the
> display mode, so it needs to be tweakable.
> 
> Add support to change it, by adding generic divider setting code,
> arming the code to the dpu0/dpu1 clocks, and setting the pixel clock
> connected to the DPU (after a gate) to CLK_SET_RATE_PARENT to propagate
> it to the dividers.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Dropped round_rate() because of deprecation.
> - Changed the logic of determine_rate() to early return if the divider
>   could be changed.
> 
>  drivers/clk/thead/clk-th1520-ap.c | 64 ++++++++++++++++++++++++++++---
>  1 file changed, 59 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 0b5458af8c550..b220a8ed22607 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -55,6 +55,7 @@ struct ccu_gate {
>  
>  struct ccu_div {
>  	u32			enable;
> +	u32			div_en;
>  	struct ccu_div_internal	div;
>  	struct ccu_internal	mux;
>  	struct ccu_common	common;
> @@ -198,6 +199,56 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> +static int ccu_div_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct ccu_div *cd = hw_to_ccu_div(hw);
> +	unsigned int val;
> +
> +	if (cd->div_en)
> +		return divider_determine_rate(hw, req, NULL,
> +					      cd->div.width, cd->div.flags);
> +
> +	regmap_read(cd->common.map, cd->common.cfg0, &val);
> +	val = val >> cd->div.shift;
> +	val &= GENMASK(cd->div.width - 1, 0);
> +	return divider_ro_determine_rate(hw, req, NULL, cd->div.width,
> +					 cd->div.flags, val);
> +}
> +
> +static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long parent_rate)

This should line up with open parenthesis. Other than that nit:

Reviewed-by: Drew Fustini <fustini@kernel.org>

If no other issues arise on this series, then I can just fix it up when
applying.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
