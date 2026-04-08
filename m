Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78A7FD5F77
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 05:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TGVNParFgzxp2LBo0pIT3SWbJF6PhRv8ymuN8TRz3g=; b=FCSYVfsoxAlrK6
	zXU/kpRxLhJU0fa3s7a4+wjvDws7RADchqyq/YgtkUy8DwFgA6TVsnkv4sa6vtpCxXfeB2/U+CJ1x
	L/8d62YjbkyD2eAHyXU744STBu+zESOwqWgymh0UWEcQpAFfSnkQ5ZfJdK4tF08VEHTbUTXdfXWiZ
	VY/UHxk29LJanwOgi9YY8JCPYVDvETsKhiJ7E6YB79cUKO5yv5OJ4Z6JOL0AgxYHrJcQmqrHIQ7Hv
	e70ICLCEuQG3gVhTuR3L7oXgzXedeK76hXjn/NAI5N0yHjDduX5v5apHWjHH76Pnn3DHRjAtGqaXC
	RgCxg1tEBGGves4cOqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAL90-00000008Go8-1L4c;
	Wed, 08 Apr 2026 05:08:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAL8x-00000008Gnc-3gVh
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 05:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A81C34346C;
	Wed,  8 Apr 2026 05:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80E47C19425;
	Wed,  8 Apr 2026 05:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775624878;
	bh=bZ3QCtjblCVSujDtyBNvrogUn9jUpEJIT1QFEhb35A0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=isSyVd7rrddG6wGTfYjWHZRjyWdnlvKknk+a6B506fV8orxBuDi7PUol5Gm73aCMl
	 cFAgd/e7ZbEw+MT1dHfNoTjm2R4/zDsd2nvGb4JQghF5cy3HyOnBC2QdqPgPDueir5
	 MqfWefomgObMfAqprdRCZBn80ty3VlicA/eX83DZ8roJa8KNY+/niLZeJQCihiq4bJ
	 1sgAUgIsBYx8oWl0cISm+mquL2agP08p1Cbb00SOqoBQDwzA75DRis0YqafA7C5ele
	 rY74ClWmqDGc1SneuDPmngsV5z9SxZdGxDCnuz188VlnD5SP/2HxqDVH6xq92RBnok
	 2GfgwRX/Z6l4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5AAFD5F61;
	Wed,  8 Apr 2026 05:07:58 +0000 (UTC)
From: =?utf-8?q?Ale=C5=A1_Pe=C4=8Dnik_via_B4_Relay?= <devnull+ales.pecnik.skylabs.si@kernel.org>
Date: Wed, 08 Apr 2026 07:07:34 +0200
Subject: [PATCH] clk: microchip: mpfs-ccc: fix out-of-bounds write
MIME-Version: 1.0
Message-Id: <20260408-mpfs-clk-oob-write-v1-1-8b3b387f2a6f@skylabs.si>
X-B4-Tracking: v=1; b=H4sIAJXi1WkC/yXMSw6DMAwA0asgr2spjfioXKXqIhgDppSgmBYkx
 N0JZfkWMxsoB2GFMtkg8E9U/BhxvyVAnRtbRqmjwRqbm9QU+JkaRRre6H2FS5CZ0RlieriMrE0
 hhlPgRtb/9Pm6rN+qZ5rPE+z7AU8ki+J2AAAA
X-Change-ID: 20260407-mpfs-clk-oob-write-a0cec9a5c224
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Ale=C5=A1_Pe=C4=8Dnik?= <ales.pecnik@skylabs.si>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775624877; l=2632;
 i=ales.pecnik@skylabs.si; s=20260407; h=from:subject:message-id;
 bh=SF/Vt/vUfapCwcVHEGcraGJRNd6XQ/SLekhb7sh36tU=;
 b=mZYW6b3jCXNt5JzizDtunxJUPc0743ZKiJZy/8bxVMavCx/EPR63Rb1U6/ud20LdVEKDKQsAd
 Fn09rQJ65lOBiQmiYkTDZJ9IIsF076kkmyUwQwO77mbeUctGL/44CEc
X-Developer-Key: i=ales.pecnik@skylabs.si; a=ed25519;
 pk=TOE7w9RMxEE5vdFXO1rqqYmQkLKHAP39+87kI2Q5Lrg=
X-Endpoint-Received: by B4 Relay for ales.pecnik@skylabs.si/20260407 with
 auth_id=724
X-Original-From: =?utf-8?q?Ale=C5=A1_Pe=C4=8Dnik?= <ales.pecnik@skylabs.si>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_220759_969372_D151E6A1 
X-CRM114-Status: GOOD (  12.72  )
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
Reply-To: ales.pecnik@skylabs.si
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxlxaEgUGXEjW5payA8YWxlcy5wZWNuaWtAc2t5bGFicy5zaT4KCklzc3VlIHdhcyBh
bGxvY2F0ZWQgYXJyYXkgc2l6ZSBmb3IgY2xrX2RhdGEuCldoZW4gY2xvY2tzIGFyZSBiZWluZyBy
ZWdpc3RlcmVkIHRoZWlyIGluZGV4IGlzIHRha2VuIGZyb20gZGVmaW5lcyBpbgpkdC1iaW5kaW5n
cy4gVGhlIGxhc3QgMiBjbG9ja3MgaGFkIHRoZWlyIGluZGV4IG91dHNpZGUgb2YgYWxsb2NhdGVk
IHJhbmdlLgpUd28gZGVmaW5lcyAoQ0xLX0NDQ19ETEwwLCBDTEtfQ0NDX0RMTDEpIHdlcmUgbm90
IHVzZWQgYW5kIHNraXBwZWQgb3Zlcgp3aGljaCB3YXMgbm90IHRha2VuIGludG8gYWNjb3VudCB3
aGVuIGFsbG9jYXRpbmcgdGhlIGFycmF5LgoKVGhpcyBwYXRjaCBpcyBtaW5pbWFsIGNoYW5nZSB0
byByZXNvbHZlIHRoZSBpc3N1ZS4KCklzc3VlIHdhcyBmb3VuZCB1c2luZyBLQVNBTiB3aGVuIGRl
YnVnZ2luZyB1bnJlbGF0ZWQgeGRtYSBkcml2ZXIgaXNzdWUuCkNvbnNlcXVlbnRseSBmaXhpbmcg
dGhpcyBpc3N1ZSBhbHNvIHJlc29sdmVkIHhkbWEgZHJpdmVyIGlzc3VlLgoKUmVsYXRlZCBkbWVz
ZyBvdXRwdXQ6ClsgICAgMC4yOTA3MDNdIEJVRzogS0FTQU46IHNsYWItb3V0LW9mLWJvdW5kcyBp
biBtcGZzX2NjY19yZWdpc3Rlcl9vdXRwdXRzLmNvbnN0cHJvcC4wKzB4ZDAvMHgxZmEKWyAgICAw
LjI5MDk4NF0gV3JpdGUgb2Ygc2l6ZSA4IGF0IGFkZHIgZmZmZmZmZTdiZTZlM2NhOCBieSB0YXNr
IHN3YXBwZXIvMC8xClsgICAgMC4yOTEyNTNdIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8w
IE5vdCB0YWludGVkIDYuMS40My1saW51eDRtaWNyb2NoaXArZnBnYS0yMDIzLjA5ICMxClsgICAg
MC4yOTE0ODJdIEhhcmR3YXJlIG5hbWU6IFNreWxhYnMgSFBDIChEVCkKWyAgICAwLjI5MTYxMV0g
Q2FsbCBUcmFjZToKLi4uClsgICAgMC4yOTI5OTldIFs8ZmZmZmZmZmY4MDg1MDhjOD5dIG1wZnNf
Y2NjX3JlZ2lzdGVyX291dHB1dHMuY29uc3Rwcm9wLjArMHhkMC8weDFmYQpbICAgIDAuMjkzMjQ1
XSBbPGZmZmZmZmZmODA4NTBiNjY+XSBtcGZzX2NjY19wcm9iZSsweDE3NC8weDMwZQpbICAgIDAu
MjkzNDM3XSBbPGZmZmZmZmZmODA4ZDRhZjI+XSBwbGF0Zm9ybV9wcm9iZSsweDc0LzB4YmEKLi4u
CgpGaXhlczogZDM5ZmIxNzI3NjBlICgiY2xrOiBtaWNyb2NoaXA6IGFkZCBQb2xhckZpcmUgU29D
IGZhYnJpYyBjbG9jayBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogQWxlxaEgUGXEjW5payA8YWxl
cy5wZWNuaWtAc2t5bGFicy5zaT4KLS0tCiBkcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMt
Y2NjLmMgICAgICAgICAgICAgfCAzICstLQogaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9taWNy
b2NoaXAsbXBmcy1jbG9jay5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWljcm9jaGlwL2Ns
ay1tcGZzLWNjYy5jIGIvZHJpdmVycy9jbGsvbWljcm9jaGlwL2Nsay1tcGZzLWNjYy5jCmluZGV4
IDNhM2VhMmQxNDJmOC4uNzFmYmI2MjY1ZWE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9taWNy
b2NoaXAvY2xrLW1wZnMtY2NjLmMKKysrIGIvZHJpdmVycy9jbGsvbWljcm9jaGlwL2Nsay1tcGZz
LWNjYy5jCkBAIC0yMzQsOCArMjM0LDcgQEAgc3RhdGljIGludCBtcGZzX2NjY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXVuc2lnbmVkIGludCBudW1fY2xrczsKIAlpbnQg
cmV0OwogCi0JbnVtX2Nsa3MgPSBBUlJBWV9TSVpFKG1wZnNfY2NjX3BsbF9jbGtzKSArIEFSUkFZ
X1NJWkUobXBmc19jY2NfcGxsMG91dF9jbGtzKSArCi0JCSAgIEFSUkFZX1NJWkUobXBmc19jY2Nf
cGxsMW91dF9jbGtzKTsKKwludW1fY2xrcyA9IENMS19DQ0NfTlVNOwogCiAJY2xrX2RhdGEgPSBk
ZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc3RydWN0X3NpemUoY2xrX2RhdGEsIGh3X2RhdGEuaHdz
LCBudW1fY2xrcyksCiAJCQkJR0ZQX0tFUk5FTCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNsb2NrLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNsb2NrLmgKaW5kZXggYjUyZjE5YTJiNDgwLi44ZDUzZjJi
ODFhNTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1w
ZnMtY2xvY2suaAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZz
LWNsb2NrLmgKQEAgLTczLDQgKzczLDYgQEAKICNkZWZpbmUgQ0xLX0NDQ19ETEwxX09VVDAJMTQK
ICNkZWZpbmUgQ0xLX0NDQ19ETEwxX09VVDEJMTUKIAorI2RlZmluZSBDTEtfQ0NDX05VTQkJMTYK
KwogI2VuZGlmCS8qIF9EVF9CSU5ESU5HU19DTEtfTUlDUk9DSElQX01QRlNfSF8gKi8KCi0tLQpi
YXNlLWNvbW1pdDogYmZlNjJhNDU0NTQyY2ZhZDMzNzlmNmVmNTY4MGIxMjVmNDFlMjBmNApjaGFu
Z2UtaWQ6IDIwMjYwNDA3LW1wZnMtY2xrLW9vYi13cml0ZS1hMGNlYzlhNWMyMjQKCkJlc3QgcmVn
YXJkcywKLS0gIApBbGXFoSBQZcSNbmlrIDxhbGVzLnBlY25pa0Bza3lsYWJzLnNpPgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
