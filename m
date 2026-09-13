Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A6C88E69
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTjymmQA/wxGEJn/FdCG58LZ87p7LKlgLvbD30Ck18g=; b=mWsHTThkwnzddb
	8WV7BLvUBtewTfo0FvqdJ5s9Jt1sxsoPW8TCSa/Y9chJpxl0pjRDB0QURPxLL3GFBcRKsQ9ns+Q8R
	wsUZIyzQBSqjWd8xEa/5lw1Ujq7LyzoLU/kBg75mM2xY0Q0epE9sSCwJ8E3Y6DxbjOaRNBgZ/a6w6
	t5pUMYL/+liyUM95NfER7YVYqoad1hGoB5CLScduDmDU+HvizSaobKLvE8dTjtzgGzZwsH+XgR+KS
	4rBlDECDYXj2n5Qj9JPvlRMEF/p1GzH+/0XZpx0BbGKbJQfMv2Jy2dq6jJyF19siARE07wLwlMLgs
	uBXEcTuJV+QYL884mzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nCK-00000001pIa-1J24;
	Sun, 13 Sep 2026 16:36:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nCI-00000001pIG-1mGE;
	Sun, 13 Sep 2026 16:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C99260E6E;
	Sun, 13 Sep 2026 16:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2A71F000FF;
	Sun, 13 Sep 2026 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789317413;
	bh=4B9lPYJZx2WtDB/f5GYcYiGdJjQEGc2VffrdMkBYbGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VMRn/4Ggw0dXaUy1jNqG3n3Y3lFltR1JKKPxPddcpiouSI90FL6bJhQ0xjuXhlNvp
	 QO1eJQCBNg+tmWZk87cuALgFzNb/l7wfaiANKKcLbSXgtVUrkWdkNh64DthcliwB3k
	 0oxm7Ms59/P2/kAKOj9iBsmBiBTunJMFV80yf35hbkPAs4+FIHmmbL3vZJD6FpvmxZ
	 mHQ7218RLoe2DdnCFuFPUqEz4+gu0Hl6ff15ZY13jwu8GRfFcoVd5HkF51bunsZjp/
	 xGN3TJ3cymEhnAkRu8EhgLboTMnYMtazjxkrpjpzHNudJWLJHnoXfwaiSJEJt+1Gbn
	 Meb3psVdxKrCA==
Date: Sun, 13 Sep 2026 17:36:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yann Droneaud <yann@droneaud.fr>
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 17/23] modpost: perform srcversion hashing in parallel
Message-ID: <aqbP9ewBMAGAXbQB@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
 <4e447b33-574e-425e-bc92-2b728128cf18@droneaud.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e447b33-574e-425e-bc92-2b728128cf18@droneaud.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2026 at 01:50:00PM +0200, Yann Droneaud wrote:
> Hi,
>
> Le 08/09/2026 =E0 22:55, Lorenzo Stoakes (ARM) a =E9crit=A0:
> > modpost does a lot of single-threaded work hashing files from each obje=
ct's
> > .cmd file.
> >
> > This makes the build slower than it needs to be, so do this work in
> > parallel.
>
>
> If you're going parallel, it would be nicer to do it under make's jobserv=
er
> supervision.

Ack, though this patch is going to be dropped due to mod versions being rem=
oved
upstream.

>
>
> > This is egregious for allmodconfig builds - for instance x86-64 can end=
 up
> > opening 200,000 files individually and hashing them all serially.
> >
> > Parallelise this operation by maintaining a thread pool for the hashing
> > work.
> >
> > Combined with the per-file hashing commit this cuts modpost's run time
> > nearly in half for an allmodconfig build.
> >
> > Module.symvers and every *.mod.S are byte for byte the same.
> >
> > modpost is on the serial tail of every allmodconfig build, however
> > defconfig does not set CONFIG_MODULE_SRCVERSION_ALL and is unchanged.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                           before   after     delta
> >                                           -----------------------------=
--
> >    x86 allmodconfig, touch mm/vma.c, gcc    33.4s    30.2s     -3.2s (-=
10%)
> >    x86 allmodconfig, touch mm/vma.c, clang  31.1s    28.1s     -3.0s (-=
10%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >   scripts/mod/Makefile     |  1 +
> >   scripts/mod/modpost.c    | 72 +++++++++++++++++++++++++++++++++++++++=
+++++++--
> >   scripts/mod/modpost.h    |  2 ++
> >   scripts/mod/sumversion.c |  3 +-
> >   4 files changed, 74 insertions(+), 4 deletions(-)
> >
>
> Regards.
>
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
