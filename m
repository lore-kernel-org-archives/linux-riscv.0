Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D20C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c00zJPIe8RmNRw3imM/sNK4L/gCRIlXjUxWTIkSu0XA=; b=tJUYTXAyQE1hzV
	gIjukxmDGLXg7yGyBlXdf8aP49WF9oBOghDuvEY5IB8RmhJJpjxHSlSe5RD1q0XHxbblMeWD4cQ0p
	Ycl/EUuGK/5S1Vu9kyqSCxPjSUMcFqHHbCLY/O3UunvJ55aTFwxV1wv85fY4J25Rk7acy0nnKNyBN
	bHzvGWqVNL/bdXkwJCxBLu7YKPfKm6ufJG0ctULt2e41w+7ZTJtmOO6rbKhXzJdksoWDXO9jC/1HQ
	z2joKw5v6Hyj7HxDN7OvdKc7VQVKqcFdk//UhS7yqONSicW1OB3NSbJtGg7G7hNVC64E7wyfXNGdf
	O0I0DT5EKZvddqfg9j9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrd3-003MZC-0b;
	Mon, 24 Jul 2023 09:13:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrcz-003MXS-2q
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 09:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690189997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//aPJH4zrPdTDxzMzJs7UJ4GFjBaI2aqgPX71P6a5dg=;
	b=aPz0fXJ6ReVE/4014hU00osTTJ/nryisfUprxAXuOAzrTXbeDN8gvwRhIMnrwKxgy5spe2
	byfvp0LBVfgvXOYRFbRvLAxL3AncW4VkCUNNzwad8oAF787rqFhCOKwoyqx6KdxJIGoY82
	QgnjJmU6hMEVlnwWZMSuBe9ER3aK8RA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-NvBKJhdjNs-pMI2yuR7I7A-1; Mon, 24 Jul 2023 05:13:13 -0400
X-MC-Unique: NvBKJhdjNs-pMI2yuR7I7A-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-262ef5650acso1002245a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 02:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690189992; x=1690794792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//aPJH4zrPdTDxzMzJs7UJ4GFjBaI2aqgPX71P6a5dg=;
        b=hdPKdvHnNDSpy3RxN8smY5wftYEUs1E10DoOXsdWXup/fvznv4aVeQPwl4/2DZ+z1a
         SELLSlxDk3VVnjNltf/Z060iazZeHIADWGMIUCBoeKfz2VedU7cWaZh8s4duvb9TiUBy
         GpV3fRRRzMdKQlRlsji4tRWiLp0RF1HYBNvC0x6LcICmHMEuNb9cf7G2XIFCNgdrY3xQ
         tzCBTy8t1v1EEpEMzs962S0+FzCpYN41ViWcOmrh//i2yHK5aH0pzT6G3SejaTjF48Ba
         XhIA2Hk9nO8euwGIia/VXG+aFoPp2CxaeaDjaeN4sANR9Dfcln2Ab8YYJY/pAItq/DMk
         5JWg==
X-Gm-Message-State: ABy/qLY/aJbDG/GAm4Opll5e3zBKzglURSrpXCozqPEEBT0zzfuu589y
	FVaQE6B1rQ/WbkenrL/iB71Kzi99j2DS87urnzWgrarDxs3B4d1cxVmjiAkAx01iMFrYsEfypjR
	JbbFWMOgoFFNKKEFlkY0D9JMdUmhz
X-Received: by 2002:a17:902:ce92:b0:1b8:1591:9f81 with SMTP id f18-20020a170902ce9200b001b815919f81mr12102530plg.4.1690189992434;
        Mon, 24 Jul 2023 02:13:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYYex+PeZplrxlN0jNWs984ysaSZQSKu+vtitozLwa1hyTQD6SfImYNcNMAys3P7/0AANuTw==
X-Received: by 2002:a17:902:ce92:b0:1b8:1591:9f81 with SMTP id f18-20020a170902ce9200b001b815919f81mr12102507plg.4.1690189992175;
        Mon, 24 Jul 2023 02:13:12 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w7-20020a170902e88700b001b06c106844sm8389140plg.151.2023.07.24.02.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:13:11 -0700 (PDT)
Message-ID: <bab509a1-5096-4ca0-e043-898d941e200a@redhat.com>
Date: Mon, 24 Jul 2023 17:13:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
 <20230722022251.3446223-3-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230722022251.3446223-3-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_021317_990032_5EE78550 
X-CRM114-Status: GOOD (  18.06  )
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



On 7/22/23 10:22, Raghavendra Rao Ananta wrote:
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/Kconfig            | 1 -
>   arch/arm64/kvm/mmu.c              | 6 +++---
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8b6096753740..7281222f24ef 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1111,6 +1111,9 @@ int __init kvm_set_ipa_limit(void);
>   #define __KVM_HAVE_ARCH_VM_ALLOC
>   struct kvm *kvm_arch_alloc_vm(void);
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> +
>   static inline bool kvm_vm_is_protected(struct kvm *kvm)
>   {
>   	return false;
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index f531da6b362e..6b730fcfee37 100644
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
> index 6db9ef288ec3..0ac721fa27f1 100644
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

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
