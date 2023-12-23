Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B0C4706F
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha73qKQbtIq7iUoS3LMGCuAnns7/WgmLk7nO4StrMoo=; b=dSJ9EY1+ebnj0U
	Tf8je9LLie9P7WFANtuo9sbHd5th76etVnPNINZmu22AJu1EmyKz8XrMFV1AuHrcp3vYxDu2SUf4b
	7kXeyKZEJio2MKWag4N8Aqgbh908SDMysjng2xijJnKZCSLEHKfzxTrQ5+Ul2JSQ8sekMH4W+OHdk
	TYYNvcaumqpfHYtsrrishEjoxI5hHEo6i0JCG038hal4YU2G+FRMCjaa/omTzXcjXsD1vz+otVRJM
	m87NsObfNsv0OeWGmBNXXT9mpLStV+loiR6FdX9TlA6fbX1qsIlXGJq6AT6l/w3dVCDrf1eFO5h/X
	WPxejBPxiLY+D1HMNVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf6-007MHU-0v;
	Sat, 23 Dec 2023 04:30:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf3-007MC0-2a
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:30:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3aa0321b5so20880625ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305842; x=1703910642; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZlQGTCjQqjliuojyWgivd2rpkt3ddAT4OmznBNHzWs=;
        b=d/1R2uP0MadaEQrk1axlV7sR6ZiQF4xufij0kZAMj1nN8L8hnjSMsKbpqDCYDMSFRy
         2h4R6rLg5Y8/GpSqwynqfj3D2qBq0frdPkRHpc796bcdH0/aNypIyWgtab6F0AAZ85+t
         TrhpRaLEapGOs7N96k5+o1pr75Z7fvWORBAmTIeYAX4hXGAxKyUqnbmOv5HqBasS1F5y
         aKhnKJLwv8vMShbEdBTM6xhHflOjrJJC9WJOkqORISTZ205gDXHGAMVS6aNIURPD4Yyd
         wXBLNBEx+g5SYeDP4/9rsmajUB+Qsab6q5lHLYQv4+73sLN6Z2xeXloGffQdgM+qZVjN
         3gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305842; x=1703910642;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZlQGTCjQqjliuojyWgivd2rpkt3ddAT4OmznBNHzWs=;
        b=l2ydSnXNHvwzyv4UXLTZX5soXzV4N9Rl4b40DH50ENBbVAzSlJQWJxuK+prsLmtxjF
         j85wnDiIPEOr+BmeN3h5NkqRkz+sb+npr7/qDzDJDRQr2JdD0CerXNWBnYy+eFdTgr9n
         NWReDaQfFdXW/D6McV6zdB1dKE3pqHzVUgLlDcx3NKnvaobedKHKG/AZh/YVC0vs3JpM
         gN4ST8fuJeJs0AyrCm/pcPXURjU5AvBrdF7ImBex5633vNQOOgtbi8LMj6ap2Yo/p8G6
         YQ1e8JJFksV41natBwuvkcwNbdUVnFkx3sh/xhL33MWBK7c7CXhWxkPc9MwXZ91H80iT
         5TPw==
X-Gm-Message-State: AOJu0Yw21QNFI3YuLSkMFMOqPhLBwLFWPDJYX98TIUWrjMBp4Ec64hwu
	eG2MsHQ1TWv+iEA7WM621AjMznx02y03JMXazFl4SCK6Typ6Pga0qt07AzS/ZadRod3UdrzHUx1
	UScb3iqY1UDKMT503Rh5xnui6I2kqAP/41atTdKSeMDyhS+8MW9/zeNEe/7fCDs0dAhaGMz4r5g
	vcEs6QNiVzzLypIRu6t8Fs
X-Google-Smtp-Source: AGHT+IHr+n42GPvBf0BJybFkh7arTRqC3HcbDE9/mTojLW4MMw7A2D/djMwBN+yWfYJpyM3Y/0T4Gw==
X-Received: by 2002:a17:902:ea05:b0:1d3:66ba:454d with SMTP id s5-20020a170902ea0500b001d366ba454dmr2967223plg.4.1703305842401;
        Fri, 22 Dec 2023 20:30:42 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:30:41 -0800 (PST)
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
	Mathis Salmen <mathis.salmen@matsal.de>,
	Haorong Lu <ancientmodern4@gmail.com>
Subject: [v8, 07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Sat, 23 Dec 2023 04:29:11 +0000
Message-Id: <20231223042914.18599-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_203053_854026_9EF70796 
X-CRM114-Status: GOOD (  11.55  )
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
index 63814e780c28..7350e975e094 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -76,7 +76,7 @@ void kernel_vector_begin(void)
 
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
