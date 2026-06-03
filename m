Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13D7CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTr4mSb8Z/0SN37udE3+tBsmoiWpEDSaUNUF98WVk+E=; b=b366Alm2SwEHT3
	1/xGjejAqfDp8AQce1oEV4dj1mvDnXrjtVUWuQc8ycbxVQ3X4q1yRsYx5xEJJ6L06O7iLwQolEzNf
	yMRHd3m6A03p6W/4QqozwTgqzKsaaqKRU+jPlPl3YXkBuPJ1LQpM+Id8ogts0yB2iiM62aJAypH/y
	7RlCr4dVottwurRMmbO/WBwcuchbSTX2m3/6CmvLjrQLG3g2t5xPwt6DVAN33pvcSziO0rASLhGtM
	iJcgZqYh362lvccGraJmjuNbCnm7hVT6pe1d7jlX/1yzA4gQaqSHK7XNUYht623rOw+z9MDmv4aGi
	zsmdgzln0IGQ3yXj0U3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnLf-0000000FM02-1uiH;
	Wed, 03 Jun 2026 15:17:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkYZ-0000000F3OR-2yvK
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 12:18:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D90E04E40108;
	Wed,  3 Jun 2026 12:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A67C6073E;
	Wed,  3 Jun 2026 12:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA06610888413;
	Wed,  3 Jun 2026 14:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780489120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zFi/fGH5JDn5JO2RB9yxgU6c2Ow81xQ2uZUvm6i/E1g=;
	b=oDjwgWv0v2GgyX3pUULcD12EPMMUfgyJz9dBcXuV+rHROoWzoTs8xUfKvHan7sDmS4CabP
	L+IrQHrvnK0vVMlJcr6wVI29ruHN0LlRTpSAbksHJDQU4x6/AUscYD365MmPH4Ai9RHUD3
	INZ8kgugtku7ob0NW+Ab7SNI9LVONJhSV2/Jk11qsbj+crVHJ9NJj1exILul60PuVPHkKS
	HfTz8P9kfZEod84fwQjR8JESyd/TGvwRHW/nVKN9n20yx7yviIrbsYx2VG2qWDRMnUj3ZS
	NEQxmhhJHdJjDyxCCsVL18Z9rUUNa16rIZrNpUha+f5Agkx9HJ0YQZpZ489vRg==
Date: Wed, 3 Jun 2026 14:17:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 04/83] ASoC: codecs: peb2466: don't use array if single
 pattarn
Message-ID: <20260603141757.451cad7b@bootlin.com>
In-Reply-To: <87wlwrhqxf.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87wlwrhqxf.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_051848_013750_9A8C74A2 
X-CRM114-Status: GOOD (  11.19  )
X-Mailman-Approved-At: Wed, 03 Jun 2026 08:17:36 -0700
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
Cc: Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Xiubo Li <Xiubo.Lee@gmail.com>, Peter Rosin <peda@lysator.liu.se>, Jaroslav Kysela <perex@perex.cz>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Yixun Lan <dlan@kernel.org>, Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Baojun Xu <baojun.xu@ti.com>, Kirill Marinushkin <k.marinushkin@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org, Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Scott Branden <sbranden@broadcom.com>, Masami Hiramatsu <mhiramat@kernel.org>, Sharique Mohammad <sharq0406@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Max Filippov <jcmvbkbc@gmail.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Guenter Roeck <groeck@chromium.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, chrome-platform@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jonathan Hunter <jonathanh@nvidia.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jerome Brunet <jbrunet@baylibre.com>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Tim Bird <tim.bird@sony.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, Biju Das <biju.das.jz@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Kiseok Jo <kiseok.jo@irondevice.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bram Vlerick <bram.vlerick@openpixelsystems.org>, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>, Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Jernej Skrabec <jernej.skrabec@gmail.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Kevin Cernekee <cernekee@chromium.org>, Benson Leung <bleung@chromium.org>, Support Opensource <support.opensource@diasemi.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, spacemit@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, Guoqing Jiang <guoqing.jiang@canonical.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Cercueil <paul@crapouillou.net>, HariKrishna Sagala <hariconscious@gmail.com>, linux-riscv@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Hsieh Hung-En <hungen3108@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shenghao Ding <shenghao-ding@ti.com>, Nicolin Chen <nicoleotsuka@gmail.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= \(The Capable Hub\)" <u.kleine-koenig@baylibre.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, James Ogletree <jogletre@opensource.cirrus.com>, linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, Ben Bright <ben.bright@cirrus.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS3VuaW5vcmksCgpPbiBUdWUsIDI2IE1heSAyMDI2IDAxOjU5OjA4ICswMDAwCkt1bmlub3Jp
IE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4gd3JvdGU6Cgo+IEJl
Y2F1c2UgaXQgaXMgY29uZnVzYWJsZSBkdXJpbmcgZGVidWdnaW5nIEFTb0MgRlcgdXBkYXRlLCB0
aWR5dXAKPiBhdXRvIGZvcm1hdCBzdHlsZSBub3QgdG8gdXNlIGFycmF5IGlmIHNpbmdsZSBwYXR0
ZXJuIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3Jp
Lm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvY29kZWNzL3BlYjI0
NjYuYyB8IDkgKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCgpTYW1lIHR5cG8gaW4gdGhlIGNvbW1pdCB0aXRsZSBhcyBpbiBwYXRj
aCAyOgpzL3BhdHRhcm4vcGF0dGVybi8KCk9yIGV2ZW4Kcy9wYXR0YXJuL2l0ZW0vCgpXaXRoIHRo
YXQgZml4ZWQsCgpSZXZpZXdlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxp
bi5jb20+CgpCZXN0IHJlZ2FyZHMsCkhlcnbDqQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
