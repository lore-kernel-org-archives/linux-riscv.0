Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44025C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXOvQ5y41xE0phypKxsl4v7zl2IDcJ23y8D1Rq6UU0E=; b=kWs/rn+7MWAoM/
	Ao/hCWCUCR989riI0PSXXF3FSTPLKYeKo5uB0aaRKdcYg4O+bA7aJinuzwr/rmSh+ksUGhOoWpRbP
	SAR5GYLdr7j2viHpU5D3aX+44B/zVzi4gXRbT0d4w2qUqdAMmHcHCjdpAAlqp3npNR0wRWvDu4WNi
	s+AP9eiFrLQNdJR1+Wa8n/9rhoDqp9SQZONIm/Ab/kEUO7YBvvz6GAHpmAIRdhprTu7CEW08LcahG
	N4JiUH5EQbq0wpj7mR562J6Sd2Y2y9Avis2RjdaAyfCy84b9EOl8y8aTV5JeU4mIptnIJQq1CLzNK
	HiQbfsrDxpwwE3thENNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ei-00EUR1-1v; Tue, 15 Nov 2022 20:08:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ee-00EUOZ-IL
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:08:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso11136547wmo.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEZxthwoJR8ikYAsnBg3VLqlA9l37WC0aRUXRJ9MycY=;
        b=E/41ajyIsOe0G+QsfA9ycZGH87iAWHxa/4RU5sx8vv+ZrErlBCPB78YxdftABytze0
         AVgPne1/d/DZaNFu1BH9zS9DQfzYk5rTuLQL/6yTbl7N7Frx5al+ctZCYpPSr8X/6uiX
         aB6I9qHMKchHQAuK4BMHSOTZlPXm8xB1O31i1vWfziBvMMpKtp0ZANFdElMGh/8ZYP8+
         m6suY3BuqjfIHWmxCwd8IK5x4+2dUcQ4oJfHQ6zrxHvef+crh665Z3kmTqU6okKlxS4r
         Cy7KPvGh9m6KDZVFWWiRKw46aYhT0d7by6tslzBPpHng3ZZFq3ZJkRm4P0jSseMcjuEH
         /N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEZxthwoJR8ikYAsnBg3VLqlA9l37WC0aRUXRJ9MycY=;
        b=6YQEhhexIE7EKDbpRLu7jLB+3wgFhnscjbXGOvxiRyriAXUWZfD6gKp8Jtjzh7Q2RX
         ojqhCWvn0DzfjNyR7ECW/LGxoktvoNn8S5hGX9S+YiYz+9hz1Mk40dhZ+V6aTFD6+SfF
         CIKxq6Z1p4oUqOgOaqo26M7egtDxt+zbGduUWb6qUAWfWmRgQBnKnJaUKbQ/ifSAjSu5
         m1kyU/8kxf1SbAM7dUaCYgSzKliqulUw1LL+jyjGTLN7ON1WOaQK2V9M8GboVhY7B+CT
         ICjGxCuLNQVcaWeT5lbRLaGs72WErHm+wcNMewlcPTSxJ8yOwHV67fKVfisOoBdePcSA
         kLlQ==
X-Gm-Message-State: ANoB5pmowoNYDsJK3ylCXspTGnYlpTYSUlPs1lysRpfOp0KSjfRXlbu6
	xER1Ho+BjmSN1j2gQjOoKW7pE0l7wIn9gg==
X-Google-Smtp-Source: AA0mqf4CEBd5alQ5WsJiLn7l/ukVLe/yTaKYz13oa9tuQh+Y4RelwsbOf2A18mZ5nDeEyWFfxXUmTg==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:758f:161f with SMTP id y15-20020a1c4b0f000000b003cf758f161fmr26745wma.54.1668542920465;
        Tue, 15 Nov 2022 12:08:40 -0800 (PST)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b003c6b7f5567csm3473999wms.0.2022.11.15.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:08:39 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH v2 2/4] RISC-V: reduce mcount save space on RV32
Date: Tue, 15 Nov 2022 20:08:30 +0000
Message-Id: <20221115200832.706370-3-jamie@jamieiles.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
References: <20221115200832.706370-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_120844_620820_6A9EC12C 
X-CRM114-Status: UNSURE (   8.91  )
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

For RV32 we can reduce the size of the ABI save+restore state by using
SZREG so that register stores are packed rather than on an 8 byte
boundary.

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/kernel/mcount.S | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 9cf0904afd6d..613bd07c6268 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -15,8 +15,8 @@
 
 	.macro SAVE_ABI_STATE
 	addi	sp, sp, -16
-	REG_S	s0, 0(sp)
-	REG_S	ra, 8(sp)
+	REG_S	s0, 0*SZREG(sp)
+	REG_S	ra, 1*SZREG(sp)
 	addi	s0, sp, 16
 	.endm
 
@@ -25,24 +25,24 @@
 	 * register if a0 was not saved.
 	 */
 	.macro SAVE_RET_ABI_STATE
-	addi	sp, sp, -32
-	REG_S	s0, 16(sp)
-	REG_S	ra, 24(sp)
-	REG_S	a0, 8(sp)
-	addi	s0, sp, 32
+	addi	sp, sp, -4*SZREG
+	REG_S	s0, 2*SZREG(sp)
+	REG_S	ra, 3*SZREG(sp)
+	REG_S	a0, 1*SZREG(sp)
+	addi	s0, sp, 4*SZREG
 	.endm
 
 	.macro RESTORE_ABI_STATE
-	REG_L	ra, 8(sp)
-	REG_L	s0, 0(sp)
+	REG_L	ra, 1*SZREG(sp)
+	REG_L	s0, 0*SZREG(sp)
 	addi	sp, sp, 16
 	.endm
 
 	.macro RESTORE_RET_ABI_STATE
-	REG_L	ra, 24(sp)
-	REG_L	s0, 16(sp)
-	REG_L	a0, 8(sp)
-	addi	sp, sp, 32
+	REG_L	ra, 3*SZREG(sp)
+	REG_L	s0, 2*SZREG(sp)
+	REG_L	a0, 1*SZREG(sp)
+	addi	sp, sp, 4*SZREG
 	.endm
 
 ENTRY(ftrace_stub)
@@ -101,10 +101,10 @@ ENTRY(MCOUNT_NAME)
  * prepare_to_return(&ra_to_caller_of_caller, ra_to_caller)
  */
 do_ftrace_graph_caller:
-	addi	a0, s0, -8
+	addi	a0, s0, -SZREG
 	mv	a1, ra
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	REG_L	a2, -16(s0)
+	REG_L	a2, -2*SZREG(s0)
 #endif
 	SAVE_ABI_STATE
 	call	prepare_ftrace_return
@@ -117,7 +117,7 @@ do_ftrace_graph_caller:
  * (*ftrace_trace_function)(ra_to_caller, ra_to_caller_of_caller)
  */
 do_trace:
-	REG_L	a1, -8(s0)
+	REG_L	a1, -SZREG(s0)
 	mv	a0, ra
 
 	SAVE_ABI_STATE
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
