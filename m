Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D732D46625
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a/TgSuUG1SWGXZyQG3cMI3pC3YNgv5lXQ2t935ak9Q=; b=aCVVEElLWHAJ12
	L+7sFfmv0L1HIPwLcA9Wmt9WpASgQcPcPJiM8cjPhRMj1jKOvKImMkd3Yxv2Kdq6s4pkbE1Rt2tvG
	JIQ+75av9zam53/2SoaQChfrkSuQ/6n9/+VCS8dNuf8lv97h1G9Wm8tz2Uu5deTz9X9yRCAxCBnNw
	NIYzIV3coABw9sOOJys08zGLZzZ70pYYVn2T8FdcFG3Sa9pOgZ/GZx0S2TG9t4tm9oT2SuGX1VSHR
	RBlJec3HkrUKwitPT5oTms+XZouzDCn0b8Ekf7Qj0ro+UE+kmCe4lmd/NVhVO5RRjDKuoFu76Z9po
	zEQ0NwjxB0APnB7dOI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgU1p-0000000D8vU-0zwW;
	Thu, 15 Jan 2026 20:33:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbP8-00000006srv-2ZAI
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 10:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4A2E444CF
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 10:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A9DC19422
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299216;
	bh=RpOnPNW4xfI0Kz9zhPqicYu/rLC2pTmpoM33Trm+SMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dBkyBNzZyikYWHBI84mEzG69MRM616RZBoMsO0F3Q1c1T/St0KrZ9e2JUQUHBxmA2
	 3ghOxlMMpbwvS/wL74la9lRVcw7lVZLTyWJiprsxF5/oDzdFtYs3SmKTcdV3GQohVx
	 6ukv6oI7L/80VLsINJQ3gIGwywWiYE4fp1vBKJEyuSQnejwmmr6sqzttwZsXeXj3ba
	 X+Klx3wBvBhfpoXyoeO/EffiVahCypVxOcHqGQ6XJH0tDrCHhaz16CsG2xGrUPWY6N
	 NsymtWt2Boevzn0e3ExO19xgQ8iQhqLMnifQUiiSr4WPa1qIiWHnrxefRm2bdiPR2v
	 DCFLKopJUBlYA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7927541abfaso25774717b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 02:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTbKIyBIMWETa6nNoPCFo8+dK4ZR2gQ9C+P0z4k08FeEEruoVjb+aFeEsroEnv6q5UfPbuhv9uGG4sgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxT6CC2tGzi7gNkmfXKv0ZSFG93qJvlb3cWxf6svIZ0KbZY86sC
	cZb29u1kCOVieStWAqzGBZc3PhJuNLXkfqUJ3dsai4wGFuPAb2Q4LBzK04+pmCvLdZXkhwb69oC
	wko+C9ir+kyuurPuYZGYL7LrycvufD8I=
X-Google-Smtp-Source: AGHT+IEjXK4zNU3B8MFfoIndGOeB/FKQBt1cyG91VMuMhesDC6zUrt9ZhhHY6gJ4lWXzCFjcVvXXmBBHZkq1dqdQ1TU=
X-Received: by 2002:a05:690e:1442:b0:644:51a4:4f1a with SMTP id
 956f58d0204a3-64716c67be2mr17455597d50.46.1768299214202; Tue, 13 Jan 2026
 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:13:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
X-Gm-Features: AZwV_Qgxd8O6AeWZ_24rr74gIMc3R8RlMUxlB-x9t8krXDZ9OpAu7ZlluLqPS50
Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Haotian Zhang <vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@kernel.org>, Amelie Delaunay <amelie.delaunay@foss.st.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, William Zhang <william.zhang@broadcom.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Luis de Arquer <luis.dearquer@inertim.com>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_021338_705382_B5AD3A5C 
X-CRM114-Status: GOOD (  16.68  )
X-Mailman-Approved-At: Thu, 15 Jan 2026 12:33:02 -0800
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgOTozNeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gSXQgc2VlbXMgYWxsIG9mIHRo
ZSBTUEkgZHJpdmVycyB3YW50IHRvIHByb3BhZ2F0ZSBmd25vZGUgKG9yIG9mX25vZGUpCj4gb2Yg
dGhlIHBoeXNpY2FsIGRldmljZSB0byB0aGUgU1BJIGRldmljZS4gTWFrZSBzdXJlIHdlIGRvbid0
IGR1cGxpY2F0ZQo+IGl0IG92ZXIgYW5kIG92ZXIgaW4gZWFjaCBuZXcgZHJpdmVyICgrMiBpbiB0
aGlzIGN5Y2xlKSBieSBtYWtpbmcgY29yZQo+IHRvIHRha2UgY2FyZSBvZiB0aGF0LiBOb3RlLCBz
aW1pbGFyIGlzIGRvbmUgYWxyZWFkeSBieSBJSU8gYW5kCj4gScKyQyBzdWJzeXN0ZW1zLgo+Cj4g
VGhlcmUgaXMgb25lIG5vdGljZWFibGUgYW5kIHF1aXRlIHNwZWNpZmljIGNhc2UgdGhhdCBpcyB0
YWtlbiBjYXJlIGluCj4gdGhlIGZpcnN0IHBhdGNoIGFuZCBub3cgd2UgaGF2ZSBhIGNvbmZpcm1h
dGlvbiBmcm9tIENpcnJ1cyB0aGF0IGV2ZXJ5dGhpbmcKPiBpcyBva2F5LiAgVGhlIHJlc3QgaXMg
anVzdCBhIG1lY2hhbmljYWwgY29udmVyc2lvbiBhZnRlciBjaGVja2luZyB0aGF0Cj4gdGhlIHBh
cmVudCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlIHNhbWUgdGhhdCBwcm92aWRlcyB0aGUgcmVz
cGVjdGl2ZQo+IGZ3bm9kZS4KClRoaXMgaXMgY2xlYXJseSBtYWtpbmcgdGhlIGtlcm5lbCBhIGJl
dHRlciBwbGFjZS4KClRoZSBzZXJpZXM6ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
