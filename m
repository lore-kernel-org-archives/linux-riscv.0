Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33849C6FD1B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mew/DP1jtzytLGY8D6XiLunXzvqxXouwXYRXRUwzN+M=; b=olCJRN8iFDqTuq
	Hwkdx0vNw2ginpzMPysJQrDcsc/G7pYX00U5lNgPNlJWRpktVsRf/Q+8jlkdWTMXMFOUwUlJp4N4z
	D1fAkDNR4/HpGwWz2oM3ar/hE2eb5rQEmFvJC0twLH/REI3FBlV1i/eCdxGrIvT1qhXBNlfU7Xb8N
	9Mse1J/EIV2MNo+godoNw8Ls3r1ZaBgrp8PoMAttI85DF00FXQ2gvSHyRfh5zKJhOOwOdGTTqTRfQ
	cY+yqal7d9ywEmo5YMVzj0062ykMAgSuEJICvwS3zyndSawcU/rfi4kAm6KF/WBOY3A2rZhntZCUw
	GjjOQg5o4iKySP2Amifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBm-001p2T-8B; Tue, 07 Mar 2023 17:33:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBf-001owL-Sv
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:33:22 +0000
Received: by mail-pj1-x1032.google.com with SMTP id oj5so13945462pjb.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 09:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=N2sFEe/DZOOTmqQ2KzWbAd49gMYYEl4qwuPAnxCNlwsSipJ8FFFI+ST1vElZCapdAs
         cPmu+dy2+lyzcCJ2JNdQ26ckeV4hwzFjK6OSbM+hXMZRbio5Fh2cHzjlpwMbt/XkbaS3
         jwONdr4SDUyNegp3VWRHtXioT2NcyzSecpSZzS0JNoYY7XxURKSZkUZt4ODxMeSoEXLF
         pzIldFU6uiBLhu4k9yqIcbX9k5NDnqkaTUbQwnOV6/xHaANYJnA5ShLR8Mmq1mTIlw/Q
         oPQfsf3ksa9STouiRNdQq9w6/V5Fh7zIBKTjhL513ErYBJewsXw2iMYxEQZOKYkqlkZ8
         J2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=lQdE0JwU0cuqNlLa5ulU1kxEG/gYPPl++Uilc4UJ/ezvepO0uSKWtv84/1DojwBwiL
         DYh33smaScsTtc2W0+Ok0l4KjmtRNDAPmrvPxm1qE1U8k2dvqT5kMEFA41n2SZNdd0Rh
         JOjAFS8YgzSCdB5PInX0zowMM1BZCoCugp9L78Hm9Iu6ES3JiYL9jHXwq4hie8B43D9s
         yxAlm8c6aoSbNyUCYBkd+FQi8lT+PkQpprLPjpLvQTZII+lfjkKpcuRPNeAIw6N1Lf5q
         kEmCmQRTiSbcBG6wLBLW4oTBVR/HWsSj1IFHMdtYvA8L5XfCF+NIFArMQQkS/jEI3spx
         i8FA==
X-Gm-Message-State: AO0yUKWp/YLMP1XWAKyS568W3JKRrLm+csK20yu5NUADGKAL8RQXjr0O
	+FLPc28leZkjhb9YOYVfv9v1IS+jqHTFOHYYH14=
X-Google-Smtp-Source: AK7set+kdtB7oESn7B1ADnlc2IIgT0MPiKeaKW9YLHpupL+avmlsX8ulisLCF4jrX2uLwkMDBwFDsA==
X-Received: by 2002:a05:6a20:1607:b0:cd:ed5c:4cd with SMTP id l7-20020a056a20160700b000cded5c04cdmr19219207pzj.6.1678210396664;
        Tue, 07 Mar 2023 09:33:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:33:16 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 6/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  7 Mar 2023 23:02:30 +0530
Message-Id: <20230307173231.2189275-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_093319_974962_A07FE54E 
X-CRM114-Status: GOOD (  10.95  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fcd6145fbead..20cec5e7cdbf 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
