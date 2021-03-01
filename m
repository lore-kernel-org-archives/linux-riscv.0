Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304AFC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 18:15:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25F460249
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 18:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B25F460249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MnEFywXlHd11LARMRGKASLP/g98iWh1fW+9CJN6bLoQ=; b=TmwaNm49lBRG5vZyCyKR0o9Aw
	a7vM5HS+BQ0j/YgIT9fG2JmiCFvSlQepz8Jhc4Nu4L5nqc5AEWY2ZvIVM6HYKGPhidv1K2aae3pC4
	i/3kpWi7cYKwySJVH7AEAYhhpfwzV4IJ70a6Px/8z24gXcGjDQNneRIFdTnB9PIyybwnVp2Z6SuAh
	RGAaWiDbQS602eB6TJjTafuttj7vNceT1h5NBQvdDQ3RY9Qa9YzMZS4NJGxhXg9lWO9t8ZHtUB5b9
	bMs2Fg1wjfthMa/HzsdUIfVMVPsiD/Ggp5C0Pt8DizJ9h8+v8vqKJbTz3mtaJOBCsj3i3Og8PGH/G
	MVh12RAWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGn4G-0006bD-Mr; Mon, 01 Mar 2021 18:14:52 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGn4D-0006ag-JR
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 18:14:50 +0000
Received: by mail-il1-x12e.google.com with SMTP id i18so15509145ilq.13
 for <linux-riscv@lists.infradead.org>; Mon, 01 Mar 2021 10:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5wZyeKwxq96svsdSpBs6kMLZlDR0VgeU8/y6O5qhho=;
 b=JT1/gI5ZKDkbgUvPcQM48mfzZSwa1fkUSOlltJFcJqMtmKwT66OQVgi8JQpe1T/8By
 b9ZMKUEoRKQLeDJK34sI2EvDvr5e71yPvo31kSa3qUjYe+To1O3VSN8iTOYgV+0d1ZDz
 7pH5X6AX+wfxkTFDqOt2ADVxTInuGT3qZuu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5wZyeKwxq96svsdSpBs6kMLZlDR0VgeU8/y6O5qhho=;
 b=JRSnU5kGG46vT6mDu7hqg1rpnq6i4hMGqX/Ge3exDq2j4IWb/kprMxaih5V76Zavh1
 44qVHEGOe3Thx/3UbEEkD+j6+TgMXWydmN43Yt77UQ+2M8i96Bs1B6V+k/huyrzSByJ6
 Qt+R8TPdkSEGdTdN1xn/Mc0o5zCl8m+PW0tSokZsn4uKCbFu7xOd648ajuBL52o7fRj3
 6aZliQMpY3PLdxPohtXV3PDL25QRklYNeT1Dv/l3mAs6SVfIFlhvMywDBXVu89RBkdid
 iXGq++kySjCGh9PyO+HIonN8vUH9n+lxxg/xioIs6WByLoh353vCf3/SNoWK7KYD35AG
 67nA==
X-Gm-Message-State: AOAM5332J/N7wNJ2KGHta9mUKgEEIJXfwyxt3HInGB7Go7SJCt8YMTUR
 RNusHpWZqAG40vTVM5yWsm6sih4orPPW8TTTnS8g4tTZyKZq
X-Google-Smtp-Source: ABdhPJylbq73EKSh3MrNscbv1CwFUrOWbMPoaJUBsH5Q1r7P7jjwJSAV20RVuvKcOWfszb+pUAoWNKUfOnLHS1lrmPE=
X-Received: by 2002:a92:ce4e:: with SMTP id a14mr14503089ilr.219.1614622486203; 
 Mon, 01 Mar 2021 10:14:46 -0800 (PST)
MIME-Version: 1.0
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
 <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
 <89b97904-e069-35cd-0a42-217cafe17e15@huawei.com>
 <CAOnJCU+HWA2znErbiiqEVWMkKtEfsyhXEwGEy_x2PqDzff4PXg@mail.gmail.com>
 <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
In-Reply-To: <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 1 Mar 2021 10:14:35 -0800
Message-ID: <CAOnJCUK3ee2agzmK8AzGAD_YFoLT1KoM0MpwWiyq-59fOcV9bQ@mail.gmail.com>
Subject: Re: question about RISCV EFI stub support
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_131449_770810_8A535E63 
X-CRM114-Status: GOOD (  24.37  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 1, 2021 at 6:43 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> + Palmer, sorry forget add to cc list...
>
> On 2021/2/25 10:00, Atish Patra wrote:
> > On Wed, Feb 24, 2021 at 5:29 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >>
> >> On 2021/2/25 7:35, Atish Patra wrote:
> >>> On Wed, Feb 24, 2021 at 3:14 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >>>> Hi Atish and Ard,
> >>>>
> >>>> The commit "cb7d2dd5612a RISC-V: Add PE/COFF header for EFI stub" use
> >>>> c.li to
> >>>>
> >>>> add Magic "MZ" signature for PE/COFF header, which select RISCV_ISA_C,
> >>>> but "C"
> >>>>
> >>>> to the ISA is optional,  and if "C" is not support ,  EFI boot is not
> >>>> supported.
> >>>>
> >>>> Could we use ".word MZ_MAGIC" like x86 code or some other way to support
> >>>> "MZ" signature?
> >>>>
> >>> .word won't work but .short will. With .word, you end up 0000 in the 2
> >>> bytes which can be interpreted as illegal instruction.
> >> Yes, should use ".short" in RV.
> >>> I guess your larger objective is to make the C extension optional and
> >>> not enabled by default for the Linux kernel.
> >> "C" extension is optional, and the upstream kernel has the RISCV_ISA_C which
> >>
> >> could be configurable.  and I think the EFI_STUB should not depend or
> >> select it,
> >>
> >> and maybe we only want to support RV64G in some cases,  what's your option?
> >>
> > I think RISCV_ISA_C was enabled by default just to generate a smaller
> > binary size.
> > @palmer : was there any other reason ?
>
> Any comment about the too issue,
>
> 1)  directly use .shout MZ_MAGIC to decouple EFI_STUB and RISCV_ISA_C.
>
> 2)  don't set RISCV_ISA_C  to default y
>

The first one is fine but I am not sure if we shouldn't set
RISCV_ISA_C to default y.
RISC-V Linux kernel always maintained RV64GC as the minimum required
ISAs required and I don't see any
good reason to change it.

Is there any solid use case where you want to support only RV64G ?

> >>> Do you just want it for a custom kernel or the upstream kernel ?
> >>>
> >>>> Thanks,
> >>>>
> >>>> Kefeng
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> linux-riscv mailing list
> >>>> linux-riscv@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>>
> >
> >



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
