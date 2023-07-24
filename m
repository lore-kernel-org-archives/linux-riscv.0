Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F029C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kW6c4vTj3KKFxLZgZ/gYzM7NTedtO2xfcGtz5nc+F9E=; b=FL6AIrZgP20Xq9
	JX+yyDIksJ4cNeJsnvDKE9AUCc6w57pRScA1XU452Y27erDh9a77+6v0qTX0Ii5T7/JxlxIpRU7US
	Fv7LbKLxNa8YnePnmW+et/s1iyXHsIOc8lvtPG9hHSIe1I8oCt9XfeEByHZe51bxExWkAZCCDpqbk
	sD9Se/Z8Qgdg3YhBB9SowKHAf7p44L51hwKYQN/wOA7y6Lt48lYfvb5Qpis246Ax5SUuCN4aPm3Mo
	IeRt9uQsVAYzPuN079gspsd2ZApXrGkR+tMWi0gC17GuMpArJBoMzYYNSJQuTftim6gD5p0h5qEe3
	zQvppwHXvSJnTC/rqMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNry3-003QRy-2Z;
	Mon, 24 Jul 2023 09:35:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNry0-003QQV-1j
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 09:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690191299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aRVEy8W9VZsmtykV3MS4fg+1kXzADTBk7CG7c2ZXbE=;
	b=UoiFadmy4MpH4ah4EWPELSE9LzKzxPKiTZPXiy86htqLPiQjMRGAvrPFjbXJIauri+jIVb
	7PpkzZ5zsSQmqIcZt9AEYOM6Q0oVPvVbCw73ordLz+Dg5cRAS5OcU8ATVTuDmO+2fS69Ig
	CzVigabAQza1E/ec7tCRKYnUjzmsHwM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-vh_IDJXJM8amFAdPMK3a-w-1; Mon, 24 Jul 2023 05:34:58 -0400
X-MC-Unique: vh_IDJXJM8amFAdPMK3a-w-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-34657b2de4eso4404795ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 02:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191297; x=1690796097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aRVEy8W9VZsmtykV3MS4fg+1kXzADTBk7CG7c2ZXbE=;
        b=ZxqUnGkRAYV2QHuetVCznEizBnpK8FUkr5NbmOVDKjknmsQR/hZSmHRa7o+1Qs3Yws
         LSpf/JEEbokhR0hDYd1JbygPkT1P7OvpMfKvkYpNyY3AQvICHfjiTjC93cbNj0odBWLk
         wxCf/0f6oiJt7u8KomWG+uQFGY2vCrfsoNa3hHmTczCIqudbl7aeENeMRzeymu0aL2a3
         +05/cmFrMEOcY8URn4TYSmzQeLtjpnqwgg7tx5Log4w9/gEbHWYIZgCpRsYRRfnyUlaF
         4OmZ+Lpqs+xgfR6rquCVX8LMWV9ptonFcIFnBVzYoqOePHObGhcDEFCACytvVVmbm21V
         mO9Q==
X-Gm-Message-State: ABy/qLb3UY8dw9ISu3d2sHCGcWAU0Nfo/CnE3/wS/PswypDArNcb2f6m
	WOAFt7p0k+m1MNiSUibYpnVXmykg7zfNfF8j25n5E3Zn9K1YC529JUn8UVl+VumgCV6zCCPTaFP
	kULnHyRyf5LnP6vny4pwsyKTIJa6w
X-Received: by 2002:a92:cecf:0:b0:348:d2e9:399a with SMTP id z15-20020a92cecf000000b00348d2e9399amr1415919ilq.1.1690191297454;
        Mon, 24 Jul 2023 02:34:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6NmNRqSH1n6n4EBMT9iuWXK0UDAK+VvUY/g4ptdk4KWrWf/bvtDD8DcAuDIFVkgfhDqFXAA==
X-Received: by 2002:a92:cecf:0:b0:348:d2e9:399a with SMTP id z15-20020a92cecf000000b00348d2e9399amr1415902ilq.1.1690191297214;
        Mon, 24 Jul 2023 02:34:57 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id gv17-20020a17090b11d100b00265dc26d8dfsm7966842pjb.27.2023.07.24.02.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:34:56 -0700 (PDT)
Message-ID: <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
Date: Mon, 24 Jul 2023 17:34:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for
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
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20230722022251.3446223-1-rananta@google.com>
 <20230722022251.3446223-13-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230722022251.3446223-13-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_023500_651678_C18FFDD9 
X-CRM114-Status: GOOD (  28.00  )
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

Hi Raghavendra,

On 7/22/23 10:22, Raghavendra Rao Ananta wrote:
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
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 67 +++++++++++++++++++++++++++++++-----
>   1 file changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 5ef098af1736..cf88933a2ea0 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -831,16 +831,54 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
>   	smp_store_release(ctx->ptep, new);
>   }
>   
> -static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> -			   struct kvm_pgtable_mm_ops *mm_ops)
> +struct stage2_unmap_data {
> +	struct kvm_pgtable *pgt;
> +	bool defer_tlb_flush_init;
> +};
> +
> +static bool __stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
> +{
> +	/*
> +	 * If FEAT_TLBIRANGE is implemented, defer the individual
> +	 * TLB invalidations until the entire walk is finished, and
> +	 * then use the range-based TLBI instructions to do the
> +	 * invalidations. Condition deferred TLB invalidation on the
> +	 * system supporting FWB, as the optimization is entirely
> +	 * pointless when the unmap walker needs to perform CMOs.
> +	 */
> +	return system_supports_tlb_range() && stage2_has_fwb(pgt);
> +}
> +
> +static bool stage2_unmap_defer_tlb_flush(struct stage2_unmap_data *unmap_data)
> +{
> +	bool defer_tlb_flush = __stage2_unmap_defer_tlb_flush(unmap_data->pgt);
> +
> +	/*
> +	 * Since __stage2_unmap_defer_tlb_flush() is based on alternative
> +	 * patching and the TLBIs' operations behavior depend on this,
> +	 * track if there's any change in the state during the unmap sequence.
> +	 */
> +	WARN_ON(unmap_data->defer_tlb_flush_init != defer_tlb_flush);
> +	return defer_tlb_flush;
> +}
> +
> +static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
> +				struct kvm_s2_mmu *mmu,
> +				struct kvm_pgtable_mm_ops *mm_ops)
>   {
> +	struct stage2_unmap_data *unmap_data = ctx->arg;
> +
>   	/*
> -	 * Clear the existing PTE, and perform break-before-make with
> -	 * TLB maintenance if it was valid.
> +	 * Clear the existing PTE, and perform break-before-make if it was
> +	 * valid. Depending on the system support, the TLB maintenance for
> +	 * the same can be deferred until the entire unmap is completed.
>   	 */
>   	if (kvm_pte_valid(ctx->old)) {
>   		kvm_clear_pte(ctx->ptep);
> -		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
> +
> +		if (!stage2_unmap_defer_tlb_flush(unmap_data))
Why not directly check (unmap_data->defer_tlb_flush_init) here?

> +			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
> +					ctx->addr, ctx->level);
Small indent hint. The ctx->addr can align with __kvm_tlb_flush_vmid_ipa.

Thanks,
Shaoqin
>   	}
>   
>   	mm_ops->put_page(ctx->ptep);
> @@ -1070,7 +1108,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
>   static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   			       enum kvm_pgtable_walk_flags visit)
>   {
> -	struct kvm_pgtable *pgt = ctx->arg;
> +	struct stage2_unmap_data *unmap_data = ctx->arg;
> +	struct kvm_pgtable *pgt = unmap_data->pgt;
>   	struct kvm_s2_mmu *mmu = pgt->mmu;
>   	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
>   	kvm_pte_t *childp = NULL;
> @@ -1098,7 +1137,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * block entry and rely on the remaining portions being faulted
>   	 * back lazily.
>   	 */
> -	stage2_put_pte(ctx, mmu, mm_ops);
> +	stage2_unmap_put_pte(ctx, mmu, mm_ops);
>   
>   	if (need_flush && mm_ops->dcache_clean_inval_poc)
>   		mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, mm_ops),
> @@ -1112,13 +1151,23 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   
>   int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>   {
> +	int ret;
> +	struct stage2_unmap_data unmap_data = {
> +		.pgt = pgt,
> +		.defer_tlb_flush_init = __stage2_unmap_defer_tlb_flush(pgt),
> +	};
>   	struct kvm_pgtable_walker walker = {
>   		.cb	= stage2_unmap_walker,
> -		.arg	= pgt,
> +		.arg	= &unmap_data,
>   		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
>   	};
>   
> -	return kvm_pgtable_walk(pgt, addr, size, &walker);
> +	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
> +	if (stage2_unmap_defer_tlb_flush(&unmap_data))
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
