Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988DBCAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ic+waCzDoOryj6lGFyGWDNSaR/Q5mofKeA9KWCmbVsI=; b=E/Akd+QGmF9Lpe
	kM1NvlJb8/7/xykKoHihLytB6P472rIYuhS8th/+BLU65H9COCsJKT7O6rKBdCEjdKBniE9bkQP/g
	0q3k/ukfnEY3fWhIBTpFG4OLt+P+EuS27q4HnWjvk/Mqr04AwWq0bF+UaVSOhi9hGMyW1OJ/7WS5X
	+Okyj0WoQyy2gbyVzRyqe5M9RGJqOqO2sardxdvY1MfiRCTKZvGKhUrcu2N9jXBbb4xqo57v8Mx6G
	ddff9XLplvI6m/L4vB1ZPr608DLgGGmgi//y3182s9AYAKnfOoQflEoKnDAkb6/WzKQMT0sRKZWWI
	vqjuHUdfiPfZswSI/SPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8JU-0000000Avmb-3hIk;
	Fri, 12 Sep 2025 18:16:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomDF-0000000ETJg-0xOy;
	Wed, 20 Aug 2025 17:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCAA7601D7;
	Wed, 20 Aug 2025 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A73AC113CF;
	Wed, 20 Aug 2025 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709379;
	bh=Zv4ujPO3KQCQ/S/zZ+87yMEeTHGtDtwjmsw35eFBLPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dr1d03/ztQZzehnuA3pVpw7eG2apfzSIzXWZn4V8PSF/oxOnzaMyj6VZxDgQ3XY0C
	 nca+A2IJDoLbxKo30R/YmbItPPf92i6LVVRW7LTdmYn+yLP3bLCTrV977h9BaHEtKx
	 NXa2PCl2PJ+9sKMlIBp1C0l2xmBSHRNp1Ot+Slf6644+zsAzHmD5BYUvfwKZ1SqBPg
	 b3bNilTK6GPtQRkA2c0x0ltTwqwessPnwFUwQuinpUV1sWYrBj8/SGJJQ8Wlda48Mw
	 vcZIdxxAkqbQkwlZ9DlQZ/Zs8lvh3SMTfcqlJlRdXT5KDCZbCRFgNoX/rafdY4my5h
	 Ujim+Xbb9lOhA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andrea della Porta <andrea.porta@suse.com>, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy Shevchenko <andy@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Benjamin Fair <benjaminfair@google.com>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David Airlie <airlied@gmail.com>, David Lechner <dlechner@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Drew Fustini <fustini@kernel.org>, dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, Iwona Winiarska <iwona.winiarska@intel.com>, Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-actions@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, Lukasz Luba <lukasz.luba@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nancy Yuen <yuenn@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, Nicolin Chen <nicoleotsuka@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tali Perry <tali.perry1@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomer Maimon <tmaimon77@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io'
 parameter in regmap_config
Message-Id: <175570934550.66459.15951444863822303407.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:32:25 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Fri, 12 Sep 2025 11:15:59 -0700
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


On Wed, 13 Aug 2025 18:14:46 +0200, Wolfram Sang wrote:
> While working on a driver using regmap with MMIO, I wondered if I need
> to set 'fast_io' in the config. Turned out I don't need to, so I added
> documentation for it with commit ffc72771ff6e ("regmap: Annotate that
> MMIO implies fast IO").
> 
> This series fixes the existing users in the tree which needlessly set
> the flag. They have been found using this coccinelle script:
> 
> [...]

Applied, thanks!

[12/21] phy: remove unneeded 'fast_io' parameter in regmap_config
        commit: e1e1e77f7df7cbee959ba024e5475907fe561c98

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
