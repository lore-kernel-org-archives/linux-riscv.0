Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF13C27C5E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHlLamR4AjucazqzjOTPEgyDvhygyEj/Kv4hp5d002E=; b=3nIDO/uI6d32QN
	QfY4NxFYJ5GwvaCaZyb1rOkVqRLd13T+57elmCKgcvSsm3DEyYmeC/thI3S8to0vuSdo1F73yiX+6
	oz86sXWMIFCwsiCSPdHQ+1cafzjWdWdJp4wk2JQJuEy0UhPR4XdNLwmHiqdUYJfIVitiR7hzIJo9l
	b6kGn5aPiDwBdncQVv1oQdFmjkRIweebGqEE2jOlTT7kra3OiJiZZYKMeFYAxflclif3/TkfhwSt3
	nO9p8a5L3pJw+d4n7NbkuAOSsKaET3AIgyUVk4i9uYjmC4f1n2i50mZEVaGp1AKW3F5nhIu3AEH6L
	lwzYBl+9JI+hX+fN1Hyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1q-00000005kKM-1rNg;
	Wed, 05 Jun 2024 11:42:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1n-00000005kHk-2cpX
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D428D617FE;
	Wed,  5 Jun 2024 11:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF64C4AF0C;
	Wed,  5 Jun 2024 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587722;
	bh=IPeVMzLSHAetEan16+4AGusBy5f8DjdVFow0+Vll8PM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jo6MEl7isuHaac7iV7kxZMsSBTLmj1eZ5KNdf9SnXhC9rpkaYD0C9ASvySkzfKVoA
	 gTrKEdDt0gpQoX0BIky3ja2sj46cDjW3Qyrq9Zhidq96vvqVl2EBlJ8IJn42DtwXj0
	 89zFsSowmTJK3LO+jbOtmVtfSewlqRQ2mylsiCtsNb8OCmpycycaF7g0QtN6ZWQYMp
	 D1MR8apn8ditgqYOGW2krAy1bR+WunmRVJsKyG1hF8dFzYx71C/RumhKLpICzYp+Z9
	 usff7UPHLDivgDix7qJnceDqNRkKGqCUQm7327NUeGvucwfxvEuUDf/sQ7o4ccSxvM
	 lChmPPJRMdqTg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 10/11] riscv: mm: Add support for ZONE_DEVICE
Date: Wed,  5 Jun 2024 13:40:53 +0200
Message-ID: <20240605114100.315918-11-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044203_852071_D15969D1 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKWk9ORV9ERVZJQ0UgcGFn
ZXMgbmVlZCBERVZNQVAgUFRFcyBzdXBwb3J0IHRvIGZ1bmN0aW9uCihBUkNIX0hBU19QVEVfREVW
TUFQKS4gQ2xhaW0gYW5vdGhlciBSU1cgKHJlc2VydmVkIGZvciBzb2Z0d2FyZSkgYml0CmluIHRo
ZSBQVEUgZm9yIERFVk1BUCBtYXJrLCBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgaGVscGVycywgYW5k
IGVuYWJsZQpBUkNIX0hBU19QVEVfREVWTUFQIGZvciByaXNjdjY0LgoKUmV2aWV3ZWQtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUt
NjQuaCAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS1iaXRzLmggfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAg
ICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
ZwppbmRleCA4ZDg2MGFkM2IxNzEuLjhhNDliNWY0YzAxNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMzcsNiArMzcsNyBAQCBjb25m
aWcgUklTQ1YKIAlzZWxlY3QgQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UK
IAlzZWxlY3QgQVJDSF9IQVNfUE1FTV9BUEkKIAlzZWxlY3QgQVJDSF9IQVNfUFJFUEFSRV9TWU5D
X0NPUkVfQ01ECisJc2VsZWN0IEFSQ0hfSEFTX1BURV9ERVZNQVAgaWYgNjRCSVQgJiYgTU1VCiAJ
c2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCiAJc2VsZWN0IEFSQ0hfSEFTX1NFVF9ESVJFQ1Rf
TUFQIGlmIE1NVQogCXNlbGVjdCBBUkNIX0hBU19TRVRfTUVNT1JZIGlmIE1NVQpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUtNjQuaAppbmRleCA4YzM2YTg4MTg0MzIuLjA4OTdkZDk5YWI4ZCAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKQEAgLTM5OCw0ICszOTgsMjQgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgcGFnZSAqcGdkX3BhZ2UocGdkX3QgcGdkKQogI2RlZmluZSBwNGRfb2Zm
c2V0IHA0ZF9vZmZzZXQKIHA0ZF90ICpwNGRfb2Zmc2V0KHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxv
bmcgYWRkcmVzcyk7CiAKKyNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKK3N0YXRp
YyBpbmxpbmUgaW50IHB0ZV9kZXZtYXAocHRlX3QgcHRlKTsKK3N0YXRpYyBpbmxpbmUgcHRlX3Qg
cG1kX3B0ZShwbWRfdCBwbWQpOworCitzdGF0aWMgaW5saW5lIGludCBwbWRfZGV2bWFwKHBtZF90
IHBtZCkKK3sKKwlyZXR1cm4gcHRlX2Rldm1hcChwbWRfcHRlKHBtZCkpOworfQorCitzdGF0aWMg
aW5saW5lIGludCBwdWRfZGV2bWFwKHB1ZF90IHB1ZCkKK3sKKwlyZXR1cm4gMDsKK30KKworc3Rh
dGljIGlubGluZSBpbnQgcGdkX2Rldm1hcChwZ2RfdCBwZ2QpCit7CisJcmV0dXJuIDA7Cit9Cisj
ZW5kaWYKKwogI2VuZGlmIC8qIF9BU01fUklTQ1ZfUEdUQUJMRV82NF9IICovCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLWJpdHMuaAppbmRleCAxNzliZDRhZmVjZTQuLmE4ZjUyMDVjZWE1NCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oCkBAIC0xOSw2ICsxOSw3IEBACiAj
ZGVmaW5lIF9QQUdFX1NPRlQgICAgICAoMyA8PCA4KSAgICAvKiBSZXNlcnZlZCBmb3Igc29mdHdh
cmUgKi8KIAogI2RlZmluZSBfUEFHRV9TUEVDSUFMICAgKDEgPDwgOCkgICAgLyogUlNXOiAweDEg
Ki8KKyNkZWZpbmUgX1BBR0VfREVWTUFQICAgICgxIDw8IDkpICAgIC8qIFJTVywgZGV2bWFwICov
CiAjZGVmaW5lIF9QQUdFX1RBQkxFICAgICBfUEFHRV9QUkVTRU5UCiAKIC8qCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCmluZGV4IDQxZjFiMmM2Zjk0OS4uZGQ0ZDUyOTQwMTA2IDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaApAQCAtMzkwLDYgKzM5MCwxMyBAQCBzdGF0aWMgaW5saW5lIGludCBw
dGVfc3BlY2lhbChwdGVfdCBwdGUpCiAJcmV0dXJuIHB0ZV92YWwocHRlKSAmIF9QQUdFX1NQRUNJ
QUw7CiB9CiAKKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUAorc3RhdGljIGlubGlu
ZSBpbnQgcHRlX2Rldm1hcChwdGVfdCBwdGUpCit7CisJcmV0dXJuIHB0ZV92YWwocHRlKSAmIF9Q
QUdFX0RFVk1BUDsKK30KKyNlbmRpZgorCiAvKiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9yZHBy
b3RlY3QocHRlX3QgcHRlKSAqLwogCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV93cnByb3RlY3Qo
cHRlX3QgcHRlKQpAQCAtNDMxLDYgKzQzOCwxMSBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9t
a3NwZWNpYWwocHRlX3QgcHRlKQogCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9T
UEVDSUFMKTsKIH0KIAorc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtkZXZtYXAocHRlX3QgcHRl
KQoreworCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9ERVZNQVApOworfQorCiBz
dGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta2h1Z2UocHRlX3QgcHRlKQogewogCXJldHVybiBwdGU7
CkBAIC03MjEsNiArNzMzLDExIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21rZGlydHkocG1k
X3QgcG1kKQogCXJldHVybiBwdGVfcG1kKHB0ZV9ta2RpcnR5KHBtZF9wdGUocG1kKSkpOwogfQog
CitzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9ta2Rldm1hcChwbWRfdCBwbWQpCit7CisJcmV0dXJu
IHB0ZV9wbWQocHRlX21rZGV2bWFwKHBtZF9wdGUocG1kKSkpOworfQorCiBzdGF0aWMgaW5saW5l
IHZvaWQgc2V0X3BtZF9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRy
LAogCQkJCXBtZF90ICpwbWRwLCBwbWRfdCBwbWQpCiB7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
