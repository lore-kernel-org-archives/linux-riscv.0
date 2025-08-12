Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E8ACA0EDB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7h067XI3im7zIRfPqDE3LV9yXXZKXXxvEmvSZN1Voo=; b=0tlbodxtFYKTtc
	VLOduxuZKL1taiRzVN9hOCjG8rIaYmlHDhxDlyFZpBpzXwsiDUyg86mQ8jaYYWveKzGEymhZ/pv2O
	tJYDzbLGNio0nByIqGvDKQhOMEp3c3q3BP2oiBDQiwo135OxLpR/7uM5NEM/Kkk5Z2shGKuvsscr2
	/goOxZ3A2Ty1054/GVK6pSpv3GTWbjZjKkpqnTXnMIl8CwLTwHSnwo5fSTCEOaaWj8jewpMyMxM4u
	LLFyT3P/Lzp35sgm9lWH4sz9lMa+g5NvjRsABTSAVdsZ6qZjW6vLHAOStpuGx05S/yGHpJ6UVKNNI
	+Aa337dx2TjcncGIhigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljwM-0000000ABEU-0d08;
	Tue, 12 Aug 2025 08:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoh-00000009vEV-3Vtg;
	Tue, 12 Aug 2025 05:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=; b=DIqyKj/uJmcq1zTZ5QH3bOqRFZ
	Sy8E3z5fL0iccx/xNNY8DvWdSZkgEKcwcpRM3TDCB87ls0TN2D4SamoY7BOYnxxRFNtfunokEe6ts
	GsaZLXWEPltZJ/YcuHZ8VQJJvSx9GzsFawgYcXfDAd0im9ciwkJ2BPlvm4M37sk46liDw8qSal5Qx
	w9EFQgGfGFilZdR65OELhaBhfiMZxQxcOMUag3IysKKkiaeztTDU3Q/bYBKDbTDB9RDTayNCLdINO
	wGCHztyQ+170GfzxMmpnfNhyhNH3/k4OKr/VNHUt04FdN3Q1mRto97KqdosLG4MagycG9lWSF/W9y
	5Lfc1DiQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoZ-0000000FgBe-1tCW;
	Tue, 12 Aug 2025 05:44:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=;
	b=4R7GK1Ns/hWx6TZIMnggUIdGxwNwFjzJWNFPxFs848dnDyWhFTvY+RMOmyP5Kp+tWOTxnw
	FMlWKazRs5aP80wuH+qVWYytZv2LPeT/htFzHm3zzQzRpZoSuglfAWCyLaRWo1xXJK3mze
	/EDXe9OX84IGqHKBu9Lj8PeaIAKiz3QONIRgJL07IsxQop3aVJVwOfvc4DfnQsvz9hR/K9
	FJWfI4Bec2VKnqy05LcEGQbq/VuFg76FAL/nGbNsK+Zp7Tb5Sn4jo6tXggcHjI+ruiVkZe
	efTuVKXLYnIxrPThzovEFcWF7aLKC9SRppWxAoQoH2kdV9cj8m1DRyvh4j321Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=;
	b=k3fJ6hiVMh2JFiv+1qKUzRxGonhn1sC95oifI2QM636AD1C5COlMeHHYVWR9m5qnrDzCl0
	WQQ3zD4hOmEYiUCA==
Date: Tue, 12 Aug 2025 07:44:31 +0200
Subject: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1406;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SOEunbiKKKTnOWrF+pK81yxcp7tmWh1LCgMbmBwYcqE=;
 b=1Yj/TLz9zqgfdJG4tPNUhVnU/LPFKndOYqYO2YKY3GvxdtS2InB9rllJGVyVAVRovcYvZjFXM
 1mmMqVL3+dfBRWzstw5hka5H6IK1HeBJJp4KVZMkpgRQSb3KON+DLoI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064453_724205_5A613B71 
X-CRM114-Status: GOOD (  10.82  )
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

QWxsIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIHN1cHBvcnRpbmcgTFRPICh4ODYsIGFybTY0LCBs
b29uZ2FyY2gpIGRvIG5vdAp1c2UgaXQgZm9yIHRoZSB2RFNPLgoKSXRzIGlzIHByb2JsZW1hdGlj
IGZvciBzb21lIHVwY29taW5nIGNvbXBpbGUtdGltZSB2YWxpZGF0aW9uIG9mIHRoZQpnZW5lcmF0
ZWQgb2JqZWN0IGNvZGUuClRoZSBMVE8gb2JqZWN0IGZpbGVzIGRvIG5vdCBjb250YWluIHRoZSBu
ZWNlc3NhcnkgcmVsb2NhdGlvbiBpbmZvcm1hdGlvbgphbmQgLWZsdG8tZmF0LW9iamVjdHMgaXMg
bm90IGNvbXBhdGlibGUgd2l0aCBjbGFuZyA8IDE2LgoKRm9yIGNvbnNpc3RlbmN5IGFuZCB0byBl
bmFibGUgdGhlIG1lbnRpb25lZCBjb21waWxlLXRpbWUgY2hlY2tzLApkaXNhYmxlIExUTyBmb3Ig
dGhlIHZEU08uClRoZSB2RFNPIGhlYXZpbHkgdXNlcyBfX2Fsd2F5c19pbmxpbmUgYW55d2F5cy4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwu
b3JnPgpUZXN0ZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQppbmRleCBj
MTljM2M3NmY3YzlmNmIyZjc1MjNhNTkyNjlkZTNiNjgzNjU2MzIzLi45ZjFiZjViYWU5YmQ0NzNl
NDNkOWZkMzAyMmU5ZTFhMTg1MTI4YjczIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKQEAgLTQ5
LDcgKzQ5LDcgQEAgQ1BQRkxBR1NfdmRzby5sZHMgKz0gLURIQVNfVkdFVFRJTUVPRkRBWQogZW5k
aWYKIAogIyBEaXNhYmxlIC1wZyB0byBwcmV2ZW50IGluc2VydCBjYWxsIHNpdGUKLUNGTEFHU19S
RU1PVkVfVkRTTyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdTX1NDUykKK0NGTEFHU19S
RU1PVkVfVkRTTyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdTX1NDUykgJChDQ19GTEFH
U19MVE8pCiBDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQoQ0ZMQUdTX1JFTU9WRV9W
RFNPKQogQ0ZMQUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0ZMQUdTX1JFTU9WRV9WRFNPKQog
Q0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENGTEFHU19SRU1PVkVfVkRTTykKCi0tIAoyLjUw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
