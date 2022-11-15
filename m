Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD5C43219
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AS9nNtoFZb/2/sqrnK1rMQaTspOU1Lh6A0Kc+1Ysp4=; b=xPGiUxXGpbsJXU
	uS6PG9ey2LcUS9xBvJaJF60pjeda3LzvBszE3MgyZ2IS7ChrrGz4KCAK5DkWlK0YPZAMDKGbpxR8f
	LajOKiaI6HzPENOtpy5wafhzWLHB+d9GVhCzrzBX/EkKD2MzOPXJ0R90GHMqg+fHjmidZBodqQmQW
	Ok7MA2DFThs7wMzaaC8emka4CheHuLLyIvzile+MyWQaaHjgJgOWAc4/OnFhTLKvt9OFobRnmCNxS
	ed1OZpuO6QnsY+k4z3FjhnxT9HAe89v7BZ//sj9s6Ux+YAi59/Ownyo5oLzsglqUCF5JX3PVY2/nJ
	9ps7iX2TPS6euMj4jZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEW-008Bqz-Re; Tue, 15 Nov 2022 06:15:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEU-008BiG-El
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 06:15:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id q9so13215450pfg.5
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 22:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bUagvGYVwuH85x9VGCmZe8w6n24dTZmrFkDrBOEYew=;
        b=emPzmYPzC6EXM7lNu8jzs6I/yUKvaSt7SnmUL5TAeEXq0fw3Ob0z4XAtUxLFOepNMC
         XVF8aJYgJtHALPKGRj2e5BA53YXB+8R1VkH2Nv89Lwj39rnsyQdHsfWvV0GPwpOnm6PN
         k873s4evosXjprSwTXprETDMQjXww2qUupywX5KjZiSiepdML8s6kssXBwiS+W7kqzud
         8BJD9iRMGKuxB3+/2DW1RJ/Kd8PA6nvNh+PRfopHi8i65nqhSRZZ1pDY9HujtnikiDH9
         PfvjXW/k2UUJWGC0pdq/79C+W8afoMQgwsX+UA4V/6yapLx6Hev/64V6UB1kCyn5ZR7P
         q95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bUagvGYVwuH85x9VGCmZe8w6n24dTZmrFkDrBOEYew=;
        b=H7qftKE6DlX4JITl2M43mE1N7EMF+ECfNitAIhxWTyeYvB3zEjLoetha0XhbMKCfV5
         gKrm67Pa0pLKjXAir2zE++Q83PAgeSfXVxwGBDRqsRuNsICORHcOlYf8hpSzkAWc1ZJT
         0CJskWbFLUvLntF6K3XZQzbHzx0m84Zc/nAy81251i3IFKJTthg9pMrd5u2hSJ4lyy00
         +vyPWGF8gCmv2PmU2tCwSS+liQsBPiq1f0F8yr26T/y6+b65NoPo8uuXZdezHXPgZC4o
         p2mF63QXEGfgVCsTcCM1JoMKY7DXQxDd6rEtM5q+Of/e+t55p6UiqoK7IYLXolqxFbZ5
         JuBA==
X-Gm-Message-State: ANoB5pnq3moDzvVVBraAfMMMiqaHd6ojmfnfBkiiwp4rf+geOhNHzuGf
	ZQ96kmsQHJbFCnxwdq3FTGc=
X-Google-Smtp-Source: AA0mqf6WWiNknW0Fppg4F1OMPb702hbPzmIMi0Cj5aQFukozBD4C6Ntw5ni/HfJ25nTZ3Ow/tUU9mg==
X-Received: by 2002:a63:4a0f:0:b0:476:837c:1bdf with SMTP id x15-20020a634a0f000000b00476837c1bdfmr6945742pga.587.1668492939465;
        Mon, 14 Nov 2022 22:15:39 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709027ec900b0017f57787a4asm8736769plb.229.2022.11.14.22.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:15:39 -0800 (PST)
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
Subject: [PATCH 1/3] riscv/ftrace: add ftrace_graph_func
Date: Tue, 15 Nov 2022 14:15:23 +0800
Message-Id: <20221115061525.112757-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221115061525.112757-1-suagrfillet@gmail.com>
References: <20221115061525.112757-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_221542_513003_98672BA0 
X-CRM114-Status: GOOD (  12.17  )
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
index 04dad3380041..b33c98070972 100644
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
+			struct ftrace_ops *op, struct ftrace_regs *fregs);
+#define ftrace_graph_func ftrace_graph_func
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_DYNAMIC_FTRACE */
 
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..2d7ce77d4f33 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -196,6 +196,20 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+			struct ftrace_ops *op, struct ftrace_regs *fregs)
+{
+	struct pt_regs *regs = arch_ftrace_get_regs(fregs);
+	unsigned long *parent = (unsigned long *)&(regs->ra);
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
