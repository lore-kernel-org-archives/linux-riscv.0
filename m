Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06398C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:14:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694906112D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694906112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68Tvl2K7kzonIF2D58qioWSgAPQWrVqr0sWFIqO4lG4=; b=frqSgUfR6+X7RNdHjWCug6I3qA
	bo/cLo23Cs83yr+ZakCanlPSnCnOcSTUWetEktj6Tgvh2wma1y5XvujuHE5k9lZIkwOHFUYm+cDiH
	VUP2qAfaBcuOOA05+C6XEHBhNPyWlJiz1rj331ImjLnRhvca7k5HRtBFPJrd0on+b+4WxHLw9jR6t
	+QEegw3o+kNrKGcIW1khJCTsD7Gf48+K15kQaKHFeG5IlOCaZ51XVE7siqWFaUy2xcHbD9uIifA/g
	ClQEH76T2YIzC+dMiPEyrkmX3VrNkGqLIKyrV7ojUbqZIzojQI98FZty2mCSDYoNwbWlmLhA46Hoh
	O426rwNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXHA-003KIJ-Ns; Thu, 06 May 2021 06:14:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXH6-003KHU-CD
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 06:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=gbqKHbpw3h7WUhKtmIh7lCwa6u4+vakPW0cMHwa4RI8=; b=ujt/ROFF36/8DsXFZBuF2KdODD
 N/Umm1Fip+5YnBJ299pMQJSUscpD3j3O4zU7bDMFhr2uUxUQnYEEoYLit2BgiSZTNfP99lNvKd0ym
 mBOGiL7LaG1qXHFQPz+aN8lTzvDYpmpp1UXvoMHCppZWf2FKjuiQebyifJSdsKBf1Wh6tvT2ohJAk
 9F9rnFtUbFxeuZsmp1ece5UioTcfJAlVmWrjGOaBipCbX2O9Q8qF6ebuE1N0DOoqrjwA7Uoh4q3Co
 XnXXkbuQzlm5bGxUUaqJNwcjGevfmgf7lGFSWCyF53KirlKNQiUSKfCkiXwBI/OX2o7ie14NZ/Pgd
 FMIGBAwQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXH3-005d1Z-PM
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 06:14:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id a11so2850300plh.3
 for <linux-riscv@lists.infradead.org>; Wed, 05 May 2021 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=gbqKHbpw3h7WUhKtmIh7lCwa6u4+vakPW0cMHwa4RI8=;
 b=VPC151BBtxxibLaIYwadUQHHv9kP3BRFJntrcijQG36lrC4+n2fJEEiN0WZL8fHeLL
 qnJrdxCrrMVWZpcD8TTFqZMuW2J2fHZ5DQO4K4fTb1vncxzuzRtXtjbBgW0Hdc4RYvOl
 tcQxTLLQf8NAlUStclchV+Z0JMe39cYhZBk7RRNMONrTM5SNomC2HwW4HD8/Fe9fna3Q
 jFLCGI5FblwF8cvy8zBVnQDwMCE0PFx7HvZ3+SL1NcYY/V4zylE+yof9t0sXXBtwmOFH
 p83+wQzkWKHw3Rr7683gEL+H/neVnfY8PdYDQlnVlrdPgUVkJPduNQmHyRgHjaXNjxNQ
 3iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=gbqKHbpw3h7WUhKtmIh7lCwa6u4+vakPW0cMHwa4RI8=;
 b=acA1nRP/BHXFpL5Wf17uZBRdRk8ELRp/TUPB7SvG6HKh+u0iwveioci7RQw6ba+a2V
 sFXZIb8Xzt7lWZySasJdaLOsI8N9MduvvHK9p+OvmrqVAj2aFAAckZjv9Auo7EUisrqP
 1JzP8eKue+wu4x+jslgCgWgDcNxK00pja1nU9xxzd1WUNgt8vIBDlXXN4dcNMMepAi9c
 h7EU/Ed2kP+zEIvNlKZHbLdBZnmxXmpukipU3YF/0K9R4cBmm825lZdG9rJBA/3GisiB
 s3TQev8JsY/XlP/7uDhHkcoz0OvWpbSS6rC0hoglHqohID0nkIOjjyHS1q+QamM7f9uG
 YZkA==
X-Gm-Message-State: AOAM533IAfF7DNNQUJI/9B9EQwJjgjrazKy0CRfAblcfJ9kroJFHiV03
 nrGkwYDA7iSki+4j9wSk8aLYJkk2GC437g==
X-Google-Smtp-Source: ABdhPJxUmkdKiQuialVQnku6YJhKcopVsDfowlrQeD/XhJedrfgASyW7+jgshIt8whTmZwmfLLrpTw==
X-Received: by 2002:a17:902:4:b029:ee:8f40:ecbf with SMTP id
 4-20020a1709020004b02900ee8f40ecbfmr2974172pla.28.1620281652240; 
 Wed, 05 May 2021 23:14:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 79sm1030558pfz.202.2021.05.05.23.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:14:11 -0700 (PDT)
Subject: [PATCH] RISC-V: Protect reads from other harts stack frames
Date: Wed,  5 May 2021 23:13:52 -0700
Message-Id: <20210506061352.340752-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, wangkefeng.wang@huawei.com, akpm@linux-foundation.org,
 0x7f454c46@gmail.com, 
 rostedt@goodmis.org, chenhuang5@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 syzbot+0806291048161061627c@syzkaller.appspotmail.com,
 Dmitry Vyukov <dvyukov@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_231413_844933_7CDA09D7 
X-CRM114-Status: GOOD (  16.70  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

The stack walking code wasn't correctly decorated with READ_ONCE_NOCHECK
when reading from other harts stack frames, which can trigger a kasan
failure.  This may also manifest as a bug, as without the READ_ONCE we
may get inconsistent results.

Reported-by: syzbot+0806291048161061627c@syzkaller.appspotmail.com
Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

---

I don't actually have a test for stack walking aside from just crashing
the kernel and making sure things look roughly OK.  I haven't gotten
around to that because this got lost in the merge window shuffle, but I
thought I'd send this out in case someone has a better test for stack
walking so I can start running that.
---
 arch/riscv/kernel/stacktrace.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 3f893c9d9d85..7f3914756915 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -18,6 +18,9 @@ register const unsigned long sp_in_global __asm__("sp");
 
 #ifdef CONFIG_FRAME_POINTER
 
+#define READ_FRAME(frame, off)	\
+	(READ_ONCE_NOCHECK(*(unsigned long *)(frame + offsetof(struct stackframe, off))))
+
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
@@ -40,7 +43,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 
 	for (;;) {
 		unsigned long low, high;
-		struct stackframe *frame;
+		unsigned long frame;
 
 		if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
 			break;
@@ -51,14 +54,14 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		if (unlikely(fp < low || fp > high || fp & 0x7))
 			break;
 		/* Unwind stack frame */
-		frame = (struct stackframe *)fp - 1;
+		frame = fp - sizeof(struct stackframe);
 		sp = fp;
-		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
-			fp = frame->ra;
+		if (regs && (regs->epc == pc) && (READ_FRAME(frame, fp) & 0x7)) {
+			fp = READ_FRAME(frame, ra);
 			pc = regs->ra;
 		} else {
-			fp = frame->fp;
-			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
+			fp = READ_FRAME(frame, fp);
+			pc = ftrace_graph_ret_addr(current, NULL, READ_FRAME(frame, ra),
 						   (unsigned long *)(fp - 8));
 		}
 
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
