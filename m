Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0808C982C4
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTE3LEPQTSaV+uyhLXawPQI+S85NjDvrqtFq1GyJq8U=; b=YseygczeguAZmh
	CoF1xEh9Zmk/Qsma5p/K/7Elk1QZKmsCPyIc6lC+jel/lihjNcOxZz/7UD0uNiVFGYT25MVxRky46
	4gX5cu8/P0zotCbqbBoze8JduNrOO/egDbc6WMW3PoXhRaHtslw2lXHAMqPBt+t6+XF0qyp8DfEHU
	QsTlAK1guFplE6qthJAtprLBumcsFUD6tfGhZQRsDQyeNxVj0fkzYyvxjuZXFX75BaJhefYtPoplZ
	ogXem4qJqIrzkjN6TDmsFPIwVBYPx4LcyfhoRrStXVLTsHR2Y6OkDk4wGe6GIT3UcoMcIRigs2L3k
	79zdbC9GyTpILDd3vjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rFb-00000009VKg-0oid;
	Wed, 16 Sep 2026 15:08:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rFW-00000009VIS-3h85;
	Wed, 16 Sep 2026 15:08:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDE80602D0;
	Wed, 16 Sep 2026 15:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516B01F00893;
	Wed, 16 Sep 2026 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571317;
	bh=mvnJw+3qk5WKTUY8hybHvBw9Pfdia/n58K2DMAIEiJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6Pi09cGtQDbhTokf7C/H+aoSaJVEvhKHRf1h/Np280E5R0VyWuj/lmoXuvhFYO3O
	 Ye/ZaPq6MjnI7ltToyvk17zdgDUhcXfw/zXQ5o1Ve7sEHgp0UQBUGt93f4EXe9arJG
	 SyzSZd+kgHjYDKeSdq2ISr3m5EIlQfJNd1qhvBmpE/Hc3yREkrxiMAdOMfhWp5b2oj
	 fIFHN5mEh9nzM7Kj1hgezMh1UwhtZsNuWpy+ztqriuFcfCaOAqOAqPzqH099k8iile
	 WiHRfLWihpTKUfypFkJIVnLhWjLZNemheJHIVGaexaZnqfZRq+BmQq04sXJknranBY
	 yjqwqwO/JUg7g==
Date: Wed, 16 Sep 2026 16:08:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
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
	linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <aqqv-dhpu8TN9e1V@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
 <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
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

On Wed, Sep 16, 2026 at 08:38:33AM +0200, Arnd Bergmann wrote:
> On Wed, Sep 16, 2026, at 03:06, Kees Cook wrote:
> > On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > Makefile:
> >
> > KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3)
> > $(abs_srctree)/scripts/jobserver-exec
> > $(abs_srctree)/scripts/parallel-gzip,gzip)
> >
> > and the same scripts/parallel-gzip:
> >
> > 	#!/bin/sh
> > 	exec pigz -p ${PARALLELISM:-1} "$@"
> >
> > And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
> > to change modules, config_data, new users, nor cmd_gzip, etc, which all
> > continue to use the regular KGZIP and the "use python" part for the
> > KPGZIP case becomes is a 1-time cost?
>
> Nice, I like the idea and this this will work. I didn't know about
> scripts/jobserver-exec, but this does seem like a perfect fit.

Agreed, this solution balances everything well!

>
> I checked the other compression tools we support, and found that
> zstd is another one that has built-in support for parallel
> compression, so we probably want to have it there as well.

Nice, zstd really seems a lot better than gzip in general, but people
default out of habit I guess :)

I think one for a follow-up though?

>
>      Arnd

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
