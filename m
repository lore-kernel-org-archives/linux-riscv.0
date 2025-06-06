Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF5C5B555
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRMjeAfGiSc/w0+pMO2jtLD2ZFTj5tIu6LVRD4KPgAg=; b=kcVe1sxEzygIw4
	dtPyyzRQRwjxcwhsFGbWTIpniYRody9c5JvLhjzG2TsRGJCKdBGOAYYndVUydr19+DkslMjQvAMTG
	oo3Oqv8m9DeOgXx2BLHiOY0NN1AyisQn0jk5kucb4z21h06xX2xzEu/VF/rbfNDRh78dC+jyuBgC6
	bUrEtutceh8ye0aX3N4sjLoM+d99UD3HFhYuIllgJ3b23mmr/8c+Dx7rRB/v2aBG2sdcz28eDa25l
	eJ00bhAXxjXggVA3p3jslT2s0hBHrNMmQrL6US0comGhCKKEVdC3SDCdATqJ8rkwPO8glkF/qD6qk
	FOFc0oEBvjPoWw+e7NDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLlq-0000000GtIh-17Z6;
	Fri, 06 Jun 2025 01:21:22 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLlm-0000000GtII-3Opx
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 01:21:20 +0000
Message-ID: <54c9651f-47ee-4b0d-8df4-2a0da679b2c3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749172875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDGaaLcSzuIeoOSHuJpYzbEv+9LO2YuTG7IVWKH//Q8=;
	b=ffuQcmh7yCa/+CRsdD0k+UqoNRh8L0BnFQJKzRE3+ZlNWTibag47VUBlXpzf4hSKL3ZF+Y
	+U6IJSaXz3u3gjh1Axg1AF9zLLd8ntsozD8EgTkMSC3de6O98FlwTvPWvPAc0fsofGCX3T
	0/lt4OwWfAoz/SNWlNVJMrzbYkMpQhk=
Date: Thu, 5 Jun 2025 18:21:10 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 05/13] RISC-V: KVM: Rename and move
 kvm_riscv_local_tlb_sanitize()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-6-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-6-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_182119_201396_64743158 
X-CRM114-Status: GOOD (  19.08  )
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
> The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
> VMID related TLB mappings when a VCPU is moved from one host CPU
> to another.
>
> Let's move kvm_riscv_local_tlb_sanitize() to VMID management
> sources and rename it to kvm_riscv_gstage_vmid_sanitize().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h |  3 +--
>   arch/riscv/kvm/tlb.c              | 23 -----------------------
>   arch/riscv/kvm/vcpu.c             |  4 ++--
>   arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
>   4 files changed, 26 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 85cfebc32e4c..134adc30af52 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -327,8 +327,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>   				     unsigned long order);
>   void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
>   
> -void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
> -
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> @@ -376,6 +374,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
>   int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
>   bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
>   void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
> +void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
>   
>   int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
>   
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 2f91ea5f8493..b3461bfd9756 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
>   	csr_write(CSR_HGATP, hgatp);
>   }
>   
> -void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> -{
> -	unsigned long vmid;
> -
> -	if (!kvm_riscv_gstage_vmid_bits() ||
> -	    vcpu->arch.last_exit_cpu == vcpu->cpu)
> -		return;
> -
> -	/*
> -	 * On RISC-V platforms with hardware VMID support, we share same
> -	 * VMID for all VCPUs of a particular Guest/VM. This means we might
> -	 * have stale G-stage TLB entries on the current Host CPU due to
> -	 * some other VCPU of the same Guest which ran previously on the
> -	 * current Host CPU.
> -	 *
> -	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
> -	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
> -	 */
> -
> -	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> -	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> -}
> -
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>   {
>   	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f98a1894d55b..cc7d00bcf345 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -961,12 +961,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		}
>   
>   		/*
> -		 * Cleanup stale TLB enteries
> +		 * Sanitize VMID mappings cached (TLB) on current CPU
>   		 *
>   		 * Note: This should be done after G-stage VMID has been
>   		 * updated using kvm_riscv_gstage_vmid_ver_changed()
>   		 */
> -		kvm_riscv_local_tlb_sanitize(vcpu);
> +		kvm_riscv_gstage_vmid_sanitize(vcpu);
>   
>   		trace_kvm_entry(vcpu);
>   
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index ddc98714ce8e..92c01255f86f 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
>   	kvm_for_each_vcpu(i, v, vcpu->kvm)
>   		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
>   }
> +
> +void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long vmid;
> +
> +	if (!kvm_riscv_gstage_vmid_bits() ||
> +	    vcpu->arch.last_exit_cpu == vcpu->cpu)
> +		return;
> +
> +	/*
> +	 * On RISC-V platforms with hardware VMID support, we share same
> +	 * VMID for all VCPUs of a particular Guest/VM. This means we might
> +	 * have stale G-stage TLB entries on the current Host CPU due to
> +	 * some other VCPU of the same Guest which ran previously on the
> +	 * current Host CPU.
> +	 *
> +	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
> +	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
> +	 */
> +
> +	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> +	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> +}


Reviewed-by: Atish Patra <atishp@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
