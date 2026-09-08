Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48150C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edm9f5ZcpolebJsdfd5+X3cPlUODBPbWM02Rknv1z3Y=; b=Wbt+H9ZK1+7bT8
	t666d98SmLcuNA8KCs+W34xzcgQZnILWXTHmNd1JH2WV/XVvYrZQSH+au1642pM4oP1+mQKu9B3G+
	QjOb4FXTyztdgJrOmb2GOmMT9sTccZbcE0QQeKufbdDifJnDzqwMoPwjs56R7jwKt6GCKayl61NjZ
	7yApg3+UinxFDHOpNDU4KNkHih/BnXf19KIHZGFr9/nqWRPacf/LAy/b8PEXrUxfaXT0+Twaea3jf
	cSmBHNAbzQKMQpn4V/+WIcvkVrsWA6E2g3evq0MThFCBoR8MZr31UZ5NGRo/EytN8BJS49GEdRgpr
	T4mAqF36tTgSspO3SOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rhb-00000008UWK-0Raf;
	Tue, 08 Sep 2026 09:01:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rhZ-00000008UVW-2FX3;
	Tue, 08 Sep 2026 09:01:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2F2A60A9D;
	Tue,  8 Sep 2026 09:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32141F00A3A;
	Tue,  8 Sep 2026 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858072;
	bh=gw6uq3WoFDGFRXHX5w46jvhy16/noKc2NTzTXodoE8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f83UuFnG2Ca/NIEjfDrXHeoFRlnHHZpsg6wFetI10F3cQyUjArbK42hgG7Zxex4/s
	 3n5zZu9KkJ8dQxHTmVqB83udBP8YhBTSDsyRdMErALYpUYjulzhr6oGyq5X7IeS2MN
	 EWxFsYnacMcuz5tJFBTbZAf9tMz+RnlOTNhnRLhdadOeXHk0h+wn50SECkFRbxVslO
	 f7Ig1YtXoYtaZhrD1KEcBCtAna7hL00y1ZjgmW4/d0yWZBbhpb2lMH7Bv47zh1k7nI
	 CEirgVNGd9giuxhLxrRDAZzVqimdNslxWSYeJo/LDlSLy8epheEmJ4uqQpNMU7Oumx
	 oYzy9KZ7DvXJQ==
Message-ID: <060be36f-5e8d-4596-a4e6-844e5930baac@kernel.org>
Date: Tue, 8 Sep 2026 11:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
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
 <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
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
IFdoaWxlIHRoZSBudW1lcmljIGNvbnN0YW50cyBmb3IgcmVsb2NhdGlvbnMgYXJlIGFyY2hpdGVj
dHVyZSBzcGVjaWZpYywKPiBpdCBpcyBzdGlsbCB1c2VmdWwgdG8gZ2V0IGFjY2VzcyB0byB0aGVt
IGZyb20gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiBBbHNvIHRoZSBkZWZpbml0aW9ucyBhcmUgdXNl
ZnVsIGZvciB1c2Vyc3BhY2UgaW4gZ2VuZXJhbC4KPiBGb3IgZXhhbXBsZSB0b29scyBwcm9jZXNz
aW5nIGVsZiBmaWxlcyBkdXJpbmcgYSBrZXJuZWwgY3Jvc3MtY29tcGlsYXRpb24KPiBjYW4gbWFr
ZSB1c2Ugb2YgdGhlbS4KPiAKPiBJbnRyb2R1Y2UgYSBkZWRpY2F0ZWQgaGVhZGVyIGZvciB0aGVt
LCBzaW1pbGFyIHRvIHRoZSBlbGYtZW0uaCBoZWFkZXIuCj4gRm9yIG5vdyB0aGUgaGVhZGVyIGlz
IGVtcHR5IGJ1dCBpdCB3aWxsIGJlIGZpbGxlZCBzdGVwIGJ5IHN0ZXAgaW4KPiB1cGNvbW1pbmcg
Y29tbWl0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndl
aXNzc2NodWhAbGludXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IChD
UyBHUk9VUCkgPGNobGVyb3lAa2VybmVsLm9yZz4KCj4gLS0tCj4gICBpbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLXIuaCB8IDUgKysrKysKPiAgIGluY2x1ZGUvdWFwaS9saW51eC9lbGYuaCAgIHwgMSAr
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJjMzgyYzhhNDgwNwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaAo+IEBAIC0w
LDAgKzEsNSBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExp
bnV4LXN5c2NhbGwtbm90ZSAqLwo+ICsjaWZuZGVmIF9VQVBJX0xJTlVYX0VMRl9SX0gKPiArI2Rl
ZmluZSBfVUFQSV9MSU5VWF9FTEZfUl9ICj4gKwo+ICsjZW5kaWYgLyogX1VBUElfTElOVVhfRUxG
X1JfSCAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvZWxmLmgKPiBpbmRleCBlZTMwZGNkODA5MDEuLmIzZTMxMjI1NTU1MiAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKPiArKysgYi9pbmNsdWRlL3VhcGkv
bGludXgvZWxmLmgKPiBAQCAtNCw2ICs0LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZWxmLWVtLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9l
bGYtci5oPgo+ICAgCj4gICAvKiAzMi1iaXQgRUxGIGJhc2UgdHlwZXMuICovCj4gICB0eXBlZGVm
IF9fdTMyCUVsZjMyX0FkZHI7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
