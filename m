Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 06:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051EC6103C
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 06:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 051EC6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWkZnpepNN5xME8R+xieI8j+8c1t5MHxnINgv/qWHWU=; b=VUqdMk0LN8UO/y
	t5ykEZ96BBof0F1x03ccCn8jY2i/5zn5L/BPHt9+0TSvyiF2WcSofgcw4ZyxQpHu4JwUOUb3IVRMa
	6bJ/bNE13OM7G6lK+YscKDL6HSkME2UKtV6gGEjJY4oc3W8ViPid9QPBYSKK1iZ3wiVpoZ9bQ5zCW
	JkARzqxWi9lfUriKqxO38XMHRmWIyyGI+kQZMpV5Td5IecSgFGCI0wrh+yiJ76qkzbUQb+Ql0qCpy
	ZM7oISUPFyguchb3Gm9TjEzJB+RkTgka07YcB6y2SXQcBqHaYltKHqZEGYW5FbWpRNoB/7tM5ulR9
	/LvFntbsZ1lAT0fl6pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfyYk-006xhk-Ge; Thu, 28 Oct 2021 06:06:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfyYY-006xfR-7H
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 06:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635401189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QW1VwJpwnVmxxU7z0qT05ZJcs1uisimu/KzjDIJrxzY=;
 b=YeUC4xU3uGU0Gli7HlwrbCjdXO3seIOYnYGWK6TKjnHilLx8jkKDozXwc1KRO8hFI8/axX
 kpAHztnPk0FrFvQZtQuj4NW+MGul4Yd9GOVLxXc7rRU6TDYSpAeFqxzO19RaRYk429arEu
 hnpzlE2SFWCnp10Zcyns6XJYMlJQig8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-FpD08W43OridSh2IluPe8g-1; Thu, 28 Oct 2021 02:06:25 -0400
X-MC-Unique: FpD08W43OridSh2IluPe8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2367679EEF;
 Thu, 28 Oct 2021 06:06:17 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8DC70953;
 Thu, 28 Oct 2021 06:05:36 +0000 (UTC)
Message-ID: <49c6c208841a85dbcb397acdc7f20b81402e71fb.camel@redhat.com>
Subject: Re: [PATCH v2 23/43] KVM: VMX: Use boolean returns for Posted
 Interrupt "test" helpers
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
Date: Thu, 28 Oct 2021 09:05:35 +0300
In-Reply-To: <20211009021236.4122790-24-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-24-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_230630_367259_6C939E05 
X-CRM114-Status: GOOD (  20.04  )
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
> Return bools instead of ints for the posted interrupt "test" helpers.
> The bit position of the flag being test does not matter to the callers,
> and is in fact lost by virtue of test_bit() itself returning a bool.
> 
> Returning ints is potentially dangerous, e.g. "pi_test_on(pi_desc) == 1"
> is safe-ish because ON is bit 0 and thus any sane implementation of
> pi_test_on() will work, but for SN (bit 1), checking "== 1" would rely on
> pi_test_on() to return 0 or 1, a.k.a. bools, as opposed to 0 or 2 (the
> positive bit position).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 4 ++--
>  arch/x86/kvm/vmx/posted_intr.h | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 6c2110d91b06..1688f8dc535a 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -185,7 +185,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  			   new.control) != old.control);
>  
>  	/* We should not block the vCPU if an interrupt is posted for it.  */
> -	if (pi_test_on(pi_desc) == 1)
> +	if (pi_test_on(pi_desc))
>  		__pi_post_block(vcpu);
>  
>  	local_irq_enable();
> @@ -216,7 +216,7 @@ void pi_wakeup_handler(void)
>  			blocked_vcpu_list) {
>  		struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
>  
> -		if (pi_test_on(pi_desc) == 1)
> +		if (pi_test_on(pi_desc))
>  			kvm_vcpu_kick(vcpu);
>  	}
>  	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
> diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
> index 7f7b2326caf5..36ae035f14aa 100644
> --- a/arch/x86/kvm/vmx/posted_intr.h
> +++ b/arch/x86/kvm/vmx/posted_intr.h
> @@ -40,7 +40,7 @@ static inline bool pi_test_and_clear_on(struct pi_desc *pi_desc)
>  			(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
> +static inline bool pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
>  {
>  	return test_and_set_bit(vector, (unsigned long *)pi_desc->pir);
>  }
> @@ -74,13 +74,13 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>  		(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_on(struct pi_desc *pi_desc)
> +static inline bool pi_test_on(struct pi_desc *pi_desc)
>  {
>  	return test_bit(POSTED_INTR_ON,
>  			(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_sn(struct pi_desc *pi_desc)
> +static inline bool pi_test_sn(struct pi_desc *pi_desc)
>  {
>  	return test_bit(POSTED_INTR_SN,
>  			(unsigned long *)&pi_desc->control);
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
