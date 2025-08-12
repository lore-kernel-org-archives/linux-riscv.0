Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A53FCA0EDB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jf/fOfYoTByF7wEfsRU9Mb0XyfEVqPEgvfLiKHxwZVY=; b=CBPvvmQofEriR/
	EpaLsHkxlMY9fcJtSxuks6nEvWdPzmwc0rw3ABGkoqV72kZmnK9gdGGMNU6pnjuj1zR+zX4ZiIcRp
	OeuhKj4qpxhkG71majP6d0M6p6O27B9q8ri0e14U4K47tQsq1jlW4QbqdEtFhmalfWPBug0sc89Rq
	awkSJ2MlYeV4NAIWGyCnEsvQhDHC2vjxfwI6WOPyzBz4unHPHqpzgqgEQ+RE/xzDBmJi23xDck+Jd
	eZubLB5FEDj3dLj0GT49c0mLoUVNOpGApDK977I9I0S6zFM39iKJYAJvvvYni/5aSkZe4gfiVXDgn
	e8qWNTZsd5fAmxUmkITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluao-0000000Bn4E-01EI;
	Tue, 12 Aug 2025 19:23:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulr5m-0000000BBQo-1sh0;
	Tue, 12 Aug 2025 15:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C95534433E;
	Tue, 12 Aug 2025 15:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284FDC4CEF0;
	Tue, 12 Aug 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755013153;
	bh=iGUpF1C71k7qo9/61ohvQv5Z7z5laJQcZjUsXmHz/vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiZpRdpDhra8HQLi6oTJvzINkJJSuv23n4QKhmL0GdIDFfOjMCDM1OqYhcWHHq3TI
	 L28O5b3iPN5wVc9EXSMe1wiMP/NajukL3ql7pF4a85lv1fNAUZsV+TlMAAvN2rrzmr
	 wRMnMSseO6nd8/EPTJY79HOmJ9zeY5vY0LS0u24hUa3icUGD8uDqDLMHMPTvWLEQv1
	 l7Tw7lcXGU5Rs7ZD4eklupowdOLUecuU8uOFa6RlUoRtZfGlD+/8Ge0Ca3RaSQaoYZ
	 h2ClWJH1Q8I12fZ++utjNSDaO59Bx51zYgkj3Rxo8YY8S6cPtFbxYBa0hRIu+GN5Me
	 k5jWalHFpopnQ==
Date: Tue, 12 Aug 2025 21:08:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 079/114] clk: bm1880: convert from round_rate() to
 determine_rate()
Message-ID: <tcl4eqicuqcptnbo4mcvjhacxkh2gh344k2bdrwfjbqflxspy7@x24np6pxjacf>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_083914_530348_16EF596B 
X-CRM114-Status: GOOD (  22.13  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMTE6MTk6MTFBTSBHTVQsIEJyaWFuIE1hc25leSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+
Cj4gCj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0ZWQsIHNvIG1pZ3JhdGUg
dGhpcyBkcml2ZXIgZnJvbQo+IHJvdW5kX3JhdGUoKSB0byBkZXRlcm1pbmVfcmF0ZSgpIHVzaW5n
IHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoCj4gb24gdGhlIGNvdmVyIGxldHRlciBvZiB0
aGlzIHNlcmllcy4KPiAKCk9uY2UgdGhpcyBwYXRjaCBnZXRzIG1lcmdlZCwgdGhlICdDb2NjaW5l
bGxlIHNlbWFudGljIHBhdGNoIG9uIHRoZSBjb3ZlciBsZXR0ZXIKb2YgdGhpcyBzZXJpZXMnIGJl
Y29tZXMgaXJyZWxldmFudC4gSSdkIHN1Z2dlc3QgdG8gZWl0aGVyIGluY2x1ZGUgdGhlIHNjcmlw
dApoZXJlIG9yIGRvIG5vdCBtZW50aW9uIGl0IGF0IGFsbC4KCi0gTWFuaQoKPiBTaWduZWQtb2Zm
LWJ5OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9j
bGsvY2xrLWJtMTg4MC5jIHwgMjEgKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9jbGstYm0xODgwLmMgYi9kcml2ZXJzL2Nsay9jbGstYm0xODgwLmMKPiBpbmRl
eCAwMDJmNzM2MGIxYzZjNmUzMDU4NjA2YTA4MDgxMTViNDhmZDMxNDdhLi5kYWMxOTBiYzZlMTlh
NmRkNGJlNDEzZWE1MmQ0MWY3NDkzNGExYWE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Ns
ay1ibTE4ODAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1ibTE4ODAuYwo+IEBAIC02MDgsOCAr
NjA4LDggQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYm0xODgwX2Nsa19kaXZfcmVjYWxjX3JhdGUo
c3RydWN0IGNsa19odyAqaHcsCj4gIAlyZXR1cm4gcmF0ZTsKPiAgfQo+ICAKPiAtc3RhdGljIGxv
bmcgYm0xODgwX2Nsa19kaXZfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQg
bG9uZyByYXRlLAo+IC0JCQkJICAgICAgdW5zaWduZWQgbG9uZyAqcHJhdGUpCj4gK3N0YXRpYyBp
bnQgYm0xODgwX2Nsa19kaXZfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gKwkJ
CQkJIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gIHsKPiAgCXN0cnVjdCBibTE4ODBf
ZGl2X2h3X2Nsb2NrICpkaXZfaHcgPSB0b19ibTE4ODBfZGl2X2Nsayhodyk7Cj4gIAlzdHJ1Y3Qg
Ym0xODgwX2Rpdl9jbG9jayAqZGl2ID0gJmRpdl9ody0+ZGl2Owo+IEBAIC02MjEsMTMgKzYyMSwx
OCBAQCBzdGF0aWMgbG9uZyBibTE4ODBfY2xrX2Rpdl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcg
Kmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gIAkJdmFsID0gcmVhZGwocmVnX2FkZHIpID4+IGRp
di0+c2hpZnQ7Cj4gIAkJdmFsICY9IGNsa19kaXZfbWFzayhkaXYtPndpZHRoKTsKPiAgCj4gLQkJ
cmV0dXJuIGRpdmlkZXJfcm9fcm91bmRfcmF0ZShodywgcmF0ZSwgcHJhdGUsIGRpdi0+dGFibGUs
Cj4gLQkJCQkJICAgICBkaXYtPndpZHRoLCBkaXYtPmZsYWdzLAo+IC0JCQkJCSAgICAgdmFsKTsK
PiArCQlyZXEtPnJhdGUgPSBkaXZpZGVyX3JvX3JvdW5kX3JhdGUoaHcsIHJlcS0+cmF0ZSwKPiAr
CQkJCQkJICAmcmVxLT5iZXN0X3BhcmVudF9yYXRlLAo+ICsJCQkJCQkgIGRpdi0+dGFibGUsCj4g
KwkJCQkJCSAgZGl2LT53aWR0aCwgZGl2LT5mbGFncywgdmFsKTsKPiArCj4gKwkJcmV0dXJuIDA7
Cj4gIAl9Cj4gIAo+IC0JcmV0dXJuIGRpdmlkZXJfcm91bmRfcmF0ZShodywgcmF0ZSwgcHJhdGUs
IGRpdi0+dGFibGUsCj4gLQkJCQkgIGRpdi0+d2lkdGgsIGRpdi0+ZmxhZ3MpOwo+ICsJcmVxLT5y
YXRlID0gZGl2aWRlcl9yb3VuZF9yYXRlKGh3LCByZXEtPnJhdGUsICZyZXEtPmJlc3RfcGFyZW50
X3JhdGUsCj4gKwkJCQkgICAgICAgZGl2LT50YWJsZSwgZGl2LT53aWR0aCwgZGl2LT5mbGFncyk7
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgYm0xODgwX2Nsa19kaXZf
c2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiBAQCAtNjY1
LDcgKzY3MCw3IEBAIHN0YXRpYyBpbnQgYm0xODgwX2Nsa19kaXZfc2V0X3JhdGUoc3RydWN0IGNs
a19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Y2xrX29wcyBibTE4ODBfY2xrX2Rpdl9vcHMgPSB7Cj4gIAkucmVjYWxjX3JhdGUgPSBibTE4ODBf
Y2xrX2Rpdl9yZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gYm0xODgwX2Nsa19kaXZfcm91
bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGJtMTg4MF9jbGtfZGl2X2RldGVybWluZV9y
YXRlLAo+ICAJLnNldF9yYXRlID0gYm0xODgwX2Nsa19kaXZfc2V0X3JhdGUsCj4gIH07Cj4gIAo+
IAo+IC0tIAo+IDIuNTAuMQo+IAo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDg
rprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
