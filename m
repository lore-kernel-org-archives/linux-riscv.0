Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B9C48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffbpYmWdXIKFQZ0W3mra/L4hT/0Y7OxyvsVZ9jdv1Dk=; b=aLOMVkXG2l3gED
	llMPV3OEkrDMxxJyRHjniQQNrWgn3II06KUqkgs9gYBP/7Dl+2AwOypCwUUJ3JEWJO2nYFUBj0uoE
	Yir1GaoscFvqgENgQmg6ZbC8sRAgDK7J12zLtxf3Py+Q9A/NZKNBKvPazkZCxS2hKYSJlUIf/EzR9
	ByrJJb3QBiWHc1dxBmDsyxRPqFjes1YNENQJUiQecvz/E6Q4G/96O8JO0qB5m+0Hn150YcdXESHcg
	Q4K7MkEJiQskGvoK3yH1/OlcmD+M5SevFCI3gbC9ZLl2HIVaY/aboLuc2TD226fhJmL873jIhw19l
	wZvIBRE5Rmrw/hihGisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT08K-000000008il-3iJq;
	Thu, 25 Jan 2024 13:51:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT07x-000000008Pq-3Fd8
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 13:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uzdazEjK7i6wQKTTtvn9MrsdfGievWnGtyE6FJBzIUQ=; b=abfGbK+SbiWIL1tkcqw+s9Dqph
	lBc8fbelEiPlRvnPpn5SNoBrxEhShBdLWdCTUxk6sQZxtGwfC0bU5QcuZZzFAazKJATO7Rx4CWILt
	8cyKptGUSipdOcpPbxD5LwBj/utQJk8pb/4V2Mm5EWvY7VZXOinDb6PhE/JrVqfZ4g9RuTifm9tzG
	cGJszJ2NnLx0sxb4S3Jrw/qXpJLs7kmBna2FM4ohJISr35AgnyLkcd9LJHuvPO8oVg4YsKgIhg6RJ
	xyrcnEPpnvwbSAHf+iCNb4UrZvahtzAvPpddrOOZESZK8+PWJs0uStDslxlnX9nQVyCPEjAEERReD
	BkqsSRMQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSycQ-00000005Hx0-3pW8
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:14:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZH-00048C-Nh; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZD-002HR8-To; Thu, 25 Jan 2024 13:10:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZD-007n0k-2K;
	Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Benson Leung <bleung@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-mips@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 039/111] pwm: Provide wrappers for storing and getting driver private data
Date: Thu, 25 Jan 2024 13:09:01 +0100
Message-ID: <1c873808bfc93ab51f49be799334dee6e8ab398a.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=xFZHrY/7C9PRNt99L0vl8g6j3yX1l4H0eIirFXKiC6s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9naZ43cfZqRmm0PAwRVRHazfdHqUBSCmiRl 7SkEynbJGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPZwAKCRCPgPtYfRL+ TqyWB/0Xq9H2qxz5a4NBliO3W2OBOYrNCAIPS+YFIK+/psR+8hFCNvRcL8LkTcvrGhz+wH1p+Pb F64/cTSgbYddbvZjoDx1kSNtuKvpvYsZy3B/swnxRBzzhjM4qRl0nLRqI7tuxKsMoJ6KChrenmP ZHuoEbNaT3Jq0uJ3jCQX+OWAPfMUgSkbUr5A7m+b7JrBvE1+EcTZ0ltF9cqru7Gex1/GIk5STLR s4XqyNlr+QqQS2lKFYFTNPQKFohdM4YpL+GcQjYEZZG2zihg6J+r6Mx1mefplrODntBtd+WIXCL uGNCMjCbN1xcJ1N2Xx2QisJNxxGcBaZCqQD7Iqx5HLe1eACQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121407_060249_CBA0A8DE 
X-CRM114-Status: GOOD (  15.50  )
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

VGhlc2UgZnVuY3Rpb25zIGFyZSB1c2VmdWwgdG8gc3RvcmUgYW5kIHF1ZXJ5IGRyaXZlciBwcml2
YXRlIGRhdGEgYQpBZnRlciBzdHJ1Y3QgcHdtX2NoaXAgZ290IGl0cyBvd24gc3RydWN0IGRldmlj
ZSwgdGhpcyBjYW4gbWFrZSB1c2Ugb2YKZGV2X2dldF9kcnZkYXRhKCkgYW5kIGRldl9zZXRfZHJ2
ZGF0YSgpIG9uIHRoYXQgZGV2aWNlLiAgVGhlc2UgZnVuY3Rpb25zCmFyZSByZXF1aXJlZCBhbHJl
YWR5IG5vdyB0byBjb252ZXJ0IGRyaXZlcnMgdG8gcHdtY2hpcF9hbGxvYygpIHdoaWNoCm11c3Qg
aGFwcGVuIGJlZm9yZSBjaGFuZ2luZyBwd21fY2hpcDo6ZGV2LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBpbmNs
dWRlL2xpbnV4L3B3bS5oIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2lu
Y2x1ZGUvbGludXgvcHdtLmgKaW5kZXggZDc5NjY5MThmMzAxLi4yYzQ5ZDJmZTJmZTcgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKKysrIGIvaW5jbHVkZS9saW51eC9wd20uaApAQCAt
MjcyLDYgKzI3Miw3IEBAIHN0cnVjdCBwd21fb3BzIHsKICAqIEBucHdtOiBudW1iZXIgb2YgUFdN
cyBjb250cm9sbGVkIGJ5IHRoaXMgY2hpcAogICogQG9mX3hsYXRlOiByZXF1ZXN0IGEgUFdNIGRl
dmljZSBnaXZlbiBhIGRldmljZSB0cmVlIFBXTSBzcGVjaWZpZXIKICAqIEBhdG9taWM6IGNhbiB0
aGUgZHJpdmVyJ3MgLT5hcHBseSgpIGJlIGNhbGxlZCBpbiBhdG9taWMgY29udGV4dAorICogQGRy
aXZlcl9kYXRhOiBQcml2YXRlIHBvaW50ZXIgZm9yIGRyaXZlciBzcGVjaWZpYyBpbmZvCiAgKiBA
cHdtczogYXJyYXkgb2YgUFdNIGRldmljZXMgYWxsb2NhdGVkIGJ5IHRoZSBmcmFtZXdvcmsKICAq
Lwogc3RydWN0IHB3bV9jaGlwIHsKQEAgLTI4Niw2ICsyODcsNyBAQCBzdHJ1Y3QgcHdtX2NoaXAg
ewogCWJvb2wgYXRvbWljOwogCiAJLyogb25seSB1c2VkIGludGVybmFsbHkgYnkgdGhlIFBXTSBm
cmFtZXdvcmsgKi8KKwl2b2lkICpkcml2ZXJfZGF0YTsKIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
czsKIH07CiAKQEAgLTI5NCw2ICsyOTYsMjQgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNl
ICpwd21jaGlwX3BhcmVudChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiAJcmV0dXJuIGNoaXAtPmRl
djsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkICpwd21jaGlwX2dldF9kcnZkYXRhKHN0cnVjdCBw
d21fY2hpcCAqY2hpcCkKK3sKKwkvKgorCSAqIEFmdGVyIHB3bV9jaGlwIGdvdCBhIGRlZGljYXRl
ZCBzdHJ1Y3QgZGV2aWNlLCB0aGlzIGNhbiBiZSByZXBsYWNlZCBieQorCSAqIGRldl9nZXRfZHJ2
ZGF0YSgmY2hpcC0+ZGV2KTsKKwkgKi8KKwlyZXR1cm4gY2hpcC0+ZHJpdmVyX2RhdGE7Cit9CisK
K3N0YXRpYyBpbmxpbmUgdm9pZCBwd21jaGlwX3NldF9kcnZkYXRhKHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwgdm9pZCAqZGF0YSkKK3sKKwkvKgorCSAqIEFmdGVyIHB3bV9jaGlwIGdvdCBhIGRlZGlj
YXRlZCBzdHJ1Y3QgZGV2aWNlLCB0aGlzIGNhbiBiZSByZXBsYWNlZCBieQorCSAqIGRldl9zZXRf
ZHJ2ZGF0YSgmY2hpcC0+ZGV2LCBkYXRhKTsKKwkgKi8KKwljaGlwLT5kcml2ZXJfZGF0YSA9IGRh
dGE7Cit9CisKICNpZiBJU19FTkFCTEVEKENPTkZJR19QV00pCiAvKiBQV00gdXNlciBBUElzICov
CiBpbnQgcHdtX2FwcGx5X21pZ2h0X3NsZWVwKHN0cnVjdCBwd21fZGV2aWNlICpwd20sIGNvbnN0
IHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
