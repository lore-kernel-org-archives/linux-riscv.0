Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76A9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 10:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA052610FC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 10:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA052610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHKezOmuNo1LfJhy64hCwnZgeV3I9zAOcwvC2SLKG0k=; b=AlnNmLR+X1pERw
	5DRWrcq4exUGFg578fktNWsS4F83irRxsllca80aFBSL7hCHvvetOIDzMoJ97NeM884CK/GxMvh0m
	i42260aUJomb/P9Uh3DxGL71JGKWaXSOFThxrs7bGStg1D68+7gUpYdr2H8sybm4nq6YckzNWccfa
	OIsBXyh39Xk8fy6V7qDN6v5dNg6F9QOS0Olwlokuc5/XrSX9UW1JK3CmL6cokcprFVB1WCIY65cPu
	tUYZv0vlHCM4GF1fky2Tw4gwqk6KvGrUAZidRjhXCi8Lx4hhXmznilfrkR0eB7SnBS2j7N+dTld9A
	cZvbmt0VZpJPpO/EZwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg37f-007cGe-0S; Thu, 28 Oct 2021 10:59:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg37c-007cFQ-Ni
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 10:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635418739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSSD6JYIIX/+OAHh3pR71NKYzpuBAvVzGPZ/3rAMc5k=;
 b=aygBQ52FdVuXhyMYAXyAnpMixAhee9mwMA5CGVvAD4A63S61wvsAOCepyVBmb4kQONsAPh
 oRz7p1w0xZB/uvADqhApVX+sN8TCwoFKGxDRj/1jupGU3Yx7BWW5ZKOXJ4lc98PvZqkp5T
 333mfIMalZNY9zJ7d1FglKjeXD6S5K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-pBYTSTgoPK2ouWzH2IV0xA-1; Thu, 28 Oct 2021 06:58:56 -0400
X-MC-Unique: pBYTSTgoPK2ouWzH2IV0xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6BC10A8E02;
 Thu, 28 Oct 2021 10:58:53 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9D4B19D9F;
 Thu, 28 Oct 2021 10:58:41 +0000 (UTC)
Message-ID: <b078cce30f86672d7d8f8eaa0adc47d24def24e2.camel@redhat.com>
Subject: Re: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control"
 exactly once per loop iteration
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
Date: Thu, 28 Oct 2021 13:58:40 +0300
In-Reply-To: <20211009021236.4122790-27-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-27-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_035900_884136_0CC187EB 
X-CRM114-Status: GOOD (  19.07  )
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
> Use READ_ONCE() when loading the posted interrupt descriptor control
> field to ensure "old" and "new" have the same base value.  If the
> compiler emits separate loads, and loads into "new" before "old", KVM
> could theoretically drop the ON bit if it were set between the loads.
> 
> Fixes: 28b835d60fcc ("KVM: Update Posted-Interrupts Descriptor when vCPU is preempted")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 414ea6972b5c..fea343dcc011 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -53,7 +53,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	/* The full case.  */
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		dest = cpu_physical_id(cpu);
>  
> @@ -104,7 +104,7 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		dest = cpu_physical_id(vcpu->cpu);
>  
> @@ -160,7 +160,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  	     "Posted Interrupt Suppress Notification set before blocking");
>  
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		/* set 'NV' to 'wakeup vector' */
>  		new.nv = POSTED_INTR_WAKEUP_VECTOR;

I wish there was a way to mark fields in a struct, as requiring 'READ_ONCE' on them
so that compiler would complain if this isn't done, or automatically use 'READ_ONCE'
logic.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
