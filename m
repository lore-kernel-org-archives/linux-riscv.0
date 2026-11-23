Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D65606A32D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWzQvbLD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SiwubxeC;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PafwDopS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VPp/LhJGbsqpylVpn8qa23vDJe2GfzTSNKku6O6Mu08=; b=bWzQvbLD8g3cnTCTrfyZUiZiKO
	G3tB1ZSPHksfE0N56So3KymwSOc1IReK6VcuvUqSm0p7OeUr2xEX8ap/Wvy7ydk3WuJkxsCPcOFx2
	p0hJXiDzyXOkuCjuQqt2WSbATTjLPIr5hdkjsBqQoeToufw4z72xpZVyZQ3VBbB+bOZupI6HGAO4l
	aAM2nVGGZtsA76OblE8tmgikhlz6Ix0x+yw1Y2vOzAq5/JrdWbvB+gfG0+2RJe2rdPVEr5Y341kUP
	QAaolSHqHnoRpG833em+krMMFCiV1CAJW9AQ7bFShZqZ2U4Khc39BpObLue01h2CAFJDwfJHDJHo8
	9A9puZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSW-00000003eZk-3DrQ;
	Mon, 23 Nov 2026 13:51:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSH-00000003e9i-0gLB;
	Mon, 23 Nov 2026 13:51:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjaHNfa5Y44gCMgWsYt1z6nK9zr8xQHMwn0hbi1HiNM=;
	b=SiwubxeCodkmCiyMiY0r3O3GYOxwf9QzlLWSX2cpPhBgivhjzkKnYInYXnUPRJ9q1AM6fa
	9KkieGgGHK4lkoTLljHPihz1R+eHTQWESt5TuMG50onKo49h7JofyUYZZjilfRnsoib5mr
	Qiqs0Z3BCxBrRWAky4Cn2HdCp/gn12+i0i5+6/PA8n1jhoJpgxx+HlaevhQMaSmZl+G+TQ
	JsfPuj61DWlLMARl4U0pr8/7yoD0mIcpoVMSqSy6jG/w5ANlrvclfuNYCWounvhNVvu7wn
	eqhn8B09ZzFesEu1LdSxg18G2PPjAT1Do9Jhxt/FuTIm9kaITu6bjzCFpHdSyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjaHNfa5Y44gCMgWsYt1z6nK9zr8xQHMwn0hbi1HiNM=;
	b=PafwDopSrXMBMvIj+bOD/YaIZDnPhIeNmmxdQxl/A5OHikWrncrLqgZj1zSo7Go0RBz1dv
	KMFUL9taJSMknzDA==
Date: Mon, 23 Nov 2026 14:51:00 +0100
Subject: [PATCH v6 09/11] MIPS: vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-9-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3612;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Upl7hsN7pYYITVcy/+9101coWRtl3qz4kkbkOxlORLo=;
 b=1fcEqYJBI/20+ipq+0gDhD2Hd2sHPo/b0TvsKaodh5hN8w9Rzt6iK8kpNsUn/MbwZcKE9qON0
 QkgrCaLMbbZBAsGdd/7c8BYFky+KQdnee/5otFkVjoWKNloGTmEJP3S
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055137_391875_D2EF38BB 
X-CRM114-Status: GOOD (  10.62  )
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
LmRlPgotLS0KIGFyY2gvbWlwcy9LY29uZmlnICAgICAgICAgICB8ICAxICsKIGFyY2gvbWlwcy92
ZHNvL01ha2VmaWxlICAgICB8ICA4ICsrKystLS0tCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgfCAxNSArKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvS2NvbmZpZyBiL2FyY2gv
bWlwcy9LY29uZmlnCmluZGV4IGVkMTdjOWIxNjI0Yy4uMzFjMjQ3YzJmYWViIDEwMDY0NAotLS0g
YS9hcmNoL21pcHMvS2NvbmZpZworKysgYi9hcmNoL21pcHMvS2NvbmZpZwpAQCAtMTA2LDYgKzEw
Niw3IEBAIGNvbmZpZyBNSVBTCiAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKIAlzZWxl
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
ZHNvY2hlY2sucnMKaW5kZXggMWVmM2YyNDBmODg2Li4xMjBkOGZhNTUxZTYgMTAwNjQ0Ci0tLSBh
L2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hl
Y2sucnMKQEAgLTE1Nyw2ICsxNTcsMjEgQEAgZm4gYWxsb3dlZF9yZWxvY2F0aW9uc19mb3JfbWFj
aGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2VkUmVsb2NhdGlvbnM8J3MKICAgICAg
ICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAgIH0KICAgICAgICAgLmludG8oKSwK
KyAgICAgICAgYmluZGluZ3M6OkVNX01JUFMgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAg
ICAgICAgIGlnbm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6ICZbIi5yZWwucGRyIiwgIi5yZWxh
LnBkciJdLAorICAgICAgICAgICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAg
MTAsICAvKiBSX01JUFNfUEMxNiAqLworICAgICAgICAgICAgICAgIDYwLCAgLyogUl9NSVBTX1BD
MjFfUzIgKi8KKyAgICAgICAgICAgICAgICA2MSwgIC8qIFJfTUlQU19QQzI2X1MyICovCisgICAg
ICAgICAgICAgICAgNjIsICAvKiBSX01JUFNfUEMxOF9TMyAqLworICAgICAgICAgICAgICAgIDYz
LCAgLyogUl9NSVBTX1BDMTlfUzIgKi8KKyAgICAgICAgICAgICAgICA2NCwgIC8qIFJfTUlQU19Q
Q0hJMTYgKi8KKyAgICAgICAgICAgICAgICA2NSwgIC8qIFJfTUlQU19QQ0xPMTYgKi8KKyAgICAg
ICAgICAgICAgICAyNDgsIC8qIFJfTUlQU19QQzMyICovCisgICAgICAgICAgICBdLAorICAgICAg
ICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAgICAgICAuaW50bygpLAog
ICAgICAgICBfID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIuNTYuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
