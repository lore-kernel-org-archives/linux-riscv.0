Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020A3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbrGyAMT823hg6AYii2/DPgjtn5wk6DhcFWfPECuZNI=; b=uMJRRuu/viaCnl
	VBij1x3zJ40KHKw1D8siE7aDIMbJeRp/5/zRkM2QFER9lwBSBtWfT+b1gyxDyqoKAiLCzKkpdNtad
	q+WTRnlbwUgAIIfNPO83Gm8dZfayb/hayvG94NidIjoS9bluFL3lUMcLhdOY9P9SyIEMWKMkmU8tZ
	NW//W7qmiyN5p8L5YddgjUSfULkF73buweonJFor8iVQ9r8Sz0waOpwhsjO/M5pjlvy35pHd66mjE
	Cm/mxesr/4qdDT40WyDbwZtJBrrn8JfV/6vgVzKhZ5d0fISZhrlSWjjuo39E3eUdh+p9WZ5GcMzJu
	ix1j+gA7UntwR8QYhXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Er-00EUUA-WD; Tue, 15 Nov 2022 20:08:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ep-00EUQ7-Sm
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:08:57 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a14so26281182wru.5
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZewNcWS1CBuE/TOZhf1B+A3aeLfdjLjA0yDv/ensoA=;
        b=Kx4IyUiyLrxrK99Z0EdEamaXI7fTY7abjWk5bbGDASfMbdOzQx0fAEtfFYInKdcRll
         4VSiXGqgzHu6Aoz2zUOvYUtuyIrMVHBa37KCL0z4NLet7+J/YfMdC1AMNipXLGBVAygA
         OK283kwkWNS7PCrAkveBZUhc/saX3E5lSCLs3HWrlZRyUUnwoRWAHXHCI0hPzLUSsQ+L
         OaNMCTpjdYGuPG25iZCUedicpyA3Rdf6hincO77CIzbzXTMBc0qio+c7iLZNQaNVg40G
         xaqoz8Etq5V1OA7foUwFckPx6eJ+X1U0de0iSpgxLTlbJHhIOULez7CInhCkxWowoW7g
         tD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZewNcWS1CBuE/TOZhf1B+A3aeLfdjLjA0yDv/ensoA=;
        b=OlOd3K7EbYboiUR+0mP3afQBNRzLpdDeX99FgFsJ54QQYxVRb2fe1FjbbQTG2PAsXH
         KfzwZIYWFQe18kB7rmWJkmQde5/2hG2uWQUK1G7R1i45sW32uJicpKqoiqgNSGNYuAzX
         pgyXa/UN8+80r7t4neRfD6AJhO0flG3JSRSKPJfYUYEMmzlcDUum6OfdzLntfe4eiohe
         hDc5yXoQXyHWz6Qyz2qqR3pLoOm33+4iDnJpFfRYw1cy45KaV/Z00R9wDWy1FXBYDw1Y
         +uhgVpRsTlk5L5Ha2Ng9ycAB6uBAczfQTb8siAy9uBdvJVFOsDs6P+lvg73mmIDVYByI
         vmVA==
X-Gm-Message-State: ANoB5pmOG5WTaKptaoxIUBWO+voQwKAMEFBTStvIgqVJiTBoL37OjHSU
	70WGaNTC6RzSy7rhgOgyCZn4srp6yWckkQ==
X-Google-Smtp-Source: AA0mqf4o5KFdSk7TJdSynDPEf9pXWVngFsl1g1F+1O1hVglMn55dJQ9L1o8xYIIQ7bdnajpQm2ezsw==
X-Received: by 2002:a5d:4844:0:b0:236:71ce:a49e with SMTP id n4-20020a5d4844000000b0023671cea49emr12096315wrs.257.1668542925413;
        Tue, 15 Nov 2022 12:08:45 -0800 (PST)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b003a2f2bb72d5sm28534647wmo.45.2022.11.15.12.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:08:44 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH v2 4/4] RISC-V: enable dynamic ftrace for RV32I
Date: Tue, 15 Nov 2022 20:08:32 +0000
Message-Id: <20221115200832.706370-5-jamie@jamieiles.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
References: <20221115200832.706370-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_120855_944555_DC9F3A81 
X-CRM114-Status: GOOD (  10.40  )
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

The RISC-V mcount function is now capable of supporting RV32I so make it
available in the kernel config.

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..5ae4f7ce2a05 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -129,6 +129,11 @@ config RISCV
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
+	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
@@ -274,11 +279,6 @@ config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
-	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
-	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
 
 endchoice
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
