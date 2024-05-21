Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14D9C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P07L+JBZaLorPpZTLxiorBkiJvfZf09OdjcagkC5r6E=; b=rH0umIHV8NeaEF
	2nA/SIvS8WXh6D+Po1rCfQMT/M+HwR/oAJUrGzADb5PRiZ7jTipfGzFg1huDNNc5roFZvzDAVkDCv
	FpU0cT0plQ9x9cNdr+qDKo7ukdW+wLRUe1udVRV/TMvKabkEz08V638IMVEUT8CCTaV+WnbKdjIrK
	YwYMNvK6dzx3YBjvAZ9aBk+SNa3iHd/gN1wA8R8w+7xweZTKAy2909/hnh4emZcg/ccXaH6/9u+oF
	skGrVykrfSC1yAtPBaYb2S+DwIbfMBIvMVGGNBLacPo5oxtvI1uzxAY4QW3mjLNm4N6ALK7RBtXLM
	4M5UJeJa6WGSF1gCp25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzI-0000000HKbl-222J;
	Tue, 21 May 2024 11:49:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzD-0000000HKYu-1LCM
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:48:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A15556220F;
	Tue, 21 May 2024 11:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1475C4AF09;
	Tue, 21 May 2024 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292134;
	bh=nfJcShROxet1Zcs9SjZc/rXdynjgyC+wVMctU8YOdM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5nLepXejKU2VOMdC1SRZPZvOZANI4opdVRkd8+TPMDK5sR0P07NwX2ZJc79N4eQZ
	 bfaqTkEl6t3lFSwKwGIAvi6aKuwLCtjqA4R28DwMCONu+LBEGDp5huVkPzSrGGxpd3
	 eAcze83sdvqq0s5ijrEJlIMQhBoRLsPinLO1fb+pp/i5dnM4oCQdFZahjroxJU+tqs
	 ZfAsw+QYO295mUt8WJNF8A1EuNCBtYJdN32QaUsHu3K8cxyCjruvL8/XB8PAlIhEie
	 b/8oz9DQETq8tgzZZdrqszIj0S0PXOjWIcDgLIx3Il4t+3513huBPyuUBrwrHotznV
	 5JmJyHV48MBQA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 2/9] riscv: mm: Pre-allocate vmemmap/direct map PGD entries
Date: Tue, 21 May 2024 13:48:23 +0200
Message-Id: <20240521114830.841660-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044855_794145_620AB6A8 
X-CRM114-Status: GOOD (  13.94  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBwb3J0
IGNvcGllcyB0aGUgUEdEIHRhYmxlIGZyb20gaW5pdF9tbS9zd2FwcGVyX3BnX2RpciB0bwphbGwg
dXNlcmxhbmQgcGFnZSB0YWJsZXMsIHdoaWNoIG1lYW5zIHRoYXQgaWYgdGhlIFBHRCBsZXZlbCB0
YWJsZSBpcwpjaGFuZ2VkLCBvdGhlciBwYWdlIHRhYmxlcyBoYXMgdG8gYmUgdXBkYXRlZCBhcyB3
ZWxsLgoKSW5zdGVhZCBvZiBoYXZpbmcgdGhlIFBHRCBjaGFuZ2VzIHJpcHBsZSBvdXQgdG8gYWxs
IHRhYmxlcywgdGhlCnN5bmNocm9uaXphdGlvbiBjYW4gYmUgYXZvaWRlZCBieSBwcmUtYWxsb2Nh
dGluZyB0aGUgUEdEIGVudHJpZXMvcGFnZXMKYXQgYm9vdCwgYXZvaWRpbmcgdGhlIHN5bmNocm9u
aXphdGlvbiBhbGwgdG9nZXRoZXIuCgpUaGlzIGlzIGN1cnJlbnRseSBkb25lIGZvciB0aGUgYnBm
L21vZHVsZXMsIGFuZCB2bWFsbG9jIFBHRCByZWdpb25zLgpFeHRlbmQgdGhpcyBzY2hlbWUgZm9y
IHRoZSBQR0QgcmVnaW9ucyB0b3VjaGVkIGJ5IG1lbW9yeSBob3RwbHVnZ2luZy4KClByZXBhcmUg
dGhlIFJJU0MtViBwb3J0IGZvciBtZW1vcnkgaG90cGx1ZyBieSBwcmUtYWxsb2NhdGUKdm1lbW1h
cC9kaXJlY3QgbWFwIGVudHJpZXMgYXQgdGhlIFBHRCBsZXZlbC4gVGhpcyB3aWxsIHJvdWdobHkg
d2FzdGUKfjEyOCB3b3J0aCBvZiA0SyBwYWdlcyB3aGVuIG1lbW9yeSBob3RwbHVnZ2luZyBpcyBl
bmFibGVkIGluIHRoZQprZXJuZWwgY29uZmlndXJhdGlvbi4KClJldmlld2VkLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2th
c2FuLmggfCA0ICsrLS0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8IDcgKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rYXNhbi5oCmluZGV4IDBiODVlMzYzZTc3OC4uZTZhMDA3MWJkYjU2IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rYXNhbi5oCkBAIC02LDggKzYsNiBAQAogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwog
Ci0jaWZkZWYgQ09ORklHX0tBU0FOCi0KIC8qCiAgKiBUaGUgZm9sbG93aW5nIGNvbW1lbnQgd2Fz
IGNvcGllZCBmcm9tIGFybTY0OgogICogS0FTQU5fU0hBRE9XX1NUQVJUOiBiZWdpbm5pbmcgb2Yg
dGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Nlcy4KQEAgLTM0LDYgKzMyLDggQEAKICAqLwogI2Rl
ZmluZSBLQVNBTl9TSEFET1dfU1RBUlQJKChLQVNBTl9TSEFET1dfRU5EIC0gS0FTQU5fU0hBRE9X
X1NJWkUpICYgUEdESVJfTUFTSykKICNkZWZpbmUgS0FTQU5fU0hBRE9XX0VORAlNT0RVTEVTX0xP
V0VTVF9WQUREUgorCisjaWZkZWYgQ09ORklHX0tBU0FOCiAjZGVmaW5lIEtBU0FOX1NIQURPV19P
RkZTRVQJX0FDKENPTkZJR19LQVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKIAogdm9pZCBrYXNhbl9p
bml0KHZvaWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2
L21tL2luaXQuYwppbmRleCBiNjZmODQ2ZTc2MzQuLmM5ODAxMGVkZTgxMCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTI3LDYg
KzI3LDcgQEAKIAogI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vaW8uaD4K
KyNpbmNsdWRlIDxhc20va2FzYW4uaD4KICNpbmNsdWRlIDxhc20vbnVtYS5oPgogI2luY2x1ZGUg
PGFzbS9wZ3RhYmxlLmg+CiAjaW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+CkBAIC0xNDg4LDEwICsx
NDg5LDE2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uCiAJcGFuaWMoIkZhaWxlZCB0byBwcmUt
YWxsb2NhdGUgJXMgcGFnZXMgZm9yICVzIGFyZWFcbiIsIGx2bCwgYXJlYSk7CiB9CiAKKyNkZWZp
bmUgUEFHRV9FTkQgS0FTQU5fU0hBRE9XX1NUQVJUCisKIHZvaWQgX19pbml0IHBndGFibGVfY2Fj
aGVfaW5pdCh2b2lkKQogewogCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShWTUFMTE9DX1NU
QVJULCBWTUFMTE9DX0VORCwgInZtYWxsb2MiKTsKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfTU9E
VUxFUykpCiAJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShNT0RVTEVTX1ZBRERSLCBNT0RV
TEVTX0VORCwgImJwZi9tb2R1bGVzIik7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX01FTU9SWV9I
T1RQTFVHKSkgeworCQlwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoVk1FTU1BUF9TVEFSVCwg
Vk1FTU1BUF9FTkQsICJ2bWVtbWFwIik7CisJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShQ
QUdFX09GRlNFVCwgUEFHRV9FTkQsICJkaXJlY3QgbWFwIik7CisJfQogfQogI2VuZGlmCi0tIAoy
LjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
