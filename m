Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA6C76195
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mq6ozdATvbn9i63FcB8EZvDuFSgj2pw5oGEEdQRGryg=; b=CY/yL1GJS5H3HX
	AE13HWfp3JeWZ+TioS+1yr9STPHAJTL892r0Th8sq+l0qL8BPV0C53ijbrcB2zPlO/RiHUxQRvlA2
	tm7ZR88Qpm2A3SYB80MVbSgWSFXMnKas4gV04pPQPKgTe2+C69NlLi2hYrDL0hMhjq0haBxGZoq0t
	e6tLbjULHwqi8YAEfvjXXfNrkPKlQhmLli2M8QXt4FPTsTpaSehERuidqXksUzmm/Ij/N+OJrW8Rk
	GDKV11LLfPc0q0X6JKo/V/MG73z8RrE2DZfcoFIljGN4A5PbRtsJ84Qr7wo/PCdLVk/TOD1NkxdyE
	CbwnQDilOco8JRy0yxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBv-003Sz2-2Z;
	Fri, 24 Mar 2023 03:34:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBs-003SxN-2g
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 03:34:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so3851726pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679628847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3q26JSTHb9HYIOZ2NkxVcC/C3mDBZ5uwCCl/dONZmQ=;
        b=cuRpWV5cKp07vKKkNf/V5y1lMpltfHXdtPyPSyVUxRT0PvblGr1GZBBms70dHT4LIV
         4cLikAHxv86L3624SAn+yQv8m/7Q+PJFHAENozudSc0ikV7ecbWW36MP2pOzt23itJvY
         dbVRAoWVf3OJa4qOKWTdeOlWRiyOa2L70DhV9CMJZobBE11PlCXVklMjCb0sJK3eVbFw
         eR5nBayIzej1NuAyunK9R7zvHnt5HYCHSuboai5o0UxNT9uzxkzpyv3ofyaWUJKj/+p7
         ztdQee2/V/Vb1Pt1hERh6wRx00yqrHdXNkmUQIAqcN5MX/ChRJ7TY5PdqaUrD/Wol4ia
         hXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679628847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3q26JSTHb9HYIOZ2NkxVcC/C3mDBZ5uwCCl/dONZmQ=;
        b=y78q3q28dolmKZASkMov/QqqG98c4q5hbdObGZJXQo4nUPUsBMTRzCCNn8n4utW0Tm
         JFj5mZba/ytK47mDoJIAghgI4+Jd7pHsHsbpgJ1LK6UHlb3wCNBl/PgwFxlPo3FFNgBx
         WnzqCFKy8ZcduRDjD6rVBa9NOlmbHdqEUaYk1lqSAnjVgW387WD5oYcVR4OOsgb+3VVH
         1X3njPzBb/HEqExeg0b07PVM5w0GC7Wn0TXr9o0RCYtLvmW0gCHgB8MG8WwQvNMLtF1w
         UKJHf6hQadVM/XDKfzOxmC7pNL7H7L2cLIgyOAG3WwaEkWSpfbzD2JoSAWtHy6tWEb0M
         Fulw==
X-Gm-Message-State: AAQBX9fmvM7LJ/0LAvi3QP53TaEXLb9GQSxyIjdyDqUUdtrQvDrYgjbc
	U7z4ubkNF3SFlsezKjuOu7Y=
X-Google-Smtp-Source: AKy350Zhb8seJM1p6xL9hPA76B1b6gt2oZuXkKR09k+XlG3QkiYRvOdukNAY2H7Ug32Uuo+Eu2O8ZQ==
X-Received: by 2002:a17:903:41cf:b0:1a1:a800:96a7 with SMTP id u15-20020a17090341cf00b001a1a80096a7mr1388838ple.8.1679628847167;
        Thu, 23 Mar 2023 20:34:07 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b0019d1f42b00csm13014101plw.17.2023.03.23.20.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:34:06 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH V8 4/4] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
Date: Fri, 24 Mar 2023 11:33:42 +0800
Message-Id: <20230324033342.3177979-5-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230324033342.3177979-1-suagrfillet@gmail.com>
References: <20230324033342.3177979-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_203408_870615_63F8A94D 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

select HAVE_SAMPLE_FTRACE_DIRECT and HAVE_SAMPLE_FTRACE_DIRECT_MULTI
for ARCH_RV64I in arch/riscv/Kconfig. And add riscv asm code for
the ftrace-direct*.c files in samples/ftrace/.

Link: https://lore.kernel.org/linux-riscv/c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com/T/#ma13012560331c66b051b580b3ab4a04ba44455ec
Tested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                          |  2 ++
 samples/ftrace/ftrace-direct-modify.c       | 33 +++++++++++++++++
 samples/ftrace/ftrace-direct-multi-modify.c | 39 +++++++++++++++++++++
 samples/ftrace/ftrace-direct-multi.c        | 23 ++++++++++++
 samples/ftrace/ftrace-direct-too.c          | 26 ++++++++++++++
 samples/ftrace/ftrace-direct.c              | 22 ++++++++++++
 6 files changed, 145 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 17052b2dc83c..5b35496ac644 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,8 @@ config RISCV
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_SAMPLE_FTRACE_DIRECT
+	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index d93abbcb1f4c..32f973e7bab1 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -22,6 +22,39 @@ extern void my_tramp2(void *);
 
 static unsigned long my_ip = (unsigned long)schedule;
 
+#ifdef CONFIG_RISCV
+
+asm ("	.pushsection    .text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+"	addi sp,sp,-16\n"
+"	sd   t0,0(sp)\n"
+"	sd   ra,8(sp)\n"
+"	call my_direct_func1\n"
+"	ld   t0,0(sp)\n"
+"	ld   ra,8(sp)\n"
+"	addi sp,sp,16\n"
+"	jr t0\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+"	addi sp,sp,-16\n"
+"	sd   t0,0(sp)\n"
+"	sd   ra,8(sp)\n"
+"	call my_direct_func2\n"
+"	ld   t0,0(sp)\n"
+"	ld   ra,8(sp)\n"
+"	addi sp,sp,16\n"
+"	jr t0\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_RISCV */
+
 #ifdef CONFIG_X86_64
 
 #include <asm/ibt.h>
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index b58c594efb51..045a4af041ce 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -20,6 +20,45 @@ void my_direct_func2(unsigned long ip)
 extern void my_tramp1(void *);
 extern void my_tramp2(void *);
 
+#ifdef CONFIG_RISCV
+
+asm ("	.pushsection    .text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+"       addi sp,sp,-24\n"
+"       sd   a0,0(sp)\n"
+"       sd   t0,8(sp)\n"
+"       sd   ra,16(sp)\n"
+"       mv   a0,t0\n"
+"       call my_direct_func1\n"
+"       ld   a0,0(sp)\n"
+"       ld   t0,8(sp)\n"
+"       ld   ra,16(sp)\n"
+"       addi sp,sp,24\n"
+"	jr t0\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+"       addi sp,sp,-24\n"
+"       sd   a0,0(sp)\n"
+"       sd   t0,8(sp)\n"
+"       sd   ra,16(sp)\n"
+"       mv   a0,t0\n"
+"       call my_direct_func2\n"
+"       ld   a0,0(sp)\n"
+"       ld   t0,8(sp)\n"
+"       ld   ra,16(sp)\n"
+"       addi sp,sp,24\n"
+"	jr t0\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_RISCV */
+
 #ifdef CONFIG_X86_64
 
 #include <asm/ibt.h>
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index c27cf130c319..918cf325d3a3 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -15,6 +15,29 @@ void my_direct_func(unsigned long ip)
 
 extern void my_tramp(void *);
 
+#ifdef CONFIG_RISCV
+
+asm ("       .pushsection    .text, \"ax\", @progbits\n"
+"       .type           my_tramp, @function\n"
+"       .globl          my_tramp\n"
+"   my_tramp:\n"
+"       addi sp,sp,-24\n"
+"       sd   a0,0(sp)\n"
+"       sd   t0,8(sp)\n"
+"       sd   ra,16(sp)\n"
+"       mv   a0,t0\n"
+"       call my_direct_func\n"
+"       ld   a0,0(sp)\n"
+"       ld   t0,8(sp)\n"
+"       ld   ra,16(sp)\n"
+"       addi sp,sp,24\n"
+"       jr t0\n"
+"       .size           my_tramp, .-my_tramp\n"
+"       .popsection\n"
+);
+
+#endif /* CONFIG_RISCV */
+
 #ifdef CONFIG_X86_64
 
 #include <asm/ibt.h>
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index 8139dce2a31c..5a552b710d8c 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -17,6 +17,32 @@ void my_direct_func(struct vm_area_struct *vma,
 
 extern void my_tramp(void *);
 
+#ifdef CONFIG_RISCV
+
+asm ("       .pushsection    .text, \"ax\", @progbits\n"
+"       .type           my_tramp, @function\n"
+"       .globl          my_tramp\n"
+"   my_tramp:\n"
+"       addi sp,sp,-40\n"
+"       sd   a0,0(sp)\n"
+"       sd   a1,8(sp)\n"
+"       sd   a2,16(sp)\n"
+"       sd   t0,24(sp)\n"
+"       sd   ra,32(sp)\n"
+"       call my_direct_func\n"
+"       ld   a0,0(sp)\n"
+"       ld   a1,8(sp)\n"
+"       ld   a2,16(sp)\n"
+"       ld   t0,24(sp)\n"
+"       ld   ra,32(sp)\n"
+"       addi sp,sp,40\n"
+"       jr t0\n"
+"       .size           my_tramp, .-my_tramp\n"
+"       .popsection\n"
+);
+
+#endif /* CONFIG_RISCV */
+
 #ifdef CONFIG_X86_64
 
 #include <asm/ibt.h>
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 1d3d307ca33d..33e7bde013aa 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -14,6 +14,28 @@ void my_direct_func(struct task_struct *p)
 
 extern void my_tramp(void *);
 
+#ifdef CONFIG_RISCV
+
+asm ("       .pushsection    .text, \"ax\", @progbits\n"
+"       .type           my_tramp, @function\n"
+"       .globl          my_tramp\n"
+"   my_tramp:\n"
+"       addi sp,sp,-24\n"
+"       sd   a0,0(sp)\n"
+"       sd   t0,8(sp)\n"
+"       sd   ra,16(sp)\n"
+"       call my_direct_func\n"
+"       ld   a0,0(sp)\n"
+"       ld   t0,8(sp)\n"
+"       ld   ra,16(sp)\n"
+"       addi sp,sp,24\n"
+"       jr t0\n"
+"       .size           my_tramp, .-my_tramp\n"
+"       .popsection\n"
+);
+
+#endif /* CONFIG_RISCV */
+
 #ifdef CONFIG_X86_64
 
 #include <asm/ibt.h>
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
