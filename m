Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFD5C79FB1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2E6vJt3okJRCj8jht7xwgtXW9KqRni1meM7v+SU67Z4=; b=PQOsKd7blW/dMw
	jIBgLPEmYWHD70Z05e4DKB9Rl8cBsiwGsaRxVw/gucD/+5D1ldhFqrrl58Y1Bslz5P89iRMgm86X/
	clt9GOn/DVnSi4SGsM7t2zA4Svwa1nwXu5naqUDFt0/exhKqAP4DOZe6Y5VNTuxEHjZhKjlxalDKi
	ZfNIYwkhYtatCXiu/zbb1T8b/OUn6D+c7p5wZXIYGeeiL4mWxwCCCzF2yDovxZ06RNjPYRuBWj4p+
	/1jT5ywx4O6wnKAUrNTJX3guyqJq2aepmQgQzuthYOM/p88p3Ch1W0NScmGCQttXAB1s1kiAg7IUp
	DIv9xaDsc3bizzR365eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPD-0000000899k-03aN;
	Tue, 08 Sep 2026 06:34:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP1-000000088vP-2UpA;
	Tue, 08 Sep 2026 06:33:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FawW0xiyyB3XDpeEil2328xu9JZeGaaUH29QSwtR0fg=;
	b=BBfchTQ31DifkjFqwb5y4n5BvOGW48DOyhiHYRpdPzrEQcn+IitYmXoSVnLWzvWa6lwHuy
	sZD+8Y+YV+U5Q+RLLiaQuk6+JRBJF9vi1Y1DGh92/GH1x2M0Sy+puIE8ZRZhqgBqF9ZxcX
	OVMEGjMH4cuC2Ih8qYPFGclgRGEjWPRnkw/+9BlYAZfTwu3dB+NLPwZ6JmOUFvLGShphqo
	lpE6byOStxgm5iAG6jOHo0tEAOdE8cTToyKI6d+gadpfoJgZfZRrWhapeXH8p8WEX3WKnq
	ZIRI/ePB8OFwnrq7FOJP8oo233EMrmmz/MJKwghMXEJPb8wamnhU9yuJgEsxpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FawW0xiyyB3XDpeEil2328xu9JZeGaaUH29QSwtR0fg=;
	b=epagOxWHbraL4pZF2ABSEKqkk81eezIl8Gi009ltXa6+5yB+cGQ8VNDm3CyFBBc9mW3J0y
	3loMMVZFFoRrE7AA==
Date: Tue, 08 Sep 2026 08:33:40 +0200
Subject: [PATCH v5 06/24] riscv: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-6-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=4962;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=A2KwwyE44rpRvMfg8HmJMKqJMXpNGArDCbHCP2lPOtc=;
 b=BIFQBlA6uOHvotUFp7WcFcjkRWr4zWTBvAzopoDSHqbuVQn/0iY7yQ9cklHXDfQCbhw1lLP4v
 +pw2vSBQ8BmAxY2zgjj9x+KL+h6I3EZtcmF2oBqsXSxkzdljxYY/Ns5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233356_002310_0E0CEB83 
X-CRM114-Status: GOOD (  10.78  )
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
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CkFja2VkLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9lbGYuaCB8IDY2IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggICAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyks
IDY2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9lbGYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9lbGYuaAppbmRleCAxMWE3MWI4
NTMzZDUuLjA1Y2Y3NGE0YTUzNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2VsZi5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9lbGYuaApAQCAtMzIs
NzAgKzMyLDQgQEAgdHlwZWRlZiB1bmlvbiBfX3Jpc2N2X2ZwX3N0YXRlIGVsZl9mcHJlZ3NldF90
OwogI2RlZmluZSBFTEZfUklTQ1ZfUl9UWVBFKHJfaW5mbykJRUxGMzJfUl9UWVBFKHJfaW5mbykK
ICNlbmRpZgogCi0vKgotICogUklTQy1WIHJlbG9jYXRpb24gdHlwZXMKLSAqLwotCi0vKiBSZWxv
Y2F0aW9uIHR5cGVzIHVzZWQgYnkgdGhlIGR5bmFtaWMgbGlua2VyICovCi0jZGVmaW5lIFJfUklT
Q1ZfTk9ORQkJMAotI2RlZmluZSBSX1JJU0NWXzMyCQkxCi0jZGVmaW5lIFJfUklTQ1ZfNjQJCTIK
LSNkZWZpbmUgUl9SSVNDVl9SRUxBVElWRQkzCi0jZGVmaW5lIFJfUklTQ1ZfQ09QWQkJNAotI2Rl
ZmluZSBSX1JJU0NWX0pVTVBfU0xPVAk1Ci0jZGVmaW5lIFJfUklTQ1ZfVExTX0RUUE1PRDMyCTYK
LSNkZWZpbmUgUl9SSVNDVl9UTFNfRFRQTU9ENjQJNwotI2RlZmluZSBSX1JJU0NWX1RMU19EVFBS
RUwzMgk4Ci0jZGVmaW5lIFJfUklTQ1ZfVExTX0RUUFJFTDY0CTkKLSNkZWZpbmUgUl9SSVNDVl9U
TFNfVFBSRUwzMgkxMAotI2RlZmluZSBSX1JJU0NWX1RMU19UUFJFTDY0CTExCi0jZGVmaW5lIFJf
UklTQ1ZfSVJFTEFUSVZFCTU4Ci0KLS8qIFJlbG9jYXRpb24gdHlwZXMgbm90IHVzZWQgYnkgdGhl
IGR5bmFtaWMgbGlua2VyICovCi0jZGVmaW5lIFJfUklTQ1ZfQlJBTkNICQkxNgotI2RlZmluZSBS
X1JJU0NWX0pBTAkJMTcKLSNkZWZpbmUgUl9SSVNDVl9DQUxMCQkxOAotI2RlZmluZSBSX1JJU0NW
X0NBTExfUExUCTE5Ci0jZGVmaW5lIFJfUklTQ1ZfR09UX0hJMjAJMjAKLSNkZWZpbmUgUl9SSVND
Vl9UTFNfR09UX0hJMjAJMjEKLSNkZWZpbmUgUl9SSVNDVl9UTFNfR0RfSEkyMAkyMgotI2RlZmlu
ZSBSX1JJU0NWX1BDUkVMX0hJMjAJMjMKLSNkZWZpbmUgUl9SSVNDVl9QQ1JFTF9MTzEyX0kJMjQK
LSNkZWZpbmUgUl9SSVNDVl9QQ1JFTF9MTzEyX1MJMjUKLSNkZWZpbmUgUl9SSVNDVl9ISTIwCQky
NgotI2RlZmluZSBSX1JJU0NWX0xPMTJfSQkJMjcKLSNkZWZpbmUgUl9SSVNDVl9MTzEyX1MJCTI4
Ci0jZGVmaW5lIFJfUklTQ1ZfVFBSRUxfSEkyMAkyOQotI2RlZmluZSBSX1JJU0NWX1RQUkVMX0xP
MTJfSQkzMAotI2RlZmluZSBSX1JJU0NWX1RQUkVMX0xPMTJfUwkzMQotI2RlZmluZSBSX1JJU0NW
X1RQUkVMX0FERAkzMgotI2RlZmluZSBSX1JJU0NWX0FERDgJCTMzCi0jZGVmaW5lIFJfUklTQ1Zf
QUREMTYJCTM0Ci0jZGVmaW5lIFJfUklTQ1ZfQUREMzIJCTM1Ci0jZGVmaW5lIFJfUklTQ1ZfQURE
NjQJCTM2Ci0jZGVmaW5lIFJfUklTQ1ZfU1VCOAkJMzcKLSNkZWZpbmUgUl9SSVNDVl9TVUIxNgkJ
MzgKLSNkZWZpbmUgUl9SSVNDVl9TVUIzMgkJMzkKLSNkZWZpbmUgUl9SSVNDVl9TVUI2NAkJNDAK
LSNkZWZpbmUgUl9SSVNDVl9HTlVfVlRJTkhFUklUCTQxCi0jZGVmaW5lIFJfUklTQ1ZfR05VX1ZU
RU5UUlkJNDIKLSNkZWZpbmUgUl9SSVNDVl9BTElHTgkJNDMKLSNkZWZpbmUgUl9SSVNDVl9SVkNf
QlJBTkNICTQ0Ci0jZGVmaW5lIFJfUklTQ1ZfUlZDX0pVTVAJNDUKLSNkZWZpbmUgUl9SSVNDVl9H
UFJFTF9JCQk0NwotI2RlZmluZSBSX1JJU0NWX0dQUkVMX1MJCTQ4Ci0jZGVmaW5lIFJfUklTQ1Zf
VFBSRUxfSQkJNDkKLSNkZWZpbmUgUl9SSVNDVl9UUFJFTF9TCQk1MAotI2RlZmluZSBSX1JJU0NW
X1JFTEFYCQk1MQotI2RlZmluZSBSX1JJU0NWX1NVQjYJCTUyCi0jZGVmaW5lIFJfUklTQ1ZfU0VU
NgkJNTMKLSNkZWZpbmUgUl9SSVNDVl9TRVQ4CQk1NAotI2RlZmluZSBSX1JJU0NWX1NFVDE2CQk1
NQotI2RlZmluZSBSX1JJU0NWX1NFVDMyCQk1NgotI2RlZmluZSBSX1JJU0NWXzMyX1BDUkVMCTU3
Ci0jZGVmaW5lIFJfUklTQ1ZfUExUMzIJCTU5Ci0jZGVmaW5lIFJfUklTQ1ZfU0VUX1VMRUIxMjgJ
NjAKLSNkZWZpbmUgUl9SSVNDVl9TVUJfVUxFQjEyOAk2MQotCi0KICNlbmRpZiAvKiBfVUFQSV9B
U01fUklTQ1ZfRUxGX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5o
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5kZXggMGQwZGZhYTdjNzI0Li4wMmU0MjBj
MjU1ZGYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisrKyBiL2luY2x1
ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC0zMTQsNCArMzE0LDcwIEBACiAvKiBLZWVwIHRoaXMg
dGhlIGxhc3QgZW50cnkuICAqLwogI2RlZmluZSBSX1BQQzY0X05VTQkJMjUzCiAKKworLyoKKyAq
IFJJU0MtViByZWxvY2F0aW9uIHR5cGVzCisgKi8KKworLyogUmVsb2NhdGlvbiB0eXBlcyB1c2Vk
IGJ5IHRoZSBkeW5hbWljIGxpbmtlciAqLworI2RlZmluZSBSX1JJU0NWX05PTkUJCTAKKyNkZWZp
bmUgUl9SSVNDVl8zMgkJMQorI2RlZmluZSBSX1JJU0NWXzY0CQkyCisjZGVmaW5lIFJfUklTQ1Zf
UkVMQVRJVkUJMworI2RlZmluZSBSX1JJU0NWX0NPUFkJCTQKKyNkZWZpbmUgUl9SSVNDVl9KVU1Q
X1NMT1QJNQorI2RlZmluZSBSX1JJU0NWX1RMU19EVFBNT0QzMgk2CisjZGVmaW5lIFJfUklTQ1Zf
VExTX0RUUE1PRDY0CTcKKyNkZWZpbmUgUl9SSVNDVl9UTFNfRFRQUkVMMzIJOAorI2RlZmluZSBS
X1JJU0NWX1RMU19EVFBSRUw2NAk5CisjZGVmaW5lIFJfUklTQ1ZfVExTX1RQUkVMMzIJMTAKKyNk
ZWZpbmUgUl9SSVNDVl9UTFNfVFBSRUw2NAkxMQorI2RlZmluZSBSX1JJU0NWX0lSRUxBVElWRQk1
OAorCisvKiBSZWxvY2F0aW9uIHR5cGVzIG5vdCB1c2VkIGJ5IHRoZSBkeW5hbWljIGxpbmtlciAq
LworI2RlZmluZSBSX1JJU0NWX0JSQU5DSAkJMTYKKyNkZWZpbmUgUl9SSVNDVl9KQUwJCTE3Cisj
ZGVmaW5lIFJfUklTQ1ZfQ0FMTAkJMTgKKyNkZWZpbmUgUl9SSVNDVl9DQUxMX1BMVAkxOQorI2Rl
ZmluZSBSX1JJU0NWX0dPVF9ISTIwCTIwCisjZGVmaW5lIFJfUklTQ1ZfVExTX0dPVF9ISTIwCTIx
CisjZGVmaW5lIFJfUklTQ1ZfVExTX0dEX0hJMjAJMjIKKyNkZWZpbmUgUl9SSVNDVl9QQ1JFTF9I
STIwCTIzCisjZGVmaW5lIFJfUklTQ1ZfUENSRUxfTE8xMl9JCTI0CisjZGVmaW5lIFJfUklTQ1Zf
UENSRUxfTE8xMl9TCTI1CisjZGVmaW5lIFJfUklTQ1ZfSEkyMAkJMjYKKyNkZWZpbmUgUl9SSVND
Vl9MTzEyX0kJCTI3CisjZGVmaW5lIFJfUklTQ1ZfTE8xMl9TCQkyOAorI2RlZmluZSBSX1JJU0NW
X1RQUkVMX0hJMjAJMjkKKyNkZWZpbmUgUl9SSVNDVl9UUFJFTF9MTzEyX0kJMzAKKyNkZWZpbmUg
Ul9SSVNDVl9UUFJFTF9MTzEyX1MJMzEKKyNkZWZpbmUgUl9SSVNDVl9UUFJFTF9BREQJMzIKKyNk
ZWZpbmUgUl9SSVNDVl9BREQ4CQkzMworI2RlZmluZSBSX1JJU0NWX0FERDE2CQkzNAorI2RlZmlu
ZSBSX1JJU0NWX0FERDMyCQkzNQorI2RlZmluZSBSX1JJU0NWX0FERDY0CQkzNgorI2RlZmluZSBS
X1JJU0NWX1NVQjgJCTM3CisjZGVmaW5lIFJfUklTQ1ZfU1VCMTYJCTM4CisjZGVmaW5lIFJfUklT
Q1ZfU1VCMzIJCTM5CisjZGVmaW5lIFJfUklTQ1ZfU1VCNjQJCTQwCisjZGVmaW5lIFJfUklTQ1Zf
R05VX1ZUSU5IRVJJVAk0MQorI2RlZmluZSBSX1JJU0NWX0dOVV9WVEVOVFJZCTQyCisjZGVmaW5l
IFJfUklTQ1ZfQUxJR04JCTQzCisjZGVmaW5lIFJfUklTQ1ZfUlZDX0JSQU5DSAk0NAorI2RlZmlu
ZSBSX1JJU0NWX1JWQ19KVU1QCTQ1CisjZGVmaW5lIFJfUklTQ1ZfR1BSRUxfSQkJNDcKKyNkZWZp
bmUgUl9SSVNDVl9HUFJFTF9TCQk0OAorI2RlZmluZSBSX1JJU0NWX1RQUkVMX0kJCTQ5CisjZGVm
aW5lIFJfUklTQ1ZfVFBSRUxfUwkJNTAKKyNkZWZpbmUgUl9SSVNDVl9SRUxBWAkJNTEKKyNkZWZp
bmUgUl9SSVNDVl9TVUI2CQk1MgorI2RlZmluZSBSX1JJU0NWX1NFVDYJCTUzCisjZGVmaW5lIFJf
UklTQ1ZfU0VUOAkJNTQKKyNkZWZpbmUgUl9SSVNDVl9TRVQxNgkJNTUKKyNkZWZpbmUgUl9SSVND
Vl9TRVQzMgkJNTYKKyNkZWZpbmUgUl9SSVNDVl8zMl9QQ1JFTAk1NworI2RlZmluZSBSX1JJU0NW
X1BMVDMyCQk1OQorI2RlZmluZSBSX1JJU0NWX1NFVF9VTEVCMTI4CTYwCisjZGVmaW5lIFJfUklT
Q1ZfU1VCX1VMRUIxMjgJNjEKKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VMRl9SX0ggKi8KCi0t
IAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
