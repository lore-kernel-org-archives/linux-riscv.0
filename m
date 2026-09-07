Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A184C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 03:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2XxwDmwHX8wG9kzMy8XTNdaq6eOfxqsPx2s/ANbmCE=; b=oRsUOGU0hH6ajQ
	/9L1+46JVB3Lfx+c7oNaZgHykS7cXBSFJBQg31IxP8sv4gO6axxIk/TEZrAyKCO0+7Cb4cxrXfu73
	E1U5GjO50KiinvGlPaY9ZbOwVWU9f4oM5St/ROcye0j3Ruoid9lRG2JW0p3OP4WhDrtlT2eUpMr9W
	WCcWdIyx2hYQZFeaLEnmLkblRRIV1Utw2i3/RtMGdWsSilh8AKd36C2yveZcutI0ot37TAAHYFJmh
	DpA7FDSOhm/TUlFDqaIpH090aUx+jJ2gcaNKYrgt3vODqd/gS8ZgcGwfF+y3I5ntAl/xvZqY+0jJL
	JuFhaK5ROY0lkM+PIgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PqR-00000005kow-0JvF;
	Mon, 07 Sep 2026 03:16:31 +0000
Received: from mail-m16023653200.xmail.ntesmail.com ([160.236.53.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PqM-00000005kne-2ZfU;
	Mon, 07 Sep 2026 03:16:29 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cbfa21e5;
	Mon, 7 Sep 2026 11:16:05 +0800 (GMT+08:00)
Message-ID: <d4cfd407-9cf7-4907-9ef9-8bb52b5ec669@rock-chips.com>
Date: Mon, 7 Sep 2026 11:16:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/19] phy: Add common Innosilicon HDMI PHY helpers
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Andy Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132737eucas1p240d02860355b180ff9c5e8e4c6941ec0@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-15-484f9ae72715@samsung.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-15-484f9ae72715@samsung.com>
X-HM-Tid: 0aa079ddac6403a7kunm8546d35235ff8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEtCVkoZHU1OHUwdTx5OSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ku4RR7ubhkME7SdU7Q1vR5N4bs9Jd9O9dvZ9PeeRSteOPVUkDArQId4e3ukUTnqz+qWufSkjKXJ2R4/U363WXT4BSsLmk0+jXlh+bAmQV7Motws9BeZFvlX3PDZsY+ze3KEL/3yqEcWz8+aHEvsZGtdV4HknbJNEDvGIuMZ8U48=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+vkcaZtmTBN2qJZBZCZ7S5klbEWaaU26s6Uci6PmceU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_201627_287889_4F904ED0 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Hello Michal,

On 9/4/2026 9:27 PM, Michal Wilczynski wrote:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
> 
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
> 
> No driver uses it yet; the users are converted separately.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/phy/Kconfig               |   8 +
>  drivers/phy/Makefile              |   1 +
>  drivers/phy/phy-inno-hdmi.c       | 298 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/inno-hdmi-phy.h |  85 +++++++++++
>  4 files changed, 392 insertions(+)
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
