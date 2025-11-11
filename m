Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693BCD1297
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRvbKjXmDE+09B9yK9eUhsbCubKcgBP0RQIWp8I6IuY=; b=Ki+jb7TIpsVwMf
	4ck9aeNa+Kc6nK8Uqe27WHwkRBpX2CZaPK/1dZ8i6VrRcsAK8d85HW0TJInrMq5zPxsRNDhBc8e88
	ElfRugbQ4X0ddsL+F6K+jHQUWMlHL74SBKrTuPwiUQbFsTsE37Vx6IU1wjoXh/R1GIsWXSqPD9PPV
	apEq9MLCzpFr9RU2aAlgaKu7RmORmt3UPPOyzBdF91KFDjV83CDoA6S4MeQcFyjKobA1Hq2V/GIY3
	8+vw7GZG/YuobmvguxTHIfM4fdqNppHHrSwTKgYW0cif2XuIez06rry44m54wDDV6rY2ptpIH97JP
	YkCv1r6X7E4zgdpajsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPT-000000073bF-13ac;
	Tue, 11 Nov 2025 11:19:39 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPQ-000000073aF-2GGb
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 11:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859975; x=1794395975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9T0WYmDAOm7giXvF1mgj/3D0HBRvqmglFqNtm8BgpMI=;
  b=Q+mNZCWVdiEGwTkRO3XD+AjGpBsRwosR5zkBC89jPhlkywD8LD8RIOWM
   SMb9DnZmgz5bjnd6fQVDum97Eqv9h49uwKtq87S2AYoEV6UaYOYUgI8HR
   uZXGbR92b9mwHUSGlpEHCwGaPiwln92HvjNR2bv3KYdYJt1/PyDiqHv5N
   WQA3jKFShtVtegYw7FzuxePPjO767jg80fjEwojxDjNDrvTWau2KagttS
   Nb/nvOz5A4mI3qnIMv4iQtqVH0wcDwUjEDaHK/2OoLeuTJMzFDKvnNkgx
   DhrapivjKy/gDj4WvVm0K0ci60d1PjcNeqZkhC2bGSZKvDvte0txEvIfW
   w==;
X-CSE-ConnectionGUID: n2IrFtBAQHOyHa8hdpU0Gw==
X-CSE-MsgGUID: QjHGC9MQRO6V0dlx3xoRIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63922911"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="63922911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:32 -0800
X-CSE-ConnectionGUID: 7KRySQPbRYeXDo4od8bOMg==
X-CSE-MsgGUID: dkfo88vgSVqNB4eYiK/VeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="226200394"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 03:19:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 802FC98; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] mfd: simple-mfd-i2c: don't use "proxy" headers
Date: Tue, 11 Nov 2025 12:18:36 +0100
Message-ID: <20251111111930.796837-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
References: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_031936_612588_E635CDCC 
X-CRM114-Status: UNSURE (   7.47  )
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

Update header inclusions to follow IWYU (Include What You Use) principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/simple-mfd-i2c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 5fd0ef3fa44a..8b751d8e3b5a 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -15,12 +15,18 @@
  * will be subsequently registered.
  */
 
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/kernel.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/stddef.h>
 
 #include "simple-mfd-i2c.h"
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
