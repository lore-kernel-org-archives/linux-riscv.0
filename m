Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA62C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHgVDHjIhi7iHX57jDgV7aUCenbUnDmKM359swtKcLI=; b=NB0cv3IZnFUKRK
	n0HEEvyZhmsAl25YuU8umJIA1Q7Az/reydbs44bH2Z35EfWwZsbUq3bPGYCrPnevMd1S5lqNFOQ5P
	Krhv2PgfdPImMgzIcO7JJ+Xis/h1caqlXcuWjM+Aim5G1MQF4SajFcmUhLZv+b7TbgxfM/KQl136J
	NDiy9uG8mpHmn3MHYFezXa7gqlP+Xf3M7nyO7hikP1m2K0kfuaXWkrQ3NBHRP+2MA0nc7mIxvL1B4
	Zml3megQ+cHB/qJDk0mHGKpZXQW0kFTney0aU32d/NHd2FeeSF4YMTzMo7hL0fOXsEbxbp+DAQIP5
	obVrttt7G3WmsncPxAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLw-00327Y-2F;
	Thu, 21 Dec 2023 13:44:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLt-003254-1f
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3536cd414so6753075ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166280; x=1703771080; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PStOdX0bJ0JRt1kGvqh4Fd4K0oqMPuH8sOnQ/vCigs=;
        b=A9H3EZwFBiKrlbVBq+z/d3fo8951cB3yZa5Xft3QHfY7FTdfcK7j0kt42Qw5iZUVRM
         lNI+wQ5sQmc+5ywl2TFSiUrfwT2uJI5oboSvugzXZg/oRPTQFXqdrzLZmnHIcLtPHKvQ
         CF5wk4iAU4UckxnhTbmCw9ibcl9P6NsWd3+2JLZcsNZRVyts70CwV9fxdMxBXZsf/xv7
         U/JX3IZ2TpURaneG5QMfuAH0CkaDC2248fzDQED3zgomIverwoUG5Yjw80hWUAv8tJpJ
         LPmmX6wO3alX8s7j/C6zF0NqP/4cP+zA05lJT/jYeNphr4pH0okYloqcVwLn1xr9Deq3
         MSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166280; x=1703771080;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PStOdX0bJ0JRt1kGvqh4Fd4K0oqMPuH8sOnQ/vCigs=;
        b=sjmP+8Da6Q/BT6P3WKUOGCt6gmOXqDIqzCpk+kz/ksQW4IWR2KCAVo2Vw8kyKcQLsw
         2cZHUn9wWWyTNQ/Wlae7ZOiBGsZXXpU/uvv0h+BF1fUWvbjSaz2A3Bb4BaJLUVqD+d9w
         zjhnuKGGY96Pb3xAasSbiC+mFR3ZWA7pS5WNO80hjejipQeVhR5uJ0VEFHGNee6w9LMx
         vef90IqNAFs1lwuOExEhuGKgqyWOsvjdrAZ12BBovpmOntFi42aqIYdl/IEcMe2Dud1L
         IZPb12Kk3xzQg1a2OK1VvnQAqMmhhKkS++ENrmxR/ZRtVJnsuCOklvib474zYO0o6LLx
         P1gQ==
X-Gm-Message-State: AOJu0YxefAfvkMInjUf3/kVm6sC/wWn0dIEKq7lJbo005llIKL4FMtuM
	P4L519ceF1sn3XIkTa2nM7B8SLG2R94wxsw74e76HSbPnVpuCEPKnOLtA0I87WrSsNTYDEAxUzO
	1pyErWkLhC5EKiPzg6SlJEAfhsvSlQVhlfvRuj+RSfqJAd++Yw+reglgedjlKsLxZvPYIqPo1cg
	wyA+P0ovOJE838
X-Google-Smtp-Source: AGHT+IEkZt8VDcEGMVh1chITcWavhfZDrRiMNvK4lYYlh9afNQNDZcoqpMQKA7D9FUzN7bAPwZIkGQ==
X-Received: by 2002:a17:902:be17:b0:1d0:9a64:e511 with SMTP id r23-20020a170902be1700b001d09a64e511mr19093642pls.73.1703166279918;
        Thu, 21 Dec 2023 05:44:39 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:44:39 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Haorong Lu <ancientmodern4@gmail.com>,
	Mathis Salmen <mathis.salmen@matsal.de>
Subject: [v7, 07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Thu, 21 Dec 2023 13:43:14 +0000
Message-Id: <20231221134318.28105-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054441_559497_5C1464E5 
X-CRM114-Status: GOOD (  11.65  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v6:
 - re-added for v6
Changelog v3:
 - save V context after get_cpu_vector_context
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
index 6361a8488642..08fe8cdbf33e 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -16,7 +16,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 		 * We are already called with irq disabled, so go without
 		 * keeping track of vector_context_busy.
 		 */
-		riscv_v_vstate_restore(current, regs);
+		riscv_v_vstate_restore(&current->thread.vstate, regs);
 	}
 }
 
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e706613aae2c..c5a83c277583 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -183,23 +183,19 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
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
@@ -220,7 +216,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev, regs);
+	riscv_v_vstate_save(&prev->thread.vstate, regs);
 	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
@@ -238,8 +234,8 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
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
index 3f1d67109e5a..238154cb4fce 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -72,7 +72,7 @@ void kernel_vector_begin(void)
 
 	get_cpu_vector_context();
 
-	riscv_v_vstate_save(current, task_pt_regs(current));
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
 	riscv_v_enable();
 }
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 7b93bcbdf9fa..e8515aa9d80b 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -101,7 +101,7 @@ static int riscv_vr_get(struct task_struct *target,
 	 */
 	if (target == current) {
 		get_cpu_vector_context();
-		riscv_v_vstate_save(current, task_pt_regs(current));
+		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 		put_cpu_vector_context();
 	}
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index aca4a12c8416..5d69f4db9e8f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -87,7 +87,7 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
 
 	get_cpu_vector_context();
-	riscv_v_vstate_save(current, regs);
+	riscv_v_vstate_save(&current->thread.vstate, regs);
 	put_cpu_vector_context();
 
 	/* Copy everything of vstate but datap. */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
