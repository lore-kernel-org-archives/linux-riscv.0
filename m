Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C498C54E69
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qV0lk86uTIhxUDbN12HUR1H1WtbNIFvMAf5Ms+8h/Hw=; b=YmmHwVkAdFyMjV
	F5TKJswmLHYbIVNMfbGgacLrgxozGlG4aNjP9HTwCDIiU0/+c1E3Bs0xbMbII8ite4ZRCCCeKho1B
	aRbvHAwZKqTqQAuq9/jL4faIWE0AfwlM02vsLPfPnB1N3ld6XmKJuMRmvT4naNwzx7wfsybtl3kgG
	LeLMBYECANFWwxdwnFaNul0wpHDmdukzzxNTCcSU/LFUKKe3Z+RHKyUMVtGDMGlq2n2m0cjOaC2Ez
	O0DwKukISrcfKWOpYq6awyC4G4/smrTaelcEUjYc4tH3QJzHo0guLvoIpWdEvcgSTtZ6xdCr8xFUC
	Dsfsq95XfAqvcMxflrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuUd-0000000G0qF-3MLN;
	Thu, 14 Mar 2024 23:28:11 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTJ-0000000FzvC-2Ttg
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:57 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dd8e82dd47eso188637276.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458805; x=1711063605; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RlUxziw8BSQloGiMQruhCdJKG6uB341JDYak+7wFF+E=;
        b=eLgC7FhFkAoa8lEawh65DkV4VKTvmBu2T7ObLQKyOPlkGBJh14RUCA6sgLYWvQ2smD
         YKgxlgQ4rzQiTolE/1kngRa6El4DbSXJYRohzrpHOJvGkEV1FcFln8JyyAj6CojF1UQY
         VnL8nKtalvmGMpc0h8sllRNx9CVtIE21XxVwu5Sk+/b8MNPjUWu5dtdBVCX/V6TwjjtV
         Vp3Cz/4FPn/BK41l1v7jsRocd2udEdNqziVxxz4RY8b54A+UqL9aqCCuzI4Q3Cs6owPc
         f7Tlt4xd/BWKrj2fLblejzS67nWACq85KBXYW0WcB/e0CWOMMluWs3iMqTd2ve1rTWQl
         AzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458805; x=1711063605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlUxziw8BSQloGiMQruhCdJKG6uB341JDYak+7wFF+E=;
        b=N/KVOQJ68ZmdpfiGFym9w2Qb2pg34GEOkcp3o+6qLyP/yiHS9BarTyXRrgHl6oLa5p
         McQdwGR/23DHl83DzrH+RmFEBToqajIoIKiGz20qnHTuhFa7gp3fSy6rzRuPFN44xBRN
         ZssPfzKoPHw9Bo0tkQLWV34znCgrNlY3n2wbE/sR+KmbCYMlIjvLEJV5ZT/+Csevp5x4
         6ZMWSqBKiq1DxAfWKmn7meVbRSxOfTal1OCWwUhLh+EIHz2+genYb8qQPH9OpKsjWDCg
         MsshOVHotQXjmXNYUOrc0pnT/BWQquWZrRn9wQOSvM5Hnwcrpt6+fAHX96JmVr7yBcd5
         Np+w==
X-Forwarded-Encrypted: i=1; AJvYcCXolEEd2DVMiP4BrBOryTx+PZs+2T4SUUDYVwmyLoWPqKZnBA7jvBiwAGo72M8XYUYhIupOnLzLDkWBG4P44//xWgSbgZWu+aYhw2KzHAwR
X-Gm-Message-State: AOJu0YxbJPZ8RyZnwjlWInjHbrCHedTCyBHsMBnDnGy2bfsIJ5abjL8q
	X0/UDbjBppMm8aWgf36weBRQ6XC6SY8hT0TDvULq6H+kkF5OBQ2F+jbaLv3uOgLK8zbxyYo+r3j
	fuQ==
X-Google-Smtp-Source: AGHT+IH4/ZMXFC2bouhklnoQYb0n6FnYJheuUMSCo2hpU0HMSJmGgKAAvzyEpu0qKMWThNjUG8Cmprp+aaY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1b08:b0:dc6:c94e:fb85 with SMTP id
 eh8-20020a0569021b0800b00dc6c94efb85mr188198ybb.2.1710458805679; Thu, 14 Mar
 2024 16:26:45 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:22 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-4-seanjc@google.com>
Subject: [PATCH 03/18] KVM: selftests: Move GDT, IDT, and TSS fields to x86's kvm_vm_arch
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
X-CRM114-CacheID: sfid-20240314_162649_993819_69124192 
X-CRM114-Status: GOOD (  13.27  )
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

Now that kvm_vm_arch exists, move the GDT, IDT, and TSS fields to x86's
implementation, as the structures are firmly x86-only.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  3 ---
 .../kvm/include/x86_64/kvm_util_arch.h        |  6 +++++
 .../selftests/kvm/lib/x86_64/processor.c      | 22 +++++++++----------
 .../kvm/x86_64/svm_nested_shutdown_test.c     |  2 +-
 .../kvm/x86_64/svm_nested_soft_inject_test.c  |  2 +-
 5 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index acdcddf78e3f..58d6a4d6ce4f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -94,9 +94,6 @@ struct kvm_vm {
 	bool pgd_created;
 	vm_paddr_t ucall_mmio_addr;
 	vm_paddr_t pgd;
-	vm_vaddr_t gdt;
-	vm_vaddr_t tss;
-	vm_vaddr_t idt;
 	vm_vaddr_t handlers;
 	uint32_t dirty_ring_size;
 	uint64_t gpa_tag_mask;
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
index 9f1725192aa2..b14ff3a88b4a 100644
--- a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -5,7 +5,13 @@
 #include <stdbool.h>
 #include <stdint.h>
 
+#include "kvm_util_types.h"
+
 struct kvm_vm_arch {
+	vm_vaddr_t gdt;
+	vm_vaddr_t tss;
+	vm_vaddr_t idt;
+
 	uint64_t c_bit;
 	uint64_t s_bit;
 	int sev_fd;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 74a4c736c9ae..45f965c052a1 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -417,7 +417,7 @@ static void kvm_seg_set_unusable(struct kvm_segment *segp)
 
 static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 {
-	void *gdt = addr_gva2hva(vm, vm->gdt);
+	void *gdt = addr_gva2hva(vm, vm->arch.gdt);
 	struct desc64 *desc = gdt + (segp->selector >> 3) * 8;
 
 	desc->limit0 = segp->limit & 0xFFFF;
@@ -518,21 +518,21 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 {
-	if (!vm->gdt)
-		vm->gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	if (!vm->arch.gdt)
+		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
-	dt->base = vm->gdt;
+	dt->base = vm->arch.gdt;
 	dt->limit = getpagesize();
 }
 
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 				int selector)
 {
-	if (!vm->tss)
-		vm->tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	if (!vm->arch.tss)
+		vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
 	memset(segp, 0, sizeof(*segp));
-	segp->base = vm->tss;
+	segp->base = vm->arch.tss;
 	segp->limit = 0x67;
 	segp->selector = selector;
 	segp->type = 0xb;
@@ -1091,7 +1091,7 @@ static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
 			  int dpl, unsigned short selector)
 {
 	struct idt_entry *base =
-		(struct idt_entry *)addr_gva2hva(vm, vm->idt);
+		(struct idt_entry *)addr_gva2hva(vm, vm->arch.idt);
 	struct idt_entry *e = &base[vector];
 
 	memset(e, 0, sizeof(*e));
@@ -1144,7 +1144,7 @@ void vm_init_descriptor_tables(struct kvm_vm *vm)
 	extern void *idt_handlers;
 	int i;
 
-	vm->idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
@@ -1158,9 +1158,9 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	struct kvm_sregs sregs;
 
 	vcpu_sregs_get(vcpu, &sregs);
-	sregs.idt.base = vm->idt;
+	sregs.idt.base = vm->arch.idt;
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
-	sregs.gdt.base = vm->gdt;
+	sregs.gdt.base = vm->arch.gdt;
 	sregs.gdt.limit = getpagesize() - 1;
 	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
diff --git a/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c b/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
index d6fcdcc3af31..f4a1137e04ab 100644
--- a/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
+++ b/tools/testing/selftests/kvm/x86_64/svm_nested_shutdown_test.c
@@ -53,7 +53,7 @@ int main(int argc, char *argv[])
 
 	vcpu_alloc_svm(vm, &svm_gva);
 
-	vcpu_args_set(vcpu, 2, svm_gva, vm->idt);
+	vcpu_args_set(vcpu, 2, svm_gva, vm->arch.idt);
 
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SHUTDOWN);
diff --git a/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c b/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
index 0c7ce3d4e83a..2478a9e50743 100644
--- a/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
+++ b/tools/testing/selftests/kvm/x86_64/svm_nested_soft_inject_test.c
@@ -166,7 +166,7 @@ static void run_test(bool is_nmi)
 
 		idt_alt_vm = vm_vaddr_alloc_page(vm);
 		idt_alt = addr_gva2hva(vm, idt_alt_vm);
-		idt = addr_gva2hva(vm, vm->idt);
+		idt = addr_gva2hva(vm, vm->arch.idt);
 		memcpy(idt_alt, idt, getpagesize());
 	} else {
 		idt_alt_vm = 0;
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
