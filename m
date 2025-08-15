Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05880CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyxY2Rw3PckFEbPHkd/lSoOB5iGbR0lPuqJfzw/gxnY=; b=QzYXgkwLiP24yo
	oTTGIEn9hw732d5TEm60TqPcbeQp9x0kIwcPG2BMsfK2tRJMqHjbfQkiWomsfGLlynDKjDl532lL1
	ji52KA8MfySs0IxmbQ9oyzxwBDeX5B7OeEuhknqme34g+ltpbuzUZSGBgUx4u68Py2AzGE2jUuNte
	mHukE/YdMFcxMk89XIzrA0uVTEzoLwPHiDiVLAtKfIOdMEmMzksyG8sjuNew9xRRQEtbYbWsfF0vG
	JD3SQdjhZ/YmEAd+nE3rocyF5RlKGCTtPWikwi86hSDKDdWiLxts6c3LjJDZVoADAbPtGjYXaGRRL
	5/j2LlO/PFISDvr6W/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un46d-00000003j44-3ebk;
	Fri, 15 Aug 2025 23:45:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un46b-00000003j3X-0kGS
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 23:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CA65A58444;
	Fri, 15 Aug 2025 23:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8341C4CEEB;
	Fri, 15 Aug 2025 23:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755301503;
	bh=PmcBMUQVb7YUhAvAzMDl9UseO4hrrR3ph0w6p79xwlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjKM+RrD0htfrl3ryPG7UBplETzrOIHPabW/sMTd6k1OBSHoq7M/aM+JYITLHQRma
	 fVtLCabVsDEJGQH112zivFtuVbNagpD3qy7MV+EGVH9W4lQ6tTOUJ5N/e5kTlkDMNs
	 dRJ9VOcKtmZPcipyz+Eb49/Mq0cpqqdmu2wnpTpcdvOKStyup1PwPkibFzl7KU3OUO
	 7PfURkhmTtbQTu3Ntn+DR0WMhCtNzSgDPOcQBYqC4WwZvN4Alm2ZvM3/I/U8wSd9Ja
	 4K1xhfgaCZejxkA8BSY984mGxPOTpgA/GU0CKsTC0+PzBazsyEcXAdVZk6+WMjuMoG
	 YTOOFMN20l8JA==
Date: Fri, 15 Aug 2025 16:45:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
Message-ID: <aJ/GfmLjU/K4FJOM@x1>
References: <20250813171136.2213309-1-uwu@icenowy.me>
 <20250813171136.2213309-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813171136.2213309-3-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_164505_287092_C5BA21BF 
X-CRM114-Status: GOOD (  17.06  )
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

On Thu, Aug 14, 2025 at 01:11:36AM +0800, Icenowy Zheng wrote:
> The padctrl0 clock seems to be a child of the perisys_apb4_hclk clock,
> gating the later makes padctrl0 registers stuck too.
> 
> Fix this relationship.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index d08e7fb387e50..f6f3d63d53353 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -888,13 +888,16 @@ static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", p
>  		0x150, 11, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
>  		0x150, 12, 0);
> +static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
> +	{ .hw = &perisys_apb4_hclk.gate.hw },
> +};

Nit: when I run checkpatch on the whole file, it warns that there should
be a blank line after function/struct/union/enum declarations. Probably
best to insert a new line here.

>  static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
>  static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
>  static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
>  static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, 23, 0);
> -static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb_pclk_pd, 0x204, 22, 0);
> +static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb4_hclk_pd, 0x204, 22, 0);
>  static CCU_GATE(CLK_GMAC_AXI, gmac_axi_clk, "gmac-axi", axi4_cpusys2_aclk_pd, 0x204, 21, 0);
>  static CCU_GATE(CLK_GPIO3, gpio3_clk, "gpio3-clk", peri2sys_apb_pclk_pd, 0x204, 20, 0);
>  static CCU_GATE(CLK_GMAC0, gmac0_clk, "gmac0", gmac_pll_clk_pd, 0x204, 19, 0);
> -- 
> 2.50.1

Aside from that nit:

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
