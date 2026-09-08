Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D4AC79FAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lb8V6y3j+httcU7X/yWW/J7gnPze/zYGRHk/f33zWs=; b=FUdkLSAg2YwUR+
	aWrQk1jeIP6ncdK+IiJPyPgRFySIKBGG6mhJJSZ+pqTCNZq3Kd3cGJjPM8QbXKnkIPsaqr6ANpfb8
	nsoXYfc9dIbRMOeQHrAt7Slm+rBax0j6k+qSTMayvR0q4MimULsHXyfisVdQ3F1ABE2t3ePD/8eAc
	YpYTVzhOFJEGuG/qrht4KnTGUiwHz9Sg2GG/iHMpoMeVJBDkeZwjgaDbonyqufW5BXY3OzgXKwr/Y
	tDXtR2YwoulkCYa2cxPl0Fi8MOC8UHhLkDJB/XFXFBAy6bBevsGzi+LnKljrTiU48QJL+Lz9nEKyQ
	VVxt25blSZD6ffoE5jsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPh-000000089qx-2ZNF;
	Tue, 08 Sep 2026 06:34:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP7-0000000890K-05k1;
	Tue, 08 Sep 2026 06:34:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjTX9rrwFsXVQ2q23yM95x2dyNZBtSAXhGeuKQ5L7eY=;
	b=tegE4qZLU1owA5WPV94NgVm8p3Mq8VaPjSNgdIHREOQX0Gq4XrSZl8OsvTeQR1o2O0ToqM
	Xm367SkFstd763Eo6owFZJOJOAWxkHQOODKGvEdBzYq2B2/3kIr4yjHD9sszGcSCx1SptV
	g635te+HDDk1q3DLMtLxqoOnnxvdb46zf2QSvzDnB/HCb3w5B+xo1N1QrnklDtH2DBA/vH
	h9wkKXhqYCfsLN1Qg5IIcOSb1MyIg2wE9xuBL8Ypr6IrRO7QY62HIWAyRY7FpK7V5BWIoL
	Z2JLtU1vH2fZ9+5kHdooMTILHKviv3/rHjwYnf9P/M2Jj6gxGtPxKR7+obn0gA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjTX9rrwFsXVQ2q23yM95x2dyNZBtSAXhGeuKQ5L7eY=;
	b=4mxmFhK1TnLVvFb5Gy1yTMnk/5fB8HgnBZCO8URerY3D/Q/wTzne2uXK0IjtSF7q4DaUDA
	DdO8rhE6PBNDdBAw==
Date: Tue, 08 Sep 2026 08:33:49 +0200
Subject: [PATCH v5 15/24] arm64: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-15-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2617;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=fVRENHv4++0cFzLHw247YU3v29PEq48gHKwsMBM12mc=;
 b=DDwbzH/SMGlKwp0xQn0FvyrfKZTXWpkAu8j9jSc4YRcRhytEC3Z/8E0SynIo/dONb3pcsCUqF
 v5dgouxRsS1CXrQYp0Ti0evF1Q/1uFXGqIg/yNttK78bWL8R2JJA0xa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233401_434506_8A87F5C9 
X-CRM114-Status: GOOD (  11.40  )
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

VGhlIHZkc29jaGVjayB0b29sIHZhbGlkYXRlcyB0aGUgb2JqZWN0IGZpbGVzIGFuZCBmaW5hbCAu
c28gbGlicmFyeS4KSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxvY2F0
aW9ucyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCndpdGggdGhlIHZEU08gd2hpY2ggbmVlZCB0byBi
ZSB3b3JrZWQgYXJvdW5kLgoKV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KClRoZSBj
b21wYXQgdkRTTyB3aWxsIGJlIGhhbmRsZWQgYnkgdGhlIGV4aXN0aW5nIDMyLWJpdCBBUk0gY29u
ZmlndXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgMSArCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzICAgICB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvS2NvbmZpZyBiL2FyY2gvYXJtNjQvS2NvbmZpZwppbmRleCBiNWE1MWIwZWY5NDQu
LjFjYWFmNDczN2YwMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gv
YXJtNjQvS2NvbmZpZwpAQCAtMjU4LDYgKzI1OCw3IEBAIGNvbmZpZyBBUk02NAogCXNlbGVjdCBU
UkFDRV9JUlFGTEFHU19OTUlfU1VQUE9SVAogCXNlbGVjdCBIQVZFX1NPRlRJUlFfT05fT1dOX1NU
QUNLCiAJc2VsZWN0IFVTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUCisJc2VsZWN0IFZEU09fQ0hFQ0sK
IAlzZWxlY3QgVkRTT19HRVRSQU5ET00KIAlzZWxlY3QgVk1BUF9TVEFDSwogCWhlbHAKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL2FybTY0L2tlcm5l
bC92ZHNvL01ha2VmaWxlCmluZGV4IDdkZWMwNWRkMzNiNy4uOWZhYzBlNTQwOTdkIDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL3Zkc28vTWFrZWZpbGUKQEAgLTYxLDcgKzYxLDcgQEAgdGFyZ2V0cyArPSB2ZHNvLmxkcwog
Q1BQRkxBR1NfdmRzby5sZHMgKz0gLVAgLUMgLVUkKEFSQ0gpCiAKICMgTGluayBydWxlIGZvciB0
aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZpcnN0Ci0kKG9iaikvdmRzby5zby5kYmc6ICQo
b2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSBGT1JDRQorJChvYmopL3Zkc28uc28uZGJnOiAkKG9i
aikvdmRzby5sZHMgJChvYmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2No
YW5nZWQsdmRzb2xkX2FuZF92ZHNvX2NoZWNrKQogCiAjIFN0cmlwIHJ1bGUgZm9yIHRoZSAuc28g
ZmlsZQpAQCAtNzksNCArNzksNCBAQCBpbmNsdWRlL2dlbmVyYXRlZC92ZHNvLW9mZnNldHMuaDog
JChvYmopL3Zkc28uc28uZGJnIEZPUkNFCiAKICMgQWN0dWFsIGJ1aWxkIGNvbW1hbmRzCiBxdWll
dF9jbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAkQAotICAgICAgY21kX3Zkc29s
ZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRzb19jaGVjaykKKyAgICAgIGNt
ZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChjbWRfdmRzb19jaGVj
aykKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyBiL2xpYi92ZHNvL2No
ZWNrL3Zkc29jaGVjay5ycwppbmRleCBmYjg4ZWYwYmUwOWQuLmU0NWExZmJjNjgyOSAxMDA2NDQK
LS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zk
c29jaGVjay5ycwpAQCAtNTcsNiArNTcsMTggQEAgZm4gYWxsb3dlZF9yZWxvY2F0aW9uc19mb3Jf
bWFjaGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2VkUmVsb2NhdGlvbnM8J3MKICAg
ICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAgIH0KICAgICAgICAgLmludG8o
KSwKKyAgICAgICAgYmluZGluZ3M6OkVNX0FBUkNINjQgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsK
KyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRpbmdz
OjpSX0FBUkNINjRfUFJFTDY0LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRf
UFJFTDMyLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfUFJFTDE2LAorICAg
ICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfTERfUFJFTF9MTzE5LAorICAgICAgICAg
ICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfQURSX1BSRUxfTE8yMSwKKyAgICAgICAgICAgICAg
ICBiaW5kaW5nczo6Ul9BQVJDSDY0X0NBTEwyNiwKKyAgICAgICAgICAgIF0sCisgICAgICAgICAg
ICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQorICAgICAgICB9CisgICAgICAgIC5pbnRvKCksCiAgICAg
ICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
