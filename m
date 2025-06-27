Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B4DC7EE33
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGp2IMUlVa/gINWgnPKDCTmYG7u58ZjIyHhSY0AMpAc=; b=WbuEBVPv4xhFdd
	zb+aTwwu731tmoY0D3BF3VsgshxpM8mnr3+CK6gd8xp+AIyurlb61f/70WjF10ZVjJmKye/n3/dz9
	ORMJ0QNrSa+MnaLC0Lb/XGUwzio2kqezhMbd2/nfSPwnbCm2kze50o/spkO4sXgrllfvS9Sgi8ul4
	eRLiXUQXi7YrB/ZCwpn5Hz2pdRM3FfwCL2V/X0qsWJABKarEkP4rto5nKNguvWS0RtJdwsTecDDYf
	LYfiX8D+g9sz8Zhn10jKpRPuMGOtDpKgmjn8GN+L3jxTV0KoBcHWYQYvK5sfsJqC7Emau98aOq1iB
	GiqbFgig4QtB8tF8TDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55p-0000000E3L4-3rje;
	Fri, 27 Jun 2025 09:09:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55i-0000000E3Bg-3AD4
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A243D43911;
	Fri, 27 Jun 2025 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=764q/32vKjstwItxOKqrb01qSO2kgVuBA+p7s3qow7w=;
	b=iOX5WE+Xcq5jYirgDUQY7/vNRFYebqnoRLIAmnLi/lMza6u+WYF8dOOOmNptG81AyovoWv
	2cBjn0DYEckufCXuFQTc2cUDDAQ9fndBin6tsGZurOdLE7TyzgoeAO/kQU6ZC123Sg4YPq
	6blHw4BupVTP/1sc5G2kl5yPemz5YJdqE1UdqGRWSOLumCnGHgAtnxpT6TZvFjd2zTH0ur
	+YvQBUflaZdtoFglqin39LqAJtzSq4elvUCX0RkCD7UO8mk+QNvMWvKixNxHEPoK2ri3Yr
	yzbeW18Bm65QyBajK3Y296hS2qFR4534r1JJ5sqQZuXq7j6bQV0KFxh9cgrLrA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:59 +0200
Subject: [PATCH net-next v2 13/18] net: macb: avoid double endianness swap
 in macb_set_hwaddr()
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-13-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020950_968428_9630493A 
X-CRM114-Status: GOOD (  10.05  )
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

d3JpdGVsKCkgZG9lcyBhIENQVS0+TEUgY29udmVyc2lvbi4gRHJvcCBtYW51YWwgY3B1X3RvX2xl
KigpIGNhbGxzLgoKT24gbGl0dGxlLWVuZGlhbiBzeXN0ZW06CiAtIGNwdV90b19sZTMyKCkgaXMg
YSBuby1vcCAoTEUtPkxFKSwKIC0gd3JpdGVsKCkgaXMgYSBuby1vcCAoTEUtPkxFKSwKIC0gZGV2
X2FkZHIgd2lsbCB0aGVyZWZvcmUgbm90IGJlIHN3YXBwZWQgYW5kIHdyaXR0ZW4gYXMtaXMuCgpP
biBiaWctZW5kaWFuIHN5c3RlbToKIC0gY3B1X3RvX2xlMzIoKSBpcyBhIHN3YXAgKEJFLT5MRSks
CiAtIHdyaXRlbCgpIGlzIGEgc3dhcCAoQkUtPkxFKSwKIC0gZGV2X2FkZHIgd2lsbCB0aGVyZWZv
cmUgYmUgc3dhcHBlZCB0d2ljZSBhbmQgd3JpdHRlbiBhcyBhIEJFIHZhbHVlLgoKVGhpcyB3YXMg
Zm91bmQgdXNpbmcgc3BhcnNlOgogICDin6kgbWFrZSBDPTIgZHJpdmVycy9uZXQvZXRoZXJuZXQv
Y2FkZW5jZS9tYWNiX21haW4ubwogICB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25t
ZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKICAgICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IFt1
c2VydHlwZV0gYm90dG9tCiAgICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdCiAg
IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5
cGVzKQogICAgICBleHBlY3RlZCB1bnNpZ25lZCBzaG9ydCBbdXNlcnR5cGVdIHRvcAogICAgICBn
b3QgcmVzdHJpY3RlZCBfX2xlMTYgW3VzZXJ0eXBlXQogICAuLi4KCkZpeGVzOiA4OWU1Nzg1ZmM4
YTYgKCJbUEFUQ0hdIEF0bWVsIE1BQ0IgZXRoZXJuZXQgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTog
VGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2JfbWFpbi5jCmluZGV4IDU3OGU3MmM3NzI3ZDRmNTc4NDc4ZmYyYjNkMGE2MzE2MzI3Mjcx
YjEuLjM0MjIzZGFkMmQwMWFlNGJjZWZjMDgyM2M4NjhhNjdmNTk0MzU2MzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwpAQCAtMjY1LDkgKzI2NSw5IEBAIHN0YXRp
YyB2b2lkIG1hY2Jfc2V0X2h3YWRkcihzdHJ1Y3QgbWFjYiAqYnApCiAJdTMyIGJvdHRvbTsKIAl1
MTYgdG9wOwogCi0JYm90dG9tID0gY3B1X3RvX2xlMzIoKigodTMyICopYnAtPmRldi0+ZGV2X2Fk
ZHIpKTsKKwlib3R0b20gPSAqKCh1MzIgKilicC0+ZGV2LT5kZXZfYWRkcik7CiAJbWFjYl9vcl9n
ZW1fd3JpdGVsKGJwLCBTQTFCLCBib3R0b20pOwotCXRvcCA9IGNwdV90b19sZTE2KCooKHUxNiAq
KShicC0+ZGV2LT5kZXZfYWRkciArIDQpKSk7CisJdG9wID0gKigodTE2ICopKGJwLT5kZXYtPmRl
dl9hZGRyICsgNCkpOwogCW1hY2Jfb3JfZ2VtX3dyaXRlbChicCwgU0ExVCwgdG9wKTsKIAogCWlm
IChnZW1faGFzX3B0cChicCkpIHsKCi0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
