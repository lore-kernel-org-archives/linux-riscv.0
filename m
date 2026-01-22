Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75ADD625F8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:In-Reply-To:Date:From:
	References:Mime-Version:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RiT7FeaZrR1l+jZpnMhfo3H6V3V64HEp9EV/8+M8cc=; b=gBQorVqU2nvyKG
	LRk+oxHZnLuP8BfnxIXTCCRY4e4MJzx7gJ/7s9+yyxyGmsEaTgr9BnGSFzhkU6WFCKMUKIW/+wkrW
	DR7wDZZTc6YcsGRFy2inMGGeqG9QO6sFq4tP2hQ4HEtnu3Q/xz+0qrx7eAKdrfdlzFFM9ZRozoksT
	sqauIPRu6uFrSpQMxf9OSjZWkN3qpKyi++c61pI6vm3tMVdxftYBW89H/m+r86cub8dpaNEWXrAyF
	9F31E0vMWUP8vqfcFydWKetaNPcHJ00Nqri+mOSMTW81BkMq3OZMd0+xN75Pe1SvyUP1i41xFLRts
	kLl4B6yCbNd/vUtT5SNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDg-00000006aPY-3ivH;
	Thu, 22 Jan 2026 07:35:08 +0000
Received: from sg-1-35.ptr.blmpb.com ([118.26.132.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDc-00000006aNv-3CED
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769067294;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=01FP4vC/jj6alLbiTxMoouO+ZRSgO8bEdY/088MJqcA=;
 b=jhH9+h6AHNS2KkO5f4Zec42IGeHlvuo9vSXwxd+jiKkpEJOKkTi7rWdJOMGHXLKhctyhPR
 VrM7bErmHnwghcMI2vPN6QRu96+Cd+atsZoFvpaV11yiHRg5sNwmaH20M+ihAsIwVvA0l9
 Sg/QFlD1GUF86MUqVG0snmzxsb+rTZ0rOcxR6Vg5VJAO+dyuanMByrag3S5ero+XtR70jf
 niyjNX07WFXktwMWPbnoQM8IxnwwotNp/qOoq/vEMklXOcWsQWm/weqvwfR+Mvs/TXwF6h
 181ZMf9pdCNmBuJd0ry9aW/Nd/IAGZ10BJWmneEDmG7xAbO3VerXEV54v/IdNw==
Subject: [PATCH 1/2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 15:34:52 +0800
X-Mailer: git-send-email 2.50.1
Mime-Version: 1.0
References: <20260122073446.45628-1-yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Thu, 22 Jan 2026 15:34:45 +0800
In-Reply-To: <20260122073446.45628-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26971d31c+ca80be+lists.infradead.org+yang.yicong@picoheart.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>
Cc: <akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<yang.yicong@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Message-Id: <20260122073446.45628-2-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233505_214443_875BEA1B 
X-CRM114-Status: GOOD (  14.51  )
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

The device object rescan in acpi_scan_clear_dep_fn is scheduled
in the system workqueue which is not guaranteed to be finished
before entering userspace. This will cause the problem that
some key devices are missed when the init task try to find them,
e.g. console devices and root devices (PCIe nvme, etc).
This issues is more possbile to happen on RISCV since these
devices using GSI interrupt may depend on APLIC and will be
scanned in acpi_scan_clear_dep_queue() after APLIC initialized.

Fix this by scheduling the acpi_scan_clear_dep_queue() using async
schedule function rather than the system workqueue. The deferred
works will be synchronized by async_synchronize_full() before
entering init task.

Update the comment as well.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 drivers/acpi/scan.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 416d87f9bd10..bf0d8ba9ba19 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "ACPI: " fmt
 
+#include <linux/async.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -2365,39 +2366,35 @@ struct acpi_scan_clear_dep_work {
 	struct acpi_device *adev;
 };
 
-static void acpi_scan_clear_dep_fn(struct work_struct *work)
+static void acpi_scan_clear_dep_fn(void *dev, async_cookie_t cookie)
 {
-	struct acpi_scan_clear_dep_work *cdw;
-
-	cdw = container_of(work, struct acpi_scan_clear_dep_work, work);
+	struct acpi_device *adev = to_acpi_device(dev);
 
 	acpi_scan_lock_acquire();
-	acpi_bus_attach(cdw->adev, (void *)true);
+	acpi_bus_attach(adev, (void *)true);
 	acpi_scan_lock_release();
 
-	acpi_dev_put(cdw->adev);
-	kfree(cdw);
+	acpi_dev_put(adev);
 }
 
 static bool acpi_scan_clear_dep_queue(struct acpi_device *adev)
 {
-	struct acpi_scan_clear_dep_work *cdw;
-
 	if (adev->dep_unmet)
 		return false;
 
-	cdw = kmalloc(sizeof(*cdw), GFP_KERNEL);
-	if (!cdw)
-		return false;
-
-	cdw->adev = adev;
-	INIT_WORK(&cdw->work, acpi_scan_clear_dep_fn);
 	/*
-	 * Since the work function may block on the lock until the entire
-	 * initial enumeration of devices is complete, put it into the unbound
-	 * workqueue.
+	 * Async schedule the deferred acpi_scan_clear_dep_fn() since:
+	 * - acpi_bus_attach() needs to hold acpi_scan_lock which cannot
+	 *   be acquired under acpi_dep_list_lock (held here)
+	 * - the deferred work at boot stage is ensured to be finished
+	 *   before entering init task by the async_synchronize_full()
+	 *   barrier
+	 *
+	 * Use _nocall variant since it'll return on failure instead of
+	 * run the function synchronously.
 	 */
-	queue_work(system_dfl_wq, &cdw->work);
+	if (!async_schedule_dev_nocall(acpi_scan_clear_dep_fn, &adev->dev))
+		return false;
 
 	return true;
 }
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
