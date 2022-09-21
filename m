Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E8DC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n47WrmIumrRZhEzRMqRiTNnCYHIEo5qKv71sdbmw1Lw=; b=yvX3IVLXXED1PG
	iY0nJU3iMqCfbOdar4sNgBXeD6Ue+uPigafMOMEel1RW4pSHQLw9x75lqeaAG4TKFOtXxN7tMQxRM
	SyJcCciUHnt0qapmR3qAls7K1U5tgKFS40EVKGu5vb1ZgiqqU0nc4jVavsL4xypsyR45A8f8sqJoW
	0ol0SzTEvPsS4834Q9hvigujXa096RzyxJfEaIj8Iml/Y1lfTi1NC10cR3BznqCo672G3uZyymjvF
	piOMGR0g2Oo+CXLAQY+wfkedBknu9CKodgdYcDYGQFPSHB91FczSszQVGVaeysUyh4mWUnjwB4VUX
	F07aiHs6j9s27rYekDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaotS-0085Tx-3A; Wed, 21 Sep 2022 01:51:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaosp-00859k-6v; Wed, 21 Sep 2022 01:50:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id lh5so10317806ejb.10;
        Tue, 20 Sep 2022 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6BQ+n+4VW6hHwhXqAlkDoSlNz/771IN91baTY6cW3mc=;
        b=Hsxb1h+EMvvkdsefMmznixkb9yPc3ROIaG+LUt0+8GdgrzGiBW3AgAI0RjPjnW1a93
         DY3sKYF7CvzXAe00TGJRDY77eMBmAM0480SdlHfjxG4lyc5EbwrTXa15468ciTechEYT
         WGETfvgoH53XN8KYelN7OAjCyWHBudaSxMJ2L8rTgdvY1WUYvP7Q8KL14RK4KdBht206
         uGl//hA7A5//q7f7eaYrI0DnwnygQF2ZaOGzjx7l19o32olfp0XYIWQPV7GeFwqwofTY
         VpclnNyeiusjibhMe9Hq1ilMiZtIFMoCJZSuw0/xwB2H0iVevrwbGzuhW+Knat88VluT
         5vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6BQ+n+4VW6hHwhXqAlkDoSlNz/771IN91baTY6cW3mc=;
        b=few60jCmIBS+ghxXppxorHe94FK/Uj4Lf73bIwJ2OR5nVrMQ0Oy+YV/yNaJrWdixBa
         oqhbi9Wjvz91bESvxN7mvl0OcVH+PzHa/IBNf5ik6wBS3cTgslb4tTdvgmQDHqDjxHHu
         q3JF2RyrAI840Wqgj8xB9mhyMv4B97ZCNbWB45BHwMNutm/vART8ZRsd8X8qnvyi+6Oy
         tGIirDzV9nCw7OZtOIPAdZzCZbWFwhXRXBDGYw3eQwl2wAsDG+Q2TJscq7C+xdb2vSbi
         pLWbXW74Nxj86YEVvg8XE6zK5Y0rffoAvw1kCwrzCkt1yjBzq8dOVAuWHqOW8xrZksC5
         StRA==
X-Gm-Message-State: ACrzQf1HJc5nClnNXMqZC/YR+ryyJOTlYTMwHDgsl2kXujc7Mi4fC96K
	ebuCcGcOOgHGp0DxQtxR1/+Ny2rDI+ZREXrsRJI=
X-Google-Smtp-Source: AMsMyM4BpJG31Gs91JHdJmZGt8F5S3yEOSSf/UDOFiYo+s9qWWQwy3OlMqr27Xca6ZiQ4/GcrUZCaWrZRKbnRXNpOoI=
X-Received: by 2002:a17:907:3e89:b0:779:4869:b799 with SMTP id
 hs9-20020a1709073e8900b007794869b799mr17924838ejc.91.1663725035280; Tue, 20
 Sep 2022 18:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com> <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
 <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
In-Reply-To: <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 13:50:24 +1200
Message-ID: <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220920_185039_318125_04032E2C 
X-CRM114-Status: GOOD (  20.80  )
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

On Tue, Sep 20, 2022 at 8:45 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 9/20/22 09:09, Barry Song wrote:
> > On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >>
> >> On 8/22/22 13:51, Yicong Yang wrote:
> >>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>> +{
> >>> +     return true;
> >>> +}
> >>
> >> This needs to be conditional on systems, where there will be performance
> >> improvements, and should not just be enabled all the time on all systems.
> >> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> >> a good metric ?
> >
> > for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> > so we can actually disable tlb-batch on small systems.
>
> Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
> That might not help much as the default value is 256 for NR_CPUS.
>
> OR
>
> arch_tlbbatch_should_defer() checks on
>
> 1. online cpus                  (dont enable batched TLB if <= X)
> 2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)
>
> > just need to check if we will have any race condition since hotplug will
> > make the condition true and false dynamically.
>
> If should_defer_flush() evaluate to be false, then ptep_clear_flush()
> clears and flushes the entry right away. This should not race with other
> queued up TLBI requests, which will be flushed separately. Wondering how
> there can be a race here !

Right. How about we make something as below?

static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
{
    /* for a small system very small number of CPUs, TLB shootdown is cheap */
    if (num_online_cpus() <= 4 ||
unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
          return false;

#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
    if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
         return false;
#endif

    return true;
}

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
