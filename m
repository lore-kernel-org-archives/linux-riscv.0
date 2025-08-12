Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928CBCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+Vi8otdy6AkbmY4KdJqWd5/i92TU4C56wW/0k2v+w4=; b=nBQhkuFoStj0iZ
	Tac/alXvOBLOgR2LM1TZ9yH20s4pstVRCl8GeHvBZxdob9F6i0XJJHsiEf/SNaFd1xUNNSxX3/swn
	6qtnkH+3JMU4nvaijOTXgaH2bt63N+MVk25sUU3jioLLV0lvb1c0SGpvDDBamyHz8yKw6bCvYkwWR
	QQvgFkE6aKwKO6gxbc5dxP3w+poNC9y7cKwudCyDAojWYCy8YeuE0z5c1v9uzHjt2RuMijKJ/41I3
	kQ1Cp2OIvuRho6UFxxY6QJO2v+jsBGmyf79mz1QjcOT7zO26GKbKhNS9z4nH4tWieTaOxiEq0EAxh
	ZOgNGv64xRHGkskutbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljwL-0000000ABDh-1hUR;
	Tue, 12 Aug 2025 08:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoh-00000009vEU-3Q0C;
	Tue, 12 Aug 2025 05:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=; b=jtPl9ZC2c3HPkOi7p4g8+rD7Ih
	f62S9+2mZelNf55W5HSrUSO+P37Fwime1AeDKbAvlUEc9bxx/dOdRQrv7LyLQyVyaVQb5dT2HN05p
	whskvhDOGZ3a8xB8T78m0/MGXov4APbhnKJABI7+jVGlg6eDivpJCAX5/MrU9ShGCdzL7n3Y8PXLy
	g6x1ImFoRsIsq/W97fgVA9T1AG7A5Qw19IbYFA0lpfLq0mRuK3RatGJyzEeAvd2JnjnLQsD1GJtsd
	5mz+LjNlbnmX9GIo5FBFaMjkznY4gpWlvSRM68RfA2x8QzGOQPMQ8Blf1Gue3SdU5f/kxdvH186yc
	ag27h7jA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoc-0000000FgDV-2kZy;
	Tue, 12 Aug 2025 05:44:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=;
	b=YVIBrzVs6jMRgP60RbLocRZINlpYIvgh/R8TmjjX9sgPwnMSGZAXRyMlQNpfj8cGpZ/fxK
	G1/ToFEH5kb8MyAyKBkqwWZy3FKtIaGyFnw/jDcC7cDfkV57unEWUErdw+4OFfUlhZ4I+Z
	u8LwflPKLpav+TZK1MYkSfenBQn967+uc5qSfgthMGz/rbRyu5ep6Dm6EBqZkIbqP0QvA/
	DEO9YwRG3oLtdNHQfyHGqGzKfO4J2v2y0izQdU6www5cNj6J0F/5SABcNgh9oQkLaiJmvS
	5ypEzeVA2rzpysAIPhXAr1gdv1DqmozBuroN9m2hnP3Ep+YD2Fk+LtTvniAoEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=;
	b=AHGoK11e3ONpNsRnJ36Q4yzXjYjg8Xc+9ohCcoySpaOfSk5kLWkDoRsDYtFjalcZguXquc
	0s1EVjzvsI3du6Bg==
Date: Tue, 12 Aug 2025 07:44:34 +0200
Subject: [PATCH v4 21/24] s390/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-21-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3294;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PbETMq9VTMEwxP8nGcVWnIK4aa/sB1ug5A+6i2j8Dag=;
 b=0cxT7S8ALFBcremtG1GBYu7CMsjCUUhSxQ1TwTPoImStmnRVATckJ934fbovkMMjfs5d2wReE
 xM4bYW6HkdvAmAnJ8M3DKlcu59tynIH+5lbTlWBXo2H7IRGxFBIBEy2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064456_413678_E50ED7A3 
X-CRM114-Status: GOOD (  12.33  )
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
LmRlPgotLS0KIGFyY2gvczM5MC9rZXJuZWwvdmRzbzMyL01ha2VmaWxlIHwgNCArKy0tCiBhcmNo
L3MzOTAva2VybmVsL3Zkc282NC9NYWtlZmlsZSB8IDQgKystLQogbGliL3Zkc28vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgfCAxICsKIGxpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyAgICAgIHwg
OCArKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvdmRzbzMyL01ha2VmaWxlIGIvYXJj
aC9zMzkwL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUKaW5kZXggMWU0ZGRkMWE2ODNmZjg0NDkyZjBm
NGI0OGQwZWZhMDA2ODgxMjljMi4uNmU4ZmJhMjQ4ZDFhYTg3ODdmNDRhY2EyZDgyZDc3YzI0NTg3
MWI2NSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUKKysrIGIv
YXJjaC9zMzkwL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUKQEAgLTM2LDkgKzM2LDkgQEAgQ1BQRkxB
R1NfdmRzbzMyLmxkcyArPSAtUCAtQyAtVSQoQVJDSCkKICQob2JqKS92ZHNvMzJfd3JhcHBlci5v
IDogJChvYmopL3Zkc28zMi5zbwogCiBxdWlldF9jbWRfdmRzb19hbmRfY2hlY2sgPSBWRFNPICAg
ICRACi0gICAgICBjbWRfdmRzb19hbmRfY2hlY2sgPSAkKGNtZF9sZCk7ICQoY21kX3Zkc29fY2hl
Y2spCisgICAgICBjbWRfdmRzb19hbmRfY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChjbWRfdmRz
b19jaGVjaykKIAotJChvYmopL3Zkc28zMi5zby5kYmc6ICQob2JqKS92ZHNvMzIubGRzICQob2Jq
LXZkc28zMikgRk9SQ0UKKyQob2JqKS92ZHNvMzIuc28uZGJnOiAkKG9iaikvdmRzbzMyLmxkcyAk
KG9iai12ZHNvMzIpICQodmRzb2NoZWNrKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29f
YW5kX2NoZWNrKQogCiAjIHN0cmlwIHJ1bGUgZm9yIHRoZSAuc28gZmlsZQpkaWZmIC0tZ2l0IGEv
YXJjaC9zMzkwL2tlcm5lbC92ZHNvNjQvTWFrZWZpbGUgYi9hcmNoL3MzOTAva2VybmVsL3Zkc282
NC9NYWtlZmlsZQppbmRleCBkOGYwZGY3NDI4MDk2MGNiMzUxMTU0YThhNzNiNGY3ZmU4M2E5MTI1
Li4xMzM0YjZhMTg4Y2VkYzg4M2ZlOThkYzI3MWE5OTVlZTY5MGM3ZmFkIDEwMDY0NAotLS0gYS9h
cmNoL3MzOTAva2VybmVsL3Zkc282NC9NYWtlZmlsZQorKysgYi9hcmNoL3MzOTAva2VybmVsL3Zk
c282NC9NYWtlZmlsZQpAQCAtNDYsMTAgKzQ2LDEwIEBAIENQUEZMQUdTX3Zkc282NC5sZHMgKz0g
LVAgLUMgLVUkKEFSQ0gpCiAkKG9iaikvdmRzbzY0X3dyYXBwZXIubyA6ICQob2JqKS92ZHNvNjQu
c28KIAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAkQAotICAgICAgY21kX3Zk
c29fYW5kX2NoZWNrID0gJChjbWRfbGQpOyAkKGNtZF92ZHNvX2NoZWNrKQorICAgICAgY21kX3Zk
c29fYW5kX2NoZWNrID0gJChjbWRfbGRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spCiAKICMgbGlu
ayBydWxlIGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZpcnN0Ci0kKG9iaikvdmRz
bzY0LnNvLmRiZzogJChvYmopL3Zkc282NC5sZHMgJChvYmotdmRzbzY0KSAkKG9iai1jdmRzbzY0
KSBGT1JDRQorJChvYmopL3Zkc282NC5zby5kYmc6ICQob2JqKS92ZHNvNjQubGRzICQob2JqLXZk
c282NCkgJChvYmotY3Zkc282NCkgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5n
ZWQsdmRzb19hbmRfY2hlY2spCiAKICMgc3RyaXAgcnVsZSBmb3IgdGhlIC5zbyBmaWxlCmRpZmYg
LS1naXQgYS9saWIvdmRzby9LY29uZmlnIGIvbGliL3Zkc28vS2NvbmZpZwppbmRleCAwZmU3MGIz
NjA0Zjk5MjVlZjhjNTYwOGJiNGNhYzI0ZDNhMjhmYWFiLi5iNWI2NjczODk3ZTI0YTFmMzYxNDdj
MjFkMDBkZmYwNTdmMjkzOTgwIDEwMDY0NAotLS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBiL2xp
Yi92ZHNvL0tjb25maWcKQEAgLTU3LDYgKzU3LDcgQEAgY29uZmlnIEhBVkVfVkRTT0NIRUNLCiAJ
ZGVmYXVsdCB5IGlmIFBQQwogCWRlZmF1bHQgeSBpZiBSSVNDVgogCWRlZmF1bHQgeSBpZiBMT09O
R0FSQ0gKKwlkZWZhdWx0IHkgaWYgUzM5MAogCWhlbHAKIAkgIFNlbGVjdGVkIGZvciBhcmNoaXRl
Y3R1cmVzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSB0aGUgJ3Zkc29jaGVjaycgcHJvZ2FtLgogCSAg
T25seSB0cmFuc2l0aW9uYWwuCmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgYi9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMKaW5kZXggOTM4MTlmNjY4ZDhhNGY2MjNm
NDE0MDNiYjA5YjQyYzRhZWMyYzhkZS4uMDEwNzMwNjJmMmIyZDI3NjI5MWNjZmJjNmFhNTE2ZjE0
YTEzZmRkNSAxMDA2NDQKLS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xp
Yi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwpAQCAtMTM4LDYgKzEzOCwxNCBAQCBmbiBhbGxvd2Vk
X3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0aW9uPEFsbG93ZWRS
ZWxvY2F0aW9uczwncwogICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX0xBUkNIXzMyX1BDUkVM
LAogICAgICAgICAgICAgXSwKICAgICAgICAgfSksCisgICAgICAgIGJpbmRpbmdzOjpFTV9TMzkw
ID0+IFNvbWUoQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGlnbm9yZWRfb2JqZWN0
X2ZpbGVfc2VjdGlvbnM6IE5vbmUsCisgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTogJlsKKyAg
ICAgICAgICAgICAgICBiaW5kaW5nczo6Ul8zOTBfUEMzMiwKKyAgICAgICAgICAgICAgICBiaW5k
aW5nczo6Ul8zOTBfUEMzMkRCTCwKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul8zOTBfUExU
MzJEQkwsCisgICAgICAgICAgICBdLAorICAgICAgICB9KSwKICAgICAgICAgXyA9PiBOb25lLAog
ICAgIH0KIH0KCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
