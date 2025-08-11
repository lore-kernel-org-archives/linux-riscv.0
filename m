Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB9ACA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgmZ8BBqBuaKhrsyru5CyTviGvO9Lz9Vgx/OYHuoFWo=; b=Oi6I4IqH2HttPH
	pxTPmaOvrUvlfohYJ/kqd/zabunsltoipcMCnQ7hzJwc0Y+tCV2BUQue9fMdxKwTzmrZS5EPdiQMJ
	uIag0wPBdwloT5lBFlSrzHPTSUhHjJztEedB7pjDgfqb9UKc1/jnQyRqPkAGXAViREFBAMQKXbsmz
	v2M5DtQD8Up+MjqoVuMeytQ4AeB//UKkRi1TDzwo3Q9zSZ3w5tULzZsRjV3zRiIQCLAY2IHBqOrwu
	W5aS9o0uPd1wnRc9dNbotSBQC4rVqUlBCh9kcT63DmBUXSJLWNQDeAQsGFQAm/wlYYUZ/einLS/Ds
	Agq7IcBtibXt1++VmmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVf-00000008p3t-3KTB;
	Mon, 11 Aug 2025 18:44:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUxA-00000008JUr-2spw;
	Mon, 11 Aug 2025 16:00:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af937728c3eso867602366b.0;
        Mon, 11 Aug 2025 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928051; x=1755532851; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=VnJ02d7tNH6HMr5V5N3VC1i8fat5VWxW1gdLy+TpQQuO1WmMApdO3I6O48uIkMFHND
         v7eOv8szHLuvIN+GOYY51TfIGmGnRaTJaTpdfXvdkU9+b4CgILEoJeRfNnGC6s0Rqoau
         Yaq8L5ly//qpQ/r16b7KWl+UxQ1JsLFA95tHomdhIWVj/kcL+16rNHZOT01u1M0k1KdW
         kQSfFhj7o/nv6HG0jNgA3wdj0VDGy3866HgwLlCP20by0u8nBF+2LSwP8LCWQlNuOHCv
         0nYO7+z6Gy4iRSgrTeKKocyh7xNUxkmor/4CXa6MfnQGvY55m0fWWFhYy3brWfSlNAH8
         2E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928051; x=1755532851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=a4kNvaMzB79/tOlOO3ECny7gKDx1UoDdNIZ8yXrAWeIpmJBbc+Fe2gh2szNz9zrqEq
         cjitLfSbyu2Zu3P3MQB2sdOm1Z53ZMD7cSRb0bTXj3+/AyPNPG70CgwhwMtpESjfZN2/
         W0q62/CCayVOZnhUdnn1ThibHSiua8R8Ed11qT1AEEHml/VNeJwuDkIBQ20Gn31r30OM
         uTjT7Bfit58EQ78yANWt/3OloGVZLTFORlhkepDXOp/abNyKwEW1hYRhmf1vk2eG0JSk
         L1JzLfYo9iDQcUqkzw8eyqy/SUSRCEVJrJb96WAKj3EAQ0YBOFuwGPuLDdk3VRdRqesQ
         ZNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUlVDI+X2MjgXPu0FV2pCIiJR+TpjYy3I4cKLlqxd/wC5QUf/vuJx8zZw30+sogKoUJA1sBwYXtu6e8tmv2@lists.infradead.org, AJvYcCV94W8+C9rHO253EBp4KTH3CxvhqxkWQQ+X1uHz4dmEfCZpQzY+rbOZzN3qN9WczXURmPCTZo7xTXlm/qQ=@lists.infradead.org, AJvYcCV9HoSR3IPLbw7yVMCA77cY9M/pkTRefc7ei/E/lyUxxsHLr148UDgMmTzqewIhrsP+hqDcAD5DpPk/dvgkIKo=@lists.infradead.org, AJvYcCWv445W64HjOJhzhP4CdXnoi6QinPgl/Wr0doeYxjms3Ix/8TVVwH58v38MjPfAKZ7UEOWNsworld0QW1CyY/k=@lists.infradead.org, AJvYcCXohFReYcQY8LlIcaxiHqTtizH2WDORReSzhpQypa7rHwXP19GDt6esg2qVV7HXurgUKjt8rXrKGpJpl+095ON/1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG7CaWqFohVxXhO8F7rcFq9uhJFeP+tj87V7DvAlD+M5vi4xWO
	fiYNgQ+H2DmIgBYhbNZMLIAdRq6s0EqkJSFO2ffI3KmJhm7dFi2zQX9D
X-Gm-Gg: ASbGncsylB6mdvmNlRwEzUlgZJp3OHctjKPIp0wru6E23tw86G88GNrbEEDRo+JObcx
	Ga2X1MbLfRsvkHbG9p8yRhcRE3d0GXiddf1CORP0f4Fdh34hHvx/JP8CQcUml3DCu4zIVHTr1A4
	5Qj2rA8mzIZHYZyWPfHYlu4u67brceQX0Yz9qpx+ooj5Bk2QYMFQxWbvdJlwQtxEEPuYzp7d9xO
	7ig8qpLaY/8YuEUWGfVJSy4UAJIAdbpypCDPBoxCU6yWEBqRAQF+xV1FYpRCi+Djz0paZ6UOdYG
	W9SooajRvqUyV5rb7F+eQRH/n92xxBlBU4JxPT0mePPi/U95frATJcPjgKSazKvAzaD/ztWc3dA
	vJmBsxjWB1gl43uRHe7bRqM0KDHzO/B+xlLteWwQ48yWRseKp6g==
X-Google-Smtp-Source: AGHT+IGh6yl4CupkZ+bbkqrg8mnCZBWOoNaEnJApexkC1cSCi5mW8bJYL756B85cuxjEowuHPJgNRQ==
X-Received: by 2002:a17:907:9486:b0:af2:31a9:c981 with SMTP id a640c23a62f3a-afa1d7233bdmr11410366b.23.1754928050948;
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07643asm2049410666b.15.2025.08.11.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Message-ID: <c7f1fb05a6b7703ab18770bb5b58af0c58154f1f.camel@gmail.com>
Subject: Re: [PATCH 002/114] clk: at91: peripheral: convert from
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
Date: Mon, 11 Aug 2025 18:00:47 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090052_731949_56C58BED 
X-CRM114-Status: GOOD (  25.46  )
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
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gVGhpcyBkcml2ZXIgYWxyZWFkeSBoYXMgYSBjbGtfc2FtOXg1X3BlcmlwaGVy
YWxfZGV0ZXJtaW5lX3JhdGUoKQo+IGltcGxlbWVudGF0aW9uLCBob3dldmVyIGl0IGNhbiBjaGFu
Z2UgdGhlIHBhcmVudCByYXRlLiBUaGUgZXhpc3RpbmcKPiByb3VuZCByYXRlIGRvZXMgbm90IGhh
dmUgdGhpcyBmdW5jdGlvbmFsaXR5LiBJIGNvdWxkIGFkZCBhIGNoZWNrCj4gZm9yIENMS19TRVRf
UkFURV9QQVJFTlQsIGFuZCBjb21iaW5lIHRoZSB0d28gZnVuY3Rpb25zLCBob3dldmVyIHRoZXJl
Cj4gYXJlIHNvbWUgb3RoZXIgbWlub3IgZGlmZmVyZW5jZXMgaW4gdGhlIHR3byBpbXBsZW1lbnRh
dGlvbnMuIEkgZG9uJ3QKPiBoYXZlIGFjY2VzcyB0byB0aGlzIHBhcnRpY3VsYXIgaGFyZHdhcmUu
IEkgYmVsaWV2ZSB0aGF0IHRoZXkgY291bGQKPiBiZSBjb21iaW5lZCwgaG93ZXZlciBpdCB3b3Vs
ZCBuZWVkIHRvIGJlIHRlc3RlZCBvbiByZWFsIGhhcmR3YXJlLgo+IFNvLCBsZXQncyBwbGF5IGl0
IHNhZmUgYW5kIGNvbnZlcnQgdGhlIGV4aXN0aW5nIHJvdW5kIHJhdGUKPiBpbXBsZW1lbnRhdGlv
biB0byBlbnN1cmUgdGhhdCB0aGUgZHJpdmVyIGtlZXBzIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkK
PiBhcyBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJl
ZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3Zl
cmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVy
YWwuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9hdDkxL2Nsay1wZXJpcGhlcmFsLmMgYi9kcml2ZXJzL2Nsay9h
dDkxL2Nsay1wZXJpcGhlcmFsLmMKPiBpbmRleCA2MjlmMDUwYTg1NWFhZWJmZDFhMDNmZjg3YzJi
MDE2Y2QyMjg0YTVhLi5lNzAwZjQwZmQ4N2Y5MzI3MzY1ZjI1MDM2NmY3ZjdiZGUwMWY1OTg3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+ICsrKyBiL2Ry
aXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+IEBAIC0zMzUsNTAgKzMzNSw1NyBAQCBz
dGF0aWMgaW50IGNsa19zYW05eDVfcGVyaXBoZXJhbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xr
X2h3ICpodywKPiDCoAlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBjbGtfc2Ft
OXg1X3BlcmlwaGVyYWxfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiAtCQkJCQnCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gLQkJCQkJwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAq
cGFyZW50X3JhdGUpCj4gK3N0YXRpYyBpbnQgY2xrX3NhbTl4NV9wZXJpcGhlcmFsX25vX3BhcmVu
dF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJCQkJCcKgIHN0cnVjdCBj
bGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gwqB7Cj4gwqAJaW50IHNoaWZ0ID0gMDsKPiDCoAl1bnNp
Z25lZCBsb25nIGJlc3RfcmF0ZTsKPiDCoAl1bnNpZ25lZCBsb25nIGJlc3RfZGlmZjsKPiAtCXVu
c2lnbmVkIGxvbmcgY3VyX3JhdGUgPSAqcGFyZW50X3JhdGU7Cj4gKwl1bnNpZ25lZCBsb25nIGN1
cl9yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+IMKgCXVuc2lnbmVkIGxvbmcgY3VyX2Rp
ZmY7Cj4gwqAJc3RydWN0IGNsa19zYW05eDVfcGVyaXBoZXJhbCAqcGVyaXBoID0gdG9fY2xrX3Nh
bTl4NV9wZXJpcGhlcmFsKGh3KTsKPiDCoAo+IC0JaWYgKHBlcmlwaC0+aWQgPCBQRVJJUEhFUkFM
X0lEX01JTiB8fCAhcGVyaXBoLT5yYW5nZS5tYXgpCj4gLQkJcmV0dXJuICpwYXJlbnRfcmF0ZTsK
PiArCWlmIChwZXJpcGgtPmlkIDwgUEVSSVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+cmFuZ2Uu
bWF4KSB7Cj4gKwkJcmVxLT5yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+ICsKPiArCQly
ZXR1cm4gMDsKPiArCX0KPiDCoAo+IMKgCWlmIChwZXJpcGgtPnJhbmdlLm1heCkgewo+IMKgCQlm
b3IgKDsgc2hpZnQgPD0gUEVSSVBIRVJBTF9NQVhfU0hJRlQ7IHNoaWZ0KyspIHsKPiAtCQkJY3Vy
X3JhdGUgPSAqcGFyZW50X3JhdGUgPj4gc2hpZnQ7Cj4gKwkJCWN1cl9yYXRlID0gcmVxLT5iZXN0
X3BhcmVudF9yYXRlID4+IHNoaWZ0Owo+IMKgCQkJaWYgKGN1cl9yYXRlIDw9IHBlcmlwaC0+cmFu
Z2UubWF4KQo+IMKgCQkJCWJyZWFrOwo+IMKgCQl9Cj4gwqAJfQo+IMKgCj4gLQlpZiAocmF0ZSA+
PSBjdXJfcmF0ZSkKPiAtCQlyZXR1cm4gY3VyX3JhdGU7Cj4gKwlpZiAocmVxLT5yYXRlID49IGN1
cl9yYXRlKSB7Cj4gKwkJcmVxLT5yYXRlID0gY3VyX3JhdGU7Cj4gKwo+ICsJCXJldHVybiAwOwo+
ICsJfQo+IMKgCj4gLQliZXN0X2RpZmYgPSBjdXJfcmF0ZSAtIHJhdGU7Cj4gKwliZXN0X2RpZmYg
PSBjdXJfcmF0ZSAtIHJlcS0+cmF0ZTsKPiDCoAliZXN0X3JhdGUgPSBjdXJfcmF0ZTsKPiDCoAlm
b3IgKDsgc2hpZnQgPD0gUEVSSVBIRVJBTF9NQVhfU0hJRlQ7IHNoaWZ0KyspIHsKPiAtCQljdXJf
cmF0ZSA9ICpwYXJlbnRfcmF0ZSA+PiBzaGlmdDsKPiAtCQlpZiAoY3VyX3JhdGUgPCByYXRlKQo+
IC0JCQljdXJfZGlmZiA9IHJhdGUgLSBjdXJfcmF0ZTsKPiArCQljdXJfcmF0ZSA9IHJlcS0+YmVz
dF9wYXJlbnRfcmF0ZSA+PiBzaGlmdDsKPiArCQlpZiAoY3VyX3JhdGUgPCByZXEtPnJhdGUpCj4g
KwkJCWN1cl9kaWZmID0gcmVxLT5yYXRlIC0gY3VyX3JhdGU7Cj4gwqAJCWVsc2UKPiAtCQkJY3Vy
X2RpZmYgPSBjdXJfcmF0ZSAtIHJhdGU7Cj4gKwkJCWN1cl9kaWZmID0gY3VyX3JhdGUgLSByZXEt
PnJhdGU7Cj4gwqAKPiDCoAkJaWYgKGN1cl9kaWZmIDwgYmVzdF9kaWZmKSB7Cj4gwqAJCQliZXN0
X2RpZmYgPSBjdXJfZGlmZjsKPiDCoAkJCWJlc3RfcmF0ZSA9IGN1cl9yYXRlOwo+IMKgCQl9Cj4g
wqAKPiAtCQlpZiAoIWJlc3RfZGlmZiB8fCBjdXJfcmF0ZSA8IHJhdGUpCj4gKwkJaWYgKCFiZXN0
X2RpZmYgfHwgY3VyX3JhdGUgPCByZXEtPnJhdGUpCj4gwqAJCQlicmVhazsKPiDCoAl9Cj4gwqAK
PiAtCXJldHVybiBiZXN0X3JhdGU7Cj4gKwlyZXEtPnJhdGUgPSBiZXN0X3JhdGU7Cj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyBpbnQgY2xrX3NhbTl4NV9wZXJpcGhlcmFs
X3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IEBAIC00MzAsNyArNDM3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfb3BzIHNhbTl4NV9wZXJpcGhlcmFsX29wcyA9IHsKPiDCoAkuZGlz
YWJsZSA9IGNsa19zYW05eDVfcGVyaXBoZXJhbF9kaXNhYmxlLAo+IMKgCS5pc19lbmFibGVkID0g
Y2xrX3NhbTl4NV9wZXJpcGhlcmFsX2lzX2VuYWJsZWQsCj4gwqAJLnJlY2FsY19yYXRlID0gY2xr
X3NhbTl4NV9wZXJpcGhlcmFsX3JlY2FsY19yYXRlLAo+IC0JLnJvdW5kX3JhdGUgPSBjbGtfc2Ft
OXg1X3BlcmlwaGVyYWxfcm91bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGNsa19zYW05
eDVfcGVyaXBoZXJhbF9ub19wYXJlbnRfZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0g
Y2xrX3NhbTl4NV9wZXJpcGhlcmFsX3NldF9yYXRlLAo+IMKgCS5zYXZlX2NvbnRleHQgPSBjbGtf
c2FtOXg1X3BlcmlwaGVyYWxfc2F2ZV9jb250ZXh0LAo+IMKgCS5yZXN0b3JlX2NvbnRleHQgPSBj
bGtfc2FtOXg1X3BlcmlwaGVyYWxfcmVzdG9yZV9jb250ZXh0LAoKLS0gCkFsZXhhbmRlciBTdmVy
ZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
