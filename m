Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F66C982C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afM2V899/SEO+mQcHHUFDCaMduQc7Xh07Le7EYO+hwU=; b=aKy5Ag+EeLFJnC
	F00dwrfnFhrq0lMUhIXGp6Srwiuvf4w2d+qj0S3uIaKW5X8RZCwO/nNxTxxzkDrERFSgpKQn0npDi
	eAFpX9n5G59tlE5hHmeINRLVguBUTIZhizsfGs/B73UALWf2QpuiZTgb+lYAhIElwYRihXxs33yQk
	91sU8acUPF1VY525nZO+yk5xxTrD8b7Xn1UrX8LHXDpjhq0GIbSnqfzDOH4rw31vTsohJAsubq0mh
	N7Awq78PFiOmyt8FWt8bvtPIpOHV84M5nhib00CkIovmt0WZs/cRqXI7T2f+I/iBldx9sHspYdkNC
	VEn+ywxbVr3+GF2lJhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qo7-00000009SAg-3DkV;
	Wed, 16 Sep 2026 14:40:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qo5-00000009SAD-10ZS;
	Wed, 16 Sep 2026 14:40:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB71D60008;
	Wed, 16 Sep 2026 14:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701451F000FF;
	Wed, 16 Sep 2026 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569616;
	bh=WVezKAbdpjiJy/+Hx0xq2+pq04gpzdt4BxILI2ordk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ivXZVu9luWu6E+lU/3CJM5ULkUy8R5oVFsS1OFXx3keqcFidn8fsX/QKKu2sClGEf
	 4Bhk1VDn3aU7DELtvVbfOqkv2T61/drhZag8bXv/9N5ZVPylQ6v1hIMpbprrrWM7GM
	 rDYKrKU0uadpz7ZMpGv3xctF0I9r1fxj6YaYZWdWoYbksv05s5JxOGtOADes52ws7D
	 nP7pm7i8R2ZhiSBjHmuP3qd0gagDjdKk1Uhd2omrac0dpJfZtHYlJn8R3uQKkQyW94
	 HtRxy8gLa3S4UxVXlxw+d+bsxLWyDmd0cqgKBJwdjB23lTpK9Yu62JAcklDfXA8Tub
	 MjCgk7EEAsPkQ==
Date: Wed, 16 Sep 2026 15:40:01 +0100
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
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <aqqowKg8F6wi61Zf@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin>
 <202609150955.A51C9F7A20@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609150955.A51C9F7A20@keescook>
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

On Tue, Sep 15, 2026 at 10:31:20AM -0700, Kees Cook wrote:
> On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 09:39:07AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > On a 128-core Threadripper, gzip -9 of a 36 MiB x86-64 vmlinux.bin takes
> > > > 1.6s, and with pigz it takes 0.09s, so the performance increase is
> > > > significant.
> > >
> > > Neat! I wanna go learn how pigz accomplishes this -- I thought the
> > > problem with gzip was a common lookup table. Anyway...
> >
> > Yeah not sure on the details :)
>
> Things I have now learned about a DEFLATE stream (RFC 1951):
>
> - The Huffman tables are per-block, so emitting multiple tables in a
>   single stream is already required. (I only just knew about ZIP indexes
>   being singular, but I was confused: that's about the container not
>   the compression.)
> - Each pigz thread keeps a 32K back-reference window for its tables so
>   it isn't starting a fresh table each block.
>
> Very cool! The first makes parallelism possible at all, and the second
> makes it work well: it's not just restarting the compression at every
> block boundary.

Nice!

>
> > > I think the more idiomatic way to do this is:
> > >
> > > KGZIP := $(call try-run,command -v pigz,pigz,gzip)
> >
> > try-run is defined in scripts/Makefile.compiler which is only included ~200
> > lines after KGZIP is set.
> >
> > That'll also set up and tear down a temp dir for a probe that doesn't need
> > that, so I think it's fine as it is.
>
> Yeah, good points. What you have is quite simple.
>
> > > However, parallelism needs to be set. We can't let it eat all CPUs: it
> > > needs to respect the -j make option (and make its CPU reservation known
> > > to "make"), which we already have a solution for in
> > > scripts/jobserver-exec.
> >
> > The only place where it's invoked is vmlinux.bin at the end of the serial
> > tail, where all the tokens would be free anyway.
> >
> > So I don't think it really buys anything at all?
>
> There are 2 things I'm thinking about:
>
> a)
> My main concern is the lack of respecting the -j make argument. In my
> mind, this is a blocker, because it means a build will now _always_ spin
> up max CPUs (not what -j has limited it to), and for CIs, shared compute
> systems, or whatever, this violates the requested parallelism level. For
> example, if I'm doing a long-running Coccinelle replacement in one tree
> (which uses half the CPUs), any builds I launch I'm asking for the other
> half of my CPUs to be used so they don't thrash my cache.
>
> This is the kind of "why are all the CPUs spinning up?" question I
> helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearrange
> how jobserver reservations are made") forever ago.

Yeah that's fair enough and Arnd makes a good point about O(n^2) too.

>
> The next is kind of a special-case version of the above concern:
>
> b)
> There's nothing that ties KGZIP to only being used for final images
> (and in fact, it also does modules, as you show), and it's defined as
> part of "cmd_gzip", so it could be used at any moment in the build:
>
> $ git grep call.*,gzip | wc -l
> 23
>
> And it does have one use outside of the (presumed) final image build in
> the per-arch /boot/ rules besides modules, for config_data:
>
> $ git grep call.*,gzip | grep -v /boot/
> Documentation/kbuild/makefiles.rst:            $(call if_changed,gzip)
> kernel/Makefile:        $(call if_changed,gzip)
> scripts/Makefile.modinst:       $(call cmd,gzip)
>
> So I'm nervous about a general-purpose tool and Kbuild infrastructure
> suddenly going max parallel in the middle of a build some day when
> another gzip use is added.

Hmm yeah. Splitting this off seems sensible then. As you suggest in your
other reply which I shall reply to (it seems the right way forward tbh!).

>
> > Using jobserver-exec would also put python3 and two wrapper scripts in
> > front of every gzip in the build including tar -I "$(KGZIP)" when packaging
> > and some arm and m68k scripts too.
>
> Does that impact wall-clock results meaningfully? I'd really like to
> avoid losing correctness in favor of speed here, especially when we
> already have a solution at hand for exactly this problem.

No (LLM says ~.01s per build for jobserve-exec, once) so actually that big
of a deal.

>
> > Overall I think it's less complexity and really no delta to just invoke it
> > as normal.
> >
> > It's designed as drop-in so it makes sense to use it as that.
>
> It is possible that it is so fast no one will notice, but I really worry
> that there are going to be many sysadmins driven to figuring out why
> their build systems suddenly spike the CPU use, and then waste their
> time tracking it down and reporting it to us, but we can solve it today.

Yeah that's a fair point also.

>
> > > Only RHEL appears a little glitchy, but likely they would trivially move
> > > it to base since it's already packaged, but off in EPEL.
> >
> > Definitely not something for this series, the fallback is one invocation of
> > command -v and I don't really want to break RHEL either :)
> >
> > If, once this has landed, we want to go that way then it's simple enough
> > for us to change it.
>
> Fair enough, though I do worry that this is vaguely "undiscoverable" in
> the sense that if you happen to have pigz installed, suddenly it gets
> used. (We have other such "try to use this other tool first" logic,

Yup that's a thing but I think this is a very worthwhile case!

> really; we have Kconfig stuff for detecting all sorts of capabilities,
> but I couldn't find examples like this one. Maybe I missed it.)
>
> So the "make it the default" suggestion is more about having better
> determinism in the build requirements. Perhaps add pigz to changes.rst
> and/or ver_linux so it is seen/recorded somewhere?

Ack!

(Will reply on your suggestion separately ofc)

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
