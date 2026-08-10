Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F36C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AA7MD2KHOofoPO/3tvIJrMyp0JMuD9/wZeJt4EneTl0=; b=1AmHM8uwCJoIQW
	qAfcwQr5sGGxXMVT3NIj3se4CP8idFGko5giyfVh1LgduMZ2tqU40l6T5E0QyCmGukNZb1aZUIo0C
	AMe5pNx3gQgaHsPD7aoMhcoffR2jCfOlldjGbva0I82QE4oPxKZusWJP+g2VgBwjmcTnqhj8GHCCj
	XQrkX7TAh8Pm6skdl8qHl0npKGXZCq1qWvkx4hRxB24LijDbYhVhO7jrxabQ92uKIxwaslBHo6stI
	/OeqCRQ1EXLQ1zkoN81npMNCZ1tYEfD5ZNQojkozoQ8UlnxB1w+1NKMB6UdLD2HW5z5cSVofdv7yg
	LoHWYb+Fv/kRKlHe5Wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkc-0000000CVzY-0rUz;
	Mon, 10 Aug 2026 17:25:26 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkZ-0000000CVy0-45YU
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:25 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2325176a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382723; x=1786987523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgdWQjdp0y6XBW5B9mumfR7U2NGqh9kYodyU/UgzCAw=;
        b=TCdFukJocUpeZJR7cLCZI9jFNVVLP8M3MIAEoFRDdT6RcP1D0F8tePLHUSXWTefT7C
         UH3ib/kqJrWDBAgTlll63a4KrppGyJ0cFYjR9gqMvoZb6HKmuJrXq5zXLDiaGpxTY/Vc
         8ezvFgQzRnrGF/4rVcXUqhffjJV+Thu7m8j4d47TO+UTAmIEg5LXdXqsvGl9hJ4AZkS0
         /W8eSgfyxAvO2Ly4pqcB09KRd4A1LCmyuIz0vW5xv7V6+5zIc4ntvDl8QyOpVqJpG/mk
         sMl7pdZBYOWJLP34iG6vbNV70l+zr43Hv+1G08fww4cGi+nWg3k11qHrWC1cFiDYG0wk
         IFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382723; x=1786987523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgdWQjdp0y6XBW5B9mumfR7U2NGqh9kYodyU/UgzCAw=;
        b=m9fQSEwvlbQKZJcZQePugatMdBhLve3aVAeF9zYFdENkZYCKVqhf58LvwayYxrUZLv
         NCePSDe4xZ734GrOOIvpnpnKsBndKGx79k1kIhG3m3g+oHNRB/vLUMpR5hitfsbCYF8w
         jP4U/+kbUwKIVUOMs0Lgv7CKWHlAUxeRoXcTmy1soTiYJo9JhQDuwsllPDFNQvNkpUAp
         ETNbAtW7BTqbGtWDSonJu48AyoNuxTeLDYZK/4c6f83EM/fQSmH6wjL1R2AHdMoz+ME9
         Q+PkxlGjMRdEyNrORrTmcR8DZjSYa96Q3YL9yobDBdCinkp3wtk5AmPvmiSxaLDozfJu
         UW2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1DIv+mbgtwHl0x5Xc+VTG1gZRS16LoayObwyU+1UsFY4Co0Tw4IUPhc+kUSWXOIb7D/1CgS7DU8b2Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwILXhkVqPYD3M7h1wKsfgKPp11l5FTP+KFt74Hh2Gfnc4uLRR2
	QTwQTEE+5TzPT12c5kTWC8OoV+xnoHXoxXrWd4vEdvM0JcBCOkngIq/8gLGWSB20V7o=
X-Gm-Gg: AR+sD13Ri2qrTxIJSJqYXfQQ2Q6X++9q5sbQyEBtGeM4sybkUk4k73sAt6SCIOvGJJK
	VEjzAYWmSHESE9JpOn5YA+SyP3p3Lb8NJp/Knoh+liZJ0wveB7IvBxkRGPqJTpQl4UWq6/AKvSE
	Gs/NcLgXY3WIzEEuGKIZPaJ61HH7FXciNatrMV56yJIB6/B6QpTHfagE2PqwK4xoMqin18R8LAF
	LLsEa8fFz3L1nXZ8aRAne1abWId3MPx7qbRnbQf0Ek3ha0FWSrlgaxAekq6jdaPO+3s/CX3o6Ye
	P5X1lP0O5hXEt7UuFcuqgCS2g3SqHJkNjvxs3iIYtcRl+uR+1wEu6cLb7QVUYaFB5bDPPo17JLP
	oxfW3J9SkYmeaJnO2IOAASGBYruACb/h5zOIrtP01FjDsWc1obc0GtKejMOAsRagMEX6jDUbuHg
	9BJHaN4ddOEEKFlmEKc+cu/Yk9fPU9kUnMfooVrXxXpmM5NWSze0A82iXqlEFoKlF36cGhWus4i
	J9VCTbiWglVcqyCAz6onSM0QHHHb0AqV3iU6YMPxNU2b4a4r1EsklBu9XncxhNvsA==
X-Received: by 2002:a05:6a00:12ca:b0:84e:2722:5d9e with SMTP id d2e1a72fcca58-84f9c8da5a1mr3030700b3a.1.1786382722885;
        Mon, 10 Aug 2026 10:25:22 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:22 -0700 (PDT)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 4/7] riscv: clarify vector state semantics on syscall and context switch
Date: Mon, 10 Aug 2026 12:22:31 -0500
Message-ID: <20260810172255.1532787-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102524_044415_7846C545 
X-CRM114-Status: GOOD (  19.69  )
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
index e7f9fce5ab43..355104336c70 100644
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
 
@@ -400,6 +405,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_preempt_v_set_restore(next);
 		}
 	} else {
+		/* VS is never DIRTY at this point, there's no need to alter vstate here */
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
 	}
 }
@@ -425,7 +431,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
