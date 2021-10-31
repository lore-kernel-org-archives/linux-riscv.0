Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C6EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 16:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102D160F22
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 16:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 102D160F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AT6mfnXNAcEyu9UXWPOv0iU6nU5pNK6yf0BkfcWhsTo=; b=mLygl65ASJ4API
	CKQVRlBwqA7E3BldZwNOQsuU/MPlKkNNfjhN/QqnIPAY/uP2LnsHI0EbwTlscLo+QtLwQNkacDvXo
	307aEfHna7ltYz72ngaRwbkrwFkLgQlHlnv5gQ4ohoIeqJICdqiHKLmVLHLAM3Qpv9UOSSksycUti
	LfE8TBcBNk2UicnCt6pfja4Kamhvu/5fPozVKliEArgWlyRRCcZM/e+Y2GoOqRmfCvLCxKsws2MO/
	ca6ZORwKPG5iRYM+Ex0na9mhkTAvTDtp72An7xI5pwTMhuy8j2fEui1C4g/BWKVeYjUlRPL77x8Rh
	M2PJTf0YJmQodxZ8306w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhDp4-00EMgn-9K; Sun, 31 Oct 2021 16:36:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhDoq-00EMco-FC
 for linux-riscv@lists.infradead.org; Sun, 31 Oct 2021 16:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635698187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVq22xC51kdx10I7Z3TCBhCOu+wtFrVAqIwjXEZRDFw=;
 b=FqFC/2mvLIk5M8j4sToOuQuCOzUi/KBFbfwz6+Is79ey9TLaodSnhrwL2px0vOG5iEVwHW
 iXlRRju94gurWe1mJB4+2jELjSHKCkICHEEr3Ae8wsYJSVRmNTzIUWJUVvNbEQYhVXQ4lU
 lAYX9TM8KzjhIshrxIvHr6OMxuQmNxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-bwvTj_fDMiy7vbcMWXUZfg-1; Sun, 31 Oct 2021 12:36:22 -0400
X-MC-Unique: bwvTj_fDMiy7vbcMWXUZfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F191808302;
 Sun, 31 Oct 2021 16:36:18 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EEC160BF4;
 Sun, 31 Oct 2021 16:35:58 +0000 (UTC)
Message-ID: <9addad02d861e20fc4e8a3c3efa983502ae2248c.camel@redhat.com>
Subject: Re: [PATCH v2 38/43] KVM: Drop defunct kvm_arch_vcpu_(un)blocking()
 hooks
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, Anup
 Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng
 Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,  Joerg
 Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,  linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Date: Sun, 31 Oct 2021 18:35:57 +0200
In-Reply-To: <20211009021236.4122790-39-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-39-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_093628_625561_CE19DD8B 
X-CRM114-Status: GOOD (  18.42  )
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

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Remove kvm_arch_vcpu_(un)blocking() now that all implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/arm.c                | 10 ----------
>  arch/mips/include/asm/kvm_host.h    |  2 --
>  arch/powerpc/include/asm/kvm_host.h |  2 --
>  arch/s390/include/asm/kvm_host.h    |  2 --
>  arch/x86/include/asm/kvm-x86-ops.h  |  2 --
>  arch/x86/include/asm/kvm_host.h     | 13 -------------
>  include/linux/kvm_host.h            |  2 --
>  virt/kvm/kvm_main.c                 |  4 ----
>  8 files changed, 37 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9ff0e85a9f16..444d6f5a980a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -357,16 +357,6 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  	return kvm_timer_is_pending(vcpu);
>  }
>  
> -void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
> -void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  {
>  	struct kvm_s2_mmu *mmu;
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 72b90d45a46e..28110f71089b 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -895,8 +895,6 @@ static inline void kvm_arch_free_memslot(struct kvm *kvm,
>  					 struct kvm_memory_slot *slot) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
>  int kvm_arch_flush_remote_tlb(struct kvm *kvm);
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 4a195c161592..0dfee6866541 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -863,7 +863,5 @@ static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>  static inline void kvm_arch_exit(void) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index a22c9266ea05..25ed4ec66f4a 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1007,7 +1007,5 @@ static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>  		struct kvm_memory_slot *slot) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #endif
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index c2b007171abd..f2c38acdcad6 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -96,8 +96,6 @@ KVM_X86_OP(handle_exit_irqoff)
>  KVM_X86_OP_NULL(request_immediate_exit)
>  KVM_X86_OP(sched_in)
>  KVM_X86_OP_NULL(update_cpu_dirty_logging)
> -KVM_X86_OP_NULL(vcpu_blocking)
> -KVM_X86_OP_NULL(vcpu_unblocking)
>  KVM_X86_OP_NULL(update_pi_irte)
>  KVM_X86_OP_NULL(start_assignment)
>  KVM_X86_OP_NULL(apicv_post_state_restore)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 76a8dddc1a48..bebd42926321 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1445,9 +1445,6 @@ struct kvm_x86_ops {
>  	const struct kvm_pmu_ops *pmu_ops;
>  	const struct kvm_x86_nested_ops *nested_ops;
>  
> -	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
> -	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
> -
>  	int (*update_pi_irte)(struct kvm *kvm, unsigned int host_irq,
>  			      uint32_t guest_irq, bool set);
>  	void (*start_assignment)(struct kvm *kvm);
> @@ -1904,16 +1901,6 @@ static inline bool kvm_irq_is_postable(struct kvm_lapic_irq *irq)
>  		irq->delivery_mode == APIC_DM_LOWEST);
>  }
>  
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> -{
> -	static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
> -}
> -
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
> -{
> -	static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
> -}
> -
>  static inline int kvm_cpu_get_apicid(int mps_cpu)
>  {
>  #ifdef CONFIG_X86_LOCAL_APIC
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c5961a361c73..6a84b020daa6 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -966,8 +966,6 @@ void kvm_sigset_deactivate(struct kvm_vcpu *vcpu);
>  
>  void kvm_vcpu_halt(struct kvm_vcpu *vcpu);
>  bool kvm_vcpu_block(struct kvm_vcpu *vcpu);
> -void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu);
> -void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
>  bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
>  void kvm_vcpu_kick(struct kvm_vcpu *vcpu);
>  int kvm_vcpu_yield_to(struct kvm_vcpu *target);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index c1850b60f38b..96de905e26e4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3210,8 +3210,6 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  
>  	vcpu->stat.generic.blocking = 1;
>  
> -	kvm_arch_vcpu_blocking(vcpu);
> -
>  	prepare_to_rcuwait(wait);
>  	for (;;) {
>  		set_current_state(TASK_INTERRUPTIBLE);
> @@ -3224,8 +3222,6 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	}
>  	finish_rcuwait(wait);
>  
> -	kvm_arch_vcpu_unblocking(vcpu);
> -
>  	vcpu->stat.generic.blocking = 0;
>  
>  	return waited;

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
