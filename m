Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A683BC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVdFf2ZyUQVI4G173tWtn5odz0gaK0Ceg0JTeCBfg+U=; b=PmORaxOPElce9/
	ezyWCCxfnB1u+zPhgVxALahuWf+/cP8WD+qaNoesztL1zaM9cyQtCcSpIGl1qjghXaZDxb4umfJKH
	qIeGKAo4abbOB/164IrFFJf6EKcSaTyaNSeGUIPjudDuOvhbPivx6dmZ28zZ3SY4AFwMc7lSqpTYb
	FOzaNcc2VzSXH48fJhQcFt5+WPX0YR2IhRrSGIX+6Yc3KiTvV8uTwQFy9aWDg6jPZo6HQeMu2Sa5+
	MC+kWJwLum2LkBCEMvaxItus/muWVdc9UzEctx8U35h2fcdiviYmGHpsVxKraUVlatj2gbAvNlBq0
	kNw9rurxPACJXUFtLjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaouc-00867o-Om; Wed, 21 Sep 2022 01:52:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaotr-0085il-QG; Wed, 21 Sep 2022 01:51:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id e18so6523373edj.3;
        Tue, 20 Sep 2022 18:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=exktuqp3Yz0O7DTOQAZcnS95GYeriR3HpkAUKtRfC9k=;
        b=prR2d7IC8d3KTQfnrJuC6umcuUbOTsTHYnt/TN+mB7C0ksEVF09+y5pzwSr5hUcgfQ
         3S6TNC1vUWzt0CWTWTgxvQjIa+srt85URQX7boT8YzDwD04EMRwBIQ5wnmBXQh5ojZFP
         mb5cXtroEJ1QUj5aQRtcZ2eSbRkZJBKgrfwSP3a1AOX3PzhiPJyWAxUHhPNM+zljeEdC
         RPEj/BOnWcjjlJYt0fOi284UWlelcdxkXKEvCjZSCzcEsRYi4gcGLSaSfe1/qg6igU91
         8UMCYOG2BCz3q0FrpJnwDfEEW2sdvH6TIn+LqzqIaLzJkw4LJ5e/RUB96Vy1z5+wyzxa
         40yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=exktuqp3Yz0O7DTOQAZcnS95GYeriR3HpkAUKtRfC9k=;
        b=LvKIw48pO2TO0Sc3zQ8nIJuXZENCbKMOmbZPy25VfMy5VNLl/ArZSnVjYMd8FkeyUZ
         WjMk21pUxo1OZznJ54QsRhvHPxZ0ouFEWqcFoq9xaBjB8xLmz/Z5BW5xd3Xdn4gjqNct
         xzEpy5jtt4fLJm3jw5BeGwZ2ciELnbHIm7zXrGryjrpO10HB8S/9Rf/fX2tHTOZ/PR5M
         7QHeKJZTZZTDOIsv7ya2ZFAiu0DvWqab98cM0rs4OdBaNaiz7JvuU9B9vKAwJy0y0jfm
         L0iHFW8bhi8oS1/eP/5AmMsG5v/3BEyFJuB2hgIhbQDHHqvZOFC3wYLLjKFwZkB+fXJw
         oexQ==
X-Gm-Message-State: ACrzQf2fLirXfphVG5/C7nxg7H0JBMAGhXamJAOUW6XnJN/wRm2w4zYG
	eWK2yUJyac2bmBvcaHM6OTvO8HVbDivgEWKcuBo=
X-Google-Smtp-Source: AMsMyM5v9dTlzaqMHbzByB0iQp6q4d17pnEGAvmmK5ZnmNrYfXTWs2nOXnV+B27bLIMXIY5zqA4ppXvLi5hsTQlRwTY=
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr22357803edv.129.1663725101717; Tue, 20
 Sep 2022 18:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com> <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
 <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com> <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 13:51:30 +1200
Message-ID: <CAGsJ_4y0HrWd90ApAn=eDpYrkCigM6MyH=3cYnSuunZ5QpsD3w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_185143_917213_454F8A03 
X-CRM114-Status: GOOD (  24.92  )
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

On Wed, Sep 21, 2022 at 1:50 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Sep 20, 2022 at 8:45 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 9/20/22 09:09, Barry Song wrote:
> > > On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> > > <anshuman.khandual@arm.com> wrote:
> > >>
> > >>
> > >> On 8/22/22 13:51, Yicong Yang wrote:
> > >>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > >>> +{
> > >>> +     return true;
> > >>> +}
> > >>
> > >> This needs to be conditional on systems, where there will be performance
> > >> improvements, and should not just be enabled all the time on all systems.
> > >> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> > >> a good metric ?
> > >
> > > for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> > > so we can actually disable tlb-batch on small systems.
> >
> > Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
> > That might not help much as the default value is 256 for NR_CPUS.
> >
> > OR
> >
> > arch_tlbbatch_should_defer() checks on
> >
> > 1. online cpus                  (dont enable batched TLB if <= X)
> > 2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)
> >
> > > just need to check if we will have any race condition since hotplug will
> > > make the condition true and false dynamically.
> >
> > If should_defer_flush() evaluate to be false, then ptep_clear_flush()
> > clears and flushes the entry right away. This should not race with other
> > queued up TLBI requests, which will be flushed separately. Wondering how
> > there can be a race here !
>
> Right. How about we make something as below?
>
> static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> {
>     /* for a small system very small number of CPUs, TLB shootdown is cheap */
>     if (num_online_cpus() <= 4 ||
> unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>           return false;
>
> #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>     if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>          return false;
> #endif
>
>     return true;
> }

sorry, i mean

static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
{
    /* for a small system very small number of CPUs, TLB shootdown is cheap */
    if (num_online_cpus() <= 4)
            return false;

#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
    if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
            return false;
#endif

    return true;
}

>
> Thanks
> Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
