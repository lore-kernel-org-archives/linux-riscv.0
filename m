Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fC9ozdJD3Jlela0D0lb+yGI7W0oRJFebyTOirq1RAsc=; b=sJgY2gxjqv9qLZ
	dxn+frgGKSTMQzhU1xySeko9img318BKBv+K1nTng1J4/1CxwesOtyh2yyg/mHlnGd6VFB2XL5l+e
	BuVRpQLqvTvDRHDtPvjVXluDlnmRZb/OmgVw22brY40duYh7J6FY8EkTu0kn7s3TtlWZkik+bVrPv
	hVV9FRviuBo0SLKTBWq0M7u3G/L4L5OI6boXX61BbXgbSJOmIJ9qgmjUVx3yGEizaRTpYlzfDxrsL
	vlVK2Xntc6D67XXtnjmX5iteDWZFfVH36ZN1siIPMg2BN0jZAayTGKnFYvSIbZCpQsWQ+33LteYvp
	35JL+x6brJGL+vCgZigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO7F-00FJzb-Ur; Thu, 03 Nov 2022 00:29:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5k-00FJ6v-RW
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FB9/txOY21wW/TPsgqc6j4ZQ11jhPkkdawz9sPCSXNA=; b=EDwp+stAcHKTKKnmbwh6vQQWrm
	gfKcnV/W0dhqun3P7LlrEPjVDhC5R+0S+4ZLi/ZgPcyYqw32ol2TIIuMRP2J3/AZpoVULGk6ZUfGX
	XLidxP8SnzfW5ibDrtnJS1yewkrpi5X07AbtAajGIuqsbn8B8jftoeCubSLBOsiSQfDqICAFwVoxl
	oHS0Vq0A7lcVeiFJjXSUyZsFXVxcCzXG4LkqtFxj0K3D4hRwSiWXZYI4uZZVjoEYEHRb9v3EGRCHz
	R4TG3lg8SM1plrhU4mrb2pV9NJeJWW1/WwlTvCfZepFKiu+8mAyI3JSYVzkBcqnULOELpAbKsKydJ
	gANKch9A==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1q-008X42-NC
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id x18-20020a170902ec9200b001869f20da7eso228715plg.10
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FB9/txOY21wW/TPsgqc6j4ZQ11jhPkkdawz9sPCSXNA=;
        b=Gh0pNKJAjUP7sOLxgeINR/cbIHMm/TCvJmesgDmGY7tgu6P6YXBVfYIXTfojpYFhsq
         HkT9AYvu2cJGezPMeBp64lBMsTUd9ONRFB5hypdMyN7za0hetccYQckOK26B+CDbxF6r
         +OhS46uwFsSqDvUawxhpwU4TdzcYBw50A+ZMoD8n+DmjlNK3aB9aXy9DkBx+JSHJ6ISO
         pjQ1VfDtpdTwM/Mhh3TXxzf4TORrG3FqJQ2hX6AUGnQSwf155R85whsuIiWoEQQ1/uAN
         5ZiQXw1v8DLP7PBHC5uyXihM2rPnRlLj9wclnfoxTX04fyoZeThV5J1v6/TU+dV2434R
         khBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB9/txOY21wW/TPsgqc6j4ZQ11jhPkkdawz9sPCSXNA=;
        b=3Embea1NTKna322pwiWN79eyiT1fI9r4agner9wvPkPXWKXCZ3NVk/uzs+RkwFi+Eb
         jhvvT+zKuwcZo3ezU4QKbtpZfUOjkzT14hf3ObuW3RojUBZH9HesSOhIU5s160fncNWp
         wGYTzGhAb2rrP1v1vieO4AafTKkLQkqb6P0NtDG0L9WN8CfbjU0Mm+ANTG8qN+5CqwyW
         SP7dgh86Adwpy9bX4KpLfY8AqgWo1Ly7gOUBhIgM5T8XL+aHn6coobf4yWloX0+leiao
         6hP2np8nIymcbLUj/1skVyxUu9bjIhSa9c1WtUmJwBG6Hh2zanZ/OvtJF2nsKBVH2CgO
         0zTA==
X-Gm-Message-State: ACrzQf06hQQNf2pfEke2fauAdvGTUC5ZCZ+PtibRcQ0jWmuoYpZYruom
	y+pIyskYeENKSnqmLbgCjaIrnFTr2/k=
X-Google-Smtp-Source: AMsMyM7nfKY/wHJ8tA5FRpJD6/RIsVOrpmudYjvQ2DhJNYVckSrzlEN04CTpOiyaCyk531P1edibX7B9dbc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:3698:b0:56d:3180:e88f with SMTP id
 dw24-20020a056a00369800b0056d3180e88fmr24063664pfb.66.1667431212769; Wed, 02
 Nov 2022 16:20:12 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:01 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-35-seanjc@google.com>
Subject: [PATCH 34/44] KVM: VMX: Shuffle support checks and hardware enabling
 code around
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
X-CRM114-CacheID: sfid-20221102_232014_945895_5E5FC8F7 
X-CRM114-Status: GOOD (  16.82  )
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

Reorder code in vmx.c so that the VMX support check helpers reside above
the hardware enabling helpers, which will allow KVM to perform support
checks during hardware enabling (in a future patch).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 212 ++++++++++++++++++++---------------------
 1 file changed, 106 insertions(+), 106 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2a7e62d0707d..07d86535c032 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2485,77 +2485,6 @@ static void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	}
 }
 
-static int kvm_cpu_vmxon(u64 vmxon_pointer)
-{
-	u64 msr;
-
-	cr4_set_bits(X86_CR4_VMXE);
-
-	asm_volatile_goto("1: vmxon %[vmxon_pointer]\n\t"
-			  _ASM_EXTABLE(1b, %l[fault])
-			  : : [vmxon_pointer] "m"(vmxon_pointer)
-			  : : fault);
-	return 0;
-
-fault:
-	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
-		  rdmsrl_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
-	cr4_clear_bits(X86_CR4_VMXE);
-
-	return -EFAULT;
-}
-
-static int vmx_hardware_enable(void)
-{
-	int cpu = raw_smp_processor_id();
-	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
-	int r;
-
-	if (cr4_read_shadow() & X86_CR4_VMXE)
-		return -EBUSY;
-
-	/*
-	 * This can happen if we hot-added a CPU but failed to allocate
-	 * VP assist page for it.
-	 */
-	if (static_branch_unlikely(&enable_evmcs) &&
-	    !hv_get_vp_assist_page(cpu))
-		return -EFAULT;
-
-	intel_pt_handle_vmx(1);
-
-	r = kvm_cpu_vmxon(phys_addr);
-	if (r) {
-		intel_pt_handle_vmx(0);
-		return r;
-	}
-
-	if (enable_ept)
-		ept_sync_global();
-
-	return 0;
-}
-
-static void vmclear_local_loaded_vmcss(void)
-{
-	int cpu = raw_smp_processor_id();
-	struct loaded_vmcs *v, *n;
-
-	list_for_each_entry_safe(v, n, &per_cpu(loaded_vmcss_on_cpu, cpu),
-				 loaded_vmcss_on_cpu_link)
-		__loaded_vmcs_clear(v);
-}
-
-static void vmx_hardware_disable(void)
-{
-	vmclear_local_loaded_vmcss();
-
-	if (cpu_vmxoff())
-		kvm_spurious_fault();
-
-	intel_pt_handle_vmx(0);
-}
-
 /*
  * There is no X86_FEATURE for SGX yet, but anyway we need to query CPUID
  * directly instead of going through cpu_has(), to ensure KVM is trapping
@@ -2781,6 +2710,112 @@ static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
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
+static int __init vmx_check_processor_compat(void)
+{
+	struct vmcs_config vmcs_conf;
+	struct vmx_capability vmx_cap;
+
+	if (!kvm_is_vmx_supported())
+		return -EIO;
+
+	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
+		return -EIO;
+	if (nested)
+		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
+	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
+		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
+		return -EIO;
+	}
+	return 0;
+}
+
+static int kvm_cpu_vmxon(u64 vmxon_pointer)
+{
+	u64 msr;
+
+	cr4_set_bits(X86_CR4_VMXE);
+
+	asm_volatile_goto("1: vmxon %[vmxon_pointer]\n\t"
+			  _ASM_EXTABLE(1b, %l[fault])
+			  : : [vmxon_pointer] "m"(vmxon_pointer)
+			  : : fault);
+	return 0;
+
+fault:
+	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
+		  rdmsrl_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
+	cr4_clear_bits(X86_CR4_VMXE);
+
+	return -EFAULT;
+}
+
+static int vmx_hardware_enable(void)
+{
+	int cpu = raw_smp_processor_id();
+	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
+	int r;
+
+	if (cr4_read_shadow() & X86_CR4_VMXE)
+		return -EBUSY;
+
+	/*
+	 * This can happen if we hot-added a CPU but failed to allocate
+	 * VP assist page for it.
+	 */
+	if (static_branch_unlikely(&enable_evmcs) &&
+	    !hv_get_vp_assist_page(cpu))
+		return -EFAULT;
+
+	intel_pt_handle_vmx(1);
+
+	r = kvm_cpu_vmxon(phys_addr);
+	if (r) {
+		intel_pt_handle_vmx(0);
+		return r;
+	}
+
+	if (enable_ept)
+		ept_sync_global();
+
+	return 0;
+}
+
+static void vmclear_local_loaded_vmcss(void)
+{
+	int cpu = raw_smp_processor_id();
+	struct loaded_vmcs *v, *n;
+
+	list_for_each_entry_safe(v, n, &per_cpu(loaded_vmcss_on_cpu, cpu),
+				 loaded_vmcss_on_cpu_link)
+		__loaded_vmcs_clear(v);
+}
+
+static void vmx_hardware_disable(void)
+{
+	vmclear_local_loaded_vmcss();
+
+	if (cpu_vmxoff())
+		kvm_spurious_fault();
+
+	intel_pt_handle_vmx(0);
+}
+
 struct vmcs *alloc_vmcs_cpu(bool shadow, int cpu, gfp_t flags)
 {
 	int node = cpu_to_node(cpu);
@@ -7466,41 +7501,6 @@ static int vmx_vm_init(struct kvm *kvm)
 	return 0;
 }
 
-static bool __init kvm_is_vmx_supported(void)
-{
-	if (!cpu_has_vmx()) {
-		pr_err("CPU doesn't support VMX\n");
-		return false;
-	}
-
-	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	    !boot_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
-		return false;
-	}
-
-	return true;
-}
-
-static int __init vmx_check_processor_compat(void)
-{
-	struct vmcs_config vmcs_conf;
-	struct vmx_capability vmx_cap;
-
-	if (!kvm_is_vmx_supported())
-		return -EIO;
-
-	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
-		return -EIO;
-	if (nested)
-		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
-	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
-		return -EIO;
-	}
-	return 0;
-}
-
 static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
 {
 	u8 cache;
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
