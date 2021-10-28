Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C5AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CA860F56
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42CA860F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzCnYs6MtSZx+x0plvRgbQ+aZqFmUmwNT8Oi3+anL9U=; b=CgVahi1uIEyPv4
	DzgJ++OtcXLeY1vbZppLlHezf9C7mKZDPYSxpMtBope8D8/7MDF/+5xXrZRR2xMVzRDxFW4T45r3o
	vhRkAwdqurCvbgwLwlmwmabW+BtMvr0t8+CYytw7OBV5VTcy1hc+L2rwF4mKJszWE4cC/v7bmIBkq
	zNymhA9wQA2yLUbnxV4inksLewCgGZZEmmkRnw8EYKZYedyLc3jihMghsq+/ll+FIn5xNCFuWMXzV
	iBp91l5YHKAq1TVGbE/Qc6d3ydQoulNLKBTki6+pU3Gy9J3wikWOOk1/iU53mQ3MagzLOQ3OfbNR2
	v4pGGsWhdTTF9vEBvtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg8n6-008fE8-IQ; Thu, 28 Oct 2021 17:02:12 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg8n3-008fDe-W1
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 17:02:11 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217374202"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="217374202"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 10:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="466197543"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 28 Oct 2021 10:01:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8A112107; Thu, 28 Oct 2021 20:01:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 1/1] delay.h: fix for removed kernel.h
Date: Thu, 28 Oct 2021 20:01:43 +0300
Message-Id: <20211028170143.56523-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_100210_113679_DC8C92E4 
X-CRM114-Status: GOOD (  11.31  )
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

To be folded to the commit 0d280a9fbbd9 ("include/linux/delay.h:
replace kernel.h with the necessary inclusions")

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/riscv/lib/delay.c           | 4 ++++
 arch/s390/include/asm/facility.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
index f51c9a03bca1..49d510ba75fd 100644
--- a/arch/riscv/lib/delay.c
+++ b/arch/riscv/lib/delay.c
@@ -4,10 +4,14 @@
  */
 
 #include <linux/delay.h>
+#include <linux/math.h>
 #include <linux/param.h>
 #include <linux/timex.h>
+#include <linux/types.h>
 #include <linux/export.h>
 
+#include <asm/processor.h>
+
 /*
  * This is copies from arch/arm/include/asm/delay.h
  *
diff --git a/arch/s390/include/asm/facility.h b/arch/s390/include/asm/facility.h
index e3aa354ab9f4..94b6919026df 100644
--- a/arch/s390/include/asm/facility.h
+++ b/arch/s390/include/asm/facility.h
@@ -9,8 +9,12 @@
 #define __ASM_FACILITY_H
 
 #include <asm/facility-defs.h>
+
+#include <linux/minmax.h>
 #include <linux/string.h>
+#include <linux/types.h>
 #include <linux/preempt.h>
+
 #include <asm/lowcore.h>
 
 #define MAX_FACILITY_BIT (sizeof(stfle_fac_list) * 8)
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
