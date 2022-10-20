Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5402C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bdykvb7jZjjD5r0gOL+OEhReQu/AHYNGgRC1ph/+OJ0=; b=qaR6RhXAJad6iA
	BA79VS6OnAFsQog5W5tdsJIcUbkbIRyU2hlcjLSRx60cLeeMlDY+9/xWhFF7TJSj0SMl1jjsyLAoh
	k5PvR97fAKXtNFimmkxfR54L7RQ9O1tkG3SAEkm0Sb8C3jytK1VJPXw/eMRtSSCPepoiLBjsITvco
	+qWotCK5hT2p6cPlqjvG22Qqwu4sUybB8NCVfxUBNX8t9EbB7K2oX2QbCc9Azf1UVmrj43z2h+Rxh
	zlHiS9p8X/N5cnXHAdWTrSFvtHT64FE9uulbq9o2THu8Kxi9RqmN/MOvma3dta+GOIKei50TgaQit
	XJvi9kEcnPTD7eSkFSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olV0H-00F2nB-Ob; Thu, 20 Oct 2022 12:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUgC-00En9K-E9
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 12:29:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDCCA61B50
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 12:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B299AC4314F
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666268982;
	bh=UmMmPdClNg1iQDMWEWV9haE2T0LxMvQ9tZrDoXCBYo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MEfjHFy9IjCP7buSekEgL1dlGnUtqlTjnGc/q1dTIIDKQv0uf0qjS7CxNd3l8EB6J
	 2GNzCTHJIHOS8VN187wDQDCMY2iqEjLgjGx1qCtlusqm6jpodnpS3t3oWP7zr6AYNq
	 UEzhL5dWMhhdVKCFkmkfLcfRjIPJrFoQdp6J00szZ/2HtTnIdH1fHRXi298ggf93mp
	 22oa5u+mRMglmJ1n+asHS7yqiYMY5/K+VEURZQXecucwx6LEFR6n8XMh0aVAzyJgR6
	 6iMMRZzKUnyGZkdB8JE+Eg6ZvcSoNvNWQhtURvaQOsdqV/y+d1nrYLMvKa7N6ZWJAS
	 JjIZYABcXGdmA==
Received: by mail-ot1-f53.google.com with SMTP id v40-20020a056830092800b00661e37421c2so9110457ott.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 05:29:42 -0700 (PDT)
X-Gm-Message-State: ACrzQf3jZVPsGsH6LMD/O8Qfn379PdcgGarCB3KyeZPc8yrTQKcfld6D
	L3oonrkVHVxPfpFww/6KL582hmtnxCF16N+Xy98=
X-Google-Smtp-Source: AMsMyM5gCGTTh54jnxdirFtIVTdFINnQG/9tf0drJtT/lwsLNSHciyP4H6XwE+c8o6/CC6J8KKKz8XrQWvspHXqgvHo=
X-Received: by 2002:a9d:3634:0:b0:661:a991:7c57 with SMTP id
 w49-20020a9d3634000000b00661a9917c57mr6495888otb.308.1666268981727; Thu, 20
 Oct 2022 05:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N> <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
In-Reply-To: <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Oct 2022 20:29:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
Message-ID: <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for noinstr
To: Mark Rutland <mark.rutland@arm.com>, Lai Jiangshan <laijs@linux.alibaba.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, chenzhongjin@huawei.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Borislav Petkov <bp@alien8.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_052944_607758_58D0ADBA 
X-CRM114-Status: GOOD (  26.04  )
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

Hi Mark and Lai,

On Thu, Oct 20, 2022 at 5:15 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Oct 08, 2022 at 09:54:39AM +0800, Guo Ren wrote:
> > On Mon, Oct 3, 2022 at 7:39 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > On Sat, Oct 01, 2022 at 09:24:44PM -0400, guoren@kernel.org wrote:
> > > > From: Lai Jiangshan <laijs@linux.alibaba.com>
> > > >
> > > > And it will be extended for C entry code.
> > > >
> > > > Cc: Borislav Petkov <bp@alien8.de>
> > > > Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> > > > ---
> > > >  include/linux/compiler_types.h | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > > > index 4f2a819fd60a..e9ce11ea4d8b 100644
> > > > --- a/include/linux/compiler_types.h
> > > > +++ b/include/linux/compiler_types.h
> > > > @@ -227,9 +227,11 @@ struct ftrace_likely_data {
> > > >  #endif
> > > >
> > > >  /* Section for code which can't be instrumented at all */
> > > > -#define noinstr                                                              \
> > > > -     noinline notrace __attribute((__section__(".noinstr.text")))    \
> > > > -     __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
> > > > +#define __noinstr_section(section)                           \
> > > > +     noinline notrace __section(section) __no_profile        \
> > > > +     __no_kcsan __no_sanitize_address __no_sanitize_coverage
> > > > +
> > > > +#define noinstr __noinstr_section(".noinstr.text")
> > >
> > > One thing proably worth noting here is that while KPROBES will avoid
> > > instrumenting `.noinstr.text`, that won't happen automatically for other
> > > __noinstr_section() sections, and that will need to be inhibited through other
> > > means (e.g. the kprobes blacklist, explicit NOKPROBE_SYMBOL() annotation, or
> > > otherwise).
> >
> > In riscv, "we select HAVE_KPROBES if !XIP_KERNEL", so don't worry
> > about that. I don't think we could enable kprobe for XIP_KERNEL in the
> > future.
>
> Sure; but someone else might use __noinstr_section() elsewhere where this could
> matter, and I was suggesting that we could add a comment as above.
Okay, how about:

/* Be care KPROBES will avoid instrumenting .noinstr.text, not
__noinstr_section(). */
#define __noinstr_section(section)                             \
       noinline notrace __section(section) __no_profile        \
       __no_kcsan __no_sanitize_address __no_sanitize_coverage

/* Section for code which can't be instrumented at all */
#define noinstr __noinstr_section(".noinstr.text")

>
> Thanks,
> Mark.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
