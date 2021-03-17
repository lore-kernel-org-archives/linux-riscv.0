Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F7DC433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779EE64F41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779EE64F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+tKzK2r7RvvLGazsDmPu9I5VZ1orw9bxaAxRRP+Hrk=; b=OOHDKS+Cl6Qijqce3hlWXtw0CC
	zn0voLacZ/6W2lAFFb9zYJqq/iEVkX6saEFrWqYxtxSNBDYFIkgXlDPrZcN0tnDIiriEahYPyKWP/
	yyf6lysaN/weZ18X+No5vaktw65lulUt08wz8XMyrr9Fkv7qbRvewS/EoEgjIGbup1x7nNfvSEhLY
	WqXO3v8f2uZoYNd77H7Rwc7x/An2gKjMyUcRnhdl/TYZd1gyQxvdydFNFubAIxAqZdPXQyMV29B6R
	v3tx4T7pFY3sm2JsNgP9ag1dgA4tM0v1TEcTqFvqDo41/9dh8auILP7y20O2BJAJiYpU2K39nLB0l
	/NBqW/6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSZH-002rQu-Em; Wed, 17 Mar 2021 09:34:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSZ7-002rOb-7S
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 09:34:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id 30so494402ple.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z0hVEcb4wLxDO2D8x3mTPmg/ffXqBBYCP2w4HIOup/8=;
 b=FeKJJSpBNOjEd1L/CYHA8GmMvNp5AG8M5YCpelaxSDY+PMnchnXwl+n08lk731LQ+a
 zczWZQeLWcNeoHxI2sE6aE/oaOqTDPbtLjxj5bvw+UAsZ/0PH24c1LE47KxJ5fgZ3XsA
 2t9ACIHUwLhLOiIsabvGvEsKFaU5kUjeKmeOEW2eulJ7zsB7v3vxHE2Pjnr2yF8ZexRn
 EDLUD/U1BwV6kyCiSH4R5qjOS2c8AbfLql9UOXMlIZdgRc1Aj1psqRn3UzivBwXS2Gj5
 k8TP/XKgLz7vEzkFaRkNW3mCiUCfTmO6sflzQoFmVLXMQRYSsG7t49L77Gm9sgh8rSFA
 uYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z0hVEcb4wLxDO2D8x3mTPmg/ffXqBBYCP2w4HIOup/8=;
 b=WlPV4fx2X1zIKQ6E557YJ3Es6Sw26tOfyYXdQetncDr8Iq/FFUArLi//JoI3OKqiu5
 VBrmx86XTog1iQ36fByEdcqYSJ9I8R2YuF6TP0wbC9HBsLWtaSHuhhaBUoSW76+XyP/3
 vezVOf5g8uEYofKvfZfB6RmHrYWQLu8l5Hx5v/DlzGM7vdqwbfr9kCXfFLiLwI4O/ADd
 xqgIcrjyHDiO8qGYoqgtinQ6a0+TQeOjCQynLawUT2GutxJLl2TMUWO0MVTLBZ3NArDN
 JSH9zb7g0g83F3IKmGpWpPtOOWV9n2HJnVXZ+WwhbvhEA2qVssYFIWoCCgvDbmdcvD+I
 1l4g==
X-Gm-Message-State: AOAM531LkiQ2VxqbVC4XIDrnMElnU175ip+TMP1j+374mVDBTT8tnDbm
 2qO19GK0PxiJ4Q6OuU0KBUKKvxOQNo21w+yZ
X-Google-Smtp-Source: ABdhPJybnDSy0WQ+tiQ0n3YXURxFkH+pk8nF3x8S80FxEb0qT8iH0JDgz19HLyBiNCGqv64108EHMA==
X-Received: by 2002:a17:902:7609:b029:e6:9f29:625f with SMTP id
 k9-20020a1709027609b02900e69f29625fmr3805058pll.80.1615973647670; 
 Wed, 17 Mar 2021 02:34:07 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i14sm2149508pjh.17.2021.03.17.02.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:34:07 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 ruinland@andestech.com, david.abdurachmanov@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2 5/5] riscv: sifive: Apply errata "cip-1200" patch
Date: Wed, 17 Mar 2021 17:33:33 +0800
Message-Id: <1615973613-22364-6-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_093409_686856_3F9BA86B 
X-CRM114-Status: GOOD (  17.92  )
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
index a7f0abff90fb..93c6c45f4290 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -31,4 +31,15 @@ config ERRATA_SIFIVE_CIP_453
 
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
index 6c65cd675e5f..655af0cb17d1 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -28,11 +28,29 @@ static bool errata_cip_453_check_func(unsigned long  arch_id, unsigned long impi
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
