Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9BCCA1012
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxFv9HHWhV0ZGGXqNsA+CE1MasLQa5jpbWspdA+GtPE=; b=nJmiDjosteWL+4
	fy9Xqeuar79NVVK7uoRCNe4xCGmFenrXsXZ5RTj7ztiUSxPjoR8sreUTo3pAoWf6jmIwkD8xWtGiA
	fKqM3gj0bDye8JL4YNwEqvq8MEVDl5Ti9U/KrmulmrDT6brauP1ctDKv75Nr9WcvEVSnNIVb/zgb9
	4PTYa/JUNJpllBYmEyn4Ng2SSWKTgl5THIIQE6D1Tit9aUx27slcUmiC/Om8jA71VsbqO0Y9bSQ05
	+NfdJU8eL2WCVNe7CQjbxmXHs0FWjd5WZVe3lcCni0NDqkHI/w3+btLzZSciq2nN1tyrSvU396qnU
	BANe488HaNDJnYMd4oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwh6-00000007t1i-2K5l;
	Wed, 03 Sep 2025 23:15:12 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utszs-00000007Qn5-2IBE;
	Wed, 03 Sep 2025 19:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756927095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zUd3hbPutfTlDAjUwHIkED1FOMMH63fasP77ATNMKWI=;
	b=M013U4MaToItOZxUrRJlNgf3goruACFm3i1msJg9jS7+HrTxirIsbgBywDk0B5jKoJZNHe
	5GoEutO36JaVJOooUiUSeVBruDzW1fnbZkbLEJf2t0JycvE4miuhDdGhJAyVfZ57ChqOga
	N/tyTnB51UGdvYdyVgUUSZcxz127gLI=
Message-ID: <9387ed0a6d4e4c77ffd0f7aee55eaa1ff6ecd22e.camel@crapouillou.net>
Subject: Re: [PATCH 022/114] clk: ingenic: cgu: convert from round_rate() to
 determine_rate()
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Keguang Zhang	 <keguang.zhang@gmail.com>, Taichi Sugaya
 <sugaya.taichi@socionext.com>,  Takao Orito <orito.takao@socionext.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer	 <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung
 <schung@nuvoton.com>,  Vladimir Zapolskiy	 <vz@mleia.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
 Yixun Lan	 <dlan@gentoo.org>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Wed, 03 Sep 2025 21:18:09 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-22-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-22-b3bf97b038dc@redhat.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_121820_758715_4A9E4379 
X-CRM114-Status: GOOD (  16.26  )
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

SGkgQnJpYW4sCgpMZSBsdW5kaSAxMSBhb8O7dCAyMDI1IMOgIDExOjE4IC0wNDAwLCBCcmlhbiBN
YXNuZXkgdmlhIEI0IFJlbGF5IGEKw6ljcml0wqA6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFz
bmV5QHJlZGhhdC5jb20+Cj4gCj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0
ZWQsIHNvIG1pZ3JhdGUgdGhpcyBkcml2ZXIgZnJvbQo+IHJvdW5kX3JhdGUoKSB0byBkZXRlcm1p
bmVfcmF0ZSgpIHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoCj4gb24gdGhlIGNv
dmVyIGxldHRlciBvZiB0aGlzIHNlcmllcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNu
ZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVs
QGNyYXBvdWlsbG91Lm5ldD4KCkNoZWVycywKLVBhdWwKCj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9p
bmdlbmljL2NndS5jIHwgMTIgKysrKysrKy0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9p
bmdlbmljL2NndS5jIGIvZHJpdmVycy9jbGsvaW5nZW5pYy9jZ3UuYwo+IGluZGV4Cj4gMGM5Yzgz
NDRhZDExMDNiMTMzMzdhMjZlMTRiMGQ1ZDVjMzQwZDcwNS4uOTFlN2FjMGNjMzM0MmUzNTUyYWNi
OWQyZWMwCj4gMDg2NWE1MjM0YWQ0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9pbmdlbmlj
L2NndS5jCj4gKysrIGIvZHJpdmVycy9jbGsvaW5nZW5pYy9jZ3UuYwo+IEBAIC0xNzQsMTQgKzE3
NCwxNiBAQCBpbmdlbmljX3BsbF9jYWxjKGNvbnN0IHN0cnVjdAo+IGluZ2VuaWNfY2d1X2Nsa19p
bmZvICpjbGtfaW5mbywKPiDCoAkJbiAqIG9kKTsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZwo+
IC1pbmdlbmljX3BsbF9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25n
IHJlcV9yYXRlLAo+IC0JCcKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwcmF0ZSkKPiArc3Rh
dGljIGludCBpbmdlbmljX3BsbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiAr
CQkJCcKgwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoAlz
dHJ1Y3QgaW5nZW5pY19jbGsgKmluZ2VuaWNfY2xrID0gdG9faW5nZW5pY19jbGsoaHcpOwo+IMKg
CWNvbnN0IHN0cnVjdCBpbmdlbmljX2NndV9jbGtfaW5mbyAqY2xrX2luZm8gPQo+IHRvX2Nsa19p
bmZvKGluZ2VuaWNfY2xrKTsKPiDCoAo+IC0JcmV0dXJuIGluZ2VuaWNfcGxsX2NhbGMoY2xrX2lu
Zm8sIHJlcV9yYXRlLCAqcHJhdGUsIE5VTEwsCj4gTlVMTCwgTlVMTCk7Cj4gKwlyZXEtPnJhdGUg
PSBpbmdlbmljX3BsbF9jYWxjKGNsa19pbmZvLCByZXEtPnJhdGUsIHJlcS0KPiA+YmVzdF9wYXJl
bnRfcmF0ZSwKPiArCQkJCcKgwqDCoMKgIE5VTEwsIE5VTEwsIE5VTEwpOwo+ICsKPiArCXJldHVy
biAwOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW5saW5lIGludCBpbmdlbmljX3BsbF9jaGVja19z
dGFibGUoc3RydWN0IGluZ2VuaWNfY2d1ICpjZ3UsCj4gQEAgLTMxNyw3ICszMTksNyBAQCBzdGF0
aWMgaW50IGluZ2VuaWNfcGxsX2lzX2VuYWJsZWQoc3RydWN0IGNsa19odwo+ICpodykKPiDCoAo+
IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIGluZ2VuaWNfcGxsX29wcyA9IHsKPiDCoAku
cmVjYWxjX3JhdGUgPSBpbmdlbmljX3BsbF9yZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0g
aW5nZW5pY19wbGxfcm91bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGluZ2VuaWNfcGxs
X2RldGVybWluZV9yYXRlLAo+IMKgCS5zZXRfcmF0ZSA9IGluZ2VuaWNfcGxsX3NldF9yYXRlLAo+
IMKgCj4gwqAJLmVuYWJsZSA9IGluZ2VuaWNfcGxsX2VuYWJsZSwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
