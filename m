Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DF6C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 14:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8EA60E9B
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 14:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E8EA60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZLnytdoIOCughY/RNq55SvbCGPT6FIPj9kvWJJdRNs=; b=ZBveCKUr+TIdV2
	QjT0ud6JtaHRLiNAkPRz60OQueJz89uF4VgN+4xuSN+KGG68Zw0+UzhaPajNuCtKRLVxM84w1BDvb
	3MtiuekW9Yimj6KiBBOIm3O49V7kzgod13gXN8SUE3azsPwhQyYLH5/g1RSv0LmBXSVk1cG2IsCGK
	GUORwRRZE29/gCDNQYAtKypJCWVzlGzaBAhEtMSEMfJ6rNsZnh8vkVEn+Go/oNyod2N5pq1OOuL7t
	AySTDU1xYA0q4LY9tan5oj8C5CG9DhqdpEG1HJI6jxZFht/0EQ9MWsePyAUdeRZ5dtC3WAf9vDQah
	BWSPWIAVKrGgtYUChg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhCBN-00EEPo-RM; Sun, 31 Oct 2021 14:51:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhCB9-00EELW-E1
 for linux-riscv@lists.infradead.org; Sun, 31 Oct 2021 14:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635691880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWkqObtzatE8ZqTA7P0n9xOaXL3kRPYh9u09IqRGd+c=;
 b=Wupjguvd8R9WYamN/ILzDHXO5MTmIeCRjNILg5ocIEPI4et7KJIazkzXFE8Oq1FmrR9zU0
 4eUXab+q099MTToOMkMdDuiCVc7eLToNwzqSlUHvz0U/Q8vlDrfjaVgrZFjSCDQ1pwkP3l
 vUPUeRzRtZTk5FlzakcPMiPr/pS7B5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-hgIuyZhQNzuaYxdMVVu2jQ-1; Sun, 31 Oct 2021 10:51:14 -0400
X-MC-Unique: hgIuyZhQNzuaYxdMVVu2jQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C08418D6A25;
 Sun, 31 Oct 2021 14:51:10 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 885E65F4E9;
 Sun, 31 Oct 2021 14:50:40 +0000 (UTC)
Message-ID: <ca017e53bfa81d96dc534e395ff35b6899607fd8.camel@redhat.com>
Subject: Re: [PATCH v2 36/43] KVM: SVM: Don't bother checking for "running"
 AVIC when kicking for IPIs
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
Date: Sun, 31 Oct 2021 16:50:39 +0200
In-Reply-To: <20211009021236.4122790-37-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-37-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_075123_576591_CDC9AF04 
X-CRM114-Status: GOOD (  25.94  )
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
> Drop the avic_vcpu_is_running() check when waking vCPUs in response to a
> VM-Exit due to incomplete IPI delivery.  The check isn't wrong per se, but
> it's not 100% accurate in the sense that it doesn't guarantee that the vCPU
> was one of the vCPUs that didn't receive the IPI.
> 
> The check isn't required for correctness as blocking == !running in this
> context.
> 
> From a performance perspective, waking a live task is not expensive as the
> only moderately costly operation is a locked operation to temporarily
> disable preemption.  And if that is indeed a performance issue,
> kvm_vcpu_is_blocking() would be a better check than poking into the AVIC.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 15 +++++++++------
>  arch/x86/kvm/svm/svm.h  | 11 -----------
>  2 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index cbf02e7e20d0..b43b05610ade 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -295,13 +295,16 @@ static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
>  	struct kvm_vcpu *vcpu;
>  	int i;
>  
> +	/*
> +	 * Wake any target vCPUs that are blocking, i.e. waiting for a wake
> +	 * event.  There's no need to signal doorbells, as hardware has handled
> +	 * vCPUs that were in guest at the time of the IPI, and vCPUs that have
> +	 * since entered the guest will have processed pending IRQs at VMRUN.
> +	 */
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		bool m = kvm_apic_match_dest(vcpu, source,
> -					     icrl & APIC_SHORT_MASK,
> -					     GET_APIC_DEST_FIELD(icrh),
> -					     icrl & APIC_DEST_MASK);
> -
> -		if (m && !avic_vcpu_is_running(vcpu))
> +		if (kvm_apic_match_dest(vcpu, source, icrl & APIC_SHORT_MASK,
> +					GET_APIC_DEST_FIELD(icrh),
> +					icrl & APIC_DEST_MASK))
>  			kvm_vcpu_wake_up(vcpu);
>  	}
>  }
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 0d7bbe548ac3..7f5b01bbee29 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -509,17 +509,6 @@ extern struct kvm_x86_nested_ops svm_nested_ops;
>  
>  #define VMCB_AVIC_APIC_BAR_MASK		0xFFFFFFFFFF000ULL
>  
> -static inline bool (struct kvm_vcpu *vcpu)
> -{
> -	struct vcpu_svm *svm = to_svm(vcpu);
> -	u64 *entry = svm->avic_physical_id_cache;
> -
> -	if (!entry)
> -		return false;
> -
> -	return (READ_ONCE(*entry) & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
> -}
> -
>  int avic_ga_log_notifier(u32 ga_tag);
>  void avic_vm_destroy(struct kvm *kvm);
>  int avic_vm_init(struct kvm *kvm);


I guess this makes sense to do, to get rid of the avic_vcpu_is_running.
As you explained in previous patch, waking up a live task isn't that expensive,
so let it be.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
