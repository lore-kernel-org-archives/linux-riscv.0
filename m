Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB0BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2179F610C8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2179F610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K52/QEU7RxJB0dVZTioCMNaZFcBtTMbJsw+99RxfSVI=; b=oa5/hBkwutaB1E
	vd2fVficnL8DHvmaL8sUk+n0D7UagjIeae2rAecGVpGqk2KG2ZoInbdwnqS45OAVf8RVCvTwFT4VV
	X6tysqTe9MfyaXKbDRGY0fhfqb9hctifB9lNku6MD+vOQxSg9k1xFrKg928p6ZaNeM0VmBuwHoZaL
	5nU/vyotHgn2qonBkJMKb8f/frcd3UagusWy894ohnppg3HTQV0X5ljxtdYqxz1ao7Lb1/0Tc45hC
	ABHjhdWA9ZrWFbS5AcotA+VGKsFLcd24V+KB1nYpV40Stmjy9AdVP0PzSFfuZ4+Mtc6vgHKdpbaqn
	u8iG4MRORZxgNfRcsaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7cs-008SUT-9p; Thu, 28 Oct 2021 15:47:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7cQ-008SLS-4v
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbmNsSUrvGPtUZE+MWwRLOXXOyUhB+AbdYKB6eOYzgI=;
 b=Y3WxijuaKfiaIu0APqEtTdSU6Yf4oqezv+Qd10pAJZWjc0/D1NijsBlbcYovSjjqAF9Dak
 3OgygD6QBHDA71IN/3kYI0/n/Dn/CW9Ni4KHxLoSWZzFHSiBw/bmSK9HTaymgQ4nphJGTm
 DeP2dzfjhd4xLrxDQK88DUVsFLSbUf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-qmR5zb0kMGqaJpP-fhah4A-1; Thu, 28 Oct 2021 11:47:01 -0400
X-MC-Unique: qmR5zb0kMGqaJpP-fhah4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00705802682;
 Thu, 28 Oct 2021 15:46:58 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 193772637D;
 Thu, 28 Oct 2021 15:46:48 +0000 (UTC)
Message-ID: <412931e082b33403c8778cae7376325871ab0d54.camel@redhat.com>
Subject: Re: [PATCH v2 34/43] KVM: x86: Remove defunct pre_block/post_block
 kvm_x86_ops hooks
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
Date: Thu, 28 Oct 2021 18:46:11 +0300
In-Reply-To: <20211009021236.4122790-35-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-35-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_084706_403222_066DE2D2 
X-CRM114-Status: GOOD (  23.90  )
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
> Drop kvm_x86_ops' pre/post_block() now that all implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  2 --
>  arch/x86/include/asm/kvm_host.h    | 12 ------------
>  arch/x86/kvm/vmx/vmx.c             | 13 -------------
>  arch/x86/kvm/x86.c                 |  6 +-----
>  4 files changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index cefe1d81e2e8..c2b007171abd 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -96,8 +96,6 @@ KVM_X86_OP(handle_exit_irqoff)
>  KVM_X86_OP_NULL(request_immediate_exit)
>  KVM_X86_OP(sched_in)
>  KVM_X86_OP_NULL(update_cpu_dirty_logging)
> -KVM_X86_OP_NULL(pre_block)
> -KVM_X86_OP_NULL(post_block)
>  KVM_X86_OP_NULL(vcpu_blocking)
>  KVM_X86_OP_NULL(vcpu_unblocking)
>  KVM_X86_OP_NULL(update_pi_irte)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 328103a520d3..76a8dddc1a48 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1445,18 +1445,6 @@ struct kvm_x86_ops {
>  	const struct kvm_pmu_ops *pmu_ops;
>  	const struct kvm_x86_nested_ops *nested_ops;
>  
> -	/*
> -	 * Architecture specific hooks for vCPU blocking due to
> -	 * HLT instruction.
> -	 * Returns for .pre_block():
> -	 *    - 0 means continue to block the vCPU.
> -	 *    - 1 means we cannot block the vCPU since some event
> -	 *        happens during this period, such as, 'ON' bit in
> -	 *        posted-interrupts descriptor is set.
> -	 */
> -	int (*pre_block)(struct kvm_vcpu *vcpu);
> -	void (*post_block)(struct kvm_vcpu *vcpu);
> -
>  	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
>  	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index a24f19874716..13e732a818f3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7462,16 +7462,6 @@ void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
>  		secondary_exec_controls_clearbit(vmx, SECONDARY_EXEC_ENABLE_PML);
>  }
>  
> -static int vmx_pre_block(struct kvm_vcpu *vcpu)
> -{
> -	return 0;
> -}
> -
> -static void vmx_post_block(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
>  static void vmx_setup_mce(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu->arch.mcg_cap & MCG_LMCE_P)
> @@ -7665,9 +7655,6 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
>  	.cpu_dirty_log_size = PML_ENTITY_NUM,
>  	.update_cpu_dirty_logging = vmx_update_cpu_dirty_logging,
>  
> -	.pre_block = vmx_pre_block,
> -	.post_block = vmx_post_block,
> -
>  	.pmu_ops = &intel_pmu_ops,
>  	.nested_ops = &vmx_nested_ops,
>  
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 909e932a7ae7..9643f23c28c7 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9898,8 +9898,7 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  {
>  	bool hv_timer;
>  
> -	if (!kvm_arch_vcpu_runnable(vcpu) &&
> -	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
> +	if (!kvm_arch_vcpu_runnable(vcpu)) {
>  		/*
>  		 * Switch to the software timer before halt-polling/blocking as
>  		 * the guest's timer may be a break event for the vCPU, and the
> @@ -9921,9 +9920,6 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  		if (hv_timer)
>  			kvm_lapic_switch_to_hv_timer(vcpu);
>  
> -		if (kvm_x86_ops.post_block)
> -			static_call(kvm_x86_post_block)(vcpu);
> -
>  		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
>  			return 1;
>  	}

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
