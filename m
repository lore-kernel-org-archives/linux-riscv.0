Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C711CA0FE1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/eZxayObKH295QGaPzxXEpHklfOfbhMw5PVFoo3Wz8=; b=X1K/ydN7mpSGQi
	wvmV3kaaG6Ad26nPZpBst65tTfU1RWYziwMavwyCMxfMMviS4MFSDZYxsMAlLjkPGyq7Xz25YkqoC
	wygED8+uFfZCp1S0Ja+JExMS8bcZ1IUmWcwXQmfFejczjqsp4LNqS9EELB1ppZckLuUrL2faOuX3x
	w+8O4EMJxiWMm24J6WIqMF+kxnIsw0ZXVhzNyoVmXA9D5xolg9sT/rgTmidEF3rg/1D5tVfOyP4cB
	C6gedWCYTJ7loQuhCEZdxXcm4lE7WdYr4y3l0uKx2t2wy6c31PrFYhRz8i/IXrMKGGI6AiYzR5Ar7
	Nhk9kPm+LBPw4mShwg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSzS-00000007PdV-1AlV;
	Mon, 25 Aug 2025 08:55:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSlL-00000007MGh-2jND;
	Mon, 25 Aug 2025 08:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 956795C4C29;
	Mon, 25 Aug 2025 08:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7064FC4CEF1;
	Mon, 25 Aug 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756111270;
	bh=YvGhFydXbrmE9yimRweNKCZChGzfZ1CATQpB6bIekEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOMZ2uUVb/0wo3syOidoV1f0HRnUy2RJHSLMdGqk7yLVCovHqwhjwaAlh5RRjGhHZ
	 vntVwdIrQaIPc6RHyWqxDvKuJf4yALVzvwSkz6MQRZOCjYqhY5PmaPIKYrOPpB1p8u
	 ZQQcgaSOLbnXSBweKyIJlNLbQ4eko+2s1j1Kyd2DdcthL3uR+6Q+zm9V6VZoqVXEwk
	 YjSDNkhA9rZ9AoJyJlfQ5AVgcfN/tGkd589lOdTPjxZRJZFSYBmnMyeGFXPtEjvyYF
	 AaBOk5ZqAGeb9e0X69QoM8YFdfSFRB83tOPM4vDNmgfhRwb0C+7Wd6fILQWTsgyp8c
	 FHQseDkSJrtGw==
Date: Mon, 25 Aug 2025 16:41:07 +0800
From: Yixun Lan <dlan@kernel.org>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 050/114] clk: spacemit: ccu_mix: convert from
 round_rate() to determine_rate()
Message-ID: <20250825084107-GYB1096417@kernel.org>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-50-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-50-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_014111_771530_D4A167CA 
X-CRM114-Status: GOOD (  19.85  )
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

Hi Brian,

On 11:18 Mon 11 Aug     , Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..7b7990875372314dce131295af7f40267d0a127a 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -80,10 +80,12 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
>  					       MIX_FC_TIMEOUT_US);
>  }
>  
> -static long ccu_factor_round_rate(struct clk_hw *hw, unsigned long rate,
> -				  unsigned long *prate)
> +static int ccu_factor_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
>  {
> -	return ccu_factor_recalc_rate(hw, *prate);
> +	req->rate = ccu_factor_recalc_rate(hw, req->best_parent_rate);
> +
> +	return 0;
>  }
>  
>  static int ccu_factor_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -198,7 +200,7 @@ const struct clk_ops spacemit_ccu_gate_ops = {
>  };
>  
>  const struct clk_ops spacemit_ccu_factor_ops = {
> -	.round_rate	= ccu_factor_round_rate,
> +	.determine_rate = ccu_factor_determine_rate,
>  	.recalc_rate	= ccu_factor_recalc_rate,
>  	.set_rate	= ccu_factor_set_rate,
>  };
> @@ -220,7 +222,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
>  	.enable		= ccu_gate_enable,
>  	.is_enabled	= ccu_gate_is_enabled,
>  
> -	.round_rate	= ccu_factor_round_rate,
> +	.determine_rate = ccu_factor_determine_rate,
>  	.recalc_rate	= ccu_factor_recalc_rate,
>  	.set_rate	= ccu_factor_set_rate,
>  };
> 
> -- 
> 2.50.1
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
