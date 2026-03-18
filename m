Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFE710775E4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otyVWHK/apeEuzYuXRG8CyjiGI4cUDrYywSouOAKKNo=; b=IshukHlegzXIY5
	lEHgaQylW1SJobi8p/Oj/OlCvRmpBMbqR8XuyPQzlMwv8Dh4OEAS9ZfUbRhFPiPeL+pH2Htm8vUvU
	Evc+jdxN1wjId6X3+eZ48X+9c0ma0YcV+a4dteqlIqO+SlitgoUGhflQqElTB2PS4h9TiirxpVu0n
	QpZTqp0BusNBKbJDQT7efNK76r6GJilJtNbM3rjIaVDPOkQynMHEEXyv7JGVQhwDeNVdTDmHifQFR
	wYB7x+MTIxZFCIbnuI8iaACYNnscoADyvQw4QCgn9YiJb3sDZ9GaA3P+CE/VCKcY9z1+03ZLKpjIw
	uGNUC+yojcaAWPMBAjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tvD-00000008yRp-0acS;
	Wed, 18 Mar 2026 16:39:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tv9-00000008yO3-2FNQ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B716440FA;
	Wed, 18 Mar 2026 16:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A381FC2BC87;
	Wed, 18 Mar 2026 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851939;
	bh=8dYY/An492/r9LNR1y5PaEYTe8NEViY49aooNEVBQSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j3jcQyinjnnUVd8oODV26S6DW4s+A8TA+VHAhbeYtk6kGxpnNDsPeHfxlgbKugSPf
	 bvtKhcExITElvWVPNc5nJfGgfzK6hw3jDqCIB+u+4bFBm7HpzKq6A/7Iq2HgH0FBOK
	 AVTKnvTYzFEtIxwfltPGpmY0ijhrJUKmw12XuiPd8JM6puem5zTU25t2jOr48i8vxD
	 wxmvhTHXwVYW54R/kcxQ8E6fuyXzYrqH2dPuQ4TsdXB2QhbNLl2buuyQfzeHYYglLV
	 HFthY33mIIZ8bNiwif6Dla27rHBr4k+iJ47wWNXZ196Phj4ZGTezDp2wrjra7HTghL
	 qRDD9Qz6AouLg==
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
Subject: [PATCH net-next v4 12/13] net: macb: set MACB_CAPS_USRIO_DISABLED if no usrio config is provided
Date: Wed, 18 Mar 2026 16:37:43 +0000
Message-ID: <20260318-argue-pouring-3405e33e7600@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qqeBZ/4pnx5PRuyO5kmFQgJF981C+Tje2OakbZeONrc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlz+LnBCtc0thu3divRVNRb7J2xnZREPubHcJ+2Th 2aAbqdyRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZybjfD/3rLzy+vJF5ovuCt kLbBNcB2X9u9Q6cPzWfeOevvXRvZ1w8YGZ7ri/Kv8dApUWldf/P4V4fqbJMtt60FJ72Ye+rTVKk dXtwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_093900_313763_743C5BE0 
X-CRM114-Status: GOOD (  10.60  )
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

RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCmJwLT51c3JpbyBp
cyBjb3BpZWQgZGlyZWN0bHkgZnJvbSBkdF9jb25mLT51c3JpbyBpbiBtYWNiX3Byb2JlKCkuCgpJ
ZiBkdF9jb25mLT51c3JpbyBpcyBOVUxMLCB3ZSBkbyBub3Qgd2FudCB0byBsYW5kIGluIFVTUklP
IHdyaXRlCmNvZGVwYXRocyB3aGljaCBkZXJlZmVyZW5jZSBicC0+dXNyaW8uIEluaGVyaXQgYXV0
b21hdGljYWxseQpNQUNCX0NBUFNfVVNSSU9fRElTQUJMRUQgdG8gYXZvaWQgdGhvc2UuCgpUaGlz
IG1lYW5zIGEgbWFjYl9jb25maWcgdGhhdCB3YW50cyB0byBkaXNhYmxlIHVzcmlvIGNhbiBzaW1w
bHkgZHJvcAppdHMgLnVzcmlvIGZpZWxkLCByYXRoZXIgdGhhbiBhZGQgdGhlIGRpc2FibGVkIGNh
cGFiaWxpdHkgZXhwbGljaXRseS4KCk5pdDogZHJvcCB0aGUgZHRfY29uZiBOVUxMIGNoZWNrIGJl
Y2F1c2UgdGhlIHBvaW50ZXIgaXMgYWx3YXlzIHZhbGlkLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8g
TGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFj
Yl9tYWluLmMKaW5kZXggYjExZWY3MDM1NzViMC4uMWE2Y2RjMjIzNjI1ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYworKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCkBAIC00MzE5LDggKzQzMTksMTAgQEAgc3Rh
dGljIHZvaWQgbWFjYl9jb25maWd1cmVfY2FwcyhzdHJ1Y3QgbWFjYiAqYnAsCiB7CiAJdTMyIGRj
Zmc7CiAKLQlpZiAoZHRfY29uZikKLQkJYnAtPmNhcHMgPSBkdF9jb25mLT5jYXBzOworCWJwLT5j
YXBzID0gZHRfY29uZi0+Y2FwczsKKworCWlmICghZHRfY29uZi0+dXNyaW8pCisJCWJwLT5jYXBz
IHw9IE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRDsKIAogCWlmIChod19pc19nZW0oYnAtPnJlZ3Ms
IGJwLT5uYXRpdmVfaW8pKSB7CiAJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19NQUNCX0lTX0dFTTsK
LS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
