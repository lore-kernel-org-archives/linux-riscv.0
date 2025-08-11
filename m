Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA879CA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkQDxcUsTU/OJxBqLUY49X0BW0X9GTf9gavLQ9G/g0w=; b=Fk+CvTkC33fQYR
	zREwynp9yEUO0KUaZ4YneQKKvlgUEwVYOLcayReO0TzF8Xn7DTRGj8+14SCf7JGHye8PlJmzoDpYr
	AXlLIxGXu7RD97Mu0qk3tGoVrj5w0a0LeTH5f5tz+gBcNQyKndbSqLMoG3ge+gLYkINVftX4zPdBE
	wlOiDzTZyCw44ievCZ3u/uuzkp3fEBgN2iwDG88KT/7Ie77Jrbhn1vNnBy3SkQ/28FNFPu42GMUoa
	Zhxl5rPgDZKlD1jCGcYbdaJ91ysuJp1gfvGHKRR4QYi3vbeeiVTxfDGcBTHW9v5Tb9Y9emns3OeWF
	2UAe9W0LcnKalg4D1Ekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXNU-00000008np5-0DsZ;
	Mon, 11 Aug 2025 18:36:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUb6-00000008E09-0fPO;
	Mon, 11 Aug 2025 15:38:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af9a25f091fso603819666b.0;
        Mon, 11 Aug 2025 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926683; x=1755531483; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
        b=m1hZ6leXpACCmUxqIu4P8B9d9f/0pktLEvqQUWWBzVvp9n343KZU3w8pBG7+D4OECg
         Ji4TPlLBHifgdp/kJziMolq8rASbKqpvcoTGxXn+lBe21fnbUYGRZkauD8uYm2ksHQRE
         zQnzG9EDNSj5qd3XQRkh7uXcwF1CSEKVMNOhjvYGXHOgidG9xaJr1h1y0lzwl6ND7smn
         KFhdrntKu3G1HUC/WFSJx68A5Zc0wzo83uNqHSmI4lqO7kS6Ul+KGmJ8/eZzS3wOokTS
         d9+m0+lFoRn5oHvWHt2E47D6WPF+8e5nYaxwkfzqpRJ39aynKCfEukScUJrW2yjsl67d
         UGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926683; x=1755531483;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
        b=ioYMuV0DMzhuMuAZNT27BNb+lWS90cs2DzNIppvB9tT/VQhV1bcn6gpAmHo6K28GSr
         w++++Y6TKpz5wA2sOLO5/nLqwApyzYPwKvE7ekzyEgEHyMUr2/Kh84HTskX75r1IRu5K
         8wViPqIWjt0uh2Nh9y26OcmqRO8dCzWZukzwtm8uEkn3Lekh9MUVIOXR5Pm0qTGjENh5
         OZH7ZqHSQGAqeBlNQ2uUQ2CMRihemn6hwLs6VqiWmBn8BDgItqUJb+8qum0VsKokIlMA
         3z0SB/wYD1ckIyty9P+tz6OdAf+TB4L+0xHCeL31Brxu83TlwViHkVRjeT6TYJFMuJi6
         ofgw==
X-Forwarded-Encrypted: i=1; AJvYcCUkeO+NayxBPrMFRv4XAAv2zjKfXqEnQvTsycNGbzAZdm5nt/LvGMvtlEWTm/JFrgMidnTvObpC1vcPIro=@lists.infradead.org, AJvYcCUn7Cj8pDpb18us7UzWjkymz1t/9zqs+t8qtBcvZnWJLzior4PGgV+fn0939bFYq7/LNYVBiwi7YXeeNoqBMUo=@lists.infradead.org, AJvYcCVfiHzDdRK/+fpNobhC0MaFqHJK7UEDBksex0QQR1vhi2bP5ikLZS2GdztfiX5Kj/rYWdb09vSLaX2A9BGiscVVyQ==@lists.infradead.org, AJvYcCWhrX7vqZ/zxb1m2IZ3so6OOi/yo0zFetyOD8ssTd0/gnrwIIdcUqjkbxBE3nV4dxbmRAMS8RvZ/jwId8vucqI=@lists.infradead.org, AJvYcCXlOzYV9iLtQXGiHdUMs9NI0K9KzMPspnzUySnfBuTL4EJlM/+ipAZPk+dtXrT2YTRVP4s5C9sBRnSFHq6N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy29rh+CEEtNxNN1lmQMiOD4+d96/TzazPsfNgIHIrgOCS/XfKk
	KjG7Tr1GjNQmkViKna/tv9tSgyOVc7n+r5zDhuXodaAJA53/4hPsK8f/
X-Gm-Gg: ASbGncvsiua9U4FoBmwypiJHN1Zy6ruXkPcIiGe4BD4BWq8gYQJWPKfQYjsNfR17e8R
	bjR8EQkI+y2/vrWaS4KF6N1uHaM5WS+PNknjz8V7MzH+9YIYUF9NNyjElJGwQ415rTWzOgB8P4K
	AHCt3lC9kEPfB9UDcBElqNCuRbZ+qEQsBTXrIIvLXPHHsUzM1sWXM3przH+iUGgWjv4dR4JH484
	6qLG9G0zdFZIB4Bm4NCVEMr+oU6/3fiLAefr/LoTCCVMefJlA818MLhaOUlF8B9S+W/DMicn8qQ
	TZS2ykIK3t/zccBb116ioZIySlom5iTd1KAaJrv36WKoSJSM36Yy8PKbCEQwz4zevPzOiJLXUB/
	ON7QnY/Wh1wcCGV5HJWFzrg29MSkV79wuDpsNULA=
X-Google-Smtp-Source: AGHT+IHSK7yv3/D8orY0Pvy2Zzp8DcIZ6EslOLXmLH2atPhWs8y14U6F2aebL6rKGw4mDoY3DumHmw==
X-Received: by 2002:a17:907:7ea8:b0:af9:8c1c:b9be with SMTP id a640c23a62f3a-af9c645d565mr1274686466b.14.1754926682117;
        Mon, 11 Aug 2025 08:38:02 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm2032301266b.117.2025.08.11.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:38:01 -0700 (PDT)
Message-ID: <84788b3be1d340f7a085c0d2a5903fd1032dd9eb.camel@gmail.com>
Subject: Re: [PATCH 114/114] clk: fixed-factor: drop round_rate() clk ops
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
Date: Mon, 11 Aug 2025 17:37:58 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083804_198763_CE7F4187 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgQnJpYW4hCgpPbiBNb24sIDIwMjUtMDgtMTEgYXQgMTE6MTkgLTA0MDAsIEJyaWFuIE1hc25l
eSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhh
dC5jb20+Cj4gCj4gVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBib3RoIHRoZSBkZXRlcm1pbmVfcmF0
ZSgpIGFuZCByb3VuZF9yYXRlKCkgY2xrCj4gb3BzLCBhbmQgdGhlIHJvdW5kX3JhdGUoKSBjbGsg
b3BzIGlzIGRlcHJlY2F0ZWQuIFdoZW4gYm90aCBhcmUgZGVmaW5lZCwKPiBjbGtfY29yZV9kZXRl
cm1pbmVfcm91bmRfbm9sb2NrKCkgZnJvbSB0aGUgY2xrIGNvcmUgd2lsbCBvbmx5IHVzZSB0aGUK
PiBkZXRlcm1pbmVfcmF0ZSgpIGNsayBvcHMuIEFsc28gYWxsIGNsayBkcml2ZXJzIHRoYXQgZGly
ZWN0bHkgY2FsbHMKPiBmaXhlZC1mYWN0b3IncyByb3VuZF9yYXRlKCkgaGF2ZSBiZWVuIG1pZ3Jh
dGVkIG92ZXIgdG8gZGV0ZXJtaW5lX3JhdGUoKS4KPiBTbyBsZXQncyByZW1vdmUgdGhlIHJvdW5k
X3JhdGUoKSBjbGsgb3BzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1hc25l
eUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVy
LnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9jbGstZml4ZWQtZmFj
dG9yLmMgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0b3IuYyBi
L2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0b3IuYwo+IGluZGV4IDc5YjlhOGM1N2Q0Yjg0YmU5
OTA5NTVkOGJjMzE1OWI4MThmMzhkNTAuLmRlNjU4YzllNGM1Mzg2YTdhOGQyMjA3NDMyMjU3N2Uw
ZTllZmQyYjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCj4g
KysrIGIvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCj4gQEAgLTQ3LDIxICs0Nyw2IEBA
IHN0YXRpYyBpbnQgY2xrX2ZhY3Rvcl9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywK
PiDCoAlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBjbGtfZmFjdG9yX3JvdW5k
X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2ln
bmVkIGxvbmcgKnByYXRlKQo+IC17Cj4gLQlzdHJ1Y3QgY2xrX2ZpeGVkX2ZhY3RvciAqZml4ID0g
dG9fY2xrX2ZpeGVkX2ZhY3Rvcihodyk7Cj4gLQo+IC0JaWYgKGNsa19od19nZXRfZmxhZ3MoaHcp
ICYgQ0xLX1NFVF9SQVRFX1BBUkVOVCkgewo+IC0JCXVuc2lnbmVkIGxvbmcgYmVzdF9wYXJlbnQ7
Cj4gLQo+IC0JCWJlc3RfcGFyZW50ID0gKHJhdGUgLyBmaXgtPm11bHQpICogZml4LT5kaXY7Cj4g
LQkJKnByYXRlID0gY2xrX2h3X3JvdW5kX3JhdGUoY2xrX2h3X2dldF9wYXJlbnQoaHcpLCBiZXN0
X3BhcmVudCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuICgqcHJhdGUgLyBmaXgtPmRpdikgKiBmaXgt
Pm11bHQ7Cj4gLX0KPiAtCj4gwqBzdGF0aWMgaW50IGNsa19mYWN0b3Jfc2V0X3JhdGUoc3RydWN0
IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiDCoAkJCQl1bnNpZ25lZCBsb25nIHBh
cmVudF9yYXRlKQo+IMKgewo+IEBAIC04Nyw3ICs3Miw2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGNsa19mYWN0b3JfcmVjYWxjX2FjY3VyYWN5KHN0cnVjdCBjbGtfaHcgKmh3LAo+IMKgCj4gwqBj
b25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfZml4ZWRfZmFjdG9yX29wcyA9IHsKPiDCoAkuZGV0ZXJt
aW5lX3JhdGUgPSBjbGtfZmFjdG9yX2RldGVybWluZV9yYXRlLAo+IC0JLnJvdW5kX3JhdGUgPSBj
bGtfZmFjdG9yX3JvdW5kX3JhdGUsCj4gwqAJLnNldF9yYXRlID0gY2xrX2ZhY3Rvcl9zZXRfcmF0
ZSwKPiDCoAkucmVjYWxjX3JhdGUgPSBjbGtfZmFjdG9yX3JlY2FsY19yYXRlLAo+IMKgCS5yZWNh
bGNfYWNjdXJhY3kgPSBjbGtfZmFjdG9yX3JlY2FsY19hY2N1cmFjeSwKCi0tIApBbGV4YW5kZXIg
U3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
