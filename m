Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACBD31A0F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:From:To:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LNTp4mWqj9xFbWFcPDIAYJocX6ipqSDtkMIoqymt3Kw=; b=epu
	F+8FFcb58GneoenNK6XDW/1v2RvQtwt3/mJ88a8qjNAMc0IKP19TD6BnvWxKtM7CXsmwpeADfl2Kw
	wJnIbDRtfSTpBygW13I2gwZYHCQ3XZ599JFQFzgTXYght4Vg3Fscu7HC875oBrxuxo6gF0QHtDBbR
	zZrqnZezSRxCZd5rPrkRFT0BnEBZSkhIi4bN4LNuTLjXkzoVqRqODugGs2c9OQ8Ge1BieOAeBjHRx
	pwPhquz65LoPtPMKUhIDm9a8LrGlJY9bQkpYqNNUlzt/q9jBSXlBYCW8uNrfvwrKJLMXql4lnfNIj
	qrKZC/dGahsTvOgDFnZm/AxNtBaigqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuVs-000000088A6-3LR5;
	Wed, 14 Jan 2026 06:37:52 +0000
Received: from sg-1-35.ptr.blmpb.com ([118.26.132.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuVn-0000000889I-1r3N
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 06:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1768372656;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1KHXngXfRGvvMW06f+GfqzL0+p+XIjFjhJb/29MnMg4=;
 b=iAuDZH16fuUx8xq3B3gIRtG+2XIIxh7WcZ0yn0euTWQpCLBo7Vv0o2//imA0RlpH5Mu9ha
 +AMpCMNKYFxv+Cf/sE/7sqkP4p9ymTH/hzNdDnrw+b9QYpC8YlBW3oMcZkkYYaENntAOZX
 74XRjxtGR0UpeAmQu7WLYaQ8sEncv1dOYZRglttzvPb7TdzA5jO9wjBnlkS6Q5o6HpX0me
 8hYf97iYOYrzVuUrsT/nKs95pBJzpF+60Xk8vWAIQmD/zckJfNHaQWB5mG798CfWFjXaIk
 AqGvBt4XMJKv0vQgvxLrYaYXV6DYqKVDPymLN7Hlq6Xo1aGmsxqYF/vrKrNDSA==
Date: Wed, 14 Jan 2026 14:37:30 +0800
Message-Id: <20260114063730.78009-1-yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2696739ae+2597d0+lists.infradead.org+yang.yicong@picoheart.com>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <geshijian@picoheart.com>, 
	<weidong.wd@picoheart.com>
Subject: [PATCH] irqchip/riscv-aplic: Register the driver prior to device creation
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Wed, 14 Jan 2026 14:37:33 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_223747_902937_01465A1F 
X-CRM114-Status: GOOD (  15.43  )
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

On RISC-V the APLIC serves part of the GSI interrupts, but unlike
other arthitecture it's initialized a bit late on ACPI based
system:
- the spec only mandates the report in DSDT (riscv-brs rule AML_100)
  so the APLIC is created as platform_device when scanning DSDT
- the driver is registered and initialize the device in device_initcall
  stage

The creation of devices depends on APLIC is deferred after the APLIC
is initialized (when the driver calls acpi_dev_clear_dependencies),
not like most other devices which is created when scanning the DSDT.
The affected devices include those declare the dependency explicitly
by ACPI _DEP method and _PRT for PCIe host bridge and those require
their interrupts as GSI. Furhtermore, the deferred creation is
performed in an async way (queued in the system_dfl_wq workqueue)
but all contend on the acpi_scan_lock.

Since the deferred devcie creation is asynchronous and will contend
for the same lock, the order and timing is not certain. And the time
is late enough for the device creation running parallel with the init
task. This will lead to below issues (also observed on our platforms):
- the console/tty device is created lately and sometimes it's not ready
  when init task check for its presence. the system will crash in the
  latter case since the init task always requires a valid console.
- the root device will by probed and registered lately (e.g. NVME,
  after the init task executed) and may run into the rescue shell if
  root device is not found.

We'll run into the issues more often in linuxboot since the init tasks
is more simpler (usually u-root) and will check for the console/root
devices more earlier.

Solve this by promote the APLIC driver register stage to core_initcall
which is prior to the APLIC device creation. So the dependency for
the GSI is met earlier. The key system devices like tty/PCI will be
created earlier when scanning ACPI namespace in a synchronous manner
and won't be parallel with the init task. So it's certain to have
a console/root device when the init task running.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 93e7c51f944a..86a3d19b6b24 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -231,4 +231,16 @@ static struct platform_driver aplic_driver = {
 	},
 	.probe = aplic_probe,
 };
-builtin_platform_driver(aplic_driver);
+
+static int __init aplic_driver_init(void)
+{
+	return platform_driver_register(&aplic_driver);
+}
+
+/*
+ * APLIC serves part of GSI interrupts and some key system devices like
+ * TTY/PCI depends on its initialization. Register the driver prior to
+ * APLIC device (on ACPI it's created in subsys_initcall when scanning
+ * the namespace devices) to make the GSI service ready early.
+ */
+core_initcall(aplic_driver_init);
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
