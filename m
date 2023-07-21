Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5383EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JocAyNlml9yT69M2CrwXRzYeaXTlC+pmy3bmNa/yhmU=; b=SCHg3kryeldIF2
	WUmX2ahxMIKEEFxKziBKV/S6ixKgG7P8s6prYIbIihR/jgeKpJHytZMUTXl4KlgcJ6Fj1VGiQioXY
	2fYg9hhFgHlFkAgOL5azRlVf3Wg8P++Z8gvSPVQn+5CyJx6xS7nFiFK+qsUccaeNllYVPSAk1eOAh
	mdJ/i+oYIXHXiNdOGey7tpQuAvKm0DJ8lprScG7Yktt05+YdJ29snEH/m1cTKqiwxcujgtbhYNFPw
	E/M+SFt5kBW4q+6/oBl0ILDYEAwyBSRrOegwvEowQYGFNp4Aa1SdPze8UpS+BM8B30VsDL4DEs5uA
	91FT+IGfpxSXcSRdJiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoKS-00Dvl9-0X;
	Fri, 21 Jul 2023 11:29:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoKP-00Dvk5-2S
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:29:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8bbcfd89aso11007025ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689938984; x=1690543784;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZILjIbAwnrKcvzn2vcEaPpCGw9AS7QD5tUprtRHXrI=;
        b=j+HXiPbceMC2s/jQ2pMYHvFOtUshjcTG5tDc8H116vzuXK05CuRuV3Q8mAO7U2MVuV
         Xemf/CN93YhpzoP3A58I6Y2HYMonRnQpM0pQwqPgKUpTYqhI9+54wY0izLJ0xh3/9J7A
         WmkKxeoVstDS9JDRxK7gFR2dQ+7wXfB3KwgQzwPFtm2S7uwBHjg1RPxalbMHs3r3kGGq
         N41GoQYsdgPARp66VwhFfffxSsOFIVgx+BxhBErk4WeJg0bUKyWLCzB+pkShnEvcCMSA
         azsOf6Ve2R7xIR0GLK9LJGiQ+MqvRgu7jzaBbA0AKQBuBRsCsAyqwJev8cvNe9a3aYw0
         kg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689938984; x=1690543784;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZILjIbAwnrKcvzn2vcEaPpCGw9AS7QD5tUprtRHXrI=;
        b=VM2l4VM7JGqJmenbRi4xjXCx52YlBhaoxCPSgmPoKaipcV6XmDiNkxDVXPJA9sVunA
         5wGoutDYF4eAa1uA0OFjH02xK3b1tS0IeOYvtbQzYx2Jh1mmV2sYwMNDKxZM+XJjd9/L
         A7rW4Gvh6bVlk5Yr14cDR/IL/fT4Sqh1k39nOC2V8xN7oG5I0uKNgeYJwVolqXv8jDNG
         thj5WvHy4eumePN5OoFa0sCfDSak0Vxml7yEt4NjfOe6yeDV9kpZnP/TYnBD2pBPQCl2
         MWSkmpQ/3UYA7dHOQ/puy4+7U6sX/P5KajGFNQlXRCfqvN6ppyOC7EuDAtz4HlWX2m9d
         GrDQ==
X-Gm-Message-State: ABy/qLbGeszLIkXyxXMyzzfxoSbpsfS1fwnteOci1jP6fdZbG3vAgkNH
	ImxBxbnqxWk+H3nA4wFFb1srMQZRGBJo9KTUQs+GWDGZQHQ3RLAJcWsFalglZIN2hna9qHz+wjI
	1+VEUR+2Sk/3J0d5xd/dt7BNuvK+SBp3qytR13+m/X1hIubxPM+a9bnoXuaoUloYl6P4fPv+1wm
	aXL1Coy2fpvwch
X-Google-Smtp-Source: APBJJlGpzbZorACpQuQBOR4OCmsQFrZMkzpaqIdrJekkeajtxsVfKnxTps1bQ5N8LjfNUG78BkP02Q==
X-Received: by 2002:a17:902:d342:b0:1b8:c6aa:85c with SMTP id l2-20020a170902d34200b001b8c6aa085cmr1211380plk.45.1689938983678;
        Fri, 21 Jul 2023 04:29:43 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8953365aesm3243121plh.22.2023.07.21.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:29:42 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Yipeng Zou <zouyipeng@huawei.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [v2, 4/5] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Fri, 21 Jul 2023 11:28:54 +0000
Message-Id: <20230721112855.1006-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721112855.1006-1-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_042945_799771_5F3A8DEE 
X-CRM114-Status: GOOD (  12.49  )
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
Changelog v2:
 - fix build fail that get caught on this patch (Conor)
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
index b46b8f3261fa..3b783b317112 100644
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
+	riscv_v_vstate_save(&prev->thread.vstate, regs);
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
index 1c3b32d2b340..d9e097e68937 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -68,7 +68,7 @@ void kernel_vector_begin(void)
 
 	BUG_ON(!may_use_simd());
 
-	riscv_v_vstate_save(current, task_pt_regs(current));
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
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
