Return-Path: <SRS0=fQ+v=GU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6E6C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 04:59:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6E622DBF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 04:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6E622DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=apd57nPAJ1CKdSVZSz5AnJhEow/UhfTNVTY3pXH35E8=; b=tdOPAt+TMzOMX1GTNpWxQT+A+
	rDdIE/tkvplR83+EaOL320FHXA+JNg7X75zPCUkEOV2pqolDQSzquVBe68EXsFEs3CctLwwQZjHkN
	8pbPqoTjhAgG7eT914RPcnU4ucQ1C2XUchI5qndYv4826mTsRpcYG2Zy5E4z0RMgNJQyxfqQaEtoV
	Jz6PfARotQ4OpvVvUcb5Iz52DNLAcCKOSU4+ae6vTt/oXqdS74mYn6U4rmzig83vzI8G8ga6ZuaF4
	X0kEvLLUd6BhadHzlk5bhMnzpzKzJzVToDHwSsxYvXmfbPcYjoPiaS55yLXr9oF1MG5a1m2Q/7VNx
	RWTxa1UOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l109Z-0000S8-42; Sun, 17 Jan 2021 04:59:05 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l109V-0000QG-6E; Sun, 17 Jan 2021 04:59:02 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DJN2j4k0lzj3fR;
 Sun, 17 Jan 2021 12:57:49 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Sun, 17 Jan 2021 12:58:52 +0800
Subject: Re: [PATCH v3 3/4] ARM: Covert to reserve_initrd_mem()
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
 <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
 <20210115054606.124502-4-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <07838e5e-de03-8caf-6599-e516c35cc3c8@huawei.com>
Date: Sun, 17 Jan 2021 12:58:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210115054606.124502-4-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_235901_574811_3FC351AC 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: guoren@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

update Russell's mail address.


On 2021/1/15 13:46, Kefeng Wang wrote:
> Covert to the generic reserve_initrd_mem() function.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/arm/mm/init.c | 43 +------------------------------------------
>   1 file changed, 1 insertion(+), 42 deletions(-)
>
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 828a2561b229..a29e14cd626c 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -153,47 +153,6 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
>   	return phys;
>   }
>   
> -static void __init arm_initrd_init(void)
> -{
> -#ifdef CONFIG_BLK_DEV_INITRD
> -	phys_addr_t start;
> -	unsigned long size;
> -
> -	initrd_start = initrd_end = 0;
> -
> -	if (!phys_initrd_size)
> -		return;
> -
> -	/*
> -	 * Round the memory region to page boundaries as per free_initrd_mem()
> -	 * This allows us to detect whether the pages overlapping the initrd
> -	 * are in use, but more importantly, reserves the entire set of pages
> -	 * as we don't want these pages allocated for other purposes.
> -	 */
> -	start = round_down(phys_initrd_start, PAGE_SIZE);
> -	size = phys_initrd_size + (phys_initrd_start - start);
> -	size = round_up(size, PAGE_SIZE);
> -
> -	if (!memblock_is_region_memory(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
> -		       (u64)start, size);
> -		return;
> -	}
> -
> -	if (memblock_is_region_reserved(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region - disabling initrd\n",
> -		       (u64)start, size);
> -		return;
> -	}
> -
> -	memblock_reserve(start, size);
> -
> -	/* Now convert initrd to virtual addresses */
> -	initrd_start = __phys_to_virt(phys_initrd_start);
> -	initrd_end = initrd_start + phys_initrd_size;
> -#endif
> -}
> -
>   #ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
>   void check_cpu_icache_size(int cpuid)
>   {
> @@ -215,7 +174,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
>   	/* Register the kernel text, kernel data and initrd with memblock. */
>   	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
>   
> -	arm_initrd_init();
> +	reserve_initrd_mem();
>   
>   	arm_mm_memblock_reserve();
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
