Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05380C79FAB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znlYRHvxgItCtCwAOQKAJsSWV47P3hYcuOoTs2o2458=; b=czp9pdMKmAuL4x
	h476p7nhYyVHfc2fZOe5YmgCFIGhB+J1tXQOytE1u+PM7TKbphPgoYwJJu4dpsH5LzSxt9MVKT64S
	xhihkpuZfbG/UWxhXLYIN6NJV1gkaXLqyQrDiam6rO3ufbstgtsYPdTt3+KIU27Fdla6f2v4oFMkL
	t4fgKEglctZLv2pG5SuucyIW4GvbXV/Rm1Qf+052zbKevw4i/s/kMSgYjq8dJevqySrR/MhTTvmRG
	9tNVi00egmasYeaDdlCzgL+ZlpF/2Zl3BYDSf74+Cy5RWdWPRcpawJ06b7f5uj8/E4FKAGF9kkQoF
	UdNR6jFPgQh/f31Andbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pQ0-00000008AQK-1H0A;
	Tue, 08 Sep 2026 06:34:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPG-000000089D6-0ofj;
	Tue, 08 Sep 2026 06:34:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQENS+2l3jE9bZko+PkLsKR5sNnfI5HJVcqDCuCIVEw=;
	b=XPrer1rNUAnaGlK6vBf4LguK9S6cEYlB8nZZrjRH44T0JYQMAKyYETb6FU7higRUl2aap8
	WPSjupacb2z13S04FQ0SJwG7i5o+PC1OLnBB5YCADw0UGpC2KSsaA9trHc8qBOetMTQve0
	NqaQl/n+ar+DEQjQWhkSInykqClLoMkc1uWPEodTVaq598SF88TtmGIx1H2fHIe1AwzdxB
	0wspvPUe1V8QhduMDS69XofBa/hyc2iRwUnB8p3goy0lgh6Z7KeHRDqnvOkRg7zB8SW8Qb
	FqrCyZ8Y06A671+Lr4boaBg9FZESkcMcbumRwfxWCaD3ADQPhCoX+US7aH30zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQENS+2l3jE9bZko+PkLsKR5sNnfI5HJVcqDCuCIVEw=;
	b=f9FPRGn66gCreVPpSFc3v18Vb8RE2PZIstfZMu10x/SOVv9mER00NGNKQm9o2b9lG/56PF
	Oy/Vw7WBWfgQcDDQ==
Date: Tue, 08 Sep 2026 08:33:58 +0200
Subject: [PATCH v5 24/24] vDSO: Automatically enable VDSO_CHECK
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-24-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=4650;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8YBIXCqpUcZIhKo2ozvfdc454ybWMwplCW6yYOuJO9M=;
 b=QeYK3jQJuWSOc5ZUbflHX/mM5G6ZrF/wQ5dZ1MsnWSa5wV32FY94s+AgAEqJT3r76pNju6OUd
 jvOXRT9ewDOBI2Td8ZRhAKi0jUGb3Ma2dwo847OeLvKpvkhvaACA78Q
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233410_431803_5605752D 
X-CRM114-Status: GOOD (  10.49  )
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

QWxsIGFyY2hpdGVjdHVyZXMgdXNpbmcgdGhlIGdlbmVyaWMgdkRTTyBsaWJyYXJ5IHNob3VsZCBl
bmFibGUKVkRTT19DSEVDSy4gTm93IHRoYXQgdGhpcyBpcyB0aGUgY2FzZSwgZW5hYmxlIFZEU09f
Q0hFQ0sgYXV0b21hdGljYWxseS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0
aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL21tL0tjb25maWcg
ICAgfCAxIC0KIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgfCAxIC0KIGFyY2gvbG9vbmdhcmNoL0tj
b25maWcgfCAxIC0KIGFyY2gvbWlwcy9LY29uZmlnICAgICAgfCAxIC0KIGFyY2gvcG93ZXJwYy9L
Y29uZmlnICAgfCAxIC0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgfCAxIC0KIGFyY2gvczM5MC9L
Y29uZmlnICAgICAgfCAxIC0KIGFyY2gvc3BhcmMvS2NvbmZpZyAgICAgfCAxIC0KIGFyY2gveDg2
L0tjb25maWcgICAgICAgfCAxIC0KIGxpYi92ZHNvL0tjb25maWcgICAgICAgfCAyICsrCiAxMCBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vbW0vS2NvbmZpZyBiL2FyY2gvYXJtL21tL0tjb25maWcKaW5kZXggNTY1OTg4
YTY2ZTk4Li42NTc0NjU5ZGZiNjEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21tL0tjb25maWcKKysr
IGIvYXJjaC9hcm0vbW0vS2NvbmZpZwpAQCAtOTUwLDcgKzk1MCw2IEBAIGNvbmZpZyBWRFNPCiAJ
ZGVwZW5kcyBvbiBBRUFCSSAmJiBNTVUgJiYgQ1BVX1Y3CiAJZGVmYXVsdCB5IGlmIEFSTV9BUkNI
X1RJTUVSCiAJc2VsZWN0IEdFTkVSSUNfR0VUVElNRU9GREFZCi0Jc2VsZWN0IFZEU09fQ0hFQ0sK
IAloZWxwCiAJICBQbGFjZSBpbiB0aGUgcHJvY2VzcyBhZGRyZXNzIHNwYWNlIGFuIEVMRiBzaGFy
ZWQgb2JqZWN0CiAJICBwcm92aWRpbmcgZmFzdCBpbXBsZW1lbnRhdGlvbnMgb2YgZ2V0dGltZW9m
ZGF5IGFuZApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29u
ZmlnCmluZGV4IDFjYWFmNDczN2YwMi4uYjVhNTFiMGVmOTQ0IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L0tjb25maWcKKysrIGIvYXJjaC9hcm02NC9LY29uZmlnCkBAIC0yNTgsNyArMjU4LDYgQEAg
Y29uZmlnIEFSTTY0CiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX05NSV9TVVBQT1JUCiAJc2VsZWN0
IEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBP
UlQKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTQogCXNlbGVjdCBW
TUFQX1NUQUNLCiAJaGVscApkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyBiL2Fy
Y2gvbG9vbmdhcmNoL0tjb25maWcKaW5kZXggNWRjOThhNGI5YzdmLi5hMjFmNTFlNTgxNWUgMTAw
NjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKKysrIGIvYXJjaC9sb29uZ2FyY2gvS2Nv
bmZpZwpAQCAtMjEzLDcgKzIxMyw2IEBAIGNvbmZpZyBMT09OR0FSQ0gKIAlzZWxlY3QgVFJBQ0Vf
SVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBVU0VfUEVSQ1BVX05VTUFfTk9ERV9JRAogCXNlbGVj
dCBVU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVAotCXNlbGVjdCBWRFNPX0NIRUNLCiAJc2VsZWN0IFZE
U09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJc2VsZWN0IFpPTkVfRE1BMzIg
aWYgNjRCSVQKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9LY29uZmlnIGIvYXJjaC9taXBzL0tjb25m
aWcKaW5kZXggOWEzY2U1NTBjOTVkLi5lMmViOTYyN2JkMTQgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlw
cy9LY29uZmlnCisrKyBiL2FyY2gvbWlwcy9LY29uZmlnCkBAIC0xMDcsNyArMTA3LDYgQEAgY29u
ZmlnIE1JUFMKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBBUkNIX0hB
U19FTEZDT1JFX0NPTVBBVAogCXNlbGVjdCBIQVZFX0FSQ0hfS0NTQU4gaWYgNjRCSVQKLQlzZWxl
Y3QgVkRTT19DSEVDSwogCiBjb25maWcgTUlQU19GSVhVUF9CSUdQSFlTX0FERFIKIAlib29sCmRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCmlu
ZGV4IGYxOWUyMjVjZmM1Yy4uMjU4MGUyN2U0MzI4IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMv
S2NvbmZpZworKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwpAQCAtMzMwLDcgKzMzMCw2IEBAIGNv
bmZpZyBQUEMKIAlzZWxlY3QgU1lTQ1RMX0VYQ0VQVElPTl9UUkFDRQogCXNlbGVjdCBUSFJFQURf
SU5GT19JTl9UQVNLCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKLQlzZWxlY3QgVkRT
T19DSEVDSwogCXNlbGVjdCBWRFNPX0RBVEFTVE9SRQogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTQog
CSMKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpp
bmRleCBmNTgwZDJhZmVjZjcuLmY4ZTI2YzRiZWQyYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMjI5LDcgKzIyOSw2IEBAIGNvbmZp
ZyBSSVNDVgogCXNlbGVjdCBUSFJFQURfSU5GT19JTl9UQVNLCiAJc2VsZWN0IFRSQUNFX0lSUUZM
QUdTX1NVUFBPUlQKIAlzZWxlY3QgVUFDQ0VTU19NRU1DUFkgaWYgIU1NVQotCXNlbGVjdCBWRFNP
X0NIRUNLIGlmIE1NVQogCXNlbGVjdCBWRFNPX0RBVEFTVE9SRSBpZiBNTVUKIAlzZWxlY3QgVkRT
T19HRVRSQU5ET00gaWYgTU1VICYmIDY0QklUCiAJc2VsZWN0IFVTRVJfU1RBQ0tUUkFDRV9TVVBQ
T1JUCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnCmlu
ZGV4IGJjMTIzNjdhN2IwMC4uNGI1MWJjNmU4OTQ4IDEwMDY0NAotLS0gYS9hcmNoL3MzOTAvS2Nv
bmZpZworKysgYi9hcmNoL3MzOTAvS2NvbmZpZwpAQCAtMjkxLDcgKzI5MSw2IEBAIGNvbmZpZyBT
MzkwCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKIAlzZWxlY3QgVFRZCiAJc2VsZWN0
IFVTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUCi0Jc2VsZWN0IFZEU09fQ0hFQ0sKIAlzZWxlY3QgVkRT
T19HRVRSQU5ET00KIAlzZWxlY3QgVklSVF9DUFVfQUNDT1VOVElORwogCXNlbGVjdCBWTUFQX1NU
QUNLCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL0tjb25maWcgYi9hcmNoL3NwYXJjL0tjb25maWcK
aW5kZXggNjI4YmRmYzJmMDg4Li5hYjc3ZDNmMjUzNmUgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMv
S2NvbmZpZworKysgYi9hcmNoL3NwYXJjL0tjb25maWcKQEAgLTExNCw3ICsxMTQsNiBAQCBjb25m
aWcgU1BBUkM2NAogCXNlbGVjdCBBUkNIX1NVUFBPUlRTX1NDSEVEX1NNVCBpZiBTTVAKIAlzZWxl
Y3QgQVJDSF9TVVBQT1JUU19TQ0hFRF9NQyAgaWYgU01QCiAJc2VsZWN0IEFSQ0hfSEFTX0xBWllf
TU1VX01PREUKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBHRU5FUklDX0dFVFRJTUVPRkRB
WQogCiBjb25maWcgQVJDSF9QUk9DX0tDT1JFX1RFWFQKZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tj
b25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IGVlMGYyYzQwMTk4MC4uMTVmZDllYzVlY2Fj
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2L0tjb25maWcKQEAg
LTMwNSw3ICszMDUsNiBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEhBVkVfVU5TVEFCTEVfU0NIRURf
Q0xPQ0sKIAlzZWxlY3QgSEFWRV9VTldJTkRfVVNFUl9GUAkJaWYgWDg2XzY0CiAJc2VsZWN0IEhB
VkVfVVNFUl9SRVRVUk5fTk9USUZJRVIKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBWRFNP
X0dFVFJBTkRPTQkJCWlmIFg4Nl82NAogCXNlbGVjdCBIT1RQTFVHX1BBUkFMTEVMCQkJaWYgU01Q
ICYmIFg4Nl82NAogCXNlbGVjdCBIT1RQTFVHX1NNVAkJCWlmIFNNUApkaWZmIC0tZ2l0IGEvbGli
L3Zkc28vS2NvbmZpZyBiL2xpYi92ZHNvL0tjb25maWcKaW5kZXggMTEyYjQyYTVhZWIxLi4xMmE2
NDBjNzhiNzIgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL0tjb25maWcKKysrIGIvbGliL3Zkc28vS2Nv
bmZpZwpAQCAtNiw2ICs2LDcgQEAgY29uZmlnIFZEU09fREFUQVNUT1JFCiBjb25maWcgR0VORVJJ
Q19HRVRUSU1FT0ZEQVkKIAlib29sCiAJc2VsZWN0IFZEU09fREFUQVNUT1JFCisJc2VsZWN0IFZE
U09fQ0hFQ0sKIAloZWxwCiAJICBUaGlzIGlzIGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiBn
ZXR0aW1lb2ZkYXkgdmRzby4KIAkgIEVhY2ggYXJjaGl0ZWN0dXJlIHRoYXQgZW5hYmxlcyB0aGlz
IGZlYXR1cmUgaGFzIHRvCkBAIC0yMSw2ICsyMiw3IEBAIGNvbmZpZyBHRU5FUklDX1ZEU09fT1ZF
UkZMT1dfUFJPVEVDVAogY29uZmlnIFZEU09fR0VUUkFORE9NCiAJYm9vbAogCXNlbGVjdCBWRFNP
X0RBVEFTVE9SRQorCXNlbGVjdCBWRFNPX0NIRUNLCiAJaGVscAogCSAgU2VsZWN0ZWQgYnkgYXJj
aGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgdkRTTyBnZXRyYW5kb20oKS4KIAoKLS0gCjIuNTUuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
