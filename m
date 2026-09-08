Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20152C79FAB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XX0UvTlNQ3ao0WjcPjruTFiMBnSl2jRA3p9xYlTAs8=; b=trjJYWQN+3sj6f
	hJe+5QAE2HLx03rVY8jFPmT6xbeFhEuSToxMyMG4Dl7VyecBoAewtOUNJWbDQOjV+o5MyCxdjMkFy
	YDX1chawajuMAhuud1jZpZd+DyecpmA/tNPURObDd/guILE0q4p91SlJQAK5t0ajq2xcLm1x0ezcv
	hL2bgPDD4dvlFCDlFzbufMhLTKDRRI1YCYsMHJ2omUQ76qVA6Xz1LwzaTE/kdscY865Orl9AlbEQw
	BlLlGfkh/SvOxL1/1M4XQ4YRDERFxqN2bbf5xZUgzJhEA6uK1ZMCm2Y7+aExFYvAx2D+uMs6vR6Gp
	6LBaAwb63QwtzT7UyS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPs-00000008A9X-3WFS;
	Tue, 08 Sep 2026 06:34:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPB-0000000897Z-1uTO;
	Tue, 08 Sep 2026 06:34:09 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIHtJxBKUV92ut5bUWYer42zzkTydvuwzOnHSs3Yeo=;
	b=UQTMG5iOQDvZsY4LSnJHyDsgt5WxYxOz6YK1J4hyy8PpdVm7HY/Y/mh6cvKrE7NVsFt+Nb
	5PHfF7NPgespT0taUkdG+2zsqwIaJCOc5lenErzQr2gJGmGCKDfglspuNebAKUicWnsEu/
	OgGtj7CqD3bcw77a8A5zUcMAVDpAYTrT40KMbS3vw/PGpc+2sK3wf2Nyn++rSXvk/89a/O
	dLBhqKZQpE19fpuoHY99u/fCxlDvRu6/J5A/dqsFfx74MtXtIoiuRmDCbLQFhLUUkESDb1
	xO22aa0FVTkzJtC0FgFtMHHa1CD0BMXsnGpP3cYNg8YMYtTrbp5jheTjAu2qTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIHtJxBKUV92ut5bUWYer42zzkTydvuwzOnHSs3Yeo=;
	b=7PR/0nIH3jxM0NAu2RQ8Kza6MygB9kI69pTDRsPAwhdPDsSecImgz/0fj3o3HpGROjRbDh
	NRUyYikC3ZoRAoCQ==
Date: Tue, 08 Sep 2026 08:33:53 +0200
Subject: [PATCH v5 19/24] LoongArch: vDSO: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-19-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=3278;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=aHlYdAt+sn8SQz3z94dI4KWuFSXUUjVIfd41CT6XtAE=;
 b=2232qTauQU8ONuo72eWzPcWTOr/o5ANqNg5FnqG48nJxB/0T5MRVqjL9ipbJ1nOF+cXFluD1a
 gXrQgZJJqvQDq3tjn71NRUZG05NIlhIDdmmjTh/MawpE3ZVvYw59mEQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233406_777063_54228151 
X-CRM114-Status: GOOD (  10.68  )
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
LmRlPgotLS0KIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgfCAgMSArCiBhcmNoL2xvb25n
YXJjaC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJz
ICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gv
S2NvbmZpZyBiL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKaW5kZXggYTIxZjUxZTU4MTVlLi41ZGM5
OGE0YjljN2YgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKKysrIGIvYXJjaC9s
b29uZ2FyY2gvS2NvbmZpZwpAQCAtMjEzLDYgKzIxMyw3IEBAIGNvbmZpZyBMT09OR0FSQ0gKIAlz
ZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBVU0VfUEVSQ1BVX05VTUFfTk9E
RV9JRAogCXNlbGVjdCBVU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVAorCXNlbGVjdCBWRFNPX0NIRUNL
CiAJc2VsZWN0IFZEU09fREFUQVNUT1JFCiAJc2VsZWN0IFZEU09fR0VUUkFORE9NCiAJc2VsZWN0
IFpPTkVfRE1BMzIgaWYgNjRCSVQKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFr
ZWZpbGUgYi9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCmluZGV4IDljOTE4MWJiNDA3MS4u
YjBkYzU4MzI4NjY0IDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCisr
KyBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUKQEAgLTUwLDcgKzUwLDcgQEAgbGRmbGFn
cy15IDo9IC1Cc3ltYm9saWMgLS1uby11bmRlZmluZWQgLXNvbmFtZT1saW51eC12ZHNvLnNvLjEg
XAogIwogCiBxdWlldF9jbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAkQAotICAg
ICAgY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRzb19jaGVj
aykKKyAgICAgIGNtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChj
bWRfdmRzb19jaGVjaykKIAogcXVpZXRfY21kX3Zkc29hc19vX1MgPSBBUyAgICAgICAkQAogICAg
ICAgY21kX3Zkc29hc19vX1MgPSAkKENDKSAkKGFfZmxhZ3MpIC1jIC1vICRAICQ8CkBAIC03OSw3
ICs3OSw3IEBAICQob2JqLXZkc28pOiBLQlVJTERfQUZMQUdTIDo9ICQoYWZsYWdzLXZkc28pICQo
bmF0aXZlLWFiaSkKIAogJChvYmopL3Zkc28ubGRzOiBLQlVJTERfQ1BQRkxBR1MgOj0gJChjY2Zs
YWdzLXZkc28pICQobmF0aXZlLWFiaSkKIAotJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRz
by5sZHMgJChvYmotdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLmRiZzogJChvYmopL3Zkc28u
bGRzICQob2JqLXZkc28pICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZk
c29sZF9hbmRfdmRzb19jaGVjaykKIAogJChvYmopL3Zkc28uc286IE9CSkNPUFlGTEFHUyA6PSAt
UwpkaWZmIC0tZ2l0IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hl
Y2svdmRzb2NoZWNrLnJzCmluZGV4IDY3NTYyZDIxZjg3Ny4uNGFlYjcwOTRlNTUyIDEwMDY0NAot
LS0gYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRz
b2NoZWNrLnJzCkBAIC0xMjIsNiArMTIyLDMyIEBAIGZuIGFsbG93ZWRfcmVsb2NhdGlvbnNfZm9y
X21hY2hpbmUobWFjaGluZTogdTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRpb25zPCdzCiAg
ICAgICAgICAgICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQogICAgICAgICB9CiAgICAgICAgIC5pbnRv
KCksCisgICAgICAgIGJpbmRpbmdzOjpFTV9MT09OR0FSQ0ggPT4gQWxsb3dlZFJlbG9jYXRpb25z
IHsKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRp
bmdzOjpSX0xBUkNIX0FERDgsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQURE
MTYsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQUREMjQsCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQUREMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6
OlJfTEFSQ0hfQURENjQsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfU1VCOCwK
KyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9TVUIxNiwKKyAgICAgICAgICAgICAg
ICBiaW5kaW5nczo6Ul9MQVJDSF9TVUIyNCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9M
QVJDSF9TVUIzMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9TVUI2NCwKKyAg
ICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9CMTYsCisgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfTEFSQ0hfQjIxLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX0Iy
NiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9QQ0FMQV9ISTIwLAorICAgICAg
ICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX1BDQUxBX0xPMTIsCisgICAgICAgICAgICAgICAg
YmluZGluZ3M6OlJfTEFSQ0hfUENBTEE2NF9MTzIwLAorICAgICAgICAgICAgICAgIGJpbmRpbmdz
OjpSX0xBUkNIX1BDQUxBNjRfSEkxMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJD
SF8zMl9QQ1JFTCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9QQ0FERF9ISTIw
LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX1BDQUREX0xPMTIsCisgICAgICAg
ICAgICBdLAorICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAg
ICAgICAuaW50bygpLAogICAgICAgICBfID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIuNTUuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
