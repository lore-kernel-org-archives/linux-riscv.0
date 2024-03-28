Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1650C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+aM6kDuO89FmEFSIhFPEcnzh3Txl644i4HrKcy4Ztzg=; b=GOZePP4PDnQW+OaRZRzf9w9jRd
	j+vLkaiBaFk1RGxBW2fDdeeW9BK5wb1gGVXHtQSYxzmOdzuQyhFs1qtn+CAh7rbWfiW53BOmZrnWL
	JPDMysy3fibXt+5VPivBnK7T7QCWL4qsArfwdB1VY+kT+GIcOfhkbq2Irs6k807pE1UViUB/k4Et9
	7XkkIIOnRJ6wI6F/7tSyb8feNdxKPpiXKioir+3hkWD/qpCGOUQbRMdWdg0xSnGM/2mm/8LubgFwj
	KFSNrGOU+0peYQnMmxNjE06CUT9+I+TO9nxntAnp8WU4PdX7x8/T8t09z68s7yJmPXrDjUTEvqMMl
	HH0FXDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfro-0000000CAqQ-0sCE;
	Thu, 28 Mar 2024 02:51:48 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfrN-0000000CAbD-3ys0
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:51:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60cc00203faso8981017b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594280; x=1712199080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Ns6gaSo4Qq0IcoiML7N509X1eCvl6xcmeeJxScUyE=;
        b=JmzCzoWjv7V+zjzeIgQc3LZhq1z05QwqUieB8cvqQjE/SDAL1isKJAk0hMQ8UioOfA
         DVtSdHu6aPTXQXy5wZDVkTPdvU21R4KVYRxCaT1itklAXq92ViHhTRx2304rrHedAPSk
         PJ9AFAyhBoAE+nn5WsYS4hSSpTMah+sAmM4+tpG5vq6KGpUowL4BtLGgz6Kf0zadvbT1
         qGd1C5UWn//rje+A2TIjPWMdzHLVcbLj8VoddAjaymaRdc4LUp+dZzSrew/gJOfr6nbd
         LBu4oTvpcqAKFH5kY5msqwXmO0BVBzHdlCsrh/iR9avdV25wqUr2oXloO8q7C1rpvyvY
         BmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594280; x=1712199080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Ns6gaSo4Qq0IcoiML7N509X1eCvl6xcmeeJxScUyE=;
        b=j7z1kxQM61yInIPu5n3bTaQO3NcgpIwanG/rDDdsCwzAs8YWw4GkMCJWS7O/3VubeV
         77ae77CcWoJkPYayADX1/CLW0Szx6iXjEoZd8+ndgukPYty0CkYFYi0t8PvQL1E1zgyF
         asOygTADggYhF2J3KPUjtG458dO2H53FW4YRK6m6RwgAcEIuBIq8n5+EfhjPnAtyr4LU
         ad4n8aFrfIv0EMTwvWkuHK0BCe8DtsNUtLWlA2Esd0RQ08RDzMmje+0L98uTlBEWRHqb
         XuJu1nWkP0Ai4pjwtTLZXIaWUd5sHx4Z5YJrIQhxlgH/IUgGD1Recp7ZdEl06WTbsxir
         K2qw==
X-Forwarded-Encrypted: i=1; AJvYcCVvQwuEEobp5+aciu21c1QnnHFN7JDP8HW2SktpKCPHj3V9KZJo9w953ZW6nJrNNnomnPPS1VtoZkR+kwhurkZ7vbUrvgP3pXiQagn5dAm9
X-Gm-Message-State: AOJu0YwhIiEjgEEKiNaY2IW8MKI6Pj5lhqwDBBERhEAjpKWV1d3AhfrX
	Au2XR8Tq/eHjQ0GBQ64rdonrDckr3dvPvSEZ2b9QELGCVt/nbWT4QTKHVFAhboJozjQkZQ7FcY9
	AWoHXkif6vI9hB43oCRw5lw==
X-Google-Smtp-Source: AGHT+IFq6RvNgKKDrmQGX8FbWbPutEMqrYZ/mRuBwk+vhXh9Fho0CVv4hcycTp/A4TYnzMSkOeSkeap9+3BP7uh0Rw==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a81:6d43:0:b0:611:7358:6fa9 with SMTP
 id i64-20020a816d43000000b0061173586fa9mr298635ywc.0.1711594279878; Wed, 27
 Mar 2024 19:51:19 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:51:15 +0000
In-Reply-To: <20240314232637.2538648-19-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-19-seanjc@google.com>
Message-ID: <diqza5mjkr18.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 18/18] KVM: selftests: Drop @selector from segment helpers
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_195122_328399_C1BBFFEA 
X-CRM114-Status: GOOD (  20.91  )
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

Sean Christopherson <seanjc@google.com> writes:

> Drop the @selector from the kernel code, data, and TSS builders and
> instead hardcode the respective selector in the helper.  Accepting a
> selector but not a base makes the selector useless, e.g. the data helper
> can't create per-vCPU for FS or GS, and so loading GS with KERNEL_DS is
> the only logical choice.
>
> And for code and TSS, there is no known reason to ever want multiple
> segments, e.g. there are zero plans to support 32-bit kernel code (and
> again, that would require more than just the selector).
>
> If KVM selftests ever do add support for per-vCPU segments, it'd arguably
> be more readable to add a dedicated helper for building/setting the
> per-vCPU segment, and move the common data segment code to an inner
> helper.
>
> Lastly, hardcoding the selector reduces the probability of setting the
> wrong selector in the vCPU versus what was created by the VM in the GDT.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 29 +++++++++----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index dab719ee7734..6abd50d6e59d 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -438,10 +438,10 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
>  		desc->base3 = segp->base >> 32;
>  }
>  
> -static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_code_64bit(struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
> -	segp->selector = selector;
> +	segp->selector = KERNEL_CS;
>  	segp->limit = 0xFFFFFFFFu;
>  	segp->s = 0x1; /* kTypeCodeData */
>  	segp->type = 0x08 | 0x01 | 0x02; /* kFlagCode | kFlagCodeAccessed
> @@ -452,10 +452,10 @@ static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment
>  	segp->present = 1;
>  }
>  
> -static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_data_64bit(struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
> -	segp->selector = selector;
> +	segp->selector = KERNEL_DS;
>  	segp->limit = 0xFFFFFFFFu;
>  	segp->s = 0x1; /* kTypeCodeData */
>  	segp->type = 0x00 | 0x01 | 0x02; /* kFlagData | kFlagDataAccessed
> @@ -480,13 +480,12 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
>  }
>  
> -static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
> -				  int selector)
> +static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
>  	segp->base = base;
>  	segp->limit = 0x67;
> -	segp->selector = selector;
> +	segp->selector = KERNEL_TSS;
>  	segp->type = 0xb;
>  	segp->present = 1;
>  }
> @@ -510,11 +509,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
>  	kvm_seg_set_unusable(&sregs.ldt);
> -	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
> -	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
> -	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
> -	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
> -	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
> +	kvm_seg_set_kernel_code_64bit(&sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(&sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(&sregs.es);
> +	kvm_seg_set_kernel_data_64bit(&sregs.gs);
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> @@ -588,13 +587,13 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  
> -	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
> +	kvm_seg_set_kernel_code_64bit(&seg);
>  	kvm_seg_fill_gdt_64bit(vm, &seg);
>  
> -	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
> +	kvm_seg_set_kernel_data_64bit(&seg);
>  	kvm_seg_fill_gdt_64bit(vm, &seg);
>  
> -	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &seg);
>  	kvm_seg_fill_gdt_64bit(vm, &seg);
>  }
>  
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
