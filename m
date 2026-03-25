Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369FC109C035
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUUshjGNSEMQDtbHLRJXLkxJzlllgx8XkDNZhp8x3Cw=; b=Y9GM2h/HHL2kaw
	2BVGIceLhtA6PoJnLWFuVq2rSe4cOl+ckIrB1OvQpMrDFG0HIsq9RX4n0IJ0//lUi1T18nQnbk1tC
	l+ggehafODop/bVxNCKf5CMZ3cA2MdLYMrrRgjjrVYNHTFYupzcaAhy/lrsjqMjdzlmjY7aYS4DSt
	fPf1gJSCbDKroIGl1XcQQ373+1U236Q9lEz7mGuNYFNfIVV6pZO+BV9Sn+i9yJ4UyQH3qujjutGZN
	AJhg/DYkD5H0EAURLrV931FVAat0QBRTS5nFIqjndx1OdqP3EZusK5WYbX4+p0wZhxiS2vWvYUNU6
	2xlTP6VyjMPONzB7eJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7R-00000003tbw-1r2n;
	Wed, 25 Mar 2026 16:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7P-00000003tZz-0sUg
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC0F6409C7;
	Wed, 25 Mar 2026 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A28CC19423;
	Wed, 25 Mar 2026 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456206;
	bh=SI/nbinYmlv3ClOdOqznxnr/ym+iNX3LvdqOnIkrfeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eHn/zBJs7vzQAN7B5DQNCZUjQ4lyOWZnuSCYnWAbKPdHuFIcLJ3vbjwIf/7fSyLk1
	 V+OSH3jweZ9DR1PetGAKSKtiUFdKcopIlN0UP7A+XUyA1nvLlWCNSete1rhs7BAN31
	 +ouqSX4OPTHEJZAub6aRwWV2RvBJ4wIcmotlNgB5QA97+HIW75iLW+c0eehdcWzD4t
	 q8+f09QY798P4VwHNcMZK6iXVlhijXLuDb16W56LNQkWN8oN6fd+/FCFJL98Sm0gTF
	 Xc8Gq3eAmpoa2X9tYyzU6iNkGiWyMgPtQQFJ5ZuyLxn2s6q0gGo7ycA5vFKL/7eEj7
	 Qsdiq/ROGL55g==
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
Subject: [PATCH net-next v5 13/14] net: macb: set MACB_CAPS_USRIO_DISABLED if no usrio config is provided
Date: Wed, 25 Mar 2026 16:28:17 +0000
Message-ID: <20260325-husband-cape-ec4945b9184c@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wWQAgoUtn0mz+g0O0PGK24RiTXGyZCFOTNhrOE5r3kY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM2/7rnyJl5+UuW/7c0d5bNDy2pbTimn/v8lffRxq ElFzrrEjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk5TSGfyaCsw4yK9xgO7lF 8vnMh31Ll88waJEIsd/948iLm+v2ffBjZFg+SbI8dZrw0XP6pR8bfjKy3ZSU1d/R4VG6JN6aYd0 3U0YA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093007_286097_FAA6B134 
X-CRM114-Status: GOOD (  11.07  )
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
Yl9tYWluLmMKaW5kZXggYjk3OTFiYmJlYzhiZi4uOWJlZmIyNjhlZDc5ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYworKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCkBAIC00NTc3LDggKzQ1NzcsMTAgQEAgc3Rh
dGljIHZvaWQgbWFjYl9jb25maWd1cmVfY2FwcyhzdHJ1Y3QgbWFjYiAqYnAsCiB7CiAJdTMyIGRj
Zmc7CiAKLQlpZiAoZHRfY29uZikKLQkJYnAtPmNhcHMgPSBkdF9jb25mLT5jYXBzOworCWJwLT5j
YXBzID0gZHRfY29uZi0+Y2FwczsKKworCWlmICghZHRfY29uZi0+dXNyaW8pCisJCWJwLT5jYXBz
IHw9IE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRDsKIAogCWlmIChod19pc19nZW0oYnAtPnJlZ3Ms
IGJwLT5uYXRpdmVfaW8pKSB7CiAJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19NQUNCX0lTX0dFTTsK
LS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
