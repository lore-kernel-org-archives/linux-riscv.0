Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A30FC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 03:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xAJtqIDmTVA/ceKvNt4WP+wM9uFp7+iZvE2Ing3yW8=; b=fL9svMSL9kZ8GE
	Zq8NnIXypEMjCiBU1T7DJn9ZHWdcJAZn4vPkXnQmZtiL+AqolfvL6L1a6Wjkypnyo4t1mW2pTTpxy
	SseRThOi0BkmohJ8N2g5Z7K1X3pzXmlX+pfs8Z3CvNAV9uVTfiHe00Nn6/6jTZhHuBDf/VXE1R5T1
	e3zhcwA8/D3SnR1sQVPWCNWdzvHYfq034yQJg0rgWBGoxAF1rOkSr6+nEIlIMzYQ7v5LW+2GtH8uB
	YUVSW40cmwjFEKuuMAHIQI94UhOevlRdIl8WRMpDe+t8FAKM6Z6uR+7PbqNNuVfidzBtQJZBBOLsI
	WF8MvK/Vm/0RiKkhh/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrMq-005jya-5I; Tue, 29 Nov 2022 03:33:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrMm-005jvx-Ro
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 03:33:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52FAF61564;
	Tue, 29 Nov 2022 03:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1ECCC433C1;
	Tue, 29 Nov 2022 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669692783;
	bh=Rx1oBfcnRsUOmU2Ykw57vJhrHUEAojxg5V7zc9OjoGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itEXao5wpX4foEFAhnCNsAVeImFa/BW+uVylAclxgQaLAnrmgmhR9qZy/+LymJ17G
	 LbkGXZss1Vl9eY5FiIy7cS9C1mtctLKBL3pRjsnC1uCNWYiou7h4F+HuyJkJIi4xLA
	 CXHuaUQ55H/2WXTP03+ZHh0ZF24saNHu7ifsMeN1sQLCCiP8sMFVdJLCvQ/C44bTPW
	 QSsbJFPzzrsF9ZFmppfCHh0GGF3I3zf9C8s67MMFVR31zCG3qqQE92ToY/W7pvqJaQ
	 ygZAvAUxqQio85gBT1B0NCAxivluU+LOgjZ3LyPsyLYUEJ7CHIG96CH7iibyAqledQ
	 2VWI1Qxjniyeg==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com,
	mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V4 4/7] riscv: ftrace: Add ftrace_graph_func
Date: Mon, 28 Nov 2022 22:32:27 -0500
Message-Id: <20221129033230.255947-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221129033230.255947-1-guoren@kernel.org>
References: <20221129033230.255947-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_193305_015984_8F2A6397 
X-CRM114-Status: GOOD (  12.98  )
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

From: Song Shuai <suagrfillet@gmail.com>

Here implements ftrace_graph_func as the function graph tracing function
with FTRACE_WITH_REGS defined.

function_graph_func gets the point of the parent IP and the frame pointer
from fregs and call prepare_ftrace_return for function graph tracing.

If FTRACE_WITH_REGS isn't defined, the enable/disable helpers of
ftrace_graph_[regs]_call are revised for serving only ftrace_graph_call
in the !FTRACE_WITH_REGS version ftrace_caller.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/ftrace.h | 13 +++++++++++--
 arch/riscv/kernel/ftrace.c      | 30 +++++++++++++-----------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9e73922e1e2e..84f856a3286e 100644
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
index 61b24d767e2e..20bf86557698 100644
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
