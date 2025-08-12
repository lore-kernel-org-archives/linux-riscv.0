Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66739CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5lNH70DirVW4W27quYaX1G3oNgf1x8OTvBI3b0VaQ0=; b=QtDR22/J2P3mFm
	FPkgi7ywBYARYAuXR4WeWKdBOKzVPpysQkTX8Z/aBvzf57hJT1B4Gf6BuLch1az2er7dHQPMYBjuX
	COAc1d+jgpRSAWoNWBF4ysu0YidnJAl2eAD8/nOVPlwNvLqhnVosV1Yqv3p461d0feJfhqNlRKMf9
	/4EwVDITaOJzX4+DLvdGr3Os8qof2LIsE7ZNkIZBFNsL9iMvwPa1998LJFpeSFfsPU3seJz96kRsg
	Fb8TN6iI9YSM32rVdvPwI4oszP531t0AGFIIWTEWlJgAiEmL2SLdk8ZNUf/kW5iTAsJ6NqDQV2WM8
	OB8CZxnnHfgpNIqe1nvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhpA-00000009vol-3owh;
	Tue, 12 Aug 2025 05:45:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhok-00000009vJI-3eCc;
	Tue, 12 Aug 2025 05:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8Kjpq5eR3VtQueM0L6XasJAF39E5US6j25ec6FsCv3w=; b=MMdPPE74cS9IvtT4KTJTeWkfJN
	pGLBzufff8Z2vtRs2jAoabj+sDeqqk0UvcljbmY7x6lvbud6L1rv8nc12TyenymxX+idE/XaN+F1h
	Rk5T+o/G6QdANaGxTc5G29nUuRQnHYwOcKwtMVlc68/PcZq9AlUwnxFsNQnXUf0pfbkwUYWch7thu
	X6Ju5CExTsHpmWJeuF+DRy/YugXqKXTD+IW44mvUtU8p3fY8U3ozJvtE4P2cJAO1fsjRrIrXZ2lAj
	mWgJsgDIderjvPgc0bObvDT54MaLhKJBJ174KDVmrTa1g5sztsxT9ECSpKngfIhGz9DzdXbYlb1tp
	064ltShg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoe-0000000FgDe-1OQb;
	Tue, 12 Aug 2025 05:45:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Kjpq5eR3VtQueM0L6XasJAF39E5US6j25ec6FsCv3w=;
	b=DOgN3Y5EQB5kdutA1572V0LhXOZXnmRl6p0P18a1t7ObF9ucTKlbEHkVhxaejvdIZK3PIY
	lIUNnRcEoWpe9jMcL/sz5eDD1osU0bJplewxq79IGnmKl56iuX34wGlZkE8q0QXbW8ODPS
	/tRsjn5u/aceWhclEIiQoXuf5PoMDguQZFCa+gVrW0g1vlK8gccXdEQDtujNgXNNo0KdxN
	WuCKV7zOYOnI0NnSYDP7lGE+2WUwTHGjY7UEreXmXplASXvZjXyi/1+qv/lFjFdZDmXlU/
	TSNZ1c1JACCFOcsJSoennrnbZSFvpsaVg3kBWIxDpWM65m2K7yxEzt3JfuJQug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Kjpq5eR3VtQueM0L6XasJAF39E5US6j25ec6FsCv3w=;
	b=Xp94uLfRG/UGZ4I0EOrrP3/TrL+9J/C3gXEU1nyi3fx2RRuH8xCgRiBDmDN3dECl7takoc
	IY8Vx1R01mdHNgCQ==
Date: Tue, 12 Aug 2025 07:44:35 +0200
Subject: [PATCH v4 22/24] MIPS: ELF: Add more PC-relative relocation
 definitions
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-22-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1659;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Kx23G/jdGST0tg6021hFwad6UPxIH/+IOFc6beuEorU=;
 b=9721hy+2tPJhw7rgs5OUlE+6rM6NCuWPGCnHL0GckAQKuaqMknOzzL6abxn133J0vzAnS6u6/
 H4ms/FvzKN2ALTXQO9bp4r8ji2uMhcnak2odoRO0TaHpLw+mLogGUf1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064458_693236_016DDC93 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

VGhlc2UgYXJlIHVzZWQgYnkgdXNlcnNwYWNlIGFuZCBhcmUgbmVjZXNzYXJ5IGZvciB0aGUgdmRz
b2NoZWNrIHRvb2wuCgpBbHNvIHVwZGF0ZSB0aGUgY29weSBpbiB0b29scy8gc28gdGhleSBjYW4g
YmUgdXNlZCBieSB2ZHNvY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgv
ZWxmLXIuaCAgICAgICB8IDYgKysrKysrCiB0b29scy9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIu
aCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYt
ci5oCmluZGV4IGU3NTA5ODllNDRlOGY1MTdkN2RhY2Y5ZDNhMzM4YWY3YTEzNmU0MGYuLjlmNzQ1
N2JhMWM2MzI1MmQxMGI5YWIyNTYwMTU4MWJkOTlhZjdhMjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9lbGYtci5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC02
MTYsMTAgKzYxNiwxNiBAQAogICovCiAjZGVmaW5lIFJfTUlQU19QQzIxX1MyCQk2MAogI2RlZmlu
ZSBSX01JUFNfUEMyNl9TMgkJNjEKKyNkZWZpbmUgUl9NSVBTX1BDMThfUzMJCTYyCisjZGVmaW5l
IFJfTUlQU19QQzE5X1MyCQk2MworI2RlZmluZSBSX01JUFNfUENISTE2CQk2NAorI2RlZmluZSBS
X01JUFNfUENMTzE2CQk2NQogLyoKICAqIFRoaXMgcmFuZ2UgaXMgcmVzZXJ2ZWQgZm9yIHZlbmRv
ciBzcGVjaWZpYyByZWxvY2F0aW9ucy4KICAqLwogI2RlZmluZSBSX01JUFNfTE9WRU5ET1IJCTEw
MAogI2RlZmluZSBSX01JUFNfSElWRU5ET1IJCTEyNwogCisjZGVmaW5lIFJfTUlQU19QQzMyCQky
NDgKKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VMRl9SX0ggKi8KZGlmZiAtLWdpdCBhL3Rvb2xz
L2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2Vs
Zi1yLmgKaW5kZXggZTc1MDk4OWU0NGU4ZjUxN2Q3ZGFjZjlkM2EzMzhhZjdhMTM2ZTQwZi4uOWY3
NDU3YmExYzYzMjUyZDEwYjlhYjI1NjAxNTgxYmQ5OWFmN2EyMSAxMDA2NDQKLS0tIGEvdG9vbHMv
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKKysrIGIvdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4
L2VsZi1yLmgKQEAgLTYxNiwxMCArNjE2LDE2IEBACiAgKi8KICNkZWZpbmUgUl9NSVBTX1BDMjFf
UzIJCTYwCiAjZGVmaW5lIFJfTUlQU19QQzI2X1MyCQk2MQorI2RlZmluZSBSX01JUFNfUEMxOF9T
MwkJNjIKKyNkZWZpbmUgUl9NSVBTX1BDMTlfUzIJCTYzCisjZGVmaW5lIFJfTUlQU19QQ0hJMTYJ
CTY0CisjZGVmaW5lIFJfTUlQU19QQ0xPMTYJCTY1CiAvKgogICogVGhpcyByYW5nZSBpcyByZXNl
cnZlZCBmb3IgdmVuZG9yIHNwZWNpZmljIHJlbG9jYXRpb25zLgogICovCiAjZGVmaW5lIFJfTUlQ
U19MT1ZFTkRPUgkJMTAwCiAjZGVmaW5lIFJfTUlQU19ISVZFTkRPUgkJMTI3CiAKKyNkZWZpbmUg
Ul9NSVBTX1BDMzIJCTI0OAorCiAjZW5kaWYgLyogX1VBUElfTElOVVhfRUxGX1JfSCAqLwoKLS0g
CjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
