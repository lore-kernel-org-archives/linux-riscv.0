Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F265410775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryahtXV9KZx/es4CTeNMtjeVVSxzFWAULRn2/aWQs7E=; b=xmGbx7oPEVJ6oB
	KpmBcuaBTLNyuZIgJrAVkE2YwHxSqgrwlS4p/6sle+L7zzWrnCPBSnDYb8x3nxoD1wsIGT4lEg0oQ
	PwJC+u/57uqnqUErrRbSw+N2IWQTcv6JWo/vLjXsWIXZbLlmIbggZRF/Bwu9PaTA3sQrBbgEgo/zL
	+a3x1a+TXwy4EeqlKZorFFBCbhmoZ3wzml+sLknjGz7L/uV0A12AXOoFXvXp9FyRVJ5UuTOvy1whw
	rajeSZUwgdVuN9AdKYUjutB8Oj0aqTyswkMOQKtMNTfpSMvJvBIGCWxGlpyGIJDTSbb1W0F1NUuSg
	V9Xzkeq7uxHdnZFXB8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tv6-00000008yMA-326E;
	Wed, 18 Mar 2026 16:38:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tv4-00000008yJ4-0Ys5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 899F760054;
	Wed, 18 Mar 2026 16:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F363BC2BCAF;
	Wed, 18 Mar 2026 16:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851933;
	bh=i7QiZWLKSiDuy+JWZoWlsnw6MxIl6xp8yCXQ6R5f7pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OnOzb99IJdzWRWPppb1WwQY3nqJoJLbNJyKhbBRYNPyDj33oM8Y7KNUf++z49F4tr
	 08LHUHNmcTR34Lz24Rvg6IjBI7XmMfwWPebLtOTS/+cQUVoCqa0cuVRrA1IrzWHthQ
	 7ijkzOPszVg/blmXINrMkRgEZ0Z/FYBsLG3Ly6IeRcrPteuFrWThhrPYcToEWoPveP
	 cc054tjPLMUZwlfn8y/l/SD+oivRZsZCQhddLh0TFijA0XGitHIgtmC/R4BeRfOijJ
	 KW5GsXXQQdiYj6ikQz86p38VDC2tXca1d4A1ugycXVQSEre4WR4AzGlF/Ymte6v/LA
	 M3OpsC7l75SNg==
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
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v4 11/13] net: macb: runtime detect MACB_CAPS_USRIO_DISABLED
Date: Wed, 18 Mar 2026 16:37:42 +0000
Message-ID: <20260318-fifth-getaway-2e50f7a71eed@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Bd2gbW7fOvjC1AVjUN6Hv9MmZ1hZns7eUKZVvI7xatU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlx+2fahvr/SaZ1sdZuHf+XuE5m/v7Rf1bf7a8I30 26No5tdRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbi18Twh3fVy7Muuh4BX9g5 u+63V0yYsFdh9dPEHP/L0pKL9tvmXGVk6LY57tLFzTlRJsX050+ry48uNj92eLdpwtaX786eDr7 6iQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
YWRlbmNlL21hY2IuaAppbmRleCBjZGI5ZmIyMjE4YzZmLi5iYzAyNTcxOWY2MDA4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAorKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaApAQCAtNTE4LDYgKzUxOCw4IEBACiAjZGVmaW5lIEdF
TV9JUlFDT1JfU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9EQldERUZfT0ZGU0VUCQkJMjUKICNkZWZp
bmUgR0VNX0RCV0RFRl9TSVpFCQkJCTMKKyNkZWZpbmUgR0VNX1VTRVJJT19PRkZTRVQJCQk5Cisj
ZGVmaW5lIEdFTV9VU0VSSU9fU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9OT19QQ1NfT0ZGU0VUCQkJ
MAogI2RlZmluZSBHRU1fTk9fUENTX1NJWkUJCQkJMQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2Fk
ZW5jZS9tYWNiX21haW4uYwppbmRleCAzZTBhYjIzZTliOWIwLi5iMTFlZjcwMzU3NWIwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTQzMzAsNiArNDMzMCw4
IEBAIHN0YXRpYyB2b2lkIG1hY2JfY29uZmlndXJlX2NhcHMoc3RydWN0IG1hY2IgKmJwLAogCQkJ
YnAtPmNhcHMgfD0gTUFDQl9DQVBTX0lTUl9DTEVBUl9PTl9XUklURTsKIAkJaWYgKEdFTV9CRkVY
VChOT19QQ1MsIGRjZmcpID09IDApCiAJCQlicC0+Y2FwcyB8PSBNQUNCX0NBUFNfUENTOworCQlp
ZiAoIShkY2ZnICYgR0VNX0JJVChVU0VSSU8pKSkKKwkJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19V
U1JJT19ESVNBQkxFRDsKIAkJZGNmZyA9IGdlbV9yZWFkbChicCwgRENGRzEyKTsKIAkJaWYgKEdF
TV9CRkVYVChISUdIX1NQRUVELCBkY2ZnKSA9PSAxKQogCQkJYnAtPmNhcHMgfD0gTUFDQl9DQVBT
X0hJR0hfU1BFRUQ7Ci0tIAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
