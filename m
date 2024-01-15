Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE05C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjVBovBgCiUfRujKpg3GrA4aI5sgmGXvVv/0hdNpiCc=; b=Jt+bqo6cW4GRtD
	tbrhiDkUPFQx0t/yknOnWM0sVRN5LeWHgpzkDNy4URSMaFqlBLRRL9hbidsPTkIIVt9bMFhsqvDGw
	8VF0Tupd0DdTTPgEpBp80wAdIqrgv/XexA48aTVRu4UQw7TCl3PJdWP3QrZb7BGgEmcNHdiqigReK
	KRUgzjSCJXYU+ZWy+Sy4Dkyt9bykt0blbrZ3xlR57m/hli596RplsU07Hng07yrr7zJscaLwAkDpo
	4LPhEo6iUSQqMtQnlnp8xMRUeg4onSK8o2XqRrjGbaHom8CNUQZ6JHDdvKygzpCXfM3hjj6RRAYnq
	9vw8HOMeoZ0l7HRSIWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHBm-0083DU-3C;
	Mon, 15 Jan 2024 07:15:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1l-007qV7-0R
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZQMUwmhftjVkzfkK+iZc7sWHSuUCRYxtugVVE3q+kKk=; b=rfX3svGe5bE8NuFDgz/I7IgZqM
	65XY2tz3zRhECO1mlUio/wCsNOjcCR+sCtLZj7TmNu5MSb6GXaQleDLCVNcqCdmO+29FE0l0tU/a6
	5EYox+0ggwqFcFl8XAi99wzCHWQr1FxdKbfxF4VJPH6xtmNWk1T/KqKSkqN7z4vvi/8PooeW9/I2X
	kY7wwlW3JDSMfFHX28xaEoT1HJmmBtzZbKtV+KA0L9QJviU9igPjBJU8HPD1JrZli9CnjoW+jh9bb
	ETrmFtxdsWzeodW6yA0jXCnsBxQQNSy5MuiHXexARipn0WGGmGiMZa7zwZPgKXxQshqoJAs0Uzzzk
	D5/D8jrA==;
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1h-00D1fb-0q
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:51 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2041e117abaso4296355fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298445; x=1705903245; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZQMUwmhftjVkzfkK+iZc7sWHSuUCRYxtugVVE3q+kKk=;
        b=ntg5d4xKW1Rba5a6E5dxMHBbKbg7mXxVMXJHyI256XkJyGoSpPsWnGCk64RX6ZifW1
         1RmRRovfGlg4KtudwwlmVJLSd5oTaMBRXteO2opcgcpvVeN+m/fEs0DthxHxQw3jRxLd
         L8nQiwQo6LQIe4IlB5gI/2RCbI+CjTP6KBzsv/0VrdO1KHqeDOMNGZQP+mVLn9ubbpvp
         tLx5nXlYamuOV9zMjYOE3iKA/StzIWIhlr0Vtv0M7PCtWmpDrhbtOGy2bAeOgo/rbt6G
         fKDXiyoYTwVb8Ljcijo/PJEcJ5Wc7KIgHsyzCNo66Frswr6KcRlBX1fCgGQiYOMqkWg9
         FU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298445; x=1705903245;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQMUwmhftjVkzfkK+iZc7sWHSuUCRYxtugVVE3q+kKk=;
        b=NDL5pHNU4EOxIeOeEd37T8lU/nL2yO8f3CUZ3yHnP9vi/f+3t8yEmEZ/oC2/yOf65V
         MHGqshdW7E2Ht41ijIxg28kaA9KkBxu0ImO1W/eDCaTR/FUmNcXAyM+Wd4ePocnvd38f
         nW6YZkR+iCWWEbgtaQr7Gpvo7at5CNKuOS/fr+XWB2yy7TqVSuCD7F0/wILvomMU4ApV
         2bFTuHxOMfYyG28XraT6kBPMiUZW0DzDYqOaBRiJ2lp3JNZQASJbYPSpus2N4NlK8iLr
         JFYJ7n3OMLbqeAii+Se6kbVmSHRZWpk6hARzWZTwS6le/uxuRXO2ScUzNoMNXzzHzSWp
         4Z2g==
X-Gm-Message-State: AOJu0YxkhfvDkxcuP7+hAeUA+7m5p/Ph6tkIO/A0g15xtRekG0ouj0Ru
	PBBlw5TIFxwLVTijIuNTSlGjD/qUbEckFzgWda9uAu9fxVlpEurs27vbgOWysKFX9Vs3xmSXjZb
	eOzRSp7z+8Wa2qyeTzL1Jdku1bY7jL/ghImGNOaBF8DqpekFiG6+F+bCezvcy10HEzW/IMDSETv
	5RkrPT8xKBwYyZXZInTg0t
X-Google-Smtp-Source: AGHT+IHAwJflWRf548X+GlADLq2u18XIDNi5KZhxi4eX006z24otABvdv1ZQjEaiDgunP4v3sr60xQ==
X-Received: by 2002:a05:6870:d8cb:b0:206:9edf:486e with SMTP id of11-20020a056870d8cb00b002069edf486emr4737710oac.42.1705298445449;
        Sun, 14 Jan 2024 22:00:45 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:44 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Eric Biggers <ebiggers@google.com>,
	Haorong Lu <ancientmodern4@gmail.com>
Subject: [v11, 07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Mon, 15 Jan 2024 05:59:26 +0000
Message-Id: <20240115055929.4736-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060049_720468_E1A87C13 
X-CRM114-Status: GOOD (  11.85  )
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
index f571af3d5f78..501e66debf69 100644
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
