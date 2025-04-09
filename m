Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55832C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SncdOba4pLzbKjDBaF14vta3P0w2iI6GkSz9DXEvjbI=; b=SHg593Crda9132
	p7oVDzujAItqRd6eaqdUyuy64/Ex3LTNt+GKS11p9gkbtxpIQJQAy2zz9/VCy+caELkmjVqbk0D1B
	pWk4b685qlTf/Iv4JsJnbcVC1zKXhi2kCdcULcD3YPWiT84aXrnzwc4aHR+X2nJwjkzNX6oPKrOsq
	rxY27Iu8lj9mmnspZxIiduRpLzeousRfRh5PZSBRayDED1CWpxRgJ9qqi2J3W5hf+258ruEKrJ1xe
	gfA5wcZJYKjfo1eTncQsrl4eH2sG5gZCWO62FT8XXL+0saTSB+BBWRhqGqVVo4+ve5i7/g+CUZBK1
	QHbD8vUbzYHRZNZIEN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2a3Q-000000089ai-1H7j;
	Wed, 09 Apr 2025 18:21:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2a3N-000000089a8-2Etv
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 18:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9115A49AB5;
	Wed,  9 Apr 2025 18:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E29FC4CEE2;
	Wed,  9 Apr 2025 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744222896;
	bh=rF/4ACsIG/tFNbGRO5wYRJcR4xBaQIyDKKhb987ERh4=;
	h=From:To:Cc:Subject:Date:From;
	b=E3oGybFgZtJlcpFYB1nP9daP5Y7GT1NLQn5PqAFqpB3CfHPMzeogJn5RVK/rEkVmY
	 QiKQGIIH0a2MrLhZknbavuqM/KVPneU4io5Mqq3iYgbBDZxape/5JmM67z/k2SZ+ik
	 5DiBEPymTtxujlszDrYdWNNffNbT/sECvg+nuEepFb8uWFaDZrhhJEe62HN2ZnpI75
	 fXlz/9VApoFedhxBm2OIqFMVa41/6wDZz90/VxCXzr/8grn7y0Y4i4I/9E2Y5NImGL
	 8RzV51jPUa0fdTm0saXYA6KRygSE6G/YzvMrUYQtCsqikt2rVLSheXXM9DORj+UFbU
	 tnZ35Bj1P1TSQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH fixes] riscv: Properly export reserved regions in /proc/iomem
Date: Wed,  9 Apr 2025 20:21:27 +0200
Message-ID: <20250409182129.634415-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_112137_711446_480E3DDC 
X-CRM114-Status: GOOD (  18.88  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIC9wcm9jL2lvbWVt
IHJlcHJlc2VudHMgdGhlIGtlcm5lbCdzIG1lbW9yeSBtYXAuIFJlZ2lvbnMgbWFya2VkCndpdGgg
IlJlc2VydmVkIiB0ZWxscyB0aGUgdXNlciB0aGF0IHRoZSByYW5nZSBzaG91bGQgbm90IGJlIHRh
bXBlcmVkCndpdGguIEtleGVjLXRvb2xzLCB3aGVuIHVzaW5nIHRoZSBvbGRlciBrZXhlY19sb2Fk
IHN5c2NhbGwgcmVsaWVzIG9uCnRoZSAiUmVzZXJ2ZWQiIHJlZ2lvbnMgdG8gYnVpbGQgdGhlIG1l
bW9yeSBzZWdtZW50cywgdGhhdCB3aWxsIGJlIHRoZQp0YXJnZXQgb2YgdGhlIG5ldyBrZXhlYydk
IGtlcm5lbC4KClRoZSBSSVNDLVYgcG9ydCB0cmllcyB0byBleHBvc2UgYWxsIHJlc2VydmVkIHJl
Z2lvbnMgdG8gdXNlcmxhbmQsIGJ1dApzb21lIHJlZ2lvbnMgd2VyZSBub3QgcHJvcGVybHkgZXhw
b3NlZDogUmVnaW9ucyB0aGF0IHJlc2lkZWQgaW4gYm90aAp0aGUgInJlZ3VsYXIiIGFuZCByZXNl
cnZlZCBtZW1vcnkgYmxvY2ssIGUuZy4gdGhlIEVGSSBNZW1vcnkgTWFwLiBBCm1pc3NpbmcgZW50
cnkgY291bGQgcmVzdWx0IGluIHJlc2VydmVkIG1lbW9yeSBiZWluZyBvdmVyd3JpdHRlbi4KCkl0
IHR1cm5zIG91dCwgdGhhdCBhcm02NCwgYW5kIGxvb25nYXJjaCBoYWQgYSBzaW1pbGFyIGlzc3Vl
IGEgd2hpbGUKYmFjazoKCiAgY29tbWl0IGQ5MTY4MGU2ODdmNCAoImFybTY0OiBGaXggL3Byb2Mv
aW9tZW0gZm9yIHJlc2VydmVkIGJ1dCBub3QgbWVtb3J5IHJlZ2lvbnMiKQogIGNvbW1pdCA1MGQ3
YmEzNmI5MTYgKCJhcm02NDogZXhwb3J0IG1lbWJsb2NrX3Jlc2VydmUoKWQgcmVnaW9ucyB2aWEg
L3Byb2MvaW9tZW0iKQoKU2ltaWxhciB0byB0aGUgb3RoZXIgcG9ydHMsIHJlc29sdmUgdGhlIGlz
c3VlIGJ5IHNwbGl0dGluZyB0aGUgcmVnaW9ucwppbiBhbiBhcmNoIGluaXRjYWxsLCBzaW5jZSB3
ZSBuZWVkIGEgd29ya2luZyBhbGxvY2F0b3IuCgpGaXhlczogZmZlMGU1MjYxMjY4ICgiUklTQy1W
OiBJbXByb3ZlIGluaXRfcmVzb3VyY2VzKCkiKQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDM2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDM1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwppbmRleCBjMTc0NTQ0ZWVm
YzguLmY3YzlhMWNhYTgzZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC02Niw2ICs2Niw5IEBAIHN0YXRpYyBz
dHJ1Y3QgcmVzb3VyY2UgYnNzX3JlcyA9IHsgLm5hbWUgPSAiS2VybmVsIGJzcyIsIH07CiBzdGF0
aWMgc3RydWN0IHJlc291cmNlIGVsZmNvcmVoZHJfcmVzID0geyAubmFtZSA9ICJFTEYgQ29yZSBo
ZHIiLCB9OwogI2VuZGlmCiAKK3N0YXRpYyBpbnQgbnVtX3N0YW5kYXJkX3Jlc291cmNlczsKK3N0
YXRpYyBzdHJ1Y3QgcmVzb3VyY2UgKnN0YW5kYXJkX3Jlc291cmNlczsKKwogc3RhdGljIGludCBf
X2luaXQgYWRkX3Jlc291cmNlKHN0cnVjdCByZXNvdXJjZSAqcGFyZW50LAogCQkJCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzKQogewpAQCAtMTM5LDcgKzE0Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBp
bml0X3Jlc291cmNlcyh2b2lkKQogCXN0cnVjdCByZXNvdXJjZSAqcmVzID0gTlVMTDsKIAlzdHJ1
Y3QgcmVzb3VyY2UgKm1lbV9yZXMgPSBOVUxMOwogCXNpemVfdCBtZW1fcmVzX3N6ID0gMDsKLQlp
bnQgbnVtX3Jlc291cmNlcyA9IDAsIHJlc19pZHggPSAwOworCWludCBudW1fcmVzb3VyY2VzID0g
MCwgcmVzX2lkeCA9IDAsIG5vbl9yZXN2X3JlcyA9IDA7CiAJaW50IHJldCA9IDA7CiAKIAkvKiAr
IDEgYXMgbWVtYmxvY2tfYWxsb2MoKSBtaWdodCBpbmNyZWFzZSBtZW1ibG9jay5yZXNlcnZlZC5j
bnQgKi8KQEAgLTE5Myw2ICsxOTYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJj
ZXModm9pZCkKIAkvKiBBZGQgL21lbW9yeSByZWdpb25zIHRvIHRoZSByZXNvdXJjZSB0cmVlICov
CiAJZm9yX2VhY2hfbWVtX3JlZ2lvbihyZWdpb24pIHsKIAkJcmVzID0gJm1lbV9yZXNbcmVzX2lk
eC0tXTsKKwkJbm9uX3Jlc3ZfcmVzKys7CiAKIAkJaWYgKHVubGlrZWx5KG1lbWJsb2NrX2lzX25v
bWFwKHJlZ2lvbikpKSB7CiAJCQlyZXMtPm5hbWUgPSAiUmVzZXJ2ZWQiOwpAQCAtMjEwLDYgKzIx
NCw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3Jlc291cmNlcyh2b2lkKQogCQkJZ290byBl
cnJvcjsKIAl9CiAKKwludW1fc3RhbmRhcmRfcmVzb3VyY2VzID0gbm9uX3Jlc3ZfcmVzOworCXN0
YW5kYXJkX3Jlc291cmNlcyA9ICZtZW1fcmVzW3Jlc19pZHggKyAxXTsKKwogCS8qIENsZWFuLXVw
IGFueSB1bnVzZWQgcHJlLWFsbG9jYXRlZCByZXNvdXJjZXMgKi8KIAlpZiAocmVzX2lkeCA+PSAw
KQogCQltZW1ibG9ja19mcmVlKG1lbV9yZXMsIChyZXNfaWR4ICsgMSkgKiBzaXplb2YoKm1lbV9y
ZXMpKTsKQEAgLTIyMSw2ICsyMjgsMzMgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfcmVzb3Vy
Y2VzKHZvaWQpCiAJbWVtYmxvY2tfZnJlZShtZW1fcmVzLCBtZW1fcmVzX3N6KTsKIH0KIAorc3Rh
dGljIGludCBfX2luaXQgcmVzZXJ2ZV9tZW1ibG9ja19yZXNlcnZlZF9yZWdpb25zKHZvaWQpCit7
CisJdTY0IGksIGo7CisKKwlmb3IgKGkgPSAwOyBpIDwgbnVtX3N0YW5kYXJkX3Jlc291cmNlczsg
aSsrKSB7CisJCXN0cnVjdCByZXNvdXJjZSAqbWVtID0gJnN0YW5kYXJkX3Jlc291cmNlc1tpXTsK
KwkJcGh5c19hZGRyX3Qgcl9zdGFydCwgcl9lbmQsIG1lbV9zaXplID0gcmVzb3VyY2Vfc2l6ZSht
ZW0pOworCisJCWlmICghbWVtYmxvY2tfaXNfcmVnaW9uX3Jlc2VydmVkKG1lbS0+c3RhcnQsIG1l
bV9zaXplKSkKKwkJCWNvbnRpbnVlOworCisJCWZvcl9lYWNoX3Jlc2VydmVkX21lbV9yYW5nZShq
LCAmcl9zdGFydCwgJnJfZW5kKSB7CisJCQlyZXNvdXJjZV9zaXplX3Qgc3RhcnQsIGVuZDsKKwor
CQkJc3RhcnQgPSBtYXgoUEZOX1BIWVMoUEZOX0RPV04ocl9zdGFydCkpLCBtZW0tPnN0YXJ0KTsK
KwkJCWVuZCA9IG1pbihQRk5fUEhZUyhQRk5fVVAocl9lbmQpKSAtIDEsIG1lbS0+ZW5kKTsKKwor
CQkJaWYgKHN0YXJ0ID4gbWVtLT5lbmQgfHwgZW5kIDwgbWVtLT5zdGFydCkKKwkJCQljb250aW51
ZTsKKworCQkJcmVzZXJ2ZV9yZWdpb25fd2l0aF9zcGxpdChtZW0sIHN0YXJ0LCBlbmQsICJSZXNl
cnZlZCIpOworCQl9CisJfQorCisJcmV0dXJuIDA7Cit9CithcmNoX2luaXRjYWxsKHJlc2VydmVf
bWVtYmxvY2tfcmVzZXJ2ZWRfcmVnaW9ucyk7CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV9k
dGIodm9pZCkKIHsKCmJhc2UtY29tbWl0OiBhMjQ1ODgyNDU3NzZkYWZjMjI3MjQzYTAxYmZiZWI4
YTU5YmFmYmE5Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
