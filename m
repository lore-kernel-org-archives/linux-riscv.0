Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2499BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1819611B0
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1819611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJcgmDUCB532pGlbV4FO6IByW5TWAnLpJlph/5hG/yw=; b=OjBNgCql7/Ews+inLx3ttAl4Sk
	u7G1eOxmTurD2GuaFQTg9hZYeYVesvZuTNq9QHNv82fK8hpvuPWEQxH2LD0b8udYQUCSphquS0zul
	6L36+jdJFjS7cUh2Vqs//OUZFf45aZK9Zb4KAq4mR29kjOocrc6RjslWjsPC9FIqOKmzalSNzYdgk
	slF1/27kn1BDpSMXHsggBcmPZRXX56LW6MvZ1Plwkr4DsN6VmoYdweDPWWO+VEra9gcgJ+qkf8lWP
	vegKGInsGY3VNKi/7x3+3X7f2xtUCJ+azptGSfaZpyD7F9E+8s1YKACd2MEX202taUgERPJjHZXjx
	gFhhaWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvzG-0077sa-2z; Wed, 22 Sep 2021 06:44:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvw6-00773Y-Ca
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4eS+67AEBYvtqXGAO5BJQzp3vg53OlrVoOKQgtt1lA=;
 b=PexGQ0AbogcR+t14l/dNt0B+5VApAkMh7cFI5bsBcsOqjOC/dm8jewr3Ro5gQbVFAIfTjh
 HMuiG3aeAOU5CdCr85kBHalmAD0MOBfCD6IeGLjnnjYVPlGQBedI41TAKQUywDGhBez8yQ
 8HINdYREhln1yT4r+gilSGEOk5howiI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-TeBZS3xpNhG73jRphcUYwA-1; Wed, 22 Sep 2021 02:40:52 -0400
X-MC-Unique: TeBZS3xpNhG73jRphcUYwA-1
Received: by mail-ed1-f70.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso1783075eds.20
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y4eS+67AEBYvtqXGAO5BJQzp3vg53OlrVoOKQgtt1lA=;
 b=3AN9+b9uEgBuWD0ZoxwB4t10ReEiGWxin0DF/baYciL9/JwN22xpiWbSunhcdLOnXE
 a4XuEcRuzxijY2sDXlDPBoKQHbBEqfKxAFqx3KjdyoFEd87+bnjVa8NPOi48vZZU0jHX
 JA32eKoDRbZumL965POZ7eJCZ38IKmeboLCMww0rG8BOTfqT92xmcub/dtIdvCxEI8SO
 UFjyQhLEXSskaatyYiST4V3rPcYE5Ahp+9KjCYp6iXVzAYUpihT0I+eGrjr9ZaNBnd+Y
 FhNlGaiSfEhEQzdw0Bo60j0RKSa1I/rgtRCHZqDXbEt6RU+uxZJabu4lhw7B3ZclbTLd
 tJow==
X-Gm-Message-State: AOAM533/Iwbu+Iu/8sKFr0ZWBkEq6Gd67VdSNXXsIfznvamMgh31YAX+
 LiX4itYWvIg98ZlFPoHLmuJDJbYySY65iVvwMorz47KAkHHFMw6k+iYZUW9QGEvlkP+gsmIK1uH
 xcAB3ouwnTnCWTOFamGU1U7rDl8As
X-Received: by 2002:a50:d84c:: with SMTP id v12mr39445980edj.203.1632292851052; 
 Tue, 21 Sep 2021 23:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlo4LRB2M8qmmWv+FM3u6P6lvmJINGGsRc/N/kQ7rKED6NNzY0+dunHYjRokMbMUtgN8H1BQ==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr39445930edj.203.1632292850792; 
 Tue, 21 Sep 2021 23:40:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t24sm618083edr.84.2021.09.21.23.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:40:50 -0700 (PDT)
Subject: Re: [PATCH v3 10/16] KVM: x86: Drop current_vcpu for kvm_running_vcpu
 + kvm_arch_vcpu variable
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
 <20210922000533.713300-11-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e5948ba8-3f4d-e749-e645-b9b82f405863@redhat.com>
Date: Wed, 22 Sep 2021 08:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-11-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_234054_589366_D64BCC7B 
X-CRM114-Status: GOOD (  27.33  )
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
> Use the generic kvm_running_vcpu plus a new 'handling_intr_from_guest'
> variable in kvm_arch_vcpu instead of the semi-redundant current_vcpu.
> kvm_before/after_interrupt() must be called while the vCPU is loaded,
> (which protects against preemption), thus kvm_running_vcpu is guaranteed
> to be non-NULL when handling_intr_from_guest is non-zero.
> 
> Switching to kvm_get_running_vcpu() will allows moving KVM's perf
> callbacks to generic code, and the new flag will be used in a future
> patch to more precisely identify the "NMI from guest" case.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  3 +--
>   arch/x86/kvm/pmu.c              |  2 +-
>   arch/x86/kvm/x86.c              | 21 ++++++++++++---------
>   arch/x86/kvm/x86.h              | 10 ++++++----
>   4 files changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 1080166fc0cf..2d86a2dfc775 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -763,6 +763,7 @@ struct kvm_vcpu_arch {
>   	unsigned nmi_pending; /* NMI queued after currently running handler */
>   	bool nmi_injected;    /* Trying to inject an NMI this entry */
>   	bool smi_pending;    /* SMI queued after currently running handler */
> +	u8 handling_intr_from_guest;
>   
>   	struct kvm_mtrr mtrr_state;
>   	u64 pat;
> @@ -1874,8 +1875,6 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu);
>   int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err);
>   void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu);
>   
> -unsigned int kvm_guest_state(void);
> -
>   void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
>   				     u32 size);
>   bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 5b68d4188de0..eef48258e50f 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -87,7 +87,7 @@ static void kvm_perf_overflow_intr(struct perf_event *perf_event,
>   		 * woken up. So we should wake it, but this is impossible from
>   		 * NMI context. Do it from irq work instead.
>   		 */
> -		if (!kvm_guest_state())
> +		if (!kvm_handling_nmi_from_guest(pmc->vcpu))
>   			irq_work_queue(&pmc_to_pmu(pmc)->irq_work);
>   		else
>   			kvm_make_request(KVM_REQ_PMI, pmc->vcpu);
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6cc66466f301..24a6faa07442 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8264,15 +8264,17 @@ static void kvm_timer_init(void)
>   			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
>   }
>   
> -DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
> -EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
> +static inline bool kvm_pmi_in_guest(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu && vcpu->arch.handling_intr_from_guest;
> +}
>   
> -unsigned int kvm_guest_state(void)
> +static unsigned int kvm_guest_state(void)
>   {
> -	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
> +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
>   	unsigned int state;
>   
> -	if (!vcpu)
> +	if (!kvm_pmi_in_guest(vcpu))
>   		return 0;
>   
>   	state = PERF_GUEST_ACTIVE;
> @@ -8284,9 +8286,10 @@ unsigned int kvm_guest_state(void)
>   
>   static unsigned long kvm_guest_get_ip(void)
>   {
> -	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
> +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
>   
> -	if (WARN_ON_ONCE(!vcpu))
> +	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
> +	if (WARN_ON_ONCE(!kvm_pmi_in_guest(vcpu)))
>   		return 0;
>   
>   	return kvm_rip_read(vcpu);
> @@ -8294,10 +8297,10 @@ static unsigned long kvm_guest_get_ip(void)
>   
>   static unsigned int kvm_handle_intel_pt_intr(void)
>   {
> -	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
> +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
>   
>   	/* '0' on failure so that the !PT case can use a RET0 static call. */
> -	if (!vcpu)
> +	if (!kvm_pmi_in_guest(vcpu))
>   		return 0;
>   
>   	kvm_make_request(KVM_REQ_PMI, vcpu);
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index 7d66d63dc55a..a9c107e7c907 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -387,18 +387,20 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
>   	return kvm->arch.cstate_in_guest;
>   }
>   
> -DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
> -
>   static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
>   {
> -	__this_cpu_write(current_vcpu, vcpu);
> +	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, 1);
>   }
>   
>   static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
>   {
> -	__this_cpu_write(current_vcpu, NULL);
> +	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, 0);
>   }
>   
> +static inline bool kvm_handling_nmi_from_guest(struct kvm_vcpu *vcpu)
> +{
> +	return !!vcpu->arch.handling_intr_from_guest;
> +}
>   
>   static inline bool kvm_pat_valid(u64 data)
>   {
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
