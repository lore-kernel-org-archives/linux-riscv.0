Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E216CC54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uk7q299kbEGvTEUoS94OhMDAiLb8gyTdc8jXeRgejiM=; b=epNqew8iWuLC8K
	/49JBuAwS2ppBMLThiLtVXDW//Mup+ViixQh4brDzSFCTNMS2QfOGwouBttW6jaWL/AEGkeEltvzT
	Ndf5wv9+r7CUDeFypHCKOdLZBeLu+duKsWNZV05M5YdrQtdevGaWW6zjWbt581CA76qEQBFEF5TwH
	edmlRFwakYcVKs017gDjjLW5nhzGLxJQb7DFYNBkg85B2hwDXIzdadzkcQErMNJslAaay9EtLEsaG
	DJfIat4Um5X012iyKIlWGRIIxOPAxtfR8dZVC8JPbNV3bKJDgseEVnIC22h8zgyBwUVdKoZbGAmLR
	niGA/UEcUv4vAwFudlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvUo-0000000GB6e-1Uur;
	Fri, 15 Mar 2024 00:32:26 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTg-0000000G0EB-2OiO
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:17 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e6b55ae0c2so1555345b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458829; x=1711063629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pXWQ17U6pSp+5gsIGCX5tAdB4RHln2KoUo+gy6g2jBc=;
        b=SiHGimg8I2RRaakVy1rBBIz4adwC+pbgNiHF9QQQwCtg8SfPYDdfHi+eD0BByuHC9C
         +duy2YGh77ppdc2SXxMIGg4G5xYhmx8N79n3ewm/yGG1iwVvKnSDcMkJK1d5hyfkab53
         NNwm1gjEFOKEYEXbLxz5ftD+/bdI5vJmdkXku00JJKDjUgUlWulI7r/Gvh8yLPyLixwW
         EGZ0KoI6rQ5I7++iOxbpZP7ZVjB8fq0sX7u/SIOe3IJWBSsSc0YkAUe/osFUTuvybdCl
         PUnBCac4wNCJepsnXAEG/V58sn7mZBQi0OnWNztOaJ0naqYJHSj30X2IEeqO492wffah
         QN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458829; x=1711063629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXWQ17U6pSp+5gsIGCX5tAdB4RHln2KoUo+gy6g2jBc=;
        b=oolFTggpfe48dsYvz4EyhZ8nZuItvS8TopzQiDHb14h+GAcnnLm+Nk3tKUQlB+L+Zo
         Gkvv2GF6i8yCQdQZNiu3uplSqWJSLcGmIR9WXpR4l4sTxPIFpdyli5SLGlf4Z1lO5uy9
         5pjwj61hq5E9VT4IeDFhbBWhXoRd8M9v7MFjNVzLE91rMao0AvRKSzyQuVXAdptZtEmn
         4YWyp4Nioz0hNICWIImPiBUNqZ4a/hhZ6kQYZ4NnsyQrGt2LNw5iPSU0KwCESeMRoxbC
         pKtRxfHRNnUhGt3CtAPmSU2jJyMep3H19HsDQLyZGysSlmUSTqY5LVJUtyvjJ091XsAv
         mV8w==
X-Forwarded-Encrypted: i=1; AJvYcCUB7+8N2vq+GR0mLTH/Y/fFOjXOAoFoVhD27ccO34SwpjZvr6ifgCIVXjWsBBUXfPb/FJ3QZqxjSxbPIRsJefwiXxb+juycHbHoroS8sxU1
X-Gm-Message-State: AOJu0Yw7T12rNviPHXNYvGeYl8X7yI3EbrCutUWZPv82/OQX8GM5/WtM
	ChzZbIzYzw2pmB0gqqO0VCq+30QgGumvV47XFxqq2GFctp8FIWxWIqS18I1bS45wA10NZQq0yH3
	mOg==
X-Google-Smtp-Source: AGHT+IGB88xDhOmLkYM8uO8zQxI10w4y/bqJWwoieXGYn8llJcu4nyCnZH6T1De8EEh7OBqPBXy+MKkQjwI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9298:b0:6e6:c3bc:721e with SMTP id
 jw24-20020a056a00929800b006e6c3bc721emr129688pfb.1.1710458829531; Thu, 14 Mar
 2024 16:27:09 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:35 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-17-seanjc@google.com>
Subject: [PATCH 16/18] KVM: selftests: Add macro for TSS selector, rename up
 code/data macros
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
X-CRM114-CacheID: sfid-20240314_162712_912253_DD96C836 
X-CRM114-Status: GOOD (  10.93  )
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

Add a proper #define for the TSS selector instead of open coding 0x18 and
hoping future developers don't use that selector for something else.

Opportunistically rename the code and data selector macros to shorten the
names, align the naming with the kernel's scheme, and capture that they
are *kernel* segments.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c       | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 03b9387a1d2e..67235013f6f9 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -15,8 +15,9 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define DEFAULT_CODE_SELECTOR 0x8
-#define DEFAULT_DATA_SELECTOR 0x10
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
 
 #define MAX_NR_CPUID_ENTRIES 100
 
@@ -547,11 +548,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);
-	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
-	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
-	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
-	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
+	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
+	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
+	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
+	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
+	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
@@ -620,8 +621,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
-		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-			DEFAULT_CODE_SELECTOR);
+		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
 
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 }
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
