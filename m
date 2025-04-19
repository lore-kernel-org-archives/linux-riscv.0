Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2D9C369C9
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WFnTUjVPtyCMi4ugksuHTvruBvNlQzOBRVy9xzl2+Yw=; b=SudSFHn94gZy19
	uxl3F6kAa8/6eIYwlVGoTZ3GCb/S3xXyAGiSxeOS5viTuQ9irhRgShXH604GsYVnynz8twBnyiQKv
	Z+zozvwK1BXrlngsR2t5tDIqDeEP996WKiC4TxMKeLP92l920/Mlrv6uljSb91kZ+Xb6Kb619Olfj
	+b5EfQc5jWutR1+DI8EwFwDPnQci5DXuXd1QsJPfvuUMRkKdrKxL6B7V+g0XH12s05mL4s8oDQIjN
	97oD0+1hw9P8QEnYidvyXlU8vD74a9vChZFmiat1uqoB71LdSvziA8uUfDlm14pXPj1DVWPJHFwct
	kEe+JTxFqIOK5bfCsPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u669L-00000001E2x-21sv;
	Sat, 19 Apr 2025 11:14:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u669I-00000001E2F-1iC9
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 11:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54FD7A45F9A;
	Sat, 19 Apr 2025 11:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A0BC4CEE7;
	Sat, 19 Apr 2025 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745061254;
	bh=segElHCdNM8ilr7pmILb8lXK5VF5TR88ipNEBHcLsPc=;
	h=From:To:Cc:Subject:Date:From;
	b=p9I0MntSvW1uw/BeLSdDhPqUwYf/vaDyPZqOKL059Qh5TfLQcpVcr2zt5g6fsMogc
	 XPenoURL2fS3Z9oR5E6KDASQK4Sse4ycp5B42jRvE5uoUQ4pt66oBJMHV8xaqcggm1
	 jJgz6rsV6wlwGiuyfIXrcBgFc1F2jNclGv+A6XPAho4e5x8E93gvnh7O9ww2v17m3C
	 /zwWd6fjDfemXZoX/bET96HrOSIXfKPSGNitTUoLL46Z9fiAGgFGaYbblnUTMf7emb
	 6vxwVrHy6PJwcfqSCg4UuKjPI3dEjadY+h735liz2Q3Ii0bix/0dKTAh77pnDd/tPq
	 cWqForpJxz2Ow==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH fixes v2 1/2] riscv: Replace function-like macro by static inline function
Date: Sat, 19 Apr 2025 13:13:59 +0200
Message-ID: <20250419111402.1660267-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_041416_515610_014E505C 
X-CRM114-Status: GOOD (  10.20  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIGZsdXNoX2ljYWNo
ZV9yYW5nZSgpIGZ1bmN0aW9uIGlzIGltcGxlbWVudGVkIGFzIGEgImZ1bmN0aW9uLWxpa2UKbWFj
cm8gd2l0aCB1bnVzZWQgcGFyYW1ldGVycyIsIHdoaWNoIGNhbiByZXN1bHQgaW4gInVudXNlZCB2
YXJpYWJsZXMiCndhcm5pbmdzLgoKUmVwbGFjZSB0aGUgbWFjcm8gd2l0aCBhIHN0YXRpYyBpbmxp
bmUgZnVuY3Rpb24sIGFzIGFkdmlzZWQgYnkKRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1z
dHlsZS5yc3QuCgpGaXhlczogMDhmMDUxZWRhMzNiICgiUklTQy1WOiBGbHVzaCBJJCB3aGVuIG1h
a2luZyBhIGRpcnR5IHBhZ2UgZXhlY3V0YWJsZSIpClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCB8IDE1ICsrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRl
eCA4ZGU3M2Y5MWJmYTMuLmI1OWZmZWI2NjhkNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmgKQEAgLTM0LDExICszNCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVf
cGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIAlmbHVzaF9kY2FjaGVfZm9saW8ocGFnZV9mb2xpbyhw
YWdlKSk7CiB9CiAKLS8qCi0gKiBSSVNDLVYgZG9lc24ndCBoYXZlIGFuIGluc3RydWN0aW9uIHRv
IGZsdXNoIHBhcnRzIG9mIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSwKLSAqIHNvIGluc3RlYWQgd2Ug
anVzdCBmbHVzaCB0aGUgd2hvbGUgdGhpbmcuCi0gKi8KLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3Jh
bmdlKHN0YXJ0LCBlbmQpIGZsdXNoX2ljYWNoZV9hbGwoKQogI2RlZmluZSBmbHVzaF9pY2FjaGVf
dXNlcl9wYWdlKHZtYSwgcGcsIGFkZHIsIGxlbikJXAogZG8gewkJCQkJCQlcCiAJaWYgKHZtYS0+
dm1fZmxhZ3MgJiBWTV9FWEVDKQkJCVwKQEAgLTc4LDYgKzczLDE2IEBAIHZvaWQgZmx1c2hfaWNh
Y2hlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBib29sIGxvY2FsKTsKIAogI2VuZGlmIC8qIENP
TkZJR19TTVAgKi8KIAorLyoKKyAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1Y3Rpb24g
dG8gZmx1c2ggcGFydHMgb2YgdGhlIGluc3RydWN0aW9uIGNhY2hlLAorICogc28gaW5zdGVhZCB3
ZSBqdXN0IGZsdXNoIHRoZSB3aG9sZSB0aGluZy4KKyAqLworI2RlZmluZSBmbHVzaF9pY2FjaGVf
cmFuZ2UgZmx1c2hfaWNhY2hlX3JhbmdlCitzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfaWNhY2hl
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQoreworCWZsdXNo
X2ljYWNoZV9hbGwoKTsKK30KKwogZXh0ZXJuIHVuc2lnbmVkIGludCByaXNjdl9jYm9tX2Jsb2Nr
X3NpemU7CiBleHRlcm4gdW5zaWduZWQgaW50IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsKIHZvaWQg
cmlzY3ZfaW5pdF9jYm9fYmxvY2tzaXplcyh2b2lkKTsKCmJhc2UtY29tbWl0OiA4NTYwNjk3YjIz
ZGMyZjQwNWNiNDYzYWYyYjE3MjU2YTk4ODgxMjlkCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
