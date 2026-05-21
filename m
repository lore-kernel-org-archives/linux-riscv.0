Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9546ACD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+lAx0iZDtJOMNByALnIBsbl08OK3KwM7+2wlk4j+4c=; b=qrCtbTLp7HHkKA
	2pdQMCvs4QtEkifHTjeH+INHvT2Dz4onAO+3XA4qbhPTLrSPF3QjtMF6Mn9Zx7HInrLS+RgInG1Uk
	YeIxst2uFmAF3Albi6TNGEsNvEF4tDTpq4tLGgGKlQ0v9waLPOwyfdU7hGf9xLSfipFiOdTobfEIY
	GDUouKi6zK1H/vFHnHo0qBrSXXSR6JjfAuB751oD6jJJw7Bk/CT1eV/O/uJsrmF8JO2C74A/xlmWN
	AeMtyMgBjWU2IcypOJAb0Q5A8DaDfqTnMt36cRc8I6EEYUPZzx8z2gM4y+HCFxHp/bLvbW+aJd6Iw
	sjlG7Y+ZnwjMIbPs6vgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dv-00000008U0J-2fB3;
	Thu, 21 May 2026 16:26:15 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dr-00000008Ty7-1pn0
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 16:26:13 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7c58e6eb3edso59965187b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380770; x=1779985570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rt+eccmcXgWHzcJLFH1t7pO8Lp6Bcln3NkX+SnzPS0=;
        b=QO2mJ+NsB+M7+BtJqtI6HeHjBlLuGbR1hj8Xf0Jx+jYarsWM4aoOSyhm/qwGBAb46u
         FWcG3QBhYuPCW0BV5IUxiaOsRJKkNthwA86dwXi8xdKkIItMfVRJBG3lXcvVpmkxBhgm
         wD8J4XJp1J/8mvClKKBb2aIMITqF4571xpnEve/veiSsfBE2SzUGX+f1qtpVL060p65H
         KHJ2tTux6HKPXkf9DMKCiHkREWw+3nIBdpOrTPw1gXAL0dDMvFoFTQt0W1INPhHV8C6G
         SHikiZuxeFtv+9VtfFdor0NpRMDF/wYDxdC47vw2FuzaSkgz5Kj820h05lUHbamDcQ/F
         gZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380770; x=1779985570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Rt+eccmcXgWHzcJLFH1t7pO8Lp6Bcln3NkX+SnzPS0=;
        b=U2uW09D5SYlxQT1Ea6/2RjEhO3XOHA2E+z/wJu7VDwG5ptWz+n0JmEsS9j6uNlZTE2
         L3QddHWsyOYwcumorMGdyAjt18o7Oa59OCH5OF3jucrxZ9QhPWn8E9IthfUgU/yyDI5S
         TZedClYfC6fPH8AG5LCezJ189X8kKX7/E7xBZe/IkwX9PswEKBUzNVs+by7mH14pxmB9
         tjOhUmp4Af5E1Vcs4uVzKhvQ+5TzUhw4u8eOwYaXmBBrYOeZCru+Qu48XAibTzoNjCnw
         DR9rdg5i5tihGDNCn3OafS64F2mP8GRsdQNNbHTxW4X3GBkj4lweCKgQKXlhZFx/MDVd
         dBYw==
X-Forwarded-Encrypted: i=1; AFNElJ/hXsPCGwiwmZv1jbcNXTU0OlCIxNpe/L85fBANykVd9XX+cK8B1wKLNQ3i6W8iKwzbD+wIzS9tHi64WA==@lists.infradead.org
X-Gm-Message-State: AOJu0YykXEWTo5VCge/MZb5MP/CaC7QLFdGo7KQIXMqLADKDqRI8oCsi
	T9ISKCHKXkBL+PNclHyAuFrgrlt8wXqPwS0KiLji+TammBfulQYblNslytPvBxJcIVE=
X-Gm-Gg: Acq92OGdc9PI4eJ+9DkMLvDlMH9zVROIINsSm4LLw3iTvQAUFF+aR9HqzAKRlGEQYIG
	r0vzlPseadzwUdo/cZckcq0Rcr/pHfNDWrc99cVr9Z/u8powU+6NzDksQQHHVSa7kiz8kwJUFRG
	8fEg1Mt1aOVcsRtY3vYPp1u3utpRiDezFWimSeLQHbCTm3CehAnL97gbeqDv5+PaSnCDp8kCpqR
	atQVQCAdO7JN/teX9w/YmkgbEDSA8CuB2CD0Psr58CYTo2ncKYUWsJktjO1aoZL3KHvPZRcSfKR
	5Css38gLt00DmuqAnzPtStyGUTeePfsQncHPWq3EfLPBNqDiefMgwQtXbkwO7DWE3OfuTT4Hif+
	sO6AqLTOgjGqqgMTsbvOvlL5k0lmjVmD2SudKxfUH5xiOh7DdmUgxnmMMtSV7JC3VBr7FYwPD+U
	e09VUoyAHc44qp6dJyvs7TRd64JCykeVY1nJ/6/KRYgX3ZoOybVbJmc1iG
X-Received: by 2002:a05:690c:368d:b0:7b1:2c46:9480 with SMTP id 00721157ae682-7d20c54d17dmr41525137b3.34.1779380770084;
        Thu, 21 May 2026 09:26:10 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:09 -0700 (PDT)
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
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 1/4] riscv: vector: refactor vector context operations
Date: Thu, 21 May 2026 11:25:17 -0500
Message-ID: <20260521162521.188629-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092611_502802_29334FE5 
X-CRM114-Status: GOOD (  16.89  )
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
Changelog v3:
 - new patch since v3
---
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 +++++--
 arch/riscv/include/asm/vector.h          | 15 +++++++------
 arch/riscv/kernel/kernel_mode_vector.c   | 27 +++++++++++++++++++-----
 arch/riscv/kvm/vcpu_vector.c             |  8 +++----
 4 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..e679869e2ba3 100644
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
index 00cb9c0982b1..45820cd900d6 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -198,7 +198,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	__vstate_csr_save(save_to);
 	if (has_xtheadvector()) {
 		asm volatile (
@@ -227,7 +226,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			".option pop\n\t"
 			: "=&r" (vl) : "r" (datap) : "memory");
 	}
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
@@ -235,7 +233,6 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	if (has_xtheadvector()) {
 		asm volatile (
 			"mv t0, %0\n\t"
@@ -264,14 +261,12 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
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
@@ -291,14 +286,14 @@ static inline void __riscv_v_vstate_discard(void)
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
@@ -307,7 +302,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
+		riscv_v_enable();
 		__riscv_v_vstate_save(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -316,7 +313,9 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_restore(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -378,8 +377,10 @@ static inline void __switch_to_vector(struct task_struct *prev,
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
index 99972a48e86b..b612793d6979 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -134,20 +134,35 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(current);
 		}
 		riscv_preempt_v_set_restore(current);
 		return 0;
 	}
 
-	/* Transfer the ownership of V from user to kernel, then save */
-	riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
+	/*
+	 * Skip saving user's context if it is not DIRTY. We would have to start KMV in "dirty" if
+	 * this check is performed after KMV starts, to protect user's ctx. Then, we could waste
+	 * time saving already "clean" context once KMV is started in "dirty".
+	 */
 	if (__riscv_v_vstate_check(task_pt_regs(current)->status, DIRTY)) {
-		uvstate = &current->thread.vstate;
-		__riscv_v_vstate_save(uvstate, uvstate->datap);
+		/* Transfer the ownership of V from user to kernel, then save */
+		riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
+		/*
+		 * Calling the guarded version of vstate_save to make the code cleaner. Also, the
+		 * vstate check within the call is necessary as context switch may happen between
+		 * __riscv_v_vstate_check and riscv_v_start. In such case we are not supposed to
+		 * save the context again.
+		 */
+		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
+		riscv_preempt_v_clear_dirty(current);
+		return 0;
 	}
-	riscv_preempt_v_clear_dirty(current);
+
+	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
 
@@ -180,7 +195,9 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	depth = riscv_v_ctx_get_depth();
 	if (depth == 0) {
 		if (riscv_preempt_v_restore(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_restore(vstate, vstate->datap);
+			riscv_v_disable();
 			__riscv_v_vstate_clean(regs);
 			riscv_preempt_v_reset_flags();
 		}
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..da6c6db846c1 100644
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
@@ -56,7 +56,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_restore(cntx);
+			kvm_riscv_vector_restore(cntx);
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
 }
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
