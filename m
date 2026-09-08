Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDBC79FAF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO/dez7UzcVkJwnXbrBAR1v4ErvdGlH6gD6WLe7YYMc=; b=CsQatkvuiFQRKb
	0HLVtVUA3WPJYbKhMWstc0lB9exy0pftVbojF3FbRnm+4d5O7WjMlEoZZmZ1pEJcKh/Wc5tmMfO5N
	EW+P9nB6X+fRS9bhclFGyEl1o3gDEJS0+Mkdtou99YrqPKPGJ8D1k8C5dLNK2z1E18ftUe3AEJrS8
	N2QFXrR25Vgs94BW2RNYhBLE3ontzdvDrEjmxjzIrakRHyp3XNzPAdLEDNkFuPo5IC0XYkca9+h5g
	BNqWTqo1at6UoEmnJHcw6MlHGb4eNdRI8dqo31U7bYobohU+JiwLsHVrYGOmup0XhSTnw2VU0a0lh
	cA0VNXLyrtGSdF61mpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPi-000000089sg-1qx7;
	Tue, 08 Sep 2026 06:34:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP4-000000088xW-3nPt;
	Tue, 08 Sep 2026 06:34:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmuSOH1PlxKnA1sFNyVBb78Nx7lvcJxtk6uyQh9eAbo=;
	b=MJbNcbqrPXIV4MVekRibhCQzI3C+hzP+3EH4R9OzuBdd1PJ+MSUAobqW1FP7bvjy+d0i63
	nZQcOUrV6MCliZnClZqT8pq2wRrwSn6jgiyTMnu5+XxVksTmxJaG1b1+pPu8unHvuy2wBC
	BxofF/S5Die7TrXexDlzFzpSzP1uREIFOgDvLv2wHFWUeyeQ7zQPN8y20onY8ZTr1ZGpDZ
	7VAIJ29E8wEfD/0IKTZfGZnq9bYRIDS69h2jcJO8oluBA0eWh2PYptYeagtoUcDRnGeIM/
	cj7CR+3jJCS1/NopI6vTc5QAm7MHqHLBO5AkYbugodOUMCaEPNyaxk2hKv2VCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmuSOH1PlxKnA1sFNyVBb78Nx7lvcJxtk6uyQh9eAbo=;
	b=X30WsAgkstsozlHa+DC4mGpqHKVlDRk5DYwXaKpWLVIF6u35pncScYR+NtHgrl304XBqY/
	wcna4+QkMAmSkvCg==
Date: Tue, 08 Sep 2026 08:33:47 +0200
Subject: [PATCH v5 13/24] x86/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-13-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2487;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vRbc54EFTJK8Edczu3nKOvbSzT/ak7osQzTlANhwfg4=;
 b=QoGW6+1pU6UCOJIoCAQWiJdDPGXza8QAmW74TVb+TFEF4Gg6rdDkscKCRLfDPN8KjcDIG8C8F
 Q/VLV8dyYABDvGmgs7XWDfcnTFUCyodw77Rrt8RwxwTZvWyIDrh6KpE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233359_129575_CDCEAA1C 
X-CRM114-Status: GOOD (  11.04  )
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
ZSB3b3JrZWQgYXJvdW5kLgoKV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIGFyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi9NYWtlZmlsZS5pbmNsdWRlIHwgIDIgKy0K
IGxpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyAgICAgICAgICAgICAgICAgfCAxNCArKysrKysr
KysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcKaW5kZXgg
MTVmZDllYzVlY2FjLi5lZTBmMmM0MDE5ODAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L0tjb25maWcK
KysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtMzA1LDYgKzMwNSw3IEBAIGNvbmZpZyBYODYKIAlz
ZWxlY3QgSEFWRV9VTlNUQUJMRV9TQ0hFRF9DTE9DSwogCXNlbGVjdCBIQVZFX1VOV0lORF9VU0VS
X0ZQCQlpZiBYODZfNjQKIAlzZWxlY3QgSEFWRV9VU0VSX1JFVFVSTl9OT1RJRklFUgorCXNlbGVj
dCBWRFNPX0NIRUNLCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCQkJaWYgWDg2XzY0CiAJc2VsZWN0
IEhPVFBMVUdfUEFSQUxMRUwJCQlpZiBTTVAgJiYgWDg2XzY0CiAJc2VsZWN0IEhPVFBMVUdfU01U
CQkJaWYgU01QCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi9NYWtlZmls
ZS5pbmNsdWRlIGIvYXJjaC94ODYvZW50cnkvdmRzby9jb21tb24vTWFrZWZpbGUuaW5jbHVkZQpp
bmRleCA2ODdiM2Q4OWI0MGQuLjUxMGQ1ZTc5ODU3ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50
cnkvdmRzby9jb21tb24vTWFrZWZpbGUuaW5jbHVkZQorKysgYi9hcmNoL3g4Ni9lbnRyeS92ZHNv
L2NvbW1vbi9NYWtlZmlsZS5pbmNsdWRlCkBAIC03MSw3ICs3MSw3IEBAIHF1aWV0X2NtZF92ZHNv
ID0gVkRTTyAgICAkQAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAkQAogICAg
ICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spCiAK
LSQob2JqKS92ZHNvJS5zby5kYmc6ICQob2JqKS92ZHNvJS5sZHMgRk9SQ0UKKyQob2JqKS92ZHNv
JS5zby5kYmc6ICQob2JqKS92ZHNvJS5sZHMgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlm
X2NoYW5nZWQsdmRzb19hbmRfY2hlY2spCiAKICQob2JqKS8lLnNvOiBPQkpDT1BZRkxBR1MgOj0g
LVMgLS1yZW1vdmUtc2VjdGlvbiBfX2V4X3RhYmxlCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggZjRjMDcz
MGJjOTc2Li4xMTc0ZDg5NmE2OGIgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVj
ay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKQEAgLTM0LDYgKzM0LDIwIEBA
IGZuIGlzX2lnbm9yZWRfc2VjdGlvbigmc2VsZiwgc2VjdGlvbjogJmVsZjo6U2VjdGlvbjwnXz4p
IC0+IGJvb2wgewogCiBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6
IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwnc3RhdGljPj4gewogICAgIG1hdGNo
IG1hY2hpbmUgYXMgdTMyIHsKKyAgICAgICAgYmluZGluZ3M6OkVNXzM4NiA9PiBBbGxvd2VkUmVs
b2NhdGlvbnMgeworICAgICAgICAgICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAg
ICAgYmluZGluZ3M6OlJfMzg2X1BDMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfMzg2
X0dPVE9GRiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul8zODZfR09UUEMsCisgICAgICAg
ICAgICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAg
ICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1fWDg2XzY0ID0+IEFsbG93ZWRSZWxv
Y2F0aW9ucyB7CisgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTogJltiaW5kaW5nczo6Ul9YODZf
NjRfUEMzMiwgYmluZGluZ3M6OlJfWDg2XzY0X1BMVDMyXSwKKyAgICAgICAgICAgIC4uRGVmYXVs
dDo6ZGVmYXVsdCgpCisgICAgICAgIH0KKyAgICAgICAgLmludG8oKSwKICAgICAgICAgXyA9PiBO
b25lLAogICAgIH0KIH0KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
