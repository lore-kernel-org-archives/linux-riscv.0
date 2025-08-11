Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B40CA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuoOPGn5jgqbTPbfmqwi1oVclD1koyHcnl+2G/v7pKA=; b=JR+VCjgMr/mn1p
	d8ODARjnIlLK1oUbOoUKcblRfZCyiwXEW1qAUN3sgN81xVu+BhJIXLi7psBhuGAhA4UAPpXuVi/Nu
	/um6Xip+FTDhin1UArZyZQZAS2VB1V0Q6GofwwftFQ3imSHBi0RLuAjhHNJc1s+NKVhEGJjmpfyaq
	uwq01FBvhU5NH7rP/rTNYiJz4MI09KzGZgQ/kjcfa5Kabe19dkoIctEt6qCsfalLOJgju3OURLm+2
	KiBc/8krPLoW67SI9WcvRHODXwTAuHaJiLELZnfDev8accIKPwsAYIqS1Fhi+VdOkBhK+wEVQj5XW
	3grPP9nDYMhiQeJIPEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbjz-00000009LsE-1xXT;
	Mon, 11 Aug 2025 23:15:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUip-00000008Fgv-2zwG;
	Mon, 11 Aug 2025 15:46:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so4216446a12.2;
        Mon, 11 Aug 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927162; x=1755531962; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=MnYY+41GSK6v45q93muDG2a+PinBtAv/IeS7atZ3ZvzLjtNvkskaHy6XWeHppYanFx
         h1IKzgDzlxNl5wFWJf0LSyNhc+lpeMVSkZR6Kk/mrECQ6SIuKtSoy3UFKf3t0lth77W3
         +aFebRwmdIzqfIE9H9WL1qhSTRyBIkyfCJrCGgto5zggdXugFij2HhFRbrHepuyfeNMa
         VV/pDMIzw9jXPkAuj5pfexaQhIg5vrUW6hEPx9oSr9sNzDKn6FOoiBOzRzIHbIhPPILu
         EAKA0snSfyVtJnkwRFAXF+3s2ChR8l8+NYQBxUwS8V1m4eSVlJ/EUbLgqitVTCHLIX90
         IGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927162; x=1755531962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=nrpdTcY3dOL2WOUU8vjlPJBeWPtIEa1faB1QQCLo5oPbx6b/FB3ZYK6RroxfQv4Abw
         QsW6QJu6rIXsmsJsyQzoAqeEArldbK2tfsKG5FvqW9jIlfQlzMYGTnTSQwIqsrvGK/rc
         GUx4ZmqBp9d9amvp5n52xqPz5+KibMUMhaHplvymTjzYWlu0e6ASQ1FmOksyGqGDviR6
         Aidt0d6IP+SNGpp4sAaVda4MhOZeiGioEgSv93e/PYwEQwHs06pcf3X5qs8NSKD5xU4C
         UOZLwOft390rqVUZhDq5xtUKtWe4HlGTv+XCQ5buMJD2fBp8hrORWjvxk48PaO+u0uKh
         cFTg==
X-Forwarded-Encrypted: i=1; AJvYcCUK0QR2Y2Q0LwWhoZgvPkwiVhoWlb6PLik76IM7KZXYDqIgzkFekt45CpYgodpLaIMP7XLtvcmieSUje+9B@lists.infradead.org, AJvYcCUg125Lds7AJQyQPCWcrnSdny0t7OMtyMlIFYDkH4uJXK6bz1cYkBT2e3BYvAGgJ0uDN1OJKDZL4J2vYaOPjx8ufA==@lists.infradead.org, AJvYcCWM8VLTudSZS/CiU61uDhQS92+TtmWXr2ibdz44O2LTwGv5i1xlX9B/e33UNivfAkvttqd95pS765wAgOW+UdM=@lists.infradead.org, AJvYcCWxSt+WkbfP2/ON5l5MkUskere8DsaTpDxgt7zdYVmfuKTvht6veGTozifHi9cm3h4M7a5xSGacUmcAsCyeP1o=@lists.infradead.org, AJvYcCXF+Mn+AQ9g3OYnegsvEucxjKR37UHd8Yf+61cqnmm2f2XBSN9TPlJ6V8ZaUpvDmXM+yJs5CV11TKFUWa0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPlKsYKwiVuStkLNW/znaC80jiGjQZQHeBd81jM0tEzXgGU73
	iuMMAHyw32nANEIWTEo5LWZ2YtR2LeSTj58UMx7E7iAGOK22uyga+74a
X-Gm-Gg: ASbGncu7zGUc0b4q3ocGpxR+8IJqtOQTE2Elm0xDuuUr2vErLBWBZ1kZlJhoo5yp2qH
	P0LbJ1+z+wRCqrON+C3vGz6XttrxgDTgkIX6bIuXeerk8WiL6l2NGaYHk3jYSEOASIR9CY6lGJB
	h5efLrqcvsNMEj58VtTpbDrMgQ/KsheKkvNpNH/cb/RffP8rDdc3CYKcfiJfI/GyXBUWsfapDCb
	qmwh4kwd5ti4fB88kcuR6Sw90o1MbaQZksIM2zDorfmYGEQwEamOl2ZESieD+6YBaN92R7wFUSv
	j72oUcgxyJzLUvN+QPgVX11Acvxwa4YC1tKZsc+jyUvWHD0p+zDTEYNc4o+Ge6uwy75SOvG0ESQ
	0XrMZcZoPbAsEUHXM8e8b0yiDlKhqLBndMFkL138=
X-Google-Smtp-Source: AGHT+IGKOhTznscGhTdRt3W/yuNZg42+gjVjgTXKMoiUalIdY18fOpSzUHq5EIPnFUdAaOuOrYQZJA==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr11886624a12.19.1754927161809;
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f25739sm18957452a12.21.2025.08.11.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Message-ID: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
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
Date: Mon, 11 Aug 2025 17:45:57 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084603_764073_E34E4CB2 
X-CRM114-Status: GOOD (  17.35  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE4IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5j
b20+Cj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi1jbGtnZW4uYyB8IDE3
ICsrKysrKysrKy0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNn
MjA0Mi1jbGtnZW4uYyBiL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLWNsa2dlbi5jCj4g
aW5kZXggOWU2MTI4OGQzNGYzNzU3MzE1NzAyYzM1NWYyNjY5NTc3YjI5Njc2Zi4uMWQzYjE2NTZi
Y2YyZTY2NTVlMDI5OWU2OGFiMzlmMzIxODk3NDRkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Ns
ay9zb3BoZ28vY2xrLXNnMjA0Mi1jbGtnZW4uYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NvcGhnby9j
bGstc2cyMDQyLWNsa2dlbi5jCj4gQEAgLTE3Niw5ICsxNzYsOCBAQCBzdGF0aWMgdW5zaWduZWQg
bG9uZyBzZzIwNDJfY2xrX2RpdmlkZXJfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4g
wqAJcmV0dXJuIHJldF9yYXRlOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHNnMjA0Ml9jbGtf
ZGl2aWRlcl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJCcKgIHVuc2lnbmVk
IGxvbmcgcmF0ZSwKPiAtCQkJCQnCoCB1bnNpZ25lZCBsb25nICpwcmF0ZSkKPiArc3RhdGljIGlu
dCBzZzIwNDJfY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4g
KwkJCQkJwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoAlz
dHJ1Y3Qgc2cyMDQyX2RpdmlkZXJfY2xvY2sgKmRpdmlkZXIgPSB0b19zZzIwNDJfY2xrX2Rpdmlk
ZXIoaHcpOwo+IMKgCXVuc2lnbmVkIGxvbmcgcmV0X3JhdGU7Cj4gQEAgLTE5MiwxNSArMTkxLDE3
IEBAIHN0YXRpYyBsb25nIHNnMjA0Ml9jbGtfZGl2aWRlcl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+IMKgCQkJYmVzdGRpdiA9IHJlYWRsKGRpdmlkZXItPnJlZykgPj4gZGl2aWRlci0+
c2hpZnQ7Cj4gwqAJCQliZXN0ZGl2ICY9IGNsa19kaXZfbWFzayhkaXZpZGVyLT53aWR0aCk7Cj4g
wqAJCX0KPiAtCQlyZXRfcmF0ZSA9IERJVl9ST1VORF9VUF9VTEwoKHU2NCkqcHJhdGUsIGJlc3Rk
aXYpOwo+ICsJCXJldF9yYXRlID0gRElWX1JPVU5EX1VQX1VMTCgodTY0KSomcmVxLT5iZXN0X3Bh
cmVudF9yYXRlLCBiZXN0ZGl2KTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eCk1heSAiKiYiIGJlIHJlZHVuZGFuZD8KCgo+IMKgCX0gZWxzZSB7Cj4g
LQkJcmV0X3JhdGUgPSBkaXZpZGVyX3JvdW5kX3JhdGUoaHcsIHJhdGUsIHByYXRlLCBOVUxMLAo+
ICsJCXJldF9yYXRlID0gZGl2aWRlcl9yb3VuZF9yYXRlKGh3LCByZXEtPnJhdGUsICZyZXEtPmJl
c3RfcGFyZW50X3JhdGUsIE5VTEwsCj4gwqAJCQkJCcKgwqDCoMKgwqAgZGl2aWRlci0+d2lkdGgs
IGRpdmlkZXItPmRpdl9mbGFncyk7Cj4gwqAJfQo+IMKgCj4gwqAJcHJfZGVidWcoIi0tPiAlczog
ZGl2aWRlcl9yb3VuZF9yYXRlOiB2YWwgPSAlbGRcbiIsCj4gwqAJCSBjbGtfaHdfZ2V0X25hbWUo
aHcpLCByZXRfcmF0ZSk7Cj4gLQlyZXR1cm4gcmV0X3JhdGU7Cj4gKwlyZXEtPnJhdGUgPSByZXRf
cmF0ZTsKPiArCj4gKwlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIGludCBzZzIwNDJf
Y2xrX2RpdmlkZXJfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gQEAgLTI1OCwxMyArMjU5
LDEzIEBAIHN0YXRpYyBpbnQgc2cyMDQyX2Nsa19kaXZpZGVyX3NldF9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+IMKgCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgc2cyMDQyX2Nsa19k
aXZpZGVyX29wcyA9IHsKPiDCoAkucmVjYWxjX3JhdGUgPSBzZzIwNDJfY2xrX2RpdmlkZXJfcmVj
YWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9yb3VuZF9yYXRl
LAo+ICsJLmRldGVybWluZV9yYXRlID0gc2cyMDQyX2Nsa19kaXZpZGVyX2RldGVybWluZV9yYXRl
LAo+IMKgCS5zZXRfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9zZXRfcmF0ZSwKPiDCoH07Cj4g
wqAKPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBzZzIwNDJfY2xrX2RpdmlkZXJfcm9f
b3BzID0gewo+IMKgCS5yZWNhbGNfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9yZWNhbGNfcmF0
ZSwKPiAtCS5yb3VuZF9yYXRlID0gc2cyMDQyX2Nsa19kaXZpZGVyX3JvdW5kX3JhdGUsCj4gKwku
ZGV0ZXJtaW5lX3JhdGUgPSBzZzIwNDJfY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3JhdGUsCj4gwqB9
OwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
