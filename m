Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B542CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jLBTzP1kcWWYHgXwta6ptLbZEemqwXKiI1mvMAzxCEQ=; b=iD6LdOwVlW7ZOdmFG4s4SVqLef
	41u4G6j90fuWHyVKSHVO5z4/zVVczwariyL51HYfqO137JOc8h8gMJsN2gVYTTEsHOnUHIRHIQMly
	PHpAqUmNUhcdllLpQqKfSsnIcD29cWw9aHNQLsRyM6tPRvbEFT3iqzuff8aIdQWztRbsi90LnkXcy
	7pK2afCIZE1xCL1l/D4KUYuEEOT6lQ8VEksrC8SPSDrOc/eyhGNWTSd2eOwUhbsFwR/8PCYeMv88A
	4KIYMihTZ0D3AWBqUy2IVsq7UOq4I/I/10n4kClf1TZ5tSUczduqV1TAMhlEKLh+STtlSAaDhU9n0
	yaBBmI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCL6S-0000000A2uK-3qzP;
	Fri, 24 Oct 2025 16:57:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCL6R-0000000A2tP-0MAR
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:57:24 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33be01bcda8so2347938a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761325041; x=1761929841; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCSFoTED+bN9czctrBnViFjaUxjZI+PzjY/BcjiPyhU=;
        b=BsrPW85jw5FAv9Oxya6bWz5auwwE60sVlJ4s1smVv8Bn87lTbXDmyNN3nL28SeaVT4
         /fnM/+EkI7sHsOfvF9ZIrH0hrC4I5qRBDSpNfwOcM7z6WmVfXH7ZiO5YTCUBhpQMHszf
         VoXG/E9S/AQySv6KTJOIeRDOKiU723dkEK219AZAQlAd7GYGnncktabqjL9+aQrnS+aB
         dffPt/neBAHmQYsxSZiFESE2V1gYNALtdeUy0NupVYWegJqTaG/Kup50/hfjeF4XWL4s
         xj6wYnEGDACvTQ9AsKi6qfjMIIajPILXGuij7+hrmmK3aB7ZGp2u0QAxAncoPvFmi9D9
         ZooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761325042; x=1761929842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCSFoTED+bN9czctrBnViFjaUxjZI+PzjY/BcjiPyhU=;
        b=rx6dbv85tyttgzbPusKUvIlowmvvPtZ7KEuFUkXNWcGwkbSJfE3RB7VxZG8DjtPyRE
         Pc1Jut7wHvGB2/xwdjAFpynQZvMvjm8cbI+BPu3dMJt3kZ4a/SGqb2Q+8fIkfCMdz7Y6
         0ufC9LZxOFlLPbe4UrHbRZmGLZkNrEWSVUjm4+bDF7r6vv3y8s27uAZNiinibvxnaa7B
         AuoKZAgAbGu8gtrTzqQoCDJQKPG8vJB4rWkBvv881E3QLi54EH/nUPZg/kFj9kROK/GC
         LRc+FttLzok63qZjQ1q1qPk67qf8NXLctpnunXkm4J7NTyHNQSrXbt53kFVDhO19qaU2
         30wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvb2QLx8XHdUqdxhFkGKckm+wpA2y5w0whfgr2tOjzDzRLHBBn69wRiUOiZsYZP6v6VzUJL9ACDNU1gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Y4ULNH0Fx/3yhYNnGunNOPtOzMjHcmKEuNeLdDN1l9DxILfS
	kE7/0N/nlbEYbNRwwX8fC+q2ZGhMBScoFdLbwLrdB7gqMwMdXbGw+jM09Sg02A+Z4vfxwCOTyml
	jcpfNEw==
X-Google-Smtp-Source: AGHT+IHXmSeD3kNK6POSE1hGR7Jvio0RnirzUH7WSrLaKZ09lPaFZJIUb09S/aBT/hnx0ZxmJITFzdMKVRo=
X-Received: from pjnu4.prod.google.com ([2002:a17:90a:8904:b0:339:dc19:ae5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48c8:b0:33b:ba55:f5dd
 with SMTP id 98e67ed59e1d1-33bcf93ab88mr32766320a91.37.1761325041555; Fri, 24
 Oct 2025 09:57:21 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:57:20 -0700
In-Reply-To: <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
Message-ID: <aPuv8F8iDp3SLb9q@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_095723_125195_F502ECAE 
X-CRM114-Status: GOOD (  21.62  )
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

On Fri, Oct 24, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:42PM -0700, Sean Christopherson wrote:
> > Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> > servicing ioctls that (a) transition the TD to a new state, i.e. when
> > doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> > state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> > the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> > due to racing actions, e.g. if tdh_vp_create() contends with either
> > tdh_mr_extend() or tdh_mr_finalize().
> > 
> > For all intents and purposes, the paths in question are fully serialized,
> > i.e. there's no reason to try and allow anything remotely interesting to
> > happen.  Smack 'em with a big hammer instead of trying to be "nice".
> > 
> > Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> > prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
> slots_lock to prevent kvm_mmu_zap_memslot()?
> kvm_mmu_zap_all_fast() does not operate on the mirror root.

Oh, right.

> We may have missed a zap in the guest_memfd punch hole path:
> 
> The SEAMCALLs tdh_mem_range_block(), tdh_mem_track() tdh_mem_page_remove()
> in the guest_memfd punch hole path are only protected by the filemap invaliate
> lock and mmu_lock, so they could contend with v1 version of tdh_vp_init().
>
> (I'm writing a selftest to verify this, haven't been able to reproduce
> tdh_vp_init(v1) returning BUSY yet. However, this race condition should be
> theoretically possible.)
> 
> Resources              SHARED  users              EXCLUSIVE users
> ------------------------------------------------------------------------
> (1) TDR                tdh_mng_rdwr               tdh_mng_create
>                        tdh_vp_create              tdh_mng_add_cx
>                        tdh_vp_addcx               tdh_mng_init
>                        tdh_vp_init(v0)            tdh_mng_vpflushdone
>                        tdh_vp_enter               tdh_mng_key_config
>                        tdh_vp_flush               tdh_mng_key_freeid
>                        tdh_vp_rd_wr               tdh_mr_extend
>                        tdh_mem_sept_add           tdh_mr_finalize
>                        tdh_mem_sept_remove        tdh_vp_init(v1)
>                        tdh_mem_page_aug           tdh_mem_page_add
>                        tdh_mem_page_remove
>                        tdh_mem_range_block
>                        tdh_mem_track
>                        tdh_mem_range_unblock
>                        tdh_phymem_page_reclaim
> 
> Do you think we can acquire the mmu_lock for cmd KVM_TDX_INIT_VCPU?

Ugh, I'd rather not?  Refresh me, what's the story with "v1"?  Are we now on v2?
If this is effectively limited to deprecated TDX modules, my vote would be to
ignore the flaw and avoid even more complexity in KVM.

> > @@ -3155,12 +3198,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
> >  	if (r)
> >  		return r;
> >  
> > +	CLASS(tdx_vm_state_guard, guard)(kvm);
> Should we move the guard to inside each cmd? Then there's no need to acquire the
> locks in the default cases. 

No, I don't think it's a good tradeoff.  We'd also need to move vcpu_{load,put}()
into the cmd helpers, and theoretically slowing down a bad ioctl invocation due
to taking extra locks is a complete non-issue.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
