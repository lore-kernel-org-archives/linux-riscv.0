Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912F1C64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558452064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEWeHX23";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ey0vyxBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558452064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mVpfOrRn8StbUc535qfAxf813qUja8h0XnXw8FsT4K0=; b=JEWeHX23rkC7DXKaCw78qcheIT
	6pVoFtj0PHKFv+dZrpz9xFKM13Z/dStFY1eL5lwiLN+Q9+k4WZSJc4LgmkvRPRgsrldF7WKUmVUS3
	cUxpVQ5oOScXIzd4HRt23/V8a2pmdNzeCwRvV7oweZmkRhxtHQfmZGubXtjZ4L/xJBpwGRzaN3oj1
	PHiBDnwnsrmZNrFe2f2Xi8OK4Lo6XiK7+WJEkfOI5G9U2nKtDnB6KmOd+Z40s+xzZW6M3HIpkYe3u
	9d54Vipw/pkVpMUkiRaWpQvzBarqIid9AKhf9FAI0TeSqgaTiXZeSXA8f2DF5thpwwQf5vXz88Dbr
	wBqBOhmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9D-00061B-7v; Tue, 02 Oct 2018 19:15:55 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8q-0004j9-LA
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507733; x=1570043733;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=yYSzJohgUUulgjrfTE5grm9/z8Wz6+2RwJyG6hRhupI=;
 b=ey0vyxBQ/Ehse65PzC2wR61f49UmUQr60yKAc65O7n0aqOO5tgyTEUYz
 3PWC/2yTvH4248F2As6R+vo/KeuCYo6wpWvFd8Yj5szp82Nn6DK1RacgN
 bExCDlSIGNXnfPBo1y7FqHPjL4i5izZBwM1qcreg5QjTaCKOABTBKI8wI
 ZqoQvLgZY0Keijkq8rC3SbUSkTcrfwIqXhkv6PIcU/Eb9+Vn3KtWaIaO4
 3Rez1qLutO4bWCghHUHFsrkkIF746FzxjxUS9DKuplywAFEbkeZtm4EqS
 07KlwyQjMn/qw5LqmH1acXPGeIGH3htCugrnTV1xrrCaeZLFPtjIuRsxF A==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732909"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:51 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 11/14] RISC-V: Add logical CPU indexing for RISC-V
Date: Tue,  2 Oct 2018 12:15:04 -0700
Message-Id: <1538507707-22299-12-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121532_770943_E04DF3F0 
X-CRM114-Status: GOOD (  15.85  )
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
Message-ID: <20181002191504.69ixvZoOx2CgG4xEDL8zb9xahAeZ7mNNsp7RFsE2D2s@z>

Currently, both Linux CPU id and hart id are same.
This is not recommended as it will lead to discontinuous CPU
indexing in Linux. Moreover, kdump kernel will run from CPU0
which would be absent if we follow existing scheme.

Implement a logical mapping between Linux CPU id and hart
id to decouple these two. Always mark the boot processor as
CPU0 and all other CPUs get the logical CPU id based on their
booting order.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h | 24 +++++++++++++++++++++++-
 arch/riscv/kernel/setup.c    |  4 ++++
 arch/riscv/kernel/smp.c      | 19 +++++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 85d7619e..47fd61df 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -18,6 +18,13 @@
 #include <linux/irqreturn.h>
 #include <linux/thread_info.h>
 
+#define INVALID_HARTID ULONG_MAX
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
+#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
+
 #ifdef CONFIG_SMP
 
 /* SMP initialization hook for setup_arch */
@@ -29,12 +36,27 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 /* Hook for the generic smp_call_function_single() routine. */
 void arch_send_call_function_single_ipi(int cpu);
 
+int riscv_hartid_to_cpuid(int hartid);
+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
+
 /*
  * Obtains the hart ID of the currently executing task.  This relies on
  * THREAD_INFO_IN_TASK, but we define that unconditionally.
  */
 #define raw_smp_processor_id() (current_thread_info()->cpu)
 
-#endif /* CONFIG_SMP */
+#else
+
+static inline int riscv_hartid_to_cpuid(int hartid)
+{
+	return 0;
+}
 
+static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
+					      struct cpumask *out)
+{
+	cpumask_set_cpu(cpuid_to_hartid_map(0), out);
+}
+
+#endif /* CONFIG_SMP */
 #endif /* _ASM_RISCV_SMP_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index db20dc63..d40b7c0f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -82,6 +82,10 @@ EXPORT_SYMBOL(empty_zero_page);
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
 
+unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
+	[0 ... NR_CPUS-1] = INVALID_HARTID
+};
+
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 906fe21e..0bd48935 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -38,7 +38,26 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
+int riscv_hartid_to_cpuid(int hartid)
+{
+	int i = -1;
+
+	for (i = 0; i < NR_CPUS; i++)
+		if (cpuid_to_hartid_map(i) == hartid)
+			return i;
+
+	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
+	BUG();
+	return i;
+}
 
+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
+{
+	int cpu;
+
+	for_each_cpu(cpu, in)
+		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
+}
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
