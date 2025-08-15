Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76A4CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 02:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTYxCG+UJXh94qybTBKHswXyi/Sb/bzPYv+fmm4plAc=; b=EbxS04gIXkeXC3
	1CLD+ikcbd5PX0RdYbNjpqrh3AqKg78isiXaS0MQ2cKg/v5zaU92fz2Ea6RSusaDzvMuv9vzZBoIH
	aBzPtoyam+4AT/drOmDEi0FYX2uzxxYNqkM6E/k5iueacuHtJd245j9hjHuQZ7phjNvpHthn+Q36u
	Fjd8J/DWKEtBPbAqDCilczF0TXV7DgZmQU5+qS+gjfGt9HrDl+VqVHa5k8wzr0iBUQsPEoecv/qzJ
	uCR1a3JLgfjEGtyNCHllDE0g+L7Y1TEIt5hdM6LHH2rqaG7f/TwnQsqLenct9YWUdm1vQnIpcFiGz
	gy46GnUIIE8s5Cy09erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umk7g-0000000192m-402S;
	Fri, 15 Aug 2025 02:24:52 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umk7d-0000000191Y-24mO
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 02:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755224595;
	bh=Niaj4OMwo4W2fUafjFNulcdi+Nlm7R7eM7SD6asWCMs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FCooDpuWksw/F7cDFKP0vZ3Wi0MNf0CNcYpclpJHtF6C0bARNkUJH2Nx7ABLcqse7
	 KQknpZRT5CesDRsxQ1NnT3RRbOtvHsQn+wJosmfv6HZ5jN7S057XAiW0PZjnA448P1
	 c/1EXtvYLIx+HxToTZzPCOmPvwycF5PFiLQMq90E=
X-QQ-mid: zesmtpgz7t1755224593t961c5431
X-QQ-Originating-IP: 9mkEVNaVfiiSECCslKxiFqq//seDD1r4T4Oyt/0nWFw=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Aug 2025 10:23:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14240890600098775965
EX-QQ-RecipientCnt: 13
Date: Fri, 15 Aug 2025 10:23:12 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 2/3] clk: thead: support changing DPU pixel clock rate
Message-ID: <B226CDDA4BC5D173+aJ6aEPwUqM91jnLv@LT-Guozexi>
References: <20250813072702.2176993-1-uwu@icenowy.me>
 <20250813072702.2176993-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813072702.2176993-3-uwu@icenowy.me>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OfjuGSsnNogoBWLamWjnBH6PFvdp5G2UrxGt3JTKfJ7Z9tXnWnN+qWIh
	CVyXo1rdBbNXGcFd76vBz2+xtw1I1j6tfyUIpUTmFoouy86/o1SisI+QswQYOXKYBXLfdFg
	XZCvL85mjs4pudbjHtJP5zvWEvTbGLsXtB68O3xqko6PFr7qawLir6VSverDiyCTf33mEIH
	vvmeuSA5Zxzh0ANmpO1Q/mZlMrxKUoKZj9YyvfgTk17y7ZvFlfA6HlfIVZuIobm18sqMEq7
	qB4eNpiE0s5X7X9wDN8HZxKSb+BadGX2zjhRyemqF9syecRBap+VdgFLbdFwgFYx5Utsp9l
	aRLOD2fWKVrYk2Z/m/l7Tn9/n+bMa1YyOhnrn3M2Tava6FXXFd9/r9OpujtAapv0p9IJHgJ
	IdewXRtyPSyDt/Aq8gllXBFvnbDCRIw5WO2d39jayTH9YO4dgTl7v8Vt861K+cpQJTEGZNo
	gdalABRMqpxFeVt9EdUPFevdbTnWQu1ZLqem/iM718IxmOowTWWaA88xEUPnOl4M5+E+vr+
	H3v7UaHEFOcYtet24X3L34h7wfXAOsdngMLSUGN0P1xg8x6A+NRWLF/jDvZMjeXjRDIrOcJ
	JSLBb6lKO1M5Re/lFWkIsASFq5XYnpNdFCS1pDONfk878BkZeUkys9c2DwaOlxNLVtgOhTW
	q+f1yaqgUXQ73/wKq5zZ/CUXlrMDyiUA8xZ1mYWrKKfF6es7y0F337mjQoY4N/AXcwhKtCH
	PMhQmCiQ/5/nNVsWHyEFZEljrnZ/P17xwoqyNNLP7qVdJ1Kx/kvkRQBoPbGvdFFP2Dk1O0v
	gKzlksxnCj2rqKAA3UurrhaIxnchDRjdRjZP+4Jamj7fvBZpyMnSN+81+KBYd2WPgDrhPrf
	r+0NwZdhjeqMkWinU1OosGiNInr84tw03PdQKXXuEteBSBctDEBPBbgVDL3wb2FDs9lMHC5
	yW5trO/puLaYkl1d2ADxqOXKmdIf+uMZUk4XzaA3ipqUkcusE/bynJIWpRDhOrcf1Z3hc+f
	S7m7b3lb10vuJ/SPvuKgbLujXVNZcgC7VQsmEqS38ENYo92xsZESwoFxOzbFtREDVUF3ECu
	A==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_192450_046955_417A1ED9 
X-CRM114-Status: GOOD (  25.55  )
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
...
> +static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long parent_rate)
> +{
> +	struct ccu_div *cd = hw_to_ccu_div(hw);
> +	int val = divider_get_val(rate, parent_rate, NULL,
> +				  cd->div.width, cd->div.flags);
> +	unsigned int curr_val, reg_val;
> +
> +	if (val < 0)
> +		return val;
> +
> +	regmap_read(cd->common.map, cd->common.cfg0, &reg_val);
> +	curr_val = reg_val;
uh? remove this line.

                - Troy

> +	curr_val = curr_val >> cd->div.shift;
> +	curr_val &= GENMASK(cd->div.width - 1, 0);
> +
> +	if (!cd->div_en && curr_val != val)
> +		return -EINVAL;
> +
> +	reg_val &= ~cd->div_en;
> +	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
> +	udelay(1);
> +
> +	reg_val &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
> +	reg_val |= val << cd->div.shift;
> +	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
> +
> +	reg_val |= cd->div_en;
> +	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
> +
> +	return 0;
> +}
> +
>  static u8 ccu_div_get_parent(struct clk_hw *hw)
>  {
>  	struct ccu_div *cd = hw_to_ccu_div(hw);
> @@ -240,7 +291,8 @@ static const struct clk_ops ccu_div_ops = {
>  	.get_parent	= ccu_div_get_parent,
>  	.set_parent	= ccu_div_set_parent,
>  	.recalc_rate	= ccu_div_recalc_rate,
> -	.determine_rate	= clk_hw_determine_rate_no_reparent,
> +	.set_rate	= ccu_div_set_rate,
> +	.determine_rate = ccu_div_determine_rate,
>  };
>  
>  static void ccu_pll_disable(struct clk_hw *hw)
> @@ -784,6 +836,7 @@ static struct ccu_div venc_clk = {
>  };
>  
>  static struct ccu_div dpu0_clk = {
> +	.div_en		= BIT(8),
>  	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
>  	.common		= {
>  		.clkid          = CLK_DPU0,
> @@ -791,7 +844,7 @@ static struct ccu_div dpu0_clk = {
>  		.hw.init	= CLK_HW_INIT_PARENTS_HW("dpu0",
>  					      dpu0_pll_clk_parent,
>  					      &ccu_div_ops,
> -					      0),
> +					      CLK_SET_RATE_UNGATE),
>  	},
>  };
>  
> @@ -800,6 +853,7 @@ static const struct clk_parent_data dpu0_clk_pd[] = {
>  };
>  
>  static struct ccu_div dpu1_clk = {
> +	.div_en		= BIT(8),
>  	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
>  	.common		= {
>  		.clkid          = CLK_DPU1,
> @@ -807,7 +861,7 @@ static struct ccu_div dpu1_clk = {
>  		.hw.init	= CLK_HW_INIT_PARENTS_HW("dpu1",
>  					      dpu1_pll_clk_parent,
>  					      &ccu_div_ops,
> -					      0),
> +					      CLK_SET_RATE_UNGATE),
>  	},
>  };
>  
> @@ -891,9 +945,9 @@ static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
>  static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
>  		video_pll_clk_pd, 0x0, BIT(4), 0);
>  static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
> -		dpu0_clk_pd, 0x0, BIT(5), 0);
> +		dpu0_clk_pd, 0x0, BIT(5), CLK_SET_RATE_PARENT);
>  static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
> -		dpu1_clk_pd, 0x0, BIT(6), 0);
> +		dpu1_clk_pd, 0x0, BIT(6), CLK_SET_RATE_PARENT);
>  static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
>  		BIT(7), 0);
>  static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
> -- 
> 2.50.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
