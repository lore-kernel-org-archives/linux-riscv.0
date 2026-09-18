Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D41C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqEyZKzofZXlXLYN1pe1H+DeoDnTvOgNIoSaG88k4+I=; b=njgDN3oCULMV7V
	7Fxuln5COoDS9SvU79AapYtu1R15Xo2NNffrK0OSN07NUEnoFKKqqkLRmmaJ45vdZZYTgvRXxLtES
	qTYTovSByukGE0LjTWsKRIsgJzL3DEk93nzk7wB5Sg/1oSxjcvh0cQGKHeK3mvzPsIAZyAwofYOKF
	VSdw7jm1zeOJZk+kMSdwq0ORGbYtUWf9TxwXqa3JtBJdHIZdEEsjXcye0mJfdJY66eElYzFgwhdgV
	+XrnVa1SlbAQ+6SPFkYDJQkpxOL3sX5jwoSi84bfSphEcr0vaV6ykQYrKE/5KC4qtW7/0yHwVOLbA
	gJauj4BcAyFB6OH1omTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWc-0000000Fact-3W48;
	Fri, 18 Sep 2026 21:53:42 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWZ-0000000Faa5-2Dxy
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:40 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 00721157ae682-895eaf30817so13881697b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768418; x=1790373218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AcazG5orY9zyVEiayUxMbZg1UyeKhBPuhiHnjK3rYU=;
        b=J+UC3t4ZofIm1cagOBhQncV1974vFnYHOEW1kQom8lFd6Tk+G1q9nq5Z6JOfpq/VBW
         HU+L2etB8Ma5HlfyTOT2n3Sn5pZx9drdYHqWljYXR2z/asO6CuuFpdSzzrtQQVD4DbUW
         T8xU3mRtITGFEeOkklaHEwe3KpZz8YbqAKf4fEmXbGRDcoWosC6C20Sl+NVFVLpehABt
         tMerO0G2fqtc7cUffRwDPFJkhcf79+WTB1JVx3jdc3U1eGGj6W/yIc8ea2wNAy7vhSFF
         dyYNL9tB2Wbv0c64t0ZAzDX294yglwyEcgoJqiVThcMNlN5/yw5u8jeboY7i0RChpoI/
         WxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768418; x=1790373218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AcazG5orY9zyVEiayUxMbZg1UyeKhBPuhiHnjK3rYU=;
        b=UCpKf6iwWtK/Y9gpkfK9RG/Og17zD/lRGWtepzLPbBhyhZf6uqWT6HXQ6n9PFfebpg
         qIKkvzEcB6V/ctpJs9yJJLjZVebiOxETGT36TpHHhw1q9e+pmDI6Qf/bOI0+1n/xIUlp
         b8ls70EUhj5OtTkEIOyRPPS+6cQ+w6KWQlWrJ1VaTisXqAJMO3kovF4QVB6xA/PoV/V9
         /E3Ri92Zdc1ye5GBOCux+bbMDMJp4VobYN1hteaCn7Sc4K3PRrOuW0BYyPT5QYI4U3tA
         jFGEHkZYjQsgwRSHHkF9cLgww/DAyEd4opoG03FeIUIOdYOyCLxiR7XwzcUAc9j3oWjX
         RZEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnCnps7xutV4WYqOiDmNRgSRyduS+FRf6fGeW8Z7Q3at3w7Y304cy2rz5P4CxgAKEuSjadCXKfRMjQng==@lists.infradead.org
X-Gm-Message-State: AFuF++l7JF5bkceBNBKLke1hbCzBSEw+q0my5hlrlaTH6RUoiUKOBPGP
	JrTY02qBluRTYqkJBvWslPgEwtlaUpkpvyTeQx/BdvYa6sWtRUs2Qr90EsMMB6mfKiQ=
X-Gm-Gg: AYBFou08brSskfwIzqdRlENpafWNYz2gpddDajE1BZLUX7/uGG2G/9SQdrPcsjkDoL1
	X+RMiXJpDQVD1QuoDxbJ1c8cBpXPzbxLj9WSTqibKzSvO3u64hTmQOYmtyaud7+2nmgrhNnEJPZ
	6rtu7yurl/FG9HuybCRJjW3tzKdLVhY4c5fkde8V7Nd5+MeL1mH8DRiut+7GFDZzHP8wi3CEVK2
	Fh6pKZ4dP7BVIc8yGaOImkUoDJkrlOXicn8rZQ4Uqlf71aE/CgcbokeVTL+AisLPC4e0Rv/7VVJ
	rN7LCfipEE7eEt6C8HqlOFIvH/qQGelZXpsWOqtY4pgnWTfxRyj1x0QQX1txbQuJMGOEyHdgRwy
	YtoqJBqCJhSF21T4Yv2kVtXGBJdY/MwxzSVIXHyI/Q8IQLouNq3+6FkcXGQgaVLjYEYDL25ncO3
	msJXI3rLCZhBkqbKtKsXLj+B6DmbygFcbZXxced9IUdZ49nqsUgnfVfOyZS9LdSjOgyjNGNaaO5
	VH7//fZxIamBZ+izDugxjUYGk1FuCA7p1EK
X-Received: by 2002:a05:690e:4850:b0:672:99e1:11f5 with SMTP id 956f58d0204a3-67299e11736mr155084d50.146.1789768418150;
        Fri, 18 Sep 2026 14:53:38 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:37 -0700 (PDT)
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
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v6 4/8] riscv: vector: refactor vector context operations
Date: Fri, 18 Sep 2026 16:51:18 -0500
Message-ID: <20260918215154.2481482-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145339_590310_623EBB5A 
X-CRM114-Status: GOOD (  13.80  )
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
index 6aa125d66ace..b9538ebd85be 100644
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
@@ -383,8 +382,10 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		} else if (riscv_preempt_v_dirty(prev)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(prev);
 		}
 	} else {
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index b9481a3e40e3..280180114899 100644
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
index bd723e1a685d..71207288a180 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -801,7 +801,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
 		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
 		current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
-		__kvm_riscv_vector_restore(gcntx);
+		kvm_riscv_vector_restore(gcntx);
 		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 536e1b9a8abf..f2d216fece81 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -47,7 +47,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
 		if (riscv_isa_extension_available(isa, V))
-			__kvm_riscv_vector_save(cntx);
+			kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
@@ -65,13 +65,13 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
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
