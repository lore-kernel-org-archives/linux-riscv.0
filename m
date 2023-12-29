Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6CDC4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkjOVa0TbZa4UcHFXwti5zZbUR1X4cEyxErhBWLD9Gk=; b=VuZu5zZCmTkcmM
	5Sy3zKitVpMpWepyAdP7/jsQr2ch38fmtnGCjwv3dClv3JEiqZNr5CwMdXupOZUGNjqAnYPVMH8F1
	ugaMXzq8HCVPCztN2yRa6xY3MEr7LlhiyLAoMfUryNOXOsZx8LPQadIlKLml69DUHvNyrc38eHSxA
	qjOr74BV0kRrcheJGQVLKNnhJ2LtRGlYcjdUWHlsElmGTk8RFbH9E/JW5jQsPdLEigAJZeLVCLzF1
	qw/6GJMV14iZa/5aQdDcqYKrE6+FPtjJk1l8ePJPCjpPxaoMmMObaarls1Xr/rxBp08a8Z43vFqtP
	c/YBWfldB43jzc4f3AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzs-00134G-2f;
	Fri, 29 Dec 2023 14:38:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzq-00132D-1h
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:38:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d9aa51571fso3622141b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860675; x=1704465475; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R71ZbdXB/xy6waoYzA8y4C86dv9lPv8L1sbMaRUXrl0=;
        b=kRmq6Hk0MSCvth4f+mDe42UKKujhSmtnlBswWyjq2z/t7x2Gi38jIWrvwnWH8BC76Y
         NBRblKGrbcFHQk7pkCroYQdVjm/DpBBDlKgTrd+bWeeNPUbeogp7PfSBvaaZRmbBXjFH
         CthDX2WH5oY0qlIbJb2GJdXLWDW7YSyFWq1RAm04nE3jACM3k+mJMP7nTBl1V2TtRFSX
         L93VAlO98VSaN4lLLNGZSFXazYQosO7iXg7GQDRKus+BDsah3vYQdf0h6M9F140vuVTR
         m7ofhC6321m9XXjxbghsw1xLuBPiJt7Amuy2REaHvoCztYgYdKuq9GZbURu4JQUN6zzI
         kJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860675; x=1704465475;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R71ZbdXB/xy6waoYzA8y4C86dv9lPv8L1sbMaRUXrl0=;
        b=emhj6EFQ0+FWhz24q+xs/oDlhGOxCTht2upcX/YRj9pifrf7aQBDumW9TNUaMy7cBg
         XJYqWE82gL7YqMdtrefcOGf9rnMX1nR1vyXUHN8p4T8uTZSFwRQ581frYOlPJtnT+o1B
         RLZcFwaEtwnMS0SOCPASUuxLosSZjNuH+wS+9b4nzAW+YpWdnsANMrJ+eaaoyRE0rxel
         M3x70Yv1097szB0TgMUuyfBWFjXeXX4vYkSNJZ22Zp3Osu4Od6Vta/uUv4CdY0dxTRTs
         gFR2C/toYpwLymda8itarpqMlKuSo2lJpmmYwTRnbOQXvjAFm5RiMPvRmHlALToJEMhC
         44Fg==
X-Gm-Message-State: AOJu0YxQee1LKFwTuNij/nurEW/mU3JjGKwGsBkjYMu6NWHY0KqwPbQJ
	8N6jdaoKc1lg4+eQZVgkMQsTAYzJkoltDQ9A6/+R+vWWh7EjYSvGCD7vovIaE3LPJCQNY/KpKLD
	uMsYideuBgxiZpWlG4LP9Mn9ssBWxfLhJNYEuGYdC9ibv/gFNFNw5lb99dMK8jO7L/lOwcuXjKi
	HFaLdsxFSIV0vmmn1GqFGE
X-Google-Smtp-Source: AGHT+IFxBr30GeDVa+WvAQpGxFEv0kYtGxm/wlOiNQAZDE5H75Sw42/k10o9SCqDwfLDHtjb6MQ0Xg==
X-Received: by 2002:a05:6a20:8f01:b0:196:39c2:d48e with SMTP id b1-20020a056a208f0100b0019639c2d48emr4057570pzk.65.1703860675359;
        Fri, 29 Dec 2023 06:37:55 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:37:54 -0800 (PST)
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
	ebiggers@kernel.org,
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
Subject: [v9, 07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Fri, 29 Dec 2023 14:36:24 +0000
Message-Id: <20231229143627.22898-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063758_561037_87E54F8C 
X-CRM114-Status: GOOD (  11.87  )
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
index 19023c430a9b..2293e535f865 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -16,7 +16,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 		 * We are already called with irq disabled, so go without
 		 * keeping track of riscv_v_flags.
 		 */
-		riscv_v_vstate_restore(current, regs);
+		riscv_v_vstate_restore(&current->thread.vstate, regs);
 	}
 }
 
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 961c4e3d1b62..d75079520629 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -171,23 +171,19 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
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
@@ -208,7 +204,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev, regs);
+	riscv_v_vstate_save(&prev->thread.vstate, regs);
 	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
@@ -226,8 +222,8 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
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
index 8422c881f452..241a8f834e1c 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -97,7 +97,7 @@ void kernel_vector_begin(void)
 
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
