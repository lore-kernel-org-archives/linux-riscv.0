Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA31EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 01:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24CC860C41
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 01:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24CC860C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RXGdSUeu8HC+TrwpqJhgrhrbNwOEkoB/kej1iw865Kc=; b=rWmq3pcx/40WMaaUlZTbkqGxr
	3fe7cSeijIuev+TK2QFXkUuZvUHM2LLc8j3dtgbe1O7FDkyi4+J7+ACAVzrON+qgh+FtQdDibUPK6
	PvU8viVy1jBLiwTG4Y+fLdpAIc7oXMswWmItaXAFVbKB28Un14+91mUw9vRIn/spj4Yx1JBTP1Wh+
	O/6ZyHzdH9R5tQQSvXQ1osY69P91egEuxcaBwgeve5gK6jE+XlJoL1rVh0TIBLiKTgX5GHwn2jtm+
	sNEDBK+whR9AFdYGidOZ8SIcyLTUQPQGx7+GDEGNv0aybofmnwbNwHmcQIKoY9NAi+Alytvp83uLJ
	FKX6aaonQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4wW4-0000SO-1Q; Thu, 28 Jan 2021 01:54:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4wW0-0000Ra-AU
 for linux-riscv@lists.infradead.org; Thu, 28 Jan 2021 01:54:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B37D064DA1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Jan 2021 01:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611798870;
 bh=kazYBYQ5Rv5CHJYapJOS74bABo2Vlx+7G+89OMtaBOg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=px6ANcID+0urJoYf1OeHCUU5JeDt+89EpJ4oQ9LkT0kDu5awObm+STLg+mQ69FC/e
 Hla7Wq/AJIjV+WKKUcgxpNm18ZRca8AYdbErj3Ct0TFQw36o+Df7fCwh/xR7v8eEoQ
 oVtRl+Et6LMNtFC/qh2p+RmF0EObnXJI5Yw0YLb8CUBqag5sc/jtG/u9BkemtubvJy
 vdnM/vk5czWUblZJS/22ocBS4HlsaBR+BuphWoenv6IE9nRbdfLh399oG/NBzwQtEO
 UOfwpN5L3sdHutKnh2G0/cgEmjqn+7bC1QTPIz3d47u44tgeeOO/arG5jLrUx5m/7M
 XXMqLQiESDKAg==
Received: by mail-lf1-f49.google.com with SMTP id v24so5480381lfr.7
 for <linux-riscv@lists.infradead.org>; Wed, 27 Jan 2021 17:54:29 -0800 (PST)
X-Gm-Message-State: AOAM533SNCflZH7Gy2U/dhOuAOEHlmOVLaQPBLTUtOWyWzl+fS++9PUW
 cREkGKq5rQXupVPBxPToh90sPKq5ISZ9xyX+sKY=
X-Google-Smtp-Source: ABdhPJzm6ND0k0/3z05DG9eg++Th0fCCp9Nap4UWfti0Q3nG6Cx3x7avOuhon2znIKXefLTIz/g/mMul3l3C5qmDaNw=
X-Received: by 2002:a19:38e:: with SMTP id 136mr6479978lfd.346.1611798867934; 
 Wed, 27 Jan 2021 17:54:27 -0800 (PST)
MIME-Version: 1.0
References: <1587970764-4393-1-git-send-email-vincent.chen@sifive.com>
 <mhng-75f253d6-21f7-47be-a163-62c232ade694@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-75f253d6-21f7-47be-a163-62c232ade694@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 28 Jan 2021 09:54:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSUoytm5MKOgtR4vBk-DP24ObF1EMQZq7Qsx2MzvURyGQ@mail.gmail.com>
Message-ID: <CAJF2gTSUoytm5MKOgtR4vBk-DP24ObF1EMQZq7Qsx2MzvURyGQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: set max_pfn to the PFN of the last page
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_205432_646229_E2FBF86F 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer & Vicent,

Please have a look at the patch:

https://lore.kernel.org/linux-riscv/20210121063117.3164494-1-guoren@kernel.org/T/#u

Seems our set_max_mapnr is wrong and it will make pfn_valid fault in
non-zero start-address.

On Tue, May 5, 2020 at 5:14 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 26 Apr 2020 23:59:24 PDT (-0700), vincent.chen@sifive.com wrote:
> > The current max_pfn equals to zero. In this case, I found it caused users
> > cannot get some page information through /proc such as kpagecount in v5.6
> > kernel because of new sanity checks. The following message is displayed by
> > stress-ng test suite with the command "stress-ng --verbose --physpage 1 -t
> > 1" on HiFive unleashed board.
> >
> >  # stress-ng --verbose --physpage 1 -t 1
> >  stress-ng: debug: [109] 4 processors online, 4 processors configured
> >  stress-ng: info: [109] dispatching hogs: 1 physpage
> >  stress-ng: debug: [109] cache allocate: reducing cache level from L3 (too high) to L0
> >  stress-ng: debug: [109] get_cpu_cache: invalid cache_level: 0
> >  stress-ng: info: [109] cache allocate: using built-in defaults as no suitable cache found
> >  stress-ng: debug: [109] cache allocate: default cache size: 2048K
> >  stress-ng: debug: [109] starting stressors
> >  stress-ng: debug: [109] 1 stressor spawned
> >  stress-ng: debug: [110] stress-ng-physpage: started [110] (instance 0)
> >  stress-ng: error: [110] stress-ng-physpage: cannot read page count for address 0x3fd34de000 in /proc/kpagecount, errno=0 (Success)
> >  stress-ng: error: [110] stress-ng-physpage: cannot read page count for address 0x3fd32db078 in /proc/kpagecount, errno=0 (Success)
> >  ...
> >  stress-ng: error: [110] stress-ng-physpage: cannot read page count for address 0x3fd32db078 in /proc/kpagecount, errno=0 (Success)
> >  stress-ng: debug: [110] stress-ng-physpage: exited [110] (instance 0)
> >  stress-ng: debug: [109] process [110] terminated
> >  stress-ng: info: [109] successful run completed in 1.00s
> >  #
> >
> > After applying this patch, the kernel can pass the test.
> >
> >  # stress-ng --verbose --physpage 1 -t 1
> >  stress-ng: debug: [104] 4 processors online, 4 processors configured stress-ng: info: [104] dispatching hogs: 1 physpage
> >  stress-ng: info: [104] cache allocate: using defaults, can't determine cache details from sysfs
> >  stress-ng: debug: [104] cache allocate: default cache size: 2048K
> >  stress-ng: debug: [104] starting stressors
> >  stress-ng: debug: [104] 1 stressor spawned
> >  stress-ng: debug: [105] stress-ng-physpage: started [105] (instance 0) stress-ng: debug: [105] stress-ng-physpage: exited [105] (instance 0) stress-ng: debug: [104] process [105] terminated
> >  stress-ng: info: [104] successful run completed in 1.01s
> >  #
> >
> > Fixes: 0651c263c8e3 (RISC-V: Move setup_bootmem() to mm/init.c)
> > Cc: stable@vger.kernel.org
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Yash Shah <yash.shah@sifive.com>
> > Tested-by: Yash Shah <yash.shah@sifive.com>
> >
> > Changes since v1:
> > 1. Add Fixes line and Cc stable kernel
> > Changes since v2:
> > 1. Fix typo in Anup email address
> > ---
> >  arch/riscv/mm/init.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index fab855963c73..157924baa191 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -149,7 +149,8 @@ void __init setup_bootmem(void)
> >       memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> >
> >       set_max_mapnr(PFN_DOWN(mem_size));
> > -     max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> > +     max_pfn = PFN_DOWN(memblock_end_of_DRAM());
> > +     max_low_pfn = max_pfn;
> >
> >  #ifdef CONFIG_BLK_DEV_INITRD
> >       setup_initrd();
>
> I'm dropping the Fixes tag, as the actual bug goes back farther than that
> commit, that's just as far as it'll auto-apply.
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
