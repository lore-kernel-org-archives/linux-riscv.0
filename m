Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E8C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9S8xoPa2wMEpP/R47NGrj69RdHQjj4MoF6JhrSgKl5g=; b=JaOOLbm/VLW06P
	taRkbY9dG8nPhufDDkC73a136MAItom5cP1MHU7bfUIOIUDRQyaJvZk/i5RsduLiC2il74dd7m/aV
	2NJolzYe575H11hw7+M6EXs7FjfVCr8/or7LWgPKa4hnaIy9k2QxZXSvQmEnDIth3lXu5D56dmne3
	bBohlAoo6fN7UvYc/2bp7xhi1r6rYPW9rW29f6msRzgoQan7p0d9BRz93FbfV/2b/QPA99I++WLO7
	7Lv1m4tb7siGRLlnqJ6ZelQ5Ficdiq1Xe0GeQZQXgPMOTlcC9RPyQTL96FWktrXJEmFgDoFmRPNmS
	bVkj+JF7qcBrhuZK6lqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQre-00D9q1-Gu; Mon, 13 Feb 2023 04:54:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrB-00D9U2-5v
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id b5so12304509plz.5
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyKgXXAf6eIxCQNqJDUpc+Bj2CrwyhmFgAHD2REeyJQ=;
        b=EXvhS/VncGgKvwJ3Q0vZAYHmSdbk7Ij5M1B09iI7kQPmHIhtYw0rjfb6raSugnp38T
         RmNzvD40b33QG81EShtF2MT2OnlPOZTgPjpHaiOK24MRNbT55VmbG0wr5uOlczteExqe
         7RyzXdUw1jdcb3u3wJdELeWUM43o7pNbFJcVOiNL1mEjeC1ZstyzXdFxHLminnErv+6t
         5Gh0QI8ML2GvM2ZfYK5uGt1BPhOYeh2whz4oZIvrTreSdNvkkyj2I+Y//kj6Jiov3w3K
         Jk+yFBa6l72SXXXD2fakph5Hh2wqGj5Gb42T4I9/9BIeNQHqONbq+9UgRdavksLsUOeW
         yE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyKgXXAf6eIxCQNqJDUpc+Bj2CrwyhmFgAHD2REeyJQ=;
        b=M/FF7jLe3Vwx4ny1kLdLYX7BRAW8bm4AC3B3spfkTaPixtVgE9RYXBqV7rUV3mTCQJ
         GOFr3SDbznBK6yozLHxmDCXxDkBprwW59pZVskLxkLz2DKkB8yd+c1cLoGN6BtDvjPOX
         waXlpz4Fgea/pYnR6NXJbKBvHhihOXTJzlwZeJLFBA5fdmh7mYkZcxhGZctQFigNm7Tj
         BS977brrBOaNuW5+EaAjTxP957zucGqvGayOIgFCqSjfNx6ArxSOtsF7yJZJtt1EOHvo
         J3xId6Auqz4HLa7NCctJ+EaeOEL+durUps5yFgnVBN09IkrnbjUfbn29QwvPwAahQviv
         LPjw==
X-Gm-Message-State: AO0yUKXC0Qd1r1VZdUXvJE+GunjpbPDMbGR7itYLTtOM7l0nACwKp5ER
	17Na/A+j7pmuavTBWvfq2N6Ew8IY8phOqSyn
X-Google-Smtp-Source: AK7set+NkvkqLLx1ODFEJuYixtO6pgsq1Kd5F2Cn+dnuIzgerTzZYBASHAeY5bJ7M/OE6P4BYW1Gjw==
X-Received: by 2002:a17:903:1c2:b0:199:1d6f:3cab with SMTP id e2-20020a17090301c200b001991d6f3cabmr28540571plh.21.1676264064208;
        Sun, 12 Feb 2023 20:54:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:23 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl for shadow stack and landing pad instr
Date: Sun, 12 Feb 2023 20:53:44 -0800
Message-Id: <20230213045351.3945824-16-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205425_780604_20AD6090 
X-CRM114-Status: GOOD (  11.27  )
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

Three architectures (x86, aarch64, riscv) have announced support for
shadow stack and enforcing requirement of landing pad instructions on
indirect call/jmp. This patch adds arch-agnostic prtcl support to enable
/disable/get/set status of shadow stack and forward control (landing pad)
flow cfi statuses.

New prctls are
      - PR_GET_SHADOW_STACK_STATUS, PR_SET_SHADOW_STACK_STATUS
      - PR_GET_INDIRECT_BR_LP_STATUS, PR_SET_INDIRECT_BR_LP_STATUS

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/uapi/linux/prctl.h | 26 +++++++++++++++++++++++++
 kernel/sys.c               | 40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index a5e06dcbba13..0f401cb2d6d1 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -284,4 +284,30 @@ struct prctl_mm_map {
 #define PR_SET_VMA		0x53564d41
 # define PR_SET_VMA_ANON_NAME		0
 
+/*
+ * get shadow stack status for current thread. Assumes shadow stack is min 4 byte aligned.
+ * Note shadow stack can be 8 byte aligned on 64bit.
+ * Lower 2 bits can give status of locked and enabled/disabled.
+ * size and address range can be obtained via /proc/maps. get_shadow_stack_status will
+ * return base of shadow stack.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      65
+/*
+ * set shadow stack status for current thread (including enabling, disabling or locking)
+ * note that it will only set the status and setup of the shadow stack. Allocating shadow
+ * stack should be done separately using mmap.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      66
+# define PR_SHADOW_STACK_LOCK           (1UL << 0)
+# define PR_SHADOW_STACK_ENABLE         (1UL << 1)
+
+/* get status of requirement of a landing pad instruction for current thread */
+#define PR_GET_INDIRECT_BR_LP_STATUS    67
+/*
+ * set status of requirement of a landing pad instruction for current thread
+ * (including enabling, disabling or locking)
+ */
+#define PR_SET_INDIRECT_BR_LP_STATUS    68
+# define PR_INDIRECT_BR_LP_LOCK         (1UL << 0)
+# define PR_INDIRECT_BR_LP_ENABLE       (1UL << 1)
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 88b31f096fb2..da8c65d474df 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2284,6 +2284,26 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2628,6 +2648,26 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_SET_VMA:
 		error = prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
+	case PR_GET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_GET_INDIRECT_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_INDIRECT_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
