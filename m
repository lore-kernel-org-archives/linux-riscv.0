Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC05606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eiD+VEpS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=y2qrpUFH;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XY2hGy4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=exZ0DDO+B6heMej+3N58rZ1xEaA3P+KbuoNu1SFbOIA=; b=eiD+VEpSSu2OVzMGNNEBF6zitx
	ijAfKCkFazHYrAA91h/fpAunlZKnZ1uu5hy/H9TC/sycJ9Avi8pvU4fas82/SnNyRHAk5UlMg3VXm
	wC6Vw5AZoxNq5VrnDAHMk7psZ2hu4B1l9rn/J8MqK4wjFeIXYauHEKJkrbbAPqZrFFO3tAPcnOlZb
	7/RWWVS6SMsakggeSSN6xRoFcapOmbtmfitzjqbuJEFMaexaS5i7uE3bzU+4oPDluQK3zMHXyU/Nb
	VusMLIlhTPwQBeSQ1BA1nvMRuWQGkx71UGuuZPZXfsvk4FhGAxf7lQXx6IQf23Mwbbwl4zIje6gha
	0JAXhquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSL-00000003eGr-07tP;
	Mon, 23 Nov 2026 13:51:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS5-00000003dz6-31hs;
	Mon, 23 Nov 2026 13:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4eFtOIUXlB/3zrN30y5Vr5c5KdL9zNbkcXs+QwRBLLo=;
	b=y2qrpUFHjyo+0pMBHaWwUhYXbTJNPIcVR4whnZwubVPwGrLaE+1Mmk2Mwi5WKuQDu7n6iK
	IxT3kxQpnVBBexAnF0ihS5lfLDaFO2yZB/xnwdS5zoFeUyigBfLzBR9hxvT3x4gDmc+6ZJ
	flIELvpITzh8VhPCfJya5ZOTnXK/xiterHEPXNFbpa5f+Qizmz2LKuMplLRNcmsaccPT71
	bzlF810zu1Rww5Diqxf9sA0ClHmhjYZs9LcDI8M2QN/FteZKxNbWWCxFnzgO4x1Y2LXygE
	/0EP1KSgGHVkf/dr39ZaV3wh4xEEjOL8onok1E/zu4qmvtjdVXNW+2xfMnH4iQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4eFtOIUXlB/3zrN30y5Vr5c5KdL9zNbkcXs+QwRBLLo=;
	b=XY2hGy4cWmay/FFPNrPlsYtYrkhSLiBVvC67xaDxTH8uahrD+vR0WYB/jdZNhsfoWk9NzD
	rmVwXtqSDk1V2JAg==
Date: Mon, 23 Nov 2026 14:50:57 +0100
Subject: [PATCH v6 06/11] riscv: vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-6-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3576;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MntGa2c7F/hFX8g0jBZrZAZFlve/PN+fivtH3qTBWPk=;
 b=E0OeOrGeIR7bOANcC60kOQeCX/ghNoL4OOe/6jVEwOUqPM8BuZA5TNCH2kWGUvAnrKk1cra32
 Sqyo9hLfgFEAlCARi9PB7WSaGZbX9p2AcUfrE8XdPahGDH8DoZdd3Qg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055125_914546_76C8F941 
X-CRM114-Status: GOOD (  12.21  )
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
LmRlPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGliL3Zkc28vY2hlY2svdmRzb2No
ZWNrLnJzICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGU3ODkxYTJhODlkYS4uMmEw
ZjVmYmNkN2UzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCkBAIC0yMjYsNiArMjI2LDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IFRIUkVB
RF9JTkZPX0lOX1RBU0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAogCXNlbGVjdCBV
QUNDRVNTX01FTUNQWSBpZiAhTU1VCisJc2VsZWN0IFZEU09fQ0hFQ0sgaWYgTU1VCiAJc2VsZWN0
IFZEU09fREFUQVNUT1JFIGlmIE1NVQogCXNlbGVjdCBWRFNPX0dFVFJBTkRPTSBpZiBNTVUgJiYg
NjRCSVQKIAlzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2Vm
aWxlCmluZGV4IGMwMjMwNDZhM2ZkNy4uYjE1MDM5ZDAzMDllIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFr
ZWZpbGUKQEAgLTc1LDcgKzc1LDcgQEAgZW5kaWYKICQob2JqKS8kKHZkc29fbyk6ICQob2JqKS8k
KHZkc29fc28pCiAKICMgbGluayBydWxlIGZvciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJl
IGZpcnN0Ci0kKG9iaikvJCh2ZHNvX3NvX2RiZyk6ICQob2JqKS8kKHZkc29fbGRzKSAkKG9iai12
ZHNvKSBGT1JDRQorJChvYmopLyQodmRzb19zb19kYmcpOiAkKG9iaikvJCh2ZHNvX2xkcykgJChv
YmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsdmRzb2xkX2Fu
ZF9jaGVjaykKIExERkxBR1NfJCh2ZHNvX3NvX2RiZykgPSAtc2hhcmVkIC1zb25hbWU9bGludXgt
dmRzby5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1laC1mcmFtZS1oZHIKQEAgLTk3LDcgKzk3
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
ZGV4IGRhNThmZjIyMGVhYi4uMzc0NTVkMzI2MTEwIDEwMDY0NAotLS0gYS9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMKKysrIGIvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCkBAIC05Niw2
ICs5NiwzMiBAQCBmbiBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUx
NikgLT4gT3B0aW9uPEFsbG93ZWRSZWxvY2F0aW9uczwncwogICAgICAgICAgICAgLi5EZWZhdWx0
OjpkZWZhdWx0KCkKICAgICAgICAgfQogICAgICAgICAuaW50bygpLAorICAgICAgICBiaW5kaW5n
czo6RU1fUklTQ1YgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGluX29iamVj
dF9maWxlOiAmWworICAgICAgICAgICAgICAgIDE2LCAvKiBSX1JJU0NWX0JSQU5DSCAqLworICAg
ICAgICAgICAgICAgIDE3LCAvKiBSX1JJU0NWX0pBTCAqLworICAgICAgICAgICAgICAgIDE4LCAv
KiBSX1JJU0NWX0NBTEwgKi8KKyAgICAgICAgICAgICAgICAxOSwgLyogUl9SSVNDVl9DQUxMX1BM
VCAqLworICAgICAgICAgICAgICAgIDIzLCAvKiBSX1JJU0NWX1BDUkVMX0hJMjAgKi8KKyAgICAg
ICAgICAgICAgICAyNCwgLyogUl9SSVNDVl9QQ1JFTF9MTzEyX0kgKi8KKyAgICAgICAgICAgICAg
ICAyNSwgLyogUl9SSVNDVl9QQ1JFTF9MTzEyX1MgKi8KKyAgICAgICAgICAgICAgICAzMywgLyog
Ul9SSVNDVl9BREQ4ICovCisgICAgICAgICAgICAgICAgMzQsIC8qIFJfUklTQ1ZfQUREMTYgKi8K
KyAgICAgICAgICAgICAgICAzNSwgLyogUl9SSVNDVl9BREQzMiAqLworICAgICAgICAgICAgICAg
IDM2LCAvKiBSX1JJU0NWX0FERDY0ICovCisgICAgICAgICAgICAgICAgMzcsIC8qIFJfUklTQ1Zf
U1VCOCAqLworICAgICAgICAgICAgICAgIDM4LCAvKiBSX1JJU0NWX1NVQjE2ICovCisgICAgICAg
ICAgICAgICAgMzksIC8qIFJfUklTQ1ZfU1VCMzIgKi8KKyAgICAgICAgICAgICAgICA0MCwgLyog
Ul9SSVNDVl9TVUI2NCAqLworICAgICAgICAgICAgICAgIDQzLCAvKiBSX1JJU0NWX0FMSUdOICov
CisgICAgICAgICAgICAgICAgNDQsIC8qIFJfUklTQ1ZfUlZDX0JSQU5DSCAqLworICAgICAgICAg
ICAgICAgIDQ1LCAvKiBSX1JJU0NWX1JWQ19KVU1QICovCisgICAgICAgICAgICAgICAgNTEsIC8q
IFJfUklTQ1ZfUkVMQVggKi8KKyAgICAgICAgICAgICAgICA1NywgLyogUl9SSVNDVl8zMl9QQ1JF
TCAqLworICAgICAgICAgICAgXSwKKyAgICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCisg
ICAgICAgIH0KKyAgICAgICAgLmludG8oKSwKICAgICAgICAgXyA9PiBOb25lLAogICAgIH0KIH0K
Ci0tIAoyLjU2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
