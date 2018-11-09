Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF652C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 01:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7023B20840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 01:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8IlvJMX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J+TuKQMY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aB2TKEZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7023B20840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2gYxzq6y+d31Ia1FqvE8/x6N0hp8JoJGxH6CgTA9ZHk=; b=U8IlvJMXiipIPEZoStVqoTxB+6
	cKCLMWX+YxNMmBslvn4p1130tNK0sjAP5pQhi8Evcbp6SIavI5ND/A5gFeSnfOHdopWbHGXRMTOqg
	6pJUAQiTMS9mAhj5hlaap1KZuJ7ycO4IP6dw7U3cFXRyf6ygIzsL0K18wZjcI8B0/2pIBFCfpZEZs
	/cjKMfbhSo33ey4jt+2FpIRlsWQuBEud19TB4xDZ23PKxdNTO/ta/BOO6wJ2j7NBi4WdCfr/Yv2Jx
	LmoQATKr7YG3IA7+FS0qBXEJ7XW0/jQfwxImf/nxVmddW60Zhk+cCMHCrXb/d5aVTJmz36/XXZOe0
	PqM+5NTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKvwg-0000oX-Mi; Fri, 09 Nov 2018 01:50:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKvwQ-0000K0-8k; Fri, 09 Nov 2018 01:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8HQ2vHTko6k0VtyZcrexw1yy9c4VPr8ceXABe1IJ964=; b=J+TuKQMYrq0nFx9bkgiBYrhHM
 A2+IQ5rnQhYUMD+ie6z5BfeQdB9p/lpoOt4uuNWUD72WZgRbYxK9krNC+8G9fbFp/avGper2CQ/2l
 aYwmxB4qKD3dfYDvgELCrAnQGTWTs+BE0WzK5hgT/PAoAgQIiT2te/EQo0PEl69cI96yphAtUsrbA
 Fwo3KraOLBG7bkyGbs8GQvvVnuC2tiJ7d0drYvYERQEcznnHef5PdJWpSgCPDFHsRf2uTFoMBu4dX
 lS+uh6hAHAfM1EbBjM1xJGuH//uZUkeeRaSNkkeW6/tjbfXsLp5VU0QtTGB831VHa80iydFxsMK9y
 JNzktWDog==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKvwN-0003pb-6R; Fri, 09 Nov 2018 01:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541728232; x=1573264232;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=wTS7UviMuB1vJqlMidMCF02zuSQf2VK9pjNXvYjC+z4=;
 b=aB2TKEZbCNFJRltSvao5RBIbldWh1b2UUAph7l6yZI+QP8YPZpA3QaIJ
 2Rlh0ofP4oUrdNy1n9tuAZDLAk/vd51/bVJFEdy7XBbU62ayrXDw9cmJ2
 Ze4Rf6jbfxBBgpwY8Ej/92rfak2z3+O/+WL9EIWAxSOMJg91P8Jaxe1xh
 Mm8GBltsdNw6KeEsMfz6rLFXeTSsUIubPBDz6oMmIH0WmcBsCIhGvOQk+
 vhhtXQRIDbfyKAq0S5IZF1NjciHO3Bi6nAjCK1UBAtfvByXH5Vp7W4f9M
 NYbZCskD3Dn+aNj0sdvj4YQAdBRF3TnJ9rFjzxCai8kMrANeI7Ny/qRF+ A==;
X-IronPort-AV: E=Sophos;i="5.54,481,1534780800"; d="scan'208";a="93844219"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2018 09:50:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Nov 2018 17:33:44 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Nov 2018 17:50:11 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 3/3] RISC-V: Parse cpu topology during boot.
Date: Thu,  8 Nov 2018 17:50:09 -0800
Message-Id: <1541728209-3224-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_015031_505195_7F05B5F6 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 juri.lelli@arm.com, anup@brainfault.org, palmer@sifive.com,
 jeremy.linton@arm.com, atish.patra@wdc.com, robh+dt@kernel.org,
 sudeep.holla@arm.com, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109015009.8gXcLiNMDou9RhvWDYYr-4gm52QVVcz9AVNMPTyfmqQ@z>

Currently, there are no topology defined for RISC-V.
Parse the cpu-map node from device tree and setup the
cpu topology.

CPU topology after applying the patch.
$cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
0
$cat /sys/devices/system/cpu/cpu3/topology/core_id
3

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/smpboot.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4..e2d8ddb5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
+	select GENERIC_ARCH_TOPOLOGY
 	select ARCH_HAS_PTE_SPECIAL
 
 config MMU
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 18cda0e8..6fa95442 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -31,6 +31,7 @@
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
+#include <linux/arch_topology.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
@@ -42,6 +43,7 @@ void *__cpu_up_task_pointer[NR_CPUS];
 
 void __init smp_prepare_boot_cpu(void)
 {
+	init_cpu_topology();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -108,13 +110,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 asmlinkage void __init smp_callin(void)
 {
 	struct mm_struct *mm = &init_mm;
+	unsigned int cpu = smp_processor_id();
 
 	/* All kernel threads share the same mm context.  */
 	mmgrab(mm);
 	current->active_mm = mm;
 
 	trap_init();
-	notify_cpu_starting(smp_processor_id());
+	notify_cpu_starting(cpu);
+	update_siblings_masks(cpu);
 	set_cpu_online(smp_processor_id(), 1);
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
