Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F169DC88E63
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1EC1+Bj1amqfr3axZTlLhFp4GS/7jDCwV/UctuhhG0=; b=2aykhACj/gZOXf
	r62AdR4QQ2AXF99mSBFMybnbom3kCI/Wm2oCaM8Uo4LupkU0AwVlBYh4B3uWAZNCNL/9WW0lg8/un
	d116SVbgiEbur1xW5Q6dklWUUhw9MCWNoxUcXixK8fCHvHVihZVfUxQvcF1HlEHvIAr7y8KfLKjM0
	bYg5NJ8J/KpzXRScBKCZ+7ZJBPE2jW7le3t25NCMupFD2TsLIewWhALGPrfISEbss8oby4oOCIzzV
	jKTT2QYStA7xtqfam2TcZXkVZ4cDxg2bY/BvOfD70WTg1LCSqEidNDZjYsSJOKyzYmgdsbgdniui+
	93VMvpsjFJYxT1Z8sliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pv2-00000001zVy-32hI;
	Sun, 13 Sep 2026 19:31:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pv0-00000001zVa-3EP5;
	Sun, 13 Sep 2026 19:31:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD014342C;
	Sun, 13 Sep 2026 19:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B371F000FF;
	Sun, 13 Sep 2026 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789327873;
	bh=rr13TkHZbL+ldb0nKaKTxHEakLfgTDRH/kuczdJfGBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R1b0+diD7lxfHcPKqbPTo/SFC1cctdEtdFH+R74FwSTC5XlCdna70LwTQQaHy2XNU
	 dMnJp/LBuyuVEkyZmtOG2myPc7/nu5717JrPIelrdjByI55ps9Vw0Bi+UG/cTPso+z
	 gNxS0Qmtap1DH08ZsH88HCZkKblQ1qSlPoE64MUmXLxLop7fvSbOgNNUvJGaa60gB9
	 V0mP0W+nFWlsFSA4FtbxiuIjFH8AtbX2NGRBxmfUFe0nF2LNaj/Z/6LH/HGiXNSzWV
	 X36Tx9nz2McE/FE1Xd99zgzIfOzx0u6I8DgPRQ12RTRBbsdnFBeXikqXFadoBjIoIl
	 rwjQ3pCYuGh6w==
Date: Sun, 13 Sep 2026 20:31:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
Subject: Re: [PATCH 23/23] kbuild: use pigz for gzip compression if available
Message-ID: <aqb4fos8X3eDX_jD@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
 <178901395293.3971858.15429964442902485180.b4-review@b4>
 <aqPdP_0eh0OYY6gZ@gremlin>
 <20260912063811.GA2002951@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912063811.GA2002951@ax162>
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

On Fri, Sep 11, 2026 at 11:38:11PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 11, 2026 at 12:03:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Actually make KGZIP=foo will override this still. But it doesn't take an
> > environment variable for make -e.
> >
> > However, that's consistent with other variables there like KBZIP2 etc.
> >
> > Probably the wording in the docs should be tweaked!
>
> Hmmm, TIL, I thought := always overrode a value specified on the command
> line but I guess not! I don't think there is anything that needs to be
> clarified.

Yeah, news to me too :))

I did slightly tweak the doc so I didn't make a claim that wasn't valid on
KGZIP re: env vars :)

>
> --
> Cheers,
> Nathan

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
