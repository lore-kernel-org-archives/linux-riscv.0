Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F39C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tezbKsRj+mvpKPV5i+ErMgFiXooeL2yPUlKPyQ5xNE=; b=H+iOC1AWCYiapd
	v566sBdXlPIlVUbZ7Wd2cyDgH0fQ+MgTzEWG/1AgR+c0hXx+e4MirLCUuUXICEEq6dnoBFVYbjlk1
	WZS9u1zqtmA6ohLwBtVN4SM07Tcluzh4VK/sV307kfFQFX62CpZzy82J77OKuSkGCY5uzvOoZv7WB
	cjmtUUK+1BKSJbNQFfCAQYc+KrSiF2+jVwAtxIaHynqcydxZZu3LzQl50tRHmRAbz83K/jOEsasQL
	SWGzh596V5Ygw9yDBXT0bVvsG3L46kOLulothRE+ztuJM1nkD/tNzxn7iBMKsqDKQkOtutQUOnlqm
	SNzg565rabRp8T9yYAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Eg-00EUQ6-MM; Tue, 15 Nov 2022 20:08:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ed-00EUOY-2X
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:08:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id cl5so26257840wrb.9
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT3AgcfoR7jBMGz0aexOpadgy9URzXtZx9NcMwal4RA=;
        b=XgynjtRyypL0z1WzJGfSms2XvdPpZEkuiQKWXOAKP0M6L8Wxk0cIGukWZ6Z1gRND6S
         B6Dbh8b4RbrvdE226TZj6h6ndjPoQsUiE8YCHuSwamhBMyTWZ81/hugt9X7QdPsJnJQU
         v/DFZoJCP63Vc6wt7x5X0Z+YSIaJbOEwTyHaOFv4OFRQA9w/7KIunotGilwjdjAr+RWQ
         VWdaQNrQM6+D+q1ukQ+qulEpDsZoUEyk9jcoGU3ZoZCK0lSI2jjSNLaNs6tCsLsfva2V
         bRYVcuS9KQtkbuvtAvQKAHvllvriEZAmRyoJ9bL6ZZiTVHsfAqkY4rEZkGeChPLTm4OJ
         D5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xT3AgcfoR7jBMGz0aexOpadgy9URzXtZx9NcMwal4RA=;
        b=7+JfANMPCiWFzxVTRSNCmj7cSIpeIFCaZzn9xNJnVwBy/lTkiTKSharW0Sskef0kd4
         vGNWx3mkYEAz2Qvfq9Re2xsO4j24u52yC9N7YEkVVYNviWj5nFo6BpVtXuIEui9YQmsp
         OH3As9Zdj55bHQ2v1Fl3kjGujox6YrJTj9H+i2jzK8ER+wB8E7u5bSiBqxRoaga5EI7G
         wHn8uVIi9pqhoqBnJ7p5tUqCjmMOVtqtnrMla12P0pyWyE89dhgczd6kYzZ7RUvHs5RB
         48+WUg95rWe+vTEiKt0OxAVaPW5+UTwrsKwtgiDzLM+beMprIxIOdrk6DRSo38amXkJb
         qZ8w==
X-Gm-Message-State: ANoB5pk9Ov1R6AkgNGnf2oqVRjEAq2yDeyOR8xkv6pOlodBYoH1rV1Of
	v7JKI2rxf0ESAd7DtHf+BP363Ne8CBFF+A==
X-Google-Smtp-Source: AA0mqf76fwnEh67K//rSYihWI7bhurJCzPdW6lVsR3x37KupV8U/PG+mh8wTj1idCkVwbh81EibIvw==
X-Received: by 2002:a5d:5481:0:b0:235:a4a5:8e91 with SMTP id h1-20020a5d5481000000b00235a4a58e91mr12211234wrv.404.1668542918962;
        Tue, 15 Nov 2022 12:08:38 -0800 (PST)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b002206203ed3dsm13425989wrx.29.2022.11.15.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:08:38 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/4] RISC-V: use REG_S/REG_L for mcount
Date: Tue, 15 Nov 2022 20:08:29 +0000
Message-Id: <20221115200832.706370-2-jamie@jamieiles.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
References: <20221115200832.706370-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_120843_132053_60009AAD 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

In preparation for rv32i ftrace support, convert mcount routines to use
native sized loads/stores.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/kernel/mcount.S | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 6d462681c9c0..9cf0904afd6d 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -15,8 +15,8 @@
 
 	.macro SAVE_ABI_STATE
 	addi	sp, sp, -16
-	sd	s0, 0(sp)
-	sd	ra, 8(sp)
+	REG_S	s0, 0(sp)
+	REG_S	ra, 8(sp)
 	addi	s0, sp, 16
 	.endm
 
@@ -26,22 +26,22 @@
 	 */
 	.macro SAVE_RET_ABI_STATE
 	addi	sp, sp, -32
-	sd	s0, 16(sp)
-	sd	ra, 24(sp)
-	sd	a0, 8(sp)
+	REG_S	s0, 16(sp)
+	REG_S	ra, 24(sp)
+	REG_S	a0, 8(sp)
 	addi	s0, sp, 32
 	.endm
 
 	.macro RESTORE_ABI_STATE
-	ld	ra, 8(sp)
-	ld	s0, 0(sp)
+	REG_L	ra, 8(sp)
+	REG_L	s0, 0(sp)
 	addi	sp, sp, 16
 	.endm
 
 	.macro RESTORE_RET_ABI_STATE
-	ld	ra, 24(sp)
-	ld	s0, 16(sp)
-	ld	a0, 8(sp)
+	REG_L	ra, 24(sp)
+	REG_L	s0, 16(sp)
+	REG_L	a0, 8(sp)
 	addi	sp, sp, 32
 	.endm
 
@@ -82,16 +82,16 @@ ENTRY(MCOUNT_NAME)
 	la	t4, ftrace_stub
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	la	t0, ftrace_graph_return
-	ld	t1, 0(t0)
+	REG_L	t1, 0(t0)
 	bne	t1, t4, do_ftrace_graph_caller
 
 	la	t3, ftrace_graph_entry
-	ld	t2, 0(t3)
+	REG_L	t2, 0(t3)
 	la	t6, ftrace_graph_entry_stub
 	bne	t2, t6, do_ftrace_graph_caller
 #endif
 	la	t3, ftrace_trace_function
-	ld	t5, 0(t3)
+	REG_L	t5, 0(t3)
 	bne	t5, t4, do_trace
 	ret
 
@@ -104,7 +104,7 @@ do_ftrace_graph_caller:
 	addi	a0, s0, -8
 	mv	a1, ra
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	ld	a2, -16(s0)
+	REG_L	a2, -16(s0)
 #endif
 	SAVE_ABI_STATE
 	call	prepare_ftrace_return
@@ -117,7 +117,7 @@ do_ftrace_graph_caller:
  * (*ftrace_trace_function)(ra_to_caller, ra_to_caller_of_caller)
  */
 do_trace:
-	ld	a1, -8(s0)
+	REG_L	a1, -8(s0)
 	mv	a0, ra
 
 	SAVE_ABI_STATE
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
