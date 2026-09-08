Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA951C79FB1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWSPch75JK4bTJJAxZ0nNaemLj09O08r1cIV6bx2Bu8=; b=bXVRnLHbq9eNz4
	UxP8FvzVSNmvVvfWHbusdrfAblQgYcibLeYrynlEA+t4t6qy7o2PE3qrpuN/J2oGbfwtUofJ5NoKC
	h1h2cu6rPo001TvbNDFRk5HkveIHjCSYV6yz2PFCNkFnburDhb9FmLceMr/WKtP5SdEeaLqm5fJ32
	YlFa84xUaulY0ycLsIjrQEeRQQjyigUQ/Qo7VgqC1JO11wOwnFq+1KicTrb1GyVxcT2FDrooehX2x
	+y2RLamjvEqrdYAjJAxt6XaYjR9QnEaNMkYuj8AKj0wvhWpnHbe+tfr/uZHkU5IzVieqw8r5Id9Ur
	cY6d3Bx6FeYG0e+2r6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPx-00000008AKK-17GO;
	Tue, 08 Sep 2026 06:34:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPF-000000089B7-0WDc;
	Tue, 08 Sep 2026 06:34:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kBqivOxnOtc9zasn0eCWq4RBwv8X/Ufx01wFT8ObgI=;
	b=ONcLc8uHweGH7n0pCw/rap58Hd3hlqqZX3tNa81FyeUAKASG7dHmKKrwNHdlyHHiRFlDv3
	7P6wVHU85ZYXnfcCRiWnVYi+2QpFNcZuXtYVzD3P1Zn/fdZu12Z/aImdrANiv+oZZMl4at
	9mMaHVOXZGbjivRo2no35o+uWLGgDiSG6UNMuG2+iEMTJ22PZURSKSRfc4Mgb5ukOyd5eo
	qHDw6CT/f4p+x+WbR2azw5m6Mvj+cSnQGWh6LIR2cGKjHOZ07fbIsBdVtvR5MjpChX7mMS
	oLADeRjpYC5cEYx4I9eCz34hLIFqdP4uXVXHWdOJrV8hibo+4NiNMS3Ou5SNNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kBqivOxnOtc9zasn0eCWq4RBwv8X/Ufx01wFT8ObgI=;
	b=l6gHpIlBwSi62BlkjxL9EUNAzZDCPGUsAN4gQqoMPR3kEWA9gAzwkD/kVYA1N+/Whf7HSz
	RiUDLayydxIFtsCw==
Date: Tue, 08 Sep 2026 08:33:57 +0200
Subject: [PATCH v5 23/24] sparc: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-23-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2334;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HZMdEj1C9yKMvR8t0T0b/I+JGw7MLB0CX99puHdToGs=;
 b=BIOspn+qM5bOmIKIxJ7EFwVtuD4wBWlInysCLHBriHSIaZ4Mi4Uuz/G1wqiiCglI1Bscu2LVw
 tLp8zgIJJGDDE/NO9Dyua6VwQNT98vlN+rim+byvjliIudZ111tEN/Y
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233409_559167_C86E460F 
X-CRM114-Status: GOOD (  11.45  )
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
LmRlPgotLS0KIGFyY2gvc3BhcmMvS2NvbmZpZyAgICAgICAgICB8IDEgKwogYXJjaC9zcGFyYy92
ZHNvL01ha2VmaWxlICAgIHwgNSArKystLQogbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIHwg
NyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9LY29uZmlnIGIvYXJjaC9zcGFyYy9LY29uZmln
CmluZGV4IGFiNzdkM2YyNTM2ZS4uNjI4YmRmYzJmMDg4IDEwMDY0NAotLS0gYS9hcmNoL3NwYXJj
L0tjb25maWcKKysrIGIvYXJjaC9zcGFyYy9LY29uZmlnCkBAIC0xMTQsNiArMTE0LDcgQEAgY29u
ZmlnIFNQQVJDNjQKIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19TQ0hFRF9TTVQgaWYgU01QCiAJc2Vs
ZWN0IEFSQ0hfU1VQUE9SVFNfU0NIRURfTUMgIGlmIFNNUAogCXNlbGVjdCBBUkNIX0hBU19MQVpZ
X01NVV9NT0RFCisJc2VsZWN0IFZEU09fQ0hFQ0sKIAlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZE
QVkKIAogY29uZmlnIEFSQ0hfUFJPQ19LQ09SRV9URVhUCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L3Zkc28vTWFrZWZpbGUgYi9hcmNoL3NwYXJjL3Zkc28vTWFrZWZpbGUKaW5kZXggODNmYjJhY2E1
OWNiLi44YmIyMzVjM2E2MTggMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvdmRzby9NYWtlZmlsZQor
KysgYi9hcmNoL3NwYXJjL3Zkc28vTWFrZWZpbGUKQEAgLTI4LDcgKzI4LDcgQEAgQ1BQRkxBR1Nf
dmRzby5sZHMgKz0gLVAgLUMKIFZEU09fTERGTEFHU192ZHNvLmxkcyA9IC1tIGVsZjY0X3NwYXJj
IC1zb25hbWUgbGludXgtdmRzby5zby4xIFwKIAkJCS16IG1heC1wYWdlLXNpemU9ODE5MgogCi0k
KG9iaikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQodm9ianMpIEZPUkNFCiskKG9i
aikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQodm9ianMpICQodmRzb2NoZWNrKSBG
T1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc28pCiAKIEhPU1RfRVhUUkFDRkxBR1MgKz0gLUkk
KHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUKQEAgLTk5LDcgKzk5LDggQEAgJChvYmopL3Zkc28zMi5z
by5kYmc6IENIRUNLRkxBR1MgPSAkKENIRUNLRkxBR1NfMzIpCiAkKG9iaikvdmRzbzMyLnNvLmRi
ZzogRk9SQ0UgXAogCQkJJChvYmopL3Zkc28zMi92ZHNvMzIubGRzIFwKIAkJCSQob2JqKS92ZHNv
MzIvdmNsb2NrX2dldHRpbWUubyBcCi0JCQkkKG9iaikvdmRzbzMyL3Zkc28tbm90ZS5vCisJCQkk
KG9iaikvdmRzbzMyL3Zkc28tbm90ZS5vIFwKKwkJCSQodmRzb2NoZWNrKQogCQkkKGNhbGwJaWZf
Y2hhbmdlZCx2ZHNvKQogCiAjCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggODY1ZThjZjdkNGUxLi4wZDNi
NDdiZjU3ZTEgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycworKysgYi9s
aWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKQEAgLTE3Miw2ICsxNzIsMTMgQEAgZm4gYWxsb3dl
ZF9yZWxvY2F0aW9uc19mb3JfbWFjaGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2Vk
UmVsb2NhdGlvbnM8J3MKICAgICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAg
IH0KICAgICAgICAgLmludG8oKSwKKyAgICAgICAgYmluZGluZ3M6OkVNX1NQQVJDIHwgYmluZGlu
Z3M6OkVNX1NQQVJDMzJQTFVTIHwgYmluZGluZ3M6OkVNX1NQQVJDVjkgPT4geworICAgICAgICAg
ICAgQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTog
JltiaW5kaW5nczo6Ul9TUEFSQ19ESVNQMzJdLAorICAgICAgICAgICAgICAgIC4uRGVmYXVsdDo6
ZGVmYXVsdCgpCisgICAgICAgICAgICB9CisgICAgICAgICAgICAuaW50bygpCisgICAgICAgIH0K
ICAgICAgICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
