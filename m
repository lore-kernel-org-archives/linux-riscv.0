Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9007DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5247760F21
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5247760F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p06viguoOcwgLru5o3LUDQGhVzkb6DB0Um6lnpGtk4Y=; b=yVxDI0UBzua4ZQ
	IVhtrsOtb16shVe0vTIcGJ4IMwooCr/+EsH4GpBgnIx1eWe5IX5B0QyJep2fLuoM8E0iTKPhKN7hG
	0/yzbqOkcHbFLDMmRzk5NPzjkSSWqFmCjGpy3XE0COsL1Afyj6HajUD7BUdmVg31L7sIy/CqPI0JI
	+XYxKFwZN7KFuOYR2t6nbwlH/MQThzNV4ls4L5Tl+5T+/0uO6uRRjscale0KsBOTFS12u+57gn0Bw
	b9gWEOhTRj/JlCpgLSPyrkHhMcqCBlPXyBs9ku/vKLpomMJHbdk+jBTa/zfmmBTiuU6rw6404pnUj
	azyJGNzuNiVD6TqewyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffdE-004V0k-2C; Wed, 27 Oct 2021 09:54:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffdB-004UyK-ET
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 09:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635328440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLKZI82hmPisWACp/QMd/03BQs+RHKrDBliqptWWYzE=;
 b=QdaTAUfDJ9+mnQF8+RnK5RQMyKSX+xPPdiFHFLeKeNnMhyaOyg8DnNmqaH644PWXaIlBKq
 30WBuSOl/+kpAGfjUJci96z0pgGj5vmH1kHgeR0509WA/uhDoy8IOYiDuiVaRqd3qOV0Gy
 YRzQ8mH7WsB5Iy+EAaIGqXVcumvwB6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-4gOjCQ60OwesHHSXcF-XSQ-1; Wed, 27 Oct 2021 05:51:19 -0400
X-MC-Unique: 4gOjCQ60OwesHHSXcF-XSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD15980A5C0;
 Wed, 27 Oct 2021 09:51:15 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401B019D9F;
 Wed, 27 Oct 2021 09:50:31 +0000 (UTC)
Message-ID: <aa1656c01ea5d46dd22c66da4a5eaa27f58810a2.camel@redhat.com>
Subject: Re: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
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
Date: Wed, 27 Oct 2021 12:50:30 +0300
In-Reply-To: <20211009021236.4122790-3-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-3-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_025401_635938_EC3A3952 
X-CRM114-Status: GOOD (  25.67  )
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

On Fri, 2021-10-08 at 19:11 -0700, Sean Christopherson wrote:
> Ensure vcpu->cpu is read once when signalling the AVIC doorbell.  If the
> compiler rereads the field and the vCPU is migrated between the check and
> writing the doorbell, KVM would signal the wrong physical CPU.

Since vcpu->cpu can change any moment anyway, adding READ_ONCE I think can't really fix anything
but I do agree that it makes this more readable.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



> 
> Functionally, signalling the wrong CPU in this case is not an issue as
> task migration means the vCPU has exited and will pick up any pending
> interrupts on the next VMRUN.  Add the READ_ONCE() purely to clean up the
> code.
> 
> Opportunistically add a comment explaining the task migration behavior,
> and rename cpuid=>cpu to avoid conflating the CPU number with KVM's more
> common usage of CPUID.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 8052d92069e0..208c5c71e827 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -675,10 +675,17 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>  	smp_mb__after_atomic();
>  
>  	if (avic_vcpu_is_running(vcpu)) {
> -		int cpuid = vcpu->cpu;
> +		int cpu = READ_ONCE(vcpu->cpu);
>  
> -		if (cpuid != get_cpu())
> -			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpuid));
> +		/*
> +		 * Note, the vCPU could get migrated to a different pCPU at any
> +		 * point, which could result in signalling the wrong/previous
> +		 * pCPU.  But if that happens the vCPU is guaranteed to do a
> +		 * VMRUN (after being migrated) and thus will process pending
> +		 * interrupts, i.e. a doorbell is not needed (and the spurious)
> +		 */
> +		if (cpu != get_cpu())
> +			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
>  		put_cpu();
>  	} else
>  		kvm_vcpu_wake_up(vcpu);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
