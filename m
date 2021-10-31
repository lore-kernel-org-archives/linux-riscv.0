Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D61C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAE360C51
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDAE360C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmlzQK8ZFamqE86cwzdWjhCAiVgrnwPsWKU0+gVm9v4=; b=qzyVR1wIA31aZe
	bMhsNvn39M8RInRXAXiCnkup9bL4WFuJEUFtguak+mYrtGRkkzzagBQM1U3efGcHkettU4fbffmdk
	w1s2fadIjgefhMeuerv0V1JFQ+onjgafOnIeSR4m4z4rXCAHH1p52PF2d+068CtWKTvf7Z2RCDyhq
	y5cF92vgnYb44unNbhStcc4iDZv7j/Iln6xpGX3uLUXD6FE/wypVeLkHWFesqDlxGf3UFlz3cgQce
	2E0reCE2mWMWvEaG/a4ghvUzs786q8jcp/o/Awcksg5jXyH03Lknh3OVMR7jHJ3KvONXot5ALUPnd
	r0ZUAKaY6aJuUN2gL6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhJ7Z-00Emmq-0j; Sun, 31 Oct 2021 22:16:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhJ7K-00Emjg-DP
 for linux-riscv@lists.infradead.org; Sun, 31 Oct 2021 22:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635718552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+trWHtpu8oYBXENs5w3b/Qoz24VhlDIgpUGDh1mOJU=;
 b=XHcPXesaDsG+RV8jNnEYgLvztUOo9bsp/bYIdgNPkTYIaOtkp4tX6lQTAsrfTeeoN/8VhQ
 Y/6AIcnmE9wJDU1+Km8O9UBDOJnlvXp4hbNFz/j4ERq5T1ZKutGsxf2c4BRc8y8JgdC+uH
 /6lLDOBUv8VpIEnLK7Q1w6bu5G+IYag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-WYECgU2fMxmEks3noiYjYA-1; Sun, 31 Oct 2021 18:15:48 -0400
X-MC-Unique: WYECgU2fMxmEks3noiYjYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6428F801AE3;
 Sun, 31 Oct 2021 22:15:45 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292202B0B8;
 Sun, 31 Oct 2021 22:15:28 +0000 (UTC)
Message-ID: <592a315a8932b03f601e4c22d5846e97bd4a1103.camel@redhat.com>
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paul Mackerras
 <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org,  kvm-ppc@vger.kernel.org,
 kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Date: Mon, 01 Nov 2021 00:15:26 +0200
In-Reply-To: <fdf90c2f-81c8-513b-2e06-a90959f4cd89@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
 <YXl4mK7CyUBnPaQV@google.com>
 <fdf90c2f-81c8-513b-2e06-a90959f4cd89@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_151554_730032_B1D74F5C 
X-CRM114-Status: GOOD (  22.64  )
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

On Thu, 2021-10-28 at 00:09 +0200, Paolo Bonzini wrote:
> On 27/10/21 18:04, Sean Christopherson wrote:
> > > > +		/*
> > > > +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> > > > +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> > > > +		 * is guaranteed to see the event request if triggering a posted
> > > > +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> > > 
> > > What this smp_wmb() pair with, is the smp_mb__after_atomic in
> > > kvm_check_request(KVM_REQ_EVENT, vcpu).
> > 
> > I don't think that's correct.  There is no kvm_check_request() in the relevant path.
> > kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
> > without a barrier.
> 
> Ok, we are talking about two different set of barriers.  This is mine:
> 
> - smp_wmb() in kvm_make_request() pairs with the smp_mb__after_atomic() in
> kvm_check_request(); it ensures that everything before the request
> (in this case, pi_pending = true) is seen by inject_pending_event.
> 
> - pi_test_and_set_on() orders the write to ON after the write to PIR,
> pairing with vmx_sync_pir_to_irr and ensuring that the bit in the PIR is
> seen.
> 
> And this is yours:
> 
> - pi_test_and_set_on() _also_ orders the write to ON before the read of
> vcpu->mode, pairing with vcpu_enter_guest()
> 
> - kvm_make_request() however does _not_ order the write to
> vcpu->requests before the read of vcpu->mode, even though it's needed.
> Usually that's handled by kvm_vcpu_exiting_guest_mode(), but in this case
> vcpu->mode is read in kvm_vcpu_trigger_posted_interrupt.

Yes indeed, kvm_make_request() writes the vcpu->requests after the memory barrier,
and then there is no barrier until reading of vcpu->mode in kvm_vcpu_trigger_posted_interrupt.

> 
> So vmx_deliver_nested_posted_interrupt() is missing a smp_mb__after_atomic().
> It's documentation only for x86, but still easily done in v3.
> 
> Paolo
> 

I used this patch as a justification to read Paolo's excellent LWN series of articles on memory barriers,
to refresh my knowledge of the memory barriers and understand the above analysis better.
https://lwn.net/Articles/844224/
 
I agree with the above, but this is something that is so easy to make a mistake
that I can't be 100% sure.
 
Best regards,
	Maxim Levitsky



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
