Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE24FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C626058D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85C626058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8nU58b/bdk1X+buDHbA8iK9E4U1Cs0ebdgWIL6Za4I=; b=4g6xfj6QLNewlY
	ftW4bH1jn6sW0Y1WmkCUh+YE+k5cuGV9MHVujEamlgiReCDaEo0re03uHe9kqsCcOM264G4S/kLhw
	81G/NFILzYj3Q/fo/OqN//q28j5jll0DvCWWFVa4lyNmBeY55fqBvQGfPFhy1XkaoyrY8pfpPGDIA
	GCk4HDqlCB7A5eXcorX6XvZHe9gD+tUg0H2CAhuPZPP2SY+8PqWBZBaS42IfmFxqLS0VFpR7OgKIl
	08gYTL3tTm7J9GHMxCFiItDtVCY5cr7K6d8oOCzBfCTX0gGXEtYPD24kmVn9wAyKPMErPUHXoQtGK
	OwRDdRSRDj1mcTfYGsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg81d-008Xfc-3V; Thu, 28 Oct 2021 16:13:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg81Z-008Xch-14
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635437584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqVw0Z8vi7JjvCVtjxAexVsSznKzCGLBzzaPnc6KX/k=;
 b=b5wX3zYsQHqT3a7Utpjtqf1A/oDAn48wO2AGQombk3ibWzgGRQVN8806xz9FTtX0+qNw3R
 gW4acKO6ckewg799ThxjMuQYbxf7iv/jA4sGgmjBgpdRrQ+D5Sh3qrSUyp0WnelDKLWDkE
 pci+/ucyR/8tFonM17/pxRe9JnxHITU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-R1OcEdtCNRy5fjOQqmfJWg-1; Thu, 28 Oct 2021 12:13:00 -0400
X-MC-Unique: R1OcEdtCNRy5fjOQqmfJWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594BC112A0A3;
 Thu, 28 Oct 2021 16:12:14 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBDF84180;
 Thu, 28 Oct 2021 16:12:05 +0000 (UTC)
Message-ID: <b2ba4c4e6a9083f3fa0b9af4504f9f54e72ca24c.camel@redhat.com>
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
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
Date: Thu, 28 Oct 2021 19:12:04 +0300
In-Reply-To: <20211009021236.4122790-36-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091305_223876_D125084D 
X-CRM114-Status: GOOD (  25.77  )
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
> Signal the AVIC doorbell iff the vCPU is running in the guest.  If the vCPU
> is not IN_GUEST_MODE, it's guaranteed to pick up any pending IRQs on the
> next VMRUN, which unconditionally processes the vIRR.
> 
> Add comments to document the logic.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 208c5c71e827..cbf02e7e20d0 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -674,7 +674,12 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>  	kvm_lapic_set_irr(vec, vcpu->arch.apic);
>  	smp_mb__after_atomic();
>  
> -	if (avic_vcpu_is_running(vcpu)) {
> +	/*
> +	 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
> +	 * is in the guest.  If the vCPU is not in the guest, hardware will
> +	 * automatically process AVIC interrupts at VMRUN.
> +	 */
> +	if (vcpu->mode == IN_GUEST_MODE) {
>  		int cpu = READ_ONCE(vcpu->cpu);
>  
>  		/*
> @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>  		if (cpu != get_cpu())
>  			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
>  		put_cpu();
> -	} else
> +	} else {
> +		/*
> +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> +		 * pending IRQ when checking if the vCPU has a wake event.
> +		 */
>  		kvm_vcpu_wake_up(vcpu);
> +	}
>  
>  	return 0;
>  }

It makes sense indeed to avoid ringing the doorbell when the vCPU is not in the guest mode.

I do wonder if we want to call kvm_vcpu_wake_up always otherwise, as the vCPU might
be just outside of the guest mode and not scheduled out. I don't know how expensive
is kvm_vcpu_wake_up in this case.

Before this patch, the avic_vcpu_is_running would only be false when the vCPU is scheduled out
(e.g when vcpu_put was done on it)

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
