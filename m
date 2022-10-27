Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F69EECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+/q/FlqIUBKifq+DQ+XXQfkDmCnXw3e+Yhri/iIjPE=; b=stzpemaCdCw4KL
	Zj27YT2dFuKzKscOS3pb7BDIErEXw9lzPgrPEN7OXkQ4T7TeTWjP/rIlWf7t+8FBHhReXAiutIosZ
	rdSEMZ2hupxiuSqQFlr90ioGPm+pNz1mzC55O3plOZnG9I1FpOEKtctVBD6iJUnWekVvPMdOYcG2V
	Q8Gf+g4Z18X6IOxfZMTxid9fJ5zhKXngCUs4CIGJNDiXdMKSy2vuNGTwnfeyVF80iOKjLw+bsiYza
	8/Pah5cO0rMUMWv9Vu8ZOFMYePLwU1pe/55mmuaMplINwEajaipvYAtGEduwy/tykljuSsWBuyovj
	r9jJe7TOur5NCTKZGSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooArB-00Ezut-LL; Thu, 27 Oct 2022 21:56:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooAr0-00Ezs4-Gb; Thu, 27 Oct 2022 21:56:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id y14so8522438ejd.9;
        Thu, 27 Oct 2022 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
        b=mDkvDqdAij8U7APRP9yt0MpP0X4VRBno0CXMoN30kyF44cwwyG6SWPi0RMmgixT3Bt
         gDGI3NQdLQgzAOkEJRsHlv30WGUJ2hQblLeSpwcJ5STMlX4u4j8a3tQV2KR2m0LIQzBm
         AQJ503ah+Ml5VjRZNjjXGPE/NDYPCFMXA8zgjE5t0SVsx9Hw9IWLWZ3AMAqfOZwZ+V+e
         qYuMVsdT8DFxXyS63KjEsQME+nw+FVWDILA1TQjyCKoVJwx1GB6oAfX2SEHxx6BUkppp
         FRbFNc1nFH6dDsPv8S53kFNtYm8nzlkRSUmQ01A3lEAB9LpF+C23K7NNIPQTDmTy9HCd
         Qzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
        b=UEhEx1sNGvyWATzIHjzhDW2Qju2ov7QcBI4rlrZoAncFGlAzOGfmC56ewNrfW7X2lt
         TAGhevpbCSvujCg3V05S7Q+Zq4IcJzPSwqOADK6RQkNStRpVmMvqVawQuW/YIwvn+skx
         eFTauc4LoRTNNUxpUKwVdRaK7dF0vlOf/l0S2fJUOAooWhS46Ngx8YHS4ELIWaLWp5YO
         jm3D83BzKIzQLf36wgGJoNqQ4aC0xLKEu7Zn82z/fk+6YE+Enhd0e2p7ZCH8frI6Ubh8
         t1aN8AAG8Jp+UJcA7JH7BrlUaOyE34uT7sacYHm1CsGpQFyrw/fDjxGO5ugO7RTI5ihH
         xTNQ==
X-Gm-Message-State: ACrzQf00DoV7VZ9IXSMge0XfCn6a5epQwijEy0lvhlLv7QymwpwE/l98
	TxyNNO9pnAk0FIJdOCUhHXAVzWGNGpVMK7Wn0lk=
X-Google-Smtp-Source: AMsMyM6xp5XG883Sfz6qxUaX5+gPHPonCP4MPn0vbsj6Bzy6ERW5G8ermHkmXVNLJ97zdVUdhxlu0w7L/DMiIXxWfLY=
X-Received: by 2002:a17:906:8442:b0:7ad:960b:ef61 with SMTP id
 e2-20020a170906844200b007ad960bef61mr2610486ejy.702.1666907755828; Thu, 27
 Oct 2022 14:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com> <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
In-Reply-To: <87o7tx5oyx.fsf@stealth>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Oct 2022 10:55:42 +1300
Message-ID: <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Punit Agrawal <punit.agrawal@bytedance.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@huawei.com>, 
	yangyicong@hisilicon.com, corbet@lwn.net, peterz@infradead.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, darren@os.amperecomputing.com, 
	huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com, 
	guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>, 
	catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_145558_593741_9C485A30 
X-CRM114-Status: GOOD (  34.00  )
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

On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
<punit.agrawal@bytedance.com> wrote:
>
>
> [ Apologies for chiming in late in the conversation ]
>
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>
> > On 9/28/22 05:53, Barry Song wrote:
> >> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
> >>>
> >>> On 2022/9/27 14:16, Anshuman Khandual wrote:
> >>>> [...]
> >>>>
> >>>> On 9/21/22 14:13, Yicong Yang wrote:
> >>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>>>> +{
> >>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >>>>> +    if (num_online_cpus() <= 4)
> >>>>
> >>>> It would be great to have some more inputs from others, whether 4 (which should
> >>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> >>>> is optimal for an wide range of arm64 platforms.
> >>>>
> >>
> >> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> >> with 5,6,7
> >> cores.
> >> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> >> this patch.
> >>
> >> so it seems safe to have
> >> if (num_online_cpus()  < 8)
> >>
> >>>
> >>> Do you prefer this macro to be static or make it configurable through kconfig then
> >>> different platforms can make choice based on their own situations? It maybe hard to
> >>> test on all the arm64 platforms.
> >>
> >> Maybe we can have this default enabled on machines with 8 and more cpus and
> >> provide a tlbflush_batched = on or off to allow users enable or
> >> disable it according
> >> to their hardware and products. Similar example: rodata=on or off.
> >
> > No, sounds bit excessive. Kernel command line options should not be added
> > for every possible run time switch options.
> >
> >>
> >> Hi Anshuman, Will,  Catalin, Andrew,
> >> what do you think about this approach?
> >>
> >> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> >> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> >>
> >> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> >> even by hardware broadcast.
> >
> > Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> > with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>
> When running the test program in the commit in a VM, I saw benefits from
> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
> ptep_clear_flush() went from ~1% in the unpatched version to not showing
> up.
>
> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
> there any overhead? I am wondering what are the downsides of enabling
> the config by default.

As we are deferring tlb flush, but sometimes while we are modifying the vma
which are deferred, we need to do a sync by flush_tlb_batched_pending() in
mprotect() , madvise() to make sure they can see the flushed result. if nobody
is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.

>
> Thanks,
> Punit

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
