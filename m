Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD03C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AHa5d9FnZS/NS08lZcmylJckA6+/umy6crPdll/17w=; b=RYcEjoAo1czBny
	6PcxglI/Q5GrOcN4Q8J4S0sID1brFhZQUMWJeteO8KDYV/qTeFNsyD8/qqkBCgeoEWtNxRGkrzVHl
	HSviZ4JgsQ4KRLKmlx9zLS3mwUHnsUe11lL2RyOuZefauznSFXtXltnPgV2Sh87oUrIgRyh8BiHns
	1+Nifq4QCEWZVjW+FtqJ+Eiyb6HV5X3p6tZYT1FkYAMVUid/tZsBhyMMc8iumqwvv85MlI973wjiH
	kJj0/3y1KGnUfJ/RYVkrBaBYLuBhxsAPNKcbTN1lwDeLBJcarHBtzo0jAtbRTu+MmBXbF3C+HBUNs
	FKMsj86Vhg5y+/rki1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCEcy-006VzG-Pm; Tue, 25 Jan 2022 05:44:24 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCEcv-006Vx3-SA
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:44:23 +0000
Received: by mail-pg1-x533.google.com with SMTP id e16so8103850pgn.4
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=LO862MGLZ98yDMJuhIxpC+uCv5HOIsIT2XWQzc4wEOD+YhgYfLo3fi4T5OMdr3NyZ7
 A8O4BNSuvPu2biUcI3i/RduDrb4T2uoieId0tDlckIQLE7exdUA495AHhNsTdiLkj/ZA
 bPj5q1SQmtzslwSTrAV4I9sb/APKJ82aqoPaPoh1P2wQemDGCOWt4QkPVQ6YPLXG90si
 civyFeqF5H3+kSujPucwrJjcE7ob0yyNVvuTUZxZskPKqFlAn32Ox7BIHCXv4Fty7coZ
 G66E3Fkh4CHX6tgmcvl0Nai5KSgDK6QHja5vJ6dzqluNdDCvnltpiW7v4zsp2yc1iAIM
 p18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=jg7tVi5sg7w4kMP0OrvMsqotduizL7FmtwUkIPTAqBQ5R+zgZuTK90Rge8y+P+gWsc
 vYWgXIeVS0m7eQHxo4U2JAvvXka6/Eyexdi8ERJIBsyhHWbWQUBRVKXwt7slywlkmgIC
 FmkaYH1gfwgMTBKJHLpDmUnlq5PHbhW/fmUmYyn2eLPC7K9qgLlZowuM/3GOw6tDmKQW
 vXA70X3wZ0i8sw1/lerFOmPw0NGPIMrbOsb+8VouEEKck8SLszLqyBuec/kjS1xRb6QZ
 6WZbvlWcwe1r7OPCQgZIHRDAQAb2xzWWoy2fc7rU9wDAEWJ6iL+Iu1wT1GWKV3i8SpTq
 3pSw==
X-Gm-Message-State: AOAM531WWg6fc19J4158smHGKPHL3uRV1ZT/pFfc/gjxagx6iOTEocla
 7dY4aThwNzvbQAlnj3SXoaoTPA==
X-Google-Smtp-Source: ABdhPJzphGPGqBO0jlMxyVd+9rd16Zr9VCh1WBhVt4TakprQyTunIWpOtLENkHSXyjkQ5cHwI/DeaQ==
X-Received: by 2002:a05:6a00:124b:b0:4c7:4d6d:7c88 with SMTP id
 u11-20020a056a00124b00b004c74d6d7c88mr15604002pfi.85.1643089460806; 
 Mon, 24 Jan 2022 21:44:20 -0800 (PST)
Received: from localhost.localdomain ([122.179.14.218])
 by smtp.gmail.com with ESMTPSA id c6sm19524508pfl.200.2022.01.24.21.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 21:44:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/6] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue, 25 Jan 2022 11:12:17 +0530
Message-Id: <20220125054217.383482-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125054217.383482-1-apatel@ventanamicro.com>
References: <20220125054217.383482-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_214421_936515_CE07F261 
X-CRM114-Status: GOOD (  13.00  )
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

If IPI calls are injected using SBI IPI calls then remote icache flush
using SBI RFENCE calls is much faster because using IPIs for remote
icache flush would still endup as SBI IPI calls with extra processing
on the kernel side.

It is now possible to have specialized hardware (such as RISC-V AIA
and RISC-V ACLINT) which allows S-mode software to directly inject
IPIs without any assistance from M-mode runtime firmware.

This patch extends remote icache flush functions to use IPIs whenever
underlying IPI operations are suitable for remote FENCEs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
