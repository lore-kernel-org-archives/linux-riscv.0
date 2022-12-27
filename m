Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQAfBZbOBtvN5wwtNV7EIIVeXa9151RNe0AOVyspi+Y=; b=eWt5ylXgoziDob
	KgxpA7RMJbOOq6HfYYqLuAQ6jaAi9hB5cyGqz93+FXxvc+psjiVnX07KweKw21Nm8uiPpxBDfqMPp
	07KXGMSlgpxaZS1GDzgNS6+lA25cmIhSxwHjTS6SWnS8/LPbLj2iFNLzlKXNZhBvRPg3ooYQFAHH2
	UAhKeHr8i7lPP5kp7XtrwCq0I4fRN7+0yw49blXfOZ0JM1snkVXrmS64+jUVVneuuB1ni/rOlvRwA
	sxepMAMggbKN1zg+/IaOaqoQ/uKeLVG0u2Wa6fUg6k+2qX4bx12W3qYy1VJV6Xd3pV9zf/Gsr3o4n
	DpS34TwBLgsAATz2rEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pABrJ-00E1Ak-LH; Tue, 27 Dec 2022 15:27:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pABoP-00DzrQ-Mt
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 15:24:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso9507010wmp.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 07:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5v670RnvXQHaK7BPqiIorVRaX1GKbnuWfqnGGHIrUc=;
        b=KWtwIE/xKjJGRYwgHdjbJ5oEzE297qgQsTfpzrqj12loSnHqlNKP1boQLyH7R60JR3
         la78PHUE2+17kraDPhWdaJ5BP5bWtz4vRzQXO/yEp0OXN9EBNmn9xLt1fB338+WYK3np
         Sj8ULTe7gLrKgI+m719GD6Tr9/QUt0rNo39poULiwdEES6STbJUvH0JxS3QBWXB8bv9o
         3YHdML0W28K69r+1vyvZPbAwqcVK9EzyOj1tsu2rD24hVzm4I17POvf8OiviWyuA2vUG
         Br/xZQEmaulbVqREv02ootcl4vxuvqxNaKRwwnV9TXLLCPU5RDprNHi+zfe4bAJCE598
         cV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5v670RnvXQHaK7BPqiIorVRaX1GKbnuWfqnGGHIrUc=;
        b=i+QDXc8zQht+RlCA/YDx93LMUe9kXUNW74fWfBY7exxvG4kVCXC3JIB8rX8uPdt3xV
         zldZoghlqzoTUZZ3EmwYpyvU0/KqOdhSsaIEICsSTIhGBbtI9ilIY3S9UNJHkq8pOE9e
         3juk4jDSnOtLmAMQRbP7g9jpVtbjDm0lIR9oeIYqrLQBpcWovIYxdlEyDmH5J3dOar0E
         WYPjuvgeu6QSUQm6sJHQxEldt+DM/Ueoad7i8CxfpA+baXL0Kno1yiYbniwhMKJgy9rK
         nwl1L26M277/7nzROBJaeXDxr4rpZ+it1QCj0jM3nVchSPyzoVQr1oE5oNlIV0EraoO1
         TdLw==
X-Gm-Message-State: AFqh2kpGVWkYl6SGlc56/Kxu2aOz4biAwC3qV2diiCxgCDnYKqBHZOsp
	zi1u4L2bQtOqyvYU7yl6vYrNw+C7/I6Wc+Ne6J52Fw==
X-Google-Smtp-Source: AMrXdXuSzwDoJ6X1Bn+x9aZGRPKQGOV8eYes2ofQx8kntRsc5q0KLBhVUSL9B/zcJemMH05hBJCv15ApC7D4l1DTnoo=
X-Received: by 2002:a05:600c:1c86:b0:3cf:71e4:75b with SMTP id
 k6-20020a05600c1c8600b003cf71e4075bmr1650214wms.114.1672154652376; Tue, 27
 Dec 2022 07:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com> <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
 <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com>
 <CAEUhbmX6PE_E8PCEp4mo8Fpjtc-Pm-tmpxws0UKCp715qB+qRg@mail.gmail.com>
 <CAO8XFHvrbj86gcBpN7z7n_cGk2wLHND=t0k+QtYgzZGMQOLpsA@mail.gmail.com> <CAEUhbmW-EH4tQr4sXQAJ6iuwO31iWEE=XQXpTMVBp8fX66LDxg@mail.gmail.com>
In-Reply-To: <CAEUhbmW-EH4tQr4sXQAJ6iuwO31iWEE=XQXpTMVBp8fX66LDxg@mail.gmail.com>
From: Saleem Abdulrasool <abdulras@google.com>
Date: Tue, 27 Dec 2022 07:24:00 -0800
Message-ID: <CAO8XFHsjciBKho-9Kzw7v8anBZm1+DD5ZnMLmhZNxUUYZTU-FQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_072417_877015_F56D295C 
X-CRM114-Status: GOOD (  48.19  )
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

On Thu, Dec 22, 2022 at 10:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Thu, Dec 22, 2022 at 11:23 PM Saleem Abdulrasool <abdulras@google.com> wrote:
> >
> > On Thu, Dec 22, 2022 at 1:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Dec 22, 2022 at 1:39 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > > >
> > > > On Wed, Dec 21, 2022 at 8:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > > > > >
> > > > > > The compiler is free to generate vectorized operations for zero'ing
> > > > > > memory.  The kernel does not use the vector unit on RISCV, similar to
> > > > > > architectures such as x86 where we use `-mno-mmx` et al to prevent the
> > > > > > implicit vectorization.  Perform a similar check for
> > > > > > `-mno-implicit-float` to avoid this on RISC-V targets.
> > > > > >
> > > > > > Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> > > > > > ---
> > > > > >  arch/riscv/Makefile | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > > index 0d13b597cb55..68433476a96e 100644
> > > > > > --- a/arch/riscv/Makefile
> > > > > > +++ b/arch/riscv/Makefile
> > > > > > @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> > > > > >  # architectures.  It's faster to have GCC emit only aligned accesses.
> > > > > >  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> > > > > >
> > > > > > +# Ensure that we do not vectorize the kernel code when the `v` extension is
> > > > > > +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> > > > > > +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
> > > > >
> > > > > This looks like an LLVM flag, but not GCC.
> > > >
> > > > Correct, this is a clang flag, though I imagine that GCC will need a
> > > > similar flag once it receives support for the V extension.
> > > >
> > > > > Can you elaborate what exact combination (compiler flag and source)
> > > > > would cause an issue?
> > > >
> > > > The particular case that I was using was simply `clang -target
> > > > riscv64-unknown-linux-musl -march=rv64gcv` off of main.
> > > >
> > > > > From your description, I guess it's that when enabling V extension in
> > > > > LLVM, the compiler tries to use vector instructions to zero memory,
> > > > > correct?
> > > >
> > > > Correct.
> > >
> > > Thanks for the confirmation.
> > >
> > > >
> > > > > Can you confirm LLVM does not emit any float instructions (like F/D
> > > > > extensions) because the flag name suggests something like "float"?
> > > >
> > > > The `-mno-implicit-float` should disable any such emission.  I assume
> > > > that you are worried about the case without the flag?  I'm not 100%
> > > > certain without this flag, but the RISCV build with this flag has been
> > > > running smoothly locally for a while.
> > > >
> > > >
> > >
> > > I still have some questions about the `-mno-implicit-float` option's behavior.
> > >
> > > - If this option is not on, does the compiler emit any F/D extension
> > > instruction for zero'ing memory when -march=rv64g? I want to know
> > > whether the `-mno-implicit-float` option only takes effect when "v"
> > > appears on the -march string.
> >
> > AFAIK, and from a quick test, no, it will not.  That also makes sense
> > since the F/D/Q handling is not as likely to be useful for generating
> > a 0-filled array.  No, the use of `-mno-implicit-float` is not guarded
> > by the use of the vector extension, but it does only impact the
> > vectorized code generation (the loop vectorizer, load/store
> > vectorizer, and SLP vectorizer).
>
> Thank you. The quick test you did seems to match what the LLVM commit [1] says:
>
>     "It also disables implicit uses of scalar FP, but I don't know if
> we have any of those for RISC-V."
>
> [1] https://github.com/llvm/llvm-project/commit/549231d38e10de7371adb85f5452d42ad42f4201
>
> >
> > > - If the answer to the above question is no, I wonder why the option
> > > is called `-mno-implicit-float` as float suggests the FPU usage, but
> > > actually it is about vectorization. The Clang documentation says
> > > almost nothing about this option.
> >
> > The flag itself is from GCC, it was added for the ARM architecture, to
> > prefer using the scalar core over the VFP register set as ARM uses the
> > VFP for vectorized operations.  As it so happens, internally in LLVM,
> > the loop vectorizer uses the (internal) `NoImplicitFloat` function
> > attribute to prevent the loop from being vectorized, and the flag that
> > controls this is exposed as `-mimplicit-float` and
> > `-mno-implicit-float`.
> >
>
> It seems GCC does not have such a flag. Thanks for the history
> introduction. It was introduced on Arm to disable vectorized operation
> using VFP, hence it was named as -no-implict-float. But IMHO the
> option is badly named. Maybe -no-implicit-vectorization better fits
> what it really does.

The option is present on ARM GCC, but not RISC-V GCC.  Sure, the
option could be better named - personally, I'd prefer
`-mgeneral-regs-only` to match the x86 convention which leaves it
sufficiently generalised that future extensions would easily fit into
the behavioural control.  Much like the Linux kernel's prime
directive: "we do not break userspace'', the LLVM toolchain has a
similar view point: options which have shipped are considered
permanent.  Even if renamed, it would be an alias and the old option
sticks around in near perpetuity.

> FWIW,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Regards,
> Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
