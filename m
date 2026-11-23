Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A9606A33A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsjY/63w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rCXDMhbM;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Vihz+OSm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2P0u3IFTF8jWsA7v4yPIaCmxLvjkrTtnQ8zVndSi/ZM=; b=rsjY/63wwoldIKnZLS+7Xhujv5
	cAR7Ym2n7YtagJcducdrAnpntbh59cilI6mE3xkMFGZRPBvsChV+1FCyR4BPBJdUjYBplgEQ6GQme
	DUipsCoH8aZ4Q4WYUppiGektB1I6/8j1Vz4OK6kJvNXbS/cGbh69Kvu1yIgKMVja9m/3NaLAJ1Cvl
	WRQx3v3aI6jrpliOH93I2zYvUi4EZWRivIgwDdaTZJYv42pFI0DjhQsQsKu0mD0pjnP4ky0NfQnYk
	KaJCJnGDGPQRFGCgm9ZnKWvO0YVP8XMMF4G91WOug6x2hkkazcAksHBNxYe9Q3HWbTCg8PoOxF3S8
	7agMJ74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSk-00000003erQ-2wC3;
	Mon, 23 Nov 2026 13:52:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSL-00000003eG7-3IEX;
	Mon, 23 Nov 2026 13:51:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPmhvZcQZsMI6w6eJvQYmGXP4b/7L7ItLiKaLRPpFiQ=;
	b=rCXDMhbMNovmfoO6qyadNrRk7f6HVHBen34hmO8c2sCJxmWlrI+kuN6Fu1RHeKKsk6EY24
	E0SacrConMBbHsRxfbnnA1QmrkSNG5ig6+9Hj82q0+fcZzQog4JMvSX6BdBkvLPKAZY09a
	cmajQWcX84aMnEYYUqKcjQOYaLNnWLHV9hW4r1F+KoYJyRFvRAAJZbR87Cv1533ZENWlNL
	1IH3b3cUootBgp4GSIrRdqXPpBA39+LY1KQmZGiOE+gUNUvfwW3zvseTDo78nzug9YZv0c
	Nf0/IEvGQ27iEzT9+d3kiH4e7e72aytWDiOonz7mndTpsY7S1mpQeK4PjYtpeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPmhvZcQZsMI6w6eJvQYmGXP4b/7L7ItLiKaLRPpFiQ=;
	b=Vihz+OSme/gaZLLhdpsDZx8NOwH494utLHXdBxi1jGqiwVH9qbyOTU05x0YmhKAKY4MP4H
	F0xPTtLbZf0pAzDg==
Date: Mon, 23 Nov 2026 14:51:02 +0100
Subject: [PATCH v6 11/11] vDSO: Automatically enable VDSO_CHECK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-11-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=4650;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tCXUwkZUh4Hl18kwgGqhcWJoeos+T/6rMQq0M5SHQdY=;
 b=gvQ6fSLlDUp8t1Kpx0/BBIhQ7AihqhesygBcKjwQL0dpVUoOyS5DoqWuOa59xHy5yVuHPzbgt
 Z/t2kJ3fm0ZAJfn4xh2H2o29XKP0jwDQOX8shG9Arg4eFHtoqbgV9U/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055143_776407_998487C9 
X-CRM114-Status: GOOD (  10.59  )
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
IGEvYXJjaC9hcm0vbW0vS2NvbmZpZyBiL2FyY2gvYXJtL21tL0tjb25maWcKaW5kZXggN2Y1NWVk
MzdmNDY0Li40MWQ3YjQ5NWVjNDUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21tL0tjb25maWcKKysr
IGIvYXJjaC9hcm0vbW0vS2NvbmZpZwpAQCAtOTQzLDcgKzk0Myw2IEBAIGNvbmZpZyBWRFNPCiAJ
ZGVwZW5kcyBvbiBBRUFCSSAmJiBNTVUgJiYgQ1BVX1Y3CiAJZGVmYXVsdCB5IGlmIEFSTV9BUkNI
X1RJTUVSCiAJc2VsZWN0IEdFTkVSSUNfR0VUVElNRU9GREFZCi0Jc2VsZWN0IFZEU09fQ0hFQ0sK
IAloZWxwCiAJICBQbGFjZSBpbiB0aGUgcHJvY2VzcyBhZGRyZXNzIHNwYWNlIGFuIEVMRiBzaGFy
ZWQgb2JqZWN0CiAJICBwcm92aWRpbmcgZmFzdCBpbXBsZW1lbnRhdGlvbnMgb2YgZ2V0dGltZW9m
ZGF5IGFuZApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29u
ZmlnCmluZGV4IGRmMjJiNGVkNWUyOS4uMTA3NWJjNjYxODMzIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L0tjb25maWcKKysrIGIvYXJjaC9hcm02NC9LY29uZmlnCkBAIC0yNTgsNyArMjU4LDYgQEAg
Y29uZmlnIEFSTTY0CiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX05NSV9TVVBQT1JUCiAJc2VsZWN0
IEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBP
UlQKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTQogCXNlbGVjdCBW
TUFQX1NUQUNLCiAJaGVscApkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyBiL2Fy
Y2gvbG9vbmdhcmNoL0tjb25maWcKaW5kZXggYWQ0Y2FmZWRkYmI4Li5iNWVkNDg4MWQzYzAgMTAw
NjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKKysrIGIvYXJjaC9sb29uZ2FyY2gvS2Nv
bmZpZwpAQCAtMjExLDcgKzIxMSw2IEBAIGNvbmZpZyBMT09OR0FSQ0gKIAlzZWxlY3QgVFJBQ0Vf
SVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBVU0VfUEVSQ1BVX05VTUFfTk9ERV9JRAogCXNlbGVj
dCBVU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVAotCXNlbGVjdCBWRFNPX0NIRUNLCiAJc2VsZWN0IFZE
U09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJc2VsZWN0IFpPTkVfRE1BMzIg
aWYgNjRCSVQKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9LY29uZmlnIGIvYXJjaC9taXBzL0tjb25m
aWcKaW5kZXggMzFjMjQ3YzJmYWViLi5lZDE3YzliMTYyNGMgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlw
cy9LY29uZmlnCisrKyBiL2FyY2gvbWlwcy9LY29uZmlnCkBAIC0xMDYsNyArMTA2LDYgQEAgY29u
ZmlnIE1JUFMKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBBUkNIX0hB
U19FTEZDT1JFX0NPTVBBVAogCXNlbGVjdCBIQVZFX0FSQ0hfS0NTQU4gaWYgNjRCSVQKLQlzZWxl
Y3QgVkRTT19DSEVDSwogCiBjb25maWcgTUlQU19GSVhVUF9CSUdQSFlTX0FERFIKIAlib29sCmRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCmlu
ZGV4IDFjNGE3NWMzYTgzMC4uYzNiNmNkNjU1NjA2IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMv
S2NvbmZpZworKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwpAQCAtMzI3LDcgKzMyNyw2IEBAIGNv
bmZpZyBQUEMKIAlzZWxlY3QgU1lTQ1RMX0VYQ0VQVElPTl9UUkFDRQogCXNlbGVjdCBUSFJFQURf
SU5GT19JTl9UQVNLCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKLQlzZWxlY3QgVkRT
T19DSEVDSwogCXNlbGVjdCBWRFNPX0RBVEFTVE9SRQogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTQog
CSMKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpp
bmRleCAyYTBmNWZiY2Q3ZTMuLmU3ODkxYTJhODlkYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMjI2LDcgKzIyNiw2IEBAIGNvbmZp
ZyBSSVNDVgogCXNlbGVjdCBUSFJFQURfSU5GT19JTl9UQVNLCiAJc2VsZWN0IFRSQUNFX0lSUUZM
QUdTX1NVUFBPUlQKIAlzZWxlY3QgVUFDQ0VTU19NRU1DUFkgaWYgIU1NVQotCXNlbGVjdCBWRFNP
X0NIRUNLIGlmIE1NVQogCXNlbGVjdCBWRFNPX0RBVEFTVE9SRSBpZiBNTVUKIAlzZWxlY3QgVkRT
T19HRVRSQU5ET00gaWYgTU1VICYmIDY0QklUCiAJc2VsZWN0IFVTRVJfU1RBQ0tUUkFDRV9TVVBQ
T1JUCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnCmlu
ZGV4IDcxYTYxNDgzMjg4Ni4uNzEzOGQ5MjNkODZmIDEwMDY0NAotLS0gYS9hcmNoL3MzOTAvS2Nv
bmZpZworKysgYi9hcmNoL3MzOTAvS2NvbmZpZwpAQCAtMjg5LDcgKzI4OSw2IEBAIGNvbmZpZyBT
MzkwCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKIAlzZWxlY3QgVFRZCiAJc2VsZWN0
IFVTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUCi0Jc2VsZWN0IFZEU09fQ0hFQ0sKIAlzZWxlY3QgVkRT
T19HRVRSQU5ET00KIAlzZWxlY3QgVklSVF9DUFVfQUNDT1VOVElORwogCXNlbGVjdCBWTUFQX1NU
QUNLCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL0tjb25maWcgYi9hcmNoL3NwYXJjL0tjb25maWcK
aW5kZXggOTBkZjc3MjM1MTg0Li43NDJmZmZmOGMzN2YgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMv
S2NvbmZpZworKysgYi9hcmNoL3NwYXJjL0tjb25maWcKQEAgLTExNCw3ICsxMTQsNiBAQCBjb25m
aWcgU1BBUkM2NAogCXNlbGVjdCBBUkNIX1NVUFBPUlRTX1NDSEVEX1NNVCBpZiBTTVAKIAlzZWxl
Y3QgQVJDSF9TVVBQT1JUU19TQ0hFRF9NQyAgaWYgU01QCiAJc2VsZWN0IEFSQ0hfSEFTX0xBWllf
TU1VX01PREUKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBHRU5FUklDX0dFVFRJTUVPRkRB
WQogCiBjb25maWcgQVJDSF9QUk9DX0tDT1JFX1RFWFQKZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tj
b25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDA5ZDNhYTA0ZWU4Mi4uNThkY2UwYjY2MTc5
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2L0tjb25maWcKQEAg
LTMwMiw3ICszMDIsNiBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEhBVkVfVU5TVEFCTEVfU0NIRURf
Q0xPQ0sKIAlzZWxlY3QgSEFWRV9VTldJTkRfVVNFUl9GUAkJaWYgWDg2XzY0CiAJc2VsZWN0IEhB
VkVfVVNFUl9SRVRVUk5fTk9USUZJRVIKLQlzZWxlY3QgVkRTT19DSEVDSwogCXNlbGVjdCBWRFNP
X0dFVFJBTkRPTQkJCWlmIFg4Nl82NAogCXNlbGVjdCBIT1RQTFVHX1BBUkFMTEVMCQkJaWYgU01Q
ICYmIFg4Nl82NAogCXNlbGVjdCBIT1RQTFVHX1NNVAkJCWlmIFNNUApkaWZmIC0tZ2l0IGEvbGli
L3Zkc28vS2NvbmZpZyBiL2xpYi92ZHNvL0tjb25maWcKaW5kZXggNTU5ZjU1MzQ4MzFlLi43NDFk
ZTFhYmU5MjMgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL0tjb25maWcKKysrIGIvbGliL3Zkc28vS2Nv
bmZpZwpAQCAtNiw2ICs2LDcgQEAgY29uZmlnIFZEU09fREFUQVNUT1JFCiBjb25maWcgR0VORVJJ
Q19HRVRUSU1FT0ZEQVkKIAlib29sCiAJc2VsZWN0IFZEU09fREFUQVNUT1JFCisJc2VsZWN0IFZE
U09fQ0hFQ0sKIAloZWxwCiAJICBUaGlzIGlzIGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiBn
ZXR0aW1lb2ZkYXkgdmRzby4KIAkgIEVhY2ggYXJjaGl0ZWN0dXJlIHRoYXQgZW5hYmxlcyB0aGlz
IGZlYXR1cmUgaGFzIHRvCkBAIC0yMSw2ICsyMiw3IEBAIGNvbmZpZyBHRU5FUklDX1ZEU09fT1ZF
UkZMT1dfUFJPVEVDVAogY29uZmlnIFZEU09fR0VUUkFORE9NCiAJYm9vbAogCXNlbGVjdCBWRFNP
X0RBVEFTVE9SRQorCXNlbGVjdCBWRFNPX0NIRUNLCiAJaGVscAogCSAgU2VsZWN0ZWQgYnkgYXJj
aGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgdkRTTyBnZXRyYW5kb20oKS4KIAoKLS0gCjIuNTYuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
