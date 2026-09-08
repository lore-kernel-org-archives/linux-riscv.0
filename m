Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3979C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qg1FEg9162g6rnU1nkuEIJgMwpaN6VwsR78yGDN7HA=; b=DVoKoAufMiD0+2
	BaaO9RfWVFrSkOfHzdIvG5/all30Ks4pySbO0UOt0jEhyGbopDe9b4o+SwyhuQ7voGU9zJKrAuDWf
	bNwryPfvOlSotArT8hFV33a3UMZTdhDz3lzw8cJsXJ2p7X7Ss4fk7eZC3LifNNxW4gvD/ehJBv16u
	SOa5pUhxlvfH5cUd5I49RQ0DmdeMSWjDv+vk6rXeVYJkz822G+UxuzXK9fe54CY1TS+sH2iNu0wdm
	wNlL8zMqaWUp666cbKNEg2WZxW2wShAwnPK8PlFdJgHKjTG6vtSr+SxnehHwKjvnfcvmTTKXZWE+/
	4rGyAwq1/BTHkbfrKV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pQ3-00000008AVX-42WB;
	Tue, 08 Sep 2026 06:35:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPE-000000089A9-2VD7;
	Tue, 08 Sep 2026 06:34:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvvMxpUTqAEjiM3SZ1i5vbN0jdjv1MyFM9wry6aTCDE=;
	b=WBE4KgbvH8kKhUW/1mt3DB5+lWOHeFh2YjFybHYrrBsmrY2ZyAqO3icprjc6on//kHKDtk
	HB1LuQSN7pZZKwd5RBe8nuI6fSR0dbnUUR67KgQC1s+qvS+xekGfIxUFVJr6cBIIla1iRQ
	Pqti70mJFUku/mfF1rtravNpxc8SH1+92ERlDw3x2YziDALGNpp943EMeivH19adfG+/Aj
	VZK4wxoyLehM+EGyoPoYbPLLuQC/yubqhhJtQkd+dFyM4J5VaiAOq5VkdqZCz1aVAs3SR1
	SNIaSXLdkkizWNRLaco0lVWGHJpUVtEp5Wf6hYJxHhSY4QvgMW+g4dPa/yIVAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvvMxpUTqAEjiM3SZ1i5vbN0jdjv1MyFM9wry6aTCDE=;
	b=sVkxWMeaYxucsCDJ/RG28/BLYHUBsU6GemnSsC+Hb2roWTxpx19k5S+RFDdxb73NoYk7U1
	GeSdWRCauEyymSCA==
Date: Tue, 08 Sep 2026 08:33:56 +0200
Subject: [PATCH v5 22/24] MIPS: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-22-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=3612;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ubtEZQjioty7c/a+mAfAlWzRsxWg9fuzdks4Wf55EiQ=;
 b=RqRZw3iuixUJm3LXZwv2PoTvjs+ri9BP0dx1fHP9VLv0hbj4XHaJ17g2P6yABJITcSMSnaugu
 tXiQHncbBYnDqVwCO/h5YQtqULq/BU7nhp+Fszo6uKYG4HA2Ws6L76u
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233409_489156_B3E6C776 
X-CRM114-Status: GOOD (  10.04  )
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
LmRlPgotLS0KIGFyY2gvbWlwcy9LY29uZmlnICAgICAgICAgICB8ICAxICsKIGFyY2gvbWlwcy92
ZHNvL01ha2VmaWxlICAgICB8ICA4ICsrKystLS0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgfCAxNSArKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvS2NvbmZpZyBiL2FyY2gv
bWlwcy9LY29uZmlnCmluZGV4IGUyZWI5NjI3YmQxNC4uOWEzY2U1NTBjOTVkIDEwMDY0NAotLS0g
YS9hcmNoL21pcHMvS2NvbmZpZworKysgYi9hcmNoL21pcHMvS2NvbmZpZwpAQCAtMTA3LDYgKzEw
Nyw3IEBAIGNvbmZpZyBNSVBTCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKIAlzZWxl
Y3QgQVJDSF9IQVNfRUxGQ09SRV9DT01QQVQKIAlzZWxlY3QgSEFWRV9BUkNIX0tDU0FOIGlmIDY0
QklUCisJc2VsZWN0IFZEU09fQ0hFQ0sKIAogY29uZmlnIE1JUFNfRklYVVBfQklHUEhZU19BRERS
CiAJYm9vbApkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3Zkc28vTWFrZWZpbGUgYi9hcmNoL21pcHMv
dmRzby9NYWtlZmlsZQppbmRleCAwMGQzYmEyYzQ4MmEuLjYzMDYwMDU3Y2QyMSAxMDA2NDQKLS0t
IGEvYXJjaC9taXBzL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9taXBzL3Zkc28vTWFrZWZpbGUK
QEAgLTY2LDcgKzY2LDcgQEAgcXVpZXRfY21kX3Zkc29fbWlwc19jaGVjayA9IFZEU09DSEsgJEAK
ICMKIAogcXVpZXRfY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9IExEICAgICAgJEAKLSAgICAg
IGNtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZCk7ICQoY21kX3Zkc29fY2hlY2sp
OyAkKGNtZF92ZHNvX21pcHNfY2hlY2spCisgICAgICBjbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNr
ID0gJChjbWRfbGRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spOyAkKGNtZF92ZHNvX21pcHNfY2hl
Y2spCiAKIHF1aWV0X2NtZF92ZHNvYXNfb19TID0gQVMgICAgICAkQAogICAgICAgY21kX3Zkc29h
c19vX1MgPSAkKENDKSAkKGFfZmxhZ3MpIC1jIC1vICRAICQ8CkBAIC0xMDMsNyArMTAzLDcgQEAg
JChvYmotdmRzbyk6IEtCVUlMRF9BRkxBR1MgOj0gJChhZmxhZ3MtdmRzbykgJChuYXRpdmUtYWJp
KQogCiAkKG9iaikvdmRzby5sZHM6IEtCVUlMRF9DUFBGTEFHUyA6PSAkKGNjZmxhZ3MtdmRzbykg
JChuYXRpdmUtYWJpKQogCi0kKG9iaikvdmRzby5zby5kYmcucmF3OiAkKG9iaikvdmRzby5sZHMg
JChvYmotdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLmRiZy5yYXc6ICQob2JqKS92ZHNvLmxk
cyAkKG9iai12ZHNvKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNv
bGRfYW5kX3Zkc29fY2hlY2spCiAKICQob2JqKS92ZHNvLWltYWdlLmM6ICQob2JqKS92ZHNvLnNv
LmRiZy5yYXcgJChvYmopL3Zkc28uc28ucmF3IFwKQEAgLTE0MSw3ICsxNDEsNyBAQCAkKG9iaikv
dmRzby1vMzIubGRzOiBLQlVJTERfQ1BQRkxBR1MgOj0gJChjY2ZsYWdzLXZkc28pIC1tYWJpPTMy
CiAkKG9iaikvdmRzby1vMzIubGRzOiAkKHNyYykvdmRzby5sZHMuUyBGT1JDRQogCSQoY2FsbCBp
Zl9jaGFuZ2VkX2RlcCxjcHBfbGRzX1MpCiAKLSQob2JqKS92ZHNvLW8zMi5zby5kYmcucmF3OiAk
KG9iaikvdmRzby1vMzIubGRzICQob2JqLXZkc28tbzMyKSBGT1JDRQorJChvYmopL3Zkc28tbzMy
LnNvLmRiZy5yYXc6ICQob2JqKS92ZHNvLW8zMi5sZHMgJChvYmotdmRzby1vMzIpICQodmRzb2No
ZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29sZF9hbmRfdmRzb19jaGVjaykKIAog
JChvYmopL3Zkc28tbzMyLWltYWdlLmM6IFZEU09fTkFNRSA6PSBvMzIKQEAgLTE4MSw3ICsxODEs
NyBAQCAkKG9iaikvdmRzby1uMzIubGRzOiBLQlVJTERfQ1BQRkxBR1MgOj0gJChjY2ZsYWdzLXZk
c28pIC1tYWJpPW4zMgogJChvYmopL3Zkc28tbjMyLmxkczogJChzcmMpL3Zkc28ubGRzLlMgRk9S
Q0UKIAkkKGNhbGwgaWZfY2hhbmdlZF9kZXAsY3BwX2xkc19TKQogCi0kKG9iaikvdmRzby1uMzIu
c28uZGJnLnJhdzogJChvYmopL3Zkc28tbjMyLmxkcyAkKG9iai12ZHNvLW4zMikgRk9SQ0UKKyQo
b2JqKS92ZHNvLW4zMi5zby5kYmcucmF3OiAkKG9iaikvdmRzby1uMzIubGRzICQob2JqLXZkc28t
bjMyKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvbGRfYW5kX3Zk
c29fY2hlY2spCiAKICQob2JqKS92ZHNvLW4zMi1pbWFnZS5jOiBWRFNPX05BTUUgOj0gbjMyCmRp
ZmYgLS1naXQgYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92
ZHNvY2hlY2sucnMKaW5kZXggYjIxMzVjZjlhZGQzLi44NjVlOGNmN2Q0ZTEgMTAwNjQ0Ci0tLSBh
L2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hl
Y2sucnMKQEAgLTE1Nyw2ICsxNTcsMjEgQEAgZm4gYWxsb3dlZF9yZWxvY2F0aW9uc19mb3JfbWFj
aGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2VkUmVsb2NhdGlvbnM8J3MKICAgICAg
ICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAgIH0KICAgICAgICAgLmludG8oKSwK
KyAgICAgICAgYmluZGluZ3M6OkVNX01JUFMgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAg
ICAgICAgIGlnbm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6ICZbIi5yZWwucGRyIiwgIi5yZWxh
LnBkciJdLAorICAgICAgICAgICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAg
YmluZGluZ3M6OlJfTUlQU19QQzE2LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX01JUFNf
UEMyMV9TMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9NSVBTX1BDMjZfUzIsCisgICAg
ICAgICAgICAgICAgYmluZGluZ3M6OlJfTUlQU19QQzE4X1MzLAorICAgICAgICAgICAgICAgIGJp
bmRpbmdzOjpSX01JUFNfUEMxOV9TMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9NSVBT
X1BDSEkxNiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9NSVBTX1BDTE8xNiwKKyAgICAg
ICAgICAgICAgICBiaW5kaW5nczo6Ul9NSVBTX1BDMzIsCisgICAgICAgICAgICBdLAorICAgICAg
ICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAgICAgICAuaW50bygpLAog
ICAgICAgICBfID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
