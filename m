Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4DBC25B7B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53jtXtFZbRXcyyBHMt9A8bJsbtstVpu5aDIhwFO6RrA=; b=w3Z+N83y4W54sU
	2tMO69JyNfc2tH114LgSJe2+P8ttOYp9YhthJxbd0RJhNb5ogmjgPmvpViFInnHZFl77Xl3wlU/uz
	aU876S+I1KVGti9/x/jLmUfpvKFS7ztEeeOO8LqHNpkbSzungKbEcWtR3OvKMLObcpfLaEYQxXpA1
	QxkOvSETnNzhZHgu/2JGAilzJOzaJKsTSalvr6TL4GykfC7E8fbJGrFTrZNRoU5MpVggl+TelJ3Tv
	zR/iuWEJXtd/NVBtW9ygGkDZ07VpCp8pefvMgK7EKTAYR3HBr/LvyKECLfGlP3YMzcrN+9RTF1ysk
	FuR7g2D6olncPM8QI2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smI-0000000G7Rj-0v1o;
	Tue, 14 May 2024 14:05:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smD-0000000G7PE-3c1s
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 618796126D;
	Tue, 14 May 2024 14:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECB4C32781;
	Tue, 14 May 2024 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695509;
	bh=oxMeKBSMHMQ7nR2cm5Yl3ZY7RY3tugjaWnxRJMQRo0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYtSJeVMCifMMvCoAZTlKZARdYfjyGb+3HXKoeh+9gLb/UkaJfTd3fdRakqc0wiiH
	 xli61NfPUMpvvGx5MC2NpP4aFHaN7qIflyQLsdsGYfftEKuMMD4ZDdwSMxKUopldg2
	 epoHMB0A0f3xCqgRT8XnILBwq4c/Qcf+I9hdtDNmbMUoN6M+E4TfZeNPnRXQe7VCEi
	 mVVd21lXjUiNzuH2g3rQ4vZwbs8BiVsB38K+pOqnMbn3sV+WHj2eBwtH9deDcFJFka
	 VMVpGHW1o/zEaD/fzjuO4Rbeu3m9Kilyv7C53dWfpR7M8Aa7K8gCfy9ZFkXpBtkQwB
	 u0bIh5mMUxCRg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/8] riscv: mm: Pre-allocate vmemmap/direct map PGD entries
Date: Tue, 14 May 2024 16:04:39 +0200
Message-Id: <20240514140446.538622-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070510_039089_0E549E27 
X-CRM114-Status: GOOD (  13.95  )
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
bmFibGVkIGluIHRoZQprZXJuZWwgY29uZmlndXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2thc2FuLmggfCA0ICsrLS0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8IDcgKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rYXNhbi5oCmluZGV4IDBiODVlMzYzZTc3OC4uZTZhMDA3MWJkYjU2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmgKKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rYXNhbi5oCkBAIC02LDggKzYsNiBAQAogCiAjaWZuZGVmIF9fQVNTRU1CTFlf
XwogCi0jaWZkZWYgQ09ORklHX0tBU0FOCi0KIC8qCiAgKiBUaGUgZm9sbG93aW5nIGNvbW1lbnQg
d2FzIGNvcGllZCBmcm9tIGFybTY0OgogICogS0FTQU5fU0hBRE9XX1NUQVJUOiBiZWdpbm5pbmcg
b2YgdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Nlcy4KQEAgLTM0LDYgKzMyLDggQEAKICAqLwog
I2RlZmluZSBLQVNBTl9TSEFET1dfU1RBUlQJKChLQVNBTl9TSEFET1dfRU5EIC0gS0FTQU5fU0hB
RE9XX1NJWkUpICYgUEdESVJfTUFTSykKICNkZWZpbmUgS0FTQU5fU0hBRE9XX0VORAlNT0RVTEVT
X0xPV0VTVF9WQUREUgorCisjaWZkZWYgQ09ORklHX0tBU0FOCiAjZGVmaW5lIEtBU0FOX1NIQURP
V19PRkZTRVQJX0FDKENPTkZJR19LQVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKIAogdm9pZCBrYXNh
bl9pbml0KHZvaWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwppbmRleCAyNTc0ZjZhM2IwZTcuLjViOGNkZmFmYjUyYSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTI3
LDYgKzI3LDcgQEAKIAogI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vaW8u
aD4KKyNpbmNsdWRlIDxhc20va2FzYW4uaD4KICNpbmNsdWRlIDxhc20vbnVtYS5oPgogI2luY2x1
ZGUgPGFzbS9wZ3RhYmxlLmg+CiAjaW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+CkBAIC0xNDg4LDEw
ICsxNDg5LDE2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFu
Z2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uCiAJcGFuaWMoIkZhaWxlZCB0byBw
cmUtYWxsb2NhdGUgJXMgcGFnZXMgZm9yICVzIGFyZWFcbiIsIGx2bCwgYXJlYSk7CiB9CiAKKyNk
ZWZpbmUgUEFHRV9FTkQgS0FTQU5fU0hBRE9XX1NUQVJUCisKIHZvaWQgX19pbml0IHBndGFibGVf
Y2FjaGVfaW5pdCh2b2lkKQogewogCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShWTUFMTE9D
X1NUQVJULCBWTUFMTE9DX0VORCwgInZtYWxsb2MiKTsKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdf
TU9EVUxFUykpCiAJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShNT0RVTEVTX1ZBRERSLCBN
T0RVTEVTX0VORCwgImJwZi9tb2R1bGVzIik7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX01FTU9S
WV9IT1RQTFVHKSkgeworCQlwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoVk1FTU1BUF9TVEFS
VCwgVk1FTU1BUF9FTkQsICJ2bWVtbWFwIik7CisJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5n
ZShQQUdFX09GRlNFVCwgUEFHRV9FTkQsICJkaXJlY3QgbWFwIik7CisJfQogfQogI2VuZGlmCi0t
IAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
