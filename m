Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F049C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 10:55:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8BE2610FC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 10:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8BE2610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOPX0R6YtFwRUgWtwUoioR+W6bnR+0zFFSnjQI+UZ5I=; b=OGZPpDdW1xMGXw
	d1a7vq/xx7Qooq8bE5PXlaxZBlk0fbjT8xJS8K9A4GFW1gHeu31dr+MvdI7kGDyJdLUJqtAdFXROO
	BWXZsTWIka4XUlEveHEBGhL5c/NpERtnR4ugQ0rewd8Edl3IfSweB7oalBx84ilhF3hNLdOlUWJHB
	dEKqVbAEP5FmXmJ4Qg56vRTevXZMJiMw8V8JwBee7pTrVLwAB4pDErVuZSkvK7FKV1HemZ1AyIS9G
	xdhyFu0inQsFOaF8aWDIINjLPOGxIzszQBx7W2tvLu4MJK1TFaMS7EztyK9d6mExIN9O8zfMfXQQV
	kpRCNeGU9RVc7D9ggauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg33v-007bMu-5t; Thu, 28 Oct 2021 10:55:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg33r-007bKX-EF
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 10:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635418506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVBM4WS2LhpDG29Lqha3fLHlxhnITE0Ru8HhYa7oBTo=;
 b=Ut3c3Cbnc3K+t4v3A8GmwvUctdHBSE5oYbeCC7BL843mo28xPQaAw4uNIAuZEbpwXpFVnN
 A2sa8/E/8yk7HhqSO9WzCzIm72i67BO49BU9+EnQgPODs8XbjwydYBAJvOMPRJnDiVgIY6
 zKT4ZO9NGz/18Fh4NBPtQ7KwYNbKjJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-rG3SRiItNtexXrDC84-blA-1; Thu, 28 Oct 2021 06:55:03 -0400
X-MC-Unique: rG3SRiItNtexXrDC84-blA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F8D18D6A2C;
 Thu, 28 Oct 2021 10:54:59 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D81760D30;
 Thu, 28 Oct 2021 10:54:41 +0000 (UTC)
Message-ID: <72804198c24493c95e4a28bcd670bff32b945278.camel@redhat.com>
Subject: Re: [PATCH v2 25/43] KVM: VMX: Save/restore IRQs (instead of
 CLI/STI) during PI pre/post block
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
Date: Thu, 28 Oct 2021 13:54:40 +0300
In-Reply-To: <20211009021236.4122790-26-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-26-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_035507_582280_ACE3BE95 
X-CRM114-Status: GOOD (  16.17  )
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
> Save/restore IRQs when disabling IRQs in posted interrupt pre/post block
> in preparation for moving the code into vcpu_put/load(), and thus may be
> called with IRQs already disabled.
> 
> No functional changed intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 239e0e72a0dd..414ea6972b5c 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -140,6 +140,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  {
>  	struct pi_desc old, new;
>  	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
> +	unsigned long flags;
>  
>  	if (!kvm_arch_has_assigned_device(vcpu->kvm) ||
>  	    !irq_remapping_cap(IRQ_POSTING_CAP) ||
> @@ -147,8 +148,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  	    vmx_interrupt_blocked(vcpu))
>  		return 0;
>  
> -	WARN_ON(irqs_disabled());
> -	local_irq_disable();
> +	local_irq_save(flags);
>  
>  	vcpu->pre_pcpu = vcpu->cpu;
>  	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
> @@ -171,19 +171,20 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  	if (pi_test_on(pi_desc))
>  		__pi_post_block(vcpu);
>  
> -	local_irq_enable();
> +	local_irq_restore(flags);
>  	return (vcpu->pre_pcpu == -1);
>  }
>  
>  void pi_post_block(struct kvm_vcpu *vcpu)
>  {
> +	unsigned long flags;
> +
>  	if (vcpu->pre_pcpu == -1)
>  		return;
>  
> -	WARN_ON(irqs_disabled());
> -	local_irq_disable();
> +	local_irq_save(flags);
>  	__pi_post_block(vcpu);
> -	local_irq_enable();
> +	local_irq_restore(flags);
>  }
>  
>  /*
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
