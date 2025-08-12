Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E4CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mzrm4YUU0qzhyY0qL+K7EJha3VCOKloiV+i+yq4Slwc=; b=vV8UerPh+s23WZ
	xvxyl5Ptt0s3R9wZBwyG9upHi6fUdvqEB65SpD+g7fxL/Wg4KoFqtD49wx295hSniOGKSc0Pf5zGJ
	OEugWdIuvemmC2AvcrQnOl5SlwGIls1I1ilvn9eyWhTDmkz9b9TgMuVPCZsyHSuxGqhGwByUHwLPL
	F0xT2Qgf/oG4eGZeFBjjsbBzrdfhozF+5eb/1SJc2eZnVuxZWFJJQhMhYTPx+t4N5zB2mAeP2eGsj
	ko0kzcJwXdlrps0rGCXKWvCHwU96PmRGV1twKlkfNA5U6zfDyAreysm80NrdQhZE1SbjoGWRqooLB
	VKWFCITNs+Aijnx/NK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulilc-0000000A3FI-2g2N;
	Tue, 12 Aug 2025 06:45:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoI-00000009ui6-2iqT;
	Tue, 12 Aug 2025 05:44:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NxCSEvj2PqT9z+zh43cxWZPZy/pc7lSYDl/HSYdpX0=;
	b=OzPn4l9bPnlKixJ4UTB4AhAiLkjej71xwPtqSacSd+DsXZttorULyXy0fBr+6XMEYsbpyX
	pktj9XCWQ8ee9sbQ7TYV8xKn9kXKt4m2MmDnVX9oK64iccISEQVpCVAjKsf5kfo2Y4wKUi
	D/gtoJVpdPcUWflVbX6Hs6iChwze2AWD5Nd6p9SmoIAq7Qmyf8+MGJgz+NTXtkznsfMX+o
	j3OCtHeIk3g8dw8i98Qx5qdXUibd3WkJPpTCzYYDMYJG02MGifnkCYLytDJNMiDCMFGFIu
	8/+eeYubofn5+rAsSCT5GEPgNyX67Wj5B38v0AvV+ZRmEt8rhZK2/TA3OnjrCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NxCSEvj2PqT9z+zh43cxWZPZy/pc7lSYDl/HSYdpX0=;
	b=pafKDyE9bffqSWjpfAcol5Guig2fgcH1bW+oS2Qi1sEvJ6rykUviC/BNs2xCa8jswWQoAY
	SQ7jPA+bZKqPUaBg==
Date: Tue, 12 Aug 2025 07:44:16 +0200
Subject: [PATCH v4 03/24] ARM: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-3-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3153;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jOcL1seJLYtGvYImS8V7KrNCGiyauUm9m0luaNV+25o=;
 b=2ZpJfDEg6FCwuTFwU3Nv++0bd6D+4hY16G/VIAHUE+ed4/E2i08I8MElZpFB/ZPj/iol+ibfT
 +7b+Uoz0sN9CIxjr9xcNzEwxHV7UcmSg7w4o2Gs4g4sQ4acRe/ztk9b
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224434_978085_9B05117A 
X-CRM114-Status: GOOD (  12.56  )
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
IDlmMjFlMTcwMzIwZmM1N2YxZGMyMWEzM2Q2MzdiY2ZkM2QxZDM5MTcuLmVjMmQ0MTZiYWE5Zjdl
ZjRiODYwYzRhMThiMmUyYmYyZjA1ZTRhOWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2VsZi5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2VsZi5oCkBAIC00NywzMCArNDcs
NiBAQCB0eXBlZGVmIHN0cnVjdCB1c2VyX2ZwIGVsZl9mcHJlZ3NldF90OwogI2RlZmluZSBFRl9B
Uk1fSEFTRU5UUlkJCTB4MDAwMDAwMDIJLyogQWxsICovCiAjZGVmaW5lIEVGX0FSTV9SRUxFWEVD
CQkweDAwMDAwMDAxCS8qIEFsbCAqLwogCi0jZGVmaW5lIFJfQVJNX05PTkUJCTAKLSNkZWZpbmUg
Ul9BUk1fUEMyNAkJMQotI2RlZmluZSBSX0FSTV9BQlMzMgkJMgotI2RlZmluZSBSX0FSTV9SRUwz
MgkJMwotI2RlZmluZSBSX0FSTV9DQUxMCQkyOAotI2RlZmluZSBSX0FSTV9KVU1QMjQJCTI5Ci0j
ZGVmaW5lIFJfQVJNX1RBUkdFVDEJCTM4Ci0jZGVmaW5lIFJfQVJNX1Y0QlgJCTQwCi0jZGVmaW5l
IFJfQVJNX1BSRUwzMQkJNDIKLSNkZWZpbmUgUl9BUk1fTU9WV19BQlNfTkMJNDMKLSNkZWZpbmUg
Ul9BUk1fTU9WVF9BQlMJCTQ0Ci0jZGVmaW5lIFJfQVJNX01PVldfUFJFTF9OQwk0NQotI2RlZmlu
ZSBSX0FSTV9NT1ZUX1BSRUwJCTQ2Ci0jZGVmaW5lIFJfQVJNX0FMVV9QQ19HMF9OQwk1NwotI2Rl
ZmluZSBSX0FSTV9BTFVfUENfRzFfTkMJNTkKLSNkZWZpbmUgUl9BUk1fTERSX1BDX0cyCQk2Mwot
Ci0jZGVmaW5lIFJfQVJNX1RITV9DQUxMCQkxMAotI2RlZmluZSBSX0FSTV9USE1fSlVNUDI0CTMw
Ci0jZGVmaW5lIFJfQVJNX1RITV9NT1ZXX0FCU19OQwk0NwotI2RlZmluZSBSX0FSTV9USE1fTU9W
VF9BQlMJNDgKLSNkZWZpbmUgUl9BUk1fVEhNX01PVldfUFJFTF9OQwk0OQotI2RlZmluZSBSX0FS
TV9USE1fTU9WVF9QUkVMCTUwCi0KIC8qCiAgKiBUaGVzZSBhcmUgdXNlZCB0byBzZXQgcGFyYW1l
dGVycyBpbiB0aGUgY29yZSBkdW1wcy4KICAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9lbGYuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmgKaW5kZXggM2Y5M2Y0
ZWVmOTUzMGE3YjViYzk2NmJmNGExNmQ4MzA5M2EwMTZlZS4uOGVmY2ZlN2VmZTBjNzBjNTliOWI4
MWY5M2FjOWMxNDQyYmM3NjU2YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9l
bGYuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oCkBAIC0xOCw3ICsxOCw2IEBA
CiAgKi8KIAogLyogTWlzY2VsbGFuZW91cy4gKi8KLSNkZWZpbmUgUl9BUk1fTk9ORQkJCTAKICNk
ZWZpbmUgUl9BQVJDSDY0X05PTkUJCQkyNTYKIAogLyogRGF0YS4gKi8KZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5k
ZXggNDVhMTYwZWNmNDA1NzBmM2FjOTE2MzQ0YmUzNjNkN2U3NDkwOGVhNi4uMDAxODg0NjQxZTc3
MDMxNDZmOTFlMmRkOTZmYjVhMmJiZmM3YTMyNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi1yLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKQEAgLTM2LDQgKzM2
LDI5IEBACiAjZGVmaW5lIFJfWDg2XzY0X1BDOAkJMTUJLyogOCBiaXQgc2lnbiBleHRlbmRlZCBw
YyByZWxhdGl2ZSAqLwogI2RlZmluZSBSX1g4Nl82NF9QQzY0CQkyNAkvKiBQbGFjZSByZWxhdGl2
ZSA2NC1iaXQgc2lnbmVkICovCiAKKy8qIGFybSByZWxvY2F0aW9uIHR5cGVzICovCisjZGVmaW5l
IFJfQVJNX05PTkUJCTAKKyNkZWZpbmUgUl9BUk1fUEMyNAkJMQorI2RlZmluZSBSX0FSTV9BQlMz
MgkJMgorI2RlZmluZSBSX0FSTV9SRUwzMgkJMworI2RlZmluZSBSX0FSTV9DQUxMCQkyOAorI2Rl
ZmluZSBSX0FSTV9KVU1QMjQJCTI5CisjZGVmaW5lIFJfQVJNX1RBUkdFVDEJCTM4CisjZGVmaW5l
IFJfQVJNX1Y0QlgJCTQwCisjZGVmaW5lIFJfQVJNX1BSRUwzMQkJNDIKKyNkZWZpbmUgUl9BUk1f
TU9WV19BQlNfTkMJNDMKKyNkZWZpbmUgUl9BUk1fTU9WVF9BQlMJCTQ0CisjZGVmaW5lIFJfQVJN
X01PVldfUFJFTF9OQwk0NQorI2RlZmluZSBSX0FSTV9NT1ZUX1BSRUwJCTQ2CisjZGVmaW5lIFJf
QVJNX0FMVV9QQ19HMF9OQwk1NworI2RlZmluZSBSX0FSTV9BTFVfUENfRzFfTkMJNTkKKyNkZWZp
bmUgUl9BUk1fTERSX1BDX0cyCQk2MworCisjZGVmaW5lIFJfQVJNX1RITV9DQUxMCQkxMAorI2Rl
ZmluZSBSX0FSTV9USE1fSlVNUDI0CTMwCisjZGVmaW5lIFJfQVJNX1RITV9NT1ZXX0FCU19OQwk0
NworI2RlZmluZSBSX0FSTV9USE1fTU9WVF9BQlMJNDgKKyNkZWZpbmUgUl9BUk1fVEhNX01PVldf
UFJFTF9OQwk0OQorI2RlZmluZSBSX0FSTV9USE1fTU9WVF9QUkVMCTUwCisKICNlbmRpZiAvKiBf
VUFQSV9MSU5VWF9FTEZfUl9IICovCgotLSAKMi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
