Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B822C44501
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 01:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLtE0B1sZ1F51kkda7d+n/GUzqLY/F8lAZLAinj0SVo=; b=iMW1zRUELolb30
	dXtipAUplgrVC9evebXFm4glBPrmuaiEJPw5fCEIl7NTA9wGr9SFmqLFz6iLL4OwkrzzMwEiBf7fU
	XTuyIMXYEWI3x/krpdk7JGi8KC3R3RicocfljyU0beQdsP5TtQWBP6BbOW7TU8Tqb0kd8u1rXRwdb
	0yULWtaHHgTLm8Cx6Nc9pyPkeokTb2wlN4i4bQkCuOFtEpvFIdsTkFxIjMUE6uL8RP/yYLGROzEBN
	NouWCsbK9T00C0Ii3ch2lVxLcIaiCk8KQ3n9Q1s02zdnlFGsKugQKXZjvBJtqMopwcukzIRIOAx6U
	J/Z7aXfHMyz0w9tUEfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN0C-000000067IG-0IVH;
	Sat, 11 Jul 2026 01:59:36 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN09-000000067HD-12Vm
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 01:59:34 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81e83f1f15aso17127637b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783735172; x=1784339972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAtz+7gdOtw8EnUWorzepQXehi9D/YMfmkiiH01gHuw=;
        b=W5S+GD+m2NZPCzrNnDFByMkOGlmztDd9ls887wai7zusTnmZ6YWfrtOTHQiCYerM03
         Dlt40+P2wKrQBAPQ0kcv4SMkORaQ3FJxmMrkyoyfmZcIi0uMG9pOqmNJF9/FXKEFuftB
         GO6OGy0LGyp6wUy6RPuCFhH8TcLMNRHSabEvGrsF8q4L5m+gXqEcr+Y2kfl/ZPlTFO3e
         0WuLhi+1lwp2QLDcpZJEjPMYLQaUi6tpvEGexbfSKAz5g5aHc30qUD8bNmZ12oFKzLkd
         biESEtsXJ/IDMmellWQzPGGfNC87D8cnVii/2O26pkcqosauFtsCJQzwl6/AHUz+YKbF
         G9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783735172; x=1784339972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAtz+7gdOtw8EnUWorzepQXehi9D/YMfmkiiH01gHuw=;
        b=Npigu9B5UXGqPJcV5TSexTonAYCtMGh+aeH7ffBRX2p4nJNzpYChFSSw7PmPNQ4hVb
         ZCGX2OTXf3X9++sD4ZJE85NrWx430jR1o5w8fj1zzKy78pOmKSe+id8SBpRPn0EFPeMp
         5X8tYqT7GQdlvjKSHBKniPv/SbegUD/bA3o5BLAAVPHqr0Lm9ENUaZ1rY1+l3XOzLn8O
         i1y5jeFLeQ1iNiJ2kLA6xVT3jcWVeuUVT5Ff0FwzqzXpwPmAXB9qy0uSVKqKQ9yTFpRw
         3sb3xDMI2IXkQpBmckpL/o8NgT1Xxax8Ok7KfZOFeGkLwCFWovkvK9fpt5oH1hAyE3p0
         TmnA==
X-Forwarded-Encrypted: i=1; AHgh+RriyxHNvJQ+z9ARxTaceHrPS8Rf3KxhG+r6LXK4l/KC5ZrjAiTb9F1YvQQ4HtIiEsNKX0hoXTR17ZSiEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe60SvEjL+qS/esyJtl1oHTCO8vVLRKJRagFUAjiGyYmPUbsE8
	mNPchubPK1164HT+P/9DA6pexRgdNuCSqWQB1LMmJtXmTzsO7p93l31ITEh+BpKcQ4w=
X-Gm-Gg: AfdE7cnWzLXunIb95Rixn6g3bj4rPvIu0LRPsI4+4BN6Pc7OCK7iDKUbCdrfYa+2zJs
	DOgr1lZKVgZeVdaDc92Y9P8zEHUQjVKmoUQxrMUqXtwkiYWJryZ85VPus8aJnczQ6HzyYzlg5hZ
	LCUdE/T6mzOdpMxXBWvtcV5PIyFmkSB0o3V3D2Dw7jS7Uy/7XANrO6L4tO83YXRO+EQ/mWu4gmR
	KM5hMKsC1QYzM7t7HFfNXJV3WUs63m3rWTlWhKG7rSFucHhTbtgIvcT4OfhXc7nSRR8bsu/sIXi
	KYko1A1AtSmO/c7EboouPW/QgT/8LunmkLGbEH/SLUFKS7oENHI7UF3RqTMRv1lLeA3ZvXD71Ok
	MocZl47L45JA9oLwglGUBlcLzfny5IhZi8ZvmzfXJ1uo8Y5cBzJsBTJNCJkN00W94KfB8P/unyt
	KfKbbtNGh0Ljg9rFGN3bQMS8xhRISyXvCLbEBP6YVspSc9aLUU2JHyMgsXN2N9+tGMPhIIR8u2w
	zWveIISKNVTUHIrAXePNQQjcSqS2fxtSPptAZ7s
X-Received: by 2002:a05:690c:6603:b0:81a:dc58:c299 with SMTP id 00721157ae682-81e7bc535ffmr51791277b3.23.1783735172080;
        Fri, 10 Jul 2026 18:59:32 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm61316497b3.14.2026.07.10.18.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:59:31 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v1 2/2] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
Date: Fri, 10 Jul 2026 20:58:30 -0500
Message-ID: <20260711015835.767259-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711015835.767259-1-tchiu@tenstorrent.com>
References: <20260711015835.767259-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_185933_308697_CC18F77D 
X-CRM114-Status: GOOD (  20.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Running vector workloads like perf + mcf on KVM can result in an
unexpected termination due to a vtype corruption. This happens because
the kernel-mode vector (KMV) misattributes the guest's vcpu context as
the user's context and source from a wrong status.VS.

The simplified call chain that results in this problem is shown as
follow:

__riscv_sys_ioctl()
    kvm_arch_vcpu_ioctl_run()
      kvm_riscv_vcpu_exit()
        kvm_riscv_vcpu_sbi_ecall()
          kvm_riscv_vcpu_pmu_ctr_stop()
            kvm_vcpu_write_guest()
              __copy_to_user()
                enter_vector_usercopy()
                  kernel_vector_begin()

kernel_vector_begin() should use the sstatus.VS from guest's vcpu
context instead of task_pt_reg(current). Also, it should not save
guest's v-reg into the user's context memory.

To resolve this, the vcpu context must be correctly saved when KMV is
serving a guest. However, invoking KVM functions directly from generic
RISC-V architecture code introduces a reverse dependency, breaking
builds when KVM is configured as N or M.

Address this by registering an RCU-protected callback for context
flushing. KVM registers this callback at module initialization and
unregisters it on exit. When KMV starts a kernel context, it can now
safely flush the vector context via the callback.

Fixes: ecd2ada8a5e0 ("riscv: Add support for kernel mode vector")
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 ++++++++++++
 arch/riscv/include/asm/processor.h       |  1 +
 arch/riscv/kernel/kernel_mode_vector.c   | 48 +++++++++++++++++++-----
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    |  6 +++
 arch/riscv/kvm/vcpu_vector.c             | 18 +++++++++
 6 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..e36f46de7429 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -35,6 +35,22 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+void kvm_riscv_register_vctx_callback(bool (*func)(void));
+void kvm_riscv_unregister_vctx_callback(void);
+bool kvm_riscv_vcpu_flush_vector(void);
+
+static inline void kvm_riscv_v_init(void)
+{
+	if (has_vector())
+		kvm_riscv_register_vctx_callback(&kvm_riscv_vcpu_flush_vector);
+}
+
+static inline void kvm_riscv_v_exit(void)
+{
+	if (has_vector())
+		kvm_riscv_unregister_vctx_callback();
+}
+
 #else
 
 struct kvm_cpu_context;
@@ -69,6 +85,14 @@ static inline int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 {
 }
+
+static inline void kvm_riscv_v_init(void)
+{
+}
+
+static inline void kvm_riscv_v_exit(void)
+{
+}
 #endif
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec1..e1b1948f4a4c 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -97,6 +97,7 @@ struct pt_regs;
 
 #define RISCV_V_CTX_UNIT_DEPTH		0x00010000
 #define RISCV_KERNEL_MODE_V		0x00000001
+#define RISCV_V_VCPU_NEED_RESTORE	0x00000002
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 307ac369c3d4..a83d5c26d3b2 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -12,12 +12,31 @@
 #include <linux/types.h>
 
 #include <asm/vector.h>
+#include <asm/kvm_vcpu_vector.h>
 #include <asm/switch_to.h>
 #include <asm/simd.h>
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 #include <asm/asm-prototypes.h>
 #endif
 
+static bool (* __rcu kvm_flush_vector_ctx_callback)(void);
+
+void kvm_riscv_register_vctx_callback(bool (*func)(void))
+{
+	if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
+		return;
+
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
+
+void kvm_riscv_unregister_vctx_callback(void)
+{
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, NULL);
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_callback);
+
 static inline void riscv_v_flags_set(u32 flags)
 {
 	WRITE_ONCE(current->thread.riscv_v_flags, flags);
@@ -80,6 +99,19 @@ void put_cpu_vector_context(void)
 		preempt_enable();
 }
 
+static void __riscv_flush_vector_context(void)
+{
+	bool (*vcpu_flush_v_callback)(void);
+
+	/* rcu_deference is protected by get/put_cpu_vector_context() */
+	vcpu_flush_v_callback = rcu_dereference(kvm_flush_vector_ctx_callback);
+	if (vcpu_flush_v_callback && vcpu_flush_v_callback())
+		return;
+
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+}
+
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
 {
@@ -123,7 +155,7 @@ static int riscv_v_stop_kernel_context(void)
 
 static int riscv_v_start_kernel_context(void)
 {
-	struct __riscv_v_ext_state *kvstate, *uvstate;
+	struct __riscv_v_ext_state *kvstate;
 
 	kvstate = &current->thread.kernel_vstate;
 	if (!kvstate->datap)
@@ -141,13 +173,10 @@ static int riscv_v_start_kernel_context(void)
 	}
 
 	/* Transfer the ownership of V from user to kernel, then save */
-	riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
-	if (__riscv_v_vstate_check(task_pt_regs(current)->status, DIRTY)) {
-		uvstate = &current->thread.vstate;
-		__riscv_v_vstate_save(uvstate, uvstate->datap);
-	}
-	riscv_preempt_v_clear_dirty(current);
-	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	get_cpu_vector_context();
+	__riscv_flush_vector_context();
+	put_cpu_vector_context();
+	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
 
@@ -213,8 +242,7 @@ void kernel_vector_begin(void)
 
 	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
-		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+		__riscv_flush_vector_context();
 	}
 
 	riscv_v_enable();
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 0924c75100a2..da8a5f6d4b4d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -14,6 +14,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/kvm_vcpu_vector.h>
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
@@ -76,6 +77,7 @@ static void kvm_riscv_teardown(void)
 {
 	kvm_riscv_aia_exit();
 	kvm_riscv_nacl_exit();
+	kvm_riscv_v_exit();
 	kvm_unregister_perf_callbacks();
 }
 
@@ -170,6 +172,8 @@ static int __init riscv_kvm_init(void)
 
 	kvm_riscv_setup_vendor_features();
 
+	kvm_riscv_v_init();
+
 	kvm_register_perf_callbacks();
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..60288bf6e9be 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -765,6 +765,12 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
+	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
+		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
+		__kvm_riscv_vector_restore(gcntx);
+		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
+	}
+
 	if (kvm_riscv_nacl_sync_sret_available()) {
 		nsh = nacl_shmem();
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..3b94e6e7fec8 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -95,6 +95,24 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 	kfree(vcpu->arch.guest_context.vector.datap);
 	kfree(vcpu->arch.host_context.vector.datap);
 }
+
+bool kvm_riscv_vcpu_flush_vector(void)
+{
+	struct kvm_vcpu *vcpu;
+
+	vcpu = *this_cpu_ptr(kvm_get_running_vcpus());
+	if (vcpu && riscv_isa_extension_available(vcpu->arch.isa, v)) {
+		kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
+						 vcpu->arch.isa);
+
+		if (vcpu->arch.guest_context.sstatus != SR_VS_OFF)
+			current->thread.riscv_v_flags |= RISCV_V_VCPU_NEED_RESTORE;
+
+		return true;
+	}
+	return false;
+}
+
 #endif
 
 static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
