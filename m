Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198EFC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6X2z8RJKfVH7YX9HW6/0R/pWoQpABLsU6xwSg3RG4FQ=; b=DVI+v13BpwZhO8
	a69jsqhAJFOnd1hsGYCnOSqmAV79UW4DRvzcw9f5XUDxqzxaurAPqQdSAtpYakOGzOZyAkh6kLywv
	xXycOcYb95CowpkSlXVA95z4ODnOznJJprnKZZnyDyMCcOVrtcwJkDQ46PhJeZvLvMUh4RkKXFPpj
	Ly3VdO6wlDbDw6U21+VcEecR1uRXCSmKEje3sN+CVzEXREM+Eqt2OnjbXp0mIYMGSiUZKTdYelZfY
	6oQzW20WdguUt6OMMaMO2Z+fYpfxyfxbMzgn7F3mFUq9fw1ij1NvFurE9c8CbDVtF72F5NPRzzrCV
	ZEwT05u9gptd7GwfouoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6go-0000000D4HW-3e5w;
	Wed, 13 Aug 2025 08:18:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6eY-0000000D3lA-2VRK;
	Wed, 13 Aug 2025 08:16:13 +0000
Date: Wed, 13 Aug 2025 10:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=t3ZaanvFJHTW1l1H2nSwoa1VFh8EVFo/BJn0UMRG7bq78PXYOpzqMO9UGefI5UiLZP7nNe
	J1FX1/E5cqcFOVpKvUjolk1j8zY71ykS0B7X6UJ1jM73mZGhOMT+2RFDhdp4Y1WmHG3lB8
	fhvgGlk/PFabS5Cn+w3uMjkgmqVzkQuRRvX4xJrjg/8hJ+0j7jOT/qLXJIWkp6a9jfxObj
	LUOs4JziO5PF87uDbwzJHBzRMHIM1CkGRGPGIwWfVdP7ckTLMMlHtUDzc+O5vxoBEjlmG7
	1skI/bKKNj/R2CTmQujVy01wAp2WhS97QfxNvozWzsRXygdxqvZz7+ZCEZyixQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=E1zvWv48KJJ+SOu4RstGU/Hts0jpCLaRVEpYFntAu8DSCAbOKCuCF3vYrHswu5Uo/Nk8OK
	GMt5eI9bpKssCIDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
Message-ID: <20250813101305-04911850-2375-4be5-9a06-ced21de3ca22@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
 <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_011610_785478_D5DC9FC3 
X-CRM114-Status: GOOD (  15.92  )
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMDE6MDc6MzRQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFR1ZSwgQXVnIDEyLCAyMDI1IGF0IDc6NDTigK9BTSBUaG9tYXMgV2Vpw59zY2h1
aAo+IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBLYnVp
bGQgYW5kIFJ1c3QgZm9sa3M6IFRoaXMgY29udGFpbnMgY3VzdG9tIGRlZmluaXRpb25zIG9mIGhv
c3Rwcm9nCj4gPiBiaW5kZ2VuIGFuZCBydXN0IGxpYnJhcnkgY29tbWFuZHMuCj4gPiBUaGVzZSBh
cmUgY3VycmVudGx5IG9ubHkgZGVmaW5lZCBpbnNpZGUgdGhlIHN1YnN5c3RlbSBkaXJlY3Rvcnku
Cj4gPiBMZXQgbWUga25vdyBpZiB0aGV5IHNob3VsZCBnbyBpbnRvIHNjcmlwdHMvTWFrZWZpbGUu
aG9zdC4KPiAKPiBHbGFkIHRvIHNlZSBtb3JlIFJ1c3QgaG9zdCBwcm9ncyA6KQo+IAo+IEtlZXBp
bmcgdGhlbSBsb2NhbCBtYXkgYmUgYSBiaXQgZWFzaWVyIGluaXRpYWxseSB0byBsYW5kLCBJIGd1
ZXNzCj4gKGUuZy4gbm8gZG9jcyksIGFuZCB0aGVuIHdlIGNhbiBnZW5lcmFsaXplIHdoZW4gbmVl
ZGVkIGxhdGVyLgoKSSdtIGhhcHB5IHRvIGRvIHRoZSBkb2NzIGV0Yy4gSSBvbmx5IHdhbnRlZCB0
byBhdm9pZCBkb2luZyBhbGwgdGhhdCB3b3JrLApvbmx5IGZvciBpdCB0byBzdGF5IGEgc3Vic3lz
dGVtLWxvY2FsIHNvbHV0aW9uLgoKQWxzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBLY29u
ZmlnIHN5bWJvbCwgUlVTVENfQ0FOX0xJTksgb3Igc2ltaWxhciwKd2hpY2ggaW5kaWNhdGVzIHRo
YXQgdGhlIHJ1c3QgY29tcGlsZXIgY2FuIGJ1aWxkIGhvc3QgcHJvZ3JhbXMuCgo+IEJ5IHRoZSB3
YXksIGZvciBjb25zaXN0ZW5jeSB3aXRoIGVsc2V3aGVyZSwgcHJvYmFibHkgd2Ugd2FudAo+IGBI
T1NUUlVTVExJQmAgLT4gYEhPU1RSVVNUQyBMYC4gVGhvdWdoIEkgYW0gdGhpbmtpbmcgdG8gcmVt
b3ZlIHRoZSBgTGAKPiBhbnl3YXkgc2luY2UgZXZlbnR1YWxseSBhIGxvdCBvZiBjb2RlIHdpbGwg
YmUgImxpYiIuCgpBY2suCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
