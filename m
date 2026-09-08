Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA14C79FA0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk5t3pW1vOCQPeT6e40nFtAOIvrpgC+X8wx+i0iLnL0=; b=maBPQBCXDtO060
	450BLGOwVoAHVPRvaJejQp/86K+2mVgC7bnA973WoHLD78Bgv5GqL6rZ3s4gLNt8PqtznOC27Q7et
	jbkFnAVdlSeKv7KrWJwtHGfT3D8irtETe4PRGFyZ7k4JFl5oOSDeQNIYntLdaad5hzx/NLdNk1VJF
	wd+C+K3B24AtbAzT/OR+BLte15aGRzzup5KeDtM2d/4fbs4OHnN50jdErcVgYwy959NCQZINQapfC
	2AhR0kR1dPhaybuwFI6WHn93WedTwq2DbhX5lGZcJcpb2uLo4DTUIJUWav1lKn0/4kxt2KgYrxf8L
	y7c+FKHKRX6/4i/oVapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPQ-000000089Sz-3EX2;
	Tue, 08 Sep 2026 06:34:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP2-000000088vq-3ekT;
	Tue, 08 Sep 2026 06:33:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJq6yR2p7bWWswQ+1JaEFwknbMonVxi+i+XtDlX1VJE=;
	b=ahR3dXuIvmy9rLY/NaJKRHDCHK0nSGp3+7XiZcORdfSnIPwrsGHbO7bgDbz8h9Ed9Nqwm2
	aoWGwa9rBrndpnaB9nw64Kj1w1m+8AUs44vqnM7PPYmHMeeEEo406mkBUaoKh9Hj8RAfv7
	jjc7ulGhFOejma1EKD+dVfp5TS189yjYMsgnV7FxGuGah4BrD5a8ivX5lxTOo9D1pUlbi7
	A2kvwa+AUJtq/vfQPN+lxM4XcUiIBNFikfImhIdNpNaFyr/x5u2PjfCgaPu7M+xUn5eqzi
	by8lXtwRNpOWf3XzVgrg9kptObSnF4I4PxRDxSv6HilvMNkMswBwyTjPqcyvjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJq6yR2p7bWWswQ+1JaEFwknbMonVxi+i+XtDlX1VJE=;
	b=VZsZyyx6tVMPgVUY8ZTFc6uDIAMDbc5w2oz5UFAf/4aF13Vb6IF0cflWvNHI9lzRI8DjSR
	iNQZmO5z7gh/+JCw==
Date: Tue, 08 Sep 2026 08:33:43 +0200
Subject: [PATCH v5 09/24] MIPS: ELF: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-9-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=4382;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=A10H22cVXmPgY/NixL/2JhIgd7FK72hpu8GKd8hQAKo=;
 b=qKSQneyNuKEBUb6rfiRCvkfACMHprRMYmjlZw9I/e5PmwvqMoWeNI3JR4y8qsFGqgWsmxafnd
 O3IJy63bZaPB7kwaUolzd0zlzGxuCuw9umZ22crEBlrxXnL6ZfXMF3b
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233357_226343_1028D19C 
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
c3BlY2lmaWMgaGVhZGVyIHRvIHRoZSBVQVBJLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL2VsZi5oIHwgNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICB8IDU2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNl
cnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVk
ZS9hc20vZWxmLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vZWxmLmgKaW5kZXggYWFlZjBlYWE2
OGQ1Li4zNDdlMTI1ODRiZWUgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9lbGYu
aAorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vZWxmLmgKQEAgLTcwLDYxICs3MCw2IEBACiAj
ZGVmaW5lIERUX01JUFNfSElQQUdFTk8JMHg3MDAwMDAxNAogI2RlZmluZSBEVF9NSVBTX1JMRF9N
QVAJCTB4NzAwMDAwMTYKIAotI2RlZmluZSBSX01JUFNfTk9ORQkJMAotI2RlZmluZSBSX01JUFNf
MTYJCTEKLSNkZWZpbmUgUl9NSVBTXzMyCQkyCi0jZGVmaW5lIFJfTUlQU19SRUwzMgkJMwotI2Rl
ZmluZSBSX01JUFNfMjYJCTQKLSNkZWZpbmUgUl9NSVBTX0hJMTYJCTUKLSNkZWZpbmUgUl9NSVBT
X0xPMTYJCTYKLSNkZWZpbmUgUl9NSVBTX0dQUkVMMTYJCTcKLSNkZWZpbmUgUl9NSVBTX0xJVEVS
QUwJCTgKLSNkZWZpbmUgUl9NSVBTX0dPVDE2CQk5Ci0jZGVmaW5lIFJfTUlQU19QQzE2CQkxMAot
I2RlZmluZSBSX01JUFNfQ0FMTDE2CQkxMQotI2RlZmluZSBSX01JUFNfR1BSRUwzMgkJMTIKLS8q
IFRoZSByZW1haW5pbmcgcmVsb2NzIGFyZSBkZWZpbmVkIG9uIElyaXgsIGFsdGhvdWdoIHRoZXkg
YXJlIG5vdAotICAgaW4gdGhlIE1JUFMgRUxGIEFCSS4JICovCi0jZGVmaW5lIFJfTUlQU19VTlVT
RUQxCQkxMwotI2RlZmluZSBSX01JUFNfVU5VU0VEMgkJMTQKLSNkZWZpbmUgUl9NSVBTX1VOVVNF
RDMJCTE1Ci0jZGVmaW5lIFJfTUlQU19TSElGVDUJCTE2Ci0jZGVmaW5lIFJfTUlQU19TSElGVDYJ
CTE3Ci0jZGVmaW5lIFJfTUlQU182NAkJMTgKLSNkZWZpbmUgUl9NSVBTX0dPVF9ESVNQCQkxOQot
I2RlZmluZSBSX01JUFNfR09UX1BBR0UJCTIwCi0jZGVmaW5lIFJfTUlQU19HT1RfT0ZTVAkJMjEK
LS8qCi0gKiBUaGUgZm9sbG93aW5nIHR3byByZWxvY2F0aW9uIHR5cGVzIGFyZSBzcGVjaWZpZWQg
aW4gdGhlIE1JUFMgQUJJCi0gKiBjb25mb3JtYW5jZSBndWlkZSB2ZXJzaW9uIDEuMiBidXQgbm90
IHlldCBpbiB0aGUgcHNBQkkuCi0gKi8KLSNkZWZpbmUgUl9NSVBTX0dPVEhJMTYJCTIyCi0jZGVm
aW5lIFJfTUlQU19HT1RMTzE2CQkyMwotI2RlZmluZSBSX01JUFNfU1VCCQkyNAotI2RlZmluZSBS
X01JUFNfSU5TRVJUX0EJCTI1Ci0jZGVmaW5lIFJfTUlQU19JTlNFUlRfQgkJMjYKLSNkZWZpbmUg
Ul9NSVBTX0RFTEVURQkJMjcKLSNkZWZpbmUgUl9NSVBTX0hJR0hFUgkJMjgKLSNkZWZpbmUgUl9N
SVBTX0hJR0hFU1QJCTI5Ci0vKgotICogVGhlIGZvbGxvd2luZyB0d28gcmVsb2NhdGlvbiB0eXBl
cyBhcmUgc3BlY2lmaWVkIGluIHRoZSBNSVBTIEFCSQotICogY29uZm9ybWFuY2UgZ3VpZGUgdmVy
c2lvbiAxLjIgYnV0IG5vdCB5ZXQgaW4gdGhlIHBzQUJJLgotICovCi0jZGVmaW5lIFJfTUlQU19D
QUxMSEkxNgkJMzAKLSNkZWZpbmUgUl9NSVBTX0NBTExMTzE2CQkzMQotLyoKLSAqIEludHJvZHVj
ZWQgZm9yIE1JUFNyNi4KLSAqLwotI2RlZmluZSBSX01JUFNfUEMyMV9TMgkJNjAKLSNkZWZpbmUg
Ul9NSVBTX1BDMjZfUzIJCTYxCi0vKgotICogVGhpcyByYW5nZSBpcyByZXNlcnZlZCBmb3IgdmVu
ZG9yIHNwZWNpZmljIHJlbG9jYXRpb25zLgotICovCi0jZGVmaW5lIFJfTUlQU19MT1ZFTkRPUgkJ
MTAwCi0jZGVmaW5lIFJfTUlQU19ISVZFTkRPUgkJMTI3Ci0KLSNkZWZpbmUgUl9NSVBTX1BDMzIJ
CTI0OAotCiAjZGVmaW5lIFNITl9NSVBTX0FDQ09NT04JMHhmZjAwCQkvKiBBbGxvY2F0ZWQgY29t
bW9uIHN5bWJvbHMgKi8KICNkZWZpbmUgU0hOX01JUFNfVEVYVAkJMHhmZjAxCQkvKiBBbGxvY2F0
ZWQgdGVzdCBzeW1ib2xzLiAgKi8KICNkZWZpbmUgU0hOX01JUFNfREFUQQkJMHhmZjAyCQkvKiBB
bGxvY2F0ZWQgZGF0YSBzeW1ib2xzLiAgKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYtci5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5kZXggM2Q5ZTNiNTdmMWZm
Li4wYzZhODY5OGYzMDAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisr
KyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC01OTMsNCArNTkzLDYwIEBACiAvKiBL
ZWVwIHRoaXMgdGhlIGxhc3QgZW50cnkuICAqLwogI2RlZmluZSBSXzM5MF9OVU0JNjEKIAorLyog
TUlQUyByZWxvY2F0aW9ucyBkZWZpbmVkIGJ5IHRoZSBBQklzICovCisjZGVmaW5lIFJfTUlQU19O
T05FCQkwCisjZGVmaW5lIFJfTUlQU18xNgkJMQorI2RlZmluZSBSX01JUFNfMzIJCTIKKyNkZWZp
bmUgUl9NSVBTX1JFTDMyCQkzCisjZGVmaW5lIFJfTUlQU18yNgkJNAorI2RlZmluZSBSX01JUFNf
SEkxNgkJNQorI2RlZmluZSBSX01JUFNfTE8xNgkJNgorI2RlZmluZSBSX01JUFNfR1BSRUwxNgkJ
NworI2RlZmluZSBSX01JUFNfTElURVJBTAkJOAorI2RlZmluZSBSX01JUFNfR09UMTYJCTkKKyNk
ZWZpbmUgUl9NSVBTX1BDMTYJCTEwCisjZGVmaW5lIFJfTUlQU19DQUxMMTYJCTExCisjZGVmaW5l
IFJfTUlQU19HUFJFTDMyCQkxMgorLyogVGhlIHJlbWFpbmluZyByZWxvY3MgYXJlIGRlZmluZWQg
b24gSXJpeCwgYWx0aG91Z2ggdGhleSBhcmUgbm90CisgICBpbiB0aGUgTUlQUyBFTEYgQUJJLgkg
Ki8KKyNkZWZpbmUgUl9NSVBTX1VOVVNFRDEJCTEzCisjZGVmaW5lIFJfTUlQU19VTlVTRUQyCQkx
NAorI2RlZmluZSBSX01JUFNfVU5VU0VEMwkJMTUKKyNkZWZpbmUgUl9NSVBTX1NISUZUNQkJMTYK
KyNkZWZpbmUgUl9NSVBTX1NISUZUNgkJMTcKKyNkZWZpbmUgUl9NSVBTXzY0CQkxOAorI2RlZmlu
ZSBSX01JUFNfR09UX0RJU1AJCTE5CisjZGVmaW5lIFJfTUlQU19HT1RfUEFHRQkJMjAKKyNkZWZp
bmUgUl9NSVBTX0dPVF9PRlNUCQkyMQorLyoKKyAqIFRoZSBmb2xsb3dpbmcgdHdvIHJlbG9jYXRp
b24gdHlwZXMgYXJlIHNwZWNpZmllZCBpbiB0aGUgTUlQUyBBQkkKKyAqIGNvbmZvcm1hbmNlIGd1
aWRlIHZlcnNpb24gMS4yIGJ1dCBub3QgeWV0IGluIHRoZSBwc0FCSS4KKyAqLworI2RlZmluZSBS
X01JUFNfR09USEkxNgkJMjIKKyNkZWZpbmUgUl9NSVBTX0dPVExPMTYJCTIzCisjZGVmaW5lIFJf
TUlQU19TVUIJCTI0CisjZGVmaW5lIFJfTUlQU19JTlNFUlRfQQkJMjUKKyNkZWZpbmUgUl9NSVBT
X0lOU0VSVF9CCQkyNgorI2RlZmluZSBSX01JUFNfREVMRVRFCQkyNworI2RlZmluZSBSX01JUFNf
SElHSEVSCQkyOAorI2RlZmluZSBSX01JUFNfSElHSEVTVAkJMjkKKy8qCisgKiBUaGUgZm9sbG93
aW5nIHR3byByZWxvY2F0aW9uIHR5cGVzIGFyZSBzcGVjaWZpZWQgaW4gdGhlIE1JUFMgQUJJCisg
KiBjb25mb3JtYW5jZSBndWlkZSB2ZXJzaW9uIDEuMiBidXQgbm90IHlldCBpbiB0aGUgcHNBQkku
CisgKi8KKyNkZWZpbmUgUl9NSVBTX0NBTExISTE2CQkzMAorI2RlZmluZSBSX01JUFNfQ0FMTExP
MTYJCTMxCisvKgorICogSW50cm9kdWNlZCBmb3IgTUlQU3I2LgorICovCisjZGVmaW5lIFJfTUlQ
U19QQzIxX1MyCQk2MAorI2RlZmluZSBSX01JUFNfUEMyNl9TMgkJNjEKKy8qCisgKiBUaGlzIHJh
bmdlIGlzIHJlc2VydmVkIGZvciB2ZW5kb3Igc3BlY2lmaWMgcmVsb2NhdGlvbnMuCisgKi8KKyNk
ZWZpbmUgUl9NSVBTX0xPVkVORE9SCQkxMDAKKyNkZWZpbmUgUl9NSVBTX0hJVkVORE9SCQkxMjcK
KworI2RlZmluZSBSX01JUFNfUEMzMgkJMjQ4CisKICNlbmRpZiAvKiBfVUFQSV9MSU5VWF9FTEZf
Ul9IICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
