Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0418EC79FAE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fmIz9W/jS+PZMZIulNDnqBe7001pYRKdb0hq0KqO1k=; b=CtTzwtCRKQFT4Z
	nFhijd79rJmEk5pEmB70i/YuMLz8ATdskvGoHs4/Xrbwf2UNLLF/NR33fe6kP1ubPpGEwP9vE8ICK
	9y0BCo3b3Sm1kljjZWkVkAbgoYW2SUlo3uSS3IYVbk2hoA378fSvEzGRGnqMVTnt3EdcoRAgyvO7n
	sXnZsipnodHzXsp9+hFbf6zeRtIWNdN0sN6nbkFjTYXyUYN8eGkJZRXM4e39luYyxngF51MfV9jfp
	Qh6+kBo02TuJmj7MTleB2yEvV5VX2EzVH58/xASK1oNhWEy3GmZ6VZqMcHvxc8TDrrQpLQAO8AKIi
	AY/De88McFv5diFfQaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP6-00000008927-3bod;
	Tue, 08 Sep 2026 06:34:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOy-000000088sq-2NEZ;
	Tue, 08 Sep 2026 06:33:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITX6vbZ0p2MNUnqySgiQU1yaeBX1Pv0fohxsnS17XIE=;
	b=rfwyK8rjLPkePRrnJHe5/m9/qJsnrWMCt3iK+M7M5ZYc6dfObs52IIDnFx5QgND5xV+RSg
	DULbnxSrs1cNZLOgC5w74szhXRhwXueEKLWD5PiJIbFVmAO7uDHSPwLz9pK6DrIC85jwBv
	NptQJNDLTlAl0caYUrvufk5jk9bhHOty9MKSjt4bQXd4/hUZnyPvtRUw6CVU8HCzHPiKDf
	Qrx91oCLhunvM867s5Vs+oHAu9RifHTN2uGkz5Y7TRc6k2c42aM+pQ0MXz05XTOHWGO/tF
	rgfxs/zda+BfhYnlFo95QXEfk/RSRvCg32nIwzWZtUQue6L7jrsHr6BvZdL3SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITX6vbZ0p2MNUnqySgiQU1yaeBX1Pv0fohxsnS17XIE=;
	b=kmw243Q2lOefM6sErINOe0v2bdegFzSBOYOJ/mtefV8467qCIp/KHbzuaZEJV6LMACNvq/
	kbGYSfPlNIXmtvCA==
Date: Tue, 08 Sep 2026 08:33:36 +0200
Subject: [PATCH v5 02/24] x86/elf, um/x86/elf: Move relocation constants to
 UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-2-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=5793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=EP6eD/uZ0V4wHN9+/JxWHWsljJ+xT4xd0R266HOP2Mk=;
 b=9fiwRBRCJd/GEgS5mAJxYeP44dMtEzEA5a59lLmblClvso6Eb+4WwYMKSod5q7tvCst53OR2v
 u8IKRzDMhHhAzblZpImUk9ElKP8BMqVg+cBR+BubteVty4SyzNMiSs+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233352_772364_A9B7C0C2 
X-CRM114-Status: GOOD (  11.68  )
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
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC94ODYvaW5j
bHVkZS9hc20vZWxmLmggfCAzMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFy
Y2gveDg2L3VtL2FzbS9lbGYuaCAgICAgIHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCB8IDM0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNjYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vZWxmLmggYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9lbGYuaAppbmRleCA0MTMzYzc5MGU3MWEuLmFkODRjMGY2MDQ1
OSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vZWxmLmgKKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vZWxmLmgKQEAgLTIyLDE5ICsyMiw2IEBAIHR5cGVkZWYgc3RydWN0IHVzZXJf
aTM4N19zdHJ1Y3QgZWxmX2ZwcmVnc2V0X3Q7CiAKICNpZmRlZiBfX2kzODZfXwogCi0jZGVmaW5l
IFJfMzg2X05PTkUJMAotI2RlZmluZSBSXzM4Nl8zMgkxCi0jZGVmaW5lIFJfMzg2X1BDMzIJMgot
I2RlZmluZSBSXzM4Nl9HT1QzMgkzCi0jZGVmaW5lIFJfMzg2X1BMVDMyCTQKLSNkZWZpbmUgUl8z
ODZfQ09QWQk1Ci0jZGVmaW5lIFJfMzg2X0dMT0JfREFUCTYKLSNkZWZpbmUgUl8zODZfSk1QX1NM
T1QJNwotI2RlZmluZSBSXzM4Nl9SRUxBVElWRQk4Ci0jZGVmaW5lIFJfMzg2X0dPVE9GRgk5Ci0j
ZGVmaW5lIFJfMzg2X0dPVFBDCTEwCi0jZGVmaW5lIFJfMzg2X05VTQkxMQotCiAvKgogICogVGhl
c2UgYXJlIHVzZWQgdG8gc2V0IHBhcmFtZXRlcnMgaW4gdGhlIGNvcmUgZHVtcHMuCiAgKi8KQEAg
LTQ0LDI2ICszMSw2IEBAIHR5cGVkZWYgc3RydWN0IHVzZXJfaTM4N19zdHJ1Y3QgZWxmX2ZwcmVn
c2V0X3Q7CiAKICNlbHNlCiAKLS8qIHg4Ni02NCByZWxvY2F0aW9uIHR5cGVzICovCi0jZGVmaW5l
IFJfWDg2XzY0X05PTkUJCTAJLyogTm8gcmVsb2MgKi8KLSNkZWZpbmUgUl9YODZfNjRfNjQJCTEJ
LyogRGlyZWN0IDY0IGJpdCAgKi8KLSNkZWZpbmUgUl9YODZfNjRfUEMzMgkJMgkvKiBQQyByZWxh
dGl2ZSAzMiBiaXQgc2lnbmVkICovCi0jZGVmaW5lIFJfWDg2XzY0X0dPVDMyCQkzCS8qIDMyIGJp
dCBHT1QgZW50cnkgKi8KLSNkZWZpbmUgUl9YODZfNjRfUExUMzIJCTQJLyogMzIgYml0IFBMVCBh
ZGRyZXNzICovCi0jZGVmaW5lIFJfWDg2XzY0X0NPUFkJCTUJLyogQ29weSBzeW1ib2wgYXQgcnVu
dGltZSAqLwotI2RlZmluZSBSX1g4Nl82NF9HTE9CX0RBVAk2CS8qIENyZWF0ZSBHT1QgZW50cnkg
Ki8KLSNkZWZpbmUgUl9YODZfNjRfSlVNUF9TTE9UCTcJLyogQ3JlYXRlIFBMVCBlbnRyeSAqLwot
I2RlZmluZSBSX1g4Nl82NF9SRUxBVElWRQk4CS8qIEFkanVzdCBieSBwcm9ncmFtIGJhc2UgKi8K
LSNkZWZpbmUgUl9YODZfNjRfR09UUENSRUwJOQkvKiAzMiBiaXQgc2lnbmVkIHBjIHJlbGF0aXZl
Ci0JCQkJCSAgIG9mZnNldCB0byBHT1QgKi8KLSNkZWZpbmUgUl9YODZfNjRfMzIJCTEwCS8qIERp
cmVjdCAzMiBiaXQgemVybyBleHRlbmRlZCAqLwotI2RlZmluZSBSX1g4Nl82NF8zMlMJCTExCS8q
IERpcmVjdCAzMiBiaXQgc2lnbiBleHRlbmRlZCAqLwotI2RlZmluZSBSX1g4Nl82NF8xNgkJMTIJ
LyogRGlyZWN0IDE2IGJpdCB6ZXJvIGV4dGVuZGVkICovCi0jZGVmaW5lIFJfWDg2XzY0X1BDMTYJ
CTEzCS8qIDE2IGJpdCBzaWduIGV4dGVuZGVkIHBjIHJlbGF0aXZlICovCi0jZGVmaW5lIFJfWDg2
XzY0XzgJCTE0CS8qIERpcmVjdCA4IGJpdCBzaWduIGV4dGVuZGVkICAqLwotI2RlZmluZSBSX1g4
Nl82NF9QQzgJCTE1CS8qIDggYml0IHNpZ24gZXh0ZW5kZWQgcGMgcmVsYXRpdmUgKi8KLSNkZWZp
bmUgUl9YODZfNjRfUEM2NAkJMjQJLyogUGxhY2UgcmVsYXRpdmUgNjQtYml0IHNpZ25lZCAqLwot
CiAvKgogICogVGhlc2UgYXJlIHVzZWQgdG8gc2V0IHBhcmFtZXRlcnMgaW4gdGhlIGNvcmUgZHVt
cHMuCiAgKi8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L3VtL2FzbS9lbGYuaCBiL2FyY2gveDg2L3Vt
L2FzbS9lbGYuaAppbmRleCAyMmQwMTExYjU0M2IuLmI3Njg0OTdkNWVlMSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYvdW0vYXNtL2VsZi5oCisrKyBiL2FyY2gveDg2L3VtL2FzbS9lbGYuaApAQCAtMTIs
MTkgKzEyLDYgQEAKIAogI2lmZGVmIENPTkZJR19YODZfMzIKIAotI2RlZmluZSBSXzM4Nl9OT05F
CTAKLSNkZWZpbmUgUl8zODZfMzIJMQotI2RlZmluZSBSXzM4Nl9QQzMyCTIKLSNkZWZpbmUgUl8z
ODZfR09UMzIJMwotI2RlZmluZSBSXzM4Nl9QTFQzMgk0Ci0jZGVmaW5lIFJfMzg2X0NPUFkJNQot
I2RlZmluZSBSXzM4Nl9HTE9CX0RBVAk2Ci0jZGVmaW5lIFJfMzg2X0pNUF9TTE9UCTcKLSNkZWZp
bmUgUl8zODZfUkVMQVRJVkUJOAotI2RlZmluZSBSXzM4Nl9HT1RPRkYJOQotI2RlZmluZSBSXzM4
Nl9HT1RQQwkxMAotI2RlZmluZSBSXzM4Nl9OVU0JMTEKLQogLyoKICAqIFRoaXMgaXMgdXNlZCB0
byBlbnN1cmUgd2UgZG9uJ3QgbG9hZCBzb21ldGhpbmcgZm9yIHRoZSB3cm9uZyBhcmNoaXRlY3R1
cmUuCiAgKi8KQEAgLTcyLDI2ICs1OSw2IEBACiAKICNlbHNlCiAKLS8qIHg4Ni02NCByZWxvY2F0
aW9uIHR5cGVzLCB0YWtlbiBmcm9tIGFzbS14ODZfNjQvZWxmLmggKi8KLSNkZWZpbmUgUl9YODZf
NjRfTk9ORQkJMAkvKiBObyByZWxvYyAqLwotI2RlZmluZSBSX1g4Nl82NF82NAkJMQkvKiBEaXJl
Y3QgNjQgYml0ICAqLwotI2RlZmluZSBSX1g4Nl82NF9QQzMyCQkyCS8qIFBDIHJlbGF0aXZlIDMy
IGJpdCBzaWduZWQgKi8KLSNkZWZpbmUgUl9YODZfNjRfR09UMzIJCTMJLyogMzIgYml0IEdPVCBl
bnRyeSAqLwotI2RlZmluZSBSX1g4Nl82NF9QTFQzMgkJNAkvKiAzMiBiaXQgUExUIGFkZHJlc3Mg
Ki8KLSNkZWZpbmUgUl9YODZfNjRfQ09QWQkJNQkvKiBDb3B5IHN5bWJvbCBhdCBydW50aW1lICov
Ci0jZGVmaW5lIFJfWDg2XzY0X0dMT0JfREFUCTYJLyogQ3JlYXRlIEdPVCBlbnRyeSAqLwotI2Rl
ZmluZSBSX1g4Nl82NF9KVU1QX1NMT1QJNwkvKiBDcmVhdGUgUExUIGVudHJ5ICovCi0jZGVmaW5l
IFJfWDg2XzY0X1JFTEFUSVZFCTgJLyogQWRqdXN0IGJ5IHByb2dyYW0gYmFzZSAqLwotI2RlZmlu
ZSBSX1g4Nl82NF9HT1RQQ1JFTAk5CS8qIDMyIGJpdCBzaWduZWQgcGMgcmVsYXRpdmUKLQkJCQkJ
ICAgb2Zmc2V0IHRvIEdPVCAqLwotI2RlZmluZSBSX1g4Nl82NF8zMgkJMTAJLyogRGlyZWN0IDMy
IGJpdCB6ZXJvIGV4dGVuZGVkICovCi0jZGVmaW5lIFJfWDg2XzY0XzMyUwkJMTEJLyogRGlyZWN0
IDMyIGJpdCBzaWduIGV4dGVuZGVkICovCi0jZGVmaW5lIFJfWDg2XzY0XzE2CQkxMgkvKiBEaXJl
Y3QgMTYgYml0IHplcm8gZXh0ZW5kZWQgKi8KLSNkZWZpbmUgUl9YODZfNjRfUEMxNgkJMTMJLyog
MTYgYml0IHNpZ24gZXh0ZW5kZWQgcGMgcmVsYXRpdmUgKi8KLSNkZWZpbmUgUl9YODZfNjRfOAkJ
MTQJLyogRGlyZWN0IDggYml0IHNpZ24gZXh0ZW5kZWQgICovCi0jZGVmaW5lIFJfWDg2XzY0X1BD
OAkJMTUJLyogOCBiaXQgc2lnbiBleHRlbmRlZCBwYyByZWxhdGl2ZSAqLwotI2RlZmluZSBSX1g4
Nl82NF9QQzY0CQkyNAkvKiBQbGFjZSByZWxhdGl2ZSA2NC1iaXQgc2lnbmVkICovCi0KIC8qCiAg
KiBUaGlzIGlzIHVzZWQgdG8gZW5zdXJlIHdlIGRvbid0IGxvYWQgc29tZXRoaW5nIGZvciB0aGUg
d3JvbmcgYXJjaGl0ZWN0dXJlLgogICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgv
ZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCmluZGV4IDJjMzgyYzhhNDgwNy4u
NDVhMTYwZWNmNDA1IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaAorKysg
Yi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaApAQCAtMiw0ICsyLDM4IEBACiAjaWZuZGVmIF9V
QVBJX0xJTlVYX0VMRl9SX0gKICNkZWZpbmUgX1VBUElfTElOVVhfRUxGX1JfSAogCisvKiBpMzg2
IHJlbG9jYXRpb24gdHlwZXMgKi8KKyNkZWZpbmUgUl8zODZfTk9ORQkwCisjZGVmaW5lIFJfMzg2
XzMyCTEKKyNkZWZpbmUgUl8zODZfUEMzMgkyCisjZGVmaW5lIFJfMzg2X0dPVDMyCTMKKyNkZWZp
bmUgUl8zODZfUExUMzIJNAorI2RlZmluZSBSXzM4Nl9DT1BZCTUKKyNkZWZpbmUgUl8zODZfR0xP
Ql9EQVQJNgorI2RlZmluZSBSXzM4Nl9KTVBfU0xPVAk3CisjZGVmaW5lIFJfMzg2X1JFTEFUSVZF
CTgKKyNkZWZpbmUgUl8zODZfR09UT0ZGCTkKKyNkZWZpbmUgUl8zODZfR09UUEMJMTAKKyNkZWZp
bmUgUl8zODZfTlVNCTExCisKKy8qIHg4Ni02NCByZWxvY2F0aW9uIHR5cGVzICovCisjZGVmaW5l
IFJfWDg2XzY0X05PTkUJCTAJLyogTm8gcmVsb2MgKi8KKyNkZWZpbmUgUl9YODZfNjRfNjQJCTEJ
LyogRGlyZWN0IDY0IGJpdCAgKi8KKyNkZWZpbmUgUl9YODZfNjRfUEMzMgkJMgkvKiBQQyByZWxh
dGl2ZSAzMiBiaXQgc2lnbmVkICovCisjZGVmaW5lIFJfWDg2XzY0X0dPVDMyCQkzCS8qIDMyIGJp
dCBHT1QgZW50cnkgKi8KKyNkZWZpbmUgUl9YODZfNjRfUExUMzIJCTQJLyogMzIgYml0IFBMVCBh
ZGRyZXNzICovCisjZGVmaW5lIFJfWDg2XzY0X0NPUFkJCTUJLyogQ29weSBzeW1ib2wgYXQgcnVu
dGltZSAqLworI2RlZmluZSBSX1g4Nl82NF9HTE9CX0RBVAk2CS8qIENyZWF0ZSBHT1QgZW50cnkg
Ki8KKyNkZWZpbmUgUl9YODZfNjRfSlVNUF9TTE9UCTcJLyogQ3JlYXRlIFBMVCBlbnRyeSAqLwor
I2RlZmluZSBSX1g4Nl82NF9SRUxBVElWRQk4CS8qIEFkanVzdCBieSBwcm9ncmFtIGJhc2UgKi8K
KyNkZWZpbmUgUl9YODZfNjRfR09UUENSRUwJOQkvKiAzMiBiaXQgc2lnbmVkIHBjIHJlbGF0aXZl
CisJCQkJCSAgIG9mZnNldCB0byBHT1QgKi8KKyNkZWZpbmUgUl9YODZfNjRfMzIJCTEwCS8qIERp
cmVjdCAzMiBiaXQgemVybyBleHRlbmRlZCAqLworI2RlZmluZSBSX1g4Nl82NF8zMlMJCTExCS8q
IERpcmVjdCAzMiBiaXQgc2lnbiBleHRlbmRlZCAqLworI2RlZmluZSBSX1g4Nl82NF8xNgkJMTIJ
LyogRGlyZWN0IDE2IGJpdCB6ZXJvIGV4dGVuZGVkICovCisjZGVmaW5lIFJfWDg2XzY0X1BDMTYJ
CTEzCS8qIDE2IGJpdCBzaWduIGV4dGVuZGVkIHBjIHJlbGF0aXZlICovCisjZGVmaW5lIFJfWDg2
XzY0XzgJCTE0CS8qIERpcmVjdCA4IGJpdCBzaWduIGV4dGVuZGVkICAqLworI2RlZmluZSBSX1g4
Nl82NF9QQzgJCTE1CS8qIDggYml0IHNpZ24gZXh0ZW5kZWQgcGMgcmVsYXRpdmUgKi8KKyNkZWZp
bmUgUl9YODZfNjRfUEM2NAkJMjQJLyogUGxhY2UgcmVsYXRpdmUgNjQtYml0IHNpZ25lZCAqLwor
CiAjZW5kaWYgLyogX1VBUElfTElOVVhfRUxGX1JfSCAqLwoKLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
