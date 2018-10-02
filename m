Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87895C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33EB92064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PcK6dkOR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="RILfyRfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33EB92064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+Gl+R0Srm4xNWZbKKmtG2WhzttHFHJBT19EuoJhnrfM=; b=PcK6dkORl6RUsMGyc5mdO0sBzv
	Zm5DTBLKj80LPB3ctx3gKjqGOdTTz2UncQnPcRRgqEG8WLapSRkbN2esiQGJO0xj02sP99JS32FsB
	ENeyRHRdfkjwJprSG9RymqVorIwdznSRL2WJ31vgE/iKrs8tdKkNrtrCgHRkcjBC5ZEger3DlH2Q5
	pSpagjxFx5sZf7nh14E/HHyEvX3VyEerG3igodxoMwCuJZiiExqnKWZQOmylbvZRcopci5mJJfTLY
	BkTZhomBLJUhkw69mbKaBS1sbRVXsrKMPm/E/aBJKUOdwIs7lz0tVwuBHVfP1rl64xlxFNN1Ix2k0
	ssLfJvZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q93-0005wA-Ic; Tue, 02 Oct 2018 19:15:45 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8j-0004j9-Kd
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507726; x=1570043726;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=5UY8xd2FdutBGQW8j3QnEHVqwWgY8eh8L1BzJ5gicx8=;
 b=RILfyRfDmF/Z/Efcjf/B5j1h4aePwhmfc+kcBgXMV0CmEp31j2dYDWEE
 Cqt1WEQ2YpGEsZsDF1XG+/t9xVzwnC9tvAFM7n/A/GFkqA6QlqZCv33V5
 x8WZ/RI+mQcc5cA+QaIRkN/4k/NevSlMHu1KzQKKi0ZNaWaMscU3C7p0K
 MhZni4/TzD5wVogZNmdO238WhUvjR5ABPTjlKyBx7PJmai9ZHPKJiBO5z
 bplfI4/bZ5J+FwcKYhHWh/3xTrejWyNSbdSDIKDBUpJHf61ex2vYYfKsU
 dob5cfGuV1nJfzz2VafT3WsYix/AN4oSRok8HtlAsN38Jft1egevKL58+ A==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732906"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:50 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:10 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 06/14] RISC-V: Provide a cleaner raw_smp_processor_id()
Date: Tue,  2 Oct 2018 12:14:59 -0700
Message-Id: <1538507707-22299-7-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121525_783011_82F90356 
X-CRM114-Status: GOOD (  12.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191459.T587hftzjdznnKiqkvkReNZfYh7A4EA4GkZ5-_6zKXc@z>

From: Palmer Dabbelt <palmer@sifive.com>

I'm not sure how I managed to miss this the first time, but this is much
better.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: code comment formatting and other fixes]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 36016845..85d7619e 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -14,13 +14,9 @@
 #ifndef _ASM_RISCV_SMP_H
 #define _ASM_RISCV_SMP_H
 
-/* This both needs asm-offsets.h and is used when generating it. */
-#ifndef GENERATING_ASM_OFFSETS
-#include <asm/asm-offsets.h>
-#endif
-
 #include <linux/cpumask.h>
 #include <linux/irqreturn.h>
+#include <linux/thread_info.h>
 
 #ifdef CONFIG_SMP
 
@@ -34,12 +30,10 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 void arch_send_call_function_single_ipi(int cpu);
 
 /*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using C we're using asm-offsets.h to get the current processor
- * ID.
+ * Obtains the hart ID of the currently executing task.  This relies on
+ * THREAD_INFO_IN_TASK, but we define that unconditionally.
  */
-#define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
+#define raw_smp_processor_id() (current_thread_info()->cpu)
 
 #endif /* CONFIG_SMP */
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
