Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C1DC79FAE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDr6Q2geSjE38+6RxQsV8N2aSnoOgTnh1zDZNbpRzdY=; b=jKyCcH+ssSq/LT
	BK5trsvE/2XuaNYZLPvmjK/bJ24OQJpOfGUu1nx/Gh6kjh+ZzaLMjOG0pscVBebobAi02p4YDuff2
	9BWJR89wGgN35iKZznpoZY+PGjtOlsd27zIw4x6Uig2cJynpafJNotABMR9zq643PGdyebpX1LLJ3
	V9Mlo6M50b5AbJ4l/wUBAe9oIxpgoG1q9k0VXybOXYiTvjzYcGiPe5y/x7TuuKwLxgIj71wTQx7Vk
	PXLrnWvtqzM9jC1fWUiiNSgfsVE42iW1NGn7jBFF/d4e4x7+TPKYXaDETh+uAVdt9wJcYYaC/Vo41
	q9IGSyeToUB28BXRCJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPe-000000089oP-2cqe;
	Tue, 08 Sep 2026 06:34:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP5-000000088yW-3T2R;
	Tue, 08 Sep 2026 06:34:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkLB6p5Aaygn3v1gYuxHR1a4yxVdgYLi/cxda/p+uN8=;
	b=b2Bsc4yZZCv/2zStvOHZ+5ePWQ0eZmT7xR1lkQClQSx0s+SJJVZsDS9kHDKSOqkV04EXRc
	1Co/AU5QZB8ybfRyD3MRZHLU3U5EN+z2Nsr3nY4EZ3mrza0TUFynEzX8i4hmckaQYL150u
	HvAm/2cY3Kyh3dFmID9+E0Gr7vn8+l1FhXhoHwaiEmKzrb5aHONKrYbeBhQlstbUJV2WVo
	/Cu+QeuJCDvdl0AXRGRduW9ZDawna43n+2sGf3T1TJagsr5MBwClzchUDkvRjVatnSeZtK
	nY2/4prGOYlHHzFHeX8N7JsFwydH46UcNwCZpP1P9canDwGt2uhvHTkqMxjTzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkLB6p5Aaygn3v1gYuxHR1a4yxVdgYLi/cxda/p+uN8=;
	b=x7vG3QWiRwmW98omRQPlaZFU76UvHL2q5q8hKbQ0OxRFsx2Px/LNZ+L3EC2Y+ySRKGHhQy
	eS3yU3Z0tTMvxhAg==
Date: Tue, 08 Sep 2026 08:33:48 +0200
Subject: [PATCH v5 14/24] ARM: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-14-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2444;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5Gobf0xeM6oQnluCotYvDM+iRhHp/CqDKzVKvDYgKwE=;
 b=lQ6F773yey6sveLRjZ316ezChGjQ/W1VbZFhepBwbB+581BX6rUFfyRGnwkoZjYfE1ZBXrBr1
 697Lhc8ZNfWDhI1gNse15EH3qBq+xOPmSQUzK0CAa+i2HEmHInauhxP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233400_083263_5FBBCE87 
X-CRM114-Status: GOOD (  11.52  )
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
LmRlPgotLS0KIGFyY2gvYXJtL21tL0tjb25maWcgICAgICAgICB8IDEgKwogYXJjaC9hcm0vdmRz
by9NYWtlZmlsZSAgICAgIHwgNCArKy0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgfCA5
ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21tL0tjb25maWcgYi9hcmNoL2FybS9tbS9LY29u
ZmlnCmluZGV4IDY1NzQ2NTlkZmI2MS4uNTY1OTg4YTY2ZTk4IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9tbS9LY29uZmlnCisrKyBiL2FyY2gvYXJtL21tL0tjb25maWcKQEAgLTk1MCw2ICs5NTAsNyBA
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
dmRzb2NoZWNrLnJzCmluZGV4IDExNzRkODk2YTY4Yi4uZmI4OGVmMGJlMDlkIDEwMDY0NAotLS0g
YS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzCkBAIC00OCw2ICs0OCwxNSBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNo
aW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAg
ICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAor
ICAgICAgICBiaW5kaW5nczo6RU1fQVJNID0+IEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAgICAg
ICAgICBpbl9vYmplY3RfZmlsZTogJlsKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9BUk1f
Tk9ORSwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9BUk1fUkVMMzIsCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfQVJNX1BSRUwzMSwKKyAgICAgICAgICAgIF0sCisgICAgICAgICAg
ICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQorICAgICAgICB9CisgICAgICAgIC5pbnRvKCksCiAgICAg
ICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
