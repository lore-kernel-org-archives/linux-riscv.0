Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF39C64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5004320666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMUes8Nu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mXyPa52C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5004320666
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1NfYbV36Z+ZbuhxUTriuwZG7USRm/svStU6cc8yKXQ8=; b=oMUes8NuWlW37R8hhOTgTOzjF/
	xJ7nUuY/n0AorQQxWD3r1pi+jwq/ye1Cu5Elig1ndsds9wZ/wxf1DBStmBMb+xbv6sX9MEVbTZ8Tz
	eG3sVnuU8/CATy+3p077SUHh+imv/4JMjZ+5Mup1tXqZrJImlSKfh55yx98vsO71i45gGa/H1bG2L
	0wLt1wUuXw0mnl8Oo8QeVKWBiEF7itiRDa8szPuUTbcG2HXUkJOBHjzCdKD4J2Hx/+CZrDF+aKr7G
	2scPZmZsouVb7YInh3OrI7WRvbpMHyXRV7RumrhQjjVun7oH8qMhdSXrwV0gKnmFvei7RXfi+mV7c
	WbXn+rRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9G-000633-OP; Tue, 02 Oct 2018 19:15:58 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8q-0004ir-2c
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507733; x=1570043733;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=IWxrMPP8QxU5skWTKS1CuDJnhG9N0HHk6Ifj0AfIiZA=;
 b=mXyPa52CdZWcXih5cFjMiAUyI6+ONHfBKUW2v95WEX/AvEwxgKfRgDbY
 9XXEA3osQSJOYPiTjy/aU4ynW3DMEezae9XZDRvsns2m2wBbnOKobnZpU
 LKbd1eAtCZYwRlATgWtHJPtizIaB4C2fArDoHxY7DsNG9Zl9DtZ9BJWvk
 uR86Ym/dwSNDs9ayOLAiv8jwK7SjpbMtmZCpmYwu7ni6MZ1GkzUciURsa
 88MEtEZvbf+f4SNYAwjMBzwhz2c009vZ06ZkK3wcOUROqSWN5rEIdvJUw
 Knv2gaGiZaShmVB+zmcsFpbGBWVxDhf8snQUXddZVzYgR91rl/RslTuYn Q==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92147439"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
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
Subject: [PATCH v6 05/14] RISC-V: Disable preemption before enabling interrupts
Date: Tue,  2 Oct 2018 12:14:58 -0700
Message-Id: <1538507707-22299-6-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121532_271822_DE73D1B2 
X-CRM114-Status: GOOD (  11.60  )
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
Message-ID: <20181002191458.pa1a8l6hDTF7830-XwU46s2qbWT7q2cktN2ohIa-Fa0@z>

Currently, irq is enabled before preemption disabling happens.
If the scheduler fired right here and cpu is scheduled then it
may blow up.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: Commit text and code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 712e9ca8..670749ec 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -111,7 +111,11 @@ asmlinkage void __init smp_callin(void)
 	 * a local TLB flush right now just in case.
 	 */
 	local_flush_tlb_all();
-	local_irq_enable();
+	/*
+	 * Disable preemption before enabling interrupts, so we don't try to
+	 * schedule a CPU that hasn't actually started yet.
+	 */
 	preempt_disable();
+	local_irq_enable();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
