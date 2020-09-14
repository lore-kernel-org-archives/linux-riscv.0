Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C334C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 00:55:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09E621D1A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 00:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vTdEy2iC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09E621D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pVbqMcK5kHJ3rJXGl7+YVQgMnfv+nQsgZ/VPr3uMeXQ=; b=vTdEy2iCqixEBS630kiYCGy2ND
	fpX58ALNKjXw06kwGgQyZF2SzG0LRjIaQSQRUSmOd5aAGZkuZLtp9snrAQz8vSopkLrDLwkj0FjxE
	0q4cK+WCQO4ANR/EIdVMLIAfcSm8lNEPEHq9mW1oC4/siqXeO7mBgglEos2agCQFTC3heFfkq1Wng
	+/Cx/mWqmZPs9SXyKe/Uvb/4I80mK5i4LzmuJZSq7OsAFrEXdAq79iGWtE3195C2GXbB1Yn/2rfj8
	ptdvur4N6/vVFpsVBCLaT0wMw8grBtK28E17ITSa52cPy9KPjr8qdze871o7zMmZweuZUy7O4bIwd
	LdXDsNQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHclk-0003y9-1e; Mon, 14 Sep 2020 00:54:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHclg-0003wk-Tf
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 00:54:54 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2C0616ABAADB640FBCCD;
 Mon, 14 Sep 2020 08:54:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 08:54:23 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>, <atish.patra@wdc.com>, <greentime.hu@sifive.com>,
 <damien.lemoal@wdc.com>, <ren_guo@c-sky.com>, <qiuwenbo@phytium.com.cn>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] RISC-V: Fix duplicate included thread_info.h
Date: Mon, 14 Sep 2020 08:52:02 +0800
Message-ID: <1600044722-12642-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_205453_253030_D082AC49 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

asm/thread_info.h is included more than once, Remove the one that isn't
necessary.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 arch/riscv/kernel/head.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3631147..11e2a4f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -3,7 +3,6 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
-#include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
 #include <asm/asm.h>
 #include <linux/init.h>
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
