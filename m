Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB155C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 03:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TmfkZ26pu2UfeW7I/nL5w2AA7lr+Ql6sdO/a2uPBUY=; b=TnjDWV/QANtRTs
	STbjnKI664XorqqJYc3j1gOqt+Iv5WXIz8HPsWal3n3uEAI2V+lCr7efeUZQth3MjG86LcrwdBhyz
	pJiZwgwzvdm/IfX35sDWnKF9S5RyRFU5xWPN7zDdRcPgfEpzbtXiyoiOg51vz35UdmdfEhtuXwYZV
	rdeBUA/VV2mJ6yih9AY3+B19alYcEBoWrtlJAueBO7aUF/4vfqXhG1afZ2sFuE3zK8nW1k1yGWFG2
	WxDcU6R5ooauLZMwMwx+tYDd7eeeW4EsxkjhWWuGS1//1u+BpyaC7mOm0QiuiVPZv0kFD/4tZkcE0
	wqh73afYKl8yNdU3i+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfqR-00AbD9-M0; Wed, 22 Feb 2023 03:31:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfqM-00AbAA-VH
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 03:31:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98C826122A;
	Wed, 22 Feb 2023 03:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67812C4339E;
	Wed, 22 Feb 2023 03:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677036657;
	bh=YqOQcx7krUe87k6vBeiLe+HR095OSbjNEu/uluKhLMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6160hfcKH01BiNRi4e+qr/N58FoomeLjiCUX7L8MAxJK1UflNFYnO/sSQhci37UW
	 nnXKpGANVGHDCmP5YMek6z3zbRhK1sRA2En66Vp2kZITdBtdvegcFMCe+Xyczuuoye
	 sXpOHTRE7IkuB/JKtbit9njwr4iYGeOg/UH4eGdPy5k0OXm9RiaeIjgjK0+qaMszZH
	 sZVUZW4mXbHQeo3p8WkeknGAE8P4uqbT6+Hs532rkWXDm5bNEhVb60vHso+7C1KeEE
	 v+5rp6LUgjBhRHkPkDy1cRjxmg8rI37PiszFIVC/eiEAQSnQR9Gl4cKlKXxeA3Cjgm
	 BbGL2IVVhkLew==
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
	bjorn@kernel.org,
	palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V17 1/7] compiler_types.h: Add __noinstr_section() for noinstr
Date: Tue, 21 Feb 2023 22:30:15 -0500
Message-Id: <20230222033021.983168-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230222033021.983168-1-guoren@kernel.org>
References: <20230222033021.983168-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_193059_137832_B740F77E 
X-CRM114-Status: GOOD (  11.73  )
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
IGluc3RydW1lbnRpbmcgb24gLm5vaW5zdHIudGV4dC4KClN1Z2dlc3RlZC1ieTogTmljayBEZXNh
dWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+ClN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlq
bHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpSZXZpZXdlZC1ieTogTWlndWVsIE9qZWRhIDxv
amVkYUBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClRl
c3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpUZXN0ZWQtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBMYWkgSmlhbmdzaGFuIDxs
YWlqc0BsaW51eC5hbGliYWJhLmNvbT4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oIHwgMTUgKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmggYi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgKaW5kZXggN2MxYWZlMGY0MTI5Li4wYTJjYTU3NTViZTcg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgKQEAgLTIzMSwxMiArMjMxLDE5IEBAIHN0cnVjdCBmdHJh
Y2VfbGlrZWx5X2RhdGEgewogI2RlZmluZSBfX25vX3Nhbml0aXplX29yX2lubGluZSBfX2Fsd2F5
c19pbmxpbmUKICNlbmRpZgogCi0vKiBTZWN0aW9uIGZvciBjb2RlIHdoaWNoIGNhbid0IGJlIGlu
c3RydW1lbnRlZCBhdCBhbGwgKi8KLSNkZWZpbmUgbm9pbnN0cgkJCQkJCQkJXAotCW5vaW5saW5l
IG5vdHJhY2UgX19hdHRyaWJ1dGUoKF9fc2VjdGlvbl9fKCIubm9pbnN0ci50ZXh0IikpKQlcCi0J
X19ub19rY3NhbiBfX25vX3Nhbml0aXplX2FkZHJlc3MgX19ub19wcm9maWxlIF9fbm9fc2FuaXRp
emVfY292ZXJhZ2UgXAorLyoKKyAqIFVzaW5nIF9fbm9pbnN0cl9zZWN0aW9uKCkgZG9lc24ndCBh
dXRvbWF0aWNhbGx5IGRpc2FibGUgYWxsIGluc3RydW1lbnRhdGlvbnMKKyAqIG9uIHRoZSBzZWN0
aW9uLiAgSW5oaWJpdGlvbiBmb3Igc29tZSBpbnN0cnVtZW50YXRpb25zIHJlcXVpcmVzIGV4dHJh
IGNvZGUuCisgKiBJLkUuIEtQUk9CRVMgZXhwbGljaXRseSBhdm9pZHMgaW5zdHJ1bWVudGluZyBv
biAubm9pbnN0ci50ZXh0LgorICovCisjZGVmaW5lIF9fbm9pbnN0cl9zZWN0aW9uKHNlY3Rpb24p
CQkJCVwKKwlub2lubGluZSBub3RyYWNlIF9fc2VjdGlvbihzZWN0aW9uKSBfX25vX3Byb2ZpbGUJ
XAorCV9fbm9fa2NzYW4gX19ub19zYW5pdGl6ZV9hZGRyZXNzIF9fbm9fc2FuaXRpemVfY292ZXJh
Z2UJXAogCV9fbm9fc2FuaXRpemVfbWVtb3J5CiAKKy8qIFNlY3Rpb24gZm9yIGNvZGUgd2hpY2gg
Y2FuJ3QgYmUgaW5zdHJ1bWVudGVkIGF0IGFsbCAqLworI2RlZmluZSBub2luc3RyIF9fbm9pbnN0
cl9zZWN0aW9uKCIubm9pbnN0ci50ZXh0IikKKwogI2VuZGlmIC8qIF9fS0VSTkVMX18gKi8KIAog
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
