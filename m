Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEFA606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wqu6LZPw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UCm14a2s;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w3xYWjc/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6w6Ly7rdoSPwOtqO2eHOHwWsYSOPyy6GNeG2T4RvZDI=; b=Wqu6LZPwKuKWrzQijglkNPRbvf
	lyXFtIHfDZgVf3yEkWSIFKc40EFY8HRoJgUEfHpm2IWWWUFpeMHaO97fR0MTblQ66PiutSFj6s9pp
	GcCE4pa3to3Rs7e78Gtn3wOSre+INiLUUD3QIkGP4glP2hi9GSrmc24arjVExfZyEGvJWbCWxKuO3
	l7CxBJlmkpKiT6vGEDFQoOaDd4vemBWuAnGorDaY6aLwBaOxmFfU4j6eeNRmVGolBWCd9o3LZe1IG
	cddv3umH73ju9UHNBRgAmbELfKTpXslM2Z1VGurFHGcN/eiDTyM+jxyoGU8ky/coy9KDIBYSWaePQ
	zNZDZa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSU-00000003eVf-0rqE;
	Mon, 23 Nov 2026 13:51:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSB-00000003e68-45F0;
	Mon, 23 Nov 2026 13:51:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL+8fambt78mNwxisCMhwkZMR57QQ7cEApXVSlXue4o=;
	b=UCm14a2suDs4pglh8w+qnsBPKHLeHEFC0aBs4NmigP6scFBtkIBI/J6Fg7MNuiMQhyTM84
	fQ+UajBr1ZU1X13z/umg63so5OJp3sbMrvDox5uKCNPuS1dj4xkFcpSyEOsXMM9cy1Lam4
	yjoxyI30e+h+b71QsNArfMY8uEzy/AP0E+igPdPiFyoSAM458qSa9hfZ+WTPM/pBe0Xi5C
	v32oooJ95Ijl2sbbCXNxwvmAEX1bhzY+uCaZjFsMVpWnhAJKrFusuWTcOV9rGSM0UScVIU
	ZLDXXSOEG6KSPcy5pvDupgSxblKovbmtNRF1cKinji+SxcyCRx0FY/n/o0hzWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL+8fambt78mNwxisCMhwkZMR57QQ7cEApXVSlXue4o=;
	b=w3xYWjc/sYaSNu5XMDIPl7PAUmBCHykHgym1hc8u00qkkIuNdJwoDEbQ3S05B7NDPjjFmP
	gLfAq7cUJUz9LlDA==
Date: Mon, 23 Nov 2026 14:50:59 +0100
Subject: [PATCH v6 08/11] s390/vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-8-161e218dd217@linutronix.de>
References: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
In-Reply-To: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
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
 Peter Zijlstra <peterz@infradead.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2267;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xAP5SBnE09iOs673j2X7juaBIh0SLYiSMvwxkvPBF8o=;
 b=pI1N3G+K/qs+GYoFHKTpDU9NLx4R70uPYtkOIAyTuD9UqHJwhtrgkO/1BhWuPvWT4X5KlRgJp
 W+/m5LTSDZoAvCxD8B1rriBO/48yR/a+uEqS8LfMyLjk45rPOG9PDUH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055134_945569_F00531F9 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHZkc29jaGVjayB0b29sIHZhbGlkYXRlcyB0aGUgb2JqZWN0IGZpbGVzIGFuZCBmaW5hbCAu
c28gbGlicmFyeS4KSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxvY2F0
aW9ucyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCndpdGggdGhlIHZEU08gd2hpY2ggbmVlZCB0byBi
ZSB3b3JrZWQgYXJvdW5kLgoKV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIGFyY2gvczM5MC9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwogYXJjaC9zMzkw
L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgNCArKy0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgICAgfCA5ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9LY29uZmlnIGIvYXJjaC9zMzkw
L0tjb25maWcKaW5kZXggNzEzOGQ5MjNkODZmLi43MWE2MTQ4MzI4ODYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvczM5MC9LY29uZmlnCisrKyBiL2FyY2gvczM5MC9LY29uZmlnCkBAIC0yODksNiArMjg5LDcg
QEAgY29uZmlnIFMzOTAKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBU
VFkKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQKKwlzZWxlY3QgVkRTT19DSEVDSwog
CXNlbGVjdCBWRFNPX0dFVFJBTkRPTQogCXNlbGVjdCBWSVJUX0NQVV9BQ0NPVU5USU5HCiAJc2Vs
ZWN0IFZNQVBfU1RBQ0sKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmls
ZSBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmlsZQppbmRleCA1NGJjZjI5ODRjYTEuLjZi
YzJiN2JmZmQ4OSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC92ZHNvL01ha2VmaWxlCisr
KyBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmlsZQpAQCAtNDUsMTAgKzQ1LDEwIEBAIENQ
UEZMQUdTX3Zkc28ubGRzICs9IC1QIC1DIC1VJChBUkNIKQogJChvYmopL3Zkc29fd3JhcHBlci5v
IDogJChvYmopL3Zkc28uc28KIAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAk
QAotICAgICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfbGQpOyAkKGNtZF92ZHNvX2NoZWNr
KQorICAgICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfbGRfdmRzbyk7ICQoY21kX3Zkc29f
Y2hlY2spCiAKICMgbGluayBydWxlIGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZp
cnN0Ci0kKG9iaikvdmRzby5zby5kYmc6ICQob2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSAkKG9i
ai1jdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQob2Jq
LXZkc28pICQob2JqLWN2ZHNvKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdl
ZCx2ZHNvX2FuZF9jaGVjaykKIAogIyBzdHJpcCBydWxlIGZvciB0aGUgLnNvIGZpbGUKZGlmZiAt
LWdpdCBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29j
aGVjay5ycwppbmRleCA3OTUyYWQ2YmE3MmIuLjFlZjNmMjQwZjg4NiAxMDA2NDQKLS0tIGEvbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5y
cwpAQCAtMTQ4LDYgKzE0OCwxNSBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5l
KG1hY2hpbmU6IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAg
ICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAg
ICAgICBiaW5kaW5nczo6RU1fUzM5MCA9PiBBbGxvd2VkUmVsb2NhdGlvbnMgeworICAgICAgICAg
ICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAgNSwgIC8qIFJfMzkwX1BDMzIg
Ki8KKyAgICAgICAgICAgICAgICAxOSwgLyogUl8zOTBfUEMzMkRCTCAqLworICAgICAgICAgICAg
ICAgIDIwLCAvKiBSXzM5MF9QTFQzMkRCTCAqLworICAgICAgICAgICAgXSwKKyAgICAgICAgICAg
IC4uRGVmYXVsdDo6ZGVmYXVsdCgpCisgICAgICAgIH0KKyAgICAgICAgLmludG8oKSwKICAgICAg
ICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0tIAoyLjU2LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
