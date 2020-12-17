Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D309C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:33:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2210D22D6E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2210D22D6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LEBPJi99o/nfBMJZ8omt9ZFEnyMejgnYv2erTnRYT9Q=; b=sLWzSf5KFyGNzQPmi04D0eIZk
	tuD9SvCVePZxVYcv/4arocWNpNWQHlFnO6Wg3E2AzR2QcjdUoyvoJyOoFWQ6bUb9YhE/sOdxE5pA9
	UsXBjZIDqKP9Dl8aNAVYejQdgX3otlSAWfNi9jKVl5Xoige/LCxHq6Am9uo9VLr2Q7IVPM9jOV4yj
	ilLDyG2hk5pKigom4qiOKr5tFC0k++5T7V5nZ8fEiyebjHKg5hc2aJXpGD2aZooKrk05QFGcndBd1
	pFgF4LkfqjYR4IAu076QVi9NiDGhpe+aZXIdVSeZlWLu4xQxw6k4bHJvO2Ahjz77yPLP6fBNzSDyN
	2Iynh5Iig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpojN-00047c-7D; Thu, 17 Dec 2020 08:33:49 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpojJ-00046u-V1
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:33:47 +0000
Received: by mail-il1-x130.google.com with SMTP id 2so25118526ilg.9
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUte5MZb3VgmcVGjhmZGHO+sbeoQVX9ioF310lk1DlM=;
 b=sTA4NLIAZ6ZSRkLiJJDaYIwt+a0K9pKODxKCrc3xUiXv6exsXJ2CGMHUEK3+vLuL/O
 i7nD0VF5A/5MTADxkf/ZykzVwz+y/twHQKWqudTU662Y2lQ3xI0H5WBCjx8V/EDPeIGR
 XQIFrh0jLpMUVPpMFXVc4mxTS4DlAk00uM/og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUte5MZb3VgmcVGjhmZGHO+sbeoQVX9ioF310lk1DlM=;
 b=sfSIfneKWKIhsNC6WIe9EGJG7xjGBT+Mz5sCpikF5xd9noTcSgz3F0uK+uJ7zl399b
 l0CHsLp8hNYsVYW7zLuL/fb6ztnGZcBAYYG/Qye90AIfhTbqhcCq8nkuR80Qht2BpSac
 eDvdEzKPSf3fIM8QxKdbHxk1wbqxZFxNShcD5wwdneDleS7r4AS237sJ9riHPAoWJVXu
 0YHnh8uJ5ok5lxl6KsEwyFjqRTsFWa76CHptrsZ9EgMt3c7w98JzGG2YHGu2RJwHmUMe
 M8IseD89CRnuw4vWM7Mk9maC59j6Q/bUulR+qGnVj/JLvqcAuD3dS8mdMaBZaLts6kZ/
 QOYA==
X-Gm-Message-State: AOAM530mMdO+H3eI0SVZsCl3NBWM2H/k2tWiBo4s8c99hAeU8aoLKWYI
 V9ppac2au3feEImOi7IgLPzw9DX2jbTQp9rI3+jeXeJetm6q
X-Google-Smtp-Source: ABdhPJzt31wK+zmuokHE1Cu7YvCT4RhK78rmt7+i93T60Wfs0RAnKDae02C8YXuPWWHsEVCYpQG1FXdYnnpxHiaqYC8=
X-Received: by 2002:a92:d84a:: with SMTP id h10mr47844317ilq.77.1608194018942; 
 Thu, 17 Dec 2020 00:33:38 -0800 (PST)
MIME-Version: 1.0
References: <mhng-5b9a6df7-f6a2-4db8-aaf9-b4e89115522d@palmerdabbelt-glaptop>
 <mhng-ec25b026-f312-4d65-9afb-1c34a5cac6c7@palmerdabbelt-glaptop>
In-Reply-To: <mhng-ec25b026-f312-4d65-9afb-1c34a5cac6c7@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Dec 2020 00:33:28 -0800
Message-ID: <CAOnJCUJ4Z6wGQMy+7ELMNxRby5joe_U+9zjO66cmXGHKHkzLsg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Align the .init.text section
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_033346_118014_E364E324 
X-CRM114-Status: GOOD (  33.24  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, ren_guo@c-sky.com,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, ojeda@kernel.org,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 10:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 15 Dec 2020 22:02:54 PST (-0800), Palmer Dabbelt wrote:
> > On Wed, 04 Nov 2020 16:04:37 PST (-0800), Atish Patra wrote:
> >> In order to improve kernel text protection, we need separate .init.text/
> >> .init.data/.text in separate sections. However, RISC-V linker relaxation
> >> code is not aware of any alignment between sections. As a result, it may
> >> relax any RISCV_CALL relocations between sections to JAL without realizing
> >> that an inter section alignment may move the address farther. That may
> >> lead to a relocation truncated fit error. However, linker relaxation code
> >> is aware of the individual section alignments.
> >>
> >> The detailed discussion on this issue can be found here.
> >> https://github.com/riscv/riscv-gnu-toolchain/issues/738
> >>
> >> Keep the .init.text section aligned so that linker relaxation will take
> >> that as a hint while relaxing inter section calls.
> >> Here are the code size changes for each section because of this change.
> >>
> >> section         change in size (in bytes)
> >>   .head.text      +4
> >>   .text           +40
> >>   .init.text      +6530
> >>   .exit.text      +84
> >>
> >> The only significant increase in size happened for .init.text because
> >> all intra relocations also use 2MB alignment.
> >>
> >> Suggested-by: Jim Wilson <jimw@sifive.com>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> ---
> >>  arch/riscv/kernel/vmlinux.lds.S | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> >> index 3ffbd6cbdb86..cacd7898ba7f 100644
> >> --- a/arch/riscv/kernel/vmlinux.lds.S
> >> +++ b/arch/riscv/kernel/vmlinux.lds.S
> >> @@ -30,7 +30,13 @@ SECTIONS
> >>      . = ALIGN(PAGE_SIZE);
> >>
> >>      __init_begin = .;
> >> -    INIT_TEXT_SECTION(PAGE_SIZE)
> >> +    __init_text_begin = .;
> >> +    .init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
> >> +            _sinittext = .;                                         \
> >> +            INIT_TEXT                                               \
> >> +            _einittext = .;                                         \
> >> +    }
> >> +
> >>      . = ALIGN(8);
> >>      __soc_early_init_table : {
> >>              __soc_early_init_table_start = .;
> >
> > Not sure what's going on here (or why I wasn't catching it earlier), but this
> > is breaking boot on one of my test configs.  I'm not getting any Linux boot
> > spew, so it's something fairly early.  I'm running defconfig with
> >
> >     CONFIG_PREEMPT=y
> >     CONFIG_DEBUG_PREEMPT=y
> >     CONFIG_PROVE_LOCKING=y
> >
> > It looks like that's been throwing a bunch of warnings for a while, but it did
> > at least used to boot.  No idea what PREEMPT would have to do with this, and
> > the other two don't generally trigger issues that early in boot (or at least,
> > trigger halts that early in boot).
> >
> > There's a bunch of other stuff that depends on this that's on for-next so I
> > don't want to just drop it, but I also don't want to break something.  I'm just
> > running QEMU's virt board.
> >

I just verified for-next on QEMU 5.2.0 for virt (RV32,64, nommu) and
sifive_u as well.
I will give it a try on unleashed tomorrow as well with the above
configs enabled.

> > I'll take a look again tomorrow night, but if anyone has some time to look
> > that'd be great!
>
> Looks like this breaks on QEMU 5.0.0 but works on 5.2.0.

I will take a look tomorrow to check the root cause.

I guess technically
> that means could be considered a regression, but as we don't really have any
> scheme for which old versions of QEMU we support it's not absolute.  I'd
> usually err on the side of keeping support for older platforms, but in this
> case it's probably just not worth the time so I'm going to just ignore it.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
