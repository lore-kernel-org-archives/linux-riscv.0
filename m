Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C2C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RRHEk/RKSjptxUGYwisg0TMI9YbE/74wEjw0r5nvlhA=; b=vyRxPNk5O6zo57cNuc2bv64MGV
	qcaqUJi9Sk6sSnsTabngOGiTyGnTORiuNqLVeALBD5eATmyhjcSFf2eD6S1Qz3G2h6xEkvpQqOpOl
	UmkDn6SUZiE855yWK6QX6WDslXdV1ssLArF8AE8Kh4dcyFAldPbVFhzD/My80zyKGAjsK19EoYYic
	Cc3xjayjr2ELvmRBe+GFz9CLANHoNgP+7z6l1azjLG4mSuxjsCvnaf9Wu4sROag8ScwC1ZaEZ0yB6
	0E54astvu8LFG8fcygMiDV6Y/iZgxoLyAL1z1k8PgfAija0Y6/sKqgyBDv8SK+PR24/hFSa1GSI+r
	wlm3IOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfni-0000000C99B-33BO;
	Thu, 28 Mar 2024 02:47:34 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfnc-0000000C93j-2KEk
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:47:31 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dd169dd4183so635514276.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594047; x=1712198847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqOjNlVyt9f+dZUymfqOg4Iq2ntY8mdLHefZitivNvA=;
        b=NRJDBfELpipZWmsjXlPRhhb5S9n2QBM7JdFo/ME5c6otVayi+3vHGmEtpiDkAmoIEe
         uJRXFnJDnfoUVMGK7xj8s/I8w9ZKSkP6CI8lsdDUaeMZbbqeGEp/lJUguuESDyaMg4KD
         08/8c6IYJMYiOAT6e89RIm1rZfLflmK1VC9fiHALneCSBMTvWOtWCTTIIDWcDGyDDFpF
         u9PerVHeSyiX5fC66R+9kOLdd/ZK4lTvIJyQgBTUCwcAcu3BLZ6En/hzsBAnWadqVmiO
         6fGIRyt9nJxnE3pUodfSCvbTPqe5dkYIs/94LC9dpV0xHjqt/ylSqbR5huPfWhfu21d5
         SE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594047; x=1712198847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqOjNlVyt9f+dZUymfqOg4Iq2ntY8mdLHefZitivNvA=;
        b=wnIu385cXN7/OsxXRTXHQpmkDvg7R69LCgxqWbYzaPCgCNOjLXS+l0weFXcDG+UBRg
         5UcvyuJGukBQGHiyDTD0Ol+GUpOhW1324usWcgTpXiTYoIRhPykDZ0iTIv4BeVjGHsIZ
         FualDOu9yMhluzN/UQZwv9JIsoPAI1OrulZw5sIKYNcQlqrAhtns/mKt5KOZE7s1hWEf
         FSvp3ZzJ797Fk81rjWpyRkJngnCGup5uK8zJg1q4EXanU/lWzk+5eepU+kjyTS4BuVFt
         38dlbWq/YdF+xmd3YcNPhNH3pkjyO1hqCqu0GKudYqp0wf8ngGzaoU0VKuyxeYcx8Wmz
         51Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXZr6j3jUuOtPOYg+MtUEiUGiSG/esyZzxUZvSO7o1upPk9rlD3nICo6T5mnAKLHJzdOrBTObWTzWZOYtkI1VRQXNrK8kquPXDyz0pFj++M
X-Gm-Message-State: AOJu0YxjLDyYWA/SzxL3s+fNQt3BnJPp8zCf731bJnbIRoUREstXK2Rx
	la/VMeN8A9+IdeuTzy9uZuh39r8G5o02ViuZ3v72jABsVrgolwu8GM2t5OpZjrKHgvrsmwc3kPJ
	kkD/0ww29fTOG8H1luKdf0g==
X-Google-Smtp-Source: AGHT+IE29x7m+ZxCuBonRETTmQLNnZSrvQxvnruw/vCAylXmb5W1DxrhrZLZqb2+UAORn2Eg1cm0Cyzjivbt2c8E0g==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:1b06:b0:dcc:94b7:a7a3 with
 SMTP id eh6-20020a0569021b0600b00dcc94b7a7a3mr157767ybb.12.1711594047236;
 Wed, 27 Mar 2024 19:47:27 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:47:23 +0000
In-Reply-To: <20240314232637.2538648-9-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-9-seanjc@google.com>
Message-ID: <diqzr0fvkr7o.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 08/18] KVM: selftests: Move x86's descriptor table helpers
 "up" in processor.c
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
X-CRM114-CacheID: sfid-20240327_194728_713736_0415AB71 
X-CRM114-Status: GOOD (  20.43  )
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

> Move x86's various descriptor table helpers in processor.c up above
> kvm_arch_vm_post_create() and vcpu_setup() so that the helpers can be
> made static and invoked from the aforementioned functions.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 191 +++++++++---------
>  1 file changed, 95 insertions(+), 96 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index eaeba907bb53..3640d3290f0a 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -540,6 +540,21 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  	kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
> +void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	struct kvm_sregs sregs;
> +
> +	vcpu_sregs_get(vcpu, &sregs);
> +	sregs.idt.base = vm->arch.idt;
> +	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
> +	sregs.gdt.base = vm->arch.gdt;
> +	sregs.gdt.limit = getpagesize() - 1;
> +	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> +	vcpu_sregs_set(vcpu, &sregs);
> +	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> +}
> +
>  static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_sregs sregs;
> @@ -572,6 +587,86 @@ static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	vcpu_sregs_set(vcpu, &sregs);
>  }
>  
> +static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
> +			  int dpl, unsigned short selector)
> +{
> +	struct idt_entry *base =
> +		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
> +	struct idt_entry *e = &base[vector];
> +
> +	memset(e, 0, sizeof(*e));
> +	e->offset0 = addr;
> +	e->selector = selector;
> +	e->ist = 0;
> +	e->type = 14;
> +	e->dpl = dpl;
> +	e->p = 1;
> +	e->offset1 = addr >> 16;
> +	e->offset2 = addr >> 32;
> +}
> +
> +static bool kvm_fixup_exception(struct ex_regs *regs)
> +{
> +	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
> +		return false;
> +
> +	if (regs->vector == DE_VECTOR)
> +		return false;
> +
> +	regs->rip = regs->r11;
> +	regs->r9 = regs->vector;
> +	regs->r10 = regs->error_code;
> +	return true;
> +}
> +
> +void route_exception(struct ex_regs *regs)
> +{
> +	typedef void(*handler)(struct ex_regs *);
> +	handler *handlers = (handler *)exception_handlers;
> +
> +	if (handlers && handlers[regs->vector]) {
> +		handlers[regs->vector](regs);
> +		return;
> +	}
> +
> +	if (kvm_fixup_exception(regs))
> +		return;
> +
> +	ucall_assert(UCALL_UNHANDLED,
> +		     "Unhandled exception in guest", __FILE__, __LINE__,
> +		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
> +		     regs->vector, regs->rip);
> +}
> +
> +void vm_init_descriptor_tables(struct kvm_vm *vm)
> +{
> +	extern void *idt_handlers;
> +	int i;
> +
> +	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	/* Handlers have the same address in both address spaces.*/
> +	for (i = 0; i < NUM_INTERRUPTS; i++)
> +		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> +			DEFAULT_CODE_SELECTOR);
> +}
> +
> +void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> +			       void (*handler)(struct ex_regs *))
> +{
> +	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
> +
> +	handlers[vector] = (vm_vaddr_t)handler;
> +}
> +
> +void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +
> +	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
> +		REPORT_GUEST_ASSERT(uc);
> +}
> +
>  void kvm_arch_vm_post_create(struct kvm_vm *vm)
>  {
>  	vm_create_irqchip(vm);
> @@ -1087,102 +1182,6 @@ void kvm_init_vm_address_properties(struct kvm_vm *vm)
>  	}
>  }
>  
> -static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
> -			  int dpl, unsigned short selector)
> -{
> -	struct idt_entry *base =
> -		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
> -	struct idt_entry *e = &base[vector];
> -
> -	memset(e, 0, sizeof(*e));
> -	e->offset0 = addr;
> -	e->selector = selector;
> -	e->ist = 0;
> -	e->type = 14;
> -	e->dpl = dpl;
> -	e->p = 1;
> -	e->offset1 = addr >> 16;
> -	e->offset2 = addr >> 32;
> -}
> -
> -
> -static bool kvm_fixup_exception(struct ex_regs *regs)
> -{
> -	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
> -		return false;
> -
> -	if (regs->vector == DE_VECTOR)
> -		return false;
> -
> -	regs->rip = regs->r11;
> -	regs->r9 = regs->vector;
> -	regs->r10 = regs->error_code;
> -	return true;
> -}
> -
> -void route_exception(struct ex_regs *regs)
> -{
> -	typedef void(*handler)(struct ex_regs *);
> -	handler *handlers = (handler *)exception_handlers;
> -
> -	if (handlers && handlers[regs->vector]) {
> -		handlers[regs->vector](regs);
> -		return;
> -	}
> -
> -	if (kvm_fixup_exception(regs))
> -		return;
> -
> -	ucall_assert(UCALL_UNHANDLED,
> -		     "Unhandled exception in guest", __FILE__, __LINE__,
> -		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
> -		     regs->vector, regs->rip);
> -}
> -
> -void vm_init_descriptor_tables(struct kvm_vm *vm)
> -{
> -	extern void *idt_handlers;
> -	int i;
> -
> -	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -	/* Handlers have the same address in both address spaces.*/
> -	for (i = 0; i < NUM_INTERRUPTS; i++)
> -		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> -			DEFAULT_CODE_SELECTOR);
> -}
> -
> -void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vm *vm = vcpu->vm;
> -	struct kvm_sregs sregs;
> -
> -	vcpu_sregs_get(vcpu, &sregs);
> -	sregs.idt.base = vm->arch.idt;
> -	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
> -	sregs.gdt.base = vm->arch.gdt;
> -	sregs.gdt.limit = getpagesize() - 1;
> -	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> -	vcpu_sregs_set(vcpu, &sregs);
> -	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
> -}
> -
> -void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> -			       void (*handler)(struct ex_regs *))
> -{
> -	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
> -
> -	handlers[vector] = (vm_vaddr_t)handler;
> -}
> -
> -void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
> -{
> -	struct ucall uc;
> -
> -	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
> -		REPORT_GUEST_ASSERT(uc);
> -}
> -
>  const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
>  					       uint32_t function, uint32_t index)
>  {
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
