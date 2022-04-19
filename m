Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9222AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqRaLBCPWt3npuarEOc+CPylrZ71Phf04hd8fhWuTWg=; b=hkPziES2/gTgJn
	0JdbdDc4agmhhfJfsE1bBZ3P0FJoM7I3Hv6PbiJHWvB37IuPgab74/iwWVb27OaciH2uQUfbIhGq5
	Ye36Cnq4GAradhngO1H5UCMQyH59E+xXSQIUXvsm49PH7o7uoH+g4FTEshqyo7ZZDppeHk4UwDk+o
	MhWrP50EOmIHO8ZedddxFI92j4S2JVEzH5zsShPpJLgZc81t8e24oC7BMmEZWNb2huQoBqHMCTb6L
	v8zjFeKTOM7L2bR5bAcj9jBzUd+ul+SIPDI2nVYb02NP0yJEIBSl0bzC9lhv7/EsOlawJ5RmbKhy0
	puzYNPvL7UUjRnUICZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngjed-002R91-NZ; Tue, 19 Apr 2022 08:56:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngjdx-002QnQ-UH
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 08:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAp+F+npHVI/LvkJesk2bVKFg1Wa6g6pN0S+Js80XoI=;
 b=d4VkmmEv1jRIZOHM2aCUREWUUQ5E0ITtDTcmHLBYr3tYrofzWLnlHFlVjlupJKd9qkSPse
 KgzF/tjFlrpEPEwTlZjLi7IMEsQMAGErNi67HE5kRcGiEYMWFAjoswSPfH3iWALIxr42fi
 9LN3HUP2WjGwm0OIK9aJNhGkLE8TPnY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-cvwRzkmxM9Szm0_kiSLc0w-1; Tue, 19 Apr 2022 04:55:24 -0400
X-MC-Unique: cvwRzkmxM9Szm0_kiSLc0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56EF3811F2D;
 Tue, 19 Apr 2022 08:55:23 +0000 (UTC)
Received: from starship (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 465364087D60;
 Tue, 19 Apr 2022 08:55:19 +0000 (UTC)
Message-ID: <204c7265de2d69ed240d18e30c7595702277cdbb.camel@redhat.com>
Subject: Re: [PATCH 1/3] KVM: x86: Don't re-acquire SRCU lock in
 complete_emulated_io()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Anup Patel
 <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, David Hildenbrand
 <david@redhat.com>,  Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li
 <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,  Joerg Roedel
 <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 19 Apr 2022 11:55:18 +0300
In-Reply-To: <20220415004343.2203171-2-seanjc@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-2-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_015530_163331_41EA7FA0 
X-CRM114-Status: GOOD (  17.64  )
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

On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> Don't re-acquire SRCU in complete_emulated_io() now that KVM acquires the
> lock in kvm_arch_vcpu_ioctl_run().  More importantly, don't overwrite
> vcpu->srcu_idx.  If the index acquired by complete_emulated_io() differs
> from the one acquired by kvm_arch_vcpu_ioctl_run(), KVM will effectively
> leak a lock and hang if/when synchronize_srcu() is invoked for the
> relevant grace period.
> 
> Fixes: 8d25b7beca7e ("KVM: x86: pull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ab336f7c82e4..f35fe09de59d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10450,12 +10450,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  
>  static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
>  {
> -	int r;
> -
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -	r = kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> -	return r;
> +	return kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
>  }
>  
>  static int complete_emulated_pio(struct kvm_vcpu *vcpu)

I wonder how this did work....

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
