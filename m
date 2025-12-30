Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EEAEE57C2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ub++L8qgyCNXoInnbgUIX4XGr1mV73T1q0YyWwpmXs=; b=gAMnG+FTWSql3G
	P8B3zkr8GxgjZj1yw3D6zi/9G45nXPUZXaWmDu+vBs9YTb22/sU0S0mpTH5kFkhh677SbAuLYbeyu
	Sup84oRUhR6GIpcj3Eea5RvMSdVTC5Vs9hCrqUbuAr0UtKppkE+hSWqeFD2do6dVJ0KxdAEiYKr8n
	AwBNs347xzVz3wkQkiiP6k1AGsjguotrK6D7NdrMH1Ywt+vzbS/ScmTbRN9JadZGBWaFJz+Qho2zO
	ZxcwYRmbwXjwpqQruiLEkEdgWQQp7C0v6DUYj0D493kJktXPf0LXVU2zgmKQX4h/d7pGJCRCWvuQj
	AIDLnIFWqlJZ0g5jhgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikv-00000005OoE-1trR;
	Tue, 30 Dec 2025 23:03:57 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijN-00000005Mw0-3aj9
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:23 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c21341f56so30783771a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135740; x=1767740540; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=J6aMxlCW9zWw4tw+lh+J4j0Q+W18rvfDg7v6hfZtyes=;
        b=kcFsjqFwF44ju4XH9FLjV3ttp/i7i1pK7ThmWMrlkg4bM4vDcD7hd6HfSFMCAQXID5
         S+7pAAvfgW+nhWKBerbMh93Tsnaz+m5p7NFsuRo4ggO3Uo8yaFffm+Ql2qTJC8mohv7C
         dd0CrUlaLy1Xtpr+FZoyGqYO1t8KLg34FEsqrIUgDBMcW+ypRzBRCqwLee1j4Ufnlv3O
         hgJy0r2pEEuLe4pmkliCcw4JVpssIGbWMr8jVqiVrCQaZxkbh56+Vh27Au3XfWPeN8dT
         E8drMu9r4KkHtLfidZN47o9GaqwN3SolgsCjX9gPaQX2PdC5BpSEKSU5SKY/FDX70ibn
         1sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135740; x=1767740540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6aMxlCW9zWw4tw+lh+J4j0Q+W18rvfDg7v6hfZtyes=;
        b=NVzbhWKJEkgCXt1n2TXDCae8R8kDUE6t1x6Dfloro7shqNuLmXdRDHKOg4WtKo1d1m
         vb74SUTQrizmSCg7P37tDFAXfZmAS/aLSV4xl0Je25c2lE1Oonv1IHAui9MneVHRtf+V
         NksLfJLIZl3kjhnIAujDs4jDNrIuJGnqJTIU9+XxSyGLTYHlZ4VH/MFofWtL5aFyYK+E
         y9p7b9MZBj2N04aiucpyVugYiLh5qi3pBMdO4okjgq1TVUhQLumc17T0k/g1rwS8p324
         5cl0OU4lrNwbnwW+xTrLXCOzIfyNNXPvdQKXbpqzdgFLmdhnrA45SOHFHSPpF/MlVLO3
         1o3w==
X-Forwarded-Encrypted: i=1; AJvYcCW3zANlBSUo3T8j1q7ZhKoSMuqBIqIJhWlJ301Yu8JiaiV6QNBTJ1V8CnCid69Bdn+wyZ++stgUHDr34g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9J9Tey0qxV9nXvOOIkIo+M8AkhV5vc+lwZ0E103uYeUmwlUpH
	3GcOBKfFKOAZGXjcKOQ2MOT1t6qFZ4OI04LczjQkj3fPk9V+fYK44BjMQEE/q/DSUVFwuMVBIRg
	tACRxHw==
X-Google-Smtp-Source: AGHT+IESYs7jwx5GIZk4Cye/l7AaZRkTq4obaLXSbCdWxS8VVf/3eTwf0I/EcUJvNMDTKAMTNzECK0j0uSQ=
X-Received: from pjbkk6.prod.google.com ([2002:a17:90b:4a06:b0:34e:795d:fe31])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:49:b0:343:5f43:933e
 with SMTP id 98e67ed59e1d1-34e921afaf8mr26205194a91.19.1767135740506; Tue, 30
 Dec 2025 15:02:20 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:45 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-17-seanjc@google.com>
Subject: [PATCH v4 16/21] KVM: selftests: Add support for nested NPTs
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150221_967628_72B78A2F 
X-CRM114-Status: GOOD (  15.28  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Implement nCR3 and NPT initialization functions, similar to the EPT
equivalents, and create common TDP helpers for enablement checking and
initialization. Enable NPT for nested guests by default if the TDP MMU
was initialized, similar to VMX.

Reuse the PTE masks from the main MMU in the NPT MMU, except for the C
and S bits related to confidential VMs.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |  2 ++
 .../selftests/kvm/include/x86/svm_util.h      |  9 ++++++++
 .../testing/selftests/kvm/lib/x86/memstress.c |  4 ++--
 .../testing/selftests/kvm/lib/x86/processor.c | 15 +++++++++++++
 tools/testing/selftests/kvm/lib/x86/svm.c     | 21 +++++++++++++++++++
 .../selftests/kvm/x86/vmx_dirty_log_test.c    |  4 ++--
 6 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index d134c886f280..deb471fb9b51 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1477,6 +1477,8 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		    uint64_t nr_bytes, int level);
 
+void vm_enable_tdp(struct kvm_vm *vm);
+bool kvm_cpu_has_tdp(void);
 void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
 void tdp_identity_map_default_memslots(struct kvm_vm *vm);
 void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
diff --git a/tools/testing/selftests/kvm/include/x86/svm_util.h b/tools/testing/selftests/kvm/include/x86/svm_util.h
index b74c6dcddcbd..5d7c42534bc4 100644
--- a/tools/testing/selftests/kvm/include/x86/svm_util.h
+++ b/tools/testing/selftests/kvm/include/x86/svm_util.h
@@ -27,6 +27,9 @@ struct svm_test_data {
 	void *msr; /* gva */
 	void *msr_hva;
 	uint64_t msr_gpa;
+
+	/* NPT */
+	uint64_t ncr3_gpa;
 };
 
 static inline void vmmcall(void)
@@ -57,6 +60,12 @@ struct svm_test_data *vcpu_alloc_svm(struct kvm_vm *vm, vm_vaddr_t *p_svm_gva);
 void generic_svm_setup(struct svm_test_data *svm, void *guest_rip, void *guest_rsp);
 void run_guest(struct vmcb *vmcb, uint64_t vmcb_gpa);
 
+static inline bool kvm_cpu_has_npt(void)
+{
+	return kvm_cpu_has(X86_FEATURE_NPT);
+}
+void vm_enable_npt(struct kvm_vm *vm);
+
 int open_sev_dev_path_or_exit(void);
 
 #endif /* SELFTEST_KVM_SVM_UTILS_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
index 3319cb57a78d..407abfc34909 100644
--- a/tools/testing/selftests/kvm/lib/x86/memstress.c
+++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
@@ -82,9 +82,9 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
 	int vcpu_id;
 
 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX));
-	TEST_REQUIRE(kvm_cpu_has_ept());
+	TEST_REQUIRE(kvm_cpu_has_tdp());
 
-	vm_enable_ept(vm);
+	vm_enable_tdp(vm);
 	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
 		vcpu_alloc_vmx(vm, &vmx_gva);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 29e7d172f945..a3a4c9a4cbcb 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,7 +8,9 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "svm_util.h"
 #include "sev.h"
+#include "vmx.h"
 
 #ifndef NUM_INTERRUPTS
 #define NUM_INTERRUPTS 256
@@ -472,6 +474,19 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void vm_enable_tdp(struct kvm_vm *vm)
+{
+	if (kvm_cpu_has(X86_FEATURE_VMX))
+		vm_enable_ept(vm);
+	else
+		vm_enable_npt(vm);
+}
+
+bool kvm_cpu_has_tdp(void)
+{
+	return kvm_cpu_has_ept() || kvm_cpu_has_npt();
+}
+
 void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
 	       uint64_t size, int level)
 {
diff --git a/tools/testing/selftests/kvm/lib/x86/svm.c b/tools/testing/selftests/kvm/lib/x86/svm.c
index d239c2097391..8e4795225595 100644
--- a/tools/testing/selftests/kvm/lib/x86/svm.c
+++ b/tools/testing/selftests/kvm/lib/x86/svm.c
@@ -59,6 +59,22 @@ static void vmcb_set_seg(struct vmcb_seg *seg, u16 selector,
 	seg->base = base;
 }
 
+void vm_enable_npt(struct kvm_vm *vm)
+{
+	struct pte_masks pte_masks;
+
+	TEST_ASSERT(kvm_cpu_has_npt(), "KVM doesn't supported nested NPT");
+
+	/*
+	 * NPTs use the same PTE format, but deliberately drop the C-bit as the
+	 * per-VM shared vs. private information is only meant for stage-1.
+	 */
+	pte_masks = vm->mmu.arch.pte_masks;
+	pte_masks.c = 0;
+
+	tdp_mmu_init(vm, vm->mmu.pgtable_levels, &pte_masks);
+}
+
 void generic_svm_setup(struct svm_test_data *svm, void *guest_rip, void *guest_rsp)
 {
 	struct vmcb *vmcb = svm->vmcb;
@@ -102,6 +118,11 @@ void generic_svm_setup(struct svm_test_data *svm, void *guest_rip, void *guest_r
 	vmcb->save.rip = (u64)guest_rip;
 	vmcb->save.rsp = (u64)guest_rsp;
 	guest_regs.rdi = (u64)svm;
+
+	if (svm->ncr3_gpa) {
+		ctrl->nested_ctl |= SVM_NESTED_CTL_NP_ENABLE;
+		ctrl->nested_cr3 = svm->ncr3_gpa;
+	}
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
index 370f8d3117c2..032ab8bf60a4 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
@@ -93,7 +93,7 @@ static void test_vmx_dirty_log(bool enable_ept)
 	/* Create VM */
 	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
 	if (enable_ept)
-		vm_enable_ept(vm);
+		vm_enable_tdp(vm);
 
 	vcpu_alloc_vmx(vm, &vmx_pages_gva);
 	vcpu_args_set(vcpu, 1, vmx_pages_gva);
@@ -170,7 +170,7 @@ int main(int argc, char *argv[])
 
 	test_vmx_dirty_log(/*enable_ept=*/false);
 
-	if (kvm_cpu_has_ept())
+	if (kvm_cpu_has_tdp())
 		test_vmx_dirty_log(/*enable_ept=*/true);
 
 	return 0;
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
