Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48251C982DA
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4Pxcsg/qNQt/VUflh7ovowuiVQVxVSiuOJXtLDQGKk=; b=ZezQ3nY5PHhrxq
	MXRmlpDImWOWmYPW1+PEkXSqB22ybfEgQE0H2UqBxFDaI2L0KYDP9tqogXLWoCDudUi+xoWAN4lrf
	g08IIeiKdJEDonoo68w4GwnEqAwAN8qGCtreXqypQfUK6sqNNx4+k1yybnAVVkuQdp83SwYHaNSyV
	xI62g/YuYoq47pXfMlLu+uY8PJM3xJaLhpUdSSZphH+FY83CPpv4xJJl5H7URGSZb1dfzBcQ8vOGq
	a4KBpztRTtQfpZGUf4YmjYesp8+/LZFkGXF7qh4o+JASX3c41kojFYJuwkVCH0/w2KjmR8NDM/ior
	bxMMbz4wSy94MAyrvhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZhJ-0000000EjdD-1KxT;
	Fri, 18 Sep 2026 14:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZhG-0000000Ejcd-1r6i;
	Fri, 18 Sep 2026 14:36:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55820601EF;
	Fri, 18 Sep 2026 14:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD181F000FF;
	Fri, 18 Sep 2026 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789742173;
	bh=iy+YeJOq8ncVue9kKagO67d1wHr0X1BI7jS1wlHwKFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kp6bVUABBdit8x2HmWr4RJlsOX4CpxQbJSRoZwK/ALiD5H36OGaoVkBVHLa6pKaGu
	 i9kDvm+VAVQ+5N+yg4SGamQO+46oTWUMUEPPwLdQRjtKVIyiuL71DqfPFAd1UFsygH
	 WCGGxfRC8e/UQK6y/tagDorXGNS0w+oqCa/aavHFlrZ+C/St6RscsL4ptFWrQNOK2U
	 liPEhlIAyjO0xuH5Vvu6uioXNq+N0s0yDCXSJ4NmqRk6VZVGTLCfrkCuHTDkDgm9ZM
	 eeTwQ+wv7Tqyog1aY/KAeBtRr1DlEU6Yy72+A5ksv6Vdi+LmLwmuf4AEZnwW1t5Lca
	 GYaLTzfGj+YnA==
Date: Fri, 18 Sep 2026 15:35:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
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
Subject: Re: [PATCH v3 10/20] kbuild: move the toolchain checks into
 init/Kconfig.toolchain
Message-ID: <aq1MG8I1BsUUDFkx@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-10-9ecf4163ff36@kernel.org>
 <202609171149.6454DC6@keescook>
 <20260918010729.GB1585590@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918010729.GB1585590@ax162>
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

On Thu, Sep 17, 2026 at 06:07:29PM -0700, Nathan Chancellor wrote:
> On Thu, Sep 17, 2026 at 11:53:13AM -0700, Kees Cook wrote:
> > On Thu, Sep 17, 2026 at 05:06:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > Move them into their own file, sourced from the top of init/Kconfig, so
> > > that the next commit can add to them without growing init/Kconfig further.
> > >
> > > No functional change.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > ---
> > >  init/Kconfig           | 197 +-----------------------------------------------
> > >  init/Kconfig.toolchain | 198 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 199 insertions(+), 196 deletions(-)
> >
> > Yeah, totally right to move to a separate file. I think, however, I
> > would prefer this wasn't in init/ though. Kbuild uses scripts/ as its
> > Makefile.$topic dumping ground, and Kconfig.include also lives there. To
> > me, this new file should be scripts/Kconfig.toolchain instead. And
> > arguably, this should be included by the top-level Kconfig rather than
> > init/Kconfig...
> >
> > I defer to kbuild folks, though.
>
> We talked about this previously:
>
>   https://lore.kernel.org/aqPW1FsBVYHSWl1r@gremlin/
>
> I do feel like scripts/ is a better location given that these are really
> things internal to Kbuild but I also see where Lorenzo is coming from
> that scripts/ is a little weird for this to live for discoverability,
> especially if we want people to put checks here instead of in a Makefile
> directly. To be honest, it would be kind of nice to separate the Kbuild
> parts of scripts into their own directory to make it clear what Kbuild
> uses versus what users/contributors should use but that is obviously too
> big of a project to tackle as a prerequisite for this.

Yeah it just seemed really weird/surprising to me (in the sense of
'principle of least surprise') to put that in scripts/ and it doesn't seem
that traditionally anything else like this lives there.

But if you guys feel strongly enough I can put it there.

And agreed probably a 'third place' is the right way, but probably not
right as part of this series :)

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
