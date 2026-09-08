Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B448C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTEi97mHJw/CaHPwcJWr4zjXQeUwDpdDkVG05VQ+uyc=; b=bR2v/7P/eY5nKV
	QhkAYiPWGJ0/DQNvdtTnPg8DcVqe05B91WkBo+bt+2Nxc74ZweK+GFKq06W/a+N68OUkLfgQvCZKT
	FZ2CdshmoIdlrPbfjd4Y65F/+iggBPfzy5dXwbHoeSqXK8aJVZHHU7PlqBB5UzNd7235e+z71PPLI
	+uoFboCCJb1lrl1oVtLPyWfZZP/jKxv+5sjuCFv9mJyVM9973g1lpoTKy9yxwSKGt+i95sm2fdFt6
	gwT88sn+eS/F1NXB6DjoH0d2BvKUcMFPH04ecmrW1M6u0OqnuBAbJVqJhmiGLgX6iIqBv5TQm9OKX
	jPg1I8VyoeJ+HftlhqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xWK-00000009QEO-3nQX;
	Tue, 08 Sep 2026 15:14:00 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xWI-00000009QDe-1Vhj;
	Tue, 08 Sep 2026 15:13:59 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8807440E01F9;
	Tue,  8 Sep 2026 15:13:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id APiSMwsJLR9v; Tue,  8 Sep 2026 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788880423; bh=SihVXpN4VvNY3Mg5IOkHy8UfEsHqRfkcnelNTeVhEJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAETnApxBEtfPuqHFKCgIL29nHx0Z2YHgAygdIUM8hU/Mz33/kA4ZUBeN/gRjrvau
	 vtDllihc6pYSe5SXQwgoqpNhfk4/08/8KMfUsCAU9thasCFYYPKC5Y/pV7Y6XU69vH
	 LNwlFlG04npY9qQKxVsZcrZnpWC37yTWxuzhzHRm5KpwYfkHvzNEQeiGPcvB58aLNL
	 CiYr2yyCrB3Kpf/DVc891YwOW/34b2QLG1yPFPyiPhCi535fKHZgiFGNQiM2V+7vT2
	 gPcZgp3ofWVjQmcjoKAe195uX42B3clf9ibePNVbJKWUY1oARNBH9aqSnI0FgzmH5W
	 h3dWuWkymclGp3MUg9haChNnjvPBl3Zfv+FDejA3/AFf/CVXHWsWO5KDUQ2zEgeqt/
	 YAh14BnniVfR4yGoNbbKeldMZUsNF3icLMOF+CXHFJzyhU2PGxTQ2922hXMjHxMdeL
	 Z7VOvQUlIKK4Twu3A1MK/eNhNVBp3Aq4OXXBOciVJLy8/PcJIx0toX/zZ4lcn1jfV9
	 ErcQYDZ5WCkd1WmQQESUO71elKnVOkkPTWwEHl1ZBofjxaMBHmYZWTaJGuyt7QqChy
	 44ZU/2M46IVY51m5w2KmjWEiICeA6W5JNXmeJ3Nh9U8UDaWIWWakyv4XQKa/cqNpso
	 4+S63J9RdOKwhC2R/OGeJJio=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2B8AE40E016C;
	Tue,  8 Sep 2026 15:12:41 +0000 (UTC)
Date: Tue, 8 Sep 2026 08:12:38 -0700
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
Message-ID: <20260908151238.GBaqAl5iKb64meuPJl@fat_crate.local>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-2-3a93791af1cf@linutronix.de>
 <20260908135513.GAaqATwXHcQD7plnH-@fat_crate.local>
 <20260908161740-0d79e592-87a6-43c5-9174-84ce1904e639@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908161740-0d79e592-87a6-43c5-9174-84ce1904e639@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081358_555643_FD23DA6E 
X-CRM114-Status: GOOD (  10.52  )
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

T24gVHVlLCBTZXAgMDgsIDIwMjYgYXQgMDQ6MjY6MDBQTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gVGhlIGV4aXN0aW5nLCBnZW5lcmljIEVMRiBkZWZpbml0aW9ucyBhcmUgdGhl
cmUuCj4gVGhlIEVMRiBzdHVmZiBpbiBpbmNsdWRlL2xpbnV4LyBpcyBoaWdobHkgc3BlY2lmaWMg
dG8gTGludXguCgpBbmQgcHV0dGluZyB0aGVtIGluIFVBUEkgY2FzdHMgdGhlbSBpbiBzdG9uZS4g
SSB3b3VsZG4ndCB3YW50IHRvIG1haW50YWluIHRoZW0KZm9yZXZlciBpZiBub3QgbmVjZXNzYXJ5
LgoKPiBBbHNvIGxhdGVyIGluIHRoZSBwYXRjaHNldCBJIHdhbnQgdG8gZXhwb3NlIHRoZSBkZWZp
bml0aW9ucyB0byB0aGUKPiB0b29scy8gYnVpbGQuIEV4cG9zaW5nIGdlbmVyaWMgVUFQSSBkZWZp
bml0aW9ucyB0byB0b29scy8gaXMgYSBtdWNoCj4gZWFzaWVyIHNlbGwgdGhhbiBpbmNsdWRlL2xp
bnV4Ly4KCnRvb2xzLyAqY29waWVzKiBrZXJuZWwgaGVhZGVycyBvbiBhICJ0aGV5J3JlIG5lZWRl
ZCIgYmFzaXMuIE5vIG5lZWQgdG8gcHV0CmFueXRoaW5nIGluIFVBUEkgZm9yIHRoYXQuCgpJdCdz
IGV2ZW4gd3JpdHRlbiBkb3duOiB0b29scy9pbmNsdWRlL3VhcGkvUkVBRE1FCgotLSAKUmVnYXJk
cy9HcnVzcywKICAgIEJvcmlzLgoKaHR0cHM6Ly9wZW9wbGUua2VybmVsLm9yZy90Z2x4L25vdGVz
LWFib3V0LW5ldGlxdWV0dGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
