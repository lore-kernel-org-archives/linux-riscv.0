Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B780C88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAo0nX6y4FgXJ/f6DT/1lNrig7NTrZVMlR/nlv8S3Dk=; b=PYzt8EYFOGuBqX
	EGvub8WAKL6a3lVgIlJTB2h6AjTejApSkgUK71d359wZFyCjp3Sy5vlgLHhgFLU9NgvAqPACaksYM
	25DAjtxES063qSsuyyBu1cBD4/MxjvyxmwzPREToW8XGVxZCb8homY0rD/ql47XGrQF6qseSkFleE
	JvD+PyY1ri7u+A4sUlHGbqce3ICVgE3/MuY+802LZw4xps9SQaHtnhFF+MEBvh5OO3tR813ZdtaXA
	LIihzKR/ddaKlgmKxg+CMJQ/5TKHER/SviQbioahNySTYkMLb1SX8s0NE/Di4yrtkO9nnKRwZkbVf
	Pt3Vm0nKfoFxE2hqvrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55wZ-0000000HRJQ-3a31;
	Fri, 11 Sep 2026 18:25:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55wX-0000000HRJ4-3pFB;
	Fri, 11 Sep 2026 18:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6185041706;
	Fri, 11 Sep 2026 18:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF181F000FF;
	Fri, 11 Sep 2026 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789151145;
	bh=McB2i4WG3qj3jgvtyEEzwZVFRWbrW+2vNGQO4jJcnEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V/QuD7RKHTWhky3dgb6PVRJNvxWnkze0kt4kkrpUnCYoPR2W7r5F4K2sjrh7TCfss
	 3ahJS7dH3z937W49lrR506NxxwHhwI7zdRL6r32SGdlPGna39Rpd+/8rNoR29ffA/j
	 UVSXzAGjyvuBP1ddhf9lUq9UVY9KejS9z7yop3ddDfhfsHmy2ebKxvWsoDTbtYtpPH
	 2EQmQxGv0R8uinJ5AuwYTYO0/VrdPdDWzjtZjDh4ANe9EnGlPpC3NQn91JHsCLyMS4
	 p/V7dx1LnhW4eNnz1YJP70OKAqj3ALNE8aIfNZa1yGBV5DzFRtttI6lrWcB+hRAAH0
	 T3mOd8cIXS22A==
Date: Fri, 11 Sep 2026 19:25:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <aqRHk6WtdLz0cpVU@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
 <aqPXj1nDQ06KRhf4@gremlin>
 <20260911-mottled-gerbil-of-abracadabra-bacb17@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911-mottled-gerbil-of-abracadabra-bacb17@l-nschier-aarch64>
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

On Fri, Sep 11, 2026 at 08:10:26PM +0200, Nicolas Schier wrote:
> On Fri, Sep 11, 2026 at 11:30:12AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 10, 2026 at 05:42:35PM +0200, Nicolas Schier wrote:
> > > On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > index 8583d9f06c52..3c92c87254a3 100644
> > > > > --- a/init/Kconfig
> > > > > +++ b/init/Kconfig
> > > > > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> > > > >  config CC_HAS_NO_PROFILE_FN_ATTR
> > > > >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> > > > >
> > > > > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > > > > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > > > > +
> > > > > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > > > > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > > > > +
> > > > > +config CC_HAS_NO_ADDRSIG
> > > > > +	def_bool $(cc-option,-fno-addrsig)
> > > >
> > > > I am generally in favor of this proposal since I think these checks
> > > > should be cached by Kconfig where possible to clear up running them
> > > > twice. That said, I wonder if we should pick a better dumping ground for
> > > > these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> > > > scripts/Kconfig.tools or something?
> > >
> >
> > (Sorry hadn't seen you'd replied also!)
> >
> > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > different compiler more dangerous.  Maybe we will have to make the
> > > warning in Makefile's prepare (external kmods) target a bit louder.
> >
> > I guess this bit can be a follow up potentially?
>
> yes, sure.
>
> > >
> > > > I also worry about backsliding and growing cc-option checks. Should we
> > > > update the documentation to state that it is preferrable for these
> > > > checks to live in Kconfig so that they can be properly cached?
> > >
> > > Sounds good, yes.
> >
> > I can add a doc update as part of this series, unless you guys want to handle
> > separately?
>
> I don't think it has to be part of the series, it's long enough already.
> But if you want to prepare some docmentation about the preference of
> cc-option checks, feel free to go ahead or not.

Ack, thanks!

>
> Kind regards
> Nicolas

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
