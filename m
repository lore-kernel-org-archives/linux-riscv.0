Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8946C07E9D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PS9eaFVM/2yBH+pQlUFQz+xPVc0fuL+0z4S4sbQxRis=; b=vz5EpQXr8kCGyn
	MfCEfIYgPvJhnQVca+JnJAy1wmRYiZpJfI1kPLh4xGN0rRaL1f6CXhXtkUq66jTa9+y8BMto1oUvl
	ywagihs6Fp2UDmP1SvM5z2ivZ8FsoF1U1wDk+knyX5j+VrrkLaR5EENaPJ5C/EhoWeexxu9GT8GRh
	VX7kLCGn3WuvAn8cZsDzXRtM0wfPbm95u2MMyQtreo3lySU7+P8LXpLp2ZDr0ChZ0nwTZIyaEcJWO
	2FBm0p0wBz8gkkIwH2K5XJ70vFfD6oc9jqfmp5Zu7Fx9TSTvkKHWdqzmDXRl+wcgC+4Ctt3UGFuAJ
	iKBUht+xl0/0uS013jeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odKsG-00DID2-BL; Wed, 28 Sep 2022 00:24:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odKs4-00DIAi-I0; Wed, 28 Sep 2022 00:24:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lc7so24053765ejb.0;
        Tue, 27 Sep 2022 17:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yrRvoMA2qzsQLaNGkBWV3qKU0u6GXYvGhupTkuY6VEY=;
        b=N4SqAspV6MMkhBYCFIyWw1zoLE0Rd7s2OcFI1DceVn/pHLgQQpIGuPVe/Y5xz2rq7u
         4AwEph2NeuV3pICsTTUzwRekddH0yOeND7JGqULNGiEUieyWRG6v6tDzpLe64Ks46WYl
         +E7aPSySmJM5rrRbU/QTtIuWWnrypBa5Nee0vTcASR26Pbtt3a1rnWEXJiAhZ0LuaF3z
         G0Kpy5TJl/IDsRofANqT6QeQSyO+rxKfvYX1lEVX/uIl1opJ/g6T4wX2v3xFu9sWUBhf
         nxjbUpm/gkJf8RF8BM1xVL9NUSyaLL/yweBBM9Jtss7d1JdDL1D0xSUAW2CB9lb+daDC
         gCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yrRvoMA2qzsQLaNGkBWV3qKU0u6GXYvGhupTkuY6VEY=;
        b=pB0LKKqCzlQnVOwAOK7vN408M0SOFJ0+qCf8V8EMuqlRTQnMGUHbRFMyZyTPW++039
         7plcSKambLi9JfRLzjNcwpu0kN2UBYd9c7uH+6FH4B4ziDXrPoYEsz99ao5zCuG/bgGJ
         uqlOkEdGuj9dJA8cseb9SU9nWZhkDl40ZPjUU9WiAnGssIyFYrAhoZZ7vJcvR6SLygRv
         FWZHwCpo5Oo0p157iG4+2Jq0bKjtNCszNaHHA4iVm5O+xq6N61bwXJ5IEKMIEFpYWhvK
         Yb5i8S7MAFmKFoODGK5cW+IjpZ2rDkauRpD/p7PXXcp/etfd9kYXWwMnqg4LBj29oFdP
         Gvsw==
X-Gm-Message-State: ACrzQf1aM5aUFQ3K6QOqaqrC6jyp4O4tc3u26+1BN+oraDzHfyCSs/nW
	5fgiHzYfd0mDJlZRIweyHUfvwXHmUJqn3F2FV+E=
X-Google-Smtp-Source: AMsMyM7eMgPelqF9CjnEbxsTqqXy6pmBZpLW9pueVjK2kG6gmJQBXY3G4jO1eBrNDVmQMCspWLB2ar5LjeuRSz4OCpA=
X-Received: by 2002:a17:907:7eaa:b0:782:3d2b:20b0 with SMTP id
 qb42-20020a1709077eaa00b007823d2b20b0mr25078507ejc.746.1664324641882; Tue, 27
 Sep 2022 17:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com> <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
In-Reply-To: <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 28 Sep 2022 13:23:50 +1300
Message-ID: <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Yicong Yang <yangyicong@huawei.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, yangyicong@hisilicon.com, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, huzhanyuan@oppo.com, lipeifeng@oppo.com, 
	zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, linux-mm@kvack.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	wangkefeng.wang@huawei.com, xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>, 
	catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_172416_609923_3682DA55 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>
> On 2022/9/27 14:16, Anshuman Khandual wrote:
> > [...]
> >
> > On 9/21/22 14:13, Yicong Yang wrote:
> >> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >> +{
> >> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >> +    if (num_online_cpus() <= 4)
> >
> > It would be great to have some more inputs from others, whether 4 (which should
> > to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> > is optimal for an wide range of arm64 platforms.
> >

I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
with 5,6,7
cores.
I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
this patch.

so it seems safe to have
if (num_online_cpus()  < 8)

>
> Do you prefer this macro to be static or make it configurable through kconfig then
> different platforms can make choice based on their own situations? It maybe hard to
> test on all the arm64 platforms.

Maybe we can have this default enabled on machines with 8 and more cpus and
provide a tlbflush_batched = on or off to allow users enable or
disable it according
to their hardware and products. Similar example: rodata=on or off.

Hi Anshuman, Will,  Catalin, Andrew,
what do you think about this approach?

BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/

I do believe we need it based on the expensive cost of tlb shootdown in arm64
even by hardware broadcast.

>
> Thanks.
>
> >> +            return false;> +
> >> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> >> +    if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
> >> +            return false;
> >> +#endif
> >> +
> >> +    return true;
> >> +}
> >> +
> >
> > [...]
> >
> > .
> >

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
