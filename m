Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7273C79FAC
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/19cM11Xo7L/Aj8j2+Oyrs4tEIsBOCMgf6hfh3HYKPQ=; b=l4/MtVeWqFwXj9
	oy87miJP25qKU8STAC9AuC1iXTQFrtlbSJgyrmn/XZNTSpTEx1DDgQd1Ct1DjTaTTtkXbwNw3UK5r
	EyDN1gn4bIq8izNgsmCLFKdlWM4w48syD2wmwfyBRvmOKbyiU4ARuBA0rOS7Yr+Hp64I8yn2qqMjD
	0t/XNLoXWbRHZ8blwz8oRIPyVzqOOdwgv5dn1nMp8FMe7bsx1UV2a44f+/xS6sAfDknoG56ay22ER
	F+pYbjbvd3a9fVMhac4rAVan+494WGdvsCfNNT7Myld4rP1jAukA+dN6Xkw0dNJk8bsueFhnX2QHw
	7QLkB17zWrMGFFt8lCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP3-000000088xG-0hDf;
	Tue, 08 Sep 2026 06:33:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOy-000000088sx-21Nz;
	Tue, 08 Sep 2026 06:33:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSPxSNVdJ9KATz6nm8e6AFtICD0FAYsIE0eIna7Agxk=;
	b=XLygM0BDhDyMcEc7+LvxjROHXez8wUnOKjCkYoGOkZ71vrK2CvV3g7A6PnFMd/7RPpu2X+
	pNDzMz+ljiv746G59hnUDGb4KbkCEYM77DK5DR+HUpjivjR0GPAsrblt/1wggCSHMIjQB3
	Je/I0Xr4Sz2mh/eKJHhbsXHXJIxMnR7MOahsvncLHYmqt4W8/PJHO5gm2oR0E2MsaRqRjZ
	HahnzTplivB++1tzgnmMptXhzYC6Tz2TGAvTo3iztkbp46kPWLkgBMUvE4YFQqXKwezoDG
	114klfBAJgZokiASj7vErQNQ/939SoNDdWvLlRASuP6OpCdcI9TCVmIarn15AQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSPxSNVdJ9KATz6nm8e6AFtICD0FAYsIE0eIna7Agxk=;
	b=tE8ZkJO/4GB5Zgn4Tw4miHDMKei5Wp3KHv2lcXSfX6CnJgXa1zTm4SuH76YUsIIXDDZoT6
	Yx+G/OLJMVOe48Bw==
Date: Tue, 08 Sep 2026 08:33:37 +0200
Subject: [PATCH v5 03/24] ARM: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-3-3a93791af1cf@linutronix.de>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, 
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2985;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HxdX8M08dw8dxZbEyC58Tr3vPz+rTbatZUZFgGPo5N4=;
 b=0VdXYSl3gC5PkjWgIegQbm9VVbaiF2T/bXo5db/PU6uM9xe8FhYNs6VkO+iEYNb87F/N6QwN9
 +tR4YHOI9+EAQ/8aaaF3l3022LJ8aC3ngY4qAkmLfpFJ6Ei8JBHO0IO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233352_664490_201480C5 
X-CRM114-Status: GOOD (  12.09  )
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

VGhlc2UgY29uc3RhbnRzIGFyZSB1c2VmdWwgZm9yIGNyb3NzLXBsYXRmb3JtIHVzZXJzcGFjZSwg
Zm9yIGV4YW1wbGUgdG8KcHJvY2VzcyBFTEYgZmlsZXMgZHVyaW5nIGtlcm5lbCBjcm9zcy1jb21w
aWxhdGlvbi4KCk1vdmUgdGhlbSBmcm9tIHRoZSBrZXJuZWwtcHJpdmF0ZSBhcmNoaXRlY3R1cmUt
c3BlY2lmaWMgaGVhZGVyIHRvIHRoZSBVQVBJLgoKT25lIGFybTY0IGhlYWRlciBpcyBhbHNvIGNo
YW5nZWQgYXMgaXQgZHVwbGljYXRlcyBhbiBhcm0gZGVmaW5pdGlvbi4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvYXJtL2luY2x1ZGUvYXNtL2VsZi5oICAgfCAyNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmggfCAgMSAtCiBpbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLXIuaCAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9pbmNsdWRlL2FzbS9lbGYuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4
IDlmMjFlMTcwMzIwZi4uZWMyZDQxNmJhYTlmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRl
L2FzbS9lbGYuaAorKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9lbGYuaApAQCAtNDcsMzAgKzQ3
LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgdXNlcl9mcCBlbGZfZnByZWdzZXRfdDsKICNkZWZpbmUgRUZf
QVJNX0hBU0VOVFJZCQkweDAwMDAwMDAyCS8qIEFsbCAqLwogI2RlZmluZSBFRl9BUk1fUkVMRVhF
QwkJMHgwMDAwMDAwMQkvKiBBbGwgKi8KIAotI2RlZmluZSBSX0FSTV9OT05FCQkwCi0jZGVmaW5l
IFJfQVJNX1BDMjQJCTEKLSNkZWZpbmUgUl9BUk1fQUJTMzIJCTIKLSNkZWZpbmUgUl9BUk1fUkVM
MzIJCTMKLSNkZWZpbmUgUl9BUk1fQ0FMTAkJMjgKLSNkZWZpbmUgUl9BUk1fSlVNUDI0CQkyOQot
I2RlZmluZSBSX0FSTV9UQVJHRVQxCQkzOAotI2RlZmluZSBSX0FSTV9WNEJYCQk0MAotI2RlZmlu
ZSBSX0FSTV9QUkVMMzEJCTQyCi0jZGVmaW5lIFJfQVJNX01PVldfQUJTX05DCTQzCi0jZGVmaW5l
IFJfQVJNX01PVlRfQUJTCQk0NAotI2RlZmluZSBSX0FSTV9NT1ZXX1BSRUxfTkMJNDUKLSNkZWZp
bmUgUl9BUk1fTU9WVF9QUkVMCQk0NgotI2RlZmluZSBSX0FSTV9BTFVfUENfRzBfTkMJNTcKLSNk
ZWZpbmUgUl9BUk1fQUxVX1BDX0cxX05DCTU5Ci0jZGVmaW5lIFJfQVJNX0xEUl9QQ19HMgkJNjMK
LQotI2RlZmluZSBSX0FSTV9USE1fQ0FMTAkJMTAKLSNkZWZpbmUgUl9BUk1fVEhNX0pVTVAyNAkz
MAotI2RlZmluZSBSX0FSTV9USE1fTU9WV19BQlNfTkMJNDcKLSNkZWZpbmUgUl9BUk1fVEhNX01P
VlRfQUJTCTQ4Ci0jZGVmaW5lIFJfQVJNX1RITV9NT1ZXX1BSRUxfTkMJNDkKLSNkZWZpbmUgUl9B
Uk1fVEhNX01PVlRfUFJFTAk1MAotCiAvKgogICogVGhlc2UgYXJlIHVzZWQgdG8gc2V0IHBhcmFt
ZXRlcnMgaW4gdGhlIGNvcmUgZHVtcHMuCiAgKi8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZWxmLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4IGQyNzc5
ZDYwNGM3Yi4uY2ZkZjRjNWFjMDhiIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2VsZi5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmgKQEAgLTE4LDcgKzE4LDYg
QEAKICAqLwogCiAvKiBNaXNjZWxsYW5lb3VzLiAqLwotI2RlZmluZSBSX0FSTV9OT05FCQkJMAog
I2RlZmluZSBSX0FBUkNINjRfTk9ORQkJCTI1NgogCiAvKiBEYXRhLiAqLwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaApp
bmRleCA0NWExNjBlY2Y0MDUuLjAwMTg4NDY0MWU3NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L2VsZi1yLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKQEAgLTM2LDQg
KzM2LDI5IEBACiAjZGVmaW5lIFJfWDg2XzY0X1BDOAkJMTUJLyogOCBiaXQgc2lnbiBleHRlbmRl
ZCBwYyByZWxhdGl2ZSAqLwogI2RlZmluZSBSX1g4Nl82NF9QQzY0CQkyNAkvKiBQbGFjZSByZWxh
dGl2ZSA2NC1iaXQgc2lnbmVkICovCiAKKy8qIGFybSByZWxvY2F0aW9uIHR5cGVzICovCisjZGVm
aW5lIFJfQVJNX05PTkUJCTAKKyNkZWZpbmUgUl9BUk1fUEMyNAkJMQorI2RlZmluZSBSX0FSTV9B
QlMzMgkJMgorI2RlZmluZSBSX0FSTV9SRUwzMgkJMworI2RlZmluZSBSX0FSTV9DQUxMCQkyOAor
I2RlZmluZSBSX0FSTV9KVU1QMjQJCTI5CisjZGVmaW5lIFJfQVJNX1RBUkdFVDEJCTM4CisjZGVm
aW5lIFJfQVJNX1Y0QlgJCTQwCisjZGVmaW5lIFJfQVJNX1BSRUwzMQkJNDIKKyNkZWZpbmUgUl9B
Uk1fTU9WV19BQlNfTkMJNDMKKyNkZWZpbmUgUl9BUk1fTU9WVF9BQlMJCTQ0CisjZGVmaW5lIFJf
QVJNX01PVldfUFJFTF9OQwk0NQorI2RlZmluZSBSX0FSTV9NT1ZUX1BSRUwJCTQ2CisjZGVmaW5l
IFJfQVJNX0FMVV9QQ19HMF9OQwk1NworI2RlZmluZSBSX0FSTV9BTFVfUENfRzFfTkMJNTkKKyNk
ZWZpbmUgUl9BUk1fTERSX1BDX0cyCQk2MworCisjZGVmaW5lIFJfQVJNX1RITV9DQUxMCQkxMAor
I2RlZmluZSBSX0FSTV9USE1fSlVNUDI0CTMwCisjZGVmaW5lIFJfQVJNX1RITV9NT1ZXX0FCU19O
Qwk0NworI2RlZmluZSBSX0FSTV9USE1fTU9WVF9BQlMJNDgKKyNkZWZpbmUgUl9BUk1fVEhNX01P
VldfUFJFTF9OQwk0OQorI2RlZmluZSBSX0FSTV9USE1fTU9WVF9QUkVMCTUwCisKICNlbmRpZiAv
KiBfVUFQSV9MSU5VWF9FTEZfUl9IICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
