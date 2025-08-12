Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F395C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJCpZ7tgTaIzyYeMcMq8tbBaFE7uwnfyfp/wOJhR12w=; b=YeGVkNVytr5vbF
	aeVPRP5q2KRrPtXXj4w5f5RMmZ4wTmBFSOewbp+HN6pilj5Sfb9CvRzVw46VjIgxp0s57JpOMG+tG
	RCyp3kql+rBdzi4dpiHUX2903b5chHvAwDNxclz06cINLznRZIu3WCSyXeFTCNVDXTRuAGXfbzloe
	L/EGfmP4yMyeWiFQrOvsUqHgs5SsDhW8c0lS39nVCkzarKyOOXkr0m/drz8NbhzxfvP+GqFaNoOni
	FiI49GPJwMY64Usef/5Qg8tUjdOk6yEOUuzPwr+YoYFPUQbUMiV1y5ulgQzG3hVKsx8gF+hFcR6xG
	UW6F14ZOpbBT6HEg5fCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljwJ-0000000ABBt-42k7;
	Tue, 12 Aug 2025 08:00:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoh-00000009vEW-3WyF;
	Tue, 12 Aug 2025 05:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=; b=WjGZoJWH+qZ3SYYr/3a/61uy5v
	lRF3C8w2AgfIUZlQiC5wQ9SBrMG4fvgFkKMs1kp4SEWZzq5LP2gcphUPADlGeYuVau2/s7HWiN1yK
	J0HsxJpITMWqR9CVn0K2vWErWCT5mBVe93N0P6YcliNSq1VaWEobhxGqWTsrs/4ifdWs14oo1Jas7
	uGID4ST2RkoGRTKeSXjth8Ft4E5kZQtQX6eG+5dtGu5Opet94XorC6l4mUqzYUIe+ys63vmG/iUkw
	2ChtBnLsEdYgQLJ55LvdyV6K/W0ynFo3ccZwDhXm9QXaNRSdQypI111MNZ0cHbBA1jY4w+rp6M4LA
	lblnAQSA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhob-0000000FgCN-34Kg;
	Tue, 12 Aug 2025 05:44:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=;
	b=y6kJZp/aMepqZyqIpu2Ge7fuGhIrg50IqAa8/kDWQydm7It5QCDOz2yKzkQ3nTVNspTLSa
	0Z4k7oD1Q+xCqfzj5lYWkxPTS1MmOTr51kIJLK870+GnX/yGOhUkdCBK3uwWNwW6iPZVQC
	tgpAkrU7Zb0EAA6ZRz5RBZ6MPFx1SbJhfTBFQA4FevsFC+l/Zzx62GlvL4c5g3ZKDTbJWh
	7bvJslx0+0Y9/A2L7wtCdcBkbz4Hhs6lfksVYdjmQ5h4IYF4Bv1fx8akKwgCXeg+i8kq/k
	X4D8gv59NZLmB7c4EWhKN/Uxh5AX9lhl4fWV3oXKTC2YK9nd/9yxz6HJGp2oAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=;
	b=NXZQJgvpthSi0X2yy7bk/mKr8cSd4B68z61qxsqtB551PCUPMszU49Btx/qpuXPqLXGzsR
	LaQJ4RnSqXSXw+DA==
Date: Tue, 12 Aug 2025 07:44:33 +0200
Subject: [PATCH v4 20/24] LoongArch: vDSO: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-20-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3338;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1IZrubHrqMbaFtOk3hdvCwRPSsl7pLGR/UJMuiLBbOY=;
 b=LqYg38rSkBwpE7p9p2L9QYuv0JUyTLtER245hHstQoHs7MiLUh2lPURSIZcAihCYxsat6bpQV
 An04KjctmxQDRVzmaoiEcTtq1AzmJcVR/h2OWecT6+BVOcWz8b8Wtr+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064456_413591_5E74BEB1 
X-CRM114-Status: GOOD (  12.31  )
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
LmRlPgotLS0KIGFyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUgfCAgNCArKy0tCiBsaWIvdmRz
by9LY29uZmlnICAgICAgICAgICAgIHwgIDEgKwogbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJz
ICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvdmRz
by9NYWtlZmlsZSBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUKaW5kZXggZDgzMTZmOTkz
NDgyNDA2YzI2MzNiNDliMWRhYTQ3NWZjNDE1YTgyYy4uYTliMTkzNGRjZTdjODIxZGY5NmU2MzZh
OTgzM2U3MGYyMmVlMWIzMSAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gvdmRzby9NYWtlZmls
ZQorKysgYi9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCkBAIC00Myw3ICs0Myw3IEBAIGxk
ZmxhZ3MteSA6PSAtQnN5bWJvbGljIC0tbm8tdW5kZWZpbmVkIC1zb25hbWU9bGludXgtdmRzby5z
by4xIFwKICMKIAogcXVpZXRfY21kX3Zkc29sZF9hbmRfdmRzb19jaGVjayA9IExEICAgICAgJEAK
LSAgICAgIGNtZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZCk7ICQoY21kX3Zkc29f
Y2hlY2spCisgICAgICBjbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gJChjbWRfbGRfdmRzbyk7
ICQoY21kX3Zkc29fY2hlY2spCiAKIHF1aWV0X2NtZF92ZHNvYXNfb19TID0gQVMgICAgICAgJEAK
ICAgICAgIGNtZF92ZHNvYXNfb19TID0gJChDQykgJChhX2ZsYWdzKSAtYyAtbyAkQCAkPApAQCAt
NzIsNyArNzIsNyBAQCAkKG9iai12ZHNvKTogS0JVSUxEX0FGTEFHUyA6PSAkKGFmbGFncy12ZHNv
KSAkKG5hdGl2ZS1hYmkpCiAKICQob2JqKS92ZHNvLmxkczogS0JVSUxEX0NQUEZMQUdTIDo9ICQo
Y2NmbGFncy12ZHNvKSAkKG5hdGl2ZS1hYmkpCiAKLSQob2JqKS92ZHNvLnNvLmRiZzogJChvYmop
L3Zkc28ubGRzICQob2JqLXZkc28pIEZPUkNFCiskKG9iaikvdmRzby5zby5kYmc6ICQob2JqKS92
ZHNvLmxkcyAkKG9iai12ZHNvKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdl
ZCx2ZHNvbGRfYW5kX3Zkc29fY2hlY2spCiAKICQob2JqKS92ZHNvLnNvOiBPQkpDT1BZRkxBR1Mg
Oj0gLVMKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL0tjb25maWcgYi9saWIvdmRzby9LY29uZmlnCmlu
ZGV4IDQ0MWZmMDNlMTAyOGY3YmRlNTEwNGJkMDE5NDFjNmE5YjAwNmUyMWYuLjBmZTcwYjM2MDRm
OTkyNWVmOGM1NjA4YmI0Y2FjMjRkM2EyOGZhYWIgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL0tjb25m
aWcKKysrIGIvbGliL3Zkc28vS2NvbmZpZwpAQCAtNTYsNiArNTYsNyBAQCBjb25maWcgSEFWRV9W
RFNPQ0hFQ0sKIAlkZWZhdWx0IHkgaWYgQVJNNjQKIAlkZWZhdWx0IHkgaWYgUFBDCiAJZGVmYXVs
dCB5IGlmIFJJU0NWCisJZGVmYXVsdCB5IGlmIExPT05HQVJDSAogCWhlbHAKIAkgIFNlbGVjdGVk
IGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSB0aGUgJ3Zkc29jaGVjaycg
cHJvZ2FtLgogCSAgT25seSB0cmFuc2l0aW9uYWwuCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggZDQ4Yzlk
YTZmMTgyNzBhZmU4ODNkMTY3OTU1ZjczZjA2MWI5YzQ3Mi4uOTM4MTlmNjY4ZDhhNGY2MjNmNDE0
MDNiYjA5YjQyYzRhZWMyYzhkZSAxMDA2NDQKLS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNr
LnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwpAQCAtMTE1LDYgKzExNSwyOSBA
QCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0
aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJ
U0NWXzMyX1BDUkVMLAogICAgICAgICAgICAgXSwKICAgICAgICAgfSksCisgICAgICAgIGJpbmRp
bmdzOjpFTV9MT09OR0FSQ0ggPT4gU29tZShBbGxvd2VkUmVsb2NhdGlvbnMgeworICAgICAgICAg
ICAgaWdub3JlZF9vYmplY3RfZmlsZV9zZWN0aW9uczogTm9uZSwKKyAgICAgICAgICAgIGluX29i
amVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX0FERDgsCisg
ICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQUREMTYsCisgICAgICAgICAgICAgICAg
YmluZGluZ3M6OlJfTEFSQ0hfQUREMjQsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFS
Q0hfQUREMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQURENjQsCisgICAg
ICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfU1VCOCwKKyAgICAgICAgICAgICAgICBiaW5k
aW5nczo6Ul9MQVJDSF9TVUIxNiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9T
VUIyNCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9TVUIzMiwKKyAgICAgICAg
ICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF9TVUI2NCwKKyAgICAgICAgICAgICAgICBiaW5kaW5n
czo6Ul9MQVJDSF9CMTYsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfQjIxLAor
ICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX0IyNiwKKyAgICAgICAgICAgICAgICBi
aW5kaW5nczo6Ul9MQVJDSF9QQ0FMQV9ISTIwLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpS
X0xBUkNIX1BDQUxBX0xPMTIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfTEFSQ0hfUENB
TEE2NF9MTzIwLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIX1BDQUxBNjRfSEkx
MiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9MQVJDSF8zMl9QQ1JFTCwKKyAgICAgICAg
ICAgIF0sCisgICAgICAgIH0pLAogICAgICAgICBfID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIu
NTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
