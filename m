Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608E1C27C55
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYxqDVrbVk+6MJBagdyVrpo4CkfxS0pAQOhG+ybSCOI=; b=ljx3Rs/tCa01Aj
	qbU12rhtdbmx5rFzB6rHQRjmgFK/yr28DT+3OJae0sxLaZiXetI3KkwzHogOJkIvktyZr618Px6fB
	VvamQl2++rDj8E8X2duSNPvyCY9A9kbI+GbEyAhWOQkhr6mQBAvGxuaRvQO/51RJekcdEhFu75+AG
	gf0f77w0ghRMOpvtFWdKc1BYfDabwVvVHTKP49U4eQZn5ISLnNwBfehH27E0xLLBvqeXae1CSifM/
	BZn1SgMjzHGxZD3r7UEN2ORLvJh92slYzRV+TNgwl+uZX63236PzR6EB9X44VXreNIg+KTEGGIRoy
	7wWRG6pb99IZe42cajCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSrz-0000000Cdg5-2t7b;
	Fri, 07 Jun 2024 06:14:35 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSrs-0000000CdeL-3mEu
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 06:14:34 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dfa76c9da2dso202514276.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1717740865; x=1718345665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SBe0khJYPcKe88Z20mPvCwpcr89NxfQGoP3AH5L95A=;
        b=S8Kn9xA42/gRHrVBl3xAVvUCMRZF0IsmMOEWQv2hvXN6oxNDzl+dXwi/oIXb8fmwu6
         OHDGAeZ8WKekUGX1GTXdJZzQsqcjQFsGH3fXx3tFQ3T0Jt27V17AAGENcoSxs8Ju6izO
         sHvDH3eXOyTbAZajbaVErgyT4TDHfx2QoS1uaqMminov/MEN+3XWOQgHLe9+tWj3AZBQ
         miXNSJ55ZG3WXAarDNmP9WS0XFSvBgHObx4TFTVTOdbqLfFMX9fi5MS57LZoVnzNyY+j
         FEkJC94jXyZIP4TnYUcus45YirIY25nOrWQuB4HaEQbD3wT58uUG/zpOQuL/uSSYFAIq
         yArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717740865; x=1718345665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SBe0khJYPcKe88Z20mPvCwpcr89NxfQGoP3AH5L95A=;
        b=jjLsMr0uP708T/3A6w7CZviOcg650isimD9KGjFracR9VEulAHfiubRJwYTMePYqd7
         yre+oo3RKCIO5KWGrqGaOj9mz2MG286aNPG/gPUB1r/vxFPg0vIe+pEizWWfNQLNgUbK
         oBVYDmK8vou3VnJCfXIk9Eh2mriXSdFqgXwYyBAMG5EvJf69514XR5jSW7xGphGixfxs
         mteqv7r0srWAcpjtoseHzbWNAoIj5kBO50ZVOrKR+pppM4fgybheaTH8u9zjsbW4JhwB
         CKtusTBVxJbgSdIVf9LTJ3jzDqHWDkizqEZskqDLIs9Xh4hSuyuTNC8T3Zx3QE5kt0b+
         mNYQ==
X-Gm-Message-State: AOJu0YxipeDWmaTyzQKKF6FR7q9l1qyi7bzmkk7jXpKZaop3APnkxGje
	/lJkzbRZcX4xuokbyNhorXrrwrKsl+y3jlD+2FnCKRhZJOQJ16gFUuU1/2o3PA==
X-Google-Smtp-Source: AGHT+IF+YQ5lJDKmqA+WH/WoIEvyjrQ78iQvA3dqU25oe5V7nAI6uAGAEswdWk6Jk9UqgkFGFGFpJQ==
X-Received: by 2002:a81:8d0c:0:b0:61a:e298:54bd with SMTP id 00721157ae682-62cd56bb40amr12741747b3.5.1717740864945;
        Thu, 06 Jun 2024 23:14:24 -0700 (PDT)
Received: from sjc-lab-t7002.local.tenstorrent.com ([38.142.247.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f9f5f36sm14009226d6.128.2024.06.06.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 23:14:24 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	antonb@tenstorrent.com
Subject: [PATCH v2] riscv: Improve exception and system call latency
Date: Thu,  6 Jun 2024 23:13:35 -0700
Message-Id: <20240607061335.2197383-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231225040018.1660554-1-antonb@tenstorrent.com>
References: <20231225040018.1660554-1-antonb@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_231429_086713_343BCFAB 
X-CRM114-Status: GOOD (  15.92  )
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

From: Anton Blanchard <antonb@tenstorrent.com>

Many CPUs implement return address branch prediction as a stack. The
RISCV architecture refers to this as a return address stack (RAS). If
this gets corrupted then the CPU will mispredict at least one but
potentally many function returns.

There are two issues with the current RISCV exception code:

- We are using the alternate link stack (x5/t0) for the indirect branch
  which makes the hardware think this is a function return. This will
  corrupt the RAS.

- We modify the return address of handle_exception to point to
  ret_from_exception. This will also corrupt the RAS.

Testing the null system call latency before and after the patch:

Visionfive2 (StarFive JH7110 / U74)
baseline: 189.87 ns
patched:  176.76 ns

Lichee pi 4a (T-Head TH1520 / C910)
baseline: 666.58 ns
patched:  636.90 ns

Just over 7% on the U74 and just over 4% on the C910.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
v2:
   Simplify jalr ra,t1 to jalr t1
   Drop extra .globl from entry.S and use ra == handle_exception
---
 arch/riscv/kernel/entry.S      | 17 ++++++++++-------
 arch/riscv/kernel/stacktrace.c |  4 ++--
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481a..c933460ed3e9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -88,7 +88,6 @@ SYM_CODE_START(handle_exception)
 	call riscv_v_context_nesting_start
 #endif
 	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
 
 	/*
 	 * MSB of cause differentiates between
@@ -97,7 +96,8 @@ SYM_CODE_START(handle_exception)
 	bge s4, zero, 1f
 
 	/* Handle interrupts */
-	tail do_irq
+	call do_irq
+	j ret_from_exception
 1:
 	/* Handle other exceptions */
 	slli t0, s4, RISCV_LGPTR
@@ -105,11 +105,14 @@ SYM_CODE_START(handle_exception)
 	la t2, excp_vect_table_end
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
-	bgeu t0, t2, 1f
-	REG_L t0, 0(t0)
-	jr t0
-1:
-	tail do_trap_unknown
+	bgeu t0, t2, 3f
+	REG_L t1, 0(t0)
+2:	jalr t1
+	j ret_from_exception
+3:
+
+	la t1, do_trap_unknown
+	j 2b
 SYM_CODE_END(handle_exception)
 ASM_NOKPROBE(handle_exception)
 
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..5eb3d135b717 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,7 +16,7 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
-extern asmlinkage void ret_from_exception(void);
+extern asmlinkage void handle_exception(void);
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 {
@@ -70,7 +70,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 						   &frame->ra);
-			if (pc == (unsigned long)ret_from_exception) {
+			if (pc == (unsigned long)handle_exception) {
 				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
 					break;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
