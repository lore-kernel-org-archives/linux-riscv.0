Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1900C88E7F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REXjoJhtrC0MVbRfj4eWYNSdszKPLJGwwf37dImrJ0Y=; b=ZPOCoQe3B+QHdw
	eMJEXwEbf2QZ9SdE8IyBldZmtiVma9KhU3AWF5lmchq5HbfPZtPJL2FAaEVs4D+oYlmv6vTLfjTbT
	1VbDrOVN/VkQbNuPg2brIMDW+8nhsCa4wndQua9DUp2qFxGIvkahkgL3EPXBkT4srVpoY1WzHzV6w
	8HdkCTUR9EbZ1MFjW4pzMcuBCkYeuWzLO2hmIc2sKmhxlYfJgetJZ1Peyu15uqXF+VLKKlk05BH8l
	QAwjppoe8zz6jtQTl7l5ldRiMWWCkaOOLMGq88/U8NRrYEr2VI/zp2C/A1kMDyAgu2gMernl039OF
	VGGKtPWHKBHJ7lfCVqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uhi-000000074Dr-43YP;
	Tue, 15 Sep 2026 15:04:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uhg-000000074DO-2S5B;
	Tue, 15 Sep 2026 15:04:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F344C43E0B;
	Tue, 15 Sep 2026 15:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445A51F000FF;
	Tue, 15 Sep 2026 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789484651;
	bh=6WCAfz85+ZGgRMN8wAwQXLQh8ReFwgRJPZyO/JsNeYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfUJfxGo8VPDYjL6tBgfl6L002bEGl1ULF2dCRDxLcUo+ron9vtXHUBT/L1UTJo8L
	 U0iLglw63rY+yRq09BUmnCcoTd/5o8qIRnxuo2JlsFOAqKr9geNfwGfR1AickYadR1
	 eZ+UJH8NBVkcyKnuFPyAHxFthRRJgRf2DHU7c2yHI6ZgtsWCDAM9+Dp/WgT7KnklKF
	 xxwMgPPtPplf0k17pupUP4U4BTD5IWphakn+2wgwPt4Ob7KYYh4Fiufotq7wXJZle1
	 XndOOWOAK6nwCgJYzumwG2wlhaFBpVgHKhfhm0X9wnZqdojf8v+Yk3NqQjtqoeQ/bI
	 RWTqH0Scqd2sg==
Date: Tue, 15 Sep 2026 16:04:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Subject: Re: [PATCH v2 17/21] objtool: decode instructions and resolve branch
 targets in parallel
Message-ID: <aqlau0-opF8yG-JU@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-17-39817ec5db23@kernel.org>
 <202609141112.F8983EE9C@keescook>
 <aqkR9Xqu-0Tem1zm@gremlin>
 <20260915122959.2348bf90@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915122959.2348bf90@pumpkin>
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

On Tue, Sep 15, 2026 at 12:29:59PM +0100, David Laight wrote:
> On Tue, 15 Sep 2026 11:09:25 +0100
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > > > +static unsigned int decode_threads(unsigned long text_size)
> > > > +{
> > > > +	const long nr_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > > +
> > > > +	if (text_size < DECODE_THREADED_MIN_TEXT || nr_cpus < 2)
> > > > +		return 1;
>
> The text_size check ought to be before the sysconf() call.

This is bordering on a silly level of micro-optimisation :)

This is ~us runtime, run once. We can live with it.

>
> > > > +
> > > > +	return min_t(unsigned int, nr_cpus, DECODE_MAX_THREADS);
>
> Why min_t() -  you might as well make nr_cpus 'unsigned int'.

Except... sysconf() returns a long and -1 on error. Isn't min_t()
explicitly for cases like this?

>
> > > > +}
> > >
> > > No, anything using _SC_NPROCESSORS_ONLN internally is wrong, whether its
> > > pigz or objtool.
> >
> > Why? We shouldn't cap a 4 CPU box to 4 CPUs?
>
> You almost certainly don't want to use more...
> (Unless they end up waiting for disk)

Yup on the former.

>
> >
> > The idea is that the empirically obtained 16 core limit should naturally be
> > capped to the number of CPUs.
>
> The 'empirical' limit is very likely to be system dependant.

This same objection could be made against literally anything I do or do not
do, it's a little silly.

Every single cap like this is heuristic and limited. In any case - for
smaller machines, the cap will be CPU count, on larger machines 16 CPUs is
where there stops being an noticeable benefit.

Other solutions are strictly worse, this is a sensible, practical
engineering solution.

> There might also be situations where you don't want the build to run as fast
> as possible because the system is performing other workloads.

Umm what? It's 2026, schedulers are pretty good now :)

In any case with the changes here objtool doesn't dominate the runtime, so
it'll have little impact. So run make j=1 to your heart's content :)

> (Not to mention if you have had to add tracing to find a bug.)

This is almost an argument against parallelism in general.

>
> >
> > I guess in a world where make hands jobs off this could be dropped, though,
> > if the complexity there seems worthwhile.
>
> You need to pull tokens out of the make pipe :-)

Thanks, I understand what's required, as I said to Kees there's simply no
benefit for the added complexity.

Series like this can die by 1,000 cuts with all the nitpicks and what if's,
let's focus on the _significant_ improvements introduced here and keep
things in perspective please!

>
> David
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
