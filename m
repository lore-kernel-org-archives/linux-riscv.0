Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C38C54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 01:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FROdDrQvMruGRVnZ5Nf3nzximRTnE8cDNbOPFPqc+0g=; b=KtpqC/b2+4FM85
	U0N1LvrngCTRvljXVZ7Z7hsrfuaE7L1k5Xo++qZY1vZrnWAcSNeOUyOR8vuCBGCnxs8c3OZ7FT48y
	P87XVWUdNiaUB7uOMLHTd86sociRI+GxRsNcT/H7EX6FhTrZ0ouDsu6RcvN6gUYpsPYzYCIvUGzAu
	VrNBkeYkya1dT5jHSSo01L5x4sjpv0O9H80D+7Escac4wIACKnd7VZ4T21ZjngAQuMfpSFAjvWSPU
	gg6zgraSs6eC8EXUZxXOZcBs2eV3wQurcu2WT+Wrq1LgY4tK6d6w1lU12tnNnwtDwZYULmrWd8tx5
	LhCVhEnAsuKV5gbQbd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkwex-0000000GLc5-06Nh;
	Fri, 15 Mar 2024 01:46:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTn-0000000G0KY-2HoM
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IJnvo3GlUCWm+9Z87DTK6fPvvH2dyec9Q+4IWGvi0gE=; b=i+OOCEwZENChDejEFwGAYdrnRx
	ygT8kHNCxZqrWUQP2u2cn/hBXm/0mOm1OLPskGVc1UQZtzVIeHawrDa0/rMhNOYMM1vRi2p2mRTmu
	mg9nK78b38PVr2htj4IkWGniOSq2NL/t9NEK0ETKN5wTtC2R5NGb4FHl2saNgmzObktCJI564py9p
	Xx/gqzcg7Q5B3AHIAoQlDv28myRT8QFKK1WzAjc9FJ9DxKzWzviB7MP9pJKU1gaw+29+XNxcKsDdv
	ZhYw4RETcnin+jpA0328GaDJIGcGaVdzplag7EbwJ72vJz9FgTrEof5w8dKxWHo589GtDI8y9iMIh
	eRCAgFVw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTi-0000000Aivj-0uMM
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:16 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6e6b3bff094so1779374b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458831; x=1711063631; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IJnvo3GlUCWm+9Z87DTK6fPvvH2dyec9Q+4IWGvi0gE=;
        b=WecS4PMu5kVGHPztti6TMUbYXo8KDCxND2rnCiM1Kq9LDhs8kbI0r8FopO1rtdcSX3
         7YagoKFS4VMQlDcxCt0lZgJ0GkWQ167Q/H7zt88ICOF7Liofxs0w+Feg64dPB7cjDOS8
         iBQBfgtUpngHeWEEbqlnofBqRCb2WwAlu8gUknB+2LyWKvZoXavvWWMIJ6vuBOHZTq3w
         wSH5NMeL5ircE92QRhwHEteANllQnw3wsuLFeGpFKe5PA8SS89rPZdOR/YQ/Zjh4TvG+
         XmsL+RTWbGYxDKT7wHSmWYqM+B6V4WThdxEWgO1vpHhy4XpMD+ttHlLShW9YdPgkU/3N
         Ngeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458831; x=1711063631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJnvo3GlUCWm+9Z87DTK6fPvvH2dyec9Q+4IWGvi0gE=;
        b=n6p9stWfieSl5IKsHW8qc8WFK3vzZvDWaICX07XceX0k2FHNBVorDR3gxrgZX/J2Pj
         H/xqZ5fdL5CGqoOrolyHTw2z+WVx1SV2vJ+HADDyN8R2WwX3hrBksI7WM+amulh8Qycx
         9ZPDxUErGWFsK8jmlwZ/bCiUIBrYzTpXPH2lS2PRtW48SLPDsRxWJYPnGHmEb4ctT8FD
         JsB2DeyAH4BHlwGQYWAReDO02puN5Ed87atF59UyIW7QnZ2iQsaj2lFdaCg8FqGk3LcT
         zKwyKkW2qoxKhMHLrYSqlYdf0uNkSrjzbkxxlm02x4kh+fGlHQeejlmInxdPLaVpMiwT
         KmPw==
X-Forwarded-Encrypted: i=1; AJvYcCXAy3hgUn3v0jsFI98uPGpV1hclPlwNmg0E+DzZMJRaL087C3D6iyBYkBY9ThINnwRukoOG+VTYRLMgkXQgQgmjcmBGPCjny1QNbov4STEg
X-Gm-Message-State: AOJu0Yxr3jncnxWDaIPnhmHe5vohtBPp5B3QCoES32zqGZV53E1Wt4nL
	cUecUfr3yFISyOk2sHSkJSdRzfDiHfu0G9jF0jvMUva9m3MyvK1pt5RyOBWU3dAXZDMqbvlHwFQ
	UMw==
X-Google-Smtp-Source: AGHT+IFXKsJZcktPEDJdv6TjhHXL21Zrt9AN04hKeTmJyyHIm5kk/8ldZSE0dO0H/MtumtcqHIdX1BiKE5Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:234c:b0:6e6:c38e:e9e3 with SMTP id
 j12-20020a056a00234c00b006e6c38ee9e3mr134457pfj.4.1710458831465; Thu, 14 Mar
 2024 16:27:11 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:36 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-18-seanjc@google.com>
Subject: [PATCH 17/18] KVM: selftests: Init x86's segments during VM creation
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
X-CRM114-CacheID: sfid-20240314_232714_610963_94227508 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Initialize x86's various segments in the GDT during creation of relevant
VMs instead of waiting until vCPUs come along.  Re-installing the segments
for every vCPU is both wasteful and confusing, as is installing KERNEL_DS
multiple times; NOT installing KERNEL_DS for GS is icing on the cake.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 68 ++++++-------------
 1 file changed, 20 insertions(+), 48 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 67235013f6f9..dab719ee7734 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -438,24 +438,7 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 		desc->base3 = segp->base >> 32;
 }
 
-
-/*
- * Set Long Mode Flat Kernel Code Segment
- *
- * Input Args:
- *   vm - VM whose GDT is being filled, or NULL to only write segp
- *   selector - selector value
- *
- * Output Args:
- *   segp - Pointer to KVM segment
- *
- * Return: None
- *
- * Sets up the KVM segment pointed to by @segp, to be a code segment
- * with the selector value given by @selector.
- */
-static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
-	struct kvm_segment *segp)
+static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
@@ -467,27 +450,9 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
 	segp->g = true;
 	segp->l = true;
 	segp->present = 1;
-	if (vm)
-		kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
-/*
- * Set Long Mode Flat Kernel Data Segment
- *
- * Input Args:
- *   vm - VM whose GDT is being filled, or NULL to only write segp
- *   selector - selector value
- *
- * Output Args:
- *   segp - Pointer to KVM segment
- *
- * Return: None
- *
- * Sets up the KVM segment pointed to by @segp, to be a data segment
- * with the selector value given by @selector.
- */
-static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
-	struct kvm_segment *segp)
+static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
@@ -498,8 +463,6 @@ static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
 					  */
 	segp->g = true;
 	segp->present = true;
-	if (vm)
-		kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
 vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
@@ -517,16 +480,15 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
-static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
-				int selector)
+static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
+				  int selector)
 {
 	memset(segp, 0, sizeof(*segp));
-	segp->base = vm->arch.tss;
+	segp->base = base;
 	segp->limit = 0x67;
 	segp->selector = selector;
 	segp->type = 0xb;
 	segp->present = 1;
-	kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
 static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
@@ -548,11 +510,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);
-	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
-	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
-	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
-	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
-	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
+	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
+	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
+	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
+	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
+	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
@@ -612,6 +574,7 @@ void route_exception(struct ex_regs *regs)
 static void vm_init_descriptor_tables(struct kvm_vm *vm)
 {
 	extern void *idt_handlers;
+	struct kvm_segment seg;
 	int i;
 
 	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
@@ -624,6 +587,15 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
 
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+
+	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+
+	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+
+	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
 }
 
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
