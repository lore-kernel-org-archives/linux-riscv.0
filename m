Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF0AC79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nh1m9MTPlP4e6Y6o5lYkNKLr0n2sfS9AhfBaj+9s3To=; b=ELs8eF7Qdwk80l
	+djLobqB80VmKEnLjqkdG9Vt29xLjomXaWLq+84raOnjrURICkTXJENGfnBHfNt5br3jiS9NHdsdA
	eNIyqHkJxj0r5/A8HroAyAA+fxVH7K9E7I3t8EECYiZQ+u4sRF28bRPCVkth4mqx5jBEDncG6EIQB
	mAmoQ2wcw9PJ+CNbX+LGJV5iZn5ItGIfxsRMrNXjTrT6R+udgSSo4ymkuPbStLGhYpf1OoRpRiPxe
	fVn1F/Up7uWl/kqTTbmvtA+LPghE7dGL1ki5ZXJpgGCvPnd5Yj+D72h3CbwIhhQjIWZ2EcQbcNNck
	mrVYSF3W5DPegGkU4P2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wt1-00000009Hg1-46Bx;
	Tue, 08 Sep 2026 14:33:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wt0-00000009HfR-0wwa;
	Tue, 08 Sep 2026 14:33:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34C5B601DE;
	Tue,  8 Sep 2026 14:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0701F00A3E;
	Tue,  8 Sep 2026 14:33:02 +0000 (UTC)
Message-ID: <1ef2c31d-6ad5-46cd-98ca-0f31485cf8c1@kernel.org>
Date: Tue, 8 Sep 2026 16:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/24] x86/elf, um/x86/elf: Move relocation constants
 to UAPI
To: Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Richard Weinberger <richard@nod.at>,
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
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo
 <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-2-3a93791af1cf@linutronix.de>
 <20260908135513.GAaqATwXHcQD7plnH-@fat_crate.local>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908135513.GAaqATwXHcQD7plnH-@fat_crate.local>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwOC8wOS8yMDI2IMOgIDE1OjU1LCBCb3Jpc2xhdiBQZXRrb3YgYSDDqWNyaXTCoDoKPiBP
biBUdWUsIFNlcCAwOCwgMjAyNiBhdCAwODozMzozNkFNICswMjAwLCBUaG9tYXMgV2Vpw59zY2h1
aCB3cm90ZToKPj4gVGhlc2UgY29uc3RhbnRzIGFyZSB1c2VmdWwgZm9yIGNyb3NzLXBsYXRmb3Jt
IHVzZXJzcGFjZSwgZm9yIGV4YW1wbGUgdG8KPj4gcHJvY2VzcyBFTEYgZmlsZXMgZHVyaW5nIGtl
cm5lbCBjcm9zcy1jb21waWxhdGlvbi4KPj4KPj4gTW92ZSB0aGVtIGZyb20gdGhlIGtlcm5lbC1w
cml2YXRlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBoZWFkZXIgdG8gdGhlIFVBUEkuCj4gCj4gV2h5
IFVBUEk/Cj4gCj4gV2h5IG5vdCBpbmNsdWRlL2xpbnV4LyA/Cj4gCgpJIGd1ZXNzIGJlY2F1c2Ug
b24gc29tZSBhcmNoaXRlY3R1cmVzIGl0IGlzIGFscmVhZHkgaW4gVUFQSSwgc2VlIGZvciAKaW5z
dGFuY2UgcG93ZXJwYyBpbiBwYXRjaCA1ID8KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
