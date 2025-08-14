Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2034CA0EF7
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj+Sn7KLNyG5v2l5dXTAP3CxjyrAnEIazqFTQPppjSY=; b=xgj1hkSYJ+Fzcp
	fzKf90ZiE5H6YFhqVXS6RCQDJvSIsBuY/u7l6/uOGASZ6MsIukf1TByu+mp8x2nLoxE4BOOxf0xo3
	9Wmuh8vkLx+dHA86eDNMzRw3w+3JVzxRyYs/iBsD90MKFuo7kec13swAxOpSvVOyLfhmVUzxKPqsf
	92fz9P56/ndKdX/aETJ+bW9Xzg1GEmGu5BnGaZDm9W+HZfx8VCDIfDADps2V6oGCH5suBXSBplg+u
	iK/3UHsSH+5CnOKzWYt+y4anlwjvsSQqdDor2qITHHjhZx6mJFK4JUdoG4umIY/zuDTjoJJ1INtqJ
	eRsq0rlPQoBaZvcJ6p0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV73-0000000BmNv-0ukx;
	Tue, 19 Aug 2025 22:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYn1-0000000HESx-0tpF;
	Thu, 14 Aug 2025 14:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V+vnB+61+tXOtwzGfCSSnwdvyVeojqtPAkoFjSfvsr4=; b=NhgbMQ8NdbEOVmheS2dvX0oJNY
	ALrfcMDsEEnMNgunbvqREbZq1oHzp7ccngaUVMO5++E/uAyDNYqinyGThJmEpm7YBuhT3Tkh+VNi9
	jAiqOM4rhUamhaj70Il7HCUSt7yzARMU72pOqw494k8l1Q8HailKIeknsdWt3dhAX7o6ayScfHwg/
	Ii2lXAh/WZDOQPZt1HReyHlinv8O2qaXvljjxRqrXeqJkA4eRQnMCoaoGWNgplNRdFpt+ynmupnga
	gL3L3ZRJ3TFncfXNK8+zrX/4powWhhke2jb57DUcEBWSVdXUgPoJqcrPP4QPAtiJT8kRpW7Q8p3j3
	voDIwG1A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYmw-0000000GRX7-0xy9;
	Thu, 14 Aug 2025 14:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF3F944BCD;
	Thu, 14 Aug 2025 14:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140DFC4CEEF;
	Thu, 14 Aug 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755181116;
	bh=aIOvB7Z2yTByNAFttZWfPG8POEc6396jSKH09BJ+/Lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqgU/EDu3oDCYRt1Si13BRghMkcwK5LqN9GkAcGcfcrhFTazE34zUUq8Od+e5oGUJ
	 GNx5ulPcFgtO5ZyiSpwIBr8FUNyAthpqEJ1HFf9GnjWHY+qIpiLzwl5jpRBrlolPn2
	 z6xjKGXo4jawDOcpqGnCDN73BGfqRqAyieck88qD94UdpBJX7zr50+UVyAUEIFPEy1
	 8iZ5/OdecI+vpH1tXXE5PIrAiCENDSW7wdju78QYNBO7tccEMhyLT5/PeO3ORXivtj
	 sVMKdqgvEftfF5s9YxpUhwR00ND4s4PmT0wxP/dvrTnBxT6CdvlYHRM7ommRoJA5zP
	 uiUsOyuYlg5Jw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andrea della Porta <andrea.porta@suse.com>, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy Shevchenko <andy@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Benjamin Fair <benjaminfair@google.com>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David Airlie <airlied@gmail.com>, David Lechner <dlechner@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Drew Fustini <fustini@kernel.org>, dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, Iwona Winiarska <iwona.winiarska@intel.com>, Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-actions@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, Lukasz Luba <lukasz.luba@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nancy Yuen <yuenn@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, Nicolin Chen <nicoleotsuka@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tali Perry <tali.perry1@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomer Maimon <tmaimon77@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io'
 parameter in regmap_config
Message-Id: <175518109481.47921.1666131365484481268.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 15:18:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_151842_687303_497FAFC4 
X-CRM114-Status: GOOD (  16.64  )
X-Mailman-Approved-At: Tue, 19 Aug 2025 14:03:23 -0700
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[21/21] ASoC: remove unneeded 'fast_io' parameter in regmap_config
        commit: d578faf7096affc036fd16333f1bfbe4991a22f7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
