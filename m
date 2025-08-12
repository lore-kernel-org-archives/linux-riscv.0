Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E1CA0EDB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6Ub/PgVR+2Vq6X1aMIOE1SGlBd3ejgpNlcc1EMBk3I=; b=AcOHG9d+BFjJm+
	hxM6QR6YXPxtcD79scWWlzB/4g6Dzn01GlW1xjjiVFINyif5tekwFqQ3GwlxV51GrxE+Dk5IKX29L
	FMZrn7Y9te3v2wAmBfuSQrIrrBCrQZAMW1++2OVGsP0EsU2JFLDo0WijU/bXeZIewK6s8oN1lMRQs
	drI4rNDBXftoM0EyRKT3ZUBFQkkxrR7B28MeKxUrZYOoGq5n/0TT+qONicmNQmJTbErgZs1B4uYai
	EwAkkdCnnFIAch3C3HqtPAMC0czQbTL0EQLknqAOv6AJWRW5nj2KtAsUac/jCybFJfrlexxdRIrXj
	/thLZoazHyE/pL51zbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoK-00000009ulP-2Du0;
	Tue, 12 Aug 2025 05:44:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoG-00000009uhn-1qgi;
	Tue, 12 Aug 2025 05:44:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=JqzHOjKA7yrLionJrJNO8KOAarJG0Oo28v1APFSwq89167wmxb1lZyHMuXNnHrDwxH9gSS
	/ELfgioTR5fb/Ljc+sYJEHqydQykqY+dPku+piakuLpoYplUy8nu370IDCExIRAVnKTo2d
	+v+xsnzyadL06twVI4C4micp1yORPIESPL7D6qalI1kfH6fJTrTV7AQ+lUY6RdlBKcOlnG
	roKFqmu0T++7EKHvIZhYIq0thUktatKAE+bdUH3O4P8hQJDR+cw+xBAhVt8geh7pm3kY7R
	qbqMp5Grpn0o6oeLQHjtKHgrAL7YpnUDvTR5ZMbjSFY5TkenW05hQQv/hde6lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=eJOu4USmFl8u450RqsRFSXa2Lhj6NjHhqFOSqGSdot5xvQYhfz7huLEAqhu43i8HbV2r/Y
	gOvSdTkIIYEnsrBw==
Date: Tue, 12 Aug 2025 07:44:14 +0200
Subject: [PATCH v4 01/24] elf, uapi: Add a header for relocation constants
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-1-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1460;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pEZOOlfYLKHxA52mtxp/u2Atua1rkGYZwTp881737QA=;
 b=FP2/6LZXvWWXU9TWRCOGilFMCMdFH/DUVBCJoOqArDIYqbLz6sxu9BRz2ZOAaXa6pVuX1T7y8
 Okzk+BkTdhVBChLHs5Bq2jeBZHod38wzt/AG9GAvJK+HF4hyrhvGqlM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224432_654270_0433DEC7 
X-CRM114-Status: GOOD (  15.26  )
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

V2hpbGUgdGhlIG51bWVyaWMgY29uc3RhbnRzIGZvciByZWxvY2F0aW9ucyBhcmUgYXJjaGl0ZWN0
dXJlIHNwZWNpZmljLAppdCBpcyBzdGlsbCB1c2VmdWwgdG8gZ2V0IGFjY2VzcyB0byB0aGVtIGZy
b20gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KQWxzbyB0aGUgZGVmaW5pdGlvbnMgYXJlIHVzZWZ1bCBm
b3IgdXNlcnNwYWNlIGluIGdlbmVyYWwuCkZvciBleGFtcGxlIHRvb2xzIHByb2Nlc3NpbmcgZWxm
IGZpbGVzIGR1cmluZyBhIGtlcm5lbCBjcm9zcy1jb21waWxhdGlvbgpjYW4gbWFrZSB1c2Ugb2Yg
dGhlbS4KCkludHJvZHVjZSBhIGRlZGljYXRlZCBoZWFkZXIgZm9yIHRoZW0sIHNpbWlsYXIgdG8g
dGhlIGVsZi1lbS5oIGhlYWRlci4KRm9yIG5vdyB0aGUgaGVhZGVyIGlzIGVtcHR5IGJ1dCBpdCB3
aWxsIGJlIGZpbGxlZCBzdGVwIGJ5IHN0ZXAgaW4KdXBjb21taW5nIGNvbW1pdHMuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCB8IDUgKysrKysKIGluY2x1ZGUvdWFw
aS9saW51eC9lbGYuaCAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi1yLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMmMzODJjOGE0ODA3ZjM5NGEzY2NhYmYzOWE4MWU5ZTli
NmY3ZWE0NQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBA
IC0wLDAgKzEsNSBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBM
aW51eC1zeXNjYWxsLW5vdGUgKi8KKyNpZm5kZWYgX1VBUElfTElOVVhfRUxGX1JfSAorI2RlZmlu
ZSBfVUFQSV9MSU5VWF9FTEZfUl9ICisKKyNlbmRpZiAvKiBfVUFQSV9MSU5VWF9FTEZfUl9IICov
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmggYi9pbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLmgKaW5kZXggODE5ZGVkMmQzOWRlMmJmY2ZjYTNjMjVhNTJjOGI4Y2Q1MWEwMWMxMi4u
M2QxODU0M2Q1NDYwYTc1N2YwNTc4YWZlNWQ0ODcyMzNmZmFhM2M1NyAxMDA2NDQKLS0tIGEvaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYuaApAQCAt
NCw2ICs0LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgv
ZWxmLWVtLmg+CisjaW5jbHVkZSA8bGludXgvZWxmLXIuaD4KIAogLyogMzItYml0IEVMRiBiYXNl
IHR5cGVzLiAqLwogdHlwZWRlZiBfX3UzMglFbGYzMl9BZGRyOwoKLS0gCjIuNTAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
