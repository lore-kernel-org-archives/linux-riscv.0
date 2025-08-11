Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A97CA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2qMYs/goqww0R3lf5UFU4mqHa09dR2Oqw73ct4UnJ4=; b=2DWAD1OQs/tdZA
	l4awo2n7aV3q5m/dEumh06kfYFOLWDnpa+dvQnJZ7t5hlFYxKy54yzRvNufauHQVYxwKjzrHZg2Dm
	j+iWAD8rgDR7rt+wWlElwPJhZ8FsunDcGo3KaqvGBye3AEiyv8G7cU5dbKfRF4L3r0b60FBBF3v/e
	rJT2SErQVgGHumfBp+uJE7QO01cVIFTDpifwZZm//5R+IsDjRBxLHPxIQHmYc8mKHLXMnzh/exWA9
	Fe4TJrtFTKqJMbMQh9vOI+D9PHsBJjNhM33Myjj1rjXm3b4PDpKCT/FTV49ZumGsNyvJmasiWDJcC
	fuxkTeVS4xCJMIS2SopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVe-00000008p36-3BDq;
	Mon, 11 Aug 2025 18:44:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUvo-00000008J8A-0JDM;
	Mon, 11 Aug 2025 15:59:29 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso6865463a12.1;
        Mon, 11 Aug 2025 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927966; x=1755532766; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=DXV1zuG8RJsLqBp5Sz45GynrLXRqZxrltJUWqlDgqjMr3NstNQ2y7cbYR+BI6eaYUw
         /KKlCqdUGR4gf5q319I+5ah9nqZulu+UtRdu7D1LjveBaK8b58tDtRGohzMs4G3ZkBLz
         M5naIjIR+IKRN612+quxBZsIO7+qv4BXrkMCQehMYHAVRxdMxhJdEplTKT13pZXq5Ws2
         XsR4BttP3Dl1IRjTtR7nbh1juiS3uIJech2Cn0GLgNhqbfmZ6Woo+o3e63uOz7Ngo7MW
         66uFRDBiLwpjQZbbL0TxCZWKVa4cS3T/MgMT8lKYKam8FmILikt8KhPgkt8mwRpXytxX
         4C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927966; x=1755532766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=H6be7eGDSacN+GuzG+ZcZAuULh6oDB2XPGpGf1rlVLqdgIz0Z4P9dUUQZqnht0icbV
         ISc4FY4gBKJ7TJa5jaWSaIMX51AUCxPiwwEH4PAYXU7xeEKleux7JtSO3KwH5Uyzsz3g
         spzHud5oUJRcw2BYPBjxVS4/MuvmNHr7ZFK4r+g3iGKJpZEORjRcHWlNIo2xSuvQ9ApP
         zO0r/29/tWTAzW0EpT4RRzhmjPmsUmMGNTh7ZuvXOZuPG600mOSPDvDWC/G2IHMM4ygj
         xRfZkIqIFtpd09/7a6vw74zAKejqrXmoUWguf/02AnkIo+Vq+QQNXBfgKCC7MmFWgCVe
         0Yzw==
X-Forwarded-Encrypted: i=1; AJvYcCUzFMbXt5I9ewGD3RYJYresxp66IOPIq+f/je0udGe0qJ/FeDgoolioh9xx5eNdB9sEC1uCFMgP+1QVzItz@lists.infradead.org, AJvYcCVMYaKode4OXiEyXp1Vqp5aw/hocnsGe5BwMaw+4qve4LdNBm+ABaLi3g9N/YUnI4SgpBrXDEf9XODQ84hmfWQ=@lists.infradead.org, AJvYcCVQ6m1QNuVZTjNCM6n7M2FFvtYTvOP4cvjI782J7+ZotfMQ9CKqtV5ju8sF+w+kTaHZsl9PpzCMJNGeHU0=@lists.infradead.org, AJvYcCXhoRc2d7CHynRSXEncgrDu44eB0c5KGGT4nCOJ8ypJ1p3GLlTbCe1yJQLAUSI52/k8/PrzcZX5JwgwElUHN/SG+A==@lists.infradead.org, AJvYcCXoiSjX3KRMysbqNP0ZpDwWRF0ax78mXGjCDynT8Vz9Jcw9LNMI9uWln4JjfvmBiIMVxENvFF7nm756chMkLRE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw66YLFnNetUvMCY39hVWErjUCCVRCWdnsgm8lNID6xVwb8w5Yk
	BsBP+nBQ1qw8L3QfkGIiyVjUaRHsKNt1kDAnN/fXMv6sFu/cqaN7rmn3
X-Gm-Gg: ASbGncvk7KKslD24fMBxBJJaA+e5I6CPvLyWNC0lmwcKFnVOVGDsfo9clZ5rARCCEfg
	5KLrnAbeAdB/eRvkKMj/xwwvCHRlecZYryns5F8QK5xBaSvlg2CuaVTAVAWW2wsNOtoHJKLFWi7
	NyIfPYs5eQ9L1hL7uufAWKPcfUzKONWel67VhdqW1NVKcKXKvwZOz7fnwuSADPoT8u9dgvaTP67
	RfEk2lenTFNhFlm0dJ02O1Y+D46P32C5aWZuXhuB2BqVyXuKIUkhT7n91P9v76lMnYBw1+DM53Q
	qlKaFXiednSwrYk17FxYFYVsROsjRRPKbkyUPb7qKwpWW5oA3K+brWT0xq3jcdUti7YNQCts/tT
	MfWi3hz/5SRBrgXwAqdFlSa1DcKynuWBtYA746gc=
X-Google-Smtp-Source: AGHT+IHR6aQlSF/8bXSoH4TD6ap2xoMQpmbGXXfb1yr3omEUKfVx4ptOTSMnNibgVm0ppSBcD6Zkmg==
X-Received: by 2002:a05:6402:42c5:b0:618:4044:67a7 with SMTP id 4fb4d7f45d1cf-61840446cc7mr1952899a12.5.1754927966277;
        Mon, 11 Aug 2025 08:59:26 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618200a0159sm2966360a12.6.2025.08.11.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:59:25 -0700 (PDT)
Message-ID: <522ae36bf788df6d957bfee671857d6b2e1e8863.camel@gmail.com>
Subject: Re: [PATCH 001/114] clk: at91: peripheral: fix return value
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
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
Date: Mon, 11 Aug 2025 17:59:22 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_085928_135166_821F270D 
X-CRM114-Status: GOOD (  18.45  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE3IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IGRldGVybWluZV9yYXRlKCkgaXMgZXhwZWN0ZWQgdG8gcmV0dXJuIGFuIGVycm9yIGNvZGUsIG9y
IDAgb24gc3VjY2Vzcy4KPiBjbGtfc2FtOXg1X3BlcmlwaGVyYWxfZGV0ZXJtaW5lX3JhdGUoKSBo
YXMgYSBicmFuY2ggdGhhdCByZXR1cm5zIHRoZQo+IHBhcmVudCByYXRlIG9uIGEgY2VydGFpbiBj
YXNlLiBUaGlzIGlzIHRoZSBiZWhhdmlvciBvZiByb3VuZF9yYXRlKCksCj4gc28gbGV0J3MgZ28g
YWhlYWQgYW5kIGZpeCB0aGlzIGJ5IHNldHRpbmcgcmVxLT5yYXRlLgo+IAo+IEZpeGVzOiBiNGMx
MTVjNzYxODRmICgiY2xrOiBhdDkxOiBjbGstcGVyaXBoZXJhbDogYWRkIHN1cHBvcnQgZm9yIGNo
YW5nZWFibGUgcGFyZW50IHJhdGUiKQo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1h
c25leUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFu
ZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9hdDkxL2Nsay1w
ZXJpcGhlcmFsLmMgfCA3ICsrKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2F0OTEvY2xr
LXBlcmlwaGVyYWwuYyBiL2RyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+IGluZGV4
IGMxNzNhNDRjODAwYWE4Y2M2OTcwYzI2Njk5NWY0YTYwYjBhMzg1NTQuLjYyOWYwNTBhODU1YWFl
YmZkMWEwM2ZmODdjMmIwMTZjZDIyODRhNWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvYXQ5
MS9jbGstcGVyaXBoZXJhbC5jCj4gKysrIGIvZHJpdmVycy9jbGsvYXQ5MS9jbGstcGVyaXBoZXJh
bC5jCj4gQEAgLTI3OSw4ICsyNzksMTEgQEAgc3RhdGljIGludCBjbGtfc2FtOXg1X3BlcmlwaGVy
YWxfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJbG9uZyBiZXN0X2RpZmYg
PSBMT05HX01JTjsKPiDCoAl1MzIgc2hpZnQ7Cj4gwqAKPiAtCWlmIChwZXJpcGgtPmlkIDwgUEVS
SVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+cmFuZ2UubWF4KQo+IC0JCXJldHVybiBwYXJlbnRf
cmF0ZTsKPiArCWlmIChwZXJpcGgtPmlkIDwgUEVSSVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+
cmFuZ2UubWF4KSB7Cj4gKwkJcmVxLT5yYXRlID0gcGFyZW50X3JhdGU7Cj4gKwo+ICsJCXJldHVy
biAwOwo+ICsJfQo+IMKgCj4gwqAJLyogRmlzdCBzdGVwOiBjaGVjayB0aGUgYXZhaWxhYmxlIGRp
dmlkZXJzLiAqLwo+IMKgCWZvciAoc2hpZnQgPSAwOyBzaGlmdCA8PSBQRVJJUEhFUkFMX01BWF9T
SElGVDsgc2hpZnQrKykgewoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
