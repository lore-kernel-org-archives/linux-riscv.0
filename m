Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC9EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysZqmLZ94jHPQg+x4Ymx//78sOK2aHEPsIxAZmzK2nI=; b=CjtBo0CIxSGF42
	4EoxO8cKvXO0N+49VjL8uf69WDukBZTIBeEu+p34uBo/a9RzyBUPz+EspHNgJzN2TZ6MPlRTUPRvX
	Q3jC/CyDqqX0d5l8eSZJYzh/3w2Y7/OZccuCoZxI2g7CFGC8fpNejAAEbu7+9gxo0SQeTlh0tZqAq
	z4uma8gHXsmyDawmbJhKqeVh4pKip2EJsO8o18ijoh1RgR6iBn2Qo+eIzGRfLWuAHvMTR9xD3NxQl
	7QPGsVnEabu6+Bp0l0ggKeLyzcenAJHCO3jzNS2bMDSYQf0iRqANvZpmJGE5TQ81QBziIk9f2LwcS
	M7hnvXgFBIeFxrGr2dfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaN6-003ytA-2s;
	Wed, 09 Aug 2023 04:00:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaN4-003ysB-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 04:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691553629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQlmNO2lLhBYx7/A3bGLPPLUydSYqDE41nBYvmLEPYg=;
	b=AZrVYGWbpzJHeesymMhb/1IHNT5C5nc88LyrpsIJ+xZ9VSJLJI27+SYPgggNArdww6wYQf
	e5LdQYXeWkeOnaOEzLaq8DMds1k4mDwC2N1odSVOz2A5K0rDllfUXP872yN59uUza8wPZj
	fIQFQyqiPCPCGDRobydf43THcdxseI4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-WY0o0SNsMzqJBuTeZ06Yaw-1; Wed, 09 Aug 2023 00:00:28 -0400
X-MC-Unique: WY0o0SNsMzqJBuTeZ06Yaw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6870778be4eso5112333b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 21:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691553627; x=1692158427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQlmNO2lLhBYx7/A3bGLPPLUydSYqDE41nBYvmLEPYg=;
        b=W8gLQFuRUO6ORGF9iBE/IZAi8J+jFbU4DwykhF5ZSwYfRtHClX0Ha+uwiwvzR1DoY3
         Sqsduq1ESZVuVVKtcqjquQ5pejugMOuwqr4OmSaXsMbftADet1Nd/uWQ23mjwVaHnIrp
         4tzSfLHGtN0lv7ivDFQgg/2ty1SvE1xKYqwZXhCW6GphXAQNV8Bw6ObzvUFkXx4EF1qA
         aGw6mZos139Hs5rSHZPF4crITfeZpamm/bAU8VjL226CNeISgXf1lizGlZNpk+A5s2rv
         riP0BYAKXBKsXOXalqy9e2WM8bHFiRw0o+3zJI8gqF2aQc47dBCMXxf/vedJ5E5OSgEY
         K2aQ==
X-Gm-Message-State: AOJu0YzL8bCjNRMiLD3A8qhcpFu8foG2nFuneHlS/A/Y/KgEsPQQI6Di
	xLMGfx4hbLwxGIEWycn1tbMbFTvPz80N0eiDrEgRiMr0Y5Tq/PCiC4WGDzmMwfpY+EHwXwBDSds
	H4YbPO8SvxPRcfGD6gXguYZ8szeII
X-Received: by 2002:a05:6a20:2c98:b0:141:d54e:a907 with SMTP id g24-20020a056a202c9800b00141d54ea907mr938658pzj.19.1691553627004;
        Tue, 08 Aug 2023 21:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvufvyUoufFYXdfEuvYMIQHRTZK4zZPGr4dTmruEN2n1tJuTAm2AE/WhYVDypt5ObnuK/mg==
X-Received: by 2002:a05:6a20:2c98:b0:141:d54e:a907 with SMTP id g24-20020a056a202c9800b00141d54ea907mr938627pzj.19.1691553625804;
        Tue, 08 Aug 2023 21:00:25 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001bc930d4517sm470398plj.42.2023.08.08.21.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 21:00:25 -0700 (PDT)
Message-ID: <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com>
Date: Wed, 9 Aug 2023 14:00:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230808231330.3855936-3-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_210030_581881_92983458 
X-CRM114-Status: GOOD (  15.38  )
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
> There's no reason for the architectures to declare
> kvm_arch_flush_remote_tlbs() in their own headers. Hence to
> avoid this duplication, make the declaration global, leaving
> the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> as needed.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
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

Is the declaration inconsistent to that in arch/x86/include/asm/kvm_host.h?
In order to keep them consistent, I guess we need move kvm_arch_flush_remote_tlbs()
from x86's header file to arch/x86/kvm/mmu/mmu.c and 'inline' needs to be dropped.

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
