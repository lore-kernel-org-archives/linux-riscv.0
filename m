Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD8C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCDdjF9cGpvZ5EOXc4EMbmbHz6flkrVvUtzuC3T/IcY=; b=F71Jn5EPmqMhHl
	yJNlJD+EUJdNYYajD5T+McadqZZS6dhQ/j88Kee6U2w+95WIxKPHW/HbF/AG7zV2T44NwkQRoA4Hk
	Qm1vtekAFDlB3xQh0X5VmgUPmjXWA/XWgmElB5yo5UlcWO6vMeP1X2Rg07secjT7xW1Oy7M0Hf6nD
	U4nqYUeen7Q86YECLJb3TqdCg38TGRx7nz5hPBhZR6jaq1Dd1J1b9UPv3ZAXT50+FMFzmkYUfQm7p
	eP1pXge7mhmld48ZSLTtzjRFfcUN+dUBgJHd0lmJRIKn6IQljwqHMJeBuKwVvH9D20EyJ8mrYv/Ge
	zL4QVgmiUeKJpmv8z0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smn-0000000G7nx-2vHG;
	Tue, 14 May 2024 14:05:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smi-0000000G7it-1K6d
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6ECE61277;
	Tue, 14 May 2024 14:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AD3C32782;
	Tue, 14 May 2024 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695539;
	bh=ID0c8KED4MaRAhJEPecqve06L1MFkX8CguX3Z8emb34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DocwhOPMzvezJPtOLEyIs2TIRSDK1iKYiQIktTqvDEydUXhzyMFEVIe4w7rEBUoLH
	 s1Aip/eIuRLs0LXxRO2MMKQduZjZ4DBOo06roaRsDYMD4/V0p/WrJ1lfcdUWNFUWwn
	 ODSRdACvCftCwaJk1JNzfbi3KPDD6bOSxG75Dty41GwFFUJmy5m2JNOYIkDK9lRWK4
	 +67Ojs55jbeazXTVY+CfQswUJQMXyrqtCucl7p6pKvQpAHUytS7hU/8LLSnmhoiUR/
	 8vk20MjslNrDRrN0YMhL+gaxgJaWiumVfcpTRg8PMQDoBY6o9yqd75mDcjXratHavn
	 aZt3F8dpoR/bA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 8/8] riscv: mm: Add support for ZONE_DEVICE
Date: Tue, 14 May 2024 16:04:46 +0200
Message-Id: <20240514140446.538622-9-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070540_637740_CB41CFD8 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
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
aCAgICAgIHwgMTUgKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKaW5kZXggYjkzOThiNjRiYjY5Li42ZDQyNmFmZGQ5MDQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTM2LDYgKzM2LDcgQEAgY29u
ZmlnIFJJU0NWCiAJc2VsZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNF
CiAJc2VsZWN0IEFSQ0hfSEFTX1BNRU1fQVBJCiAJc2VsZWN0IEFSQ0hfSEFTX1BSRVBBUkVfU1lO
Q19DT1JFX0NNRAorCXNlbGVjdCBBUkNIX0hBU19QVEVfREVWTUFQIGlmIDY0QklUICYmIE1NVQog
CXNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTAogCXNlbGVjdCBBUkNIX0hBU19TRVRfRElSRUNU
X01BUCBpZiBNTVUKIAlzZWxlY3QgQVJDSF9IQVNfU0VUX01FTU9SWSBpZiBNTVUKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLTY0LmgKaW5kZXggMjIxYTVjMWVlMjg3Li5jNjdhOWJiZmQwMTAgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oCkBAIC00MDAsNCArNDAwLDI0IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHBhZ2UgKnBnZF9wYWdlKHBnZF90IHBnZCkKICNkZWZpbmUgcDRkX29m
ZnNldCBwNGRfb2Zmc2V0CiBwNGRfdCAqcDRkX29mZnNldChwZ2RfdCAqcGdkLCB1bnNpZ25lZCBs
b25nIGFkZHJlc3MpOwogCisjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCitzdGF0
aWMgaW5saW5lIGludCBwdGVfZGV2bWFwKHB0ZV90IHB0ZSk7CitzdGF0aWMgaW5saW5lIHB0ZV90
IHBtZF9wdGUocG1kX3QgcG1kKTsKKworc3RhdGljIGlubGluZSBpbnQgcG1kX2Rldm1hcChwbWRf
dCBwbWQpCit7CisJcmV0dXJuIHB0ZV9kZXZtYXAocG1kX3B0ZShwbWQpKTsKK30KKworc3RhdGlj
IGlubGluZSBpbnQgcHVkX2Rldm1hcChwdWRfdCBwdWQpCit7CisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyBpbmxpbmUgaW50IHBnZF9kZXZtYXAocGdkX3QgcGdkKQoreworCXJldHVybiAwOworfQor
I2VuZGlmCisKICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BHVEFCTEVfNjRfSCAqLwpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKaW5kZXggMTc5YmQ0YWZlY2U0Li5hOGY1MjA1Y2VhNTQg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaApAQCAtMTksNiArMTksNyBAQAog
I2RlZmluZSBfUEFHRV9TT0ZUICAgICAgKDMgPDwgOCkgICAgLyogUmVzZXJ2ZWQgZm9yIHNvZnR3
YXJlICovCiAKICNkZWZpbmUgX1BBR0VfU1BFQ0lBTCAgICgxIDw8IDgpICAgIC8qIFJTVzogMHgx
ICovCisjZGVmaW5lIF9QQUdFX0RFVk1BUCAgICAoMSA8PCA5KSAgICAvKiBSU1csIGRldm1hcCAq
LwogI2RlZmluZSBfUEFHRV9UQUJMRSAgICAgX1BBR0VfUFJFU0VOVAogCiAvKgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAppbmRleCA3OTMzZjQ5M2RiNzEuLjIxNmRlMWRiM2NkMCAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTM4Nyw2ICszODcsMTEgQEAgc3RhdGljIGlubGluZSBpbnQg
cHRlX3NwZWNpYWwocHRlX3QgcHRlKQogCXJldHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9TUEVD
SUFMOwogfQogCitzdGF0aWMgaW5saW5lIGludCBwdGVfZGV2bWFwKHB0ZV90IHB0ZSkKK3sKKwly
ZXR1cm4gcHRlX3ZhbChwdGUpICYgX1BBR0VfREVWTUFQOworfQorCiAvKiBzdGF0aWMgaW5saW5l
IHB0ZV90IHB0ZV9yZHByb3RlY3QocHRlX3QgcHRlKSAqLwogCiBzdGF0aWMgaW5saW5lIHB0ZV90
IHB0ZV93cnByb3RlY3QocHRlX3QgcHRlKQpAQCAtNDI4LDYgKzQzMywxMSBAQCBzdGF0aWMgaW5s
aW5lIHB0ZV90IHB0ZV9ta3NwZWNpYWwocHRlX3QgcHRlKQogCXJldHVybiBfX3B0ZShwdGVfdmFs
KHB0ZSkgfCBfUEFHRV9TUEVDSUFMKTsKIH0KIAorc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtk
ZXZtYXAocHRlX3QgcHRlKQoreworCXJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9E
RVZNQVApOworfQorCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta2h1Z2UocHRlX3QgcHRlKQog
ewogCXJldHVybiBwdGU7CkBAIC03MTEsNiArNzIxLDExIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3Qg
cG1kX21rZGlydHkocG1kX3QgcG1kKQogCXJldHVybiBwdGVfcG1kKHB0ZV9ta2RpcnR5KHBtZF9w
dGUocG1kKSkpOwogfQogCitzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9ta2Rldm1hcChwbWRfdCBw
bWQpCit7CisJcmV0dXJuIHB0ZV9wbWQocHRlX21rZGV2bWFwKHBtZF9wdGUocG1kKSkpOworfQor
CiBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3BtZF9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgbG9uZyBhZGRyLAogCQkJCXBtZF90ICpwbWRwLCBwbWRfdCBwbWQpCiB7Ci0tIAoyLjQw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
