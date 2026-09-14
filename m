Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04764C88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBkun3TKS/2K6L3yvy0lijcSk/Cvg2Jt6VGXw+pecGc=; b=BxYrTXApBHUhVR
	a4kYaJ0M7CKSN8TJlIaoK+5m5SznhjaFsm1hZWuPeeFWvuA+zu6/Vqn0Wd8AEbIZsCDoUKM509V/Z
	p9rzHhxaMkwaonLEIE8lBz5Js4m6EoNrNQSZ/U+Sr/qgIUXEb2fwyZ6xToCCU1bW+g1fbgCsAzS05
	EPpB0lXI9300xrzbFKoYrcTobEvEwiqs/Tg2NfogBwAHvX9c28aO0Ndk0ZvlF8357VlBLH2MxmvvK
	bajG6mX/FdyxrSe3yxdcRhL69vQ5f1jOwyQEQQJyG7adTapN72fN9Ki8jP8hV5fz61rHul3dAd79R
	FV6jF6xCyWjS3DolzArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BNB-00000004RYb-1zx1;
	Mon, 14 Sep 2026 18:25:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BNA-00000004RYF-0jF1;
	Mon, 14 Sep 2026 18:25:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF1E660252;
	Mon, 14 Sep 2026 18:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B441F000FF;
	Mon, 14 Sep 2026 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789410342;
	bh=9IjIObR5k7PGYTYmWhdlK+kKKQoR6O9Er2obIa/1gz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k2dDa3GWuYsEUnYiCf2cNfMemYcH7gF3w4RpJHc2SMwIB5QPObhfRBuDl1VaCDzjL
	 BxXofrG6qAndbrAnP95A3BGbc1OISuGgaajL6XQ62mHcCgCY9EOWv3admkl0lwU+vL
	 hpyp4zxo4Wje0UrueF070IivC/uHeW+s1/HsvLFQarY26cIjMucKYU6kpouAmy3Y6c
	 HuCxDzF4jbAYEqCbEATfP88AL4mkR/cw02/lnYKsbxBYFPEoqheJPHlxRGw4831Eht
	 /lw/vvJEoS92HnR1Lk1Cp/C5yeN9G1gNVIwr1aqddQzN3MSGyo+7UmY1bfcT68b6Go
	 8XUQstSyQmoUA==
Date: Mon, 14 Sep 2026 19:25:28 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kees Cook <kees@kernel.org>
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
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
Message-ID: <aqg5nvRy9nuvC78L@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <202609140833.88C0E16E50@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609140833.88C0E16E50@keescook>
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

On Mon, Sep 14, 2026 at 08:41:39AM -0700, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:21:59AM +0100, Lorenzo Stoakes (ARM) wrote:
> > This series makes allmodconfig builds up to 36% faster, ...
>
> This is very nice!

Thanks :)

>
> > incremental builds
> > up to ~70% faster, and noop builds up to ~90% faster.
>
> Some of the changes for this seem to add complexity that I'm not sure
> is balanced against the gain? I am still looking through the series,
> though, maybe I'll change my opinion. ;)

Well, I aggressively stripped all the commits that had a bad RoI on that.

And a lot of these are additive over 21 commits.

So, unfortunately, hacking away at what seem like low cost commits will eat
away at the overall result.

I really did work hard to cut the fat where I could, believe me going
through what remained and a. figuring out what it did, b. rewriting a lot
of the code and c. rewriting commit messages (ahem ;) was NOT fun :)

So I was happy to swing the axe as it saved me in terms of what little
sanity remains ;)

>
> > 		== allmodconfig FULL build ==
>
> Did you try Clang CONFIG_LTO=y builds?

I tried a CONFIG_LTO_CLANG_THIN in order to check that the *.mod.S stuff
worked correctly, all working correctly.

I can try to get some profiling numbers for thin and full if you want?

>
> > 			== LLM usage ==
> > [...]
> > I extensively audited and rewrote a lot of it, and heavily edited commit
> > messages, the cover letter and comments.
>
> I feel like the commit logs still need a lot of work. The LLM verbosity
> problem appears in many of them, for example spending 80% of the commit

Well I rewrote the majority of them, so this is a stinging critique of my
commit message writing I guess :)

> log describing every step of some process as background before getting
> to the actual change. I think a human writing this would be much more
> terse about the background. I have, however, been known to be too terse
> in my own commit logs. :P

I mean no, I did write nearly all of them. So I guess err... yeah :)

The testing results and perf numbers are generated and maybe I missed some
bits but generally this is so.

Anyway, I am known to be critical on-list on occasion, so if you dish it
out you have to take it - if you point out specific commit messages that
need work then I can try to put commit msgs on a diet :)

(N.B. I have had feedback like that on a fair few human-written commit
messages of mine lately so there might be some validity to that ;)

>
> > [...]
> > Nothing too controversial was included. There are further improvements that
> > could be made, but they would either by very invasive (large scale C header
> > changes) or generate diminishing returns.
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

"going from three passes to one would save around 8s on an allmodconfig
build and 2 to 3s on defconfig, out of tails that are currently roughly 25s
and 8s." says the LLM :) so that actually does seem worthwhile.

But I think best as a follow up?

I'd like to land the really low-hanging fruit before maybe digging in to
what else we can cut out :)

>
> -Kees
>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
