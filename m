Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F0E60D42
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88F0E60D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxvcg+THGV3+ivqGa3pR+Ra6znyQUMEa+jwbUgzksic=; b=N+H0YpanKrTkI+
	swTrJ9G8dbsxc5AxaiO6uPuTRA1Gl7VkfLR1W5YwLpfKTjhDLwMoChf0kOHQ6Df4Yb6sDjg/8PZCh
	IBWAbRJVxk914PBYjBsiYij+HmP55CHVGZ0J8EK7F2z9TCD5YQNy5DUfIS/pODPLBbx3yLU6cBIoj
	wiQv6LUWTUEJ3w4u0G2/2TwuzHSnBZjQXeVNy9qjVa/r2KbjZJDZQlJFr9+DQ/TUJXDrWKfOC0f4g
	S77y188oyxS3wWQO1g/4UGHucuZzIopK8/kOVwZSEa5urqkYNGDA/3Xy/QFCwRuSQ6Rw6x8E9Tivp
	IxEPqrI5M1m5LqfCgEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjlR-0055cV-Gf; Wed, 27 Oct 2021 14:18:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjlO-0055bX-Ov
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635344325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBSPA7SFj6S0l15DFmmTz29aiCenNhw8/4n7QaHyqGY=;
 b=To2KSngmn7pEh/Dd1ROXPOGoJmutXBkQY8XENqUaKaWGzlkNjaLGg18tNq1mE+0BmbfuPC
 vKby6vmRltYK/7S74m59zi8ij6jBmsfCmkfY1OiO6ejrbXx+gsuoPMsrXADjWdws5tw4Np
 K+vpKCS2htEKApAjqNa70P9H+kWA7nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-EGGnys3PO8eSwUAtseuBvQ-1; Wed, 27 Oct 2021 10:18:44 -0400
X-MC-Unique: EGGnys3PO8eSwUAtseuBvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F7487320A;
 Wed, 27 Oct 2021 14:18:40 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 714835C1B4;
 Wed, 27 Oct 2021 14:18:31 +0000 (UTC)
Message-ID: <e04b75455437da29fb009668e60b5be1732a183b.camel@redhat.com>
Subject: Re: [PATCH v2 12/43] KVM: x86: Tweak halt emulation helper names to
 free up kvm_vcpu_halt()
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
Date: Wed, 27 Oct 2021 17:18:30 +0300
In-Reply-To: <363479dd55760979da208cacf015a6f7fe2afd69.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-13-seanjc@google.com>
 <363479dd55760979da208cacf015a6f7fe2afd69.camel@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_071846_926533_8D42593C 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, 2021-10-27 at 17:10 +0300, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Rename a variety of HLT-related helpers to free up the function name
> > "kvm_vcpu_halt" for future use in generic KVM code, e.g. to differentiate
> > between "block" and "halt".
> > 
> > No functional change intended.
> > 
> > Reviewed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h |  2 +-
> >  arch/x86/kvm/vmx/nested.c       |  2 +-
> >  arch/x86/kvm/vmx/vmx.c          |  4 ++--
> >  arch/x86/kvm/x86.c              | 13 +++++++------
> >  4 files changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 7aafc27ce7a9..328103a520d3 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1689,7 +1689,7 @@ int kvm_emulate_monitor(struct kvm_vcpu *vcpu);
> >  int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in);
> >  int kvm_emulate_cpuid(struct kvm_vcpu *vcpu);
> >  int kvm_emulate_halt(struct kvm_vcpu *vcpu);
> > -int kvm_vcpu_halt(struct kvm_vcpu *vcpu);
> > +int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu);
> >  int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu);
> >  int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu);
> >  
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index af1bbb73430a..d0237a441feb 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3619,7 +3619,7 @@ static int nested_vmx_run(struct kvm_vcpu *vcpu, bool launch)
> >  		    !(nested_cpu_has(vmcs12, CPU_BASED_INTR_WINDOW_EXITING) &&
> >  		      (vmcs12->guest_rflags & X86_EFLAGS_IF))) {
> >  			vmx->nested.nested_run_pending = 0;
> > -			return kvm_vcpu_halt(vcpu);
> > +			return kvm_emulate_halt_noskip(vcpu);
> >  		}
> >  		break;
> >  	case GUEST_ACTIVITY_WAIT_SIPI:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 1c8b2b6e7ed9..5517893f12fc 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -4741,7 +4741,7 @@ static int handle_rmode_exception(struct kvm_vcpu *vcpu,
> >  		if (kvm_emulate_instruction(vcpu, 0)) {
> >  			if (vcpu->arch.halt_request) {
> >  				vcpu->arch.halt_request = 0;
> > -				return kvm_vcpu_halt(vcpu);
> > +				return kvm_emulate_halt_noskip(vcpu);
> 
> Could you elaborate on why you choose _noskip suffix? 
>  
> As far as I see, kvm_vcpu_halt just calls __kvm_vcpu_halt with new VCPU run state/exit reason,
> which is used only when local apic is not in the kernel (which is these days not that
> supported configuration).
> 
> Other user of __kvm_vcpu_halt is something SEV related.
>  
> Best regards,
> 	Maxim Levitsky
> 
> 
> >  			}
> >  			return 1;
> >  		}
> > @@ -5415,7 +5415,7 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
> >  
> >  		if (vcpu->arch.halt_request) {
> >  			vcpu->arch.halt_request = 0;
> > -			return kvm_vcpu_halt(vcpu);
> > +			return kvm_emulate_halt_noskip(vcpu);
> >  		}
> >  
> >  		/*
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 4a52a08707de..9c23ae1d483d 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -8649,7 +8649,7 @@ void kvm_arch_exit(void)
> >  #endif
> >  }
> >  
> > -static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
> > +static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
> >  {
> >  	++vcpu->stat.halt_exits;
> >  	if (lapic_in_kernel(vcpu)) {
> > @@ -8661,11 +8661,11 @@ static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
> >  	}
> >  }
> >  
> > -int kvm_vcpu_halt(struct kvm_vcpu *vcpu)
> > +int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
> >  {
> > -	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
> > +	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
> >  }
> > -EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
> > +EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
> >  
> >  int kvm_emulate_halt(struct kvm_vcpu *vcpu)
> >  {
> > @@ -8674,7 +8674,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
> >  	 * TODO: we might be squashing a GUESTDBG_SINGLESTEP-triggered
> >  	 * KVM_EXIT_DEBUG here.
> >  	 */
> > -	return kvm_vcpu_halt(vcpu) && ret;
> > +	return kvm_emulate_halt_noskip(vcpu) && ret;
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_emulate_halt);
> >  
> > @@ -8682,7 +8682,8 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
> >  {
> >  	int ret = kvm_skip_emulated_instruction(vcpu);
> >  
> > -	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD, KVM_EXIT_AP_RESET_HOLD) && ret;
> > +	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
> > +					KVM_EXIT_AP_RESET_HOLD) && ret;
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
> >  

Also while at it, why not to use say '__kvm_emulate_hlt' ('hlt' instead of 'halt') to 
put emphasis on the fact that we are emulating a cpu instruction?

Best regards,
	Maxim Levitsky
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
