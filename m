Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2DC43219
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 03:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHakW86brmNQ9I8Y9tQjY2i58M80ZOC5q7MDl5loQmM=; b=FsMCSy57sEUN3s
	knlBRGCJqaDTreFDjXBlPBCmVpvz9X5R+ze3KQUCDpgtLN2E1AcwwOdX5IUAMUJFQL/7bVlRa47Yc
	Pm+fTCUnONvWZx0ZYmlxWPsjtM96HUHrVmRow0VGfV1g0EGc6lzRM6D3Yo/pkOfbBTM6v5kdYy68F
	qhHT6Z3tNtOxmv9W46nwu3FdOKEeKJtxkc/esORfFO7wYtNZwse7dTpXIB4/zzBgSBbCUB4PZL93D
	4xJGDzFeuySpqy+Agw8QCCXC7VVNsNe9HW3i4Y9In4LWEnpOBUpMxzgMAKXkDSsNBr+/QfkI6wnxH
	HP1rg2m2QxL7zc3/VF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8rt-00GhTV-BU; Wed, 16 Nov 2022 03:13:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8rr-00GhRT-7P
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 03:13:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d192so3095366pfd.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 19:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpY9sowzoB4bTfPMOQKq0rrOfNHmYsG5EEqVDAlGCR8=;
        b=Fkp7RqRXzLca9GRGFqbpy0Ixb78LnV5vSgMDr9Nx1mkvb3FkxSH54azGidRQ9j39Ci
         m1vgt9Y4jUAf5h5HKEYTpNcNgnE+RJ/KOYkY3a+Qe8UKzyjB4ACCDOAHULHz4KD26uFJ
         x4jqjovF5KgqyLe2gE8G7PeB2QByNgMtevktMBqHz7G63ktcpXABfLYc+fbKdTYw4xi+
         XVGRdnAFXBeU39ClDL2wu5dkPvN/DqcbfAs6k9Z1cjJhKVsVczgY+nTCwbJ6GqNr/ctp
         w/Q6Yiyjta2nCU8gYeYP9GAW7IS5ScwGPYgRIQCFkDwPaaGm6ZaaE2W5f/cEgJlp5DhO
         c3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpY9sowzoB4bTfPMOQKq0rrOfNHmYsG5EEqVDAlGCR8=;
        b=HraQNX6BmU3CngvE3R9nJabDMmrhwfvRmW/mjRvm6TuszqkvN5okqZROA831DKKEdn
         rSJcC85TaC2rHk3u3Y72IltpB6SHGOe+UXNqpsBehoZUasyoTqDwG2NRLBxKhOR7SGnP
         GtC+tt8705YdIQSeal1wdbaj4pFUV3piGHp61NWGRyvToG73RApciVQrDFHo339tJUsn
         u9nXteReBSWqxnLztWv6c0G43Nz7usy+vtw4H6qfoWTeAd1G5oNoTqjDYTJwgnsU6uVj
         jEeXL0yeOETggBibEVk0L6hNybKrXFaOe3pQZjqpGTXO7Jy7m1ttrhYxVw8VC+tcNulp
         w+zw==
X-Gm-Message-State: ANoB5pkaWjmOS1QKsY4ICriCaMHgAlZwUxiTJ74gjqZNEZ9tJchClKuf
	1Ft7/o+IqPv1e93z76y2aYw=
X-Google-Smtp-Source: AA0mqf6u+hR/uvV6gQ5bgFGDZl4J+cU6RpPb2zAzKAt/7REEHZZRR9j6Eqpp6zyI3vI+flRPpxwN5A==
X-Received: by 2002:a63:5465:0:b0:470:8e8d:44ae with SMTP id e37-20020a635465000000b004708e8d44aemr18164459pgm.382.1668568417139;
        Tue, 15 Nov 2022 19:13:37 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id ml22-20020a17090b361600b0020b2082e0acsm348295pjb.0.2022.11.15.19.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 19:13:36 -0800 (PST)
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
Subject: [PATCH v2 3/3] riscv/ftrace: cleanup ftrace_caller and ftrace_regs_caller
Date: Wed, 16 Nov 2022 11:13:05 +0800
Message-Id: <20221116031305.286634-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221116031305.286634-1-suagrfillet@gmail.com>
References: <20221116031305.286634-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_191339_296822_E739D7DD 
X-CRM114-Status: GOOD (  11.00  )
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

ftrace_caller and ftrace_regs_caller save their regs with the respective
option of SAVE_ALL, then call the tracing function, especially graph_ops's
ftrace_graph_func. So the ftrace_graph_[regs]_call labels aren't needed
anymore if FTRACE_WITH_REGS is defined.

If FTRACE_WITH_REGS isn't defined, the !FTRACE_WITH_REGS version
ftrace_caller remains with the ftrace_graph_call. So the enable/disable
helpers are revised for serving only this ftrace_graph_call.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/ftrace.c     | 19 ++----------------
 arch/riscv/kernel/mcount-dyn.S | 35 +++++++++++++++-------------------
 2 files changed, 17 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 148a5480076b..2f0bcedc6a2d 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -211,30 +211,15 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
 extern void ftrace_graph_call(void);
-extern void ftrace_graph_regs_call(void);
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return  __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return  __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, false);
 }
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 2f0a280bd7a0..9e4097c6793d 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -215,6 +215,7 @@
 	.endm
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
+#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
@@ -243,33 +244,27 @@ ftrace_graph_call:
 	ret
 ENDPROC(ftrace_caller)
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
-	SAVE_ALL
-
-	addi	a0, ra, -FENTRY_RA_OFFSET
-	la	a1, function_trace_op
-	REG_L	a2, 0(a1)
-	REG_L	a1, PT_SIZE_ON_STACK(sp)
-	mv	a3, sp
+	SAVE_ALL 1
 
 ftrace_regs_call:
 	.global ftrace_regs_call
 	call	ftrace_stub
 
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, PT_RA
-	REG_L	a1, PT_EPC(sp)
-	addi	a1, a1, -FENTRY_RA_OFFSET
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	mv	a2, s0
-#endif
-ftrace_graph_regs_call:
-	.global ftrace_graph_regs_call
-	call	ftrace_stub
-#endif
 
-	RESTORE_ALL
+	RESTORE_ALL 1
 	ret
 ENDPROC(ftrace_regs_caller)
+
+ENTRY(ftrace_caller)
+	SAVE_ALL 0
+
+ftrace_call:
+	.global ftrace_call
+	call	ftrace_stub
+
+	RESTORE_ALL 0
+	ret
+ENDPROC(ftrace_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
