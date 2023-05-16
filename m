Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE5BC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XVqDWN2pvPmrN7BwuQTmYprVTIM2EE50egnk8/IsqU=; b=Aa2fTrZcU0mtes
	JlbaUA1WM2pGlnu/fKyb3fxyuBJYqOrQtbxmIVRl1ofDfMBWGmYv2XmLMWPAtdhpqNSZZ6ntC8p+j
	rBzgvOCJnoLEQX9sUE0gsi30rmWPpEax8rXPa5dKeqMTTFM/pkzrrbmsnm+BGIXnWnLkp34kYnG0k
	kam1k1NbUQ2lsYabLzKJ/28gkgkDpmFm1+qNYqYQhfOPo8diOHMPDXEAoB3rOS4e1MpMsHu0QbXMI
	hXQHIuf9JnBtn2KyVIBBWe6VJoI0UjT0dJdq2BVPxXGfRoU+829jspUFGaDsbtNBSnfAHPWVAHyvK
	DR6UfCbKrcx3hY6wOurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxu-004cvB-2R;
	Tue, 16 May 2023 07:19:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxr-004csz-2k
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:19:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-643846c006fso14520629b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221553; x=1686813553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr5NPUEwkf/u+a01SSpONco/9bXEcFxv1oXkCOl3FZE=;
        b=EETW6bHqHomRMsgD7YwoEi5wGWOvuvUQPS5Ju99GCoG1L2KVXB02G3RhY7foR5wcxT
         9qk2729vqdHUBs/pd2pWIDxJQ41HkdsgjKd/SkBEF3N5nQkqWYHNMhL/Acajd5GJBRGN
         Ghq0SqII6TJVkjpQH3NQOcHU8INAKaI6o0N7NPDp3ItBsuJOavR8tQtyLVyQpkYcovQe
         YZuH5S/jLE9FPzRN5NQwbaHKMJ8KfENjGGKqF9yZk5RxPhjFfZRxnu+CRh4xIA450mDK
         yx3mN/9CHAvrI7fY45zdVHWZcsvNx7rGyQiP7NBrqlFlf8g/w5bATrXflh9PrNZ6n4cy
         NdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221553; x=1686813553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jr5NPUEwkf/u+a01SSpONco/9bXEcFxv1oXkCOl3FZE=;
        b=c82KDx8E3GzLapvpxCaQe8R3YGkXASjAFex1K4j+7702kjxplzlmsf3J3jFWz7Vi3m
         5mxqSXZGbY9xXihxr/utM2ACjKDC6S39ub+a5bed4Yvl3PmOCQb7/2Q8ZcCsObDpChzp
         3GqWO5ZAgCxcF/dAuD1SLBnJFHjiNmChDb5yRxLO5r6mgr/A7y8wwKxwnJ/r8+LhVBv/
         L+MWSDH5ziW2y1IJmHUR3e8vqQ4DJnSjEUpps2VsrApLuH8TKva4fwTgopglQK71Y4/1
         Dq0D4LBigZZ3pRMspeWU2NnOYPe7tRlaEHwW+i1EtlOuhNwwQTShw2CNiULKNRnERje5
         IKLw==
X-Gm-Message-State: AC+VfDzhfcyWMmZ1FYk3PwH7m0QD12BOmIwsAdxgP1//5/Mc54WIWz8d
	NB7iNid11LiSRpSRt66ft7Q=
X-Google-Smtp-Source: ACHHUZ4Dc8GN0ScaYumqglWnIGdVbNPTRaxTAFIL1qdwTFP4Pvli4wXAG4X9k3dkvEhAaUizWxQ2eQ==
X-Received: by 2002:a05:6a21:6da3:b0:101:438d:2567 with SMTP id wl35-20020a056a216da300b00101438d2567mr31331268pzb.31.1684221553498;
        Tue, 16 May 2023 00:19:13 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.15])
        by smtp.googlemail.com with ESMTPSA id 17-20020aa79251000000b006468222af91sm12849830pfp.48.2023.05.16.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:19:13 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
Date: Tue, 16 May 2023 15:18:28 +0800
Message-Id: <20230516071830.8190-3-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516071830.8190-1-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001919_889908_09A37253 
X-CRM114-Status: GOOD (  17.35  )
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

Current implementation calls kprobe related functions before doing
ftrace recursion check in fprobe_kprobe_handler, which opens door
to kernel crash due to stack recursion if preempt_count_{add, sub}
is traceable.

Refactor the common part out of fprobe_kprobe_handler and fprobe_
handler and call ftrace recursion detection at the very beginning,
so that the whole fprobe_kprobe_handler is free from recursion.

Signed-off-by: Ze Gao <zegao@tencent.com>
---
 kernel/trace/fprobe.c | 59 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 9abb3905bc8e..097c740799ba 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -20,30 +20,22 @@ struct fprobe_rethook_node {
 	char data[];
 };
 
-static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
-			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
+static inline void __fprobe_handler(unsigned long ip, unsigned long
+		parent_ip, struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
 	struct fprobe_rethook_node *fpr;
 	struct rethook_node *rh = NULL;
 	struct fprobe *fp;
 	void *entry_data = NULL;
-	int bit, ret;
+	int ret;
 
 	fp = container_of(ops, struct fprobe, ops);
-	if (fprobe_disabled(fp))
-		return;
-
-	bit = ftrace_test_recursion_trylock(ip, parent_ip);
-	if (bit < 0) {
-		fp->nmissed++;
-		return;
-	}
 
 	if (fp->exit_handler) {
 		rh = rethook_try_get(fp->rethook);
 		if (!rh) {
 			fp->nmissed++;
-			goto out;
+			return;
 		}
 		fpr = container_of(rh, struct fprobe_rethook_node, node);
 		fpr->entry_ip = ip;
@@ -61,23 +53,60 @@ static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
 		else
 			rethook_hook(rh, ftrace_get_regs(fregs), true);
 	}
-out:
+}
+
+static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
+		struct ftrace_ops *ops, struct ftrace_regs *fregs)
+{
+	struct fprobe *fp;
+	int bit;
+
+	fp = container_of(ops, struct fprobe, ops);
+	if (fprobe_disabled(fp))
+		return;
+
+	/* recursion detection has to go before any traceable function and
+	 * all functions before this point should be marked as notrace
+	 */
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
+	if (bit < 0) {
+		fp->nmissed++;
+		return;
+	}
+	__fprobe_handler(ip, parent_ip, ops, fregs);
 	ftrace_test_recursion_unlock(bit);
+
 }
 NOKPROBE_SYMBOL(fprobe_handler);
 
 static void fprobe_kprobe_handler(unsigned long ip, unsigned long parent_ip,
 				  struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
-	struct fprobe *fp = container_of(ops, struct fprobe, ops);
+	struct fprobe *fp;
+	int bit;
+
+	fp = container_of(ops, struct fprobe, ops);
+	if (fprobe_disabled(fp))
+		return;
+
+	/* recursion detection has to go before any traceable function and
+	 * all functions called before this point should be marked as notrace
+	 */
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
+	if (bit < 0) {
+		fp->nmissed++;
+		return;
+	}
 
 	if (unlikely(kprobe_running())) {
 		fp->nmissed++;
 		return;
 	}
+
 	kprobe_busy_begin();
-	fprobe_handler(ip, parent_ip, ops, fregs);
+	__fprobe_handler(ip, parent_ip, ops, fregs);
 	kprobe_busy_end();
+	ftrace_test_recursion_unlock(bit);
 }
 
 static void fprobe_exit_handler(struct rethook_node *rh, void *data,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
