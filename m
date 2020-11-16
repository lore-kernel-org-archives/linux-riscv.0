Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00C9C4742C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 09:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CA72224F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 09:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vr8OKBBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CA72224F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bXPpvLg/evTCvRQLPEcyOBj8UfzUJmwT6QcV8UjDZXQ=; b=vr8OKBBNXqnW12aAjOkXjL1I6
	aCBapxMQWQuM0xEk8G7b/+e8x51wm4wEPTtX9sOrEA+zNoE5N+xzHbMqkRSiave0AnVT/U96l40Rv
	3nJboHObqML8n+z+ILK+b9L57AZ3hpNEc/CgJrC54PgEgEtBqD5mD68LweW5bSuHHYb21Ms808nhH
	m4eKs5s44Bui9fdcSkYX6oZU3NeZw8AH7WrIdeUSt7QlqFvcGdGrQPn/c0BgBTktcXA9uofuKdXIf
	b1J31TyFNIZtfL8w+cvilm9j2qTkLQSUz1BslZkQ7tJyt7l2j5UXGMRnBuzNLpFjbokhekgeUP7Tq
	zwo4Yi1Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keapX-0003IN-Fc; Mon, 16 Nov 2020 09:29:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keapS-0003GM-MX; Mon, 16 Nov 2020 09:29:44 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CZP0W3V2cz53sK;
 Mon, 16 Nov 2020 17:29:15 +0800 (CST)
Received: from dggpemm000003.china.huawei.com (7.185.36.128) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 16 Nov 2020 17:29:32 +0800
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggpemm000003.china.huawei.com (7.185.36.128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 17:29:32 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Mon, 16 Nov 2020 17:29:32 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: RE: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
 programming
Thread-Topic: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
 programming
Thread-Index: AQHWtoxQ6udyTXND00qYbGxBYAdmN6nKgOyw
Date: Mon, 16 Nov 2020 09:29:31 +0000
Message-ID: <186ade3c372b44ef8ca1830da8c5002b@huawei.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-11-anup.patel@wdc.com>
In-Reply-To: <20201109113240.3733496-11-anup.patel@wdc.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_042943_239631_15D5E5A1 
X-CRM114-Status: GOOD (  18.93  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 Alexander Graf <graf@amazon.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Wubin \(H\)" <wu.wubin@huawei.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Anup Patel [mailto:anup.patel@wdc.com]
> Sent: Monday, November 9, 2020 7:33 PM
> To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> kvm@vger.kernel.org; kvm-riscv@lists.infradead.org;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Anup Patel
> <anup.patel@wdc.com>; Jiangyifei <jiangyifei@huawei.com>
> Subject: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
> programming
> 
> This patch implements all required functions for programming the stage2 page
> table for each Guest/VM.
> 
> At high-level, the flow of stage2 related functions is similar from KVM
> ARM/ARM64 implementation but the stage2 page table format is quite
> different for KVM RISC-V.
> 
> [jiangyifei: stage2 dirty log support]
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     |  12 +
>  arch/riscv/include/asm/pgtable-bits.h |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |  19 +
>  arch/riscv/kvm/mmu.c                  | 649
> +++++++++++++++++++++++++-
>  arch/riscv/kvm/vm.c                   |   6 -
>  6 files changed, 672 insertions(+), 16 deletions(-)
> 

......

> 
>  int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu, @@ -69,27 +562,163 @@
> int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  			 gpa_t gpa, unsigned long hva,
>  			 bool writeable, bool is_write)
>  {
> -	/* TODO: */
> -	return 0;
> +	int ret;
> +	kvm_pfn_t hfn;
> +	short vma_pageshift;
> +	gfn_t gfn = gpa >> PAGE_SHIFT;
> +	struct vm_area_struct *vma;
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
> +	bool logging = (memslot->dirty_bitmap &&
> +			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> +	unsigned long vma_pagesize;
> +
> +	mmap_read_lock(current->mm);
> +
> +	vma = find_vma_intersection(current->mm, hva, hva + 1);
> +	if (unlikely(!vma)) {
> +		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> +		mmap_read_unlock(current->mm);
> +		return -EFAULT;
> +	}
> +
> +	if (is_vm_hugetlb_page(vma))
> +		vma_pageshift = huge_page_shift(hstate_vma(vma));
> +	else
> +		vma_pageshift = PAGE_SHIFT;
> +	vma_pagesize = 1ULL << vma_pageshift;
> +	if (logging || (vma->vm_flags & VM_PFNMAP))
> +		vma_pagesize = PAGE_SIZE;
> +
> +	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> +		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> +
> +	mmap_read_unlock(current->mm);
> +
> +	if (vma_pagesize != PGDIR_SIZE &&
> +	    vma_pagesize != PMD_SIZE &&
> +	    vma_pagesize != PAGE_SIZE) {
> +		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> +		return -EFAULT;
> +	}
> +
> +	/* We need minimum second+third level pages */
> +	ret = stage2_cache_topup(pcache, stage2_pgd_levels,
> +				 KVM_MMU_PAGE_CACHE_NR_OBJS);
> +	if (ret) {
> +		kvm_err("Failed to topup stage2 cache\n");
> +		return ret;
> +	}
> +
> +	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> +	if (hfn == KVM_PFN_ERR_HWPOISON) {
> +		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> +				vma_pageshift, current);
> +		return 0;
> +	}
> +	if (is_error_noslot_pfn(hfn))
> +		return -EFAULT;
> +
> +	/*
> +	 * If logging is active then we allow writable pages only
> +	 * for write faults.
> +	 */
> +	if (logging && !is_write)
> +		writeable = false;
> +
> +	spin_lock(&kvm->mmu_lock);
> +
> +	if (writeable) {

Hi Anup,

What is the purpose of "writable = !memslot_is_readonly(slot)" in this series?

When mapping the HVA to HPA above, it doesn't know that the PTE writeable of stage2 is "!memslot_is_readonly(slot)".
This may causes the difference between the writability of HVA->HPA and GPA->HPA.
For example, GPA->HPA is writeable, but HVA->HPA is not writeable.

Is it better that the writability of HVA->HPA is also determined by whether the memslot is readonly in this change?
Like this:
-    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
+    hfn = gfn_to_pfn_prot(kvm, gfn, writeable, NULL);

Regards,
Yifei

> +		kvm_set_pfn_dirty(hfn);
> +		mark_page_dirty(kvm, gfn);
> +		ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> +				      vma_pagesize, false, true);
> +	} else {
> +		ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> +				      vma_pagesize, true, true);
> +	}
> +
> +	if (ret)
> +		kvm_err("Failed to map in stage2\n");
> +
> +	spin_unlock(&kvm->mmu_lock);
> +	kvm_set_pfn_accessed(hfn);
> +	kvm_release_pfn_clean(hfn);
> +	return ret;
>  }
> 

......


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
