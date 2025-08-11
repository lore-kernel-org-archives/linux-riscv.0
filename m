Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF7CCA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tbrqjf9FBGbWmsUyJKA1JgvwE++faLwhznRLyzy3Y1w=; b=MzupRlz7Qc26DX
	ep4+9v9lKwtM2/o4dMMHpJ0t0x7dshVdGfJ4z/EUs9+RSzplY6aK/snZZm8GkmkiO5SECCL6YwHwb
	mEfYOVKwPs0M43upWUVWmoFs5HG6JhRUsbb3YJb2AF2bjcSL3Y458CsYAMhCmo4KVIxL1IIvZwEiC
	XbrmJ0LXtQkI1ATE1riExCEMlBX/OzgIb8wsXJVo4mrR9Wps1L0UF4CL5V+UzhMJ0iIjGz2upN96P
	gTumKrSWmKEn+sQud5vqzOVL2KKJFcnGMYuP3dtLoAEPcbYftfV2pz1bf8adIgwFNwwQkppxti519
	B6y/ueIEM46C/T324HVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVh-00000008p5V-1Bvk;
	Mon, 11 Aug 2025 18:44:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUxM-00000008JYG-01yL;
	Mon, 11 Aug 2025 16:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C994450E8;
	Mon, 11 Aug 2025 16:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6AC4CEED;
	Mon, 11 Aug 2025 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928062;
	bh=Mt5Z9iaxEJqunSSWFhe3foZePTxEE32AzKMZx3Qr8RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyiP+pGKfJHAHSCkg/AuFQl20aYOw9VY+sW09ZDqrRnXl3qhO6kW3xwjReBD5Z32U
	 rc5u4QiD9di8rs5Y26pPKqgz3ObtPPTdetcOMRnY4L3JBnCvV8biR9qNn6DSikeOF7
	 VhE5sUJSpEKSYYri6ra4/Vt6YfnG4ukgWhyQSV/dITF7k1RhjSrtVsfcRLEij9Eys6
	 q9OGM68dgjgR0McTiVcrG5fpKLeSFSRz3ApxW9cooonoB2N5qjQ2mVUArcBqG3wBQ8
	 ehA3INw6J09SgYdPezVfIC1CQjP1rhvwV1/tDG6KwuSpPtIw0jol1Ml6Et91NjCKhR
	 E8uC2ag7Nqdxw==
Date: Mon, 11 Aug 2025 21:30:30 +0530
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
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <3rhp73jjlpcoutaj56pjhrjtjxugf2nghiygax6s3n47biwfr7@pdk5zorat5dh>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090104_087237_5B5873EA 
X-CRM114-Status: GOOD (  25.04  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMTE6MTc6NTJBTSBHTVQsIEJyaWFuIE1hc25leSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0ZWQg
aW4gdGhlIGNsayBmcmFtZXdvcmsgaW4gZmF2b3IKPiBvZiB0aGUgZGV0ZXJtaW5lX3JhdGUoKSBj
bGsgb3BzLCBzbyBsZXQncyBnbyBhaGVhZCBhbmQgY29udmVydCB0aGUKPiB2YXJpb3VzIGNsayBk
cml2ZXJzIHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoIHBvc3RlZCBiZWxvdy4K
PiBJIGRpZCBhIGZldyBtaW5vciBjb3NtZXRpYyBjbGVhbnVwcyBvZiB0aGUgY29kZSBpbiBhIGZl
dyBjYXNlcy4KPiAKPiBUaGlzIHNlcmllcyBpcyBicm9rZW4gdXAgaW50byBzZXZlcmFsIGNhdGVn
b3JpZXM6Cj4gCj4gLSBQYXRjaCAxIHRvIGNsay9hdDkxL3BlcmlwaGVyYWwgaXMgYSBidWcgZml4
IGZvciBhIHJldHVybiB2YWx1ZS4KPiAKPiAtIFBhdGNoIDIgdG8gY2xrL2F0OTEvcGVyaXBoZXJh
bCB3YXNuJ3Qgc3RyYWlnaHQgZm9yd2FyZCBsaWtlIHRoZSBvdGhlcgo+ICAgZHJpdmVycywgc28g
SSdtIGV4cGxpY2l0bHkgY2FsbGluZyB0aGlzIG9uZSBvdXQgc2VwYXJhdGVseS4KPiAKPiAtIFBh
dGNoIDMgYWRkcyBhIGRldGVybWluZV9yYXRlKCkgb3AgYW5kIGtlZXBzIHRoZSByb3VuZF9yYXRl
KCkgaW4gcGxhY2UKPiAgIHNpbmNlIHRoaXMgaXMgbmVlZGVkIGJ5IGRyaXZlcnMvY2xrL2FjdGlv
bnMvb3dsLWNvbXBvc2l0ZS5jIGFuZCBrZWVwcwo+ICAgdGhlIHRyZWUgYmlzZWN0YWJsZS4gVGhl
IGRlcHJlY2F0ZWQgcm91bmRfcmF0ZSgpIG9wIGlzIGRyb3BwZWQgaW4gcGF0Y2gKPiAgIDExMy4K
PiAKPiAtIFBhdGNoZXMgNC03MCBhcmUgZm9yIGRyaXZlcnMgd2hlcmUgdGhlcmUgaXMgbm8gY2xr
IHN1Ym1haW50YWluZXIKPiAgIGxpc3RlZCBpbiB0aGUgTUFJTlRBSU5FUlMgZmlsZS4gUGF0Y2gg
MTkgaW5jbHVkZXMgYSBtaW5vciBmaXggc28gdGhhdAo+ICAgQ29jY2luZWxsZSBjYW4gYmUgcmFu
IGFnYWluc3QgYSBwYXJ0aWN1bGFyIHNvdXJjZSBmaWxlLgo+IAo+IC0gUGF0Y2hlcyA3MS0xMTAg
YXJlIGZvciBkcml2ZXJzIHdoZXJlIHRoaXMgaXMgYW4gZW50cnkgaW4gTUFJTlRBSU5FUlMKPiAg
IGZvciB0aGUgZHJpdmVyLgo+IAo+IC0gUGF0Y2hlcyAxMTEtMTE0IGFyZSBmb3IgZHJpdmVycyB0
aGF0IGltcGxlbWVudCBib3RoIHJvdW5kX3JhdGUoKSBhbmQKPiAgIGRldGVybWluZV9yYXRlKCks
IHNvIHRoZSByb3VuZF9yYXRlKCkgaW1wbGVtZW50YXRpb24gaXMgZHJvcHBlZC4KPiAKPiBPbmNl
IGFsbCBvZiBteSBjb252ZXJzaW9uIHBhdGNoZXMgYWNyb3NzIHRoZSB2YXJpb3VzIHRyZWVzIGlu
IHRoZSBrZXJuZWwKPiBoYXZlIGJlZW4gbWVyZ2VkLCBJIHdpbGwgcG9zdCBhIHNtYWxsIHNlcmll
cyB0aGF0IHJlbW92ZXMgdGhlCj4gcm91bmRfcmF0ZSgpIG9wIGZyb20gdGhlIGNsayBjb3JlIGFu
ZCB0aGUgZG9jdW1lbnRhdGlvbi4gSGVyZSdzIHRoZQo+IG90aGVyIHBhdGNoIHNlcmllcyB0aGF0
IGFyZSBjdXJyZW50bHkgaW4gZmxpZ2h0IHRoYXQgbmVlZCB0byBiZSBtZXJnZWQKPiBiZWZvcmUg
d2UgY2FuIHJlbW92ZSByb3VuZF9yYXRlKCkgZnJvbSB0aGUgY29yZS4KPiAKClBsZWFzZSBkbyBu
b3QgQ0MgYWxsIHJldmlld2Vycy9tYWludGFpbmVycyBvZiBpbmRpdmlkdWFsIGNsb2NrIGNvbnRy
b2xsZXIKZHJpdmVycyB0byBhbGwgcGF0Y2hlcywgYnV0IG9ubHkgdG8gdGhlIHJlc3BlY3RpdmUg
Y2xvY2sgY29udHJvbGxlciBwYXRjaGVzLgpJdCBqdXN0IHNwYW1zIG91ciBpbmJveC4gQ0Npbmcg
YWxsIG9mIHVzIGluIHRoZSBjb3ZlciBsZXR0ZXIgaXMgZmluZSB0aG91Z2guCgotIE1hbmkKCi0t
IArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
