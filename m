Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8D4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 09:13:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5456E60724
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 09:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5456E60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lk1BD5XZg+VAcZQBMPD4qZPIGiqQnJw0WogGFoBbgt0=; b=UI5xpyajsWQdf7
	GjckTjSz2lvaKTScfASeh3V08pp1vgyi/hqnKK7o2hyTVk/UZnqN735srio5YHTO5WQSM/dO2uuCf
	VERI2Bb8UnyLVH4bXrFXB9GSGifvURtdeBgtdPkQAYi2IyU5OR3nS0e+35kiBYf/OSqNe1DCDUe8s
	FNFhWYywuN7a8R72UK1Wdgx990zo9JROXalwRrYUtvhRgx23Gg/Fd/oB3g7VJslbGZW19vmgGqDAD
	bVRJc7XOVu88rKYOUIm6pkIF9fnVKTGB3cAmWrb8PalXC7l6g2hcy8MT7fc8qcw54sYlOJ/mDgJVn
	tccBLMJYACPh6zefccSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1T0-007Lba-Fa; Thu, 28 Oct 2021 09:12:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1So-007LZ0-PQ
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 09:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635412365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1MWdjra8eZcIIlx8zcoZvMR0jtyOa/xjrbhOVDWvpc=;
 b=V8a5sB/JvhD+0u4HLs9/Gr4edBOkIui2t+oyYZ+cghAw1/Hq+cteD509Ue0t6KHzCrKos1
 AvzI4TWIaZMeP6iqW752YJpFgc+s5aKgU/hZW7zD+K9mMcqiD7IaI6vy/9BE7HO+/W9a1P
 7SF9adeb3+GF2wTxqMq838l1SVnw/G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-sp4eSFtgN52tnt6kECXjIQ-1; Thu, 28 Oct 2021 05:12:40 -0400
X-MC-Unique: sp4eSFtgN52tnt6kECXjIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE71D1966321;
 Thu, 28 Oct 2021 09:12:36 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4625A5F707;
 Thu, 28 Oct 2021 09:12:15 +0000 (UTC)
Message-ID: <c6c19d79bc8c7747d91a9dba1c1e671e9d138761.camel@redhat.com>
Subject: Re: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if
 APICv is hard disabled
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
Date: Thu, 28 Oct 2021 12:12:13 +0300
In-Reply-To: <20211009021236.4122790-21-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-21-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_021246_921233_9D85EF54 
X-CRM114-Status: GOOD (  22.01  )
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
> Explicitly skip posted interrupt updates if APICv is disabled in all of
> KVM, or if the guest doesn't have an in-kernel APIC.  The PI descriptor
> is kept up-to-date if APICv is inhibited, e.g. so that re-enabling APICv
> doesn't require a bunch of updates, but neither the module param nor the
> APIC type can be changed on-the-fly.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 3263056784f5..351666c41bbc 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -28,11 +28,14 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  	unsigned int dest;
>  
>  	/*
> -	 * In case of hot-plug or hot-unplug, we may have to undo
> -	 * vmx_vcpu_pi_put even if there is no assigned device.  And we
> -	 * always keep PI.NDST up to date for simplicity: it makes the
> -	 * code easier, and CPU migration is not a fast path.
> +	 * To simplify hot-plug and dynamic toggling of APICv, keep PI.NDST and
> +	 * PI.SN up-to-date even if there is no assigned device or if APICv is
> +	 * deactivated due to a dynamic inhibit bit, e.g. for Hyper-V's SyncIC.
>  	 */
> +	if (!enable_apicv || !lapic_in_kernel(vcpu))
> +		return;
> +
> +	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
>  	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
>  		return;
>  
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
