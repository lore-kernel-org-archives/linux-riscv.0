Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8E2CD6E6C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7y6kQz438wzHOOjPLao5GY3+g8YWeA0z7ufMVH+p3QU=; b=KmLerX0MfabDAo
	EPCX4hhhYxgsOOhsBBv7nExvFEmXms8JAAseZdy5b9w6nz2pdDZ7BPT009PvINeiyEx2DAanuODab
	i0sDZQnHXdYU+k3HnFRrJ3mYHx2VSIlyB0Wb0tHkoPmyLJWtAIwDufUv0YmDk6xxTTN0xARZjZCj9
	/V4h5aCMuh7AwfU+Ve+mTRlQC+0eOhsTgnM308JcHibhfoGxy1R4ILpZfdda+m/Gp6wrTxwvCAEUr
	fmEKX4M+wsd/jEveC0Of+ZTbcOeqO6GlvmEqwJwWA8+G3nFfu7mouRr/vj7l/d/zA3Homk7GK9ypj
	eTvCNe/dwVANpgYnpqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnLf-0000000FLzH-0nY0;
	Wed, 03 Jun 2026 15:17:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkSU-0000000F2YR-26GN
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 12:12:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 195381A0108;
	Wed,  3 Jun 2026 12:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFA0C6073E;
	Wed,  3 Jun 2026 12:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48FB510888413;
	Wed,  3 Jun 2026 14:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780488742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=48ypl4N/Z9PEOrZi5s882vnkw+L0W6ufixnULaCX8wY=;
	b=WqS1SiX8JxgfCWjKbfGrN6L6Q3QYEVKtX9eatJz9iVzPqdb59EF2wfORgl6E1oiCCYOL6h
	61ETQH6hQR3Buc4PxFXV8xJT2J5xNuIRWeEXwCZRhaxs5XLVqNUthCgehn5gJAgDWr5D+V
	EDn8WSCnJ0fr/3eDUJx++tiwrZ5WSI35nVYVUdYn3doe/iUdJ7p9DoQU59Ef1MvT6hoBjc
	7jEjYscg5qvEtTKsFwWeeKNcZMVVM6zgOvZnXTK6b1ZDBo1eLL0VN631t+RjK9av9NXAVA
	YYmM055EJj11NnypQXGQ/iJgKGei6RU0g5MfNttmfc+5/XNEQ2JJEvOyMVoU4Q==
Date: Wed, 3 Jun 2026 14:11:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 03/83] ASoC: codecs: idt821034: don't use array if
 single pattarn
Message-ID: <20260603141147.61943cf0@bootlin.com>
In-Reply-To: <87y0h7hqxo.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87y0h7hqxo.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_051230_665871_4E5447A0 
X-CRM114-Status: GOOD (  16.90  )
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

SGkgS3VuaW5vcmksCgpPbiBUdWUsIDI2IE1heSAyMDI2IDAxOjU4OjU5ICswMDAwCkt1bmlub3Jp
IE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4gd3JvdGU6Cgo+IEJl
Y2F1c2UgaXQgaXMgY29uZnVzYWJsZSBkdXJpbmcgZGVidWdnaW5nIEFTb0MgRlcgdXBkYXRlLCB0
aWR5dXAKPiBhdXRvIGZvcm1hdCBzdHlsZSBub3QgdG8gdXNlIGFycmF5IGlmIHNpbmdsZSBwYXR0
ZXJuIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3Jp
Lm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvY29kZWNzL2lkdDgy
MTAzNC5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9pZHQ4MjEw
MzQuYyBiL3NvdW5kL3NvYy9jb2RlY3MvaWR0ODIxMDM0LmMKPiBpbmRleCAzOWJhZmVmYTZhMTg2
Li4wODQwOTBjY2VmNzdhIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaWR0ODIxMDM0
LmMKPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL2lkdDgyMTAzNC5jCj4gQEAgLTg2MCwxOCArODYw
LDE3IEBAIHN0YXRpYyBpbnQgaWR0ODIxMDM0X2RhaV9zdGFydHVwKHN0cnVjdCBzbmRfcGNtX3N1
YnN0cmVhbSAqc3Vic3RyZWFtLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBjb25z
dCB1NjQgaWR0ODIxMDM0X2RhaV9mb3JtYXRzW10gPSB7Cj4gK3N0YXRpYyBjb25zdCB1NjQgaWR0
ODIxMDM0X2RhaV9mb3JtYXRzID0KPiAgCVNORF9TT0NfUE9TU0lCTEVfREFJRk1UX0RTUF9BCXwK
PiAtCVNORF9TT0NfUE9TU0lCTEVfREFJRk1UX0RTUF9CLAo+IC19Owo+ICsJU05EX1NPQ19QT1NT
SUJMRV9EQUlGTVRfRFNQX0I7Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFp
X29wcyBpZHQ4MjEwMzRfZGFpX29wcyA9IHsKPiAgCS5zdGFydHVwICAgICAgPSBpZHQ4MjEwMzRf
ZGFpX3N0YXJ0dXAsCj4gIAkuaHdfcGFyYW1zICAgID0gaWR0ODIxMDM0X2RhaV9od19wYXJhbXMs
Cj4gIAkuc2V0X3RkbV9zbG90ID0gaWR0ODIxMDM0X2RhaV9zZXRfdGRtX3Nsb3QsCj4gIAkuc2V0
X2ZtdCAgICAgID0gaWR0ODIxMDM0X2RhaV9zZXRfZm10LAo+IC0JLmF1dG9fc2VsZWN0YWJsZV9m
b3JtYXRzICAgICA9IGlkdDgyMTAzNF9kYWlfZm9ybWF0cywKPiAtCS5udW1fYXV0b19zZWxlY3Rh
YmxlX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKGlkdDgyMTAzNF9kYWlfZm9ybWF0cyksCj4gKwkuYXV0
b19zZWxlY3RhYmxlX2Zvcm1hdHMgICAgID0gJmlkdDgyMTAzNF9kYWlfZm9ybWF0cywKPiArCS5u
dW1fYXV0b19zZWxlY3RhYmxlX2Zvcm1hdHMgPSAxLAo+ICB9Owo+ICAKPiAgc3RhdGljIHN0cnVj
dCBzbmRfc29jX2RhaV9kcml2ZXIgaWR0ODIxMDM0X2RhaV9kcml2ZXIgPSB7CgpTYW1lIHR5cG8g
aW4gdGhlIGNvbW1pdCB0aXRsZSBhcyBpbiBwYXRjaCAyOgpzL3BhdHRhcm4vcGF0dGVybi8KCk9y
IGV2ZW4Kcy9wYXR0YXJuL2l0ZW0vCgpXaXRoIHRoYXQgZml4ZWQsCgpSZXZpZXdlZC1ieTogSGVy
dmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CgpCZXN0IHJlZ2FyZHMsCkhlcnbD
qQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
