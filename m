Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAE8C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P56eaWav/yNlQ9XmS+dZ6ztqkei1RNxva1ZrRwRAqTg=; b=wxmL8Ripa4Zm5+vvM2OQqkwASI
	1EEiYR8zYzhDrEWARHnGpPEc6jNgHPp+ZHJdjWyWDibeawFJhzazz6m0Jiz8u5QXboN64+TF6p8hp
	Ek2BPb8oTRoZdKotHotlrp3An1pZJe8H//tqxxFqigtwOLDrKy4eK2XmP5m9ud6z/LrMpR2t3yTai
	WqI2GM+RpCuMILI3H6MaTzPKm68XB+LX4hMlqVx6fuSXzrJmIheiFIGFDFk1h/6jid2LbcaWOt6Ky
	dM1HoWu+yy2hDduMAjsNIqFUH61uMuaMo0gVU9PHrR/vcXLQUPduMsOjHIetwC1f3XIrJKZX4m/zZ
	kzC6FTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZa7M-00000006Kww-08dL;
	Thu, 01 Aug 2024 18:01:36 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZa7J-00000006Kvf-0MpA
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:01:34 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7163489149fso7121678a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535292; x=1723140092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=aQu0+UwbG8BXEUc8XDf29o2aZ0+j4j3tTNEO1v5CDh+5j6VpC+LqyVnVLKjCyGvf42
         yfTHyoMEW+m4JV4vj+GNm2/j5BVY+mQJQM7jN2C1LS0W9BjsdOGRlmPuvvc7G4393qL+
         Kuch1GO2hcl2XdT3KDMiH4a96WrLnsgvlz297gYxYgyShOauiFgJkTTQHY03/zf5+Edw
         ghEOwVHu4Y0qC1q8UEXQkJ2TY1Ze6U4k000u3aMjKg1T3AJ3jIWIX5qAJhAVoNl/Xfq5
         3vbOSlKK4jjUeY5F6ThfbJGOCCcsr0WwlIhZqXc555eGK+c6E+mrXaHexQ6hfHuxGDL1
         VZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535292; x=1723140092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=Bs787peVyBz9tbxZSsd0GF/Ygcn4sHezapaU+NlWrG8SQ34Ao6uj+Y3ci2/OjRJQ6u
         TG1pVYYrMArNJTk8XQsP7aC1//QXxo7oG+sm1niUBP3Idqk5AqDjh5nVTcEnb6zqG+FZ
         ii/ISCGSF/plIXsc0Fq2Cop0uq8jYjQskDJwAtOB1IK/G4Z5+LG9ZRfL9dh74Ww/7m37
         FCHzvBm8jv3iAga148od7lk3T1KAojNggG63BJX6yqGZf8n7ypPeoYl9X67kjkCEZ/LO
         n5wRoeHAK4GNlz5AKW1sLeJs4/PpInzaEKkATLVc02oJyLaFrn/3DQtpgkDinA0ewX/+
         qYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIEkvTzGrwqj2teEiNEZc7p7IVGGCcapjQkW7B12qaRtZ2POrQJzmEoDPH0EhprqkIugDw/JejxogTnxr9VIa6jBKu9sSRY00SC+KniGPk
X-Gm-Message-State: AOJu0YyMhUPob4Nos/BqwJBDy23nCCssLk0RBlvL0f+1J8eTAe2VzZB5
	+xxEQ4ZV85xBBeuAPkgcaI164gC6Jc+27tnaLW2hutMyIt4e81kfpdJ8GngXVEo5yTpVA0WCPrA
	jtA==
X-Google-Smtp-Source: AGHT+IF64U8Ib+bNIe3iPxoSzJOvvilQGXPjPZq7Y/8acNPwlcg0hACHnvmYPGnFv3dx9aufX4l27GJDySU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6252:0:b0:75a:b299:85b6 with SMTP id
 41be03b00d2f7-7b74669c7b3mr1534a12.2.1722535291408; Thu, 01 Aug 2024 11:01:31
 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:01:30 -0700
In-Reply-To: <yq5aikwku25o.fsf@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org>
Message-ID: <ZqvNekQAjs-SN-se@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_110133_149652_F022DEDE 
X-CRM114-Status: GOOD (  19.79  )
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

On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> > writing guest memory without marking the gfn as dirty in the memslot could
> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> > and presumably the only use case for copy MTE tags _to_ the guest is when
> > restoring state on the target.
> >
> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/guest.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index e1f0ff08836a..962f985977c2 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >  
> >  	mutex_lock(&kvm->slots_lock);
> >  
> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >
> 
> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?

No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
relevant.

> Should all those pin request fail if kvm->nr_memslots_dirty_logging != 0? 

No, the conflict with dirty logging is specifically that this code doesn't invoke
mark_page_dirty().  And it can't easily do that, because there's no loaded ("running")
vCPU, i.e. doing so would trip this WARN:

#ifdef CONFIG_HAVE_KVM_DIRTY_RING
	if (WARN_ON_ONCE(vcpu && vcpu->kvm != kvm))
		return;

	WARN_ON_ONCE(!vcpu && !kvm_arch_allow_write_without_running_vcpu(kvm)); <====
#endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
