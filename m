Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B6EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goaN+5zFRDCuuXqEWzR8Z/YPa7Br88OYIEYxM0NmOsY=; b=bu34qveYCocqBz
	EmlfTNHr9Nic0Cx+NQugrye4MNh/lp4bxEASg0/VxFB3pRI26+6X78QqZ31jmqANk3cWwJqndiCGe
	W9wGljNFNgLzhmNo5RG/Ud0DEk/4y/Jyy5cWm566bV8Ox+DKI7W+lKbEVmDbIgZm/R9fMpK1vTNFa
	VAaQvY4LpxQaobkkwXKKUZkNzLW8+denTf2iJvWCIb7Xn5VxG9HclRrocOd+obEkcDjAEeNlXO0fr
	dXrAlYWex7dcxpxNWMG8fjiVtuXUNAkz8KPEMEvdt+Q15YXwBDjFYDuSoBF2gIRknyMEzPg4LAYKy
	j+Bp7kP61hdAE1szHjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM3n-003ojk-0e;
	Mon, 17 Jul 2023 11:06:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM3k-003oiv-0H
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 11:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689591989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGOOqLavhEXg7lyDpvUW6ICkPL0LfcVFnu070bLPGDE=;
	b=T9s+EJ6l8mXVctwcqbxzDFyqlM0areCKe98rp1ZwSz8vAzfat8dSrl7QdBWnb2+TWqI5RW
	idDBFG6dWy4QjN5t5hOWvH/drxC7jcOdxvhxjJNlCVTxbHo/iPtxhL+5d1gxKwzt6f7El0
	8AwGtHeG/LSj1WajRqx4JLavHPQ6lD4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-q33caH8-NVGt9IKvADUTEA-1; Mon, 17 Jul 2023 07:06:26 -0400
X-MC-Unique: q33caH8-NVGt9IKvADUTEA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-767d30ab094so104217385a.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 04:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689591986; x=1692183986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGOOqLavhEXg7lyDpvUW6ICkPL0LfcVFnu070bLPGDE=;
        b=GEo2zIlsOz0igAIu8uaUaV/d79PvVmb/L3k0yFGXbwwkadk3worj9s7pwvHYAzvXF/
         XFcBjuNUuVn995L9NO5QUkRPpqNPXgGszKrhrtRTYfgxpNG6OknrWLkyR6kVaQ/FRwV5
         LddE1d85syhMxQGC+lL4WfLYwHcPmO7oWvYyKTFhYNpraBu6CKxjutHAsRyayVhp2pjR
         B/TzefNLIp9X/clbX7NV9FqgpRVkEqJsK9iRgCI9+y3rwlth3flLK5pRwcdK/qzYeWkG
         hifTqEOmAjyCBna4xkrv/yzWZ0gqw/nehHmfRmQLuShSQbr7nn/R4wVkc+7q2L5MuBdz
         Zmcw==
X-Gm-Message-State: ABy/qLYzgNVng58Ip6/QSxBYqF/hL7wAqJ5Kc/L+4D3KnWvSWkq6GCG5
	K52YJ86pP8zyvB6NGIdXFIHAHh+WisVStWgEePWfa6tlfk3c4dq+GXc7+YOdikJ6l/g0jayj2EP
	djil3KKyh6jFHEk4p3A6l2YGr8cZr
X-Received: by 2002:ad4:4eea:0:b0:634:cdae:9941 with SMTP id dv10-20020ad44eea000000b00634cdae9941mr6281522qvb.0.1689591985908;
        Mon, 17 Jul 2023 04:06:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHPP9caNhe5hJZM2GlWhiygfmGOQVyjdcW0NBVwh6GDivJx65xNuv4iB/a90XMh51kWdiueww==
X-Received: by 2002:ad4:4eea:0:b0:634:cdae:9941 with SMTP id dv10-20020ad44eea000000b00634cdae9941mr6281491qvb.0.1689591985670;
        Mon, 17 Jul 2023 04:06:25 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id x26-20020a0ca89a000000b00621268e14efsm6363454qva.55.2023.07.17.04.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 04:06:25 -0700 (PDT)
Message-ID: <4f465d66-baa3-88bc-86f5-d88cc0a73441@redhat.com>
Date: Mon, 17 Jul 2023 19:06:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 01/11] KVM: Rename kvm_arch_flush_remote_tlb() to
 kvm_arch_flush_remote_tlbs()
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-2-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-2-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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



On 7/15/23 08:53, Raghavendra Rao Ananta wrote:
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
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/mips/include/asm/kvm_host.h | 4 ++--
>   arch/mips/kvm/mips.c             | 2 +-
>   arch/x86/include/asm/kvm_host.h  | 4 ++--
>   include/linux/kvm_host.h         | 4 ++--
>   virt/kvm/kvm_main.c              | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 04cedf9f8811..9b0ad8f3bf32 100644
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
> index aa5583a7b05b..4b7bc39a4173 100644
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
> index 28bd38303d70..a2d3cfc2eb75 100644
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
> index 9d3ac7720da9..e3f968b38ae9 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1479,8 +1479,8 @@ static inline void kvm_arch_free_vm(struct kvm *kvm)
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
> index dfbaafbe3a00..70e5479797ac 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -361,7 +361,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>   	 * kvm_make_all_cpus_request() reads vcpu->mode. We reuse that
>   	 * barrier here.
>   	 */
> -	if (!kvm_arch_flush_remote_tlb(kvm)
> +	if (!kvm_arch_flush_remote_tlbs(kvm)
>   	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
>   		++kvm->stat.generic.remote_tlb_flush;
>   }

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
