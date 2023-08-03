Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FE4EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EMsB53RlOjQ1PUIViOZ7irRmnR1QmVaXXb1Xm7ugAzM=; b=YqKEgg9MTG5Ghu
	LIarlrJInnK3gXb04CrG2RQyiIjerBG3tGSEr0EJlJ8hwW8QGUxFbf9BbpeiLRPO5NKIKVUhWlo0i
	Jrqy6agcTUmJnREPNsRHu/MWvx9ErgvYWAAwbMHjeLJ0uJe497RUGlmiwH7y3srAouIiQTTiQ6+W3
	3sojLkL1DUpekWr6mRzckvSq6pq6zrRj2/SKlbHc6Nmgdob7pG9ipxPOt2VAnvyNaKXo5CY/NrSLu
	d0bnsvUu4qiM7sd8O6PC+25cFhKu/5+ff+yJJ2DqNIJDxokoND/wJJAVrxMVSKDagwSCZXZdFz/Qr
	nAH0rCml0pv7AVqmcv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZ09-009RmC-1W;
	Thu, 03 Aug 2023 14:08:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZ02-009RfO-2p
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:08:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyZ-0006mV-Nr; Thu, 03 Aug 2023 16:06:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyN-000rBF-In; Thu, 03 Aug 2023 16:06:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyM-00A9kB-Jk; Thu, 03 Aug 2023 16:06:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
Subject: [PATCH 0/2] pwm: Manage owner assignment implicitly for drivers
Date: Thu,  3 Aug 2023 16:06:30 +0200
Message-Id: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fUIfC654WxtfT7CEJ8mGT4DHYTt22edc6EeQOO0mgBU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBky7RhOm8jkQTlEYB5GsZS8El0/H9apHFEdsZFO x8y+5Ja40OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMu0YQAKCRCPgPtYfRL+ TsJcB/90L6hN+ip+TjX3AzflYEmXfAvsD7DvqLlndSD4q7tLpczaexF3R7J6u81XciSqOUe2jgL ZFH92dwUdpov0xdqiWraRK+aZJ+b0W4jpGsrqqlhoMdolr0pAB7fIFytPguywOKD62dbKy1CvL1 Dhl29UAwsXqsIV7jcTR/3lRLsFUwN9/STI8/IVeD4JJHoLv16c1Q61uVC/I22L/ivskcK9F/YQX 7it5vFhz9lfLpr79GuNQ3+d+atoBJRDfjCnDak/HWaR9JRk7b7F8pb+oq6ih+R2INrvw1jlBxDW 1b3cg6OWSLaXTh/Y3/NSkgaZz/kG8/JbVRjAFD6tfDS0KfZO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070823_106042_AD9340E3 
X-CRM114-Status: GOOD (  14.55  )
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

SGVsbG8sCgp3aGlsZSB3b3JraW5nIG9uIHRoZSBwd20gY29yZSBJIG5vdGljZWQgdGhhdCBwd20t
Y3JjIGRvZXNuJ3QgYXNzaWduCi5vd25lciBpbiBpdHMgcHdtX29wcyBzdHJ1Y3R1cmUuIFRoaXMg
aXNuJ3QgYSBwcm9ibGVtIGluIHByYWN0aXNlIHRob3VnaAphcyB0aGlzIGRyaXZlciBjYW4gb25s
eSBiZSBjb21waWxlZCBidWlsdC1pbiAodXAgdG8gbm93KS4KClN0aWxsIHByZXZlbnQgZnV0dXJl
IHB3bSBkcml2ZXJzIG5vdCBhc3NpZ25pbmcgLm93bmVyIGJ5IHdyYXBwaW5nCnB3bWNoaXBfYWRk
KCkgaW4gYSBtYWNybyB0aGF0IGF1dG9tYXRlcyBvd25lciBoYW5kbGluZyBzaW1wbGlmeWluZyBl
YWNoCmRyaXZlciBhICh0aW55KSBiaXQuCgpJIGFsc28gZm91bmQgdGhhdCB0aGVyZSBpcyBubyBo
YXJkIHJlYXNvbiB0byBvbmx5IGNvbXBpbGUgcHdtLWNyYyBhcyBhCmJ1aWx0LWluIG9uIHg4Niwg
c28gdGhpcyBsaW1pdGF0aW9uIGlzIGxpZnRlZCBpbiB0aGUgc2Vjb25kIHBhdGNoLgoKQmVzdCBy
ZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgogIHB3bTogTWFuYWdlIG93bmVyIGFz
c2lnbm1lbnQgaW1wbGljaXRseSBmb3IgZHJpdmVycwogIHB3bTogY3JjOiBBbGxvdyBjb21waWxh
dGlvbiBhcyBtb2R1bGUgYW5kIHdpdGggQ09NUElMRV9URVNUCgogZHJpdmVycy9ncGlvL2dwaW8t
bXZlYnUuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242
NWRzaTg2LmMgfCAgMSAtCiBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwg
IDEgLQogZHJpdmVycy9wd20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRy
aXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKy0tLS0t
LS0tLQogZHJpdmVycy9wd20vcHdtLWFiODUwMC5jICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZl
cnMvcHdtL3B3bS1hcHBsZS5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20t
YXRtZWwtaGxjZGMuYyAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWF0bWVsLXRjYi5j
ICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLWJjbS1rb25hLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3
bS1iY20yODM1LmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmVybGluLmMg
ICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWJyY21zdGIuYyAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1jbGsuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tY2xwczcxMXguYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20v
cHdtLWNyYy5jICAgICAgICAgICAgICAgICB8ICA1ICsrKystCiBkcml2ZXJzL3B3bS9wd20tY3Jv
cy1lYy5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAg
ICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1lcDkzeHguYyAgICAgICAgICAgICAgfCAg
MSAtCiBkcml2ZXJzL3B3bS9wd20tZnNsLWZ0bS5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVy
cy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1p
bWcuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAg
ICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWlteDEuYyAgICAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2
ZXJzL3B3bS9wd20taW50ZWwtbGdtLmMgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdt
LWlxczYyMGEuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1qejQ3NDAuYyAg
ICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20ta2VlbWJheS5jICAgICAgICAgICAg
IHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwMzk0My5jICAgICAgICAgICAgICB8ICAxIC0KIGRy
aXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9w
d20tbHBjMzJ4eC5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwc3MuYyAg
ICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1tZWRpYXRlay5jICAgICAgICAg
ICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyAgICAgICAgICAgICAgIHwgIDEgLQog
ZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdt
L3B3bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbXhzLmMg
ICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1yYXNw
YmVycnlwaS1wb2UuYyAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tcmNhci5jICAgICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJlbmVzYXMtdHB1LmMgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tcnotbXR1My5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXNh
bXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAg
ICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyAgICAgICAgICAgIHwg
IDEgLQogZHJpdmVycy9wd20vcHdtLXNwZWFyLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZl
cnMvcHdtL3B3bS1zcHJkLmMgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20t
c3RpLmMgICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMg
ICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3
bS1zdW5wbHVzLmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tdGVncmEuYyAg
ICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tdHdsLWxlZC5jICAgICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvcHdt
L3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAgMiAtLQogZHJpdmVycy9wd20vcHdtLXZpc2Nv
bnRpLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS12dDg1MDAuYyAgICAgICAg
ICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDEg
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgICAgICAgICB8ICAxIC0KIGluY2x1ZGUv
bGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQogNzAgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNj
Y2IxNzlhYTQwZDkzMWViMDBlZjg5MTBkN2I4MTJhOTU2NTk1NjMKLS0gCjIuMzkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
