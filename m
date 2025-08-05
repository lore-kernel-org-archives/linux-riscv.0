Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF68C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 23:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS0/ikUMyeg+x80IA93nM4nxBqd7QGdbKCXoCB7aR7M=; b=srhNj7a0p5tJpw
	pnLlxUXS/scqo9Iqt3MOkJC6RVrEOMQcbT/RqD7KcTvcgAqzcE1lUKJSfnUERmxGhms86txEz8k4N
	thssm3UWBxkt2glASe8IDyFCm6CIfwQE3LLN+lu1gUan8AAbVCAkhXPk7wF8peTjUS9TBL6wJ3wIf
	AoU95IBp46CNcW+FoHw0ZVal51GneohqpT9lkholaWy7JXoYhnP5oxYDs63yGWbi/0mCB+5jeEt7P
	hnWzq7DeHaunD+Bveupg9f+gSGKVL21FFDRxlccDh95flYuD3HtmDPz37asSyAyG6teiC23M8MbUl
	xx10M068uieoO1Fx6bZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRK9-0000000E0bY-0tly;
	Tue, 05 Aug 2025 23:44:05 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRK5-0000000E0a0-2DVD
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 23:44:03 +0000
Received: from localhost (unknown [116.232.147.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DAEC43406F2;
	Tue, 05 Aug 2025 23:43:59 +0000 (UTC)
Date: Wed, 6 Aug 2025 07:43:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, elder@riscstar.com,
	heylenay@4d2.org, inochiama@outlook.com, krzk+dt@kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, mturquette@baylibre.com,
	robh@kernel.org, sboyd@kernel.org, spacemit@lists.linux.dev,
	ziyao@disroot.org
Subject: Re: [PATCH v4 2/2] clk: spacemit: fix sspax_clk
Message-ID: <20250805234355-GYA958398@gentoo>
References: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
 <E801E7AF425E08C7+20250805131646.2216375-1-troy.mitchell@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E801E7AF425E08C7+20250805131646.2216375-1-troy.mitchell@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_164401_594586_B851562F 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Troy,
  to make the title more clear and explicit, how about:

"clk: spacemit: introduce SSPAx_I2S_BCLK clock for SSPA"

On 21:16 Tue 05 Aug     , Troy Mitchell wrote:
> Hardware Requirement:
> When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
..
> BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.
> 
> This patch introduces SSPAx_I2S_BCLK as a virtual gate to enable BIT3.
> 
slightly improve the wording, and check if it's accurate:

BIT[3] of this register must be set if need to select i2s_bclk as
SSPA parent clock, to solve this, introduces a new SSPAx_I2S_BCLK
clock as the virtual gate clock.

> Suggested-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a05235..4a91d28da2fb 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -349,7 +349,14 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
>  
>  CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
>  
> -static const struct clk_parent_data sspa_parents[] = {
> +/*
> + * When i2s_bclk is selected as the parent clock of sspa,
> + * the hardware requires bit3 to be set
> + */
> +CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
> +CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
> +
> +static const struct clk_parent_data sspa0_parents[] = {
>  	CCU_PARENT_HW(pll1_d384_6p4),
>  	CCU_PARENT_HW(pll1_d192_12p8),
>  	CCU_PARENT_HW(pll1_d96_25p6),
> @@ -357,10 +364,22 @@ static const struct clk_parent_data sspa_parents[] = {
>  	CCU_PARENT_HW(pll1_d768_3p2),
>  	CCU_PARENT_HW(pll1_d1536_1p6),
>  	CCU_PARENT_HW(pll1_d3072_0p8),
> -	CCU_PARENT_HW(i2s_bclk),
> +	CCU_PARENT_HW(sspa0_i2s_bclk),
>  };
> -CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
> -CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(sspa0_clk, sspa0_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
> +
> +static const struct clk_parent_data sspa1_parents[] = {
> +	CCU_PARENT_HW(pll1_d384_6p4),
> +	CCU_PARENT_HW(pll1_d192_12p8),
> +	CCU_PARENT_HW(pll1_d96_25p6),
> +	CCU_PARENT_HW(pll1_d48_51p2),
> +	CCU_PARENT_HW(pll1_d768_3p2),
> +	CCU_PARENT_HW(pll1_d1536_1p6),
> +	CCU_PARENT_HW(pll1_d3072_0p8),
> +	CCU_PARENT_HW(sspa1_i2s_bclk),
> +};
> +CCU_MUX_GATE_DEFINE(sspa1_clk, sspa1_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
> +
>  CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
>  CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
>  CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
> @@ -965,6 +984,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>  	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
>  	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
>  	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
> +	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
> +	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -- 
> 2.50.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
