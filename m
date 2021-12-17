Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B835DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcqfmggSEH+zy96Q6k4zN0bwgzy3y6ejwpu4jm6yJmg=; b=3bV5nK7sI4ahIw
	TZZMcTk/5T5SzWmvoVpbcz855BWOYJbKvApdNOPoX5XhjLXeOv81nPSW8FniSA3vZPs3octoUtvvP
	BqnIcz94lt4xZufvGW3+cY+y7LhboKE3xd8WFDWL2MH1gSwgB5D9S0I/IPsx3unlsqbzlrA+j757E
	aE6nfNXaFjsibA8bvK/bOrYe7/tvX+9eBg1T8ZDZAuSKChuzNZMExsbAoMPaoa+NrfZQbGAm/nZeD
	/VN3LKxogCO6JQsDD+DhEr5sQGCkNCK8E/27lSPEYnbZsXmc2HEPKHUXEFD1aIP5NWcQkFeimhFlf
	4hjGwNIxOo1mPFGTjb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my8b8-0090rY-EH; Fri, 17 Dec 2021 08:28:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my8b6-0090q2-EC
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 08:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639729690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26LIJ1YdIsB73eNvPXzazi/kBaf5btKN6tb7Yo1wgdw=;
 b=DX6oml4OvvSEAGq0CZt+6lqvsxVuN7EB7yGU9OXtRwjRLEQ3WTPhZ13wRgFMYKozC/l5Zz
 8Nc7x60obBl85UdDEFpj7Z5YIqjSt9YQ5TwZwxp4T/PmTNEaYeEv9LF4mby6iswUdJmaKs
 Gwc2M8ai5bZUcIIbUpaNoYXo/KChXgY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-8r323AHGMoGNw3jBqpX53A-1; Fri, 17 Dec 2021 03:28:08 -0500
X-MC-Unique: 8r323AHGMoGNw3jBqpX53A-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso685072wmb.2
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 00:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=26LIJ1YdIsB73eNvPXzazi/kBaf5btKN6tb7Yo1wgdw=;
 b=WDOp3hTQsN7A/ZlwOaTy0ofysen6i+06/qFgM19H6ZIbSLupX4MkzdeUsIJqa1d2nH
 XvkI1a+CNzhZR0QRWKM8ubhqwrSPcOSecbjV3TblT7d807tjyCxy0hW0dNvd4g/5Ii2g
 QNKB2Gb/IkPoHTyNf1bRk3c4k+/QS+nEcDy3bs+nOvxNTekb7t2Dnx8C4f6SjTXtcntB
 i76RPn2HlW0yL0U1rhnyTVvEFydq65tw+RrTvhXB8MFusE4rCecK8rn6lNq2vZRo2nhd
 PwjN1Js9wYuergCekSmh2el2ooCB7OiHrkM3DBVdjXUNPYPdC6DSKvvAYTJdh3/oRxoO
 JSCg==
X-Gm-Message-State: AOAM531Gfw2ry9Aw6L/+nr9oTWXkbdfbqPopVBmL35MjlSmz8cJoQsbe
 IrzF/2+QPDqR0UqWO15R5lX+PluETaL8o4Rdl7lspheLhXFO87uMvVrR4hbuDkA8n7FdsZ9cVhv
 hlAZbRafkHA4k4W7ACrWZ72r5nc/4
X-Received: by 2002:adf:f10f:: with SMTP id r15mr1465020wro.553.1639729687527; 
 Fri, 17 Dec 2021 00:28:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqmD+ti2U+gXLkJIXbA6dH/cRko3HnTprM5FpnCFB+dff8kIv2MHRCc7cqlV3ofyjCfG18KQ==
X-Received: by 2002:adf:f10f:: with SMTP id r15mr1464998wro.553.1639729687242; 
 Fri, 17 Dec 2021 00:28:07 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id m6sm8866287wrp.34.2021.12.17.00.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 00:28:06 -0800 (PST)
Message-ID: <3c5472f4-44ce-9ba8-4dbc-967ea377ae10@redhat.com>
Date: Fri, 17 Dec 2021 09:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] RISC-V: KVM: Add VM capability to allow userspace
 get GPA bits
To: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-3-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211129075451.418122-3-anup.patel@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_002812_616128_3C0DE635 
X-CRM114-Status: GOOD (  20.88  )
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

On 11/29/21 08:54, Anup Patel wrote:
> The number of GPA bits supported for a RISC-V Guest/VM is based on the
> MMU mode used by the G-stage translation. The KVM RISC-V will detect and
> use the best possible MMU mode for the G-stage in kvm_arch_init().
> 
> We add a generic VM capability KVM_CAP_VM_GPA_BITS which can be used by
> the KVM userspace to get the number of GPA (guest physical address) bits
> supported for a Guest/VM.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 1 +
>   arch/riscv/kvm/mmu.c              | 5 +++++
>   arch/riscv/kvm/vm.c               | 3 +++
>   include/uapi/linux/kvm.h          | 1 +
>   4 files changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 37589b953bcb..ae5d238607fe 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
>   void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
>   void kvm_riscv_stage2_mode_detect(void);
>   unsigned long kvm_riscv_stage2_mode(void);
> +int kvm_riscv_stage2_gpa_size(void);
>   
>   void kvm_riscv_stage2_vmid_detect(void);
>   unsigned long kvm_riscv_stage2_vmid_bits(void);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 9ffd0255af43..9b6d6465094f 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
>   {
>   	return stage2_mode >> HGATP_MODE_SHIFT;
>   }
> +
> +int kvm_riscv_stage2_gpa_size(void)
> +{
> +	return stage2_gpa_bits;
> +}
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb18af34a4b5..6f959639ec45 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_NR_MEMSLOTS:
>   		r = KVM_USER_MEM_SLOTS;
>   		break;
> +	case KVM_CAP_VM_GPA_BITS:
> +		r = kvm_riscv_stage2_gpa_size();
> +		break;
>   	default:
>   		r = 0;
>   		break;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 1daa45268de2..469f05d69c8d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>   #define KVM_CAP_ARM_MTE 205
>   #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> +#define KVM_CAP_VM_GPA_BITS 207
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> 

This is nice and other architectures could support it.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
