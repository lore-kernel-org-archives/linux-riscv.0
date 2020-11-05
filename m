Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD97DC4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:37:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C0C62078E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zCZazw3w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="KFYg/4QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C0C62078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PUgrRT2bfwfeOpf6paL0xMaQWWVNBJWyMg0xJhjW7wc=; b=zCZazw3wdkW+Z9VLSMBE8jgPQ
	2WPRVjY5b9bG1tegtP04g18UdhTxe0POC2oJnrbAHPP47rJFoxnzBQCdsUPx4WZ4yiyQZGSWtDMNv
	5uRh2OYgh0B0KFb/xTdzKdZOSDUvWJyZRwOLs6HGJruvlr2osFZPL3w6KIVxs263hwrprxf08+UyI
	y3axK/XNJVsN4WgZHxNvts+oKVSkwFJSDI9ed1hIwNX3GIfiErNMW6z3on5lO1Ys3ZGnZsmcYGp3s
	aBeEVu2VJK9ofFLn8nN5oR+DYHRMv5A9Zfiz+r6ADTiID5AjCd8GXBWYRQYOQWiXRr8MA8xT/pVpS
	6x47Q9iHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kak8W-0000ST-8f; Thu, 05 Nov 2020 18:37:28 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kak8T-0000Rb-FF
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 18:37:26 +0000
Received: by mail-pj1-x1041.google.com with SMTP id h4so515892pjk.0
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MGM75MbWMVjuBAKGEhlQqsHKNYq9FHhPvTUIcMnTGzY=;
 b=KFYg/4QZhhMSoNmMMrbqtJZljPZ/d0FcE7dc6krT85xKFfOc8nGhkh4hO4dw4/aRvu
 oH1fQpS4ly+KmEgeq8qs1zEm9wSgPCUcFtDTqu+qpnjqWVqjdfNUi2KSI/UGYNkOB8x2
 wMVbiBcW8swpOT9xRDEP0/TcQ+jLbhSV0Lo3o9P7ZA31vDdGQ2FH6o5SiGGXniwR8CjO
 g4ThQ6izeW5uijC3sOPjhZP0E4pyut+WtGtbpKn/n0I7G6SAkS8RO8ZDoyYFeZSmOtmU
 dF3IQpDhz0ZrJ0DVxVv5W3/sPBv3Zy7fHxSoZoM40JIQKkcFGz4NT8fcMt3Ec6wr6W94
 IhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MGM75MbWMVjuBAKGEhlQqsHKNYq9FHhPvTUIcMnTGzY=;
 b=jdXht72M9ffO1EUHX9v9xKl3pfd3flPY2T+D14y3DwcTGHSo683emXMsk0ScAHOcnw
 vl1r3q+lC2JTM8v8vwFiww2ui7pXBhSLkBKMvx64LiKjhiO+0K5jVujOZff/YFlztLtY
 YDX5hqNZSMCiVtITteqeEhv07SzzA41MtkSWm43jBGqLZkc1bObn7JQIsySnZ2YN29b5
 qfhqyV6hFp0Ik0lxNh+tx7aEtN5YYcFnT2M9qyfR5Ak6+xZCI7KXdoDQ5gJQQOUZ8V9/
 skzltNz/1O69bOcq8CI8nVfqz97JlnV5bhHa1raDmOhL0Kvfkt9AodqwajzRQjaDiNec
 cPww==
X-Gm-Message-State: AOAM532O66E1mJT/Ovp3kmVHgSYY10XyLeWVwMBPQWRH2vpeXbGECU8G
 x30h9Tej+FofIMLVmg4HWXi0mXO3RBlAkw==
X-Google-Smtp-Source: ABdhPJyx8WX3lPUwVoNd/hCMphUnG/KC58gxI2d4W8deVAQsKlsT4JcmgEM+9Q4StTJSII3+ruemUQ==
X-Received: by 2002:a17:90a:cf:: with SMTP id v15mr3781916pjd.49.1604601442918; 
 Thu, 05 Nov 2020 10:37:22 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 16sm3289204pfp.163.2020.11.05.10.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:37:21 -0800 (PST)
Date: Thu, 05 Nov 2020 10:37:21 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 10:37:19 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add kernel image sections to the resource tree
In-Reply-To: <20201012142410.308002-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-1424155d-61cb-4125-9e22-d11072e2e1dd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_133725_617205_6DDBB0C4 
X-CRM114-Status: GOOD (  36.28  )
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
Cc: anup@brainfault.org, Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 12 Oct 2020 07:24:10 PDT (-0700), mick@ics.forth.gr wrote:
> This patch (previously part of my kexec/kdump series) populates
> /proc/iomem with the various sections of the kernel image. We need
> this for kexec-tools to be able to prepare the crashkernel image
> for kdump to work. Since resource tree initialization is not
> related to memory initialization I added the code to kernel/setup.c
> and removed the original code (derived from the arm64 tree) from
> mm/init.c.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/kernel/setup.c | 160 ++++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/init.c      |  27 -------
>  2 files changed, 160 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c6dd3293..450f0142f 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -4,6 +4,8 @@
>   *  Chen Liqin <liqin.chen@sunplusct.com>
>   *  Lennox Wu <lennox.wu@sunplusct.com>
>   * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2020 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
>  #include <linux/init.h>
> @@ -48,6 +50,163 @@ atomic_t hart_lottery __section(.sdata);
>  unsigned long boot_cpu_hartid;
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> +/*
> + * Place kernel memory regions on the resource tree so that
> + * kexec-tools can retrieve them from /proc/iomem. While there
> + * also add "System RAM" regions for compatibility with other
> + * archs, and the rest of the known regions for completeness.
> + */
> +static struct resource code_res = { .name = "Kernel code", };
> +static struct resource data_res = { .name = "Kernel data", };
> +static struct resource rodata_res = { .name = "Kernel rodata", };
> +static struct resource bss_res = { .name = "Kernel bss", };
> +
> +static int __init add_resource(struct resource *parent,
> +				struct resource *res)
> +{
> +	int ret = 0;
> +
> +	ret = insert_resource(parent, res);
> +	if (ret < 0) {
> +		pr_err("Failed to add a %s resource at %llx\n",
> +			res->name, (unsigned long long) res->start);
> +		return ret;
> +	}
> +
> +	return 1;
> +}
> +
> +static int __init add_kernel_resources(struct resource *res)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * The memory region of the kernel image is continuous and
> +	 * was reserved on setup_bootmem, find it here and register
> +	 * it as a resource, then register the various segments of
> +	 * the image as child nodes
> +	 */
> +	if (!(res->start <= code_res.start && res->end >= data_res.end))
> +		return 0;
> +
> +	res->name = "Kernel image";
> +	res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	/*
> +	 * We removed a part of this region on setup_bootmem so
> +	 * we need to expand the resource for the bss to fit in.
> +	 */
> +	res->end = bss_res.end;
> +
> +	ret = add_resource(&iomem_resource, res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &code_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &rodata_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &data_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &bss_res);
> +
> +	return ret;
> +}
> +
> +static void __init init_resources(void)
> +{
> +	struct memblock_region *region = NULL;
> +	struct resource *res = NULL;
> +	int ret = 0;
> +
> +	code_res.start = __pa_symbol(_text);
> +	code_res.end = __pa_symbol(_etext) - 1;
> +	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	rodata_res.start = __pa_symbol(__start_rodata);
> +	rodata_res.end = __pa_symbol(__end_rodata) - 1;
> +	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	data_res.start = __pa_symbol(_data);
> +	data_res.end = __pa_symbol(_edata) - 1;
> +	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	bss_res.start = __pa_symbol(__bss_start);
> +	bss_res.end = __pa_symbol(__bss_stop) - 1;
> +	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	/*
> +	 * Start by adding the reserved regions, if they overlap
> +	 * with /memory regions, insert_resource later on will take
> +	 * care of it.
> +	 */
> +	for_each_memblock(reserved, region) {
> +		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes\n", __func__,
> +			      sizeof(struct resource));
> +
> +		res->name = "Reserved";
> +		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
> +		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
> +
> +		ret = add_kernel_resources(res);
> +		if (ret < 0)
> +			goto error;
> +		else if (ret)
> +			continue;
> +
> +		/*
> +		 * Ignore any other reserved regions within
> +		 * system memory.
> +		 */
> +		if (memblock_is_memory(res->start))
> +			continue;
> +
> +		ret = add_resource(&iomem_resource, res);
> +		if (ret < 0)
> +			goto error;
> +	}
> +
> +	/* Add /memory regions to the resource tree */
> +	for_each_memblock(memory, region) {
> +		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes\n", __func__,
> +			      sizeof(struct resource));
> +
> +		if (unlikely(memblock_is_nomap(region))) {
> +			res->name = "Reserved";
> +			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +		} else {
> +			res->name = "System RAM";
> +			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +		}
> +
> +		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> +		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> +
> +		ret = add_resource(&iomem_resource, res);
> +		if (ret < 0)
> +			goto error;
> +	}
> +
> +	return;
> +
> + error:
> +	memblock_free((phys_addr_t) res, sizeof(struct resource));
> +	/* Better an empty resource tree than an inconsistent one */
> +	release_child_resources(&iomem_resource);
> +}
> +
> +
>  void __init parse_dtb(void)
>  {
>  	if (early_init_dt_scan(dtb_early_va))
> @@ -73,6 +232,7 @@ void __init setup_arch(char **cmdline_p)
>
>  	setup_bootmem();
>  	paging_init();
> +	init_resources();
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f750e012d..05d6cf0c2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -541,39 +541,12 @@ void mark_rodata_ro(void)
>  }
>  #endif
>
> -static void __init resource_init(void)
> -{
> -	struct memblock_region *region;
> -
> -	for_each_memblock(memory, region) {
> -		struct resource *res;
> -
> -		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> -		if (!res)
> -			panic("%s: Failed to allocate %zu bytes\n", __func__,
> -			      sizeof(struct resource));
> -
> -		if (memblock_is_nomap(region)) {
> -			res->name = "reserved";
> -			res->flags = IORESOURCE_MEM;
> -		} else {
> -			res->name = "System RAM";
> -			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> -		}
> -		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> -		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> -
> -		request_resource(&iomem_resource, res);
> -	}
> -}
> -
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
>  	sparse_init();
>  	setup_zero_page();
>  	zone_sizes_init();
> -	resource_init();
>  }
>
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP

Thanks, this is on for-next.  I had to fix up a few things, LMK if I screwed
anything up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
