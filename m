Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28160EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 04:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnFzfc/HFQn7FohRkExYynQmvxWW9mLr6UlW7CQXtlM=; b=sdPrWmTBw1/ebq
	s5jvDRPkgyWPzV+7rYok3jysqwrwa2kTRAjDNR6gep8thcrh4pbpZt4eP1yfu3Qy/aoPqFhWTi8TJ
	sEcLkjR9Jgljq5T7KEK7Sl7ZA8V5MyCbgC/kq0nBdUKbLID9TTZxoKU96+nR33FhlUdVrhX/5Ztbu
	WpVAh+f0RIPESJ7yz2PspAaEAGoROsSExTtb9HM/zWRb+rjK0KzfR2lXj682uRRgxlIfurMXw/IKX
	ucihda+JwDuRuU2h33RgIzp0BTA4Q3OBTAIo4AkQ/nTxZnCwT+IDBZZH0kNC1cycVql9lDnyWLfHN
	/AkKJhvy8SlqwbDiw6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaWz-003zjg-35;
	Wed, 09 Aug 2023 04:10:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaWw-003zj2-2D
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 04:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691554241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiZt5qkV373iiZscCJbcFROPFCou/fOb43yGS5e3+0c=;
	b=iIdTcZ2bKDr0q25c8LyODlnoM3869MbFbqPNOsjLP7vIPDdTKbPOt06hypXvjPV3InmYXu
	M7+aRW5D9q92OVXzI2Sim9NKZmMjli+kjUsOwcKeHpTul+j05bhNF9hfo6+WpIJdnagmKZ
	X0qVw95Le49LGXUOcZYum6bWFNGr/XM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-F76LLXY-ObarmFWisy45tg-1; Wed, 09 Aug 2023 00:10:40 -0400
X-MC-Unique: F76LLXY-ObarmFWisy45tg-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-686bc3f11feso479286b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 21:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691554223; x=1692159023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiZt5qkV373iiZscCJbcFROPFCou/fOb43yGS5e3+0c=;
        b=fhEfOmmcq2v8/doa/vEGqbO1m9KuXPd+X/R/RoWgjxqOI7wQbdNdBZyN9B0mx1bHHT
         6FNU9GtXFQ7bXZ22gb7yx+H48JAX7TWqWVB/3My2hEOyvxrRoOvfEmuxiIU6oXNDDbPm
         v9Y+v0pcodyuhEcM6OzczgyJgEtEcJQbZglaobGGQU9xOzOO3XvN//NOf7bfEgLLZVoH
         xF2jyZ6MhusAsVeFQKOe7tMgKbDhZ3NmWuB0rYgDZ8FA1niET6i4f20ejW5hEEfrbFY9
         j//NgBEAGilFcFbVK3rr2XiIfTZVlhH5AUFUJZm66d6Gp5DkxOIlDJOfEkGOBiL0uYMk
         Y+Kg==
X-Gm-Message-State: AOJu0YyS1Prh5pLzBmkzcCiVRN79WwK3dQ0ffuuYF7R3QhSeJtq5aGjp
	/VSJPADtcX6MXjari6EgyUCtGzeB5lcGcmXju0DnXxAZbTtWd0+IJDRjt0FlJbxxOYi7o958IYJ
	jkjFphFcw8hOgTmpBs0aDUXJx5oJS
X-Received: by 2002:a05:6a00:1487:b0:666:eaaf:a2af with SMTP id v7-20020a056a00148700b00666eaafa2afmr2263676pfu.14.1691554222962;
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4mKNqTgX+EsfCEP/MYW99W9JIOB5kHuLZbEs18DPRnq1dfDRhMLd6YmPemv3TlybaLWWmcQ==
X-Received: by 2002:a05:6a00:1487:b0:666:eaaf:a2af with SMTP id v7-20020a056a00148700b00666eaafa2afmr2263648pfu.14.1691554222702;
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b006871fdde2c7sm8840727pff.110.2023.08.08.21.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
Message-ID: <b91d1869-3a1d-d9eb-27b0-0aac94cca8e0@redhat.com>
Date: Wed, 9 Aug 2023 14:10:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
 <20230808231330.3855936-4-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230808231330.3855936-4-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_211042_799138_D897A560 
X-CRM114-Status: GOOD (  18.58  )
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
> Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but that is a small cost in comparison to flushing remote TLBs.
> 
> In addition, instead of just incrementing remote_tlb_flush_requests
> stat, the generic interface would also increment the
> remote_tlb_flush stat.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 ++
>   arch/arm64/kvm/Kconfig            | 1 -
>   arch/arm64/kvm/mmu.c              | 6 +++---
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8b6096753740c..20f2ba149c70c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1111,6 +1111,8 @@ int __init kvm_set_ipa_limit(void);
>   #define __KVM_HAVE_ARCH_VM_ALLOC
>   struct kvm *kvm_arch_alloc_vm(void);
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +
>   static inline bool kvm_vm_is_protected(struct kvm *kvm)
>   {
>   	return false;
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index f531da6b362e9..6b730fcfee379 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -25,7 +25,6 @@ menuconfig KVM
>   	select MMU_NOTIFIER
>   	select PREEMPT_NOTIFIERS
>   	select HAVE_KVM_CPU_RELAX_INTERCEPT
> -	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
>   	select KVM_MMIO
>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>   	select KVM_XFER_TO_GUEST_WORK
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6db9ef288ec38..0ac721fa27f18 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -161,15 +161,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   }
>   
>   /**
> - * kvm_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> + * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>    * @kvm:	pointer to kvm structure.
>    *
>    * Interface to HYP function to flush all VM TLB entries
>    */
> -void kvm_flush_remote_tlbs(struct kvm *kvm)
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
> -	++kvm->stat.generic.remote_tlb_flush_requests;
>   	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> +	return 0;
>   }
>   
>   static bool kvm_is_device_pfn(unsigned long pfn)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
