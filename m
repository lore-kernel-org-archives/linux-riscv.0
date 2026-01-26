Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E644CC88E57
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pdRBmhu7wynyPuPGlE7RvaORhaDWG4ouBMQdzj/26V8=; b=X2L
	+D/ycSTS8cm+ryxyYLpSTPC9gF29YBxLoaDT2v8hgQ9N6VDh7101qHW64Cgddxfgd4lH9IHCk/6aT
	mH/IN0QGSZuQYR+4xCKZQeS4oxQrqbwZ8tC/Mp69h2Kt4QqyZ6Q8Fv8lUKVFodlPddNG5upvKuZL7
	cl2U7pQK0GPoSf/T6DwA7MHMbYY/3HavjyBHomrjFR9iDUQx2BLaN6aSquL7IFv04Awv0898h0OE5
	7fBLaH5lpjdPZIM6zVfou87/l44dtCVj3sh3/6ZocaVSbCJaklw/SCHH2V1P9ETnvX/rAk2NK4gV9
	5E5o3wyqrTNGt+a16PI/oS0DnT/of2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGee-0000000C17Y-37cg;
	Mon, 26 Jan 2026 07:04:56 +0000
Received: from sg-1-37.ptr.blmpb.com ([118.26.132.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGea-0000000C175-1HrO
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 07:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769411079;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2yqg21lLKCVliEF5qtOlAEdet7rXGcpZ87WW4mE12/o=;
 b=THbeQmMlKUpE4f6/9nMw1N8liRgkaihY/TPMDgYMisa1gtB6LaIper8ZLYUxmWGHHjrgzU
 G0UFkKtfI5g2icP/j6/qSSPzJDFm2jnVs2zMugsatOM9MmpNnvGh/zXtqmPT2zkHpxiBgm
 Vvfm+iWZFDyX5djzPxWPTq3nWSPuPyymNk+j+YSRPMjXligWFReuWzAhUifs3WZ4SSHaEl
 MMnqrLHkEWZu534FezsrnwnC1/puohK0zjuw1+obbPU6i5Flfwq/uTCeI+cM5/R1yxg47o
 sFNeYEz/2dRWY5o1w9NDEeirFg4AZhXy/jJ6cF1YC0Wiq7RWA536Y2zB6AJeeQ==
Date: Mon, 26 Jan 2026 15:04:27 +0800
Message-Id: <20260126070427.64574-1-yang.yicong@picoheart.com>
Mime-Version: 1.0
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Mon, 26 Jan 2026 15:04:35 +0800
X-Mailer: git-send-email 2.50.1
X-Lms-Return-Path: <lba+269771205+50d22a+lists.infradead.org+yang.yicong@picoheart.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>
Cc: <akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<yang.yicong@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_230453_432749_74C3EA9B 
X-CRM114-Status: GOOD (  20.26  )
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
some key devices are missing when userspace init task tries to
find them. Two issues observed on our RISCV platforms:

- kernel panic due to userspace init cannot have an opened
  console. the console device scanning is queued by
  acpi_scan_clear_dep_queue and not finished by the time
  userspace init process running, thus by the time userspace
  init running, no console is created
- entering rescue shell due to no root devices (PCIe nvme in
  our case) found. same reason as above, the PCIe host bridge
  scanning is queued in above and finished after init process
  running.

The reason is because both devices (console, PCIe host bridge)
depend on riscv-aplic irqchip to serve their interrupts (console's
wired interrupt and PCI's INTx interrupts). In order to keep the
dependency these devices are scanned and created after riscv-aplic
initialized. The riscv-aplic is initialized in device_initcall and
queue the device scan work with acpi_scan_clear_dep_queue, it's
close to the time running userspace init process. Since system_dfl_wq
is used in acpi_scan_clear_dep_queue and no synchronization,
the issues will happen if userspace init runs before these devices
are ready.

The solution is to wait for the queued work finished before
entering userspace init. One possible way is to use a dedicated
workqueue instead of the system_dfl_wq, and explicitly flush
it somewhere in the initcall stage before entering userspace.
One other way is to use async_schedule_dev_nocall() for these
device scanning. It's designed for asynchronous initialization
and will work same as before since it's using a dedicated
unbound workqueue as well, but the kernel init code will
wait for the work finished (async_synchronize_full) right before
entering userspace init.

This patch use the second approach. Compared to a dedicated
workqueue, it's simpler since the async schedule framework have
handled most works like synchronization, memory allocation of
works and workqueue. The ACPI code only needs to focus on its
work. A dedicated workqueue for this could also be redundant
since some platforms don't need acpi_scan_clear_dep_queue()
for their device scanning.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
Change since v1:
Refine the commit message to:
- include the issues and the analysis
- include the reason for using the async schedule rather than
  a dedicated workqueue
Link: https://lore.kernel.org/linux-riscv/20260122073446.45628-2-yang.yicong@picoheart.com/

 drivers/acpi/scan.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 416d87f9bd10..64fcbd6a6adc 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "ACPI: " fmt
 
+#include <linux/async.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -2360,44 +2361,35 @@ static int acpi_dev_get_next_consumer_dev_cb(struct acpi_dep_data *dep, void *da
 	return 0;
 }
 
-struct acpi_scan_clear_dep_work {
-	struct work_struct work;
-	struct acpi_device *adev;
-};
-
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
+	 *   before userspace init task by the async_synchronize_full()
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
