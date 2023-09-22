Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48058E6FE38
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l8VmnbGGe1p664P6PyEtkQdQDP0EB6IiIJ96/dGiTmc=; b=fmii43GwaJqGm21NscSW35xC5e
	jwy/kAVNkl+1ObxVvPVEdfx613VuoyVsqrEwGkaySBPKt9Vgzz8zfmpZgWn0kT+lcx/fDC96s5F1M
	Y4/tLgJVjHARqNdSUGCf1DcfT2HqRHoauc55vIHBkF+Z+mcm7AoIzqJ+OSPg3NLGXwSxWI2XKOLyS
	9CrcSL/48wyh+a6uYpHf1lCC6LYdrcOwzN806flIOHDusLn6rPhTshLBwR1NhcUGAeXamYxMoSnky
	nvb6CC8DsfK4SdJaXjO/APDvwMe/uDuUs0z6QNpAHx47W3+q2gOrsQvxsMKy1qDl79Y1uoPMgDeHs
	8RdgkUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhBA-009Clh-1Y;
	Fri, 22 Sep 2023 14:30:48 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhB6-009Cij-17
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 14:30:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c40ac5b6e7so17775105ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695393040; x=1695997840; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5pwz3/DRQHr6a2ee4M3bjnbEYA57TwsoBM67hI6zU=;
        b=oGFdt5ZoSOtfQY/E9eQAlqh6boMh9E/NI0mstDro2N/fEjR2lpRyORybF/OE8vC/0u
         xybya70aLjhWPyOv3LsOQbHcJ+sq5oIC55IqvSzUv4tkgBdS2oWTE/rpGchmukGn+1Fb
         G5urGs+JquZJs4VfROrtgt0Bb/STfesPwwD5TygD5C2gz180lHm1kneIzUElFtQ7qETY
         wFKkqul9rGpi91IAgn9+9OrisB2xzA+oc7Kgc7Q14a7WO+9RfX0x5iyq/PbHqUBReKNe
         HcR1m0fDVkGm/3b092qm2WVVF1JYjfC4RrACJKJhSfgjvt1VtO1Y2DLI7FzWUeUYMl6R
         tw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393040; x=1695997840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5pwz3/DRQHr6a2ee4M3bjnbEYA57TwsoBM67hI6zU=;
        b=aUKFscPmpqtPXq5ieRelpztdv9k6MTwC/QjyRL+1g72Z5OSGMmA6Qb8hlYdqWIxTpD
         wZ/ujIgIiEti4dUOnS9941Oi0OKoSHR8AMQJPOaDED+StpLHIW62rYQ15/rFEBhCXeIF
         LKtlXqDEQFdle6BUdjYwAjDaIT2ywWL9QIevdje5ZXABZZdj6cAr84+74hnv5/GOzrev
         0DbZMDTKEXgzDjk7l0Lc1VlIFn7ZNstpvOFIBqHUwmJ2mxn3YtZTXTZPuen/o7P0j8ET
         esYCbD/qrlXWrYAV8acT7t7tF8rjHIDtxV3NV0VqYJ9dWB0KkRqxq7jGdeFNbV9iKUlB
         6lmA==
X-Gm-Message-State: AOJu0YxcpcSrkz3Q2k4pc0RMjCs/WQe7snV8JI7gvSY/ZLiutbek22UD
	gV2db+DdK2qltKHTY1ujU5JTnxwAkZo=
X-Google-Smtp-Source: AGHT+IE7TdAMSox3QZ9i3XY42vmW+YqwJtHLDXCrkzOQDSyIHqr/K/m4w9DaaKuedrPKXRX2zXN/sfp+lRA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1cf:b0:1b9:df8f:888c with SMTP id
 e15-20020a17090301cf00b001b9df8f888cmr102903plh.8.1695393039713; Fri, 22 Sep
 2023 07:30:39 -0700 (PDT)
Date: Fri, 22 Sep 2023 07:30:38 -0700
In-Reply-To: <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Message-ID: <ZQ2lDk3iOEz8NNg0@google.com>
Subject: Re: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_073044_387730_C0BD3A41 
X-CRM114-Status: GOOD (  27.89  )
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

On Fri, Sep 22, 2023, Xiaoyao Li wrote:
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> > 
> > Add a new KVM exit type to allow userspace to handle memory faults that
> > KVM cannot resolve, but that userspace *may* be able to handle (without
> > terminating the guest).
> > 
> > KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> > conversions between private and shared memory.  With guest private memory,
> > there will be  two kind of memory conversions:
> > 
> >    - explicit conversion: happens when the guest explicitly calls into KVM
> >      to map a range (as private or shared)
> > 
> >    - implicit conversion: happens when the guest attempts to access a gfn
> >      that is configured in the "wrong" state (private vs. shared)
> > 
> > On x86 (first architecture to support guest private memory), explicit
> > conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
> 
> side topic.
> 
> Do we expect to integrate TDVMCALL(MAPGPA) of TDX into KVM_HC_MAP_GPA_RANGE?

Yes, that's my expectation.

> > but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> > as there is (obviously) no hypercall, and there is no guarantee that the
> > guest actually intends to convert between private and shared, i.e. what
> > KVM thinks is an implicit conversion "request" could actually be the
> > result of a guest code bug.
> > 
> > KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> > be implicit conversions.
> > 
> > Place "struct memory_fault" in a second anonymous union so that filling
> > memory_fault doesn't clobber state from other yet-to-be-fulfilled exits,
> > and to provide additional information if KVM does NOT ultimately exit to
> > userspace with KVM_EXIT_MEMORY_FAULT, e.g. if KVM suppresses (or worse,
> > loses) the exit, as KVM often suppresses exits for memory failures that
> > occur when accessing paravirt data structures.  The initial usage for
> > private memory will be all-or-nothing, but other features such as the
> > proposed "userfault on missing mappings" support will use
> > KVM_EXIT_MEMORY_FAULT for potentially _all_ guest memory accesses, i.e.
> > will run afoul of KVM's various quirks.
> 
> So when exit reason is KVM_EXIT_MEMORY_FAULT, how can we tell which field in
> the first union is valid?
> 
> When exit reason is not KVM_EXIT_MEMORY_FAULT, how can we know the info in
> the second union run.memory is valid without a run.memory.valid field?

I'll respond to this separately with a trimmed Cc list.  I suspect this will be
a rather lengthy conversation, and it has almost nothing to do with guest_memfd.

> > +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
> > +accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
> > +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
> > +kvm_run.exit_reason is stale/undefined for all other error numbers.
> > +
> 
> Initially, this section is the copy of struct kvm_run and had comments for
> each field accordingly. Unfortunately, the consistence has not been well
> maintained during the new filed being added.
> 
> Do we expect to fix it?

AFAIK, no one is working on cleaning up this section of the docs, but as always,
patches are welcome :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
