Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F455C5B552
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 01:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgWYojYsznoCq/yzgxUPUue3CSz0RdCtxM6mhgtxvEg=; b=lDb0iqjt06bex8
	ge3a16jtaiWbG1KmclkPgO4m16u/+lDBUHaLyMLC5qiMZyhn9EVe4NvIaV/wrOHWieZMM65yKGLq4
	MflhI3c/xWQV5tUlq9A91ixhJ4qk59LqRxk2yh3ta0VpgtLw+DVuKi5WTuIyVMV3e2jY/221leB0m
	RzS+3EywjeiZ4sCSHxcWWzw77R5RHW26BzTmI2mS2eh3TTANSRdCOSOqJDNofkL6w0P+668xkuXcO
	6CFdY1cIQnOyPaFCR7sU9Enjn7cCVtQmo3lGcB0rBtcr82beDiYl37yiDQwTj9rAaJLWLbVUGMUMf
	ilWRhvMGidYc0YTfVHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLou-0000000GtXn-2Qh5;
	Fri, 06 Jun 2025 01:24:32 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLor-0000000GtW8-3eG4
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 01:24:31 +0000
Message-ID: <62127f1a-9225-463b-99d7-947970ea4566@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749173057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJK/hnY54oQVvH8TRxxIkliQGw6OOPeITtsaEgMgZ8k=;
	b=VqrJUU7Amz2gH+bou9q0erywhgpVUg2nncDGYqxQoZbbuJh7LnXqJMgfFuQ2OjBL6qgugV
	sK6FikWQIxN939njpJ9xE5K/OkWoG5dotw2aamV0tg+mbifo1GFPRrPsvi+0Yka9v4AwmH
	yNeWH1tlRfe7vofZ/Mp0MY3jyMBez/w=
Date: Thu, 5 Jun 2025 18:24:08 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 06/13] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL
 with KVM_REQ_TLB_FLUSH
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-7-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-7-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_182430_054519_DCFBA3D3 
X-CRM114-Status: GOOD (  14.56  )
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


On 6/4/25 11:14 PM, Anup Patel wrote:
> The KVM_REQ_HFENCE_GVMA_VMID_ALL is same as KVM_REQ_TLB_FLUSH so
> to avoid confusion let's replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
> KVM_REQ_TLB_FLUSH. Also, rename kvm_riscv_hfence_gvma_vmid_all_process()
> to kvm_riscv_tlb_flush_process().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 4 ++--
>   arch/riscv/kvm/tlb.c              | 8 ++++----
>   arch/riscv/kvm/vcpu.c             | 8 ++------
>   3 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 134adc30af52..afaf25f2c5ab 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -36,7 +36,6 @@
>   #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
>   #define KVM_REQ_FENCE_I			\
>   	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
> -#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
>   #define KVM_REQ_HFENCE_VVMA_ALL		\
>   	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>   #define KVM_REQ_HFENCE			\
> @@ -327,8 +326,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>   				     unsigned long order);
>   void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
>   
> +void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
> +
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
> -void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
>   
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index b3461bfd9756..da98ca801d31 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -162,7 +162,7 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>   	local_flush_icache_all();
>   }
>   
> -void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
> +void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
>   	unsigned long vmid = READ_ONCE(v->vmid);
> @@ -342,14 +342,14 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
>   	data.size = gpsz;
>   	data.order = order;
>   	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
> -			    KVM_REQ_HFENCE_GVMA_VMID_ALL, &data);
> +			    KVM_REQ_TLB_FLUSH, &data);
>   }
>   
>   void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
>   				    unsigned long hbase, unsigned long hmask)
>   {
> -	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_GVMA_VMID_ALL,
> -			    KVM_REQ_HFENCE_GVMA_VMID_ALL, NULL);
> +	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
> +			    KVM_REQ_TLB_FLUSH, NULL);
>   }
>   
>   void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index cc7d00bcf345..684efaf5cee9 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -720,12 +720,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>   		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
>   			kvm_riscv_fence_i_process(vcpu);
>   
> -		/*
> -		 * The generic KVM_REQ_TLB_FLUSH is same as
> -		 * KVM_REQ_HFENCE_GVMA_VMID_ALL
> -		 */
> -		if (kvm_check_request(KVM_REQ_HFENCE_GVMA_VMID_ALL, vcpu))
> -			kvm_riscv_hfence_gvma_vmid_all_process(vcpu);
> +		if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
> +			kvm_riscv_tlb_flush_process(vcpu);
>   
>   		if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
>   			kvm_riscv_hfence_vvma_all_process(vcpu);
Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
