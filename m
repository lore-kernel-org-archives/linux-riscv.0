Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED96C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/F9DLc6fCIKYA+47iFyF79p6BiM5D3kfLQ4LlWBh4c=; b=3w5S0q0Lqx7xs1
	PS8hF4w8sy78j2MzlqCmMQ/V6eshNXrvBZ3OF3OUmXBEeBv+yHCbNfLBGDO3VblTr/lBeGZVQdMVU
	emuh+7RZyT2UMlC3R/OLyHPXzg1nKfTzmIzNT+s+N43LaIHq/RZkbj18XvFqpnkvixh4XXM1DRrk7
	rpV4OXExIuutt9RhfG7bWF65R4t0Sg0twiclGCkbSA9njdXQPpxXusmKMqA62vnbeToG6eJLoAxBQ
	VJh5DdpUmTOgY89qTOiZEyBKZcP/Ai4JpQ9JN2KTHezKMG5/KCCWk/sbaEGRoRUn/fJf7ZnLopNl5
	CCtKAuUwb22cXSDbF8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogz3M-00BPsl-QK; Sat, 08 Oct 2022 01:55:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogz3J-00BPrC-4F
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 01:54:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1180FB82494
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 01:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA84C43146
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 01:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665194092;
	bh=CUFZ0z9l02FjN7ckdvPKRJnglR9lkpusJd0PBOvZrXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UwmSc3NZxGMd/IffLapEC4zORlO4d2fKC0VPre2BFLkKg82RddEb58HYXVKKLO1Zp
	 rOpyQvBEeySf2tgLZaBFbbPFpNd+j9GYxso3DhCPl9QfMQPMJK7XekrA9w2gHvF5zx
	 dKIKiuU5/vabr5bfzKRIFcd1agVlAbF4qS10WDo5j/XDWXMddW3JslXbDnxD3sFCFS
	 5MtotAtn8VH0Dh0WUA4rHVI+YwCxCZ2EII5uRwWc3hGMb4zP2Q8PHwtVDZA9zePxyY
	 XNJtSnian5BM43olELRjw3XaVPtzFRV2GRT1WWNG4Day8WSvyygIqHur00KaD0VsIU
	 mWci9KdWLcoLQ==
Received: by mail-oi1-f172.google.com with SMTP id d64so7414592oia.9
        for <linux-riscv@lists.infradead.org>; Fri, 07 Oct 2022 18:54:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf1YgIA/9ObYJve43Ld6869wQSB9BQXtS7Ug1ljWLXg8KvJ3ywQ4
	P5aXSeHrZcby3uWF6tDmr5OGAItxFw1hUfeMFNU=
X-Google-Smtp-Source: AMsMyM7kq/NhJ1B79s0Ic1kmxt3FaB/EzoK+GdAW6e28SaoGktxTmS+UFtRa1hykS+rP26AkrxbJw7IpgMiSojsLnqs=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr9157319oiw.112.1665194091481; Fri, 07
 Oct 2022 18:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
In-Reply-To: <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Oct 2022 09:54:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
Message-ID: <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for noinstr
To: Mark Rutland <mark.rutland@arm.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, chenzhongjin@huawei.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>, 
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_185457_473735_18D28B2B 
X-CRM114-Status: GOOD (  21.65  )
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

On Mon, Oct 3, 2022 at 7:39 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Oct 01, 2022 at 09:24:44PM -0400, guoren@kernel.org wrote:
> > From: Lai Jiangshan <laijs@linux.alibaba.com>
> >
> > And it will be extended for C entry code.
> >
> > Cc: Borislav Petkov <bp@alien8.de>
> > Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> > ---
> >  include/linux/compiler_types.h | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > index 4f2a819fd60a..e9ce11ea4d8b 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -227,9 +227,11 @@ struct ftrace_likely_data {
> >  #endif
> >
> >  /* Section for code which can't be instrumented at all */
> > -#define noinstr                                                              \
> > -     noinline notrace __attribute((__section__(".noinstr.text")))    \
> > -     __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
> > +#define __noinstr_section(section)                           \
> > +     noinline notrace __section(section) __no_profile        \
> > +     __no_kcsan __no_sanitize_address __no_sanitize_coverage
> > +
> > +#define noinstr __noinstr_section(".noinstr.text")
>
> One thing proably worth noting here is that while KPROBES will avoid
> instrumenting `.noinstr.text`, that won't happen automatically for other
> __noinstr_section() sections, and that will need to be inhibited through other
> means (e.g. the kprobes blacklist, explicit NOKPROBE_SYMBOL() annotation, or
> otherwise).

In riscv, "we select HAVE_KPROBES if !XIP_KERNEL", so don't worry
about that. I don't think we could enable kprobe for XIP_KERNEL in the
future.

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
