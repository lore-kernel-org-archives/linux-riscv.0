Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B85C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:19:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C560610D2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C560610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RucsA2vDl1aJVCmAjF9TCZbXB1bMiTrZC2TbYHQXB6c=; b=M1SDxhyWVW91Hd
	w6ZZl0RI1lW9eKHf3W/laNGimsNCiUna0BSN/aQlZ2fFXf5tCUkQksRDaTwDE+V36CeEzcJrkW7tS
	uQ9arJFwu51rEmCwctNmDjMfdCMbXWZX6qu9Drxnsqluf0r7//U1XEYzKAo424K4PrAS0PK8dSL+E
	KNVI8pzs40uFSeORlUtRaKsSpvzVLbdF1YESeQaDCZgFE1YpkLpo/I8Ov6xdNQXxcEue9X+5EGCG+
	Bi3O5Z9pZwzf1OIftJSihbIV+vwZT4yqbXmIAaOYk8ZlLMfxckARDOZjVH454V/t971YaE9ngUWCH
	+hF8MrYAHx16isMmkgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg943-008iE6-O1; Thu, 28 Oct 2021 17:19:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg940-008iCm-OG
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 17:19:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so5295191pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q4iJG3ZW7obL4DMmrtDt5ktj041PvD+dEvmTQN+uKyY=;
 b=mnkWkJlsD3Efv+dhabg9XRW3VcAMBFLrAWU0a5kq4aSl4p3OkuIs64Ri3PE1R6G45W
 WWX1srIjeyGp7bl0JwXP4EsqbWo0C7Rq7LlpprSwJJDhP6Z9C4BlGZ6pF0W6uFPVwJd6
 newuZGIp7fi3S1LWbDnukcAYyKzMEUnwUDvBD8yhO2TaY/ppfXW+LzQN7N/3ahTyR+Xa
 EoqLzmvlkN3t1dBGcUsabuqlQMThWwYqrYkPzmYbFq4TCGSH1FBWF6bLFrKhvfl+wIkg
 myDgbOosQ39NTrE5GkyLOk3F2ofMqkvjX3mEfa4Ds01sxY6mlbwLLtW+SYgm0DJ0rLj4
 pK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q4iJG3ZW7obL4DMmrtDt5ktj041PvD+dEvmTQN+uKyY=;
 b=UVyq3tCMnSJuUsoWdnY0XaK2c6QTdCWrs8aOEDR5EeD8uWO6JYJuaoiDp5tAbYzppa
 N0iVtKO7gOkjZpFOF8QulEDtaUL9KBNcfzavE5zosU2I2XDsF/A3aNkuk37j2Cc6+ONA
 32xm9evmyHw3xBWu2l1T7/Ad9b1ZUUraoB6Kdk+oCDTjIHUBIAYfATHjlRA5veJG//7O
 VcZEjzZTZ7w20l40svUhqW8+2rzvwS8Lgv/IJtIDaekd7PEJjcg0JAUKeRmKzp4MrIdl
 DKnhIsIHUCLbxf00GQihwMpy7eF7X07g2TTiQc5MQQYLrw2bsBDSSyPn9z71QE8vySps
 SYWA==
X-Gm-Message-State: AOAM531U5Qw+fvLt7uoFsRx9ucoLoQXO64aGF9lVY8Ob4w01svubZep5
 MTMzV+wQIAxX7j5AbjUesd8UGQ==
X-Google-Smtp-Source: ABdhPJybd062Z7dZdlv5Ua0y9WgXsZDlcpD/ngOKZtR+XtlO0zPIxbocuXwUccJIVKZ7ltOnF8e4MQ==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr5854314pjq.181.1635441579540; 
 Thu, 28 Oct 2021 10:19:39 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id d24sm3945465pfn.62.2021.10.28.10.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 10:19:38 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:19:34 +0000
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
Subject: Re: [PATCH v2 28/43] KVM: VMX: Remove vCPU from PI wakeup list
 before updating PID.NV
Message-ID: <YXrbpvHG7YD0MNO2@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-29-seanjc@google.com>
 <558e7e4c36e649709837079a25c2f56fc5609fbe.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <558e7e4c36e649709837079a25c2f56fc5609fbe.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_101940_838099_B41613F4 
X-CRM114-Status: GOOD (  44.90  )
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
> > Remove the vCPU from the wakeup list before updating the notification
> > vector in the posted interrupt post-block helper.  There is no need to
> > wake the current vCPU as it is by definition not blocking.  Practically
> > speaking this is a nop as it only shaves a few meager cycles in the
> > unlikely case that the vCPU was migrated and the previous pCPU gets a
> > wakeup IRQ right before PID.NV is updated.  The real motivation is to
> > allow for more readable code in the future, when post-block is merged
> > with vmx_vcpu_pi_load(), at which point removal from the list will be
> > conditional on the old notification vector.
> > 
> > Opportunistically add comments to document why KVM has a per-CPU spinlock
> > that, at first glance, appears to be taken only on the owning CPU.
> > Explicitly call out that the spinlock must be taken with IRQs disabled, a
> > detail that was "lost" when KVM switched from spin_lock_irqsave() to
> > spin_lock(), with IRQs disabled for the entirety of the relevant path.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/posted_intr.c | 49 +++++++++++++++++++++++-----------
> >  1 file changed, 33 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> > index 2b2206339174..901b7a5f7777 100644
> > --- a/arch/x86/kvm/vmx/posted_intr.c
> > +++ b/arch/x86/kvm/vmx/posted_intr.c
> > @@ -10,10 +10,22 @@
> >  #include "vmx.h"
> >  
> >  /*
> > - * We maintain a per-CPU linked-list of vCPU, so in wakeup_handler() we
> > - * can find which vCPU should be waken up.
> > + * Maintain a per-CPU list of vCPUs that need to be awakened by wakeup_handler()
> Nit: While at it, it would be nice to rename this to pi_wakeup_hanlder() so
> that it can be more easilly found.

Ah, good catch.

> > + * when a WAKEUP_VECTOR interrupted is posted.  vCPUs are added to the list when
> > + * the vCPU is scheduled out and is blocking (e.g. in HLT) with IRQs enabled.
> s/interrupted/interrupt ?
> 
> Isn't that comment incorrect? As I see, the PI hardware is setup to use the WAKEUP_VECTOR
> when vcpu blocks (in pi_pre_block) and then that vcpu is added to the list.
> The pi_wakeup_hanlder just goes over the list and wakes up all vcpus on the lsit.

Doh, yes.  This patch is predicting the future.  The comment becomes correct as of 

  KVM: VMX: Handle PI wakeup shenanigans during vcpu_put/load

but as of this patch the "scheduled out" piece doesn't hold true.
 
> > + * The vCPUs posted interrupt descriptor is updated at the same time to set its
> > + * notification vector to WAKEUP_VECTOR, so that posted interrupt from devices
> > + * wake the target vCPUs.  vCPUs are removed from the list and the notification
> > + * vector is reset when the vCPU is scheduled in.
> >   */
> >  static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
> Also while at it, why not to rename this to 'blocked_vcpu_list'?
> to explain that this is list of blocked vcpus. Its a per-cpu variable
> so 'on_cpu' suffix isn't needed IMHO.

As you noted, addressed in a future patch.

> > +/*
> > + * Protect the per-CPU list with a per-CPU spinlock to handle task migration.
> > + * When a blocking vCPU is awakened _and_ migrated to a different pCPU, the
> > + * ->sched_in() path will need to take the vCPU off the list of the _previous_
> > + * CPU.  IRQs must be disabled when taking this lock, otherwise deadlock will
> > + * occur if a wakeup IRQ arrives and attempts to acquire the lock.
> > + */
> >  static DEFINE_PER_CPU(spinlock_t, blocked_vcpu_on_cpu_lock);
> >  
> >  static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
> > @@ -101,23 +113,28 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
> >  	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
> >  	     "Wakeup handler not enabled while the vCPU was blocking");
> >  
> > -	dest = cpu_physical_id(vcpu->cpu);
> > -	if (!x2apic_mode)
> > -		dest = (dest << 8) & 0xFF00;
> > -
> > -	do {
> > -		old.control = new.control = READ_ONCE(pi_desc->control);
> > -
> > -		new.ndst = dest;
> > -
> > -		/* set 'NV' to 'notification vector' */
> > -		new.nv = POSTED_INTR_VECTOR;
> > -	} while (cmpxchg64(&pi_desc->control, old.control,
> > -			   new.control) != old.control);
> > -
> > +	/*
> > +	 * Remove the vCPU from the wakeup list of the _previous_ pCPU, which
> > +	 * will not be the same as the current pCPU if the task was migrated.
> > +	 */
> >  	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
> >  	list_del(&vcpu->blocked_vcpu_list);
> >  	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
> > +
> > +	dest = cpu_physical_id(vcpu->cpu);
> > +	if (!x2apic_mode)
> > +		dest = (dest << 8) & 0xFF00;
> It would be nice to have a function for this, this appears in this file twice.
> Maybe there is a function already somewhere?

The second instance does go away by the aforementioned:

  KVM: VMX: Handle PI wakeup shenanigans during vcpu_put/load

I'm inclined to say we don't want a helper because there should only ever be one
path that changes PI.ndst.  But a comment would definitely help to explain the
difference between xAPIC and x2APIC IDs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
