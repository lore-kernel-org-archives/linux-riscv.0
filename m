Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632FBCD98D2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMAOdD8eTFNQatz0Qz74L9KlXZaxqsLNPCA1E1ryCCo=; b=iEp2IYE2DhNqH3
	gFqx/etv6s1G41lPuGygHSDIJTkCqPTbG9tFLGcxR3sj/TgJ6XTj0tRiAc0qseYB6KwkHE1huTVU4
	bzWGpGpp+A8OXJ21/tatxZdSVO8VRy4GpOlWATR6TchlCjaHeGi2ZImKBMnIyHDP8qJYwkz4MytPv
	UECyYhubKNsEAq/EV1IaSQwkOEDTR9VTaWF76weW494RC7LeLwuYuJU2XQ2vRPghoMaJu+81vqmOU
	tp6a3KWr+/JvSlL8dFdSyxbNLGxZmQWb0fbnaIGpuV5n8Kq9kNGhHOPWuk5rnQH4pryGvXpgIlUpi
	a/ouXso/M14SIMXBGMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOC7-0000000FNUi-2IgO;
	Tue, 16 Jun 2026 07:26:47 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=outbound.baidu.com)
	by bombadil.infradead.org with smtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOC3-0000000FNU1-2UaP
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 07:26:46 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Sudeep Holla <Sudeep.Holla@arm.com>,
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] ACPI: processor_idle: Mark LPI enter functions as __cpuidle
Date: Tue, 16 Jun 2026 15:26:17 +0800
Message-ID: <20260616072617.2272-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: bjhj-exc2.internal.baidu.com (172.31.3.12) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1781594787;
	bh=ZKrl5XjHwKttwXLUUkKHS6jVNOGR3JbwSYr/ZCiHc2E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=l03GRvOVXn9j6ysuUEbC8Yte7cwRiUS20kUTQus23JwqfopE3MyPA7pWkMqCFXK1/
	 28/7kwEy9U773j62I6EUyk4DumtfEAeKpvibQgpqGU88kuBro+WMkKmLPIP9nZkA0m
	 igg1rr3lfPYeG3ttO6YdAxVpSyFQziN2WJbx3ZGSYJHgS1b3hHyFk+FP5b7EYaJ8Z7
	 8X2jJVbgPvlVLKWRQ6kXISD1BewJTg4uUUZjknkNFzOoq3/PQUqDcomQBfDZWuCAAJ
	 nZLY1pf33pIsYQbMy0DmwvcVadVumn5kC0iQTo8Di7a7JmjRHd0rMZ1QBCApHz5D/G
	 NpsP2+sefo9rg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_002644_434986_3CC060E4 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Li RongQing <lirongqing@baidu.com>

When function tracing or Kprobes is enabled, entering an ACPI Low
Power Idle (LPI) state triggers the following RCU splat:

  RCU not on for: acpi_idle_lpi_enter+0x4/0xd8
  WARNING: CPU: 8 PID: 0 at include/linux/trace_recursion.h:162 function_trace_call+0x1e8/0x228

The acpi_idle_lpi_enter() function is invoked within the cpuidle
path after RCU has already been disabled for the current local CPU.
Consequently, ftrace's function_trace_call() expects RCU to be
actively watching before recording trace data, emitting a warning
if it is not.

Fix this by annotating acpi_idle_lpi_enter(), the generic __weak
stub, and the RISC-V implementation of acpi_processor_ffh_lpi_enter()
with __cpuidle. This moves these functions into the '.cpuidle.text'
section, implicitly disabling ftrace instrumentation (notrace) along
this sensitive path and preventing trace-induced RCU warnings during
idle entry.

Fixes: a36a7fecfe60 ("ACPI / processor_idle: Add support for Low Power Idle(LPI) states")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
Diff with v1: add __cpuidle to acpi_processor_ffh_lpi_enter

 drivers/acpi/processor_idle.c | 4 ++--
 drivers/acpi/riscv/cpuidle.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index 390ab5f..4482cf2 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1143,7 +1143,7 @@ static int acpi_processor_get_lpi_info(struct acpi_processor *pr)
 	return 0;
 }
 
-int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+int __weak __cpuidle acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
 {
 	return -ENODEV;
 }
@@ -1156,7 +1156,7 @@ int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
  *
  * Return: 0 for success or negative value for error
  */
-static int acpi_idle_lpi_enter(struct cpuidle_device *dev,
+static int __cpuidle acpi_idle_lpi_enter(struct cpuidle_device *dev,
 			       struct cpuidle_driver *drv, int index)
 {
 	struct acpi_processor *pr;
diff --git a/drivers/acpi/riscv/cpuidle.c b/drivers/acpi/riscv/cpuidle.c
index 624f9bb..c76dbab 100644
--- a/drivers/acpi/riscv/cpuidle.c
+++ b/drivers/acpi/riscv/cpuidle.c
@@ -66,7 +66,7 @@ int acpi_processor_ffh_lpi_probe(unsigned int cpu)
 	return acpi_cpu_init_idle(cpu);
 }
 
-int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+int __cpuidle acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
 {
 	u32 state = lpi->address;
 
-- 
2.9.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
