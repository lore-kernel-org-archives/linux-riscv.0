Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49B606A337
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0pVC45D4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=42b6mgLI;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CrCLsvMt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=grc7z9vM6YxjBqBUKuBSag1BtUhp5ZMY3jvPAWhqeEQ=; b=0pVC45D4MPwj+NsQxF9pp9orHK
	+fvaqdfGDJ0H+p1QcSZfE5AQTr7y8GBTNaqoFx8y7o6oi3HwARiW+O41T5uPgN7RYlNPk+uje6jlz
	GxbXf9//mgyDAYfLvZL19aejVEz2ZJvav/B/s1A9M7/Ir1L18uFlMc+WZTr5FKt5b4e6+W7TmVoyl
	V7zbIZ8wHvqY467AJPk96JcBY1j2bJ7N/JlYW7Qr+CVoA/bPuZvBVFdVEk6HT3vm+eUCBX0fzwHa5
	Km2UEcU1pIkntNbpwppfcK3LhKCXoQ524AqtCS+u13LytcX31GSiKgKr4QpA7vS/oO4oZIpN49ORA
	yBKsCG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSQ-00000003ePd-1RNO;
	Mon, 23 Nov 2026 13:51:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS7-00000003e0p-2lY5;
	Mon, 23 Nov 2026 13:51:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sFaXvA9vx15Nywpdl3NvvJxA2pf2Qf5PnzQHGb7eBo=;
	b=42b6mgLIuU+F+S2GlLo82F+40zks1I3ParrxfhXxOeiIN6CX7YexYDUC6GXnp4UOaHqvmi
	rueKaxZPgopp3WWrMJ9ivOuGql7vhRwqrTriYEGG6ndX0qCscYb7AEbt2PxUU0+b6nd2dt
	wfv5aG5df/oZSAe7Uer72VZhxJ2OefR6UBZSe70z5F0y/CbxpQ7V1nWZp3oBVfwRdZLO6h
	fs1K74tvJ+MturgKOmuh3EXLBvDYjX2hQCbg3oD9KCR2SWtooXWe03M3nNgv719/F8e2Pv
	8nmNDiuItrU+b5v52Jry8B/LzK2AdBpms0G7k9XW47IxNtIOQAyOXvyqIGdWMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sFaXvA9vx15Nywpdl3NvvJxA2pf2Qf5PnzQHGb7eBo=;
	b=CrCLsvMtlydLFWCXif6/L6uV62axTpYtX8NNzE0vRn7tBdCToQxzwCjnmsiMVyWxKbawQz
	71CVQ5Tri+gvE3Ag==
Date: Mon, 23 Nov 2026 14:50:58 +0100
Subject: [PATCH v6 07/11] LoongArch: vDSO: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-7-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3278;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M6WFFqo+yQNRSndBT6wB+Qd/XP3diHhHIC/1+2kgJZg=;
 b=vobOCi8V2Ww5CZjhDGPnGtE/6mmXyQIGHbhp4Ye78sY6UcjVcQ9/rdZ4B/0wQ2qV2tFQT+MYE
 GvphsrL4IijByLExRMrAyOXpewMTgTunrbHm4R5e3R48BMFwZ8xmLki
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055127_880078_401B8F97 
X-CRM114-Status: GOOD (  11.06  )
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
LmRlPgotLS0KIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgfCAgMSArCiBhcmNoL2xvb25n
YXJjaC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJz
ICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gv
S2NvbmZpZyBiL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKaW5kZXggYjVlZDQ4ODFkM2MwLi5hZDRj
YWZlZGRiYjggMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKKysrIGIvYXJjaC9s
b29uZ2FyY2gvS2NvbmZpZwpAQCAtMjExLDYgKzIxMSw3IEBAIGNvbmZpZyBMT09OR0FSQ0gKIAlz
ZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBVU0VfUEVSQ1BVX05VTUFfTk9E
RV9JRAogCXNlbGVjdCBVU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVAorCXNlbGVjdCBWRFNPX0NIRUNL
CiAJc2VsZWN0IFZEU09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJc2VsZWN0
IFpPTkVfRE1BMzIgaWYgNjRCSVQKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFr
ZWZpbGUgYi9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCmluZGV4IDBiODQ4OTJkMDg0Yi4u
YWQ1NDM4M2IxOTA4IDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCisr
KyBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUKQEAgLTUxLDcgKzUxLDcgQEAgbGRmbGFn
cy15IDo9IC1Cc3ltYm9saWMgLS1uby11bmRlZmluZWQgLXNvbmFtZT1saW51eC12ZHNvLnNvLjEg
XAogIwogCiBxdWlldF9jbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAkQAotICAg
ICAgY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRzb19jaGVj
aykKKyAgICAgIGNtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChj
bWRfdmRzb19jaGVjaykKIAogcXVpZXRfY21kX3Zkc29hc19vX1MgPSBBUyAgICAgICAkQAogICAg
ICAgY21kX3Zkc29hc19vX1MgPSAkKENDKSAkKGFfZmxhZ3MpIC1jIC1vICRAICQ8CkBAIC04MCw3
ICs4MCw3IEBAICQob2JqLXZkc28pOiBLQlVJTERfQUZMQUdTIDo9ICQoYWZsYWdzLXZkc28pICQo
bmF0aXZlLWFiaSkKIAogJChvYmopL3Zkc28ubGRzOiBLQlVJTERfQ1BQRkxBR1MgOj0gJChjY2Zs
YWdzLXZkc28pICQobmF0aXZlLWFiaSkKIAotJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRz
by5sZHMgJChvYmotdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLmRiZzogJChvYmopL3Zkc28u
bGRzICQob2JqLXZkc28pICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZk
c29sZF9hbmRfdmRzb19jaGVjaykKIAogJChvYmopL3Zkc28uc286IE9CSkNPUFlGTEFHUyA6PSAt
UwpkaWZmIC0tZ2l0IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hl
Y2svdmRzb2NoZWNrLnJzCmluZGV4IDM3NDU1ZDMyNjExMC4uNzk1MmFkNmJhNzJiIDEwMDY0NAot
LS0gYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRz
b2NoZWNrLnJzCkBAIC0xMjIsNiArMTIyLDMyIEBAIGZuIGFsbG93ZWRfcmVsb2NhdGlvbnNfZm9y
X21hY2hpbmUobWFjaGluZTogdTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRpb25zPCdzCiAg
ICAgICAgICAgICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQogICAgICAgICB9CiAgICAgICAgIC5pbnRv
KCksCisgICAgICAgIGJpbmRpbmdzOjpFTV9MT09OR0FSQ0ggPT4gQWxsb3dlZFJlbG9jYXRpb25z
IHsKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIDQ3LCAg
LyogUl9MQVJDSF9BREQ4ICovCisgICAgICAgICAgICAgICAgNDgsICAvKiBSX0xBUkNIX0FERDE2
ICovCisgICAgICAgICAgICAgICAgNDksICAvKiBSX0xBUkNIX0FERDI0ICovCisgICAgICAgICAg
ICAgICAgNTAsICAvKiBSX0xBUkNIX0FERDMyICovCisgICAgICAgICAgICAgICAgNTEsICAvKiBS
X0xBUkNIX0FERDY0ICovCisgICAgICAgICAgICAgICAgNTIsICAvKiBSX0xBUkNIX1NVQjggKi8K
KyAgICAgICAgICAgICAgICA1MywgIC8qIFJfTEFSQ0hfU1VCMTYgKi8KKyAgICAgICAgICAgICAg
ICA1NCwgIC8qIFJfTEFSQ0hfU1VCMjQgKi8KKyAgICAgICAgICAgICAgICA1NSwgIC8qIFJfTEFS
Q0hfU1VCMzIgKi8KKyAgICAgICAgICAgICAgICA1NiwgIC8qIFJfTEFSQ0hfU1VCNjQgKi8KKyAg
ICAgICAgICAgICAgICA2NCwgIC8qIFJfTEFSQ0hfQjE2ICovCisgICAgICAgICAgICAgICAgNjUs
ICAvKiBSX0xBUkNIX0IyMSAqLworICAgICAgICAgICAgICAgIDY2LCAgLyogUl9MQVJDSF9CMjYg
Ki8KKyAgICAgICAgICAgICAgICA3MSwgIC8qIFJfTEFSQ0hfUENBTEFfSEkyMCAqLworICAgICAg
ICAgICAgICAgIDcyLCAgLyogUl9MQVJDSF9QQ0FMQV9MTzEyICovCisgICAgICAgICAgICAgICAg
NzMsICAvKiBSX0xBUkNIX1BDQUxBNjRfTE8yMCAqLworICAgICAgICAgICAgICAgIDc0LCAgLyog
Ul9MQVJDSF9QQ0FMQTY0X0hJMTIgKi8KKyAgICAgICAgICAgICAgICA5OSwgIC8qIFJfTEFSQ0hf
MzJfUENSRUwgKi8KKyAgICAgICAgICAgICAgICAxMjgsIC8qIFJfTEFSQ0hfUENBRERfSEkyMCAq
LworICAgICAgICAgICAgICAgIDEyOCwgLyogUl9MQVJDSF9QQ0FERF9MTzEyICovCisgICAgICAg
ICAgICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAg
ICAgICAuaW50bygpLAogICAgICAgICBfID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIuNTYuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
