Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166BCA0EDF
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayknfxN8mpOw7sgVGZ2N6Le6iWrPc8iHZXVYOWPZ7Wo=; b=wcPEsr40fflU1/
	Ii+xFER0Vyn6xHml9xegbsIaaQ3wgyJV9PDvXXKtm5W/Qcs9lqmd2Fj9V5M96e9pIbKJT0NQF8PDd
	kw0FnngV0zrQydLa7KHCjwa/VQEB1RuBNZ30oBrRGl66xL2FstDIG4e7k0Lm3f+NvFP1X6dIA5ogD
	v5i3G7Qsu6RK6DH9oIkJzXOouhAZg7F7I3PAF2D32YP7zeb4rGq6keK9ghxQVpkNz+jq9Xk9BgOqm
	vzkRZTSdC6+b7vWzdQtGk0XIAQ/7e+RjTS3bJp9ZIhJ63M4nRYbzjf7yKi/7yhmsHTXqCO5nre/J+
	qyI8STGSgSpevTyojVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtNz-00000004gEM-1qGv;
	Fri, 30 Aug 2024 04:37:23 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMp-00000004flV-3Ill
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-201e49afd9aso22136275ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992571; x=1725597371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9rj6vLr2Zw9u+tL14LjoFTcNuQx6nMKbwDhD6S7zy4M=;
        b=ZeLgRdrjyOyAQkxp6Rj77x+g/6XZjvzqAVAT0YU+MeRySh0cM1xwh604mZI79uliV9
         xBttcuJAY2IQdfF3sdw5qITvfvEdmbtGvZ8Np2BQ80lbo4euVtFoGAZoJZWzZmUQzwv4
         3YoSZPk2Pm77zbWglx2LOSPUhLUYfYSOAnU7iEYd6U90VsLKb2co11NCpWI56BUnA9KP
         2JsHZeC2EGvt/vsQ/jtGA9aAhBB8QhQBWdfFVfxfGHrDX0HGeEFqB4qkp36qEHMFMRxU
         Hnwt8QYpstwAQBspkPv8fypArGdYX1O5RanH8Kd5Bs4xfHa+UlHl75YANLZbW+hiM7x8
         Y77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992571; x=1725597371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rj6vLr2Zw9u+tL14LjoFTcNuQx6nMKbwDhD6S7zy4M=;
        b=UDNCoJGl/yYJgQhnqOp4uY3LPHR0KIr+plGJSHL7BjE4G6FFpSzhSDxr8t4R5yUz7P
         TkX99DyDrcXKlwfu+WwZlu65f90fI8uZ34BEMho4HhyNEzuHiExyseJ7JpdH2CtfCyKo
         BAZdT0F9o7QFcdcMztkf3AzhmghPUEe4hHVoyTqkyZ3xf3VRYX6trdv2ops6AaAbTEW9
         gzS54Lo5S8czuszFAuBtPdHxEy9zAH6QgG0pHcTssMsep13HHnrFftC+8DxAPh0IeF79
         9chTs8PlWfdmvJCXQ99XBBqElJeufHSnhbsR4iUqWWlBgiaXejAN+9c2BsnbERfU37ne
         7HLg==
X-Forwarded-Encrypted: i=1; AJvYcCUXumb1z3rt1/iVoqRptNYqdbE/pdoInddi1jbRPXq1RcM4np5yNJwypu/wLkzsg4KdJuB0bn3NXuu9Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzii+WC0dk/NJIq2YPsc+2yZKs70WWIbRpt2uTi/y4TuEbQ+Ud8
	cfvr0dUbtQ+1WrLAHb9bmhJU878MKiDz1CEV6mYL2zBTEbjmLKBWRWgFu9M+hufLiT1mWqAcuJT
	uug==
X-Google-Smtp-Source: AGHT+IFzNLMOWxStSOb6dz4OqO52HXYFy1OXZpfuDNQs7ORrcRcLluFbTSNdD7idfuIi2MeqpuxkFW/WSPs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:4303:b0:1f9:e5e4:494b with SMTP id
 d9443c01a7336-2050e9aaf54mr110245ad.2.1724992570417; Thu, 29 Aug 2024
 21:36:10 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:53 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-4-seanjc@google.com>
Subject: [PATCH v4 03/10] KVM: Rename symbols related to enabling
 virtualization hardware
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_213611_851363_B49188F4 
X-CRM114-Status: GOOD (  16.20  )
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

Rename the various functions (and a variable) that enable virtualization
to prepare for upcoming changes, and to clean up artifacts of KVM's
previous behavior, which required manually juggling locks around
kvm_usage_count.

Drop the "nolock" qualifier from per-CPU functions now that there are no
"nolock" implementations of the "all" variants, i.e. now that calling a
non-nolock function from a nolock function isn't confusing (unlike this
sentence).

Drop "all" from the outer helpers as they no longer manually iterate
over all CPUs, and because it might not be obvious what "all" refers to.

In lieu of the above qualifiers, append "_cpu" to the end of the functions
that are per-CPU helpers for the outer APIs.

Opportunistically prepend "kvm" to all functions to help make it clear
that they are KVM helpers, but mostly because there's no reason not to.

Lastly, use "virtualization" instead of "hardware", because while the
functions do enable virtualization in hardware, there are a _lot_ of
things that KVM enables in hardware.

Defer renaming the arch hooks to future patches, purely to reduce the
amount of churn in a single commit.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a5826e16a106..fbdd2e46e65b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -136,8 +136,8 @@ static int kvm_no_compat_open(struct inode *inode, struct file *file)
 #define KVM_COMPAT(c)	.compat_ioctl	= kvm_no_compat_ioctl,	\
 			.open		= kvm_no_compat_open
 #endif
-static int hardware_enable_all(void);
-static void hardware_disable_all(void);
+static int kvm_enable_virtualization(void);
+static void kvm_disable_virtualization(void);
 
 static void kvm_io_bus_destroy(struct kvm_io_bus *bus);
 
@@ -1220,7 +1220,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	if (r)
 		goto out_err_no_arch_destroy_vm;
 
-	r = hardware_enable_all();
+	r = kvm_enable_virtualization();
 	if (r)
 		goto out_err_no_disable;
 
@@ -1263,7 +1263,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		mmu_notifier_unregister(&kvm->mmu_notifier, current->mm);
 #endif
 out_err_no_mmu_notifier:
-	hardware_disable_all();
+	kvm_disable_virtualization();
 out_err_no_disable:
 	kvm_arch_destroy_vm(kvm);
 out_err_no_arch_destroy_vm:
@@ -1360,7 +1360,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #endif
 	kvm_arch_free_vm(kvm);
 	preempt_notifier_dec();
-	hardware_disable_all();
+	kvm_disable_virtualization();
 	mmdrop(mm);
 }
 
@@ -5575,13 +5575,13 @@ static struct miscdevice kvm_dev = {
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
-static DEFINE_PER_CPU(bool, hardware_enabled);
+static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
-static int hardware_enable_nolock(void)
+static int kvm_enable_virtualization_cpu(void)
 {
-	if (__this_cpu_read(hardware_enabled))
+	if (__this_cpu_read(virtualization_enabled))
 		return 0;
 
 	if (kvm_arch_hardware_enable()) {
@@ -5590,7 +5590,7 @@ static int hardware_enable_nolock(void)
 		return -EIO;
 	}
 
-	__this_cpu_write(hardware_enabled, true);
+	__this_cpu_write(virtualization_enabled, true);
 	return 0;
 }
 
@@ -5601,22 +5601,22 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * be enabled. Otherwise running VMs would encounter unrecoverable
 	 * errors when scheduled to this CPU.
 	 */
-	return hardware_enable_nolock();
+	return kvm_enable_virtualization_cpu();
 }
 
-static void hardware_disable_nolock(void *junk)
+static void kvm_disable_virtualization_cpu(void *ign)
 {
-	if (!__this_cpu_read(hardware_enabled))
+	if (!__this_cpu_read(virtualization_enabled))
 		return;
 
 	kvm_arch_hardware_disable();
 
-	__this_cpu_write(hardware_enabled, false);
+	__this_cpu_write(virtualization_enabled, false);
 }
 
 static int kvm_offline_cpu(unsigned int cpu)
 {
-	hardware_disable_nolock(NULL);
+	kvm_disable_virtualization_cpu(NULL);
 	return 0;
 }
 
@@ -5635,7 +5635,7 @@ static void kvm_shutdown(void)
 	 */
 	pr_info("kvm: exiting hardware virtualization\n");
 	kvm_rebooting = true;
-	on_each_cpu(hardware_disable_nolock, NULL, 1);
+	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
 static int kvm_suspend(void)
@@ -5651,7 +5651,7 @@ static int kvm_suspend(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	hardware_disable_nolock(NULL);
+	kvm_disable_virtualization_cpu(NULL);
 	return 0;
 }
 
@@ -5660,7 +5660,7 @@ static void kvm_resume(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	WARN_ON_ONCE(hardware_enable_nolock());
+	WARN_ON_ONCE(kvm_enable_virtualization_cpu());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
@@ -5669,7 +5669,7 @@ static struct syscore_ops kvm_syscore_ops = {
 	.shutdown = kvm_shutdown,
 };
 
-static int hardware_enable_all(void)
+static int kvm_enable_virtualization(void)
 {
 	int r;
 
@@ -5712,7 +5712,7 @@ static int hardware_enable_all(void)
 	return r;
 }
 
-static void hardware_disable_all(void)
+static void kvm_disable_virtualization(void)
 {
 	guard(mutex)(&kvm_usage_lock);
 
@@ -5723,12 +5723,12 @@ static void hardware_disable_all(void)
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 }
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
-static int hardware_enable_all(void)
+static int kvm_enable_virtualization(void)
 {
 	return 0;
 }
 
-static void hardware_disable_all(void)
+static void kvm_disable_virtualization(void)
 {
 
 }
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
