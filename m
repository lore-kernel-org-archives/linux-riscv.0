Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8F3C982D6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+Gop946z1JplF3H8p++/hix1FPkjFUoE2z3RPq4HeI=; b=HvhUiw+IqI5KYi
	2Z5GCUwpOpSbHPDFv1KwdM6RA2qtwf/sHi5wdKqh3et9ZpXg/vBaajTwjZsspa4qT8QmI8tRWbgUB
	f4bK1WUcbU2lUKOwy3yu1MMiYdyM5AO92mWFCSVU8qPBEeF5KVsS/xsGSvs1CKCcQugRzJAAvDLj8
	FpwdyOtHVWrzYRwPKBP6FjKdj69QZdgZjaCup0H+sVigSkgtHIz+WgidlnnopfNqNNjym+V56Xb9M
	LQkCOaX/kmvMH0dP689wn3Iz4008Syo1ewaWU0w24CGEJXyCGx4lyiZjk/Bsby5d4LALr3IeAkk1V
	16AOwOBbPtfg/O6OiapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G2G-0000000C67x-44BF;
	Thu, 17 Sep 2026 17:36:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G2F-0000000C67h-04Kg;
	Thu, 17 Sep 2026 17:36:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFCBB4396B;
	Thu, 17 Sep 2026 17:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9279B1F00893;
	Thu, 17 Sep 2026 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666594;
	bh=jpy/yjEj4aDooyvICNTbdTtEq9cxmPnAGXVj2NFxZEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1SJOQU/7zwR2k1r6QQvFbRSb27nGC3gYV7j01JYcrg5+S9rs+/hLSEJEuJHxMTKJ
	 0fTVstSev5PwoNGUQ7/RLh3nO9HabXy9209Zn3Fcc1Yqqk30IqYiODTVrDJIB7nmYs
	 qN5agK3p4SVYFaZTx5zNlmgZs17aBLbUtrKaXz1b8p1aJQS7wNBwY93H9vSNsQG58A
	 Q9nW/cDcWh89WgjM99JxsOGYeAr4Va05Fm7DmR0ejnSn1DfF4etaEEcOAwoVPrCCdB
	 TbrkgAjCCEz99A4aDim3hXRBkQWuEvUY7vuK90fmeIP0DsRTLi8zsgGMhM1mhnbaxP
	 OkVSed7QJUM5Q==
Date: Thu, 17 Sep 2026 18:36:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
Message-ID: <aqwkk7FcQ0XWeqJW@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
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

On Thu, Sep 17, 2026 at 10:15:26AM -0700, Linus Torvalds wrote:
> On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> >                 == defconfig FULL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> > Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> > EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> > EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> > M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> > M2, clang               634.5s   569.4s    -65.1s (-10%)
>
> There's something odd going on with that M2 gcc build. Why is it such
> an odd duck?

Ugh dear lord I think the LLM somehow corrupted the numbers... Let me
re-run those myself locally and come back with the actual times!

(I didn't do an allmodconfig out of pure impatience but might take the time
to do that too)

>
>              Linus

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
