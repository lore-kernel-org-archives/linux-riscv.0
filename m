Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B76C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E31zw1nDWIcdMf8zi68b4EzmEarSC61pYX9RKuAoTP4=; b=eLK6Z5njh4J9hR
	AnfvdyW5fW7/MSdkX6o7xAymC0wTNDd9cwpzk8l6glxXiUbTxWHc89C6jMvOS3p5HuQyoRJYVQp2m
	k9ccBOd4FeGECRoZftOWWcMItSK+uxG3udCrA1lWFn1K0yu/F6FQ8OwpCXQgjBgmG+wq8FrO5uzmd
	Od3CX7JZKgaNzL9G/u2ykmZ7+hO4XZeMNJfc0ROlRKh5eHX8OJQBaHZSR/b0x7EHCtVqeWEmBnoeE
	Y6j4ky/NJ/zQaB0ncAHFBnRrL0eoUfuDMJvNS5sG9/qCAm8iSs/jCO70yzP0EM5geU53UWDQAF9dt
	q8AtqgMQnsCm7U1oo8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexN-0000000FUd7-1qmK;
	Thu, 13 Jun 2024 07:33:13 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexJ-0000000FUZh-2lwC
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:33:11 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3d226c5a157so381990b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263988; x=1718868788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeZhGtu+DoZzH37TzHgHW9NZu5mW4WfgIzkfv6QNhDQ=;
        b=GnbsMc9grot+5Jp0JDhM1cixBhfS+jGsImEXQNS2xfyjmuNXrGu8+hTatSKa8Hn9aD
         /Ev3GgceWz8NJFOnN9YSqAirLj3OAO/0MOHTLO6+j6FdrWLQlOoq69l5XP7Y9fG3eFwX
         0NqxDDoLXoX1nVlhZjWWFRnGc+K8f/4+nKfvG3tLGr9m8wlicZBpPH7TDGsDbr//JuNY
         OfTb7U4jcz+Y74UO4FJIYvEAXLw8tVpUfTntNupYLFH2JA59lHPBxuPX3JOtuHOt7T4v
         t/ODigyh/fF7n1CZre1GNSQKKS9jSZZ5/xMCivL6LimzaMav2UWtDbJZP2kKWw38n+5Y
         Qmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263988; x=1718868788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeZhGtu+DoZzH37TzHgHW9NZu5mW4WfgIzkfv6QNhDQ=;
        b=ZnnZmAllPkHLnGuUSX8zFh4aQA9+c6pAG6TbttxUJjK3r68/562DAgEmJvUiZquDg2
         7ZLaAbFnr5r0QMVbl6PVUUuv4iyYYoo3lVkF8WIOdykqLwMSt0T9fNgx6pcvdwxQaUbh
         XaCCHhZStClnBIW3XjF8a4HycODng28JdPdJSQxx2gMvdewj924k6RngKQ0dGR5RuBog
         iub051o0IXXzI4ExNh8+sDQ2qgb612Iq7Ur4aWiHKeXU3seO3FxAj3VN084G1GV9uFw0
         joBLTCkr68ihGuf9U9MR9aCwQHkImOy5L0ceK0pQ4kRuDi53s0fLKrIxxKxMaN+T1uBU
         Yt7g==
X-Forwarded-Encrypted: i=1; AJvYcCWiA3JVbs2GWRXnFIC2V3MjzMEiGtW56W1ycuynv6bGcM0ZI22N2hiJnoHU2EIzwH37mq2Hu+Zl+Cs6jgX2als0AwBAh+9/bcdiMqJ1Blx2
X-Gm-Message-State: AOJu0Yw8U15QJGA7cTToCN9U7w8k+NSfqtdXtDq7L3b23Vmfc5MHTeVQ
	s0ofR/ogz8lwLJH6a26Ml4ZQQ5GOiehqeAhqDgOUQGrqr9TW8jEpjAgU0FDmgqw=
X-Google-Smtp-Source: AGHT+IG/QcH0femSCZzF6g5xhDc4dqSZTxWrgAQgosN/9/estM4RRUpCw1U0PcaMW2D86qVbhMaGwA==
X-Received: by 2002:a05:6808:2199:b0:3d2:1c8f:be0c with SMTP id 5614622812f47-3d23e045f11mr5371608b6e.30.1718263988155;
        Thu, 13 Jun 2024 00:33:08 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:33:07 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:12 +0800
Subject: [PATCH 7/8] riscv: vector: Support calling schedule() for
 preemptible Vector
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-7-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003309_778314_66457B4C 
X-CRM114-Status: GOOD (  14.97  )
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

Each function entry implies a call to ftrace infrastructure. And it may
call into schedule in some cases. So, it is possible for preemptible
kernel-mode Vector to implicitly call into schedule. Since all V-regs
are caller-saved, it is possible to drop all V context when a thread
voluntarily call schedule(). Besides, we currently don't pass argument
through vector register, so we don't have to save/restore V-regs in
ftrace trampoline.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h |  5 +++++
 arch/riscv/include/asm/vector.h    | 22 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 68c3432dc6ea..02598e168659 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -95,6 +95,10 @@ struct pt_regs;
  *       Thus, the task does not own preempt_v. Any use of Vector will have to
  *       save preempt_v, if dirty, and fallback to non-preemptible kernel-mode
  *       Vector.
+ *  - bit 29: The thread voluntarily calls schedule() while holding an active
+ *    preempt_v. All preempt_v context should be dropped in such case because
+ *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
+ *    schedule() call.
  *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
@@ -109,6 +113,7 @@ struct pt_regs;
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
+#define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
 
 /* CPU-specific state of a task */
 struct thread_struct {
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 731dcd0ed4de..50693cffbe78 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -75,6 +75,11 @@ static __always_inline void riscv_v_disable(void)
 	csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline bool riscv_v_is_on(void)
+{
+	return !!(csr_read(CSR_SSTATUS) & SR_VS);
+}
+
 static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 {
 	asm volatile (
@@ -243,6 +248,11 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
+		if (riscv_v_is_on()) {
+			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+			riscv_v_disable();
+			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
+		}
 		if (riscv_preempt_v_dirty(prev)) {
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
@@ -253,10 +263,16 @@ static inline void __switch_to_vector(struct task_struct *prev,
 		riscv_v_vstate_save(&prev->thread.vstate, regs);
 	}
 
-	if (riscv_preempt_v_started(next))
-		riscv_preempt_v_set_restore(next);
-	else
+	if (riscv_preempt_v_started(next)) {
+		if (next->thread.riscv_v_flags & RISCV_PREEMPT_V_IN_SCHEDULE) {
+			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
+			riscv_v_enable();
+		} else {
+			riscv_preempt_v_set_restore(next);
+		}
+	} else {
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
