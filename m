Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C6CDB466
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Mime-Version:Message-Id:Date:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7HNJ00KYo8zqs0gSj7SboYY8f4D3hOjGbJ1/N1RZFkY=; b=aYSdPn8TVyTkeC
	vYATksLudrIAskWJIK05RYrY58dWKwU4j9CN4weDg1b6vSoWcNOUDxGbV/7OM5ihYobCn7469wGC8
	SkYr1gYC+4WGmwLuX69KSugHJoRmo/Ed32H5nqcu0QUxHjFAst1eQf+0YsQmuuupeiRBiSFjlzzKE
	dMgERR/961vKSnZwLlDjucdPH//IyOS0D+XV+3UClWCvXRLxfufSg51DXexnr/luQo2r7Xm4r3BTT
	6WO5+8Z+fJpoTTxw3XQzJ6gzNhMXqT+lG6K2cPEGlHm/P/z4HGXgdOq2KQGuUKNrUOtDny/FSDNX8
	XqxGNwf2pqfzy2DdgeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgg6-00000008wUE-0KlF;
	Thu, 25 Jun 2026 09:47:22 +0000
Received: from va-2-48.ptr.blmpb.com ([209.127.231.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgg2-00000008wTE-2abA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 09:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1782380828; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=u9Vr69DUWtU2GtQSnZ4vT3lQafTb6BSSmbeeV1i8VZw=;
 b=xUxiG5aDDwYXzKivlqpuTDaL0kxec5F9rmNI5p664NrEvEyZTqoEO4op5U/GMWLbm5QZ8w
 29Nkazb4pkiuEg2hXifN7X/2kib98la15RGdsbt0tDm1/M20gAkTuUnPyRC1KAWji+Qg9d
 2imf3iZ7zqt3BOIODppoDMw041fjAhwDxcmVpEAEW6oTejaJS8hKdMSR4rTKjB/jg/xtio
 J49Duxgxl8h3gW0FSvyjnr6Za/5SSEvOrK6wbPSwHSfonrinC+0iZTRYSL6cTZta6Ch9zc
 OFF71Zw/y0ygDFf6+sN8mkdXi8wpYUkPQtZiMsKXq7DOC5uYlQSe0TU0cD4isw==
To: <sunilvl@ventanamicro.com>, <rafael@kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-acpi@vger.kernel.org>
Subject: [PATCH] ACPI: RIMT: Only defer the IOMMU configuration in init stage
Date: Thu, 25 Jun 2026 17:47:02 +0800
Message-Id: <20260625094702.11558-1-yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1
X-Lms-Return-Path: <lba+26a3cf91a+d4671f+lists.infradead.org+yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.117]) by smtp.feishu.cn with ESMTPS; Thu, 25 Jun 2026 17:47:05 +0800
Cc: <lenb@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <geshijian@picoheart.com>, 
	<jialilv@picoheart.com>, <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024718_848754_47969EA9 
X-CRM114-Status: GOOD (  10.30  )
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

The IOMMU configuration will be deferred if the IOMMU driver
isn't probed by the time. Make this deferral only in the
initialization stage with driver_deferred_probe_check_state().
Otherwise the devices depends on IOMMU will be deferred forever
in case the IOMMU device probe failed or it doesn't appear in
the ACPI namespace.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 drivers/acpi/riscv/rimt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index 906282b0e63c..e4538fa6c2c8 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/device/driver.h>
 #include <linux/iommu.h>
 #include <linux/list.h>
 #include <linux/pci.h>
@@ -257,11 +258,11 @@ static int rimt_iommu_xlate(struct device *dev, struct acpi_rimt_node *node, u32
 	rimt_fwnode = rimt_get_fwnode(node);
 
 	/*
-	 * The IOMMU drivers may not be probed yet.
-	 * Defer the IOMMU configuration
+	 * The IOMMU drivers may not be probed yet. Defer the IOMMU
+	 * configuration if it's still in initialization stage.
 	 */
 	if (!rimt_fwnode)
-		return -EPROBE_DEFER;
+		return driver_deferred_probe_check_state(dev);
 
 	/*
 	 * EPROBE_DEFER ensures IOMMU is probed before the devices that
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
