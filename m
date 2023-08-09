Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2109EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 06:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5A25g7rst/WJTdbpqKG3dY+D1OW6da5N7qkIbtUbKnE=; b=uOv2S86IMRba5U
	GkdXhkfkcN7ft34iRq22KvmOIFUqzzC3zQ9gPQWdIsqHsd27OUv4lvanrGONQUkHgYtgcx1QsKVjW
	lNIEy8p790TPGveiCIvCWIsVmvoKtc9lRRkNZaVIMa4PjbGsiAe/I0SmkGr5i5bJRtOa7pR2OVU9d
	2KdsVC5So7XVUo01RIeHfvdzlhmti1Ko1qkGBehT32Pb0PLO2Qaf7xRVnKrb64eAqd1wQZvuZgPPu
	AZGE7/tK2tVDkjSrepvsYTk36WBAupBUqrPS8msVjtfoytm9ynw7x7wlZfFt8x0r4MWTU6MAXA4rV
	epxcdGy0h8stRZRUphgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcNz-0047Wb-13;
	Wed, 09 Aug 2023 06:09:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcNw-0047Uw-0q
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 06:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691561368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjOdGDWIQkT0phMReVz2eflzO/ETttLoRuiht6Bh+vs=;
	b=Ed9vRJ8uLWLmm4uWaIW/w4+TgxMNGICHw9C3jAXwK2rZLZ3UwlRIBmIypRA8N7hpLUoJFQ
	lEHi24Swr2+tCzU56GdtzOeaRR/bxfZOQvtmyC4mgEOwCCXfiMe33MKWCoqjao3Eb6qprh
	XFKlIxL+sWncEuA7baLosqdATP0IbUQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-hGRNyJpAOJSl0tIvaIKxQA-1; Wed, 09 Aug 2023 02:09:27 -0400
X-MC-Unique: hGRNyJpAOJSl0tIvaIKxQA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a5aa4a8fd6so12013024b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 23:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691561366; x=1692166166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjOdGDWIQkT0phMReVz2eflzO/ETttLoRuiht6Bh+vs=;
        b=hw4RSQBdBRz2d677sXIZvah9QUMp9yhhCfveYLF18NE8l5HCzEnHuW/mOI4PWrwCio
         xiHrnU3D9m8syhP8WqBud1kDGpvRxlai0EnUTq0IXMzLvoYHK9QMxTres1iwP6j+nGdy
         ry4a6gDgOUYmGJ+WTusddS4RBQ2kaCi54qJyeFR8Uyk7nJxpWsF+b+xGQK+fUd4F7tdM
         yYTZuj5a3fr12rJ+xy9ojpKvtw8rNTbugQm+/ErcjBPvHR0fByUFBXPTZR7gOw432qk+
         r8DfClh7BP6nowx9C2TFJGgIFHTWgvhPb2nOHRgCz0Vl2t4J5XhXKgF0G0rve+kg3vBX
         l3fA==
X-Gm-Message-State: AOJu0YwRUyG6kcDvHLUqiLRwjpoS8MajVRiE5BVqVBnjHAutAEFSVwjg
	3wj9I37w6Y3qwl1fdI+K3ljkOAKPUociQ+Zdmqrbn8I1gm5fIr8/QJ1iaGMMIa0kwZshwSNlVRD
	Oi3bDaucO4oegOdGA1HSQvWJT2aq4
X-Received: by 2002:a05:6808:193:b0:3a6:f7d7:4cfe with SMTP id w19-20020a056808019300b003a6f7d74cfemr1751360oic.50.1691561366666;
        Tue, 08 Aug 2023 23:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESJGy9tTZJCmzlL28vXdcHkH4ZB7FxhBPbIFweRaehSBbS0wZP4I9BPTRIjsuacKEsONJhQQ==
X-Received: by 2002:a05:6808:193:b0:3a6:f7d7:4cfe with SMTP id w19-20020a056808019300b003a6f7d74cfemr1751333oic.50.1691561366353;
        Tue, 08 Aug 2023 23:09:26 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a001e00b002630bfd35b0sm621062pja.7.2023.08.08.23.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 23:09:25 -0700 (PDT)
Message-ID: <15975205-6161-d54b-fe40-805a16b0cb27@redhat.com>
Date: Wed, 9 Aug 2023 16:09:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 05/14] KVM: Allow range-based TLB invalidation from
 common code
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Shaoqin Huang <shahuang@redhat.com>
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-6-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230808231330.3855936-6-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_230932_373918_A668850B 
X-CRM114-Status: GOOD (  23.15  )
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

On 8/9/23 09:13, Raghavendra Rao Ananta wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Make kvm_flush_remote_tlbs_range() visible in common code and create a
> default implementation that just invalidates the whole TLB.
> 
> This paves the way for several future features/cleanups:
> 
>   - Introduction of range-based TLBI on ARM.
>   - Eliminating kvm_arch_flush_remote_tlbs_memslot()
>   - Moving the KVM/x86 TDP MMU to common code.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>   arch/x86/include/asm/kvm_host.h |  2 ++
>   arch/x86/kvm/mmu/mmu.c          |  8 ++++----
>   arch/x86/kvm/mmu/mmu_internal.h |  3 ---
>   include/linux/kvm_host.h        | 12 ++++++++++++
>   virt/kvm/kvm_main.c             | 13 +++++++++++++
>   5 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index a2d3cfc2eb75c..b547d17c58f63 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1804,6 +1804,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   		return -ENOTSUPP;
>   }
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +
>   #define kvm_arch_pmi_in_guest(vcpu) \
>   	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
>   
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce2..6adbe6c870982 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -278,16 +278,16 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
>   	return kvm_x86_ops.flush_remote_tlbs_range;
>   }
>   
> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> -				 gfn_t nr_pages)
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> +				      u64 nr_pages)
>   {
>   	int ret = -EOPNOTSUPP;
>   
>   	if (kvm_x86_ops.flush_remote_tlbs_range)
>   		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
>   								   nr_pages);
> -	if (ret)
> -		kvm_flush_remote_tlbs(kvm);
> +
> +	return ret;
>   }
>   

I guess @start_gfn can be renamed to @gfn, to be consistent with its declaration
in include/linux/kvm_host.h and struct kvm_x86_ops::flush_remote_tlbs_range()

>   static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index d39af5639ce97..86cb83bb34804 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -170,9 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
>   				    struct kvm_memory_slot *slot, u64 gfn,
>   				    int min_level);
>   
> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> -				 gfn_t nr_pages);
> -
>   /* Flush the given page (huge or not) of guest memory. */
>   static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
>   {
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index ade5d4500c2ce..f0be5d9c37dd1 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1359,6 +1359,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
>   void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
>   
>   void kvm_flush_remote_tlbs(struct kvm *kvm);
> +void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
>   
>   #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>   int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
> @@ -1488,6 +1489,17 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   #endif
>   
> +#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> +						    gfn_t gfn, u64 nr_pages)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#else
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> +				      gfn_t gfn, u64 nr_pages);
> +#endif
> +
>   #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
>   void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
>   void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d6b0507861550..26e91000f579d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -366,6 +366,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>   }
>   EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
>   
> +void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
> +{
> +	if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, nr_pages))
> +		return;
> +
> +	/*
> +	 * Fall back to a flushing entire TLBs if the architecture range-based
> +	 * TLB invalidation is unsupported or can't be performed for whatever
> +	 * reason.
> +	 */
> +	kvm_flush_remote_tlbs(kvm);
> +}
> +
>   static void kvm_flush_shadow_all(struct kvm *kvm)
>   {
>   	kvm_arch_flush_shadow_all(kvm);

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
