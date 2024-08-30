Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA1CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbrxhohE5MXD+1xfBUdFsjJLAHS8gkyt91QchlBE1CQ=; b=tpQ+yaNaOqXF+R
	oe07rFNQrmK+IgFcuOX4w62x1bXvxsDLKNaQuSp0DnrKFThSqQyc102cwSin5crhSnVQRuPWESg3x
	PFZ+5hBldrXQ/0NmC+ZVx78PBDAV2dSkWKzfbTQgR0q37qkbJbtsYfR5aJNwX6d/g8iX9PolOJXL/
	k2eP81Zr9gHwf1v3WstCojRg3PMBqBTv2QdQuob6IrEmmYncNKAkbpoZK4Ik/NG50RUIhQ0vjxWzo
	QxRlz/xk+fllct+piXd1MlkBZrYVDy1/dyrej0x6fiudDOLNJ3SwapC9wRajwqHSOzkqqNyF+T7VG
	Dyxbx8uYpKM9cKQSr6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtT6-00000004hYg-1KBn;
	Fri, 30 Aug 2024 04:42:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtN4-00000004fvD-187g
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:27 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7d1fa104852so1336194a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992585; x=1725597385; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ifnPkNWOuuY4EYgQ8TsiC+nc4mt99+bHFrgN10JBfbg=;
        b=pU+0BqGTZS4BkaspSw0WI1rf2upQPjrmdn5sSTUzyDEzA3f5qcKHK3QE4UsZ+I5xkd
         5id732Y3JHlLEODAf9Ip5mb5fivY//j2hwPNCKXeBOnHvB25/OhHezpmokngspXfkX6Q
         o9rYP/KsljoV+3UQul9Wn10T6TwqRONs5F2HkORT2Y+Eo7WZ+FAP7GXnnmOE2dPWz4Er
         qh4tg5Pad5ExFuowlUewsB7XHDlg7hVzJE6RkSJUvBpIyuV8y1HK0GYTy2mufKKCzIlD
         dn6pJEqaZudybubfqojnJ2Mb3/9FW+ENkUbmsMeX2DCAojS7NCotd9UDcDVqkDnjEdFl
         7XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992585; x=1725597385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifnPkNWOuuY4EYgQ8TsiC+nc4mt99+bHFrgN10JBfbg=;
        b=JxUChSFRJCsi3Numi4d2twpQZ+rJ8trodr2NjWnuxeobRWzM22J+6IRRcUfjZNWzgj
         ZnioQaM3nVFOlkromhUiy2tFnmUQLDiIHHyTAh8bVtLM7+5mL38mSKj+Kl449TspMD3J
         /PXO//YMjFUnmR9AAKd6fh/jFjtmkX1HSQQlNHokkdpdTw2+jwhmtSWPJA7Cko1emW7x
         NjP4TLgj/TEcobvHSHEnwoQdnBeXT8j7ohH/w9kJmigfZ1RnXZZzSyhSc9/UUl+/96ux
         pIOQER1cN/nhnKrCaQ67mUmkXHSqHAc/oPPyJPmWxOtaAKZ5g1XuQhsJeNckOJWbibQu
         TYug==
X-Forwarded-Encrypted: i=1; AJvYcCWwvc9BmIbPdyD4wDPs7y2OACarttsU3PQgZLrzRfP+57zqN6QKtocAr+O7lT+hqVLttshN/xOmoucMzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww5E+A9wTemhTp/QeVupPgSfpPSgmUV2g/9RUk0WYYLHiP0Shs
	yBfTTfVmaGzN/UZZwUTcxkXQvM/DyELQgxYETG9fTAn3oPnB0sZZaZl9dJpQ2kjTBaL/H5JDoMB
	spw==
X-Google-Smtp-Source: AGHT+IFbr9dMQrR+mXp/rGgRu95zX7CYqRN/pGYBvf5wJW9KzwkznUNDOT/XrC79C9bzXvvgnK+ABsLgkRI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2310:b0:202:3bed:1dab with SMTP id
 d9443c01a7336-20527a4fdc0mr46745ad.6.1724992584767; Thu, 29 Aug 2024 21:36:24
 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:36:00 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-11-seanjc@google.com>
Subject: [PATCH v4 10/10] KVM: x86: Register "emergency disable" callbacks
 when virt is enabled
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
X-CRM114-CacheID: sfid-20240829_213626_390769_608A84EA 
X-CRM114-Status: GOOD (  16.75  )
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

Register the "disable virtualization in an emergency" callback just
before KVM enables virtualization in hardware, as there is no functional
need to keep the callbacks registered while KVM happens to be loaded, but
is inactive, i.e. if KVM hasn't enabled virtualization.

Note, unregistering the callback every time the last VM is destroyed could
have measurable latency due to the synchronize_rcu() needed to ensure all
references to the callback are dropped before KVM is unloaded.  But the
latency should be a small fraction of the total latency of disabling
virtualization across all CPUs, and userspace can set enable_virt_at_load
to completely eliminate the runtime overhead.

Add a pointer in kvm_x86_ops to allow vendor code to provide its callback.
There is no reason to force vendor code to do the registration, and either
way KVM would need a new kvm_x86_ops hook.

Suggested-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/svm/svm.c          |  5 +----
 arch/x86/kvm/vmx/main.c         |  2 ++
 arch/x86/kvm/vmx/vmx.c          |  6 +-----
 arch/x86/kvm/vmx/x86_ops.h      |  1 +
 arch/x86/kvm/x86.c              | 10 ++++++++++
 6 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index cb3b5f107c6e..aa9eea61a092 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -36,6 +36,7 @@
 #include <asm/kvm_page_track.h>
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/hyperv-tlfs.h>
+#include <asm/reboot.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
 
@@ -1631,6 +1632,8 @@ struct kvm_x86_ops {
 
 	int (*enable_virtualization_cpu)(void);
 	void (*disable_virtualization_cpu)(void);
+	cpu_emergency_virt_cb *emergency_disable_virtualization_cpu;
+
 	void (*hardware_unsetup)(void);
 	bool (*has_emulated_msr)(struct kvm *kvm, u32 index);
 	void (*vcpu_after_set_cpuid)(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a9adbe10c12e..9a0506ef87df 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4982,6 +4982,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.hardware_unsetup = svm_hardware_unsetup,
 	.enable_virtualization_cpu = svm_enable_virtualization_cpu,
 	.disable_virtualization_cpu = svm_disable_virtualization_cpu,
+	.emergency_disable_virtualization_cpu = svm_emergency_disable_virtualization_cpu,
 	.has_emulated_msr = svm_has_emulated_msr,
 
 	.vcpu_create = svm_vcpu_create,
@@ -5410,8 +5411,6 @@ static struct kvm_x86_init_ops svm_init_ops __initdata = {
 static void __svm_exit(void)
 {
 	kvm_x86_vendor_exit();
-
-	cpu_emergency_unregister_virt_callback(svm_emergency_disable_virtualization_cpu);
 }
 
 static int __init svm_init(void)
@@ -5427,8 +5426,6 @@ static int __init svm_init(void)
 	if (r)
 		return r;
 
-	cpu_emergency_register_virt_callback(svm_emergency_disable_virtualization_cpu);
-
 	/*
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 4a5bf92edccf..7e2e78a14257 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -25,6 +25,8 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.enable_virtualization_cpu = vmx_enable_virtualization_cpu,
 	.disable_virtualization_cpu = vmx_disable_virtualization_cpu,
+	.emergency_disable_virtualization_cpu = vmx_emergency_disable_virtualization_cpu,
+
 	.has_emulated_msr = vmx_has_emulated_msr,
 
 	.vm_size = sizeof(struct kvm_vmx),
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cf7d937bfd2c..89682832dded 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -755,7 +755,7 @@ static int kvm_cpu_vmxoff(void)
 	return -EIO;
 }
 
-static void vmx_emergency_disable_virtualization_cpu(void)
+void vmx_emergency_disable_virtualization_cpu(void)
 {
 	int cpu = raw_smp_processor_id();
 	struct loaded_vmcs *v;
@@ -8584,8 +8584,6 @@ static void __vmx_exit(void)
 {
 	allow_smaller_maxphyaddr = false;
 
-	cpu_emergency_unregister_virt_callback(vmx_emergency_disable_virtualization_cpu);
-
 	vmx_cleanup_l1d_flush();
 }
 
@@ -8632,8 +8630,6 @@ static int __init vmx_init(void)
 		pi_init_cpu(cpu);
 	}
 
-	cpu_emergency_register_virt_callback(vmx_emergency_disable_virtualization_cpu);
-
 	vmx_check_vmcs12_offsets();
 
 	/*
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 205692c43a8e..b6a7cfc6ae31 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -15,6 +15,7 @@ void vmx_hardware_unsetup(void);
 int vmx_check_processor_compat(void);
 int vmx_enable_virtualization_cpu(void);
 void vmx_disable_virtualization_cpu(void);
+void vmx_emergency_disable_virtualization_cpu(void);
 int vmx_vm_init(struct kvm *kvm);
 void vmx_vm_destroy(struct kvm *kvm);
 int vmx_vcpu_precreate(struct kvm *kvm);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 431358167fa8..f72e5d89e942 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12512,6 +12512,16 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_deliver_sipi_vector);
 
+void kvm_arch_enable_virtualization(void)
+{
+	cpu_emergency_register_virt_callback(kvm_x86_ops.emergency_disable_virtualization_cpu);
+}
+
+void kvm_arch_disable_virtualization(void)
+{
+	cpu_emergency_unregister_virt_callback(kvm_x86_ops.emergency_disable_virtualization_cpu);
+}
+
 int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
