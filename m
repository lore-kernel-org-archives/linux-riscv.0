Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5BDC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Va1hZW7HNFdD3jjUaScNkAWS8NpRMJP8hs7Cn3vl2jo=; b=m2Gl8T0deb+Hqw
	jSXNh0TUkBGu6eLcFUoHqm/3SCkKXE2sBQPpHWnTmCAfdJ1c6wc09K9Yp9UvGUBLlAc5cJS2bzOdR
	pDCltM67h5iP7yGsmYb2rQ7tsVNSzrMaW1yYUk/UVBtGtSWXvegRo9D8KzBrqQNtqFcQF3EtBMNPt
	gNmdJ0CqiJKvUkESwR3G+q8HPuJatwU7MD7Vl5T1o0r1OUN5pgyJCYq8WQ3lRhhUzH6SSOaXXJLlY
	PXTFToqRePoBhDCoxlrnX+0B0ei79ZRcohSSDdg2aseM8iOEhK+0RrnlpsoYfrdcuCV2PJReQjRzG
	GhWWXy1RGRxmJq7oAY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuWa-0000000G2Fg-1q46;
	Thu, 14 Mar 2024 23:30:12 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTd-0000000G0BT-3DQY
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:14 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-607838c0800so27942187b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458826; x=1711063626; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ugMj11YssaThk53XXo2XJuyaCSbRC3vd2rkkLMOH5EU=;
        b=jPSW0HpVQFuHVWYD/N7G/zyXWpFkjbR8iFtPyzx/U3KDTeIx92xnxGq1jeuCGw0rFc
         j0E7l4gquQnrwRF72Zzil/hrxR7scsi6w7DneNo84D18eDwM58RFbxJcore8JZZQ8+sO
         iWBU+TPRlbfmvY9cYeJZbZiQuQr3JXHbeD/+/10q1nMYFtIbiePpIZPDhTH0yEmqGvH2
         9FSzNNDIzAAW24owdLF+NeCEL8YzkwSb4d8rbJAt1I3FQ3/loj7IKHo4byZLgrsKmX+N
         3S2BJ4U9rvBKsmIbwLvB2mmpJyq3K+1C28kkZBtdZ36+xyy+3pvmJenujMWDaTAgYWpa
         U+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458826; x=1711063626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugMj11YssaThk53XXo2XJuyaCSbRC3vd2rkkLMOH5EU=;
        b=QZ9z4tZfdVwYlqMbMCVmoUGXjLgxXB/Zn48ZckbV4fZmQZ0oCwhLpeKK3skIt3l6sn
         vqdqtDDhFq8r8OFdIuRZw7Pc9zPvYkJrFF/MXk+236k1MrzicQZNK816mfxsgHe3TJH6
         rnrP1PCI2u9K/VIKU4aMEZkJH1lAsGmnKc/mErkK+4p3Whw7QwDxTS9htaUwWEFIJag9
         hEb89HvEvTeO95r0CbknpZvQDyBkxQSY5d5aqYDkCBamFBK4TeAglX6s5rYFNr1OqWJ0
         ntaI+WngRNEt9XUxZ0WNv1uvIrjzQENvVvLZIDT1mrrWgJrvCsbTmBAIoZvGSUye2uBD
         zXBw==
X-Forwarded-Encrypted: i=1; AJvYcCVhNrYqrdO8XCCz48P8GNOpl8lWHcJoaDOsPVqi432LIeLuKPDR4fM+1W6hbqmieQ6LIznjnsQ4ZCgtz6klxD1iJB8Ag3KXjpBiLaonaWBT
X-Gm-Message-State: AOJu0Yyd8fmDG1qJyqFzmEFXn6RMxn1rr35geeAaE89lmhzY+aOEoXaC
	fvZFdLvXcQLDeh1Mc1lrv3jD+jtWbLy6vaPD4cn6r774suku7r6juzCZBMYKLMtGsIkwRMEfXrJ
	zKg==
X-Google-Smtp-Source: AGHT+IE5/WiqwibvrYrQwLJotN6HL86HBYfSMTMXmq7TGIVKVjhGwMzToGYfAqrqDOL2A5xHSs/EAtgRugA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:bc0a:0:b0:60a:13b8:6a5c with SMTP id
 a10-20020a81bc0a000000b0060a13b86a5cmr1757713ywi.0.1710458825983; Thu, 14 Mar
 2024 16:27:05 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:33 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-15-seanjc@google.com>
Subject: [PATCH 14/18] KVM: selftests: Fold x86's descriptor tables helpers
 into vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240314_162710_062049_457374E0 
X-CRM114-Status: UNSURE (   9.56  )
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

Now that the per-VM, on-demand allocation logic in kvm_setup_gdt() and
vcpu_init_descriptor_tables() is gone, fold them into vcpu_init_sregs().

Note, both kvm_setup_gdt() and vcpu_init_descriptor_tables() configured the
GDT, which is why it looks like kvm_setup_gdt() disappears.

Opportunistically delete the pointless zeroing of the IDT limit (it was
being unconditionally overwritten by vcpu_init_descriptor_tables()).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 32 ++++---------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 561c0aa93608..5cf845975f66 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -516,12 +516,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
-static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-{
-	dt->base = vm->arch.gdt;
-	dt->limit = getpagesize() - 1;
-}
-
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 				int selector)
 {
@@ -537,32 +531,19 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 	kvm_seg_fill_gdt_64bit(vm, segp);
 }
 
-static void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
+static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
-	struct kvm_vm *vm = vcpu->vm;
 	struct kvm_sregs sregs;
 
+	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
+
+	/* Set mode specific system register values. */
 	vcpu_sregs_get(vcpu, &sregs);
+
 	sregs.idt.base = vm->arch.idt;
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
 	sregs.gdt.base = vm->arch.gdt;
 	sregs.gdt.limit = getpagesize() - 1;
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
-	vcpu_sregs_set(vcpu, &sregs);
-}
-
-static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
-{
-	struct kvm_sregs sregs;
-
-	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
-
-	/* Set mode specific system register values. */
-	vcpu_sregs_get(vcpu, &sregs);
-
-	sregs.idt.limit = 0;
-
-	kvm_setup_gdt(vm, &sregs.gdt);
 
 	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
 	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
@@ -572,12 +553,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
 	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
 	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
-
-	vcpu_init_descriptor_tables(vcpu);
 }
 
 static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
