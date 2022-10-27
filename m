Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE5FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfoKylftiPkYC+t5qwo3olt2Q29PE/wK6iKUoKlab34=; b=18LN0ElY8iln+V
	oRJ6JmAA89WYdM9azNS8GN2YC8x99bahe7aE6qmnS8Xgz27/YjaO1vxlggR0Qgc+ANTUT2Al3WChm
	yjnK361w/Q7Rf69X7cRAhjKsUDBcLIO3uDBJTiztZ1W5JYyLwSG6gh9HV7Gu61SEPDbNCI2SBqUXd
	Ixv8j0B6rLfQHTeI1mQVi/rdMcrfyF47CbpJ7nQSW0JvcX/Y11Mmh0pbYBZn59JTuuN6AWNMduihY
	zF5iM6lbyM+fx++ol5Pb8hE8/DgDKmAQhrVr+20FZYSNNNu9OPMq1fVm1Ya43pLrzglhOETfmeOP7
	PhqwBCy2P4Kr4waKfPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6ck-00ELwt-Ji; Thu, 27 Oct 2022 17:24:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cc-00ELt4-2f
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 17:24:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id w14so3390300wru.8
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb5JOCsqRGpb1FWaBLoqWHYjZPmTVNg4sbv5o3ZAmY8=;
        b=JjS+UoOP+TIvPNfsKO0Pzg/xy75DSeO0nrogrfpVrZjE5U4vh+N0JvTMympnRR7Ltv
         absVAF9uIOJbd37zQug2wALBmhWyfvTjz5lvwsNoUkD1lDpQTnAU/ljoNrjjJsJetBOF
         bJEbiJMWZMTguYYTWPE7PJCwdLMEqwLTneyxlp7AKvryUJ8M5u9idBJnrQh5qgvh7NRi
         CjHxXJftUqzY8Vq83qjmN94ti7GhUwUUO45W7loEH3lLqEEfq27dEQqcBxeWMzIQcDkF
         XyXaYypFadjq0lilgm4RB2ZR73yI7sGov3FibMGejW2DHlZrpfgFmp2A1NxoFWAe+U8d
         Vg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kb5JOCsqRGpb1FWaBLoqWHYjZPmTVNg4sbv5o3ZAmY8=;
        b=FgeDIr7f9H/wMPRx/q1sKMk4mceN4SchdcBy8M1bNhg2xZv51JPLsttqlrPJnvmLak
         icZFx4z5tfSkvVogaTRY/4Tzj9RmdyijVOO8BQJ2RTsGA33eywF7TGvIBcosULsSla/W
         dGKjYTpHQBTTCfBxtHRL4yg2upLD46WNn2BcBGnA2tX2vDLN8mpEcB8AbzhDS1taY69Q
         ddO7/wh9V1gK9pIdzdn5bHFEPcxdMGLBgF2YbI6TfKzo2zRXZ8/pBvJjqyo946lI8KGD
         m4ukEHgoZbUDeV7hyOo6OzMHVf5f7uUg2587NY8nqRGwBVJEvR+ggHYVnugUxm0Nlsc3
         Yfew==
X-Gm-Message-State: ACrzQf07As7iwSp8aJqRTs2I6BU9cRMYtivPeO8KS6yfcQZEm3sXlTg0
	YihVI4VcJikw5SfpavL81clAsdLqc7X5MQ==
X-Google-Smtp-Source: AMsMyM75ApGHejD9zBgkIyZKigOENObnPiBSFjLW+j5T+6tHNy1+d81DxGJ4GUZUY1/q71vq5FPOHA==
X-Received: by 2002:a05:6000:1885:b0:22e:7851:b257 with SMTP id a5-20020a056000188500b0022e7851b257mr32316083wri.418.1666891485567;
        Thu, 27 Oct 2022 10:24:45 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003b4cba4ef71sm5474195wmo.41.2022.10.27.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:24:45 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 1/4] RISC-V: use REG_S/REG_L for mcount
Date: Thu, 27 Oct 2022 18:24:32 +0100
Message-Id: <20221027172435.2687118-2-jamie@jamieiles.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027172435.2687118-1-jamie@jamieiles.com>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_102450_141646_90B158A7 
X-CRM114-Status: UNSURE (   7.69  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
