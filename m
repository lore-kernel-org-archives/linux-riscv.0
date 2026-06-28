Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF4BC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=433hpgqops+snIIyFUaAE2mOQCwtThuVn8dVjPz5RhY=; b=OLkF/P/4w8Ad17
	6U64m75ey5UJTX8ZULOxEk8z3/pJV75EHU5x54KI3ok96IAWxiyIsnY3jnP6tB+jS+zSjOHRgH9d5
	DBg2ACI7zVXyh3r8BJd7yw5jOfsBPPLD7LZFb/BtH05izg4s/uKBgl2/0E0ZlzkpBdwyDRjsQUDgz
	+N7AFbA72CZrQ5RAAGT9l23hdPPHw2yro0t9w5Y8Lp7ucOwsPCMlPjst/8is/Eexxd+KvuH5Cg98P
	MtUpcZMZciejqvBi5EWislY8n43bQZJb8CrOowd6mNxBu6J66XVWuBDbGXLUNi8vLoeFkgmXhBfdP
	b36HKOClDAvoHKAh10KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkhs-0000000CyjF-3kBl;
	Sun, 28 Jun 2026 08:17:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkhq-0000000Cyih-1YAV
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 08:17:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c964d52321bso224481a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634653; x=1783239453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS2yJRct07pRe6n4SB8fXurYRNSLUTRVGluVVDIlUMc=;
        b=RQWMLle6qsz3OuklXYjpVT03Swr925OOK/4CxDxsNrvytuycwPtw88RBrJ00gtm+X5
         3/qsp9blsLwU/xtYg+IsHMytxAQfZUmnxhsxp/ioWj39pqSEkBZY5VZfcjACsF4iOZ8v
         8D/4sCgr+ULSZC26WPv6PcNJYa2i65QTGVfVPTZrISMYVdeT+9nDan/rAdQYCZILe1we
         LF8VZv3MbyZRbhiSAqkDjYJPaUHRFg1+SRytMfgLd0FiDYTl9FDIV5+3yucJdk02CMEf
         6CEKIVIW9q5JKOG+p31VquCQ12AqRuaiINd/wf5CI9uL1HaC2yAqAoYU6qDZOnxwMfkB
         TVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634653; x=1783239453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fS2yJRct07pRe6n4SB8fXurYRNSLUTRVGluVVDIlUMc=;
        b=p7Z98Va+falGUPjNMJilQ6R6sP3QuzE3RU/A14QbyW88Nb8QXxdMw8lvPLaOKoIQh4
         T+mwF6xh8SfPaDgVDOyYEbm2wNn09rl0WSS1TNw6cJjn3ArYaEfXY0RXLFajLweNVdxb
         sXsvdzElXltqlb+24YEWrQ5AsS1C9h4y5kBtxqQslsPNA+Qkx/RAhhO3TcYgZ4WBKvNq
         G6K4ewDKAPdwy6sA7VgsFMpun4xxQ4kGZIIjMTy/tQyawORJ0pYc2houZOS5zi+KNltr
         iU8MqnNEoIo2JvmNJGvivWFXD1SQ7GHxEgoIsi5vqh19gsH6KJeTZkhmb60YEFYFMGCj
         Un2A==
X-Forwarded-Encrypted: i=1; AFNElJ8uA4kXV3xYCxUEzLDHpiafJbKAcBhx43JRBK6UeapTCJWPP0vCKaiFIrlPHanhomk4+WyQOCV4oeOlAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfQzgI3Pi1P3L7NjodnnvMPGthSvL/1TciJrNvD44s/88al/cZ
	7f5mofGCc1x+QqGk0HLBRnq5cxwHQvyrhvj/Z1HdKOtc+2vUizgThYf7
X-Gm-Gg: AfdE7ckH142F3d4jILEvZzyOX3qmYyb4X67ebO3O1l0JibgATFv76eeII1GwOUSCZ+B
	D7yoBHFnO+sGTnj8Qgb3DTZvQPU8I2a73qo/tkI2al9uA8Ea0UTCHNUVOQ1BFQTIvs/sT2dtmZu
	Be+tHv2JIaEK9MuTzSgdRr99sKibNxIZih7DtTY6ZUJJawZv3StHAwGbE2yFFvHVRX+YfdsqzOK
	emgcDuk62kpNEfzkWjAr9q0zEEpiLnkSoIHB/OQili/TpnvrhjHOnMdW/aVj+LxRooQ38bBmuIP
	pmDchfbOZLtjfcQBgKc6UCHVuIBdMedQuvHxdzkYqROj2tn0GWmn7vssOHxqC3V40f3lbyPqnnp
	MClxeO3weqYl5lwT2/1rEz7Iv8WNnG5ScaT3qPWU5TB6YZEs7Er1Takbz5SJ8PUt6FDYDHdHr2e
	kXQkAP91qYhDwJxZSd8jIvtdsctv9IJEWnwkT3k5UXhZ9/+3PBul6x6rA=
X-Received: by 2002:a05:6a20:7289:b0:3bf:82b4:4b47 with SMTP id adf61e73a8af0-3bf82b44e32mr2761238637.18.1782634653395;
        Sun, 28 Jun 2026 01:17:33 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:33 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 1/3] riscv: stacktrace: Implement arch_bpf_stack_walk() for BPF
Date: Sun, 28 Jun 2026 13:47:08 +0530
Message-ID: <20260628081710.113333-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081710.113333-1-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_011734_414212_30441B9A 
X-CRM114-Status: GOOD (  13.47  )
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

This will be used by bpf_throw() to unwind till the program marked as
exception boundary and run the callback with the stack of the main
program.
This is required for supporting BPF exceptions on RISC-V.
This depends on the frame pointer unwinder, so it is only built under
CONFIG_FRAME_POINTER, else falls back to the weak no-op.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/kernel/stacktrace.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..64929381bb30 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/filter.h>
 #include <linux/kallsyms.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -102,6 +103,36 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+				 void *cookie)
+{
+	unsigned long fp, sp, pc;
+	int graph_idx = 0;
+
+	fp = (unsigned long)__builtin_frame_address(0);
+	sp = current_stack_pointer;
+	pc = (unsigned long)arch_bpf_stack_walk;
+
+	for (;;) {
+		struct stackframe *frame;
+
+		if (unlikely(!__kernel_text_address(pc)))
+			break;
+		/* pc belongs to the function whose frame pointer is fp */
+		if (!consume_fn(cookie, pc, sp, fp))
+			break;
+		if (unlikely(!fp_is_valid(fp, sp)))
+			break;
+
+		frame = (struct stackframe *)fp - 1;
+		sp = fp;
+		fp = READ_ONCE_TASK_STACK(current, frame->fp);
+		pc = READ_ONCE_TASK_STACK(current, frame->ra);
+		pc = ftrace_graph_ret_addr(current, &graph_idx, pc,
+					   &frame->ra);
+	}
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
