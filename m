Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CEAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcItXdVEtaajorsjRBhu5mQNgRstG/K/pLTpo9SxML4=; b=HpJq6CjAvcDyjJ
	1mxfdcT6rF3YEXdFBtU2lR33oD4SSLyPQb0GinXjGxmvx+5klK3gx3BgRKOn4YUHPpf38mmasqwWV
	/44iwteutS9QdlcvlwY31fLR4dkhSXOG43GTSGsO6ZjNxpIaJbBDz1KrzX32oTWLQktzzHIDgm67b
	sLe3Iz6mRhGETWH8EW7nxmH8PyrT8MQkdbjl4S+LTbjuoPXpwdKmZY3IRxBXHQWq5Dol4UCG7fsUp
	gljsowQCZQOz9N3sRjY58fcCs1g7mfD+I8VGa/JBM1Z57SPJ7WxF2rjQuEpKPW7ncvOfJtPt2B2YH
	lYyeVXVABG/m/WUpgoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8c06-004Z6K-Ln; Fri, 23 Dec 2022 06:57:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8c01-004Z1v-8J
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 06:57:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u19so10045941ejm.8
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 22:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yswg7rMmhxbBUpoVnt35yC1P/QAchcZKkUcdaMOuKIY=;
        b=Qp6FkpLML6AVjNhVUTui+QJ76pgWaEmNyndUMzVKcrLjfjKzFw9evUg1jnwwj+m9Jn
         nRVX8T97DZJK5R2RgPv3SnQW4PfCks7SFuIIk2LRmwLlzAy1FpV+yLZbinrnkuoW4bbF
         8Zwnj++7yponDy5YwLr9CW0Zcs8cccj9ERRoSmIhl+mb/ruX3Wk1OiShLreVoUkiRHXL
         GP5A1fy+PcSfr+4JgWHx5xCkYt4v1kmVfPC6KXEctO7ZXxPp6Ilm4zszX/XBJPx3nVD3
         pDDRghO6xGN36SSmX0GKaJJyxa266hJGUPdVUKFT5sEE1mC0+nq7qKxronrUj6wpF6ju
         AP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yswg7rMmhxbBUpoVnt35yC1P/QAchcZKkUcdaMOuKIY=;
        b=Ou+n6lp3ezyCUBnzoDjc6Bj1Buo2cC0SslkBJaiwL1ucHTeL/62g9FXgL781G/Cme7
         qzkEDVMcSQazUr90pKPEfNq9Fuy2TsBbx8LvCFnTaj8MnuY/vrm/HjSLM7j1wJWe+txc
         rtZ0oUrPVpeUlwv6nwoOxnOk4TZ7X0MNuwdxigG/pKjO3io15VgejSoMAqArDvKZWUto
         86fjIZLbHynJBkfJ9/0VNXGAbsVhVV7hEEGyKdQ87EqUCwRz8A9tZ//Zg0q5WELjVL9X
         ZY8FXtW8dxpycKVaSaYjXuldpzJJbSaNrmGDsAE2anGrFtsNtowUK8FabZl65czRS1o3
         tXOw==
X-Gm-Message-State: AFqh2kqv/P6jYDPb763olwSq1ZKWyVLRqwu9jsC6icPoaJPfDxSDE+l6
	eiAmPJGrK7M/5evhRswnFYTRRhOPHyrN42HJc1Q=
X-Google-Smtp-Source: AMrXdXvi65TdNtln+0GgUG2IhQZbLB02RGrVSF8kgdogr8WTpK8VbsOYnnE8p1dKjyAPUXkkbuVqOQpwtuxBZPdcBAE=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr702023eje.618.1671778660629; Thu, 22 Dec
 2022 22:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com> <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
 <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com>
 <CAEUhbmX6PE_E8PCEp4mo8Fpjtc-Pm-tmpxws0UKCp715qB+qRg@mail.gmail.com> <CAO8XFHvrbj86gcBpN7z7n_cGk2wLHND=t0k+QtYgzZGMQOLpsA@mail.gmail.com>
In-Reply-To: <CAO8XFHvrbj86gcBpN7z7n_cGk2wLHND=t0k+QtYgzZGMQOLpsA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 14:57:30 +0800
Message-ID: <CAEUhbmW-EH4tQr4sXQAJ6iuwO31iWEE=XQXpTMVBp8fX66LDxg@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Saleem Abdulrasool <abdulras@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_225745_384587_1CE1C107 
X-CRM114-Status: GOOD (  44.44  )
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

Hi,

On Thu, Dec 22, 2022 at 11:23 PM Saleem Abdulrasool <abdulras@google.com> wrote:
>
> On Thu, Dec 22, 2022 at 1:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi,
> >
> > On Thu, Dec 22, 2022 at 1:39 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > >
> > > On Wed, Dec 21, 2022 at 8:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > > > >
> > > > > The compiler is free to generate vectorized operations for zero'ing
> > > > > memory.  The kernel does not use the vector unit on RISCV, similar to
> > > > > architectures such as x86 where we use `-mno-mmx` et al to prevent the
> > > > > implicit vectorization.  Perform a similar check for
> > > > > `-mno-implicit-float` to avoid this on RISC-V targets.
> > > > >
> > > > > Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> > > > > ---
> > > > >  arch/riscv/Makefile | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > index 0d13b597cb55..68433476a96e 100644
> > > > > --- a/arch/riscv/Makefile
> > > > > +++ b/arch/riscv/Makefile
> > > > > @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> > > > >  # architectures.  It's faster to have GCC emit only aligned accesses.
> > > > >  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> > > > >
> > > > > +# Ensure that we do not vectorize the kernel code when the `v` extension is
> > > > > +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> > > > > +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
> > > >
> > > > This looks like an LLVM flag, but not GCC.
> > >
> > > Correct, this is a clang flag, though I imagine that GCC will need a
> > > similar flag once it receives support for the V extension.
> > >
> > > > Can you elaborate what exact combination (compiler flag and source)
> > > > would cause an issue?
> > >
> > > The particular case that I was using was simply `clang -target
> > > riscv64-unknown-linux-musl -march=rv64gcv` off of main.
> > >
> > > > From your description, I guess it's that when enabling V extension in
> > > > LLVM, the compiler tries to use vector instructions to zero memory,
> > > > correct?
> > >
> > > Correct.
> >
> > Thanks for the confirmation.
> >
> > >
> > > > Can you confirm LLVM does not emit any float instructions (like F/D
> > > > extensions) because the flag name suggests something like "float"?
> > >
> > > The `-mno-implicit-float` should disable any such emission.  I assume
> > > that you are worried about the case without the flag?  I'm not 100%
> > > certain without this flag, but the RISCV build with this flag has been
> > > running smoothly locally for a while.
> > >
> > >
> >
> > I still have some questions about the `-mno-implicit-float` option's behavior.
> >
> > - If this option is not on, does the compiler emit any F/D extension
> > instruction for zero'ing memory when -march=rv64g? I want to know
> > whether the `-mno-implicit-float` option only takes effect when "v"
> > appears on the -march string.
>
> AFAIK, and from a quick test, no, it will not.  That also makes sense
> since the F/D/Q handling is not as likely to be useful for generating
> a 0-filled array.  No, the use of `-mno-implicit-float` is not guarded
> by the use of the vector extension, but it does only impact the
> vectorized code generation (the loop vectorizer, load/store
> vectorizer, and SLP vectorizer).

Thank you. The quick test you did seems to match what the LLVM commit [1] says:

    "It also disables implicit uses of scalar FP, but I don't know if
we have any of those for RISC-V."

[1] https://github.com/llvm/llvm-project/commit/549231d38e10de7371adb85f5452d42ad42f4201

>
> > - If the answer to the above question is no, I wonder why the option
> > is called `-mno-implicit-float` as float suggests the FPU usage, but
> > actually it is about vectorization. The Clang documentation says
> > almost nothing about this option.
>
> The flag itself is from GCC, it was added for the ARM architecture, to
> prefer using the scalar core over the VFP register set as ARM uses the
> VFP for vectorized operations.  As it so happens, internally in LLVM,
> the loop vectorizer uses the (internal) `NoImplicitFloat` function
> attribute to prevent the loop from being vectorized, and the flag that
> controls this is exposed as `-mimplicit-float` and
> `-mno-implicit-float`.
>

It seems GCC does not have such a flag. Thanks for the history
introduction. It was introduced on Arm to disable vectorized operation
using VFP, hence it was named as -no-implict-float. But IMHO the
option is badly named. Maybe -no-implicit-vectorization better fits
what it really does.

FWIW,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
