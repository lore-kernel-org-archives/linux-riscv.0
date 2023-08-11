Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E63C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 03:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUAAzJTLCRq4ryDLgxHg/AOhlxPujDcrFvkDD5v7Alg=; b=hXJElzmLlPyWfh
	Ltjs/WbgWwg1WJRLAuGnhkHkXsGoDu4t0hCa2/KMiGwTA0kogqm/oD1PwMD93WX8NtiNMiuxDm13Y
	/HReq/QbTUfon2bKYXMnHPB9a3sddlY4TtKq+/YjC7ADBROa3qPhagqxHtMRi79V+WlfkOeR3xu8Q
	tT+wq4+q+MASEDUMfrjwWa4v41T3gfkB5DvSf6Q5oW42PHMU3lnRZ+e4ZoAOSXnz1o3NtkJiF4mTE
	Cscya7tpkFOrHLc7OLZzQr3r7u1AXLsAQ0A0VsjmBIV1RfWwkf6mmDiyyTWHPpsCcQqaQ+zYn16yk
	m0aq6CAwTB9FXPF2WQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIfc-009GYC-3B;
	Fri, 11 Aug 2023 03:18:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIfa-009GX7-0o
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 03:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691723913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PiI+QsxMTBs9vA9vlC+ZyswANJfDDGFtsPp4BYCBVbg=;
	b=StEEFzzG3862GLAF7SiQthLuoO7p7Aio1jiXwNF1oFey2icr81eEA4461RMWpaLYR2sFRY
	tByJwjf7OxT1nzkSe4gdQ24NL4U3mOPHV6vu7uHPhVogz94p99jPp1sqmE/OHLX0B+zcfu
	RHVa9uWgE3J63dhpcEQE8jeFwVSTEhI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-hUfDTxWtPGiTReDtERSsqw-1; Thu, 10 Aug 2023 23:18:31 -0400
X-MC-Unique: hUfDTxWtPGiTReDtERSsqw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-26803e07079so402931a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 20:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691723911; x=1692328711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiI+QsxMTBs9vA9vlC+ZyswANJfDDGFtsPp4BYCBVbg=;
        b=hExiT6nOIlE9pbB3/Y6b+3+fSJEZ2xZDrXPkpMrelrhyNFMU5EzZhvi5Ja5FYo3uQ6
         wS9Z/ll2uBdTtGvANeC8uynTEkbqDTU45F39+YW2Of6AC1E2vfOtIN0ElRrylXvxw+cb
         vK7prqwtddgIxft9e0BJXoDXsnI2oPJ6qfG8uSU/8LzwWa9jpiFCgS8NgghQh1DqqffO
         DhcL56x7KFCMBw8H8AtXMDxZ8TDCf/fc1QSw9hMjz5XkncDSr507NSr2Yoj0RYW+O5S2
         7qAVKdCRB9dIZUeIIl1pZKa8FR5ctOK0mlvmbUo/vO8HdeApE0dUFAdcHIxAWm/zJ2jH
         EkQw==
X-Gm-Message-State: AOJu0YzcjqHkR7xkOsQ+dZnNwycdRYTkUY05YONy/QCb3kIosE6g9lgD
	T8dkBBLyLGY4wzl+aFlCOsk9amzaetxje17HQQf7uerEXP2H93MycxZrDfVWyIJsEoW1CH3E3Yk
	Xqw51o0wXVLeto71km/hI37S53grz
X-Received: by 2002:a17:903:11c8:b0:1b8:17e8:547e with SMTP id q8-20020a17090311c800b001b817e8547emr828127plh.1.1691723910732;
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHID5R08qiLj5A7MSG7B2ILJx/BX/BiDQni1fswd5I7LC3NtLSpgFqmDqjcNklr7RUUka6Afw==
X-Received: by 2002:a17:903:11c8:b0:1b8:17e8:547e with SMTP id q8-20020a17090311c800b001b817e8547emr828095plh.1.1691723910468;
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id q22-20020a170902b11600b001bb24cb9a40sm2547142plr.39.2023.08.10.20.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
Message-ID: <60d1a498-2815-2465-ccc9-e4464791a3fb@redhat.com>
Date: Fri, 11 Aug 2023 11:18:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs()
 globally
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
 <20230808231330.3855936-3-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230808231330.3855936-3-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_201834_363969_97A9BAEE 
X-CRM114-Status: GOOD (  14.26  )
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
> There's no reason for the architectures to declare
> kvm_arch_flush_remote_tlbs() in their own headers. Hence to
> avoid this duplication, make the declaration global, leaving
> the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> as needed.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/mips/include/asm/kvm_host.h | 1 -
>   include/linux/kvm_host.h         | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 9b0ad8f3bf327..54a85f1d4f2c8 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> -int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   
>   #endif /* __MIPS_KVM_HOST_H__ */
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e3f968b38ae97..ade5d4500c2ce 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	return -ENOTSUPP;
>   }
> +#else
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   #endif
>   
>   #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
