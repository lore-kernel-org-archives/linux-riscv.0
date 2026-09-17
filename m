Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0508AC982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1Fc47GY8j03QhWISOgqQBoKUE74/53j9KvVrCI+Cck=; b=oeHxwOjNaiRG7m
	ZoAcBjCL+EiwCgGHuIAnUK/BpYUK3+Bhvin17h4ts/uWT31zDPvrf+rwr5CxRxFvkgAZO5YkRebrD
	ZLc54zzkH3U6yiHptSyyyLZY/gvG/vFIxiQ+T833td4hfSeSVkocDOoEu/9DZ0XrPPsGeUz0IDmIF
	LR6s6RMDBlHuzam/UscNoh2j8Kh4rfi5bBbWDwY+RicZ3sP0c6jFn9GP9wKjf9QGkJwUMVlK2iG3q
	8FC2k+IfORZ7Etrw0+dIlrW9pd3SwBM8yM2BdKEBAsu+KRl8amNxC0uFgb6Y1wyMQM8DlpMj5DdAJ
	47AgjnVrRCScheV12AXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G7B-0000000C71u-0cOt;
	Thu, 17 Sep 2026 17:41:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G79-0000000C71g-1R08;
	Thu, 17 Sep 2026 17:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BBAA434B1;
	Thu, 17 Sep 2026 17:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7202C1F00893;
	Thu, 17 Sep 2026 17:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666899;
	bh=vt7xldXW981Vs/3xttM71tth11TJJOnWXjFdN8oXwIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WB36KjOw/OL//N6jizHXsujpBTjNAWiAAoaPnfaeh/XOIirkqmGVTj/UH7olmLVri
	 GKKQQaqqIRE37gED19mdnpY+mDoOsgNbElRud0418CSQkGSF7mXE0BDc0b7WRjtSYs
	 4icfPjYTE9W1OI4NrzDPHN0M+jAgLG76KOhQ2ESZtKMON8MQvL3/O7xV9SCPakYhDw
	 O3jmy/4A1f3c20HNr0x08yqHyE2OZydqYtgvI53JK/ODOcIWr3wSqTnp5PPj/Jk2Zl
	 2oV1GJ3YELEFDXW6y73rX076iLwzGzB9BGV30bF0eZlFgY+AZOHFHV0HUISkJXQlV0
	 VPjicpdcQKK3w==
Date: Thu, 17 Sep 2026 18:41:23 +0100
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
Subject: Re: [PATCH v3 01/20] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <aqwl59TrUqugElwk@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
 <202609170950.480F90A28@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609170950.480F90A28@keescook>
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

On Thu, Sep 17, 2026 at 09:52:32AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:11PM +0100, Lorenzo Stoakes (ARM) wrote:
> > -# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
> > -# tools that expect vmlinux to have sufficiently aligned sections but the
> > -# additional bytes used for padding .modinfo to satisfy this requirement break
> > -# certain versions of kmod with
> > -#
> > -#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> > -#
> > -# Strip the trailing padding bytes after extracting .modinfo to comply with
> > -# what kmod expects to parse.
>
> This comment still seems useful here (afaict the stripping is still
> happening with the "sed"). Maybe better to leave it, or future readers
> are left wondering what the sed is for?

Ack will restore!

>
> >  quiet_cmd_modules_builtin_modinfo = GEN     $@
> > -      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> > -                                    sed -i 's/\x00\+$$/\x00/g' $@; \
> > -                                    chmod -x $@
> > -
> > -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> > +      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< $@.tmp; \
> > +                                    rm -f $@.tmp; \
> > +                                    sed -i 's/\x00\+$$/\x00/g' $@
>
> Otherwise, looks good. With the comment back (or rewritten):
>
> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks!

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
