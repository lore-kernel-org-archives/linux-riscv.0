Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4436FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96E8610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E96E8610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvRpQNvxky0Td+L5IXjtfCM6/WnU8XpujKwFq1jjUr4=; b=DPLFix3B8ikOP2
	m5eR2ca6LqIQRLqcSEgwlEoxGt2xm6WxbT3hpkFhSlV3v2/zQWx1irlbRdltzwWgdR3gRV29jlxHf
	5wjXsG5wsRNg8h5j23oft3ElpLnlDKPhhsFMK1opXjjS+F3gxaFxwqB0raQdye21pblsJYfLIwyH+
	i2yMmwL6OS1MgsCyiJG11v6qE2yGF5tbfsdh0Yf9LcrTbs8KKvPzoEoDjLQJNsc+F6B1DhDkuGUaa
	Y8D8HX1MNQjba+a1jq0XV2dGAj9cjmbsrK1/CgyrKcFdBlXYDxPNf9mjZTNxZVab/Eqs7l17rZsOH
	5fxIw6PjQP85tI9Dmiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4v2-007rOc-Ea; Thu, 28 Oct 2021 12:54:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4uX-007rHG-Nj
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 12:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635425616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzVqjh+2Lud5A9V6SBUfySTC7Jdhp9VKIE8pHEMoxEM=;
 b=Haw4meDnnZiRNqepWdJFiqTa/PAiOvLV38FWXEXwIlArT5exwBdzbYcE1nm/SYMwkwnJbn
 Ruv4+XnNWlHbMrY2qYwYy/lyn4TIq6WxuxbJqteBHV67OKIFlK7nuqtNeEApmcAEeQ2k7W
 m/EJaZj3ddTXLnSZSkrsgaZt9w5ABmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ldzfqrMaMG-LB-zAjma-Rg-1; Thu, 28 Oct 2021 08:53:33 -0400
X-MC-Unique: ldzfqrMaMG-LB-zAjma-Rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F24802682;
 Thu, 28 Oct 2021 12:53:28 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E025DA61;
 Thu, 28 Oct 2021 12:53:12 +0000 (UTC)
Message-ID: <558e7e4c36e649709837079a25c2f56fc5609fbe.camel@redhat.com>
Subject: Re: [PATCH v2 28/43] KVM: VMX: Remove vCPU from PI wakeup list
 before updating PID.NV
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
Date: Thu, 28 Oct 2021 15:53:11 +0300
In-Reply-To: <20211009021236.4122790-29-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-29-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_055337_907026_D2D14EDB 
X-CRM114-Status: GOOD (  38.39  )
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
> Remove the vCPU from the wakeup list before updating the notification
> vector in the posted interrupt post-block helper.  There is no need to
> wake the current vCPU as it is by definition not blocking.  Practically
> speaking this is a nop as it only shaves a few meager cycles in the
> unlikely case that the vCPU was migrated and the previous pCPU gets a
> wakeup IRQ right before PID.NV is updated.  The real motivation is to
> allow for more readable code in the future, when post-block is merged
> with vmx_vcpu_pi_load(), at which point removal from the list will be
> conditional on the old notification vector.
> 
> Opportunistically add comments to document why KVM has a per-CPU spinlock
> that, at first glance, appears to be taken only on the owning CPU.
> Explicitly call out that the spinlock must be taken with IRQs disabled, a
> detail that was "lost" when KVM switched from spin_lock_irqsave() to
> spin_lock(), with IRQs disabled for the entirety of the relevant path.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 49 +++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 2b2206339174..901b7a5f7777 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -10,10 +10,22 @@
>  #include "vmx.h"
>  
>  /*
> - * We maintain a per-CPU linked-list of vCPU, so in wakeup_handler() we
> - * can find which vCPU should be waken up.
> + * Maintain a per-CPU list of vCPUs that need to be awakened by wakeup_handler()
Nit: While at it, it would be nice to rename this to pi_wakeup_hanlder() so that it can be more easilly
found.


> + * when a WAKEUP_VECTOR interrupted is posted.  vCPUs are added to the list when
> + * the vCPU is scheduled out and is blocking (e.g. in HLT) with IRQs enabled.
s/interrupted/interrupt ?

Isn't that comment incorrect? As I see, the PI hardware is setup to use the WAKEUP_VECTOR
when vcpu blocks (in pi_pre_block) and then that vcpu is added to the list.
The pi_wakeup_hanlder just goes over the list and wakes up all vcpus on the lsit.


> + * The vCPUs posted interrupt descriptor is updated at the same time to set its
> + * notification vector to WAKEUP_VECTOR, so that posted interrupt from devices
> + * wake the target vCPUs.  vCPUs are removed from the list and the notification
> + * vector is reset when the vCPU is scheduled in.
>   */
>  static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
Also while at it, why not to rename this to 'blocked_vcpu_list'?
to explain that this is list of blocked vcpus. Its a per-cpu variable
so 'on_cpu' suffix isn't needed IMHO.

> +/*
> + * Protect the per-CPU list with a per-CPU spinlock to handle task migration.
> + * When a blocking vCPU is awakened _and_ migrated to a different pCPU, the
> + * ->sched_in() path will need to take the vCPU off the list of the _previous_
> + * CPU.  IRQs must be disabled when taking this lock, otherwise deadlock will
> + * occur if a wakeup IRQ arrives and attempts to acquire the lock.
> + */
>  static DEFINE_PER_CPU(spinlock_t, blocked_vcpu_on_cpu_lock);
>  
>  static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
> @@ -101,23 +113,28 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
> -	dest = cpu_physical_id(vcpu->cpu);
> -	if (!x2apic_mode)
> -		dest = (dest << 8) & 0xFF00;
> -
> -	do {
> -		old.control = new.control = READ_ONCE(pi_desc->control);
> -
> -		new.ndst = dest;
> -
> -		/* set 'NV' to 'notification vector' */
> -		new.nv = POSTED_INTR_VECTOR;
> -	} while (cmpxchg64(&pi_desc->control, old.control,
> -			   new.control) != old.control);
> -
> +	/*
> +	 * Remove the vCPU from the wakeup list of the _previous_ pCPU, which
> +	 * will not be the same as the current pCPU if the task was migrated.
> +	 */
>  	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
>  	list_del(&vcpu->blocked_vcpu_list);
>  	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
> +
> +	dest = cpu_physical_id(vcpu->cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
It would be nice to have a function for this, this appears in this file twice.
Maybe there is a function already somewhere?


> +
> +	do {
> +		old.control = new.control = READ_ONCE(pi_desc->control);
> +
> +		new.ndst = dest;
> +
> +		/* set 'NV' to 'notification vector' */
> +		new.nv = POSTED_INTR_VECTOR;
> +	} while (cmpxchg64(&pi_desc->control, old.control,
> +			   new.control) != old.control);
> +
>  	vcpu->pre_pcpu = -1;
>  }
>  

Best regards,
	Maxim Levitsky



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
