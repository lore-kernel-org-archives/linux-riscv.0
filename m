Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F6DC88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVvAfEHZnU6DPsx17GDeDAIn15YhvHk6YiG3jjd2hsM=; b=sCgJAIitUjaa9x
	ukZT7L/Z4N/JOkOuPzk/VYxDiVMx56AcIDP6uODmXfjA49wft1ac1vRYQAIkSMQglrW0q5bl44BRJ
	zFmSymWe7Ns7+/8vbcUmI3uqdNLHeZDtiKucZQcgpS3QCcQDBN1Dmcy81G2bEYhfsqDrGA6i9xClp
	WVWfTow1Nttb5VanePR1Jjc+pTpqx18y3fgUX3ve1PaoKE4DJpnVQXGM7/rr2aVGVkOy5+gcMzKuK
	4WT0lCmDa23EF2yOJhKZRE39D6OCx58xk3Ejj5RLgwDmVY9UngPCD3Tqx4F+bZkpUVKsLoOYI+ogU
	y4/SCmIZxsy+KObT0gGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yhk-0000000GPQC-1yvW;
	Fri, 11 Sep 2026 10:42:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yhi-0000000GPPx-1Ci6;
	Fri, 11 Sep 2026 10:41:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CAC060238;
	Fri, 11 Sep 2026 10:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E852A1F00893;
	Fri, 11 Sep 2026 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123317;
	bh=MMJozD+RewnE2WYnIY4zmGHYgUsIL3AEVPRTDj0LFp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcs4lsBdMwnW3lvB6exZIai5ol6Yll7bG/D1+ACDRwDpO3fOZPtNZtrr/wRrMfVnF
	 2j60pbtJ6hWpfKQa7KB2OZKJ6MVp/0vCxO6uHD6KrHWQqBZ6kEPkhf7pZQJr/102YE
	 T1jWWci85XBcjR4t7bz+BKek9UUwRB2J3+EJ11gmbc4zCByQt1yfpJBpmjxqNfMqkG
	 3ToKl+ijDkkohsVu6wnXupOLnIvcJUBY0ztyBT2+7I01TALqv+YgH4HIxdTJWXPF21
	 OCt+c8Um107UgPvZi5Npr/ihPA+ggNXAevh4vJJClnZvexnYba42/50f1AwJmO7j+o
	 2kw3fJzuWq5fA==
Date: Fri, 11 Sep 2026 11:41:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
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
Subject: Re: [PATCH 13/23] modpost: hash module source per-file, not per-byte
Message-ID: <aqPYvKR_eRsFlEd-@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
 <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
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

On Thu, Sep 10, 2026 at 02:52:50PM +0200, Petr Pavlu wrote:
> On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
> > modpost spends a long time md4 hashing module source at a per-byte
> > granularity.
> >
> > Fix this by doing this hashing per-file instead by accumulating a per-file
> > buffer in parse_file().
> >
> > All 11,189 .mod.c files and Module.symvers were confirmed to be identical
> > with this change applied.
> >
> > This is especially impactful for allmodconfig incremental builds (where
> > CONFIG_MODULE_SRCVERSION_ALL is set).
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
> >   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 44 insertions(+), 12 deletions(-)
>
> Support for the module srcversion is being removed in "module: remove
> MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
> be gone completely.

Hmm, that series doesn't remove the script though, is that planned as a follow up?

I guess I can drop this patch from the series then :) Also patch 17 I think?

>
> [1] https://lore.kernel.org/linux-modules/20260731-module_ver_remove-v2-0-c9163858f382@linuxfoundation.org/
>
> --
> Thanks,
> Petr

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
