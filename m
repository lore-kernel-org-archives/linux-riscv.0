Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169E606A681
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ruq2Xp/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cmCyDGAo;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FI7TlzcC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kv0o/hI1s65ahoCgiKQGs9ctbx5aZbtajiLObn5OUTs=; b=4ruq2Xp/vKyqFe3WyVgZ0GX6vC
	2+1uvomqX596k74NsmSQJZ6KCfjWx/Iq7DXauu73VcP3UODdwRou/Kt1Vz9kPYTm6AjdYdmf5gQay
	+D7z+kdKH64v1rS+HyIQ4+psEmO/DGpaZaHyeyBInDVSGmdcqRT6YtCA6b63rNAz0nkjjn9uwOTiM
	tESZ0uONld5xwgTSof3HGKUllYg8AgnjdAFJjn8AhymvCMdQyVwgMecDMaIMSerJWBc6M8ZVgP/aO
	D+TsLuPdddxhzqFJ9r2s7/gS+Kx7sAeqyNe7lFidpYHK4pNahMZTNITZzxEasXlVh+aH14uXsAxsA
	dqS5FW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSF-00000003e8T-0UYp;
	Mon, 23 Nov 2026 13:51:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS2-00000003dy8-2cnA;
	Mon, 23 Nov 2026 13:51:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBMPA0Qx4PjkZ9OZjmL4avau0QGga2wYFkd3qrKkjA=;
	b=cmCyDGAoxa8oDitp4LrGWDkP4CDp+0lHo+E95wkqa425Lcn3w9cm+RbtYI5eSO9sXjWmat
	QoidlgrDeM4aH5qIvXHPl1TDVl5Iw559yftSUOCPc5GcBuxFifOb+nU3JxnfLbZdhCZ/Om
	61jBrg1gwc6UQdIBpO8pgask1Ph1G4gW3SA6b0NuVLd4pUoNaoNy0wPFXztdPp3d8hh+Zg
	svLYWwoSJyRDtbPyOPK0O339rD3z7Iwn0JP+dqM6WEftghcvuiSaHG4v/nGkA4phRhVCqH
	PJlYghaw7CnygCSTcXlznhUSRnaErzqNJ6mBTTdKTlafxylCV8WSXfEo+ZSzJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBMPA0Qx4PjkZ9OZjmL4avau0QGga2wYFkd3qrKkjA=;
	b=FI7TlzcCK0viQr5GdhmEG+URex60ciyYkkkN9vhgUpMrF77XhfzOHKSYvwvEX+q3uNF/qq
	5xO9jwTwQOfMlyDw==
Date: Mon, 23 Nov 2026 14:50:54 +0100
Subject: [PATCH v6 03/11] ARM: vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-3-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2441;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8GMxY0hgZLZmXIGNxEsx+zQJWvtZKAV9EO32aM3n8Sw=;
 b=LUKSJQixY6S9CU9mjQSgw2/Vb6bCSqXY+Xe0Ot0VvpO4DA94i5rRE3OxPHegS/C2s4VGPq1re
 6wJI1xLx7sRDEH/jE+pAglfUlG/v94LNXGZGAJwkNAq7NAX4/q3rqdM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055122_813193_8D2865C0 
X-CRM114-Status: GOOD (  12.06  )
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
LmRlPgotLS0KIGFyY2gvYXJtL21tL0tjb25maWcgICAgICAgICB8IDEgKwogYXJjaC9hcm0vdmRz
by9NYWtlZmlsZSAgICAgIHwgNCArKy0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgfCA5
ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21tL0tjb25maWcgYi9hcmNoL2FybS9tbS9LY29u
ZmlnCmluZGV4IDQxZDdiNDk1ZWM0NS4uN2Y1NWVkMzdmNDY0IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9tbS9LY29uZmlnCisrKyBiL2FyY2gvYXJtL21tL0tjb25maWcKQEAgLTk0Myw2ICs5NDMsNyBA
QCBjb25maWcgVkRTTwogCWRlcGVuZHMgb24gQUVBQkkgJiYgTU1VICYmIENQVV9WNwogCWRlZmF1
bHQgeSBpZiBBUk1fQVJDSF9USU1FUgogCXNlbGVjdCBHRU5FUklDX0dFVFRJTUVPRkRBWQorCXNl
bGVjdCBWRFNPX0NIRUNLCiAJaGVscAogCSAgUGxhY2UgaW4gdGhlIHByb2Nlc3MgYWRkcmVzcyBz
cGFjZSBhbiBFTEYgc2hhcmVkIG9iamVjdAogCSAgcHJvdmlkaW5nIGZhc3QgaW1wbGVtZW50YXRp
b25zIG9mIGdldHRpbWVvZmRheSBhbmQKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3Zkc28vTWFrZWZp
bGUgYi9hcmNoL2FybS92ZHNvL01ha2VmaWxlCmluZGV4IGNmOGNkMzlhYjgwNC4uZmQzNGQwZmYw
MThhIDEwMDY0NAotLS0gYS9hcmNoL2FybS92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvYXJtL3Zk
c28vTWFrZWZpbGUKQEAgLTM3LDcgKzM3LDcgQEAgZW5kaWYKICQob2JqKS92ZHNvLm8gOiAkKG9i
aikvdmRzby5zbwogCiAjIExpbmsgcnVsZSBmb3IgdGhlIC5zbyBmaWxlCi0kKG9iaikvdmRzby5z
by5yYXc6ICQob2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSBGT1JDRQorJChvYmopL3Zkc28uc28u
cmF3OiAkKG9iaikvdmRzby5sZHMgJChvYmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChj
YWxsIGlmX2NoYW5nZWQsdmRzb2xkX2FuZF92ZHNvX2NoZWNrKQogCiAkKG9iaikvdmRzby5zby5k
Ymc6ICQob2JqKS92ZHNvLnNvLnJhdyAkKG9iaikvdmRzb211bmdlIEZPUkNFCkBAIC01MCw3ICs1
MCw3IEBAICQob2JqKS8lLnNvOiAkKG9iaikvJS5zby5kYmcgRk9SQ0UKIAogIyBBY3R1YWwgYnVp
bGQgY29tbWFuZHMKIHF1aWV0X2NtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSBMRCAgICAgICRA
Ci0gICAgICBjbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gJChjbWRfbGQpOyAkKGNtZF92ZHNv
X2NoZWNrKQorICAgICAgY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkX3Zkc28p
OyAkKGNtZF92ZHNvX2NoZWNrKQogCiBxdWlldF9jbWRfdmRzb211bmdlID0gTVVOR0UgICAkQAog
ICAgICAgY21kX3Zkc29tdW5nZSA9ICQob2JqdHJlZSkvJChvYmopL3Zkc29tdW5nZSAkPCAkQApk
aWZmIC0tZ2l0IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2sv
dmRzb2NoZWNrLnJzCmluZGV4IDhjZDhjN2YzZmVjOC4uZTI4ZWU1OWE5MDBkIDEwMDY0NAotLS0g
YS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzCkBAIC00OCw2ICs0OCwxNSBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNo
aW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAg
ICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAor
ICAgICAgICBiaW5kaW5nczo6RU1fQVJNID0+IEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAgICAg
ICAgICBpbl9vYmplY3RfZmlsZTogJlsKKyAgICAgICAgICAgICAgICAwLCAgLyogUl9BUk1fTk9O
RSAqLworICAgICAgICAgICAgICAgIDMsICAvKiBSX0FSTV9SRUwzMiAqLworICAgICAgICAgICAg
ICAgIDQyLCAvKiBSX0FSTV9QUkVMMzEgKi8KKyAgICAgICAgICAgIF0sCisgICAgICAgICAgICAu
LkRlZmF1bHQ6OmRlZmF1bHQoKQorICAgICAgICB9CisgICAgICAgIC5pbnRvKCksCiAgICAgICAg
IF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
