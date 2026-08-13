Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B0BC5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Mime-Version:Message-Id:Cc:From:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JXF4TAsHmAMDXk6TmkLOem8BC4Ul64yfLyR0I/POBSc=; b=WtDPpqfkBkW3KedvaNDFhdszFM
	YkQ09waACkEiO3cMXygSRIShqy1CscUus+3Bk/qkMGMUmafn48KALfkkNzYAnI+rR0EPPxavwGIC7
	w2UtQJ4rbtk/+SQoMWOB16kfHHNeOmiqjaKgBaurPIKn33lNifjLMWr2+xDgyMpgUCPUCWMYtzJmy
	MmbVN7qnVuXpnu6MTJ+5EEGOBhq8KYByVIb492Wb2lYAoiHrAeb2+gjQijSFpUQDdkIWOuVN9MyNp
	3VhASOrffq1pk8aPJTznU9FSDgLPUGtc7ovNeU3wrZNkrKunIyKvVvELhH1wSNraXINLpiY1CNs7T
	8lDWn5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6u-00000000hWn-1gjz;
	Thu, 13 Aug 2026 13:04:40 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6r-00000000hVe-2jZk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 13:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786626272; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=g4QWpVDt+BGsuhwdwrmcwuQnEyaPLYAMiaqo4m0h4wk=;
 b=NG/h1ubRG0Qu4QTaIQx8a5jNTwPNOD4M5l6griB9ewDWhC5DqnePBTeCbLRR6iWcBJr1Mj
 GCDlxkcKKVglQgNnRLVpnoc5GZcLwZV7CzUfxyYrYSH/iEw5wnoXkooWoS+qZd+KhlNM+H
 ClfQvyWbsN6LvE2g1oWXyGkU3iQ3hdOcE2OlYlbkA+7AyJFPSuIu/SLxTVPhrlGyasNtX1
 KtZgn18RuxiEuXwVUOK2FV4i5I56SvrPjU9ynsgtoPdzLjedFVvtMxSdo9IDXzATCxvzHh
 G818eD/7kMTknwyItxOLhN8QbwkXvMEACCsKxfw4ZGN89q+sIMRe2nTlFPFY5Q==
Subject: [PATCH 2/2] riscv: Poll for SBI_HSM_STATE_STOPPED in sbi_cpu_is_stopped()
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a7dc0de+3b1269+lists.infradead.org+qirui.001@bytedance.com>
To: <palmer@dabbelt.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Cc: <pjw@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260813130357.1144775-3-qirui.001@bytedance.com>
Mime-Version: 1.0
Date: Thu, 13 Aug 2026 21:03:57 +0800
In-Reply-To: <20260813130357.1144775-1-qirui.001@bytedance.com>
References: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_060437_761638_42E58D0E 
X-CRM114-Status: GOOD (  10.18  )
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

When offlining a CPU, the dying CPU (AP) and the controlling CPU (BP)
have a race:

  AP: cpuhp_ap_report_dead() -> cpu_ops->cpu_stop()
                                    ^^^
  BP: sees DEAD -> cpu_is_stopped() -> sbi_hsm_hart_get_status()

The AP reports itself dead before it actually invokes cpu_stop(), so
the BP can read the SBI HSM state while the AP is still in
STARTED state, not yet STOPPED.

This race was previously masked: the old sbi_cpu_is_stopped() returned
the raw SBI status code, and SBI_HSM_STATE_STARTED happens to be 0,
which the caller treated as success. The recent bool conversion made
the check strict (rc != STOPPED is failure), exposing the race as a
spurious warning.

Fix by replacing the single sbi_hsm_hart_get_status() call with
read_poll_timeout(), giving the AP time to complete the transition to
STOPPED. This follows the same approach as arm64's cpu_psci_cpu_kill(),
which polls psci_ops.affinity_info() for the same reason.

The first SBI query is issued immediately (sleep_before_read=false),
so the common case where the CPU has already stopped incurs no extra
delay. If the state is not yet STOPPED, the code retries every 100us
with usleep_range() for up to 100ms.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index ee6e4b5cc39e..607d386db5f7 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/mm.h>
 #include <linux/sched/task_stack.h>
 #include <asm/cpu_ops.h>
@@ -13,6 +14,9 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
+#define SBI_HSM_STOP_POLL_US		100
+#define SBI_HSM_STOP_TIMEOUT_US		(100 * USEC_PER_MSEC)
+
 extern char secondary_start_sbi[];
 const struct cpu_operations cpu_ops_sbi;
 
@@ -85,12 +89,15 @@ static void sbi_cpu_stop(void)
 
 static bool sbi_cpu_is_stopped(unsigned int cpuid)
 {
-	int rc;
+	int rc, ret;
 	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
-	rc = sbi_hsm_hart_get_status(hartid);
+	ret = read_poll_timeout(sbi_hsm_hart_get_status, rc,
+				rc < 0 || rc == SBI_HSM_STATE_STOPPED,
+				SBI_HSM_STOP_POLL_US, SBI_HSM_STOP_TIMEOUT_US,
+				false, hartid);
 
-	if (rc != SBI_HSM_STATE_STOPPED) {
+	if (ret || rc != SBI_HSM_STATE_STOPPED) {
 		pr_warn("HART%lu isn't stopped; status %d\n", hartid, rc);
 		return false;
 	}
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
