Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673E0C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXV4RdHT3YJk/iU0O++yY2bI6A6ps3782fVuXFHuQ98=; b=Nb2vf0a5JML9xm
	lZ9uit9U20m7vT/CJZofpTJvfCfhqbreOQW/MX05lnBsY0Xv2VVy1pKgtAlZn6LyDa+Uy4Drny+5X
	GrhxnJ5StNbADCxb1yShNIlyZ8aBLgMkC1PbQNYZAmiPVl+p1ec37TLBYKmBBZBUabCk1nVqFF62F
	xPUKdOxdCZm5YKLV9VpI7QQ24MXBHIQczUOnZXrRWRDEnKFxBraVSsoSGNvi0RlP4yMv69ipZWsKk
	qYUTy+8uX0+L/X0UvRRNKSNyTiOBV/D+xhhI9RiiSRhr4CyzJfRvt0MUY6Fu6rc9/HS+a7wM7wnnR
	JDReHaljN5ZOJ820Wz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTqD-00Haia-2S;
	Wed, 29 Mar 2023 11:19:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTqB-00Haha-0c
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 11:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680088782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=enFjLzQhsF/Rnw8cDNROHRwk0gQi15LMd/P2xbyR8Hg=;
	b=UCP1VYZXNHbzPc2YI5mncChb7Ko/xY0hEz8gC2EA8QhVS2oFYP4Rt0jkJoflYiH3sEOQ73
	LNRm4ZWL6X1EFnjUDIvnFY3KgrOPRf5yxZ0omy1ca8SpMJ4Wdm2AS68xd4Ws22nOhV2096
	36LE2XTlfvk2RFhxf3+rhlzx8UwX6F0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-iu7qY3XkPgyvebGfSpfT5w-1; Wed, 29 Mar 2023 07:19:36 -0400
X-MC-Unique: iu7qY3XkPgyvebGfSpfT5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07AA2185A7BA;
	Wed, 29 Mar 2023 11:19:36 +0000 (UTC)
Received: from localhost (ovpn-12-252.pek2.redhat.com [10.72.12.252])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3EFC15BA0;
	Wed, 29 Mar 2023 11:19:33 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:19:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, thunder.leizhen@huawei.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH -next v2 1/2] riscv: kdump: Implement
 crashkernel=X,[high,low]
Message-ID: <ZCQewkvSpaI52DSM@MiWiFi-R3L-srv>
References: <20230328115150.2700016-1-chenjiahao16@huawei.com>
 <20230328115150.2700016-2-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328115150.2700016-2-chenjiahao16@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_041943_298292_BF8F6906 
X-CRM114-Status: GOOD (  31.59  )
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

On 03/28/23 at 07:51pm, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Here introduce the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low".
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  arch/riscv/kernel/setup.c |  5 ++++
>  arch/riscv/mm/init.c      | 63 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 5d3184cbf518..ea84e5047c23 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -176,6 +176,11 @@ static void __init init_resources(void)
>  		if (ret < 0)
>  			goto error;
>  	}
> +	if (crashk_low_res.start != crashk_low_res.end) {
> +		ret = add_resource(&iomem_resource, &crashk_low_res);
> +		if (ret < 0)
> +			goto error;
> +	}
>  #endif
>  
>  #ifdef CONFIG_CRASH_DUMP
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 478d6763a01a..b7708cc467fa 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1152,6 +1152,28 @@ static inline void setup_vm_final(void)
>  }
>  #endif /* CONFIG_MMU */
>  
> +/* Reserve 128M low memory by default for swiotlb buffer */
> +#define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
> +
> +static int __init reserve_crashkernel_low(unsigned long long low_size)
> +{
> +	unsigned long long low_base;
> +
> +	low_base = memblock_phys_alloc_range(low_size, PMD_SIZE, 0, dma32_phys_limit);
> +	if (!low_base) {
> +		pr_err("cannot allocate crashkernel low memory (size:0x%llx).\n", low_size);
> +		return -ENOMEM;
> +	}
> +
> +	pr_info("crashkernel low memory reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
> +		low_base, low_base + low_size, low_size >> 20);
> +
> +	crashk_low_res.start = low_base;
> +	crashk_low_res.end = low_base + low_size - 1;
> +
> +	return 0;
> +}
> +
>  /*
>   * reserve_crashkernel() - reserves memory for crash kernel
>   *
> @@ -1163,6 +1185,7 @@ static void __init reserve_crashkernel(void)
>  {
>  	unsigned long long crash_base = 0;
>  	unsigned long long crash_size = 0;
> +	unsigned long long crash_low_size = 0;
>  	unsigned long search_start = memblock_start_of_DRAM();
>  	unsigned long search_end = memblock_end_of_DRAM();
>  
> @@ -1182,8 +1205,30 @@ static void __init reserve_crashkernel(void)
>  
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>  				&crash_size, &crash_base);
> -	if (ret || !crash_size)
> +	if (ret == -ENOENT) {
> +		/*
> +		 * crashkernel=X,[high,low] can be specified or not, but
> +		 * invalid value is not allowed.
> +		 */
> +		ret = parse_crashkernel_high(boot_command_line, 0, &crash_size, &crash_base);

I would add a local variable to assign boot_command_line to it just like
arm64 does. Then these lines could be shorter. 

	char *cmdline = boot_command_line;

> +		if (ret || !crash_size)
> +			return;
> +
> +		/*
> +		 * crashkernel=Y,low is valid only when crashkernel=X,high
> +		 * is passed and high memory is reserved successful.
> +		 */
> +		ret = parse_crashkernel_low(boot_command_line, 0, &crash_low_size, &crash_base);
> +		if (ret == -ENOENT)
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +		else if (ret)
> +			return;
> +
> +		search_start = dma32_phys_limit;
> +	} else if (ret || !crash_size) {
> +		/* Invalid argument value specified */
>  		return;
> +	}
>  
>  	crash_size = PAGE_ALIGN(crash_size);
>  
> @@ -1201,16 +1246,26 @@ static void __init reserve_crashkernel(void)
>  	 */
>  	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
>  					       search_start,
> -					       min(search_end, (unsigned long) SZ_4G));
> +					       min(search_end, (unsigned long)dma32_phys_limit));
>  	if (crash_base == 0) {

The above conditional check isn't right. If crashkernel=size@offset
specified, the reservation failure won't trigger retry. This seems to be
originally introduced by old commit, while this need be fixed firstly.

> -		/* Try again without restricting region to 32bit addressible memory */
> +		/* Try again above the region of 32bit addressible memory */
>  		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
> -						search_start, search_end);
> +						       max(search_start, (unsigned long)dma32_phys_limit),
> +						       search_end);
>  		if (crash_base == 0) {
>  			pr_warn("crashkernel: couldn't allocate %lldKB\n",
>  				crash_size >> 10);
>  			return;
>  		}
> +
> +		if (!crash_low_size)
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +	}
> +
> +	if ((crash_base > dma32_phys_limit - crash_low_size) &&
> +	    crash_low_size && reserve_crashkernel_low(crash_low_size)) {
> +		memblock_phys_free(crash_base, crash_size);
> +		return;
>  	}
>  
>  	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
> -- 
> 2.31.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
