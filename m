Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDDCCD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plcjLLiYT0sCezBYDpLPOFTa7FFkk3nF1kvc3scWZQ4=; b=dfDsjYdBPk6XLV
	o8nkEg4LOjqZntkwrKiifREhPe5gxR5frLu7k+PUVKm8q27U6i//ZPUMhOB5UexsdBIbtKHlxhkQs
	ziWX/A281rMwlXBi0sZvOIMMGk15lIzC9CqIPGR0Fdq/sEBkN8/rMBcZ9NbfOow5PUBYP3hblTS4E
	vPwqx4qm485iWIQrPZe47ZpmncaGZkcsvPzFS1Xbtxilu08yD7EuyNeULKE9kP1fF317KYZ7neMVS
	hW+iNIUhMd5zCSNHjkF1dnUA4oVXTr5NkYmiWZua9OTY+rgOUr4N5vUXkjcf0ThtASTXEkZXxgz9p
	2C4yYYc/U23+PQOtWsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJER-00BdJZ-03;
	Sat, 16 Sep 2023 00:32:19 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDj-00BcWO-2S
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:42 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81a47e12b5so2554433276.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824294; x=1695429094; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XQRlLqUbNuYp1+FU2drQZXL0G0BiKv3N4ijMXeK3kKU=;
        b=zQXFtQs55sQWzJP2r74/AoNgMQw52YinyTrPKu4Wra6+n4dYwmLau4z69Gmqe0e6b0
         DmbNo/kxuZJTAo+UsdH2c0O6L/gEaC5m4Zcds7K83BS9XNLJwiskGsIBab9u90mVcldS
         higlRY0p8jgLH1jL9G2QwmjEkK+OS2C6nTf9YWle6AAN0ne6pCm9TNYmjtGJzX/WNljA
         Mil/hkKDCB8IZmz1ry1ZEXWzPcf3gBt5bb8HGAhD105ZX2gm+lB43ddYEKtIWzByTqJ2
         +fkofOLLXw07slzGKnrczeX4AZKkHIATTMONf8cL7mpGo1dN9Kp5+sxSkqrM6mJkr3ti
         z2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824294; x=1695429094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQRlLqUbNuYp1+FU2drQZXL0G0BiKv3N4ijMXeK3kKU=;
        b=Z+Zxfcsvarquk6HCEIJxFEXbaoKFyTCNqgt2e8kFviFcpO+tYxPioG0ZGxr6R2j0Ms
         399K+/AN3gIHANtNxw65ORkW6MbdQczpp3BRxp/xDb16DBBLao1Oj28jawb4jlLiwC/5
         x8F4LERnZjWIgpIkMaADuYMVAafpoK+fJvKF/xPp+HlTTEnb+QE5BcEeQylaURoCsPUp
         kbuvz/MVGqpYzHLOP0x160tFcWb3i4RaMeSdVdvS+ROif5Mlvk7hJODTSUf07oM3uEZP
         8syjmvNr7fPwhAu+rKQHvK97G3nzSelJ6H7Zd5ecEoy1f6jsAHK/M3kp6k2uxL/eWShO
         HJIA==
X-Gm-Message-State: AOJu0YzNkxxxt7JB6LKIbggQyVRwNqmMaKRQyFMDVvnu6zQs2bRYZR/Z
	iQYStRzVUOF9Dp8l6W9K/+4Eq4ZmQ0s=
X-Google-Smtp-Source: AGHT+IHBAJpKVTk5K4TnqnuCpKfAMfti0UcZajyltDkU/ESq4jqN2J77nrZn8mACY7DFJ5DSU6KVipQ1KO4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aa6c:0:b0:d7e:a025:2672 with SMTP id
 s99-20020a25aa6c000000b00d7ea0252672mr72126ybi.9.1694824294437; Fri, 15 Sep
 2023 17:31:34 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:59 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-8-seanjc@google.com>
Subject: [PATCH 07/26] x86/idt: Wrap KVM logic with CONFIG_KVM instead of CONFIG_HAVE_KVM
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_173135_832205_92AF04A7 
X-CRM114-Status: GOOD (  15.71  )
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

Wrap all of the IDT-related code that deals with KVM in CONFIG_KVM instead
of CONFIG_HAVE_KVM.  x86 always "has" KVM, i.e. checking CONFIG_HAVE_KVM
is pointless.

Alternatively, the #ifdefs could simply be deleted, but the only potential
value is in printing the number of posted interrupts that end up being
handled by the host, everything else is completely dead code when KVM is
disabled.  And if KVM is disabled, there should not be any posted
interrupts, i.e. NOT wiring up the "dummy" handlers and treating IRQs on
those vectors as spurious is the right thing to do.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/hardirq.h           | 2 +-
 arch/x86/include/asm/idtentry.h          | 2 +-
 arch/x86/include/asm/irq.h               | 2 +-
 arch/x86/include/asm/irq_vectors.h       | 2 +-
 arch/x86/kernel/idt.c                    | 2 +-
 arch/x86/kernel/irq.c                    | 4 ++--
 scripts/gdb/linux/constants.py.in        | 2 +-
 scripts/gdb/linux/interrupts.py          | 2 +-
 tools/arch/x86/include/asm/irq_vectors.h | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/hardirq.h b/arch/x86/include/asm/hardirq.h
index 66837b8c67f1..fbc7722b87d1 100644
--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -15,7 +15,7 @@ typedef struct {
 	unsigned int irq_spurious_count;
 	unsigned int icr_read_retry_count;
 #endif
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 	unsigned int kvm_posted_intr_ipis;
 	unsigned int kvm_posted_intr_wakeup_ipis;
 	unsigned int kvm_posted_intr_nested_ipis;
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 05fd175cec7d..8eef16d0d72b 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -671,7 +671,7 @@ DECLARE_IDTENTRY_SYSVEC(IRQ_WORK_VECTOR,		sysvec_irq_work);
 # endif
 #endif
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_VECTOR,		sysvec_kvm_posted_intr_ipi);
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_WAKEUP_VECTOR,	sysvec_kvm_posted_intr_wakeup_ipi);
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_NESTED_VECTOR,	sysvec_kvm_posted_intr_nested_ipi);
diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
index 836c170d3087..194dfff84cb1 100644
--- a/arch/x86/include/asm/irq.h
+++ b/arch/x86/include/asm/irq.h
@@ -29,7 +29,7 @@ struct irq_desc;
 
 extern void fixup_irqs(void);
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 extern void kvm_set_posted_intr_wakeup_handler(void (*handler)(void));
 #endif
 
diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
index 3a19904c2db6..3f73ac3ed3a0 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -84,7 +84,7 @@
 #define HYPERVISOR_CALLBACK_VECTOR	0xf3
 
 /* Vector for KVM to deliver posted interrupt IPI */
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 #define POSTED_INTR_VECTOR		0xf2
 #define POSTED_INTR_WAKEUP_VECTOR	0xf1
 #define POSTED_INTR_NESTED_VECTOR	0xf0
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index b786d48f5a0f..a9e6363d88c2 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -149,7 +149,7 @@ static const __initconst struct idt_data apic_idts[] = {
 #ifdef CONFIG_X86_LOCAL_APIC
 	INTG(LOCAL_TIMER_VECTOR,		asm_sysvec_apic_timer_interrupt),
 	INTG(X86_PLATFORM_IPI_VECTOR,		asm_sysvec_x86_platform_ipi),
-# ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 	INTG(POSTED_INTR_VECTOR,		asm_sysvec_kvm_posted_intr_ipi),
 	INTG(POSTED_INTR_WAKEUP_VECTOR,		asm_sysvec_kvm_posted_intr_wakeup_ipi),
 	INTG(POSTED_INTR_NESTED_VECTOR,		asm_sysvec_kvm_posted_intr_nested_ipi),
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 11761c124545..35fde0107901 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -164,7 +164,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 #if defined(CONFIG_X86_IO_APIC)
 	seq_printf(p, "%*s: %10u\n", prec, "MIS", atomic_read(&irq_mis_count));
 #endif
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 	seq_printf(p, "%*s: ", prec, "PIN");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->kvm_posted_intr_ipis);
@@ -290,7 +290,7 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_x86_platform_ipi)
 }
 #endif
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 static void dummy_handler(void) {}
 static void (*kvm_posted_intr_wakeup_handler)(void) = dummy_handler;
 
diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index e3517d4ab8ec..054630f511e0 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -129,7 +129,7 @@ LX_CONFIG(CONFIG_X86_MCE_THRESHOLD)
 LX_CONFIG(CONFIG_X86_MCE_AMD)
 LX_CONFIG(CONFIG_X86_MCE)
 LX_CONFIG(CONFIG_X86_IO_APIC)
-LX_CONFIG(CONFIG_HAVE_KVM)
+LX_CONFIG(CONFIG_KVM)
 LX_CONFIG(CONFIG_NUMA)
 LX_CONFIG(CONFIG_ARM64)
 LX_CONFIG(CONFIG_ARM64_4K_PAGES)
diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index ef478e273791..66ae5c7690cf 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -151,7 +151,7 @@ def x86_show_interupts(prec):
         if cnt is not None:
             text += "%*s: %10u\n" % (prec, "MIS", cnt['counter'])
 
-    if constants.LX_CONFIG_HAVE_KVM:
+    if constants.LX_CONFIG_KVM:
         text += x86_show_irqstat(prec, "PIN", 'kvm_posted_intr_ipis', 'Posted-interrupt notification event')
         text += x86_show_irqstat(prec, "NPI", 'kvm_posted_intr_nested_ipis', 'Nested posted-interrupt event')
         text += x86_show_irqstat(prec, "PIW", 'kvm_posted_intr_wakeup_ipis', 'Posted-interrupt wakeup event')
diff --git a/tools/arch/x86/include/asm/irq_vectors.h b/tools/arch/x86/include/asm/irq_vectors.h
index 3a19904c2db6..3f73ac3ed3a0 100644
--- a/tools/arch/x86/include/asm/irq_vectors.h
+++ b/tools/arch/x86/include/asm/irq_vectors.h
@@ -84,7 +84,7 @@
 #define HYPERVISOR_CALLBACK_VECTOR	0xf3
 
 /* Vector for KVM to deliver posted interrupt IPI */
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 #define POSTED_INTR_VECTOR		0xf2
 #define POSTED_INTR_WAKEUP_VECTOR	0xf1
 #define POSTED_INTR_NESTED_VECTOR	0xf0
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
