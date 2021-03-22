Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF2AC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9536196C
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9536196C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka6Zv1TTI6tuoWgZMRySKRG2ctcNjjTBSHOhy8LRpDo=; b=IHrdMs95GURd5hqDtbD9WOB4e/
	sJV98/aQvurlN8kKjTkT2t4DNoX2Wr93Q9puNLlfuRqwnURM4LALNPxvY1eaRbTbBVEFzAe4pdJSC
	ST+olJQBKckB8R8ArM9nIIAcY2gRPPLxZU3bX1rWcWnovxpBMTb7jhBXJqBWlxb0t/sMUaMNzG3pr
	898WatzVuFLjzDanDneP7XZKWJXhO/Jpdgln10QZA0Ksrl4DPsbGID2AylCOE7t49cblTOkvKJAxq
	M71JzMJJFvutZdyyRrUF+GgN2qv6FIRmwegy6HMVgC7obH79UqAnQSkEyOSugfzK4VRBdemIW1TAQ
	vrPcAQMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLWC-00BnUb-F6; Mon, 22 Mar 2021 14:26:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLW0-00BnRY-Ag
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 14:26:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id e14so6671495plj.2
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OXG2jhc/L266h+eDuNMS7RBvb6hdOralkqAGJvSOmcY=;
 b=HFHI8alDDdXLXxafy/wDhqzj3nF6OsqZYvrA1D0UX29pJcDNEby2Y8A8sVDCRFHVL7
 fczxlIge20Ki6wN4Lcrx90tejlqamu1tx4vCYlDAUtL97yVKpGzKi42yv1hIsTZ2edVa
 m3+cHrCR0q+641xD7kJAm2nQTOtYhyr7BD6V2mh4TviLgSpBJTtEOSrNZcCQPsykc3Oc
 mnuioKrEX5Q+RsFDx6ssKFqTGNZB/EG+hSih2WMGIrD3gzcAPJBjpP/uCL27X80/m6YU
 czmC8F96c0Y+tZBUa+4wEoMFTu6IAxRBNK3+EUOUzQ0d1iSqFxUMvxemhpEU5wPrfO1/
 g98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OXG2jhc/L266h+eDuNMS7RBvb6hdOralkqAGJvSOmcY=;
 b=XDiOXecdIopa0/Ky5dBU4HolzWfTjXWES78Wwuf6IjLhYxL1rUMPTYfcy9Vh4rW3OV
 65YRyPSlMiRXk80TVZNH2X4TBheKCuv9CMtuk5mVINfnVrdbjzQDZewW/tNRdwxCZGxb
 Lv2ZfPYwvQXxlvnVrBIVZbG3wKr5ATp9vpS9Zjge80FfB3oeCfuJQg6OOxz5r/jG5PZ3
 fUIAKKjDmtX10lOKMMtU86GEGCQPSoBKE7oqZkL2RCRnXKzcE5SM/chkOUmtH3B6mPcu
 GQbuiR7PawPpYfyAbW5zwr6T8JK7Xbj5T5LSA/0WVTUKY5iImhqk4BaMaNKA3dGGmMr9
 ALrQ==
X-Gm-Message-State: AOAM532psu2659OEXEhDsMziLp4qW5zLkftGbK/dYcxJa+Id+TgbJKL/
 lC6aeYdx3omV9z7bQMwySbNbKwcLzj/sX7k8
X-Google-Smtp-Source: ABdhPJx03d95CUmUU1yR3nzuLyFA2ZRPQIPq6D/Px5WJdrHp+P6HXSaeAcq9PbBPwHWEAI8UApO9eA==
X-Received: by 2002:a17:90a:31cc:: with SMTP id
 j12mr13413385pjf.203.1616423202713; 
 Mon, 22 Mar 2021 07:26:42 -0700 (PDT)
Received: from localhost.localdomain (61-230-29-29.dynamic-ip.hinet.net.
 [61.230.29.29])
 by smtp.gmail.com with ESMTPSA id v18sm14261971pfn.117.2021.03.22.07.26.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:26:42 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 5/5] riscv: sifive: Apply errata "cip-1200" patch
Date: Mon, 22 Mar 2021 22:26:06 +0800
Message-Id: <1616423166-13857-6-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
References: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142645_113273_DDA81176 
X-CRM114-Status: GOOD (  18.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

For certain SiFive CPUs, "sfence.vma addr" cannot exactly flush addr
from TLB in the particular cases. The details could be found here:
https://sifive.cdn.prismic.io/sifive/167a1a56-03f4-4615-a79e-b2a86153148f_FU740_errata_20210205.pdf
In order to ensure the functionality, this patch uses the Alternative
scheme to replace all "sfence.vma addr" with "sfence.vma" at runtime.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig.erratas           | 11 +++++++++++
 arch/riscv/errata/sifive/errata.c    | 18 ++++++++++++++++++
 arch/riscv/include/asm/errata_list.h | 10 +++++++++-
 arch/riscv/include/asm/tlbflush.h    |  3 ++-
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index b4146dca50fc..d5d03ae8d685 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -30,4 +30,15 @@ config ERRATA_SIFIVE_CIP_453
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_SIFIVE_CIP_1200
+	bool "Apply SiFive errata CIP-1200"
+	depends on ERRATA_SIFIVE
+	default y
+	help
+	  This will apply the SiFive CIP-1200 errata to repalce all
+	  "sfence.vma addr" with "sfence.vma" to ensure that the addr
+	  has been flushed from TLB.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index e27391823f0f..f5e5ae70e829 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -29,11 +29,29 @@ static bool errata_cip_453_check_func(unsigned long  arch_id, unsigned long impi
 	return true;
 }
 
+static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long impid)
+{
+	/*
+	 * Affected cores:
+	 * Architecture ID: 0x8000000000000007 or 0x1
+	 * Implement ID: mimpid[23:0] <= 0x200630 and mimpid != 0x01200626
+	 */
+	if (arch_id != 0x8000000000000007 && arch_id != 0x1)
+		return false;
+	if ((impid & 0xffffff) > 0x200630 || impid == 0x1200626)
+		return false;
+	return true;
+}
+
 static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 	{
 		.name = "cip-453",
 		.check_func = errata_cip_453_check_func
 	},
+	{
+		.name = "cip-1200",
+		.check_func = errata_cip_1200_check_func
+	},
 };
 
 static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6148d34d4245..5f1046e82d9f 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -10,7 +10,8 @@
 
 #ifdef CONFIG_ERRATA_SIFIVE
 #define	ERRATA_SIFIVE_CIP_453 0
-#define	ERRATA_SIFIVE_NUMBER 1
+#define	ERRATA_SIFIVE_CIP_1200 1
+#define	ERRATA_SIFIVE_NUMBER 2
 #endif
 
 #ifdef __ASSEMBLY__
@@ -26,6 +27,13 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
 	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
+#else /* !__ASSEMBLY__ */
+
+#define ALT_FLUSH_TLB_PAGE(x)						\
+asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (addr) : "memory")
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 394cfbccdcd9..c84218ad7afc 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -9,6 +9,7 @@
 
 #include <linux/mm_types.h>
 #include <asm/smp.h>
+#include <asm/errata_list.h>
 
 #ifdef CONFIG_MMU
 static inline void local_flush_tlb_all(void)
@@ -19,7 +20,7 @@ static inline void local_flush_tlb_all(void)
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
-	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
+	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
