Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C62C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 13:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280C260F45
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 13:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 280C260F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quv9pZq9BfTJOVuKM9iVJ7Ko6PoaxK6beBA8S2nm1MU=; b=HfBUK+2I+KaPCN
	cpYMRgjvMCVolNioyGY3Ybrnu3pcbGZ0/bmsbIkqGssAJynIp9/OtWN6keZ5KehLV7lR4HUJ+vdJz
	9TiCuEZdHNgFhuP56CzLYAmE9WRfXb4xMO5+JuqQQ8AAtmUKPDqzlBCPLF/clFiW9BPoioC7NFvkI
	3zok25w4Qy1Pg4gn1suQ/9wDiXYhG06LZWxzmZKjFWGfVDbIS977EtDWsTAoSKRkDxAgJiFMmBG+N
	VhCtyNMsTBjoPS4mpLaOov0ORzkHTBnJaHPNJCYxVxFTEaqhEA0wfOusmxhBhl5uhO2olbzxJ6zZu
	euyhPXpxj0twW9R95wNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAuXe-00336r-93; Tue, 03 Aug 2021 13:33:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAuKr-002xFC-O4; Tue, 03 Aug 2021 13:19:59 +0000
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GfFkV5ZHJzckN7;
 Tue,  3 Aug 2021 21:16:18 +0800 (CST)
Received: from dggeme703-chm.china.huawei.com (10.1.199.99) by
 dggeme754-chm.china.huawei.com (10.3.19.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 3 Aug 2021 21:19:51 +0800
Received: from dggeme703-chm.china.huawei.com ([10.9.48.230]) by
 dggeme703-chm.china.huawei.com ([10.9.48.230]) with mapi id 15.01.2176.012;
 Tue, 3 Aug 2021 21:19:51 +0800
From: "limingwang (A)" <limingwang@huawei.com>
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini
 <pbonzini@redhat.com>
CC: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Damien Le Moal
 <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v19 11/17] RISC-V: KVM: Implement MMU notifiers
Thread-Topic: [PATCH v19 11/17] RISC-V: KVM: Implement MMU notifiers
Thread-Index: AQHXgqwy4s+Z/E3/sE6z7Q5kXgZ04KthiTvA
Date: Tue, 3 Aug 2021 13:19:51 +0000
Message-ID: <38734ad1008a46169dcd89e1ded9ac62@huawei.com>
References: <20210727055450.2742868-1-anup.patel@wdc.com>
 <20210727055450.2742868-12-anup.patel@wdc.com>
In-Reply-To: <20210727055450.2742868-12-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.17]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_061958_237234_C48E9EAE 
X-CRM114-Status: GOOD (  15.92  )
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

> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> fa9a4f9b9542..4b294113c63b 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -300,7 +300,8 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t
> addr,
>  	}
>  }
> 
> -static void stage2_unmap_range(struct kvm *kvm, gpa_t start, gpa_t size)
> +static void stage2_unmap_range(struct kvm *kvm, gpa_t start,
> +			       gpa_t size, bool may_block)
>  {
>  	int ret;
>  	pte_t *ptep;
> @@ -325,6 +326,13 @@ static void stage2_unmap_range(struct kvm *kvm,
> gpa_t start, gpa_t size)
> 
>  next:
>  		addr += page_size;
> +
> +		/*
> +		 * If the range is too large, release the kvm->mmu_lock
> +		 * to prevent starvation and lockup detector warnings.
> +		 */
> +		if (may_block && addr < end)
> +			cond_resched_lock(&kvm->mmu_lock);
>  	}
>  }
> 
> @@ -405,7 +413,6 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa,
> phys_addr_t hpa,
>  out:
>  	stage2_cache_flush(&pcache);
>  	return ret;
> -
>  }
> 
>  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm, @@
> -547,7 +554,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  	spin_lock(&kvm->mmu_lock);
>  	if (ret)
>  		stage2_unmap_range(kvm, mem->guest_phys_addr,
> -				   mem->memory_size);
> +				   mem->memory_size, false);
>  	spin_unlock(&kvm->mmu_lock);
> 
>  out:
> @@ -555,6 +562,73 @@ int kvm_arch_prepare_memory_region(struct kvm
> *kvm,
>  	return ret;
>  }
> 
> +bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	if (!kvm->arch.pgd)
> +		return 0;
> +
> +	stage2_unmap_range(kvm, range->start << PAGE_SHIFT,
> +			   (range->end - range->start) << PAGE_SHIFT,
> +			   range->may_block);
> +	return 0;
> +}
> +
> +bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range) {
> +	int ret;
> +	kvm_pfn_t pfn = pte_pfn(range->pte);
> +
> +	if (!kvm->arch.pgd)
> +		return 0;
> +
> +	WARN_ON(range->end - range->start != 1);
> +
> +	ret = stage2_map_page(kvm, NULL, range->start << PAGE_SHIFT,
> +			      __pfn_to_phys(pfn), PAGE_SIZE, true, true);
> +	if (ret) {
> +		kvm_err("Failed to map stage2 page (error %d)\n", ret);
> +		return 1;
> +	}

Hi, Anup

I think that it is not appropriate to add kvm_err here, because stage2_set_pte function
may apply for memory based on the pcache parameter. If the value of pcache is NULL,
stage2_set_pte function considers that there is not enough memory and here an invalid
error log is generated.

As an example, this error log is printed when a VM is migrating. But finally the VM migration
is successful. And if the kvm_err is added to the same position in the ARM architecture, the
same error log is also printed.

Mingwang

> +	return 0;
> +}
> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
