Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEDCC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHgVDHjIhi7iHX57jDgV7aUCenbUnDmKM359swtKcLI=; b=wdmmlaoiYSNlIi
	QzC14EsTIDon4wkrinZGfnIFhDc/lR9l+/2NTjF7Rr0IIiTHIN/vMK/mCoc0Qj0yS3aoJMle/AQWe
	3J7CCg1lhdWMfrbIP4yIS5JCVKBBccp4DAn/z523ap7TmOOD7mto8JxmQrViZD4RcidpvUGnG8Cat
	EDjWxckOXDV6jkOZuPu9ePbJ1fcjVIPSMdYwco02mNYAf3ygv+TMl5CUJ282xrleTRf9eFAre2hAR
	1YhutkmkgVNbmbi6Gg66CAggof6AXEfOjtfkH7YRcaqmg2B4ZYaTfbY0tM2CIagOchhpIfI2ER3ka
	04clG4FcV5WPAN3NjAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTG-00GUrB-13;
	Wed, 20 Dec 2023 07:58:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTD-00GUo3-0B
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:58:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6d84b68a866so1743833b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059099; x=1703663899; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PStOdX0bJ0JRt1kGvqh4Fd4K0oqMPuH8sOnQ/vCigs=;
        b=j5gUP9jYmAKnW51vYoHGFBw8eZiVhc4A+k6hAPizXDKKWursYztU/1A9GbEVy9k3KO
         snVPRVecMuvWXo27QSh0g9Y2bNmd2ld8Kvyhd9uiXjBV2+g30bKTWyWck4Z/jLPxe5nr
         P5GoHO0Yqj+kQIdyrbTahPI4n8PVvwInArZfhIl8OwhiuXULkPfKanZ42p0yTKIGkRZP
         Aij8R+DJX1W5D7UbRhWA20PwevTnFQiHhtyHK4CqPWZp2FUKZkw9SrVBOo53PzRnI+qA
         iI1mLMNLoWbxtzUyFQKHk1R3L67OM6e8yJluIUKpsLQ6WPncXOZeokBmjR46gjl2m0mM
         Z6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059099; x=1703663899;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PStOdX0bJ0JRt1kGvqh4Fd4K0oqMPuH8sOnQ/vCigs=;
        b=Zli29D7AIyBu8rzE6wj/0GznCwel3oHbdCTpqIOrRnkf9Jo9gGdJdbGpaC41MKyTrO
         Hq0rM1pVSegxgWB5pSQ1KgKjinM/mfmb8AD6HLL366TxPQjc8AfcqsoMo43B8SuAztJ1
         /LAyi7AsTsvVJyaLN0xyYRnxsdE467ldLSmgL2Edw7CsCqjHznXo7bue9Gt/OmcYGaHF
         IKnYPHBsuAEpXtwNGdTkswvZQWbAXAJkfaiJJWPysUkI5Du87Ene8MC8fr1+hkhooQWq
         tOTx8tjjk03TKZ8sO8TEo9d/08oX+aIiilS7rTxVpqGqwYjsEzRwU1DymsXT0+gzBkEC
         6IHg==
X-Gm-Message-State: AOJu0YzgDUpORrLdGsKWFCzJUx1hr+YJo6T9Afc2rpRRAG1FtNEFmaYB
	Rt3egFMt/B0+5wWwJZfP3VjomAhHfFuW0UUxOeZiIZioCKcxeee5pbe1S6T0hdQIMUoXxD8ix8e
	sN114gRNqJDuVw7rVIomRl+iMnT4yy5Z4HfyjEd0TnvXAdCBicja+q/YpVe6KGnAm5UklV4V44p
	B1Ie/fDz9t8qcC
X-Google-Smtp-Source: AGHT+IH5h/HccS31pjZUAoSEzdkyMR6zp0RIo7HJTu5uye8X0F14SrH5/JM0qOVxnUmE8T6oueRIew==
X-Received: by 2002:a05:6a20:429f:b0:18f:97c:4f4c with SMTP id o31-20020a056a20429f00b0018f097c4f4cmr10981264pzj.88.1703059098902;
        Tue, 19 Dec 2023 23:58:18 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:17 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Haorong Lu <ancientmodern4@gmail.com>,
	Mathis Salmen <mathis.salmen@matsal.de>
Subject: [v6, 07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Wed, 20 Dec 2023 07:54:09 +0000
Message-Id: <20231220075412.24084-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235823_119214_180CE62D 
X-CRM114-Status: GOOD (  12.04  )
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
