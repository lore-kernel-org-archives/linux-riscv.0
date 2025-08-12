Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95CCC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMeiWww/PHtKr8oGYHwXAsXbGde/0hjW4kfaEJUt4Bo=; b=hUSayoLgrRG+yx
	YEkXPIHT54eGu6f38gjYHQPEswhN/S3IkQhLceAXZ1lMuS39ypqLjLOzkEbfN9Z2jZgsRHPSU5WYX
	0YihvJajyHRaWFhA/zzm+upvlKBFpi/AVCXTEnuljSK0EMHWcFojXWOTjHZm6ZuDdUDkFGp0ufPHb
	BQfaSCxlEpTlw0FCxUCuSr1kHCFf9BzuRYUW1FIU6d7buYeYxZbIovLmlxh8TNoDU81KvQSyruYNX
	HGiYV4zX2LBNBYgB8N4NQk5UDPzWXQSoRZks3qfJPgJd4hklAcPc/Mb5rdLAwdTGeLATJWus4OZ13
	UbMb5A4cq/ndNKNJ4f0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulilk-0000000A3NI-0aAW;
	Tue, 12 Aug 2025 06:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoa-00000009v4T-1Cp0;
	Tue, 12 Aug 2025 05:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xnh72HUbhzd4qempQkZ++BS8+pzvYgS+1ottOAOyHdU=; b=bnI7iMMaDryt+krBU51cfFXNBb
	k9ZU/NBVesUU84g5JUXMUQsihjy1e+8p02c5F5ZUPflhbKZyY976VF44EnG2M7H3fautBYiHDyDkD
	lX4LYkrS9jrJQgjpcQo35gEKJI2P/HxzQjsIXbgwAS111hO0iwlf0o8+LoAYRDjDSvox3P/hHWjYC
	sT3V/k4N+MtBm7rDLDJG4Mp7uywb74Z1iSSxFbrp9DsRCTVmzMVzro9ntZ3nOj5B7toLs0s7zgjvB
	Gu0fS90xpPBYA450ZDFH6WTszE/Dv83HS16Di1PtptwEwqWdolT5HJeulGK8ZWUhJzuqqKIQSQPZB
	iaD72O6w==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoV-0000000Fg7e-2JYv;
	Tue, 12 Aug 2025 05:44:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xnh72HUbhzd4qempQkZ++BS8+pzvYgS+1ottOAOyHdU=;
	b=M7S40MwV/29NPfO9Sasy+ADfYcsvNi5Apjwn245Ady0D3VOmbwdncNTgeKb1CtGlZMH2y5
	VLb+3/m+Kr/szGiTLJd4uAnGlG3BOQdpLLeDU2s3RuY0jGaoJQ9CoZ8ywkJenQVTh8q1ZU
	AzYugh31VGsAyOYBGTv9zwM7UTdCqcxGOgnyVS8W0fkGMwNgHzjkZfXtr0UvL1e7UJMMmF
	nJcpgacbXj6Sj/nRL1V06LnhMjF7zs1jSvpx57y2lKdkro1SgilU5GZG0SWcrItG0ikYUg
	AXOR889bzaLnAigaurgMDW06LMjY90s899cXrcGjUdmhdbEMejfGbP4Qf1yxPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xnh72HUbhzd4qempQkZ++BS8+pzvYgS+1ottOAOyHdU=;
	b=oT3QciTbYI+S9gc2w0Nm9Wh0wRDtrD56Uiy+WUIfVLkM867MFCQ7qwFFCJ/zKjjlLlWrmY
	vK59scPXpcCQ33AQ==
Date: Tue, 12 Aug 2025 07:44:27 +0200
Subject: [PATCH v4 14/24] arm64: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-14-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=2714;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3K4dUUVStWjQ5/WBfnnWwj1hNxnDgSGwmxNLWqKjR7g=;
 b=yJ2PupWNQCp+kR/s6ueQVFH3FycSSSmFfTc8D7vtTv0iU6LC1cQ44wErnQahnnu4cKtXubosj
 a7zqtL+HXllCbNMWl3p7/xwQr+4L7lGG20l7mLQYJBiX+218aWqN4J7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064447_934931_8A0A8690 
X-CRM114-Status: GOOD (  12.18  )
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
LmRlPgotLS0KIGFyY2gvYXJtNjQva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAgNCArKy0tCiBsaWIv
dmRzby9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEgKwogbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzICAgICB8IDExICsrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvdmRz
by9NYWtlZmlsZSBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28vTWFrZWZpbGUKaW5kZXggN2RlYzA1
ZGQzM2I3MGVhOGZjNzM0ZTBjMTNhZjllYzQ1NjhkODBhOC4uOWZhYzBlNTQwOTdkYzU1MmRiZmU4
MTA3NGRhNzE0OTJjNzljOTIzMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby9N
YWtlZmlsZQorKysgYi9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlCkBAIC02MSw3ICs2
MSw3IEBAIHRhcmdldHMgKz0gdmRzby5sZHMKIENQUEZMQUdTX3Zkc28ubGRzICs9IC1QIC1DIC1V
JChBUkNIKQogCiAjIExpbmsgcnVsZSBmb3IgdGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0byBiZSBm
aXJzdAotJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRzby5sZHMgJChvYmotdmRzbykgRk9S
Q0UKKyQob2JqKS92ZHNvLnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQob2JqLXZkc28pICQodmRz
b2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29sZF9hbmRfdmRzb19jaGVjaykK
IAogIyBTdHJpcCBydWxlIGZvciB0aGUgLnNvIGZpbGUKQEAgLTc5LDQgKzc5LDQgQEAgaW5jbHVk
ZS9nZW5lcmF0ZWQvdmRzby1vZmZzZXRzLmg6ICQob2JqKS92ZHNvLnNvLmRiZyBGT1JDRQogCiAj
IEFjdHVhbCBidWlsZCBjb21tYW5kcwogcXVpZXRfY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9
IExEICAgICAgJEAKLSAgICAgIGNtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZCk7
ICQoY21kX3Zkc29fY2hlY2spCisgICAgICBjbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gJChj
bWRfbGRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spCmRpZmYgLS1naXQgYS9saWIvdmRzby9LY29u
ZmlnIGIvbGliL3Zkc28vS2NvbmZpZwppbmRleCA4NGJmZjU5Y2NlZjRhY2Q5NTE1OWQwM2U5Njk5
MTE2MWEwMjlmYjJkLi4zMDM3YjE1NDc2YmI2MGVlNDdjMWUwODNlYWUzOTY4YWI5NjA0ZjU5IDEw
MDY0NAotLS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBiL2xpYi92ZHNvL0tjb25maWcKQEAgLTUz
LDYgKzUzLDcgQEAgY29uZmlnIEhBVkVfVkRTT0NIRUNLCiAJYm9vbAogCWRlZmF1bHQgeSBpZiBY
ODYKIAlkZWZhdWx0IHkgaWYgQVJNCisJZGVmYXVsdCB5IGlmIEFSTTY0CiAJaGVscAogCSAgU2Vs
ZWN0ZWQgZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBhcmUgc3VwcG9ydGVkIGJ5IHRoZSAndmRzb2No
ZWNrJyBwcm9nYW0uCiAJICBPbmx5IHRyYW5zaXRpb25hbC4KZGlmZiAtLWdpdCBhL2xpYi92ZHNv
L2NoZWNrL3Zkc29jaGVjay5ycyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwppbmRleCAy
Mzk3MGI5ZDA1ZGMzMjBlYjQ5NjY5Njc5MDRkZWFlNjYxMTcxYjE1Li5hNjk1YWVkOTVhZDM5MWEw
YzU1ZTUzODhiYzZkMWYxMTQxZmQ3ODRlIDEwMDY0NAotLS0gYS9saWIvdmRzby9jaGVjay92ZHNv
Y2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCkBAIC01NCw2ICs1NCwx
NyBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4g
T3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpS
X0FSTV9QUkVMMzEsCiAgICAgICAgICAgICBdLAogICAgICAgICB9KSwKKyAgICAgICAgYmluZGlu
Z3M6OkVNX0FBUkNINjQgPT4gU29tZShBbGxvd2VkUmVsb2NhdGlvbnMgeworICAgICAgICAgICAg
aWdub3JlZF9vYmplY3RfZmlsZV9zZWN0aW9uczogTm9uZSwKKyAgICAgICAgICAgIGluX29iamVj
dF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfUFJFTDY0LAor
ICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfUFJFTDMyLAorICAgICAgICAgICAg
ICAgIGJpbmRpbmdzOjpSX0FBUkNINjRfUFJFTDE2LAorICAgICAgICAgICAgICAgIGJpbmRpbmdz
OjpSX0FBUkNINjRfTERfUFJFTF9MTzE5LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FB
UkNINjRfQURSX1BSRUxfTE8yMSwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9BQVJDSDY0
X0NBTEwyNiwKKyAgICAgICAgICAgIF0sCisgICAgICAgIH0pLAogICAgICAgICBfID0+IE5vbmUs
CiAgICAgfQogfQoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
