Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F901C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLsESkA+Fqpa5SFN+E4JUVghuzcLb17M41Y7o0f/c4w=; b=mYGahOBuYfjFsi
	WHRl2YAYWwRhmEVQa1/vXF0Ml9hw2GlXJgEcdIoOczdd0g5WlWhfYm61FuvhvSe8Qb1EABJ2UKa8E
	rGqXCoszqo5ZCGFaSFLJerzJbcTSwdPvgAAdHaLZhKelij4nXKHNF2R74Po4iqa7Ti1Z/ggydB4mL
	R2AY0mWMCiJgRbLZyamXG6oT+UFRTX5xOgu1nobl472hUaB7LzFczC9zam/uFJBHaiSDUE4S3jrCb
	etrQeoRDMXCRhHvlBbM766TuRCbY/SZnB1sqUAe7vrPupI/CfBWvXfMGAYiKET1XdeMSM35+OPdao
	RQKSWykcIQuXlP5MgefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LC1-0000000CJQT-1qXx;
	Wed, 09 Sep 2026 16:30:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LBz-0000000CJPv-3Zq9;
	Wed, 09 Sep 2026 16:30:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89CD160204;
	Wed,  9 Sep 2026 16:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFE61F000FF;
	Wed,  9 Sep 2026 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788971434;
	bh=Kz7rWeqwh7ufJDv87BxiJfD/gwwv4aMAp/7XS3gBPEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dcYf5Ku63ij8aECQoJafs4Ipg1pK9oXj9HMZSoM3ml9RYUs9bgWbI892r15HKD+aq
	 TO6FjMT8mTQhfp+iMomWORtQlAM3jIsyaPwYZSaHoJn7R/JGCghwy4f2f0niwav6ni
	 eBJdRLPFcGRmhIBelQgMN8TiQon3ZGk+0ZjUxsPj6ZoUq1f644nJlygEq9jKwgJozp
	 ivMzm6l0Cf1qm0bdrELXOXxe7OHf/vwZsgJpnbZUDSpqIhRXP81TW35ZC+juNo5mm5
	 w8CyZDKbmN2fe9Tm4ZiwdQMSYdgzFqNx03fbVBS+oujn39g8U1gp6xIrrIUpTbPfjZ
	 fo6l8mjP/fXXQ==
Date: Wed, 9 Sep 2026 17:30:19 +0100
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
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
Message-ID: <aqGG1iSwF7SyY7d6@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
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

On Wed, Sep 09, 2026 at 08:37:10AM -0700, Linus Torvalds wrote:
> On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > A typical kernel build consists of a frustratingly large amount of time
>
> .. you're preaching to the choir.

:) Yeah, it's something that's annoyed me for a long time too.

>
> >                 == allmodconfig FULL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)
>
> Well, that's certainly very encouraging. We should do this. I sent out
> some emails as just reactions to individual patches, but I have no
> numbers to back any of those emails up, and I never actually applied
> this series to my tree - they were all based on reading the patches
> themselves.

Thanks, will have a read through those!

I do recommend trying them locally ;)

It makes a surprising difference to defconfig even. (Though you need pigz
installed for the full effect)

>
> That said:
>
> > An LLM was used to first determine where the bottlenecks were then to
> > figure out how to improve them.
> >
> > It generated a lot of code, much of it hideous.
>
> This made me scared to look at the patches originally, and I held off
> in fear that the patches would be horrible and this build time
> improvement would be hugely controversial garbage code.
>
> But:
>
> > I extensively audited and rewrote a lot of it, and heavily edited commit
> > messages, the cover letter and comments.
>
> None of the patches look at all horrible to me. You clearly excised
> the hideous parts. All of my reactions were of the type "this could
> probably be taken _further_" rather than me throwing my hands up in
> disgust.

Thanks! :)

I made sure to audit everything it came up with patch-by-patch, got it to
rework the horrors then rewrote large chunks of what it came up with.

>
> So the Rust parallelism thing clearly isn't ready based on feedback
> from that quarter, but the rest looked safe and innocuous. I'm all for

Sure, happy to drop anything like that.

Though based on what Miguel said it _might_ be ok perhaps with a nightly
gate on it? Will see what he/Bjorn say.

> merging this, although it should obviously go in through the right
> channels. Mostly the kbuild tree, although some of it clearly would be
> other cases - the objtool change in particular is fairly substantial
> and needsobjtool people to approve. It didn't look all that
> contentious, but still..

Agreed, it definitely needs some eyes on it, especially the trickier bits.

>
> Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

Yeah, it'd be nice to see this benefit everyone!

Am happy to iterate on it as needed to get it upstream.

>
>               Linus

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
