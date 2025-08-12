Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF7CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1p2PI844zKWfTUpJ073tbzgepdM+SCP3E1e+IxN0Wfs=; b=ezNr2sQoyhGpN1
	pne/jmDPQgBYnEg5VF3tp9n5T65oSlImtWW/U4gp83YYSNo8zVTDXTaBtIdAUy0Re5KWvFBi7VIxg
	cM8T1p/XSzFudg8tmTRy6Z2KZkxHI2JNUHDrLR+6MRS2l1OBoc/irt64jBF5EZwFkdgqsqmABd5qj
	WIiUDZuW1+IJICPnEaSOrj7S/cOeLjIGa0fs72alqBTGBTI52RJkLHVLwsBrueQePTOILLjcmdTc7
	K6VsJOj8n4p4oQoKlHT13Fdzz8VeDwb4zjv+xadlFBbnkPcZQP3mtluwYPFwJVg/ELeR0x4xGvmHN
	GI+o3aECJJZZRW5O7XGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljwJ-0000000ABBW-1Ku8;
	Tue, 12 Aug 2025 08:00:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhof-00000009vAl-20il;
	Tue, 12 Aug 2025 05:44:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ20UpxcMxk4CxqTAsOEg+d3tEufNIUEKrmXXn+g7es=;
	b=u02ULTpXMKVYfa57toc79SeSvHFZXxCkrNoUYan+T5r+jzG+jErgF3lH3L6hpXG5GD7AiP
	BIUXfeq2JImvh4BYaqWeRcsPcpQWyQhVM6L37lOS8/C3ZaJKOGeEyLxqjYZEbvX/ROLkBH
	u79IO6ttBD1PVC+tYif7r2bAXlngTkKup+NLj++0//mmwP8JvHnpMe87VUFc0bOwAeIITA
	jDpSHVlj7jvidjWsVLXDskx33s+au1U1XzyN/9KPs2LnIbFp5cV3y+a+R/VTZv4VZHKIAG
	LWkElhMb8xt5p1hHetTPMUO1bZj316mgGQEbOwBvZ0KYDGtgbZwU0kEgUkCLYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ20UpxcMxk4CxqTAsOEg+d3tEufNIUEKrmXXn+g7es=;
	b=dCjTzytXjhSAHdYjPLNNi/GmmKuNlP6Pk8Piyd2jaSGduNETuOdwRfsVItAyacB+69vj23
	yvuwshG6rMcH0pAw==
Date: Tue, 12 Aug 2025 07:44:36 +0200
Subject: [PATCH v4 23/24] MIPS: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-23-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3783;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zF65fVgprCI+5PEX2Gd11z0u6ua3JxVTHzfPFJcJjKs=;
 b=Esy6EbfOm7fmj2t+sBDFIgicd0JzbcJSTuk1wzj0YxPaqfzdPFEbZ+ivqSYv677dvrTRTHpOG
 hG06K4nNRAiASYK8xK3m4Pu8PF6fSaApaCF0D/lo8n5VKUT5XEMMGlM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224457_679502_BC540343 
X-CRM114-Status: GOOD (  11.78  )
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
LmRlPgotLS0KIGFyY2gvbWlwcy92ZHNvL01ha2VmaWxlICAgICB8ICA4ICsrKystLS0tCiBsaWIv
dmRzby9LY29uZmlnICAgICAgICAgICAgfCAgMSArCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgfCAxMyArKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3Zkc28vTWFrZWZpbGUgYi9h
cmNoL21pcHMvdmRzby9NYWtlZmlsZQppbmRleCA2OWQ0NTkzZjY0ZmVlNTkzYzllYTViMDMwZWFi
ZGVhNDBiMzliODlhLi4yNGRlMDQ1NzM3NTgwZmI2YTAxNDhhYmI4N2U0NTlkOGY0YmUxZDg5IDEw
MDY0NAotLS0gYS9hcmNoL21pcHMvdmRzby9NYWtlZmlsZQorKysgYi9hcmNoL21pcHMvdmRzby9N
YWtlZmlsZQpAQCAtNjksNyArNjksNyBAQCBxdWlldF9jbWRfdmRzb19taXBzX2NoZWNrID0gVkRT
T0NISyAkQAogIwogCiBxdWlldF9jbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAk
QAotICAgICAgY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRz
b19jaGVjayk7ICQoY21kX3Zkc29fbWlwc19jaGVjaykKKyAgICAgIGNtZF92ZHNvbGRfYW5kX3Zk
c29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChjbWRfdmRzb19jaGVjayk7ICQoY21kX3Zkc29f
bWlwc19jaGVjaykKIAogcXVpZXRfY21kX3Zkc29hc19vX1MgPSBBUyAgICAgICRACiAgICAgICBj
bWRfdmRzb2FzX29fUyA9ICQoQ0MpICQoYV9mbGFncykgLWMgLW8gJEAgJDwKQEAgLTEwNiw3ICsx
MDYsNyBAQCAkKG9iai12ZHNvKTogS0JVSUxEX0FGTEFHUyA6PSAkKGFmbGFncy12ZHNvKSAkKG5h
dGl2ZS1hYmkpCiAKICQob2JqKS92ZHNvLmxkczogS0JVSUxEX0NQUEZMQUdTIDo9ICQoY2NmbGFn
cy12ZHNvKSAkKG5hdGl2ZS1hYmkpCiAKLSQob2JqKS92ZHNvLnNvLmRiZy5yYXc6ICQob2JqKS92
ZHNvLmxkcyAkKG9iai12ZHNvKSBGT1JDRQorJChvYmopL3Zkc28uc28uZGJnLnJhdzogJChvYmop
L3Zkc28ubGRzICQob2JqLXZkc28pICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFu
Z2VkLHZkc29sZF9hbmRfdmRzb19jaGVjaykKIAogJChvYmopL3Zkc28taW1hZ2UuYzogJChvYmop
L3Zkc28uc28uZGJnLnJhdyAkKG9iaikvdmRzby5zby5yYXcgXApAQCAtMTQ0LDcgKzE0NCw3IEBA
ICQob2JqKS92ZHNvLW8zMi5sZHM6IEtCVUlMRF9DUFBGTEFHUyA6PSAkKGNjZmxhZ3MtdmRzbykg
LW1hYmk9MzIKICQob2JqKS92ZHNvLW8zMi5sZHM6ICQoc3JjKS92ZHNvLmxkcy5TIEZPUkNFCiAJ
JChjYWxsIGlmX2NoYW5nZWRfZGVwLGNwcF9sZHNfUykKIAotJChvYmopL3Zkc28tbzMyLnNvLmRi
Zy5yYXc6ICQob2JqKS92ZHNvLW8zMi5sZHMgJChvYmotdmRzby1vMzIpIEZPUkNFCiskKG9iaikv
dmRzby1vMzIuc28uZGJnLnJhdzogJChvYmopL3Zkc28tbzMyLmxkcyAkKG9iai12ZHNvLW8zMikg
JCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsdmRzb2xkX2FuZF92ZHNvX2No
ZWNrKQogCiAkKG9iaikvdmRzby1vMzItaW1hZ2UuYzogVkRTT19OQU1FIDo9IG8zMgpAQCAtMTg0
LDcgKzE4NCw3IEBAICQob2JqKS92ZHNvLW4zMi5sZHM6IEtCVUlMRF9DUFBGTEFHUyA6PSAkKGNj
ZmxhZ3MtdmRzbykgLW1hYmk9bjMyCiAkKG9iaikvdmRzby1uMzIubGRzOiAkKHNyYykvdmRzby5s
ZHMuUyBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkX2RlcCxjcHBfbGRzX1MpCiAKLSQob2JqKS92
ZHNvLW4zMi5zby5kYmcucmF3OiAkKG9iaikvdmRzby1uMzIubGRzICQob2JqLXZkc28tbjMyKSBG
T1JDRQorJChvYmopL3Zkc28tbjMyLnNvLmRiZy5yYXc6ICQob2JqKS92ZHNvLW4zMi5sZHMgJChv
YmotdmRzby1uMzIpICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29s
ZF9hbmRfdmRzb19jaGVjaykKIAogJChvYmopL3Zkc28tbjMyLWltYWdlLmM6IFZEU09fTkFNRSA6
PSBuMzIKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL0tjb25maWcgYi9saWIvdmRzby9LY29uZmlnCmlu
ZGV4IGI1YjY2NzM4OTdlMjRhMWYzNjE0N2MyMWQwMGRmZjA1N2YyOTM5ODAuLjU2N2FjOTM3YTlj
MzA4NGZkNTY2OWUxYjg5MGI2NjdhZjhhMmYxMmQgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL0tjb25m
aWcKKysrIGIvbGliL3Zkc28vS2NvbmZpZwpAQCAtNTgsNiArNTgsNyBAQCBjb25maWcgSEFWRV9W
RFNPQ0hFQ0sKIAlkZWZhdWx0IHkgaWYgUklTQ1YKIAlkZWZhdWx0IHkgaWYgTE9PTkdBUkNICiAJ
ZGVmYXVsdCB5IGlmIFMzOTAKKwlkZWZhdWx0IHkgaWYgTUlQUwogCWhlbHAKIAkgIFNlbGVjdGVk
IGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSB0aGUgJ3Zkc29jaGVjaycg
cHJvZ2FtLgogCSAgT25seSB0cmFuc2l0aW9uYWwuCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggMDEwNzMw
NjJmMmIyZDI3NjI5MWNjZmJjNmFhNTE2ZjE0YTEzZmRkNS4uZDllNjYwMzg1ZTE1NGZlYTE3OTY2
NWVmOWM1YmE5MDIyM2JmNzJiZSAxMDA2NDQKLS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNr
LnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwpAQCAtMTQ2LDYgKzE0NiwxOSBA
QCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0
aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSXzM5
MF9QTFQzMkRCTCwKICAgICAgICAgICAgIF0sCiAgICAgICAgIH0pLAorICAgICAgICBiaW5kaW5n
czo6RU1fTUlQUyA9PiBTb21lKEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAgICAgICAgICBpZ25v
cmVkX29iamVjdF9maWxlX3NlY3Rpb25zOiBTb21lKCZbIi5yZWwucGRyIiwgIi5yZWxhLnBkciJd
KSwKKyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRp
bmdzOjpSX01JUFNfUEMxNiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9NSVBTX1BDMjFf
UzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTUlQU19QQzI2X1MyLAorICAgICAgICAg
ICAgICAgIGJpbmRpbmdzOjpSX01JUFNfUEMxOF9TMywKKyAgICAgICAgICAgICAgICBiaW5kaW5n
czo6Ul9NSVBTX1BDMTlfUzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTUlQU19QQ0hJ
MTYsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTUlQU19QQ0xPMTYsCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfTUlQU19QQzMyLAorICAgICAgICAgICAgXSwKKyAgICAgICAgfSks
CiAgICAgICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41MC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
