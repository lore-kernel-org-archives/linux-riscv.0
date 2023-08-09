Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BACEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeufIgeayZtSK7qBnnSeq4C1XanUD8O3+XxVTe9aC3E=; b=hDHW0SdYLBKaZ8CKzHshZma0lT
	uDAzfpQBEkVX7SjMsq5B83PO7RXkTifhtfa9jnGdRVgJvNi73/F2sHannC1+/fca2cZaHCjg60IWS
	Y7qq8tmEC5CZNrFjZkdkJk4hjBcsjeSYfwVmwc6/nDprb55JVn1ipsoJkjTb6i2ngoRbJAcTqiV55
	2LExJs1LRow87fsUYQGKxj6W1pok+Bw3XMySY9UDAEQyY/CFlkB5Sb4IH3SrwhYerLausXkYQkfto
	nO9WNoRIbiSDYmUHR7ursqEX+K6VvNy0zH9Hu0uliR1EYY8WEduEK0iGRHL1H0eB8eEFVPuxpnyZu
	/5LzhkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjOK-0053RK-2E;
	Wed, 09 Aug 2023 13:38:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjOG-0053P4-38;
	Wed, 09 Aug 2023 13:38:22 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 18516124F;
	Wed,  9 Aug 2023 15:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691588293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Btky6tTdvG25ZLsauzNmPRJKTtp0p2jrZzqQzvClL8=;
	b=r4wKl3ihNbNJWLLG5hf4K10pWKB/qcqJZWT79pdX14Hwy6cFCNoDp523ysrGvSxR0hF0sV
	S19UUVxjs0tcqcFDwaa/NkVjQnAj2+cyBE5RQNYWGpyiW44j/FWxQygtTL+wtS+237ZPBi
	AtOsW9She/DFFxiMreuzoOh5io7RuXTgqIlbCCUn4LHHa90Z+A4PZo97sfdrSy4KQLmkYs
	hhFi301ZV0pK+bOMSJlqwINPWSXFfHk08E4h61f4wk1UScNwCWh6iBthi3AlIm+EDBA4U6
	GVakjg8rtPJGDbRJZnIXlKnvbOR8bknUPLybW2kI3kAAfIaJexJ1gSpJk2GYOw==
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:38:12 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson
 Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP
 Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Jonathan_Neusch?=
 =?UTF-8?Q?=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner
 <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex
 Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson
 <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for
 drivers
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Message-ID: <a6ba206a709b2f4f1c817df8c868a683@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_063821_388137_39B370AA 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgo+IEluc3RlYWQgb2YgcmVxdWlyaW5nIGVhY2ggZHJpdmVyIHRvIGNhcmUgZm9yIGFzc2ln
bmluZyB0aGUgb3duZXIgbWVtYmVyCj4gb2Ygc3RydWN0IHB3bV9vcHMsIGhhbmRsZSB0aGF0IGlt
cGxpY2l0bHkgdXNpbmcgYSBtYWNyby4gTm90ZSB0aGF0IHRoZQo+IG93bmVyIG1lbWJlciBoYXMg
dG8gYmUgbW92ZWQgdG8gc3RydWN0IHB3bV9jaGlwLCBhcyB0aGUgb3BzIHN0cnVjdHVyZQo+IHVz
dWFsbHkgbGl2ZXMgaW4gcmVhZC1vbmx5IG1lbW9yeSBhbmQgc28gY2Fubm90IGJlIG1vZGlmaWVk
Lgo+IAo+IFRoZSB1cHNpZGUgaXMgdGhhdCBuZXcgbG93bGV2ZWwgZHJpdmVycyBjYW5ub3QgZm9y
Z2V0IHRoZSBhc3NpZ25tZW50IAo+IGFuZAo+IHNhdmUgb25lIGxpbmUgZWFjaC4gVGhlIHB3bS1j
cmMgZHJpdmVyIGRpZG4ndCBhc3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90Cj4gYSBwcm9ibGVtIGlu
IHByYWN0aXNlIHRob3VnaCBhcyB0aGUgZHJpdmVyIGNhbm5vdCBiZSBjb21waWxlZCBhcyBhCj4g
bW9kdWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+CgouLi4KCj4gIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5j
ICAgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxs
ZS5jYz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
