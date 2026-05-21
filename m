Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B4CCD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyBpHOcgSY6Y+ZyRzq4ySMVQU8/zcnIZepyWqpzOqNQ=; b=3BTWiV1w8QFgyD
	kvI/PDTKHC++mViL2ZUUk23JZnBotI4hA1jQ5z8SxBxK8ym36m1OM2IhlFZ0hloG6R/NKUlBsayRn
	VUzGCw8hRL3vGwX2ZWc0MZh7x3rsRIH3ItDxqLrawnQRhUVWOsbOKPIqZZ+WJNJKY0uqpg04eWfhI
	0kGJ0EKwJRW3JsGtqWb70i7flTyNZWJA019HgBMirpIzQmw0b3q2QN54e/rBnvqoEx/B4040wULon
	DKcg8ZWDEATgEgqkequmHWrjP16bcaAfPi2OFyk9n65E5cQQoLa++iYLMZ9tOAJwnjymAqB55RyOv
	g5b+2JPwGDRXTr2IV7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dv-00000008U0C-1cVv;
	Thu, 21 May 2026 16:26:15 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Ds-00000008Tyt-2KBq
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 16:26:13 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7bdaa68cf81so58396657b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380771; x=1779985571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMhd+nCHkTkXdSeFKz+4dXZamF62pDbvFS+XcSn/mT8=;
        b=dYI2ekmvDXHBV5K3MegEjo9u6eTqRrco5vxLj9P0TaCYau5et/qr7rI4jNPn3AUxv/
         /vA+OHfiYRgl8deLSpwS/Gu+JswyOspsGxDCcy3k+GSRyptKpvTqZ20XKrdl0p/1Z5T1
         VJYpn9e3H+S9BxzQ0MHKBDw6zbjmhfUNfntgjQm5/tkZS8xtN52O0ro4rvG28fqIbdIA
         rNTddwlppovRkGwog+R7ch4SSqH9u7BOPSqBql6t1+IOgBgTo5LKiCywsOXDFWiW3zs+
         kH+mviFtdHVHLDn+FpnPf5zlTgqUWFvwA00f1eTaZYMh9WMxKqUzKaNoWlzE77ZSdT1Q
         Tjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380771; x=1779985571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMhd+nCHkTkXdSeFKz+4dXZamF62pDbvFS+XcSn/mT8=;
        b=QTJ4WRjy8bdt+Guerez6j2MAgZjRIgxIOEL1btV1IG4TDcvvpP15lABa+eUj0zzqu/
         LEAgTz4a1D3drFrXLS/nhVnU4xWUi5PtNWavhsPMfT2Co+7zsHq499vcfeaWSnJW/18r
         1TuPtZpP7fAKdh7TjAufGi6rPaPBO5pQBnPrVypEg5BBGijbepgD8imDrX6Nd58pfCmi
         zd577oLZlFiUqSMgwHQ0Ugus+t5VNfE9YkwZIvC1kSefSZ1vIsIonGkWgPntqlMsz2uZ
         OVSrJ4wwEjjS9tTgyeUzHs+ELbPDWiA9ucFlV17V0zfHwrWbmIVfjSxY2h88O0o9J8kN
         1dXw==
X-Forwarded-Encrypted: i=1; AFNElJ+R5SdQA/PSuAw4ZZLf29nePYKZ/Mv9tL+ahKum82AffCEwsact8qdoM7nx+CzMfVTM8DTCehfGpIuK+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YysfKmmBAugn6GYtdz3B+Olvv7p3HONEpJvFRcbnNuJXPEtlq99
	cDebNmAWrHbdAoDaG0gi/X8VXZ0E/UJdfSWp+49uVtssJ4B3EgT97cFd297RaXcjAgk=
X-Gm-Gg: Acq92OGbGslzFCHJIw3kS8SfzVyxcWRiFpYTxRIAICPJCeZt9TgznwbRQ/adyMVZICn
	sHDotJo/3YyH0iKAj7CBGOnHr/G4WsF2pMhseb87x87qdJ6dkdy5Zsm31yQkRQUbRUSIOpapEFK
	a4c8HFJ9XHLGAUbPd8qYjgLWju+g1HypSxDKKU9xBzsp5wSFPuIZri1Tl5aZ5eRtNTiIHxF95MI
	uyIBZuriP+mDUFHRXcBTQU+Sy+fHhpGLKNU3AkDq9K0ah6wgV3ul44d8gj5mNiDjLLyVCS/tclo
	XzqTju2NTnE8f2oydsUJskxxahCIzEgmUMe2OqIAngJ6Go9kt6iqQN1hijj8sDd4VR6mmT0YSB2
	6kyjd7JW/Ifenjc5oSen3qJg3vSX5/A0W4dye4EPrfrzP+wqg06FkifzpBPyBAn4QFqtDff/scT
	KI0nDVAeac1tZezz710iwe5E9vMXt7btgTZkbc51L6zqMfMhU3C+If+C67/Pn8z67cNxk=
X-Received: by 2002:a05:690c:6708:b0:7bd:5cc4:1962 with SMTP id 00721157ae682-7d20d023861mr37731277b3.48.1779380771352;
        Thu, 21 May 2026 09:26:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:11 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: daichengrong <daichengrong@iscas.ac.cn>,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 2/4] riscv: clarify vector state semantics on syscall and context switch
Date: Thu, 21 May 2026 11:25:18 -0500
Message-ID: <20260521162521.188629-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092612_623215_34825136 
X-CRM114-Status: GOOD (  14.61  )
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

From: daichengrong <daichengrong@iscas.ac.cn>

The RISC-V vector specification states that executing a system call
causes all caller-saved vector registers (v0-v31, vl, vtype) and vstart
to become unspecified.

Currently, after calling riscv_v_vstate_discard(), the vector state
may still be marked as DIRTY, which can mislead the context switch
logic into treating the registers as containing valid user data.

This patch clarifies and tightens the kernel-side semantics:

1. On syscall entry, the kernel checks the vector state via sstatus
   and explicitly set it to INIT, indicating that the vector registers
   no longer contain meaningful user data.

2. During context switch, the vector state is saved only if the state is
   DIRTY. (no change)

3. On restore, if the state is INIT, the vector registers are treated
   as invalid and are not restored from memory. Instead, they are
   overwritten with a known initial value to avoid data leaakge.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
Co-developed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v3:
 - rename vstate_on to vstate_init to prevent confusion
 - set context as clean at first-use trap to return zero'ed context
 - reduce context nulling operations by defering __vstate_discard to
   exit_to_user_mode_prepare.
---
 arch/riscv/include/asm/vector.h | 32 ++++++++++++++++----------------
 arch/riscv/kernel/vector.c      |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 45820cd900d6..769f30779867 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -95,7 +95,7 @@ static inline void riscv_v_vstate_off(struct pt_regs *regs)
 	regs->status = __riscv_v_vstate_or(regs->status, OFF);
 }
 
-static inline void riscv_v_vstate_on(struct pt_regs *regs)
+static inline void riscv_v_vstate_init(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
@@ -288,16 +288,6 @@ static inline void __riscv_v_vstate_discard(void)
 		: "=&r" (vl) : "r" (vtype_inval));
 }
 
-static inline void riscv_v_vstate_discard(struct pt_regs *regs)
-{
-	if (riscv_v_vstate_query(regs)) {
-		riscv_v_enable();
-		__riscv_v_vstate_discard();
-		riscv_v_disable();
-		__riscv_v_vstate_dirty(regs);
-	}
-}
-
 static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
@@ -312,20 +302,29 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+		riscv_v_enable();
+		__riscv_v_vstate_discard();
+		riscv_v_disable();
+	} else if (__riscv_v_vstate_check(regs->status, CLEAN)) {
 		riscv_v_enable();
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		riscv_v_disable();
-		__riscv_v_vstate_clean(regs);
 	}
 }
 
 static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 					      struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (riscv_v_vstate_query(regs))
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
+}
+
+static inline void riscv_v_vstate_discard(struct pt_regs *regs)
+{
+	if (riscv_v_vstate_query(regs)) {
+		riscv_v_vstate_set_restore(current, regs);
+		riscv_v_vstate_init(regs);
 	}
 }
 
@@ -396,6 +395,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_preempt_v_set_restore(next);
 		}
 	} else {
+		/* VS is never DIRTY at this point, there's no need to alter vstate here */
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
 	}
 }
@@ -421,7 +421,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
-#define riscv_v_vstate_on(regs)			do {} while (0)
+#define riscv_v_vstate_init(regs)		do {} while (0)
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9..4eef51f6d432 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -221,7 +221,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		return true;
 	}
 
-	riscv_v_vstate_on(regs);
+	__riscv_v_vstate_clean(regs);
 	riscv_v_vstate_set_restore(current, regs);
 
 	return true;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
