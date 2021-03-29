Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D24DC433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:06:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D7361920
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D7361920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zx4nGbO5iOTpTaXGZE1qcb0fn40cnNJ6UayO4nncKjo=; b=GWUPAydSTcAa0Q0uhVNROuE01I
	JUyaSG2cXnbACjaJkm3GkgHgJhHSY6sb7+MMtjF/Sh8GLRl8gEKT6FFRL9r50L76k57dUyLX/7bDr
	gwtneCXCOIbGgMy9hwYmKBVIxlKUt5oaEsmBrLrq65ciuYnpXohqqulxYQT7c36zPsFStStgGS27B
	h1hNFIpb1dkdXjIKwFU5v/xnLcwdwCkysYQOOpjMKgu1QxQJzPUttMWNOXOJMBQTUmufQY2TVy1Iy
	UhszX51sKhoBAkuc8E+CCLAUoVzX1raf+vY1GnongdSGRKhm9CVInxvHhzIdj747v/0f847UXTZfV
	83TFy26w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwGW-000ykI-M9; Mon, 29 Mar 2021 18:05:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQp4E-000ZzS-JA
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 10:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NGC6chJP80cuNHns+gupLeaUsHFLU3CRtN5y/FFIl1U=; b=S5Nn/Mxgh1DB5pYOfoLvpk2/7O
 R6RQyS2sPifwUQnCJZ+sKNfRe5eVTwmyh2YaReV5lupWHJ9kbK9k8gPo4C9xokpDaFtF/MTB0dK4K
 S6ZFJgh9HdmCTkUS9FJ36IcvqPUfOGhFibEXLreesKsv+2gMgQ4HNSc7QA78rn7WyyZ8SujJXDbLO
 s76PubYmPagNVR+ZGox0Sxkky9Ffe5L/zjBTRSOAjPxD4/EdgBp1huFIAxfEybK4fpMkQtidL6AiK
 o/oSU/CRWM6ZAjUvyWWRwF+n60wUdgR4Zd/xc8kaz+Rcf8Ci1VmBv0baFpwuKzZ1bhkheRHhDPWPS
 OvYZxvlw==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQiK1-000uNM-Sy
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 03:12:17 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F7yHj2XR7zkgGf;
 Mon, 29 Mar 2021 11:10:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 11:11:42 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, <atish.patra@wdc.com>,
 <palmerdabbelt@google.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"
Date: Mon, 29 Mar 2021 11:13:07 +0800
Message-ID: <20210329031307.153285-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_041211_261693_949B40AF 
X-CRM114-Status: UNSURE (   8.07  )
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

There is a spelling mistake when SPARSEMEM Kconfig copy.

Fixes: a5406a7ff56e ("riscv: Correct SPARSEMEM configuration")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 87d7b52f278f..7541e44cbb22 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,7 +153,7 @@ config ARCH_FLATMEM_ENABLE
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	depends on MMU
-	select SPARSEMEM_STATIC if 32BIT && SPARSMEM
+	select SPARSEMEM_STATIC if 32BIT && SPARSEMEM
 	select SPARSEMEM_VMEMMAP_ENABLE if 64BIT
 
 config ARCH_SELECT_MEMORY_MODEL
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
