Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B99C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oA9fkrL/IXmNmc8hTXmm8wjm2sJsuUc70fszGNGcF+w=; b=xLWilC9t1uElk3
	zpP+iqkFhQSFYkSNK+e7FaI+fEOaRuhyOQlVmTEYPh34AiMCDft4PZLLBMnQpBM/Y75wjV5MiucLG
	7qGa7eGJBbNa4VunaeYr2lCly0prcgjFGHmWSpnRQfh5GQz43P/uXxvs4xA1t88WBxFeConzi12ue
	mjmpbry2Vu0H/jTBlAob7zqVPikSWaHhxBilD7IJQFz+/b9H6Lr7lw0Qyb1jdHGugtF77kq2HY63Q
	mWNBwVOQ/jEkg7tUHjc/xfgtHZSc6ALoS7rRJAKfbvFdgos7RDjk0xvMYZADQyB4FdbiOfoLWDMQQ
	1QDiZ31gdGZYB8w4VIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I4w-00A3vf-H4; Thu, 22 Dec 2022 09:41:30 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I4V-00A3o2-7z
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 09:41:04 +0000
Received: by mail-ej1-x630.google.com with SMTP id tz12so3564375ejc.9
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5sljJc4I7u6hP7ibi4k54gj9SUSXUqTx/yNLLzCW5g=;
        b=O82v71gHFwz87qQJ6ygWvpIa8c8tKKIAbowaSnSYoWYqvo+4GQzq25o+VykzKvGF4O
         U9Vp1MmiGD1TqMeF+jzthu2CtWoI4a1i4hy/qXeL1gLA4dJlivXa2tXYPuyzCAiemNs7
         J/iibWlAP4fVuWZycAITlPgk2A/TlO6OLOjCbqNcvQ42eHOadcCCcyltT4ltCoF1TS+s
         WveVh6DfouxUdVQMx6PMKZfxDoErywjMwDz2tT5JXMyWv/z/JBonexQazvFpUQeP3gKQ
         HfxDN7ArHvNyhQHW7J4zLHr8r8J9fbKdnqv/MCUxysacJ3Ge3xoIHnPSHU6ROzbdQWXW
         yh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5sljJc4I7u6hP7ibi4k54gj9SUSXUqTx/yNLLzCW5g=;
        b=fOBYswe3hsJXMp0bdM+QL7Q1nyYD98bLwT6xJqPD2fKuBKSlkfYQGfNgqohb3RPKUU
         U1fb8brqDyOLZxU47p65OLJSPWqnkf1tTQWHbKjomVFQv+8Ma86wheu7+DF7ljzlsaI5
         kET8eK84j0l+QhYE0TU8t8IxEDCti+o7NhPUq0OlfRvCuud7D+SOb2Q1gJLr+V8XNnEt
         s8lwT2PkI3rULI6q5nRsiKthVsMa9d8pQL7DM8hJWnA2D42sSzxF65D5++yypBg/lQYb
         vTTrdAhNG7lclXmVmmyAK1NX5Zt2jtlrKvHrn6A4QKKC4tNwyX+4Iq5520BgQMNl8yH3
         i2Fg==
X-Gm-Message-State: AFqh2kpFyXpb7WlkLaGs4EVLU6v0EiVe3tMti1p9+4M+lI6C79Sigah+
	pcU5uPtXw0WUnLgOIw57SKDFHbAGBq7NbZcmAeE=
X-Google-Smtp-Source: AMrXdXtw+ao2n/b9tn3M3QtnM8+Y7ro93LfJirJJUBkOaUE2OomJOpQ2qCq5uD5uUsjx4EgJEGnXmKPhhnzM46uDkKA=
X-Received: by 2002:a17:906:68c9:b0:7c1:a0d:dd2c with SMTP id
 y9-20020a17090668c900b007c10a0ddd2cmr536671ejr.26.1671702060751; Thu, 22 Dec
 2022 01:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com> <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
 <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com>
In-Reply-To: <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Dec 2022 17:40:50 +0800
Message-ID: <CAEUhbmX6PE_E8PCEp4mo8Fpjtc-Pm-tmpxws0UKCp715qB+qRg@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Saleem Abdulrasool <abdulras@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_014103_396178_709FBE69 
X-CRM114-Status: GOOD (  34.33  )
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

On Thu, Dec 22, 2022 at 1:39 AM Saleem Abdulrasool <abdulras@google.com> wrote:
>
> On Wed, Dec 21, 2022 at 8:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi,
> >
> > On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> > >
> > > The compiler is free to generate vectorized operations for zero'ing
> > > memory.  The kernel does not use the vector unit on RISCV, similar to
> > > architectures such as x86 where we use `-mno-mmx` et al to prevent the
> > > implicit vectorization.  Perform a similar check for
> > > `-mno-implicit-float` to avoid this on RISC-V targets.
> > >
> > > Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> > > ---
> > >  arch/riscv/Makefile | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 0d13b597cb55..68433476a96e 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> > >  # architectures.  It's faster to have GCC emit only aligned accesses.
> > >  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> > >
> > > +# Ensure that we do not vectorize the kernel code when the `v` extension is
> > > +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> > > +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
> >
> > This looks like an LLVM flag, but not GCC.
>
> Correct, this is a clang flag, though I imagine that GCC will need a
> similar flag once it receives support for the V extension.
>
> > Can you elaborate what exact combination (compiler flag and source)
> > would cause an issue?
>
> The particular case that I was using was simply `clang -target
> riscv64-unknown-linux-musl -march=rv64gcv` off of main.
>
> > From your description, I guess it's that when enabling V extension in
> > LLVM, the compiler tries to use vector instructions to zero memory,
> > correct?
>
> Correct.

Thanks for the confirmation.

>
> > Can you confirm LLVM does not emit any float instructions (like F/D
> > extensions) because the flag name suggests something like "float"?
>
> The `-mno-implicit-float` should disable any such emission.  I assume
> that you are worried about the case without the flag?  I'm not 100%
> certain without this flag, but the RISCV build with this flag has been
> running smoothly locally for a while.
>
>

I still have some questions about the `-mno-implicit-float` option's behavior.

- If this option is not on, does the compiler emit any F/D extension
instruction for zero'ing memory when -march=rv64g? I want to know
whether the `-mno-implicit-float` option only takes effect when "v"
appears on the -march string.
- If the answer to the above question is no, I wonder why the option
is called `-mno-implicit-float` as float suggests the FPU usage, but
actually it is about vectorization. The Clang documentation says
almost nothing about this option.

> > > +
> > >  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> > >  prepare: stack_protector_prepare
> > >  stack_protector_prepare: prepare0
> > > --

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
