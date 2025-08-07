Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA39C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0aAs7t2TxyXcJUc0ifPbGUsI7MFC9gDdIGhk78zC6o=; b=eMtAGiWg7RwsOQ
	traK6S7ycMpJU7/qK6ISWZAInbZG0PVzYduWzs8c828PLp35G9D6h+P7ZAJbAokxvOkpwEVM2KcMd
	Sc641seqNJmPhXA3uKmMt0GKr6fLZuj8aD3RGuWxmDrTIvCHByxoNRS3ii2ptf/1Kd0bgLwBLIRWb
	VfYm0s/t0WjBS+LCUBfpVO/VI9F20YcZXVHOm7VcAp6wcCcljHlJZhyc4BBjsZ4myFEbLr9nh61vJ
	5g0vZKuiKLaZ0Zv4yCVizfowe6xphayd284wvrp8nfUhjvj25uriqejRmG0tZflDI5+uvTlmbUMsn
	awYLDrxQi9biMdfA+0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3MX-000000017ny-0qGo;
	Thu, 07 Aug 2025 16:21:05 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3DF-000000015VP-2b3h
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 16:11:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81832442F6;
	Thu,  7 Aug 2025 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754583087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZKIWF9npEkKZLlXfX/TxHBsvndAZLC7cFR8tTMLusA=;
	b=anXpfStWtQaVGcjeVkSrKGaRYMcwhCu6SGubJHwi676xFy+IfLlGDAxmSNpLg+ldHctrqi
	tKoZKqXmvlZ73jQrVM1mC5cjDOVuL1PAsby26oO8b/w4bRLWdosvnIu5kf7QyYmDTXaV6/
	mCa474mjGmB60FjEIirliBXL8JQNPKGTc5jL0nBrODB38VvM1wSQnmQQfn/lYZQn4l9gV0
	7kBHY91KVPIwoJsnaoRsLW2p2d7ccF+sIokmXV91DvqDPTuJYzon5I70p85K0nZ2AgR65e
	8DqgAB4w7oVVZc+wOntYAppe6xL0fnOK0QqJAkhYQ6uyLVUfvVzFK6PgrQMwtw==
Mime-Version: 1.0
Date: Thu, 07 Aug 2025 18:11:23 +0200
Message-Id: <DBWBSL7Q35M2.2WWW5HKBHKUA5@bootlin.com>
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
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
Subject: Re: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU
 support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
 <984c1bea-7020-4121-9fea-7d657a5e8da1@app.fastmail.com>
In-Reply-To: <984c1bea-7020-4121-9fea-7d657a5e8da1@app.fastmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefvhffuofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfelffeuffetteetuddufffghefhudeuteeigeekteevgeeileejgfdvffelheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_091130_450526_F888F65F 
X-CRM114-Status: UNSURE (   7.68  )
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

SGVsbG8gSmlheHVuLAoKT24gTW9uIEp1biAzMCwgMjAyNSBhdCAzOjM1IFBNIENFU1QsIEppYXh1
biBZYW5nIHdyb3RlOgo+IOWcqDIwMjXlubQ25pyIMjfml6XlkajkupQg5LiK5Y2IMTA6MDnvvIxU
aMOpbyBMZWJydW7lhpnpgZPvvJoKPj4gQm90aCBDYWRlbmNlIEdFTSBFdGhlcm5ldCBjb250cm9s
bGVycyBvbiBFeWVRNSBhcmUgaGFyZHdpcmVkIHRocm91Z2ggQ00zCj4+IElPIENvaGVyZW5jeSBV
bml0cyAoSU9DVSkuIEZvciBETUEgY29oZXJlbnQgYWNjZXNzZXMsIEJJVCgzNikgbXVzdCBiZQo+
PiBzZXQgaW4gRE1BIGFkZHJlc3Nlcy4KPgo+IEp1c3QgcXVpY2sgcXVlc3Rpb24sIGl0IHNlZW1z
IGxpa2UgdGhpcyBzcGVjaWFsIGRyaXZlciBpcyBvbmx5IGFwcGx5aW5nIGEKPiBmaXhlZCBvZmZz
ZXQgKDEgPDwgMzYpIHRvIHRoZSBETUEgcGh5c2ljYWwgYWRkcmVzcywgY2FuIHdlIGFjaGlldmUg
dGhhdCB3aXRoIGRtYS1yYW5nZXMKPiBwcm9wZXJ0eSBpbiBEZXZpY2VUcmVlPwo+Cj4gSSBiZWxp
dmU6Cj4gYGBgCj4gZG1hLWNvaGVyZW50Owo+ICAgICAgICAgICAgICAjIEJ1cyBhZGRyICAgICAg
ICMgUGh5cyAgIyBTaXplCj4gZG1hLXJhbmdlcyA9IDwweDEwIDB4MDAwMDAwMDAgMHgwIDB4MCAw
eDEwIDA+Owo+IGBgYAo+Cj4gV2lsbCBkbyB0aGUgam9iLgoKVGhpcyBpcyBwZXJmZWN0ISBDYW4g
Y29uZmlybSBpdCB3b3JrcyBqdXN0IGZpbmUuIFdoZW4geW91IGFyZSBzdHVjayBpbgphbiBpc3N1
ZSBmb3IgdG9vIGxvbmcgeW91IGRvbid0IHRoaW5rIGFib3V0IGJyb2FkZW5pbmcgeW91ciB2aWV3
cG9pbnQuCgpUaGFua3MsCgotLQpUaMOpbyBMZWJydW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
