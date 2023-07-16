Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD5EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvU3YJcY2Ub3QktD8Kx6ObMyi9KNSutkGABMnFIC6J0=; b=4sjWwaNDMS1VRP
	wIBkFQ8k5vvOY4E1Tfuzu/Qb0IGXNBRiiInmAag8EjengpUylinJ0zMWGwrnbRwJrvRiEpi1n2SqR
	o3ve26RwqRGOzzO92r/weA/9eRdL4tQh65OL0BwttTrsC0VIyIEjydHczm5KGzzxFDEIGFkILQ4AX
	opsKhErExxN0UWoVv4FpkdwyyAXP9qJzn2MJ4pSEELef1GR/OczglfcvCE/mQuEqDRXQQIu9p610M
	XIkTVnebYXoTnvBLNSj1wQzBNLgIBZa1QXaZvlcyveSSavBCxU5c2sInipWz2cQGRUsqOo1II4HzX
	L1Fhks5cNrUIozZJUPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3QO-00CDHC-32;
	Sun, 16 Jul 2023 15:12:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3Pl-00CD8v-1I;
	Sun, 16 Jul 2023 15:12:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2D3260D2D;
	Sun, 16 Jul 2023 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFB8C433C9;
	Sun, 16 Jul 2023 15:11:58 +0000 (UTC)
Date: Sun, 16 Jul 2023 08:11:56 -0700
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	mark.rutland@arm.com, ryan.roberts@arm.com, will@kernel.org,
	anshuman.khandual@arm.com, linux-doc@vger.kernel.org,
	corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com, yangyicong@hisilicon.com,
	huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
	guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
	Jonathan.Cameron@huawei.com, Barry Song <v-songbaohua@oppo.com>,
	Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v10 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation/migration
Message-ID: <ZLQIvPpKvjWppc59@arm.com>
References: <20230710083914.18336-1-yangyicong@huawei.com>
 <20230710083914.18336-5-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710083914.18336-5-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_081203_752069_E33482AA 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, Jul 10, 2023 at 04:39:14PM +0800, Yicong Yang wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7856c3a3e35a..f0ce8208c57f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -96,6 +96,7 @@ config ARM64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT

I don't want EXPERT to turn on a feature that's not selectable by the
user. This would lead to different performance behaviour based on
EXPERT. Just select it unconditionally.

> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 412a3b9a3c25..4bb9cec62e26 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	dsb(ish);
>  }
>  
> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> -					 unsigned long uaddr)
> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> +					   unsigned long uaddr)
>  {
>  	unsigned long addr;
>  
>  	dsb(ishst);
> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>  	__tlbi(vale1is, addr);
>  	__tlbi_user(vale1is, addr);
>  }
>  
> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +					 unsigned long uaddr)
> +{
> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> +}
> +
>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>  				  unsigned long uaddr)
>  {
> @@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>  	dsb(ish);
>  }
>  
> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH

If it's selected unconditionally, we won't need this #ifdef here.

> +
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	/*
> +	 * TLB flush deferral is not required on systems, which are affected with

"affected by" and drop the comma before "which".

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
