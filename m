Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05760EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7510qRr3oX047U62OnZunbG3vn7+xR7XzFbIszPF1as=; b=MXwSh0xpoESMPz
	cmOtHNochZl1dQQ8EAmFg+Jv+4K9zbmiVdMy85q04FnkgbxT6DgwD03crvQHj7uEinC1r+I43Z3Xq
	dGA2J0VoTVLcOP9EIflPvaTM0rqVYgY6vGcc0kqDCXpVKj19ypt+gMTLUHCX8SJXxcgsa/fiP3hzx
	WlQacQ3kciFd1IhcfkbSI9+6DjrACA3z9aEAOlMUaySRqlC1f1PArJRz7sjZlPqrwDVg/zt698Cyf
	sHmVpDrrEYLUWka8BTD+Qa9tq5DnzIHEuOEkPIKatkOjQKjSUkd8u3Ax/TS0Qhbvblp59N900a4xf
	n8SeffSe7399qKD4askw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqRA-00ESpj-2I;
	Wed, 05 Jul 2023 00:32:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqR6-00ESoG-0j
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 00:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688517112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tbEzCQLL4wAVGNQCcCaWeGf9IDqYi1dQ3iAXttaRxQ=;
	b=gRbDDyIEKZjB9eSf1GPCke6ucAoj2SM2BY5wfAc/2zETEvrSHNAc6+wnexmDrdrco8vUx8
	5oVkhOviH6OXLDjGCa2K/HWnw+B16iogp+b/xvhv+A791ZHsO8MD6Oq2IJXDx9VGviANZg
	C+Zvfa/sn/YJL86OvOq03YqlDznG20k=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-ElWo_0daNp-jhobaZc132A-1; Tue, 04 Jul 2023 20:31:50 -0400
X-MC-Unique: ElWo_0daNp-jhobaZc132A-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-666ecb21fb8so8105116b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 17:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688517109; x=1691109109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tbEzCQLL4wAVGNQCcCaWeGf9IDqYi1dQ3iAXttaRxQ=;
        b=SAAUQnu+KIvRhLLt60jvAINcKnbN4vOBRmh0+XFN788J2TqQdgURBaqpxID55Hf0bC
         ADZYAujp+GebVuN1TOsjFZ1fzWO2m8oPXvE0/l/45/5UVkrbbeY8oMZGfox/tWeBkK5g
         kBTK3c9v3UpjPh/Azy0Y1ss0NKnJgF8Wmz0f+UNU5SxeENzDVG0vzVPsd31de7by2As2
         sjbw0QG2uhi/GS1CdqSm9xdQSRrpXaY0DHYo2YPFGJ3NsM4kUl+fZe4nw6H3je7+4cTb
         0Sp20orYD+Vf7IaLfwvTEiqpAK+eqypJLtNGYc1aOzlgarPkGhQHw2dqKYPZisOzynPk
         avzg==
X-Gm-Message-State: ABy/qLaU1g9ZKcn/7/0vanC43mdkXOvM21Fy7ID2FXYOLGiTktyaPrb9
	U3Wa3P1c3O52m3q+FARVcsTspq1y89drBRxvERHQutr6OcJrK3Z1FtFzsHiiMA/C8mloxpwmmyp
	wmC/ESzymbQVV32QxVSiFzoK3DFZd
X-Received: by 2002:a05:6a00:190d:b0:66c:9faa:bb12 with SMTP id y13-20020a056a00190d00b0066c9faabb12mr16704414pfi.9.1688517108924;
        Tue, 04 Jul 2023 17:31:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmfNfMPx/IrkAMqhqCvq3CBwACnFQn2OpL7OQ5Txr79ZB/+akox9sOla+QB1fZL69N2wqqhQ==
X-Received: by 2002:a05:6a00:190d:b0:66c:9faa:bb12 with SMTP id y13-20020a056a00190d00b0066c9faabb12mr16704398pfi.9.1688517108632;
        Tue, 04 Jul 2023 17:31:48 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id c184-20020a624ec1000000b00658670ebe7dsm6105353pfb.119.2023.07.04.17.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:31:47 -0700 (PDT)
Message-ID: <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
Date: Wed, 5 Jul 2023 10:31:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 07/11] KVM: arm64: Define
 kvm_tlb_flush_vmid_range()
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-8-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-8-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_173200_359761_9787185C 
X-CRM114-Status: GOOD (  16.88  )
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


On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> Implement the helper kvm_tlb_flush_vmid_range() that acts
> as a wrapper for range-based TLB invalidations. For the
> given VMID, use the range-based TLBI instructions to do
> the job or fallback to invalidating all the TLB entries.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
>   arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 

It may be reasonable to fold this to PATCH[08/11] since kvm_tlb_flush_vmid_range() is
only called by ARM64's kvm_arch_flush_remote_tlbs_range(), which is added by PATCH[08/11].
In either way, the changes look good to me:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 4cd6762bda805..1b12295a83595 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -682,4 +682,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
>    *	   kvm_pgtable_prot format.
>    */
>   enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
> +
> +/**
> + * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
> + *
> + * @mmu:	Stage-2 KVM MMU struct
> + * @addr:	The base Intermediate physical address from which to invalidate
> + * @size:	Size of the range from the base to invalidate
> + */
> +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t addr, size_t size);
>   #endif	/* __ARM64_KVM_PGTABLE_H__ */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 3d61bd3e591d2..df8ac14d9d3d4 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -631,6 +631,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
>   	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
>   }
>   
> +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t addr, size_t size)
> +{
> +	unsigned long pages, inval_pages;
> +
> +	if (!system_supports_tlb_range()) {
> +		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +		return;
> +	}
> +
> +	pages = size >> PAGE_SHIFT;
> +	while (pages > 0) {
> +		inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
> +		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
> +
> +		addr += inval_pages << PAGE_SHIFT;
> +		pages -= inval_pages;
> +	}
> +}
> +
>   #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
>   
>   static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
