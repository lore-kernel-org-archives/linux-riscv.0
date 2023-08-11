Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E81EC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9+1XWWl61lTVMglMYQUg/2DH4Lbom8VLPywmtiI5Nk=; b=OhEmGMKSFazoOJ
	zHkxBc0MIxEEJUtqady/R5zPW2kMdl9/EYHI5J89QqKEOmrsTHNANKb3aFNlCfJWeRZLkEvC2lYym
	j0trhbtW9a4UfixyJJoD8Cl1YcYIx1a/KIvx02SR0No3rFdOWIYA4U7MFo3xT+i6KnMmJz8FIPL7a
	KW2JiUDbPPVOYZdtS2rDm2AOyFYSFIjK7RDAnjX5y8KeAj8L7dwFpCylty1fNBhnaTrpo1LUNQagM
	ZWjP73Jk7+kb58P2yvHJEuOc7OSQ/yRphcJKJ4XSYWpIn/2j5eyT3z89tQyTweA0QdhpbaUBY/DQU
	mFCjNT+d5AtJFIJJIDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIRZ-009EH8-0t;
	Fri, 11 Aug 2023 03:04:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIRU-009EFm-1B
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 03:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691723039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DMrZ/cVVx9oJnb2z2JJ4WKVaGEEQv2IXABVTFJ5wRQ=;
	b=eViK7cmuXm7qapoTxs6HXXdJUQhVUf3IG+2xlSwJoNIYd1q9QtxUE8VjCkxlsVaWY5w+Z4
	nwgEE4MIyp4EVuwoUI+LiXKj7A03U3Eo5AhQXPIdK7En3GUGRUEx7AJl/v9w6N8vsFs3Bm
	G9OiwS79Kov8mJFII5i6icfZn10Ni2Y=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-VrNCb7hNOsuItgOeqSFMzw-1; Thu, 10 Aug 2023 23:03:58 -0400
X-MC-Unique: VrNCb7hNOsuItgOeqSFMzw-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-565648619bbso223357a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 20:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691723037; x=1692327837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DMrZ/cVVx9oJnb2z2JJ4WKVaGEEQv2IXABVTFJ5wRQ=;
        b=jp/Zm57Zx/SQnaSaCzI2zPB5XY9fjxCsRgt+5E1gu2Qgn//vV+HEjmtrK1QzRFsC5C
         zjM4kLqNkfkSSnvXDstVpPJsBnAI/yAZOgLmDdAIu/37VydxsO0zi+qYuKYWC2luZrks
         rRwGZQ+pY+XKpjhy81LVyDNLcYVVk6zmbWkwR3C5WzN9UnwOegKtegAWHmSUiH8Ai2qF
         7IEUF5IE92D/wi6n3ylf8s+OtQXN3UrvjdM3rijpJsRELlj4M1lBsLnK1oG3puSQmHwJ
         3jJ45wXM/pPo0PaEZYuSMuQuHwlXa1XfJ6tq1EpgE5mch+WJ6yNHUV6/PXrza9QRf93U
         xlWA==
X-Gm-Message-State: AOJu0YylGn9KPZ5VS4cEH3RybD8PFqriWNUTZ1XW19lTsdnc/pra45fa
	xEC8L7+4shc/lPML73xM90H6EzM+CV7tYVu6pcriA5hUy9PTf8fd4leFg8okAAMwDGrlimISI6p
	1cqrdub+5lqs/0/+seTltQqg+YQR/
X-Received: by 2002:a05:6a21:6d88:b0:13a:3649:dc1a with SMTP id wl8-20020a056a216d8800b0013a3649dc1amr1316473pzb.0.1691723036993;
        Thu, 10 Aug 2023 20:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENpkl1RL6Mkjeuk83qmopiO791ccRF4dSFjJzHpK+/MQLjdG2TJSO7XFsP6XAreIKgXCzHJg==
X-Received: by 2002:a05:6a21:6d88:b0:13a:3649:dc1a with SMTP id wl8-20020a056a216d8800b0013a3649dc1amr1316435pzb.0.1691723036603;
        Thu, 10 Aug 2023 20:03:56 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id y15-20020a637d0f000000b00553d42a7cb5sm2239376pgc.68.2023.08.10.20.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 20:03:56 -0700 (PDT)
Message-ID: <d03b0f1f-2bd6-fc23-2d7a-ddb36eba93cf@redhat.com>
Date: Fri, 11 Aug 2023 11:03:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 11/14] KVM: arm64: Implement
 kvm_arch_flush_remote_tlbs_range()
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
 Gavin Shan <gshan@redhat.com>
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-12-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230808231330.3855936-12-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_200400_486083_87154290 
X-CRM114-Status: GOOD (  14.96  )
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
> Implement kvm_arch_flush_remote_tlbs_range() for arm64
> to invalidate the given range in the TLB.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 ++
>   arch/arm64/kvm/mmu.c              | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 20f2ba149c70c..8f2d99eaab036 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1113,6 +1113,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>   
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +
>   static inline bool kvm_vm_is_protected(struct kvm *kvm)
>   {
>   	return false;
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 0ac721fa27f18..294078ce16349 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -172,6 +172,14 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   	return 0;
>   }
>   
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> +				      gfn_t gfn, u64 nr_pages)
Hi Raghavendra,

As the kernel test robot points out, the parameter `gfn` should change 
to `start_gfn`.

Thanks,
Shaoqin
> +{
> +	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
> +				start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
> +	return 0;
> +}
> +
>   static bool kvm_is_device_pfn(unsigned long pfn)
>   {
>   	return !pfn_is_map_memory(pfn);

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
