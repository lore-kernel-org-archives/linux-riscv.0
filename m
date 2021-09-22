Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5C5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED47E6112F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED47E6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKYD5UdNdA7d8KtceCKA4MiIqQz8LfjzMRF7Z3RDf98=; b=p15SWYbdpnk65SkNuFwkxYzAub
	WokNgRkMS93qozqmkePBV1NxIhNBB85F6u6jdqC5ezwifZ5VoOFYuP4OTDPQeUDUk/tjcdMnxI5s4
	joy5yIY4PyXPyIqcXGypba92hNqIJ2q2tTr9rlZzBEbYEPYnu6U/dO/8sLp5Ca08gDzIkaYLYOSM6
	WcVPaK7dmTB/Q84ddArr8JGRWspwKDv+MdCLGUsMmytn8s+NyjWbfMNy2FoXu9c9sgu7D+G1+r6G0
	qvJMlUpEtGQKnxzqG3oX5zPsueqBPz0DT0K1QtBQSBjLGfeOpBVR1tSmjwGdY80lKN9SUXo+ZY7l2
	1znSbtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSw2F-0078nB-Oz; Wed, 22 Sep 2021 06:47:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvww-0077GG-2e
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLkDWA7zis/qBBg4IjuyViLi2gFI3fX/kzAaOlA6siY=;
 b=SBatF0FhE7qH3IrRWA/2sT5fvGVmBPKG+UK7ymZD0S35Ui8rMFwnk/+FbT8i5uc0WY+uS9
 aMThoczg7jGDxbHayNZ2OM8cEXztYyBUsSPYB5bb3HQjkEkDxGt7YWMa6fVo+A8lIW3l4w
 EkN766d0UTw1MXUIFNHjv7c/UBhSjDg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-fMzGGs3DM1q_d1cgDQTWOQ-1; Wed, 22 Sep 2021 02:41:44 -0400
X-MC-Unique: fMzGGs3DM1q_d1cgDQTWOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r23-20020a50d697000000b003d824845066so1844882edi.8
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kLkDWA7zis/qBBg4IjuyViLi2gFI3fX/kzAaOlA6siY=;
 b=m9uOFI5Zp8iLO9Un6jcLhvVFpHOSJEixx1sE8lb3zmKDMFfi+clERO7oV/FdnUYz/H
 aU25s5DU2Wetv80imzyKCSKeCD7GhDk5dwf5N8jwENSBHrpY0dNZRqX77dNc2jpT0Kz7
 itR1ohQ/g6mSK3nl0udgkxn4jZIbPAcW8U2ghB5yGMtECk3230shknjW1pMbQKwAy3Tt
 3fHFiJJqn+MjLRsIxlwE0ESnOz98rXJP79s56XTCrVQ2McyaGJBVLIVdtjm9FBXe5FCj
 5bb1RegOMKlBA8oA3DswJIcPVgzMzoA8FK9I6fFgXUfgJjSfXjlQlSpAi2o0We+7nKhV
 pL9g==
X-Gm-Message-State: AOAM530wN0ky1HMO4WrK3FnlKujk40JnppM0w9HK62pF7hfDggdSE9hS
 4W3cO1kMai6kCgLfL+IE5Y+l1vbIFQ/wpNaddu5RRjPr2dcYo68iv7EpDZA9aCxlMSrXFwuA/kF
 CujyTv+1LbqWRWY/zhv0c1ilKLR2S
X-Received: by 2002:a05:6402:5186:: with SMTP id
 q6mr40893917edd.64.1632292902402; 
 Tue, 21 Sep 2021 23:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP+MY9+n/one3D2apviNbkQobxFZdru25IJ6syxfQ+H3Moyz3xvNvSjJ+iSQi50cWPcONDFw==
X-Received: by 2002:a05:6402:5186:: with SMTP id
 q6mr40893882edd.64.1632292902156; 
 Tue, 21 Sep 2021 23:41:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id kt19sm557582ejb.26.2021.09.21.23.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:41:41 -0700 (PDT)
Subject: Re: [PATCH v3 12/16] KVM: Move x86's perf guest info callbacks to
 generic KVM
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-13-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50cda5e5-be7e-00f3-886b-21b0fdfd1236@redhat.com>
Date: Wed, 22 Sep 2021 08:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-13-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_234146_316575_DCC2B191 
X-CRM114-Status: GOOD (  28.57  )
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

On 22/09/21 02:05, Sean Christopherson wrote:
> Move x86's perf guest callbacks into common KVM, as they are semantically
> identical to arm64's callbacks (the only other such KVM callbacks).
> arm64 will convert to the common versions in a future patch.
> 
> Implement the necessary arm64 arch hooks now to avoid having to provide
> stubs or a temporary #define (from x86) to avoid arm64 compilation errors
> when CONFIG_GUEST_PERF_EVENTS=y.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  8 +++++
>   arch/arm64/kvm/arm.c              |  5 +++
>   arch/x86/include/asm/kvm_host.h   |  3 ++
>   arch/x86/kvm/x86.c                | 53 +++++++------------------------
>   include/linux/kvm_host.h          | 10 ++++++
>   virt/kvm/kvm_main.c               | 44 +++++++++++++++++++++++++
>   6 files changed, 81 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ed940aec89e0..828b6eaa2c56 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -673,6 +673,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
>   void kvm_perf_init(void);
>   void kvm_perf_teardown(void);
>   
> +#ifdef CONFIG_GUEST_PERF_EVENTS
> +static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
> +{
> +	/* Any callback while a vCPU is loaded is considered to be in guest. */
> +	return !!vcpu;
> +}
> +#endif
> +
>   long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
>   gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
>   void kvm_update_stolen_time(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index e9a2b8f27792..2b542fdc237e 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -500,6 +500,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
>   	return vcpu_mode_priv(vcpu);
>   }
>   
> +unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
> +{
> +	return *vcpu_pc(vcpu);
> +}
> +
>   /* Just ensure a guest exit from a particular CPU */
>   static void exit_vm_noop(void *info)
>   {
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 2d86a2dfc775..6efe4e03a6d2 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1543,6 +1543,9 @@ static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
>   		return -ENOTSUPP;
>   }
>   
> +#define kvm_arch_pmi_in_guest(vcpu) \
> +	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
> +
>   int kvm_mmu_module_init(void);
>   void kvm_mmu_module_exit(void);
>   
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 412646b973bb..1bea616402e6 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8264,43 +8264,12 @@ static void kvm_timer_init(void)
>   			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
>   }
>   
> -static inline bool kvm_pmi_in_guest(struct kvm_vcpu *vcpu)
> -{
> -	return vcpu && vcpu->arch.handling_intr_from_guest;
> -}
> -
> -static unsigned int kvm_guest_state(void)
> -{
> -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> -	unsigned int state;
> -
> -	if (!kvm_pmi_in_guest(vcpu))
> -		return 0;
> -
> -	state = PERF_GUEST_ACTIVE;
> -	if (static_call(kvm_x86_get_cpl)(vcpu))
> -		state |= PERF_GUEST_USER;
> -
> -	return state;
> -}
> -
> -static unsigned long kvm_guest_get_ip(void)
> -{
> -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> -
> -	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
> -	if (WARN_ON_ONCE(!kvm_pmi_in_guest(vcpu)))
> -		return 0;
> -
> -	return kvm_rip_read(vcpu);
> -}
> -
>   static unsigned int kvm_handle_intel_pt_intr(void)
>   {
>   	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
>   
>   	/* '0' on failure so that the !PT case can use a RET0 static call. */
> -	if (!kvm_pmi_in_guest(vcpu))
> +	if (!kvm_arch_pmi_in_guest(vcpu))
>   		return 0;
>   
>   	kvm_make_request(KVM_REQ_PMI, vcpu);
> @@ -8309,12 +8278,6 @@ static unsigned int kvm_handle_intel_pt_intr(void)
>   	return 1;
>   }
>   
> -static struct perf_guest_info_callbacks kvm_guest_cbs = {
> -	.state			= kvm_guest_state,
> -	.get_ip			= kvm_guest_get_ip,
> -	.handle_intel_pt_intr	= NULL,
> -};
> -
>   #ifdef CONFIG_X86_64
>   static void pvclock_gtod_update_fn(struct work_struct *work)
>   {
> @@ -11068,9 +11031,11 @@ int kvm_arch_hardware_setup(void *opaque)
>   	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
>   	kvm_ops_static_call_update();
>   
> +	/* Temporary ugliness. */
>   	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
> -		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
> -	perf_register_guest_info_callbacks(&kvm_guest_cbs);
> +		kvm_register_perf_callbacks(kvm_handle_intel_pt_intr);
> +	else
> +		kvm_register_perf_callbacks(NULL);
>   
>   	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
>   		supported_xss = 0;
> @@ -11099,8 +11064,7 @@ int kvm_arch_hardware_setup(void *opaque)
>   
>   void kvm_arch_hardware_unsetup(void)
>   {
> -	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> -	kvm_guest_cbs.handle_intel_pt_intr = NULL;
> +	kvm_unregister_perf_callbacks();
>   
>   	static_call(kvm_x86_hardware_unsetup)();
>   }
> @@ -11727,6 +11691,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
>   	return vcpu->arch.preempted_in_kernel;
>   }
>   
> +unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_rip_read(vcpu);
> +}
> +
>   int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   {
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e4d712e9f760..b9255a6439f2 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1163,6 +1163,16 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
>   }
>   #endif
>   
> +#ifdef CONFIG_GUEST_PERF_EVENTS
> +unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
> +
> +void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
> +void kvm_unregister_perf_callbacks(void);
> +#else
> +static inline void kvm_register_perf_callbacks(void *ign) {}
> +static inline void kvm_unregister_perf_callbacks(void) {}
> +#endif /* CONFIG_GUEST_PERF_EVENTS */
> +
>   int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
>   void kvm_arch_destroy_vm(struct kvm *kvm);
>   void kvm_arch_sync_events(struct kvm *kvm);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3e67c93ca403..179fb110a00f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5460,6 +5460,50 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
>           return &kvm_running_vcpu;
>   }
>   
> +#ifdef CONFIG_GUEST_PERF_EVENTS
> +static unsigned int kvm_guest_state(void)
> +{
> +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> +	unsigned int state;
> +
> +	if (!kvm_arch_pmi_in_guest(vcpu))
> +		return 0;
> +
> +	state = PERF_GUEST_ACTIVE;
> +	if (!kvm_arch_vcpu_in_kernel(vcpu))
> +		state |= PERF_GUEST_USER;
> +
> +	return state;
> +}
> +
> +static unsigned long kvm_guest_get_ip(void)
> +{
> +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> +
> +	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
> +	if (WARN_ON_ONCE(!kvm_arch_pmi_in_guest(vcpu)))
> +		return 0;
> +
> +	return kvm_arch_vcpu_get_ip(vcpu);
> +}
> +
> +static struct perf_guest_info_callbacks kvm_guest_cbs = {
> +	.state			= kvm_guest_state,
> +	.get_ip			= kvm_guest_get_ip,
> +	.handle_intel_pt_intr	= NULL,
> +};
> +
> +void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
> +{
> +	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
> +	perf_register_guest_info_callbacks(&kvm_guest_cbs);
> +}
> +void kvm_unregister_perf_callbacks(void)
> +{
> +	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> +}
> +#endif
> +
>   struct kvm_cpu_compat_check {
>   	void *opaque;
>   	int *ret;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
