Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1DCC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9274961131
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9274961131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlaB6cMHqnMQDmz8eczIVQowRtdoP8fgUkj9hTS3Kk8=; b=t9ktdxCT1UkxiX
	BrJbyzyXzJ/ZxfxH5no79I4oUo6sq5QuHTO+h7nHTAAz4xtDrtoXaYtRZwSYBidNlE2Kua2MN/vK4
	qKGwISBfWlL1Q0wZevQcoInV500zjbssfiLNROm/+tNFrq738yWrov+/zhQUNidHdiXFu0N+tKYUv
	lqAlf+BrBDavcfuzRjJYrnj5d83rj2zq21CI0itPxkuZZyZtyy9ZTjDJNEuP/ORXAMgXIO5kOhlsB
	oWVZQIN+HYaiGajj121lgXj8Z3nLoldYXMK7QawHsxG26/YxLPnwe3rP2gzAFxwLerlbC+Bwj4kZL
	WBJ6Vh2AA+myt2l8dWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1f2-007JQD-Mc; Wed, 08 Sep 2021 17:47:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1eA-007Ifk-I1
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso2068984pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aaBn2iXv53pXLMpiXjb2tRcWKw3T+uDqL/GiUgDTj90=;
 b=D8NMx+XLy53uY1MXIUeXls4zKXDMKxbddVBrQJWu3xrIJ5jdxzR0mgoJ63iKhkMsqr
 aOLKAnoQmfPZsOTxtij8B1CZU4ToG4ZYG3YhJXVxCQE2a4DPBMa9S3X0PE2hgKtTmrPI
 fiqyr0h3bmAVFPhWjTmTKz8CZcLQHyg/s6CCPOEmC41NdjcIueK6M/tjaylhwR62S+Td
 DvQblqoqk4gLxnngThLTQfx6AaEq6w5q+kgz0A2j19xcfGc3SB94mReerWW8VCrvZZg8
 cJSN8f1JZWPt7xDbBwggAO4P7dgbUeTxNGeRtZEyLS/TVIwPIlCz2uYfysPefrQsglQ/
 m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaBn2iXv53pXLMpiXjb2tRcWKw3T+uDqL/GiUgDTj90=;
 b=E01YKeWcHJSwxxV2L1gy/FTbpArXj3NrFk2VPIwIIegz0Qj5axCOGQurDAYWT/BB4P
 AGhe4uPuhfxR+gSdgiamwcXIQ2Vv8msm6jME2UrsV6t6XO9Ka7Z+zwu7o0Lh+pC6HW0O
 GnHgXiCWuxGVbNGphf8AjzTgtzbmQ1lNKitkXAUX78vX+P5Mr4DbejzcaK1QaRpRfZgI
 0Nst21gu+0wnu4qKBIYZTmipwl3xMLyWPIoSoBcLVSjpO1Tu3gMS15eBPsDkbpRwsRP8
 mF5ZejxSkhpeR6yt3kG6lsBXDz83L5qLRRWzunk8lfEmK5rbKGtZHOQmRjLGIYnO8OxE
 Lv1w==
X-Gm-Message-State: AOAM530G3QAyBu1dBRb2xitIIjfAu73n9vQPKqumz+m7lPdfcJJpLhT3
 94ryLl5/oD+7InB51l2pYBHhDmbu0Lz7Bw==
X-Google-Smtp-Source: ABdhPJzjfhCk2uyKvxy2K4fTatUNYsz+fdJinoh+ch/Q3oNcaLUf6O7ySpbJTJicDZgHah1nC/wrjQ==
X-Received: by 2002:a17:90a:460e:: with SMTP id
 w14mr5457656pjg.0.1631123165618; 
 Wed, 08 Sep 2021 10:46:05 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:05 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 19/21] riscv: Allocate space for vector registers in
 start_thread()
Date: Thu,  9 Sep 2021 01:45:31 +0800
Message-Id: <5d99eab37a683d21e0cec75bfcec96ad8b480d02.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104606_643288_76F2C6F5 
X-CRM114-Status: GOOD (  13.76  )
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

It allocates memory space for vector registers in start_thread() instead of
allocating in vstate_restore() in this patch. We can allocate memory here
so that it will be more readable.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h |  7 +------
 arch/riscv/kernel/process.c        | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index de0573dad78f..b48c9c974564 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -103,12 +103,6 @@ static inline void vstate_restore(struct task_struct *task,
 {
 	if ((regs->status & SR_VS) != SR_VS_OFF) {
 		struct __riscv_v_state *vstate = &(task->thread.vstate);
-
-		/* Allocate space for vector registers. */
-		if (!vstate->datap) {
-			vstate->datap = kzalloc(riscv_vsize, GFP_ATOMIC);
-			vstate->size = riscv_vsize;
-		}
 		__vstate_restore(vstate, vstate->datap);
 		__vstate_clean(regs);
 	}
@@ -127,6 +121,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 
 #else
 #define has_vector false
+#define riscv_vsize (0)
 #define vstate_save(task, regs) do { } while (0)
 #define vstate_restore(task, regs) do { } while (0)
 #define __switch_to_vector(__prev, __next) do { } while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 0b86e9e531c9..05ff5f934e7e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -97,7 +97,16 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 
 	if (has_vector) {
+		struct __riscv_v_state *vstate = &(current->thread.vstate);
+
+		/* Enable vector and allocate memory for vector registers. */
+		if (!vstate->datap) {
+			vstate->datap = kzalloc(riscv_vsize, GFP_KERNEL);
+			if (WARN_ON(!vstate->datap))
+				return;
+		}
 		regs->status |= SR_VS_INITIAL;
+
 		/*
 		 * Restore the initial value to the vector register
 		 * before starting the user program.
@@ -121,9 +130,11 @@ void flush_thread(void)
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
 #ifdef CONFIG_VECTOR
-	/* Reset vector state */
+	/* Reset vector state and keep datap pointer. */
 	vstate_off(current, task_pt_regs(current));
-	memset(&current->thread.vstate, 0, sizeof(current->thread.vstate));
+	memset(&current->thread.vstate, 0, RISCV_V_STATE_DATAP);
+	if (current->thread.vstate.datap)
+		memset(current->thread.vstate.datap, 0, riscv_vsize);
 #endif
 }
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
