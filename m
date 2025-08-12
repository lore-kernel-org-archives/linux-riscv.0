Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2D0CA0EDC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtds/hb9PKgwzW09LSK4aOhQF6I/abBCxnhYWYDOmaQ=; b=RnXJU37Tt4RgNk
	u737bEQVBwv5hSRfIdi3TewUr6REprQtt2751PJVoO0GCwePIzZApi1e1Jca9CS8iFwUkghCnfURc
	v9oCoJbcX/M1eYMG7OXIO9rkQyXeWQ+7CBmbLup8O/IwRIm0XDeFLr6k7juYlh7cRvo2ynnqUAOqj
	+IvWfqmxX9uP2M1HAJfNwnzj+H+gOfBSd3dOk9vb3ODIL0yDtSh7ynQUc2PHckB55rjv3GGHi/cKp
	NEwlPOxD9qrJsKZtPcOAo4IGl2VgBJuOv1fdv8z5WfWZDdN08h0s0zq1KA9TwrO4FrL1PfPqdwDSy
	wXbdFPWSllD47q0VXTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulili-0000000A3K7-0SaE;
	Tue, 12 Aug 2025 06:45:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoT-00000009uvQ-2ns8;
	Tue, 12 Aug 2025 05:44:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSsLaj0Vhu9/PGMTmPXGdssJTXVn3W9ZA9BGqH+Jqx4=;
	b=eDOLCLFDPRbYYV6S9jLoySaVAu3Me/4SS95J0pa44QzQju1lVdvjVQb0NHn26GgiKzsdo0
	la6VnrTn3Ck0BTNHV6iPzgVSMcM+D0zEUl6vIHzxvac1IhKbgdrENmV4kvNogwCDIi9bUc
	6NLSPM+lX/mzQgqWdYfgFCIaVbyuAVg9fXpU/8xhY6vP+6L/k7HV27ig2A37biQWg7w8ix
	r22eKq9Rr8f+6bN2DMXyuLJK6jRyLg2KwjU7bpH/2t/nkFxU+VPhqpYVJXC6AZK4UecCPQ
	yLI5tse76hfyElSeWwb5NV3HG2g/+z2gvs4FmkDYEzX/DdmDG0K9iSN0HH4iNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSsLaj0Vhu9/PGMTmPXGdssJTXVn3W9ZA9BGqH+Jqx4=;
	b=x8u4rxPiqX9dOvWWfSpG/Ujml/DOO844CEKhLv/WuFCx5Vk6KLOOdTUqW25zFxXj1eXLob
	cNpDxW8Y1VxhSEDw==
Date: Tue, 12 Aug 2025 07:44:26 +0200
Subject: [PATCH v4 13/24] ARM: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-13-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=2638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qygA/StJzW73SS+Ekq7PC7CyPNI3mc4mEN9yJxXb3XY=;
 b=T+Y3ba3sPD8SH63yLbLTW2WkOy2PgtViR8rWIZYQ/4UjtoPlEd+0f2LNjX0dkYHy33nz3NhFa
 fZMmsLbItu4Bl44kkc4ojPXchIFcJeEzvChFGVZh7EzamhWR3UCQS7W
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224446_024122_603CCA7C 
X-CRM114-Status: GOOD (  13.44  )
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
LmRlPgotLS0KIGFyY2gvYXJtL3Zkc28vTWFrZWZpbGUgICAgICB8IDQgKystLQogbGliL3Zkc28v
S2NvbmZpZyAgICAgICAgICAgIHwgMSArCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgfCA4
ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vdmRzby9NYWtlZmlsZSBiL2FyY2gvYXJtL3Zkc28v
TWFrZWZpbGUKaW5kZXggY2Y4Y2QzOWFiODA0NjhiZjE0MDkxNzJhOGI4NTdkMDUwYjIyNDAwNC4u
ZmQzNGQwZmYwMThhOGFmYTViZmViYjYyZjY5YmJhOTY0YzZlNzNhMyAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vdmRzby9NYWtlZmlsZQorKysgYi9hcmNoL2FybS92ZHNvL01ha2VmaWxlCkBAIC0zNyw3
ICszNyw3IEBAIGVuZGlmCiAkKG9iaikvdmRzby5vIDogJChvYmopL3Zkc28uc28KIAogIyBMaW5r
IHJ1bGUgZm9yIHRoZSAuc28gZmlsZQotJChvYmopL3Zkc28uc28ucmF3OiAkKG9iaikvdmRzby5s
ZHMgJChvYmotdmRzbykgRk9SQ0UKKyQob2JqKS92ZHNvLnNvLnJhdzogJChvYmopL3Zkc28ubGRz
ICQob2JqLXZkc28pICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29s
ZF9hbmRfdmRzb19jaGVjaykKIAogJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRzby5zby5y
YXcgJChvYmopL3Zkc29tdW5nZSBGT1JDRQpAQCAtNTAsNyArNTAsNyBAQCAkKG9iaikvJS5zbzog
JChvYmopLyUuc28uZGJnIEZPUkNFCiAKICMgQWN0dWFsIGJ1aWxkIGNvbW1hbmRzCiBxdWlldF9j
bWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAkQAotICAgICAgY21kX3Zkc29sZF9h
bmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRzb19jaGVjaykKKyAgICAgIGNtZF92
ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChjbWRfdmRzb19jaGVjaykK
IAogcXVpZXRfY21kX3Zkc29tdW5nZSA9IE1VTkdFICAgJEAKICAgICAgIGNtZF92ZHNvbXVuZ2Ug
PSAkKG9ianRyZWUpLyQob2JqKS92ZHNvbXVuZ2UgJDwgJEAKZGlmZiAtLWdpdCBhL2xpYi92ZHNv
L0tjb25maWcgYi9saWIvdmRzby9LY29uZmlnCmluZGV4IGU5MjE1MDg0NDYyZGZiMzNhNWNkNTVh
NTcxNzFkMmVjNDI5NWEyNzAuLjg0YmZmNTljY2VmNGFjZDk1MTU5ZDAzZTk2OTkxMTYxYTAyOWZi
MmQgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL0tjb25maWcKKysrIGIvbGliL3Zkc28vS2NvbmZpZwpA
QCAtNTIsNiArNTIsNyBAQCBjb25maWcgR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUKIGNvbmZpZyBI
QVZFX1ZEU09DSEVDSwogCWJvb2wKIAlkZWZhdWx0IHkgaWYgWDg2CisJZGVmYXVsdCB5IGlmIEFS
TQogCWhlbHAKIAkgIFNlbGVjdGVkIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlIHN1cHBvcnRl
ZCBieSB0aGUgJ3Zkc29jaGVjaycgcHJvZ2FtLgogCSAgT25seSB0cmFuc2l0aW9uYWwuCmRpZmYg
LS1naXQgYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92ZHNv
Y2hlY2sucnMKaW5kZXggYzRmZWI3NWY5M2VjMGE2YTE1M2E3NThlZTdhNTFjYzZmMmY1OGJmMS4u
MjM5NzBiOWQwNWRjMzIwZWI0OTY2OTY3OTA0ZGVhZTY2MTE3MWIxNSAxMDA2NDQKLS0tIGEvbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5y
cwpAQCAtNDYsNiArNDYsMTQgQEAgZm4gYWxsb3dlZF9yZWxvY2F0aW9uc19mb3JfbWFjaGluZSht
YWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2VkUmVsb2NhdGlvbnM8J3MKICAgICAgICAgICAg
IGlnbm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6IE5vbmUsCiAgICAgICAgICAgICBpbl9vYmpl
Y3RfZmlsZTogJltiaW5kaW5nczo6Ul9YODZfNjRfUEMzMiwgYmluZGluZ3M6OlJfWDg2XzY0X1BM
VDMyXSwKICAgICAgICAgfSksCisgICAgICAgIGJpbmRpbmdzOjpFTV9BUk0gPT4gU29tZShBbGxv
d2VkUmVsb2NhdGlvbnMgeworICAgICAgICAgICAgaWdub3JlZF9vYmplY3RfZmlsZV9zZWN0aW9u
czogTm9uZSwKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAg
IGJpbmRpbmdzOjpSX0FSTV9OT05FLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0FSTV9S
RUwzMiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9BUk1fUFJFTDMxLAorICAgICAgICAg
ICAgXSwKKyAgICAgICAgfSksCiAgICAgICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
