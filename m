Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E614CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klCFvxxjBaxEwa2Zwfgj5Hdot/i1XETGuS0AvcEkqhg=; b=KhdtUZiDXTqbN2
	PS49zzb526SegQoLu8/EkgNxN9Q3xe5rgrVUmQdMIQqGKjXMvQy38wt68GGhxBgj2WfoWwrtDfZb9
	RJSKG/Q6R5IMpwRGafXMc/opcIhI9nJvQTHQ78qHeJ4MQgOBYbGxpwij+4u2OvVwmo1eZXniVb1uE
	s5bTzqaNkVLiuiOIpnqilnKhe5kugt85ESyN63Ue7DxfyqDNNPKA3KReNYEhdSGC6uQZdBHqL0WWb
	x6LPebQn8ONwke1uKyYhclr+aRvaIKsL9j09gH393OFyWUP4ecdI4NLOoHPnOUtsSrDyshVHibAk9
	aZpV23s4rCb3jAeAz+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnLf-0000000FLzD-08ZS;
	Wed, 03 Jun 2026 15:17:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkQh-0000000F2Si-1Mnc;
	Wed, 03 Jun 2026 12:10:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C41A34E400BF;
	Wed,  3 Jun 2026 12:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70F7C6073E;
	Wed,  3 Jun 2026 12:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B352C10888413;
	Wed,  3 Jun 2026 14:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780488628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PreqYMBr0Ka5dN41Clt2LWnr3PiSIQBHEiKpFY9pyZU=;
	b=sQWX1YqA6zcSbVeDj7lWc5CeZcf9eoO3G688GSALeSPtusWjW+Q9KBqpKG0heQV2+TstA1
	c8jQ9OyBWwECfv/PHSX1LLl6srWAnxH/N5z+c07Vghr7gOdduiivBi59q8cdvD+3kLiFP1
	/0s02v5pvhT6/9EvSRzYTPzVQfIUIpilWScE8RH9GBIP9SyhRZEwqNIz+hCNseOvgTvtSN
	eIic0ThoTceGH5dauhsCfZToflRtQ6uGsESdz1KP1NIgJ0LBSWpd2F3IeOmwB40R+Q8WGj
	cMoiZH0WvbgKnHMnJVXcUrxKL5ejS5hYvjpaKKGH2SAvCuutWaVX7eVBWJiEjw==
Date: Wed, 3 Jun 2026 14:09:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/83] ASoC: codecs: framer-codec: don't use array if
 single pattarn
Message-ID: <20260603140939.091f126f@bootlin.com>
In-Reply-To: <87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_051039_498304_9497D8CC 
X-CRM114-Status: GOOD (  11.40  )
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

SGkgS3VuaW5vcmksCgpPbiBUdWUsIDI2IE1heSAyMDI2IDAxOjU4OjUwICswMDAwCkt1bmlub3Jp
IE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4gd3JvdGU6Cgo+IEJl
Y2F1c2UgaXQgaXMgY29uZnVzYWJsZSBkdXJpbmcgZGVidWdnaW5nIEFTb0MgRlcgdXBkYXRlLCB0
aWR5dXAKPiBhdXRvIGZvcm1hdCBzdHlsZSBub3QgdG8gdXNlIGFycmF5IGlmIHNpbmdsZSBwYXR0
ZXJuIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3Jp
Lm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvY29kZWNzL2ZyYW1l
ci1jb2RlYy5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+IAoKSnVzdCBhIHR5cG8gaW4gdGhlIGNvbW1pdCB0aXRsZToKcy9w
YXR0YXJuL3BhdHRlcm4vCgpPciBldmVuCnMvcGF0dGFybi9pdGVtLwoKV2l0aCB0aGF0IGZpeGVk
LAoKUmV2aWV3ZWQtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoK
QmVzdCByZWdhcmRzLApIZXJ2w6kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
