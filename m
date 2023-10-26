Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF21C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PAf9AvfSG4otQovdhUTvaP6qui1afHVAIeHNNMe1W+k=; b=p1SGI3XsqB7TWA
	gBMIh1UcCgv9dQWx85c9kQY4TT3zCa7mLoq15px3fCuDlhlTGIu9Z8qkuwfjEQTsXpmLboFNXfZnn
	kzL4G4vo1XMbIYHO0wm27YNrPssGf2BSXyvlhTBRkP0x5iJlH0ZjLqqJAli7DHhvvYUXPDydSGjSj
	11nqYDF4XtyfZ/ZaBaNMJ4wlDFLSZfo1p2X/8sA0WtqVLqzHeG2H1Xn0No6OLWmMBuKqSGvGBr5mJ
	LRDaEryWmnp+6ofosUlObCxeXL2xBy0f77/qj0e9OAUS8FI+FkfSy5vslNoNmLM2KXM3avG7mxo2x
	YIiuN1gmaiOOJWBcMAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxTM-00EA2o-29;
	Thu, 26 Oct 2023 10:20:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxTK-00EA1S-0b
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 10:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DB1EEB83542;
	Thu, 26 Oct 2023 10:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4116C433C8;
	Thu, 26 Oct 2023 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698315611;
	bh=HTgDnY6nOK0UE+C53lOyr46cNkU6RAJxBArDMZcQUKU=;
	h=From:To:Cc:Subject:Date:From;
	b=qEKGSub5Z8oLBiMI2J2SXGHlKosMfJIrdE7oOGvTW868BjkOGFtbdWjJL86QAidw5
	 mhTFMJTTrBo8LxwDa5KjbPWRd78e3xrmv9+DMSIC82qXgtq8qjeA84mkoOlbKyCoMW
	 Fx+WWkmhglTC3EsALOLaBZy5vAEviAgKF6yIXf7Xjr3NuMJdRgKWKghkpqJNbS3FBd
	 XRSxLTYa+qznnJyM0fSt+bUalLwCloCTdAhF7dJxtDDOguVTcqwMrJUlVZFOoKT3Hp
	 273IYM2XKujF1fLy/lNsTa0THgh7H6OpcF18Y25wgQE6jSUTU8saXaWUaacaJn3CYL
	 FYxJcHFl7bLPw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
Date: Thu, 26 Oct 2023 12:19:57 +0200
Message-Id: <20231026101957.320572-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_032014_501644_231EA839 
X-CRM114-Status: GOOD (  12.87  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKU29tZSAoZnV0dXJlKSB1
c2VycyBvZiB0aGUgaXJxIG1hdHJpeCBhbGxvY2F0b3IsIGRvIG5vdCBrbm93IHRoZSBzaXplCm9m
IHRoZSBtYXRyaXggYml0bWFwcyBhdCBjb21waWxlIHRpbWUuCgpUbyBhdm9pZCB3YXN0aW5nIG1l
bW9yeSBvbiB1bm5lY2Vzc2FyeSBsYXJnZSBiaXRtYXBzLCBzaXplIHRoZSBiaXRtYXAKYXQgbWF0
cml4IGFsbG9jYXRpb24gdGltZS4KClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KLS0tCkhlcmUncyBhIGNsZWFuZWQgdXAsIGJvb3QgdGVzdGVkLCBwcm9w
ZXIgcGF0Y2guCgpUaG9tYXMsIHRoaXMgaXMganVzdCBGWUkvUkZDLiBUaGlzIGNoYW5nZSB3b3Vs
ZCBvbmx5IG1ha2Ugc2Vuc2UsIGlmCnRoZSBSSVNDLVYgQUlBIHNlcmllcyBzdGFydHMgdXNpbmcg
dGhlIElSUSBtYXRyaXggYWxsb2NhdG9yLgoKCkJqw7ZybgotLS0KIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2h3X2lycS5oIHwgIDIgLS0KIGtlcm5lbC9pcnEvbWF0cml4LmMgICAgICAgICAgIHwgMjgg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9od19pcnEuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h3X2lycS5oCmluZGV4IDU1MTgyOTg4
NDczNC4uZGNmYWEzODEyMzA2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9od19p
cnEuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9od19pcnEuaApAQCAtMTYsOCArMTYsNiBA
QAogCiAjaW5jbHVkZSA8YXNtL2lycV92ZWN0b3JzLmg+CiAKLSNkZWZpbmUgSVJRX01BVFJJWF9C
SVRTCQlOUl9WRUNUT1JTCi0KICNpZm5kZWYgX19BU1NFTUJMWV9fCiAKICNpbmNsdWRlIDxsaW51
eC9wZXJjcHUuaD4KZGlmZiAtLWdpdCBhL2tlcm5lbC9pcnEvbWF0cml4LmMgYi9rZXJuZWwvaXJx
L21hdHJpeC5jCmluZGV4IDE2OThlNzc2NDVhYy4uOTk2Y2JiNDZkNjU0IDEwMDY0NAotLS0gYS9r
ZXJuZWwvaXJxL21hdHJpeC5jCisrKyBiL2tlcm5lbC9pcnEvbWF0cml4LmMKQEAgLTgsOCArOCw2
IEBACiAjaW5jbHVkZSA8bGludXgvY3B1Lmg+CiAjaW5jbHVkZSA8bGludXgvaXJxLmg+CiAKLSNk
ZWZpbmUgSVJRX01BVFJJWF9TSVpFCShCSVRTX1RPX0xPTkdTKElSUV9NQVRSSVhfQklUUykpCi0K
IHN0cnVjdCBjcHVtYXAgewogCXVuc2lnbmVkIGludAkJYXZhaWxhYmxlOwogCXVuc2lnbmVkIGlu
dAkJYWxsb2NhdGVkOwpAQCAtMTcsOCArMTUsOCBAQCBzdHJ1Y3QgY3B1bWFwIHsKIAl1bnNpZ25l
ZCBpbnQJCW1hbmFnZWRfYWxsb2NhdGVkOwogCWJvb2wJCQlpbml0aWFsaXplZDsKIAlib29sCQkJ
b25saW5lOwotCXVuc2lnbmVkIGxvbmcJCWFsbG9jX21hcFtJUlFfTUFUUklYX1NJWkVdOwotCXVu
c2lnbmVkIGxvbmcJCW1hbmFnZWRfbWFwW0lSUV9NQVRSSVhfU0laRV07CisJdW5zaWduZWQgbG9u
ZwkJKm1hbmFnZWRfbWFwOworCXVuc2lnbmVkIGxvbmcJCWFsbG9jX21hcFtdOwogfTsKIAogc3Ry
dWN0IGlycV9tYXRyaXggewpAQCAtMzIsOCArMzAsOCBAQCBzdHJ1Y3QgaXJxX21hdHJpeCB7CiAJ
dW5zaWduZWQgaW50CQl0b3RhbF9hbGxvY2F0ZWQ7CiAJdW5zaWduZWQgaW50CQlvbmxpbmVfbWFw
czsKIAlzdHJ1Y3QgY3B1bWFwIF9fcGVyY3B1CSptYXBzOwotCXVuc2lnbmVkIGxvbmcJCXNjcmF0
Y2hfbWFwW0lSUV9NQVRSSVhfU0laRV07Ci0JdW5zaWduZWQgbG9uZwkJc3lzdGVtX21hcFtJUlFf
TUFUUklYX1NJWkVdOworCXVuc2lnbmVkIGxvbmcJCSpzeXN0ZW1fbWFwOworCXVuc2lnbmVkIGxv
bmcJCXNjcmF0Y2hfbWFwW107CiB9OwogCiAjZGVmaW5lIENSRUFURV9UUkFDRV9QT0lOVFMKQEAg
LTUwLDI0ICs0OCwzMiBAQCBfX2luaXQgc3RydWN0IGlycV9tYXRyaXggKmlycV9hbGxvY19tYXRy
aXgodW5zaWduZWQgaW50IG1hdHJpeF9iaXRzLAogCQkJCQkgICB1bnNpZ25lZCBpbnQgYWxsb2Nf
c3RhcnQsCiAJCQkJCSAgIHVuc2lnbmVkIGludCBhbGxvY19lbmQpCiB7CisJdW5zaWduZWQgaW50
IGNwdSwgbWF0cml4X3NpemUgPSBCSVRTX1RPX0xPTkdTKG1hdHJpeF9iaXRzKTsKIAlzdHJ1Y3Qg
aXJxX21hdHJpeCAqbTsKIAotCWlmIChtYXRyaXhfYml0cyA+IElSUV9NQVRSSVhfQklUUykKLQkJ
cmV0dXJuIE5VTEw7Ci0KLQltID0ga3phbGxvYyhzaXplb2YoKm0pLCBHRlBfS0VSTkVMKTsKKwlt
ID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShtLCBzY3JhdGNoX21hcCwgbWF0cml4X3NpemUgKiAyKSwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFtKQogCQlyZXR1cm4gTlVMTDsKIAorCW0tPnN5c3RlbV9tYXAg
PSAmbS0+c2NyYXRjaF9tYXBbbWF0cml4X3NpemVdOworCiAJbS0+bWF0cml4X2JpdHMgPSBtYXRy
aXhfYml0czsKIAltLT5hbGxvY19zdGFydCA9IGFsbG9jX3N0YXJ0OwogCW0tPmFsbG9jX2VuZCA9
IGFsbG9jX2VuZDsKIAltLT5hbGxvY19zaXplID0gYWxsb2NfZW5kIC0gYWxsb2Nfc3RhcnQ7Ci0J
bS0+bWFwcyA9IGFsbG9jX3BlcmNwdSgqbS0+bWFwcyk7CisJbS0+bWFwcyA9IF9fYWxsb2NfcGVy
Y3B1KHN0cnVjdF9zaXplKG0tPm1hcHMsIGFsbG9jX21hcCwgbWF0cml4X3NpemUgKiAyKSwKKwkJ
CQkgX19hbGlnbm9mX18oKm0tPm1hcHMpKTsKIAlpZiAoIW0tPm1hcHMpIHsKIAkJa2ZyZWUobSk7
CiAJCXJldHVybiBOVUxMOwogCX0KKworCWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKKwkJ
c3RydWN0IGNwdW1hcCAqY20gPSBwZXJfY3B1X3B0cihtLT5tYXBzLCBjcHUpOworCisJCWNtLT5t
YW5hZ2VkX21hcCA9ICZjbS0+YWxsb2NfbWFwW21hdHJpeF9zaXplXTsKKwl9CisKIAlyZXR1cm4g
bTsKIH0KIAoKYmFzZS1jb21taXQ6IDYxMWRhMDdiODlmZGQ1M2YxNDBkN2IzMzAxM2YyNTViZjBl
ZDhmMzQKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
