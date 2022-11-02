Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FDC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDckMSnV9NH1oGM5r4ejpbP2QWUSKOp3hIu3nFBTbDc=; b=HMDDhVqd6lpWRj
	JYDTVUL8LH96xUDH9FbqKh66wkN0W6Cxso3bT9ScZ74HffOQr8kBPsGaoJb7MgRdmpFhiENpwThQ/
	cZUHU9DATEYD2tcfJSFceO3vw5ooiA4khISD23vp8x5xw/t1BVHw77W0sQDDpCb936g9EkKVZr/+9
	WnxvH///suzKXmf5UqNocefhHSTHOR7fU3eI2jb9P/clI0HJ8xZv72K0zhPN/sboHG4mIHrbkXJcu
	yfQ34rDKPrHbUWYIsVNxchFcoShpwMKyfOkG5HGPPurfytoNm2jnVsuBWnsLlTizgfw/ElRhsuiL8
	S0OWQ4Rp67qwjZN8OVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO7e-00FKBU-Mq; Thu, 03 Nov 2022 00:30:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5n-00FJ6v-TH
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AmBoSXR8cwd5lTD1kT3C6jOdPtKlXVWaxLfPcD3i/BA=; b=i1BvDw1KgtGfWlvZWvTKAOu8sH
	uj6PMVmEthnuzi6hRvgImmS/Nl5UXedRWKA726eUq8MgZ/q38ajpvMh9e+CFCLsvwcNrgsQWmKPyc
	3Fu9Zv8yGmsOmE4eVzdn9zuAySzg1s+q/5lbNfDyrK/yvLh3qIJ8HHCNotQQmVfFacHkAdzk1O9pC
	VKeE+rEOKYHJsPMSYC9hJlgC468hEGKt+Luhow5aB+rsBUWMeqwHpZMY95u5ew7PVueA2hwrVsVum
	rqx3WsSDY32DnPi2/aPitCh77OxxcyYDEPpEca9tSI/GMk9U3F221wewcd0DG6O1AWu8kK/u+3G2R
	gotmVBVQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1o-008X3T-To
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-348608c1cd3so879847b3.10
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AmBoSXR8cwd5lTD1kT3C6jOdPtKlXVWaxLfPcD3i/BA=;
        b=A4LFXQvMEiMuZgDhVOBfxgGfRyIfGS+S8KSMnj+Vr9W1tshUJrzjoBHEk2zyBmtuUx
         ogerrpFu4rsjjI/sI3GyvZmyme0dQur1nNIpa5Z0zCZXG96ndtvapZWIKQm2GJMUm5m2
         LsigaHbBSZ9pylAyo4vTxcd3+XJl38XJAsQGQ/ROMpywUqfkt92p6bWAwX/dJ91NOq+7
         S+bmlgrgh9Sl1Z66FSmcHyz+HIbX+iPl1tQMoNqGSmehOlx34qAWN0o2IMklgRvvQzfX
         JiKbV/ERt9lE/slKzawIAY7mBuqZdOCM7HIZwVK+4KXst1IruQyj9ydx+aZdlEy3UNeT
         yvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmBoSXR8cwd5lTD1kT3C6jOdPtKlXVWaxLfPcD3i/BA=;
        b=p8cyGqLYJ052YmhUPo5rYW0jJlAiDEdDjBTmVV7tJ09LpCaI6CBoFwONhJSp5tsWP7
         OD1229ztdNVaNSnUCE4txsVS6B/6wIIDCed7cZp7MhNcwUNmE20uy0uVnwKwFhhqWmgF
         Ahs5soCtoF8x3HOFJen8c0sKB3Da1G2dBvxo+tTOToGCd1l7EMbN2qNZJtV+tbN0iIQB
         ndp9psZbMOZARTYGu9kMhtcVMWf9EEe8GsPIi8Bndf8wqdIfjQWZ12TBOxYHcsZrlvr/
         f8KnR44Ims0tpaBR4H4+SMkEJDAlwJzD8YCZVQgSQ4c/acgcM0Sz7YJfuRXuUbG00ACy
         NsuQ==
X-Gm-Message-State: ACrzQf2D8Q70pxkbdsER8BxIlnNTv5WQud/aj0NgtcXj9LL4kNEZ6OtS
	ScYYjuRT+FiR9+t8cWKlTp+LuYkXmGI=
X-Google-Smtp-Source: AMsMyM5Ng0545HhMYFHs4ZoSEDRiZLF3jo6aiC5mZSOnG1pbbaOXTdJfeIfrQvlziKqnVpV++3ycQpnD44s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:842:b0:370:641a:5c01 with SMTP id
 bz2-20020a05690c084200b00370641a5c01mr178409ywb.250.1667431210754; Wed, 02
 Nov 2022 16:20:10 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:00 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-34-seanjc@google.com>
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in vendor code
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
X-CRM114-CacheID: sfid-20221102_232013_296148_DAB4ECBF 
X-CRM114-Status: GOOD (  17.09  )
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

Do basic VMX/SVM support checks directly in vendor code instead of
implementing them via kvm_x86_ops hooks.  Beyond the superficial benefit
of providing common messages, which isn't even clearly a net positive
since vendor code can provide more precise/detailed messages, there's
zero advantage to bouncing through common x86 code.

Consolidating the checks will also simplify performing the checks
across all CPUs (in a future patch).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 --
 arch/x86/kvm/svm/svm.c          | 38 +++++++++++++++------------------
 arch/x86/kvm/vmx/vmx.c          | 37 +++++++++++++++++---------------
 arch/x86/kvm/x86.c              | 11 ----------
 4 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 58a7cb8d8e96..f223c845ed6e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1666,8 +1666,6 @@ struct kvm_x86_nested_ops {
 };
 
 struct kvm_x86_init_ops {
-	int (*cpu_has_kvm_support)(void);
-	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
 	unsigned int (*handle_intel_pt_intr)(void);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 3c48fb837302..3523d24d004b 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -525,21 +525,28 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
 		vcpu->arch.osvw.status |= 1;
 }
 
-static int has_svm(void)
+static bool kvm_is_svm_supported(void)
 {
 	const char *msg;
+	u64 vm_cr;
 
 	if (!cpu_has_svm(&msg)) {
-		printk(KERN_INFO "has_svm: %s\n", msg);
-		return 0;
+		pr_err("SVM not supported, %s\n", msg);
+		return false;
 	}
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		pr_info("KVM is unsupported when running as an SEV guest\n");
-		return 0;
+		return false;
 	}
 
-	return 1;
+	rdmsrl(MSR_VM_CR, vm_cr);
+	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
+		pr_err("SVM disabled in MSR_VM_CR\n");
+		return false;
+	}
+
+	return true;
 }
 
 void __svm_write_tsc_multiplier(u64 multiplier)
@@ -578,10 +585,9 @@ static int svm_hardware_enable(void)
 	if (efer & EFER_SVME)
 		return -EBUSY;
 
-	if (!has_svm()) {
-		pr_err("%s: err EOPNOTSUPP on %d\n", __func__, me);
+	if (!kvm_is_svm_supported())
 		return -EINVAL;
-	}
+
 	sd = per_cpu(svm_data, me);
 	if (!sd) {
 		pr_err("%s: svm_data is NULL on %d\n", __func__, me);
@@ -4112,17 +4118,6 @@ static void svm_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa,
 	vmcb_mark_dirty(svm->vmcb, VMCB_CR);
 }
 
-static int is_disabled(void)
-{
-	u64 vm_cr;
-
-	rdmsrl(MSR_VM_CR, vm_cr);
-	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE))
-		return 1;
-
-	return 0;
-}
-
 static void
 svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
 {
@@ -5121,8 +5116,6 @@ static __init int svm_hardware_setup(void)
 
 
 static struct kvm_x86_init_ops svm_init_ops __initdata = {
-	.cpu_has_kvm_support = has_svm,
-	.disabled_by_bios = is_disabled,
 	.hardware_setup = svm_hardware_setup,
 	.check_processor_compatibility = svm_check_processor_compat,
 
@@ -5136,6 +5129,9 @@ static int __init svm_init(void)
 
 	__unused_size_checks();
 
+	if (!kvm_is_svm_supported())
+		return -EOPNOTSUPP;
+
 	r = kvm_x86_vendor_init(&svm_init_ops);
 	if (r)
 		return r;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1b645f52cd8d..2a7e62d0707d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2485,17 +2485,6 @@ static void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	}
 }
 
-static __init int cpu_has_kvm_support(void)
-{
-	return cpu_has_vmx();
-}
-
-static __init int vmx_disabled_by_bios(void)
-{
-	return !boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	       !boot_cpu_has(X86_FEATURE_VMX);
-}
-
 static int kvm_cpu_vmxon(u64 vmxon_pointer)
 {
 	u64 msr;
@@ -7477,16 +7466,29 @@ static int vmx_vm_init(struct kvm *kvm)
 	return 0;
 }
 
+static bool __init kvm_is_vmx_supported(void)
+{
+	if (!cpu_has_vmx()) {
+		pr_err("CPU doesn't support VMX\n");
+		return false;
+	}
+
+	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
+	    !boot_cpu_has(X86_FEATURE_VMX)) {
+		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int __init vmx_check_processor_compat(void)
 {
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
 
-	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	    !this_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
+	if (!kvm_is_vmx_supported())
 		return -EIO;
-	}
 
 	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
 		return -EIO;
@@ -8471,8 +8473,6 @@ static __init int hardware_setup(void)
 }
 
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
-	.cpu_has_kvm_support = cpu_has_kvm_support,
-	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
 	.handle_intel_pt_intr = NULL,
@@ -8517,6 +8517,9 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
+	if (!kvm_is_vmx_supported())
+		return -EOPNOTSUPP;
+
 	hv_setup_evmcs();
 
 	r = kvm_x86_vendor_init(&vmx_init_ops);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 39675b9662d7..0c1778f3308a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9309,17 +9309,6 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		return -EEXIST;
 	}
 
-	if (!ops->cpu_has_kvm_support()) {
-		pr_err_ratelimited("no hardware support for '%s'\n",
-				   ops->runtime_ops->name);
-		return -EOPNOTSUPP;
-	}
-	if (ops->disabled_by_bios()) {
-		pr_err_ratelimited("support for '%s' disabled by bios\n",
-				   ops->runtime_ops->name);
-		return -EOPNOTSUPP;
-	}
-
 	/*
 	 * KVM explicitly assumes that the guest has an FPU and
 	 * FXSAVE/FXRSTOR. For example, the KVM_GET_FPU explicitly casts the
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
