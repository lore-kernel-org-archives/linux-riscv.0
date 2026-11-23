Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD98606A69D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=By4t9a6E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c51R8ppc;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yQt064qw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AsRvZKGD1AqiMxqmduR7WqH9RNwbgtWtUAtLUE+79Ms=; b=By4t9a6E7DjEUDdvnQqpGEe6lF
	yzza7lbov96A/GwwU6bpMOaPlOPvyYqUYSaFzelLsMlArfHSzTIGm5sWzOHR33ePsMyumLcOiaKSG
	ngvrk6d6BPvsA21G5skrvfk0KQ059pBARZ4iD0l/17sotrnhCXEsAt8UKurJxJN4GjYppsfoeEIQr
	Mzi18jZ168OFHLP4y7dgBkzOKq0EeTjXeH6C2UD6nPoIWEnUdNR4f53lBxNZEfiMqgjof6NI2/FgY
	ywzMrerfNe2r/oo3wGRNlHIvLHEu5ykrl89i+7ZbbyXRA+WY9hJkhI3IgUXrVWTWRbgSP6SDyN8X5
	9iFG7bFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS8-00000003e3J-3PXe;
	Mon, 23 Nov 2026 13:51:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS1-00000003dxu-3kTP;
	Mon, 23 Nov 2026 13:51:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c4YRQQ6pnzSBpHUo5gQq1+MNXBhFp0V4WLQqxvRU3w=;
	b=c51R8ppcFvgF+lecaj/yMlPRqDjEJqCxkHivVfbfMQYdSfZe4M6c4s4DoB+NYtz7vO+Y1t
	zZOi7noMVQNksc1y//WWdcFqSuEJJ5VrMKnXxTPR5jbhVw16t+8ig0vz2qxTFGsx97LlEV
	7Uxe5/+6DmvvvdKnLhZ5hkReO6ryCa6YDLcA6hFwgtuHyUBzoOOf8ceeoNaqPaklx7PIyF
	P7gF2nVtFX8AGncfEJvHENxFQOf+VcI4sDu8GW+0V/oxaZLjGmJxyoSPUsV/ExJ5sbdp1d
	ZKG7YGmqcArtssE05wbISs4JnXpKGfVfz5XJo+/b5IbUn7BR+NLokBi2wh91QA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c4YRQQ6pnzSBpHUo5gQq1+MNXBhFp0V4WLQqxvRU3w=;
	b=yQt064qwYnbu3hJCbzrs1LSu9wJF9vC0+skGBQRPBjGzvIEoRyyX+E0474vs7Sqd4TUE6E
	XDQAx4LTWCyhrtCA==
Date: Mon, 23 Nov 2026 14:50:53 +0100
Subject: [PATCH v6 02/11] x86/vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-2-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2480;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QoUIl45MXZMRNJ380RzxrALVLspll1WbUT4Y7wjP5Nc=;
 b=h6xhrNJ/daWsX6d0KucIl1wYohqmJySrJ2C1jkqbSYPKJvt4SX6MThWjG3AJ53+HBHR3/pKpF
 7soB51VQ7nVDYQrnRCfrdx/gAbVU1MOH1o8b4GwEdR9wgqoPiEeBzvq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055122_079659_9C133D3B 
X-CRM114-Status: GOOD (  11.36  )
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
LmRlPgotLS0KIGFyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi9NYWtlZmlsZS5pbmNsdWRlIHwgIDIgKy0K
IGxpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyAgICAgICAgICAgICAgICAgfCAxNCArKysrKysr
KysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcKaW5kZXgg
NThkY2UwYjY2MTc5Li4wOWQzYWEwNGVlODIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L0tjb25maWcK
KysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtMzAyLDYgKzMwMiw3IEBAIGNvbmZpZyBYODYKIAlz
ZWxlY3QgSEFWRV9VTlNUQUJMRV9TQ0hFRF9DTE9DSwogCXNlbGVjdCBIQVZFX1VOV0lORF9VU0VS
X0ZQCQlpZiBYODZfNjQKIAlzZWxlY3QgSEFWRV9VU0VSX1JFVFVSTl9OT1RJRklFUgorCXNlbGVj
dCBWRFNPX0NIRUNLCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCQkJaWYgWDg2XzY0CiAJc2VsZWN0
IEhPVFBMVUdfUEFSQUxMRUwJCQlpZiBTTVAgJiYgWDg2XzY0CiAJc2VsZWN0IEhPVFBMVUdfU01U
CQkJaWYgU01QCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi9NYWtlZmls
ZS5pbmNsdWRlIGIvYXJjaC94ODYvZW50cnkvdmRzby9jb21tb24vTWFrZWZpbGUuaW5jbHVkZQpp
bmRleCA2ODdiM2Q4OWI0MGQuLjUxMGQ1ZTc5ODU3ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50
cnkvdmRzby9jb21tb24vTWFrZWZpbGUuaW5jbHVkZQorKysgYi9hcmNoL3g4Ni9lbnRyeS92ZHNv
L2NvbW1vbi9NYWtlZmlsZS5pbmNsdWRlCkBAIC03MSw3ICs3MSw3IEBAIHF1aWV0X2NtZF92ZHNv
ID0gVkRTTyAgICAkQAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAkQAogICAg
ICAgY21kX3Zkc29fYW5kX2NoZWNrID0gJChjbWRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spCiAK
LSQob2JqKS92ZHNvJS5zby5kYmc6ICQob2JqKS92ZHNvJS5sZHMgRk9SQ0UKKyQob2JqKS92ZHNv
JS5zby5kYmc6ICQob2JqKS92ZHNvJS5sZHMgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlm
X2NoYW5nZWQsdmRzb19hbmRfY2hlY2spCiAKICQob2JqKS8lLnNvOiBPQkpDT1BZRkxBR1MgOj0g
LVMgLS1yZW1vdmUtc2VjdGlvbiBfX2V4X3RhYmxlCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggZjRjMDcz
MGJjOTc2Li44Y2Q4YzdmM2ZlYzggMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVj
ay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKQEAgLTM0LDYgKzM0LDIwIEBA
IGZuIGlzX2lnbm9yZWRfc2VjdGlvbigmc2VsZiwgc2VjdGlvbjogJmVsZjo6U2VjdGlvbjwnXz4p
IC0+IGJvb2wgewogCiBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6
IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwnc3RhdGljPj4gewogICAgIG1hdGNo
IG1hY2hpbmUgYXMgdTMyIHsKKyAgICAgICAgYmluZGluZ3M6OkVNXzM4NiA9PiBBbGxvd2VkUmVs
b2NhdGlvbnMgeworICAgICAgICAgICAgaW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAg
ICAgMiwgIC8qIFJfMzg2X1BDMzIgKi8KKyAgICAgICAgICAgICAgICA5LCAgLyogUl8zODZfR09U
T0ZGICovCisgICAgICAgICAgICAgICAgMTAsIC8qIFJfMzg2X0dPVFBDICovCisgICAgICAgICAg
ICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAgICAg
ICAuaW50bygpLAorICAgICAgICBiaW5kaW5nczo6RU1fWDg2XzY0ID0+IEFsbG93ZWRSZWxvY2F0
aW9ucyB7CisgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTogJlsyIC8qIFJfWDg2XzY0X1BDMzIg
Ki8sIDQgLyogUl9YODZfNjRfUExUMzIgKi9dLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZh
dWx0KCkKKyAgICAgICAgfQorICAgICAgICAuaW50bygpLAogICAgICAgICBfID0+IE5vbmUsCiAg
ICAgfQogfQoKLS0gCjIuNTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
