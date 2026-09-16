Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734AC982C3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Kj4nNPuDa1taRdaOgkXPrJIpEw3ibASOVMldhyDYa0=; b=195ugaG8PvN8Ky
	B7QxI23XLi4r3nd0mHXE87SYhtOXPItZ6FCFl49y797g1nSexHsGYOhUqrKxqsHLWq7qHwuRrT20o
	WTgC5KwFTGJcOanQamTFuVM4jZy708UFkeg8JaxAS4tMd/uH2FThDLuIfEUeAqkLcE3v2Vy2+lr8I
	0fKRwX6fyWkxXZBndFohNHzGiz7DGPO7Q4suinTIqiaV3f7DCdjaG/Jg349h52YSwtp/uu1X+agPB
	eIeF1yUmm2bfVgOh4uFVQTt5sw8NIRPQxmt9ISeTE71lPhBzAdarC+D2uyk0s+/0nwZxnknSLfjrf
	3ip6Sq3UZpuyjQO999hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qhb-00000009QeF-3SFY;
	Wed, 16 Sep 2026 14:33:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qhX-00000009QdV-0Pif;
	Wed, 16 Sep 2026 14:33:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C11BD43733;
	Wed, 16 Sep 2026 14:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE971F000FF;
	Wed, 16 Sep 2026 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569210;
	bh=PFRgUz13CKX8U9AELJWTu+7kgzvYnFqa7uF4pRvkbcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KB+vtMogVxZRbbWdVaraL4Bow/O7cpdrceW8JwdKjOqho7N4jMsp6eQnMKyWxuKIQ
	 2JMLKxvzFMQyAjfZF/Xg/6NK6cM98R35gw17eIR9bO8V5BlHaPdRR3vNTT5SiS+ow4
	 Nq4TgKmxUNpvdqxstKoY2Bly2Co8I8TMAFB6kfseLHZjc3suLJDrq/tet28rC/79PU
	 st+RcejV9HVggHtq1mGITBXWNI6YITiCKd4z8BHsNWl+5DBF3f8dW9T0sVHE93sHl3
	 DZIj6/SPsL0paVgMnEfQTutiq72aKiWJR7RI9Xb0HUgqlzJFfoRmqnCzbGuAvt7Coi
	 uSWXBjxNm37Zg==
Date: Wed, 16 Sep 2026 15:33:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <aqqogpgRog7CEJbo@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin>
 <202609150955.A51C9F7A20@keescook>
 <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
 <90006ad1-73df-4bd0-a434-61875edd5bb9@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90006ad1-73df-4bd0-a434-61875edd5bb9@app.fastmail.com>
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMDg6MDI6MzhQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUdWUsIFNlcCAxNSwgMjAyNiwgYXQgMTk6NDcsIE5pY2sgRGVzYXVsbmllcnMg
d3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAxMDozMeKAr0FNIEtlZXMgQ29vayA8
a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+PiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAwMzoz
MDo0M1BNICswMTAwLCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4gPj4gYSkKPiA+PiBN
eSBtYWluIGNvbmNlcm4gaXMgdGhlIGxhY2sgb2YgcmVzcGVjdGluZyB0aGUgLWogbWFrZSBhcmd1
bWVudC4gSW4gbXkKPiA+PiBtaW5kLCB0aGlzIGlzIGEgYmxvY2tlciwgYmVjYXVzZSBpdCBtZWFu
cyBhIGJ1aWxkIHdpbGwgbm93IF9hbHdheXNfIHNwaW4KPiA+PiB1cCBtYXggQ1BVcyAobm90IHdo
YXQgLWogaGFzIGxpbWl0ZWQgaXQgdG8pLCBhbmQgZm9yIENJcywgc2hhcmVkIGNvbXB1dGUKPiA+
PiBzeXN0ZW1zLCBvciB3aGF0ZXZlciwgdGhpcyB2aW9sYXRlcyB0aGUgcmVxdWVzdGVkIHBhcmFs
bGVsaXNtIGxldmVsLiBGb3IKPiA+PiBleGFtcGxlLCBpZiBJJ20gZG9pbmcgYSBsb25nLXJ1bm5p
bmcgQ29jY2luZWxsZSByZXBsYWNlbWVudCBpbiBvbmUgdHJlZQo+ID4+ICh3aGljaCB1c2VzIGhh
bGYgdGhlIENQVXMpLCBhbnkgYnVpbGRzIEkgbGF1bmNoIEknbSBhc2tpbmcgZm9yIHRoZSBvdGhl
cgo+ID4+IGhhbGYgb2YgbXkgQ1BVcyB0byBiZSB1c2VkIHNvIHRoZXkgZG9uJ3QgdGhyYXNoIG15
IGNhY2hlLgo+ID4+Cj4gPj4gVGhpcyBpcyB0aGUga2luZCBvZiAid2h5IGFyZSBhbGwgdGhlIENQ
VXMgc3Bpbm5pbmcgdXA/IiBxdWVzdGlvbiBJCj4gPj4gaGVscGVkIHRyYWNrIGRvd24gd2l0aCBj
b21taXQgNTFlNDZjN2E0MDA3ICgiZG9jcywgcGFyYWxsZWxpc206IFJlYXJyYW5nZQo+ID4+IGhv
dyBqb2JzZXJ2ZXIgcmVzZXJ2YXRpb25zIGFyZSBtYWRlIikgZm9yZXZlciBhZ28uCj4gPgo+ID4g
UGFyc2UgLWogZnJvbSBNQUtFRkxBR1MgKGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS83NjUx
Nzg4NiksCj4gPiBmb3J3YXJkIGl0IHRvIHBpZ3o/Cj4KPiBUaGF0IHN0aWxsIGhhcyBhIHBvdGVu
dGlhbCBPKG7CsikgcHJvYmxlbTogaWYgb25lIGJ1aWxkcyBOIGtlcm5lbHMKPiB3aXRoIGEgdG9w
LWxldmVsIGpvYnNlcnZlciBvbiBOIENQVXMsIGFuZCB0aGV5IGFsbCB0YWtlIHRoZSBzYW1lCj4g
YW1vdW50IG9mIHRpbWUsIHlvdSBlbmQgdXAgd2l0aCBOIHBpZ3ogcHJvY2Vzc2VzIGVhY2ggdHJ5
aW5nIHRvIHVzZQo+IE4gY3B1cyBhdCB0aGUgc2FtZSB0aW1lLiBJZGVhbGx5IHdlJ2QgdXNlIHRo
ZSBlcXVpdmFsZW50IG9mCj4gLWZsdG89YXV0byBpbiB0aGUgY29tcGlsZXIsIHdoaWNoIHJlc3Bl
Y3RzIGpvYnNlcnZlciBzZXR0aW5ncywKPiBidXQgSSBkb24ndCB0aGluayBwaWd6IHN1cHBvcnRz
IHRoaXMgYXQgdGhlIG1vbWVudC4KCkhtbSB0aGlzIGlzIGEgZ29vZCBwb2ludCA6KSB0aG91Z2gg
SSBzZWUgS2VlcyBoYXMgbWFkZSBhIHN1Z2dlc3Rpb24gdGhhdApjb3VsZCBzb2x2ZSBhbGwgb2Yg
dGhlc2UgY29uY2VybnMhCgo+Cj4gICAgICAgQXJuZAoKLS0KQ2hlZXJzLCBMb3JlbnpvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
