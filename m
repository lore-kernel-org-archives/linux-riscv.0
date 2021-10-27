Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29EFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 19:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB6D61039
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 19:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FB6D61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFvwVOG4XRXGCiiGK8GsmPQuXfTLXfXxAqj4/bzHSyw=; b=fSuMgWgEUtYK9Z
	lmGWDUaJgf6lrhLhKJ9DnbXQoLlrRZdBlvcNrRBA7JzQ6581WD75ukUu5FB+UiUVvypT6d8ZRcw5U
	WfM9wGUNTJKovaDjkYpBvH1abAcxXio88fsw3m9Eu/jx9AQeHy4PfovkWnLO61j1SL4PsB1oL/uMW
	Uix1NF1Pfyfdaossx31m+CL9wQ/gUEloqWop24UpvmgxvDJhSKU96iw6h8e7GXQQVPJKP1XQhhq3c
	C5JHCJA6/pjRXeJAMwmYlng6nf6oG+hOBT+9qAKyMybSbzrm84LWYsAR8ZvaR0SXmzBujUGoxGsJu
	/CNjr84AT8Rh2mkRWYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfoax-005w3p-0h; Wed, 27 Oct 2021 19:28:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfoar-005w0T-Lz
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 19:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635362891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wylhzf4CyCl3uScvUg3UWqXTSn56cxOkW4GodPhaZEk=;
 b=gmt/ooFxQQ/Z8BmanF7aZcWOJLaO/Sr3UMARvfPwsz6785U2h0xMKHnRivjpqucJLaOhjx
 YaVwJxyEZ2BxKKg+RrCE70PzyL/symcjykeEl6gIqCTpZBdeVtv63rYH68eT1sv4/xDW9m
 A2A5zyAdkyQH2D07s3h1tsf/SkMmXxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-6XBNbbgXN7iWziBFLLfjYg-1; Wed, 27 Oct 2021 15:28:07 -0400
X-MC-Unique: 6XBNbbgXN7iWziBFLLfjYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3230C5074B;
 Wed, 27 Oct 2021 19:28:03 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2E20171FF;
 Wed, 27 Oct 2021 19:27:23 +0000 (UTC)
Message-ID: <495f9106220b87ffa9eaf15fcf39b950628adee1.camel@redhat.com>
Subject: Re: [PATCH v2 19/43] KVM: Add helpers to wake/query blocking vCPU
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
Date: Wed, 27 Oct 2021 22:27:22 +0300
In-Reply-To: <20211009021236.4122790-20-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-20-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_122813_886795_7B27AF74 
X-CRM114-Status: GOOD (  22.80  )
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
> Add helpers to wake and query a blocking vCPU.  In addition to providing
> nice names, the helpers reduce the probability of KVM neglecting to use
> kvm_arch_vcpu_get_wait().
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/arch_timer.c |  3 +--
>  arch/arm64/kvm/arm.c        |  2 +-
>  arch/x86/kvm/lapic.c        |  2 +-
>  include/linux/kvm_host.h    | 14 ++++++++++++++
>  virt/kvm/async_pf.c         |  2 +-
>  virt/kvm/kvm_main.c         |  8 ++------
>  6 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 7e8396f74010..addd53b6eba6 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -649,7 +649,6 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>  {
>  	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
>  	struct timer_map map;
> -	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>  
>  	if (unlikely(!timer->enabled))
>  		return;
> @@ -672,7 +671,7 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>  	if (map.emul_ptimer)
>  		soft_timer_cancel(&map.emul_ptimer->hrtimer);
>  
> -	if (rcuwait_active(wait))
> +	if (kvm_vcpu_is_blocking(vcpu))
>  		kvm_timer_blocking(vcpu);
>  
>  	/*
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 268b1e7bf700..9ff0e85a9f16 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -622,7 +622,7 @@ void kvm_arm_resume_guest(struct kvm *kvm)
>  
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		vcpu->arch.pause = false;
> -		rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
> +		__kvm_vcpu_wake_up(vcpu);
>  	}
>  }
>  
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 76fb00921203..0cd7ed21b205 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -1931,7 +1931,7 @@ void kvm_lapic_expired_hv_timer(struct kvm_vcpu *vcpu)
>  	/* If the preempt notifier has already run, it also called apic_timer_expired */
>  	if (!apic->lapic_timer.hv_timer_in_use)
>  		goto out;
> -	WARN_ON(rcuwait_active(&vcpu->wait));
> +	WARN_ON(kvm_vcpu_is_blocking(vcpu));
>  	apic_timer_expired(apic, false);
>  	cancel_hv_timer(apic);
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index bdaa0e70b060..1fa38dc00b87 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1151,6 +1151,20 @@ static inline struct rcuwait *kvm_arch_vcpu_get_wait(struct kvm_vcpu *vcpu)
>  #endif
>  }
>  
> +/*
> + * Wake a vCPU if necessary, but don't do any stats/metadata updates.  Returns
> + * true if the vCPU was blocking and was awakened, false otherwise.
> + */
> +static inline bool __kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
> +{
> +	return !!rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
> +}
> +
> +static inline bool kvm_vcpu_is_blocking(struct kvm_vcpu *vcpu)
> +{
> +	return rcuwait_active(kvm_arch_vcpu_get_wait(vcpu));
> +}
> +
>  #ifdef __KVM_HAVE_ARCH_INTC_INITIALIZED
>  /*
>   * returns true if the virtual interrupt controller is initialized and
> diff --git a/virt/kvm/async_pf.c b/virt/kvm/async_pf.c
> index ccb35c22785e..9bfe1d6f6529 100644
> --- a/virt/kvm/async_pf.c
> +++ b/virt/kvm/async_pf.c
> @@ -85,7 +85,7 @@ static void async_pf_execute(struct work_struct *work)
>  
>  	trace_kvm_async_pf_completed(addr, cr2_or_gpa);
>  
> -	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
> +	__kvm_vcpu_wake_up(vcpu);
>  
>  	mmput(mm);
>  	kvm_put_kvm(vcpu->kvm);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 481e8178b43d..c870cae7e776 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3332,10 +3332,7 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
>  
>  bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
>  {
> -	struct rcuwait *waitp;
> -
> -	waitp = kvm_arch_vcpu_get_wait(vcpu);
> -	if (rcuwait_wake_up(waitp)) {
> +	if (__kvm_vcpu_wake_up(vcpu)) {
>  		WRITE_ONCE(vcpu->ready, true);
>  		++vcpu->stat.generic.halt_wakeup;
>  		return true;
> @@ -3490,8 +3487,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
>  				continue;
>  			if (vcpu == me)
>  				continue;
> -			if (rcuwait_active(kvm_arch_vcpu_get_wait(vcpu)) &&
> -			    !vcpu_dy_runnable(vcpu))
> +			if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
>  				continue;
>  			if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
>  			    !kvm_arch_dy_has_pending_interrupt(vcpu) &&

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
