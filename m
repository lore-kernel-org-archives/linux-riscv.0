Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66F9C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4OyxQ/MYvXi7eB95PgPATfbk6ofqRtG4GvjeR/9KpE=; b=Lk0Zn0f+HosNaA
	EdX5POFjR7cRPz6d21aTh21mlKm2HfYMRwzUpvHyIG1CcAHN61dz0VAt592bjvPruo9IQVhu7pZkW
	wbhErhoIe6IPZnotHgoota3ULV90YgQhyob0mUMuDF6W7HVjvr3VFrOmctxOaWXYne6sUEmXclaTF
	sY+HPZP+dzmQmaxRfxfuALfOymK+tv2/SM4JAB99WtNUfjsiIMjZ7rr3TAdrPpSLP0/23gJgLwbss
	kdsNgPWderM0GR5kQ8wTmIes7xlzrAzFqlrQKqbP+kCEBgNstLuZMSbSnYxayyMDRSz2cx6sAsIdR
	igVI47Bq6tZBstnwFrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfPq-00BV4S-0o;
	Tue, 16 Jan 2024 09:07:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfPn-00BV42-2T
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 09:07:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E533B20013;
	Tue, 16 Jan 2024 09:07:16 +0000 (UTC)
Message-ID: <b7c1d204-22b0-4a04-a4bb-1aaf4e643c22@ghiti.fr>
Date: Tue, 16 Jan 2024 10:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231202134224.4029-1-jszhang@kernel.org>
 <aea8222e-ec0a-4844-abd0-7fe102bc2bec@ghiti.fr> <ZaZCqAir6BdiN80K@xhacker>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZaZCqAir6BdiN80K@xhacker>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_010724_087390_3D2F02C8 
X-CRM114-Status: GOOD (  23.53  )
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

On 16/01/2024 09:47, Jisheng Zhang wrote:
> On Tue, Jan 16, 2024 at 09:23:47AM +0100, Alexandre Ghiti wrote:
>> Hi Jisheng,
>>
>> On 02/12/2023 14:42, Jisheng Zhang wrote:
>>> After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
>>> for !dma_coherent"), for non-coherent platforms with less than 4GB
>>> memory, we rely on users to pass "swiotlb=mmnn,force" kernel parameters
>>> to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
>>> further: If no bouncing needed for ZONE_DMA, let kernel automatically
>>> allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
>>> non-coherent platforms, so that no need to pass "swiotlb=mmnn,force"
>>> any more.
>> IIUC, DMA_BOUNCE_UNALIGNED_KMALLOC is enabled for all non-coherent
>> platforms, even those with less than 4GB of memory. But the DMA bouncing
>> (which is necessary to enable kmalloc-8/16/32/96...) was not enabled unless
>> the user specified "swiotlb=mmnn,force" on the kernel command line. But does
>> that mean that if the user did not specify "swiotlb=mmnn,force", the
>> kmalloc-8/16/32/96 were enabled anyway and the behaviour was wrong (by lack
>> of DMA bouncing)?
> Hi Alex,
>
> For coherent platforms, kmalloc-8/16/32/96 was enabled.
>
> For non-coherent platforms, if memory is more than 4GB, kmalloc-8/16/32/96 was enabled.
>
> For non-coherent platforms, if memory is less than 4GB, kmalloc-8/16/32/96 was not
> enabled. If users want kmalloc-8/16/32/96, we rely on users to pass "swiotlb=mmnn,force"


That's what I was unsure of :)


>
> This patch tries to remove the "swiotlb=mmnn,force" requirement for the
> last case. After this patch, kernel automatically uses "1MB swiotlb buffer per
> 1GB of RAM for kmalloc() bouncing" by default.
>
> So this is an enhancement.


Great, so you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>
> Thanks
>> I'm trying to understand if that's a fix or an enhancement.
>>
>> Thanks,
>>
>> Alex
>>
>>
>>> The math of "1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing"
>>> is taken from arm64. Users can still force smaller swiotlb buffer by
>>> passing "swiotlb=mmnn".
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>
>>> since v2:
>>>    - fix build error if CONFIG_RISCV_DMA_NONCOHERENT=n
>>>
>>>    arch/riscv/include/asm/cache.h |  2 +-
>>>    arch/riscv/mm/init.c           | 16 +++++++++++++++-
>>>    2 files changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
>>> index 2174fe7bac9a..570e9d8acad1 100644
>>> --- a/arch/riscv/include/asm/cache.h
>>> +++ b/arch/riscv/include/asm/cache.h
>>> @@ -26,8 +26,8 @@
>>>    #ifndef __ASSEMBLY__
>>> -#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>>>    extern int dma_cache_alignment;
>>> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>>>    #define dma_get_cache_alignment dma_get_cache_alignment
>>>    static inline int dma_get_cache_alignment(void)
>>>    {
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index 2e011cbddf3a..cbcb9918f721 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -162,11 +162,25 @@ static void print_vm_layout(void) { }
>>>    void __init mem_init(void)
>>>    {
>>> +	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
>>>    #ifdef CONFIG_FLATMEM
>>>    	BUG_ON(!mem_map);
>>>    #endif /* CONFIG_FLATMEM */
>>> -	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
>>> +	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
>>> +	    dma_cache_alignment != 1) {
>>> +		/*
>>> +		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
>>> +		 * buffer per 1GB of RAM for kmalloc() bouncing on
>>> +		 * non-coherent platforms.
>>> +		 */
>>> +		unsigned long size =
>>> +			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
>>> +		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
>>> +		swiotlb = true;
>>> +	}
>>> +
>>> +	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
>>>    	memblock_free_all();
>>>    	print_vm_layout();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
