Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC4FC87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 03:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw5/oZXeeiC1dd896tauNsHZcs6DZ7k6k8nSXMpQLGE=; b=NUh2WPWoiZeprY
	oRWmmJjok4cMw+gdgmBkOy2nC0nINN7cLayEUVz/PJ+kqyScYnnzdkEAdFOp6qusBv8y759W6aq69
	JIbwC7+sHV4e4E7Y1Annbr6Xw7VMzZX6JZsxPEAT/+JUDFbTl8MFIc1QdfZ5MVIMjhq009sRaIodd
	Mp3YKn7BKHEDsu4+Aki+kbb4bMpp28Uun+Vrbeu0Lex4ta7QTLhnlGtINPqkMnfWud1QbwTJEbkFJ
	CElXGI2vJs22NPkhNcx6nT2pN48QLYSyHdm/yq/fsbP/7qyg2jcwwzi/iWZpS0jUTAtQfZhEKWmM6
	4OwnjAnvC3oKjj5yXz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhgOz-00000004soo-0ieh;
	Fri, 01 Aug 2025 03:25:49 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhgOx-00000004soR-0rBS
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 03:25:48 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 77F3F12FB41C;
	Thu, 31 Jul 2025 20:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754018742; bh=RyU/06axbOmuAEJla6gJSqqD6WDLQtT4/yHasgWo1pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTD6gLEJ2CxMefUxfELj+QGXw7f1ofNLfDbbteWeH0CUnHdx0xr3kDgc+CCm60WTv
	 mP1RYMfwcVQ/EyKU3dx9NbiQcnP1y/NgPN8L6n/tVAKt8X14V/zj7k6I5miD0iJvSQ
	 M+y8cSVF9F+3h1rLhWuTCH5W7NZSKmSs5UhIZ98vzXJqJUtSkst6j4fW/RdduEC6Ha
	 0tUV/5BgD7dFkgj9woUOasCD7LjOWjPUJzL1Kpe/MibT3ttBJ2DUxdy13lS8P7Vdjc
	 4YAjbNfvE89YPtIoHOJyLwVHwyc8eLU722xMB1ko0CfWIuu41vrrkDmJw4UpvNNQ9K
	 KuPg/DJbTyJRQ==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3_rfJeT08lw; Thu, 31 Jul 2025 20:25:39 -0700 (PDT)
Received: from ketchup (unknown [117.171.66.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id C3E1112FB405;
	Thu, 31 Jul 2025 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754018739; bh=RyU/06axbOmuAEJla6gJSqqD6WDLQtT4/yHasgWo1pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnRgjqoe3THj7xbnE85paANZv0icsEkbjpr9Ce/YDMcF8rblWRxnJYHNON/ekjKd3
	 305OiLnwCecZ4BuKK1fhaIYEv4S8/FKCH53aIkZUekhlJ0D4GfdSHyKwYdt054iKvQ
	 uxpy51q9ELngIZpIOzeYhRUCFdk/fjzf4DWzPyza9oQJVOY0yf3LdJ6FIK2DNXFPtv
	 LAJuxvSIOw8s/tyc9Yl8bAeaTRMxSg2wXtK99TYKyEQF25L5vbmUweZ3RUNCInRnQF
	 LqZImkf8dO+8NGI+FWXtyZ8B1DoUKLENjYg37vf5FY9eJ9mxSsuwTjuGvNvHhnGzZp
	 ROz16puH1/qzg==
Date: Fri, 1 Aug 2025 03:25:32 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH RESEND v3 2/2] clk: spacemit: fix sspax_clk
Message-ID: <aIwzrHKD-GiZ0oFv@ketchup>
References: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
 <20250731-k1-clk-i2s-v3-2-2f655ddb0c6f@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250731-k1-clk-i2s-v3-2-2f655ddb0c6f@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_202547_566069_1DA0AF2F 
X-CRM114-Status: GOOD (  16.68  )
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

On Thu, Jul 31, 2025 at 10:14:07PM +0800, Troy Mitchell wrote:
> Hardware Requirement:
> When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
> BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.

The change itself looks good to me. But additionally, maybe it's helpful
to have a comment explaining this, just like twsi8_clk's case.

> This patch introduces SSPAx_I2S_BCLK as a virtual gate to enable BIT3.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Suggested-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

With a comment added, feel free to add my

Reviewed-by: Haylen Chu <heylenay@4d2.org>

Regards,
Haylen Chu

> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a0523537c2f436e481ae8d6ec5a581b87e..24a561499a7c11b6a661c026f0bd2fac28fe7b04 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -349,7 +349,10 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
>  
>  CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
>  
> -static const struct clk_parent_data sspa_parents[] = {
> +CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
> +CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
> +
> +static const struct clk_parent_data sspa0_parents[] = {
>  	CCU_PARENT_HW(pll1_d384_6p4),
>  	CCU_PARENT_HW(pll1_d192_12p8),
>  	CCU_PARENT_HW(pll1_d96_25p6),
> @@ -357,10 +360,22 @@ static const struct clk_parent_data sspa_parents[] = {
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
> @@ -965,6 +980,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>  	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
>  	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
>  	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
> +	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
> +	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> 
> -- 
> 2.50.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
