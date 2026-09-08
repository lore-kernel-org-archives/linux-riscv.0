Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE8DC79FAC
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZykocFRKCF1UcpCGw4f5S8VvrXpvuU+LmK+vag9xOv8=; b=0xA3kPSwLPxuD3
	zVQBSbpaZZE0P7DmQ/Fr1MCnCH+ivZK6j2R1n+KBgupdDY26SIgMZdfg4xX8np8l+tDfxzoxjQlSS
	i2k9jyI7coJE963vdcvI5AXSMGxi7xQWBYGDC3tq/u2F00K50YzOjyh3wdUXHERDPmlSpnooJg6yP
	gr1hrdqgxuYkM3SicxsH1YdIzXnzzdChvDdUW8ybmc99U2vzKYUYft9QCNmEflTmtkTgm7c6tp96J
	N6Ukqn2dDcH13l1aE446/8HA0E2mY6b7FKzRE0FkRu1tkgsPT/venJI7Sj+bheePgjsSD2Ovwbgmp
	MIftC9Gzk/toHfJUMGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPr-00000008A6b-1R70;
	Tue, 08 Sep 2026 06:34:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP8-0000000891c-0N3e;
	Tue, 08 Sep 2026 06:34:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pdi6tJcXia5GQvjWLdDYxiQ6I89enT2mzL46ZqnmdMg=;
	b=srXUKKBvBnZWl7h+1tvBv5e+AlKq5znw4KLWobhNXWNfQAuYkrwrf6qLr9sX3I376tXpaL
	0gCLK9hvRcYej1aY+vuLNUXX8k0WaaNjh/gf2Si2JH/haTjazZxULX0a5f7Yw140D5KgYT
	mY6i1JDe2y9ffdmhX61Pp10Gxy+SfEXQxM2EnqvziywLYsrgXQI8aTTmQXJNqF3Wlg/vEp
	0gaYbr4thtj8q00nsmFu9BsDc1syHcFh5c6rh+d3Wwq5S09FzqW3vh3uH+fdVp1FSM314K
	eg0gs4ury6AuRJrLxdmHGTOamuoIr50Pr/4C3keU04Rznfn+4zwCC+V/Fh4gkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pdi6tJcXia5GQvjWLdDYxiQ6I89enT2mzL46ZqnmdMg=;
	b=rW7/VoVlTLF38Sp6NbEw24XpKKO0l53Bu8vFJSSAarrgsh5+3oOcPR3GCmN8eCmuxD/xDP
	pyuyJDO6nu5wCADA==
Date: Tue, 08 Sep 2026 08:33:50 +0200
Subject: [PATCH v5 16/24] powerpc/elf: Add 32-bit REL16 relocation
 definitions
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-16-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=1737;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gDavw4WAqw6o13GhA3u/II77o40pPBvpHsDECXNhldY=;
 b=at10aJs/4BEOnHQNfCkeHcofnKffueuw1V5jX3gearAcRNXGLUowN4VA80tWswO8yBV0CJAoU
 1lBC/PMHi3vDICsSQ0DEs5CGMsAX8t5/pR4/5NVDW4dQxNWMl/dsaZv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233402_350271_E68D010E 
X-CRM114-Status: GOOD (  10.60  )
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
b2NoZWNrIHRvb2wuClRoZXkgc2hhcmUgdGhlIG51bWJlcnMgd2l0aCB0aGVpciA2NC1iaXQgdmFy
aWFudHMuCgpBbHNvIHVwZGF0ZSB0aGUgY29weSBpbiB0b29scy8gc28gdGhleSBjYW4gYmUgdXNl
ZCBieSB2ZHNvY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFz
LndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIu
aCAgICAgICB8IDcgKysrKysrLQogdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggfCA3
ICsrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFw
aS9saW51eC9lbGYtci5oCmluZGV4IDcyZmM5MDQ1YTVkNC4uMTcwODg4NDIyNDAwIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
ZWxmLXIuaApAQCAtMTgyLDggKzE4MiwxMyBAQAogI2RlZmluZSBSX1BQQ19HT1RfRFRQUkVMMTZf
SEkJOTMgLyogaGFsZjE2Kgkoc3ltK2FkZClAZ290QGR0cHJlbEBoICovCiAjZGVmaW5lIFJfUFBD
X0dPVF9EVFBSRUwxNl9IQQk5NCAvKiBoYWxmMTYqCShzeW0rYWRkKUBnb3RAZHRwcmVsQGhhICov
CiAKKyNkZWZpbmUgUl9QUENfUkVMMTYJCTI0OQorI2RlZmluZSBSX1BQQ19SRUwxNl9MTwkJMjUw
CisjZGVmaW5lIFJfUFBDX1JFTDE2X0hJCQkyNTEKKyNkZWZpbmUgUl9QUENfUkVMMTZfSEEJCTI1
MgorCiAvKiBrZWVwIHRoaXMgdGhlIGxhc3QgZW50cnkuICovCi0jZGVmaW5lIFJfUFBDX05VTQkJ
OTUKKyNkZWZpbmUgUl9QUENfTlVNCQkyNTMKIAogLyogUG93ZXJQQzY0IHJlbG9jYXRpb25zIGRl
ZmluZWQgYnkgdGhlIEFCSXMgKi8KICNkZWZpbmUgUl9QUEM2NF9OT05FICAgIFJfUFBDX05PTkUK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvdG9vbHMvaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5kZXggNzJmYzkwNDVhNWQ0Li4xNzA4ODg0MjI0MDAg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisrKyBiL3Rvb2xz
L2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC0xODIsOCArMTgyLDEzIEBACiAjZGVmaW5l
IFJfUFBDX0dPVF9EVFBSRUwxNl9ISQk5MyAvKiBoYWxmMTYqCShzeW0rYWRkKUBnb3RAZHRwcmVs
QGggKi8KICNkZWZpbmUgUl9QUENfR09UX0RUUFJFTDE2X0hBCTk0IC8qIGhhbGYxNioJKHN5bSth
ZGQpQGdvdEBkdHByZWxAaGEgKi8KIAorI2RlZmluZSBSX1BQQ19SRUwxNgkJMjQ5CisjZGVmaW5l
IFJfUFBDX1JFTDE2X0xPCQkyNTAKKyNkZWZpbmUgUl9QUENfUkVMMTZfSEkJCTI1MQorI2RlZmlu
ZSBSX1BQQ19SRUwxNl9IQQkJMjUyCisKIC8qIGtlZXAgdGhpcyB0aGUgbGFzdCBlbnRyeS4gKi8K
LSNkZWZpbmUgUl9QUENfTlVNCQk5NQorI2RlZmluZSBSX1BQQ19OVU0JCTI1MwogCiAvKiBQb3dl
clBDNjQgcmVsb2NhdGlvbnMgZGVmaW5lZCBieSB0aGUgQUJJcyAqLwogI2RlZmluZSBSX1BQQzY0
X05PTkUgICAgUl9QUENfTk9ORQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
