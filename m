Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A328C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:05:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9541560F92
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9541560F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VVpbzuRPLhrPuoiuMNCRtm3QyzyKTeLXXUnFD9SJXc=; b=vwqp1i7R/RYAc3
	rWSZnYbO8/5+fgvKn8VYr74skXknCZEWUZ+RHZrkml3wAG6KtM+0C38APZwpekm/nWkZ6dFpzQbwT
	H1BpLJsX2EVkYac7ML+PctUwZO9BYLcF9ytau0BV4ePDSvRKdQUBV6Lsj0WDLH/EI5/1oQAJnEBDJ
	sp/BoQxoxRwEiHDFQmM5hUUN1I5z/HcBMqIy2KIDYCh+tUwurhdF/gsdOsYNXqjmKRc/diAE9jyx5
	EXHpPhuE/SsWbf5rlPFCm8hRc9JErFNSO68IwmEJiGSSzUVe46cdcOzjlWtA2CAwdYZ1H4d2RBQpt
	2SouDLnK5h7r3zQMJa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflQB-005OuT-U0; Wed, 27 Oct 2021 16:04:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflPy-005OsA-II
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 16:04:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so5490742pji.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dcpH/p742iSNJ4bZTW0zt1TGCcBsOCFOjXwA1nHOArQ=;
 b=Tm86IoMHOyj+zpaOtCSE4VFzqAdP+9ruKNcRadlOsFvChh7ill13kZR5jWD9NHE65h
 64jvZDMu9kIVfatwV9NqtMoLtCasfA5hteZXUvebb1KfemQP+3PqYeGQAgGx9M3p7bU8
 qNPAFnYhitn+E30o4EXNDe5pTB+zWAuxmiSCE4KEPuXZlCuroSJybkJylXO0PsvVFrn8
 WHatzxWVbSvDonjRBU4GlRNXf74WN3TzY8Vqi6OJ+Ctj4jxWd/Ui1c+kFiATf0mtE0jn
 ZZyVyj8OcnNeewioZwWE0jsQa9pZSUdW+6oR7be9c4lXCDaENvCYDfdnIza70+cJL6Io
 dmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dcpH/p742iSNJ4bZTW0zt1TGCcBsOCFOjXwA1nHOArQ=;
 b=Er965J0f2kue7uxv2ycNugQF8nrGfZgAuambQDLjusdy3UqROligOGztsqhEaAbStD
 /3SWIQK3zOMWOFcBk0zcuhuGQEsipXhbLa6nILpD/ItuRaohlwNePe1X1Tv0BrYXWcOO
 Fg3qT9HsUlvKvCA2kI0zyXZRHrwhwg/ZZ9tA8MuIr9VbAbBs5Ch4qcn+D80GK5klELOl
 5CCdrgo0otKN07MmoIeO6yX/Bxw8ixJe+I97zdw0KG5eRnanPUqf/Ef5Xu2U+/Ex7aV1
 1VUv9SzsNbEScxWSVOz+832DzQOTxaXxJIdAMve78gqBrCb+2OrdD3s4h5IAtZca1frx
 /EpA==
X-Gm-Message-State: AOAM532bkvlJj3d55Rq8AMjaVLKUMv+hVyIUrqv8G4ZXGPTlMyVwHsao
 d1UoVXQpi4IaOQgFJV01O/RAoQ==
X-Google-Smtp-Source: ABdhPJywTswkNFY7FXvXu6HG//R1t5yx+yTwPulg5ieqikJtUBQKOiC63rBPbvuvCOKHk/yZoLtKWg==
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr6766883pjb.162.1635350684192; 
 Wed, 27 Oct 2021 09:04:44 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id z15sm242123pga.16.2021.10.27.09.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:04:43 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:04:40 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
Message-ID: <YXl4mK7CyUBnPaQV@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_090446_630228_7C6BF64F 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +		/*
> > +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> > +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> > +		 * is guaranteed to see the event request if triggering a posted
> > +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> 
> This explanation doesn't make much sense to me.  This is just the usual
> request/kick pattern explained in Documentation/virt/kvm/vcpu-requests.rst;
> except that we don't bother with a "kick" out of guest mode because the
> entry always goes through kvm_check_request (in the nVMX case) or
> sync_pir_to_irr (if non-nested) and completes the delivery itself.
> 
> In other word, it is a similar idea as patch 43/43.
> 
> What this smp_wmb() pair with, is the smp_mb__after_atomic in
> kvm_check_request(KVM_REQ_EVENT, vcpu).

I don't think that's correct.  There is no kvm_check_request() in the relevant path.
kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
without a barrier.  The smp_mb__after_atomic ensures that any assets that were
modified prior to making the request are seen by the vCPU handling the request.
It does not provide any guarantees for a different vCPU/task making a request
and checking vcpu->mode versus the target vCPU setting vcpu->mode and checking
for a pending request.

> Setting the interrupt in the PIR orders before kvm_make_request in this
> thread, and orders after kvm_make_request in the vCPU thread.
>
> Here, instead:
> 
> > +	/*
> > +	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
> > +	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
> > +	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
> > +	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> > +	 */
> >  	if (vcpu != kvm_get_running_vcpu() &&
> >  	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
> > -		kvm_vcpu_kick(vcpu);
> > +		kvm_vcpu_wake_up(vcpu);
> 
> it pairs with the smp_mb__after_atomic in vmx_sync_pir_to_irr().  As
> explained again in vcpu-requests.rst, the ON bit has the same function as
> vcpu->request in the previous case.

Same as above, I don't think that's correct.  The smp_mb__after_atomic() ensures
that there's no race between the IOMMU writing vIRR and setting ON, and KVM
clearing ON and processing the vIRR.

pi_test_on() is not an atomic operation, and there's no memory barrier if ON=0.
It's the same behavior as kvm_check_request(), but again the ordering with respect
to vcpu->mode isn't being handled by PID.ON/kvm_check_request().

AIUI, this is the barrier that's paired with the PI barriers.  This is even called
out in (2).

	vcpu->mode = IN_GUEST_MODE;

	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);

	/*
	 * 1) We should set ->mode before checking ->requests.  Please see
	 * the comment in kvm_vcpu_exiting_guest_mode().
	 *
	 * 2) For APICv, we should set ->mode before checking PID.ON. This
	 * pairs with the memory barrier implicit in pi_test_and_set_on
	 * (see vmx_deliver_posted_interrupt).
	 *
	 * 3) This also orders the write to mode from any reads to the page
	 * tables done while the VCPU is running.  Please see the comment
	 * in kvm_flush_remote_tlbs.
	 */
	smp_mb__after_srcu_read_unlock();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
