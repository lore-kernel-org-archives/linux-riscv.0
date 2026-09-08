Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D72AC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8l5uIv4bzveT3dx44xpSzW49v3gQ6x2TH/TTOjkAf4=; b=oeGHdxgqmHZTCy
	brAJRET9dYl2YCes3qLL+C57fdOngcYat+vKCl+hlmVQKaYhlsYzZFIjPasOhMHlom9qVA6jHjEjp
	1fmnpo/0e1AUqjx/JIRAHVNBVF5zEvEf+rhlY6KDPi9iG3085Z80UFhb8ACgEb7M6zxjPCxAl4ye3
	DCZfLVVt7WZKJffH0/sN3izgs5gzIXj9nORDCyf/+cNt5nMNCXS1UTyFX5qk3Q4ZlGjzeJREAucdi
	TqS5Hv4w2Dr8HoKzB1fCyx0ytZRWkhqao9xW3Ha+H5sWB8vowWwRfe6/D49ESqepzcQxKgrIOH9Wk
	WXUmQ0bd6BrrESIgI2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPq-00000008A4X-19xA;
	Tue, 08 Sep 2026 06:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pPE-000000089BH-1ob7;
	Tue, 08 Sep 2026 06:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R8S5zUcti2qRnvnqiwdZ99APOoLvCYmczAvcwW6T+78=; b=WIJ4Zz3fvDNqXiwee8JaZRqRmp
	ArNeC4a33WWdiXrDeWh1nJoGctj7+/Lg//e77Btrmpk3z8b2xiTGZxDitVCjyf6hEzGTC4SUgZF4k
	SxTE1ir5ymIAjHZGBR17bFiLTNMc1F0KXHtRbBtGR4TERXga9RCH+LdTotOu/IVHK+EaG429LT0+T
	IL7opfApIYaQM515UHWCQ7qY2GGHEjazCWeJ9ig3ulroiuYeWoycV/LuYnTmsa6dr+V3V0sbacoTI
	7+e0mciczmSUrfzZ6XiJLFNQtJDd71ti9A70sz3U3VvzeQBqU41bvoYEJ0wwycR1rspF3YHB4q09d
	Y8PqlDhg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3pPB-0000000GyjB-0WeS;
	Tue, 08 Sep 2026 06:34:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8S5zUcti2qRnvnqiwdZ99APOoLvCYmczAvcwW6T+78=;
	b=hBTTSmMhDdM2I6kdqJpAUOIrF69Iua1sqGHZrZEeJV+RrcDKO3Lh6TsXgdenOxFOnA4PoA
	412uPFiR4UGcIb6zo/ixzKsRV5LZO72namgWFB+cnr4EH1Utd/VSj8gvUK8F63ekFmUhqH
	e4ILH1GjbVqWGvLNLwK9XP+4Ygy6HN0YUB9kGB3oz57J5JzxQBb26TeNDe+cNb6xv87TOy
	Z4jMkBFqsKI4y45ukbIyST/V0/zEwljrr2NXcntK+uBr0cM363V1w55zye9RhNq6wnigOn
	7fYPjipzEFO17Oeq+ED1P9qQWrEtAGBcvP+xMvJvi49Am978rgJgX00l+QbCZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8S5zUcti2qRnvnqiwdZ99APOoLvCYmczAvcwW6T+78=;
	b=pnROhmeQiS3cU0albwBwH9dlRL1TxZa9HToYE3xYcsDLiQflLOIHiW/vhhcx0oenTo2D8f
	TUqAyVRELIZVMCDg==
Date: Tue, 08 Sep 2026 08:33:52 +0200
Subject: [PATCH v5 18/24] riscv: vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-18-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=3596;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rB4eegSBfTJvyEpPR1AwSf8HHKeuiOU4EBXL8/NjovM=;
 b=ckjkIaN/2GD1n4ZD/6VNQXvUS4c8EPXkV5wm26xnc8Ipzseks5mvPh9EdV3eGaQ2tZQZNlGho
 JgbUjoNJu6vBrX5nqStpT8ES8eXNkaNjgeSRWwJDzlvAf1sCbw19+8k
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_073405_418332_AA192CF0 
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
LmRlPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGY4ZTI2YzRiZWQyYi4uZjU4
MGQyYWZlY2Y3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCkBAIC0yMjksNiArMjI5LDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IFRIUkVB
RF9JTkZPX0lOX1RBU0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBV
QUNDRVNTX01FTUNQWSBpZiAhTU1VCisJc2VsZWN0IFZEU09fQ0hFQ0sgaWYgTU1VCiAJc2VsZWN0
IFZEU09fREFUQVNUT1JFIGlmIE1NVQogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTSBpZiBNTVUgJiYg
NjRCSVQKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2Vm
aWxlCmluZGV4IDhkYmYyNTMyYTU3My4uN2U3MDdmZGZmMjZjIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFr
ZWZpbGUKQEAgLTc0LDcgKzc0LDcgQEAgZW5kaWYKICQob2JqKS8kKHZkc29fbyk6ICQob2JqKS8k
KHZkc29fc28pCiAKICMgbGluayBydWxlIGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJl
IGZpcnN0Ci0kKG9iaikvJCh2ZHNvX3NvX2RiZyk6ICQob2JqKS8kKHZkc29fbGRzKSAkKG9iai12
ZHNvKSBGT1JDRQorJChvYmopLyQodmRzb19zb19kYmcpOiAkKG9iaikvJCh2ZHNvX2xkcykgJChv
YmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsdmRzb2xkX2Fu
ZF9jaGVjaykKIExERkxBR1NfJCh2ZHNvX3NvX2RiZykgPSAtc2hhcmVkIC1zb25hbWU9bGludXgt
dmRzby5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1laC1mcmFtZS1oZHIKQEAgLTk2LDcgKzk2
LDcgQEAgaW5jbHVkZS9nZW5lcmF0ZWQvJCh2ZHNvX29mZnNldHMpOiAkKG9iaikvJCh2ZHNvX3Nv
X2RiZykgRk9SQ0UKICMgVGhlIERTTyBpbWFnZXMgYXJlIGJ1aWx0IHVzaW5nIGEgc3BlY2lhbCBs
aW5rZXIgc2NyaXB0CiAjIE1ha2Ugc3VyZSBvbmx5IHRvIGV4cG9ydCB0aGUgaW50ZW5kZWQgX192
ZHNvX3h4eCBzeW1ib2wgb2Zmc2V0cy4KIHF1aWV0X2NtZF92ZHNvbGRfYW5kX2NoZWNrID0gVkRT
T0xEICAkQAotICAgICAgY21kX3Zkc29sZF9hbmRfY2hlY2sgPSAkKExEKSAkKENGSV9GVUxMKSAk
KGxkX2ZsYWdzKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pIC1vICRALnRtcCAmJiBcCisgICAg
ICBjbWRfdmRzb2xkX2FuZF9jaGVjayA9ICQoTEQpICQoQ0ZJX0ZVTEwpICQobGRfZmxhZ3MpIC1U
ICQoZmlsdGVyLW91dCBGT1JDRSAkKHZkc29jaGVjayksJF4pIC1vICRALnRtcCAmJiBcCiAgICAg
ICAgICAgICAgICAgICAgJChPQkpDT1BZKSAkKHBhdHN1YnN0ICUsIC1HIF9fdmRzb18lLCAkKHZk
c28tc3ltcykpICRALnRtcCAkQCAmJiBcCiAgICAgICAgICAgICAgICAgICAgcm0gJEAudG1wICYm
IFwKICAgICAgICAgICAgICAgICAgICAkKGNtZF92ZHNvX2NoZWNrKQpkaWZmIC0tZ2l0IGEvbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCmlu
ZGV4IDQyOWJkY2Q2NTgxOC4uNjc1NjJkMjFmODc3IDEwMDY0NAotLS0gYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCkBAIC05Niw2
ICs5NiwzMiBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUx
NikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgLi5EZWZhdWx0
OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5n
czo6RU1fUklTQ1YgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGluX29iamVj
dF9maWxlOiAmWworICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX0JSQU5DSCwKKyAg
ICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9KQUwsCisgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfUklTQ1ZfQ0FMTCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9D
QUxMX1BMVCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9QQ1JFTF9ISTIwLAor
ICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1BDUkVMX0xPMTJfSSwKKyAgICAgICAg
ICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9QQ1JFTF9MTzEyX1MsCisgICAgICAgICAgICAgICAg
YmluZGluZ3M6OlJfUklTQ1ZfQUREOCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVND
Vl9BREQxNiwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9BREQzMiwKKyAgICAg
ICAgICAgICAgICBiaW5kaW5nczo6Ul9SSVNDVl9BREQ2NCwKKyAgICAgICAgICAgICAgICBiaW5k
aW5nczo6Ul9SSVNDVl9TVUI4LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1NV
QjE2LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1NVQjMyLAorICAgICAgICAg
ICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1NVQjY0LAorICAgICAgICAgICAgICAgIGJpbmRpbmdz
OjpSX1JJU0NWX0FMSUdOLAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1JJU0NWX1JWQ19C
UkFOQ0gsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfUlZDX0pVTVAsCisgICAg
ICAgICAgICAgICAgYmluZGluZ3M6OlJfUklTQ1ZfUkVMQVgsCisgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfUklTQ1ZfMzJfUENSRUwsCisgICAgICAgICAgICBdLAorICAgICAgICAgICAgLi5E
ZWZhdWx0OjpkZWZhdWx0KCkKKyAgICAgICAgfQorICAgICAgICAuaW50bygpLAogICAgICAgICBf
ID0+IE5vbmUsCiAgICAgfQogfQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
