Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EA1C79FA0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2SudfgSGVDY5mTWGfQqOpCTN4Or8MzyDj6Pqhs4xlw=; b=xzl4aMKBxeb/t8
	BT36dORwIGggtovltoy8fX1RmttvhirLdlfFPihT/gw0cqdL0moOv64MPdy1CNVyfdq3NG0rJ7H04
	b4PZ0DA9EOt/SauEGeVtCtzQ/YPSsywI/L8UxyB0R6xjeQWRY5q5iU6ESx46miIRPrsP37ZRvYiJ+
	rfJiqUjcul1zVr47VQNRHW9dU/7zlqfmgv4oV7qe4ztg63kt8Mb74u0vWPPHZ+qRe3ya9Loe/z65N
	ObUidx0kDxKMbbi0nGDCrVggLHSWMCj8uCzjP2fCG9UCyZUTM4gMm/FSDMpfLOFFDeHhnpnniy60E
	CQa2xwxcbsoY6IKnlvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPt-00000008ACM-44tm;
	Tue, 08 Sep 2026 06:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPF-000000089Cr-195B;
	Tue, 08 Sep 2026 06:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QpMeGTA/JL9YkhE8VitmDDEUz8BAqAeVVV3RUo7s8KM=; b=RAi3OvNbUf0wRNRzNaWYEsravb
	JxPvlGhUM4igfzFoVlsabOfudjhr6SsHeqg5zz44JWQguyKassWjjJNNrom1NCgM4Wd12P85Y1ZwW
	X4Fh+PuGBmGQlR21N1d02WyLoZeu7SAbgjuEa6pNgwsF63dG7kpc+FGVAMj9TikAjXcn6EJ11Z0lN
	LbeWb0C5Zd57p4CfLq1AO1NfPe9IH0VgTaQKXcjod5+3AO2vETWm2FcKLexWdLwYkhch9mppKyMu4
	iSMbx+I2md3vMmH/IOiSVbwyJMMKTzY0HeMCzlFZRaigMFL5t/oYt0QNFXoPVcSEHqRWa/CvagxXs
	rfM/7G2w==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3pPC-0000000Gyki-0uG0;
	Tue, 08 Sep 2026 06:34:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpMeGTA/JL9YkhE8VitmDDEUz8BAqAeVVV3RUo7s8KM=;
	b=YMIoDXx/ryyJO/wNSJr79hBrk/1uKFLoRwuyXWq2ERwfWyVqyJffleMbiT+vvuWtO204/K
	XO3RmXGCnqV4w7lfkhlRudbX45mFtdRD41W9PJVoty/pqKiHswGZXTaKvmOaxPSu5VZJVM
	xxsp4AJePJ+ALKIQ/EeGwO+kVJXptZyvKlxH78jJhdZkeOrN+Ww5q1WKtNHcy76t1B+jzv
	XQRYBH9ansqx4KI/6zXA4pK/oLhRKj+aRYBHIq9E7X1UO0E3YCVRVTfZ6ee2DiCObTk4zf
	wtUuUCDZU7XTwecLf7y0KofwzMRjqZcFYKJ6viLp4DkuxsMmnK/jJKnBlUZEnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpMeGTA/JL9YkhE8VitmDDEUz8BAqAeVVV3RUo7s8KM=;
	b=Wz8zdRK+ls5E3Iazhq49Wi6Kk0ecGxrc48ZY5jjgK217bXfYrQAd4sT7ItwhO6FCRyToCS
	ZOi8PKGbBnEfh/BQ==
Date: Tue, 08 Sep 2026 08:33:55 +0200
Subject: [PATCH v5 21/24] MIPS: ELF: Add more PC-relative relocation
 definitions
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-21-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=1280;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=R3oIxCvKReHS31AXFavRgNPui6/4omq3e3P+29cRTsM=;
 b=rkjnjj70dplXDvHhkzfJOvBIecn20+RvsB4YJZT7kS6dmC1XplZqrPoTSbkM+YB0aLRxuxOb5
 Wp9eyI0SYfRAyhHyeFjnDOCIAqDeZA0dEsHaudn+dA9ns9ki2xZGWbR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_073406_561681_987D4B78 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

VGhlc2UgYXJlIHVzZWQgYnkgdXNlcnNwYWNlIGFuZCBhcmUgbmVjZXNzYXJ5IGZvciB0aGUgdmRz
b2NoZWNrIHRvb2wuCgpBbHNvIHVwZGF0ZSB0aGUgY29weSBpbiB0b29scy8gc28gdGhleSBjYW4g
YmUgdXNlZCBieSB2ZHNvY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgv
ZWxmLXIuaCAgICAgICB8IDQgKysrKwogdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgg
fCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaApp
bmRleCAxNzA4ODg0MjI0MDAuLmE2YTRkNzY0M2M1ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L2VsZi1yLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKQEAgLTY0Niw2
ICs2NDYsMTAgQEAKICAqLwogI2RlZmluZSBSX01JUFNfUEMyMV9TMgkJNjAKICNkZWZpbmUgUl9N
SVBTX1BDMjZfUzIJCTYxCisjZGVmaW5lIFJfTUlQU19QQzE4X1MzCQk2MgorI2RlZmluZSBSX01J
UFNfUEMxOV9TMgkJNjMKKyNkZWZpbmUgUl9NSVBTX1BDSEkxNgkJNjQKKyNkZWZpbmUgUl9NSVBT
X1BDTE8xNgkJNjUKIC8qCiAgKiBUaGlzIHJhbmdlIGlzIHJlc2VydmVkIGZvciB2ZW5kb3Igc3Bl
Y2lmaWMgcmVsb2NhdGlvbnMuCiAgKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9s
aW51eC9lbGYtci5oIGIvdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKaW5kZXggMTcw
ODg4NDIyNDAwLi5hNmE0ZDc2NDNjNWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9s
aW51eC9lbGYtci5oCisrKyBiL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC02
NDYsNiArNjQ2LDEwIEBACiAgKi8KICNkZWZpbmUgUl9NSVBTX1BDMjFfUzIJCTYwCiAjZGVmaW5l
IFJfTUlQU19QQzI2X1MyCQk2MQorI2RlZmluZSBSX01JUFNfUEMxOF9TMwkJNjIKKyNkZWZpbmUg
Ul9NSVBTX1BDMTlfUzIJCTYzCisjZGVmaW5lIFJfTUlQU19QQ0hJMTYJCTY0CisjZGVmaW5lIFJf
TUlQU19QQ0xPMTYJCTY1CiAvKgogICogVGhpcyByYW5nZSBpcyByZXNlcnZlZCBmb3IgdmVuZG9y
IHNwZWNpZmljIHJlbG9jYXRpb25zLgogICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
