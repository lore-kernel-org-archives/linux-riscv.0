Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FA606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jV2K+nmj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=m0qrJodb;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E5RDjo0r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sbkroMvLX/Vg9cLf9mKnZTYnSo+OGns1aEP/OHzPofE=; b=jV2K+nmjf7LwytHv9b0EAetFb9
	HO3jYnoBuypHldIhMigQu7EmbqgNn/RmdvmPb5N2H9witTRQrbFHA7gX2h+OCovMZ8XkVeNImbGKT
	ZYEoWdew6+caND3p/vNQsgFyuDOUTr8A+MJuPW6Ng9AcXXh+CCeXzY8QwQlcq4Zb63ns6bIm5e1P/
	2EDeKjyvIsc7r2i59jivvnHI/npW3tiJuFPC/zxyUef/Rm0e99wRJGNy1uBzd771WzJNKYbsZOiYt
	5jIMbt/lF6lHIiRt2XksMweIBEBnF+vYQIKI/hTsZxPrSnQqXDWf9U+sm+7IIbxM9yKAKTpcgJHD4
	v9CNGyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSa-00000003efF-1FgH;
	Mon, 23 Nov 2026 13:51:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSL-00000003eFy-1WpC;
	Mon, 23 Nov 2026 13:51:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ha/Vi89GXA1dWoPWSXoNX2UQD22cCvUbJLDuPRU8LE=;
	b=m0qrJodblgSHfzkge/b+c0QCMBHtFhMmCA6Vyr2H7WBleCIYh+lMqmV0IKteG9E2pikiZO
	y1JjkkjTUm66PulTK2p3QfpFPfiq0Sm3AHnRfHl8yDhGDzYNRHWeqg5cF7tcl78L1RkR/n
	WPuYxHiHo2IYC4A+sg7EC+/1EcXp3blyHeQ6KRs4nnNNyW2uY1A+PhOCAIi3oMtnZTDkV0
	NxM1dvYOi001/WyxLtFcc0h9eQpHZI0XWYY8P4cO9FYCbLxOMNPr6OKl3dnlyQMMuZGJAD
	Te3Y/nY9Wdefcyj10JqyBH/pqn70kpgTO2Xqjlvxo2FDmdYuNvSq8xtqlC4i/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ha/Vi89GXA1dWoPWSXoNX2UQD22cCvUbJLDuPRU8LE=;
	b=E5RDjo0rxSRWJZCsaguvONyxWiePtX/w5e+rniAAAlKK8WxlOgxIrKHbdHR03YakmbzKxe
	lX7JYjn+2xicGaBg==
Date: Mon, 23 Nov 2026 14:51:01 +0100
Subject: [PATCH v6 10/11] sparc: vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-10-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2332;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6Cz0yJ9M9WbiIcD7w4L4KrbFFaP4kbTGha8gKHJR3nY=;
 b=CILuTEE+Fxr6rbHT12PlkxKHS0mC2FrvmEnB5ZbAm/6ReS1zpHxcD5xSsaLEEMXokqtxppLR0
 Uh4X7juWCr+B9/J50Tb7NWk5LeUrNQkbxzudL/33leg6I3v7r7q9/fa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055143_772212_F5AE3F53 
X-CRM114-Status: GOOD (  11.63  )
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
LmRlPgotLS0KIGFyY2gvc3BhcmMvS2NvbmZpZyAgICAgICAgICB8IDEgKwogYXJjaC9zcGFyYy92
ZHNvL01ha2VmaWxlICAgIHwgNSArKystLQogbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIHwg
NyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9LY29uZmlnIGIvYXJjaC9zcGFyYy9LY29uZmln
CmluZGV4IDc0MmZmZmY4YzM3Zi4uOTBkZjc3MjM1MTg0IDEwMDY0NAotLS0gYS9hcmNoL3NwYXJj
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
cnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggMTIwZDhmYTU1MWU2Li4yNDVk
OGFmOWY3MDQgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycworKysgYi9s
aWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKQEAgLTE3Miw2ICsxNzIsMTMgQEAgZm4gYWxsb3dl
ZF9yZWxvY2F0aW9uc19mb3JfbWFjaGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2Vk
UmVsb2NhdGlvbnM8J3MKICAgICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAg
IH0KICAgICAgICAgLmludG8oKSwKKyAgICAgICAgYmluZGluZ3M6OkVNX1NQQVJDIHwgYmluZGlu
Z3M6OkVNX1NQQVJDMzJQTFVTIHwgYmluZGluZ3M6OkVNX1NQQVJDVjkgPT4geworICAgICAgICAg
ICAgQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTog
Jls2IC8qIFJfU1BBUkNfRElTUDMyICovXSwKKyAgICAgICAgICAgICAgICAuLkRlZmF1bHQ6OmRl
ZmF1bHQoKQorICAgICAgICAgICAgfQorICAgICAgICAgICAgLmludG8oKQorICAgICAgICB9CiAg
ICAgICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
