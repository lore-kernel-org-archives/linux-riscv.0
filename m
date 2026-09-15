Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D9DC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEHbanP7kL6+QSQOtuKLfeJ1Q0nuUriZ/cpgBsIZXzk=; b=VnJO9OU64ZNatB
	LAP11nVAxP2IsRtwKpIB5Ayc+sf//XXim8fguPtjjOFF1GrkSO6OwixYzISoZign9ELF7rtnkYb8G
	JMS+zaaKOXFLpuGVQMHlbZ223k56F4Wm+lajCecmfvEBoWnnydU9khiS15IKIhxL5Z5G6obEb/5xr
	eXyJm180DYovccnspZ1j0LN1oDLXBNZt3gfbTsIu3KoYb6XPtgWI9oNqK9hh+Ks9F6koIlP1JU7ua
	b5v2UQ5hCJLY9GBPktbb2y5eD+XEs0EJyxAQRzTJwDg4GmWqxUgXVTb6GOa/VF6A+Lm2KSFvaAjgn
	exp4Pzd8pp4Jq9/+NXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rns-00000006LLE-1OAX;
	Tue, 15 Sep 2026 11:58:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rnp-00000006LKH-2s56;
	Tue, 15 Sep 2026 11:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ECD642E61;
	Tue, 15 Sep 2026 11:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EBA1F000FF;
	Tue, 15 Sep 2026 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473501;
	bh=jlX8Yrsnfl7deC4qnmmV5NCpDXqR14GNWi2FZvg8+jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IrCTlWujJ6nrzWR+kPElXgrplKR56V6WHeWWuPOUliQNc2EyivO33TLnPPz8rfLyd
	 k88kypZAu/qjMeNrQ811FOAXJBmQDSOix2pyOY/x4jM4YumgSk11AyXYI3nb1GaMb/
	 cKV4ELQNL9Hc5yAAA9nrg40m1XlqvJTZymo8EyPnbEC7HDmNCGf9nS/jE4eGBEHGNH
	 OASPNxuETHcj7kQOGDaogiKcS/n2iRUy/nYmg6ZAQyWKNgAx9toAxZWJasN3L/YRTP
	 tOgxJoqOAtmjQdN0oSUwjzjs66GznaaahuRcshoM7dapuGX/OrmyTJbin2BisCJOR1
	 BPf8ccBp31CiA==
Date: Tue, 15 Sep 2026 12:58:10 +0100
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
Subject: Re: [PATCH v2 20/21] kbuild: build rust crates in parallel with the
 rest of the build
Message-ID: <aqkv9SqIdh0qKPFc@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-20-39817ec5db23@kernel.org>
 <202609141133.7CA979C89@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609141133.7CA979C89@keescook>
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

On Mon, Sep 14, 2026 at 11:37:54AM -0700, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:22:19AM +0100, Lorenzo Stoakes (ARM) wrote:
> > Care is taken to ensure that external rust modules can still be built
> > against the tree - make modules_prepare ... (where ... are other goals)
> > will build rust/ first.
> > [...]
> >  prepare: prepare0
> >  ifdef CONFIG_RUST
> >  	+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
> > -	$(Q)$(MAKE) $(build)=rust
> >  endif
> >
> >  PHONY += remove-stale-files
> > @@ -1760,6 +1763,12 @@ modules: modules_prepare
> >  # Target to prepare building external modules
> >  modules_prepare: prepare
> >  	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
> > +ifdef CONFIG_RUST
> > +# Ensure rust/ is built before any external rust module which will rely upon it.
> > +ifneq ($(filter modules_prepare,$(MAKECMDGOALS)),)
> > +	$(Q)$(MAKE) $(build)=rust
> > +endif
> > +endif
>
> As far as I can see, nothing orders this recipe against the tree build,
> which also descends into rust/ through "obj-$(CONFIG_RUST) += rust/"
> in Kbuild, while $(build-dir) only depends on prepare. Before this
> patch that was fine, because prepare had already built rust/ by the
> time either of them ran. Now "make -jN modules_prepare all" can have
> two make processes building rust/ at the same time, and so can
> "make -jN rustdoc all" or "make -jN rusttest all", whose recipes also
> run "$(MAKE) $(build)=rust". That means two rustc runs writing the same
> objects in rust/ ...

Ack.

It seems make can't order two independent sub-makes, so will change the patch so
it skips the modules_prepare rust build when a goal that builds the tree* is
present, as they all descend into rust/ themselves.

I checked the change against:

	$ make modules_prepare
	$ make modules_prepare scripts
	$ make -j128 modules_prepare all

+ confirmed they all built rust/ once only for each.

* LLM says: all, vmlinux, modules, image targets, dtbs, rustdoc, rusttest

So, fixed in v3 :)

>
> > +# Rust code elsewhere in the tree depends upon rust/.
> > +ifdef CONFIG_RUST
> > +$(KBUILD_RUST_DIRS): | rust
> > +endif
> > [...]
> > +export KBUILD_RUST_DIRS := drivers lib mm samples
>
> Doesn't this make all of drivers/, lib/, mm/ and samples/ wait for rust/?
> That's a lot of stall: drivers/ is most of the tree. I think then a
> CONFIG_RUST build has most of its C work waiting on the rust chain;
> only the other top-level directories start early? This didn't create new
> build delays for those configurations?

Yeah good point.

For a defconfig+rust clean build on 128 threads the other top-level directories
were done at ~14s while rust ran to ~18.6s, so there was 4-5 of idle.

However the patch improves things by net -3.9s regardless.

This is really only a big box issue though. With fewer threads the rest of the
tree takes longer so it has no impact on the build.

(An aside - this kind of trade-off is what the series is all about really - the
 'serial tail' - i.e. the single threaded stuff that _overlaps_ the end of the
 build is what slows you down.)

Since this _still_ gives you a significant speed up on bigger boxes, I think
it's fine as-is.

The LLM says a fix for this would need significant work - a cross-instance lock
and an on-demand rust/ build. So I think best as a follow-up?

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
