Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AD6C4363A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 17:14:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3EC524630
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 17:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xVDO8BAd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="KqGua7Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3EC524630
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RLQc0YpLAHPH+noqftoHk4IZiYWPvvEaIm8JiSKojqA=; b=xVDO8BAd0WuyYdsoaUfPj6g5G
	ZjeAs5NMF16DkGZzf1s+HzCl2gQyUbc7+i4lJ9IYR+Lz6fPwjM2gaOXbckRjY+4XnmJksKUP/3cmk
	mp8nJKte7bdrCtzDiU7tfZVK1v2U3UUpCFg5cs2ugxtMG4xyKRj8FCxLO4PGje0mFP9cGtWI3D98r
	CMnVYs3NcjcftIVrFQUy/zXq8SsQZvXA/eLlxoEk/cC1prCZ2tMgAjJC7jeDoZnwkUyh/k6RixLmk
	RwASgIMgbcp/Nu7Gr7LWVEXVRKHbmj3QyE8TTgTi1y+oKyfsE0rXxpge4JAqlECxjA1P9eZezxuhy
	dEaIfQE3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVeAN-00069f-HV; Thu, 22 Oct 2020 17:14:19 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVeAL-00068r-FR
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 17:14:18 +0000
Received: by mail-il1-x142.google.com with SMTP id q1so2407394ilt.6
 for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2020 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l5W3i+y8wnLXGa3i9pAtx2PYJyR6oNLNqMyrzD9GmHU=;
 b=KqGua7Id6S+gWJ3CajAXNmc9q5Ef3kY9EiuChtz4R7cRhWzZoBnaCpdFV4xwrIaRIt
 kS7eGHe8fvb2Miy5EHrMpukV7xxM3L1sHHUSu53mhexK4JZeMihF1BXrShnCt/NbOqJE
 sENKqi7pRQtPmIh6Fq24KbhLpya9PWxe6Ve+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5W3i+y8wnLXGa3i9pAtx2PYJyR6oNLNqMyrzD9GmHU=;
 b=EjUrBIVf7snvImSgvSugrzmojepZGL2sZr6m6yZkWWptllXykmCSNWxXuMXsoJWsX5
 F6cssxoPAYOEiEJxDaSn89yJkyI7OkfkQHYQLdYsubcNGqKLJfWrxgZVmABMyEp8ll+T
 xGFXWS+tzNED8IgqzgI/KA2RNRHMnR74lTHo2mbxIVNnksecViTzJYvzX/IJKkeSdPXe
 2BiWBtczjFY95UytQHmb+jnHc+rvafutpVCy7ZTaQad1koz35bY+SQb/fRXnhRiOh9ey
 AdLx5IO+SzaXE0OTSt/DlCmWXBHT7nzoJuGI4xu1rIEdMr7PHumVFAdM7mg8sVp8edFO
 6UtQ==
X-Gm-Message-State: AOAM533KhgolfJQY6CS+YpyKe8U1kCsMd9Bg1uiseKtsG+RCvmBRSG8Z
 RoO39RthkII/qvWQVy6zs4wdZsCU6lSuDGoIC+T7
X-Google-Smtp-Source: ABdhPJyxj325aMZZTLE79OzKcI5NUGL3dtwIZgU+GkXdLF3ZtySHRr2zgpyFNROLrr7wc1OJP5WUu/mpPX3UySME7IQ=
X-Received: by 2002:a92:512:: with SMTP id q18mr2450570ile.147.1603386849774; 
 Thu, 22 Oct 2020 10:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201009211344.2358688-1-atish.patra@wdc.com>
 <20201009211344.2358688-5-atish.patra@wdc.com>
 <CAHCEehJvMv=CYD1+QXb0uB36Hv4pvO36BAKSLOcxTXvmADZFbA@mail.gmail.com>
 <CAOnJCUKPjkm_=5eHn6=GjVGr67okZkVzqP7-ciphn986BQoc9w@mail.gmail.com>
 <CAOnJCULZMRu+sHmnjoBwtvaB3BjmCiZLzYxNOeWZmoYLKG+wTw@mail.gmail.com>
 <CAHCEehJJmLQ6W5AdH+hEZSJxpDC8HG0UN=EGt9M0Tp5NTfQnaw@mail.gmail.com>
 <CAOnJCUJN-XMZ+N5w+RbVhJag9D_dey7DAopb0Q35GDfXptyMjA@mail.gmail.com>
 <CAFyWVaYORWYZTXyXOWiY6xK-SFTvsUxDNDqKQnhVUwzc5N045Q@mail.gmail.com>
 <CAOnJCU+3xFyFW4ATCdYAv5zVyBSLE0mTevrJLCXW7HDgy4D4EQ@mail.gmail.com>
 <CAOnJCUJWf9Hu4frFOJGQLUZ2BQ8qHBd7mvspgvfM1k6e4z5CcA@mail.gmail.com>
 <CAOnJCUJLKz8gUc7VPnUG4mULQhGD0g_ztxPGYYD7BO6HJBCqcg@mail.gmail.com>
 <CAAhSdy33b_GhuvtNTcd+4qdomr1AAxuJJ-m6Z7qFQTA7MLF-NA@mail.gmail.com>
 <CAAhSdy2M+uWufbqtYOjyd8wUXg7a5jO6J5o5NC=duaTBsnyHsA@mail.gmail.com>
In-Reply-To: <CAAhSdy2M+uWufbqtYOjyd8wUXg7a5jO6J5o5NC=duaTBsnyHsA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 22 Oct 2020 10:13:58 -0700
Message-ID: <CAOnJCUJai8T3uw1E8o_wHiXf27Q2BGm+x_c8quSThUcO9Fdd=Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_131417_587580_C5EA8733 
X-CRM114-Status: GOOD (  48.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, Kito Cheng <kito.cheng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 22, 2020 at 12:22 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Oct 22, 2020 at 10:33 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Oct 22, 2020 at 7:01 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Fri, Oct 16, 2020 at 11:24 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > >
> > > > On Tue, Oct 13, 2020 at 10:24 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > >
> > > > > On Tue, Oct 13, 2020 at 6:21 PM Jim Wilson <jimw@sifive.com> wrote:
> > > > > >
> > > > > > On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > > > > This happens only when copy_from_user is called from function that is
> > > > > > > annotated with __init.
> > > > > > > Adding Kito & Jim for their input
> > > > > > >
> > > > > > > @kito, @Jim: Please let me know if I should create a issue in
> > > > > > > riscv-gnu-toolchain repo or somewhere else.
> > > > > >
> > > > > > I can't do anything useful without a testcase that I can use to
> > > > > > reproduce the problem.  The interactions here are complex, so pointing
> > > > > > at lines of code or kernel config options doesn't give me any useful
> > > > > > info.
> > > > > >
> > > > > > Relaxation can convert calls to a jal.  I don't know of any open bugs
> > > > > > in this area that can generate relocation errors.  if it is a
> > > > > > relaxation error then turning off relaxation should work around the
> > > > > > problem as you suggested.
> > > > > >
> > > > > > A kernel build problem is serious.  I think this is worth a bug
> > > > > > report.  FSF binutils or riscv-gnu-toolchain is fine.
> > > > > >
> > > > >
> > > > > I have created an issue with detailed descriptions and reproduction steps.
> > > > > Please let me know if you need anything else.
> > > > >
> > > >
> > > > It may be a toolchain issue. Here is the ongoing discussion in case
> > > > anybody else is interested.
> > > >
> > > > https://github.com/riscv/riscv-gnu-toolchain/issues/738
> > > >
> > > > > > Jim
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Atish
> > > >
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Atish
> > >
> > > Thanks to Jim, we know the cause now. Jim has provided an excellent
> > > analysis of the issue in the github issue report.
> > > https://github.com/riscv/riscv-gnu-toolchain/issues/738
> > >
> > > To summarize, the linker relaxation code is not aware of the
> > > alignments between sections.
> > > That's why it relaxes the calls from .text to .init.text and  converts
> > > a auipc+jalr pair to jal even if the address can't be fit +/- 1MB.
> > >
> > > There are few ways we can solve this problem.
> > >
> > > 1. As per Jim's suggestion, linker relaxation code is aware of the
> > > section alignments. We can mark .init.text as a 2MB aligned section.
> > >    For calls within a section, section's alignment will be used in the
> > > calculation. For calls across sections, e.g. from .init.text to .text,
> > > the maximum
> > >    section alignment of every section will be used. Thus, all
> > > relaxation within .init.text and between any sections will be
> > > impacted.
> > >    Thus, it avoids the error but results in the following increase in
> > > size of various sections.
> > >      section           change in size (in bytes)
> > >      .head.text      +4
> > >      .text               +40
> > >      .init.text.        +6530
> > >      .exit.text        +84
> > >
> > > The only significant increase is .init.text but it is freed after
> > > boot. Thus, I don't see any significant performance degradation due to
> > > that.
> > >
> > > Here is the diff
> > > --- a/arch/riscv/kernel/vmlinux.lds.S
> > > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > > @@ -51,7 +51,13 @@ SECTIONS
> > >         . = ALIGN(SECTION_ALIGN);
> > >         __init_begin = .;
> > >         __init_text_begin = .;
> > > -       INIT_TEXT_SECTION(PAGE_SIZE)
> > > +       . = ALIGN(PAGE_SIZE);                                   \
> > > +       .init.text : AT(ADDR(.init.text) - LOAD_OFFSET)
> > > ALIGN(SECTION_ALIGN) {  \
> > > +               _sinittext = .;                                         \
> > > +               INIT_TEXT                                               \
> > > +               _einittext = .;                                         \
> > > +       }
> > > +
> > >         . = ALIGN(8);
> > >         __soc_early_init_table : {
> > >                 __soc_early_init_table_start = .;
> > >
> > > 2. We will continue to keep head.txt & .init.text together before
> > > .text. However, we will map the pages that contain head & init.text at
> > > page
> > >     granularity so that .head.text and init.text can have different
> > > permissions. I have not measured the performance impact of this but it
> > > won't
> > >     too bad given that the combined size of sections .head.txt &
> > > .init.text is 200K. So we are talking about page level permission only
> > > for
> > >     ~50 pages during boot.
> > >
> > > 3. Keep head.text in a separate 2MB aligned section. .init.text will
> > > follow .head.text in its own section as well. This increases the
> > > kernel
> > >     size by 2MB for MMU kernels. For nommu case, it will only increase
> > > by 64 bytes due to smaller section alignment for nommu kernels.
> > >
> > > Both solutions 1 & 2 come at minimal performance on boot time while
> > > solution 3 comes at increased kernel size.
> > >
> > > Any preference ?
> >
> > I prefer solution#3 because:
> > 1. This will help us avoid special handling of static objects
> > 2.  This will make RISC-V linker script more aligned with other
> >      major architectures
> >
> > I don't think solution#3 will increase the size of the kernel by 2MB. We
> > can make head.text part of text section. There will be only one section
> > alignment between text section and init section but the existing section
> > alignment between init section and text section will be removed. In other
> > words, number of section alignments will remain same.
>
> I think we will need to incorporate Jim's suggestion irrespective of the
> solution we choose because without Jim's changes we can hit the
> linker relaxation issue in solution#2 as well.
>

Reconsidering all the possible approaches, I think you are right.

With approach 2 & 3, I just hit the issue now. However, there is an
alignment between
sections which may throw the same linker error in future when text or
init.text gets bigger.

I will follow approach 1 suggested by Jim to revise the series.

> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
