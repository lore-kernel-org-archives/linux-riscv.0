Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69FCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9iMiMalXJnHkTBPbUWD7N3+v/6AZ2MtqmBsNLbDM3Q=; b=PYAa4kHG0B33ji
	ckdL0faIsRkU4aAgyrEfGkIg+1wq8tVDgDl3Zdin+EgFvL2KW9WGPNlPpdWzaR51GpCfKaGZndIBW
	0uWT5gGH/5uZJ4ZlLR2B+P2QAE94NoItzU1z45QtA4NRv1SqjXOFEcGGU4PfFfkDQIC7HXpEiqP/O
	yQ/Y7+Ij1PSjChOsfDZPizE7Kdga1yLHiSOfD/edRrGFhb4jDfVV/MzunNHfJuLxOsOMl2Faml5lP
	4wj0YzkEnnXMFRpsObcL9EfbEc+E0aKzka27H523zjDCeMKmimnY+l/XvPiC5nJChivieK0EqP6b0
	euBy8PqS4pzoOzykdVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulill-0000000A3OU-2DsX;
	Tue, 12 Aug 2025 06:46:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhob-00000009v6B-1GQW;
	Tue, 12 Aug 2025 05:44:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OxEAzTtqHlqZSqHBtrTk0yqq9zTf8Alol22rb21E+I=;
	b=W4p1ENmOvzhLntuYnmqtfute0yp4ze1Q3QiTPF7vb/qMHZT5SVeS3RyfuZ6SosfWMYDc0u
	JMs2EcuwR9ToS+OHSfJMxVN95EcXvMbyX+YnwaBPnk20szUrj7SZvB0qQ8Cx5Ud5jPAbu2
	bSAJPE5T0rS2fD0/jpIO5X9vO5nsQl5irPEsTaTy8WcaVOVElHdD3sISZQVcrKhBVlExNd
	qTlZX8uubN2zgJ0d7g5ExfmZvs1NHebFGWrZVOZILEEoNjXxH0F5ugP5eD9/q2m/JNoopP
	0ooTzzrCPKkGvpwsCRPbNEQKYYZENwH0BDcIHI3be78GBTu1L+fTyldKzt7yjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OxEAzTtqHlqZSqHBtrTk0yqq9zTf8Alol22rb21E+I=;
	b=QpnJaONtWulvcUFE59iWrSqLfGPXVLdmPDToQjRzK9BRDs9j+IGPmHbJrdEtNraqkyxN0t
	5141JOl9oriQWEAA==
Date: Tue, 12 Aug 2025 07:44:32 +0200
Subject: [PATCH v4 19/24] riscv: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-19-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3732;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=J1qM3HCNoG+4ABOAGIaTnVMGxz4Bh3uAYRLzvmLM14o=;
 b=SMRN/ewBWi/CqhkM5mbxFTaVrjrIEecZQJUkuNqZN8Bo84iaFqx4d2EMZvQHzBbVdI97dTqOc
 sZpouIgjOvkAwh1E9FDdFMfyd5/kLUV2gBS+vHirscTGDXTVSaTLPv6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224453_886586_8FF860A9 
X-CRM114-Status: GOOD (  13.31  )
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
LmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAgNCArKy0tCiBsaWIv
dmRzby9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEgKwogbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmls
ZQppbmRleCA5ZjFiZjViYWU5YmQ0NzNlNDNkOWZkMzAyMmU5ZTFhMTg1MTI4YjczLi4wNTcyNWE3
MmVhY2E3MGE4NjdmNTljMzUyYTYzODE0MDJlOTFjMzE3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZp
bGUKQEAgLTU4LDcgKzU4LDcgQEAgQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENGTEFHU19S
RU1PVkVfVkRTTykKICQob2JqKS92ZHNvLm86ICQob2JqKS92ZHNvLnNvCiAKICMgbGluayBydWxl
IGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZpcnN0Ci0kKG9iaikvdmRzby5zby5k
Ymc6ICQob2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSBGT1JDRQorJChvYmopL3Zkc28uc28uZGJn
OiAkKG9iaikvdmRzby5sZHMgJChvYmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxs
IGlmX2NoYW5nZWQsdmRzb2xkX2FuZF9jaGVjaykKIExERkxBR1NfdmRzby5zby5kYmcgPSAtc2hh
cmVkIC1zb25hbWU9bGludXgtdmRzby5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1laC1mcmFt
ZS1oZHIKQEAgLTgwLDcgKzgwLDcgQEAgaW5jbHVkZS9nZW5lcmF0ZWQvdmRzby1vZmZzZXRzLmg6
ICQob2JqKS92ZHNvLnNvLmRiZyBGT1JDRQogIyBUaGUgRFNPIGltYWdlcyBhcmUgYnVpbHQgdXNp
bmcgYSBzcGVjaWFsIGxpbmtlciBzY3JpcHQKICMgTWFrZSBzdXJlIG9ubHkgdG8gZXhwb3J0IHRo
ZSBpbnRlbmRlZCBfX3Zkc29feHh4IHN5bWJvbCBvZmZzZXRzLgogcXVpZXRfY21kX3Zkc29sZF9h
bmRfY2hlY2sgPSBWRFNPTEQgICRACi0gICAgICBjbWRfdmRzb2xkX2FuZF9jaGVjayA9ICQoTEQp
ICQobGRfZmxhZ3MpIC1UICQoZmlsdGVyLW91dCBGT1JDRSwkXikgLW8gJEAudG1wICYmIFwKKyAg
ICAgIGNtZF92ZHNvbGRfYW5kX2NoZWNrID0gJChMRCkgJChsZF9mbGFncykgLVQgJChmaWx0ZXIt
b3V0IEZPUkNFICQodmRzb2NoZWNrKSwkXikgLW8gJEAudG1wICYmIFwKICAgICAgICAgICAgICAg
ICAgICAkKE9CSkNPUFkpICQocGF0c3Vic3QgJSwgLUcgX192ZHNvXyUsICQodmRzby1zeW1zKSkg
JEAudG1wICRAICYmIFwKICAgICAgICAgICAgICAgICAgICBybSAkQC50bXAgJiYgXAogICAgICAg
ICAgICAgICAgICAgICQoY21kX3Zkc29fY2hlY2spCmRpZmYgLS1naXQgYS9saWIvdmRzby9LY29u
ZmlnIGIvbGliL3Zkc28vS2NvbmZpZwppbmRleCA4OTk0NDE5ZDkwZTdiNWM2NmFjNzc0NDliNmMz
YmQ5NmM5Njg5ODNkLi40NDFmZjAzZTEwMjhmN2JkZTUxMDRiZDAxOTQxYzZhOWIwMDZlMjFmIDEw
MDY0NAotLS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBiL2xpYi92ZHNvL0tjb25maWcKQEAgLTU1
LDYgKzU1LDcgQEAgY29uZmlnIEhBVkVfVkRTT0NIRUNLCiAJZGVmYXVsdCB5IGlmIEFSTQogCWRl
ZmF1bHQgeSBpZiBBUk02NAogCWRlZmF1bHQgeSBpZiBQUEMKKwlkZWZhdWx0IHkgaWYgUklTQ1YK
IAloZWxwCiAJICBTZWxlY3RlZCBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGFyZSBzdXBwb3J0ZWQg
YnkgdGhlICd2ZHNvY2hlY2snIHByb2dhbS4KIAkgIE9ubHkgdHJhbnNpdGlvbmFsLgpkaWZmIC0t
Z2l0IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzCmluZGV4IDU0MzcyYTU0N2IxY2RlMDVjMWE0NDU0YjlhMjFkZTM1N2IyMmIwZGYuLmQ0
OGM5ZGE2ZjE4MjcwYWZlODgzZDE2Nzk1NWY3M2YwNjFiOWM0NzIgMTAwNjQ0Ci0tLSBhL2xpYi92
ZHNvL2NoZWNrL3Zkc29jaGVjay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMK
QEAgLTkwLDYgKzkwLDMxIEBAIGZuIGFsbG93ZWRfcmVsb2NhdGlvbnNfZm9yX21hY2hpbmUobWFj
aGluZTogdTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRpb25zPCdzCiAgICAgICAgICAgICAg
ICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTZfSEEsCiAgICAgICAgICAgICBdLAogICAgICAgICB9
KSwKKyAgICAgICAgYmluZGluZ3M6OkVNX1JJU0NWID0+IFNvbWUoQWxsb3dlZFJlbG9jYXRpb25z
IHsKKyAgICAgICAgICAgIGlnbm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6IE5vbmUsCisgICAg
ICAgICAgICBpbl9vYmplY3RfZmlsZTogJlsKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9S
SVNDVl9CUkFOQ0gsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfSkFMLAorICAg
ICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX0NBTEwsCisgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfUklTQ1ZfQ0FMTF9QTFQsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklT
Q1ZfUENSRUxfSEkyMCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9QQ1JFTF9M
TzEyX0ksCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfUENSRUxfTE8xMl9TLAor
ICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX0FERDgsCisgICAgICAgICAgICAgICAg
YmluZGluZ3M6OlJfUklTQ1ZfQUREMTYsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklT
Q1ZfQUREMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfQURENjQsCisgICAg
ICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfU1VCOCwKKyAgICAgICAgICAgICAgICBiaW5k
aW5nczo6Ul9SSVNDVl9TVUIxNiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9T
VUIzMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9TVUI2NCwKKyAgICAgICAg
ICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9BTElHTiwKKyAgICAgICAgICAgICAgICBiaW5kaW5n
czo6Ul9SSVNDVl9SVkNfQlJBTkNILAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NW
X1JWQ19KVU1QLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1JFTEFYLAorICAg
ICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWXzMyX1BDUkVMLAorICAgICAgICAgICAgXSwK
KyAgICAgICAgfSksCiAgICAgICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41MC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
