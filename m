Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD798D2FEDC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnk0UWlgxxwQCbvZsO2UW7sQVDvZ7ksGizOrY2nGOBM=; b=fLX8kHGc+/Lc4o
	lov1npQJSLSPJ9VgpKnlRcvByqvT3EeZ5YfgfIwZylop7N3+5CNFCQxbukKQX+Pjlf6vEpeOYhKje
	Nbcwpc6Q1/Nz4aUzeJvcQWWDzsUjUfTkWP7ppdgtVltyJiYrylX9Aj7WOJ2mDnSNXdlktWrpf5GAi
	CxcHrvmg3Z7je3m5V5x0z4DdVsbCBpib7hNhA576X4oc/2NqzKDyNGiBjgCm9fSJ8czWDYJPemKw8
	8H7BOdWzzv8joWPAKsglwsBMkn0oC3xCWa+US9UUPoMntlWnN8hh0e8IMI0FyhDzumXlQm70A3+lM
	uMnxIKKA+fB/B+/llG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqi-0000000Evov-2943;
	Tue, 27 Jan 2026 19:35:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHJh-00000004Mg3-3vOZ;
	Tue, 20 Jan 2026 19:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8683142E46;
	Tue, 20 Jan 2026 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA9BC16AAE;
	Tue, 20 Jan 2026 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936983;
	bh=8rZs4ctIFUWV+s7flKGQlMaVzkDSCztd/ihtff8Ht6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jgX58MKi+zjgv/xDIQx4cHK0wTdbY5WHIpWy6zaWGiyru1YA6cG7Qbw7G8M9RhL3S
	 SSiru+ZKHzsLIh6rtTpzRanq5020WDpXXkfsUjC/Hil6perlOH41PXAjqsRSipdXvS
	 IPP61htVkOsCqcy9Pqn5fLS8BPsTMosoZ9eOUO70Q6cEURtv9hoJC0lOmTM5QlYWiG
	 wz6tqUkz/prRaWfMAFRhQ1iN0dHrXg8oROA8glqKMy/5Onkhv0z+Jp0+qs66q2UQYi
	 BzO1NPQx1qqbWombFmTG5JqwfCmxs4g31+tAPZmi39pA4KsUWJBmYbw0vvIV/lZYxv
	 FMvcuLOxsC4SQ==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>, 
 Janne Grunau <j@jannau.net>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 William Zhang <william.zhang@broadcom.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
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
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Rosen Penev <rosenp@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luis de Arquer <luis.dearquer@inertim.com>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alessandro Grassi <alessandro.grassi@mailbox.org>, 
 Darshan R <rathod.darshan.0896@gmail.com>, 
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
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Wanner <ryan.wanner@microchip.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
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
 Masami Hiramatsu <mhiramat@kernel.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode
 assignment
Message-Id: <176893695845.778248.8132133480043006428.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:22:38 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_112306_011093_998603D3 
X-CRM114-Status: GOOD (  19.79  )
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

T24gTW9uLCAxMiBKYW4gMjAyNiAyMToyMToyMiArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEl0IHNlZW1zIGFsbCBvZiB0aGUgU1BJIGRyaXZlcnMgd2FudCB0byBwcm9wYWdhdGUgZndu
b2RlIChvciBvZl9ub2RlKQo+IG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZp
Y2UuIE1ha2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKPiBpdCBvdmVyIGFuZCBvdmVyIGluIGVh
Y2ggbmV3IGRyaXZlciAoKzIgaW4gdGhpcyBjeWNsZSkgYnkgbWFraW5nIGNvcmUKPiB0byB0YWtl
IGNhcmUgb2YgdGhhdC4gTm90ZSwgc2ltaWxhciBpcyBkb25lIGFscmVhZHkgYnkgSUlPIGFuZAo+
IEnCskMgc3Vic3lzdGVtcy4KPiAKPiBUaGVyZSBpcyBvbmUgbm90aWNlYWJsZSBhbmQgcXVpdGUg
c3BlY2lmaWMgY2FzZSB0aGF0IGlzIHRha2VuIGNhcmUgaW4KPiB0aGUgZmlyc3QgcGF0Y2ggYW5k
IG5vdyB3ZSBoYXZlIGEgY29uZmlybWF0aW9uIGZyb20gQ2lycnVzIHRoYXQgZXZlcnl0aGluZwo+
IGlzIG9rYXkuICBUaGUgcmVzdCBpcyBqdXN0IGEgbWVjaGFuaWNhbCBjb252ZXJzaW9uIGFmdGVy
IGNoZWNraW5nIHRoYXQKPiB0aGUgcGFyZW50IGRldmljZSBpcyBhc3NpZ25lZCB0byB0aGUgc2Ft
ZSB0aGF0IHByb3ZpZGVzIHRoZSByZXNwZWN0aXZlCj4gZndub2RlLgo+IAo+IFsuLi5dCgpBcHBs
aWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEKClsxLzRdIHNwaTogUHJvcGFnYXRl
IGRlZmF1bHQgZndub2RlIHRvIHRoZSBTUEkgY29udHJvbGxlciBkZXZpY2UKICAgICAgY29tbWl0
OiBmMmQxYTMzMThlYjFlYzg2MDk5OWRiNDhjYjhkMTNiNDMyNjE2MjRkClsyLzRdIHNwaTogRHJv
cCBkdXBsaWNhdGUgb2Zfbm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMzk3NGE1ODViZTc4
YTFkYzkwYTE5ZDVjZjE4NDZhOTk5NTRlMzg0MgpbMy80XSBzcGk6IERyb3AgZHVwbGljYXRlIGZ3
bm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMTAzYzUxMGUxYzY4MzI3MjAwNTk3NTZkMTU1
ZGQxM2E0MmJhYTdhYgpbNC80XSBzcGk6IERyb3AgZHVwbGljYXRlIGRldmljZV9zZXRfbm9kZSgp
IGNhbGwKICAgICAgY29tbWl0OiAzN2ZiYzFhYjBmMjI1ZDIzZjA4MzkyNjBhMTEzNzViNGYxZjdj
ZjhjCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVk
IGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAy
NCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAo
b3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRp
c2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3Ug
bWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVh
bCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9w
bGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2lu
ZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVz
IGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkK
c2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0
LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkg
cmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0
byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
