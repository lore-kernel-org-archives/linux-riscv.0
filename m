Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E8BC04A95
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DhLiAbVscE4JmelgzTlPYeOySMnXOwN7IS9U8FVgMys=; b=It0Ii9pJAI8C2R
	do1IIJRcUdWrywnkSCELifrxF6LW8koW4frjmdTzyZPCzqg2Gl8BlM0z3ZxZdadug3oRHpOVfHA+J
	XpUbKF8Ap1t/DEGg0amidYz4TXPk33YgdZKA7vzAb1zpG+bw5FafDbA1JJ8+A3CkDbMKlRiKzn5wW
	Hxh6BXOqd/8rPg7GZM9S34sH8WTYpvQALUb/7liq0XOL0SiolYjLagshXYgv+7I3J++xrVQkJ+Wo7
	vktFhbA8uXJYDsYaGWz4MKe2iCl1l8wMek0gjWJJy7LdexIUsSoV8OYKEpYfpUh/JIgH8RuJ5j3I9
	Op2/pY+gP3eyXwX2ruvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWzU-00GSYi-HR; Wed, 28 Sep 2022 13:20:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWzR-00GSXd-Qo
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:20:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 88so228010pjz.4
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=YIgtrfsgGaKJoOul8/+7+ZQM0/6XLPS1+z+ruN1Thic=;
        b=ZciRUDwisn4s8h1233v+/GBlhbzwmk0mRYJxdgCKLEdxvsNz9+8XdsAbs4jfHaqY99
         rutmU7qAX2S1lZ+0G57e6elGp/ncTnqWVd9hMbw7+WOiFJ8P37UzHYHud50X6MdnmUJD
         3fypR8ZZryDbb0wpDx+rysg/p0oBxmcLsm8d4ibOFPElUVjH4jvVCJTKqGoI/Xnv/iXz
         FbJaBN5yHQHqYHw0Xslk1wvw0yEs+1RNe9YeM4mFkcW4GAc1liNlFlDXnN2NbdSLJ4ZF
         wSNYHqeiYw734Oeg53x9Ndo0f+dptxtqHwcQm0sj/RukvIdU0XBbsp68+JzZn4UcvjKn
         RgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=YIgtrfsgGaKJoOul8/+7+ZQM0/6XLPS1+z+ruN1Thic=;
        b=wXmBVOGEAYSEQD501tzxBWIuQ8y2rhHbcfJxw56az2QHo0uA/rkpZLWfaUzQs0QZ/I
         TzfVRL3OGcoAbqPpHMhnmtGtQVwqjNjgZow/8W6B97Nk2IdSIseDCI7FD5Rts6poiRRs
         zLSf/jXhFGM+VjZHGfnp1zbiGhlxKYDwjoolocR7wE8FPMvsDKWWpe/7uLHRPzqthGB5
         HmAF+/54kS80lzYrSCvMwyyue7OavkV7+D86s3uBtMzujfr5i78gXGx7SOb+oGlAiM2g
         fkMKzpbJW7CASpHWKNIIfgm6JGglQ2MT4z1QP1f8Y7KDoOzjYXoXxkc5jMqmHhNozd2Y
         s1Qg==
X-Gm-Message-State: ACrzQf0uyLVd8dR4cN+Terk8NfV/E4n26VVenvSEGafDp7/x7kNKExAj
	rmtb5L6FJm3m2QFxsK1lFB+FUaTNj7jWyQ==
X-Google-Smtp-Source: AMsMyM5ZlUj7Aui5iwMVK2gjrsChIwApjvvUxixTrogY7WpjlgP0uBTvBZnBuhkg/x02O3h6k1zXyw==
X-Received: by 2002:a17:90b:4a50:b0:203:1204:5bc4 with SMTP id lb16-20020a17090b4a5000b0020312045bc4mr10628115pjb.79.1664371237960;
        Wed, 28 Sep 2022 06:20:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z10-20020a170902ccca00b001784a45511asm3670930ple.79.2022.09.28.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:20:37 -0700 (PDT)
Subject: [PATCH] RISC-V: Re-enable counter access from userspace
Date: Wed, 28 Sep 2022 06:18:07 -0700
Message-Id: <20220928131807.30386-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_062042_075488_1BE8FED5 
X-CRM114-Status: GOOD (  11.42  )
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

These counters were part of the ISA when we froze the uABI, removing
them breaks userspace.

Link: https://lore.kernel.org/all/YxEhC%2FmDW1lFt36J@aurel32.net/
Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6f6681bbfd36..e45daffbfb36 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -645,8 +645,11 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 
-	/* Enable the access for TIME csr only from the user mode now */
-	csr_write(CSR_SCOUNTEREN, 0x2);
+	/*
+	 * Enable the access for CYCLE, TIME, and INSTRET CSRs from userspace,
+	 * as is necessary to maintain uABI compatibility.
+	 */
+	csr_write(CSR_SCOUNTEREN, 0x7);
 
 	/* Stop all the counters so that they can be enabled from perf */
 	pmu_sbi_stop_all(pmu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
