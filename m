Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E9CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBSHQKpcMx3fVlJne81oJ1S78aZV1+Pi87C4QaPdJsA=; b=XrafNoM3mxflie
	kQutNYoiJsao85pHbc+uEbzXGct5RZfABqfYf92Mi8+tTbpJ13LWvDAEGYQ7LR+G24WtgjSymS6Xa
	L6a6vT83Edp0lmZMbRKnbx3ZuiGMU+DOYBJm4/xDZ971bMVLC9HqhYtkc2cdsumuChEW6KWdQT0zo
	WgkHj7vQpZYX64JQiVqArTHxs4SvOh0DVK+jS7peoJ37wKKkfMbkltQGgMX+dOdK6uLVnLoCh2jN3
	qr878aqfLTeVsGeMSZjCPnV8+AnYIEp5sl4vw5WUU/Cxtc01bs2s3uD1hHcrF2wmR4FCFe4qIr3QC
	pdnWYi6vAVAY0YqGPMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaae-000000099Gn-2oHg;
	Mon, 11 Aug 2025 22:02:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUkL-00000008FvS-1w7Z;
	Mon, 11 Aug 2025 15:47:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93c3bac8fso641210966b.2;
        Mon, 11 Aug 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927256; x=1755532056; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=P3OBEAesmKK/AeAYSnKQDcMgTRLttj0Zq4jx1a7MEygMhBYhjUU01JdadFeTEEtFFF
         EuGdsn7rU5ybDb5tqcgmiMrHLZ53ihjFn3HhGldK1ImJISfEmh5+lpjerKRzzMxzba3M
         1CvZpJk7BM19XLEN3HvfiJxOEyDZMyBdhIERIstFchsNPY7HvLZz08zirDcwn4K5aOd5
         Hnjm3a8oT82jkbZ+/s8qGzwhu/vrW/6uaUcZOAuATPUg5AMGGkSkFCeU2jhbY+9CM3Aq
         2kA3S8z15WfgofWRQJ0DLWATUc+y15D+0KdQroFFhggmwkUm66M9jErVnEpYJBjNKkcG
         9Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927256; x=1755532056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=XI0qxHJM8n7w6+QYiqf3xdUrzda+aCNJxMd+00NmiKKvZ8uci9AT52snSxPKEZgIzs
         A5sxAWHC1JS26zp1pU+r59rzb4zDET+8hxuAfbIoQ6Pg3mlxzqbGX3Pg/EtpguOMZYaN
         sKy9ESI69U2zbu03hONMneKxvKcLl7VM3noG2jCar58BoYvMq8bTGNDSKZ4NB2mWJ0ZT
         0n4AkFMiiri6qceTgKTbM/ZQgTnb/uta0KyS03RT7kZoC5iaatU7slIsmhYrmSJJzo4Z
         2XfjqgXbjGqaHEYOYk6FXvnv5SxiuzER5+bNKez4HLKYDspTC7i+GfMYsTMBCzxPXxu6
         n68Q==
X-Forwarded-Encrypted: i=1; AJvYcCUThfLbIE4OlSlrxzTCxbaXKBBqffYo0hmsUZl4WR6T2tbim3qP+my2sgrH9ZsDHEztRqk9Wnh/TYBHC4Z71SCSoQ==@lists.infradead.org, AJvYcCUWVxnrQG/1s/Q9WLgExv2cMVw4Cj3OE/3fa9aGKg/VfuP++8vSAcJdqDPr9dYJX7mKEMJrosP4PcVDqejlsp4=@lists.infradead.org, AJvYcCUsTT5jBiBrpb397Gu5mD3YEWFjCZ6PGuvHYQX0n1EiqxmjTZerm2uTMH49tmpd/UgpVtoE0o8+Dnw1rO5LN7o=@lists.infradead.org, AJvYcCVRpbNrciaypS0YUzpUIc3Dl/RJNm/v8YW3JIGAqx9y+OkX2t5R19VzZ5I4xdUe6uAk9MPcYA4l5sHKW4E=@lists.infradead.org, AJvYcCVltQOZSLIncHOKbAQpSYCli00l1jxTQ/CEylKSSkNgFb3wPWcEhYOv+TSBMOs+mEvpOp/mDD6XWgvk7e22@lists.infradead.org
X-Gm-Message-State: AOJu0YyhF+SUdrpYVrvrmtd0kOCRtMgCAkznvjSms35e6CK5YJWaK51+
	vz2HxPBxGh95U4hZGgPsdf8wibkImCGPYm6ewhBF/gST9mfhwGQo1RA4
X-Gm-Gg: ASbGncs4iCn3br6bUa5hGwwnzuC/LUFiO2LP3PvIFlhTxDBcKfc/Xxq8V827hKPJpFL
	XAdunqX4IYKq5dXG2O0UQjtKvEzKNjDxr/BkX7XCB/18LDQsvdi8fqkPk0BPWFeAHiYfppyZ8rS
	DVrlogbiMmsvyHLcI5K3hJcYysQNoKo1Dw+pTU+FJEEPujCqaaqIQ0XjQcrQhiuIeMQS6h/abEw
	DrRlkxVFkvaBFmaGQgd+SHpsIa96i+doGqDRgI2tl+pD4LiGpeGOf4R5LDyGI5Q94dTbb3QjwUe
	bbVQ+uKPtMrQ9ib1zwAi8jWLn80hOyVJJDzUGk5L4FIMhKtfJE1bUFPWj/hL1WSBPwXi5dOzK3T
	70z7aRtGL74+YJsfbgIcO2VqxdeeZgPIkLN9zkek=
X-Google-Smtp-Source: AGHT+IF0QNexCp3wac3HqRrzYFcQwTmRLRgzyDHjNrtoHTrtc/DjgfXz7LJ4ALK6NtSRdUvSvS+HtQ==
X-Received: by 2002:a17:906:9f91:b0:af9:7823:620b with SMTP id a640c23a62f3a-af9c6517c2cmr1234169966b.44.1754927255767;
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm2048822966b.12.2025.08.11.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Message-ID: <597d4a777a13c2b67effaf5ba32959710d2f58f8.camel@gmail.com>
Subject: Re: [PATCH 047/114] clk: sophgo: cv18xx-ip: convert from
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
Date: Mon, 11 Aug 2025 17:47:31 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084737_503892_27734A6A 
X-CRM114-Status: GOOD (  16.63  )
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
b20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5A
Z21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmMg
fCAxMCArKysrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4
eC1pcC5jIGIvZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4eHgtaXAuYwo+IGluZGV4IGIxODZl
NjRkNDgxM2UyNzAxYjE3NTIwZTU0NGM0NTNmYzEzZDBlNzcuLmMyYjU4ZmFmMDkzOGI3ZDUzN2Rj
M2E4MWFlZjU5YzU0OWI5YzljNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc29waGdvL2Ns
ay1jdjE4eHgtaXAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmMK
PiBAQCAtNDUsMTAgKzQ1LDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGdhdGVfcmVjYWxjX3Jh
dGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJuIHBhcmVudF9yYXRlOwo+IMKgfQo+IMKg
Cj4gLXN0YXRpYyBsb25nIGdhdGVfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWdu
ZWQgbG9uZyByYXRlLAo+IC0JCQnCoMKgwqAgdW5zaWduZWQgbG9uZyAqcGFyZW50X3JhdGUpCj4g
K3N0YXRpYyBpbnQgZ2F0ZV9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJ
wqDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gwqB7Cj4gLQlyZXR1
cm4gKnBhcmVudF9yYXRlOwo+ICsJcmVxLT5yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+
ICsKPiArCXJldHVybiAwOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IGdhdGVfc2V0X3JhdGUo
c3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiBAQCAtNjMsNyArNjUsNyBA
QCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjdjE4MDBfY2xrX2dhdGVfb3BzID0gewo+IMKgCS5pc19l
bmFibGVkID0gZ2F0ZV9pc19lbmFibGVkLAo+IMKgCj4gwqAJLnJlY2FsY19yYXRlID0gZ2F0ZV9y
ZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gZ2F0ZV9yb3VuZF9yYXRlLAo+ICsJLmRldGVy
bWluZV9yYXRlID0gZ2F0ZV9kZXRlcm1pbmVfcmF0ZSwKPiDCoAkuc2V0X3JhdGUgPSBnYXRlX3Nl
dF9yYXRlLAo+IMKgfTsKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
