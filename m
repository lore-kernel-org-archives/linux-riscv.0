Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E0CD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYQTcKdp3PrS1JTx+0DxKb+OxFu7SHlqG+UvvSaiY28=; b=iAIqge8IbEhfag
	Yl0u4mJLgyD1kwfNKwQjYNeZxDGJymSCf9bbmVWFRSQsrGpFxK/8Q9aUNz3JGYftBILDHWQI9SEMa
	yu2P8G+CDvE7bibR+bKxxeNDv0w1gBBoX+x2NLsZMcR/2TbKRnLZpUvpbayQ1GCriMd0e60AspJMy
	Msl9AgQGVTRddLiiOA/EnDM3omlR64yxRdEMLgRA8bWcx+L2VzIutOo8cQuQkz2F5dHbOhNBSpCN2
	8SRgBfoALjtUoI1x52wCsLFz76PxW0oT2SzOIpt2MHtlT8sMhArqAy82UbUyXPSVncuGbDzEfyld/
	hg7eEE2BGst71fVP7AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8Q-00000006G1W-2J46;
	Thu, 28 May 2026 19:11:14 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8O-00000006G0A-12mR
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 19:11:13 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e603d0ee0aso4174220a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995471; x=1780600271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/QDiiTKu3K2r9kN9VcSykUb1oKinEk0QB+FBuhXU7A=;
        b=Wg6YrFerixRja33f9wGHu/zbsQtZLWszJkH1Yr3AJgkYU1vZ11L75r1ZUhO5Mewvc4
         HN+qrpeBLc5VmXn3wEdhBcb9VGF2e1cKb5c5kCNmcH0xaW4TH3+l8KItIsKv+anJYlNs
         Rx+vD/PCY+97z/VeUn/NHel35BO9ecy/uUJWXVadSjUvob/UIFuRCBWBZqoX8q3CYm1l
         GJb5zQ750qNZIW35cu9rvNRJUXsT5AE/eNFxb21K2QvIF4HqykTrQ8C0GPxotlth3uZZ
         tgEbeD0Am1FqnpsQxYdbkensXFel0KpJcUO5G0A5a1g6hH0dd2V8440cEWWe8eDzl1Bl
         Br0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995471; x=1780600271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/QDiiTKu3K2r9kN9VcSykUb1oKinEk0QB+FBuhXU7A=;
        b=flGtru1avdfepxZMQMbVFupbSujyCauHaIJnTEdzc9qj/xZE/lvisF2wo1Tn/1UyCX
         68bNZuWKJZsFtWDHhYdQ0NGtY2Jsmb8Cuo47rLj560qTmpNoJDqKhPjcr290/itrQ5tV
         GumZDOIbDzhnCGpVmEW89/0FUB/er+oFlQNsl4lpPewwSUO6tgNSC3a8L1ena6aA8UUe
         raTmxnFiVBF37+b1u13hJWhW13sbSN8URQp5WTk6AyiuCvAtzw1yMWxE9F9hyuAkkHAh
         hksJBQNEa0AdxjNygGKdJ918i7i4ODgFFuu9Q5+jt4aNNMChEtf2k9OdxHv14OJR/Dbq
         YVBA==
X-Forwarded-Encrypted: i=1; AFNElJ9gx8YieTFVTlO+ed/df3SPN1AEI+ivLWtB0X0+CjDoeFvZJRRrUOS9hxNmANUmRyBlTgot3S1umwaJ0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMKMLPCjwv5VXv0OkXEAxv0O/UF1ytMW8iZUc7kM6WZsuibfR4
	dtF1wRQSpcjFIYiE+dX9zgOmcT7wafVf0rJlooyimjwdHdjTpzRMwQFU/3vo+2gJoXs=
X-Gm-Gg: Acq92OEhMCMGuWnt3xNrDiUrcSAvIaD38T5FNU7xFcqSNACwyfLShw6v9wzDVyWiWKA
	Nm0x/50A9L2ssPsOPikwuE8rhb9MlLP4sWGhi462fNOM4EjWyO1HMGppY7ywTc1+h8EZLFiv7so
	hffq5pR5KStViCQ6BRNgRCkuezUKCpFTIEzCxwhjprty1UYPBHKShyr8iCxrlLGV6gOlDV514fB
	CH23ZqPDBs0eSWQYtA8VIu3YYiORHNSJ+Vx4lzRgJAStyuFuN2jjpgErg/CN4P/wDdFt/mCXyA5
	af+FsQcMrXsOloq1HdtALvhhpEX9Z/YPAlgJ/xZlepkwMwMhirIpzueGpWNUg4hdRn5EUAijE+r
	JU2rQgcpYuwC4YMoEZSlrZdwZZssdLJRYLi1og6rCXUDl9SdTwk4uYOQJuNh8S9BxUBU40chOEk
	wvft9yI1eNAO7HtBO9aBcJuq3c5jT+oBLvHWLx4wubGg8jr2OxW2KUnrR5NdEfbE3AFMk=
X-Received: by 2002:a05:6830:498d:b0:7e4:411:7ad with SMTP id 46e09a7af769-7e5fef39070mr19908749a34.24.1779995470769;
        Thu, 28 May 2026 12:11:10 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:10 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: daichengrong <daichengrong@iscas.ac.cn>,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Yanteng Si <si.yanteng@linux.dev>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Han Gao <rabenda.cn@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [[PATCH] v4 2/4] riscv: clarify vector state semantics on syscall and context switch
Date: Thu, 28 May 2026 14:09:13 -0500
Message-ID: <20260528190927.886558-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528190927.886558-1-tchiu@tenstorrent.com>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
 <20260528190927.886558-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121112_308741_38B5636C 
X-CRM114-Status: GOOD (  19.31  )
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
   and set it to INIT if not already, indicating that the vector
   registers no longer contain meaningful user data. Context
   invalidation is required on restore.

   If the state is already set to INIT, it means that the user has not
   touched vector since the last invalidation. So no further action is
   required on restore.

2. During context switch, the vector state is saved only if the state is
   DIRTY. (no change)

3. On restore, if invalidation is required, the vector registers are
   overwritten with a known initial value and the state is set to INIT.

Performance improvements on Blackhole x280:

Latency of getpid() with different status.VS upon syscall entry in ns:
status.VS	Before Patch	After Patch	Improvement
DIRTY		235.9		242.4		+6.5 (+2.7%) # regress
INIT		234.8		174.4		-60.4 (-25.7%)
OFF		178.2		174.5		-3.7 (-2.1%)

Context switch latencies in us:
Metric		Before Patch	After Patch	Improvement
Mean Latency	14.19		11.62		-2.57 (-18.1%)
Median Latency	13.51		11.01		-2.50 (-18.5%)
Max Latency	27.76		21.92		-5.84 (-21.0%)
Min Latency	8.99		8.12		-0.87 (-9.7%)

The metrics on context switch latencies are obtained by running the
following command 100 times:
$ taskset 0x2 ./lat_ctx_v -N 10000 -s 512 2

The program lat_ctx_v is a modified lat_ctx where benchmark processes
(parent/child) do a `vsetvli` to dirtify VS before making each write
syscall.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
Co-developed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v4:
 - Provide performance meassurement (Olof)
 - Aggregate riscv_v_{enable,disable} for better performance (reduces to
   ~240 ns/call when the user touches vector)
 - Do not invalidate again if user doesn't touch vector
Changelog v3:
 - rename vstate_on to vstate_init to prevent confusion
 - set context as clean at first-use trap to return zero'ed context
 - reduce context nulling operations by defering __vstate_discard to
   exit_to_user_mode_prepare.
---
 arch/riscv/include/asm/vector.h | 44 +++++++++++++++++++--------------
 arch/riscv/kernel/vector.c      |  2 +-
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 45820cd900d6..c699cec27c79 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -40,6 +40,15 @@
 	_res;								\
 })
 
+#define __riscv_v_vstate_check_gt(_val, TYPE) ({			\
+	bool _res;							\
+	if (has_xtheadvector())						\
+		_res = ((_val) & SR_VS_THEAD) > SR_VS_##TYPE##_THEAD;	\
+	else								\
+		_res = ((_val) & SR_VS) > SR_VS_##TYPE;			\
+	_res;								\
+})
+
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -95,7 +104,7 @@ static inline void riscv_v_vstate_off(struct pt_regs *regs)
 	regs->status = __riscv_v_vstate_or(regs->status, OFF);
 }
 
-static inline void riscv_v_vstate_on(struct pt_regs *regs)
+static inline void riscv_v_vstate_init(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
@@ -288,16 +297,6 @@ static inline void __riscv_v_vstate_discard(void)
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
@@ -312,20 +311,26 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
-		riscv_v_enable();
+	riscv_v_enable();
+	if (__riscv_v_vstate_check(regs->status, INITIAL))
+		__riscv_v_vstate_discard();
+	else if (__riscv_v_vstate_check(regs->status, CLEAN))
 		__riscv_v_vstate_restore(vstate, vstate->datap);
-		riscv_v_disable();
-		__riscv_v_vstate_clean(regs);
-	}
+	riscv_v_disable();
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
+	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
+		riscv_v_vstate_set_restore(current, regs);
+		riscv_v_vstate_init(regs);
 	}
 }
 
@@ -396,6 +401,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_preempt_v_set_restore(next);
 		}
 	} else {
+		/* VS is never DIRTY at this point, there's no need to alter vstate here */
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
 	}
 }
@@ -421,7 +427,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
