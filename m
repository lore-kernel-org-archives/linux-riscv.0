Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D14BC5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyCC55PJno07sPNGmfDiwlzbiAzMNis47y+Qj3ne+Y0=; b=RpnGERayNxwprr
	JpqL/2pRrHImaoaahP2418v4kUCLumQcjtD9qybqNAnO3VKg4WJj/fjLz1BDu9YizUGGbYyyF8tUW
	FE+442E+3w3jWCz3Y413QZXw0nmN3cB5BlUHVmuTGhTuH6K17gdF4aiJ2ldh+5efyTkJ+aE/z20oG
	ivvKjCK07nS71GNZlJ1+k7lc4/3zFu7fS8gb+tThrFAkjRp+/4eRSPZLgpdigkcvyAHI4XgbxFOcU
	vmGUrGuzveFoPRD2Igt7h/14OChzZniDmQCAPvWN1qIg80yCuczkHnBG9vbX6geY8Xpg/QAtvp73n
	Ry334aFPP878BB1R1oDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkX-0000000CVwo-42PW;
	Mon, 10 Aug 2026 17:25:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkU-0000000CVu0-0B5V
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:20 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1784125b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382717; x=1786987517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yXeCapJ8O6pFik/pQOiopBCAOlrWUSEybq5ZkCAQJg=;
        b=XFWd7QoAC1iMuIPMOVNLXFRf8plWUH9qvqRRzP2qFXM0hzMn8TI5aQb9EAuXB+MN92
         49v8FOkeDWY8n9FuUC9BORuX3IvQf2ud6jH3DsrIet+b8wosRhx/FHuIJEH4nnMdfykA
         i90fNpPF/ecgtBIWnpGGOUfRBUTOXiV1AIvsDuv2oXS3bupW1zRnXG/D/f7GgnC+ifUh
         gY5MQSzm1cRcM/vNcL+dMIlW7Nfwg3CKSZ8h/j8nijfvM5Z8epBYuy27WBv/IeJcJUdl
         trzXIq03SuEaP0KEmpzo1Wb3qqBnsteceEWiYx2ErvlVTXKxTxQPPa3OjnDGbNqI5E5l
         ucvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382717; x=1786987517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yXeCapJ8O6pFik/pQOiopBCAOlrWUSEybq5ZkCAQJg=;
        b=ZBW2MsPzXGZy/w+8MO5KO7rClvgEKcI560GLr4IACu0lqu3LRwjB3xMtgQyzT/t09G
         hovgVMSnB2STIi51H1z+3l2gY8A1s3wL+d1uRd+6z+KkP3XhOCmmC1B6HeHF5PxUwxIF
         yJ0D/EHI7L0WqkTzaffTlQKWxMxliYkNA5nxlfjcWmu1nze+PU8PZ4YIe+PYBr8I02e0
         19wMV+rTedcZcA4Ijp8Kn5RmTGwyoPA7OT5CSPBo0Se05bf6+t5seMFrfCw38ZntC4S8
         itPEpcC0CmHfHzhhaR0BP3HdK/iN5Ip/QOL5ykAAPQ8Xe+MmR1iJwNcbTNaZT2/1OxLE
         HopQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI8h62iUu0UACtO2GDnHVXLkNL31QzRoRQKFX69DfJjeEwxW0RcyOni4xLV4wK/YK1eAic2+DbxR2mPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMpWRXlNW632R9+AsgFU/TnEfR0hCKm1nvuluVMNrnn/QbIqq
	iFiu8kXGFAYWM/eCo2HFdXMoMpgHcInjo9FDQ7yL4Ex+4RhOaC3pp9aP5yY0A6tnfoo=
X-Gm-Gg: AR+sD10cq22wPk/ZX7wwV+8d4VA7qYcpYl7BYp5+LMPvfMwneVMkm3V8zVow8vAfNv6
	qDI2gLaJAp23iv1t9WNCwjIJm9Wck+DQyQGmqL4LjtGBsgWRsL73w4EeZi8lQJROjkHKWl+X4jw
	O1VXww0Kf3wzNPo6T+GxOdkiposL41NlL+IIUvU+bqUf/DNZMLeb7z9+mRqzwYhAcdg5DEwYKyv
	8Ag0g85uRNAP+zZ5D3i7kAxSYBlj9hpnz29TFD4aOEtj6qejHvfeJv5aaSGKn5xfYopcjKFS04H
	hjJHo4rOnNN2+jNeRow2tflUmQifRxIbWxHyDMwz7TCjk/KEemxVM1QA73Xx3JJipo+ufecx5PR
	CMMqvlI3hq/tcH9oKMm54N1v8mRfPuWFW0vO7lti0V4imyXftbP/uLE9RG4kGcXrJ6/kQA1xoOL
	2c8wdsZPk3c9q2tRcKAAv6bpDsBfDA7KcudplxHoeWgT1y1P3PzRc59q0ZSBy4jxVSJ9bNgwPFy
	D7MBhGzli/loRaTpIwokAIWWVuUTCkpjgDBWiRFsOUgVp7zz6WC9GxpffY6KtxuIA==
X-Received: by 2002:a05:6a00:9295:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f9c95fc09mr2998157b3a.23.1786382717228;
        Mon, 10 Aug 2026 10:25:17 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:16 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [PATCH v5 3/7] riscv: vector: refactor vector context operations
Date: Mon, 10 Aug 2026 12:22:30 -0500
Message-ID: <20260810172255.1532787-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102519_006889_C737039B 
X-CRM114-Status: GOOD (  13.68  )
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

Lift riscv_v_{enable,disable} out of __*vstate_{save,restore,discard} so
that we can reuse some functions without repeatedly turning on/off
vector.

Also, refactor and document about the user context save in preempt_v to
make code more readable.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - rebase on top of the kvm fix[1]
Changelog v4:
 - fix an unused variable warning (Olof)
Changelog v3:
 - new patch since v3
---
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 ++++++--
 arch/riscv/include/asm/vector.h          | 15 ++++++++-------
 arch/riscv/kernel/kernel_mode_vector.c   |  4 ++++
 arch/riscv/kvm/vcpu.c                    |  2 +-
 arch/riscv/kvm/vcpu_vector.c             |  6 +++---
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..f6aba7ade694 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -16,14 +16,18 @@
 #include <asm/vector.h>
 #include <asm/kvm_host.h>
 
-static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_save(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_save(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
-static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_restore(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_restore(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fccf9edb4e6a..e7f9fce5ab43 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -203,7 +203,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	__vstate_csr_save(save_to);
 	if (has_xtheadvector()) {
 		asm volatile (
@@ -232,7 +231,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			".option pop\n\t"
 			: "=&r" (vl) : "r" (datap) : "memory");
 	}
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
@@ -240,7 +238,6 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	if (has_xtheadvector()) {
 		asm volatile (
 			"mv t0, %0\n\t"
@@ -269,14 +266,12 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			: "=&r" (vl) : "r" (datap) : "memory");
 	}
 	__vstate_csr_restore(restore_from);
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_discard(void)
 {
 	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
 
-	riscv_v_enable();
 	if (has_xtheadvector())
 		asm volatile (THEAD_VSETVLI_T4X0E8M8D1 : : : "t4");
 	else
@@ -296,14 +291,14 @@ static inline void __riscv_v_vstate_discard(void)
 		"vsetvl		%0, x0, %1\n\t"
 		".option pop\n\t"
 		: "=&r" (vl) : "r" (vtype_inval));
-
-	riscv_v_disable();
 }
 
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_discard();
+		riscv_v_disable();
 		__riscv_v_vstate_dirty(regs);
 	}
 }
@@ -312,7 +307,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
+		riscv_v_enable();
 		__riscv_v_vstate_save(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -321,7 +318,9 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_restore(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -382,8 +381,10 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		}
 		if (riscv_preempt_v_dirty(prev)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(prev);
 		}
 	} else {
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 5ad93ddf6a10..369a0756d059 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -171,7 +171,9 @@ static int riscv_v_start_kernel_context(void)
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(current);
 		}
 		riscv_preempt_v_set_restore(current);
@@ -215,7 +217,9 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	depth = riscv_v_ctx_get_depth();
 	if (depth == 0) {
 		if (riscv_preempt_v_restore(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_restore(vstate, vstate->datap);
+			riscv_v_disable();
 			__riscv_v_vstate_clean(regs);
 			riscv_preempt_v_reset_flags();
 		}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e2651808e1d3..3d2566647029 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -773,7 +773,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
 		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
 		current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
-		__kvm_riscv_vector_restore(gcntx);
+		kvm_riscv_vector_restore(gcntx);
 		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index ef2eee6ec308..6cfa5c0c7e6c 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -46,7 +46,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_save(cntx);
+			kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
@@ -64,13 +64,13 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vector_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vector_restore(cntx);
 	riscv_v_flags_set(riscv_v_flags() & ~(RISCV_V_VCPU_CTX | RISCV_V_VCPU_NEED_RESTORE));
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
