Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3232C79FA0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNszgqvScW5zEkPtBqSJLw85uMUMRykFYNcF99NEugg=; b=DeBES1bnKwGhCV
	R2PKHOQw8QXfxXW4txUuhYOINI7m39nObYsuXzeH89EZ7ICEwT8Z3GyOkFC4aGpMkTeoKb8pLba/u
	mrnGqYWZAP6KV2wBRI6e8+w6BQm1lBQRaQC/UhVOpbrs4sclshbrTTlls1+3SN7O+oDgFoLhd95zR
	Q+nin5IIvE/R3FUhbbDs9bD5J1CmQMZtsS6/0EamsQ9Ghd4A66HNWBlzpJOD4Eb9DzpmR4W/4Uzqt
	wUz16KZr+u4SnD5ri2tC/NiPzr2OUbAKNSyPEDpva9C99CBduZb8t3LijGmQheISiJz/VM1vr/IS5
	xyU6Yagb4kt5e61EJVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pQ6-00000008Aao-0Zha;
	Tue, 08 Sep 2026 06:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPI-000000089HN-28MG;
	Tue, 08 Sep 2026 06:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IidQ31ouFEpYA+nS17u9E6l6j5+J0X/Qbfbzc/4EoAk=; b=eYn5jHayOrRGt5jHi6sL0tVK+E
	3wHUmAzIebpoYA1aYAukiFp45vvmAAUMqFNe+5TIKV7miaw7uwa/73SvNkaS7HyCCVP+SxnDIegB2
	xpD4gfKTwXlxROTXKF69+fZf1CkpiO4lQNmJKuYpfOCnFyof1NcDuwBfEwjtDUXtPe6yJvYLECiT3
	8YG9g/ZVHEABiXA2Z1zDqiwqYbW5ZiJZky7Zj4meNYFergfvcf2l/u8t/hhY/NJkC1kpJ3b7tVlmp
	XqUOjHYY+39TZkRXwV3cXDz3qmXFnMvUNbL0ueKvB8BUzGRsQbGEH9/x1Zksbl6x4Qwsc78baWnQd
	QkARHRUw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3pPB-0000000Gyk4-3rXK;
	Tue, 08 Sep 2026 06:34:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IidQ31ouFEpYA+nS17u9E6l6j5+J0X/Qbfbzc/4EoAk=;
	b=13h/LZm3oUN5NX5d1pSwDpq6WOOrKuWkeooevs0Slh2NpnZURtKGe5KDBp1tQw/iOP/Foz
	jG+leFqUbZb1il3/yws247n0LE1Oo2UrRebiDasMImoeAvycvfaJtgt5FG43hx0rRvf/kt
	b+qd66u6bARnZouWXpm8baIEtwrHmqnbB+RfcaWW8MXCqXeqNj1m+ijLG4q2iVvSt4mr5y
	vJu0ZR+0GxgCwURI/L5/KXvu6rMPzu3XO6orwkZFexgMHMpLQ9jIedo5jxhPNs6DVioHIi
	NBeKQtqchUF1TAHOOMcD+uSWgwhGZFMn6e2sbJf5DzX9oTp0lkDYo51oJaVyWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IidQ31ouFEpYA+nS17u9E6l6j5+J0X/Qbfbzc/4EoAk=;
	b=iI6SCa0eTjj8cRYwu7N3BX4E5LcC26uVQ6b5eTpae2XyKJDB0AL3DOO+Qmt0gRz3YcZJfO
	b4Ep6HUDa68rhZAg==
Date: Tue, 08 Sep 2026 08:33:54 +0200
Subject: [PATCH v5 20/24] s390/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-20-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=2270;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MheUrTVMsMhlO1Hx/uIAQcNaOa1zLZs90zNsA4xVFXI=;
 b=QPV6rtkThGmgCrpePDg3k3KYmTBWvY98MetgMiUyonNPORVe5K/DIqywgywggjAngHoM9YG0V
 mAFJANMdk6aBtyL1evmiJG/8n0kShbhIewzAsKEqRmtcX5PbBAf3zZb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_073406_287811_565401DB 
X-CRM114-Status: GOOD (  10.60  )
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
LmRlPgotLS0KIGFyY2gvczM5MC9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwogYXJjaC9zMzkw
L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgNCArKy0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgICAgfCA5ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9LY29uZmlnIGIvYXJjaC9zMzkw
L0tjb25maWcKaW5kZXggNGI1MWJjNmU4OTQ4Li5iYzEyMzY3YTdiMDAgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvczM5MC9LY29uZmlnCisrKyBiL2FyY2gvczM5MC9LY29uZmlnCkBAIC0yOTEsNiArMjkxLDcg
QEAgY29uZmlnIFMzOTAKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBU
VFkKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQKKwlzZWxlY3QgVkRTT19DSEVDSwog
CXNlbGVjdCBWRFNPX0dFVFJBTkRPTQogCXNlbGVjdCBWSVJUX0NQVV9BQ0NPVU5USU5HCiAJc2Vs
ZWN0IFZNQVBfU1RBQ0sKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmls
ZSBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmlsZQppbmRleCAzNWM4MzRiODk1ZWMuLjUw
OWVmM2YxZTJlYiAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC92ZHNvL01ha2VmaWxlCisr
KyBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtlZmlsZQpAQCAtNDQsMTAgKzQ0LDEwIEBAIENQ
UEZMQUdTX3Zkc28ubGRzICs9IC1QIC1DIC1VJChBUkNIKQogJChvYmopL3Zkc29fd3JhcHBlci5v
IDogJChvYmopL3Zkc28uc28KIAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAk
QAotICAgICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfbGQpOyAkKGNtZF92ZHNvX2NoZWNr
KQorICAgICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfbGRfdmRzbyk7ICQoY21kX3Zkc29f
Y2hlY2spCiAKICMgbGluayBydWxlIGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZp
cnN0Ci0kKG9iaikvdmRzby5zby5kYmc6ICQob2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSAkKG9i
ai1jdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQob2Jq
LXZkc28pICQob2JqLWN2ZHNvKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdl
ZCx2ZHNvX2FuZF9jaGVjaykKIAogIyBzdHJpcCBydWxlIGZvciB0aGUgLnNvIGZpbGUKZGlmZiAt
LWdpdCBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29j
aGVjay5ycwppbmRleCA0YWViNzA5NGU1NTIuLmIyMTM1Y2Y5YWRkMyAxMDA2NDQKLS0tIGEvbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5y
cwpAQCAtMTQ4LDYgKzE0OCwxNSBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5l
KG1hY2hpbmU6IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAg
ICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAg
ICAgICBiaW5kaW5nczo6RU1fUzM5MCA9PiBBbGxvd2VkUmVsb2NhdGlvbnMgeworICAgICAgICAg
ICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfMzkwX1BD
MzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfMzkwX1BDMzJEQkwsCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfMzkwX1BMVDMyREJMLAorICAgICAgICAgICAgXSwKKyAgICAgICAg
ICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCisgICAgICAgIH0KKyAgICAgICAgLmludG8oKSwKICAg
ICAgICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
