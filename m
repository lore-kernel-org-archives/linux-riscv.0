Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE34CC88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ua8O1ttLUHCRclsW6XUXoBgZT0+pSzTF5qEQ6PjErlM=; b=Sv4PzoIYhUwDUF
	dVGCWdL3tJTZiOnUNKvEuHSUVlG77XXULf4l2MMaVhU/QoEFAF69O+kwZh8PrKH3B+NOZXorq9zvN
	avXnx9ilghbcMh6VAeKE8Gd91wu4R1OebIlNHIR+DnDTEIDbMUaZd4aX55Sx9ImcWPCvPRIGe7jI0
	G77Ma3jE6TbfLmS5OuBAuXZC2eY1HH4Jc4eMi7GR+gUZ/wELYg0XANZGf8ZJslDLIops6VupWoWTl
	Xn0ppb08VIxAmCOeCkYWfgrSCMyHF4Ppx43tY13EmqaPMsqhRgdIZKobQ9Z465yPZIQ3qgiApfWmX
	5TsSg3mOXa1X2C85sdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55vu-0000000HR8h-2oIx;
	Fri, 11 Sep 2026 18:25:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55vs-0000000HR8H-3SQ7;
	Fri, 11 Sep 2026 18:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3F2344415;
	Fri, 11 Sep 2026 18:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91F51F000FF;
	Fri, 11 Sep 2026 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789151103;
	bh=KKNF1BR24z2hq8JFatue1wvWlNPndjqBIvnaGAC0Uqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RlyhOewuf7WxDS24cLgcR2lbriVrR+lDPmqXJfTUdN7HYmOtPDB7j29KJoKmkpr7u
	 9dqd9F2fStdlb21DzGnuUfNIyWROL1gANAZJ0qjYWB/6XSgAE66XdKzhjEvztMH6y/
	 WNkeO+nCbxN55cNXSDyzriyPcgD6rjPOPIYw0L/X8Mo9q2WLBD6vR9suM9BrdAOCwm
	 cE91VtBDpXsIt+yE63okTLAec+OzU8mjS9nuLiDwWrUoQHXbcg+8fewCBFye1Z/s/i
	 Cf5IKRquZU9fbuPpaiB3MB88n5PvmtmvjQc+S508IpZltqFEuRdIU52lhVvEaAEoVf
	 0f7uPMOW2n9yg==
Date: Fri, 11 Sep 2026 19:24:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <aqRGYXKDzXZMXmmp@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
 <20260911183333.1df0f2e2@pumpkin>
 <20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2026 at 08:17:57PM +0200, Nicolas Schier wrote:
> On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:
> > On Thu, 10 Sep 2026 17:42:35 +0200
> > Nicolas Schier <n.schier@fritz.com> wrote:
> >
> > ...
> > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > different compiler more dangerous.  Maybe we will have to make the
> > > warning in Makefile's prepare (external kmods) target a bit louder.
> >
> > One problem is that distributions have a nasty habit of shipping kernels
> > that are compiled with a different compiler version to they actually
> > ship as a compiler.
> > In some cases the versions are clearly the same - but the version
> > strings differ.
>
> yeah, I guess you hit the mark.

I mean this is a problem that already exists for any flags already specified in
Kconfig.

Out-of-tree modules are historically something that we don't go to great lengths
to support and haven't historically worried about breaking, either.

I'm sure distros can find ways around this if a problem were to arise. But I
don't think it's something to worry about all that much.

I expect a _lot_ of these, in any case, would only require the compilers to be
within a fair few major versions of one another anyway.

>
> --
> Nicolas

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
