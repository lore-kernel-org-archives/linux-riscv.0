Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A1C982DD
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zc3/zDOf9B4xKcyiWxo+3n5FqjJ6b/uuuB8bk73lyZw=; b=gRPlTK6I+ORgJj
	kScMKKQsmiIk6i1G2lLHHFyhxQn/IfRuBLNieFDqCx85+8OuksuM7j76Y5TRNjSYpTEh1zO/YTQls
	9Fm7bIaFGScXs6qa+xA9UK+BhBwM2cmFT25+qaTLIyf5MuEJLt3ifZn3XtBjUR2ZlwwbyZXhQu6n4
	byqFq/IrhEwivEvUcFufELPWmWMwWGMRXpx/uQc1igRo1LibfNbYTDGSaGawWt4fuHuOQDLPcznpq
	50Xj7rPuytiB3DSx6G2pyoSF4O5nukGUNxlY4A5BQFrkpn/98KH94nP9nmFS8SrcKdxAEpV3HJiN8
	aPyXWzbqyEAhNbahKTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWf-0000000Faf8-0LaP;
	Fri, 18 Sep 2026 21:53:45 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWc-0000000Fac2-0asO
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:43 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43ac8d1fso9525267b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768421; x=1790373221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEXCys1egtrJWNG4V0XIzeEvAvq00TLjC1iN777eSzk=;
        b=AO7zb/sII/AAAjxFfEkZlhYEQiZXDoQvZykNNzIS9jbgBNvAl1ifZFjOf+hZ1UCfnM
         IxWCIiJ0Tndl1tRoTjfkuwyHZMZWqvEbMV+4xeRi5zGPmA7VotMucL0XtBVSrHSUqW1p
         qBIhuhGURVB9qpJLrL3Hw3TmYWLvXzcvy4EorZrJwcUxtxGOKLGmhUFCXWFAvcG0IE/Z
         awkkYvfAdCT/lKJu//SZX8ddXxMhh6qT34zXY2vMFfBwxUmUYRz4P794RNpkLCF4e+HY
         e0FXbKnITPu7AMFTOf+b3+9fsMTFE0zAk7zPpphBV0j2Opo+cB/ObknBLnvEzPfiFEs+
         /pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768421; x=1790373221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEXCys1egtrJWNG4V0XIzeEvAvq00TLjC1iN777eSzk=;
        b=xjjvi1XUsDo7zOzGKEdPiCvDF6MfL+T3rMmbmxnIpU0ooJqnbICyfE7J28rJjFJ8Hg
         OfaoVIpLx++xc4CIIG/IW2ji0e1rPXeHE6CU+hxJgj4fMEcI95HnpfQOLB5BG715IJAn
         4xVUplDFJLmHWxW24hNBjz6LlA2Q2pGCqHr6ry9BxO4ECGE74/HjXWdODiQrLYB9EcUu
         iBAXCS2/ROb5YAFLhD2LMrFwWu1S3FjBlQgJo43tli9q5TCcdmp9ziiHkefTEcKalaP8
         cvHyQ11gQK24B9+LI5ctxtsZ5RyPdk2teABP9UEwLeYePZCeD/Gab5wao4pvAqsTcnQe
         Q84Q==
X-Forwarded-Encrypted: i=1; AKwUvByExY/GkDx1+UW0jmQTCGc3ybcSKB52Q8ei2tCgiFSD2oI5kpZ962Iz7iWzvhMUn3hIh5xHMZl56G/JYw==@lists.infradead.org
X-Gm-Message-State: AFuF++nYQZxo29k0cxxvHNXe9o52Tnjbl/QNiTHuTxYxUAsIFcyxTZcY
	Dg9nb467dBhHxyKXE3DgwwqJTuZwTucY6knJBxkr+kH+MxVEhCmW48zXGYquIbZyk1E=
X-Gm-Gg: AYBFou0/W9WYMpT+NBjv6AXB4kwEFNQpEg1wC0g48VU5gwvHGkDSBSO+P6lgh4O5Tqw
	ELuyvZTQQrD8Olz2Nw4HGKfWU9J60E4CEerj3meKGyqRmMN20VM2eAZd6Nj+tINUDfR0vkltY63
	Pc8SLhoL8r0TmpyYchYMo3CnG9kB3YAmRYonNGYYEN6tIUaEHeH8CbfzK35Bjf4ciRgSO5TboT6
	RIrFIFVmi6Vls8kO9QDfcYrP2t2xxjz2UpR1grRWKxb9bhdbM0aOhfv0VY48SUEMGYyDn2D8euO
	R7+KLfloOJGA3uTAHThUw0yID8CPv8RdrFdK0MNIpbUMMkSKp2JZT/KlaMAtQFEnruqRb4WmUwM
	L9XdRc42wfuAKuH0qw+6ZKwF5ECgYZ8v4Inc9Q5+1pnAJxDFP74xB7fbD5Z+Qb7urHFw000b+Ob
	DITqpYmXkroXpcB0+v7l/IvSOvFLXFa2FQqym/NbHo9mAUei3WlAhYUmrnCMIYlLgHyhAybp0Xh
	+hd4GQredOIglvRETE7WTEXQ5Oy/Vwf8BZn5Iq59o92ROY=
X-Received: by 2002:a05:690c:a605:b0:877:6e47:19b1 with SMTP id 00721157ae682-89733f0c7aamr11234547b3.30.1789768421148;
        Fri, 18 Sep 2026 14:53:41 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:40 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v6 5/8] riscv: clarify vector state semantics on syscall and context switch
Date: Fri, 18 Sep 2026 16:51:19 -0500
Message-ID: <20260918215154.2481482-6-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145342_231189_0C150D69 
X-CRM114-Status: GOOD (  19.77  )
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
index b9538ebd85be..61cd0848f661 100644
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
@@ -100,7 +109,7 @@ static inline void riscv_v_vstate_off(struct pt_regs *regs)
 	regs->status = __riscv_v_vstate_or(regs->status, OFF);
 }
 
-static inline void riscv_v_vstate_on(struct pt_regs *regs)
+static inline void riscv_v_vstate_init(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
@@ -293,16 +302,6 @@ static inline void __riscv_v_vstate_discard(void)
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
@@ -317,20 +316,26 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
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
 
@@ -401,6 +406,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_preempt_v_set_restore(next);
 		}
 	} else {
+		/* VS is never DIRTY at this point, there's no need to alter vstate here */
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
 	}
 }
@@ -426,7 +432,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
