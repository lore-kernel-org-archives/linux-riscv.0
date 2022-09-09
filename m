Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E07ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 04:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR6BvQi4fcaOPU42vTLzfI8PQOabqkF3FQn65Nsp4wo=; b=Sy/qFHwhdqu/09
	4TemZSaxFM79Q+0mpNvY5IvtJxBrhtK8sFmlpcE1dn4yvrVqdWcOGfz+wnEpw1N1qniY+OmIcEVHz
	NkDlwC6DotWUSrTUbPIME7A+GjyPu0Wa2wgDyaJyKkIK6bp2m219bYTj9eDexIqkkz08LNr26VMVt
	tC3zAuTLdYuqDdkPxMZ151vuuas81eF9sJF1xEW5viR2pA5sPkWbg5scCtsbDoOAqaEV/x839vrl/
	k594XxKFRlrcBHfc1VgyDcfOGyKHS2JnDqRZQqIY4vgYM7k5vf6o7wbhNaxM4/OAn8zq26xqSu23M
	484MQz60jMJHHVkaaD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVzz-00CQM2-5l; Fri, 09 Sep 2022 04:52:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVzk-00CQFx-CW; Fri, 09 Sep 2022 04:52:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9102153B;
	Thu,  8 Sep 2022 21:52:04 -0700 (PDT)
Received: from [10.162.41.8] (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 918713F73D;
	Thu,  8 Sep 2022 21:51:46 -0700 (PDT)
Message-ID: <b621dbb6-a98f-003e-3578-fc8b0f512d4a@arm.com>
Date: Fri, 9 Sep 2022 10:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/4] mm: rmap: Extend tlbbatch APIs to fit new
 platforms
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
 yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
 zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Barry Song <21cnbao@gmail.com>,
 wangkefeng.wang@huawei.com, xhao@linux.alibaba.com,
 prime.zeng@hisilicon.com, Barry Song <v-songbaohua@oppo.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Nadav Amit <namit@vmware.com>,
 Mel Gorman <mgorman@suse.de>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-4-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220822082120.8347-4-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_215200_564312_72DF721F 
X-CRM114-Status: GOOD (  21.34  )
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



On 8/22/22 13:51, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> Add uaddr to tlbbatch APIs so that platforms like ARM64 are

I guess 'uaddr' refers to a virtual address from the process address
space itself ? Please be more specific.

> able to apply this on their specific hardware features. For
> ARM64, this could be sending tlbi into hardware queues for
> the page with this particular uaddr.

This subject line and commit message here are misleading. The patch
adds an address argument to arch callback arch_tlbbatch_add_mm() as
arm64 platform could use that to perform the TLB flush batching ?

This patch can be folded into the next one, so that the requirement
for an additional argument 'uaddr' in the arch callback will be self
evident. OR if this is going to be a preparatory patch, then it must
explain how 'uaddr' argument is helpful on platforms like arm64 while
performing TLB flush batching. But TBH, just folding it to next patch
explains the context better.

> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/x86/include/asm/tlbflush.h |  3 ++-
>  mm/rmap.c                       | 10 ++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 8a497d902c16..5bd78ae55cd4 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  }
>  
>  static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> -					struct mm_struct *mm)
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
>  {
>  	inc_mm_tlb_gen(mm);
>  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a17a004550c6..7187a72b63b1 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
>  #define TLB_FLUSH_BATCH_PENDING_LARGE			\
>  	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
>  
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>  {
>  	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>  	int batch, nbatch;
>  
> -	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> +	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
>  	tlb_ubc->flush_required = true;
>  
>  	/*
> @@ -725,7 +726,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>  	}
>  }
>  #else
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>  {
>  }
>  
> @@ -1587,7 +1589,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				 */
>  				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>  
> -				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> +				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
>  			} else {
>  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>  			}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
