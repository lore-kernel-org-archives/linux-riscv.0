Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6AE10775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyuorbKbsP1Eg5ctv3ghRXo2N1KYJm6K9Ie4QjeRNp8=; b=MmFdSr9CzEZf3i
	Dx0dqvvI6OfSvQ3QhTZTLxvNa4irrMsODU7VGk9S95X+iB0vlS1QoRiXcX+mrJs1P3KEsvVNg6xkG
	07wid8/Vfp8q9UaAtV9gtPRtmD9kHRS34R3r2hbdU0Og/ZzXurmDYfKIKPYaBIUMkUzuEKvsv157c
	pZRCCpWMWwbbF+rz1XmVPPEmtFDTUCVi+9DMZ4PEgHcfYoSyL44AEV7pTPJqcqR4kBe4KKnoRXANF
	hr+IcBypEYQx1BZyCZ9K92k4wYGax9QrwNU8NL/K4kV2O7sS2Ihx/IAgJ0eYmL8M0WCu2yTu4h9MP
	kAB2pnL5+F6UUWZgVg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tvG-00000008yUy-27lN;
	Wed, 18 Mar 2026 16:39:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tvF-00000008yTx-3Awa
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3287160054;
	Wed, 18 Mar 2026 16:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8BAC2BCB0;
	Wed, 18 Mar 2026 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851944;
	bh=ty3BaLqgypDODOt527YqpORivtFzZVbC17L+oACIbBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iW2o1/xuWOXG4BWuNImRR249QnTbcjd7z9JV/+4E89Ww7+jcJBfItklHSx1n8PSSN
	 JtBWRcXwquOntnwp/pM4+ojVasfuDT3FogrQdqsgq22kxvXLGRqt0HwRjFCfhHGRIP
	 /Ibh21aDl881WPs/foKjuic6Fcgff2AehiHl8Lz4DtYLxy4TuXKklOxpdb+5Skw0mk
	 ErLY4wOLkFqHHv03+KlFBy+obgFDkcmzLhspK1lyh+piEsYwosDAyESPXOSaQT/OO+
	 TzlVStABXjXIlBPRzN9OnudRXmXeQZGznbNcMjY0yzMpJK3HvccWoW4c8EhONKvpmZ
	 sLtQG9adm0+ig==
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
Subject: [PATCH net-next v4 13/13] net: macb: drop usrio pointer on EyeQ5 config
Date: Wed, 18 Mar 2026 16:37:44 +0000
Message-ID: <20260318-coral-zipfile-97030dc1ba84@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GR05m7UpiUtffl9Qoho4kMHi+CKCpZaBmj1C+O7OOnM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlzW/KdlOG+j7PvjN5mnlvS+mJf2qca1Z1FFUMzqm z9iJvtd7ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEZjMyMkzJ9j7QO3kd54zT vboJy+a7hXfEr7mkVxc68fPkN6kb7k1j+F+WEsVR/S68aZvHnmT3ngWC59cyhnlq+kZcdeoV1BA 7ywsA
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
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCmluZGV4IDFhNmNkYzIyMzYyNWYuLjIwMzM5OTRi
YjFkN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWlu
LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwpAQCAtNTQ0
MSw3ICs1NDQxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyBleWVxNV9jb25m
aWcgPSB7CiAJLmNsa19pbml0ID0gbWFjYl9jbGtfaW5pdCwKIAkuaW5pdCA9IGV5ZXE1X2luaXQs
CiAJLmp1bWJvX21heF9sZW4gPSAxMDI0MCwKLQkudXNyaW8gPSAmYXQ5MV9kZWZhdWx0X3Vzcmlv
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyByYXNwYmVycnlwaV9ycDFf
Y29uZmlnID0gewotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
