Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0136CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJZ+Ufx2jkz5GoF2l09ozGudsz9pxMUC9MNnHKgsMoA=; b=u0ww+8iZXDeW2d
	2h/4Tk5HLBV+8wPeHFc0sL9L6L0OdLuPlqUTYbyhSh4uGLmFLGfN5m1pxPJOACBN5lNPK5ZcNNOFB
	envjk9GXDwiF3Hh4KbMAL9AyVXjRPBpNF+p3+PkV9dt5DK9pfDWCggUnDO9lxyw/u4vPVDEaZ+6sh
	jOSDN/0+Ts1XWpyygCfLj1cGGO/9dsLEuOe4k+A/WNleP1qDuzjXC3zx+Lk67ng0Z7cFUBX1h8V5Y
	c4HzhpJvY5aJuiD6MwetzkckSlLBGVd8bwsb+Lh9euRJXNozPevZlLwKZ+Qo8F5CyH8fjFtQ6g2nI
	QnNU+NRsZfOnHyH+eTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhp4-00000009viZ-2jLn;
	Tue, 12 Aug 2025 05:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhod-00000009v73-0DjJ;
	Tue, 12 Aug 2025 05:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=; b=JbiMQUlJ7pg16mc6kL6D90jeNv
	3d/h80kgG/BSV0EfXtFd/YkeL52UU00tyQeFRFgACaDR8lsM4916F4rHJnuBzRhVfkZJvQVPHx8Mp
	tylryDKBx1ZnQ+ZQrmvmcqt+GRmecyvRlO2ANJRsxzGh3RpNelokCBHrwCvcmfCBD/jW9zKGThHWz
	D0y9wXMRzIljuFJ1zPiQBQRxJ+wBg8YybesxqYefr9h4xgpO7KDX4cWxV6qbQy/kFlYkA8syJOucM
	zryr83fertdPCHlsNA1OpUw42xiFvvg0mDT+2JTERPyx3nidgS5snQkZKkxJ0r/rMD3J9C/03j8xr
	SxqjyEnA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoX-0000000Fg9f-34iq;
	Tue, 12 Aug 2025 05:44:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=;
	b=F22xZcK20TXBf5jZYwevz3QDaZU3UZdkYRKPWY6C4m9SOtAW/94DLHjYy+CQODOajcbuP8
	MPuKnXuduuI/jhqsirbr4WDRq0UCEwLS9ico7i3W51ZwBK//QX5U/DFAfzE1ZfWMKRv1fo
	U204HMGXOXouMg9NvdzgNnQ3u5xAm7roz2wc8MIoolSJvm4oYaWLKrkRHYueW7rKS1NB1M
	M66TWmw08jIG99a4Abb4Ty+uqba/s3TVFyhenXOKgI+lnOHn0VOL47w8Nbea7L7Aa9lbbq
	qDIyaw6x+h/5wdjGBDsWrXJDjrCbuIbIvo6NedGG2NbzD7A6pnHseaNfqod0Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=;
	b=CIvDa3NH3jry3aeRacozBMFDrQSzLfZ5hYqcOa0ZRn/0gu5GgdotOJzL+xdQny7o5u5pZT
	TOIV6QFRAgoN9fCw==
Date: Tue, 12 Aug 2025 07:44:29 +0200
Subject: [PATCH v4 16/24] powerpc/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-16-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3422;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=r7UGwjKWy5Zeb3xhIIrMh9pf0ciHc2+w+MWcQSjDNGA=;
 b=Q0EZvSWT3Q75vpmTxwYRVjiyR2O2xw9tAfm1kD1FblKw0cRCQJd0iAfyLt/+gYR+ZyTVxexIt
 TIIS6p5vayTD8+ve2mOSceJuJpTEl1kRVjS440cBUU/8+/7OHdQGucC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064449_940387_430744F6 
X-CRM114-Status: GOOD (  12.08  )
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
LmRlPgotLS0KIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8ICA0ICsrLS0KIGxp
Yi92ZHNvL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxICsKIGxpYi92ZHNvL2NoZWNrL3Zk
c29jaGVjay5ycyAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Zk
c28vTWFrZWZpbGUKaW5kZXggODgzNGRmZTlkNzI3OTZjOGYxZTIwYjg0ZWJjYjMzYTZiNzRiODJm
MC4uMTkzYWY2ODc3ZWJhMjU4OThhZWFmNTVhMDRjZDgzNGY3YTJlYjc1MyAxMDA2NDQKLS0tIGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzby9NYWtlZmlsZQpAQCAtNzUsOSArNzUsOSBAQCB0YXJnZXRzICs9IHZkc282NC5sZHMK
IENQUEZMQUdTX3Zkc282NC5sZHMgKz0gLVAgLUMKIAogIyBsaW5rIHJ1bGUgZm9yIHRoZSAuc28g
ZmlsZSwgLmxkcyBoYXMgdG8gYmUgZmlyc3QKLSQob2JqKS92ZHNvMzIuc28uZGJnOiAkKG9iaikv
dmRzbzMyLmxkcyAkKG9iai12ZHNvMzIpICQob2JqKS92Z2V0dGltZW9mZGF5LTMyLm8gJChvYmop
L3ZnZXRyYW5kb20tMzIubyAkKG9iaikvY3J0c2F2cmVzLTMyLm8gRk9SQ0UKKyQob2JqKS92ZHNv
MzIuc28uZGJnOiAkKG9iaikvdmRzbzMyLmxkcyAkKG9iai12ZHNvMzIpICQob2JqKS92Z2V0dGlt
ZW9mZGF5LTMyLm8gJChvYmopL3ZnZXRyYW5kb20tMzIubyAkKG9iaikvY3J0c2F2cmVzLTMyLm8g
JCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsdmRzbzMybGRfYW5kX2NoZWNr
KQotJChvYmopL3Zkc282NC5zby5kYmc6ICQob2JqKS92ZHNvNjQubGRzICQob2JqLXZkc282NCkg
JChvYmopL3ZnZXR0aW1lb2ZkYXktNjQubyAkKG9iaikvdmdldHJhbmRvbS02NC5vIEZPUkNFCisk
KG9iaikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc282NC5sZHMgJChvYmotdmRzbzY0KSAkKG9i
aikvdmdldHRpbWVvZmRheS02NC5vICQob2JqKS92Z2V0cmFuZG9tLTY0Lm8gJCh2ZHNvY2hlY2sp
IEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsdmRzbzY0bGRfYW5kX2NoZWNrKQogCiAjIGFzc2Vt
Ymx5IHJ1bGVzIGZvciB0aGUgLlMgZmlsZXMKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL0tjb25maWcg
Yi9saWIvdmRzby9LY29uZmlnCmluZGV4IDMwMzdiMTU0NzZiYjYwZWU0N2MxZTA4M2VhZTM5Njhh
Yjk2MDRmNTkuLjg5OTQ0MTlkOTBlN2I1YzY2YWM3NzQ0OWI2YzNiZDk2Yzk2ODk4M2QgMTAwNjQ0
Ci0tLSBhL2xpYi92ZHNvL0tjb25maWcKKysrIGIvbGliL3Zkc28vS2NvbmZpZwpAQCAtNTQsNiAr
NTQsNyBAQCBjb25maWcgSEFWRV9WRFNPQ0hFQ0sKIAlkZWZhdWx0IHkgaWYgWDg2CiAJZGVmYXVs
dCB5IGlmIEFSTQogCWRlZmF1bHQgeSBpZiBBUk02NAorCWRlZmF1bHQgeSBpZiBQUEMKIAloZWxw
CiAJICBTZWxlY3RlZCBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGFyZSBzdXBwb3J0ZWQgYnkgdGhl
ICd2ZHNvY2hlY2snIHByb2dhbS4KIAkgIE9ubHkgdHJhbnNpdGlvbmFsLgpkaWZmIC0tZ2l0IGEv
bGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJz
CmluZGV4IGE2OTVhZWQ5NWFkMzkxYTBjNTVlNTM4OGJjNmQxZjExNDFmZDc4NGUuLjU0MzcyYTU0
N2IxY2RlMDVjMWE0NDU0YjlhMjFkZTM1N2IyMmIwZGYgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2No
ZWNrL3Zkc29jaGVjay5ycworKysgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKQEAgLTY1
LDYgKzY1LDMxIEBAIGZuIGFsbG93ZWRfcmVsb2NhdGlvbnNfZm9yX21hY2hpbmUobWFjaGluZTog
dTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRpb25zPCdzCiAgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfQUFSQ0g2NF9DQUxMMjYsCiAgICAgICAgICAgICBdLAogICAgICAgICB9KSwKKyAg
ICAgICAgYmluZGluZ3M6OkVNX1BQQyA9PiBTb21lKEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAg
ICAgICAgICBpZ25vcmVkX29iamVjdF9maWxlX3NlY3Rpb25zOiBOb25lLAorICAgICAgICAgICAg
aW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDX1JFTDI0
LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNCwKKyAgICAgICAgICAgICAg
ICBiaW5kaW5nczo6Ul9QUENfUkVMMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBD
X1JFTDE2LAorICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNl9MTywKKyAgICAg
ICAgICAgICAgICBiaW5kaW5nczo6Ul9QUENfUkVMMTZfSEksCisgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfUFBDX1JFTDE2X0hBLAorICAgICAgICAgICAgXSwKKyAgICAgICAgfSksCisgICAg
ICAgIGJpbmRpbmdzOjpFTV9QUEM2NCA9PiBTb21lKEFsbG93ZWRSZWxvY2F0aW9ucyB7CisgICAg
ICAgICAgICBpZ25vcmVkX29iamVjdF9maWxlX3NlY3Rpb25zOiBOb25lLAorICAgICAgICAgICAg
aW5fb2JqZWN0X2ZpbGU6ICZbCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVM
MjQsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTQsCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMzIsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6
OlJfUFBDNjRfUkVMNjQsCisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTYs
CisgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTZfTE8sCisgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTZfSEksCisgICAgICAgICAgICAgICAgYmluZGlu
Z3M6OlJfUFBDNjRfUkVMMTZfSEEsCisgICAgICAgICAgICBdLAorICAgICAgICB9KSwKICAgICAg
ICAgXyA9PiBOb25lLAogICAgIH0KIH0KCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
