Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF9C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ns2VWDUzhA8FJBk7B583yVzEJowoTqcvVx9SBoOs6FU=; b=CpPZQGUulu+QYO
	MJylU/xfxTEMuPdSqMDxQDBLOgdXqxK4lnkxEWGpOZTcmGRpG6JvzimJ/o0YqCUi5mkXwnrEZ/RoG
	uQCPfTEgRN6sRnrsT7BVpk5z2N46i+CKdU7BELm2lO3eXhmhO5Ptq232cbKfYPPPppZzK8vcs3U9L
	dix/6NuwzyMlfZ+o0gwH0cYsNLYqpbn6UoQasegYx6Or7IwlnohoK+nrF01azv5RP/LHuUfzKSV6R
	Z/rRCF6u/ve/SqF/resdNIMFMmjqC/qgOveVpivTDV9AMr7kvWc41D0nmQndZNowC5ff8/p8TexH2
	AOPuF1XWYIOBpQb6eBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JC8-0000000BxEn-1qTu;
	Wed, 09 Sep 2026 14:22:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JC5-0000000BxEK-3Att;
	Wed, 09 Sep 2026 14:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C00466020C;
	Wed,  9 Sep 2026 14:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CED51F00A3A;
	Wed,  9 Sep 2026 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963752;
	bh=Pk1B8WY2LVSwCYtQsLVOVpVrwdeq2SzwuwcAh4JLsyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I3WQzUYyylKqYJS5qmsgtV4gCaBjFEJYODcC8Ol3i3kBCe2qTrc5wzzZNNy4kF7ij
	 8pZMcrWK2JFQFt3KXt2LCmR0gY6JjzAAUj7SLD3O44QFr+LDHBDnSGzjJq2i1A5esv
	 WQ/mxgnq/ZIfTB3Sw6DGSX81V+jiVwk3Xg+uc6Vo5k3b/humXMJcjQ/TwY2F+Shm3v
	 R7yFCwfbbcoXINobG4EEvcVgDaAm1bZ5cKxJ84+SXKZqdc4B1YjEjMydoXY9AXcm2x
	 k9tQ6yabRw+huoALoDMWZNBCDcyVj6/awBwzLz7HZAXgAWaQCg/ZJBXt1SzsvNgMI4
	 IPvSDHhFEdzjQ==
Date: Wed, 9 Sep 2026 15:22:17 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <aqFre1PzEBhrQDpZ@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
 <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
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

T24gVHVlLCBTZXAgMDgsIDIwMjYgYXQgMTE6MTM6MDRQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFR1ZSwgU2VwIDgsIDIwMjYgYXQgMTA6NTnigK9QTSBMb3JlbnpvIFN0b2FrZXMg
KEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBBIGZ1dHVyZSAtai8tLWpvYnMg
b3B0aW9uIGlzIHBsYW5uZWQgZm9yCj4gPiBydXN0YzoocnVzdC1sYW5nL2NvbXBpbGVyLXRlYW0j
MTAwNSksIHNvIGNoZWNrIHRvIHNlZSBpZiB0aGlzIGF2YWlsYWJsZSBhbmQKPiA+IGlmIHNvIHVz
ZSBpdC4KPgo+IFRoaXMgaXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBuaWdodGx5IGFzIGZhciBh
cyBJIGNhbiB0ZWxsLiBJZiBpdAo+IHdlcmVuJ3QsIHdlIHNob3VsZG4ndCBhZGQgaXQsIGV2ZW4g
aWYgcGxhbm5lZC4KPgo+IChCeSB0aGUgd2F5LCBjb3VsZCB5b3UgcGxlYXNlIGFkZCBMaW5rIHRh
Z3MgZm9yIHRob3NlIFVSTHM/KQoKQWNrLCB3aWxsIGRvLgoKPgo+ID4gK2NvbmZpZyBSVVNUQ19I
QVNfSk9CUwo+ID4gKyAgICAgICBkZWZfYm9vbCAkKHJ1c3RjLW9wdGlvbiwtajgpCj4gPiArCj4g
PiArY29uZmlnIFJVU1RDX0hBU19aVEhSRUFEUwo+ID4gKyAgICAgICBkZWZfYm9vbCAkKHJ1c3Rj
LW9wdGlvbiwtWnRocmVhZHM9OCkKPgo+IFdlIGNhbiBzaW1wbGlmeSB1c2luZyBgUlVTVENfVkVS
U0lPTmAgZm9yIHRoZXNlIGxpa2Ugd2UgZG8gZWxzZXdoZXJlLgoKQWNrIGFsc28hCgo+Cj4gQ2hl
ZXJzLAo+IE1pZ3VlbAoKLS0KQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
