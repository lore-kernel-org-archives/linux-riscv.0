Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E8CC624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdNUkdjxws9XjMInahgqcvCjsRu4XBll4pvetHaFonY=; b=fKQXB/2U74GuNV
	ZZIBXZl8CBZWT2x38z8caT41UA7ktBlExJ3y20bkESVl0zfGtMi18AOXNo4yE3ONZ+o1MqAQwU/bH
	bMNh2tH0yy6gLLouainD2lpzjPQW/UUksHvX/ymiq5asT3YihU0yHmfj1JP3qhQidca5jkgR/wxU+
	yUoWtzNrXJSsgvzuXI/V5wG/GDfJliO6J/M5ogmmEQxNx78pgIdxkdlLRyPv2typmLuiiNro9Ky+A
	nNk43Y4vl4HG9/mZaDWY5DMsKLiwA0w6RSXWreBKlocBs6ZXdZWF7wHoB4JoTlkcfw/rWo9LhFHIi
	G9diXCU43zZ3AfsHaLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Db-0000000Ggbz-38GO;
	Thu, 03 Sep 2026 07:50:43 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22DX-0000000GgaB-3jxX;
	Thu, 03 Sep 2026 07:50:41 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 45462200571;
	Thu, 03 Sep 2026 09:50:35 +0200 (CEST)
Message-ID: <0ffb792adfafd06a0d7fc65153707e3c728fe0ac.camel@pengutronix.de>
Subject: Re: [PATCH v2 08/15] soc: starfive: Add jh7110-hdmi-subsystem driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrzej Hajda	 <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Emil Renner Berthing <kernel@esmil.dk>, Hal
 Feng <hal.feng@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley	
 <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti	
 <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>
Date: Thu, 03 Sep 2026 09:50:35 +0200
In-Reply-To: <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
		<CGME20260828134828eucas1p1b4061de1538ef0d3322dc32f3db6140e@eucas1p1.samsung.com>
	 <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005040_084989_7F3B5B0F 
X-CRM114-Status: GOOD (  21.98  )
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
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andy Yan <andyshrk@163.com>, Graham Markall <hello@big-grey.co.uk>, linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, Maud Spierings <maudspierings@gocontroll.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fr, 2026-08-28 at 15:47 +0200, Michal Wilczynski wrote:
> Add the parent driver for the monolithic JH7110 HDMI IP block.
> 
> This driver binds to the starfive,jh7110-hdmi-subsystem node. It maps the
> shared register block, creates a regmap, and calls
> devm_of_platform_populate() to create its hdmi_phy and hdmi_controller
> child devices, which retrieve the shared regmap from this parent.
> 
> The NoC display-bus clock and reset gate access to the whole vout register
> region, and this subsystem's PHY child is the first device there to touch
> registers. Enable the bus before populating the children; PD_VOUT is
> handled by genpd through the power-domains property.
> 
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/soc/Kconfig                          |   1 +
>  drivers/soc/Makefile                         |   1 +
>  drivers/soc/starfive/Kconfig                 |  27 +++++++
>  drivers/soc/starfive/Makefile                |   2 +
>  drivers/soc/starfive/jh7110-hdmi-subsystem.c | 114 +++++++++++++++++++++++++++
>  5 files changed, 145 insertions(+)
> 
[...]
> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d893c1c29f98b072b09d261343d3317dbf4c75fe
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
> @@ -0,0 +1,114 @@
[...]
> +static int starfive_hdmi_subsys_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *bus_rst;
> +	void __iomem *regs;
> +	struct regmap *regmap;
> +	struct clk *bus_clk;
> +	int ret;
> +
> +	/*
> +	 * The NoC display-bus clock and reset gate access to the whole vout
> +	 * register region, and this subsystem's PHY child is the first device in
> +	 * that region to touch registers. Bring the bus up here before
> +	 * populating the children; PD_VOUT is powered on by genpd through the
> +	 * power-domains property.
> +	 */
> +	bus_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk),
> +				     "Failed to get NoC bus clock\n");
> +
> +	ret = clk_prepare_enable(bus_clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable NoC bus clock\n");
> +
> +	ret = devm_add_action_or_reset(dev, starfive_hdmi_subsys_clk_disable, bus_clk);
> +	if (ret)
> +		return ret;

You can simplify this with devm_clk_get_enabled().

> +	bus_rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(bus_rst))
> +		return dev_err_probe(dev, PTR_ERR(bus_rst),
> +				     "Failed to get NoC bus reset\n");
> +
> +	ret = reset_control_deassert(bus_rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to deassert NoC bus reset\n");
> +
> +	ret = devm_add_action_or_reset(dev, starfive_hdmi_subsys_rst_assert, bus_rst);
> +	if (ret)
> +		return ret;

You can simplify this with
devm_reset_control_get_exclusive_deasserted().

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
