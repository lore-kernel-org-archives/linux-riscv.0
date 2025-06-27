Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D9C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLbTGMU/rcj+3sU04WoLEbfM0W7tPtMx8SKiCbOPWG4=; b=lY2gIVXz5auv/+
	yqJsJ6jOB03B5QYZ8AC57s+MArnG+hjYk7211+PYXyQmyZrwsPuW4MSKLNV9rgvEXI8nZNSYZu7vv
	76bD9lqHAPBWR1m64E+en87f7wtF12eX8O/liqzzTk2MvsRDQcSRHDX7UlQxZEig5ESfQfz+BsSu+
	e3OeJL15rhiF6/w/zEHZaKIn+4vk4T/E8IN43F3NW6diOAp2jM759pdNWe6QvFveIJEAEfP+Qsask
	Z5kfsJtWf+Ei2bJrdhRjCTgzIs8W7GohIDSMCLlst38xXFC4COZFkCcMt7mkSOO7i9w03/rKcdoGd
	t27DUSP3LMdClY/rZ9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55q-0000000E3MU-3epe;
	Fri, 27 Jun 2025 09:09:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55j-0000000E3Cg-48ga
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07EE64390E;
	Fri, 27 Jun 2025 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOF962C1pWAQeqqgqhEI2nW4AorjQGIkkBWExt27BPw=;
	b=XGHt6VWZC1r9d7yYQ16BZfYb/Lx8RNma4Gntm5Wt8Z0+GDtWsap/v7oaQh15bE+l99o/If
	X7389g2Udt02k/8e0PdcLnGT+p9/UcvC0cH68UGiTdmRcL22yta8Lo7OR0q3huHcANF8M6
	FmCuVb2JK3PEtckQKIBxJfrYXweNtbof7/Tac+52G1NLCureNKvAR0wBP7OAXFpWBdWRWM
	3s2TwmJHHYnUax1PqX0who/aCQkR243q7C0U+zM3HFPwndOZSQw01sAn2E/t2qNDNT0ldO
	/GcgXEDiXJxV5ts60EG9Fs+vEyRJka0khKKcJTlH0wwyH/LRsMPl4YnPopf+vA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:00 +0200
Subject: [PATCH net-next v2 14/18] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-14-ff8207d0bb77@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020952_187773_64EB9AC9 
X-CRM114-Status: GOOD (  12.43  )
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

TFNPIGlzIHJ1bnRpbWUtZGV0ZWN0ZWQgdXNpbmcgdGhlIFBCVUZfTFNPIGZpZWxkIGluc2lkZSBy
ZWdpc3RlcgpkZXNpZ25jZmdfZGVidWc2L0dFTV9EQ0ZHNi4gQWxsb3cgZGlzYWJsaW5nIHRoYXQg
ZmVhdHVyZSBpZiBpdCBpcwpicm9rZW4gYnkgdXNpbmcgc3RydWN0IG1hY2JfY29uZmlnLT5jYXBz
LgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KU2lnbmVkLW9mZi1i
eTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgIHwgMSArCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgNiArKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L2NhZGVuY2UvbWFjYi5oIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgK
aW5kZXggZDQyYzgxY2Y0NDFjZTQzNWNhZDM4ZTJkZmQ3NzliMGU2YTE0MWJmMy4uZTVkZTY1NDk4
NjE5NjVlMjgyMzA0NGQ4MWI2YWJjMjBkMmIyN2NlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiLmgKQEAgLTczNiw2ICs3MzYsNyBAQAogI2RlZmluZSBNQUNCX0NBUFNfTkVFRF9UU1VD
TEsJCQlCSVQoMTApCiAjZGVmaW5lIE1BQ0JfQ0FQU19RVUVVRV9ESVNBQkxFCQkJQklUKDExKQog
I2RlZmluZSBNQUNCX0NBUFNfUlNDX0NBUEFCTEUJCQlCSVQoMTIpCisjZGVmaW5lIE1BQ0JfQ0FQ
U19OT19MU08JCQlCSVQoMTMpCiAjZGVmaW5lIE1BQ0JfQ0FQU19QQ1MJCQkJQklUKDI0KQogI2Rl
ZmluZSBNQUNCX0NBUFNfSElHSF9TUEVFRAkJCUJJVCgyNSkKICNkZWZpbmUgTUFDQl9DQVBTX0NM
S19IV19DSEcJCQlCSVQoMjYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRl
bmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
YwppbmRleCAzNDIyM2RhZDJkMDFhZTRiY2VmYzA4MjNjODY4YTY3ZjU5NDM1NjM4Li5mOWEzYTVj
YWViY2FmZTNkOTE5N2EzYmM3NjgxYjY0NzM0ZDdhYzkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTQzNDYsOCArNDM0NiwxMCBAQCBzdGF0aWMgaW50IG1h
Y2JfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCS8qIFNldCBmZWF0dXJlcyAq
LwogCWRldi0+aHdfZmVhdHVyZXMgPSBORVRJRl9GX1NHOwogCi0JLyogQ2hlY2sgTFNPIGNhcGFi
aWxpdHkgKi8KLQlpZiAoR0VNX0JGRVhUKFBCVUZfTFNPLCBnZW1fcmVhZGwoYnAsIERDRkc2KSkp
CisJLyogQ2hlY2sgTFNPIGNhcGFiaWxpdHk7IHJ1bnRpbWUgZGV0ZWN0aW9uIGNhbiBiZSBvdmVy
cmlkZGVuIGJ5IGEgY2FwCisJICogZmxhZyBpZiB0aGUgaGFyZHdhcmUgaXMga25vd24gdG8gYmUg
YnVnZ3kgKi8KKwlpZiAoIShicC0+Y2FwcyAmIE1BQ0JfQ0FQU19OT19MU08pICYmCisJICAgIEdF
TV9CRkVYVChQQlVGX0xTTywgZ2VtX3JlYWRsKGJwLCBEQ0ZHNikpKQogCQlkZXYtPmh3X2ZlYXR1
cmVzIHw9IE1BQ0JfTkVUSUZfTFNPOwogCiAJLyogQ2hlY2tzdW0gb2ZmbG9hZCBpcyBvbmx5IGF2
YWlsYWJsZSBvbiBnZW0gd2l0aCBwYWNrZXQgYnVmZmVyICovCgotLSAKMi41MC4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
