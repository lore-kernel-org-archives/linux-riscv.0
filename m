Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC5C55196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNVVOkS9M19eje1WWGY3iBClzm+Blbra5TWc9fAUS5E=; b=VT97kIod+CjjrZ
	uchh43DXTuiksaZOhWVhS2s+YTk+pYtcM2AwyoriyYuiqDvIrWFDXWnDrYaEfRXV2ZcToxCqHZQWL
	Vzp7k+0QQckQ684YQGKyl+zQNpCwM3GDB9r9ijnIPuyoeDwSXXqj/UBeovFKt1PMslKW7RyasH56w
	AuW7GUw014d54PBItmczy11JPry7U0Jl9y6DWcu1vMjvFsOS0iv5AfjnaQcPxtoMv0JfbAX1644+i
	X4Gh8zYQ/rj2g1Ua5S7fwl/HY5lyYX+5EAd5Ph315TBC78SLzAAkbp6PeLcev7cTBJy6XgoFOgo5k
	uKze/4iDOUbYolFamxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0b8-00000000Ym9-0Q2T;
	Mon, 03 Aug 2026 21:53:26 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0b4-00000000Ykg-2mVE
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:24 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-497deab2d66so302579b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785794001; x=1786398801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rsg27cKmwmwFYSN/Tt6z7JIfXyXICtofF7M5dCX50wg=;
        b=U0/MMLpMXLo1gWOy6szw4lSjd/ZKTJtcaq9SUy06hxFwzs06rRjJkoVddQoW1wpbp8
         U8k5/gk05WSLUSKMZgwY8nB0xHFwGRyTd1Jr2PfpQ0w+W0vwfJ5lo9aFYahidCsXoFPk
         9Qs9FmDpAqV1OibnV53Bbn+OIztJJ2iIBpLFNeB/nl2+8NLrQd87SZJ519v39z2xr7Ze
         snNo+jYTiKfzwkZ9uWW6wOeUgAgUjX8D4Kqs1rkyhvIIgEvB9InD+LA7/VNwwJflZCnj
         iGJIwSvJWYENsHc1swoWtohaoF0CVgx/dZ54CM8+EFf8GJsG5Fg3grKQ6z9/79B0QLST
         0KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785794001; x=1786398801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rsg27cKmwmwFYSN/Tt6z7JIfXyXICtofF7M5dCX50wg=;
        b=kvS4pVaHPtsL+W9b99w4wo6WTnx7eA3P8iFLzjgjKuaBSTZ0fhYBe2+4vGb4MAETHJ
         mFYWy+2BTfGbBGkwv7cB+Ij+INgZPMzp+zBVLJtyDJ1gKx987n92mJurEZXx5lwxXJYH
         2svXdEl/i1h4bhg+AbJ1zfFWi6yciD08fXQQ3LzCqVr472wVjHIQ+K2DXwn8h6+eAlE2
         zvEXk9QZimiUmIK+MsniDZPgv2yay/bItQjaDKi6wRESovuS5Rj2rxQFJh3c7oCjEF8M
         S0WA5qsPh++EepWo7S8rYb+mqPyiJFoTUyAsODxiiSRd58q9Mbl0tI+KCCOnX1+AQXLM
         7Nyw==
X-Forwarded-Encrypted: i=1; AHgh+RoZWvZD53NnqGf9pjxKjjpEhTFXOoOThGLT8cARXVl7y9CnZZjMc10KWetCW1Tuc2kXyH2SvmMZ1exmnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZsbygr4ZFjko2VTGFfpq6KMmcRuZjDvcuXL0jj326RjFbTlWD
	9hRDYEsSTfHPf2h1IqpNxLPn+MCwjl47QP+qV6dtjcsVWOnYO1QaOU+22ObZtqaqaKk=
X-Gm-Gg: AR+sD10ytfJGNZwGEeBh7MeWERVvTZ3i7RvYeidWFLRmMEmM+xMVYoDr5fRt6OSukmJ
	jW0/VpiNDV1dpWoNb9ap+2pMij13FH8KoBvLRVeBDDQxEBHt8zvHuiWevExPeDOPseuBCqteta7
	w9pwGOxKLmJkzkRXpnjmG00F6yv2z7in94vtVwNaFcgGufcvHVuguW0hC7XFDSjM9fpOZ4HyKn9
	hrK+tGes4UQAnharf2uv3WiOnA5dCm6Wxbaf7rWoSA6+d2IhJV5Mq9wGq9DOLh79G2VhljqsQ60
	scFIzT8E3fUVJ6uxZcKyRqAKpcQlAkz8MiqOyL0R/Hru+jnT3X3d/q0hInKUH77rAPkJ5mDr11K
	r++zTlvUx8w2b0xcJiqkd37fhcvXswwsO6127+o8IRA+V1WbdC0smQ6+sMY18hb3u7G/nZ2yBfN
	04eeKKk5EAVCL8+WV4CtJWLdwXAUafQ5Vy5y2vt8JU2XUlla7nJ35coUDcofKt9eztxDP8bpDpc
	zGu4xAQKPMJn0DKGyU+MrYOzZ0=
X-Received: by 2002:a05:6808:138a:b0:49c:8a0f:f9e2 with SMTP id 5614622812f47-4af989360c2mr1056483b6e.17.1785794001505;
        Mon, 03 Aug 2026 14:53:21 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:21 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Andy Chiu <andybnac@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	dfustini@oss.tenstorrent.com,
	Charlie Jenkins <charlie@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 3/3] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
Date: Mon,  3 Aug 2026 16:52:42 -0500
Message-ID: <20260803215250.824417-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803215250.824417-1-tchiu@tenstorrent.com>
References: <20260803215250.824417-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145322_739705_20B995E9 
X-CRM114-Status: GOOD (  26.71  )
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
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

---
Changelog v5:
 - fix a guest boot fail by moving RISCV_PREEMPT_V out of put_cpu_vector_context
Changelog v3:
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking (Sashiko)
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document the added riscv_v_flags
Changelog v2: address concerns pointed out by sashiko
 - encloses vcpu_flush_v_callback() with rcu_read_{lock,unlock}
 - put riscv_v_start before put_cpu_vector_context() to prevent
   redundant context save
 - protect v context operations against softirqs
 - apply bitmask when reading SR_VS out of guest's sstatus

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 ++++++++++
 arch/riscv/include/asm/processor.h       |  8 ++++
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 59 +++++++++++++++++++-----
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 +++++
 arch/riscv/kvm/vcpu_vector.c             | 22 ++++++++-
 7 files changed, 120 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..6371d5ea5392 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -35,6 +35,22 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+void kvm_riscv_register_vctx_callback(void (*func)(void));
+void kvm_riscv_unregister_vctx_callback(void);
+void kvm_riscv_vcpu_flush_vector(void);
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
index 812517b2cec1..a6a0c3d5a913 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -67,6 +67,12 @@ struct pt_regs;
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
  *    activation of this state disables the preemption. On a non-RT kernel, it
  *    also disable bh.
+ *  - bit 1: tells kvm that the vcpu process has guest context saved in vcpu's
+ *    context memory and need to be restore upon returing back to the guest.
+ *  - bit 2: represents that the vector context has now loaded and belongs to
+ *    the guest kernel. Any non-scheduler context saving routing needs to save
+ *    the register file to vcpu's context memory. The bit is set upon returing
+ *    back to the guest and cleared after loading the host's vector context.
  *  - bits 8: is used for tracking preemptible kernel-mode Vector, when
  *    RISCV_ISA_V_PREEMPTIVE is enabled. Calling kernel_vector_begin() does not
  *    disable the preemption if the thread's kernel_vstate.datap is allocated.
@@ -97,6 +103,8 @@ struct pt_regs;
 
 #define RISCV_V_CTX_UNIT_DEPTH		0x00010000
 #define RISCV_KERNEL_MODE_V		0x00000001
+#define RISCV_V_VCPU_NEED_RESTORE	0x00000002
+#define RISCV_V_VCPU_CTX		0x00000004
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..fffe72a77208 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -58,6 +58,11 @@ static inline u32 riscv_v_flags(void)
 	return READ_ONCE(current->thread.riscv_v_flags);
 }
 
+static inline void riscv_v_flags_set(u32 flags)
+{
+	WRITE_ONCE(current->thread.riscv_v_flags, flags);
+}
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 965c8edbe984..77e98b504485 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -13,16 +13,31 @@
 #include <linux/kvm_types.h>
 
 #include <asm/vector.h>
+#include <asm/kvm_vcpu_vector.h>
 #include <asm/switch_to.h>
 #include <asm/simd.h>
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 #include <asm/asm-prototypes.h>
 #endif
 
-static inline void riscv_v_flags_set(u32 flags)
+static void (* __rcu kvm_flush_vector_ctx_callback)(void);
+
+void kvm_riscv_register_vctx_callback(void (*func)(void))
+{
+	if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
+		return;
+
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
+
+void kvm_riscv_unregister_vctx_callback(void)
 {
-	WRITE_ONCE(current->thread.riscv_v_flags, flags);
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, NULL);
+	synchronize_rcu();
 }
+EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_callback);
+
 
 static inline void riscv_v_start(u32 flags)
 {
@@ -87,6 +102,22 @@ void put_cpu_vector_context(void)
 }
 EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
+static void __riscv_flush_vector_context(void)
+{
+	void (*vcpu_flush_v_callback)(void);
+
+	if (riscv_v_flags() & RISCV_V_VCPU_CTX) {
+		rcu_read_lock();
+		vcpu_flush_v_callback = rcu_dereference(kvm_flush_vector_ctx_callback);
+		vcpu_flush_v_callback();
+		rcu_read_unlock();
+		return;
+	}
+
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+}
+
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
 {
@@ -130,7 +161,7 @@ static int riscv_v_stop_kernel_context(void)
 
 static int riscv_v_start_kernel_context(void)
 {
-	struct __riscv_v_ext_state *kvstate, *uvstate;
+	struct __riscv_v_ext_state *kvstate;
 
 	kvstate = &current->thread.kernel_vstate;
 	if (!kvstate->datap)
@@ -148,13 +179,18 @@ static int riscv_v_start_kernel_context(void)
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
+	/*
+	 *  A voluntary context switch caused by put_cpu_vector_context() can
+	 *  raise the NEED_RESTORE flag if preempt_v starts too early due to a
+	 *  failed risv_v_is_on() check.
+	 *
+	 *  This causes the next context_nesting_end pollute the v-reg from
+	 *  the stale context memory in kernel-mode vector.
+	 */
+	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
 
@@ -220,8 +256,7 @@ void kernel_vector_begin(void)
 
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
index cf6e231e76e2..e2651808e1d3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -603,9 +603,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
+	get_cpu_vector_context();
 	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
 					    vcpu->arch.isa);
+	put_cpu_vector_context();
 
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
@@ -626,9 +628,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
 	kvm_riscv_vcpu_timer_save(vcpu);
+	get_cpu_vector_context();
 	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
 					 vcpu->arch.isa);
 	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+	put_cpu_vector_context();
 
 	if (kvm_riscv_nacl_available()) {
 		nsh = nacl_shmem();
@@ -765,6 +769,14 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
+	/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
+	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
+		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
+		current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
+		__kvm_riscv_vector_restore(gcntx);
+		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
+	}
+
 	if (kvm_riscv_nacl_sync_sret_available()) {
 		nsh = nacl_shmem();
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..ef2eee6ec308 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -56,8 +56,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_restore(cntx);
-		kvm_riscv_vcpu_vector_clean(cntx);
+			riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
 	}
 }
 
@@ -72,6 +71,7 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
 		__kvm_riscv_vector_restore(cntx);
+	riscv_v_flags_set(riscv_v_flags() & ~(RISCV_V_VCPU_CTX | RISCV_V_VCPU_NEED_RESTORE));
 }
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
@@ -95,6 +95,24 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 	kfree(vcpu->arch.guest_context.vector.datap);
 	kfree(vcpu->arch.host_context.vector.datap);
 }
+
+void kvm_riscv_vcpu_flush_vector(void)
+{
+	struct kvm_vcpu *vcpu = *this_cpu_ptr(kvm_get_running_vcpus());
+
+	/*
+	 * Only reached from __riscv_flush_vector_context() when RISCV_V_VCPU_CTX is set, which
+	 * always have kvm_get_running_vcpus non-NULL.
+	 */
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
+	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context, vcpu->arch.isa);
+
+	if ((vcpu->arch.guest_context.sstatus & SR_VS) != SR_VS_OFF)
+		riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
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
