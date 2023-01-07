Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6015FC54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptJZytdUErNBn+BwlgUNNnZp9RvF8dAzo8Oe4mULc0I=; b=R0l7Amnt3kAWCC
	ZfQKEApadi+t+AWYhgLCyMF6thURwQwUQ/A35EninoivXPo/UuH0SJiL3GaxsY3zvfHd8gjJiJhEc
	sUZ/7BrUcBwajMPwTjCJPkvcnZBXRr9CmstOqwy7O7wn3Bb5jWDAWPwkbtNjauc7CpUrHhr632Cl0
	GCHuOjXw3KcQCFi7kbD0WX+py4dTuiHQ2gOhED0WOHKN0Epf5b2AQ50EcaEhlaM/EybesMbIhk8jR
	1CdzeJQPVZbGm0pzH44yNQtopumjeB85HTr/yxOZF2ZlUbQqNpV+L/s3YvgdyKsN7mTfomjEUVzR6
	7sWvpkZl6EGMrb9q+Vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7XV-004ViG-9H; Sat, 07 Jan 2023 11:39:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7XQ-004Vh1-FB
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 11:39:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E4C960BDE;
	Sat,  7 Jan 2023 11:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8290CC43396;
	Sat,  7 Jan 2023 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673091539;
	bh=lEoTBcehc8n4upJA5LC+k+yiIJ7hxcNhFuHkvMT2WVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=flxC7+LyXLaW44yPqUILkPBrgh324rYKwjU49klA1Zw16+3ttA2DWDCir7CQYcIuF
	 DfS6CKLtffD91W+IawxJDHvGxVD+NikpMTDNMmV0UTGbDkNqGUgNsovlQhcHtwg7Ts
	 qrBe62DB61WjHGprTSZaGJXAbBDJ+n0yKqRajZ/ANYvNgjQTYfeSD98VZRjXPs7PyP
	 jeaHYCX5MsVrvDMf1tZdU3kxs0zTDcpN4MY8a+fA5/t/hZEuH1J0bxTOf4MzjI5O/j
	 AsGBPCp1eqFczgZJsUI9wPIqouvWN1+cy2540woKnM0tJRJjfyOSIm5SL52PHTOMfe
	 980GQQmp5gR5A==
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
Subject: [PATCH -next V13 1/7] compiler_types.h: Add __noinstr_section() for noinstr
Date: Sat,  7 Jan 2023 06:38:32 -0500
Message-Id: <20230107113838.3969149-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230107113838.3969149-1-guoren@kernel.org>
References: <20230107113838.3969149-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_033900_607320_3A3E9F06 
X-CRM114-Status: GOOD (  11.22  )
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
