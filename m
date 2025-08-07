Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A761EC87FCA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxrjIxq8CGK37/ziwGKjDxQsZqga+D7eRDPi9Jkc3Hk=; b=Xroc2SSxJIcbNa
	tP3W/mTrG+JigGudYuibuQ2L+knOIqtNSzABju1a16LbDSFB9SP0wxDBZJ6uPE6SVyqWukROhaX4e
	GCH4xFXXlYfgd5S7ZlVENq+8C12xy3IoFwG3QXKi33tkhVuuAQlsp29FLEIl9XKVGL98SJriBZSmS
	Ks7NdlVsoovajpMVIpDJnXqeXBlB4Dxf2BxCBqCTYxBnPPn6XBQoShteTZS/N9feIrpDoCzl9+hRh
	MLoOz//+qCVPun0pEZmyG13xJMnfLRUnSVihXtW542E1TPwLaRw0uoy+V3hYboVM8rccJehQa1QbQ
	zBZYya1VfZotB4E+WtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2Vz-00000000zyk-1nf4;
	Thu, 07 Aug 2025 15:26:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2Tb-00000000zd5-0vkF
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 15:24:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7485D442C7;
	Thu,  7 Aug 2025 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754580256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THm1SoEjdEMZZ7ysWdC8VuJNdis7fSw145Sks0ZuOMk=;
	b=PTYDDxAiEqhcHNXakvzEAxIEHtOYnZg0O4FZmg+lsrI3Kn0+/Bup9nOQLSwIjEuQ74IbDk
	v0Y4OmGGsVrpxb7SxSr0kE8n6MHXpPx0drRvkgtC0H5+6YpNE2K4iM3W0IrCR4FqtxXe/3
	lvqGvaSsShseE/yzIXQvAsl9IpHOpc7XH+FNd7yGvE0o/UzD+sP73DN4yqsIcN598td+BA
	9wGEewScVY9ZVVHA5gXjogHYetiBg21SOGk65rONj+2d1989bg7n/32xRMm3cF1vGmDkn4
	Vn5hsAPPVdGu+daHKdj0yFYdc/je+xtTN5JrVh+Kr5l52rgKZ94cuB8XiD9z6g==
Mime-Version: 1.0
Date: Thu, 07 Aug 2025 17:24:13 +0200
Message-Id: <DBWASGS8U4LN.1GMHL8A61VWU8@bootlin.com>
Subject: Re: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Sean Anderson" <sean.anderson@linux.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Cyrille Pitchen"
 <cyrille.pitchen@atmel.com>, "Harini Katakam" <harini.katakam@xilinx.com>,
 "Rafal Ozieblo" <rafalo@cadence.com>, "Haavard Skinnemoen"
 <hskinnemoen@atmel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
 <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
In-Reply-To: <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_082419_680114_68C762CF 
X-CRM114-Status: GOOD (  11.21  )
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

T24gVHVlIEp1bCAxLCAyMDI1IGF0IDY6NDAgUE0gQ0VTVCwgU2VhbiBBbmRlcnNvbiB3cm90ZToK
PiBPbiA2LzI3LzI1IDA1OjA4LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4+IElmIEhXIGlzIFJTQyBj
YXBhYmxlLCBpdCBjYW5ub3QgYWRkIGR1bW15IGJ5dGVzIGF0IHRoZSBzdGFydCBvZiBJUAo+Cj4g
UmVjZWl2ZS1zaWRlIGNvYWxlc2Npbmc/IENhbiB5b3UgYWRkIGEgYnJpZWYgZGVzY3JpcHRpb24g
b2YgdGhpcwo+IGZlYXR1cmUgdG8geW91ciBjb21taXQgbWVzc2FnZT8KClllcyB0aGF0IGlzIFJl
Y2VpdmUgU2lkZSBDb2FsZXNjaW5nLiBDbGVhcmx5IGl0IG5lZWRzIHRvIGJlIG1lbnRpb25lZApv
dXQgbG91ZCwgYW5kIGJyaWVmbHkgZGVzY3JpYmVkLgoKPj4gcGFja2V0cy4gQWxpZ25tZW50IChp
ZSBudW1iZXIgb2YgZHVtbXkgYnl0ZXMpIGlzIGNvbmZpZ3VyZWQgdXNpbmcgdGhlCj4+IFJCT0Yg
ZmllbGQgaW5zaWRlIHRoZSBOQ0ZHUiByZWdpc3Rlci4KPj4gCj4+IE9uIHRoZSBzb2Z0d2FyZSBz
aWRlLCB0aGUgc2tiX3Jlc2VydmUoc2tiLCBORVRfSVBfQUxJR04pIGNhbGwgbXVzdCBvbmx5Cj4+
IGJlIGRvbmUgaWYgdGhvc2UgZHVtbXkgYnl0ZXMgYXJlIGFkZGVkIGJ5IHRoZSBoYXJkd2FyZTsg
bm90aWNlIHRoZQo+PiBza2JfcmVzZXJ2ZSgpIGlzIGRvbmUgQUZURVIgd3JpdGluZyB0aGUgYWRk
cmVzcyB0byB0aGUgZGV2aWNlLgo+PiAKPj4gV2UgY2Fubm90IGRvIHRoZSBza2JfcmVzZXJ2ZSgp
IGNhbGwgQkVGT1JFIHdyaXRpbmcgdGhlIGFkZHJlc3MgYmVjYXVzZQo+PiB0aGUgYWRkcmVzcyBm
aWVsZCBpZ25vcmVzIHRoZSBsb3cgMi8zIGJpdHMuIENvbmNsdXNpb246IGluIHNvbWUgY2FzZXMs
Cj4+IHdlIHJpc2sgbm90IGJlaW5nIGFibGUgdG8gcmVzcGVjdCB0aGUgTkVUX0lQX0FMSUdOIHZh
bHVlICh3aGljaCBpcwo+PiBwaWNrZWQgYmFzZWQgb24gdW5hbGlnbmVkIENQVSBhY2Nlc3MgcGVy
Zm9ybWFuY2UpLgo+PiAKPj4gRml4ZXM6IDRkZjk1MTMxZWE4MCAoIm5ldC9tYWNiOiBjaGFuZ2Ug
UlggcGF0aCBmb3IgR0VNIikKPgo+IERvIGFueSBleGlzdGluZyBNQUNCcyBzdXBwb3J0IFJTQz8g
SXMgdGhpcyBhIGZpeD8gCgpJIGhhdmUgbm8gaWRlYS4gSWYgYW55IE1BQ0Igc3VwcG9ydHMgUlND
LCBpdCBtdXN0IGJlIHRob3NlIHJ1bm5pbmcgd2l0aApORVRfSVBfQUxJR049MCwgc28gYXJtNjQv
cG93ZXJwYy94ODYuCgpJcyBpdCBhIGZpeD8gV2UgY2FuIGd1ZXNzIHRoYXQgYWxsIGJvYXJkcyBm
YWxsIGluIGVpdGhlciBjYXRlZ29yeToKIC0gRG9uJ3Qgc3VwcG9ydCBSU0MgKD0+IFJCT0Ygd29y
a3MgZmluZSkuCiAtIFN1cHBvcnQgUlNDICg9PiBSQk9GIG5vdCB3b3JraW5nKSBBTkQgTkVUX0lQ
X0FMSUdOPTAuCgpCb3RoIG9mIHRob3NlIGFyZSBub3QgaW1wYWN0ZWQsIHNvIHdlIHRlY2huaWNh
bGx5IGRvbid0IGZpeCBhbnl0aGluZyBmb3IKY3VycmVudCB1c2Vycy4KClJlZ2FyZHMsCgotLQpU
aMOpbyBMZWJydW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
