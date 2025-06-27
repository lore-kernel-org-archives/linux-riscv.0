Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DC5C83026
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BB9qI/dol4lGlNBw/gHcTosg7/7V/DwiBhsqokq+pIs=; b=EmaVSK5hY/3JVR
	DlhgJDplKtIDTm2XJrzHjF9fED2bSdkZG6aAyQXtcuD/B5RYfeSaKQNe079M3ScMDOqI9Mo4fxFJq
	+h+6r7RXCao2mgpyP8JPZBmqcZpJWoe5cWseL8qoU971UeujXonVsSaDDNy8EqoWLtBI+YimXEfiU
	RorcZkxNv+6dY3Ky6XO163cUYJQQVnYEcYIHnmTnajKGesthZTUqkiyIXbi6K6lpPA0K4P5LAheB0
	s4htOMHEi9Hwp5ypJSt/IGUH1POdqBTtfY51NFs/S2mqMVYj9Six9KSXljxbI956fZk3XbmckwRL3
	xH5T2NRk8xWuherihLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Fa-0000000EFng-0zBH;
	Fri, 27 Jun 2025 10:24:06 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55Y-0000000E31F-14AS
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 374FF4321C;
	Fri, 27 Jun 2025 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwT4ADmpHPpob5qbc2qhRm7l5wdMmdVH84yZ0OKu8vE=;
	b=VSsgKv1df/q2uVY4B8kWDO4I9YAcA1nBYkJExCkyEN1wp9mOAwNHibetsnsgpEjj9mXEQh
	MuX4sz9D/BVTkSmyu1MXXQuVhFhSmqYklq1TeayUUIxUke5ewyLdww54k+LIMZEm4BbzOh
	3vQMHmVr+inUziJcQVw2GYOrYaVh9IVAbK2Ei9j1IJlSwxvyArEWiW0z6v7X45XeD9GzZa
	WLaHIYAiCzEkyEpSQtI6jIQdKVhfLsk9VrpQ8hZwi0N4g/vltrwndjk0p79ajDTJQWYQ4T
	X6kWiUeM9R9fxiiN7hIMq9X6ROzdAnpaqAZJtZDVQ5Rg/S04OY38oPmpE7c0wQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:52 +0200
Subject: [PATCH net-next v2 06/18] net: macb: Remove local variables
 clk_init and init in macb_probe()
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-6-ff8207d0bb77@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020940_445082_59AB1132 
X-CRM114-Status: GOOD (  12.57  )
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

UmVtb3ZlIGxvY2FsIHZhcmlhYmxlcyBjbGtfaW5pdCBhbmQgaW5pdC4gVGhvc2UgZnVuY3Rpb24g
cG9pbnRlcnMgYXJlCmFsd2F5cyBlcXVpdmFsZW50IHRvIG1hY2JfY29uZmlnLT5jbGtfaW5pdCBh
bmQgbWFjYl9jb25maWctPmluaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8u
bGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFj
Yl9tYWluLmMgfCAxMyArKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
YWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21h
aW4uYwppbmRleCA1M2FhZjZiMDhlMzlhNDViZGU1YWY2MWEwNWZiMmI5ZmQ2NTNiMmU3Li42Yzhh
MzRlNDBiNzdlYTM3ZWQyNWMyYjA0MTQ0NDBjZDNmNjk2MmMzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTUxNjYsMTAgKzUxNjYsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1hY2JfY29uZmlnIGRlZmF1bHRfZ2VtX2NvbmZpZyA9IHsKIHN0YXRpYyBpbnQg
bWFjYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCWNvbnN0IHN0cnVj
dCBtYWNiX2NvbmZpZyAqbWFjYl9jb25maWcgPSAmZGVmYXVsdF9nZW1fY29uZmlnOwotCWludCAo
KmNsa19pbml0KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICosIHN0cnVjdCBjbGsgKiosCi0JCQlz
dHJ1Y3QgY2xrICoqLCBzdHJ1Y3QgY2xrICoqLCAgc3RydWN0IGNsayAqKiwKLQkJCXN0cnVjdCBj
bGsgKiopID0gbWFjYl9jb25maWctPmNsa19pbml0OwotCWludCAoKmluaXQpKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKikgPSBtYWNiX2NvbmZpZy0+aW5pdDsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJc3RydWN0IGNsayAqcGNsaywgKmhjbGsgPSBOVUxM
LCAqdHhfY2xrID0gTlVMTCwgKnJ4X2NsayA9IE5VTEw7CiAJc3RydWN0IGNsayAqdHN1X2NsayA9
IE5VTEw7CkBAIC01MTkxLDE0ICs1MTg3LDExIEBAIHN0YXRpYyBpbnQgbWFjYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpt
YXRjaDsKIAogCQltYXRjaCA9IG9mX21hdGNoX25vZGUobWFjYl9kdF9pZHMsIG5wKTsKLQkJaWYg
KG1hdGNoICYmIG1hdGNoLT5kYXRhKSB7CisJCWlmIChtYXRjaCAmJiBtYXRjaC0+ZGF0YSkKIAkJ
CW1hY2JfY29uZmlnID0gbWF0Y2gtPmRhdGE7Ci0JCQljbGtfaW5pdCA9IG1hY2JfY29uZmlnLT5j
bGtfaW5pdDsKLQkJCWluaXQgPSBtYWNiX2NvbmZpZy0+aW5pdDsKLQkJfQogCX0KIAotCWVyciA9
IGNsa19pbml0KHBkZXYsICZwY2xrLCAmaGNsaywgJnR4X2NsaywgJnJ4X2NsaywgJnRzdV9jbGsp
OworCWVyciA9IG1hY2JfY29uZmlnLT5jbGtfaW5pdChwZGV2LCAmcGNsaywgJmhjbGssICZ0eF9j
bGssICZyeF9jbGssICZ0c3VfY2xrKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCkBAIC01
MzM2LDcgKzUzMjksNyBAQCBzdGF0aWMgaW50IG1hY2JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAkJYnAtPnBoeV9pbnRlcmZhY2UgPSBpbnRlcmZhY2U7CiAKIAkvKiBJUCBz
cGVjaWZpYyBpbml0ICovCi0JZXJyID0gaW5pdChwZGV2KTsKKwllcnIgPSBtYWNiX2NvbmZpZy0+
aW5pdChwZGV2KTsKIAlpZiAoZXJyKQogCQlnb3RvIGVycl9vdXRfZnJlZV9uZXRkZXY7CiAKCi0t
IAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
