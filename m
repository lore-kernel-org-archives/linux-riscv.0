Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D004CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loi9f0obmD9NXhiu3VhfKlC1jGFZk6tlBtdm3r2rcX4=; b=phsHS1WKcU1vsq
	yzbOROkoGxLMVx5VTcCkvEmR3QN+ud2zAPbrysfV7ROBd/OeNttv/0kB4AR+HHx1Yu8y7li9zbak7
	y+3alJE7GpfJZXpt+SrXJZfjGnXyNHNWRkW+7Ia9G8ELdwMZcvwyCTfgO4w+tmYrT9CHHWevcBoce
	vAjKDOC4xpYGbp7CLgJf9MlqflJC3YDst25SaT5z+Cxbj5doqAed7FIcbdUSkrtc8pARLqJP7iMCw
	AQGm56+QXVZDKempDs92sBBHFmD/T2hOJ0NOL0CJrRrGOpADrGUB+grkkC5Ksj22LZZ1Y/yHReZxH
	4eX7rwlDjsb+f0tnBsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEq7B-00000004cB2-1k5J;
	Thu, 08 Oct 2026 15:33:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEq76-00000004c97-3t3A;
	Thu, 08 Oct 2026 15:32:59 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261008153249euoutp02b4a87ccc77d200f3890d561df189c3bd~cl7g7aAvm2788727887euoutp02g;
	Thu,  8 Oct 2026 15:32:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261008153249euoutp02b4a87ccc77d200f3890d561df189c3bd~cl7g7aAvm2788727887euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791473569;
	bh=YmUv+dVinO4DGyPfi86Rp05KJ0iKog7r1zuWIsZpoNM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Z5UeDLE+dZcsY3l6oA16V8qttCBxPFEJpUpwd2p2jJDN2RWsNpoMi9Gug31sE6gmX
	 xEpsLkgCQwKTVH4iIL1j1xtexJJNNydzs2KShaf9Uvr/sXk+MAVI8vVIQ+YZBs4a/f
	 zFRkjDjJ/PUKBoz2RBPEiGBJ0pC1W9GZs22YyXtc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261008153248eucas1p144bd3391fe1a79a1d6dfcd386c4a7e94~cl7fxbUbR2862828628eucas1p1P;
	Thu,  8 Oct 2026 15:32:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261008153245eusmtip112c16c496ac689d363e975f151c082fb~cl7dN0sE_2339023390eusmtip1f;
	Thu,  8 Oct 2026 15:32:45 +0000 (GMT)
Message-ID: <c2e38455-cb31-4854-ab84-4a370fabc1f9@samsung.com>
Date: Thu, 8 Oct 2026 17:32:44 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Jonathan
	Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
	Dunlap <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Marc
	Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K
	Poulose <Suzuki.Poulose@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
	Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Petr Tesarik
	<ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, Madhavan
	Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, Russell
	King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
	Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>, Peter
	Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
	Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <yq5ao6d48dqr.fsf@kernel.org>
X-CMS-MailID: 20261008153248eucas1p144bd3391fe1a79a1d6dfcd386c4a7e94
X-Msg-Generator: CA
X-RootMTR: 20261008143238eucas1p1ee087352709f2a82d2aec95540ae2031
X-EPHeader: CA
X-CMS-RootMailID: 20261008143238eucas1p1ee087352709f2a82d2aec95540ae2031
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
	<20260924060756.1325156-7-aneesh.kumar@kernel.org>
	<asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
	<asYiOgskwi8JYLe_@willie-the-truck> <yq5awlrt3dwo.fsf@kernel.org>
	<yq5av77c92oo.fsf@kernel.org> <aseRzPshcoys7AJS@arm.com>
	<CGME20261008143238eucas1p1ee087352709f2a82d2aec95540ae2031@eucas1p1.samsung.com>
	<yq5ao6d48dqr.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_083257_236335_DD740EE7 
X-CRM114-Status: GOOD (  36.58  )
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

On 08.10.2026 16:32, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
>> On Thu, Oct 08, 2026 at 11:03:27AM +0530, Aneesh Kumar K.V wrote:
>>> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>>>> Will Deacon <will@kernel.org> writes:
>>>>> On Wed, Oct 07, 2026 at 11:04:05AM +0100, Catalin Marinas wrote:
>>>>>> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
>>>>>>> On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>>>>>>> @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
>>>>>>>>  	if (swiotlb_force_disable)
>>>>>>>>  		return SWIOTLB_POOL_NONE;
>>>>>>>>  
>>>>>>>> -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>>>>>>>> +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>>>>>>>> +	    !restricted_dma_pool_present)
>>>>>>>>  		return SWIOTLB_POOL_CC_GUEST;
>>>>>>> I think this check on the restricted DMA pool is too general -- the pool
>>>>>>> could be tied to a specific DMA-capable peripheral and so treating its
>>>>>>> presence as a global property isn't right.
>>>>>> I agree it's a hack but that was the simplest way to avoid the pVMs
>>>>>> getting a bounce buffer after this patch. More than happy to leave it
>>>>>> out and reduce the buffer on cmdline or we come up with some better
>>>>>> heuristics.
>>>>> Hrm, that does mean that reverting just this part will regress pVMs
>>>>> because they'll suddenly be allocating a tonne more memory for an
>>>>> entirely unused swiotlb buffer. So I think I'd prefer to drop the entire
>>>>> series until this has been worked out properly.
>>>>>
>>>>>> Another option could be the arch code passing another flag that it
>>>>>> doesn't want an encrypted pool (e.g. when running in a pKVM guest) but I
>>>>>> don't particularly this either. The arch code doesn't know whether
>>>>>> there's an alternative pool.
>>>>> At that point, the default size may as well be driven by the
>>>>> drivers/virt/coco driver.
>>>>>
>>>>>> That said, such heuristics should have been a separate patch to make it
>>>>>> easier to review/drop.
>>>>> I think the only right way to get a semi-accurate heuristic is to take
>>>>> into account the set of dma-capable devices that will use the swiotlb
>>>>> pool, but that's fiddly and should probably be tackled as a separate
>>>>> series. Maybe a simpler hack in that direction would be to take the
>>>>> SWIOTLB_POOL_CC_GUEST if _any_ device is going to use swiotlb? You'll
>>>>> run into the usual problem of not being able to tell if a device is
>>>>> DMA-capable or not, but you could probably look for a global restricted
>>>>> DMA pool and, if that doesn't exist, check for per-device restricted pools
>>>>> on dma-coherent devices (since restricted DMA isn't supported by ACPI) as
>>>>> a reasonable approximation.
>>>> So, something like this?
>>>>
>>>> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>>>> 	    swiotlb_cc_guest_needs_default_pool())
>>>> 		return SWIOTLB_POOL_CC_GUEST;
>>>>
>>> Detecting a DMA-capable device is not straightforward, and if we get it
>>> wrong, we will enable SWIOTLB_POOL_CC_GUEST unnecessarily. Would the
>>> code below be a reasonable approximation of what you suggested?
>>>
>>> Another option would be to make swiotlb_cc_guest_needs_default_pool() a
>>> weak function that architectures can override. arm64 pKVM could then use
>>> a different scheme (for this patch series default to false). Would that
>>> be preferable?
>> Even the rmem check for each device is still a hack that may bite us in
>> the future (private devices for example would not need swiotlb). I'm
>> thinking more and more of leaving the sizing an arch-specific decision,
>> don't bother generalising it at all.
>>
>> On pKVM vs CCA guests, there's really nothing specific here to pKVM
>> guests. The only difference is that confidential guests that so far have
>> run without a swiotlb buffer will regress if their memory is tight. For
>> confidential guests without dedicated rmem (either CCA or pKVM), I think
>> our options are either command line swiotlb sizing or dynamic swiotlb.
>>
>> Could you respin your series while leaving out the generic sizing? IOW,
>> no x86 code generalisation. We can discuss the best strategy on sizing
>> later (I haven't checked how much of this series still makes sense
>> without the generic sizing).
>>
> It would mostly consist of the first three cleanup patches, followed by
> three patches that replace the addressing_limit argument with flags.
>
> #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
> /* Initialize a pool for devices with limited DMA addressing. */
> #define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 1)
> /* Initialize a pool that requires architecture remapping. */
> #define SWIOTLB_INIT_REMAP		(1 << 2)
> /* Initialize a pool for DMA to memory-encrypted host or guest memory. */
> #define SWIOTLB_INIT_MEM_ENCRYPT		(1 << 3)
> /* Initialize a pool for unaligned kmalloc bouncing. */
> #define SWIOTLB_INIT_KMALLOC		(1 << 4)
> /* Do not initialize a pool unless SWIOTLB is explicitly required. */
> #define SWIOTLB_INIT_DEFAULT_OFF		(1 << 5)
>
> This results in the large change below. I'm not sure we want to do this
> for no real benefit other than making swiotlb_should_init() slightly
> easier to follow.
>
> static bool __init swiotlb_should_init(unsigned int flags)
> {
> 	if (swiotlb_force_disable)
> 		return false;
>
> 	if (swiotlb_force_bounce)
> 		return true;
>
> 	if (flags & (SWIOTLB_INIT_REMAP | SWIOTLB_INIT_MEM_ENCRYPT)))
> 		return true;
>
> 	/* Explicit requirements override an architecture's default opt-out. */
> 	if (flags & SWIOTLB_INIT_DEFAULT_OFF)
> 		return false;
>
> 	return flags & (SWIOTLB_INIT_ADDRESSING_LIMIT | SWIOTLB_INIT_KMALLOC);
> }
>
> Marek,
>
> Patch 3 is a fix, so you may want to take it even if we drop the rest of
> the series. Perhaps the first three patches could be taken together?

Okay, I will take only the first 3 patches to dma-mapping-for-next branch now
and wait for the remaining patches until they gets sorted out.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
