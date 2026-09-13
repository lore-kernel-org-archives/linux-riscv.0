Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704CBC88E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71jHads9zeeITb9jBADvsYkkN/4mfZftoDJwqq6qjJo=; b=2GvXsv2yot+//y
	RCGHP3QIhC3xPxKvIiXJlInfWbNSOJWSPhmqDjrfo+Iw2283WCOBkD918S9iNqHQvjmllxKIGruGs
	kusqj7Ql0Od/RlgpvTJSMl/pPXGFMahC/Qt4sZMi3kvNQHI29A364I06F2Hkj1HwvbWkZiDAdP20/
	JuUCbPFKkK/YmssNfXtCjTkC8qFvWrFhsse6IU0xmiehb2H3HUctQnQ524KCkHxjauJJAqOBddk1Z
	yjlDRnl+8R11iirTdTj9ouFfHTx3rGQY0mRsjo0+nhkna+qfYU6BUa+IRIFhuc5SE0+B5weoZw6a0
	w2rIch1hjhqgMgmRnIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5rmp-0000000239q-2p0e;
	Sun, 13 Sep 2026 21:30:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5rmn-0000000239W-0SxW;
	Sun, 13 Sep 2026 21:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFD5544A38;
	Sun, 13 Sep 2026 21:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D97D1F000FF;
	Sun, 13 Sep 2026 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789335051;
	bh=8Op6TT+ye7ilPzZZhA+0bF/cZnCKFVYCxqoH+Jt7ciM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AogI6zYE9Khh/gIeznHIfBrXAQbQqM+AaREGLZTqRZLUXl9A0qLUp9IGQpoYOxnfT
	 Oprg5UR25Yk95sS2NoceDjN8dTCPDlZedl/7TNdrQFaiPXp4pI6WxVjIRtyg6ghG9o
	 xhfO11NvrCEN8U6/RYoBgoSQhjru0JOW0O9RDtKvQta9cH4V1Ps/6dSAe4j/7IWR2J
	 OGS3s0ARLZc5A2jUPQYso8SxtcRzmH+F6XTUFnlGHKIcBp2b1AsMuYfRLZp98b9tr6
	 /1Xkwktlq11CX8GXfzTt/2uMWdKY/9D1nNe0QENXcuSOjkppbxgVch47KcNShfKS6M
	 oWYhL+Qadgcjg==
Date: Sun, 13 Sep 2026 22:30:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <aqcTSgN7Qui-NYKS@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
 <20260911-impressive-heavy-bobcat-6ceeb1@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911-impressive-heavy-bobcat-6ceeb1@l-nschier-aarch64>
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

On Fri, Sep 11, 2026 at 09:00:40PM +0200, Nicolas Schier wrote:
> On Tue, Sep 08, 2026 at 09:55:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Rust crates are compiled in a serial chain on the critical path - core,
> > bindings, kernel crates and then the drivers - each a rustc invocation.
> >
> > With CONFIG_RUST set and every rust driver enabled, the entire chain takes
> > around 25 seconds on a 128-thread machine, with the associated C code
> > taking 24 seconds.
> >
> > Each time a change is made to any of the bindings, it triggers a rebuild.
> >
> > Use the -Zthreads option to have rustc perform builds in parallel. This has
> > been available since rust 1.84 (rust-lang/rust#132282), and the kernel
> > requires rust 1.85 or above.
> >
> > A future -j/--jobs option is planned for
> > rustc:(rust-lang/compiler-team#1005), so check to see if this available and
> > if so use it.
> >
> > If the user's rustc supports neither, then it falls back gracefully and
> > neither are used.
> >
> > The threads are taken from make's jobserver, so a parallel build is not
> > oversubscribed. It was found that benefits level off at 8 threads (16 was
> > found to be around the same, and 32 slower).
> [...]
>
> > diff --git a/Makefile b/Makefile
> > index 997fc7ebe096..7d23d7b64be3 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1204,6 +1204,10 @@ KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
> >  endif
> >  endif
> >
> > +ifdef CONFIG_RUST
> > +KBUILD_RUSTFLAGS += $(if $(CONFIG_RUSTC_HAS_JOBS),-j8,$(if $(CONFIG_RUSTC_HAS_ZTHREADS),-Zthreads=8))
> > +endif
>
> Is there a reason for the 'ifdef CONFIG_RUST'?
>
> Hard-coding '8' feels a bit odd.  If some kind of KBUILD_RUST_JOBS would
> be used, it could allow users to disable or override the parallelism for
> rust.  Does it make sense to have rust parallelism configurable?

Have decided to go with a build var for v2 - KBUILD_RUST_THREADS=n - which
solves the default thread count, the instability issues and the confiigurability
all at once! :)

>
> --
> Nicolas

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
