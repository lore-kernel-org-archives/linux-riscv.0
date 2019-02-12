Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66322C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36C332184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRCJv+72";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="B3Ie7Loe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36C332184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s5n0kmZryF/yYyhNCfrb6EktvSjET86Qc4/MapKPBYE=; b=jRCJv+72nYZCQP5YS8m+ogKyZ8
	WqzIvgmr1JgnbQnxF/RkmQo1uQLfyIAE93tVTleqfyHoeflAseUiF83Yuw/XDpnxSlPM0PLdCoMMK
	y4CUEWtQAYWxFXhA0pO12POhQr+/3dnDDSL3zanXji75yoWU6+e8g3nA2XSwelunUZjsDZQ17t00b
	D/DOoGFy85zaN4pv6vJhOqoy1m+vtRQnjOUsgJTZOZQClaYDLLWpyM7QlQJfLlAgxoaovoxUWPI61
	mU2u/BDjbmGvQcYwX3/pLrjgavqsMSxmgtrnaSguwx/tlHYFCSJmVrnwLlr26FIJ+ZiPNh0TIB6hC
	YZcqMN4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtVxQ-0002w9-Fx; Tue, 12 Feb 2019 11:10:32 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtVxH-0002t4-RF
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 11:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549969824; x=1581505824;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=YZUqK4Qfap9iJXTgeai1JroJ8SUKDUcCMd3sVPqcbE8=;
 b=B3Ie7LoerEErFdHbKTg0oXMhSXbbEs8gFM2qEM5sLZuFHXiIEuDNWRx9
 Cv8cuN3j5Mun+FffQUItCnF85DLKqC08bJiRYtdxge+OkOogtp4Gp470O
 /HI7OcyiKHNQL8Vv2txHlSbb/TCIOh7QvWe8f12GssHbYpT+i8U4+1G2u
 ZXXWDzpMerI41Rx6gI9VNDONx2b7vdwoCx/fFe9wWQ8lORaHmO92AXkZU
 LFRD5w6+wlxbF0plZw0l8ju1ura+aT2u/pQIvnNiYf1bu5sohniz+2bn6
 3tYxDu/lOnxa1NS9XtP9hGChMaYImnsG7eK4tYaAxCEUzCc4OQ6viukCd w==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="102308184"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 19:10:20 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 12 Feb 2019 02:48:56 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 03:10:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v4 PATCH 1/8] RISC-V: Do not wait indefinitely in __cpu_up
Date: Tue, 12 Feb 2019 03:10:05 -0800
Message-Id: <1549969812-22502-2-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_031024_000679_BD98A124 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In SMP path, __cpu_up waits for other CPU to come online indefinitely.
This is wrong as other CPU might be disabled in machine mode and
possible CPU is set to the cpus present in DT.

Introduce a completion variable and waits only for a second.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 6e281325..d369b669 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -39,6 +39,7 @@
 
 void *__cpu_up_stack_pointer[NR_CPUS];
 void *__cpu_up_task_pointer[NR_CPUS];
+static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
@@ -77,6 +78,7 @@ void __init setup_smp(void)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
+	int ret = 0;
 	int hartid = cpuid_to_hartid_map(cpu);
 	tidle->thread_info.cpu = cpu;
 
@@ -92,10 +94,16 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 		  task_stack_page(tidle) + THREAD_SIZE);
 	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
 
-	while (!cpu_online(cpu))
-		cpu_relax();
+	lockdep_assert_held(&cpu_running);
+	wait_for_completion_timeout(&cpu_running,
+					    msecs_to_jiffies(1000));
 
-	return 0;
+	if (!cpu_online(cpu)) {
+		pr_crit("CPU%u: failed to come online\n", cpu);
+		ret = -EIO;
+	}
+
+	return ret;
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -121,6 +129,7 @@ asmlinkage void __init smp_callin(void)
 	 * a local TLB flush right now just in case.
 	 */
 	local_flush_tlb_all();
+	complete(&cpu_running);
 	/*
 	 * Disable preemption before enabling interrupts, so we don't try to
 	 * schedule a CPU that hasn't actually started yet.
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
