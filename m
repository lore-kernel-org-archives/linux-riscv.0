Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C06C677C4
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dawoPUZ/gGpe26cbBSGIy5WqamiIKQdBf9nlD8b68DI=; b=Pd86KgDUvkdV52
	ioDuFRCl/zADBfghC7dFbGDdxHahX2vd0WgaGrIMAlx4lxxkAhZUBYAObkqI1SH5D3Y1qeZZXXcXh
	wShVZfFEUlYR0SmjS0kqLedeo7+hbHdVw3CFJLYAJMQfli0H18sKhsMuGFVvhpXZzKQdMu8tYme3O
	mAkuKIA8dwuI12WYbzrL2QokVzWQXlJMjtpGrl9eAEU64hgLv7DFiD87bw+o4+HieO7NARBAeKFhN
	pCItsL6N7pFjdab24yVECVtIV20f0x40WeVrZmHUAhBSw/BLMvca+3g+7ldJ0CcAXYawThsB0bRQp
	dFV1Ot2ZDeTDJNnVW27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcyy-00000004JU8-3TQz;
	Mon, 09 Jun 2025 13:56:12 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcr5-00000004HoX-3qrB
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 13:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476884; x=1781012884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=quT+zdVX2EifVoeKNBY4FQXcJ7pHShHmcCxaW2+fMIg=;
  b=Ltv8so1nSf3d/XayNr8u3NPp17Ld5ond0LH6aQTSC2Y90dYEMF1b4Ygb
   R0XjPK40dydHYtywJdGB7v7aAnAzCgzMsuWzNNTT0LRALMPeN0SFxF2xp
   94GshWKl5WQRNVrIkzSl17SLC5ym8+Wm2ESntrsw5Y/lgKsr2ej4vo9kf
   iTXiyQeb+v9g+G83hbqT0E34iyE5SnjUZyx1f4UW/RaLhwB0XV+vr0s1k
   KKAiBalCA0K7c1srJaZ2gALnUN4ZMoRIr4yU0jwvQ/wy1MNUP2hlkFabT
   5OJaEI7WQ9bB5mwgH879AZcvYBPNH8v7m6nbOhNaQzGPEUY8llPhcABCk
   A==;
X-CSE-ConnectionGUID: +eXgQ67wRbqUmyF24JYANQ==
X-CSE-MsgGUID: cUaNuTLbRHe0YBpb0Zp7hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:47:59 +0300
X-CSE-ConnectionGUID: A36+pBebRuCoXNOEMTYJuQ==
X-CSE-MsgGUID: lxlF6r/DTae52yps/JiiTg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:56 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:57 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 1/7] riscv: helper to parse hart index
Date: Mon,  9 Jun 2025 16:47:43 +0300
Message-ID: <20250609134749.1453835-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_064804_265190_80D7D85B 
X-CRM114-Status: GOOD (  18.44  )
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

UklTQy1WIEFQTElDIHNwZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFdCkFu
ZCBzaW1pbGFyIGRlZmluaXRpb25zIGZvdW5kIGZvciBBQ0xJTlQgaW4gWzJdCgpRdW90ZSBmcm9t
IFsxXToKCldpdGhpbiBhIGdpdmVuIGludGVycnVwdCBkb21haW4sIGVhY2ggb2YgdGhlIGRvbWFp
buKAmXMgaGFydHMgaGFzIGEgdW5pcXVlCmluZGV4IG51bWJlciBpbiB0aGUgcmFuZ2UgMCB0byAy
XjE0IOKIkiAxICg9IDE2LDM4MykuIFRoZSBpbmRleCBudW1iZXIgYQpkb21haW4gYXNzb2NpYXRl
cyB3aXRoIGEgaGFydCBtYXkgb3IgbWF5IG5vdCBoYXZlIGFueSByZWxhdGlvbnNoaXAgdG8gdGhl
CnVuaXF1ZSBoYXJ0IGlkZW50aWZpZXIgKOKAnGhhcnQgSUTigJ0pIHRoYXQgdGhlIFJJU0MtViBQ
cml2aWxlZ2VkCkFyY2hpdGVjdHVyZSBhc3NpZ25zIHRvIHRoZSBoYXJ0LiBUd28gZGlmZmVyZW50
IGludGVycnVwdCBkb21haW5zIG1heQplbXBsb3kgZW50aXJlbHkgZGlmZmVyZW50IGluZGV4IG51
bWJlcnMgZm9yIHRoZSBzYW1lIHNldCBvZiBoYXJ0cy4KCkZ1cnRoZXIsIFsxXSBzYXlzIGluICI0
LjUgTWVtb3J5LW1hcHBlZCBjb250cm9sIHJlZ2lvbiBmb3IgYW4KaW50ZXJydXB0IGRvbWFpbiI6
CgpUaGUgYXJyYXkgb2YgSURDIHN0cnVjdHVyZXMgbWF5IGluY2x1ZGUgc29tZSBmb3IgcG90ZW50
aWFsIGhhcnQgaW5kZXgKbnVtYmVycyB0aGF0IGFyZSBub3QgYWN0dWFsIGhhcnQgaW5kZXggbnVt
YmVycyBpbiB0aGUgZG9tYWluLgpGb3IgZXhhbXBsZSwgdGhlIGZpcnN0IElEQyBzdHJ1Y3R1cmUg
aXMgYWx3YXlzIGZvciBoYXJ0IGluZGV4IDAsIGJ1dCAwIGlzCm5vdCBuZWNlc3NhcmlseSBhIHZh
bGlkIGluZGV4IG51bWJlciBmb3IgYW55IGhhcnQgaW4gdGhlIGRvbWFpbi4KClN1cHBvcnQgYXJi
aXRyYXJ5IGhhcnQgaW5kaWNlcyBzcGVjaWZpZWQgaW4gYW4gb3B0aW9uYWwgcHJvcGVydHkKInJp
c2N2LGhhcnQtaW5kZXhlcyIgd2hpY2ggaXMgc3BlY2lmaWVkIGFzIGFuIGFycmF5IG9mIHUzMiBl
bGVtZW50cywgb25lCnBlciBpbnRlcnJ1cHQgdGFyZ2V0LCBsaXN0aW5nIGhhcnQgaW5kZXhlcyBp
biB0aGUgc2FtZSBvcmRlciBhcyBpbgoiaW50ZXJydXB0cy1leHRlbmRlZCIuIElmIHRoaXMgcHJv
cGVydHkgaXMgbm90IHNwZWNpZmllZCwgZmFsbGJhY2sgdG8gdXNlCmxvZ2ljYWwgaGFydCBpbmRp
Y2VzIHdpdGhpbiB0aGUgZG9tYWluLgoKSWYgcHJvcGVydHkgbm90IGV4aXN0LCBmYWxsIGJhY2sg
dG8gbG9naWNhbCBoYXJ0IGluZGV4ZXMKCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9y
aXNjdi1haWEgWzFdCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdmFyY2hpdmUvcmlzY3Yt
YWNsaW50IFsyXQpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5r
b25kcmF0aWV2QG1vYmlsZXllLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycS5o
IHwgIDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2lycS5jICAgICAgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9pcnEuaAppbmRleCA3YjAzOGYzYjdjYjAuLjU5Yzk3NWY3NTBjOSAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnEuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2lycS5oCkBAIC0yMiw2ICsyMiw4IEBAIHZvaWQgYXJjaF90cmlnZ2VyX2NwdW1hc2tf
YmFja3RyYWNlKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50IGV4Y2x1ZGVfY3B1KTsKIHZvaWQg
cmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHN0cnVjdCBmd25vZGVfaGFuZGxlICooKmZuKSh2b2lk
KSk7CiAKIHN0cnVjdCBmd25vZGVfaGFuZGxlICpyaXNjdl9nZXRfaW50Y19od25vZGUodm9pZCk7
CitpbnQgcmlzY3ZfZ2V0X2hhcnRfaW5kZXgoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwg
dTMyIGxvZ2ljYWxfaW5kZXgsCisJCQkgdTMyICpoYXJ0X2luZGV4KTsKIAogI2lmZGVmIENPTkZJ
R19BQ1BJCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvaXJxLmMKaW5kZXggOWNlZGEwMjUwN2NhLi5lZmRmNTA1YmI3NzYgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5j
CkBAIC0zMiw2ICszMiw0MCBAQCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqcmlzY3ZfZ2V0X2ludGNf
aHdub2RlKHZvaWQpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9nZXRfaW50Y19od25vZGUp
OwogCisvKioKKyAqIHJpc2N2X2dldF9oYXJ0X2luZGV4KCkgLSBnZXQgaGFydCBpbmRleCBmb3Ig
aW50ZXJydXB0IGRlbGl2ZXJ5CisgKiBAZndub2RlOiBpbnRlcnJ1cHQgY29udHJvbGxlciBub2Rl
CisgKiBAbG9naWNhbF9pbmRleDogaW5kZXggd2l0aGluIHRoZSAiaW50ZXJydXB0cy1leHRlbmRl
ZCIgcHJvcGVydHkKKyAqIEBoYXJ0X2luZGV4OiBmaWxsZWQgd2l0aCB0aGUgaGFydCBpbmRleCB0
byB1c2UKKyAqCisgKiBSaXNjLVYgdXNlcyB0ZXJtICJoYXJ0IGluZGV4IiBmb3IgaXRzIGludGVy
cnVwdCBjb250cm9sbGVycywgZm9yIHRoZQorICogcHVycG9zZSBvZiB0aGUgaW50ZXJydXB0IHJv
dXRpbmcgdG8gZGVzdGluYXRpb24gaGFydHMuCisgKiBJdCBtYXkgYmUgYXJiaXRyYXJ5IG51bWJl
cnMgYXNzaWduZWQgdG8gZWFjaCBkZXN0aW5hdGlvbiBoYXJ0IGluIGNvbnRleHQKKyAqIG9mIHRo
ZSBwYXJ0aWN1bGFyIGludGVycnVwdCBkb21haW4uCisgKgorICogVGhlc2UgbnVtYmVycyBlbmNv
ZGVkIGluIHRoZSBvcHRpb25hbCBwcm9wZXJ0eSAicmlzY3YsaGFydC1pbmRleGVzIgorICogdGhh
dCBzaG91bGQgY29udGFpbiBoYXJ0IGluZGV4IGZvciBlYWNoIGludGVycnVwdCBkZXN0aW5hdGlv
biBpbiB0aGUgc2FtZQorICogb3JkZXIgYXMgaW4gdGhlICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBw
cm9wZXJ0eS4gSWYgdGhpcyBwcm9wZXJ0eQorICogbm90IGV4aXN0LCBpdCBhc3N1bWVkIGVxdWFs
IHRvIHRoZSBsb2dpY2FsIGluZGV4LCBpLmUuIGluZGV4IHdpdGhpbiB0aGUKKyAqICJpbnRlcnJ1
cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eS4KKyAqCisgKiBSZXR1cm46IGVycm9yIGNvZGUKKyAqLwor
aW50IHJpc2N2X2dldF9oYXJ0X2luZGV4KHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHUz
MiBsb2dpY2FsX2luZGV4LAorCQkJIHUzMiAqaGFydF9pbmRleCkKK3sKKwlzdGF0aWMgY29uc3Qg
Y2hhciAqcHJvcF9oYXJ0X2luZGV4ID0gInJpc2N2LGhhcnQtaW5kZXhlcyI7CisJc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IHRvX29mX25vZGUoZndub2RlKTsKKworCWlmICghbnAgfHwgIW9mX3By
b3BlcnR5X3ByZXNlbnQobnAsIHByb3BfaGFydF9pbmRleCkpIHsKKwkJKmhhcnRfaW5kZXggPSBs
b2dpY2FsX2luZGV4OworCQlyZXR1cm4gMDsKKwl9CisKKwlyZXR1cm4gb2ZfcHJvcGVydHlfcmVh
ZF91MzJfaW5kZXgobnAsIHByb3BfaGFydF9pbmRleCwKKwkJCQkJICBsb2dpY2FsX2luZGV4LCBo
YXJ0X2luZGV4KTsKK30KKwogI2lmZGVmIENPTkZJR19JUlFfU1RBQ0tTCiAjaW5jbHVkZSA8YXNt
L2lycV9zdGFjay5oPgogCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
