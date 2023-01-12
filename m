Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBD2C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptJZytdUErNBn+BwlgUNNnZp9RvF8dAzo8Oe4mULc0I=; b=Q8FPQxJpEl5Bn6
	6UH1iwVd5DBs+gFZyAwmxnFpqJctA+g1TvW40lcYmNJLrRRmXAxrmdwjZ0jKDaIROHwW7MdyaEJS8
	Wf5FlYXtqBCQFH0Te6YhSZXoAw0nl9VnPrGobQzqkSsZfUSTQdcVq5pOqFt+7kVSuyRJlMff2okTr
	DxLCtJr7grTBLxqekQlVQEr8Ny6bvaG3s/Xni9MdMVor9pDOUCRcr8cODGLpuH0Wu/EGSfQdo9Y78
	K6Jfm+Z2uyCkv9CkjJn/seIZJpOuwjx4lcqvlhGQibuM4FzYKZQkC4HQ+lMtdv1kfNsyg6Djp5Hz5
	jtwSGNFJfqgpXC0NXkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuMe-00EU74-EU; Thu, 12 Jan 2023 09:59:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuMb-00EU4y-C7
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:59:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F37F461FCC;
	Thu, 12 Jan 2023 09:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F8EC433F1;
	Thu, 12 Jan 2023 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673517552;
	bh=lEoTBcehc8n4upJA5LC+k+yiIJ7hxcNhFuHkvMT2WVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3LUoS2yPQhhieChvQkuzMhUaKk2EO8QVQJltwWKfuWZ+SkkbXA5RK5CtTE7nc0A0
	 XAzoI6vnjxVWDwoce1t5aSAEbem8n6gB5HeQ+VO816eSfconfnXfEY1hVTUlV5Asgx
	 VHC/dX3bPnFeD1WbtW5SgPoV+r70IrO8Xrs4pebhxhjtza71Nn9rX7pzqk/sGX0zBD
	 79RK7mOHm1yj17Vc5rYmwuRdmpxLsNjMI+hKQF56Pwrp/+NdaXyhhyMwV7jIkWpayj
	 TF+UTsn4KxSqTRumiZ6F6ildmH/UVGa76/tA4cpcRotzezxXnQHv30hYFOQagyMlBq
	 3KR5+v3ZjdmGA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH -next V14 1/7] compiler_types.h: Add __noinstr_section() for noinstr
Date: Thu, 12 Jan 2023 04:58:42 -0500
Message-Id: <20230112095848.1464404-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230112095848.1464404-1-guoren@kernel.org>
References: <20230112095848.1464404-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_015913_582428_ECCADDFD 
X-CRM114-Status: GOOD (  12.33  )
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

RnJvbTogTGFpIEppYW5nc2hhbiA8bGFpanNAbGludXguYWxpYmFiYS5jb20+CgpVc2luZyBfX25v
aW5zdHJfc2VjdGlvbigpIGRvZXNuJ3QgYXV0b21hdGljYWxseSBkaXNhYmxlIGFsbAppbnN0cnVt
ZW50YXRpb25zIG9uIHRoZSBzZWN0aW9uLiBJbmhpYml0aW9uIGZvciBzb21lCmluc3RydW1lbnRh
dGlvbnMgcmVxdWlyZXMgZXh0cmEgY29kZS4gSS5FLiBLUFJPQkVTIGV4cGxpY2l0bHkKYXZvaWRz
IGluc3RydW1lbnRpbmcgb24gLm5vaW5zdHIudGV4dC4KCkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT4KUmV2aWV3ZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4K
UmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpTdWdnZXN0ZWQtYnk6IE5pY2sg
RGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgpTdWdnZXN0ZWQtYnk6IFBldGVy
IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5n
IDxqc3poYW5nQGtlcm5lbC5vcmc+ClRlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+ClNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpTaWduZWQtb2Zm
LWJ5OiBMYWkgSmlhbmdzaGFuIDxsYWlqc0BsaW51eC5hbGliYWJhLmNvbT4KLS0tCiBpbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX3R5cGVzLmggfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaCBiL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMu
aAppbmRleCA3YzFhZmUwZjQxMjkuLjBhMmNhNTc1NWJlNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9jb21waWxlcl90eXBlcy5oCisrKyBiL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMu
aApAQCAtMjMxLDEyICsyMzEsMTkgQEAgc3RydWN0IGZ0cmFjZV9saWtlbHlfZGF0YSB7CiAjZGVm
aW5lIF9fbm9fc2FuaXRpemVfb3JfaW5saW5lIF9fYWx3YXlzX2lubGluZQogI2VuZGlmCiAKLS8q
IFNlY3Rpb24gZm9yIGNvZGUgd2hpY2ggY2FuJ3QgYmUgaW5zdHJ1bWVudGVkIGF0IGFsbCAqLwot
I2RlZmluZSBub2luc3RyCQkJCQkJCQlcCi0Jbm9pbmxpbmUgbm90cmFjZSBfX2F0dHJpYnV0ZSgo
X19zZWN0aW9uX18oIi5ub2luc3RyLnRleHQiKSkpCVwKLQlfX25vX2tjc2FuIF9fbm9fc2FuaXRp
emVfYWRkcmVzcyBfX25vX3Byb2ZpbGUgX19ub19zYW5pdGl6ZV9jb3ZlcmFnZSBcCisvKgorICog
VXNpbmcgX19ub2luc3RyX3NlY3Rpb24oKSBkb2Vzbid0IGF1dG9tYXRpY2FsbHkgZGlzYWJsZSBh
bGwgaW5zdHJ1bWVudGF0aW9ucworICogb24gdGhlIHNlY3Rpb24uICBJbmhpYml0aW9uIGZvciBz
b21lIGluc3RydW1lbnRhdGlvbnMgcmVxdWlyZXMgZXh0cmEgY29kZS4KKyAqIEkuRS4gS1BST0JF
UyBleHBsaWNpdGx5IGF2b2lkcyBpbnN0cnVtZW50aW5nIG9uIC5ub2luc3RyLnRleHQuCisgKi8K
KyNkZWZpbmUgX19ub2luc3RyX3NlY3Rpb24oc2VjdGlvbikJCQkJXAorCW5vaW5saW5lIG5vdHJh
Y2UgX19zZWN0aW9uKHNlY3Rpb24pIF9fbm9fcHJvZmlsZQlcCisJX19ub19rY3NhbiBfX25vX3Nh
bml0aXplX2FkZHJlc3MgX19ub19zYW5pdGl6ZV9jb3ZlcmFnZQlcCiAJX19ub19zYW5pdGl6ZV9t
ZW1vcnkKIAorLyogU2VjdGlvbiBmb3IgY29kZSB3aGljaCBjYW4ndCBiZSBpbnN0cnVtZW50ZWQg
YXQgYWxsICovCisjZGVmaW5lIG5vaW5zdHIgX19ub2luc3RyX3NlY3Rpb24oIi5ub2luc3RyLnRl
eHQiKQorCiAjZW5kaWYgLyogX19LRVJORUxfXyAqLwogCiAjZW5kaWYgLyogX19BU1NFTUJMWV9f
ICovCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
