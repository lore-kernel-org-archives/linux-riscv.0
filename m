Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30262C4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A612087D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShBHuXfr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="DaEIMJCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A612087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=D6PnoslSZD8p6LZkZtRrn8jYFV6rF8J8p/ZiR/PdxbQ=; b=ShBHuXfrhFt9vfA6d0H3xjiRP
	v08z0wqiFn1Zng4zvVflLUISh93EHPzNL5f6Y3olmaWZPAjZw8Pq55nKW8eUkaSok21lzpCE+g0A/
	pQWnKTvlyUF+5PBKMsD1YMznE/XmCQ/mOfarVTqyApl7DU5IYFl1URXfoN+WRe9SQz9w6T5dJnf5N
	sgeF/GxSSHF4F+73aYWfchVxsKm4Z/yVAYFUNvhBiUE//JUXB0Baf9IK6c8cJnDse53CEmGA3uzbB
	WK1cVB/VRhqrgpd/hA85/Hk8eklanGFQusaq++EfqZRMSTIPlJsJNMX0Immla6wH1CpdzfL/QSas8
	hRkbHTNHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kajcH-0004n1-3X; Thu, 05 Nov 2020 18:04:09 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kajcD-0004lq-J0
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 18:04:06 +0000
Received: by mail-pj1-x1044.google.com with SMTP id i19so469166pjl.2
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zX4VMo7vZEE7ICionhSrGJsNWvksBKu00y6yhaRC4qY=;
 b=DaEIMJCI8LEsV7IGW7Y7Q0SLQbEHx4PJkrEbmDm0MBWt0uBvA3xBaQZNWWB8kSb5ze
 tp4WhyOdsiHbpjTXbMAar0RIzRb8aDMx9e6VvmI1tdtHL7i6DG6uSmsI4waMfOteRi5O
 VIaBHRQhuYGR5imXpzSQA5WR3zs+aD6Jbhtlpj7JOZzohojkgZ/kpRXWUZCAcLvwUH5b
 qTWXuZ9lR/2S85OCOWrb/HhIOGXCttfuW7rHZB6/9fYoMsVZdqvwjXBuAE5+NPKH3jGc
 JFbSb9k9n0bYzl/TgKi8PLOT1amtOcrZGW9dyFrmxv22r9mQah3XuEASZtjfd8zUI/I0
 ubWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zX4VMo7vZEE7ICionhSrGJsNWvksBKu00y6yhaRC4qY=;
 b=LFjPxmM85YRVQZzSkY5moYaIX2JkpG59v1M+L8VIWBBIkzc+usdxH53je/BZ6U8xEt
 MWPWc4vAmooAx3zpI0Prl7YYWoPmlA6ZbzOOuRLn7VNYb9+xx4MR0E46/ID2g8oslFzh
 UJoUC1J6UCJKmwAEjvUOH8N40/Fu7vW2OIGhhGEmE658SbcG5dIBqnlYc8M0NUyYH6wV
 q6P6bNY3KdlFnkfUR0503wxHpxALzptfQnfaZeLFkphlBnQsK6pPGez7uBo3w+vsEx5y
 vPLO+yJmm7r/Trs+5TmQZSP7iNeSBRyu49tLHkgZhclySkhlbk7h4MWn/DgP3T1Q0hVG
 39MA==
X-Gm-Message-State: AOAM530wn2I2Eq5P8rpoIUJVX7kX9uk6Ul0tSe0JxxhbWrlwk7cDRXOV
 7ZnWS6fF0f2Qt42f3DfMogq9Og==
X-Google-Smtp-Source: ABdhPJzEsdDVrmyeGMdJHHmFTIFpuHkdbjOIsRDANFCa+H4pqi6R0Eu/fQZtW9Q9PGisJjj9KQvytw==
X-Received: by 2002:a17:90b:a51:: with SMTP id
 gw17mr3411183pjb.218.1604599439388; 
 Thu, 05 Nov 2020 10:03:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k5sm3019100pjs.14.2020.11.05.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:03:58 -0800 (PST)
Date: Thu, 05 Nov 2020 10:03:58 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 09:56:21 PST (-0800)
Subject: Re: [PATCH v4] RISC-V: Remove any memblock representing unusable
 memory area
In-Reply-To: <20201007215159.1287602-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-93876e12-52f0-414a-bdea-1a2c06392854@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_130405_666872_7F5751FD 
X-CRM114-Status: GOOD (  24.32  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 07 Oct 2020 14:51:59 PDT (-0700), Atish Patra wrote:
> RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
> that size from DRAM start is unusable. Just remove any memblock pointing
> to those memory region without worrying about computing the maximum size.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> Changes from v3->v4:
> 1. Rebased on top of for-next.
> ---
>  arch/riscv/mm/init.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4eda1a7e8521..da43c17544c5 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -156,9 +156,8 @@ static void __init setup_initrd(void)
>
>  void __init setup_bootmem(void)
>  {
> -	phys_addr_t mem_size = 0;
> -	phys_addr_t total_mem = 0;
> -	phys_addr_t mem_start, start, end = 0;
> +	phys_addr_t mem_start = 0;
> +	phys_addr_t start, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
>  	u64 i;
> @@ -166,21 +165,18 @@ void __init setup_bootmem(void)
>  	/* Find the memory region containing the kernel */
>  	for_each_mem_range(i, &start, &end) {
>  		phys_addr_t size = end - start;
> -		if (!total_mem)
> +		if (!mem_start)
>  			mem_start = start;
>  		if (start <= vmlinux_start && vmlinux_end <= end)
>  			BUG_ON(size == 0);
> -		total_mem = total_mem + size;
>  	}
>
>  	/*
> -	 * Remove memblock from the end of usable area to the
> -	 * end of region
> +	 * The maximal physical memory size is -PAGE_OFFSET.
> +	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> +	 * as it is unusable by kernel.
>  	 */
> -	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> -	if (mem_start + mem_size < end)
> -		memblock_remove(mem_start + mem_size,
> -				end - mem_start - mem_size);
> +	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
>
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);

This is on fixes.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
