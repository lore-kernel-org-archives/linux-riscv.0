Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD67BC54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGgVHnML1DAlj5BgQTN9KNCmzTzJAS421QMAi+cZuBA=; b=OgOmfaXWlwvfWE
	gmw0LKsUlPHYsjYsIPRmUsC4wVaw8c7JDwYHohlNlnT2g9jvDDBzoRhvV4mCQN6qPImNtK6oPWRW5
	NMeS52PQ05/I9PSXv8CLZL12NUBcnY3Rb7k+cDYrB0K3WTJLkVtKlr4W/otpvUDFAhhfYVIhjp7g/
	4MPAQsAXKZH+uwe+Wkk8JrZB3fDTl5qi8lAq58r+clGJWgOMnJsE/1Uw9bP/aB5BQx2QZQJtWmUZf
	LSq4Xcvgp7drTgNgeSVI4rbClnXnZyKdsnjEmeEqa91kVlcre9WWsYpRzvPk4tNo+e0+LYRPpMpCv
	tCDgJzDwOtsyp56FaKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuVd-0000000G1bO-3r7g;
	Thu, 14 Mar 2024 23:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTW-0000000G07J-3wFy
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cYt0UxRFPQqzYn7Vpx6g+tvPS4Iw5cklVXoJXhkYY7M=; b=YL8SlqqbnDggSycKbyxLhNPQPl
	5gClNW+05op5CKU8jY3hMXSZKx/Ed1rPpMgxQKPVf3Z6E+3FbzXO82slnn+roywREp24lTLy2qk7h
	2gt14KYAnngelwlMC0pR4CcXNEhWGjEUEttTMD1HAQcS0nwreDD2H6Ber6n5pdBSO4EtrKJuP+Q2O
	inUnANN1YC2a7ajgWNha5rpvdAG1TzrYVhAyrukQ9bix8AfyiAkB7+ur0E27iYBpX9fBeOlZM/FrI
	a8rS7etgEMA1yVY949zJTxSkAx+yMRQm3P9C33zE/p3LubDs23CRM2hwG4uZDD42vfI1RarCaP+V5
	gi6DdbAQ==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTR-0000000Ait4-2iCt
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-29b8f83c027so1281161a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458815; x=1711063615; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cYt0UxRFPQqzYn7Vpx6g+tvPS4Iw5cklVXoJXhkYY7M=;
        b=xvrHfTip3GJvv1E1O/qUaettdabaX87HV7uew3Zm/xiKv4CuLOMygvX3eEUpvguLJQ
         49RR16y5tINrcs4JD5dwpoMwiOy/H3vpE3V5J43aFSOKU6O8tYQgLau2bL/P07VTFOZC
         B9pC/QtagPBrK7F/bB8WYiuk33axgzvlZjfZ31UHlkN6LOzXT2Q76LGDxfQ0uFXrZMai
         w7ipQIVKVDrq9o0aG7J+VeE3pr+ZsmJjsZ4eMG/cpuKiX8Lspvr9b878MCy3sGaSmJ81
         3Y8bML4mu2kVnEI6E1PfuYg7fMnl1O38L3X67ckUO6fs0KL+yPAUdTFKWYEMW5QEG8Zd
         +wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458815; x=1711063615;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYt0UxRFPQqzYn7Vpx6g+tvPS4Iw5cklVXoJXhkYY7M=;
        b=iVIZ+9UqVYkLV8bAIF7FibRw073is4mn0yUiXcJ7Inmlv4LjH2A348ID4NKLYpYW48
         Lm8Yj2NXABu4HH0yiQSTAJvlOKiWbNezPRTL0EOf5roEV9OwLqh0JgzNpJtmYN488NEQ
         F9H3hYr9fl84J05EpNcIEX4TAnlwg2KwgV7fHA4hhoiKD4IgE+Im+AO1fnZpu7VTVo0C
         M6A4wgfoxW9HGAwErR7rCxP4TnLsrCNS2tuwX7LtrNcK+P8X+3+Fp2NNjfu5yauBbsGy
         0/dHzqNS6Cw09E7OO+sQyLo+lDA4nx/9CLNT1bkb70ZiLvzegP5AyZo7hSutBfWzMdP5
         Vn4A==
X-Forwarded-Encrypted: i=1; AJvYcCWZYIcggOAl7q+IOsjuqZIZBPE8K0IkD8DT1PPNe/wBzB6FuoHtAVptIgjwhxQ/JKAebeF6UnkLA23RZmfhvZ0UWmaRY9tUkqOGbRPz1xmI
X-Gm-Message-State: AOJu0YysPVz0NsZRWa8P7Hlqj6PQtIqOPK1QSJpoUFGUfwJZzy/HY+tQ
	YG3ymu0w1GWPQXBg6C4seBpCtUgpmdfk7OK9iDCRRiud5ftWNiRUSJMATkHR5kqQAE1x8kTQiOz
	oPA==
X-Google-Smtp-Source: AGHT+IFrr0eJ7KJEPLhApMpHRts0gPRzkT9mvlTzswaB+7MaMjHLiz+sM47iUPlzqqkPyfHstCgHwuftTuc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:bc94:b0:29b:c2b7:7d29 with SMTP id
 x20-20020a17090abc9400b0029bc2b77d29mr3418pjr.9.1710458814574; Thu, 14 Mar
 2024 16:26:54 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:27 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-9-seanjc@google.com>
Subject: [PATCH 08/18] KVM: selftests: Move x86's descriptor table helpers
 "up" in processor.c
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_232658_005270_14072704 
X-CRM114-Status: GOOD (  13.59  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move x86's various descriptor table helpers in processor.c up above
kvm_arch_vm_post_create() and vcpu_setup() so that the helpers can be
made static and invoked from the aforementioned functions.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 191 +++++++++---------
 1 file changed, 95 insertions(+), 96 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index eaeba907bb53..3640d3290f0a 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -540,6 +540,21 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 	kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
+void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vm *vm = vcpu->vm;
+	struct kvm_sregs sregs;
+
+	vcpu_sregs_get(vcpu, &sregs);
+	sregs.idt.base = vm->arch.idt;
+	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+	sregs.gdt.base = vm->arch.gdt;
+	sregs.gdt.limit = getpagesize() - 1;
+	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
+	vcpu_sregs_set(vcpu, &sregs);
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+}
+
 static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	struct kvm_sregs sregs;
@@ -572,6 +587,86 @@ static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_sregs_set(vcpu, &sregs);
 }
 
+static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
+			  int dpl, unsigned short selector)
+{
+	struct idt_entry *base =
+		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
+	struct idt_entry *e = &base[vector];
+
+	memset(e, 0, sizeof(*e));
+	e->offset0 = addr;
+	e->selector = selector;
+	e->ist = 0;
+	e->type = 14;
+	e->dpl = dpl;
+	e->p = 1;
+	e->offset1 = addr >> 16;
+	e->offset2 = addr >> 32;
+}
+
+static bool kvm_fixup_exception(struct ex_regs *regs)
+{
+	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
+		return false;
+
+	if (regs->vector == DE_VECTOR)
+		return false;
+
+	regs->rip = regs->r11;
+	regs->r9 = regs->vector;
+	regs->r10 = regs->error_code;
+	return true;
+}
+
+void route_exception(struct ex_regs *regs)
+{
+	typedef void(*handler)(struct ex_regs *);
+	handler *handlers = (handler *)exception_handlers;
+
+	if (handlers && handlers[regs->vector]) {
+		handlers[regs->vector](regs);
+		return;
+	}
+
+	if (kvm_fixup_exception(regs))
+		return;
+
+	ucall_assert(UCALL_UNHANDLED,
+		     "Unhandled exception in guest", __FILE__, __LINE__,
+		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
+		     regs->vector, regs->rip);
+}
+
+void vm_init_descriptor_tables(struct kvm_vm *vm)
+{
+	extern void *idt_handlers;
+	int i;
+
+	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	/* Handlers have the same address in both address spaces.*/
+	for (i = 0; i < NUM_INTERRUPTS; i++)
+		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
+			DEFAULT_CODE_SELECTOR);
+}
+
+void vm_install_exception_handler(struct kvm_vm *vm, int vector,
+			       void (*handler)(struct ex_regs *))
+{
+	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
+
+	handlers[vector] = (vm_vaddr_t)handler;
+}
+
+void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
+		REPORT_GUEST_ASSERT(uc);
+}
+
 void kvm_arch_vm_post_create(struct kvm_vm *vm)
 {
 	vm_create_irqchip(vm);
@@ -1087,102 +1182,6 @@ void kvm_init_vm_address_properties(struct kvm_vm *vm)
 	}
 }
 
-static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
-			  int dpl, unsigned short selector)
-{
-	struct idt_entry *base =
-		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
-	struct idt_entry *e = &base[vector];
-
-	memset(e, 0, sizeof(*e));
-	e->offset0 = addr;
-	e->selector = selector;
-	e->ist = 0;
-	e->type = 14;
-	e->dpl = dpl;
-	e->p = 1;
-	e->offset1 = addr >> 16;
-	e->offset2 = addr >> 32;
-}
-
-
-static bool kvm_fixup_exception(struct ex_regs *regs)
-{
-	if (regs->r9 != KVM_EXCEPTION_MAGIC || regs->rip != regs->r10)
-		return false;
-
-	if (regs->vector == DE_VECTOR)
-		return false;
-
-	regs->rip = regs->r11;
-	regs->r9 = regs->vector;
-	regs->r10 = regs->error_code;
-	return true;
-}
-
-void route_exception(struct ex_regs *regs)
-{
-	typedef void(*handler)(struct ex_regs *);
-	handler *handlers = (handler *)exception_handlers;
-
-	if (handlers && handlers[regs->vector]) {
-		handlers[regs->vector](regs);
-		return;
-	}
-
-	if (kvm_fixup_exception(regs))
-		return;
-
-	ucall_assert(UCALL_UNHANDLED,
-		     "Unhandled exception in guest", __FILE__, __LINE__,
-		     "Unhandled exception '0x%lx' at guest RIP '0x%lx'",
-		     regs->vector, regs->rip);
-}
-
-void vm_init_descriptor_tables(struct kvm_vm *vm)
-{
-	extern void *idt_handlers;
-	int i;
-
-	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
-	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
-	/* Handlers have the same address in both address spaces.*/
-	for (i = 0; i < NUM_INTERRUPTS; i++)
-		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-			DEFAULT_CODE_SELECTOR);
-}
-
-void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
-{
-	struct kvm_vm *vm = vcpu->vm;
-	struct kvm_sregs sregs;
-
-	vcpu_sregs_get(vcpu, &sregs);
-	sregs.idt.base = vm->arch.idt;
-	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
-	sregs.gdt.base = vm->arch.gdt;
-	sregs.gdt.limit = getpagesize() - 1;
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
-	vcpu_sregs_set(vcpu, &sregs);
-	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
-}
-
-void vm_install_exception_handler(struct kvm_vm *vm, int vector,
-			       void (*handler)(struct ex_regs *))
-{
-	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
-
-	handlers[vector] = (vm_vaddr_t)handler;
-}
-
-void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
-{
-	struct ucall uc;
-
-	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED)
-		REPORT_GUEST_ASSERT(uc);
-}
-
 const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
 					       uint32_t function, uint32_t index)
 {
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
