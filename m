Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80775606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEqOreDf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AdnWR/fT;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CiSYPSUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GMvGTsAAVfLOPqQjNaDahhCyDG6kD4RamN2XqDffhNA=; b=TEqOreDf953obKJK9vzgUhxBAh
	sU8AmjTqkd6R18WanUQ3LSkONhj0a6sxMusWUp6F0E3E0cQ748by1vU3lO+UsX8PYAEPJZlKfOosF
	H9k37RHvCVjR0MQKUjnPJ8npIIYjr90cByQOpcwDlxd+9/CcUGEVCW9Hbnhg+saAnYWjrTQw2ftus
	1hR+EAkJ+MA6HgpgMub4TPn3Xmaj4JtxvlsxHCA3DEIPDnOhTurHoXlnBZdXYnKjMATMXHQGbeLBJ
	GlOClcYZPxOmuWYThHtU5vkACHHnbrvslI8gyujh3qk4tZT7qYwgV56VV2u6ZNddoSfRV55GGo1hz
	vnd9g3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSL-00000003eHE-1tj8;
	Mon, 23 Nov 2026 13:51:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS5-00000003dz5-1sxj;
	Mon, 23 Nov 2026 13:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbaUWZC28smuRoW90pWpaXz3GGY4MsOKGg8st7PIjvw=;
	b=AdnWR/fT44yXzm+ht95OqsrELNCyH358idfw54sxV+82ZCQh8b1aIvskImaSeMPYYiPAGX
	tMSFHMm39iz7ISqX2w8pj4D8L/qzXb1g+WS97tFqN8moTMNum/DjAz0AOhUR9mHeaYQxj9
	5LZEWcHDHmfyVG3iQ0WvT8vFcoQbpRxTznUUUuQTu76cbBTyn3KQ4CodP8l937jaO91ZuP
	Qt441N7af+F5t3S2BxLy/sH8WAJ3bW5O4y6lY0UQw0K7A+UQhTXKdNOY7nqA7niM/tyffr
	0vxJK9JiP8+NfpneuW9wJzwcEPrvj3p/SNvKjKHMhV35bVoateZvXcf6rspcBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbaUWZC28smuRoW90pWpaXz3GGY4MsOKGg8st7PIjvw=;
	b=CiSYPSUwyavYYl1x/i+wWbxPyj9epV9FlY90gd2wiTfE4WxtGjnCDB5MgwLKxaEC26eTmC
	kUVvWJED9GTdvTAw==
Date: Mon, 23 Nov 2026 14:50:56 +0100
Subject: [PATCH v6 05/11] powerpc/vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-5-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3226;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Cgbtb7qSJ3AcXOvZFi0BZIPMWqlXOiwZ1bBjbdIILZ8=;
 b=tf9jQyiu6Hx303xQeraxjP8OCezqMY+3qKghsgR/OWQajoh6hO04aKYTX/3KWhg5DquWsJP8b
 aAXQOlfMR3eDCtoARUDmA0kN0uVLstrGS/+wTZDeacxxM2luRimKr84
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055125_784413_04F6FDC2 
X-CRM114-Status: GOOD (  11.14  )
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
LmRlPgotLS0KIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKIGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8ICA0ICsrLS0KIGxpYi92ZHNvL2NoZWNrL3Zk
c29jaGVjay5ycyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggYzNiNmNk
NjU1NjA2Li4xYzRhNzVjM2E4MzAgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisr
KyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC0zMjcsNiArMzI3LDcgQEAgY29uZmlnIFBQQwog
CXNlbGVjdCBTWVNDVExfRVhDRVBUSU9OX1RSQUNFCiAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RB
U0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAorCXNlbGVjdCBWRFNPX0NIRUNLCiAJ
c2VsZWN0IFZEU09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJIwpkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC92ZHNvL01ha2VmaWxlCmluZGV4IDBkMWE0OTUyOTg4NS4uYjJlMzk5ZTEwMjczIDEwMDY0
NAotLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlCkBAIC04Miw5ICs4Miw5IEBAIHRhcmdldHMgKz0gdmRz
bzY0LmxkcwogQ1BQRkxBR1NfdmRzbzY0LmxkcyArPSAtUCAtQwogCiAjIGxpbmsgcnVsZSBmb3Ig
dGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0byBiZSBmaXJzdAotJChvYmopL3Zkc28zMi5zby5kYmc6
ICQob2JqKS92ZHNvMzIubGRzICQob2JqLXZkc28zMikgJChvYmopL3ZnZXR0aW1lb2ZkYXktMzIu
byAkKG9iaikvdmdldHJhbmRvbS0zMi5vICQob2JqKS9jcnRzYXZyZXMtMzIubyBGT1JDRQorJChv
YmopL3Zkc28zMi5zby5kYmc6ICQob2JqKS92ZHNvMzIubGRzICQob2JqLXZkc28zMikgJChvYmop
L3ZnZXR0aW1lb2ZkYXktMzIubyAkKG9iaikvdmdldHJhbmRvbS0zMi5vICQob2JqKS9jcnRzYXZy
ZXMtMzIubyAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvMzJsZF9h
bmRfY2hlY2spCi0kKG9iaikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc282NC5sZHMgJChvYmot
dmRzbzY0KSAkKG9iaikvdmdldHRpbWVvZmRheS02NC5vICQob2JqKS92Z2V0cmFuZG9tLTY0Lm8g
Rk9SQ0UKKyQob2JqKS92ZHNvNjQuc28uZGJnOiAkKG9iaikvdmRzbzY0LmxkcyAkKG9iai12ZHNv
NjQpICQob2JqKS92Z2V0dGltZW9mZGF5LTY0Lm8gJChvYmopL3ZnZXRyYW5kb20tNjQubyAkKHZk
c29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvNjRsZF9hbmRfY2hlY2spCiAK
ICMgYXNzZW1ibHkgcnVsZXMgZm9yIHRoZSAuUyBmaWxlcwpkaWZmIC0tZ2l0IGEvbGliL3Zkc28v
Y2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCmluZGV4IDBk
NWNlYWNhMzRkNy4uZGE1OGZmMjIwZWFiIDEwMDY0NAotLS0gYS9saWIvdmRzby9jaGVjay92ZHNv
Y2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCkBAIC02OSw2ICs2OSwz
MyBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4g
T3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZh
dWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1f
UFBDID0+IEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTog
JlsKKyAgICAgICAgICAgICAgICAxMCwgIC8qIFJfUFBDX1JFTDI0ICovCisgICAgICAgICAgICAg
ICAgMTEsICAvKiBSX1BQQ19SRUwxNCAqLworICAgICAgICAgICAgICAgIDI2LCAgLyogUl9QUENf
UkVMMzIgKi8KKyAgICAgICAgICAgICAgICAyNDksIC8qIFJfUFBDX1JFTDE2ICovCisgICAgICAg
ICAgICAgICAgMjUwLCAvKiBSX1BQQ19SRUwxNl9MTyAqLworICAgICAgICAgICAgICAgIDI1MSwg
LyogUl9QUENfUkVMMTZfSEkgKi8KKyAgICAgICAgICAgICAgICAyNTIsIC8qIFJfUFBDX1JFTDE2
X0hBICovCisgICAgICAgICAgICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkK
KyAgICAgICAgfQorICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1fUFBDNjQg
PT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWwor
ICAgICAgICAgICAgICAgIDEwLCAgLyogUl9QUEM2NF9SRUwyNCAqLworICAgICAgICAgICAgICAg
IDExLCAgLyogUl9QUEM2NF9SRUwxNCAqLworICAgICAgICAgICAgICAgIDI2LCAgLyogUl9QUEM2
NF9SRUwzMiAqLworICAgICAgICAgICAgICAgIDQ0LCAgLyogUl9QUEM2NF9SRUw2NCAqLworICAg
ICAgICAgICAgICAgIDI0OSwgLyogUl9QUEM2NF9SRUwxNiAqLworICAgICAgICAgICAgICAgIDI1
MCwgLyogUl9QUEM2NF9SRUwxNl9MTyAqLworICAgICAgICAgICAgICAgIDI1MSwgLyogUl9QUEM2
NF9SRUwxNl9ISSAqLworICAgICAgICAgICAgICAgIDI1MiwgLyogUl9QUEM2NF9SRUwxNl9IQSAq
LworICAgICAgICAgICAgXSwKKyAgICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCisgICAg
ICAgIH0KKyAgICAgICAgLmludG8oKSwKICAgICAgICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0t
IAoyLjU2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
