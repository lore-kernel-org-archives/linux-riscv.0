Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3EFC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtNwWy817KhnnXDoSlt/X7u3iy1I5beLDO38Y21/ssU=; b=rcG47go/tZIgZM
	Ba6CEDlT8wlLT7f+l4vXVpRXzz+v4ZA8rmKEkJhQZfFxVhLZlZZVdHCPAEwPT7zDzi2TVVA7vmjm7
	/cw95xR3238UCZkgV1m7Ra8a8H5LNXfzxA4sGtkeA/1deOA8I5Y5ZSxm+9c/pt7Ri9F+JGmOjcplB
	UZnsaDmQjUDRnVEArNIZgF+c6tTLkX+SreOZVlvvBMqhg4XUm21iWC3nQPhzA/HuLIsaVnBnsXkiw
	WUhojDBUYM/IGS1hBfnEOva/ze8jBjMRyuSaKjlN33M2DQGFhD3YO2Pm6kdlfd1jcocDutmI89Bhd
	p5ugMOncHTH3MTM5R59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzw-0000000HL5j-0tyn;
	Tue, 21 May 2024 11:49:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzh-0000000HKuG-3ct5
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 157E162210;
	Tue, 21 May 2024 11:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F4EC2BD11;
	Tue, 21 May 2024 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292164;
	bh=UfTTCJAd6gAR/W/+kWuHX2+0dwTK25Vi11SpkX7YGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rESFWlwtcK7rvFv8Um9btQJZUwRB2RdO8MjvUB2BICQEPh/EbugiTsxumyL5292hX
	 SaghKnmizBA/pp7A+Dtlq+qwqNSRixbwdlsADGbs6CIn15dyBN0k28FwBbMS8aiTPI
	 Kp1INLM1FgGFhmvmSsgoX0Ju3Cx9yzirSxLHZ/7IJ7s8WGmxnG22tVNZm7926LBz6M
	 m49b2985aSBi87GawTioSdpHQvEIGdWaOc7nHUaGWvtz6CXRNKEfKQBtE6tGfFo5qO
	 sEpBR+MlOfCff/Ge6iR1CKDRfbGBh0FxjrF7lgu/xXIUY28Ntlxfpz6GDjZg2lyHDr
	 N+eN0jCwq4bcw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 9/9] riscv: mm: Add support for ZONE_DEVICE
Date: Tue, 21 May 2024 13:48:30 +0200
Message-Id: <20240521114830.841660-10-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044926_526163_4EA9C926 
X-CRM114-Status: GOOD (  11.18  )
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
IGVuYWJsZQpBUkNIX0hBU19QVEVfREVWTUFQIGZvciByaXNjdjY0LgoKU2lnbmVkLW9mZi1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUtNjQuaCAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS1iaXRzLmggfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aCAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCAyNzI0ZGMyYWYyOWYuLjBiNzQ2OThjNjNjNyAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMzYsNiArMzYsNyBAQCBj
b25maWcgUklTQ1YKIAlzZWxlY3QgQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BB
Q0UKIAlzZWxlY3QgQVJDSF9IQVNfUE1FTV9BUEkKIAlzZWxlY3QgQVJDSF9IQVNfUFJFUEFSRV9T
WU5DX0NPUkVfQ01ECisJc2VsZWN0IEFSQ0hfSEFTX1BURV9ERVZNQVAgaWYgNjRCSVQgJiYgTU1V
CiAJc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCiAJc2VsZWN0IEFSQ0hfSEFTX1NFVF9ESVJF
Q1RfTUFQIGlmIE1NVQogCXNlbGVjdCBBUkNIX0hBU19TRVRfTUVNT1JZIGlmIE1NVQpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUtNjQuaAppbmRleCAyMjFhNWMxZWUyODcuLmM2N2E5YmJmZDAxMCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKQEAgLTQwMCw0ICs0MDAsMjQgQEAgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqcGdkX3BhZ2UocGdkX3QgcGdkKQogI2RlZmluZSBwNGRf
b2Zmc2V0IHA0ZF9vZmZzZXQKIHA0ZF90ICpwNGRfb2Zmc2V0KHBnZF90ICpwZ2QsIHVuc2lnbmVk
IGxvbmcgYWRkcmVzcyk7CiAKKyNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKK3N0
YXRpYyBpbmxpbmUgaW50IHB0ZV9kZXZtYXAocHRlX3QgcHRlKTsKK3N0YXRpYyBpbmxpbmUgcHRl
X3QgcG1kX3B0ZShwbWRfdCBwbWQpOworCitzdGF0aWMgaW5saW5lIGludCBwbWRfZGV2bWFwKHBt
ZF90IHBtZCkKK3sKKwlyZXR1cm4gcHRlX2Rldm1hcChwbWRfcHRlKHBtZCkpOworfQorCitzdGF0
aWMgaW5saW5lIGludCBwdWRfZGV2bWFwKHB1ZF90IHB1ZCkKK3sKKwlyZXR1cm4gMDsKK30KKwor
c3RhdGljIGlubGluZSBpbnQgcGdkX2Rldm1hcChwZ2RfdCBwZ2QpCit7CisJcmV0dXJuIDA7Cit9
CisjZW5kaWYKKwogI2VuZGlmIC8qIF9BU01fUklTQ1ZfUEdUQUJMRV82NF9IICovCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaAppbmRleCAxNzliZDRhZmVjZTQuLmE4ZjUyMDVjZWE1
NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oCkBAIC0xOSw2ICsxOSw3IEBA
CiAjZGVmaW5lIF9QQUdFX1NPRlQgICAgICAoMyA8PCA4KSAgICAvKiBSZXNlcnZlZCBmb3Igc29m
dHdhcmUgKi8KIAogI2RlZmluZSBfUEFHRV9TUEVDSUFMICAgKDEgPDwgOCkgICAgLyogUlNXOiAw
eDEgKi8KKyNkZWZpbmUgX1BBR0VfREVWTUFQICAgICgxIDw8IDkpICAgIC8qIFJTVywgZGV2bWFw
ICovCiAjZGVmaW5lIF9QQUdFX1RBQkxFICAgICBfUEFHRV9QUkVTRU5UCiAKIC8qCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCmluZGV4IDc5MzNmNDkzZGI3MS4uMDJmYWRjMjc2MDY0IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaApAQCAtMzg3LDYgKzM4NywxMyBAQCBzdGF0aWMgaW5saW5lIGlu
dCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpCiAJcmV0dXJuIHB0ZV92YWwocHRlKSAmIF9QQUdFX1NQ
RUNJQUw7CiB9CiAKKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUAorc3RhdGljIGlu
bGluZSBpbnQgcHRlX2Rldm1hcChwdGVfdCBwdGUpCit7CisJcmV0dXJuIHB0ZV92YWwocHRlKSAm
IF9QQUdFX0RFVk1BUDsKK30KKyNlbmRpZgorCiAvKiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9y
ZHByb3RlY3QocHRlX3QgcHRlKSAqLwogCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV93cnByb3Rl
Y3QocHRlX3QgcHRlKQpAQCAtNDI4LDYgKzQzNSwxMSBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0
ZV9ta3NwZWNpYWwocHRlX3QgcHRlKQogCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFH
RV9TUEVDSUFMKTsKIH0KIAorc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtkZXZtYXAocHRlX3Qg
cHRlKQoreworCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9ERVZNQVApOworfQor
CiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta2h1Z2UocHRlX3QgcHRlKQogewogCXJldHVybiBw
dGU7CkBAIC03MTEsNiArNzIzLDExIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21rZGlydHko
cG1kX3QgcG1kKQogCXJldHVybiBwdGVfcG1kKHB0ZV9ta2RpcnR5KHBtZF9wdGUocG1kKSkpOwog
fQogCitzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9ta2Rldm1hcChwbWRfdCBwbWQpCit7CisJcmV0
dXJuIHB0ZV9wbWQocHRlX21rZGV2bWFwKHBtZF9wdGUocG1kKSkpOworfQorCiBzdGF0aWMgaW5s
aW5lIHZvaWQgc2V0X3BtZF9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAogCQkJCXBtZF90ICpwbWRwLCBwbWRfdCBwbWQpCiB7Ci0tIAoyLjQwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
