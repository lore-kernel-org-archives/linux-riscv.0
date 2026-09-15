Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C6AC88E77
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idsX8AFGM81bVHjjejTiJepyfPwT02RMxXT5w1+U48Y=; b=C23nolsT3OmiKr
	4jSqsR8fj5DHyjp+NitjiEauvZEjtH5QXLKhjSHElvXo/V6BGxJAwSEtOq4XeWSlSII9MPEcBM1UH
	wqtMW4n+Fy/okUNra6FzhXSYR/qtDVWDvvkppkMo78RPx3sLLDBAm0xJDARX9yP1edSla1WwOLD9P
	sqEZ8vlRA7tBOfEBFURYuZMAlHjHmYaphauWmm8LwzisGSRVZgF9XOzxDoJNqinbWyzYNmPoh4cW8
	7JuSIyhLStZhT2lu793k/f97xyYk12Zgcz9swV9PaILZGJJJBqhq/Y1TWX6XWOAqoiPNiIKwejv6F
	FKvyELkyO1KwS5z6kLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X07-00000007asO-1D7L;
	Tue, 15 Sep 2026 17:31:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X05-00000007arz-1Ayq;
	Tue, 15 Sep 2026 17:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 842ED4197F;
	Tue, 15 Sep 2026 17:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E961F00893;
	Tue, 15 Sep 2026 17:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493480;
	bh=wWvthobti2pF6h9qNUQka5J7xC5moBjykTsxqt8of7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DUdStQ716xOP57w5uopB3gZVM8T+Vn4Zdpx+MZkbU32Utq9tUXSiJA79aBzvj1Fth
	 xZ2tn3YJM9oMNchSSEYAe+afithuZVIxRPDcu3LjIn2a1bcfNRDbb1ACUsF41lxI1z
	 IfaeCz77ML8DvMbde/EKxq+BIq6nl+mJv80lRtx9z4J0ZqaFEgTlwKpIh7i4GiExph
	 J4BBH+jt/Vlf0jfNOPAqYhOlJ6Ha1ZVaTXLsFOz9Hq4LGL3cGRjAiZKAzPS9PAw9I4
	 Wu3/MOYVURHUJr9Wp5FZ2H5SOizPVYCB2t9Rnvyg2P9I792yxHAjYexnNqiVxtuL3Z
	 sa7mRqrKsA2AQ==
Date: Tue, 15 Sep 2026 10:31:20 -0700
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
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609150955.A51C9F7A20@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqk9gakQhxToLnDI@gremlin>
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

On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 14, 2026 at 09:39:07AM -0700, Kees Cook wrote:
> > On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On a 128-core Threadripper, gzip -9 of a 36 MiB x86-64 vmlinux.bin takes
> > > 1.6s, and with pigz it takes 0.09s, so the performance increase is
> > > significant.
> >
> > Neat! I wanna go learn how pigz accomplishes this -- I thought the
> > problem with gzip was a common lookup table. Anyway...
> 
> Yeah not sure on the details :)

Things I have now learned about a DEFLATE stream (RFC 1951):

- The Huffman tables are per-block, so emitting multiple tables in a
  single stream is already required. (I only just knew about ZIP indexes
  being singular, but I was confused: that's about the container not
  the compression.)
- Each pigz thread keeps a 32K back-reference window for its tables so
  it isn't starting a fresh table each block.

Very cool! The first makes parallelism possible at all, and the second
makes it work well: it's not just restarting the compression at every
block boundary.

> > I think the more idiomatic way to do this is:
> >
> > KGZIP := $(call try-run,command -v pigz,pigz,gzip)
> 
> try-run is defined in scripts/Makefile.compiler which is only included ~200
> lines after KGZIP is set.
> 
> That'll also set up and tear down a temp dir for a probe that doesn't need
> that, so I think it's fine as it is.

Yeah, good points. What you have is quite simple.

> > However, parallelism needs to be set. We can't let it eat all CPUs: it
> > needs to respect the -j make option (and make its CPU reservation known
> > to "make"), which we already have a solution for in
> > scripts/jobserver-exec.
> 
> The only place where it's invoked is vmlinux.bin at the end of the serial
> tail, where all the tokens would be free anyway.
> 
> So I don't think it really buys anything at all?

There are 2 things I'm thinking about:

a)
My main concern is the lack of respecting the -j make argument. In my
mind, this is a blocker, because it means a build will now _always_ spin
up max CPUs (not what -j has limited it to), and for CIs, shared compute
systems, or whatever, this violates the requested parallelism level. For
example, if I'm doing a long-running Coccinelle replacement in one tree
(which uses half the CPUs), any builds I launch I'm asking for the other
half of my CPUs to be used so they don't thrash my cache.

This is the kind of "why are all the CPUs spinning up?" question I
helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearrange
how jobserver reservations are made") forever ago.

The next is kind of a special-case version of the above concern:

b)
There's nothing that ties KGZIP to only being used for final images
(and in fact, it also does modules, as you show), and it's defined as
part of "cmd_gzip", so it could be used at any moment in the build:

$ git grep call.*,gzip | wc -l
23

And it does have one use outside of the (presumed) final image build in
the per-arch /boot/ rules besides modules, for config_data:

$ git grep call.*,gzip | grep -v /boot/
Documentation/kbuild/makefiles.rst:            $(call if_changed,gzip)
kernel/Makefile:        $(call if_changed,gzip)
scripts/Makefile.modinst:       $(call cmd,gzip)

So I'm nervous about a general-purpose tool and Kbuild infrastructure
suddenly going max parallel in the middle of a build some day when
another gzip use is added.

> Using jobserver-exec would also put python3 and two wrapper scripts in
> front of every gzip in the build including tar -I "$(KGZIP)" when packaging
> and some arm and m68k scripts too.

Does that impact wall-clock results meaningfully? I'd really like to
avoid losing correctness in favor of speed here, especially when we
already have a solution at hand for exactly this problem.

> Overall I think it's less complexity and really no delta to just invoke it
> as normal.
> 
> It's designed as drop-in so it makes sense to use it as that.

It is possible that it is so fast no one will notice, but I really worry
that there are going to be many sysadmins driven to figuring out why
their build systems suddenly spike the CPU use, and then waste their
time tracking it down and reporting it to us, but we can solve it today.

> > Only RHEL appears a little glitchy, but likely they would trivially move
> > it to base since it's already packaged, but off in EPEL.
> 
> Definitely not something for this series, the fallback is one invocation of
> command -v and I don't really want to break RHEL either :)
> 
> If, once this has landed, we want to go that way then it's simple enough
> for us to change it.

Fair enough, though I do worry that this is vaguely "undiscoverable" in
the sense that if you happen to have pigz installed, suddenly it gets
used. (We have other such "try to use this other tool first" logic,
really; we have Kconfig stuff for detecting all sorts of capabilities,
but I couldn't find examples like this one. Maybe I missed it.)

So the "make it the default" suggestion is more about having better
determinism in the build requirements. Perhaps add pigz to changes.rst
and/or ver_linux so it is seen/recorded somewhere?

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
