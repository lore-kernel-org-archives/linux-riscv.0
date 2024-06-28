Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B4C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkv7HLnOMiFDAIdM4lyBquZ428aMcJOionXkUPZyYXM=; b=bAWaupvva758Fc
	K67vP5AKKO8owwuFVbDKVw0qkdoGh2hmwANoGQORWm+ypBUq+GqxTnl6PaiRnozZ3zKg4kbz3zjWN
	W/sGgvjwPYrUCRhWHgTdC3J5uYztOGp3UGKZzpNjN24kF5nsuFji0eG05m8IYo/1jhrDGAZgpoYgz
	Se4RHNJPjn9WNDXZK3fw2ZD2TZp/n1neOdHy16+RMRpBORlid0gQ5EdJ/Xx4EmU70x6xl1iz6vHVi
	8l9vvYLSQz3anxISDeKkfl/8Gf1Ey/zyhIVlpPXrgWLx9NYzz878y8019Z8oOV60eV/M4gv6yKr6h
	9F2FMRKexCZYtWwc2Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5m-0000000Da5f-3a8O;
	Fri, 28 Jun 2024 11:48:38 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5j-0000000Da3Z-2P2u
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:37 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3d56285aa18so235421b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575314; x=1720180114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu92VlTH1ow4WnF3F24wrq4zcoAj17+gcrjkHXOzv0c=;
        b=Kw8JDFWkA3GK/QLSA3o+K/AFp/2KfD9UW5XCR0+JaNrMPw/XAxS194LynVWB+K2J7n
         twYDmW5rC6/G/lniPa4aif8PWnNw4RuptLgQv6YDqn5VvJ7wCjpNnFXWi1NFtJ8NVxtb
         f0q3hFFqOi849kWtO9e6kMF3HxH9XJ9MwECkFyj0zmhI1UBpc9+pvYb5dHKr9MHZhJr5
         D/UQlRzCdi9TqV56fbbpMIFnT5vZL+fMopXmDlwa+GG0dsR6DnA1KAlh1lmiFytQeb5/
         NQz/BNnZmVUG4jwtO7bzzVSvWDVpRmYsRoVd1P3fwwCXHD8xrMPxY0B5xTeW6/wFBbzp
         AKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575314; x=1720180114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu92VlTH1ow4WnF3F24wrq4zcoAj17+gcrjkHXOzv0c=;
        b=jCxiWglycR/wOb4S96xK/HOxkjIhPQ19Friy1Uy1h5adUupfhIdGsQ22I8rnxjniUH
         +n7QYd+3x075cRORpb1T1Vd1XMtlsax83Nd8Ddt7Br/wBkp5NFdlghtCOUjq9t9nR88x
         Q33VvZdFOs/Wo7wPnMOT450u/YZayl746vlg9ZtbDUu9KdyOHW2zsoAKMbrUcHbpAnLq
         1Dj6gDifFJS0MleUr+ZFCZct2gEAieDLGY1xY2MWBQEYQE+4IbHnqTE+H+ZQpODgOArd
         zD4ZOYg9R5u5I8XqlsXjgZH2RApVDvq/9hPoH7wDDX5MwL9Pz5ZGsPf5IHBJFUrNE/hA
         pHjg==
X-Forwarded-Encrypted: i=1; AJvYcCX/c5bAD/Tay0UzbyCKronSdY84spsoP9ecAbSSyQeEBv+ap7rDGv92rrmWeP4tPrZDs9pNAW8FSygXVh8v51JsK+EYUX9AkIqrYoKvLnjc
X-Gm-Message-State: AOJu0Yyxdwk/aPVQbxOdzMJZXxIY6hIcEXbEh3r8+hmR9MZ79Wrfah1M
	GydUtZ8gV0jRIhR9Sfyb2/GGXy1Jlq2MHQbR8h/qoovoWCyJtJ4PAayogxM1Ecw=
X-Google-Smtp-Source: AGHT+IHqBcNxsuzbDkVDzeGLl+KZ+4BunsmWE6yFwxYZZDfljQ2MLP1gPrL7Qap1znSFly+4johqUA==
X-Received: by 2002:a05:6808:2105:b0:3d5:6754:807 with SMTP id 5614622812f47-3d567540b9dmr5736005b6e.22.1719575314434;
        Fri, 28 Jun 2024 04:48:34 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:34 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:48 +0800
Subject: [PATCH v2 5/6] riscv: vector: Support calling schedule() for
 preemptible Vector
MIME-Version: 1.0
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-5-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
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
X-CRM114-CacheID: sfid-20240628_044835_734959_37E70767 
X-CRM114-Status: GOOD (  15.42  )
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
index be7d309cca8a..fbf17aba92c1 100644
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
