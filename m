Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0AC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxmMr9yb+IAIkIVwMxqss31xkq2xvECUfg+vFmxBQVs=; b=ekiZZSmwrrz7i7
	P6+hTptpmI56EpXmDlaYfnfTtbs2P0l5NIqXf8R3xzBUSE3zFxty1vKwqyLSEguG/CxSquBeCFVgs
	5sSmOjiJz786dWnuyepfiEf+Orrx+LbaGL9BqT7fkNowRKigv5Pq85hY6fokhEfK2JFYFrIrSzmKw
	idq6czrVZAPOUB11GghxwYHce0uJ1IqMZEEnC5bzi3+HizmR584FAgskCm2Rchuco1PGLv/QRDuW7
	PvizCPIq3Zb0M0X+pIuHQCcFa60gjEwNtH4vc4rrGISUlewYfxipPZzi0UZii+9CEPOyRULghxtQC
	1jTowg2FZbNg8WIYDyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEb-008BvX-9j; Tue, 15 Nov 2022 06:15:49 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEY-008Bmq-Ju
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 06:15:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id f3so5973543pgc.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 22:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Sgd0SU9M6CpUSRStE6vDvg0DHGGT+ouTzN5zX360k=;
        b=RLvkKCG7nrm/wgdAHq4lZ8n3IHVY4pu4Hdmp7J6S4MWjYEnvIB5iQiZcu+fMgb2KOW
         UTdU3Q60wS1YYu/au7tQbG9UG1EhfqQZ22tWLShxUgzW0ugwqJltj9uWQtZcH6s8agN6
         y6/fy6ZSjw5oFCY9I3PYRKJpR8rU6tIbHrxgP9Wd+ZwMe/02I5TdFv4YiGT4Od7yX2Sh
         w7WWAUBVI5P48QF/OGcIr18vO+aK4IAWXE1mNn8SDZYEIdKNIpFXv6UdtYh1PsQvEPKN
         ZgPyNbyGKpQkFTYtmRhkl4ZEh7yEbNxnq1FmwL9htoRK9Akta4BU8MUCumq9axOUv0bv
         BzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Sgd0SU9M6CpUSRStE6vDvg0DHGGT+ouTzN5zX360k=;
        b=AXz3tZKxWVtwJDYs5vwZvcs7OD1mIkv15FTp/P3jx3pIHfPdExBQGfcxvho8PfZdO5
         EpGIQY9PazdDwZ79wEsQ9mVnDhwSiHJw1xORBF1X0heahSSXUdyRNOOhxsODd79AJHo9
         XD5XPqvtBhBeREUw9b8XyDuIc1k8v4cavAahGCbXCZ3MnSFkmzDotOTEpP655028AB72
         Bn0g5Mpy+D6L/Z5BFRCQhQasZnBjvEhqD5lTWzT1FSk+zgQNIo6sSkuBbPxyeWtjOmCz
         Nnf8iKBnw3HCryBd4KIRbVLYZhmZ+vN8F7sMtSPwTQoAmOOLNcAKbQfUKVrextTv4aNN
         6uVg==
X-Gm-Message-State: ANoB5pnDYxqxey9FMleArHyc3ZZpbDQNu0mEyBr0Cwb3gXHKW0d85sS/
	vr/MLZ6zQZhHa5cif62JJ6Q=
X-Google-Smtp-Source: AA0mqf4K2GTqB5Dv3gM/5VHOAGcrjGoILrRpczQMk2CJfojXtH1O86Y92YaEXu2Qrxam2vswFDx8Cw==
X-Received: by 2002:a63:181e:0:b0:470:f0c:96da with SMTP id y30-20020a63181e000000b004700f0c96damr14267453pgl.544.1668492943688;
        Mon, 14 Nov 2022 22:15:43 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709027ec900b0017f57787a4asm8736769plb.229.2022.11.14.22.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:15:43 -0800 (PST)
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
Subject: [PATCH 2/3] riscv/ftrace: SAVE_ALL supports lightweight save
Date: Tue, 15 Nov 2022 14:15:24 +0800
Message-Id: <20221115061525.112757-3-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221115061525.112757-1-suagrfillet@gmail.com>
References: <20221115061525.112757-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_221546_684252_DB9F9711 
X-CRM114-Status: GOOD (  13.73  )
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
introduces a lightweight option for SAVE_ALL to save only the necessary
regs for ftrace_caller.

For convenience, the original argument setup for the tracing function in
ftrace_[regs]_caller is killed and appended to the tail of SAVE_ALL.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/mcount-dyn.S | 110 +++++++++++++++++++++++++++------
 1 file changed, 92 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..2f0a280bd7a0 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -56,7 +56,51 @@
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	.macro SAVE_ALL
+
+/**
+* SAVE_ALL - save regs against the pt_regs struct
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
+*
+*			=========
+*			|  pip  |
+* PT_SIZE_ON_STACK  ->  =========
+*			+ ..... +
+*			+ t3-t6 +
+*			+ s2-s11+
+*			+ a0-a7 + --++++-> ftrace_caller saved
+*			+ s1    +   +
+*			+ s0    + --+
+*			+ t0-t2 +   +
+*			+ tp    +   +
+*			+ gp    +   +
+*			+ sp    +   +
+*			+ ra    + --+ // parent IP
+*		sp  ->  + epc   + --+ // PC of the traced function
+*			+++++++++
+**/
+	.macro SAVE_ALL, all=0
 	addi	sp, sp, -SZREG
 	addi	sp, sp, -PT_SIZE_ON_STACK
 
@@ -67,14 +111,8 @@
 	REG_S x1,  PT_RA(sp)
 	REG_L x1,  PT_EPC(sp)
 
-	REG_S x2,  PT_SP(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x4,  PT_TP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
+	/* always save the ABI regs */
+
 	REG_S x10, PT_A0(sp)
 	REG_S x11, PT_A1(sp)
 	REG_S x12, PT_A2(sp)
@@ -83,6 +121,18 @@
 	REG_S x15, PT_A5(sp)
 	REG_S x16, PT_A6(sp)
 	REG_S x17, PT_A7(sp)
+
+	/* save leftover regs for ftrace_regs_caller*/
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
@@ -97,22 +147,31 @@
 	REG_S x29, PT_T4(sp)
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
+	.else
+
+	/* save s0 for ftrace_caller if FP_TEST defined */
+
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_S x8,  PT_S0(sp)
+#endif
+	.endif
+
+	/* setup 4 args for tracing functions  */
+
+	addi	a0, ra, -FENTRY_RA_OFFSET // ip
+	la	a1, function_trace_op
+	REG_L	a2, 0(a1)		// op
+	REG_L	a1, PT_SIZE_ON_STACK(sp) // parent_ip
+	mv	a3, sp			// fregs
 	.endm
 
-	.macro RESTORE_ALL
+	.macro RESTORE_ALL, all=0
 	REG_L x1,  PT_RA(sp)
 	addi	sp, sp, PT_SIZE_ON_STACK
 	REG_S x1,  (sp)
 	addi	sp, sp, -PT_SIZE_ON_STACK
 	REG_L x1,  PT_EPC(sp)
-	REG_L x2,  PT_SP(sp)
-	REG_L x3,  PT_GP(sp)
-	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
+
 	REG_L x10, PT_A0(sp)
 	REG_L x11, PT_A1(sp)
 	REG_L x12, PT_A2(sp)
@@ -121,6 +180,16 @@
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
@@ -136,6 +205,11 @@
 	REG_L x30, PT_T5(sp)
 	REG_L x31, PT_T6(sp)
 
+	.else
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_L x8,  PT_S0(sp)
+#endif
+	.endif
 	addi	sp, sp, PT_SIZE_ON_STACK
 	addi	sp, sp, SZREG
 	.endm
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
