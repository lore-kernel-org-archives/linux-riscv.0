Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216AAC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 09:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCOytOyLijjle7IH/B77b5jpDmzu31p29h5uTdlrt1I=; b=mjCFgpNTxZQp4t
	yvodD9WFItb6649ffpiS/d1vhZx7N/lyXo6yxtO05OIbuIKGgMOxdKvOP1nKLV9UMSpoNyEj/4mm/
	lsBZvq6Op+mhtVPqKRJmQ3njEV1+9lTkrK3h2sfOoApxaxLBeIlD5XbFOvk217cIglfdG/4RFVVpQ
	4I5Ve7YP6w3UIFcmg1NNrPrHx3JhsDDKYODpewJawnBXoicmT7HoncywvVbUK8/KugGfBUX2CP2mT
	75YYM+AmoBT/la3jpu8IGMex/begX74XvAKkcz/IfXu6nzpBMUp+DPB0Oj1OSSX9cDpFO0sVfJxNc
	qvF3k97xiwg4hwP5VNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrdf-003Mlv-2Z;
	Mon, 24 Jul 2023 09:13:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrdc-003MjT-1F
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 09:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690190035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2oPDYvwpZtu0Ko50jtkdQDGuMOTIWCRCGf2FetUqVmk=;
	b=HVbdtHueq+R0K5BgARQzCpIzIzs3x9InXg2XzGO7ts6NLBgcYTAzr/jrAsqTGVGW88zOnc
	eTspVOQ0tASiGvgAAw+Yue9oytkL/VHGcw/UXcA/JNq4EuwjpvhOLRgzbQQBWoNtYryU9o
	hdhsKnq2VZrroDXHH85aSGx45dFv3zg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-EAnPU6WFPLuhVG8IxuqRcw-1; Mon, 24 Jul 2023 05:13:53 -0400
X-MC-Unique: EAnPU6WFPLuhVG8IxuqRcw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6b9a7633db8so877040a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 02:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690190032; x=1690794832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oPDYvwpZtu0Ko50jtkdQDGuMOTIWCRCGf2FetUqVmk=;
        b=T55uQUMvSc3mcIODhjzx98441IMZLBaRN6mzJN9oz32PvV5JXLtZ0OWxxCGqHc8kmb
         KXkFjZfrfXGqTw7iOblpS0J48ax3fU+3ckW/zWnos/3O5ehmqGzbX7CmUDKvH7CW8RvT
         T99LmTX/jYRGHdIW0FgSmYid5L9sIvlrgxOWhckyjjQv62/xg6JcAknn65AbJqX5eKN3
         LLaHcKma33SEemwuQzuEtkCwqJJlL+NiK3JN7zPENr+8Sbvc+DRIQQ+iV3JHu3TW1bSJ
         PjkG2Ii8kZ5pHosmJdQ2MH9xr+m0YGNiCQlp7yeW3fk9KwUUcPnFYiu9FKtGNvhXIJPW
         jJRg==
X-Gm-Message-State: ABy/qLafbIW/hcXumPpfc4b5++xFxCTifwyoKRlht3LPgkSw4By2ECTL
	sYND8wWqIFaCEWjULKwUs2/ql+w5enRBporkSXw9cLRyT12rFl2i+RkRWOhFqAlu/2wqZxn08zR
	QVnOALVlX1kVfjg+1gcSRQaA/Diaf
X-Received: by 2002:a05:6870:568e:b0:1b7:613c:2e30 with SMTP id p14-20020a056870568e00b001b7613c2e30mr7564449oao.2.1690190032050;
        Mon, 24 Jul 2023 02:13:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGz31tvB+wfj4JC9JljpAdnVVugjKH/UFomLvpFW9yVXyN8NXs0fQCdMnGqdTxGWM2Ywaca6g==
X-Received: by 2002:a05:6870:568e:b0:1b7:613c:2e30 with SMTP id p14-20020a056870568e00b001b7613c2e30mr7564429oao.2.1690190031838;
        Mon, 24 Jul 2023 02:13:51 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w6-20020a63af06000000b0050f85ef50d1sm7977675pge.26.2023.07.24.02.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:13:51 -0700 (PDT)
Message-ID: <c28915ad-d10c-a5f4-9b95-4ab644139780@redhat.com>
Date: Mon, 24 Jul 2023 17:13:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 03/12] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
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
 <20230722022251.3446223-4-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230722022251.3446223-4-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_021356_493971_6C16B9CB 
X-CRM114-Status: GOOD (  12.82  )
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   virt/kvm/Kconfig    | 3 ---
>   virt/kvm/kvm_main.c | 2 --
>   2 files changed, 5 deletions(-)
> 
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index b74916de5183..484d0873061c 100644
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
> index 70e5479797ac..d6b050786155 100644
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

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
