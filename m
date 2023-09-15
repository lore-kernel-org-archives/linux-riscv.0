Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4240EE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YukzmYWKvRmE8ii2AkRCsJxORMFj/5TefPBNsi+L0OA=; b=xcO/E1ZXoI+7Vk49e7CEd70X/H
	PGkZFmZpdt/Zxar8dsjJ7J1n91kqfu/RzHffzrdGcah0aoVnC1ajfG1r1lZlDvtx8G3lrcJMY4ib3
	TJeAqa6zoPfxbmvDhUW87d9sl3K0wfnR83GwR0jdwV8arKww3wbXOY7QHw+buB+iKBeIVIdjr6fiq
	Zux40chibpY7jamm9E4Ly7sR6e/4XFt0LmwVBK4CADDOtEAKUtt+KFNUPLeUrY2KLksXZyYgsIdpV
	xaEZaCie+dQpD5c7U+qshHyAhPSBueSuT85xutfhJj0Tj5rvhh96FZTCmUzcwHpg0S7lgZp2pxllY
	YqhM2yzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9m5-00Asl2-1m;
	Fri, 15 Sep 2023 14:26:25 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9m2-00AsjU-1w
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 14:26:24 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59c0dd156e5so8652417b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694787978; x=1695392778; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wwM0IxTv36mTuzbjanMwII1EwyeoxiFmog5O5ddM4=;
        b=zR2R+ZSkVaF2g3NyPF2akT0g6EfFKyrPgEz2+uuSIuO2H7yevH/SloMDdK4DAbmojE
         8N5Twa/+clARRajQWBi0kkUImlsqowooiNPcgltxKFzAfuDCL+wrOUxMo76M/29twGIr
         1A4jPIDs5YQr6ffHsylqPGla9qtoXTDnf3LnLwh8j+I3WM7jv+3EInSepuQNVmHXBEQs
         qEFzcy4UZsEloBbK3Pr+tDtvUq0gfEmf/cKh3wmNuLSZoZXwKP/sMMRd4WGgPNSLWwdY
         s+Whn3oJ9s+X7kgKMcOQrezrhqdsgDM818hDznlfvhw+1c+M5dVWcuGRSoTC7QTCFmv7
         zPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694787978; x=1695392778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wwM0IxTv36mTuzbjanMwII1EwyeoxiFmog5O5ddM4=;
        b=MoP/Pb22Dp6FffCZqp5fg2I4vsPI8u/bwUy2nCkHFXxpBOAETKey8UcjRROOFSuToJ
         4oIE1UWFS1KraUvRepoZWiUEU3Fa4srwn4iLbkWvOO54xqgj3NT5HVGQMsQzfmUm4TyP
         Um1sC161/s9yBqzB9NodYmIG8Kd8xfN7vqmWChB5ufX2gdCjf65EzTQZyu5IW9n3yiou
         YFXKJJJByecFOyhgJJTSFT3+H0iPyZprF1WQoywMIVoFxH4H2uJtqlc9d5fY5LUqW716
         CRT4zHpEB7p82GJLUK8Yns72ef6CTDYa8CHYzwIsS7ay1jBZc3nDxq7kUbmWvoADavgh
         POUw==
X-Gm-Message-State: AOJu0YzC5VemUr+kwIPixfptjgs2Kid1/d9OzQgSeQ8xbJafp+B78xyR
	6WjjrCcJzGeLsQ6cCzKgaWucFqmAf/c=
X-Google-Smtp-Source: AGHT+IEtd+ZFiwjGOxGj1IwoYm6uY+zMlhHeo3LWWwltDCF+cgsfqNfOOXS7Bflkew1pSHX6ZJTGM/96YR0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:bc8:0:b0:d80:eb4:9ca with SMTP id
 191-20020a250bc8000000b00d800eb409camr37310ybl.0.1694787978719; Fri, 15 Sep
 2023 07:26:18 -0700 (PDT)
Date: Fri, 15 Sep 2023 07:26:16 -0700
In-Reply-To: <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-19-seanjc@google.com>
 <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com>
Message-ID: <ZQRpiOd1DNDDJQ3r@google.com>
Subject: Re: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for private memory
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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
X-CRM114-CacheID: sfid-20230915_072622_684484_6A841D57 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri, Sep 15, 2023, Yan Zhao wrote:
> On Wed, Sep 13, 2023 at 06:55:16PM -0700, Sean Christopherson wrote:
> ....
> > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +					      struct kvm_page_fault *fault)
> > +{
> > +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > +				      PAGE_SIZE, fault->write, fault->exec,
> > +				      fault->is_private);
> > +}
> > +
> > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +				   struct kvm_page_fault *fault)
> > +{
> > +	int max_order, r;
> > +
> > +	if (!kvm_slot_can_be_private(fault->slot)) {
> > +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +		return -EFAULT;
> > +	}
> > +
> > +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> > +			     &max_order);
> > +	if (r) {
> > +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +		return r;
> > +	}
> > +
> > +	fault->max_level = min(kvm_max_level_for_order(max_order),
> > +			       fault->max_level);
> > +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> > +
> > +	return RET_PF_CONTINUE;
> > +}
> > +
> >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> >  {
> >  	struct kvm_memory_slot *slot = fault->slot;
> > @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  			return RET_PF_EMULATE;
> >  	}
> >  
> > +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> In patch 21,
> fault->is_private is set as:
> 	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
> then, the inequality here means memory attribute has been updated after
> last check.
> So, why an exit to user space for converting is required instead of a mere retry?
> 
> Or, is it because how .is_private is assigned in patch 21 is subjected to change
> in future? 

This.  Retrying on SNP or TDX would hang the guest.  I suppose we could special
case VMs where .is_private is derived from the memory attributes, but the
SW_PROTECTED_VM type is primary a development vehicle at this point.  I'd like to
have it mimic SNP/TDX as much as possible; performance is a secondary concern.

E.g. userspace needs to be prepared for "spurious" exits due to races on SNP and
TDX, which this can theoretically exercise.  Though the window is quite small so
I doubt that'll actually happen in practice; which of course also makes it less
important to retry instead of exiting.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
