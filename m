Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D88C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 03:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftZ3RPyaEWGPTC5/KnB9tF+a8wUmyR0wC3HYE9oTvSY=; b=UOn5b2Dqrwa9gf
	v2SzFIgxExUFOT8aTaJog5CDCX99mjKegLZDxWpVCrT8NHInEQqvL84pr15F9ArymLoSXwP8OACyg
	4Z1hS2Pdf5/+2NqkqMFfSEQTq+J97rIT8cH+pvkJwA4AchPF7RQScHCS5hmN7hYnr7Eb5rwTd96Yo
	YzZfSNq/AupAd1tWvfXFkjmvXMfikYT6MiF7AGId2nNsNrSa2iVOFcjvjksCE46VhDSWDhNQpQRr6
	gFCLkFW5hBSas4YYPn0cB9I4mcKdDlrwy/Ge9QMycNmhMAR1aOP54Bn/xzBYL5UboxJTnGb5/PFWX
	8i4R2DsxVr4HHcnJL01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8ro-00GhQo-6d; Wed, 16 Nov 2022 03:13:36 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8rl-00GhPa-Ny
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 03:13:35 +0000
Received: by mail-pj1-x1032.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so1017279pjc.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 19:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfjBpdjhy3FRsarxq0mtTibVzLi0v1ap0dEoQSB+eCk=;
        b=HCmzSGbRAwS0Xz3K0YWpt5t1BGt5W3HFACyaOHbIgILZxabfSXhfkANFw6bM2qGYbD
         KT0gAgUO/ptx1Ede2o+OegsXqmyFeG6hMuBNz+iz5bir+2JjrfxSN+2o+JBGM2a0bLvH
         BYxMmfVtXGLOwByy0FY0WYjep6f2KcONrF0Y6SP0LJb11yt5u+CWezM7S4UkCQS9T1wu
         w9eytCB0ND+aNbyDEgLxjbTL8k7kUrGyS9cM8jW2OQcV6/PhXTcUTFFXPUwWiPAcyUSX
         L+leE4UYdnSSKzRlg1ofV+ass5fcCgE4kwe8JKRfhBSViurqpafvfi9En+qpZ4TJtsOa
         o5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfjBpdjhy3FRsarxq0mtTibVzLi0v1ap0dEoQSB+eCk=;
        b=fkW1wGapF9o39eA7T2aR/LswDOYNX8wFhIMWyo9s8TVXm8ImCecjqVdlK9PRPGambI
         asScjb/EL5MMprwnkEkKxDT1STx3UsLVzpGzjCL4HCZEqK2ovDVAFSVC/+dA+Z6CLOlZ
         1HY5LV8vIzAv7tzc3jHobmwYHR0oRoYBHCYbV8XIq6NwFQe91R12/zrWdzZvGgDeJVOf
         QExG6KXrXmPt/f3S0XBzHGXuzk9nd07gT1mf1jwsiw42I9qcv67QsA8S0m24Nnrn9f9T
         UYbk1LNZr2+TPLHJicbTWwlFgywTSuvVS5zSD/vtps5C+9aPUFl9ksvpJ/foQRwI6GNx
         QgWQ==
X-Gm-Message-State: ANoB5plByX8k1c5CVPbe3CegED5oA3sPlhOO5Of/oUl92sQWjJGRV+Ap
	9ATfQJ2kF60j9MeE136iUhc=
X-Google-Smtp-Source: AA0mqf6906E8vnIqvm3Ht/G0BwBICFFZTgDzXIhHEd3G6itTsjMGFeNoVLqdl6f5iKF7o8OuPFNjLA==
X-Received: by 2002:a17:902:b186:b0:185:4ec3:c708 with SMTP id s6-20020a170902b18600b001854ec3c708mr7046411plr.60.1668568410924;
        Tue, 15 Nov 2022 19:13:30 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id ml22-20020a17090b361600b0020b2082e0acsm348295pjb.0.2022.11.15.19.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 19:13:30 -0800 (PST)
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
Subject: [PATCH v2 1/3] riscv/ftrace: add ftrace_graph_func
Date: Wed, 16 Nov 2022 11:13:03 +0800
Message-Id: <20221116031305.286634-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221116031305.286634-1-suagrfillet@gmail.com>
References: <20221116031305.286634-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_191333_816416_F35F84DE 
X-CRM114-Status: GOOD (  12.16  )
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

Here implements ftrace_graph_func as the function graph tracing function
with FTRACE_WITH_REGS defined.

function_graph_func gets the point of the parent IP and the frame pointer
from fregs and call prepare_ftrace_return for function graph tracing.

If FTRACE_WITH_REGS isn't defined, the enable/disable helpers of
ftrace_graph_[regs]_call remain for serving the !FTRACE_WITH_REGS
version ftrace_caller.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/include/asm/ftrace.h | 13 +++++++++++--
 arch/riscv/kernel/ftrace.c      | 16 ++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..61a8f4be67eb 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -81,8 +81,17 @@ do {									\
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
-#endif
 
-#endif
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+struct ftrace_ops;
+struct ftrace_regs;
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs);
+#define ftrace_graph_func ftrace_graph_func
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_DYNAMIC_FTRACE */
 
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..148a5480076b 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -196,6 +196,20 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs)
+{
+	struct pt_regs *regs = arch_ftrace_get_regs(fregs);
+	unsigned long *parent = (unsigned long *)&regs->ra;
+
+	prepare_ftrace_return(parent, ip, frame_pointer(regs));
+}
+
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
 extern void ftrace_graph_call(void);
 extern void ftrace_graph_regs_call(void);
 int ftrace_enable_ftrace_graph_caller(void)
@@ -223,5 +237,7 @@ int ftrace_disable_ftrace_graph_caller(void)
 	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
 				    (unsigned long)&prepare_ftrace_return, false);
 }
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
