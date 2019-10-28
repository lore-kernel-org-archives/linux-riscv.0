Return-Path: <SRS0=MZUz=YV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CACA9EC1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 12:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E912B2086D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 12:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9kidHOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E912B2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0qHsIYU591SHN0VpqrhAiJ/wbM9dcHqfd3VolXSrv8=; b=X9kidHOcohK+Sy
	GOwiZlGXGKa+9cVNZdCmoFiVdSilPfoSFGy4BH9xxFEUH372/l2CxOHEfN5nEn218LjVGgcASphAB
	N7HH/RhpTCV2EWGProHxUzA5AwrWsdWQMD23qNiwjTT9cqcyaI2+09VK7unkkuQDCrApxA4T8NQXU
	xp3pRZIHYdbUyc4riExixBo/xmeB3x4VnI8IeENoKi/Qr9kDUbqMTW9SrdcdCG9ETMrGEjIUE7L9y
	ZAx2cPJ5uk6ZXhgJ0HX9lpgqN5U/zrBHdbp6scBxeiS07TZzAmZuRyOfLvc3IF0dT0IpIsOcfiy0o
	SWQGFki/TpixaLJ+l8jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP3rP-0006ka-3j; Mon, 28 Oct 2019 12:10:59 +0000
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP3rM-0006fc-Kp; Mon, 28 Oct 2019 12:10:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 04/12] riscv: cleanup the default power off implementation
Date: Mon, 28 Oct 2019 13:10:35 +0100
Message-Id: <20191028121043.22934-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028121043.22934-1-hch@lst.de>
References: <20191028121043.22934-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Move the sbi poweroff to a separate function and file that is only
compiled if CONFIG_SBI is set.  Provide a new default fallback
power off that just sits in a wfi loop to save some power.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/Makefile |  1 +
 arch/riscv/kernel/reset.c  |  5 ++---
 arch/riscv/kernel/sbi.c    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi.c

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 696020ff72db..d8c35fa93cc6 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_RISCV_SBI)		+= sbi.o
 
 clean:
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index d0fe623bfb8f..5e4e69859af1 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -4,12 +4,11 @@
  */
 
 #include <linux/reboot.h>
-#include <asm/sbi.h>
 
 static void default_power_off(void)
 {
-	sbi_shutdown();
-	while (1);
+	while (1)
+		wait_for_interrupt();
 }
 
 void (*pm_power_off)(void) = default_power_off;
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
new file mode 100644
index 000000000000..f6c7c3e82d28
--- /dev/null
+++ b/arch/riscv/kernel/sbi.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/init.h>
+#include <linux/pm.h>
+#include <asm/sbi.h>
+
+static void sbi_power_off(void)
+{
+	sbi_shutdown();
+}
+
+static int __init sbi_init(void)
+{
+	pm_power_off = sbi_power_off;
+	return 0;
+}
+early_initcall(sbi_init);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
