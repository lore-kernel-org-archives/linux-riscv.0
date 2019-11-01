Return-Path: <SRS0=5eSd=YZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45D1CA9ECB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2019 02:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 879782086D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2019 02:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHQnqav7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cthiwFBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 879782086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Aypa2ZV9cQgxq6iROeX/lQG7mCYmr7YJPafRWF0eamQ=; b=KHQ
	nqav7hLVLO/5Zqzib8QC1Dgz1e7Vxc1DdwpyjaeTpPnQ8ui68uoy+Ov2HXvU5gp/RtglwuL8j3pZ+
	05QstDOh8uI67iASL2mqnM0wHDE+bZHAYNvdWwvg00VKF7OyJhD8GXkh1np0dCS1ZaDZxQQFnvIFv
	zsLF/ajGNpw1FNKHDdYVd4KaxKifMC0HY+oztNtdPoZJSOfC5xYWv4Vb3Ysw6wVUCLYSa5gOroPSq
	48BnXi0HfKEbnAW2x4GhfC77RLR8iW5QTMUKxq5DPX0cxU/T6DMSVdoBL6PWGL+dFsWFoKIEDBPa1
	tsxp1hgaYKMHxOzHJp8gU9tPPOcQa+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQMYI-0008Gu-9f; Fri, 01 Nov 2019 02:20:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQMYE-0008GQ-VL
 for linux-riscv@lists.infradead.org; Fri, 01 Nov 2019 02:20:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id q26so5905461pfn.11
 for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2019 19:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=0++fdwXA964df6WT0EpmnfbVrkeavF5iL05D8ZDEb3Y=;
 b=cthiwFBTpa5nGQwVXdgxJZ6QEZZVp3bOmwgoC1+VyDtLbfMKg9jFI6ldO5fuux5o4M
 Tix+g9SKdKO5uoABiZJIG2nEEWrXVG5j487Hcq6VsL4iU3qHH1qI3U189YpFKEAV2iVg
 BZx5AkGD7B5QHS2h6WTbwY0zD8faN/6hC888YR1yjv5ujy0BXvH1oDKErPvtV6eHqeWv
 qbUrUWRSlFR5++r9lyFD2bXFaB3oX7qCC20opvVM9l3zXIrZNsKQJlthEgwewGtIBq76
 76G2qY6DIxMQvJ4DfgxhHbKVXBX72oN1GiHb0KbypHEbNK7xYuQU0ba4SLnHu87yXshz
 Yzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0++fdwXA964df6WT0EpmnfbVrkeavF5iL05D8ZDEb3Y=;
 b=qxu3cLC0zs/FIvoSpLZbTIMZBuuctSVziP9fw8F97y6t5Xabp3ULzI+9E9fDkhy16w
 IqWGjvCceK5mVp+PRwCCAjTkFk6evfuj1Dk725gtRGxdcej5XZLd4rDGOiTzYdf2qTUJ
 lBt29sOmUMnKHaSTLxGGRjFGeFTkj2wtA26UFES/wl3bzjXQCVC9g7EkI2ySg51dIZhf
 qBw8AyL4/rPbzsuaMiWfyin+e457Ur2uLOj48ZCvlwR78H9EUX81lxMc5wCYJ/azwyM1
 mfB7AY18ZpPnZCosceOzy8FYX9FO+zeMeFSn+ssGmvWe0ke6PeZhIJoilMg2pzUvVD1f
 M+lQ==
X-Gm-Message-State: APjAAAW91Nm6JOF2GhTRWND3TBXZhtTL98wkiVAsWn5uqt8F2BQUAR82
 nRBQ42Od3etbdBArEajMRn8hlQ==
X-Google-Smtp-Source: APXvYqw+t2rWbo+T8aG8q7S3AMYOKcWAgax2Z847XqeEbcW4ejHds4rgIOs5TYC1DFOPCiYZ/UJjIg==
X-Received: by 2002:a62:e70e:: with SMTP id s14mr10821293pfh.182.1572574833889; 
 Thu, 31 Oct 2019 19:20:33 -0700 (PDT)
Received: from gamma07.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id l3sm3966392pgo.74.2019.10.31.19.20.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 31 Oct 2019 19:20:33 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@sifive.com, Anup.Patel@wdc.com
Subject: [PATCH] riscv: Use PMD_SIZE to repalce PTE_PARENT_SIZE
Date: Thu, 31 Oct 2019 19:20:30 -0700
Message-Id: <1572574830-11181-1-git-send-email-zong.li@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_192035_039392_4E196EC5 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The PMD_SIZE is equal to PGDIR_SIZE when __PAGETABLE_PMD_FOLDED is
defined.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/init.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 573463d..9a9b01a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -273,7 +273,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define get_pgd_next_virt(__pa)	get_pmd_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
-#define PTE_PARENT_SIZE		PMD_SIZE
 #define fixmap_pgd_next		fixmap_pmd
 #else
 #define pgd_next_t		pte_t
@@ -281,7 +280,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define get_pgd_next_virt(__pa)	get_pte_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
-#define PTE_PARENT_SIZE		PGDIR_SIZE
 #define fixmap_pgd_next		fixmap_pte
 #endif
 
@@ -317,9 +315,9 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 	uintptr_t map_size = PAGE_SIZE;
 
 	/* Upgrade to PMD/PGDIR mappings whenever possible */
-	if (!(base & (PTE_PARENT_SIZE - 1)) &&
-	    !(size & (PTE_PARENT_SIZE - 1)))
-		map_size = PTE_PARENT_SIZE;
+	if (!(base & (PMD_SIZE - 1)) &&
+	    !(size & (PMD_SIZE - 1)))
+		map_size = PMD_SIZE;
 
 	return map_size;
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
