Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF09C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAjYgERJlGGZTxU7Q0lULDHefHHzpxWLv16KKxConBU=; b=cPkL38FZUurunL
	XpIGDmV/dfYJ1ucz0VvHoHs20OrJfYye8raONPw9OU35xM7ia5C3R+U+NLz/bqv2hi4bnItcbqGIP
	1yMOsRjrDXGqrT17nXXBQ+//TQerFebt4nSvjYOgQLZzZHc78e26a1VzfhILR/box/Ue3Yj5hZfHD
	FH8Bf54mHhW7BB4sIH/19V+c/prnZBoa4dEQVZ7rTdQ+KFe/ZC/bCNKsADuu4neXTq5cTRAdbSPNT
	7EGC2LPdsewVCOI5MYiIStYwx2lUcCWOcJzKIZFtOoMm/UkmQGl3Oxc2ITOXr5Isa4diyw542DVCH
	1cUTk8F5rMA0v1kYHTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPm3-00000006Iny-1JYv;
	Wed, 26 Jun 2024 10:21:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPly-00000006InF-2Uit;
	Wed, 26 Jun 2024 10:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F44961977;
	Wed, 26 Jun 2024 10:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89415C2BD10;
	Wed, 26 Jun 2024 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719397265;
	bh=D/VFZ0l3mvrFS0aKtePXsJ2D3z4ZwXw2QlLQ4cibJts=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=KDunu7JGYROHYnT6HoF4ifU1aS44CXQ+6FWPPWCLFKceHvtIedUWrLA7UHUG9h0XM
	 urzvozXB+B904mh9uIGOjvvmZ8Cs86En1HCnyTQ8DjBy2l15/2g0u7MJpHqr2hepHw
	 gY/ls3PhS5ESRwZ0Vrpc3QJ49pIh87oCxMEBVSbiSkqWvV680VQEcMix2/PskVsgVq
	 l7rSk24uYpgLfN3pSYoNv9dH6WnbJ74sNKuIv5i4+/o0Yxnt1Gu8jBKTfI4yW6pJvN
	 4D/AJ53scZawRSh6clidLr7svBWLyIVbs/i8QhdbkZ4OQr8ryQRTTfZiSEPH5fjHU7
	 hPvP5zR/Op0NA==
Message-ID: <59656f18-e11f-413a-b251-ed65847730b1@kernel.org>
Date: Wed, 26 Jun 2024 12:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>, Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 "soc@kernel.org" <soc@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 "Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_032106_795383_7E3C73C2 
X-CRM114-Status: GOOD (  10.61  )
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

T24gMjYvMDYvMjAyNCAxMjowMiwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBUdWUsIEp1biAx
OCwgMjAyNCBhdCAxOjUy4oCvUE0gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+IHdyb3RlOgo+
IAo+Pj4gU3ViamVjdDogW1BBVENIIHYyIDAwLzIwXSBwaW5jdHJsOiBVc2Ugc2NvcGUgYmFzZWQg
b2Zfbm9kZV9wdXQoKQo+Pj4gY2xlYW51cHMKPj4KPj4gc3Qvc3RtMzIvcmVuZXNhcyBwYXRjaGVz
IGFyZSBwaWNrZWQuIFdvdWxkIHlvdSBoYW5kbGUgdGhlIHJlbWFpbmluZwo+PiBvbmVzPwo+IAo+
IEhtIHJpZ2h0LCBJIGFwcGxpZWQgYWxsIHRoYXQgYXBwbHkgY2xlYW5seToKPiA5NzFjOGI0YzA4
ZTcgKEhFQUQgLT4gZGV2ZWwpIHBpbmN0cmw6IHNhbXN1bmc6IFVzZSBzY29wZSBiYXNlZAo+IG9m
X25vZGVfcHV0KCkgY2xlYW51cHMKPiAzYTg4MjU1NGEzYmIgcGluY3RybDogazIxMDogVXNlIHNj
b3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKPiA3ZjUwMGYyMDExYzAgcGluY3RybDog
ZnJlZXNjYWxlOiBteHM6IEZpeCByZWZjb3VudCBvZiBjaGlsZAo+IGQ3ZjUxMjBhOTQ0YSBwaW5j
dHJsOiBwaW5jb25mLWdlbmVyaWM6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFu
dXBzCj4gMjQwYzVmMjM4ZDU5IHBpbmN0cmw6IGJjbTogYmNtNjN4eDogVXNlIHNjb3BlIGJhc2Vk
IG9mX25vZGVfcHV0KCkgY2xlYW51cHMKPiAzYTAyNzhjZmI0NDggcGluY3RybDogbWVkaWF0ZWs6
IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCj4gYzk1N2FlN2U3ZTY4IHBp
bmN0cmw6IG5vbWFkaWs6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCj4g
M2RjYzAxYjM2ZjE4IHBpbmN0cmw6IHMzMmNjOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQo
KSBjbGVhbnVwcwo+IDdjMmFhYmI1NmY5MiBwaW5jdHJsOiBhdDkxOiBVc2Ugc2NvcGUgYmFzZWQg
b2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwo+IDU2YzQyZjZjN2IyYyBwaW5jdHJsOiByb2NrY2hpcDog
VXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKPiA4YzVkYzJhNWIzYTcgcGlu
Y3RybDogc3BlYXI6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCj4gNzk0
ZTVkYzUzM2IwIHBpbmN0cmw6IHNwcmQ6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNs
ZWFudXBzCj4gOGZhOTljMDAzNTFjIHBpbmN0cmw6IHN0YXJmaXZlOiBVc2Ugc2NvcGUgYmFzZWQg
b2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwo+IDExZWVmYzBhYzg4NCBwaW5jdHJsOiB0ZWdyYTogVXNl
IHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKPiAKPiBDYW4geW91IGxvb2sgaW50
byByZWJhc2luZyB0aGUgcmVtYWluaW5nIG9uZXM/Cj4gCj4gSSBhbSBhIGJpdCB1bnN1cmUgYWJv
dXQgU2Ftc3VuZywgS3J6eXN6dG9mIHVzdWFsbHkgcGljayB0aGVzZSwgYnV0IG5vIGJpZwo+IGRl
YWwgSSBndWVzcywgaWYgaGUgb2JqZWN0cyBJIGNhbiBqdXN0IHRha2UgaXQgb3V0IGFnYWluLgoK
SSBjYW4gZ3JhYiB0aGF0IG9uZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
