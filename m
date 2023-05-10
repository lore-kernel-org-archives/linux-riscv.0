Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223DC77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUzk0QG7fWF2GTAR+T67IhIPbt5qwRY/Uhim5eK7F28=; b=rPrBY3CgdAfTFc
	gDt+brR0uvnxMwxxpZ2o9sJjPPrPBnN5oin5USpYUsUqBHh4miCD+wpv3Ui88epuLT7CBQP6utFwT
	aNpzfA7c46AIrNzoDnw6//wKfh3qagFcN556TEm4WIydV7IUPXbn/EYrxNxOLC7/jG86wFSeTfiNb
	fIBwW3dj2NM8qvMct6/reDXvusRGH2unynilDEVQhwupGJMzUQIml9dSVk2caL9sE0+lp8er64NLs
	38sc1S+xtS3DxdwIoeav8bT2ZJycIPrNStPtLoYOxSaTmRUpzJ4/fmfsZMiR91ncj6XLBNpxMz6tP
	/sW6s+Mrfuye2ZPxURcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgv4-005kLP-26;
	Wed, 10 May 2023 10:19:38 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgv1-005kJ4-34
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:19:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6439bbc93b6so4736290b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683713973; x=1686305973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N85teQqBhV1VEodsjY4znoRaG/yAfuSF6nM7iLcKOvw=;
        b=JBQ0T3lwKLhK0PsZBb1kYBcphNzpqyyl3v8068U4Z25lbu7323vNcfTbAT08d7SanU
         bIcbzIgLfJZAfqyswNxbuXkFGvvji93jpJPKad8THrO7Y8/yKBV+sN6MQNAqHUCmsK0E
         bNO02zLALN25h9l8gRv6obdQayaRZZ5ZdZlaNPrhBCB+t2kzo9TaJNzrKMV1ZNgE5KPV
         c3V8HbeSB3KldLQcjhTN1zty3I9nNAphJR9M6QAKpYnMaY1RDEPnpU9kCZHQkb+ezb7K
         4OOHTo++3s5vtGe9yVzy8qxpwdH/3c1bP/DOT2nykZbsZWtMhyupmlaQNOnPh2cyhwFg
         rv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713973; x=1686305973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N85teQqBhV1VEodsjY4znoRaG/yAfuSF6nM7iLcKOvw=;
        b=DlCIKjJDRuAgGdA5iTj/De8AY2kBumDJ3L7DYxVe7rATXNJB/RCLKsBEnsWBJeb1by
         Noiz455wki/hCZrA6ytVv+xS32Y3ieTnhOnPOI7MGmPI5fAFeZg/Co94L90Mqp53YCXF
         tjZf+WgLeEOQnR/c4E48LGHToDFivP1Q32oosld0lX/wPRbCDvau3TcTP6eXIA0d1Cez
         /hZl9pXSNfjXich4q7wqjW4IC4+MxEKqDGcQ9zXsL1Nxa92Yc/9mIIP0MfT5BZOOAH2R
         5GD2EuTByoh+hhWnxhphPdQ67TKCuKmL8YbSFVuwiGHBTpZZDDvjizejHSUiccKC2Vlm
         C8OQ==
X-Gm-Message-State: AC+VfDz1VTfCNqI9r0qo/THKBmQuUHIYV+J/LhxG4lvNemCVYD7DXmYg
	w9YK6KRUmbWblbHuoHhi5co=
X-Google-Smtp-Source: ACHHUZ7ouKicZ4wLt/MnsmnsBoVE14eP6rLtmejMscIL9AyW1mkG3ZDMWpeBQvuKcoKshQv78XBC3w==
X-Received: by 2002:a17:902:e752:b0:1ac:7072:cfc with SMTP id p18-20020a170902e75200b001ac70720cfcmr13862334plf.16.1683713972979;
        Wed, 10 May 2023 03:19:32 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001aadd0d7364sm3393419plf.83.2023.05.10.03.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:19:32 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	jszhang@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH V9 4/4] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
Date: Wed, 10 May 2023 18:18:57 +0800
Message-Id: <20230510101857.2953955-5-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230510101857.2953955-1-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_031935_986122_FC939A8D 
X-CRM114-Status: GOOD (  10.00  )
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
index fdf0b219a02c..cb94ef086f0c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -121,6 +121,8 @@ config RISCV
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_SAMPLE_FTRACE_DIRECT
+	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 06d889149012..b355e6994c5c 100644
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
index 62f6b681999e..6a4ee86d1f70 100644
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
index 5482cf616b43..e00a33b7d3c2 100644
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
index a05bc2cc2261..af0b90c4d6d5 100644
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
index 06879bbd3399..47977e262291 100644
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
