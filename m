Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8667DC2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3964D613C3
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3964D613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NC94pfkGgGyKuWBxYX762/uUbwN+k/EjMBClDe9BlrE=; b=lEChGH5skMxvO+/ksgFjjZLitg
	c+O092HoIcmVsJcByPZDIU7rT9lvQAxXVAGBDgIXe56WTe+o0Jpkpyhu4MbcVZSPNJRJdYVoZ9s3o
	MlQW3NwmmzLCTQPX2sc/07lREsDBRrlH1LOd+/5s4YbwtBVcPKRJdWjTLGYpiz/fOSZ59S4l/hym7
	Q6FDfokiAg4i1XoWfo/U1ByCEAZRiQGDQEsdAyKapha2B4qmXRfwi4piSxZfxqmfROD4VJELKPTj2
	9n+HdEQpIHhaSub0jqpbW8M3b4US2xg10qBkscVVKz14FP+Q2Q9Gb6llRAFTUXPpXSGxFDzeLozM9
	mw6OCUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llm7W-00BCJS-SY; Wed, 26 May 2021 05:30:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llm7T-00BCHP-It
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:30:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q25so117204pfn.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 22:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hDYUDmZv1mSfVqejIfcboudVE6wsUa6+OahMlWik0tM=;
 b=iUQIUIWOGD5Qe8r/yuDwG446zmgI4ofbjQb3TZK8fGD+P7nBdIZ+CEbD91AVH5GshD
 Axjp8sFacOA2yV5nFvHN6hYeaX3xuqU12q7im6RU/88STMFNom+dkBjYWHrU6RUyhGtq
 3hkmpXKRqGXTyHqdgyfHrJifFCZZKQOD+sa/TVDwHoS2+NrwxDFMXEjbohOeakKzDEoD
 VZzJq++8wDWHbHrNUH7ceUbsSeEnd2flkZ0En0MrWt1McCN4JYpJ85myvHfhvUei2WYG
 jQAEtBOb5HhmMlmAKU3mXa3esczWIDofG0A5ou4I3xyVPcj9Hbb0zx3Q1txaMIq+a5z1
 zm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hDYUDmZv1mSfVqejIfcboudVE6wsUa6+OahMlWik0tM=;
 b=Wx+NJmtrKH/Q0lwOzgRZWYHr8DBM4LV3Xwdj1KOW9ZBh4gMtsxdMC7qTxbjvNr/O6C
 A9gtlO8QHKIg7/3Ftt14nOQi7Y5YiU2I55dZ3gWhSBEMs29gOKz0F/x4gFs/186Ytw/z
 /St20Enr2rg6sEyBcayyhBdjRg/iUHaIhhtQA56cYOFAGnwdQCGZsbY+d7Lk3j1xya8e
 K9cIpQJi17msivVNwhiqOZjFspIXSmLT+/DyM3GKsPzCAOrIlpno6ov4rqMeTzSF5zjf
 /g5LIW4FAAjRGMgF0De0lcK0dH7O4MFaD4jzfNLh7k7rvyiXl+sN5aPAbTyD1cUhycYy
 hZeQ==
X-Gm-Message-State: AOAM530hMGzL4kZZtTRNiDbHIE2vGLm7rnsoKaKboB04++ub8cGR4Jh8
 0sIukVSPyLaSs40YbVCMdLv1Gw==
X-Google-Smtp-Source: ABdhPJwO3DBcDHG3edSM4G3dabflg3h4nZEYz71hsOD8jdKVz+xwCV+wsWYrYL3yuFrB7ids29WP8g==
X-Received: by 2002:a62:17cc:0:b029:2de:39c1:7eb7 with SMTP id
 195-20020a6217cc0000b02902de39c17eb7mr33572853pfx.26.1622007013553; 
 Tue, 25 May 2021 22:30:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n23sm12531178pgv.76.2021.05.25.22.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 22:30:12 -0700 (PDT)
Date: Tue, 25 May 2021 22:30:12 -0700 (PDT)
X-Google-Original-Date: Tue, 25 May 2021 16:51:26 PDT (-0700)
Subject: Re: [PATCH] riscv: Optimize switch_mm by passing "cpu" to
 flush_icache_deferred()
In-Reply-To: <20210512014231.466aff04@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-7775ab3c-847e-48f0-adaa-590285b8bbca@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_223015_706861_08E44100 
X-CRM114-Status: GOOD (  24.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 11 May 2021 10:42:31 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Directly passing the cpu to flush_icache_deferred() rather than calling
> smp_processor_id() again.
>
> Here are some performance numbers:
>
> With a run of hackbench 30 times on a single core riscv64 Qemu instance
> with 1GB memory:
>
> without this patch: mean 36.934
> with this patch: mean 36.104 (improved by 2.24%)

I don't really put any stock in QEMU performance numbers for this sort 
of thing, but for something like this where we're just skipping an 
expensive call I don't really see a reason to even need performance 
numbers at all as we can just consider it an obvious optimization.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/context.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 68aa312fc352..6d445f2888ec 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -281,10 +281,9 @@ static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
>   * actually performs that local instruction cache flush, which implicitly only
>   * refers to the current hart.
>   */
> -static inline void flush_icache_deferred(struct mm_struct *mm)
> +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
>  {
>  #ifdef CONFIG_SMP
> -	unsigned int cpu = smp_processor_id();
>  	cpumask_t *mask = &mm->context.icache_stale_mask;
>
>  	if (cpumask_test_cpu(cpu, mask)) {

This proceeds to perform only a local icache flush, which means it will 
break if any callers use a different CPU number.  That large comment at 
the top alludes to this behavior, but I went ahead and added a line to 
make that more explicit.

> @@ -320,5 +319,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>
>  	set_mm(next, cpu);
>
> -	flush_icache_deferred(next);
> +	flush_icache_deferred(next, cpu);
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
