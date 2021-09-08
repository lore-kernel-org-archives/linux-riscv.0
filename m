Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C49C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665A261158
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 665A261158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CPJojMaHDIs/q+cQ/FzsS7mEc3gfrDqPF8nspIvdsA=; b=A5SPAQ+AeXSqAi
	McEjH+17kIhVQmKQKAjUHofBNQXbKK7JThcaektGPJoUsVqa/M8e7znfoy+RtijTsx+itRWgHbcJV
	gbC1Y55uZmZt5am9y/Fpd4nuQA3vSlRFCCRu6qplgLMnYzqBI/X8TZ9cYG82faUIKkAuOFo/f1e0H
	Vgsd+2n9bs7SpSmU4s9SwYn8ji7dona0yw5hErCNrbLA+8eoQSKusc4hHKT2iU+ljrFFoKK+N8AG5
	xYatFwfQRwoWJ/1GggOLtGtATWWL/dte+PIwTa+MbB14HhzYqrIkjgxlIoGmseuoCpH8R+H9hywVe
	W3nJ/g/PkMiYvF58Wpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eo-007JEC-5i; Wed, 08 Sep 2021 17:46:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e7-007Ici-Af
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id w6so1401463pll.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DAMWM+p/L6+jJQLeVV8+FpCPyBLPbqVhx6Mcq9jGTrE=;
 b=FX6ImI5d5GDsqGT8MCQ/CfuS+yOR0dUPasLJ2jW0MMbttloHetQx5WjnkkAhEdRGJF
 bryE7D8WPC13okAdOQrecGMjx/ZnJBMM9bRbI7qPZh4ljizrflgrNgGmqRDMeyFnzGX2
 sAd4P0nBewnpOBfirshxZtEr8/jl/z9Y0XTMOlOz1D0rcsEOfELMUMCj0UtY54hAUKxw
 0Dtgwhj7J+RuoAyNsi1uwGtGVWPseyDy7Nmn/QherXFP3tBJQMi1BEbqKgLW79fHekXO
 e1guF6uMRs8cQbUKtlkXvD6mBN8b4Z4c6871F3oouKy7xYoyN7EdqOWLDdUMb9S5Ypi8
 rPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAMWM+p/L6+jJQLeVV8+FpCPyBLPbqVhx6Mcq9jGTrE=;
 b=L8HkZAy3CygU02+6afsVFnhnIyKE2Wi3HtIItwzUtyGe67fBTYBjticOV/fKalZIAE
 iDahPFEr1WM+s7clfzOCx2gD2QWDctwj9Z3vZy/YXMEzLMs37DK2TpkOisqMYMPMFMiP
 7+4JfONF5FJD3PrrheDckHK7vKW6EosBTHLHLdfBlO2rgC0U4cDsJwBkn9OBuCDld163
 ni4lW4NfvMo3v9oo9mMBHBdHef+BdjksbJULqIPzA/ms4T3KSs5WBtB8qetTD19NbQuM
 z7xmKiR9xKi/vJ59E72MjODA6XmjTZa8riStUOM+gaPtT2hV5PnhrqV8MEmtGcu91xuj
 gUmg==
X-Gm-Message-State: AOAM530vF+FkITkLxCILUXrN/1CR2efzRNZBbNgIOh+5/zDHBMZFlvNQ
 DG+ZEtXWdIuuBDvotjL0fOEof+N2GuZBow==
X-Google-Smtp-Source: ABdhPJxW0YnRI9gSZnMqlrmyiGWCsxjhq+jewN2q3kSudYTJgfvG8MzkTl0x1m4myrFNm8RkgL53xg==
X-Received: by 2002:a17:90a:34b:: with SMTP id
 11mr5513611pjf.102.1631123162460; 
 Wed, 08 Sep 2021 10:46:02 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:02 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 17/21] riscv: Optimize vector registers initialization
Date: Thu,  9 Sep 2021 01:45:29 +0800
Message-Id: <e742a1ac4028694a85800d0966a9ab0c9fc1c1fe.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104603_422667_88271781 
X-CRM114-Status: UNSURE (   8.74  )
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

This patch optimizes the initialization or invalidation of vector
registers. It can reduce the code sizes of vector_flush_cpu_state()
and reset_regs().

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/head.S               | 30 +-----------------------
 arch/riscv/kernel/kernel_mode_vector.c | 32 ++------------------------
 2 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 42eb3203fa77..8362d7458c6c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -442,39 +442,11 @@ ENTRY(reset_regs)
 
 	li	t1, SR_VS
 	csrs	CSR_STATUS, t1
-	vsetvli t1, x0, e8, m1
+	vsetvli t1, x0, e8, m8
 	vmv.v.i v0, 0
-	vmv.v.i v1, 0
-	vmv.v.i v2, 0
-	vmv.v.i v3, 0
-	vmv.v.i v4, 0
-	vmv.v.i v5, 0
-	vmv.v.i v6, 0
-	vmv.v.i v7, 0
 	vmv.v.i v8, 0
-	vmv.v.i v9, 0
-	vmv.v.i v10, 0
-	vmv.v.i v11, 0
-	vmv.v.i v12, 0
-	vmv.v.i v13, 0
-	vmv.v.i v14, 0
-	vmv.v.i v15, 0
 	vmv.v.i v16, 0
-	vmv.v.i v17, 0
-	vmv.v.i v18, 0
-	vmv.v.i v19, 0
-	vmv.v.i v20, 0
-	vmv.v.i v21, 0
-	vmv.v.i v22, 0
-	vmv.v.i v23, 0
 	vmv.v.i v24, 0
-	vmv.v.i v25, 0
-	vmv.v.i v26, 0
-	vmv.v.i v27, 0
-	vmv.v.i v28, 0
-	vmv.v.i v29, 0
-	vmv.v.i v30, 0
-	vmv.v.i v31, 0
 	/* note that the caller must clear SR_VS */
 #endif /* CONFIG_VECTOR */
 
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 108cfafe7496..b84618630edf 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -86,39 +86,11 @@ static void vector_flush_cpu_state(void)
 	long tmp;
 
 	__asm__ __volatile__ (
-		"vsetvli %0, x0, e8, m1\n"
+		"vsetvli %0, x0, e8, m8\n"
 		"vmv.v.i v0, 0\n"
-		"vmv.v.i v1, 0\n"
-		"vmv.v.i v2, 0\n"
-		"vmv.v.i v3, 0\n"
-		"vmv.v.i v4, 0\n"
-		"vmv.v.i v5, 0\n"
-		"vmv.v.i v6, 0\n"
-		"vmv.v.i v7, 0\n"
 		"vmv.v.i v8, 0\n"
-		"vmv.v.i v9, 0\n"
-		"vmv.v.i v10, 0\n"
-		"vmv.v.i v11, 0\n"
-		"vmv.v.i v12, 0\n"
-		"vmv.v.i v13, 0\n"
-		"vmv.v.i v14, 0\n"
-		"vmv.v.i v15, 0\n"
 		"vmv.v.i v16, 0\n"
-		"vmv.v.i v17, 0\n"
-		"vmv.v.i v18, 0\n"
-		"vmv.v.i v19, 0\n"
-		"vmv.v.i v20, 0\n"
-		"vmv.v.i v21, 0\n"
-		"vmv.v.i v22, 0\n"
-		"vmv.v.i v23, 0\n"
-		"vmv.v.i v24, 0\n"
-		"vmv.v.i v25, 0\n"
-		"vmv.v.i v26, 0\n"
-		"vmv.v.i v27, 0\n"
-		"vmv.v.i v28, 0\n"
-		"vmv.v.i v29, 0\n"
-		"vmv.v.i v30, 0\n"
-		"vmv.v.i v31, 0\n":"=r"(tmp)::);
+		"vmv.v.i v24, 0\n":"=r"(tmp)::);
 }
 
 /*
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
