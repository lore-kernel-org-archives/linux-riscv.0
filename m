Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA405109C035
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pc8Sfyp7wXO71Xu1jES/J0C7FqAGrvObwyL1XeJ+eo=; b=qhcL/aFiIFXF87
	HdLoXChSH9ufJx4TsFwViFclYaZd8aNN4B+Yu8Uf/nUy0uwkrkVieMKb6bRL3shqZkfsyjfwqqTw8
	JkTldmad0r1LofdWo9I0HQ7qFLNzAZgLGfo6l+K6chYBgE+bZQlKAk6yI5zyHbU2/RSNIr/NN5KXS
	6ieQsqJ0h1iDtfl2r/VlvJ0KvBh+XT2NttgR9pBlA9WgWLHJRwivW6K4s2Q6Fnze2G+1FFQ8+Odj2
	OQRvzb7QvkyL7zsK475egBw4f38OG4po8HQ4gyTiuzt9Q9LBgHDBJgtxpP/oUo2/+ejHiDKMVAbA0
	pG6wBBGkjfgYOiDOfGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7M-00000003tXq-0ZzK;
	Wed, 25 Mar 2026 16:30:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7J-00000003tVf-1U4e
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E80D540931;
	Wed, 25 Mar 2026 16:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB96C2BCB0;
	Wed, 25 Mar 2026 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456200;
	bh=8wFQT0scIZH4MoUOnJP+cg31O9j6k3cRCJbdld+VpGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdwSgWBvgGBOmPe+dNJnjV4t34qvmdH8AHx1XYdA1Sox/Wtcpp+9i/KQctVOBXmpD
	 SacGnBJkzucQTgg1Gf1TCv0ebJsC9+//YtyDQzoNWQyqPWHYfr0FqehCxftP3rCu9a
	 LW9VLTCbLs1/TXIpxPj9Dy23qzig5baukpNkMwflRSul4uNPCmuclrm+XHE70/8pNr
	 ezlRe5JeKeRE4qOaMCFKILuggxfhVJNbSyplXYQhsIZenQorCNS2Wu8cZiO60YSZzP
	 3OSdL7r7GsYMrrbOpGba+iJd5CTT8yRh4IZaFJBe7zuVTYJRTz9ZbfUdcbOlK+OnRH
	 DFK+t7oiuZCLw==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 12/14] net: macb: runtime detect MACB_CAPS_USRIO_DISABLED
Date: Wed, 25 Mar 2026 16:28:16 +0000
Message-ID: <20260325-compactly-glue-f426a2e68904@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NgI/Gdg2EZ/vK6ibYq/phTDUhc8w3AlLuS5OcuYYPjI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM3Fzpk1/ptRdej3Ppez2nwZR/kvS1cua0+1npH5e Xb2/Lh1HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZgI1wNGhoknijZ277QNEter ZUp1Ofvyizfb7ZDg159Nt59/sCs7LpuRoW1nnFzC89VR+jOW9P8PXe71b8Vq/f1HahsYb/72yFa bxAIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093001_439906_37297DDA 
X-CRM114-Status: GOOD (  11.15  )
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

RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCkRDRkcxIChkZXNp
Z24gY29uZmlnIDEgcmVnaXN0ZXIpIGNhcnJpZXMgYSBiaXQgaW5kaWNhdGluZyB3aGV0aGVyIFVz
ZXIKSS9PIGZlYXR1cmUgaGFzIGJlZW4gZW5hYmxlZCBvciBub3QuIFRoZSBNQUNCL0dFTSBkcml2
ZXIgaGFzIGEgY2FwIGZsYWcKaW5kaWNhdGluZyB0aGF0IEhXIGhhcyB0aGUgZmVhdHVyZSBkaXNh
YmxlZCAoZGVmYXVsdCBpcyBlbmFibGVkKS4gQWRkCnRoZSBtaXNzaW5nIGNvbm5lY3Rpb24gYmV0
d2VlbiBEQ0ZHMSBiaXQgYW5kIE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRC4KCkluZGlyZWN0IGlt
cGFjdDogYXZvaWQgdXNlbGVzcyB3cml0ZWwoKSBvbiBVU0VSSU8gcmVnaXN0ZXI7IHRoaXMgaXMg
bm90CmFuIGltcG9ydGFudCBmaXggYmVjYXVzZSBVU0VSSU8gaXMgYW55d2F5IHJlYWQtb25seSB3
aGVuIGZlYXR1cmUgaXMKZGlzYWJsZWQuCgpJZiBmb3Igc29tZSByZWFzb24gYSBjb21wYXRpYmxl
IHNldHMgVVNSSU9fRElTQUJMRUQgYnV0IERDRkcxIGluZGljYXRlcwppdCBpcyBlbmFibGVkLCB3
ZSBzdGlsbCBrZWVwIHRoZSBkaXNhYmxlZCBjYXBhYmlsaXR5IGZsYWcuIFRoaXMgZW5zdXJlcwp3
ZSBkb24ndCBicmVhayAiY2RucyxucDQtbWFjYiIgdGhhdCBzZXRzIHRoZSBmbGFnIGZyb20gY29t
cGF0aWJsZSBtYXRjaApkYXRhLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Iu
aCAgICAgIHwgMiArKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyB8
IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
YWRlbmNlL21hY2IuaAppbmRleCA4ZTUzMDVmOWE3NTQ1Li4xNjUyN2RiYWI4NzVkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAorKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaApAQCAtNTI0LDYgKzUyNCw4IEBACiAjZGVmaW5lIEdF
TV9JUlFDT1JfU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9EQldERUZfT0ZGU0VUCQkJMjUKICNkZWZp
bmUgR0VNX0RCV0RFRl9TSVpFCQkJCTMKKyNkZWZpbmUgR0VNX1VTRVJJT19PRkZTRVQJCQk5Cisj
ZGVmaW5lIEdFTV9VU0VSSU9fU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9OT19QQ1NfT0ZGU0VUCQkJ
MAogI2RlZmluZSBHRU1fTk9fUENTX1NJWkUJCQkJMQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2Fk
ZW5jZS9tYWNiX21haW4uYwppbmRleCA1OGQ4OWI5ZTJmMDhlLi5iOTc5MWJiYmVjOGJmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTQ1ODgsNiArNDU4OCw4
IEBAIHN0YXRpYyB2b2lkIG1hY2JfY29uZmlndXJlX2NhcHMoc3RydWN0IG1hY2IgKmJwLAogCQkJ
YnAtPmNhcHMgfD0gTUFDQl9DQVBTX0lTUl9DTEVBUl9PTl9XUklURTsKIAkJaWYgKEdFTV9CRkVY
VChOT19QQ1MsIGRjZmcpID09IDApCiAJCQlicC0+Y2FwcyB8PSBNQUNCX0NBUFNfUENTOworCQlp
ZiAoIShkY2ZnICYgR0VNX0JJVChVU0VSSU8pKSkKKwkJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19V
U1JJT19ESVNBQkxFRDsKIAkJZGNmZyA9IGdlbV9yZWFkbChicCwgRENGRzEyKTsKIAkJaWYgKEdF
TV9CRkVYVChISUdIX1NQRUVELCBkY2ZnKSA9PSAxKQogCQkJYnAtPmNhcHMgfD0gTUFDQl9DQVBT
X0hJR0hfU1BFRUQ7Ci0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
