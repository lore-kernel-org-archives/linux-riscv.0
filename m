Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830AC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4ZOFEegs7s64V3PaFQFXkXjtLFa5qge0tmEjSnrg8g=; b=gK7lOVmrDkQdJG
	ffzAaTr3DcLCFKlINXwCoSOsWr/7kbIvkQ0hNS4asnAEKAgk6lrvFxo5geKuXpR+5A3nqbWrwmXRG
	NVco3vLKuY+nb37T1kLEWXgu+H/x/BzyGm0lYu/kEyGB6hyxJnUVOHYyy49/a6fUN5ikSf/GNB+re
	QRPSuSBJprcTaP2uqcYTk68daQQUumcOntRPG37sE4ddvlAyl/fODZrEswNyfGkErfZ6eTDS29VdV
	WmTuGgAe8Kgm43wqCpNmrmkpYpZlH6RVvchDM9lHC2e3faewQe0KHzkXqyzDDSTOHoagk/JCkMTlz
	MaDhehK/SJMWUAXplpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rdm-00000008U0f-2zRC;
	Tue, 08 Sep 2026 08:57:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rdk-00000008U0N-2XTy;
	Tue, 08 Sep 2026 08:57:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E869D60A93;
	Tue,  8 Sep 2026 08:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D6F1F00A3A;
	Tue,  8 Sep 2026 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788857835;
	bh=BOR2t3VtcjszZ4q3H4RF8INxqX7I/2OnFWmBk3yYh2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RMlWBWtHsUr314SSes2RbgrXEdhowxsDExyywV6MWPiyRlQ2MiRcnzJrKxwP2Uq5y
	 FxFi3d8oyrDb4Ns+a5YQol0nE9UlpMARb5Srs2FLa3c8UgJq9bIRFnwje3hSYKfvsy
	 4lejU8BQqLNJPlkLkj5fUKy1asSopqBNr8Z/GdXh3YL25ZL/xotJOBdRT8X+1frbzz
	 5wc8MC7jxG0TFbXkBqhY75SKcdrJ0GvpwyMgIKA6vQKX0ndFDZCBRqE2+uKYcWsIZK
	 O423o/0XnOMDsJENmzRb5yAhovNWoPRl28a6i0Ifx5k/RVsnRdBM2JH4gLApjYzNXL
	 e95ar8gZlvOGw==
Message-ID: <06996199-5255-41d0-ba6a-ebeca57f61da@kernel.org>
Date: Tue, 8 Sep 2026 10:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/24] tools headers UAPI: Sync ELF headers with the
 kernel sources
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-11-3a93791af1cf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-11-3a93791af1cf@linutronix.de>
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

CgpMZSAwOC8wOS8yMDI2IMOgIDA4OjMzLCBUaG9tYXMgV2Vpw59zY2h1aCBhIMOpY3JpdMKgOgo+
IFBpY2sgdXAgY2hhbmdlcyBmcm9tIHRoZSBVQVBJIEVMRiBoZWFkZXIgZmlsZXMuCj4gVGhpcyBw
aWNrcyB1cCBnZW5lcmFsIGNoYW5nZXMgdG8gZWxmLmgsIGVsZi1lbS5oIHdoaWNoIHdhcyBmb3Jn
b3R0ZW4KPiBwcmV2aW91c2x5IGFuZCB0aGUgbmV3IGVsZi1yLmguCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Cj4g
Cj4gLS0tCj4gQ2M6IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRoYXQuY29tPgo+
IC0tLQo+ICAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1lbS5oIHwgIDcxICsrKysKPiAg
IHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICB8IDY5NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5o
ICAgIHwgMTEyICsrKysrLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA4NjggaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gCgo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLmggYi90b29scy9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKPiBpbmRleCA1ODM0Yjgz
ZDdmOWEuLjg4YmRjYmI1MjZjMSAxMDA2NDQKPiAtLS0gYS90b29scy9pbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLmgKPiArKysgYi90b29scy9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKCj4gQEAgLTMx
Miw3ICszMjMsNyBAQCB0eXBlZGVmIHN0cnVjdCBlbGY2NF9waGRyIHsKPiAgICNkZWZpbmUgU0hO
X0FCUwkJMHhmZmYxCj4gICAjZGVmaW5lIFNITl9DT01NT04JMHhmZmYyCj4gICAjZGVmaW5lIFNI
Tl9ISVJFU0VSVkUJMHhmZmZmCj4gLQo+ICsKCkdldHRpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5n
IHdoZW4gYXBwbHlpbmcgdGhpcyBzZXJpZXMgd2l0aCAnYjQgc2hhemFtJy4KCi9ob21lL2NobGVy
b3kvbGludXgtcG93ZXJwYy8uZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo4NDY6IHRyYWlsaW5nIAp3
aGl0ZXNwYWNlLgoKU2VlbXMgdG8gY29tZSBmcm9tIGhlcmUuCgo+ICAgdHlwZWRlZiBzdHJ1Y3Qg
ZWxmMzJfc2hkciB7Cj4gICAgIEVsZjMyX1dvcmQJc2hfbmFtZTsKPiAgICAgRWxmMzJfV29yZAlz
aF90eXBlOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
