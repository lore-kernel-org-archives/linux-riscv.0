Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BD0C36005
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0b1YRTr+SuJ6dGLF7tjjDAeT/ZzStxqx9p/PyAgNiWE=; b=lr1edjpP5CxQrc
	jLalA2hYZYm2/cXHjEbwYJrcfK9FtPEMkSSom3JKH0Vl3K64AaQwu5dCnhXOOqPjZe/uo7+Cq3v9I
	zqofVN4XEom8B0VjkkOPbNDtfgrlECmUfEAynjLLh5fUt4+282mzfWoNvg1PhhqGfKUcp+5Vy41CO
	+aFp5kcCVblZ6/O3XU02cBuygwE4qbljdKdLk3K9nYfji4sraH5PJecsvIcEAY6tPoScztJh7Mjmn
	FkYNFhTVZCoU8bgmYzbMi0JVv/BYKAWMjUmUE75KKmHklwUcIqcuGqbE8+kiaDYMHHdoJMNnpNrOw
	thBVhJTQVgvo/ogatnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1in-000000005Mb-38i4;
	Sat, 22 Mar 2025 16:29:17 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1il-000000005MB-29bj
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 16:29:16 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BF8073430C1;
	Sat, 22 Mar 2025 16:29:13 +0000 (UTC)
Date: Sat, 22 Mar 2025 16:29:09 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
Message-ID: <20250322162909-GYA15267@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_092915_586734_4FDE162C 
X-CRM114-Status: GOOD (  12.44  )
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

On 10:18 Fri 21 Mar     , Alex Elder wrote:
> Define reset controls associated with the MPMU, APBC, and APMU
> SpacemiT K1 CCUs.  These already have clocks associated with them.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 6d879411c6c05..be8abd27753cb 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
..  
> +static const struct ccu_reset_data apmu_reset_data[] = {
> +	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
> +	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
> +	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
..
> +	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, 
> +				      BIT(9)|BIT(10)|BIT(11)),
100 column if possible, also add one space between "BIT(9) | BIT(10) .."
continuous bits can just use GENMASK for short?
but may result slightly unreadable, anyway, either way is fine by me

> +	[RST_QSPI]	= RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_QSPI_BUS] = RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_DMA]	= RST_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_AES]	= RST_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
> +	[RST_VPU]	= RST_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_GPU]	= RST_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_EMMC]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_EMMC_X]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_AUDIO]	= RST_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
> +				   BIT(0) | BIT(2) | BIT(3)),
> +	[RST_HDMI]	= RST_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
> +	[RST_PCIE0]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
> +				   BIT(3) | BIT(4) | BIT(5)),
> +	[RST_PCIE1]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
> +				   BIT(3) | BIT(4) | BIT(5)),
> +	[RST_PCIE2]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
> +				   BIT(3) | BIT(4) | BIT(5)),
> +	[RST_EMAC0]	= RST_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_EMAC1]	= RST_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_JPG]	= RST_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_CCIC2PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
> +	[RST_CCIC3PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
> +	[RST_CSI]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RST_ISP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
> +	[RST_ISP_CPP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
> +	[RST_ISP_BUS]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
> +	[RST_ISP_CI]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
> +	[RST_DPU_MCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
> +	[RST_DPU_ESC]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
> +	[RST_DPU_HCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
> +	[RST_DPU_SPIBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL,	0, BIT(4)),
> +	[RST_DPU_SPI_HBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
> +	[RST_V2D]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
> +	[RST_MIPI]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
> +	[RST_MC]	= RST_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data apmu_reset_controller_data = {
> +	.count		= ARRAY_SIZE(apmu_reset_data),
> +	.data		= apmu_reset_data,
> +};
> +
>  static const struct k1_ccu_data k1_ccu_apmu_data = {
>  	.clk		= k1_ccu_apmu_clks,
> +	.rst_data	= &apmu_reset_controller_data,
>  };
>  
>  static struct ccu_reset_controller *
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
