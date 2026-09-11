Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136E7C88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJQkXyF0I6ZF/iNosjSq6XPVvwfhrqplNFpaOA4aa1s=; b=RBZoXcQQtOsjIF
	mNhQZKo/uNFHnP6ERljsqQBkKVwyKr0bhbH2moS/vS9UzWmF44hObvghnZpxvA2ay1SKg1UZUyvi9
	9jZxq7QG8NPgiQyVtNbkdgGYsZQ1HdYjf9lzuRrnbhD3d+CFQ9k639o/foRDZzQ097qRh8BSAc4ie
	sRcVC1o9trDgjNcD/+P0SRUYDdtf0iPC/jotDcMHSxmmwCgyEGzMWdluok7ZX/09t1ZwRtYyub/Fc
	V2W9qpeg7NHzAveYzsf7Mzc9ZP/BmL5Ce7Zyj/+yQNHgMVq2YHLv2zZrXR8qxuo6PUgBTIYe/IFWV
	R6M8khaBVPaT0Btkz+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Fx-0000000Gcjy-42xw;
	Fri, 11 Sep 2026 12:21:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Fu-0000000GcjE-32sd;
	Fri, 11 Sep 2026 12:21:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38C1041591;
	Fri, 11 Sep 2026 12:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D011F000FF;
	Fri, 11 Sep 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789129282;
	bh=hnePd57k46g8WcHZfl1wWVKwVdeqIAgwxtC2vZYKUdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndVZ4MDCqLs/GzhtgETpCUyvZ+82B7fAggByjtHixVFrcizERuPRxskk1NHVZNBKs
	 bxZfnWVNqMEftfP+Sb32Z/IbEGxID7WNTBZ1jXMAXDw1dkz2OClC64k6bYcDGxZq2M
	 gdh5GLw5yjJwq87NLUkso8azBwnZZwoSNxUdBK4AKm6R+7gNW6SP+NU2+/cU6ND+op
	 2+zI3K2MBzwTalCZGAUHD1F18+NX5y7N558dI5g81eLU2AvSqu5TYUA4+MNeTBclcj
	 k0JauTicNKQUsktsU7FqCb4p00bZGNcBXWbZQIKX1KGeqvdCU5A2qOYmEgMwqgYjCr
	 AaQpU/w8SiYow==
Date: Fri, 11 Sep 2026 13:21:08 +0100
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
Message-ID: <aqPyDa12niPgKJpe@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
 <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
 <aqPYvKR_eRsFlEd-@gremlin>
 <f24ddba6-b7fa-434a-8a2c-9f04af6969e6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f24ddba6-b7fa-434a-8a2c-9f04af6969e6@suse.com>
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

On Fri, Sep 11, 2026 at 01:57:34PM +0200, Petr Pavlu wrote:
> On 9/11/26 12:41 PM, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 10, 2026 at 02:52:50PM +0200, Petr Pavlu wrote:
> >> On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
> >>> modpost spends a long time md4 hashing module source at a per-byte
> >>> granularity.
> >>>
> >>> Fix this by doing this hashing per-file instead by accumulating a per-file
> >>> buffer in parse_file().
> >>>
> >>> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
> >>> with this change applied.
> >>>
> >>> This is especially impactful for allmodconfig incremental builds (where
> >>> CONFIG_MODULE_SRCVERSION_ALL is set).
> >>>
> >>> Whole build, 128-thread Threadripper 9980X, best of N runs:
> >>>
> >>>                                          before   after     delta
> >>>                                          -------------------------------
> >>>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
> >>>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
> >>>
> >>> Assisted-by: LLM
> >>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> ---
> >>>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
> >>>  1 file changed, 44 insertions(+), 12 deletions(-)
> >>
> >> Support for the module srcversion is being removed in "module: remove
> >> MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
> >> be gone completely.
> >
> > Hmm, that series doesn't remove the script though, is that planned as a follow up?
>
> My reply to that series [1] notes that it should also remove
> scripts/mod/sumversion.c. It should be done in the next version.

Ack!

>
> >
> > I guess I can drop this patch from the series then :) Also patch 17 I think?
>
> I agree. The module srcversion is no longer needed since build IDs are
> nowadays the standard mechanism for providing effectively the same
> functionality. While I'm not sure when the mentioned removal will land,
> reviewing and polishing this patch and patch 17 would IMO be wasteful at
> this point.

Ack, will drop them for v2 then and add a note to the cover clearly stating the
dependency!

>
> [1] https://lore.kernel.org/linux-modules/4e321525-708c-4964-9937-d94ea27e8d85@suse.com/
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
