Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83549C79FAC
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AsvIgYjLbhMz/e3PCau4ylmEvBDBQplF98QWzF1SqM=; b=PRDVc2lFIcBdoo
	VYCoLx8z7ZSNhbttZWJIUPLevm6Kn+t1ZbhUZigE/ptFj4kQ9lkIwbau5uvUOPJK01b2tOkhQMm/8
	vjaX2bjR6i/trhiCsvteBaxHURjCIO76Fp495Ihfw552Ti49Xeeo+f8bkBr6M6hcO6KPPaNrmmkcB
	bj8oSJ9OeYm8M/DMQ62gev5jxEfS66Xpz6CEzh6jZBXHnHRBzjgVzzJPt+X3g0zRJC/NLhHvcLVjt
	Q9Tj9KChn7dK5+dMAL6Ph5OHIC4OhE0enYuWrrVsUGieLIyck1FW0ClfDmxHftPeU37fxLTD6+dvv
	ABPcwN/FYD6ND7nOyELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPR-000000089Ua-2DkW;
	Tue, 08 Sep 2026 06:34:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP2-000000088vs-495r;
	Tue, 08 Sep 2026 06:33:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rCxHOjDU+1K4duStPKjAXJyT/7CSkrSSpDiIH+J3gQ=;
	b=da+locf+fYZS/T5UEThHqFcTDFXtvv69gxiMsF/ZubAOmr0jXYhOT3/KoH+tH/Op7c1vsy
	bpRepepo9H4IVaLokGW2IAwi1CWeXhd8o+dNwcx4sQhR3qvQh8ZBTI6S3Za8toe475YqL9
	m52Xec1PkVIHNnUIbn3no0eX4OaVjR4eFvZXam8e/0rp6XYFlSAcG0zrJO4CYAxWcD/7Bt
	tANKqUikMG/E33o4//5C703pUa8pqwDoJG3+m2PnIOpEmRRCwvUZcUhOxeAXqdjVJBbxMA
	fBIKwWukg4cdp/joxinRYCAl0XPGoVpBL/l3pBR9qkhcL0hyX26IC/ovUmuN9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rCxHOjDU+1K4duStPKjAXJyT/7CSkrSSpDiIH+J3gQ=;
	b=rGIpB+VWmPNCZoxaugfvlZgtr9WAIBlKJMe9XrdCQurBFn8CcRHDbE0U1PBy6BjjzxN9GO
	PeQVrvH5QgAT1ZCg==
Date: Tue, 08 Sep 2026 08:33:44 +0200
Subject: [PATCH v5 10/24] sparc: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-10-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=5043;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b3nIkO5dCOkLCB+RhAZSMfv9iyr/5udIrKKC/R5UfGI=;
 b=FLRNHzsCqKdcJx3OOfwKa5Me9losfqQALszfZzWeIrGPgKpu5aG5hMJXNy/WjoqfB9MFnNHp1
 jIUinzpdhRoADtkUKsdgIyuWwsFe9f5ZRqdDteADesxBx76m5aXYrxr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233357_476262_BF057464 
X-CRM114-Status: GOOD (  10.23  )
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
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9zcGFyYy9p
bmNsdWRlL2FzbS9lbGZfMzIuaCB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vZWxmXzY0LmggfCA0NCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1y
LmggICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDg3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vZWxmXzMyLmggYi9hcmNoL3NwYXJjL2luY2x1
ZGUvYXNtL2VsZl8zMi5oCmluZGV4IDM3YTYwMTZjOWNjZC4uMDI3MzYyODRmN2FmIDEwMDY0NAot
LS0gYS9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2VsZl8zMi5oCisrKyBiL2FyY2gvc3BhcmMvaW5j
bHVkZS9hc20vZWxmXzMyLmgKQEAgLTEzLDQ5ICsxMyw2IEBACiAgKi8KICNkZWZpbmUgU1RUX1JF
R0lTVEVSCQkxMwogCi0vKgotICogU3BhcmMgRUxGIHJlbG9jYXRpb24gdHlwZXMKLSAqLwotI2Rl
ZmluZQlSX1NQQVJDX05PTkUJCTAKLSNkZWZpbmUJUl9TUEFSQ184CQkxCi0jZGVmaW5lCVJfU1BB
UkNfMTYJCTIKLSNkZWZpbmUJUl9TUEFSQ18zMgkJMwotI2RlZmluZQlSX1NQQVJDX0RJU1A4CQk0
Ci0jZGVmaW5lCVJfU1BBUkNfRElTUDE2CQk1Ci0jZGVmaW5lCVJfU1BBUkNfRElTUDMyCQk2Ci0j
ZGVmaW5lCVJfU1BBUkNfV0RJU1AzMAkJNwotI2RlZmluZQlSX1NQQVJDX1dESVNQMjIJCTgKLSNk
ZWZpbmUJUl9TUEFSQ19ISTIyCQk5Ci0jZGVmaW5lCVJfU1BBUkNfMjIJCTEwCi0jZGVmaW5lCVJf
U1BBUkNfMTMJCTExCi0jZGVmaW5lCVJfU1BBUkNfTE8xMAkJMTIKLSNkZWZpbmUJUl9TUEFSQ19H
T1QxMAkJMTMKLSNkZWZpbmUJUl9TUEFSQ19HT1QxMwkJMTQKLSNkZWZpbmUJUl9TUEFSQ19HT1Qy
MgkJMTUKLSNkZWZpbmUJUl9TUEFSQ19QQzEwCQkxNgotI2RlZmluZQlSX1NQQVJDX1BDMjIJCTE3
Ci0jZGVmaW5lCVJfU1BBUkNfV1BMVDMwCQkxOAotI2RlZmluZQlSX1NQQVJDX0NPUFkJCTE5Ci0j
ZGVmaW5lCVJfU1BBUkNfR0xPQl9EQVQJMjAKLSNkZWZpbmUJUl9TUEFSQ19KTVBfU0xPVAkyMQot
I2RlZmluZQlSX1NQQVJDX1JFTEFUSVZFCTIyCi0jZGVmaW5lCVJfU1BBUkNfVUEzMgkJMjMKLSNk
ZWZpbmUgUl9TUEFSQ19QTFQzMgkJMjQKLSNkZWZpbmUgUl9TUEFSQ19ISVBMVDIyCQkyNQotI2Rl
ZmluZSBSX1NQQVJDX0xPUExUMTAJCTI2Ci0jZGVmaW5lIFJfU1BBUkNfUENQTFQzMgkJMjcKLSNk
ZWZpbmUgUl9TUEFSQ19QQ1BMVDIyCQkyOAotI2RlZmluZSBSX1NQQVJDX1BDUExUMTAJCTI5Ci0j
ZGVmaW5lIFJfU1BBUkNfMTAJCTMwCi0jZGVmaW5lIFJfU1BBUkNfMTEJCTMxCi0jZGVmaW5lIFJf
U1BBUkNfNjQJCTMyCi0jZGVmaW5lIFJfU1BBUkNfT0xPMTAJCTMzCi0jZGVmaW5lIFJfU1BBUkNf
V0RJU1AxNgkJNDAKLSNkZWZpbmUgUl9TUEFSQ19XRElTUDE5CQk0MQotI2RlZmluZSBSX1NQQVJD
XzcJCTQzCi0jZGVmaW5lIFJfU1BBUkNfNQkJNDQKLSNkZWZpbmUgUl9TUEFSQ182CQk0NQotCiAv
KiBCaXRzIHByZXNlbnQgaW4gQVRfSFdDQVAsIHByaW1hcmlseSBmb3IgU3BhcmMzMi4gICovCiAK
ICNkZWZpbmUgSFdDQVBfU1BBUkNfRkxVU0ggICAgICAgMSAgICAvKiBDUFUgc3VwcG9ydHMgZmx1
c2ggaW5zdHJ1Y3Rpb24uICovCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2Vs
Zl82NC5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9lbGZfNjQuaAppbmRleCA2OTRlZDA4MWNm
OGQuLjNiZTllMmQzYTk0YSAxMDA2NDQKLS0tIGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9lbGZf
NjQuaAorKysgYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2VsZl82NC5oCkBAIC0xNiw1MCArMTYs
NiBAQAogICovCiAjZGVmaW5lIFNUVF9SRUdJU1RFUgkJMTMKIAotLyoKLSAqIFNwYXJjIEVMRiBy
ZWxvY2F0aW9uIHR5cGVzCi0gKi8KLSNkZWZpbmUJUl9TUEFSQ19OT05FCQkwCi0jZGVmaW5lCVJf
U1BBUkNfOAkJMQotI2RlZmluZQlSX1NQQVJDXzE2CQkyCi0jZGVmaW5lCVJfU1BBUkNfMzIJCTMK
LSNkZWZpbmUJUl9TUEFSQ19ESVNQOAkJNAotI2RlZmluZQlSX1NQQVJDX0RJU1AxNgkJNQotI2Rl
ZmluZQlSX1NQQVJDX0RJU1AzMgkJNgotI2RlZmluZQlSX1NQQVJDX1dESVNQMzAJCTcKLSNkZWZp
bmUJUl9TUEFSQ19XRElTUDIyCQk4Ci0jZGVmaW5lCVJfU1BBUkNfSEkyMgkJOQotI2RlZmluZQlS
X1NQQVJDXzIyCQkxMAotI2RlZmluZQlSX1NQQVJDXzEzCQkxMQotI2RlZmluZQlSX1NQQVJDX0xP
MTAJCTEyCi0jZGVmaW5lCVJfU1BBUkNfR09UMTAJCTEzCi0jZGVmaW5lCVJfU1BBUkNfR09UMTMJ
CTE0Ci0jZGVmaW5lCVJfU1BBUkNfR09UMjIJCTE1Ci0jZGVmaW5lCVJfU1BBUkNfUEMxMAkJMTYK
LSNkZWZpbmUJUl9TUEFSQ19QQzIyCQkxNwotI2RlZmluZQlSX1NQQVJDX1dQTFQzMAkJMTgKLSNk
ZWZpbmUJUl9TUEFSQ19DT1BZCQkxOQotI2RlZmluZQlSX1NQQVJDX0dMT0JfREFUCTIwCi0jZGVm
aW5lCVJfU1BBUkNfSk1QX1NMT1QJMjEKLSNkZWZpbmUJUl9TUEFSQ19SRUxBVElWRQkyMgotI2Rl
ZmluZQlSX1NQQVJDX1VBMzIJCTIzCi0jZGVmaW5lIFJfU1BBUkNfUExUMzIJCTI0Ci0jZGVmaW5l
IFJfU1BBUkNfSElQTFQyMgkJMjUKLSNkZWZpbmUgUl9TUEFSQ19MT1BMVDEwCQkyNgotI2RlZmlu
ZSBSX1NQQVJDX1BDUExUMzIJCTI3Ci0jZGVmaW5lIFJfU1BBUkNfUENQTFQyMgkJMjgKLSNkZWZp
bmUgUl9TUEFSQ19QQ1BMVDEwCQkyOQotI2RlZmluZSBSX1NQQVJDXzEwCQkzMAotI2RlZmluZSBS
X1NQQVJDXzExCQkzMQotI2RlZmluZSBSX1NQQVJDXzY0CQkzMgotI2RlZmluZSBSX1NQQVJDX09M
TzEwCQkzMwotI2RlZmluZSBSX1NQQVJDX1dESVNQMTYJCTQwCi0jZGVmaW5lIFJfU1BBUkNfV0RJ
U1AxOQkJNDEKLSNkZWZpbmUgUl9TUEFSQ183CQk0MwotI2RlZmluZSBSX1NQQVJDXzUJCTQ0Ci0j
ZGVmaW5lIFJfU1BBUkNfNgkJNDUKLSNkZWZpbmUgUl9TUEFSQ19VQTY0CQk1NAotCiAvKiBCaXRz
IHByZXNlbnQgaW4gQVRfSFdDQVAsIHByaW1hcmlseSBmb3IgU3BhcmMzMi4gICovCiAjZGVmaW5l
IEhXQ0FQX1NQQVJDX0ZMVVNIICAgICAgIDB4MDAwMDAwMDEKICNkZWZpbmUgSFdDQVBfU1BBUkNf
U1RCQVIgICAgICAgMHgwMDAwMDAwMgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2Vs
Zi1yLmggYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaAppbmRleCAwYzZhODY5OGYzMDAuLjcy
ZmM5MDQ1YTVkNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKKysrIGIv
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKQEAgLTY0OSw0ICs2NDksNDggQEAKIAogI2RlZmlu
ZSBSX01JUFNfUEMzMgkJMjQ4CiAKKy8qCisgKiBTcGFyYyBFTEYgcmVsb2NhdGlvbiB0eXBlcwor
ICovCisjZGVmaW5lCVJfU1BBUkNfTk9ORQkJMAorI2RlZmluZQlSX1NQQVJDXzgJCTEKKyNkZWZp
bmUJUl9TUEFSQ18xNgkJMgorI2RlZmluZQlSX1NQQVJDXzMyCQkzCisjZGVmaW5lCVJfU1BBUkNf
RElTUDgJCTQKKyNkZWZpbmUJUl9TUEFSQ19ESVNQMTYJCTUKKyNkZWZpbmUJUl9TUEFSQ19ESVNQ
MzIJCTYKKyNkZWZpbmUJUl9TUEFSQ19XRElTUDMwCQk3CisjZGVmaW5lCVJfU1BBUkNfV0RJU1Ay
MgkJOAorI2RlZmluZQlSX1NQQVJDX0hJMjIJCTkKKyNkZWZpbmUJUl9TUEFSQ18yMgkJMTAKKyNk
ZWZpbmUJUl9TUEFSQ18xMwkJMTEKKyNkZWZpbmUJUl9TUEFSQ19MTzEwCQkxMgorI2RlZmluZQlS
X1NQQVJDX0dPVDEwCQkxMworI2RlZmluZQlSX1NQQVJDX0dPVDEzCQkxNAorI2RlZmluZQlSX1NQ
QVJDX0dPVDIyCQkxNQorI2RlZmluZQlSX1NQQVJDX1BDMTAJCTE2CisjZGVmaW5lCVJfU1BBUkNf
UEMyMgkJMTcKKyNkZWZpbmUJUl9TUEFSQ19XUExUMzAJCTE4CisjZGVmaW5lCVJfU1BBUkNfQ09Q
WQkJMTkKKyNkZWZpbmUJUl9TUEFSQ19HTE9CX0RBVAkyMAorI2RlZmluZQlSX1NQQVJDX0pNUF9T
TE9UCTIxCisjZGVmaW5lCVJfU1BBUkNfUkVMQVRJVkUJMjIKKyNkZWZpbmUJUl9TUEFSQ19VQTMy
CQkyMworI2RlZmluZSBSX1NQQVJDX1BMVDMyCQkyNAorI2RlZmluZSBSX1NQQVJDX0hJUExUMjIJ
CTI1CisjZGVmaW5lIFJfU1BBUkNfTE9QTFQxMAkJMjYKKyNkZWZpbmUgUl9TUEFSQ19QQ1BMVDMy
CQkyNworI2RlZmluZSBSX1NQQVJDX1BDUExUMjIJCTI4CisjZGVmaW5lIFJfU1BBUkNfUENQTFQx
MAkJMjkKKyNkZWZpbmUgUl9TUEFSQ18xMAkJMzAKKyNkZWZpbmUgUl9TUEFSQ18xMQkJMzEKKyNk
ZWZpbmUgUl9TUEFSQ182NAkJMzIKKyNkZWZpbmUgUl9TUEFSQ19PTE8xMAkJMzMKKyNkZWZpbmUg
Ul9TUEFSQ19XRElTUDE2CQk0MAorI2RlZmluZSBSX1NQQVJDX1dESVNQMTkJCTQxCisjZGVmaW5l
IFJfU1BBUkNfNwkJNDMKKyNkZWZpbmUgUl9TUEFSQ181CQk0NAorI2RlZmluZSBSX1NQQVJDXzYJ
CTQ1CisjZGVmaW5lIFJfU1BBUkNfVUE2NAkJNTQKKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VM
Rl9SX0ggKi8KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
