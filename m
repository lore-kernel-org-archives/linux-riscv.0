Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD9C001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsv6LX2F4AfYHbt/f/EK8j9eQ5+ApzGQ2iHuXC8Cipc=; b=FeCdHRNKQeJibJ
	9HqcG7ScUGC+y0sYXXqQr9NUicvgDTWo+BeXen3p9UClRPMxw60svKZyTrZL0B/NMGb5l5Pf5+9QW
	mCBrYsCkrzTQywAA5Z/ySQzmIg/g5pLEU+qr7Fb82v6rZobhfsGQGAipMQU00+YDk5d6uOSk+x0Xl
	R08vKRSLs+vTzBlo306klK4gdsC1eLMrvxn17F3ZWrRjjh2+lpcpsM584Wr9tbAXMk+U6LgEHdeB9
	/vTcWK310OzQxHzYSPVqBB9n2lteORDFQK9AYUjm3tWLnsK0wE9i9tJgyM+cCb+pLr5M7qCp9TTuv
	0CuOUDmZIR8QwHk8tu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglr-008zfs-1D;
	Sat, 15 Jul 2023 15:01:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglo-008zf3-2r
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:01:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2633fe9b6c0so2718045a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433275; x=1692025275;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hu6CPBVAfibHHMvDyHkRBdDxemljL2h5/cP72Uob0eE=;
        b=Cf69fvkbHrKpWPAXt02du4sv2bXva4sCsxQYWIY30+giQguTPlgfdMe85yKZ4nGUMz
         9Me+f4Dw/j243mMpNMmlaS3bw9PD7Bsu6PqgbRfXK8zYpLEGPvrFlos55uf2Ujrb+Lf1
         1BvGbbF9iOeZhgH+M6xJTYPuZtlS6f+3NVBY0zD/CZIl47nNriNFmuXPiUf/wRG+f9No
         Xj81SidDxewdaLqhQA+WFLJdZ25+tjEe+BJfQYMRHvB2Dwd6YEAdaUnNHMmf2JWsq6PO
         h5YnQIKimVTgmJP4nlvTT0F2ZrNRDCSUQ5OQKVK3reUCykr0j/TFby/78Hf3OSpNFaok
         /qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433275; x=1692025275;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu6CPBVAfibHHMvDyHkRBdDxemljL2h5/cP72Uob0eE=;
        b=WftPKcm5eu9hbkMDNZRPKU3g0iCvOtCIBOsz4nFHzaJzkqVi4UrG/flivRhpJ8MFN+
         ki9TX/cVyBDdCAIodGsUCOEyg58YAsapVSmcjqvrIWl5wxp8/mguIIq9y0AbsNMnSnWH
         IgBpq71+iwMfAAApxaqIaSs1dPljXzo1N9qWGzYF1S0Ek48IlSFP7cPUl1+2IcKngx+I
         ffyihxbFDZWpa4fyaljOdRyrydA3mqdLe/N4xOovSX+PLccJzRZ7UTUNbhcuFuPxXVbG
         7AdT/3kthSO1K1gMdYAlDE6nf9MplIay33jncg9gve69lGlSjTUEFzkKJYcf0HVJSU5A
         ++tw==
X-Gm-Message-State: ABy/qLaTJlyBNvRd7AeCqIRn03NMDnWOwteXV/l7CKIdSN9dJOX20QMP
	KTZCXfiGHUey5oKfnQMBsPh5hmCUtZLeXxqYjlY/dYslVmxD8I9FMMlKMskeGK6BGaQ7glVUfLT
	pOMZ7SLOI0YAem4eEAedvq1soZ/tdWYG8KKrp3kdjyYJR3XUCHWhtmXyKSyQQlsrFgMgpI01nZp
	JXQbI6UaEJjqyG
X-Google-Smtp-Source: APBJJlGnJ0AiWaooxuA0jWOFbnR4NHLM8lyKrS0lMelG6TZpM5q4QlfQmZ6ryWrh37dWQ8QdxB6mtA==
X-Received: by 2002:a17:90a:ea07:b0:262:d9b7:13ce with SMTP id w7-20020a17090aea0700b00262d9b713cemr7260494pjy.5.1689433275436;
        Sat, 15 Jul 2023 08:01:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:01:14 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Yipeng Zou <zouyipeng@huawei.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [v1, 4/6] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Sat, 15 Jul 2023 15:00:30 +0000
Message-Id: <20230715150032.6917-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080116_926837_C3CD770B 
X-CRM114-Status: GOOD (  11.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

riscv_v_vstate_{save,restore}() can operate only on the knowlege of
struct __riscv_v_ext_state, and struct pt_regs. Let the caller decides
which should be passed into the function. Meanwhile, the kernel-mode
Vector is going to introduce another vstate, so this also makes functions
potentially able to be reused.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/entry-common.h  |  2 +-
 arch/riscv/include/asm/vector.h        | 14 +++++---------
 arch/riscv/kernel/kernel_mode_vector.c |  2 +-
 arch/riscv/kernel/ptrace.c             |  2 +-
 arch/riscv/kernel/signal.c             |  2 +-
 5 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 52926f4d8d7c..aa1b9e50d6c8 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -12,7 +12,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 {
 	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
 		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_restore(current, regs);
+		riscv_v_vstate_restore(&current->thread.vstate, regs);
 	}
 }
 
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 9831b19153ae..50c556afd95a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -163,23 +163,19 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 	__riscv_v_vstate_dirty(regs);
 }
 
-static inline void riscv_v_vstate_save(struct task_struct *task,
+static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
-		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
-
 		__riscv_v_vstate_save(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
 }
 
-static inline void riscv_v_vstate_restore(struct task_struct *task,
+static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if ((regs->status & SR_VS) != SR_VS_OFF) {
-		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
-
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -200,7 +196,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev, regs);
+	riscv_v_vstate_save(prev->thread.vstate, regs);
 	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
@@ -218,8 +214,8 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_discard(regs)		do {} while (0)
-#define riscv_v_vstate_save(task, regs)		do {} while (0)
-#define riscv_v_vstate_restore(task, regs)	do {} while (0)
+#define riscv_v_vstate_save(vstate, regs)	do {} while (0)
+#define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index c0c152c501a5..30f1b861cac0 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -91,7 +91,7 @@ int kernel_rvv_begin(void)
 		return -EPERM;
 
 	/* Save vector state, if any */
-	riscv_v_vstate_save(current, task_pt_regs(current));
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
 	/* Acquire kernel mode vector */
 	get_cpu_vector_context();
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 1d572cf3140f..85e7167245cc 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -99,7 +99,7 @@ static int riscv_vr_get(struct task_struct *target,
 	 * copying them to membuf.
 	 */
 	if (target == current)
-		riscv_v_vstate_save(current, task_pt_regs(current));
+		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
 	/* Copy vector header from vstate. */
 	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 0fca2c128b5f..75fd8cc05e10 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -86,7 +86,7 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	/* datap is designed to be 16 byte aligned for better performance */
 	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
 
-	riscv_v_vstate_save(current, regs);
+	riscv_v_vstate_save(&current->thread.vstate, regs);
 	/* Copy everything of vstate but datap. */
 	err = __copy_to_user(&state->v_state, &current->thread.vstate,
 			     offsetof(struct __riscv_v_ext_state, datap));
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
