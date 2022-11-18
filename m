Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuyMqwj6WA35TC3ahWSYazZAB+RNvQVggrWQgUZjcSw=; b=nBiRMpcbrxbxwX
	ftBYDpFANc7itc5jO0zadz1Z24Xp/ozPmtd2PLZbKQh4PlZZg3ZsvF11TYrUlzjZBmfjg7mmjg4ca
	529io7bMevTzi3TpJqCqVjU12WMcpGekQNacQYPXFWvaUo0pfI9fBugHN6WgLLdiKSct7kOjOykLw
	qUii0aBjabwxkU19aRNulbQZ2d/6mmS5mDytgwUg1IPAgLUNHxaBkErgO2haFXVlFAdnjCw+QOYPV
	d7XS/wTiSjmSrccyQnWO5pql4SOODYawfsGHo6UYJrAQMqRtrXG3tidBjEMIGLC8gVo/4eSGttPDu
	yus8545Gbu0SS4JkGqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EI-005rDr-M7; Fri, 18 Nov 2022 17:32:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EF-005rAW-2x
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:32:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d20so5136610plr.10
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NBmSk7fBSAJxNI2xlbnnvVbJDd4rleDkNQ22MfWjS4=;
        b=F0LYXy04+BTUjesxYiznzIMp2EPv6TsAXbgRS7pQaL8OVC5YVDOU5m8FLAC/FIzrky
         g023O0gv5uUPYMTsf65qv4ardfNDmUcl38ECWjHwojCt7NXtJVG3KJKr1l6WR8RljrFP
         rtiSJ0hvZ+xve4POcmFgudRMFpS3FTy5EaS4Gp6yEvXM8t7ByKn/EOEiFaG72rgpdwtE
         Ia1Qz9fLb20rSXAqzcEWosodqLqAhvtnpMJWCkTJmbTsx6dmQL6By1FcxZHnAhuYj8tx
         Rx9JHHuYX8ZUr+6rVgwnFnQKpG7/Ap36Kcc5H9AbqX6x0fsKxCcuJeXrTC8tCsXKkK0B
         4qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NBmSk7fBSAJxNI2xlbnnvVbJDd4rleDkNQ22MfWjS4=;
        b=Utrgpk79hR7DIfJUCCdderrzIAvnJEnWxWO7CTb4HZWq1KuwBV3L72SYRl3WMez3S2
         jizDjEjCQoHyubsjNO+snQAeqlKwVR07+wDlOLiI4MbfYLz9dzD+QsVePPwnkYbYS2tZ
         ClGjZ/IvqIaHANoLgFBKB+Kx9fGzbwkNjVmgqR/lEJ0hYaLk3nOxedRUwN4kYHNNeb9S
         xniPVc8Dob9VmwBsMtCpIjwdLNz3ajLaJiKtU/qMWk6Tjrv3x0gH4p9oEPipOgvzdVAw
         eIGY29a8tHRrJYIxPezkjM4IA3f31IvC1MVQWKGf0klQMcegnArR5ZfZov5d2WfqpgHW
         bXmA==
X-Gm-Message-State: ANoB5pnxhhFvn0Ja3m3nLCHWf+d7QnV7/K8GyBU8SolqIPpHTmzD76kH
	3HwETNxEZuWInhZjBpaHNfo=
X-Google-Smtp-Source: AA0mqf4QhHX9xixekXRosr4UFGQ5KWFFv0b2o6M8eemOOc2cuROcW7yNBijARk3dISgqt+U20PDZ2A==
X-Received: by 2002:a17:902:cf0e:b0:17c:5b01:f227 with SMTP id i14-20020a170902cf0e00b0017c5b01f227mr620277plg.3.1668792755984;
        Fri, 18 Nov 2022 09:32:35 -0800 (PST)
Received: from localhost.localdomain ([112.2.231.196])
        by smtp.gmail.com with ESMTPSA id u7-20020a656707000000b00476b6b7f339sm3037979pgf.11.2022.11.18.09.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:32:35 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH v3 2/2] riscv/ftrace: make ftrace_caller call ftrace_graph_func
Date: Sat, 19 Nov 2022 01:32:17 +0800
Message-Id: <20221118173217.888077-3-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221118173217.888077-1-suagrfillet@gmail.com>
References: <20221118173217.888077-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_093239_160284_9A35D2EC 
X-CRM114-Status: GOOD (  14.94  )
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

In order to make the function graph use ftrace directly, ftrace_caller
should be adjusted to save the necessary regs against the pt_regs layout
so it can call ftrace_graph_func reasonably.

SAVE_ALL now saves all the regs according to the pt_regs struct. Here
supersedes SAVE_ALL by SAVE_ABI_REGS which has an extra option to allow
saving only the necessary ABI-related regs for ftrace_caller.

ftrace_caller and ftrace_regs_caller save their regs with the respective
option of SAVE_ABI_REGS, then call the tracing function, especially
graph_ops's ftrace_graph_func. So the ftrace_graph_[regs]_call labels
aren't needed anymore if FTRACE_WITH_REGS is defined.

As the previous patch described, the ftrace_caller remains with its
ftrace_graph_call if FTRACE_WITH_REGS isn't defined,

For convenience, the original argument setup for the tracing function in
ftrace_[regs]_caller is killed and appended to the tail of SAVE_ABI_REGS.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/mcount-dyn.S | 143 ++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 64bc79816f5e..c70f04711a2e 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -57,19 +57,55 @@
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	.macro SAVE_ALL
+
+/**
+* SAVE_ABI_REGS - save regs against the pt_regs struct
+*
+* @all: tell if saving all the regs
+*
+* If all is set, all the regs will be saved, otherwise only ABI
+* related regs (a0-a7,epc,ra and optional s0) will be saved.
+*
+* For convenience the argument setup for tracing function is appended here.
+* Especially $sp is passed as the 4th argument of the tracing function.
+*
+* After the stack is established,
+*
+* 0(sp) stores the PC of the traced function which can be accessed
+* by &(fregs)->regs->epc in tracing function. Note that the real
+* function entry address should be computed with -FENTRY_RA_OFFSET.
+*
+* 8(sp) stores the function return address (i.e. parent IP) that
+* can be accessed by &(fregs)->regs->ra in tracing function.
+*
+* The other regs are saved at the respective localtion and accessed
+* by the respective pt_regs member.
+*
+* Here is the layout of stack for your reference.
+*
+* PT_SIZE_ON_STACK  ->  +++++++++
+*                       + ..... +
+*                       + t3-t6 +
+*                       + s2-s11+
+*                       + a0-a7 + --++++-> ftrace_caller saved
+*                       + s1    +   +
+*                       + s0    + --+
+*                       + t0-t2 +   +
+*                       + tp    +   +
+*                       + gp    +   +
+*                       + sp    +   +
+*                       + ra    + --+ // parent IP
+*               sp  ->  + epc   + --+ // PC
+*                       +++++++++
+**/
+	.macro SAVE_ABI_REGS, all=0
 	addi	sp, sp, -PT_SIZE_ON_STACK
 
 	REG_S t0,  PT_EPC(sp)
 	REG_S x1,  PT_RA(sp)
-	REG_S x2,  PT_SP(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x4,  PT_TP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
+
+	// always save the ABI regs
+
 	REG_S x10, PT_A0(sp)
 	REG_S x11, PT_A1(sp)
 	REG_S x12, PT_A2(sp)
@@ -78,6 +114,18 @@
 	REG_S x15, PT_A5(sp)
 	REG_S x16, PT_A6(sp)
 	REG_S x17, PT_A7(sp)
+
+	// save the leftover regs
+
+	.if \all == 1
+	REG_S x2,  PT_SP(sp)
+	REG_S x3,  PT_GP(sp)
+	REG_S x4,  PT_TP(sp)
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x8,  PT_S0(sp)
+	REG_S x9,  PT_S1(sp)
 	REG_S x18, PT_S2(sp)
 	REG_S x19, PT_S3(sp)
 	REG_S x20, PT_S4(sp)
@@ -92,19 +140,28 @@
 	REG_S x29, PT_T4(sp)
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
+
+	// save s0 if FP_TEST defined
+
+	.else
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_S x8,  PT_S0(sp)
+#endif
+	.endif
+
+	// setup 4 args for tracing functions
+
+	addi	a0, t0, -FENTRY_RA_OFFSET	// ip
+	la	a1, function_trace_op
+	REG_L	a2, 0(a1)			// op
+	REG_L	a1, PT_RA(sp)			// parent_ip
+	mv	a3, sp				// fregs
+
 	.endm
 
-	.macro RESTORE_ALL
+	.macro RESTORE_ABI_REGS, all=0
 	REG_L t0,  PT_EPC(sp)
 	REG_L x1,  PT_RA(sp)
-	REG_L x2,  PT_SP(sp)
-	REG_L x3,  PT_GP(sp)
-	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
 	REG_L x10, PT_A0(sp)
 	REG_L x11, PT_A1(sp)
 	REG_L x12, PT_A2(sp)
@@ -113,6 +170,16 @@
 	REG_L x15, PT_A5(sp)
 	REG_L x16, PT_A6(sp)
 	REG_L x17, PT_A7(sp)
+
+	.if \all == 1
+	REG_L x2,  PT_SP(sp)
+	REG_L x3,  PT_GP(sp)
+	REG_L x4,  PT_TP(sp)
+	REG_L x5,  PT_T0(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x8,  PT_S0(sp)
+	REG_L x9,  PT_S1(sp)
 	REG_L x18, PT_S2(sp)
 	REG_L x19, PT_S3(sp)
 	REG_L x20, PT_S4(sp)
@@ -128,10 +195,16 @@
 	REG_L x30, PT_T5(sp)
 	REG_L x31, PT_T6(sp)
 
+	.else
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_L x8,  PT_S0(sp)
+#endif
+	.endif
 	addi	sp, sp, PT_SIZE_ON_STACK
 	.endm
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
+#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
@@ -160,33 +233,27 @@ ftrace_graph_call:
 	jr t0
 ENDPROC(ftrace_caller)
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
-	SAVE_ALL
-
-	addi	a0, t0, -FENTRY_RA_OFFSET
-	la	a1, function_trace_op
-	REG_L	a2, 0(a1)
-	REG_L	a1, PT_RA(sp)
-	mv	a3, sp
+	SAVE_ABI_REGS 1
 
 ftrace_regs_call:
 	.global ftrace_regs_call
 	call	ftrace_stub
 
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, PT_RA
-	REG_L	a1, PT_T0(sp)
-	addi	a1, a1, -FENTRY_RA_OFFSET
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	mv	a2, s0
-#endif
-ftrace_graph_regs_call:
-	.global ftrace_graph_regs_call
-	call	ftrace_stub
-#endif
 
-	RESTORE_ALL
+	RESTORE_ABI_REGS 1
 	jr t0
 ENDPROC(ftrace_regs_caller)
+
+ENTRY(ftrace_caller)
+	SAVE_ABI_REGS 0
+
+ftrace_call:
+	.global ftrace_call
+	call	ftrace_stub
+
+	RESTORE_ABI_REGS 0
+	jr t0
+ENDPROC(ftrace_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
