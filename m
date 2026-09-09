Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42102C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCEbRaONgE3u9zT1ugTv/z1TTC5t7WzA8mhLowujG9w=; b=KcfBvuA70pfVke
	0xvPuQeLo93+XxGp9Sv5lWoS9KXUhea3DC2awBPa1nb4mMmdFagsqn7CrJuvieezygkhwdYEkfivu
	lNkYDf2sLKaZr6Gz/ZmYh0TB/HpLTLxbAIyA+zpZua40008dOLGzoZCoTqLflhTWDD89/efe6pKD9
	33MT3OPogX9pDj9K7NFKL/3qWrQJBgNJdXrbnPhCcqdb2P+L3fwvWSv9WleyLeza5jB9l1vrM3uHN
	0eeYfTKfG4Sgj/JQ4hW5DBFmTVEV/c46/SDjFtGTTsyg/CeCBiwitukW1p56UHO7+01puSumD210x
	w9G/7MABAO5Nk1wCEEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdj-0000000C3Mk-2Khu;
	Wed, 09 Sep 2026 14:51:07 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdb-0000000C3GN-2RFh;
	Wed, 09 Sep 2026 14:51:02 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A382C40E02C2;
	Wed,  9 Sep 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9Q1sj3DJqz9o; Wed,  9 Sep 2026 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788965436; bh=mhGQ4FEjJypHCScKuxG2hVB2Cr7EilB+iYsfNtWHQqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEJ/8Uz5UTuL3M3aJaZ+2GA6fHLcktGtyqNCvODV6vja9c5ofeLAw9r5500Ldr25H
	 Qb1xaJZtybSTYQEAFER7kNXSbt0/1P3vev75HfTrRPKQqXMq8vzzF9d2raqW7yK4Jp
	 bgsBr5p7kVDTB9kpcsKXnfA2oZFXqMgcW2v064dS00SqLJQ4fh+FTTqMfbeE6ylt6W
	 xeBJaGn3HYw68e4HreCBSdk1xrJVqweEaR0hTlsp9ViWUcauqO5nf8umq0Nui9YTkV
	 GKJQEUzDD6o8zodTcnqrpM4CPq6NuYAB1O13ttqJjGS36Z2uCbR6KyqXxKlafFr7b1
	 7ctU5lA269NQ8wM09FSxrsRFiMlY4SvpNIR6FjrwsJi2GrkgzDphwoLgFgtc6VBlX6
	 sZEWd8ZjXFr7d4kNRkfTSiYGwhdgPhGoqgJg8tB+bIw14Mw3cuHC0Q9xIa6xFUY5jp
	 VWgJEsz5szwqtlotZDwBq7NU64xcPZ4oXFJ2qKu7h8QPHqSvB8mLBIMN7DQzBr9yKh
	 3B1hlQLHULtH82PyIzJVS+TDy4H+TQutkiZUSuErREjAkJcHO33xV54eAiErgaiPkg
	 dq6isTjw+AUWrupRkPovwFJvsVt6Naubw0PkaGCiRjPqR2r5eGwo9f4RLg22qsPqFP
	 0lcuEVktIzws0Z/idTv4tvxk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D243A40E01E1;
	Wed,  9 Sep 2026 14:49:33 +0000 (UTC)
Date: Wed, 9 Sep 2026 07:49:30 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-mm@kvack.org,
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Jan Stancek <jstancek@redhat.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 02/24] x86/elf, um/x86/elf: Move relocation constants
 to UAPI
Message-ID: <20260909144930.GAaqFx-mjH3-u6jLjw@fat_crate.local>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-2-3a93791af1cf@linutronix.de>
 <20260908135513.GAaqATwXHcQD7plnH-@fat_crate.local>
 <20260908161740-0d79e592-87a6-43c5-9174-84ce1904e639@linutronix.de>
 <20260908151238.GBaqAl5iKb64meuPJl@fat_crate.local>
 <20260909075156-06ff671c-ab7b-47d8-aaa3-588b570888bc@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909075156-06ff671c-ab7b-47d8-aaa3-588b570888bc@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_075059_774791_2DD04976 
X-CRM114-Status: GOOD (  14.86  )
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

T24gV2VkLCBTZXAgMDksIDIwMjYgYXQgMDc6NTk6NTFBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gVGhlc2UgbmFtZXMgYW5kIG51bWJlcnMgYXJlIGRlZmluZWQgYnkgdGhlIGFy
Y2hpdGVjdHVyZXMnIEVMRiBzcGVjaWZpY2F0aW9ucy4KPiBUaGV5IGFyZSBhbHJlYWR5IGNhc3Qg
aW4gc3RvbmUuIEZvciBleGFtcGxlIHNlZSBUYWJsZSA0Ljkgb2YgWzBdLgo+IENoYW5naW5nIHRo
ZW0gd291bGQgYnJlYWsgY29tcGlsZXJzLCBsaW5rZXJzLCBsb2FkZXJzIGFuZCBtb3JlIG9yIGxl
c3MgZXZlcnkKPiBleGlzdGluZyBFTEYgYmluYXJ5LgoKU28/CgpZb3VyIGdvYWwgaXMgdG8gcHJv
dmlkZSB0aGVtIHRvIHRvb2xzLy4gWW91IHdhbnQgdG8gcHJvdmlkZSB0aGVtIHRvCipldmVyeXRo
aW5nKi4gU2VlIHRoZSBkaXNjcmVwYW5jZSBoZXJlPwoKPiBUaGF0IGlzIHRoZSBkb2N1bWVudGF0
aW9uIGZvciB0aGUgdG9vbHMgVUFQSSBoZWFkZXJzLgoKRGlkIHlvdSBldmVuIHJlYWQgdGhhdCBm
aWxlPwoKIldoeSB3ZSB3YW50IGEgY29weSBvZiBrZXJuZWwgaGVhZGVycyBpbiB0b29scz8KPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKVGhlcmUgdXNlZCB0
byBiZSBubyBjb3BpZXMsIHdpdGggdG9vbHMvIGNvZGUgdXNpbmcga2VybmVsIGhlYWRlcnMKZGly
ZWN0bHkuIEZyb20gdGltZSB0byB0aW1lIHRvb2xzL3BlcmYvIGJyb2tlIGR1ZSB0byBsZWdpdGlt
YXRlIGtlcm5lbApoYWNraW5nLiBBdCBzb21lIHBvaW50IExpbnVzIGNvbXBsYWluZWQgYWJvdXQg
c3VjaCBkaXJlY3QgdXNhZ2UuIFRoZW4gd2UKYWRvcHRlZCB0aGUgY3VycmVudCBtb2RlbC4KClRo
ZSB3YXkgdGhlc2UgaGVhZGVycyBhcmUgdXNlZCBpbiBwZXJmIGFyZSBub3QgcmVzdHJpY3RlZCB0
byBqdXN0CmluY2x1ZGluZyB0aGVtIHRvIGNvbXBpbGUgc29tZXRoaW5nLgouLi4iCgpKdXN0IHJl
YWQgdGhlIGRhbW4gdGhpbmcgYmVmb3JlIHlvdSByZXBseS4KCj4gQWxzbyB3ZSBhbHJlYWR5IGhh
dmUgb3RoZXIsIGNsb3NlbHkgcmVsYXRlZCwgRUxGIGNvbnN0YW50cyBpbiB0aGUgVUFQSSwKPiBz
ZWUgeyx0b29scy99aW5jbHVkZS91YXBpL2xpbnV4L2VsZnssLWVtfS5oLgoKU3JzbHk/IT8KCllv
dSBtb3ZlZCB0aGVtIHRoZXJlOgoKY29tbWl0IDYyNmZkMzUyNzgyOTVmYmIyMWYyZGEzMzFjZDgw
MjhlOTczOGQ5NjUKQXV0aG9yOiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhA
bGludXRyb25peC5kZT4KRGF0ZTogICBXZWQgRmViIDI2IDEyOjQ0OjQ2IDIwMjUgKzAxMDAKCiAg
ICB0b29scy9pbmNsdWRlOiBBZGQgdWFwaS9saW51eC9lbGYuaAogICAgCiAgICBJdCB3aWxsIGJl
IHVzZWQgYnkgdGhlIHZEU08gc2VsZnRlc3RzLgoKCkxvb2tpbmcgYXQgdGhlIHJlc3QsIGl0IGxv
b2tzIGxpa2Ugc29tZSBlbGYgYml0cyBnb3QgZXhwb3J0ZWQsIHlvdSBhZGRlZCBzb21lCm1vcmUg
YW5kIHRoYXQgc2hpcCBoYXMgc2FpbGVkLiBJIHN0aWxsIHRoaW5rIHVzIHByb3ZpZGluZyBoZWFk
ZXJzIGlzCmNvbXBsZXRlbHkgdW5uZWNlc3NhcnkgYW5kIGl0IHdpbGwgY29tZSB0byBjYXVzZSBj
b25mbGljdHMgZXZlbnR1YWxseSBidXQgaGV5LApub3QgbXkgcHJvYmxlbS4KCi0tIApSZWdhcmRz
L0dydXNzLAogICAgQm9yaXMuCgpodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL3RnbHgvbm90ZXMt
YWJvdXQtbmV0aXF1ZXR0ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
