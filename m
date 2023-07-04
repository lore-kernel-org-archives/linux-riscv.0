Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2B5EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CtrmBaSjeHF9G/ztHOVsvfzCDgn3D8K/2XGxA++cZg=; b=uIgfR7hElsbS52
	Qzqi1UPqq5JI4VhxicZdyNuyDEum5YhoGgmc/ugLkJ9V8LaiPT74BUsGWr/xw+n6+NMNxBRvdyXwj
	T7aACc+5jpg0gv+0F0WcPwSEANTKGPnKORz1VH9cdxyceJAvfn0kx2N4N15C5vMbXOmIZ/vnlhTIX
	JMcnKljGuSiarIV7wsY+cW154o13vptH72Na7E4PsBHjHxDOe8iHWQiJPoOvWSN1nQ5tsWxqQ+yHK
	8n010Z2eMfEK8KwWu1kNG3+rUhij0IeP82pvh3EDbBp6M8Siiy16ZcuPSRFt1dBcSVlGi49YPA5oH
	tN6AF2yHLim6/BvbkrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGpON-00EMX9-0m;
	Tue, 04 Jul 2023 23:25:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGpOJ-00EMVL-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 23:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688513101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PCpsOElklGvTmmWH0OQRonwleLOQrzWZC/RGYQTYPQ=;
	b=XGlgXGCmtjzyQ4kCud0bYgHdwZmHAKk61IPgB4pdFPCDuGLflbg5Or+RHQHbyQZh0gy5Z9
	BjwduZh32ZkAOt/2l2v1YrNZyM3yv12m3G1MSubXoBEOC1CkaUylKD4Mv4HeYnCIhHns/U
	lqk0vKiJAd30+SqDyc9S1VJQuPMFC5o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-CtFqMHucPei8X2LcqriWQA-1; Tue, 04 Jul 2023 19:23:19 -0400
X-MC-Unique: CtFqMHucPei8X2LcqriWQA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-66a634b2cf5so165637b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 16:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688512997; x=1691104997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PCpsOElklGvTmmWH0OQRonwleLOQrzWZC/RGYQTYPQ=;
        b=OGPYxWoeaHMjjdNUft7IN7sHLvTsWCXlQgcKDvCt5lDtVpIm+EVljcW/n/wBx97Yn6
         6ct9xTW/Le6aPTPEteTdMvgG5ld+DvlrJZ+wIzY7zUwC09brvELUUlVdUFXUbpwhisDB
         MZadSy3sLZ9lGa5gbzt1++A5BFFUo5nbLweS46tebXnDchM20Z2HvcLwe86g7VNN1abv
         W0Ejs4myY+c0s++uuBnLBV5VElJ/ztcWcr2rWZwmPOIcROoOJLfKL8+xFPoc/7N0obvG
         TlhPN00cC2beEvWz8JKu4tGKEmQDEvdcAgEeYh5MfggZ1fzx9yi7kYjFgPkAaohhJ4HM
         99LQ==
X-Gm-Message-State: ABy/qLYs6gz4+EBXpfS6RMQj9T8Qrz+kHlnjyprjalPabw30+YCbFewJ
	RFC3BECbdabihLzc61koThxb8PB1GoOapR1bmfz1GxTIMDXdOX/T8+WpTvwWK42kfwqh7sqnbrT
	TZ431cQkBDltRsGoQ+USWHa9bHJu1
X-Received: by 2002:a05:6a00:1ca9:b0:682:5e8f:d8ba with SMTP id y41-20020a056a001ca900b006825e8fd8bamr724737pfw.11.1688512996828;
        Tue, 04 Jul 2023 16:23:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0UBpOEK5SPsF31xr5f/9Wg1BBxO8IhEOWDLX7lSVKCKwsJxsntJWPkQLzTCSx4pQPuvCDfA==
X-Received: by 2002:a05:6a00:1ca9:b0:682:5e8f:d8ba with SMTP id y41-20020a056a001ca900b006825e8fd8bamr724711pfw.11.1688512996441;
        Tue, 04 Jul 2023 16:23:16 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b0065980654baasm16109591pfb.130.2023.07.04.16.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 16:23:15 -0700 (PDT)
Message-ID: <b977abe4-71b9-daa1-da1b-b111f0afbe51@redhat.com>
Date: Wed, 5 Jul 2023 09:23:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 01/11] KVM: Rename kvm_arch_flush_remote_tlb()
 to kvm_arch_flush_remote_tlbs()
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
 <20230621175002.2832640-2-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-2-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_162503_605937_EED36AD4 
X-CRM114-Status: GOOD (  17.43  )
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
> From: David Matlack <dmatlack@google.com>
> 
> Rename kvm_arch_flush_remote_tlb() and the associated macro
> __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB to kvm_arch_flush_remote_tlbs() and
> __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS respectively.
> 
> Making the name plural matches kvm_flush_remote_tlbs() and makes it more
> clear that this function can affect more than one remote TLB.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/mips/include/asm/kvm_host.h | 4 ++--
>   arch/mips/kvm/mips.c             | 2 +-
>   arch/x86/include/asm/kvm_host.h  | 4 ++--
>   include/linux/kvm_host.h         | 4 ++--
>   virt/kvm/kvm_main.c              | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 957121a495f0b..1473cf923ee37 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -896,7 +896,7 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   
> -#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
> -int kvm_arch_flush_remote_tlb(struct kvm *kvm);
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   
>   #endif /* __MIPS_KVM_HOST_H__ */
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 884be4ef99dc1..6e34bbe244462 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -981,7 +981,7 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>   
>   }
>   
> -int kvm_arch_flush_remote_tlb(struct kvm *kvm)
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	kvm_mips_callbacks->prepare_flush_shadow(kvm);
>   	return 1;
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index fb9d1f2d6136c..f6e3aa617d8b8 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1794,8 +1794,8 @@ static inline struct kvm *kvm_arch_alloc_vm(void)
>   #define __KVM_HAVE_ARCH_VM_FREE
>   void kvm_arch_free_vm(struct kvm *kvm);
>   
> -#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
> -static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	if (kvm_x86_ops.flush_remote_tlbs &&
>   	    !static_call(kvm_x86_flush_remote_tlbs)(kvm))
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0e571e973bc28..95c3e364f24b4 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1477,8 +1477,8 @@ static inline void kvm_arch_free_vm(struct kvm *kvm)
>   }
>   #endif
>   
> -#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
> -static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
> +#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	return -ENOTSUPP;
>   }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cb5c13eee1936..a475ff9ef156d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -366,7 +366,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>   	 * kvm_make_all_cpus_request() reads vcpu->mode. We reuse that
>   	 * barrier here.
>   	 */
> -	if (!kvm_arch_flush_remote_tlb(kvm)
> +	if (!kvm_arch_flush_remote_tlbs(kvm)
>   	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
>   		++kvm->stat.generic.remote_tlb_flush;
>   }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
