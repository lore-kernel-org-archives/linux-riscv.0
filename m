Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0DC79FAE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yry8I0ZFcUbPP2Y4tq7ywnzj0hSyQBINGvhmCOR8DN0=; b=DC5y3XVrmfxFnr
	ZbKkkpSBu3xxZAo8+NshiIOQhjIUpS9hqVgGRwQLTV5X9+u1+PhWzu2OZLTFuQhodFBlRlEgqLzks
	tn8zCD72VDyzS6BwIA5yHobs6hkKVF7KsmVUfUGzVOIpkINI9tCHaec4/3vpCX8Kcvh0lK/1IqaYR
	RIPFSzqhS9v/cLy5WEriYzqW5xbN6WoctiVSJBjm6S5pkHM8CcP9KUldMTovvHtSjxDBK1NxU+kv8
	Rb5kNdOva3nCpsO3OQ3No+w7lfLTwGF/30dpGyhLlEafJjbb/x2P7r2MoNVeQSGfgWcqUu+QY2i1p
	FWzycv7vn9AgJpcbAUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPv-00000008AGr-2fk4;
	Tue, 08 Sep 2026 06:34:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP9-0000000893D-1ZKx;
	Tue, 08 Sep 2026 06:34:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5v9YeHlqv3ovO/ql+3n8/DnO9S76Q/KXTK4Iu9nIj8=;
	b=Duhd+tzhOIqAKD5Jsk7S5bIW+1/U+0lAyREaDyVMtUfkM+/2g6McMuZ8BVCtyusCW6KJhw
	wjBNCvGCpNGgmhFNn9x5FtX2pPVsVPQncpaQfdGxuDFM2F8njXe/d+MpW+sHlGTHGFoNTq
	Irhfb/b0d78bbsC8nUcr59RO2R6WK1QG6Wmmqjub7uMBsV8HzhabnT8Q3BXaImhnViQuCI
	99Y24z+RnYH8P+/0VTaa0of5QDISRCOgkSmlsMF9mLF5D2je6Fs4Q2NdAPmpcUGUDioSm3
	I7ouCpMLG1e5cQUG5eQhiKpjN9lpx2nzj/DsTf8/2g6tDQdVpp9HJVE2/Kspiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5v9YeHlqv3ovO/ql+3n8/DnO9S76Q/KXTK4Iu9nIj8=;
	b=TsyWF+JNT75r27JmDD427VBvLmTOCV3ff2Y7hv2xF0uvSSVXKhCkoTtj5xhp4+hfJtB9PC
	YrBA0mfCXrb6F8Cw==
Date: Tue, 08 Sep 2026 08:33:51 +0200
Subject: [PATCH v5 17/24] powerpc/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-17-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=3226;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PdmcaVe7pCu6upu7UTobIjeT+xi6m7cmShZzdDyDUqA=;
 b=KtzFUmFB6ajLIxA6GIlsiL6NZpPyhZkhtmdUQSlrxF2Z0EifBwB7dmyJS0AwkyNYLtHN5Uenz
 k87bxRvOvh3AuR3/IHMkszUyZg00Zcqz3Ne04gmZUna19VeKFdykejP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233403_740971_52CB1D47 
X-CRM114-Status: GOOD (  10.66  )
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
LmRlPgotLS0KIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKIGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8ICA0ICsrLS0KIGxpYi92ZHNvL2NoZWNrL3Zk
c29jaGVjay5ycyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggMjU4MGUy
N2U0MzI4Li5mMTllMjI1Y2ZjNWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisr
KyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC0zMzAsNiArMzMwLDcgQEAgY29uZmlnIFBQQwog
CXNlbGVjdCBTWVNDVExfRVhDRVBUSU9OX1RSQUNFCiAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RB
U0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAorCXNlbGVjdCBWRFNPX0NIRUNLCiAJ
c2VsZWN0IFZEU09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJIwpkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC92ZHNvL01ha2VmaWxlCmluZGV4IDM2ODc1OWY4MTcwOC4uY2EyMGI5MWI0MzczIDEwMDY0
NAotLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlCkBAIC04MSw5ICs4MSw5IEBAIHRhcmdldHMgKz0gdmRz
bzY0LmxkcwogQ1BQRkxBR1NfdmRzbzY0LmxkcyArPSAtUCAtQwogCiAjIGxpbmsgcnVsZSBmb3Ig
dGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0byBiZSBmaXJzdAotJChvYmopL3Zkc28zMi5zby5kYmc6
ICQob2JqKS92ZHNvMzIubGRzICQob2JqLXZkc28zMikgJChvYmopL3ZnZXR0aW1lb2ZkYXktMzIu
byAkKG9iaikvdmdldHJhbmRvbS0zMi5vICQob2JqKS9jcnRzYXZyZXMtMzIubyBGT1JDRQorJChv
YmopL3Zkc28zMi5zby5kYmc6ICQob2JqKS92ZHNvMzIubGRzICQob2JqLXZkc28zMikgJChvYmop
L3ZnZXR0aW1lb2ZkYXktMzIubyAkKG9iaikvdmdldHJhbmRvbS0zMi5vICQob2JqKS9jcnRzYXZy
ZXMtMzIubyAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvMzJsZF9h
bmRfY2hlY2spCi0kKG9iaikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc282NC5sZHMgJChvYmot
dmRzbzY0KSAkKG9iaikvdmdldHRpbWVvZmRheS02NC5vICQob2JqKS92Z2V0cmFuZG9tLTY0Lm8g
Rk9SQ0UKKyQob2JqKS92ZHNvNjQuc28uZGJnOiAkKG9iaikvdmRzbzY0LmxkcyAkKG9iai12ZHNv
NjQpICQob2JqKS92Z2V0dGltZW9mZGF5LTY0Lm8gJChvYmopL3ZnZXRyYW5kb20tNjQubyAkKHZk
c29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvNjRsZF9hbmRfY2hlY2spCiAK
ICMgYXNzZW1ibHkgcnVsZXMgZm9yIHRoZSAuUyBmaWxlcwpkaWZmIC0tZ2l0IGEvbGliL3Zkc28v
Y2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCmluZGV4IGU0
NWExZmJjNjgyOS4uNDI5YmRjZDY1ODE4IDEwMDY0NAotLS0gYS9saWIvdmRzby9jaGVjay92ZHNv
Y2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCkBAIC02OSw2ICs2OSwz
MyBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4g
T3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZh
dWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1f
UFBDID0+IEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTog
JlsKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUENfUkVMMjQsCisgICAgICAgICAgICAg
ICAgYmluZGluZ3M6OlJfUFBDX1JFTDE0LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQ
Q19SRUwzMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUENfUkVMMTYsCisgICAgICAg
ICAgICAgICAgYmluZGluZ3M6OlJfUFBDX1JFTDE2X0xPLAorICAgICAgICAgICAgICAgIGJpbmRp
bmdzOjpSX1BQQ19SRUwxNl9ISSwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUENfUkVM
MTZfSEEsCisgICAgICAgICAgICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkK
KyAgICAgICAgfQorICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1fUFBDNjQg
PT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWwor
ICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDI0LAorICAgICAgICAgICAgICAg
IGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE0LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQ
QzY0X1JFTDMyLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDY0LAorICAg
ICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE2LAorICAgICAgICAgICAgICAgIGJp
bmRpbmdzOjpSX1BQQzY0X1JFTDE2X0xPLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQ
QzY0X1JFTDE2X0hJLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE2X0hB
LAorICAgICAgICAgICAgXSwKKyAgICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCisgICAg
ICAgIH0KKyAgICAgICAgLmludG8oKSwKICAgICAgICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0t
IAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
