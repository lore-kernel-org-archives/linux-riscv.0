Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1EC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7q6svNcYtbbVimnf+yWWK568IPyLqcsW2mzv+xgoHM=; b=all2JFH8r6rtqB
	DaRAHT893synZYG5GoUP+dbn8ORTIhbowjtszgyc4PKlarm3t7SozeC74x4BnoTuKahGgianWqYcE
	ihwgt7+qe3FDao66zhyf4xDcWkdF6meBEhwGFVMgScrW2GoEM8dXUkuoC9bEPDGJSB4WjyJrYe2i+
	0KKlgfsrrGHf6ISC3b2oW4XZQbeKHeD3SesDXjYWCkmaksZEyJt/ZT01Y9Lyf56CefdykY2f2UgCQ
	3Od0aSTJw71UBLL2euQObjNbjALzWjpLtVaesrys75HanFvny5e270uPfz25ltao/D/O84rhtZDPN
	ohXkgifPTTfxCdxfdt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0liQ-008JEi-O3; Thu, 01 Dec 2022 15:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0liL-008JAo-Pl
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 15:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669909384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uICPaEENN8EB00poBiDynBWP9unBSRZ6Eo0ZeloiILw=;
	b=ShDSpJFN0QDtH03IzK5wfnlyUH76O3c7dsbxoFK+KF0E2RVlEAR3LFhECLAXd86gw9UQ/X
	3FrWrq7UepVYdRDfFbakv+ciRtEt2VkXedgY1ubBB3Thq6PYJfP/roq+NZqQvA1N2Tkfx1
	mPSxDMX7PJPfke0HISThbxAYOMGvlMc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-YmBplWFuN1mFxLZ2mugWxw-1; Thu, 01 Dec 2022 10:43:03 -0500
X-MC-Unique: YmBplWFuN1mFxLZ2mugWxw-1
Received: by mail-wr1-f72.google.com with SMTP id k1-20020adfb341000000b0024215e0f486so532169wrd.21
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 07:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uICPaEENN8EB00poBiDynBWP9unBSRZ6Eo0ZeloiILw=;
        b=dJFKHBPQNt8+U7nWgxRveT2ICblDQ1ONgXZAFWYskMW9POfgPflekLThgojTSTbPng
         fjj+r+Dsx2li09h5qkhlEjgtQDfE405BFUc0pWjUcdjvqJ5WciCHfRVKXxjHddF9cV6s
         gAWYnXLOpfIHvpxDhRjKVsmAu69mIFEvgjB7HNr6AUENz2GF936fSWQws0TanjmqdhpR
         AJs+Zzxg5uXomgb3JlaRUl2mL39Jm1XgJoxv/9DBpodkftoHtCISEZj2FNgQY5lIupE8
         4jZKuRWwr/FYo/OWClTIQtfu2KsViak1H6tJJYIdzwe5K1nqoVxgJESM/lkaxRyx0v/b
         5EVg==
X-Gm-Message-State: ANoB5plHJJVEfmshAqYWayucKmz5JNGH4256yFfce98eDwFKZDfBjp2S
	OMsFWIj3VL9bB1QRypN8b4B+Qt5OUVCSrAmaJlsy58HEW6y1LHzsflwyqhSQE3ZHXnaBeS244mw
	4Y07CiNWXI4BLtYcEUUKFbr1IjllP
X-Received: by 2002:adf:ecd2:0:b0:236:6fd9:9efa with SMTP id s18-20020adfecd2000000b002366fd99efamr39370644wro.101.1669909382061;
        Thu, 01 Dec 2022 07:43:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4imAxqHpsHzf4lwMnv25YvuYKadYTHsioCJaPqnZlFtnFG20xMn8tkXOhL/ZrHUpQYnEbeIQ==
X-Received: by 2002:adf:ecd2:0:b0:236:6fd9:9efa with SMTP id s18-20020adfecd2000000b002366fd99efamr39370625wro.101.1669909381800;
        Thu, 01 Dec 2022 07:43:01 -0800 (PST)
Received: from ovpn-194-141.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id bg28-20020a05600c3c9c00b003cfa3a12660sm9307122wmb.1.2022.12.01.07.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:43:00 -0800 (PST)
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
Subject: Re: [PATCH v2 10/50] KVM: VMX: Reset eVMCS controls in VP assist
 page during hardware disabling
In-Reply-To: <20221130230934.1014142-11-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-11-seanjc@google.com>
Date: Thu, 01 Dec 2022 16:42:58 +0100
Message-ID: <87h6yff7ul.fsf@ovpn-194-141.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_074305_944791_CD5BFC89 
X-CRM114-Status: GOOD (  29.66  )
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

> Reset the eVMCS controls in the per-CPU VP assist page during hardware
> disabling instead of waiting until kvm-intel's module exit.  The controls
> are activated if and only if KVM creates a VM, i.e. don't need to be
> reset if hardware is never enabled.
>
> Doing the reset during hardware disabling will naturally fix a potential
> NULL pointer deref bug once KVM disables CPU hotplug while enabling and
> disabling hardware (which is necessary to fix a variety of bugs).  If the
> kernel is running as the root partition, the VP assist page is unmapped
> during CPU hot unplug, and so KVM's clearing of the eVMCS controls needs
> to occur with CPU hot(un)plug disabled, otherwise KVM could attempt to
> write to a CPU's VP assist page after it's unmapped.
>
> Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 50 +++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index cea8c07f5229..d85d175dca70 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -551,6 +551,33 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  
> +static void hv_reset_evmcs(void)
> +{
> +	struct hv_vp_assist_page *vp_ap;
> +
> +	if (!static_branch_unlikely(&enable_evmcs))
> +		return;
> +
> +	/*
> +	 * KVM should enable eVMCS if and only if all CPUs have a VP assist
> +	 * page, and should reject CPU onlining if eVMCS is enabled the CPU
> +	 * doesn't have a VP assist page allocated.
> +	 */
> +	vp_ap = hv_get_vp_assist_page(smp_processor_id());
> +	if (WARN_ON_ONCE(!vp_ap))
> +		return;
> +

In case my understanding is correct, this may actually get triggered
for Hyper-V root partition: vmx_hardware_disable() gets called from
kvm_dying_cpu() which has its own CPUHP_AP_KVM_STARTING stage. VP page
unmapping happens in hv_cpu_die() which uses generic CPUHP_AP_ONLINE_DYN
(happens first on CPU oflining AFAIR). I believe we need to introduce a
new CPUHP_AP_HYPERV_STARTING stage and put it before
CPUHP_AP_KVM_STARTING so it happens after it upon offlining.

The issue is likely theoretical as Hyper-V root partition is a very
special case, I'm not sure whether KVM is used there and whether CPU
offlining is possible. In any case, WARN_ON_ONCE() is much better than
NULL pointer dereference we have now :-)

> +	/*
> +	 * Reset everything to support using non-enlightened VMCS access later
> +	 * (e.g. when we reload the module with enlightened_vmcs=0)
> +	 */
> +	vp_ap->nested_control.features.directhypercall = 0;
> +	vp_ap->current_nested_vmcs = 0;
> +	vp_ap->enlighten_vmentry = 0;
> +}
> +
> +#else /* IS_ENABLED(CONFIG_HYPERV) */
> +static void hv_reset_evmcs(void) {}
>  #endif /* IS_ENABLED(CONFIG_HYPERV) */
>  
>  /*
> @@ -2496,6 +2523,8 @@ static void vmx_hardware_disable(void)
>  	if (cpu_vmxoff())
>  		kvm_spurious_fault();
>  
> +	hv_reset_evmcs();
> +
>  	intel_pt_handle_vmx(0);
>  }
>  
> @@ -8462,27 +8491,8 @@ static void vmx_exit(void)
>  	kvm_exit();
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
> -	if (static_branch_unlikely(&enable_evmcs)) {
> -		int cpu;
> -		struct hv_vp_assist_page *vp_ap;
> -		/*
> -		 * Reset everything to support using non-enlightened VMCS
> -		 * access later (e.g. when we reload the module with
> -		 * enlightened_vmcs=0)
> -		 */
> -		for_each_online_cpu(cpu) {
> -			vp_ap =	hv_get_vp_assist_page(cpu);
> -
> -			if (!vp_ap)
> -				continue;
> -
> -			vp_ap->nested_control.features.directhypercall = 0;
> -			vp_ap->current_nested_vmcs = 0;
> -			vp_ap->enlighten_vmentry = 0;
> -		}
> -
> +	if (static_branch_unlikely(&enable_evmcs))
>  		static_branch_disable(&enable_evmcs);
> -	}
>  #endif
>  	vmx_cleanup_l1d_flush();

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
