Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6069BC001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 03:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8IApQxYoQPYOpLghZK20MUPNnVttiXrEmooXAMUfXg=; b=Ltq05tphsUSF2s
	LNVi6K1ITwNVoEqtDKlQ4myH7iyMTD4v9K6iG/rIVPBordaUBDRai981hlNFY1kwcV7FvPtqLIJR4
	Skm5kaSF3uqD+gNl9DEupaygCe8nLnsCR+OhzmtDGLbXklX5ycEJEThUqAejbqhoi7NQZVTln9Hug
	PL8LKMk1kOsjiV9mAT2HzCnuqfKy7xcbNoHFiqdQT+H+grQphgkcJz6o/pM8tv4z6v945YzllN1HR
	q/hDtTRrtlSRlKeVCvygpbR13Ww5dAD1m1tUMltFSwUwxBRq7S9f6rtsurt/IZ1TnDFfoOstxnYkk
	U216/sulTeCR7+nlPdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIbE-009FZ3-17;
	Fri, 11 Aug 2023 03:14:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIb9-009FXg-16
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 03:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691723637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8Fzopu9BiGSPjrEUNgR9DMg7UpRaexYmg1fQM6xS1Q=;
	b=We5P675v5d41p0Pg5dVp7oCnT1cjWNEx3h4cddtAoWK4qJR0jhluTmoo7fCN1U2BGypvsl
	UER9otcGa60A+ruAH8ROHKBeKCaEaDaSE7gzsLbWCq8Gs0JmN4dwQ5gB2Yuraq3DmJD9c3
	cQF30m9s2Eo/nLLRQzDwCQYWzu/8kzg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-K5fDMmRePsa8nT2vA1tS3g-1; Thu, 10 Aug 2023 23:13:55 -0400
X-MC-Unique: K5fDMmRePsa8nT2vA1tS3g-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6871900d991so390957b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 20:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691723635; x=1692328435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Fzopu9BiGSPjrEUNgR9DMg7UpRaexYmg1fQM6xS1Q=;
        b=io9T2gALKD7gOdrd96uS+qZJAuwGgdJOBpuZxmPvmkFZ3wjLVDhuQOs9T+CHv2847U
         8yJoXJLBFD3VkMnFiGrwfLlJCUGi/5COZUDsWPYPBPp3x5q7/gOyxmraBUbEekHt/A7e
         0Yer+AVujd4armOELFJx1gfcPGulZIsZOSAcLS/qD/r8yLNJXgAlILaG9lXxVioqUqbf
         aV6p0lvhte8XTXPvWa7/JFGDK4DxmkS9zbSCC84osT5H538i58gjCuVJjPgfrWGpGx0h
         zvu4sOe1exoOLuNLTnX6L8yluGiU7GTpJECyhMlLnONpUbmhHjx810b+eijJsD6iXq9Q
         opcw==
X-Gm-Message-State: AOJu0YzRK5hhNO2Kj9zOgRyuM9mQXur3Eo6moHMsjEZJTT7L36/FV5vU
	gpL96ulZiHXeNcoMi3teimIN4ebt4fjXgrdgmSYKxFnpJEFiQDK5SH9uO5tLqHhpYKKDGHX/Xed
	FoxVUCmh/Ib6vlMbPT2u9Do6sqecj
X-Received: by 2002:a05:6a00:4789:b0:687:874c:7ce0 with SMTP id dh9-20020a056a00478900b00687874c7ce0mr669614pfb.1.1691723634861;
        Thu, 10 Aug 2023 20:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3d1VhIHydgxUNSBHJCWT9khJqug4xGZp+7IM8qZhfIPYmAixEOhR0Nz01guBm87TUHF3WYw==
X-Received: by 2002:a05:6a00:4789:b0:687:874c:7ce0 with SMTP id dh9-20020a056a00478900b00687874c7ce0mr669587pfb.1.1691723634514;
        Thu, 10 Aug 2023 20:13:54 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b0064d57ecaa1dsm2227869pfa.28.2023.08.10.20.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 20:13:54 -0700 (PDT)
Message-ID: <5ca5e4ed-82f0-369b-db61-7fcd1c148f1c@redhat.com>
Date: Fri, 11 Aug 2023 11:13:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 14/14] KVM: arm64: Use TLBI range-based intructions for
 unmap
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>,
 Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-15-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230808231330.3855936-15-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_201359_453025_94D547F1 
X-CRM114-Status: GOOD (  26.35  )
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



On 8/9/23 07:13, Raghavendra Rao Ananta wrote:
> The current implementation of the stage-2 unmap walker traverses
> the given range and, as a part of break-before-make, performs
> TLB invalidations with a DSB for every PTE. A multitude of this
> combination could cause a performance bottleneck on some systems.
> 
> Hence, if the system supports FEAT_TLBIRANGE, defer the TLB
> invalidations until the entire walk is finished, and then
> use range-based instructions to invalidate the TLBs in one go.
> Condition deferred TLB invalidation on the system supporting FWB,
> as the optimization is entirely pointless when the unmap walker
> needs to perform CMOs.
> 
> Rename stage2_put_pte() to stage2_unmap_put_pte() as the function
> now serves the stage-2 unmap walker specifically, rather than
> acting generic.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 40 +++++++++++++++++++++++++++++-------
>   1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 5ef098af17362..eaaae76481fa9 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -831,16 +831,36 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
>   	smp_store_release(ctx->ptep, new);
>   }
>   
> -static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> -			   struct kvm_pgtable_mm_ops *mm_ops)
> +static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
>   {
>   	/*
> -	 * Clear the existing PTE, and perform break-before-make with
> -	 * TLB maintenance if it was valid.
> +	 * If FEAT_TLBIRANGE is implemented, defer the individual
> +	 * TLB invalidations until the entire walk is finished, and
> +	 * then use the range-based TLBI instructions to do the
> +	 * invalidations. Condition deferred TLB invalidation on the
> +	 * system supporting FWB as the optimization is entirely
> +	 * pointless when the unmap walker needs to perform CMOs.
> +	 */
> +	return system_supports_tlb_range() && stage2_has_fwb(pgt);
> +}
> +
> +static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
> +				struct kvm_s2_mmu *mmu,
> +				struct kvm_pgtable_mm_ops *mm_ops)
> +{
> +	struct kvm_pgtable *pgt = ctx->arg;
> +
> +	/*
> +	 * Clear the existing PTE, and perform break-before-make if it was
> +	 * valid. Depending on the system support, defer the TLB maintenance
> +	 * for the same until the entire unmap walk is completed.
>   	 */
>   	if (kvm_pte_valid(ctx->old)) {
>   		kvm_clear_pte(ctx->ptep);
> -		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
> +
> +		if (!stage2_unmap_defer_tlb_flush(pgt))
> +			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
> +					ctx->addr, ctx->level);
>   	}
>   
>   	mm_ops->put_page(ctx->ptep);
> @@ -1098,7 +1118,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * block entry and rely on the remaining portions being faulted
>   	 * back lazily.
>   	 */
> -	stage2_put_pte(ctx, mmu, mm_ops);
> +	stage2_unmap_put_pte(ctx, mmu, mm_ops);
>   
>   	if (need_flush && mm_ops->dcache_clean_inval_poc)
>   		mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, mm_ops),
> @@ -1112,13 +1132,19 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   
>   int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>   {
> +	int ret;
>   	struct kvm_pgtable_walker walker = {
>   		.cb	= stage2_unmap_walker,
>   		.arg	= pgt,
>   		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
>   	};
>   
> -	return kvm_pgtable_walk(pgt, addr, size, &walker);
> +	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
> +	if (stage2_unmap_defer_tlb_flush(pgt))
> +		/* Perform the deferred TLB invalidations */
> +		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
> +
> +	return ret;
>   }
>   
>   struct stage2_attr_data {

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
