Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BE8CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k7pKNSkgg7v+ZDE1ULxonFeRwUxD3a/d5mK/CsPRse0=; b=gIOVonuRGdH5ED
	baij0hZAx3xZLS8wIUJE+l+83VFb4GyEAGU+buNcplyIn9eBubdlhk2RQC0vLIsV8PPCNzkLzRGUS
	luVJTu4HPRPjdQW6xY7nbLwwQixgkbkPNE9UM5eKWT5PSwh/Ti8WZMFicCqL5WicrMqhBw+ak5aS9
	rLGP/H2o7KFHOIqfqJhdFBffeT7IPNAVTZOeAjFnwyoxDzThQjRSpEziQh7/FwEaxUr/u0dyBGm8a
	1e4AuxBLnC2+8+p2QWLpgT8sBklJttXKeiSsro0srzTs4yDBHbcEMnzvYOsx9mUjMGDKj5+ekAc8H
	k0qrU9+1IgalCCdv8vxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmO3-00000007XyT-0kj6;
	Fri, 15 May 2026 06:51:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmO0-00000007XxR-3Nro
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:51:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3684a6f3b0bso258274a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 23:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1778827861; x=1779432661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kj9jmbyJw9FvmITdQiF7/TYkM1yUzeyIU1nsfZGgTOo=;
        b=f4lim8m/nfnk2XajQzFGm9LvbDlJmPwtK21hlne8TOQquP+EVylbl+2d1Jx0T7wzWf
         FOmrPkmeeZAjsogClgApY5lZclgd6wcTNokLFvYJDHkhG+8Ee3ze73lIpQbSF0vNFuAj
         9OVuq8clixWqZpexUixJiDbsD5EcDRp/74cpbICjaXUQdH2P0TdVoVD9ueJkxKfEcXNd
         21+PNocPUkGAzB8LHAnIOU8DZjUxAdjUplVbF9Bm8mdbhLA6ZrBzPucBvey+9YZ9WWB/
         hmEr++/SNDTeqLI/w5vLN7zwbV94rMOoPyWQ7597ssdHhX3cFO/P+JMgZwKRavaylry6
         lS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827861; x=1779432661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj9jmbyJw9FvmITdQiF7/TYkM1yUzeyIU1nsfZGgTOo=;
        b=Dv3fEfeDf0/qR9tFxHP8j/Q37fWEjXA+/+c1itKXQMmuJGsG3kVLDS165ihZrYW9Cc
         2RYCpn9hhKr65hb1GQb/BOxoLFv8f0k3uu/J4j84eciwX5KvXZ0TnReRIdFtH6JJWP+z
         xRxPYAbEuWDbkpo4GwCLOSeXzW71S4/JeSVuuKEqDwFoJPShdwwgm5AeMuabauI31WHv
         0Uhu5wafrfRaXy3Ub7AJ3A86CXTYakRCZPd0KMeVTbZgbDYkFu7S33wJOk5zdiH+eawD
         RCCtCXCpQ4/KrmV6WVAJqETFawGSmGv7a6aS5c8AY07xull8uemkideStDKa5YWuNKJC
         C3gA==
X-Forwarded-Encrypted: i=1; AFNElJ8/XPilR9pKSbO1UqWOJ6VQ1Wl1nML8LlBpXF2oMvaltHPIewMvtGnJ8TuYq2p3U4uhwVU1C3M5fYGNlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyioLoE8/HAdWOsPPsgvtBtwLtxmZ9h/rXOpdZ1BAUU0X0lItf0
	2aDqYuxa2lXq5VdytWa7s8/bPl+O5tocgqnkPS/34geZHRrjx5fhELOjWnie4wBDOac=
X-Gm-Gg: Acq92OFk3X8JyfUi1YyNIbCztf4CJHHWUXczvvg04JQiimQ2UXmSQvcf26Z2csMRMeN
	wqFVm/uhSbC51iCohpGKADq/kMVmgfx++GQm8AEJpt2SP6i91e+wXUavafhEJM5XsWJTFmLaBI8
	Iz0+PrkSdgMFUbrqMoHKi62iV9UPKqyUzFXH6fF426+zmScrNQ2EAm88rAy+iL05MyNOciU9ZYR
	4fHfmBp42LIf67yefoap+OescQatAfFIoqJgBHrtUGJNw4zY6G7fRBrgsyIdAZQY6XtgsP6TjF9
	aVmAxw3ZzrosLY32peBFyERgHl6QI4VAhYgrzdsCOS3ZSrgKOsJLjwNXmmjJnDAZC1zHjs9vBNn
	k05IfYnDCi3jms8J31KytecWdjMArXtRfGusH+yWT1l3rkicALXlJgxlM3o389D8si5xVwHKRmB
	WKPhy5iUnsRZL2JMYnNZfrnReI7oQX4Q6dxo4Hq5hpqx0PfjJf31lq9eFO5kh6Y6JX
X-Received: by 2002:a17:90b:4b8f:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-3695149a001mr2017973a91.9.1778827861236;
        Thu, 14 May 2026 23:51:01 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm1734353a91.2.2026.05.14.23.50.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 14 May 2026 23:51:00 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	tongtiangen@huawei.com,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] riscv: mm: exclude invalid THP PMDs from page table check
Date: Fri, 15 May 2026 14:50:48 +0800
Message-Id: <20260515065048.94564-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_235104_849957_FBC21CC5 
X-CRM114-Status: GOOD (  10.32  )
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

RISC-V THP splitting uses a temporary invalid PMD state where
pmd_mkinvalid() clears _PAGE_PRESENT and _PAGE_PROT_NONE but leaves
_PAGE_LEAF set so the MM code can still recognize the PMD as a THP split
in-progress entry.

That temporary state no longer describes a user-accessible mapping, but
page_table_check currently treats it as one because the RISC-V PMD
user-accessibility test only checks whether the PMD is a leaf and has
user permissions.

As a result, when a PMD-sized anonymous THP is split during a COW fault,
page_table_check can account the invalid intermediate PMD as a live PMD
mapping, and then account the replacement PTE mappings again when the
split installs the PTE table. This leaves stale PMD accounting behind and
later triggers page_table_check failures such as a non-zero
anon_map_count when the folio is freed.

Fix this by tightening pmd_user_accessible_page() so PMD page-table-check
accounting only considers leaf PMDs that still carry either
_PAGE_PRESENT or _PAGE_PROT_NONE. This preserves the THP split semantics
required by the MM code while preventing page_table_check from treating
invalid split PMDs as live user mappings.

With CONFIG_PAGE_TABLE_CHECK=y and CONFIG_PAGE_TABLE_CHECK_ENFORCED=y,
tools/testing/selftests/mm/cow completes successfully on RISC-V after
this change.

Fixes: 3fee229a8eb9 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
Cc: stable@vger.kernel.org
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1725f0861f6c7..88c599fda5779 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1209,7 +1209,14 @@ static inline bool pte_user_accessible_page(pte_t pte)
 
 static inline bool pmd_user_accessible_page(pmd_t pmd)
 {
-	return pmd_leaf(pmd) && pmd_user(pmd);
+	/*
+	 * page_table_check() must ignore THP split invalidation entries created by
+	 * pmd_mkinvalid(). These retain _PAGE_LEAF so pmd_present()/pmd_leaf() stay
+	 * true during the split, but they no longer describe a user-accessible
+	 * mapping once both _PAGE_PRESENT and _PAGE_PROT_NONE are cleared.
+	 */
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) &&
+		(pmd_val(pmd) & _PAGE_LEAF) && pmd_user(pmd);
 }
 
 static inline bool pud_user_accessible_page(pud_t pud)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
