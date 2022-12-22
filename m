Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695F8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe8KM5cswjsEZ48CiQgsBEGnpUDmoFQKvpID+GJv600=; b=Hkpm5JwCjC2O2E
	ZU5F80J4RnGDMn2BEoyO6i+KSTzkFGILejCCTr0X/NB99DuQioKgzoVajlmNMURobGog4W3ND+nah
	mDfIfneyUTAcG6Y8po0r3RU3vYWsKYIVmQj6zFgetWvCxI9OHI9LwSziQy7eZNt8cwp9uWaEuRr0n
	iOJTlVNb0FDRwdKZASFJntjbYS8j3uiZP4uEOoBelp7CpiHEW+CKk4/sjtVxvdOqM0qRT8dGNLEA1
	4tekh0a1ztUqElAF67Xb2IMFXPQcpA9c9cy2lKLj6qDV2zjoLHC423fmRSlxrfZCnth3I7j+fxBbP
	vMiL1bF8iJGhDLg194UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NXj-00DXZx-7u; Thu, 22 Dec 2022 15:31:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NQM-00DTEe-UW
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 15:24:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l26so74775wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=is8eOCOUHh28WCvnVkZFiUBMmSnyVVi5EENP2Q9yDrQ=;
        b=e3zjxSILoAIDIfAytzMAfpjBCocaoXQXsl0FxH7xFOeaqnr0pNBnBwAM1lTUCs5zkK
         vv+9o0GtlWFvdXt/0rZrXtjsGc8h4651EHPub2AA+3u4Q+UjIfeO6+61dCqfaV7FvsoQ
         mOAse3Nc0o3rmP4k7XAHcwlAcHspEBBCGYv5rja7KZJ5od8kusnTJjRlTkaDC/m+Fi8O
         6ImxHM+LzjM39rxUC0OjOX6usp1rYgMhEgKzQ+NAHCDqeEQOg8AIZqbtJkU74kJao7gS
         URsoClthBsw3ctdnTkJqkGWy5oKUqsj0Y8gtxJGRr9GrwVd5k/90bA5s4bxAEZ6Md9Fp
         +BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is8eOCOUHh28WCvnVkZFiUBMmSnyVVi5EENP2Q9yDrQ=;
        b=RqSYUK7xCGIaQMIQx85s6q9QkK86401O+I5A5nn3jYU5IBSlSYDmSjTwCpgTMBH+1j
         xOHAsI1AhWb5jwHNSyxKMJzI+FJ1j0+vUTuyYGF27wsXTQctGpMahYBxHmyS41e4TuuP
         Vrgn7ASiX/TvSVBLLlptrCKLe66mD+bR/qCBGcLCgtshcKB66xDWcWDA4EGsHFlboVdY
         lZXRvbg7m8GHg7Ez19X13LtYO+Pm948EC32+GXTtzy9jjlWaGSxQWlmOLn1WXwSXyD6P
         hJy1oC1832Dtrt+eFoMdbtskCvVwpy5TFZvFvUQzv1Zmsm7Av+ThVwB5M+ubSqBj58OY
         9w3w==
X-Gm-Message-State: AFqh2kpi3iSI8oQbCSBj7JUVq9fPnvEUJjdOHIXk79YVHHNkzhElHvDk
	0+RZ0uGF1Zz6Tx/zVkX3ZqIiSYM2wkbsL2/UboYKrw==
X-Google-Smtp-Source: AMrXdXsAAFbAwoPzz/qvyF2/Muv5x34+WYbFLi7B70fteIj56XO/l9ZeYPsFop03LFnIMCOc8cQgkmac2q17NZy0LjU=
X-Received: by 2002:a7b:cd94:0:b0:3d3:4b1a:974b with SMTP id
 y20-20020a7bcd94000000b003d34b1a974bmr577660wmj.113.1671722635094; Thu, 22
 Dec 2022 07:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com> <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
 <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com> <CAEUhbmX6PE_E8PCEp4mo8Fpjtc-Pm-tmpxws0UKCp715qB+qRg@mail.gmail.com>
In-Reply-To: <CAEUhbmX6PE_E8PCEp4mo8Fpjtc-Pm-tmpxws0UKCp715qB+qRg@mail.gmail.com>
From: Saleem Abdulrasool <abdulras@google.com>
Date: Thu, 22 Dec 2022 07:23:43 -0800
Message-ID: <CAO8XFHvrbj86gcBpN7z7n_cGk2wLHND=t0k+QtYgzZGMQOLpsA@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_072359_168010_C0E93B9D 
X-CRM114-Status: GOOD (  40.42  )
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

On Thu, Dec 22, 2022 at 1:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Thu, Dec 22, 2022 at 1:39 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> >
> > On Wed, Dec 21, 2022 at 8:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > > >
> > > > The compiler is free to generate vectorized operations for zero'ing
> > > > memory.  The kernel does not use the vector unit on RISCV, similar to
> > > > architectures such as x86 where we use `-mno-mmx` et al to prevent the
> > > > implicit vectorization.  Perform a similar check for
> > > > `-mno-implicit-float` to avoid this on RISC-V targets.
> > > >
> > > > Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> > > > ---
> > > >  arch/riscv/Makefile | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > index 0d13b597cb55..68433476a96e 100644
> > > > --- a/arch/riscv/Makefile
> > > > +++ b/arch/riscv/Makefile
> > > > @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> > > >  # architectures.  It's faster to have GCC emit only aligned accesses.
> > > >  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> > > >
> > > > +# Ensure that we do not vectorize the kernel code when the `v` extension is
> > > > +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> > > > +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
> > >
> > > This looks like an LLVM flag, but not GCC.
> >
> > Correct, this is a clang flag, though I imagine that GCC will need a
> > similar flag once it receives support for the V extension.
> >
> > > Can you elaborate what exact combination (compiler flag and source)
> > > would cause an issue?
> >
> > The particular case that I was using was simply `clang -target
> > riscv64-unknown-linux-musl -march=rv64gcv` off of main.
> >
> > > From your description, I guess it's that when enabling V extension in
> > > LLVM, the compiler tries to use vector instructions to zero memory,
> > > correct?
> >
> > Correct.
>
> Thanks for the confirmation.
>
> >
> > > Can you confirm LLVM does not emit any float instructions (like F/D
> > > extensions) because the flag name suggests something like "float"?
> >
> > The `-mno-implicit-float` should disable any such emission.  I assume
> > that you are worried about the case without the flag?  I'm not 100%
> > certain without this flag, but the RISCV build with this flag has been
> > running smoothly locally for a while.
> >
> >
>
> I still have some questions about the `-mno-implicit-float` option's behavior.
>
> - If this option is not on, does the compiler emit any F/D extension
> instruction for zero'ing memory when -march=rv64g? I want to know
> whether the `-mno-implicit-float` option only takes effect when "v"
> appears on the -march string.

AFAIK, and from a quick test, no, it will not.  That also makes sense
since the F/D/Q handling is not as likely to be useful for generating
a 0-filled array.  No, the use of `-mno-implicit-float` is not guarded
by the use of the vector extension, but it does only impact the
vectorized code generation (the loop vectorizer, load/store
vectorizer, and SLP vectorizer).

> - If the answer to the above question is no, I wonder why the option
> is called `-mno-implicit-float` as float suggests the FPU usage, but
> actually it is about vectorization. The Clang documentation says
> almost nothing about this option.

The flag itself is from GCC, it was added for the ARM architecture, to
prefer using the scalar core over the VFP register set as ARM uses the
VFP for vectorized operations.  As it so happens, internally in LLVM,
the loop vectorizer uses the (internal) `NoImplicitFloat` function
attribute to prevent the loop from being vectorized, and the flag that
controls this is exposed as `-mimplicit-float` and
`-mno-implicit-float`.

> > > > +
> > > >  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> > > >  prepare: stack_protector_prepare
> > > >  stack_protector_prepare: prepare0
> > > > --
>
> Regards,
> Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
