Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1534BC88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc9hbaPXvb9ReZJPv5MWuhCI9iQPatLOxe9OJOiBoGo=; b=NokJeWiPOZyzvy
	nK6mw+YCLzTmq4IuXKGDAP5HDebj3RAifHtXdVDKNV7ZosZZT37LLLps5ZKRAw6ypCV4pc2NGjSj1
	SoHRqYnfbFIFBMIptidLycFWFC3ICTzceNXMCsfQLx9C3aLC21XeCCXaSoXKMJcA3Fs2tY0tcGmgx
	MUj0wCfbV4CniYjZHKvzHcZjNIJ9MwXqJ+eBC730B4nbRZjsePYsfobXWj6Hw7vSpccIDmB2rp6BI
	XYO0CjPiGBSNp+vB1GFDRVQ/G5D+wMRoIOzi8N0EV2UE3j4GH1vj2wm6govtUywdBmP8P3Ov8bjpZ
	eikEdOH88qJNjvV+hXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WM0-00000007UTL-3jJw;
	Tue, 15 Sep 2026 16:49:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WLz-00000007USr-3CuD;
	Tue, 15 Sep 2026 16:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E87C5602BE;
	Tue, 15 Sep 2026 16:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA201F000FF;
	Tue, 15 Sep 2026 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490994;
	bh=ZPoduYurjOSFdX2MA/IC1rIMtpjmo5SA4Yn6x4dnVcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eopCimMLWecJrXWLsR7ihQavgXLke2UlIaFCZIuHOMGMRZ/oUOaUP37XVJe+Hrf6l
	 KJfPMz4CB1RLGbIfcjMRXnMcCDrTDOKiNgttsiyfoxbBif0iWU6RAHjxcmWKyApIIx
	 mbedXmufA5qFMHum6a4/+ehaPu4IZWEuqjpiUwP/mf2L11xuhGD/qU3JvUh88k6VMz
	 Nn00+ONModRc6bWnrxAGXXMH/jyXlwsAnXCQwdhQVCuYNLpqVignJh/umWO7DMzYNx
	 1FbIyqHv0slsSorFvnIY+n6Xrr4R0HnDH6ipSzxKwqcLZfVGw3OVr6sRMhOOzyAx9u
	 iSlOBJjPOilyQ==
Date: Tue, 15 Sep 2026 09:49:54 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
Message-ID: <202609150943.000EC9277@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org>
 <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqkZvtAKWYf9-1ZW@gremlin>
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

On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote:
> > > Module finalisation on allmodconfig builds consists of a large number of
> > > very short-lived jobs, and the make job dispatcher cannot possibly dispatch
> > > jobs fast enough.
> >
> > This "cannot possibly" sounds like a weird LLM language intensifier. I'd
> 
> Again that's my writing actually, probably best to stop assuming LLM now ;)

Apologies; whatever the opposite of the Turing Test is, I have failed.
:P The AIs are winning: humans are suspicious of each other now. :)

> > rather a concrete description of the problem, not this kind of
> > (redundant?) vagueness.
> 
> In the very next paragraph I say:
> 
> 	For allmodconfig x86-64 this can be on the order of ~22,000 jobs of
> 	a few milliseconds in duration each.
> 
> You did also say that the commit messages were over-long, so there's a
> trade-off here :)

Right, sorry, I meant I understand the need to collapse the jobs
together, I was just trying to understand where the "128" came from.

> But in more detail, allmodconfig tree (~11k modules on x86-64), best of 2,
> make modules with *.ko *.mod.o deleted:
> 
>     modules per chunk    instances    wall
>     -----------------    ---------    ------
>                     1        11171    10.22s
>                     2         5586     6.72s
>                     4         2793     4.97s
>                     8         1397     4.26s
>                    16          699     4.05s
>                    32          350     4.05s
>                    64          175     4.07s
>                   128           88     4.05s
>                   256           44     4.03s
>                   512           22     4.18s
> 
> which I think makes things clearer.
> 
> So realistically 32 - 256 is the right sort of range. You also have to take
> into account the fact that you might be building fewer modules.

This answers it, thank you!

> The argument for 128 is that this is the mid-point of where the graph
> flattens off for a larger number of modules.
> 
> For a smaller number, you're going to have a single dispatch or less and
> the delta won't be that much anyway.

Understood. I guess I'm trying to better understand the chosen balance
point. Does machine CPU count matter at all for this? i.e. "16" is the
first one to hit the 4 second line, can that be "better" than 128 for
smaller system (or fewer modules)? I'm trying to consider CIs and such
that are bounded to 8 or fewer threads, etc.

> So it's very much a sensibly derived empirical value.
> 
> I'll update the commit message to give this rationale there.

Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
