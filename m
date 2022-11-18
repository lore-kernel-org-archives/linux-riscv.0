Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8C5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhVBwkKVsjWBZa2G6HYaYMDalZws+wEcBBU1hN91xJM=; b=TpxbHfbzpEPXMV
	+k0bJ/sqK/LovHJkjeNNhPRlk3G45rhkk0aVSDJze/I2SjV/xaOs4yJYZqqwn6/cRnV8UvLThEw+w
	IB0+Kq5Gl5q4KDrK6kqCo+r9TK5khP+lhu6ji0cPU7uFcZhETcWIWfbwua0Wm/vIH/C/MS64TnbH9
	0L1iiMnqzvdd8CnFhsxMiD/3V3ngQXyYiJ0sONFavPphnF8aMlCiAoP9Ntf2OEgCXaJboHhB6n1/7
	Q593scKbcPMvS3oU+2cB73FRL2L2GM9uTX3puf26yGFnC3oWMc1R5MnxPLp0Mm44NLW7Jk3hCv2CB
	ZmJuZtQZccyzisOeclpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EL-005rFd-9S; Fri, 18 Nov 2022 17:32:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EF-005r8R-30
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:32:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso5686324pjc.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um7o47dkwC3+Xw39j9lUuqY5O+T3nm01Mm5u8aYpugQ=;
        b=bKlIx655pe3B+kU4aGQHe83PsarqTSNkJgq+XRCvic+rix3rZvypD7FAQbl8gYsUDD
         2dqZGBtB6qVDypNdijaMpfpWr6w3V1lCNGGYMbnLbA65mBemShhEZCqNslu6hoBVgH9y
         WXM4UVDYWXnn3+7o46j4i9UXJAAji3tVB8cuqQovq73rJGr0HNMVFD/aOkFvchMxaY0H
         ORKxWsayMeW6gda+HNYq5r/Y550hpY8CvB/o/OoYOEvDY1AvF++rH0nH1tAsrxmIHGF9
         uCTu9N9MGMeS0NwwteNRRl39+9BlK7I56LV/O1p4hh2+cWTNLA0GDcKkrGvXwDpZaMBJ
         hMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=um7o47dkwC3+Xw39j9lUuqY5O+T3nm01Mm5u8aYpugQ=;
        b=4fRKx3qfhjO/iendEe8nbaXaQFZnrwjNGmb6YQBAtbUZO2kZqe//pqca/Vp8AW4w28
         AwuYzeV5u8QMECTxDkKKWcI3nPhlwr+t6eSBS+NAGQh8MK8z8NTNgdSVjV//d1mPhTKG
         mxSqqZ5al/120ZXLQiNLYpHOsVPU8RFxDLbMgZM2bGhytzOvfLFN/7DfFecWtHTk9sLy
         00AuHLdrHng+LxrXO6dBsk1rfYlnq7XaUs5HVdq0SEukA7a5nNbWGihj/TlkUYl3WdcG
         IjyX+4xifKCYt6tP8TE3pxLyXjKQD7MDMdH+jPVPW58jdFEYAtgWQyXPZY+w35iSbh4j
         UonQ==
X-Gm-Message-State: ANoB5pms5CLI73LCNov7b+rwUE64F7hbko1WyRXynLDkXrdHBVvCZeZO
	A337XNOGWzM9y4TBVM7krrI=
X-Google-Smtp-Source: AA0mqf58OB6QcS+3YK1TMkO/KdVKNF6E9CzOlYkfERJcrBVIDQJ6MLk3ufE/xMOPiz3L5aZbV96Y7w==
X-Received: by 2002:a17:90b:3d90:b0:212:de1c:a007 with SMTP id pq16-20020a17090b3d9000b00212de1ca007mr15291940pjb.30.1668792752983;
        Fri, 18 Nov 2022 09:32:32 -0800 (PST)
Received: from localhost.localdomain ([112.2.231.196])
        by smtp.gmail.com with ESMTPSA id u7-20020a656707000000b00476b6b7f339sm3037979pgf.11.2022.11.18.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:32:32 -0800 (PST)
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
Subject: [PATCH v3 1/2] riscv/ftrace: add ftrace_graph_func
Date: Sat, 19 Nov 2022 01:32:16 +0800
Message-Id: <20221118173217.888077-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221118173217.888077-1-suagrfillet@gmail.com>
References: <20221118173217.888077-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_093239_161090_6E5CF1E7 
X-CRM114-Status: GOOD (  11.85  )
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
ftrace_graph_[regs]_call are revised for serving only ftrace_graph_call
in the !FTRACE_WITH_REGS version ftrace_caller.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/include/asm/ftrace.h | 13 +++++++++++--
 arch/riscv/kernel/ftrace.c      | 30 +++++++++++++-----------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 34b0b523865a..01bebb28eabe 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -107,8 +107,17 @@ do {									\
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
index 8c77f236fc71..651ce5808b77 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -169,32 +169,28 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs)
+{
+	struct pt_regs *regs = arch_ftrace_get_regs(fregs);
+	unsigned long *parent = (unsigned long *)&regs->ra;
+
+	prepare_ftrace_return(parent, ip, frame_pointer(regs));
+}
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 extern void ftrace_graph_call(void);
-extern void ftrace_graph_regs_call(void);
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true, true);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, true, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false, true);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, false, true);
 }
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
