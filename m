Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC7CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSEc/1wl0fAA3cFrHqn0MpNWMtJvu0JuObYk304q7XE=; b=ydhzwItYMCqm5I
	5Rd+D96oZRmjb9mo3Qe2rkG/C4DUoPgad4ivH0JBXP6OQl5TOF+XyaF7Hj6WuvKnfOr9SWF1yN3EK
	xRutcIk8cxJNuWsjCOIDSXqbrpuZFuH6d0iVvNrW01glP6G1JM0nwedJApvJ62LTbKOfgmEVxotsx
	Po0jGGiwWAY9Gw4tJCFvrjkWpKdsrzVC9C4Eg+nklQ6BT9rujZFpuKqxOUFDfg/2qzaaCnUNWrIJ8
	VMxnF+rxanClFlUzRwPQvhHMTmhtRkKjkj+FiV85tNWvSAiMVTEoI4gQOwgD6nM9RVrcCxHEOs8gU
	wtWYCz2kJNJsvHpdAC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV73-0000000BmOI-3Vk3;
	Tue, 19 Aug 2025 22:47:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvdG-00000002kdm-1K5A;
	Fri, 15 Aug 2025 14:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DA9AA5557E;
	Fri, 15 Aug 2025 14:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B35C4CEEB;
	Fri, 15 Aug 2025 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755268931;
	bh=3eUf4UXirGpUX0gw3VvalDgnQQxUYuzOa7d+Bn86Fb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGhHpuiSTtGAbt/6dlTCnnoTA4ZplxFC8Tro0GJAdbAh12tMNEUSLu07z11OvQBvk
	 oHTf5TJS/YKStrrrPHeWRzwJ0jGE6j5AZ1tbRvaZy3dDmEE9KCuVb15MPpzSH6J/gw
	 2nlRciQR5ILTUmZcjfPb8Wftcr9/dguuRdUZKw9cWJDeaG76YAPPH1GvTVv9P/kSEx
	 wLYcS3eJZ7unChNgWOYh7wQNPjdRjal2zeZDCWKyPnLkisSlJQ+WGVCBgVhn2LIrAt
	 +qG7XHhqCY/zS15DuM72YtrsT2tpKSGGxqzGtUU2p/oH3AF5g3+H8o04kc5YGhgMBJ
	 knwp+/59e078g==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benjamin Fair <benjaminfair@google.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	David Airlie <airlied@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	imx@lists.linux.dev,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-actions@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nancy Yuen <yuenn@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io' parameter in regmap_config
Date: Fri, 15 Aug 2025 09:42:02 -0500
Message-ID: <175526892008.370600.8859545110801188375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_074214_483093_3D84C6C4 
X-CRM114-Status: GOOD (  13.45  )
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

Applied, thanks!

[18/21] soc: remove unneeded 'fast_io' parameter in regmap_config
        commit: 5d8a9c8401648d338d072a488d455ed4611c5d4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
