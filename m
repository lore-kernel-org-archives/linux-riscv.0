Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62165C982C9
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLxdQmoZZZv1r73sDolMMsAkheaSxQUZUnFqo7ivwSY=; b=0WjI9CU2hvpF2Y
	KZYQ/XxPBucx6wNmxv5fk7n25b2o34BX/laL2YwYRQUw1EBZXOAHi1OcgN1WJ/st+PmiJTRDIAPJV
	uF1RQr7E9Q/mUbTMYX/IbnBYyTjmFCnz4hAtqqT71kb5ttg1uSNd7+Tcvqp99rU+XTyTOg6QdJ3zg
	dN8FsG6XDzVd+76gC5fRMKhgLY/0DKDC2NNIEGqZJ2eikI60xPh3cY77Vg3jSpGxBpEEyG1Uxkrtc
	NON4/djWotrt4VJ1cuceOPXldj/8HWWWgqzQQkGzR9xOnXeahu0PjNhx1YjeasMnrpsSRdtVD0STa
	BQEMTsjiNVXlKAjc/X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RTG-00000006Dfw-0mBZ;
	Tue, 15 Sep 2026 11:37:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RSH-00000006CaE-0v4T;
	Tue, 15 Sep 2026 11:36:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E526E418AE;
	Tue, 15 Sep 2026 11:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1D91F00893;
	Tue, 15 Sep 2026 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472164;
	bh=4BVB43/k5lHtsFkUgtZDywdRjbEBMWb9Mg6O6YdeHrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYZsbVigjxwfzphIbqofaPFJmaKXOkEJuH9NfOFwlWENp60vpodSbVNNMVPrnsCGh
	 mKkYFPjcJBJCWstEr5ZbUWw1p8gupBALyutxo/nsXoXJJVjfsUUEDeTeRzg9vNDFKw
	 QyLxl+67I5PApcQALeqp8arjqQrJPg8lKGehuzOG7XGzc750cxvm391kPGZaHUEXVh
	 rRpJvi2VXfCOPb4wIvdWYnRC2MlJNBFBn7hGBAKR93OKepAk7efnXRPGiZufX/FUGN
	 bMk95QWIuEMEbgWtoC+OwCCABis9Vc8v3v1aLMq5PD8Vs1rzrsq653sDeKOiCR8bmb
	 RSzE6TAD8kDPw==
Date: Tue, 15 Sep 2026 12:35:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
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
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
Message-ID: <aqks-ZmauZMcOELA@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <202609140833.88C0E16E50@keescook>
 <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
 <7646eb0c-7c4a-4ec2-9562-66a74c4d9858@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7646eb0c-7c4a-4ec2-9562-66a74c4d9858@app.fastmail.com>
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

On Tue, Sep 15, 2026 at 10:53:51AM +0200, Arnd Bergmann wrote:
> On Mon, Sep 14, 2026, at 17:53, Linus Torvalds wrote:
> > On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
> >>
> >> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> >> If we could get a deterministic kallsyms build in 1 pass, that would be
> >> very nice. A lot of people have tried, but it has eluded upstreaming.
> >
> > Even the three-pass one hasn't apparently always been entirely
> > deterministic. We've had random reports over the years of it failing
> > in some circumstances.
>
> This tends to break whenever a linker (rather than the compiler) starts
> creating a new type of symbols that show up in pass 2.
>
> > Maybe we've fixed it all, or maybe the failures just go imperceptibly
> > rare. Regardless, it has definitely been fragile.
>
> The rate seems to be once every few years, looking at the list
> of exceptions added to scripts/kallsyms.c (now scripts/mksysmap):
>
> efe6e3068067 ("kallsyms: fix nonconverging kallsyms table with lld")
> 516d980f8541 ("scripts/kallsyms: skip ppc compiler stub *.long_branch.* / *.plt_branch.*")
> b9b74be163a2 ("ARM: 8555/1: kallsyms: ignore ARM mode switching veneers")
>
> I'm sure there are other instances on architectures that get less
> build coverage.

Yeah, it's stuff like this that makes it more sensible in general to use
existing tooling where that makes sense, e.g. also the .mod.S stuff.

Though I also think dropping some of these arches would be a good idea ;)
*ahem*.

In any case, I think the bigger picture ideas like a single pass kallsyms is
stuff for the future.

The way I see it: grab the really low-hanging fruit (this series), then the
medium-hanging fruit, and only then enter the pits of hell to fight the
satanic hordes which clasp on to what remains.

>
>      Arnd

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
