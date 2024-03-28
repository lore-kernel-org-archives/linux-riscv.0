Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D3C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s3hYoUS/Vz+qyVvuLJombwlnHGzqANvhZGxHRANjm2s=; b=eTn8HXHK7ZEWdv4zHEWTJKLrXU
	/mzyF2/qOd779C3RKUiDciwvNatVOHiWO8ww83oG7/zASffx5+9SxAuECM6pzVmRsAJebZkoKo2P3
	avTmCJ7wHggRcjYJRlzCX/twtv8TsI6LowfcwfdJjb9NiVCFHYkcl/8SbVKrOSPZmVJoNAGbOuxSf
	bi79fbLqQwcYBH3JDU0+0ulXk9N8BiddnyjbPoT4OZId6rt6Q4gJTHu/HsbwCsI1y/KLpnkUc52cv
	aFgK3SxwshbP7wcntwG7VYXcn/2COB/MjMlPgUAmgxMmQcqXfP8WxInwXPB00c2L580HPCnjOU4DU
	b6LnUBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfry-0000000CAwQ-1GjN;
	Thu, 28 Mar 2024 02:51:58 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfre-0000000CAla-0lEf
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:51:41 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so619088276.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594296; x=1712199096; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPqMDjWy6wn0n2FZzL74JwLmXN+yXA5I0HEhcS2w7RY=;
        b=kqJM4bADyw2RmJ8hofINypFeDqCzLDY3b/O7Pq80aq/1fngZQPluw8Df1t2szSf1/9
         7flNU15+266wY9lV2PUFL+jWNwmAUyb8B40nfiTp6OM74wm4DinjGl9vnuPtOLyzvi7b
         kPV/pgjGHSJvUyVvAcdsMiK1Uei4VKMJrL3lk0A8S86PRqCJt131i49DU9B/RsC/EbBa
         9StrV/5m/431Fc/3yXax06RGnCuvJKorrS8v8yl1qihqgV28cSBaeo23ZWRsbd3c3XYm
         VhsT2qGxgin4XqbXyMIwPCB4cpx4Zzk/RABt0+Z+KSKmyaG+IgSVQ0sM4jj6De7bni/3
         Oe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594296; x=1712199096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPqMDjWy6wn0n2FZzL74JwLmXN+yXA5I0HEhcS2w7RY=;
        b=wsB0V9OmmtSIqC9H9ZJFhy7x88hqv4I931vQ1wsdsbKtdR73Y8ulYTO1HnnZCqidhk
         upXEjd6N5ymaS/XDLUQ+NX0UWuE/gsoHfWFF/wr/s2lidjQkf2c2E0EPLZAI9en2/00G
         fzC1DzNtH1hGvsmqpxz+hAkqUlVAL+1NUdWXst8kpQ7HpvHUtzRLhgPBCamVap6XGCEE
         urlmt6/UFiOkY509sYmt99eoB/pPBdfBS31VoaT494mafefXLhl6OObapdlWelHpLSj5
         Tq1nDAh+dwiBpYmfJ21ThXAOmML0E1xlpehelvIIUyvEidNOcQvIWmmeZHdWB+9nh2Gb
         ph1w==
X-Forwarded-Encrypted: i=1; AJvYcCUJFkrvMHVkBL4FDi+P98y2I2mRzKz1DvUQRxn4P5TJs8Fb8+NDyPM3zUvS2MZucEoMMsacfOmiorLqUM5wCJonDZuQAIaZ0g7QnddLAWxM
X-Gm-Message-State: AOJu0YwUxXU1B3laUdzoKAssaSuwkS6z4n6aEegcRyZCJIGTEibAgtgD
	UWUjx4iC/ewOVAKCqjcmqaynv3R+JeaYn/hrDZyoOUvs2DpHSsqNWTGDVnskpc6JMd1ohuKiUUm
	VfUv8j0fhW8vWncFzn8tvEA==
X-Google-Smtp-Source: AGHT+IGFZmR4DArDG/NiA9ExmfCagEMse7zkswaIi6bIPylpTBQr9g34FYNoKtBSJzzIGs2vwHFOUILMvq3sP4hMdA==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:1009:b0:dcc:8927:7496 with
 SMTP id w9-20020a056902100900b00dcc89277496mr155809ybt.5.1711594296369; Wed,
 27 Mar 2024 19:51:36 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:51:32 +0000
In-Reply-To: <20240314232637.2538648-18-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-18-seanjc@google.com>
Message-ID: <diqz7chnkr0r.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 17/18] KVM: selftests: Init x86's segments during VM creation
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
X-CRM114-CacheID: sfid-20240327_195138_381472_176B8A60 
X-CRM114-Status: GOOD (  16.41  )
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

> Initialize x86's various segments in the GDT during creation of relevant
> VMs instead of waiting until vCPUs come along.  Re-installing the segments
> for every vCPU is both wasteful and confusing, as is installing KERNEL_DS
> multiple times; NOT installing KERNEL_DS for GS is icing on the cake.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 68 ++++++-------------
>  1 file changed, 20 insertions(+), 48 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 67235013f6f9..dab719ee7734 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -438,24 +438,7 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
>  		desc->base3 = segp->base >> 32;
>  }
>  
> -
> -/*
> - * Set Long Mode Flat Kernel Code Segment
> - *
> - * Input Args:
> - *   vm - VM whose GDT is being filled, or NULL to only write segp
> - *   selector - selector value
> - *
> - * Output Args:
> - *   segp - Pointer to KVM segment
> - *
> - * Return: None
> - *
> - * Sets up the KVM segment pointed to by @segp, to be a code segment
> - * with the selector value given by @selector.
> - */
> -static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
> -	struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
>  	segp->selector = selector;
> @@ -467,27 +450,9 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
>  	segp->g = true;
>  	segp->l = true;
>  	segp->present = 1;
> -	if (vm)
> -		kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
> -/*
> - * Set Long Mode Flat Kernel Data Segment
> - *
> - * Input Args:
> - *   vm - VM whose GDT is being filled, or NULL to only write segp
> - *   selector - selector value
> - *
> - * Output Args:
> - *   segp - Pointer to KVM segment
> - *
> - * Return: None
> - *
> - * Sets up the KVM segment pointed to by @segp, to be a data segment
> - * with the selector value given by @selector.
> - */
> -static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
> -	struct kvm_segment *segp)
> +static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
>  {
>  	memset(segp, 0, sizeof(*segp));
>  	segp->selector = selector;
> @@ -498,8 +463,6 @@ static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
>  					  */
>  	segp->g = true;
>  	segp->present = true;
> -	if (vm)
> -		kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
>  vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
> @@ -517,16 +480,15 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
>  }
>  
> -static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
> -				int selector)
> +static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
> +				  int selector)
>  {
>  	memset(segp, 0, sizeof(*segp));
> -	segp->base = vm->arch.tss;
> +	segp->base = base;
>  	segp->limit = 0x67;
>  	segp->selector = selector;
>  	segp->type = 0xb;
>  	segp->present = 1;
> -	kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
>  static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> @@ -548,11 +510,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
>  	kvm_seg_set_unusable(&sregs.ldt);
> -	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
> -	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
> -	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
> -	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
> -	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
> +	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> @@ -612,6 +574,7 @@ void route_exception(struct ex_regs *regs)
>  static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  {
>  	extern void *idt_handlers;
> +	struct kvm_segment seg;
>  	int i;
>  
>  	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> @@ -624,6 +587,15 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
>  
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> +
> +	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
> +
> +	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
> +
> +	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
> +	kvm_seg_fill_gdt_64bit(vm, &seg);
>  }
>  
>  void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
