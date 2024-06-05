Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD81C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZVUe3iM7d6+WZBolyfHdCRUp7hOCdkR0tZyUr9+w/8=; b=U2eHvFv1MXSL+s
	a0KQYH0vJQO5bu1SopKMBcvm+ooVWKDeToVntLQPqr7nVuRn6Dihz7+YE4qAZAMeSJVwLXLPORbpn
	OmUQQI9E/7qUIbLQUAviBfdVSIy5TWETZXDJx96zww/pfC9djTxq0KqfNh4v6+mikkr8nL6/br9uu
	vXEEvpSoZMUGFr1Y97hik00WRKaTl2XmnIq7OsFUVXWO2hZGSt5/1xV3EOMRatSvUPINSPPL2n/6a
	t4L5pBOqCa/u7a7KMAIkQuB4VjTYQ4v+b5YZgBhuqKd79gGB7nq6YDktUJmYhGqPmhx5xOxe/k9Ub
	yzBQQ0xPGEz37ACeWynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1G-00000005js3-0Wvg;
	Wed, 05 Jun 2024 11:41:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1C-00000005jpx-2AE3
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83D64CE1784;
	Wed,  5 Jun 2024 11:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A38C32781;
	Wed,  5 Jun 2024 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587683;
	bh=HsHTP5EMBxXRbP7gHM9U5cuEmdv/0OsepSBXxmcR9vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HATjXYkuNGAJd6ZLv+T2v73tr+Mc6k2jRhJItwlkYIAMhhwWJcS9UAkccUyjIGocm
	 FpT5Qk21uUbdooqRUAgy0kZUw+P/J0vSaZ/BBxDRdx4Ux/+hf7kGQ9N5Qrv6wvPA7i
	 nDivxB55BW0xjUIvNRnHMGR086mp0iiVgd/1dXwNc6PCovq009SjJTw4oRIZcmWQYR
	 jCrbPH4Os670nJF5DH11/jvO5GP+uTC5v335/W5W7nBd01MhUwdEyweJtBVvSA7sad
	 ALF4qUwr8X3xtfo2/HtKrJcfrhAbSKFg21UaNds30Hdi0KwftR7UHoI+cd51TBVay7
	 nivI6FKPDR+hA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 02/11] riscv: mm: Pre-allocate vmemmap/direct map/kasan PGD entries
Date: Wed,  5 Jun 2024 13:40:45 +0200
Message-ID: <20240605114100.315918-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044127_087095_638DC809 
X-CRM114-Status: GOOD (  14.00  )
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
cC9kaXJlY3QgbWFwL2thc2FuIGVudHJpZXMgYXQgdGhlIFBHRCBsZXZlbC4gVGhpcyB3aWxsIHJv
dWdobHkKd2FzdGUgfjEyOCAocGx1cyAzMiBpZiBLQVNBTiBpcyBlbmFibGVkKSB3b3J0aCBvZiA0
SyBwYWdlcyB3aGVuIG1lbW9yeQpob3RwbHVnZ2luZyBpcyBlbmFibGVkIGluIHRoZSBrZXJuZWwg
Y29uZmlndXJhdGlvbi4KClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmggfCA0ICsrLS0KIGFyY2gv
cmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rYXNhbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oCmlu
ZGV4IDBiODVlMzYzZTc3OC4uZTZhMDA3MWJkYjU2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2thc2FuLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oCkBA
IC02LDggKzYsNiBAQAogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCi0jaWZkZWYgQ09ORklHX0tB
U0FOCi0KIC8qCiAgKiBUaGUgZm9sbG93aW5nIGNvbW1lbnQgd2FzIGNvcGllZCBmcm9tIGFybTY0
OgogICogS0FTQU5fU0hBRE9XX1NUQVJUOiBiZWdpbm5pbmcgb2YgdGhlIGtlcm5lbCB2aXJ0dWFs
IGFkZHJlc3Nlcy4KQEAgLTM0LDYgKzMyLDggQEAKICAqLwogI2RlZmluZSBLQVNBTl9TSEFET1df
U1RBUlQJKChLQVNBTl9TSEFET1dfRU5EIC0gS0FTQU5fU0hBRE9XX1NJWkUpICYgUEdESVJfTUFT
SykKICNkZWZpbmUgS0FTQU5fU0hBRE9XX0VORAlNT0RVTEVTX0xPV0VTVF9WQUREUgorCisjaWZk
ZWYgQ09ORklHX0tBU0FOCiAjZGVmaW5lIEtBU0FOX1NIQURPV19PRkZTRVQJX0FDKENPTkZJR19L
QVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKIAogdm9pZCBrYXNhbl9pbml0KHZvaWQpOwpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRleCBm
ZTUwNzJmNjZjOGMuLmE1YjNiYzFmM2I4OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTI4LDYgKzI4LDcgQEAKIAogI2luY2x1
ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vaW8uaD4KKyNpbmNsdWRlIDxhc20va2Fz
YW4uaD4KICNpbmNsdWRlIDxhc20vbnVtYS5oPgogI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+CiAj
aW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+CkBAIC0xNDkzLDExICsxNDk0LDE5IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uCiAJcGFuaWMoIkZhaWxlZCB0byBwcmUtYWxsb2NhdGUgJXMgcGFnZXMg
Zm9yICVzIGFyZWFcbiIsIGx2bCwgYXJlYSk7CiB9CiAKKyNkZWZpbmUgUEFHRV9FTkQgS0FTQU5f
U0hBRE9XX1NUQVJUCisKIHZvaWQgX19pbml0IHBndGFibGVfY2FjaGVfaW5pdCh2b2lkKQogewog
CXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShWTUFMTE9DX1NUQVJULCBWTUFMTE9DX0VORCwg
InZtYWxsb2MiKTsKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfTU9EVUxFUykpCiAJCXByZWFsbG9j
YXRlX3BnZF9wYWdlc19yYW5nZShNT0RVTEVTX1ZBRERSLCBNT0RVTEVTX0VORCwgImJwZi9tb2R1
bGVzIik7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX01FTU9SWV9IT1RQTFVHKSkgeworCQlwcmVh
bGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoVk1FTU1BUF9TVEFSVCwgVk1FTU1BUF9FTkQsICJ2bWVt
bWFwIik7CisJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShQQUdFX09GRlNFVCwgUEFHRV9F
TkQsICJkaXJlY3QgbWFwIik7CisJCWlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTikpCisJCQlw
cmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoS0FTQU5fU0hBRE9XX1NUQVJULCBLQVNBTl9TSEFE
T1dfRU5ELCAia2FzYW4iKTsKKwl9CiB9CiAjZW5kaWYKIAotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
