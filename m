Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F40C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7769D604AC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7769D604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R34XqV8qsTNi8pNZpFrZoE1GBXgUHrDH98YSQiDbMKM=; b=19+YJnV4oXm3LA
	R9Pj4XXA5/gc6gdLJO31lkwShM7Ei2zVp/rIkagtlPk/xy80+6AMSXVOUJJuP9Mx1VZg+RTXtmHQx
	ng6yRiL3lARLPUpROdXLtAC949VWMvw0ngkPZzXk3gWU3Kr9m5+GNSoYA8oe0grIDxbbrOiY8haGt
	WTCjikJmrlPHvQyzYIhIW77Y7ZOEV03MVgw0LDsTnC/K9rrDhBSBOvU7BCW8e/NJ3dxQ61dA6OtbQ
	4zAxzUasOhrPf7QyN1UKjHQScuOL3VvWKkhzdZt9jGPinsvpgintOPeQ8m63s9xdzr8N43QJJ5YHo
	sOU77keKQtUeNzHvCCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfkWA-005EkG-CJ; Wed, 27 Oct 2021 15:07:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfkW7-005Eis-7Z
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 15:07:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 187so2980429pfc.10
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O5lEF3hXOuOGQ36jWeA5WrZK+395dTI4kUNN+CFJhtE=;
 b=GJjlg8jJfw+Bt9Zd0zP4mtqcSM31wSFBYCetU17CHbzQQW4kiFtHDgsZBVvEH8887p
 yw/Js4mEDuANgaxd1QymvaNpmXbEvaNRm2HNB868WPSRynugBhM6LN65l++VZht0g2X0
 XFMEItNS+WJlFOOOZlwyo5ghqOI0eoYdx8EfG7dg89d25ghzdUn9Jr0jTft3rzInpzui
 t+nhlFj3SyV2ez0xA0qiaGWyaH3JZAU5KHIJMn2b+NEmBeF/xDfhUhjIDnEt41PMETob
 dNlEs4TAu5VbQ+MRxeaG1Cc4kLdotzXGkh/U5A20JnxHgI8kyVG06UiAaMfvZtmJbPiD
 c4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O5lEF3hXOuOGQ36jWeA5WrZK+395dTI4kUNN+CFJhtE=;
 b=BH7B9xhgxXxanWQXR5s1ZoT+AGPGaL3qQuMLHkEJU+xPj6VInqE6a15oeHt9H/+Zz9
 Cri1oDrD/9Cv36uWxwUV2DF4YrhS4CA7W16gFzlYX0Sw3KYp4CP9urRgduOjSFWgH52G
 Hg1ckph+ZDlhMA+bHf1mCOtvyxqIsGhHvpFZqKGLV/ulrwcV19w5w6Mbid+IHmkJH3XO
 a6Ryg4NgYY6sxt4YAqHD54jMI300UxOWDSGs/sNnne+X0QfmP2k6Gv2tgpqkxLD0aWPY
 xfa9fDr5lQQEVD3BKIITUlI5RDRKBdhDKNN5YLIDxM8t+E2ny6Y2xC8VJGAIOxopY1eQ
 3Kcg==
X-Gm-Message-State: AOAM531G66vO8aQuGxVt3p3+11Qi1A9ZZL0FDfqyJ3r310DAy+arNQkO
 LUYkoOxOg6fm56c0baNtTgIM7Q==
X-Google-Smtp-Source: ABdhPJyFiG0oaOa31Ni2mfE2COsoLS8wTaHHbwW9HjhwNmX9PoY62hBCx/P2f3tKT436xIXd6QXjiA==
X-Received: by 2002:a05:6a00:15c9:b0:44c:a998:b50d with SMTP id
 o9-20020a056a0015c900b0044ca998b50dmr33155514pfu.49.1635347221673; 
 Wed, 27 Oct 2021 08:07:01 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x15sm310904pfp.30.2021.10.27.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 08:07:00 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:06:57 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
Message-ID: <YXlrEWmBohaDXmqL@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_080703_303430_ADE62FC9 
X-CRM114-Status: GOOD (  18.45  )
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

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +	 */
> > +	if (vcpu->mode == IN_GUEST_MODE) {
> >   		int cpu = READ_ONCE(vcpu->cpu);
> >   		/*
> > @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >   		if (cpu != get_cpu())
> >   			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
> >   		put_cpu();
> > -	} else
> > +	} else {
> > +		/*
> > +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> > +		 * pending IRQ when checking if the vCPU has a wake event.
> > +		 */
> >   		kvm_vcpu_wake_up(vcpu);
> > +	}
> 
> Does this still need to check the "running" flag?  That should be a strict
> superset of vcpu->mode == IN_GUEST_MODE.

No.  Signalling the doorbell when "running" is set but the vCPU is not in the
guest is just an expensive nop.  So even if KVM were to rework its handling of
"running" to set the flag immediately before VMRUN and clear it immediately after,
keying off IN_GUEST_MODE and not "running" would not be wrong, just sub-optimal.

I doubt KVM will ever make the "running" flag super precise, because keeping the
flag set when the vCPU is loaded avoids VM-Exits on other vCPUs due to undelivered
IPIs.  But the flip side is that it means the flag has terrible granularity, and
is arguably inaccurate when viewed from a software perspective.  Anyways, if the
treatment of "running" were ever changed, then this code should also be changed
to essentially revert this commit since vcpu->mode would then be redundant.

And IMO, it makes sense to intentionally separate KVM's delivery of interrupts
from hardware's delivery of interrupts.  I.e. use the same core rules as
kvm_vcpu_kick() for when to send interrupts and when to wake for the AVIC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
