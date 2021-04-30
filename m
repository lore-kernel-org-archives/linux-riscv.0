Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBF8C43460
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F7F6145A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F7F6145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLMNlh8ASTAF4y7SjthTPjF/tN/sn6yrRMpq5RusiFw=; b=h7Hux5zRhr7pVOf247s0eiMvm
	gVWLZR7rwn4ytMHEWUaf4ELJ5E/vlC06wFy2QT6rxQllAr0PnWXkPgJ+Ci5WzjrhATdt0YPmJeFQL
	twumylqb3ThyI+BndiPRz19VjlbRyDM71dA5ZO9gK67Y0p2wJEkiUd1f2LMDWlfQnHrdG9jhfuUIN
	M4ohM2OHOGRfYi4iUqPAGineNbdsm4dkShWhyhE0dDUQYqB/f8N2T5z/V2jbNNoZL2DbA2ox0pVIs
	qcK6i7woqRuRzqeKWCLfqYw2i7RJ58clJOdT5yR82C+R7AF1pxVhl3CQ9lVcGpo8DWPU9inxzNGvo
	bpZ6mrWnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO15-007SwL-7T; Fri, 30 Apr 2021 07:56:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0y-007SvB-Sq
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 07:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=8E9W/zXFP0iybF5XoBES92V5uXSv4X3uFaHDrf+UAwc=; b=Gzle+A9zu/8y+K0/jWcpoVfg7E
 A8XhSodSJNck7Ursp8ASsWuoyIyEzb47iBMIILl9E+7P9I4EcML6wLZ36dk8o9E369vQOkb/nzzjw
 df67/XlvsCvf5MKwvnHuGKNh7IDEPcUaZFnRiGlBPHQ8AZ1/J29c31UkzVhN0TW1jEgbngWYyHOKm
 ivqzPdT479fC0VP2OLSkqAypMfgznRkp1vGW92q4pUjcPmsGntiOvYsAtyVIVEJ1TgW/+172uXFPe
 Ax1d+JlJ08eTlaYOLr1gP2TdL7dPV7XjINJ2TNUavwwXtR84j4a63U8qy1kFIP6KWna+BkscYbwHE
 i6TvsOYQ==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0u-001DWV-QU
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 07:56:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FWl4T0Y5czBtGb;
 Fri, 30 Apr 2021 15:54:01 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 30 Apr 2021
 15:56:22 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next 2/4] riscv: mm: make pmd_bad() check leaf condition
Date: Fri, 30 Apr 2021 16:28:48 +0800
Message-ID: <20210430082850.462609-3-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
References: <20210430082850.462609-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005641_057189_FEDB18B5 
X-CRM114-Status: UNSURE (   8.72  )
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

In the definition in Documentation/vm/arch_pgtable_helpers.rst,
pmd_bad() means test a non-table mapped PMD, so it should also
return true when it is a leaf page.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f489e412f..f7fc47c58 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -160,7 +160,7 @@ static inline int pmd_none(pmd_t pmd)
 
 static inline int pmd_bad(pmd_t pmd)
 {
-	return !pmd_present(pmd);
+	return !pmd_present(pmd) || (pmd_val(pmd) & _PAGE_LEAF);
 }
 
 #define pmd_leaf	pmd_leaf
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
