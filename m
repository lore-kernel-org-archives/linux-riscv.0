Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD73C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKh+8EJbX3PGEX1NBszzFCd4ZN6PBKVcGXL9h124NgU=; b=HO+mKfCdD0Ngc4
	a8Yh7D0UXJLvH/2JK1iITVkv+1qRTV71V7+bGgh/xT3l9GHNMRrhhuJQcQnYNSjoGxE3qKHDfYbt1
	aQfn4hpS8k396HL4ea99FbxxiEGvHIJAsJgbWzyJA6O+XmUaCRvy0xFAwmk1Yqk5CDQW7FXn+MdId
	OH1oHgHDKQJp0DMvQ0GJRg63QLRd6pVTYE2eElEVSZ9v5SlAmuk/5xQitQ5xwXSsWaRC7j/u7abfU
	Aq8JHmpoGCAHE7jlpXad0Ixkz96D8GYE0VDAFuNjGbFpn3bGcWC/6e4Pv/DCCs5T+ZRINkOIHkjnx
	fctg6sx2xGfb2zmE8eHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lOr-008Bg6-9C; Thu, 01 Dec 2022 15:22:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lOo-008Bd1-Nq
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 15:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669908172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uolOOp7yoOC/673O4rWJ2SQim3eJ9tGJUopqkFhibc=;
	b=B+Uzk/aU+G0kyeVnZME32d4YN4l7sLEVdy7VP6JuIJVqdFtpi6L4u9AR4foUS4yhJn04ji
	IbCpdEjCFiv/Ox5p9ri3H0diiVKuINuS06MGQTlm7eAeA92w2eMUUp1TObuZXodswa8hnv
	xYmqwHPcu0DVGFsFXIzPOza1/s2AbEU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349--JZEZbCOOACgCmKlAJHwRw-1; Thu, 01 Dec 2022 10:22:51 -0500
X-MC-Unique: -JZEZbCOOACgCmKlAJHwRw-1
Received: by mail-wr1-f71.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso509852wra.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 07:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uolOOp7yoOC/673O4rWJ2SQim3eJ9tGJUopqkFhibc=;
        b=JIIXSclDaagMW84BqroX34PcJPs+F+s3ZYNNl1dimoZSTrp6mNJ/rrTSos9hJqVbE0
         CuidO9gEFKR/PblZXZDFLEssGY+DHOpdL+wskUA/z9iSREOhtWIXw2/TO/92+BHCIGOW
         jGXxHRuq6QzVwIbsZjfc0rXYmXBYpm4IUqCwro9SlSbzmwcsSk4iuLBjQq0ErXV0Bu8q
         KeBMM9LP5RiGpRtcCkZloVYrAQILpEPDfIeYoWid2JkHnhRQKrWWc4HbGwgqQNQA6Lqn
         Vwcv6gsZZ73f7qrT/aEqBTR7XS6aCS9JEbuAQjAicPyTDLNNwU+sbJ9C+HPDNmSLLloq
         DzCw==
X-Gm-Message-State: ANoB5plyRiQctnVFI8Q70IGSOGfnVuMnfL2wmAb8YaFgtgyxKKcJGx/G
	vfoa+CZlQCzyLu7v75PpsyVjBms7iqzsnpF+MxvHWne0uAjwyr5OLzVAn/66BoIDGQNlZy/E0u0
	N4YnhyB65zfWQ4jYlHC/BO7eY6ZPb
X-Received: by 2002:adf:f54e:0:b0:242:1534:7b57 with SMTP id j14-20020adff54e000000b0024215347b57mr14035647wrp.404.1669908170128;
        Thu, 01 Dec 2022 07:22:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4+3YusiSWHR13O3MACnIQbSphop/g7AmmIFME21D1fv2+5ZYUMJJrVIeLUQmj0nQTJeAmHuA==
X-Received: by 2002:adf:f54e:0:b0:242:1534:7b57 with SMTP id j14-20020adff54e000000b0024215347b57mr14035606wrp.404.1669908169821;
        Thu, 01 Dec 2022 07:22:49 -0800 (PST)
Received: from ovpn-194-141.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b003b47e75b401sm10593279wmq.37.2022.12.01.07.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:22:49 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra
 <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Yuan Yao
 <yuan.yao@intel.com>, Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata
 <isaku.yamahata@intel.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao
 <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Sean
 Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 12/50] KVM: VMX: Move Hyper-V eVMCS initialization to
 helper
In-Reply-To: <20221130230934.1014142-13-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-13-seanjc@google.com>
Date: Thu, 01 Dec 2022 16:22:45 +0100
Message-ID: <87k03bf8sa.fsf@ovpn-194-141.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_072254_883895_7EC3F101 
X-CRM114-Status: GOOD (  24.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Move Hyper-V's eVMCS initialization to a dedicated helper to clean up
> vmx_init(), and add a comment to call out that the Hyper-V init code
> doesn't need to be unwound if vmx_init() ultimately fails.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 73 +++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index c0de7160700b..b8bf95b9710d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -523,6 +523,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
>  static unsigned long host_idt_base;
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
> +static struct kvm_x86_ops vmx_x86_ops __initdata;
> +
>  static bool __read_mostly enlightened_vmcs = true;
>  module_param(enlightened_vmcs, bool, 0444);
>  
> @@ -551,6 +553,43 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  
> +static __init void hv_init_evmcs(void)
> +{
> +	int cpu;
> +
> +	if (!enlightened_vmcs)
> +		return;
> +
> +	/*
> +	 * Enlightened VMCS usage should be recommended and the host needs
> +	 * to support eVMCS v1 or above.
> +	 */
> +	if (ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
> +	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
> +	     KVM_EVMCS_VERSION) {
> +
> +		/* Check that we have assist pages on all online CPUs */
> +		for_each_online_cpu(cpu) {
> +			if (!hv_get_vp_assist_page(cpu)) {
> +				enlightened_vmcs = false;
> +				break;
> +			}
> +		}
> +
> +		if (enlightened_vmcs) {
> +			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
> +			static_branch_enable(&enable_evmcs);
> +		}
> +
> +		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
> +			vmx_x86_ops.enable_l2_tlb_flush
> +				= hv_enable_l2_tlb_flush;
> +
> +	} else {
> +		enlightened_vmcs = false;
> +	}
> +}
> +
>  static void hv_reset_evmcs(void)
>  {
>  	struct hv_vp_assist_page *vp_ap;
> @@ -577,6 +616,7 @@ static void hv_reset_evmcs(void)
>  }
>  
>  #else /* IS_ENABLED(CONFIG_HYPERV) */
> +static void hv_init_evmcs(void) {}
>  static void hv_reset_evmcs(void) {}
>  #endif /* IS_ENABLED(CONFIG_HYPERV) */
>  
> @@ -8500,38 +8540,11 @@ static int __init vmx_init(void)
>  {
>  	int r, cpu;
>  
> -#if IS_ENABLED(CONFIG_HYPERV)
>  	/*
> -	 * Enlightened VMCS usage should be recommended and the host needs
> -	 * to support eVMCS v1 or above. We can also disable eVMCS support
> -	 * with module parameter.
> +	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
> +	 * to unwind if a later step fails.
>  	 */
> -	if (enlightened_vmcs &&
> -	    ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
> -	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
> -	    KVM_EVMCS_VERSION) {
> -
> -		/* Check that we have assist pages on all online CPUs */
> -		for_each_online_cpu(cpu) {
> -			if (!hv_get_vp_assist_page(cpu)) {
> -				enlightened_vmcs = false;
> -				break;
> -			}
> -		}
> -
> -		if (enlightened_vmcs) {
> -			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
> -			static_branch_enable(&enable_evmcs);
> -		}
> -
> -		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
> -			vmx_x86_ops.enable_l2_tlb_flush
> -				= hv_enable_l2_tlb_flush;
> -
> -	} else {
> -		enlightened_vmcs = false;
> -	}
> -#endif
> +	hv_init_evmcs();
>  
>  	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
>  		     __alignof__(struct vcpu_vmx), THIS_MODULE);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
