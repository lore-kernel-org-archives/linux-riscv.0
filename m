Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33471CA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs0JU0YQO82YgAdqk6tGR+xuiYuTHald9iCu6vzqBUc=; b=dZs6/YNLjlIrDm
	SYMcZqNkctysGkNccYQCxMWKagnb2hvKcE2UOLI4LS7EngtpjYqB0Vcfh+F460zLgQRLardDclCes
	1N6pg+gVu2qZ8X2q9LHeieKogyyrVzYRJmaow80/MYCc21lCITQXhJDMDt5uVP63ouJCZ1xl8sLwY
	I+DOJjkX1V37j5sKdfleTfZl6zRTigWkM2bWiAMV1wd32DmdosgPUwM4YsUKQ0ClUDfXe7iEseAjQ
	OZVfMrTPDmZWLfzob2Xehe23bMNNV4goT3vwzXZpg8N9kWiiJBDl7iQC1zjxVm2XXfJOr8Udbi+L+
	sG8LDutZTCwwLYyNpBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXas-00000008q0o-1xkl;
	Mon, 11 Aug 2025 18:50:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUyt-00000008Jse-2dQF;
	Mon, 11 Aug 2025 16:02:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af968aa2de4so828781066b.1;
        Mon, 11 Aug 2025 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928158; x=1755532958; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
        b=MRD+DvCLJeP7fttyDIkWPyFOCIZUsFlC//ZDhsbeiNttD2elISlYR5LRwFdNJQbcoD
         hVywrSUFrRDxLIaDmxpU2auP6rYKYaPO7ilOVlzpU3LqDXzVQVxhD/C70qsDMtO/g1ve
         lQIhtd7z1YApqB9/bIfo55WcTm49GKC/FeMhihCZ3mDB15PFOT2j2hi4wYgUtO/bdv3M
         loELjujrambdmGfgy/3MzQlBm6A6CM7438KCkf/h8KReFzV3bldl79CQTKSJu2H6Qucn
         QBKk6HaDhXv4pL3hHGgq+6vPKn3bYumhrGr/YV9Afl2AOw9p7k0BwKA5j/O78CDezxzo
         y/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928158; x=1755532958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
        b=hBPenEdyakpdAvCI1Dua8mwu6m8vQH5VM1n6tSTdCYiCVfHboCIjkGvq35l2mIKg7q
         ug6Y1oF3639X4a3LKbcHaVHfcJYqQ6aXeC17EadGzcJjUDQcEnAuZRPhGfUWoDkHKwLI
         ik0XMY3bhCC+pUF6Nz6xZEz98Mst4MI5CJY/bQtAccsy12RYP6sQz0exsrgJXMHiTzxY
         UOhMYfsN5JXOhSSAgjUiqQ4vmKmiY+OhR3EXpFy+mZlxuqAKA6VcppJdlcBHf2OP2ncg
         wN7DBVcX/E3lnYcQVsHyOg67yZ5c3mC/P2BszRGFM2zb1JmoLnDnz8eFu82QMqHbgR3u
         9/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCULw0AlEdxPPrsKDoxVpNJy4kB9FV7VNhk5KOyujky3LaGb6bAHBZghFBghqaFKi57j2NlSq03WbSGyUkPc@lists.infradead.org, AJvYcCW9WIY0Jy93RuCfqQIaAlTnpLLSFadVnSTHAaiPT9mxA+89QCt0wfDvfo95BuqJNZ7qR6RcybIZNP8jyWsHJ1s=@lists.infradead.org, AJvYcCWtt9kGRYg3J0jcLGHrIAD4M+kvHBRnSTOTbabKdYYS1iyj75TfP4sGj83O1FYWWM9eftJlKhiC1MI8mgU=@lists.infradead.org, AJvYcCXG29dXMt1R5FtaG4x7uZKYlfut3J4CaU7nvGHY8T7HPe/rBF5xDcY4rDxw1TXkshdtmJBEt69HmwcTLf19Ra23/Q==@lists.infradead.org, AJvYcCXbBAFQvRSmuaOsiLezhhM/35x0oF1bmUonST61kSNCL/BypNaFMGET8QZgZJ/GUUdnDFi9ogLjPM1aEGJFwjU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3h+htgDW4kL7AocdHOw8YkX37OenmCo98OcwXU7vzNVO6ZLgA
	i9EY8IvjHcKH1sCy+4mfRLO+O8XtstITKaFr/0/YRNhqVhNC/ogQCqMX
X-Gm-Gg: ASbGnctdPFoy/PSfJmAwccU0PMt9/5aLGtW+HRt0Qokcgf/Q9kHdT61nw37zxiKEcxf
	cX6mmcppLpMPsQve5EdUcaUiMEuovEFH1VKUQS3od7iYsVhblScTXzb50TbKQ6lNvRfHmJr9zB5
	zXUHP+A3g0KQ1h4Nj7eTjs4mkZ/iiy9nGVBSGf8mT7W/nvlHxBby3Dty9LQDXUYYetKBBG8xzMu
	nG2TqNrzmV3o8/3wXdUEgOOGzecrUEhe8hA1jFGaJlkpjKWBVQVog9yzEen/EYAbQ3sCS6WH+g7
	Ui2KcbKs5mFKMSGgKmsATrMeAaB5Au8dq9BEjaLc1pVY1k1remyJU9mvdftz/sOqGTwGMi6c3rz
	CUVN4KFFAURJOsG1i+K4MxmzwY+RCM9ZsnJ3acWY=
X-Google-Smtp-Source: AGHT+IFlPGC8RqUZcNmE1sb0v/JytUS2YpnMYnX0fy/68mQiQooD3eH6nJnAu7hadMRuF3cZL/qgqg==
X-Received: by 2002:a17:907:7f1a:b0:ae0:d78a:2366 with SMTP id a640c23a62f3a-af9c63b0a5bmr1282562266b.4.1754928157418;
        Mon, 11 Aug 2025 09:02:37 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm2050387666b.70.2025.08.11.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:02:36 -0700 (PDT)
Message-ID: <dfca56ede9bdd6295f79403bf01fb9913ba95d6c.camel@gmail.com>
Subject: Re: [PATCH 111/114] clk: divider: remove round_rate() in favor of
 determine_rate()
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
Date: Mon, 11 Aug 2025 18:02:33 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090239_667631_FF55D88F 
X-CRM114-Status: GOOD (  17.78  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE5IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoaXMgZHJpdmVyIGltcGxlbWVudHMgYm90aCB0aGUgZGV0ZXJtaW5lX3JhdGUoKSBhbmQgcm91
bmRfcmF0ZSgpIGNsawo+IG9wcywgYW5kIHRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXBy
ZWNhdGVkLiBXaGVuIGJvdGggYXJlIGRlZmluZWQsCj4gY2xrX2NvcmVfZGV0ZXJtaW5lX3JvdW5k
X25vbG9jaygpIGZyb20gdGhlIGNsayBjb3JlIHdpbGwgb25seSB1c2UgdGhlCj4gZGV0ZXJtaW5l
X3JhdGUoKSBjbGsgb3BzLiBBbHNvIGFsbCBjbGsgZHJpdmVycyB0aGF0IGRpcmVjdGx5IGNhbGxz
Cj4gZGl2aWRlcidzIHJvdW5kX3JhdGUoKSBoYXZlIGJlZW4gbWlncmF0ZWQgb3ZlciB0byBkZXRl
cm1pbmVfcmF0ZSgpLiBTbwo+IGxldCdzIHJlbW92ZSB0aGUgcm91bmRfcmF0ZSgpIGNsayBvcHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+CgpS
ZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwu
Y29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMgfCAyMyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIGIvZHJpdmVycy9jbGsvY2xrLWRp
dmlkZXIuYwo+IGluZGV4IGMxZjQyNmI4YTUwNDNjYjVhMWRlMDhlMWRhMzg1OTI4ZWM1NGEyZWQu
LjI2MDFiNjE1NWFmYjczOTFjNmEwZmZiOTFjNThmYTY2Y2RlOTgxOTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVy
LmMKPiBAQCAtNDMxLDI3ICs0MzEsNiBAQCBsb25nIGRpdmlkZXJfcm9fcm91bmRfcmF0ZV9wYXJl
bnQoc3RydWN0IGNsa19odyAqaHcsIHN0cnVjdCBjbGtfaHcgKnBhcmVudCwKPiDCoH0KPiDCoEVY
UE9SVF9TWU1CT0xfR1BMKGRpdmlkZXJfcm9fcm91bmRfcmF0ZV9wYXJlbnQpOwo+IMKgCj4gLXN0
YXRpYyBsb25nIGNsa19kaXZpZGVyX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2ln
bmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2lnbmVkIGxvbmcgKnByYXRlKQo+IC17Cj4gLQlzdHJ1
Y3QgY2xrX2RpdmlkZXIgKmRpdmlkZXIgPSB0b19jbGtfZGl2aWRlcihodyk7Cj4gLQo+IC0JLyog
aWYgcmVhZCBvbmx5LCBqdXN0IHJldHVybiBjdXJyZW50IHZhbHVlICovCj4gLQlpZiAoZGl2aWRl
ci0+ZmxhZ3MgJiBDTEtfRElWSURFUl9SRUFEX09OTFkpIHsKPiAtCQl1MzIgdmFsOwo+IC0KPiAt
CQl2YWwgPSBjbGtfZGl2X3JlYWRsKGRpdmlkZXIpID4+IGRpdmlkZXItPnNoaWZ0Owo+IC0JCXZh
bCAmPSBjbGtfZGl2X21hc2soZGl2aWRlci0+d2lkdGgpOwo+IC0KPiAtCQlyZXR1cm4gZGl2aWRl
cl9yb19yb3VuZF9yYXRlKGh3LCByYXRlLCBwcmF0ZSwgZGl2aWRlci0+dGFibGUsCj4gLQkJCQkJ
wqDCoMKgwqAgZGl2aWRlci0+d2lkdGgsIGRpdmlkZXItPmZsYWdzLAo+IC0JCQkJCcKgwqDCoMKg
IHZhbCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIGRpdmlkZXJfcm91bmRfcmF0ZShodywgcmF0ZSwg
cHJhdGUsIGRpdmlkZXItPnRhYmxlLAo+IC0JCQkJwqAgZGl2aWRlci0+d2lkdGgsIGRpdmlkZXIt
PmZsYWdzKTsKPiAtfQo+IC0KPiDCoHN0YXRpYyBpbnQgY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3Jh
dGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrX3JhdGVf
cmVxdWVzdCAqcmVxKQo+IMKgewo+IEBAIC01MjcsNyArNTA2LDYgQEAgc3RhdGljIGludCBjbGtf
ZGl2aWRlcl9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+
IMKgCj4gwqBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfZGl2aWRlcl9vcHMgPSB7Cj4gwqAJLnJl
Y2FsY19yYXRlID0gY2xrX2RpdmlkZXJfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IGNs
a19kaXZpZGVyX3JvdW5kX3JhdGUsCj4gwqAJLmRldGVybWluZV9yYXRlID0gY2xrX2RpdmlkZXJf
ZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0gY2xrX2RpdmlkZXJfc2V0X3JhdGUsCj4g
wqB9Owo+IEBAIC01MzUsNyArNTEzLDYgQEAgRVhQT1JUX1NZTUJPTF9HUEwoY2xrX2RpdmlkZXJf
b3BzKTsKPiDCoAo+IMKgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2RpdmlkZXJfcm9fb3BzID0g
ewo+IMKgCS5yZWNhbGNfcmF0ZSA9IGNsa19kaXZpZGVyX3JlY2FsY19yYXRlLAo+IC0JLnJvdW5k
X3JhdGUgPSBjbGtfZGl2aWRlcl9yb3VuZF9yYXRlLAo+IMKgCS5kZXRlcm1pbmVfcmF0ZSA9IGNs
a19kaXZpZGVyX2RldGVybWluZV9yYXRlLAo+IMKgfTsKPiDCoEVYUE9SVF9TWU1CT0xfR1BMKGNs
a19kaXZpZGVyX3JvX29wcyk7CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
