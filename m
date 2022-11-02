Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E56C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH5eJXXN2lOzeP1S8fF4nXbXZGjHpPIEcQFe2sm5F7Y=; b=HW5rj5XEXvE0yq
	d2JydA31WsvCGfb8gOtD4HNkT7uZflfYiUrW/SFH6EhyKFiSho2FmpTKeMLT209WsH6wnMOIeQ4Lf
	gWC/iva8pfzcqthne2+K4Pk8qBn8omASM3WUB7cfa9aQRDYeqyyQJ1LkD8iV5JWGwB9nuHFWrBLiw
	JWxzGr5420QBb/Cm3VnbDACiCkc/93oV2mSy3vdS5xTfO5Kkf1ZroOBFPTZc4FlWyG2rEbOW/7AbP
	FuBM7PDzgWUUENMwcjJvXL1gwPunMwZQ202QW/s9yH7zIXtnW/659HduWcapUOSJ2ODD36bVv9N8m
	7G7xH9w4aShTXL4UGIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNBA-00EzOZ-V6; Wed, 02 Nov 2022 23:29:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1t-00Et3W-5Y
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:18 +0000
Received: by mail-yb1-xb49.google.com with SMTP id b142-20020a253494000000b006ca86d5f40fso325041yba.19
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hVDla26eytMn5VFnbgyTVPls5SmrgGd/F0K2RutwtIE=;
        b=iDIyHkMK4rG4gjhR62NbU2u6gdWGP2OsiuMyUm8igYAHn8Yp75bJ9TkqULzcOkedq9
         lrMjOcoojkzBjBrlWbrxKO2hIi08hnG2vGMjy19X2fXFVzh41QfLnOmL8FwroxgO3U/9
         M/y/STwQ9eY7WF8E0/2v/0v9jH+QmXpfdWTDy77I/CMIhnQwVipOJiVFqKmJ5knT8kO6
         /eER3jJeTkGs/T4H5Ju8HiQ1eI0gIKHtbfqcKoWDK8SihPIEH+EjdUsL3+2iNE+kxZKc
         HsZJGEKFI4GV2S8b1QPqcice4sYcmqQ+Iksou1vJeTEdz8AoPZCMtO8nunZ43hRprA3N
         Kt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVDla26eytMn5VFnbgyTVPls5SmrgGd/F0K2RutwtIE=;
        b=fshw1AH4q98Uvl8jpTewkwPgbtN9OBZ1a8rwoa7I1QewL5Lo8+3bkUoCOa1h87DzPr
         Jpw5CX6v9SB9Y3WKzR/7X291Ram2+6Ug4pkAwQXaoDv1dy8nqVH3XH4Dg47jfAYpiD3A
         M3B9d3Bse/wYnRvQn5B4XFJKz3gniVjm0Zqt+Jsoe6uM0K6zcTmS8JFwo2tu0XqItejz
         9CQox43lRKOL9NUnG+DDojvCqEqz8tGwId2/xcfUYHW6mtcbP1+M9IXvbyoKq74wVmpl
         RZTLXsNI3g2wwc+gsoBnSkkLR3NfZNtPT15bKE7tuHutWnxPwdhzoGC3K/Y8MSisQgls
         19uQ==
X-Gm-Message-State: ACrzQf0en5WUSYJd/6i8njVJ2HbiJZ0a1WwGk/AXlxRoI8R+26Z3WAWZ
	WPOgEBYf3vINB486oObp70t/2HqG6t0=
X-Google-Smtp-Source: AMsMyM6yoiTEPBcJzZyJoKfkq9RPyOM1vrXjFEM4y195PpXNkSIWWHhhXy8+p52Rv2+c/CoREZHcmA1s9zk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b10d:0:b0:6cc:3aa3:8cf2 with SMTP id
 g13-20020a25b10d000000b006cc3aa38cf2mr22841832ybj.261.1667431216148; Wed, 02
 Nov 2022 16:20:16 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:03 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-37-seanjc@google.com>
Subject: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_162017_286142_B3349314 
X-CRM114-Status: GOOD (  19.45  )
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

From: Chao Gao <chao.gao@intel.com>

Do compatibility checks when enabling hardware to effectively add
compatibility checks when onlining a CPU.  Abort enabling, i.e. the
online process, if the (hotplugged) CPU is incompatible with the known
good setup.

At init time, KVM does compatibility checks to ensure that all online
CPUs support hardware virtualization and a common set of features. But
KVM uses hotplugged CPUs without such compatibility checks. On Intel
CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
VM-Entry failure if the hotplugged CPU doesn't support all features
enabled by KVM.

Note, this is little more than a NOP on SVM, as SVM already checks for
full SVM support during hardware enabling.

Opportunistically add a pr_err() if setup_vmcs_config() fails, and
tweak all error messages to output which CPU failed.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          | 20 +++++++++++---------
 arch/x86/kvm/vmx/vmx.c          | 33 +++++++++++++++++++--------------
 arch/x86/kvm/x86.c              |  5 +++--
 4 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f223c845ed6e..c99222b71fcc 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
 };
 
 struct kvm_x86_init_ops {
-	int (*check_processor_compatibility)(void);
+	int (*check_processor_compatibility)(int cpu);
 	int (*hardware_setup)(void);
 	unsigned int (*handle_intel_pt_intr)(void);
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index efda384d29d4..4772835174dd 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -525,13 +525,13 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
 		vcpu->arch.osvw.status |= 1;
 }
 
-static bool kvm_is_svm_supported(void)
+static bool kvm_is_svm_supported(int cpu)
 {
 	const char *msg;
 	u64 vm_cr;
 
 	if (!cpu_has_svm(&msg)) {
-		pr_err("SVM not supported, %s\n", msg);
+		pr_err("SVM not supported by CPU %d, %s\n", cpu, msg);
 		return false;
 	}
 
@@ -542,16 +542,16 @@ static bool kvm_is_svm_supported(void)
 
 	rdmsrl(MSR_VM_CR, vm_cr);
 	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
-		pr_err("SVM disabled in MSR_VM_CR\n");
+		pr_err("SVM disabled in MSR_VM_CR on CPU %d\n", cpu);
 		return false;
 	}
 
 	return true;
 }
 
-static int __init svm_check_processor_compat(void)
+static int svm_check_processor_compat(int cpu)
 {
-	if (!kvm_is_svm_supported())
+	if (!kvm_is_svm_supported(cpu))
 		return -EIO;
 
 	return 0;
@@ -588,14 +588,16 @@ static int svm_hardware_enable(void)
 	uint64_t efer;
 	struct desc_struct *gdt;
 	int me = raw_smp_processor_id();
+	int r;
+
+	r = svm_check_processor_compat(me);
+	if (r)
+		return r;
 
 	rdmsrl(MSR_EFER, efer);
 	if (efer & EFER_SVME)
 		return -EBUSY;
 
-	if (!kvm_is_svm_supported())
-		return -EINVAL;
-
 	sd = per_cpu(svm_data, me);
 	if (!sd) {
 		pr_err("%s: svm_data is NULL on %d\n", __func__, me);
@@ -5132,7 +5134,7 @@ static int __init svm_init(void)
 
 	__unused_size_checks();
 
-	if (!kvm_is_svm_supported())
+	if (!kvm_is_svm_supported(raw_smp_processor_id()))
 		return -EOPNOTSUPP;
 
 	r = kvm_x86_vendor_init(&svm_init_ops);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 07d86535c032..2729de93e0ea 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2520,8 +2520,7 @@ static bool cpu_has_perf_global_ctrl_bug(void)
 	return false;
 }
 
-static __init int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt,
-				      u32 msr, u32 *result)
+static int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt, u32 msr, u32 *result)
 {
 	u32 vmx_msr_low, vmx_msr_high;
 	u32 ctl = ctl_min | ctl_opt;
@@ -2539,7 +2538,7 @@ static __init int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt,
 	return 0;
 }
 
-static __init u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
+static u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
 {
 	u64 allowed;
 
@@ -2548,8 +2547,8 @@ static __init u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
 	return  ctl_opt & allowed;
 }
 
-static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
-				    struct vmx_capability *vmx_cap)
+static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
+			     struct vmx_capability *vmx_cap)
 {
 	u32 vmx_msr_low, vmx_msr_high;
 	u32 _pin_based_exec_control = 0;
@@ -2710,36 +2709,38 @@ static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	return 0;
 }
 
-static bool __init kvm_is_vmx_supported(void)
+static bool kvm_is_vmx_supported(int cpu)
 {
 	if (!cpu_has_vmx()) {
-		pr_err("CPU doesn't support VMX\n");
+		pr_err("VMX not supported by CPU %d\n", cpu);
 		return false;
 	}
 
 	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
 	    !boot_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
+		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL on CPU %d\n", cpu);
 		return false;
 	}
 
 	return true;
 }
 
-static int __init vmx_check_processor_compat(void)
+static int vmx_check_processor_compat(int cpu)
 {
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
 
-	if (!kvm_is_vmx_supported())
+	if (!kvm_is_vmx_supported(cpu))
 		return -EIO;
 
-	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
+	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0) {
+		pr_err("Failed to setup VMCS config on CPU %d\n", cpu);
 		return -EIO;
+	}
 	if (nested)
 		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
-	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
+	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config))) {
+		pr_err("Inconsistent VMCS config on CPU %d\n", cpu);
 		return -EIO;
 	}
 	return 0;
@@ -2771,6 +2772,10 @@ static int vmx_hardware_enable(void)
 	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
 	int r;
 
+	r = vmx_check_processor_compat(cpu);
+	if (r)
+		return r;
+
 	if (cr4_read_shadow() & X86_CR4_VMXE)
 		return -EBUSY;
 
@@ -8517,7 +8522,7 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-	if (!kvm_is_vmx_supported())
+	if (!kvm_is_vmx_supported(raw_smp_processor_id()))
 		return -EOPNOTSUPP;
 
 	hv_setup_evmcs();
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c1778f3308a..a7b1d916ecb2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9280,7 +9280,8 @@ struct kvm_cpu_compat_check {
 
 static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 {
-	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+	int cpu = smp_processor_id();
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
 
 	WARN_ON(!irqs_disabled());
 
@@ -9288,7 +9289,7 @@ static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
 		return -EIO;
 
-	return ops->check_processor_compatibility();
+	return ops->check_processor_compatibility(cpu);
 }
 
 static void kvm_x86_check_cpu_compat(void *data)
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
