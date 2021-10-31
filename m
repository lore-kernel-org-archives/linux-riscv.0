Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275B1C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:30:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B6B60E54
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B6B60E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ASC/4IgSl4sqgXPD7a7oMjP35kVVGX1z8Hl0VfsVZU=; b=CIQI0Xl5xvtdwH
	8OGl2N4TxVuk7fZzlfUILaPp9CftDpr8gl2j9bB+BgfuH+qZmro4YIbINGsfm43wa3lXnAP8ZWct1
	1lJm4AXrvU2h/CnuxxpdkHY/DNEdATpvCKXor7pCJCyr+gDY+G7zlxZlHXPZD3iHb8e8tXQL9rQL7
	TSDqBD1jsWh48BA0ZmpUE2RwP6jhnn0BnMbDwFMFdrA/UvygOR0nw77Wo55rMqTsZxTdgW0vIHmgY
	CE8OnJLi+lJb0OEqAqwyfj0zzzaAV92zHtx7G6tga2QlN8IuyA2xCYGoDcesQEEQiC0I+Fj+FfquI
	TvDd9nhBPLS+POKP4gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhJLm-00Ep9H-Ax; Sun, 31 Oct 2021 22:30:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhJLi-00Ep7j-MS
 for linux-riscv@lists.infradead.org; Sun, 31 Oct 2021 22:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635719445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjQhiLyEbEDnD4Y2r5pZNoATO4AoPvr4JeskA/KrBlI=;
 b=Y2zPxUiePWrYoTYNkf85cU0LvFN3JXlQW9deZq2gban7dWU0w1rIOWlv35DTW1U5IHJ0eJ
 pJqKu4c9sye9V6Aufmv8dcFVzLPC0NTl9GW/WPPrdNaCgZm7FZ+0JNPDdlW9ph2xPd2Dwk
 IaF6QRXofsbs8EUZwUqFuXc09CLyLRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-e9ofhHeAOOizUfULmvajlw-1; Sun, 31 Oct 2021 18:30:42 -0400
X-MC-Unique: e9ofhHeAOOizUfULmvajlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB52D18125C0;
 Sun, 31 Oct 2021 22:30:38 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8110517155;
 Sun, 31 Oct 2021 22:30:08 +0000 (UTC)
Message-ID: <ffce26d0540acb7550be719255689b61210919c1.camel@redhat.com>
Subject: Re: [PATCH v2 42/43] KVM: VMX: Fold fallback path into triggering
 posted IRQ helper
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
Date: Mon, 01 Nov 2021 00:30:07 +0200
In-Reply-To: <20211009021236.4122790-43-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-43-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_153046_850844_EC634148 
X-CRM114-Status: GOOD (  21.66  )
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
> Move the fallback "wake_up" path into the helper to trigger posted
> interrupt helper now that the nested and non-nested paths are identical.

Nit: I think you refer to patch 41 here, but I think that nested and non nested paths were identical
before as well, so this patch could be done without patch 41 as well.


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index f505fee3cf5c..b0d97cf18c34 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -3927,7 +3927,7 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
>  	pt_update_intercept_for_msr(vcpu);
>  }
>  
> -static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
> +static inline void kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
>  						     int pi_vec)
>  {
>  #ifdef CONFIG_SMP
> @@ -3958,10 +3958,15 @@ static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
>  		 */
>  
>  		apic->send_IPI_mask(get_cpu_mask(vcpu->cpu), pi_vec);
> -		return true;
> +		return;
>  	}
>  #endif
> -	return false;
> +	/*
> +	 * The vCPU isn't in the guest; wake the vCPU in case it is blocking,
> +	 * otherwise do nothing as KVM will grab the highest priority pending
> +	 * IRQ via ->sync_pir_to_irr() in vcpu_enter_guest().
> +	 */
> +	kvm_vcpu_wake_up(vcpu);
>  }
>  
>  static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
> @@ -3984,8 +3989,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
>  		 */
>  		kvm_make_request(KVM_REQ_EVENT, vcpu);
>  		/* the PIR and ON have been set by L1. */
> -		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
> -			kvm_vcpu_wake_up(vcpu);
> +		kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
>  		return 0;
>  	}
>  	return -1;
> @@ -4022,9 +4026,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
>  	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
>  	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
>  	 */
> -	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
> -		kvm_vcpu_wake_up(vcpu);
> -
> +	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR);
>  	return 0;
>  }
>  



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
