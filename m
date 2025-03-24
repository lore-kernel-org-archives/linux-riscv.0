Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E48C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3qtZSJcHaynzAyRxZ5sCOS0uWNm7LmBuv8GaZSJ0oY=; b=KHmBrpsJ0tlNKI
	XcRpvnPkkHYepKS3AaWRLReALje1j9faSQOk4GTqpGlvK8msrCMv4saZReYLahdVoDoTgKkcpS9Bf
	wFM8jrh1OOLfGfB4MSykc7Z5OjAiatiPa5ITvWMPCFnlBoDTk8STq/4WA2FJBWkAx0AY326iNObDy
	0Vr6sGdApssWUVJ3lKICsuez7nf/wraz17WoSefyA266T+daewONRyyaFs0YahaRJoQ28yBPzPVfK
	w3wM0PXP29gMXNMrcV8gkQ2AnD0TEww3gx4TMK28E2jW9u8sQy6Q0rNJL0wk1Qj3LpncBJFZ4IZSq
	mtTIryuJJ+m6FvS9XpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkW9-00000003cDA-0nIa;
	Mon, 24 Mar 2025 16:19:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkRF-00000003bUM-0FJy
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 16:14:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9EB62047D;
	Mon, 24 Mar 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742832845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6KzmIi53X4fObYuJrA4GCKCHJLPzFl8bnqM+4sgwCQ=;
	b=Gf68N48IxHGYxw5YhiOZutJryK0qFHSxJJeAYRbkVLq+oNDSGW0qesENhdVAAjAfxKxj9D
	ZE/cLxKqWuH93q2c0TTha9uIb72TJzQnCArJ60qE9rphdjgh2rXoahvIdv8WFP6+7om7f1
	fHSKvAZ4eKzHpX4Us105kKzkdm35JbDjF4lr72btvKLJSU3WG2SZ2KULSLV5mQUM7D509K
	Wbt9VlL2xLhEtaqv6+fe+BwzpPU02bkyjLbZ+DrlOmwxQ0Abn+cT68213S1R07uGTL+j4N
	n2336Y+3wBww2TlzhtGWwataCUV4jvefAI8JSJyL1IjQHIcV/tFTyTlKYk6tEw==
Mime-Version: 1.0
Date: Mon, 24 Mar 2025 17:14:01 +0100
Message-Id: <D8OMOI980I2X.1JH4RKWL1V86E@bootlin.com>
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Richard Cochran" <richardcochran@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andrew Lunn" <andrew@lunn.ch>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
 <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
In-Reply-To: <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpr
 ggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091409_699460_F9710528 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpIE1hciAyMSwgMjAyNSBhdCA5OjQ5IFBNIENFVCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+
ICAgICAgICAgICAgLSBhdG1lbCxzYW1hNWQyLWdlbSAgICAgICAgICMgR0VNIElQICgxMC8xMDAp
IG9uIEF0bWVsIHNhbWE1ZDIgU29Dcwo+PiAgICAgICAgICAgIC0gYXRtZWwsc2FtYTVkMy1nZW0g
ICAgICAgICAjIEdpZ2FiaXQgSVAgb24gQXRtZWwgc2FtYTVkMyBTb0NzCj4+ICAgICAgICAgICAg
LSBhdG1lbCxzYW1hNWQ0LWdlbSAgICAgICAgICMgR0VNIElQICgxMC8xMDApIG9uIEF0bWVsIHNh
bWE1ZDQgU29Dcwo+PiArICAgICAgICAgIC0gbW9iaWxleWUsZXllcTUtZ2VtICAgICAgICAjIE1v
YmlsZXllIEV5ZVE1IFNvQ3MKPj4gICAgICAgICAgICAtIGNkbnMsbnA0LW1hY2IgICAgICAgICAg
ICAgIyBOUDQgU29DIGRldmljZXMKPj4gICAgICAgICAgICAtIG1pY3JvY2hpcCxzYW1hN2c1LWVt
YWMgICAgIyBNaWNyb2NoaXAgU0FNQTdHNSBldGhlcm5ldCBpbnRlcmZhY2UKPj4gICAgICAgICAg
ICAtIG1pY3JvY2hpcCxzYW1hN2c1LWdlbSAgICAgIyBNaWNyb2NoaXAgU0FNQTdHNSBnaWdhYml0
IGV0aGVybmV0IGludGVyZmFjZQo+Cj4gVGhlc2UgYXJlIGtpbmQgb2Ygc29ydGVkLiBNYXliZSBw
dXQgbW9iaWxleWUgYWZ0ZXIgbWljcm9jaGlwPwoKSSBuZXZlciB1bmRlcnN0b29kIGhvdyBtb3N0
IGxpc3RzIGVuZCB1cCBtb3N0bHkgc29ydGVkLiBDaGFuZ2VzIGZvciBWMjoKIC0gYWRkIGEgImR0
LWJpbmRpbmdzOiBuZXQ6IGNkbnMsbWFjYjogc29ydCBjb21wYXRpYmxlcyIgcGF0Y2gsCiAtIGFk
ZCB0aGUgbW9iaWxleWUgY29tcGF0aWJsZSBiZWxvdyBtaWNyb2NoaXAncy4KClRoYW5rcywKCi0t
ClRow6lvIExlYnJ1biwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
