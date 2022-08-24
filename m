Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76926C32796
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UZn8qMGh0aS6YOC49BoFIuWAQKG78ZRwmQ8RmUQ40Q=; b=Obubx9ssfCXkB3
	WCaGLaeSNmYFgsgxEiyhElf5uiO5G9VoW5TAh3lwZxe3n35KXa/u/H2YZBz0Mprn7LcRX+RDcdDky
	X/TeF9g2vWpy7T4tb4pHPhO/GOy6bDoBYiepKPBxGIaI9tyDaf0QRbZ3s5X8EcWmUOEokkfMohPZP
	dNHILHFBPj684gOyvFe/V2N96V5EjATbMFjZi41WgxrViGHjR0Hxyf0hJ0/1zSslP8ibvDDwUbD4r
	ge1uaktS4TSRIWXNp4jwLnMQnKoNpiKZZZ39fDhovsBrLXFTM7+nfiTzNagGeFBpjQ+EjFlpL/cd2
	Ki4OGo+STDoixUBU60qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmsL-00Bohh-Er; Wed, 24 Aug 2022 09:40:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQms8-00BoZr-N5; Wed, 24 Aug 2022 09:40:30 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MCLcR2060znTkv;
	Wed, 24 Aug 2022 17:37:59 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:40:08 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:40:06 +0800
Message-ID: <0dc19773-81f7-84c2-2bc7-7d8d987b24b7@huawei.com>
Date: Wed, 24 Aug 2022 17:40:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/4] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<xhao@linux.alibaba.com>, <prime.zeng@hisilicon.com>,
	<anshuman.khandual@arm.com>, Anshuman Khandual <khandual@linux.vnet.ibm.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-3-yangyicong@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220822082120.8347-3-yangyicong@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_024029_128165_D4884AFE 
X-CRM114-Status: GOOD (  15.07  )
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


On 2022/8/22 16:21, Yicong Yang wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
>
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> [https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> [Rebase and fix incorrect return value type]

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> ---
>   arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
>   mm/rmap.c                       |  9 +--------
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda3118f3b27..8a497d902c16 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>   	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>   }
>   
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	bool should_defer = false;
> +
> +	/* If remote CPUs need to be flushed then defer batch the flush */
> +	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> +		should_defer = true;
> +	put_cpu();
> +
> +	return should_defer;
> +}
> +
>   static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>   {
>   	/*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index edc06c52bc82..a17a004550c6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -687,17 +687,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>    */
>   static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>   {
> -	bool should_defer = false;
> -
>   	if (!(flags & TTU_BATCH_FLUSH))
>   		return false;
>   
> -	/* If remote CPUs need to be flushed then defer batch the flush */
> -	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -		should_defer = true;
> -	put_cpu();
> -
> -	return should_defer;
> +	return arch_tlbbatch_should_defer(mm);
>   }
>   
>   /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
