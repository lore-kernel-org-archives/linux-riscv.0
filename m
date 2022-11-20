Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1B5C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhVBwkKVsjWBZa2G6HYaYMDalZws+wEcBBU1hN91xJM=; b=zUGwuyWSS3ji+a
	7SN5DbC+0pgAMwq7Hc1DTGdsH2a5n4aWwbtmLq9qBEvPXEJQ8Hb4A7YDa0VZxgAdc/lcrEhcBLTSJ
	Bsrj0UgqvnFJHYkQy4RWYZnLU2VBJjXuVnH8cKYJFlhdRmfnpzcX3qV4TCOYv/hA8BSF0492zlmvG
	tVZ+W/PQyPMjY6DwrzGIMb6tBkYhUjQzcZG8AZc7pF4waKoGQcIBks8aVobZtWP2gUSa3C/IchT7j
	uZaoLuO2Gz2Zcm6pb7ehl37pDg+bTJOXjdna3n3rTTG2ZmQuhw8HZLWXxah+NxMpj/7dT80hZYx0j
	WcHEvvLB+Lmpm45BVNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfua-0035Ay-2q; Sun, 20 Nov 2022 08:42:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfuX-00358U-RQ
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:42:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id b29so8735643pfp.13
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um7o47dkwC3+Xw39j9lUuqY5O+T3nm01Mm5u8aYpugQ=;
        b=gZwm9U6mK3ALwu0oifabLOjV1RxAZrk0HSjZd6PCNBAM9P4WdR+dXylvSF6qvcEqgT
         D9kzlilet4yYsiLACIUkygpVjo9huz8Ow12yGFK/jcgPF6O/sDdtCWWNbJVd809fVL6x
         X+fDh2KVWZgLGP+qc9+Ybvk5H7BachFfwqsxpRz5bod4WIa3eK3EXUjylnwFNo/abn0s
         Zc+6WTgMbTeJ3+i9BW29KtYeIyUXTA9GKQgyDg1RYHte0dkPKWDimw74nJsbOfnPMTus
         67pZXkp5xtq2Zze25eQZm1zoQ7jqdOHope2gWc4Yn69zLpH4HP4BzKBpKRdMwQ5mgeCN
         /47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=um7o47dkwC3+Xw39j9lUuqY5O+T3nm01Mm5u8aYpugQ=;
        b=VyAQ33pt7jIX1/9lLZERA5F2PQ3S5QxWd9kGRnYyPrTXzBjrxuIMs7n4Pzutr3F7mP
         bC0Y+08jOccYuGZ0X/66eEbmHeS73oor+t4IlHsIfqznLaf3KQZxeny4o8EpjL32e4A5
         rKbjM1ktA2I9Wwacc20xgWUP+bwJT69sM4kE7Nc+bfD783SY+d6nNpOw02o5XPo8hlOd
         2wLG/5mUIPaC/SYQwfOvLX09no/JQ96/w5FIVEQPqnG8hH79gOpdF4rKSMINsXbxhD2v
         +BwdNEmo1Cn4dQu0fO2FIdqACLv/BBFu/SxCbejovklSsMRd64sY/7VdA+G76UQ41ILU
         ht8Q==
X-Gm-Message-State: ANoB5pkTWl6MaFaffw43gIFZrQl2V+swDHzeELKppdtYbHvI62JgkbC/
	9Ybp/otaOEqxFK7Pctqytbg=
X-Google-Smtp-Source: AA0mqf7UlFnYpp1QvFsITWQ1L0YhPDFpdvVHyeYal9N+quNB0CnpslxjtszIsIKD7xxHdpvpVE5RaA==
X-Received: by 2002:a05:6a00:1825:b0:56c:f16d:2f29 with SMTP id y37-20020a056a00182500b0056cf16d2f29mr15603764pfa.53.1668933762210;
        Sun, 20 Nov 2022 00:42:42 -0800 (PST)
Received: from localhost.localdomain ([122.192.14.194])
        by smtp.gmail.com with ESMTPSA id q40-20020a17090a17ab00b00212735c8898sm8188273pja.30.2022.11.20.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 00:42:41 -0800 (PST)
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
Subject: [PATCH v4 1/2] riscv/ftrace: add ftrace_graph_func
Date: Sun, 20 Nov 2022 16:42:29 +0800
Message-Id: <20221120084230.910152-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221120084230.910152-1-suagrfillet@gmail.com>
References: <20221120084230.910152-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_004245_906253_4099EF2E 
X-CRM114-Status: GOOD (  11.43  )
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
