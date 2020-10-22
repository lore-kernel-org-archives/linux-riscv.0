Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF1AC4363A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 07:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6E322248
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 07:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPml2jAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="l62viUli"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6E322248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lHfGU7r8bigxb2821LsP7yr2KUo/vaJuBps2LwZLQ2s=; b=mPml2jAHr2GZPTMLaw79nery4
	Okqqr8/v8kLkpFS/9xQ6k52Dwe1zJGHRaDKCf2agZaOmbJd6O05ocvJEyURhStxhdiUUefA8DlA2G
	zCno3/9i0zzCDyfo+ZQ8a6poXidI1ex6pjWhK41dkYZmZKa82DagxbWM3o7kD1m3wWOFSzwtpQgWD
	XQ9x6GfHScvgu9izxDxNgO3GEXgwJRVCIU9cFcp5/w+gt6ZAud0q85lkOTQiSS1UBrEnx6bFeaXvO
	2GIm2wbfIJvQP94/TJjlSXhn7hXss2RPk3eYS1R0qHD1VIdlE+g9v1pYaa7QmnGhcUtTdNeUJmmke
	zZc89+2uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVUva-0002MA-0N; Thu, 22 Oct 2020 07:22:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVUvW-0002Lc-8g
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 07:22:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id n15so826533wrq.2
 for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2020 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRVfCPeG7fJQMh3P3wcjyEm79b9YVN2T5Zw+OTjxA+k=;
 b=l62viUliYeV2coWEKzvRKIvzLclR5p/sgwtQlSs58R0Iodk+1JnwRelFAxeI6aPmAq
 lKIVfwinX2TQvcOk3iE2GDL6emseub5jV5wh6IANyJazZBUTS0az32HZHUEJyTzbJJ3C
 e3dSni8+8oq4f3kvuemNCmLiyWu0QBZSdboWYwQC1m75Bn2L2MoHA+jtbMPs5JZ7URHx
 +SD7r1g+2KuD67TlTOdCH7NOWiCwtJNLAJq2ExkWSV/7Mjnj9k+SlBaoJWVZnKqAqSoQ
 IK8gv4tmITNXMo9PXF0+ajI9CMNC/yvF9nQBVFtVAUzYJdt8vz9N0g1W6nlZRiRYQ3iR
 1c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRVfCPeG7fJQMh3P3wcjyEm79b9YVN2T5Zw+OTjxA+k=;
 b=LFDIutJdSVrfyTWBJs3fAEphQoEt5Uv8hqLJu/HrKXBgnbi+RuXVjafoC0v5Q37kFa
 3GRWRLSbhaq/B6e16rGdEIwOzYzqfmKcbbzHbY1aPXo59LypM4ZwfzeqKwaWWO1oNTZY
 6R4AwEASkxWD7qzDvngfsQ2O2+xVyJCddKzZ4NMoBx3SBnEgFLu16yC5oPS+dI3goej9
 mkgzdhA5G608zBEzc49llFTYkkE9PXiYcOB87AFqhPnOEpLMTOk1EOFNcNO3TJH8HBtD
 5qJ69oe2J9/wHf26QIQ6Vbyk0MWdxBa0TBhfcQSU4Ewlu2saQJRgl+1a+fnlfDkQ3O5z
 PC6A==
X-Gm-Message-State: AOAM530RlejMcuvVa1U3jzvI7bq0Dkhl7RquJW4QhsPNfQL/rR5PC0Tx
 nd+c2GSdvL4RRwcXNVnMh8FFbmnc4brRWzKED82AQw==
X-Google-Smtp-Source: ABdhPJy/9IhECSHnT3gWmNswOMOaCFB6ZzsrfjqxVAU7gTQC3iA/hTOBFXTYWFr83S2/WAsnW9QtEn6WX7L355xstqk=
X-Received: by 2002:adf:80cb:: with SMTP id 69mr1097878wrl.325.1603351340703; 
 Thu, 22 Oct 2020 00:22:20 -0700 (PDT)
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
In-Reply-To: <CAAhSdy33b_GhuvtNTcd+4qdomr1AAxuJJ-m6Z7qFQTA7MLF-NA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2020 12:52:09 +0530
Message-ID: <CAAhSdy2M+uWufbqtYOjyd8wUXg7a5jO6J5o5NC=duaTBsnyHsA@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_032222_478000_E10E4928 
X-CRM114-Status: GOOD (  45.94  )
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

On Thu, Oct 22, 2020 at 10:33 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Oct 22, 2020 at 7:01 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Fri, Oct 16, 2020 at 11:24 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Tue, Oct 13, 2020 at 10:24 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > >
> > > > On Tue, Oct 13, 2020 at 6:21 PM Jim Wilson <jimw@sifive.com> wrote:
> > > > >
> > > > > On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > > > This happens only when copy_from_user is called from function that is
> > > > > > annotated with __init.
> > > > > > Adding Kito & Jim for their input
> > > > > >
> > > > > > @kito, @Jim: Please let me know if I should create a issue in
> > > > > > riscv-gnu-toolchain repo or somewhere else.
> > > > >
> > > > > I can't do anything useful without a testcase that I can use to
> > > > > reproduce the problem.  The interactions here are complex, so pointing
> > > > > at lines of code or kernel config options doesn't give me any useful
> > > > > info.
> > > > >
> > > > > Relaxation can convert calls to a jal.  I don't know of any open bugs
> > > > > in this area that can generate relocation errors.  if it is a
> > > > > relaxation error then turning off relaxation should work around the
> > > > > problem as you suggested.
> > > > >
> > > > > A kernel build problem is serious.  I think this is worth a bug
> > > > > report.  FSF binutils or riscv-gnu-toolchain is fine.
> > > > >
> > > >
> > > > I have created an issue with detailed descriptions and reproduction steps.
> > > > Please let me know if you need anything else.
> > > >
> > >
> > > It may be a toolchain issue. Here is the ongoing discussion in case
> > > anybody else is interested.
> > >
> > > https://github.com/riscv/riscv-gnu-toolchain/issues/738
> > >
> > > > > Jim
> > > >
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Atish
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> >
> > Thanks to Jim, we know the cause now. Jim has provided an excellent
> > analysis of the issue in the github issue report.
> > https://github.com/riscv/riscv-gnu-toolchain/issues/738
> >
> > To summarize, the linker relaxation code is not aware of the
> > alignments between sections.
> > That's why it relaxes the calls from .text to .init.text and  converts
> > a auipc+jalr pair to jal even if the address can't be fit +/- 1MB.
> >
> > There are few ways we can solve this problem.
> >
> > 1. As per Jim's suggestion, linker relaxation code is aware of the
> > section alignments. We can mark .init.text as a 2MB aligned section.
> >    For calls within a section, section's alignment will be used in the
> > calculation. For calls across sections, e.g. from .init.text to .text,
> > the maximum
> >    section alignment of every section will be used. Thus, all
> > relaxation within .init.text and between any sections will be
> > impacted.
> >    Thus, it avoids the error but results in the following increase in
> > size of various sections.
> >      section           change in size (in bytes)
> >      .head.text      +4
> >      .text               +40
> >      .init.text.        +6530
> >      .exit.text        +84
> >
> > The only significant increase is .init.text but it is freed after
> > boot. Thus, I don't see any significant performance degradation due to
> > that.
> >
> > Here is the diff
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -51,7 +51,13 @@ SECTIONS
> >         . = ALIGN(SECTION_ALIGN);
> >         __init_begin = .;
> >         __init_text_begin = .;
> > -       INIT_TEXT_SECTION(PAGE_SIZE)
> > +       . = ALIGN(PAGE_SIZE);                                   \
> > +       .init.text : AT(ADDR(.init.text) - LOAD_OFFSET)
> > ALIGN(SECTION_ALIGN) {  \
> > +               _sinittext = .;                                         \
> > +               INIT_TEXT                                               \
> > +               _einittext = .;                                         \
> > +       }
> > +
> >         . = ALIGN(8);
> >         __soc_early_init_table : {
> >                 __soc_early_init_table_start = .;
> >
> > 2. We will continue to keep head.txt & .init.text together before
> > .text. However, we will map the pages that contain head & init.text at
> > page
> >     granularity so that .head.text and init.text can have different
> > permissions. I have not measured the performance impact of this but it
> > won't
> >     too bad given that the combined size of sections .head.txt &
> > .init.text is 200K. So we are talking about page level permission only
> > for
> >     ~50 pages during boot.
> >
> > 3. Keep head.text in a separate 2MB aligned section. .init.text will
> > follow .head.text in its own section as well. This increases the
> > kernel
> >     size by 2MB for MMU kernels. For nommu case, it will only increase
> > by 64 bytes due to smaller section alignment for nommu kernels.
> >
> > Both solutions 1 & 2 come at minimal performance on boot time while
> > solution 3 comes at increased kernel size.
> >
> > Any preference ?
>
> I prefer solution#3 because:
> 1. This will help us avoid special handling of static objects
> 2.  This will make RISC-V linker script more aligned with other
>      major architectures
>
> I don't think solution#3 will increase the size of the kernel by 2MB. We
> can make head.text part of text section. There will be only one section
> alignment between text section and init section but the existing section
> alignment between init section and text section will be removed. In other
> words, number of section alignments will remain same.

I think we will need to incorporate Jim's suggestion irrespective of the
solution we choose because without Jim's changes we can hit the
linker relaxation issue in solution#2 as well.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
