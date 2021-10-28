Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D50BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:06:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498C4610CF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 498C4610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3jpPtXHXeGSutxLRMpoCQ6J0ipLaF4p3mMoxQ9qQ0Y=; b=wTCv5FyALQua+r
	6YEd1uYPen5U8ISzbN0et5oMcd9YPa+Z5plGg3vpgkmym6+0H67ejj5JrR/JSB6OamnlXU881EhOX
	EVmWmrVEEMUsetfMI8Id6YACw+JdF4Yj0orufVL4vflJXzfb7tJ/VeG7+AU0S6mKXZAs7Reou1UPD
	JYXTPg+hhUpMdTC5OWST6Mbk3WXZ9cusB13/oZi5rlDv1P/W151E1f5KGs7KkmC5wS+/Z2XgNqHmX
	teJSqDJd+itPr7u4L27kTQ3ODgT4ukPEFD2GQP/yp+68ChF+ucsvmXYkpbO2tv0VUWP8crUu1dYws
	VxDyXc1FSQ4qIeHBAMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg8rc-008flE-Pg; Thu, 28 Oct 2021 17:06:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg8rZ-008fkC-GW
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 17:06:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id r28so7091262pga.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5FMOUmei9Yd20y1XWjfcdbxiSsU6/CKiTZiNSpEJsLk=;
 b=goNQkkMJXpMPhPYFdVULDytrjQcoVu2lfwn3WuXA8ZOWfVU/JBHyZvLlEiPgcloYqE
 Jhz0+bgiXe/YWIVtHqD9uWlRDISXdiszKG8C5B2x8qq+87xgln6oUfJqk8Pl2O4vpYUv
 aElTLuihNiGwbXbMGeTzi+TT9xRVMesWVtGd6b3dr0Gyg3Ld7XrPFh8WgKV/HqWCqye6
 IN651B4/j+icyywyqYjZAUlmNgSWr91NVE2zYdE4jrE7wi4kHo7ce24TfGAFy44uEg6R
 fWLCdqwL2dJ2VgUcEM+jrTRcLtG9T2m9NM5+w4j3OENqjzp/2Dbrk6u9v0EBK753yfNN
 PvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5FMOUmei9Yd20y1XWjfcdbxiSsU6/CKiTZiNSpEJsLk=;
 b=EbCn4PHqOtRuUiV3yJEKDx8gFRCHtmw9uNbTCZzFFWMoOGbIJTJb2cfKMEElfPTp2P
 BI75V50PKIHCvQKn/PB1Iq2uu9f/f7Z8fmUqHLQ5pfIf/HsCyRBREEN/I/ipbJPTH5zC
 nTwaz8Ht7SI4CAJMIuSA5jUZY35/8th6PkUEwxMDBggJBKVtLfUXpQBaAtVy5qxNKsXM
 eYGN9ZGiKZUbBCR2CoeaWUjo30cVcfUnDRkApRuYWRVlGRyLqYVrDclBqfeBEYM5SB0L
 Q4cfSR2aIV/UL5PKQf6wwe5X7XDKmMyiLV4FQ26wSErNnqkUglHRrfGfMVU+GE3z0kgS
 mH8Q==
X-Gm-Message-State: AOAM532jUjFlkdPG+mV6QFmUwsN62odMr7AkGOzmp6swsA14q9Om6Zup
 JUqTR+e9vD0Z1O9sxZwiXyWV2g==
X-Google-Smtp-Source: ABdhPJyOg/bEAU+pflh7d3tXCNJNzQxKlLT5ImT9mzjP0dgOLJ0BibjbqbqYNusqXsDTdRjlGBu6iw==
X-Received: by 2002:a05:6a00:181a:b0:47c:1057:52e with SMTP id
 y26-20020a056a00181a00b0047c1057052emr5549485pfa.76.1635440808097; 
 Thu, 28 Oct 2021 10:06:48 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y19sm4044516pfn.23.2021.10.28.10.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 10:06:47 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:06:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
Message-ID: <YXrYo9mtueDT0bnu@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <b2ba4c4e6a9083f3fa0b9af4504f9f54e72ca24c.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2ba4c4e6a9083f3fa0b9af4504f9f54e72ca24c.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_100649_586066_3610C766 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Signal the AVIC doorbell iff the vCPU is running in the guest.  If the vCPU
> > is not IN_GUEST_MODE, it's guaranteed to pick up any pending IRQs on the
> > next VMRUN, which unconditionally processes the vIRR.
> > 
> > Add comments to document the logic.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/svm/avic.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index 208c5c71e827..cbf02e7e20d0 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -674,7 +674,12 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >  	kvm_lapic_set_irr(vec, vcpu->arch.apic);
> >  	smp_mb__after_atomic();
> >  
> > -	if (avic_vcpu_is_running(vcpu)) {
> > +	/*
> > +	 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
> > +	 * is in the guest.  If the vCPU is not in the guest, hardware will
> > +	 * automatically process AVIC interrupts at VMRUN.
> > +	 */
> > +	if (vcpu->mode == IN_GUEST_MODE) {
> >  		int cpu = READ_ONCE(vcpu->cpu);
> >  
> >  		/*
> > @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >  		if (cpu != get_cpu())
> >  			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
> >  		put_cpu();
> > -	} else
> > +	} else {
> > +		/*
> > +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> > +		 * pending IRQ when checking if the vCPU has a wake event.
> > +		 */
> >  		kvm_vcpu_wake_up(vcpu);
> > +	}
> >  
> >  	return 0;
> >  }
> 
> It makes sense indeed to avoid ringing the doorbell when the vCPU is not in
> the guest mode.
> 
> I do wonder if we want to call kvm_vcpu_wake_up always otherwise, as the vCPU
> might be just outside of the guest mode and not scheduled out. I don't know
> how expensive is kvm_vcpu_wake_up in this case.

IIUC, you're asking if we should do something like:

	if (vcpu->mode == IN_GUEST_MODE) {
		<signal doorbell>
	} else if (!is_vcpu_loaded(vcpu)) {
		kvm_vcpu_wake_up();
	}

The answer is that kvm_vcpu_wake_up(), which is effectively rcuwait_wake_up(),
is very cheap except for specific configurations that may or may not be valid for
production[*].  Practically speaking, is_vcpu_loaded() doesn't exist and should
never exist because it's inherently racy.  The closest we have would be

	else if (vcpu != kvm_get_running_vcpu()) {
		kvm_vcpu_wake_up();
	}

but that's extremely unlikely to be a net win because getting the current vCPU
requires atomics to disable/re-enable preemption, especially if rcuwait_wake_up()
is modified to avoid the rcu lock/unlock.

TL;DR: rcuwait_wake_up() is cheap, and if it's too expensive, a better optimization
would be to make it less expensive.

[*] https://lkml.kernel.org/r/20211020110638.797389-1-pbonzini@redhat.com
 
> Before this patch, the avic_vcpu_is_running would only be false when the vCPU
> is scheduled out (e.g when vcpu_put was done on it)
> 
> Best regards,
> 	Maxim Levitsky
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
