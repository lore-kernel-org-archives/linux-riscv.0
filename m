Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787E109C035
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQchSVGR0+oWi1fFHUv9o+Gb7WxkbLiL4bqta5D8XpI=; b=Yqr8k1dO2Yud/q
	8UWPaSTESXmBVhqKaWs5sr08uoqbFneCCODOI79gus6opU2RujIgMCT7AsR8pZW9BGbsULBzgPjiK
	NwLjuyNXsUnHOBEPOnwLI0lT51yA9iOzOo1HArSIj1duReIy2P5cEXpyZPv9FOtyBYJt/JqKcEvFy
	WxTlYaRYkuup83m3XL3YnoMxJnDq0jqLmpfhjgzPHuIIvp9V1XfTwaSiZ27Lnk0dIn+Fk8JPTGlhK
	lQWBBorCea+IdwzbnR0LvPoj9gFeZlB9G2pKKDXWGB7HVz8MLwXGu8BGlCCS4pCVtc92YoxvnTCAI
	OZE6UoSY13qbL/Q9IX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7X-00000003tgA-3Co8;
	Wed, 25 Mar 2026 16:30:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7U-00000003teQ-41bB
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7BE542AD5;
	Wed, 25 Mar 2026 16:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD29C2BCB1;
	Wed, 25 Mar 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456212;
	bh=oW12N519I0kw0CyJPWIc3UJsn8XZap0iK40b96AjYO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V0Enm9LUCor7mkbEYMlAspxh+4ssXfuyMAB4T80S4vBA79yXJ4uDnxdcipaQX5fow
	 inH6fah38iAnVXp8C8Sy2EZ2UEr7zA9EyHQrLwJ/5LX2dG2T1sqRJvlB6vz6QcomrH
	 oWurYSCQjYWWSoJYIpLnKRAARXhcu+YcYCNMirusBEbK6giYgwxKvG0wc/MEzCnebH
	 D17xoDPb0sCPzruPSixZDfIKDD+BsAtg52WZWzVDWKvsjQQhORapqPvP2uYesv91EF
	 AiFt6hrRsNg3jh4EYgd4cVjO1ijyXAUCKH4SYCDn+1E5ZjeJHUuazrNY3Sj538kY6j
	 gpYLygGCVp+ug==
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
Subject: [PATCH net-next v5 14/14] net: macb: drop usrio pointer on EyeQ5 config
Date: Wed, 25 Mar 2026 16:28:18 +0000
Message-ID: <20260325-stillness-undertake-d83054057b8d@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YLNmb5rNBu+3WxSgWsYJIDPAPqu1Vv3xiiURVvdAoto=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeC3Emjm1Hs1pF9lfnDEt3PIeQ2dw5PYA5RmzL/zZG u0+/0hlRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACayfinDP2v+biUjYfY1PmJy zbJhEQtW7Xa3+ih6rmvpvanvMuYK/GH4K/hl5+ErJ09ZMseIRMbffJGtN/egWL3BcmOj3eKiswO /sAEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093013_040115_055280E3 
X-CRM114-Status: GOOD (  10.29  )
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

RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KClVTUklPIGlzIGRp
c2FibGVkIG9uIHRoaXMgcGxhdGZvcm0sIGRyb3AgaXRzIGluaGVyaXRlZCB1c3JpbyBjb25maWcu
CldlIHdpbGwgZW5kIHVwIHdpdGggTUFDQl9DQVBTX1VTUklPX0RJU0FCTEVEIG9uIHRoaXMgcGxh
dGZvcm06CiAtIFdlIGhhdmUgbm8gY29uZmlnLT51c3JpbyBzbyBtYWNiX2NvbmZpZ3VyZV9jYXBz
KCkgZGVkdWNlcyB0aGF0IHRoZQogICBmZWF0dXJlIGlzIGRpc2FibGVkLgogLSBBbmVjZG90YWxs
eSwgd2Ugd291bGQgYWxzbyBsYW5kIGluIHRoZSBydW50aW1lIGRldGVjdGlvbiBjb2RlcGF0aAog
ICB0aGF0IHJlYWRzIERDRkcxLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCmluZGV4IDliZWZiMjY4ZWQ3OWUuLjEyZTJiMmY0
YWFmODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWlu
LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwpAQCAtNTY5
NSw3ICs1Njk1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyBleWVxNV9jb25m
aWcgPSB7CiAJLmRtYV9idXJzdF9sZW5ndGggPSAxNiwKIAkuaW5pdCA9IGV5ZXE1X2luaXQsCiAJ
Lmp1bWJvX21heF9sZW4gPSAxMDI0MCwKLQkudXNyaW8gPSAmYXQ5MV9kZWZhdWx0X3VzcmlvLAog
fTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyByYXNwYmVycnlwaV9ycDFfY29u
ZmlnID0gewotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
