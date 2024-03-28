Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AADC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=npd9DDO8JHIZS8HrBvV9U1gvC7e2Hdif+0ns5cF92Gc=; b=2Cw7N5ZYQ7D4zwIhNVfzj7IlGg
	vSkpiWYl1JHm5AEGEwJwwm5szw/nmpMFkrVASpkn0qKm/V9Lhejrjn6qaIPFS+DdGxl6jo1DdCBCx
	e9m0B3NWXuxtioZgWs2fC5WmPwXYgXirXRdsjJRkqa6XgAm5ydfKFU1h8es47rUD0UAzFlV15/fy9
	cuwaGnwmg/OUFw0TQdzwPOUBzZjWXlvG9dTv42NkMSY72qbgNwb4PE7hTploxUJrcjrUHFugQQigI
	8zV4aaIhOJz8b1jGJ+9WKMkmrW70IGa+4UdnccqMNnm0P64epX+z3TeRC0P4MdS4oRNdCtZwuYl9y
	nl26Zf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfqo-0000000CAKv-364y;
	Thu, 28 Mar 2024 02:50:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfql-0000000CAJY-2qO1
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Mar 2024 02:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GVStFLbB5MSlLHegIF/51zA+Fjr+PzwwtmvLYBB03HM=; b=lPPgB/ze/RU0bBrBSFJfZ6oiVs
	Yc1IrDlklCjrfHMl3kPuSDHSyK0KHEh9evNvBg+L5zmIMhLNdkPVMnJfTxsehgAX187ajHpZBLx4m
	9MGFwP6j0aLH4cQxSHoPvDAZ8PyU0/cbxEesalJvaT49JAnLXEJYtdVG0XtrVHsndMDkc3nbgWOfB
	JW0q6ae7RAPGFQlCmtTuKpyiEMOE+R1YZ8Y0EiReDWxXhacCtLXmovvl9ppvlHL0tMTQFu6ofdSMa
	unYErQZUm1WM0eT0LjUuiq5c4UqerzWunV56Rnz+fpspGN5qpEvL5Nd8dRk/GXmsI9HUdYGyOENI2
	B0nFUPUQ==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfqh-00000000j9A-0Qrv
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:50:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc746178515so821230276.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594237; x=1712199037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVStFLbB5MSlLHegIF/51zA+Fjr+PzwwtmvLYBB03HM=;
        b=mTqx/bprEIsX/o165+SqE8dgnL0PYjM5c0gBYkO+E/VsfZlhm+ttO8Pxseea/VuMyI
         3gWr1chn7zqIpEzhSB+eld1ry1XIbaYpTO5fdEAS4/fG8BHG3/deeE0baXbz7hpm+PL4
         1bQAk09ah8cfEm9Z3gTq5cSn9d+9l9tcIWbHe4oCwA87x1Co0ShU0ERnGMV8TQWNIkTb
         OZQE5ss9jD86Fok311d1m2sIyZBsymr37c00D14yPox1q/5U/ouHevw9dpOYh/DVR5E/
         SpIgo9FVB+NR5Rr463IndTZnXNkiC9IJfVCz1VuviJEcwRrFv1kz534nhLe7a3xIRSG9
         6kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594237; x=1712199037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVStFLbB5MSlLHegIF/51zA+Fjr+PzwwtmvLYBB03HM=;
        b=f0ob4YgU/3EtI+hYutLIDoTAHa6lC1cRJjN5BpOagL9kg39/QLUyAMkg6mxRDE3eQw
         AOzr29y8e7WxVHXU48Wzx0qCtq/9uueo7dpboD+gHszhw630kXEZNSGJqBVTUi6/NXcp
         eMCwpOWa7XCho4Ahc6B9V2tFrlAr43YT/57BffsQwiSSWQwxPP594N8eoKYxHM2EtV6v
         fQ0hVeFK88uOOl4cNpS/qWeyrkZBpT84Pk7XiTb19VxcFFcreUT6ItbF2UCqdtCawstZ
         1CN7301FywHc2YaaScvF4OhBrKYjjRk17+mX2LSXDHfyibdQyNeaWDXNqifUou6DAXZn
         k7tw==
X-Forwarded-Encrypted: i=1; AJvYcCUOKlX6qEL50dJQCdazKCl8lp3ECy4C6Pneez+lII+qOmI6bpig6bXyH/IyGlggdbUtyoPOz8lGYKvUAERayREe/odvC5jXZRfYHfjAkEFL
X-Gm-Message-State: AOJu0YyE5hafZ9a0T1tbAac3BPHFyonaJBJdf0xULrcTrij55iwSNuVx
	GF2/UM4uK5lDten8v5bj95wPOvdkfj2PNktCy6Kh1vJSZpj6uwAMjC90vAHJ0jqUrrAfeNiiwpW
	XmfeC1YV3+x4OecDU8KlJgw==
X-Google-Smtp-Source: AGHT+IFMg1NFvhaztQY4Xe+ltR0SInGvBShM16M6WwX62q2RGNWNPZfAstK1O/zQ6kdEG7DNPdBNlgqWvpvw1rlnNQ==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:1009:b0:ddd:7581:13ac with
 SMTP id w9-20020a056902100900b00ddd758113acmr522745ybt.2.1711594236913; Wed,
 27 Mar 2024 19:50:36 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:50:32 +0000
In-Reply-To: <20240314232637.2538648-15-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-15-seanjc@google.com>
Message-ID: <diqzfrwbkr2f.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 14/18] KVM: selftests: Fold x86's descriptor tables
 helpers into vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240328_025040_214680_0C5ADD76 
X-CRM114-Status: GOOD (  16.34  )
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

> Now that the per-VM, on-demand allocation logic in kvm_setup_gdt() and
> vcpu_init_descriptor_tables() is gone, fold them into vcpu_init_sregs().
>
> Note, both kvm_setup_gdt() and vcpu_init_descriptor_tables() configured the
> GDT, which is why it looks like kvm_setup_gdt() disappears.
>
> Opportunistically delete the pointless zeroing of the IDT limit (it was
> being unconditionally overwritten by vcpu_init_descriptor_tables()).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 32 ++++---------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 561c0aa93608..5cf845975f66 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -516,12 +516,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
>  }
>  
> -static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
> -{
> -	dt->base = vm->arch.gdt;
> -	dt->limit = getpagesize() - 1;
> -}
> -
>  static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  				int selector)
>  {
> @@ -537,32 +531,19 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  	kvm_seg_fill_gdt_64bit(vm, segp);
>  }
>  
> -static void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
> +static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
> -	struct kvm_vm *vm = vcpu->vm;
>  	struct kvm_sregs sregs;
>  
> +	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
> +
> +	/* Set mode specific system register values. */
>  	vcpu_sregs_get(vcpu, &sregs);
> +
>  	sregs.idt.base = vm->arch.idt;
>  	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
>  	sregs.gdt.base = vm->arch.gdt;
>  	sregs.gdt.limit = getpagesize() - 1;
> -	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> -	vcpu_sregs_set(vcpu, &sregs);
> -}
> -
> -static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_sregs sregs;
> -
> -	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
> -
> -	/* Set mode specific system register values. */
> -	vcpu_sregs_get(vcpu, &sregs);
> -
> -	sregs.idt.limit = 0;
> -
> -	kvm_setup_gdt(vm, &sregs.gdt);
>  
>  	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
>  	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
> @@ -572,12 +553,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
>  	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
>  	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
> +	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
>  	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> -
> -	vcpu_init_descriptor_tables(vcpu);
>  }
>  
>  static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
