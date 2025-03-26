Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28549C3600C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DJDECq7SoNGO+BfUdiBUirE5gr+NV53r9+5PRVaDA8=; b=IHykUGfr6xG14e
	oJwgy3or1tH3aDgOfbFSZGY7Ou7YOkI+s5PzN9URog5qRpwq1ai3yPp40bBw83tJUQ6DAUh9sSzym
	25K9FCuNfRsQK6SNBXqEXd82vn8uFkaS404uCR0QCcY5TylzR5Rt5/TTXxy7FycUZ70tr7jFYYLXG
	l1rl/nNUFFd8arm8zmIzCCb+XKqr8gCDamswRgTlybzIy4Gjv/Hqkb9q6/FrKho0pcTBjBfbfUTu/
	TwIfPzv4ckHtsDaaNlnDigBKIwgGBf8F3SUjb5IaWWL5waqoMeUn18S+KND01xf1KV4yp6BIaQw55
	K1oNozyAxpmqWO+bF94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOTm-00000008Hz6-1x85;
	Wed, 26 Mar 2025 10:59:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOTj-00000008Hxl-0e69
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 10:59:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 080264435E;
	Wed, 26 Mar 2025 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742986758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t5QSc/Inlh5P0gL04QSWLOfREn/t3CkeGZkKLYdjDE=;
	b=FUGEgc/7iedXlqTTbqAcAA02XV8B6oh9Y7Bqm+fFLGpWd49hbrCIc0l/Bom4tRDfAdpfxN
	C+mSXaVZjS8viJztlY0tp1Jmw0hvhW/1ceZPdb5wiGtYc1je6aAFI5TiHdO+P9FJKmRmfx
	eWncdS7EimoRYsZHB++4IT3E0MlwDx4w9Fe5zz49duRxQWN0qvat+MtfFrTz2J8U2Xd7HU
	Hc/jtwjqt9d5o94wNdn1lcwKBr/jAF9Kb1AcdXPCVatvLn8mKVBVsKR/p4LNlXi6/kl63Q
	qxddGv2E69HVgUqlyM1jbWK1dNqK8asjSsiq1ina4MTDSp9PAqFA/y2O6mk2EA==
Mime-Version: 1.0
Date: Wed, 26 Mar 2025 11:59:13 +0100
Message-Id: <D8Q58KMGV4R4.ELW8TLEK5W5V@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 08/13] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
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
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-8-537b7e37971d@bootlin.com>
 <20250324095522.2ab1c38b@fedora.home>
In-Reply-To: <20250324095522.2ab1c38b@fedora.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffuvefvofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeluefgiefgtdegfeehjeetteevveejkefgiedtkeefteejgfdvkeffgeejhfduieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_035923_650705_4B06E3A7 
X-CRM114-Status: GOOD (  14.47  )
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

SGVsbG8gTWF4aW1lLAoKT24gTW9uIE1hciAyNCwgMjAyNSBhdCA5OjU1IEFNIENFVCwgTWF4aW1l
IENoZXZhbGxpZXIgd3JvdGU6Cj4gT24gRnJpLCAyMSBNYXIgMjAyNSAyMDowOTozOSArMDEwMAo+
IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4+IEludHJv
ZHVjZSBtYWNiX2RtYV9pc182NGIoKSBhbmQgbWFjYl9kbWFfaXNfcHRwKCkgaGVscGVyIGZ1bmN0
aW9ucy4KPj4gTWFueSBjb2RlcGF0aHMgYXJlIG1hZGUgc2ltcGxlciBieSBkcm9wcGluZyBjb25k
aXRpb25hbCBjb21waWxhdGlvbi4KPj4gCj4+IFRoaXMgaW1wbGllcyB0aHJlZSBjaGFuZ2VzOgo+
PiAgLSBBbHdheXMgY29tcGlsZSByZWxhdGVkIHN0cnVjdHVyZSBkZWZpbml0aW9ucyBpbnNpZGUg
PG1hY2IuaD4uCj4+ICAtIE1ha2UgdGhlIGZpZWxkIGh3X2RtYV9jYXAgaW4gc3RydWN0IG1hY2Ig
YWx3YXlzIHByZXNlbnQuCj4+ICAtIE1BQ0JfRVhUX0RFU0MgY2FuIGJlIGRyb3BwZWQgYXMgaXQg
aXMgdXNlbGVzcyBub3cuCj4+IAo+PiBUaGUgY29tbW9uIGNhc2UgaXM6Cj4+IAo+PiAJI2lmZGVm
IENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQKPj4gCQlzdHJ1Y3QgbWFjYl9kbWFfZGVzY182
NCAqZGVzY182NDsKPj4gCQlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0Qikgewo+
PiAJCQlkZXNjXzY0ID0gbWFjYl82NGJfZGVzYyhicCwgZGVzYyk7Cj4+IAkJCS8vIC4uLgo+PiAJ
CX0KPj4gCSNlbmRpZgo+PiAKPj4gQW5kIHJlcGxhY2VkIGJ5Ogo+PiAKPj4gCXN0cnVjdCBtYWNi
X2RtYV9kZXNjXzY0ICpkZXNjXzY0Owo+PiAJaWYgKG1hY2JfZG1hX2lzXzY0YihicCkpIHsKPj4g
CQlkZXNjXzY0ID0gbWFjYl82NGJfZGVzYyhicCwgZGVzYyk7Cj4+IAkJLy8gLi4uCj4+IAl9Cj4K
PiBKdXN0IGEgdGhvdWdodCwgYnV0IHRoaXMgaXMgYWRkaW5nIHNvbWUgbW9yZSBicmFuY2hlcyBp
biB0aGUgaG90cGF0aCBvbgo+IDMyIGJpdHMgRE1BIHNldHVwcy4gRGlkIHlvdSBtZWFzdXJlIGFu
eSBwZXJmb3JtYW5jZSBjaGFuZ2VzIG9uCj4gdGhlc2UgcGxhdGZvcm1zIChpZiB5b3UgaGF2ZSBh
Y2Nlc3MgdG8gb25lIDopICkKPgo+IEFzIHRoZSBjYXBzIGNhbid0IGJlIGNoYW5nZWQgZHluYW1p
Y2FsbHksIG1heWJlIHRoZXNlIGhlbHBlcnMgY291bGQgYmUKPiByZXBsYWNlZCBtb3JlIGVmZmlj
aWVudGx5IHdpdGggc29tZSBzdGF0aWNfa2V5ID8gVGhpcyB3b3VsZCBiZW5lZml0Cj4gYm90aCAz
MiBhbmQgNjQgYml0cyBzeXN0ZW1zIGFzIHRoZSBmb2xsb3dpbmcgd291bGQgYmUgbW9yZSBlZmZp
Y2llbnQKPgo+IAlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0Qikgewo+IAkJLy8g
IC4uLgo+IAl9Cj4KPiBKdXN0IGEgdGhvdWdodCBvZiBjb3Vyc2UsIG1heWJlIHRoaXMgcGF0Y2gg
ZG9lc24ndCByZWFsbHkgaHVydCBwZXJmcyA6KQoKR29vZCBxdWVzdGlvbiEgSSBhc2tlZCBteXNl
bGYgdGhlIHNhbWUgdGhpbmcgYmVmb3JlIHBvc3RpbmcuCgpXZSBnbyBmcm9tOgoKCXZvaWQgYmFy
KHN0cnVjdCBtYWNiICpicCkgewoJI2lmZGVmIENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQK
CQlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0QikgewoJCQlmb28oKTsKCQl9Cgkj
ZW5kaWYKCX0KClRvOgoKCXN0YXRpYyBib29sIG1hY2JfZG1hX2lzXzY0YihzdHJ1Y3QgbWFjYiAq
YnApCgl7CgkJcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVCkg
JiYKCQkgICAgICAgYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0QjsKCX0KCgl2b2lkIGJh
cihzdHJ1Y3QgbWFjYiAqYnApIHsKCQlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkgewoJCQlmb28o
KTsKCQl9Cgl9CgpJbiB0aGUgZmlyc3QgY2FzZSwgd2UgdXNlIGV4cGxpY2l0IHByZXByb2Nlc3Nv
ciBkaXJlY3RpdmVzIHRvIHJlbW92ZQpjb2RlIGlmIENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRC
SVQgaXNuJ3QgZGVmaW5lZC4KCkluIHRoZSBzZWNvbmQgY2FzZSwgb3VyIGNvbXBpbGVyIG9wdGlt
aXNlcyBhd2F5IHRoZSBJU19FTkFCTEVEKCkgY2FsbC4KIC0gSWYgZmFsc2UsIHRoZW4gdGhlIGJy
YW5jaCBkb2Vzbid0IGFwcGVhci4KIC0gSWYgdHJ1ZSwgdGhlbiBvbmx5IHRoZSBjYXBhYmlsaXR5
IGNoZWNrIGlzIGlubGluZWQgaW4gYmFyKCkuCkkgY2hlY2tlZCB0aGUgYXNzZW1ibHkgb24gYXJt
L2FybTY0L01JUFMuCgpDb25jbHVzaW9uOiB0aGUgaG90cGF0aCBkb2Vzbid0IGNoYW5nZS4KClRo
YW5rcywKCi0tClRow6lvIExlYnJ1biwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
