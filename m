Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B53C982C3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKupcGOKndwyfUkjTASYMybX7PjNB5GTqMjdjPKjQzw=; b=LrO2eToK7lhSDc
	nxH5txmXKvsFbu6fjK+dleh7PmWLQdd0C9qCz+9AqFJeVmBCqjM2dgsCXHCoYMPjTPOllhQdtmoF0
	hEwmxCyWS4n+NuEY/RVk11hk7Vr7gzPR8fE8pTGqceLf6iYaBunSUR4GCwnzM+2slSl6LvvEW7iDL
	dCzO+6HPCayxZ7+dybpKBn8lQzo6ELyrUlEcD3KkFaNE8rEu/fykp4UH+ELjX6/PCDsB2OCOULdow
	XBgywK5XkCyi7luzKV8AQZQgZLo7ZkmF8k8Z8E59IEhNpiak3zYSBiHAvN1QAMQIvDwCPvMdykylb
	J1MdaKtfKlciCABH0riA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rAz-00000009Upg-3SdE;
	Wed, 16 Sep 2026 15:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rAx-00000009UpP-0m3r;
	Wed, 16 Sep 2026 15:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69155423E1;
	Wed, 16 Sep 2026 15:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BFE1F00893;
	Wed, 16 Sep 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571034;
	bh=dOv2mUj4IfQe2urPrSpRQzq0891uSiUaHQT6Owxb4wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNp9TR4hNEa31Lc0OIBbkJdyzLUfzEaSCShJwRUZAyIVBedJucVpionSLbHbhuA12
	 A4LYcd84p8E1yUX+oNnZHXrq7AxrE66qITT8dSJ5yoVQlbjgAVXl4pn9Uv35wr8WDE
	 X6oCqN9iRGTROffI+elLc579AyLZU5pXOTmYO2A5vo4/B68mYilbKrCFbOTZbDxokz
	 rdwtI5djw+jX5yinhipJqexpdkRFsYN21LTdQ7uhn1fk7jnwEWNsUyMLAMYEmMM61E
	 5H7OUlp5zB0ThL+tfxTTww/QqiALf9VJCzMFbYRE6ZjfI5X7IDi/CCJt8YPEk4V11i
	 Rrp4tMEu4icXA==
Date: Wed, 16 Sep 2026 16:03:39 +0100
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
Message-ID: <aqqqZfa8Q4D5dBt5@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609151758.BA5732348@keescook>
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

On Tue, Sep 15, 2026 at 06:06:05PM -0700, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> > diff --git a/Makefile b/Makefile
> > index 790ef23c5e8a..38c0cdc9f591 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -561,7 +561,7 @@ PERL		= perl
> >  PYTHON3		= python3
> >  CHECK		= sparse
> >  BASH		= bash
> > -KGZIP		= gzip
> > +KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)
> >  KBZIP2		= bzip2
> >  KLZOP		= lzop
> >  LZMA		= lzma
>
> I had another idea that I think solves both my concerns (limits
> to parallelism, new surprise users) and your concerns (complexity,
> single-threaded when needed)... how about:
>
> Makefile:
>
> KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) $(abs_srctree)/scripts/jobserver-exec $(abs_srctree)/scripts/parallel-gzip,gzip)

That's nice :) Keeps things simple, separates out the jobserver-exec execution
(which it turns out is no big deal also), and abstracts the idea of 'parallel
gzip'.

Let's do this.

>
> and the same scripts/parallel-gzip:
>
> 	#!/bin/sh
> 	exec pigz -p ${PARALLELISM:-1} "$@"
>
> And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
> to change modules, config_data, new users, nor cmd_gzip, etc, which all
> continue to use the regular KGZIP and the "use python" part for the
> KPGZIP case becomes is a 1-time cost?

Yeah that's really nice.

This is clearly the way forward, will do that in v3, thanks! :)

[Oh and on precedent, it seems the arm64 FIT image builder,
 scripts/make_fit.py, uses pigz already if available :>)]

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
