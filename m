Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9370C88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhg10/pA9XWVsAoy3wK2fVb4NEqRA1J2Z/MwBnBiulA=; b=SFPZL09B0h/Ziy
	+cnXcpuwIlu/Z0dgzQjCaorpJpakamXkAzQ5zh+1DzwAmcRnA399/UekKD6vGn50pqRv13UqRzxgb
	qvEsZkQh+6qpG09JtlvbO20osg0a2+7Y10/ddcQpM4OamZu+FKs70yVykJd6ZUp5GeOdRgJGONdhA
	xRtyYcJJir//XmUaEmfzlt1zFXinVjXbEGu6FhOlPVJXhnA1jFlQdd5k1OzOJBYjHlnOx6zOwD1fW
	C1DNXhQzngRbpAC8WXHoyAqq1FfNm+w2bbcbmEM+HKeOduCMZgFyDSccnI48FMv4tAEx3teACnxJm
	c0aZda0tB9gD+BN94XMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bej-00000004TGN-2SRp;
	Mon, 14 Sep 2026 18:43:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Beh-00000004TFz-3oix;
	Mon, 14 Sep 2026 18:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C69860252;
	Mon, 14 Sep 2026 18:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFB61F000FF;
	Mon, 14 Sep 2026 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789411430;
	bh=bo6GJLiDf9mVwm6AXXi7iuVJHoavl3dsdCOXGh6V4XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G0/xHYvAtQ4HOxtFGJbJlA22cMjDZl+N56G9hsoC0tQv8qT6/15zEdvADlDxeYuQh
	 ae8Q6N4X+AKq3TVZGTbZs+4oj+vIEXo4zgpz9hevYG1TM/+/i/QF6MM11pZBxxyVq0
	 vraPPnQ7ZUCWXbPqXPeQbWc8N1vmP5oiVA5uoJav1ICknNtIaaUdkQaW70pDvAs5vE
	 974HTKmZo3bFjISiUMqs3buCdhMg059Qh11CETtTBafCHxBYrVccHqoUfj37NZD6rk
	 zB9+I7SuAegOhvn9/uOVYU9JJ+Kw272HbWhBcTsqzySDRKTHj2bpbmSHp8inaUBp/U
	 YZD68D5G/qndA==
Date: Mon, 14 Sep 2026 11:43:50 -0700
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
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
Message-ID: <202609141139.AEF875252@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <202609140833.88C0E16E50@keescook>
 <aqg5nvRy9nuvC78L@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqg5nvRy9nuvC78L@gremlin>
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

On Mon, Sep 14, 2026 at 07:25:28PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 14, 2026 at 08:41:39AM -0700, Kees Cook wrote:
> > Did you try Clang CONFIG_LTO=y builds?
> 
> I tried a CONFIG_LTO_CLANG_THIN in order to check that the *.mod.S stuff
> worked correctly, all working correctly.

Okay, thanks! I did the same just now too. It seems to be just fine.

> I can try to get some profiling numbers for thin and full if you want?

Mostly I wanted to know if it worked still, and I guess for profiling,
I'd want to make sure it didn't regress how long it took to build. :)

> Well I rewrote the majority of them, so this is a stinging critique of my
> commit message writing I guess :)

Oops! Sorry. I'll go through them again, but I felt like the objtool
commit logs were very long, but perhaps it is justified. ;)

> (N.B. I have had feedback like that on a fair few human-written commit
> messages of mine lately so there might be some validity to that ;)

And as I said, I get told I'm often too terse, so perhaps my sensing
here is broken. :P

> > One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> > If we could get a deterministic kallsyms build in 1 pass, that would be
> > very nice. A lot of people have tried, but it has eluded upstreaming.
> 
> "going from three passes to one would save around 8s on an allmodconfig
> build and 2 to 3s on defconfig, out of tails that are currently roughly 25s
> and 8s." says the LLM :) so that actually does seem worthwhile.

It's what I'm always staring at when I do incrementals. ;)

> But I think best as a follow up?

Yeah, I would imagine it'd be separate. (I think a few of these sets of
changes could be landed separately too, like the pigz work.)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
