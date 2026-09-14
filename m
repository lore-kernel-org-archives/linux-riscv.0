Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F74C88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsSSEKgf8UnofLW0fUcZD8xDFLj8ONyWPe2+nqGP6f8=; b=ThB8hb6OxqKE1i
	OLNcC46gvn1en6moFb273GAr+AG1zDO73/GoFJeBFzgwp/07Hu9J03pCAPVlNyumQ2mkGVlMSQORc
	xMO5yBhN+CZ8fhupj29g2Kx5xxJhOpC5LyzJtP9mQb4RACeF4RJZ3Z/I13R392g8G3LvdRz45aVWw
	pw63yIbBoehlqNoI6OGnYloM/gpIc7IbTKzVG7B/V0iZZQJiHSuubiaYShozGLxU2M4JDwSWkmoae
	qldH6GesoAkadUwr2Z3Ebdo9xA2uBwYTNa3KcTptgdaLiiJcvrfDCZMn28Xlzyi+2V6K6ny5cG8R4
	4dZ5iPCBkOf6Sz4OCuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x623Q-00000002jui-15HG;
	Mon, 14 Sep 2026 08:28:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x623O-00000002juT-0fhr;
	Mon, 14 Sep 2026 08:28:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E126B40A27;
	Mon, 14 Sep 2026 08:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F601F000FF;
	Mon, 14 Sep 2026 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374521;
	bh=L16BSpsljFr4PJF8fPayiEIvJaB3/Z4Qh/8Uz4DyO8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aoWJ6ELuaEiZQNG01VZzZjrcZE0nmTn2/Jo6aQv91PMqj4/aBro3rRP1obdfhdxwp
	 Asj533f6tmz48f33ZEHKu+68fxqVIjxuHWzwSC1C6MDsImBreU1D2X8DdgOIf3pHK9
	 Jw/Q57CrTfj34fttT6U4b2XIKAa5HBiLbPUXFJkeVPksZElzeIwLuBnq5KbjyU4sr7
	 uj4zXRUSpKDjND5OHHmt2s6JODKemDw3fwr0OQd+w7E6ul76a3Nzut3mt+iz7AOn53
	 aX/w/+PKqVcWSL87epRScWixMn/WgUkUtY1rAlqrhRWBGgGHMGBn8eOYOm4fnEawXN
	 qKaioVvWp1Qxw==
Date: Mon, 14 Sep 2026 09:28:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <aqesjZaXBQd-KkT6@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
 <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
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

On Wed, Sep 09, 2026 at 08:26:42AM -0700, Linus Torvalds wrote:
> On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > Each object's .cmd file lists its header dependencies, which often
> > consists of over a thousand dependencies.
> >
> > When little has changed in the tree, this is what make spends most of its
> > time doing, spending over a second, single-threaded when parsing larger
> > directory trees.
>
> Side note: from some kernel build profiles I did long ago, I have this
> memory of it being made much worse by the fact that we use
>
>     "$(wildcard xyzzy)"
>
> for all our config header files in those .cmd.o files. That then
> causes extra work for 'make' for all of this.
>
> And we do that 'wildcard' thing not because we want to actually match
> a pattern, but because that was the only way to have 'make' not
> complain about missing config headers.
>
> I'm not even sure the original reason for it is relevant any more -
> this is all a very dim memory from years and years ago when I actually
> tried to look at profiles of 'make' itself (normally when I do kernel
> build profiles I only look at the what the kernel part of the build
> is, not user mode).
>
> I just tried removing the 'wildcard' generation from
> scripts/basic/fixdep.c and the kernel build didn't care about it at
> all. The whole 'wildcard' trick goes all the way back to the original
> commit that added that whole 'fixdep.c' phase.
>
> Maybe the whole thing is entirely stale now and should be removed. I
> probably just didn't trigger the situation where those extra
> 'wildcard' things matter. That whole thing is from a quarter century
> ago, and nobody has dared look at that code since..

Yeah, unfortunately it seems that it's still required - without it make
seems to treat a missing target with an empty rule as if it were updated,
so without the wildcard every object that references an unset option
results in a rebuild.

>
> Or maybe 'make' is better at those wildcards these days - or other
> things have shifted.
>
> From those dim memories, make spent a lot of time doing filesystem
> lookups (directory reading  and 'stat()' calls - the wildcard thing
> triggered more getdents calls), but even more time just in string
> handling.

The depcheck commit ("kbuild: implement and use depcheck to check
dependency timestamps") actually fixes the overhead issue :) it stops make
seeing those dependency lists at all for stuff that's up to date so the
parse cost just goes away.

After that commit make only sees actually stale stuff.

The obvious question here is 'does depcheck make the wildcard stuff
unnecessary then?' - and sadly no, because there's still places where make
includes .cmd files directly without using depcheck.

But TL;DR is the overhead is gone.

>
>                Linus

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
