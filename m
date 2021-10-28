Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB31FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 11:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79CEA610F8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 11:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79CEA610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iw4WGWVEuFgXXE6EXa7v87tOKZquKTrnp9+KhAbtRIg=; b=u1UKiSbMc/rjCS
	F3s0RS9jj55JGU6LoDl+22F5Svus4HSidvLFREhlNBIhXM5bACk27env1B0rcDLg9QC/7TL1bz9jN
	K3Z82QqwxZQgzWDevqwrPtgAx0XOFYyY+sktFGGj5GaGsH0j5XZLL0wgGmmpO93z5q0FpIbGMBX4W
	QDm2OqVfdpMoHlMQrdlJqdz2+wrhVBXOU65DFYnF0rkCNg9YMW1o6aevUmQDhhBV6xmxsKnotuDe+
	vV/vsoOLhFaLLE0HViQc6d6aaRWcquwffV4WOvyU0YtR1AaMdWJ1fZxWEA58yF81WJC8xTBzLpneT
	wzW42YsJmnXRzPpjqKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg3aj-007goz-2S; Thu, 28 Oct 2021 11:29:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg3aW-007gmp-SB
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 11:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635420532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHpIfrYfSW8Oruu5gZzONXfOs5cqhayPI05VEPrlFqI=;
 b=ZXK1SsScmTgtnETpIVi2QXHMMs18RzTZPLNJsMQPBJZrv9133Un6zEiD04wYDmRLk8iqrN
 iuZX4yT7S6TUZoHT9hESffo8pukWCq5lQV0yzXImlSkMPgQqKPN/CyfuhIr/OGE6dxfDS+
 vegJ1oDUxlGxo3f0//TYGU5zmJ/np9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-eJZbxn5mNyK61ySDSBCRrA-1; Thu, 28 Oct 2021 07:28:46 -0400
X-MC-Unique: eJZbxn5mNyK61ySDSBCRrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9359F92B;
 Thu, 28 Oct 2021 11:28:42 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 108AF5DA61;
 Thu, 28 Oct 2021 11:28:30 +0000 (UTC)
Message-ID: <643d9c249b5863f04290a6f047ea1a2d98bd75f9.camel@redhat.com>
Subject: Re: [PATCH v2 27/43] KVM: VMX: Move Posted Interrupt ndst
 computation out of write loop
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
Date: Thu, 28 Oct 2021 14:28:29 +0300
In-Reply-To: <20211009021236.4122790-28-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-28-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_042852_995075_9B50B703 
X-CRM114-Status: GOOD (  20.45  )
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
> Hoist the CPU => APIC ID conversion for the Posted Interrupt descriptor
> out of the loop to write the descriptor, preemption is disabled so the
> CPU won't change, and if the APIC ID changes KVM has bigger problems.
> 
> No functional change intended.

Is preemption always disabled in vmx_vcpu_pi_load? vmx_vcpu_pi_load is called from vmx_vcpu_load,
which is called indirectly from vcpu_load which is called from many ioctls,
which userspace does. In these places I don't think that preemption is disabled.

Best regards,
	Maxim Levitsky

> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index fea343dcc011..2b2206339174 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -51,17 +51,15 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  		goto after_clear_sn;
>  	}
>  
> -	/* The full case.  */
> +	/* The full case.  Set the new destination and clear SN. */
> +	dest = cpu_physical_id(cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
> +
>  	do {
>  		old.control = new.control = READ_ONCE(pi_desc->control);
>  
> -		dest = cpu_physical_id(cpu);
> -
> -		if (x2apic_mode)
> -			new.ndst = dest;
> -		else
> -			new.ndst = (dest << 8) & 0xFF00;
> -
> +		new.ndst = dest;
>  		new.sn = 0;
>  	} while (cmpxchg64(&pi_desc->control, old.control,
>  			   new.control) != old.control);
> @@ -103,15 +101,14 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
> +	dest = cpu_physical_id(vcpu->cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
> +
>  	do {
>  		old.control = new.control = READ_ONCE(pi_desc->control);
>  
> -		dest = cpu_physical_id(vcpu->cpu);
> -
> -		if (x2apic_mode)
> -			new.ndst = dest;
> -		else
> -			new.ndst = (dest << 8) & 0xFF00;
> +		new.ndst = dest;
>  
>  		/* set 'NV' to 'notification vector' */
>  		new.nv = POSTED_INTR_VECTOR;



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
