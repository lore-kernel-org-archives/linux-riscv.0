Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E46EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 04:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeAsbHXgpoFsULC66gyoKkcIwKdTFn6UUb8qiKstgig=; b=jklM6ZPNEsUeEK
	MARDhIteIjT26BP9olyPvUXx/4niMMAXCeEpMrUKeLJ3Vxv903BjBsHwRqvrwsfAUq/BoGJI9LQry
	GQdf8DB/z5rp/AUpkyM7DUYDLJrBSGREIJudJ9/HCeBXNR2cyinM+XPfKGxQRTE7SPFfxPEn1JPqE
	6kLNnn8yBEl/bBz72XCO9AWtKJxAaC0K4CYtLLGmkHYtnwPcK4DVLLGtfIG3NUMxzfvv8wQIAjat8
	AiQqwrKL1BA/n9N8gASLYxQuFArGz8Idr24tPE00nchG864KZUSXOddIb6piksDzdU53bshEjKAuf
	/Vp/8T+irBIQ6ankLfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaXh-003zqr-2M;
	Wed, 09 Aug 2023 04:11:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaXe-003zpA-0X
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 04:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691554285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jc2RrwZUDP/ZLfqGAQFdphKEXcWYocBgrdrh4msM7SQ=;
	b=MOy4Y2puhh9rxJ+wE7myLqtWLPaHgcrIglMMmq70Ip5eqN6U4WGh13drMSr5EUUgV4BD3v
	imrv6q2fbgd2oiFBjRMTQDDlNufrKLK1+R8GgRk8v2eMBK4V4BQl6rU3Xtc5MRVGIyJqou
	ZwiGt7HgPy6gjn4RlaB6U+DXTt0F+NM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-ezAZ1gVjO8SVNi4J_Uay7A-1; Wed, 09 Aug 2023 00:11:23 -0400
X-MC-Unique: ezAZ1gVjO8SVNi4J_Uay7A-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-55c04f5827eso4519346a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 21:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691554283; x=1692159083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc2RrwZUDP/ZLfqGAQFdphKEXcWYocBgrdrh4msM7SQ=;
        b=BnqUqUIvJR6KNNaGzD8Ug4p3PCdCPsAd03afH9XcY2cwmmbrBssVCjBEs194btejY6
         i8/cE1ykqdIBinJeF/UTHc81/uv26/kZNdy2LDDXaO/FkrgC6uG8ISTbjSnKs7c7GZCd
         jPoeIGla3menJQ9dZ5y4ZBpyX0ZyYI6msm5+HyypQF4QDx4Bfxz03fOsngsqnc1O07gM
         /JJg7jiMDiSvRlrnPoTZGmXLm8IchJWQq/SZLdIMsle/klNrlQZTjymp68PAtzfllTBS
         4QIgOw6NP5OoVzDDUxepctVxjXi/Kf39Im/oxtwd4E+zcbvEAiVT5lIXxnjrHCkZc0Fp
         lNDA==
X-Gm-Message-State: AOJu0YyG1aLBtGLLMLrgkfa0Y7oIdAS/pb36xQYdBAbDiQHraNfC8Sc6
	6TjCTHUL14RDfNSrdz+OM+tgfXsSFiSuVkKfUZRXUkshLzeMOQsBh+aEVSgspmftxzB4i0hBZqL
	AxJVVqfLcY7a4JuX4KjWKFb5oGi8a
X-Received: by 2002:a05:6a21:328b:b0:121:ca90:df01 with SMTP id yt11-20020a056a21328b00b00121ca90df01mr1394016pzb.40.1691554282922;
        Tue, 08 Aug 2023 21:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuTcKraAGNvme4rsh9nauIBvvaQvIf9BEXJr92oZnpUAljzMU4HrA4zieEd0juLoJJfRohRg==
X-Received: by 2002:a05:6a21:328b:b0:121:ca90:df01 with SMTP id yt11-20020a056a21328b00b00121ca90df01mr1394005pzb.40.1691554282647;
        Tue, 08 Aug 2023 21:11:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090322c900b001b2069072ccsm9850474plg.18.2023.08.08.21.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 21:11:22 -0700 (PDT)
Message-ID: <79b8548e-715a-85ee-aad6-cb0b97753df6@redhat.com>
Date: Wed, 9 Aug 2023 14:11:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
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
 <20230808231330.3855936-5-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230808231330.3855936-5-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_211126_300902_BF754538 
X-CRM114-Status: GOOD (  13.52  )
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
> kvm_arch_flush_remote_tlbs() or CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> are two mechanisms to solve the same problem, allowing
> architecture-specific code to provide a non-IPI implementation of
> remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of
> maintaining two mechanisms.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   virt/kvm/Kconfig    | 3 ---
>   virt/kvm/kvm_main.c | 2 --
>   2 files changed, 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index b74916de5183a..484d0873061ca 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
>   config KVM_VFIO
>          bool
>   
> -config HAVE_KVM_ARCH_TLB_FLUSH_ALL
> -       bool
> -
>   config HAVE_KVM_INVALID_WAKEUPS
>          bool
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70e5479797ac3..d6b0507861550 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -345,7 +345,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
>   }
>   EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
>   
> -#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
>   void kvm_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	++kvm->stat.generic.remote_tlb_flush_requests;
> @@ -366,7 +365,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>   		++kvm->stat.generic.remote_tlb_flush;
>   }
>   EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
> -#endif
>   
>   static void kvm_flush_shadow_all(struct kvm *kvm)
>   {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
