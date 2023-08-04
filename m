Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF1C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/55Ehz96YfDPOQHBtLcbdByqLO/OXL3dresPvAq1meQ=; b=oX/w+sU118OAmJ
	Z5PZRZ0VkpW9lEDyWV3AIuUmKYKlCNJPk5kfrYRbDW2c4xf6QxmV+1dLEi3PYG+Y4rBAEyCmK4U92
	sfEknZKeES9fkILVMVqEIF5qHhIkKslD63/1WSNXDsM1gTSL9eN5EhN7tSFF2sI0BgcPYm5GHiak6
	M84Edg/re9qW9UK0g9mvVhZjQG2G6BEvuGd51z6Kt948NJvA23gTUHVwgJuF2P0UdDR3BZs50BILP
	+6i7B6Pk34CeLtZFdsdsMBWoW9yckHkrOmvoV6F6b6UG391LAopXNC/Eyr5bNe5qH9GgPuntMLw7E
	xLGWWZU81ogSl1/v9VCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvnW-00CbGG-1O;
	Fri, 04 Aug 2023 14:28:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvnT-00CbEd-1B
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 14:28:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvm6-0004IB-Ta; Fri, 04 Aug 2023 16:27:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvlq-0015pr-7N; Fri, 04 Aug 2023 16:27:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvlp-00AP9T-ET; Fri, 04 Aug 2023 16:27:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@amd.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
Date: Fri,  4 Aug 2023 16:27:05 +0200
Message-Id: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WJTkGffvizVTFrYhxlEwf33iXK2vZsfEyb81l68zhLY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkzQq2XhI0XPWVJKyF8jw9e0hP8cj3HpRdpwKrd oYg1lISRdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZM0KtgAKCRCPgPtYfRL+ TlmxCACDstGNt8tomXEi1DwnNXDEZlZ/KVZke1AiXVnPIS/ZhVJ94U5aOYapSgAJmHQnzwqgK6z fFWv33dvGgXeSNfMfc82iKjHC0i9u6CpVTKzbkS7CkjLhfefThMzfQsEY6GCcrMBu/Hi+5qaaif ZRymzwLw6Gc4g1La1KPC1OIUlenMjcfHXUKhPwvyeIbrhx8wfU40+IFtYHvBhQqi9/e0I3woRF5 t77a20hH5LhbiKKLjmZ4ZMWDDvSLhjnPg8HbbOUIIqRM1op7uN5Uog1iEYusHzAGP9NsS1utfon xzuuuXTkvCvNrk46p97AVUuT3gZdhE7Ekvy+UO0zlQA3SpbS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_072855_575019_2092845E 
X-CRM114-Status: GOOD (  12.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgooaW1wbGljaXQpIHYxIG9mIHRoaXMgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdApodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1wd20vMjAyMzA4MDMxNDA2MzMuMTM4MTY1LTEtdS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIC4KCkNoYW5nZXMgc2luY2UgdGhlbiBvbmx5IGFm
ZmVjdCBkb2N1bWVudGF0aW9uIHRoYXQgSSBtaXNzZWQgdG8gYWRhcHQgYmVmb3JlLgpUaGFua3Mg
dG8gTGF1cmVudCBmb3IgY2F0Y2hpbmcgdGhhdAoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWlu
ZS1Lw7ZuaWcgKDIpOgogIHB3bTogTWFuYWdlIG93bmVyIGFzc2lnbm1lbnQgaW1wbGljaXRseSBm
b3IgZHJpdmVycwogIHB3bTogY3JjOiBBbGxvdyBjb21waWxhdGlvbiBhcyBtb2R1bGUgYW5kIHdp
dGggQ09NUElMRV9URVNUCgogZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUuYyAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAgMSAtCiBkcml2
ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL2NvcmUuYyAgICAg
ICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvcHdt
L3B3bS1hYjg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYXBwbGUu
YyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC10Y2IuYyAgICAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1iY20t
a29uYS5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWJlcmxpbi5jICAgICAgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS1icmNtc3RiLmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tY2xrLmMgICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWNs
cHM3MTF4LmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyAgICAgICAg
ICAgICAgICAgfCAgNSArKysrLQogZHJpdmVycy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1kd2MuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tZXA5M3h4LmMgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20v
cHdtLWZzbC1mdG0uYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1oaWJ2dC5j
ICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20taW1nLmMgICAgICAgICAgICAg
ICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICAxIC0K
IGRyaXZlcnMvcHdtL3B3bS1pbXgxLmMgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3
bS9wd20taW14MjcuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWludGVs
LWxnbS5jICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1pcXM2MjBhLmMgICAgICAg
ICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tano0NzQwLmMgICAgICAgICAgICAgIHwgIDEg
LQogZHJpdmVycy9wd20vcHdtLWtlZW1iYXkuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMv
cHdtL3B3bS1scDM5NDMuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbHBj
MTh4eC1zY3QuYyAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwYzMyeHguYyAgICAg
ICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1scHNzLmMgICAgICAgICAgICAgICAgfCAg
MSAtCiBkcml2ZXJzL3B3bS9wd20tbWVkaWF0ZWsuYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVy
cy9wd20vcHdtLW1lc29uLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1t
aWNyb2NoaXAtY29yZS5jICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYyAg
ICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLW14cy5jICAgICAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1udHhlYy5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2
ZXJzL3B3bS9wd20tb21hcC1kbXRpbWVyLmMgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdt
LXBjYTk2ODUuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1weGEuYyAgICAg
ICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tcmFzcGJlcnJ5cGktcG9lLmMgICAg
IHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJjYXIuYyAgICAgICAgICAgICAgICB8ICAxIC0KIGRy
aXZlcnMvcHdtL3B3bS1yZW5lc2FzLXRwdS5jICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9w
d20tcm9ja2NoaXAuYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJ6LW10dTMu
YyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zYW1zdW5nLmMgICAgICAgICAg
ICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAgICAgICAgIHwgIDEgLQog
ZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdt
L3B3bS1zcGVhci5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3ByZC5j
ICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXN0aS5jICAgICAgICAgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jICAgICAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLXN0bXBlLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdW40
aS5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXRlZ3JhLmMgICAgICAgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS10aWVjYXAuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tdGllaHJwd20uYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXR3
bC1sZWQuYyAgICAgICAgICAgICB8ICAyIC0tCiBkcml2ZXJzL3B3bS9wd20tdHdsLmMgICAgICAg
ICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tdnQ4NTAwLmMgICAgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLXhpbGlueC5jICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3B3bS5jICAgICAgICAgfCAgMSAtCiBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrLS0tLQogNzAgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKSwgODUgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNjY2IxNzlhYTQwZDkzMWVi
MDBlZjg5MTBkN2I4MTJhOTU2NTk1NjMKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
