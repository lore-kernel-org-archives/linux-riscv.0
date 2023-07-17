Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1449EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzaBcq3iLfKE2LIKAmH6cgnHEtkSIZhiVAOhYSEPjUU=; b=tEKXZVEPVMA+4n
	JqS1XbQ4hhmbKkM0nPd2cH4e3Zjh9Y+DLT0uaiKvwSNQ9ocU+LbVFoyIWdyo4I6WDSMI4hulEu1tq
	NMFb/qJEfZwrXlBqrM3rIkwfW+Qo4kKgQeJcsXdeYFXeAMeSEYXJoq5rQOfJAKgeDtjT4Qwc8K5wE
	uwReRrStECId/CfnXsdUfCerJvZnSp3k0Q8D2iV0d1xGGEd1bUGedmyCDs+LOi9Yew5DguH15qXg2
	ivcvOX7UQ4Q1akMjJbyFesLLxZb4bZRSlJL0Fwa2lYDCXLAXh74G7AfnLs7jEwDKVUtf9dhwO8Gds
	MYDmuoL9dhhhYBCqbdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQeU-004UJd-01;
	Mon, 17 Jul 2023 16:00:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQeC-004UEH-2d;
	Mon, 17 Jul 2023 16:00:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 104066113B;
	Mon, 17 Jul 2023 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76322C433CC;
	Mon, 17 Jul 2023 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689609627;
	bh=dZQcAw1zSoJbieoMVSknj3lKolfzlek5nECTMuXlJTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kev7TG2o9s8LS1U/OrbHxP2+DikpEYtenqHzdUHa+C5S0uRyXnW5U6HBWbWDoDXQI
	 HGuFTdRhkqm+GwCuyGUiQCrQIBnNUsB43hwdyHSN8YFnaj7h/DGE77zsXN5/+VMP/L
	 YZNJDo3H5Rte1xRxXFxY/vQafP1OutAKGHgMHhaOjddTl8pfPhKoOStSUpOiHr1dKy
	 9Esfh+1CxXaorLzzKihoO8Sl3pYodrhThchtNG/BLLJFkFde3kvadEvySbQHCQTsrX
	 oku76bkYJnNGA5Z2PWzj46Y85htWLlOTNocpmM9fMndXvi310760mH+GIq47ReDgB7
	 lKnqY07zhEUHg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so6703375a12.0;
        Mon, 17 Jul 2023 09:00:27 -0700 (PDT)
X-Gm-Message-State: ABy/qLbgM+/lWa5pFHRbT8aIWD342uJh/83M5Ac7N0WJ0yH0QqnqQovL
	ZNK0gCySPspbTrZRq62yZtP2zqldfgaOxrZSJw==
X-Google-Smtp-Source: APBJJlHA4mgilySogAP42lUQSMVRT/qbV5Oma2JALtCafuqV/cUjtluoVPGDaYM362s9DRx6+5c70nlKH/JRTpSuRMY=
X-Received: by 2002:a2e:9206:0:b0:2b7:15d:24 with SMTP id k6-20020a2e9206000000b002b7015d0024mr9106273ljg.41.1689609605034;
 Mon, 17 Jul 2023 09:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174852.4062251-1-robh@kernel.org> <20230717074352.dz3ex7fwi77loayc@pengutronix.de>
In-Reply-To: <20230717074352.dz3ex7fwi77loayc@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 09:59:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDGeDrK6-cgsZpcpmAvQN-SVUv+W1nJRRiYD3BGAj-_g@mail.gmail.com>
Message-ID: <CAL_JsqKDGeDrK6-cgsZpcpmAvQN-SVUv+W1nJRRiYD3BGAj-_g@mail.gmail.com>
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_090029_329467_55F7FB87 
X-CRM114-Status: GOOD (  37.57  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgMTo0NOKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTQsIDIw
MjMgYXQgMTE6NDg6NTBBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBUaGUgRFQgb2Zf
ZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0ZSBiYWNrIHRvIHRoZSBzZXBhcmF0ZQo+ID4g
b2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFy
IHBsYXRmb3JtIGJ1cy4KPiA+IEFzIHBhcnQgb2YgdGhhdCBtZXJnZSBwcmVwcGluZyBBcm0gRFQg
c3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRoZXkKPiA+ICJ0ZW1wb3JhcmlseSIgaW5jbHVkZSBlYWNo
IG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9kZXZpY2UuaAo+ID4gYW5kIG9mLmgu
IEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBp
bmNsdWRlCj4gPiBmaWxlcyB1c2VkIHRocm91Z2hvdXQgdGhlIHRyZWUuIEluIG9yZGVyIHRvIGRl
dGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kCj4gPiByZXBsYWNlIHRoZSBpbXBsaWNpdCBpbmNsdWRl
cyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8KPiA+IGV4cGxpY2l0bHkg
aW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IHNvIHRoZSBldmVudHVhbCBnb2FsIGhl
cmUgaXMgdG8gcHJlcGFyZSBmb3I6Cj4KPiAgLSBkcm9wICNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4gZnJvbSBpbmNsdWRlL2xpbnV4L29mX3BsYXRmb3JtLmgKPiAgLSBkcm9wICNpbmNsdWRl
IDxsaW51eC9vZi5oPiBmcm9tIGluY2x1ZGUvbGludXgvb2ZfZGV2aWNlLmgKPiAgLSBkcm9wICNp
bmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPiBmcm9tIGluY2x1ZGUvbGludXgvb2ZfZGV2aWNl
LmgKPiAgLSBkcm9wICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4gZnJvbSBpbmNs
dWRlL2xpbnV4L29mX2RldmljZS5oCj4gIC0gZHJvcCAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+IGZyb20gaW5jbHVkZS9saW51eC9vZl9wbGF0Zm9ybS5oCgpZZXMuCgo+ID4gU2ln
bmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9wd20vcHdt
LWFwcGxlLmMgICAgICAgICAgfCAxICsKPiA+ICBkcml2ZXJzL3B3bS9wd20tYXRtZWwtaGxjZGMu
YyAgICB8IDEgKwo+ID4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC10Y2IuYyAgICAgIHwgMyArLS0K
PiA+ICBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICB8IDEgLQo+ID4gIGRyaXZlcnMv
cHdtL3B3bS1iZXJsaW4uYyAgICAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9wd20vcHdtLWNyb3Mt
ZWMuYyAgICAgICAgfCAxICsKPiA+ICBkcml2ZXJzL3B3bS9wd20tZnNsLWZ0bS5jICAgICAgICB8
IDMgKy0tCj4gPiAgZHJpdmVycy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgfCAyICstCj4gPiAg
ZHJpdmVycy9wd20vcHdtLWlteDEuYyAgICAgICAgICAgfCAxIC0KPiA+ICBkcml2ZXJzL3B3bS9w
d20tano0NzQwLmMgICAgICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3B3bS9wd20tbHAzOTQzLmMg
ICAgICAgICB8IDEgKwo+ID4gIGRyaXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgIHwgMSAr
Cj4gPiAgZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMgICAgICAgfCAxIC0KPiA+ICBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyAgICAgICAgICB8IDEgLQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1taWNy
b2NoaXAtY29yZS5jIHwgMiArLQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jICAgICAg
IHwgMSAtCj4gPiAgZHJpdmVycy9wd20vcHdtLXB4YS5jICAgICAgICAgICAgfCAxICsKPiA+ICBk
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAgICB8IDEgKwo+ID4gIGRyaXZlcnMvcHdtL3B3
bS1zbDI4Y3BsZC5jICAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9wd20vcHdtLXNwcmQuYyAgICAg
ICAgICAgfCAxICsKPiA+ICBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgICB8IDEgLQo+
ID4gIGRyaXZlcnMvcHdtL3B3bS1zdW5wbHVzLmMgICAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9w
d20vcHdtLXRlZ3JhLmMgICAgICAgICAgfCAxIC0KPiA+ICBkcml2ZXJzL3B3bS9wd20tdGllY2Fw
LmMgICAgICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3B3bS9wd20tdGllaHJwd20uYyAgICAgICB8
IDIgKy0KPiA+ICBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAgICB8IDIgKy0KPiA+ICBk
cml2ZXJzL3B3bS9wd20tdnQ4NTAwLmMgICAgICAgICB8IDUgKy0tLS0KPiA+ICAyOCBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wd20vY29yZS5jIGIvZHJpdmVycy9wd20vY29yZS5jCj4gPiBpbmRleCAz
ZGFjY2VhZWY0YTkuLmQzNzYxN2M2MGVhZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcHdtL2Nv
cmUuYwo+ID4gKysrIGIvZHJpdmVycy9wd20vY29yZS5jCj4gPiBAQCAtOCw2ICs4LDcgQEAKPiA+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3B3bS5o
Pgo+ID4gICNpbmNsdWRlIDxsaW51eC9yYWRpeC10cmVlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L2xpc3QuaD4KPgo+IFRoaXMgZmlsZSBpbmNsdWRlcyBuZWl0aGVyIG9mX2RldmljZS5oIG5vciBv
Zl9wbGF0Zm9ybS5oIGFuZCB1cCB0byBub3cKPiBnZXRzIG9mLmggdmlhIDxsaW51eC9wd20uaD4u
CgpJbmRlZWQuCgo+IFdoYXQgaXMgeW91ciBwbGFuIGZvciA8bGludXgvcHdtLmg+J3MgaW5jbHVk
ZT8gSSB0aGluayBpdCB3b3VsZCBvbmx5IG5lZWQKPgo+ICAgICAgICAgc3RydWN0IG9mX3BoYW5k
bGVfYXJnczsKCkhlcmUncyB3aGF0IEknbSB0ZXN0aW5nIHdpdGg6CgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgKaW5kZXggMDRhZTFkOTA3M2E3
Li41YTU5YTdkNTNiZTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKKysrIGIvaW5j
bHVkZS9saW51eC9wd20uaApAQCAtNCw4ICs0LDEwIEBACgogI2luY2x1ZGUgPGxpbnV4L2Vyci5o
PgogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Ci0jaW5jbHVkZSA8bGludXgvb2YuaD4KCitzdHJ1
Y3QgZGV2aWNlOworc3RydWN0IGZ3bm9kZV9oYW5kbGU7CitzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdz
Owogc3RydWN0IHB3bV9jaGlwOwoKIC8qKgoKPgo+IHRvIHJlcGxhY2UgdGhhdC4gKEJ1dCB0aGF0
IHdvdWxkIG5lZWQgYW5vdGhlciBwYXRjaCBsaWtlIHRoaXMgb25lLCBhcwo+IHRoZW4gZS5nLiBk
cml2ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyBmYWlscyB0byBjb21waWxlIGJlY2F1c2UKPiBkZXZp
Y2VfcHJvcGVydHlfcmVhZF91MzIoKSBpcyB1bmRlY2xhcmVkLiBJdCB3b3VsZCBuZWVkIHRvICNp
bmNsdWRlCj4gPGxpbnV4L3Byb3BlcnR5Lmg+IHdoaWNoIG5vdyBpdCBnZXRzIHRyYW5zaXRpdmVs
eSB2aWEgPGxpbnV4L29mLmg+LikKCnByb3BlcnR5LmggaXMgYWRkZWQgaW4gdGhpcyBwYXRjaCwg
c28gaXQgc2hvdWxkIGJlIG9rYXk/Cgo+IElmIDxsaW51eC9wd20uaD4gaXMgcGxhbmVkIHRvIGNv
bnRpbnVlICNpbmNsdWRpbmcgPGxpbnV4L29mLmg+LCB0aGUKPiBleHBsaWNpdCBpbmNsdWRlIGhl
cmUgaXNuJ3QgbmVjZXNzYXJ5IChhbmQgcHJvYmFibHkgZWxzZXdoZXJlKS4KCkkgd291bGQgbGlr
ZSB0byBkcm9wIGluY2x1ZGluZyBvZi5oLCBidXQgcHJvYmFibHkgbm90IHRoaXMgY3ljbGUuCkVp
dGhlciB3YXksIEkgdGhvdWdodCBrZXJuZWwgYmVzdCBwcmFjdGljZSB3YXMgdG8gbm90IHJlbHkg
b24gaW1wbGljaXQKaW5jbHVkZXMuCgpCVFcsIGxpbnV4L2kyYy5oIGlzIGFub3RoZXIgc291cmNl
IG9mIGxvdHMgb2YgaW1wbGljaXQgb2YuaCBpbmNsdWRlcy4KVGhhdCBvbmUgbG9va3MgbGlrZSB3
ZSBjYW4ndCBnZXQgcmlkIG9mLgoKPiBJIGRvbid0IGNhcmUgbXVjaCBlaXRoZXIgd2F5LCBidXQg
bWF5YmUgeW91ciBxdWVzdCB3b3VsZCBiZSBhIGJpdAo+IHNpbXBsZXIgaWYgeW91IG9ubHkgdG91
Y2ggZmlsZXMgdGhhdCBpbmNsdWRlIHRoZSB0d28gZmlsZXMgeW91IHdhbnQgdG8KPiBtb2RpZnk/
CgpZZXMsIHRoYXQncyBob3cgaXQgc3RhcnRlZC4gSSBraW5kIG9mIGRlY2lkZWQgaXQgd2Fzbid0
IHdvcnRoIHRyeWluZwp0byBzcGxpdCB0aGluZ3MgdXAgYnkgZXZlcnkgc2VwYXJhdGUgcmVhc29u
IGV4cGxpY2l0IGluY2x1ZGVzIHdlcmUgbm90CmNvcnJlY3QuCgo+Cj4gKnNocnVnKiwgdGhpcyBw
YXRjaCBpcyBzdGlsbCBhbiBpbXByb3ZlbWVudCBzbzoKPgo+IEFja2VkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5nIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4KPiBBbm90aGVyIHRoaW5n
IEkgd29uZGVyIGlzOiBIb3cgZGlkIHlvdSBpZGVudGlmeSB0aGUgZmlsZXMgdGhhdCBuZWVkCj4g
dGhlc2UgaW5jbHVkZXMuIEkgZ3Vlc3MgeW91IGhhdmUgYSBsaXN0IG9mIHR5cGVzIGZvciBlYWNo
IGhlYWRlciBhbmQKPiBzZWFyY2ggZm9yIGZpbGVzIHRoYXQgdXNlIGFueSBvZiB0aGUgdHlwZXMg
YnV0IGRvZXNuJ3QgaW5jbHVkZSB0aGUKPiByZXNwZWNpdHZlIGhlYWRlcj8gSSB3b25kZXIgaWYg
dHJhY2tpbmcgdGhpcyB0eXBlIC0+IGhlYWRlciBtYXBwaW5nIGluCj4gbWFjaGluZSByZWFkYWJs
ZSBmb3JtIHNvbWV3aGVyZSB3b3VsZCBiZSBuaWNlLCB0byBlLmcuIG1ha2UgY2hlY2twYXRjaAo+
IHdhcm4gaWYgYSBmaWxlIHVzZXMgc3RydWN0IG9mX25vZGUgYnV0IG9ubHkgZ2V0cyBpdCBieSBj
aGFuY2U/CgpJdCdzIGJlZW4gbGVzcyBhdXRvbWF0ZWQgdGhhbiBJJ2QgbGlrZS4gSXQncyBiZWVu
IGEgbG90IG9mIGdyZXBwaW5nCndpdGggYSBsaXN0IG9mIHN5bWJvbHMgdGhlIGhlYWRlcnMgcHJv
dmlkZS4gRm9yIGV4YW1wbGUsIEkgZ2V0IGFsbCB0aGUKZmlsZXMgaW5jbHVkaW5nIG9mX2Rldmlj
ZS5oIGFuZCB0aGVuIGdldCB0aGUgb25lcyB3aXRoIG5vIHN5bWJvbHMgZnJvbQpvZl9kZXZpY2Uu
aC4gQW5kIHRoZW4gZG8gYSBtYW51YWwgcmV2aWV3IG9mIHdoYXQgYXJlIHRoZSBjb3JyZWN0Cmhl
YWRlcnMgZm9yIHRoZSBmaWxlLiBBbmQgdGhlbiBydW4gdGhydSBidWlsZHMgYW5kIGZpeCBhbGwg
dGhlIGlzc3Vlcy4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
