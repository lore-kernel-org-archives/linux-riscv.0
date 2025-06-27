Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17EFC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu5f6b2jYVEIfGxOWVhhlG/1DNrJpI6Cy5lI17BlQbI=; b=YusYyMcuTJbGFJ
	xrk7qm3jowxRQvz/8MrXw++OulB/GdJoffClRICFRe5aOQg9YOj8QI1N/xUkhFZuK6Lo3RQF4lqwR
	9lzeiuyoHEMUTgRO5UIjvG7ixFvR2D6D5/npToBUePXPuT1ugXA2QZgF2y5eC6XiSbW1y66d905xH
	8XkYGtHCLi3UcW7ZQ+0BWCwgwKCdZ+2ny3Hgp2xZsKl0Co/S+OgpaLVfCSda7lXotqrZLVkXIZ3pG
	Wt7bH9hCWrJXG3deshVgDR5rJuLbbLwrOJu6rpa24wtr7KlbKL/8gjjGYw4i/SrDURILZylZifVOO
	pbwWII2r4rElc6uUSBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55M-0000000E2vZ-2KKa;
	Fri, 27 Jun 2025 09:09:28 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55K-0000000E2uQ-2LZt
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DCA343210;
	Fri, 27 Jun 2025 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJb7+Mp6BGJDaUO3jvKm6IIW/KNLWsVCq4lf1fcka90=;
	b=K4rff3AQtk2c6tRg1R6ozLULQ98HTFfJpaZlobXJKSQXXd9ZoPCD14Y8ABVbBC4J0W3NjV
	kbal8NuRV8q31FdAm1540Mc7TQN707ku9qUsAoqmbFyGcryuzTAlSeQo6sfI2UfdpKtQH/
	MRoX8lDTHnVmgkVjUG1JGStZdp1toRA6sVuEFNxPq5Xz4jNwwqvfqYCJ2W/Qxmx+w9HUFm
	Wz3whPC9z2Ktp/o8FudHPWxnq0vcqlvH9hL3IYBjuU2QR8RMGKu/aERvJoOJ2UR6lsfwC4
	EEexkmNi9P6u+X/fF+qs+vzZFZ5k06z2E5H1C+yT8+FDipLay4Rx5dDWpNgW4A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:47 +0200
Subject: [PATCH net-next v2 01/18] dt-bindings: net: cdns,macb: sort
 compatibles
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-1-ff8207d0bb77@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020926_747242_D765807D 
X-CRM114-Status: UNSURE (   7.43  )
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

Q29tcGF0aWJsZXMgaW5zaWRlIHRoaXMgZW51bSBhcmUgc29ydGVkLWlzaC4gTWFrZSBpdCBzb3J0
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlh
bWwgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvY2RucyxtYWNiLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L2NkbnMsbWFjYi55YW1sCmluZGV4IDQ0MjNkMDM4YjI0MzZjY2YwZDRjN2YxNjE1MTBlZGJjNWRh
M2YxMzEuLmRmODgzMzU0YzdlNjM1MDk5ODg1ZGE0MmU0NjA0ZTFjMzFiMDVjNzIgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFt
bApAQCAtNDcsMTcgKzQ3LDE3IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgLSBjb25zdDogY2Ru
cyxtYWNiICAgICAgICAgICMgR2VuZXJpYwogCiAgICAgICAtIGVudW06Ci0gICAgICAgICAgLSBh
dG1lbCxzYW1hNWQyOS1nZW0gICAgICAgICMgR0VNIFhMIElQICgxMC8xMDApIG9uIEF0bWVsIHNh
bWE1ZDI5IFNvQ3MKICAgICAgICAgICAtIGF0bWVsLHNhbWE1ZDItZ2VtICAgICAgICAgIyBHRU0g
SVAgKDEwLzEwMCkgb24gQXRtZWwgc2FtYTVkMiBTb0NzCisgICAgICAgICAgLSBhdG1lbCxzYW1h
NWQyOS1nZW0gICAgICAgICMgR0VNIFhMIElQICgxMC8xMDApIG9uIEF0bWVsIHNhbWE1ZDI5IFNv
Q3MKICAgICAgICAgICAtIGF0bWVsLHNhbWE1ZDMtZ2VtICAgICAgICAgIyBHaWdhYml0IElQIG9u
IEF0bWVsIHNhbWE1ZDMgU29DcwogICAgICAgICAgIC0gYXRtZWwsc2FtYTVkNC1nZW0gICAgICAg
ICAjIEdFTSBJUCAoMTAvMTAwKSBvbiBBdG1lbCBzYW1hNWQ0IFNvQ3MKKyAgICAgICAgICAtIGNk
bnMsZW1hYyAgICAgICAgICAgICAgICAgIyBHZW5lcmljCisgICAgICAgICAgLSBjZG5zLGdlbSAg
ICAgICAgICAgICAgICAgICMgR2VuZXJpYworICAgICAgICAgIC0gY2RucyxtYWNiICAgICAgICAg
ICAgICAgICAjIEdlbmVyaWMKICAgICAgICAgICAtIGNkbnMsbnA0LW1hY2IgICAgICAgICAgICAg
IyBOUDQgU29DIGRldmljZXMKICAgICAgICAgICAtIG1pY3JvY2hpcCxzYW1hN2c1LWVtYWMgICAg
IyBNaWNyb2NoaXAgU0FNQTdHNSBldGhlcm5ldCBpbnRlcmZhY2UKICAgICAgICAgICAtIG1pY3Jv
Y2hpcCxzYW1hN2c1LWdlbSAgICAgIyBNaWNyb2NoaXAgU0FNQTdHNSBnaWdhYml0IGV0aGVybmV0
IGludGVyZmFjZQogICAgICAgICAgIC0gc2lmaXZlLGZ1NTQwLWMwMDAtZ2VtICAgICAjIFNpRml2
ZSBGVTU0MC1DMDAwIFNvQwotICAgICAgICAgIC0gY2RucyxlbWFjICAgICAgICAgICAgICAgICAj
IEdlbmVyaWMKLSAgICAgICAgICAtIGNkbnMsZ2VtICAgICAgICAgICAgICAgICAgIyBHZW5lcmlj
Ci0gICAgICAgICAgLSBjZG5zLG1hY2IgICAgICAgICAgICAgICAgICMgR2VuZXJpYwogCiAgICAg
ICAtIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKCi0tIAoyLjUwLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
