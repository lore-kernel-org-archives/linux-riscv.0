Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622E4C388F2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B312080A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rntbzW2P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="mDEH1eNf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B312080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dpEtHszoEz0OOfuchm0ZtKnIY+o/7YB8j48x/gDlTSQ=; b=rntbzW2PWuu2CGiQFprqqJ1Tb
	R+cKih8PgG0CBBLBem10MlH6dLuSU6o/TAsElJnnJJWTZNUzaj5SmeBhSe61CDHr7foGznQaEHE9i
	eBcq7rVNOmDExTAuLQFu5zbE+NCpexV3O/fEZXyCTx1jIOipe1KJx5dp053gWFpC58AgI0k21s4pQ
	gytslFzFrKzzhQ+isKMF7oDtxx43kXnsoOD3zBXCI9KeA5/VuDEIfJ5VXsgHvGBW/XNCrBpMGoJ6+
	mWdVNvQv+QLx1zkvJHA3DM27EhBz911wjsAWfT8nwtRVu0RkBfWJ8/eNXf9TMQJ+pZTJZlSfBQg5b
	XF8nyrNJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVSpv-0001wD-Hx; Thu, 22 Oct 2020 05:08:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVSps-0001vb-O8
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 05:08:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id c194so465958wme.2
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ughuI8XfEfuVF0+GHRhoYvo/DOqF7rwhz2xoB0fptc8=;
 b=mDEH1eNfmuBaJhr5z1VsAg3qyiacSLtlm8SY1Zor8sW8ZoVQio3txtm+Mz7t5bKjYi
 Z2sgecOr+p3O5+u5EJbqm517i05lhkve10FQLIWIjhHZGFqmjQT7V/X+eWGe0BUTxALm
 RcOhDd9ZDpmqOA7swxMK48IQLWHCbbTtAlCx0WnwYIGs4A5ywPOQ7L+kkDmP2slLMqB+
 5olqBDctUlls1T65fWFGTlLU8/q+Cq4dZVKh/59H/T7jTGBXoxRkB88UkPectl6Z4bq+
 9LRgpj3mPX2Kq4UDPQJG60XHGSgojSPmr09y89C2rjhAXv45kzfY5PVhTF0TTcTzori2
 phbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ughuI8XfEfuVF0+GHRhoYvo/DOqF7rwhz2xoB0fptc8=;
 b=YUX7yAdjNTzZXWkY1d1gCcoCkBmacGZTrbnobBUPlcrJDkEcwW1VNHgMN1Ybk+hVex
 h3hmhFg7Z0eHk3U3Zzz19WTEe0nYL6weXRXfSCQY5rCbTdm/Bu5fGRM5NIMPZO0PlDKh
 ATtu5xwLNccj4+JBB/f+1f4Ki5+pcV0Xc5aWBTSd/nTXdrf4uRVBuUrml3yfnJWllcQI
 /IxgLYFcUG/+PD0LhAyzDSPuGD0Ghk5aicQUROmuAKvpJBon0cFzr+q21LetFfGw7up+
 z5Oe7nqiuPKloVkZeW9OBIBtqQmMJJyUNV1pEvAWRdl26+hHLD7Tgy8GixH54d8QmfjQ
 QnQw==
X-Gm-Message-State: AOAM530mvazTs8cXRuwtuiMZUQOu2423M9STWcy3QhTLg5SZQJsFqybh
 Trn8xjOpObzoRKd2fWKEmNdgOINGdW5fKIFSh9RncQ==
X-Google-Smtp-Source: ABdhPJyfzFmfG2HuPyZtkAVJZT0SuC98XSmKijkiWdEYNTuWCBUbMHgN5hg/SnYTyfX1XEmtH0PnetXUhnTB1m8K8CU=
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr738454wml.134.1603343301777; 
 Wed, 21 Oct 2020 22:08:21 -0700 (PDT)
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
In-Reply-To: <CAOnJCUJLKz8gUc7VPnUG4mULQhGD0g_ztxPGYYD7BO6HJBCqcg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2020 10:33:22 +0530
Message-ID: <CAAhSdy33b_GhuvtNTcd+4qdomr1AAxuJJ-m6Z7qFQTA7MLF-NA@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_010824_878982_923638CA 
X-CRM114-Status: GOOD (  43.61  )
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

On Thu, Oct 22, 2020 at 7:01 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Oct 16, 2020 at 11:24 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Tue, Oct 13, 2020 at 10:24 PM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Tue, Oct 13, 2020 at 6:21 PM Jim Wilson <jimw@sifive.com> wrote:
> > > >
> > > > On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > > This happens only when copy_from_user is called from function that is
> > > > > annotated with __init.
> > > > > Adding Kito & Jim for their input
> > > > >
> > > > > @kito, @Jim: Please let me know if I should create a issue in
> > > > > riscv-gnu-toolchain repo or somewhere else.
> > > >
> > > > I can't do anything useful without a testcase that I can use to
> > > > reproduce the problem.  The interactions here are complex, so pointing
> > > > at lines of code or kernel config options doesn't give me any useful
> > > > info.
> > > >
> > > > Relaxation can convert calls to a jal.  I don't know of any open bugs
> > > > in this area that can generate relocation errors.  if it is a
> > > > relaxation error then turning off relaxation should work around the
> > > > problem as you suggested.
> > > >
> > > > A kernel build problem is serious.  I think this is worth a bug
> > > > report.  FSF binutils or riscv-gnu-toolchain is fine.
> > > >
> > >
> > > I have created an issue with detailed descriptions and reproduction steps.
> > > Please let me know if you need anything else.
> > >
> >
> > It may be a toolchain issue. Here is the ongoing discussion in case
> > anybody else is interested.
> >
> > https://github.com/riscv/riscv-gnu-toolchain/issues/738
> >
> > > > Jim
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> >
> >
> >
> > --
> > Regards,
> > Atish
>
> Thanks to Jim, we know the cause now. Jim has provided an excellent
> analysis of the issue in the github issue report.
> https://github.com/riscv/riscv-gnu-toolchain/issues/738
>
> To summarize, the linker relaxation code is not aware of the
> alignments between sections.
> That's why it relaxes the calls from .text to .init.text and  converts
> a auipc+jalr pair to jal even if the address can't be fit +/- 1MB.
>
> There are few ways we can solve this problem.
>
> 1. As per Jim's suggestion, linker relaxation code is aware of the
> section alignments. We can mark .init.text as a 2MB aligned section.
>    For calls within a section, section's alignment will be used in the
> calculation. For calls across sections, e.g. from .init.text to .text,
> the maximum
>    section alignment of every section will be used. Thus, all
> relaxation within .init.text and between any sections will be
> impacted.
>    Thus, it avoids the error but results in the following increase in
> size of various sections.
>      section           change in size (in bytes)
>      .head.text      +4
>      .text               +40
>      .init.text.        +6530
>      .exit.text        +84
>
> The only significant increase is .init.text but it is freed after
> boot. Thus, I don't see any significant performance degradation due to
> that.
>
> Here is the diff
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -51,7 +51,13 @@ SECTIONS
>         . = ALIGN(SECTION_ALIGN);
>         __init_begin = .;
>         __init_text_begin = .;
> -       INIT_TEXT_SECTION(PAGE_SIZE)
> +       . = ALIGN(PAGE_SIZE);                                   \
> +       .init.text : AT(ADDR(.init.text) - LOAD_OFFSET)
> ALIGN(SECTION_ALIGN) {  \
> +               _sinittext = .;                                         \
> +               INIT_TEXT                                               \
> +               _einittext = .;                                         \
> +       }
> +
>         . = ALIGN(8);
>         __soc_early_init_table : {
>                 __soc_early_init_table_start = .;
>
> 2. We will continue to keep head.txt & .init.text together before
> .text. However, we will map the pages that contain head & init.text at
> page
>     granularity so that .head.text and init.text can have different
> permissions. I have not measured the performance impact of this but it
> won't
>     too bad given that the combined size of sections .head.txt &
> .init.text is 200K. So we are talking about page level permission only
> for
>     ~50 pages during boot.
>
> 3. Keep head.text in a separate 2MB aligned section. .init.text will
> follow .head.text in its own section as well. This increases the
> kernel
>     size by 2MB for MMU kernels. For nommu case, it will only increase
> by 64 bytes due to smaller section alignment for nommu kernels.
>
> Both solutions 1 & 2 come at minimal performance on boot time while
> solution 3 comes at increased kernel size.
>
> Any preference ?

I prefer solution#3 because:
1. This will help us avoid special handling of static objects
2.  This will make RISC-V linker script more aligned with other
     major architectures

I don't think solution#3 will increase the size of the kernel by 2MB. We
can make head.text part of text section. There will be only one section
alignment between text section and init section but the existing section
alignment between init section and text section will be removed. In other
words, number of section alignments will remain same.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
