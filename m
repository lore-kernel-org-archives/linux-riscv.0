Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35AECA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FVbltwWWqQH0AhbXIcxx86Zm++U6z+ikw6VeP7MkZ0=; b=nEZjkhCs88AtSk
	1zvrAvWThuwWfrbWLjNxL1Izg2ZeNSvt0DL5HI8v+8BWhL1xu5x8C1ljG5PVtsy6bdqf5dS0hwo2E
	iEhU/vp44AKCUsf5Vb8RRAGcZIIrOY9r4oWqikZL3yYHMYRRNTUEWr06mcwsNyVY3lMBh5FVMN2L+
	gX/wfTQdc6ejt/Y0mTFzZtdvpHqkjDo4mqpgi4kVwG7b4o6Yf/W85rC03UTAP8JCODJcoBfTIIjRX
	KGjFLOP+Cy4zfrnD/aEdLdAFE8hzd2+s9jj5DSvGU56yu6s6S9sK0pN9DNwz/+12xjeeOyTzr2oqR
	hNMIjqqblsu6n1VoB+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoT-00000009uwZ-2sKO;
	Tue, 12 Aug 2025 05:44:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoG-00000009uhx-39Tm;
	Tue, 12 Aug 2025 05:44:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fbs+jreI++pzzR3zWEjWTxnX9u6RnqE0RQf6GOU1NY=;
	b=wFb0RLzjRR+m6XuM7TOWlo2yvCJnPhA+25xIrhYVyQU7vW3qK3ogLB5/FoNBtbGXFhaQKY
	pr4aI4RliMtnnHAuihu1YwOpPa1YAFE6NNdNYTDGqtqXIgkvCGwOYClR54N7bodbqmR8ib
	3FR59W6tTyZySeu5nec68ShzfSWdVtepYdrHKuUMyY5PDvLGMSfolpeOUlC1s249oPH+6P
	/nNoPZTWkgEcLEgiFvoUsib1/knAtoR53VJtqoUm2UIq7TEvFyRcp1/WlztCfeuCCPyn1R
	c9ok2s6GcRDtHFeAJPnrNr3pTIJwl25pnQginm0asRgcm/Y3wFJdfZ+h1y1MIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fbs+jreI++pzzR3zWEjWTxnX9u6RnqE0RQf6GOU1NY=;
	b=qsESN/r84WX54Bw78PaDXL3DZH9tinqCzw/9z447eYrhrk5rauDW2NqzQLxz4cWxfapa1Y
	nlSHAbkBNOdd0fAw==
Date: Tue, 12 Aug 2025 07:44:15 +0200
Subject: [PATCH v4 02/24] x86/elf, um/x86/elf: Move relocation constants to
 UAPI
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-2-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=6035;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1uMAsIGnLSAarJHPAhyn1ZCQ7+laGQoWKQA2Xxq0mGY=;
 b=LSso+CtnXCvSqq7w3arcGFjj/9JO1wvGscYCVoeDZOhj/IpFN3GTrmCLD7/dVw71XSDOqEtKb
 ryK7StfnfXPByrB7+MMfsCwMUX3kib3KkE19P5uuPZjIm2SN2cxtCaS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224432_935195_EEF1DC40 
X-CRM114-Status: GOOD (  12.47  )
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
bHVkZS9hc20vZWxmLmggfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBh
cmNoL3g4Ni91bS9hc20vZWxmLmggICAgICB8IDMzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggfCAzNCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDY3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VsZi5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vZWxmLmgKaW5kZXggNmM4ZmRjOTZiZTdlOGJkMzM5MTlkOWI1
NmFlOGE4YTY4ZjRiMGMzZi4uYTI1Mzg1NjFhODRiOGRhZTA0NzljNDMyMzhmNmYyOTdmZTg4OTI0
YiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vZWxmLmgKKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vZWxmLmgKQEAgLTIyLDE5ICsyMiw2IEBAIHR5cGVkZWYgc3RydWN0IHVzZXJf
aTM4N19zdHJ1Y3QgZWxmX2ZwcmVnc2V0X3Q7CiAKICNpZmRlZiBfX2kzODZfXwogCi0jZGVmaW5l
IFJfMzg2X05PTkUJMAotI2RlZmluZSBSXzM4Nl8zMgkxCi0jZGVmaW5lIFJfMzg2X1BDMzIJMgot
I2RlZmluZSBSXzM4Nl9HT1QzMgkzCi0jZGVmaW5lIFJfMzg2X1BMVDMyCTQKLSNkZWZpbmUgUl8z
ODZfQ09QWQk1Ci0jZGVmaW5lIFJfMzg2X0dMT0JfREFUCTYKLSNkZWZpbmUgUl8zODZfSk1QX1NM
T1QJNwotI2RlZmluZSBSXzM4Nl9SRUxBVElWRQk4Ci0jZGVmaW5lIFJfMzg2X0dPVE9GRgk5Ci0j
ZGVmaW5lIFJfMzg2X0dPVFBDCTEwCi0jZGVmaW5lIFJfMzg2X05VTQkxMQotCiAvKgogICogVGhl
c2UgYXJlIHVzZWQgdG8gc2V0IHBhcmFtZXRlcnMgaW4gdGhlIGNvcmUgZHVtcHMuCiAgKi8KQEAg
LTQ0LDI3ICszMSw2IEBAIHR5cGVkZWYgc3RydWN0IHVzZXJfaTM4N19zdHJ1Y3QgZWxmX2ZwcmVn
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
IG9mZnNldCB0byBHT1QgKi8KLSNkZWZpbmUgUl9YODZfNjRfR09UUENSRUxYCTQxCi0jZGVmaW5l
IFJfWDg2XzY0X1JFWF9HT1RQQ1JFTFgJNDIKLSNkZWZpbmUgUl9YODZfNjRfMzIJCTEwCS8qIERp
cmVjdCAzMiBiaXQgemVybyBleHRlbmRlZCAqLwotI2RlZmluZSBSX1g4Nl82NF8zMlMJCTExCS8q
IERpcmVjdCAzMiBiaXQgc2lnbiBleHRlbmRlZCAqLwotI2RlZmluZSBSX1g4Nl82NF8xNgkJMTIJ
LyogRGlyZWN0IDE2IGJpdCB6ZXJvIGV4dGVuZGVkICovCi0jZGVmaW5lIFJfWDg2XzY0X1BDMTYJ
CTEzCS8qIDE2IGJpdCBzaWduIGV4dGVuZGVkIHBjIHJlbGF0aXZlICovCi0jZGVmaW5lIFJfWDg2
XzY0XzgJCTE0CS8qIERpcmVjdCA4IGJpdCBzaWduIGV4dGVuZGVkICAqLwotI2RlZmluZSBSX1g4
Nl82NF9QQzgJCTE1CS8qIDggYml0IHNpZ24gZXh0ZW5kZWQgcGMgcmVsYXRpdmUgKi8KLSNkZWZp
bmUgUl9YODZfNjRfUEM2NAkJMjQJLyogUGxhY2UgcmVsYXRpdmUgNjQtYml0IHNpZ25lZCAqLwot
CiAvKgogICogVGhlc2UgYXJlIHVzZWQgdG8gc2V0IHBhcmFtZXRlcnMgaW4gdGhlIGNvcmUgZHVt
cHMuCiAgKi8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L3VtL2FzbS9lbGYuaCBiL2FyY2gveDg2L3Vt
L2FzbS9lbGYuaAppbmRleCA2MmVkNWQ2OGE5Nzg4ZmZiZjlkZDBiNGViYmUyY2FhZDRhYzdhN2M2
Li4yZTc5MTkzZjM5NmNkYTg1NGFiNGYxN2FmMmNkNWIxNWMxZTA3OGNkIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni91bS9hc20vZWxmLmgKKysrIGIvYXJjaC94ODYvdW0vYXNtL2VsZi5oCkBAIC0xMiwx
OSArMTIsNiBAQAogCiAjaWZkZWYgQ09ORklHX1g4Nl8zMgogCi0jZGVmaW5lIFJfMzg2X05PTkUJ
MAotI2RlZmluZSBSXzM4Nl8zMgkxCi0jZGVmaW5lIFJfMzg2X1BDMzIJMgotI2RlZmluZSBSXzM4
Nl9HT1QzMgkzCi0jZGVmaW5lIFJfMzg2X1BMVDMyCTQKLSNkZWZpbmUgUl8zODZfQ09QWQk1Ci0j
ZGVmaW5lIFJfMzg2X0dMT0JfREFUCTYKLSNkZWZpbmUgUl8zODZfSk1QX1NMT1QJNwotI2RlZmlu
ZSBSXzM4Nl9SRUxBVElWRQk4Ci0jZGVmaW5lIFJfMzg2X0dPVE9GRgk5Ci0jZGVmaW5lIFJfMzg2
X0dPVFBDCTEwCi0jZGVmaW5lIFJfMzg2X05VTQkxMQotCiAvKgogICogVGhpcyBpcyB1c2VkIHRv
IGVuc3VyZSB3ZSBkb24ndCBsb2FkIHNvbWV0aGluZyBmb3IgdGhlIHdyb25nIGFyY2hpdGVjdHVy
ZS4KICAqLwpAQCAtMTAwLDI2ICs4Nyw2IEBAIGRvIHsJCQkJCQkJCVwKIAogI2Vsc2UKIAotLyog
eDg2LTY0IHJlbG9jYXRpb24gdHlwZXMsIHRha2VuIGZyb20gYXNtLXg4Nl82NC9lbGYuaCAqLwot
I2RlZmluZSBSX1g4Nl82NF9OT05FCQkwCS8qIE5vIHJlbG9jICovCi0jZGVmaW5lIFJfWDg2XzY0
XzY0CQkxCS8qIERpcmVjdCA2NCBiaXQgICovCi0jZGVmaW5lIFJfWDg2XzY0X1BDMzIJCTIJLyog
UEMgcmVsYXRpdmUgMzIgYml0IHNpZ25lZCAqLwotI2RlZmluZSBSX1g4Nl82NF9HT1QzMgkJMwkv
KiAzMiBiaXQgR09UIGVudHJ5ICovCi0jZGVmaW5lIFJfWDg2XzY0X1BMVDMyCQk0CS8qIDMyIGJp
dCBQTFQgYWRkcmVzcyAqLwotI2RlZmluZSBSX1g4Nl82NF9DT1BZCQk1CS8qIENvcHkgc3ltYm9s
IGF0IHJ1bnRpbWUgKi8KLSNkZWZpbmUgUl9YODZfNjRfR0xPQl9EQVQJNgkvKiBDcmVhdGUgR09U
IGVudHJ5ICovCi0jZGVmaW5lIFJfWDg2XzY0X0pVTVBfU0xPVAk3CS8qIENyZWF0ZSBQTFQgZW50
cnkgKi8KLSNkZWZpbmUgUl9YODZfNjRfUkVMQVRJVkUJOAkvKiBBZGp1c3QgYnkgcHJvZ3JhbSBi
YXNlICovCi0jZGVmaW5lIFJfWDg2XzY0X0dPVFBDUkVMCTkJLyogMzIgYml0IHNpZ25lZCBwYyBy
ZWxhdGl2ZQotCQkJCQkgICBvZmZzZXQgdG8gR09UICovCi0jZGVmaW5lIFJfWDg2XzY0XzMyCQkx
MAkvKiBEaXJlY3QgMzIgYml0IHplcm8gZXh0ZW5kZWQgKi8KLSNkZWZpbmUgUl9YODZfNjRfMzJT
CQkxMQkvKiBEaXJlY3QgMzIgYml0IHNpZ24gZXh0ZW5kZWQgKi8KLSNkZWZpbmUgUl9YODZfNjRf
MTYJCTEyCS8qIERpcmVjdCAxNiBiaXQgemVybyBleHRlbmRlZCAqLwotI2RlZmluZSBSX1g4Nl82
NF9QQzE2CQkxMwkvKiAxNiBiaXQgc2lnbiBleHRlbmRlZCBwYyByZWxhdGl2ZSAqLwotI2RlZmlu
ZSBSX1g4Nl82NF84CQkxNAkvKiBEaXJlY3QgOCBiaXQgc2lnbiBleHRlbmRlZCAgKi8KLSNkZWZp
bmUgUl9YODZfNjRfUEM4CQkxNQkvKiA4IGJpdCBzaWduIGV4dGVuZGVkIHBjIHJlbGF0aXZlICov
Ci0jZGVmaW5lIFJfWDg2XzY0X1BDNjQJCTI0CS8qIFBsYWNlIHJlbGF0aXZlIDY0LWJpdCBzaWdu
ZWQgKi8KLQogLyoKICAqIFRoaXMgaXMgdXNlZCB0byBlbnN1cmUgd2UgZG9uJ3QgbG9hZCBzb21l
dGhpbmcgZm9yIHRoZSB3cm9uZyBhcmNoaXRlY3R1cmUuCiAgKi8KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5kZXgg
MmMzODJjOGE0ODA3ZjM5NGEzY2NhYmYzOWE4MWU5ZTliNmY3ZWE0NS4uNDVhMTYwZWNmNDA1NzBm
M2FjOTE2MzQ0YmUzNjNkN2U3NDkwOGVhNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L2VsZi1yLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKQEAgLTIsNCArMiwzOCBA
QAogI2lmbmRlZiBfVUFQSV9MSU5VWF9FTEZfUl9ICiAjZGVmaW5lIF9VQVBJX0xJTlVYX0VMRl9S
X0gKIAorLyogaTM4NiByZWxvY2F0aW9uIHR5cGVzICovCisjZGVmaW5lIFJfMzg2X05PTkUJMAor
I2RlZmluZSBSXzM4Nl8zMgkxCisjZGVmaW5lIFJfMzg2X1BDMzIJMgorI2RlZmluZSBSXzM4Nl9H
T1QzMgkzCisjZGVmaW5lIFJfMzg2X1BMVDMyCTQKKyNkZWZpbmUgUl8zODZfQ09QWQk1CisjZGVm
aW5lIFJfMzg2X0dMT0JfREFUCTYKKyNkZWZpbmUgUl8zODZfSk1QX1NMT1QJNworI2RlZmluZSBS
XzM4Nl9SRUxBVElWRQk4CisjZGVmaW5lIFJfMzg2X0dPVE9GRgk5CisjZGVmaW5lIFJfMzg2X0dP
VFBDCTEwCisjZGVmaW5lIFJfMzg2X05VTQkxMQorCisvKiB4ODYtNjQgcmVsb2NhdGlvbiB0eXBl
cyAqLworI2RlZmluZSBSX1g4Nl82NF9OT05FCQkwCS8qIE5vIHJlbG9jICovCisjZGVmaW5lIFJf
WDg2XzY0XzY0CQkxCS8qIERpcmVjdCA2NCBiaXQgICovCisjZGVmaW5lIFJfWDg2XzY0X1BDMzIJ
CTIJLyogUEMgcmVsYXRpdmUgMzIgYml0IHNpZ25lZCAqLworI2RlZmluZSBSX1g4Nl82NF9HT1Qz
MgkJMwkvKiAzMiBiaXQgR09UIGVudHJ5ICovCisjZGVmaW5lIFJfWDg2XzY0X1BMVDMyCQk0CS8q
IDMyIGJpdCBQTFQgYWRkcmVzcyAqLworI2RlZmluZSBSX1g4Nl82NF9DT1BZCQk1CS8qIENvcHkg
c3ltYm9sIGF0IHJ1bnRpbWUgKi8KKyNkZWZpbmUgUl9YODZfNjRfR0xPQl9EQVQJNgkvKiBDcmVh
dGUgR09UIGVudHJ5ICovCisjZGVmaW5lIFJfWDg2XzY0X0pVTVBfU0xPVAk3CS8qIENyZWF0ZSBQ
TFQgZW50cnkgKi8KKyNkZWZpbmUgUl9YODZfNjRfUkVMQVRJVkUJOAkvKiBBZGp1c3QgYnkgcHJv
Z3JhbSBiYXNlICovCisjZGVmaW5lIFJfWDg2XzY0X0dPVFBDUkVMCTkJLyogMzIgYml0IHNpZ25l
ZCBwYyByZWxhdGl2ZQorCQkJCQkgICBvZmZzZXQgdG8gR09UICovCisjZGVmaW5lIFJfWDg2XzY0
XzMyCQkxMAkvKiBEaXJlY3QgMzIgYml0IHplcm8gZXh0ZW5kZWQgKi8KKyNkZWZpbmUgUl9YODZf
NjRfMzJTCQkxMQkvKiBEaXJlY3QgMzIgYml0IHNpZ24gZXh0ZW5kZWQgKi8KKyNkZWZpbmUgUl9Y
ODZfNjRfMTYJCTEyCS8qIERpcmVjdCAxNiBiaXQgemVybyBleHRlbmRlZCAqLworI2RlZmluZSBS
X1g4Nl82NF9QQzE2CQkxMwkvKiAxNiBiaXQgc2lnbiBleHRlbmRlZCBwYyByZWxhdGl2ZSAqLwor
I2RlZmluZSBSX1g4Nl82NF84CQkxNAkvKiBEaXJlY3QgOCBiaXQgc2lnbiBleHRlbmRlZCAgKi8K
KyNkZWZpbmUgUl9YODZfNjRfUEM4CQkxNQkvKiA4IGJpdCBzaWduIGV4dGVuZGVkIHBjIHJlbGF0
aXZlICovCisjZGVmaW5lIFJfWDg2XzY0X1BDNjQJCTI0CS8qIFBsYWNlIHJlbGF0aXZlIDY0LWJp
dCBzaWduZWQgKi8KKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VMRl9SX0ggKi8KCi0tIAoyLjUw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
