Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582BED2FEDC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diw7wgJ+7O2uyuBIAw4lZuEYl0Ww1Ak5vpY9O3SlUnw=; b=lS9tMEElfQI+nu
	7BtpQmdA915kWqBfwMHwoIeGzXyXOJaGX8ezBOa14vN2QPcgEp0wf/VfHJVnh333sETzQpn94aOe5
	pGjdxcQZ6CuL9hC4JDnzXBa89/rtATPjH6UaywoDTkJDzQKlIes24RWWiKKQdaSRNOHX7XR1dh8Sx
	XhQsTensY1vuYQufNM5K5NjoolZ2GSregWRF219sr7Nc28MemUmf0Ch9jOX/MWgL/PmatF7yIO3P6
	izSnRWxIDVT1tT03s37nkoZKpG45cX11NQmNsCQZd/+NcuYyfh3mQUXYem9MnhF0xs8iFPzZjjaMW
	IHrrklqDyewFaMXkl50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqi-0000000Evor-0x1r;
	Tue, 27 Jan 2026 19:35:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHJH-00000004MZV-2teK;
	Tue, 20 Jan 2026 19:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56DD542E46;
	Tue, 20 Jan 2026 19:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BB5C19422;
	Tue, 20 Jan 2026 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936958;
	bh=OVmbkw3k7fJ26f3GTMylBqqrvRkFQLNjf2AcM9UevMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YlIDWci6NaIrYvDjAq2yhQz8tWegT2Dg6owXkPTtWwCCNZy6TIGjxdkf0SjWMqrBS
	 HZ1OYluozzxuGUb+8XWZyPhjHzhZZBTdn+x4fAQviriIGxbMX1dqT/c1f/SDma9EII
	 glDqd9riC4rVx6B2QSNL57WNsH5WjpCsMft/TEmFUb+YsHy2dFuwVHN2w/p0QKAC/w
	 5Sj7i2icD1/pyQOPwPNE/B2LChkgA736lCjfJaMApcMxmC8AfGe77IDEawz4zO7gsp
	 7BnFoBJwZbhJtt0PHorTsf9ENVZR5l7hg6xF7YMzjdh3zo3J0vrT/Hr5cse6h9pQHI
	 VNOGdReIfciTA==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, 
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
 Sergio Perez Gonzalez <sperezglz@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alessandro Grassi <alessandro.grassi@mailbox.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, 
 Haixu Cui <quic_haixcui@quicinc.com>, 
 Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Wanner <ryan.wanner@microchip.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
 Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
 Masahisa Kojima <masahisa.kojima@linaro.org>, 
 Jassi Brar <jaswinder.singh@linaro.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/4] spi: Make SPI core to take care of fwnode
 assignment
Message-Id: <176893693352.778248.9155805475563647239.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:22:13 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_112242_098764_E21E7B12 
X-CRM114-Status: GOOD (  19.21  )
X-Mailman-Approved-At: Tue, 27 Jan 2026 11:35:38 -0800
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

T24gVGh1LCAwOCBKYW4gMjAyNiAyMToyMzozNyArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEl0IHNlZW1zIGFsbCBvZiB0aGUgU1BJIGRyaXZlcnMgd2FudCB0byBwcm9wYWdhdGUgZndu
b2RlIChvciBvZl9ub2RlKQo+IG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZp
Y2UuIE1ha2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKPiBpdCBvdmVyIGFuZCBvdmVyIGluIGVh
Y2ggbmV3IGRyaXZlciAoKzIgaW4gdGhpcyBjeWNsZSkgYnkgbWFraW5nIGNvcmUKPiB0byB0YWtl
IGNhcmUgb2YgdGhhdC4gTm90ZSwgc2ltaWxhciBpcyBkb25lIGFscmVhZHkgYnkgSUlPIGFuZAo+
IEnCskMgc3Vic3lzdGVtcy4KPiAKPiBUaGVyZSBpcyBvbmUgbm90aWNlYWJsZSBhbmQgcXVpdGUg
c3BlY2lmaWMgY2FzZSB0aGF0IGlzIHRha2VuIGNhcmUgaW4KPiB0aGUgZmlyc3QgcGF0Y2ggYW5k
IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIGNvbmZpcm1hdGlvbiBmcm9tIENpcnJ1cwo+IHRoYXQg
ZXZlcnl0aGluZyBpcyBva2F5LiBUaGUgcmVzdCBpcyBqdXN0IGEgbWVjaGFuaWNhbCBjb252ZXJz
aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEK
ClsxLzRdIHNwaTogUHJvcGFnYXRlIGRlZmF1bHQgZndub2RlIHRvIHRoZSBTUEkgY29udHJvbGxl
ciBkZXZpY2UKICAgICAgY29tbWl0OiBmMmQxYTMzMThlYjFlYzg2MDk5OWRiNDhjYjhkMTNiNDMy
NjE2MjRkClsyLzRdIHNwaTogRHJvcCBkdXBsaWNhdGUgb2Zfbm9kZSBhc3NpZ25tZW50CiAgICAg
IGNvbW1pdDogMzk3NGE1ODViZTc4YTFkYzkwYTE5ZDVjZjE4NDZhOTk5NTRlMzg0MgpbMy80XSBz
cGk6IERyb3AgZHVwbGljYXRlIGZ3bm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMTAzYzUx
MGUxYzY4MzI3MjAwNTk3NTZkMTU1ZGQxM2E0MmJhYTdhYgpbNC80XSBzcGk6IERyb3AgZHVwbGlj
YXRlIGRldmljZV9zZXRfbm9kZSgpIGNhbGwKICAgICAgY29tbWl0OiAzN2ZiYzFhYjBmMjI1ZDIz
ZjA4MzkyNjBhMTEzNzViNGYxZjdjZjhjCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQg
aXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBz
b21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRo
ZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2
ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3Bw
ZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZy
b20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBs
ZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxv
d3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5l
ZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcg
ZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRl
cyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxh
Y2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRo
ZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
