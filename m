Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9877BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmEFAw15mwiID6dNRfzKSPkHdO8bENdXwFnpnXlIMZ4=; b=JZeVmGAZk9PoFU
	5RJ4fJeFcP+uI44FKq8nPEw7ACPa6+cjO0UeP8MH174yTc8O8WygRcTHRi4Au76gol/9HeiCkwE4A
	RCMODfMwBg3ZeO4Uju7wYR4dsz4A8Umrw71KEbrxZhl74J1iMyMtm8ogNsd117ItiHa5EE1KxpyRG
	I2QwFwbuuLWcAjtwgBRnc49CtK7UV3715EjoiALEv7wBIVYM6+bdxzgFEQffKZq9WGR6ZVUC1ibJq
	UkOQ61foSPj1qL68TJUXXNajPPx9sTSbpkgzQ1aXhpHD6k/uYHKwF75+aT8EyTO4f+mMNfOfHVLYM
	gy7vdrCXP1zvggv6axEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEd-008Bx2-QQ; Tue, 15 Nov 2022 06:15:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEa-008Bdp-1f
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 06:15:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso15991470pjc.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 22:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui8airw69h4AUo9oSmUgv1gkgt+KqV79d7fg2QkBl5M=;
        b=qjXR2fiv4kg9+omGG4vO16S+uSEZ7V3D5muYTI2e+cCxJKqZZpOed+6egG+gp1pCoX
         pMjy/kZeJ51sujHaYgIFrywHsdJWPuUEjfll30uxR63zU44uRf+jA9fLF2bW9eq2DBXd
         rXT6rpuM6BTdIrnC9l3j06dlpTwwr56h3qwrUbFTYaN461zWfipD9qMnGJFF0FlFoNgp
         w8Qh2rcNICYacRmDfFHyoxT5ebblLdWKa6DTY5pjRq8jGiV6KU9E1CrVvEcQJoJYDDP7
         IQS9IKNrsTM+6a2ohqm0uqAzVykK1ku3PBuu+o7yguxGhUDggkiWEe27PEGe0Xqs/D8n
         7HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui8airw69h4AUo9oSmUgv1gkgt+KqV79d7fg2QkBl5M=;
        b=rVNvVpsY+EmEJcwBbiejQgNcU/gmgLQmVPXRqVuO/divXpAlJRYM+vImHiMTmg+djg
         DNKcRSuwmDii3RRa/DPKdC6tXkXAH44Y0Z+5PyyywOkyZRHtuiL1y6xUBHDkiZTdFtF4
         wexDhlSKiWTekhr/vyHEYtzGbNmboRf2Mp+ooQGSJ7yBiWXnr9L6JtknpiFp1OQaC803
         oZ6GFSe53kMTjM/m1pSJor5PPW/KniVsDNLK4xFF+5fAJqdWdg9Spx4U3GYljFxkDsnP
         FnLdBl9Rq7u4Z7fn+aQybBBulWPkety9AZUEufu49bUnUQUhPVgh8siwNPFMSygnozPW
         RoSQ==
X-Gm-Message-State: ANoB5pmxxgCI8plpdCiZ5fgmd5V/H3YhVd9pkVOuhbbFUFqqJIarnZjx
	vDiNWGW5N2GlqnCo2hHFQlA=
X-Google-Smtp-Source: AA0mqf6ahWjvyXPj6nTnyXmRe3B+e5AQiDB1hRBcbBS3K1NZio1kDogPfJrNTwZ80MFleU/NGUZNrQ==
X-Received: by 2002:a17:90a:5b08:b0:213:7030:b2ec with SMTP id o8-20020a17090a5b0800b002137030b2ecmr687621pji.95.1668492947682;
        Mon, 14 Nov 2022 22:15:47 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709027ec900b0017f57787a4asm8736769plb.229.2022.11.14.22.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:15:47 -0800 (PST)
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
Subject: [PATCH 3/3] riscv/ftrace: cleanup ftrace_caller and ftrace_regs_caller
Date: Tue, 15 Nov 2022 14:15:25 +0800
Message-Id: <20221115061525.112757-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221115061525.112757-1-suagrfillet@gmail.com>
References: <20221115061525.112757-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_221548_106272_62EF7A49 
X-CRM114-Status: GOOD (  10.73  )
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
index 2d7ce77d4f33..974732207c1f 100644
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
