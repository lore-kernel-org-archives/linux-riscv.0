Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FDC53215
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14uJSr5oEaqMqqAWB8sqw7go93P6AgYPPdou4ZHs7LE=; b=1Ib96CbKU9OZeb
	yHd5dbkefoEMiturm4jZdZzJqUt/+qKhwZi/ltT/ToAevuzTDYZBCzy3nDYqSZZizt7ko2quCXC73
	Jq9yADfylobet3sYkY43BUgrmWzt+imPr4G46DvwJw5l+TDe3El0AaTu3N9qrDTqB4gQf//m9a0yc
	r4cOVlpDeiLD5xt+I3kSUFWrxCZDkNTrBimH87YHtjoa+b00//xVnGEj36CjFy93VI+Gw5QpEnr4i
	T2b6jH+DHhy3+ijhxMNVuJfJlAwnZxaiVUhIi1GZ1J9fLXa5RMcRzQJ3eFE6pCpsp/WoYuxZT/O2M
	aHI55dn8RAbUj+YCeSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6S-0000000GscP-2Uco;
	Fri, 24 Jul 2026 16:50:28 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6O-0000000GsYk-1aKT
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:25 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6aae2766d48so490199eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911823; x=1785516623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKuUmlHudjWBXOh7u6EacXcROP7GrHIzAv/I/DwJ+pI=;
        b=XIoe2YkLnUEQGuTHHpvHJC6iiufcbbzu4c4H4NTTUbIH+vfMN0AD5G5Tx8f3kCPQCa
         FnMeCaxBBtomuksbHHPp7iUFEsJoJ9KN+RY65TQVk5T+YLS1xZo6BIqRLhcJv+aQcD7z
         UdzQKkTV3cPpf4wQEbglB/B1OyDYOENTtoXzIT5//1MmpBdMnpvMUExes2Cstzud27R5
         Ccf5GvVxj9sWwHdmZ0+GTK55UqiY2ONTtGM/zbnc6kC9ox+j54pqYuiKqFuSeF/S8xUk
         ozq5GFw5BQmFu2G7OwmP7Lbs07Ej0zBrSuLjwzfYaxmTrzH+Ifu4W4S+EHjV8lErCQkr
         fPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911823; x=1785516623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKuUmlHudjWBXOh7u6EacXcROP7GrHIzAv/I/DwJ+pI=;
        b=I/pTSwZyR4ef6+Vicol0TMvJtWuSgBC3MIV1S+dmBYA+59yNI68Z5FvnR7oyWW1Tob
         Lyy6536z5VCtXn5SH5tDAXT/DnYFbh/xP0ikrwoPnygBEXs+hs06XHQomx1fddFu3wfz
         SAyZxD9wz8jNelMKvx/rSAIrwgrPtFnrE7dZB6fwV6V2r7n2bUf2KCMVmO4fCYbbs/7d
         8peEVECMrlOabY/hDkKLrLTtz0h/hmz4oTvWK2wAXAI4N3ssooidGbcZx1jGYgAsrmjf
         nxQ3oT6ah+Aey4yb63nYIcecH7Wy9blu5OHbBzRxTzDKgUOlZwMaJKcKxQYTk6VKUZAO
         YawA==
X-Forwarded-Encrypted: i=1; AHgh+RrWkgz0CFEFfZUbgbln5c1a55+4r6aZMjAQE/m50Uu0r72UqOv2a0+KU8eJmuiC9LK+qYzCORHJJUNDtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zsrIUbFVg0MY+EcuIozN4uWlpsRcKjABSE6zyDrPCf7NKmeP
	pueC3wwVjQfnqQIB9JIQpD6WjYGv7q+AYZC7e01YYyR4WxNtYgl2fxim2S0fGcN9N7v/fLgrLfl
	rtdy2+vwu1g==
X-Gm-Gg: AR+sD12YDvwe9KOoSvhwByY5aTizrLK3YvFx4hiQP/fy2ZTsmgfkSYrqrUNDa8pV1kd
	3FC8Laqu3FdFMz9qQkrUkSREinZupBp8LXZe5+GyaqJm+Q4Nq6DTjvN14cWazUnitUfnjmed9kg
	Jz12HcBYJBXUXNtW9pn2ll7PF741gm5ub3VkZQAAJmnOU4cq22XohXxWjg1JpaWgSfAAIp3Q2IA
	7u9+YCnz3fItyV9zZJsJZQcO9Z2aiWZRHRZitch1P0gKdCPyne9ze/G+JJ3jYR9f+GPI6uH0m+i
	vp7nR0CxuOPqZvvp1UKS+CTW8+pcPqIbzhKu94xLJ/Ek7r5hv1xA3CHHn1qaC2+UvpCSpZXLvRD
	10ML5hNWebnzmpPxUfEjiqYn2FJCqsOr5nMJqhCHHmY6xWIyeK03tvda8JY+kFu+9Td3bQ4m3fd
	hR99fjelM63Z1NEoc8TxKzchlEcbfXmXBlDAY=
X-Received: by 2002:a05:6820:2910:b0:6aa:eff0:7091 with SMTP id 006d021491bc7-6aaf583e356mr1052622eaf.20.1784911823141;
        Fri, 24 Jul 2026 09:50:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:22 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	Zong Li <zong.li@sifive.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 3/3] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
Date: Fri, 24 Jul 2026 11:49:54 -0500
Message-ID: <20260724165001.2317788-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724165001.2317788-1-tchiu@tenstorrent.com>
References: <20260724165001.2317788-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_095024_445880_6E60A6AA 
X-CRM114-Status: GOOD (  25.02  )
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
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++++++
 arch/riscv/include/asm/processor.h       |  8 ++++
 arch/riscv/include/asm/vector.h          |  5 +++
 arch/riscv/kernel/kernel_mode_vector.c   | 51 ++++++++++++++++++------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++++
 arch/riscv/kvm/vcpu_vector.c             | 22 +++++++++-
 7 files changed, 112 insertions(+), 14 deletions(-)

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
index f76e52de1117..be0f6c7f78da 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -12,16 +12,31 @@
 #include <linux/types.h>
 
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
 {
-	WRITE_ONCE(current->thread.riscv_v_flags, flags);
+	if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
+		return;
+
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
 }
+EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
+
+void kvm_riscv_unregister_vctx_callback(void)
+{
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, NULL);
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_callback);
+
 
 static inline void riscv_v_start(u32 flags)
 {
@@ -86,6 +101,22 @@ void put_cpu_vector_context(void)
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
@@ -129,7 +160,7 @@ static int riscv_v_stop_kernel_context(void)
 
 static int riscv_v_start_kernel_context(void)
 {
-	struct __riscv_v_ext_state *kvstate, *uvstate;
+	struct __riscv_v_ext_state *kvstate;
 
 	kvstate = &current->thread.kernel_vstate;
 	if (!kvstate->datap)
@@ -147,13 +178,10 @@ static int riscv_v_start_kernel_context(void)
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
+	riscv_v_start(RISCV_PREEMPT_V);
+	put_cpu_vector_context();
 	return 0;
 }
 
@@ -219,8 +247,7 @@ void kernel_vector_begin(void)
 
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
