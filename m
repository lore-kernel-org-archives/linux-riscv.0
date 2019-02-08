Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C27C282CC
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6079520869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K3JJox75";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TWjdYb1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6079520869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t0G3Fc4uin6mewQnnnh5SS5/bNN3IwBfMxxTH56ndCo=; b=K3JJox75CTQrFcqn1++Dj/rrIM
	7ZCGKS+VpPTiMNX57HEX7GtNRj+4r2El8yL3n1rHpVAdcumks9yy5YraT7gRokD+M7VSDEQ3jQ1+X
	dpjYBRJdqRb3SYyBBAG8PdqquKty9hhprzbcnk8IRdp9pp6Q73RhAenPKUBsPsVCLWsTubmpTEGpu
	2A3ItFEvrZrBEFbXnyRju2oM1DKxIap3NnWjuv0WBGOnWULXUTTJPd+qrV4lAZ1cpiK/E5JN0oiJa
	qQVOxrYluwUpGJvFZK/sUbpemKdPpuFofUld5AArj8diBxAI5XlzYBG9hyOjy0T5CR/SbyvOhAtMg
	C1VzXqJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKa-0002cj-K4; Fri, 08 Feb 2019 01:51:52 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKV-0002Yr-Jl
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590707; x=1581126707;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=6spYNXZM01ujB3OXUqVnYTsA1aTBPCeAf1NDjBeE6Sw=;
 b=TWjdYb1mQ2S+OgvPZcslZlTXwLMdIPW4rbGrZvK3D+l6cMDL52jd/WQn
 fMwMH8UI5gFbkd3uenocfXJMrp/I3lrdQqEimDSgfxlpJhtTnGbI4V1qF
 BUR0NaaHyiXd0xS3dYmEC+CAqXXxljJebhJdgxknN+gr+AMcLJ6mzPQBX
 drtq1tHbzA3De0DzpMY5awsmRc8EZfZkgOL032kHbMEh2uoXcYtwIOQoC
 VbOhvdS78uHvnK1ZpSos2jSthj+xWkdmrxC4QjhV54KPfnHur+sDeyuTL
 uzoNhalfJfJJjaqPx8r6o3RwMUoKUrDh7DoR4gj9tpeYjADkwe1rjdO7H g==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533280"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:35 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:18 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:35 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 2/8] RISC-V: Move cpuid to hartid mapping to SMP.
Date: Thu,  7 Feb 2019 17:51:15 -0800
Message-Id: <1549590681-24125-3-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175148_038273_C41FB93A 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, logical CPU id to physical hartid mapping is
defined for both smp and non-smp configurations. This
is not required as we need this only for smp configuration.
The mapping function can define directly boot_cpu_hartid
for non-smp use case.

The reverse mapping function i.e. hartid to cpuid can be called
for any valid but not booted harts. So it should return default
cpu 0 only if it is a boot hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/smp.h | 14 +++++++++++---
 arch/riscv/kernel/setup.c    |  9 ---------
 arch/riscv/kernel/smp.c      |  9 +++++++++
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 41aa73b4..21fd2d75 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -22,12 +22,13 @@
 /*
  * Mapping between linux logical cpu index and hartid.
  */
-extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
-#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
 
+extern unsigned long boot_cpu_hartid;
 struct seq_file;
 
 #ifdef CONFIG_SMP
+extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
+#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
 
 /* print IPI stats */
 void show_ipi_stats(struct seq_file *p, int prec);
@@ -58,7 +59,14 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
 
 static inline int riscv_hartid_to_cpuid(int hartid)
 {
-	return 0;
+	if (hartid == boot_cpu_hartid)
+		return 0;
+
+	return -1;
+}
+static inline unsigned long cpuid_to_hartid_map(int cpu)
+{
+	return boot_cpu_hartid;
 }
 
 static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 77564310..45e9a2f0 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -61,15 +61,6 @@ EXPORT_SYMBOL(empty_zero_page);
 atomic_t hart_lottery;
 unsigned long boot_cpu_hartid;
 
-unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
-	[0 ... NR_CPUS-1] = INVALID_HARTID
-};
-
-void __init smp_setup_processor_id(void)
-{
-	cpuid_to_hartid_map(0) = boot_cpu_hartid;
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 246635ea..b69883c6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -36,6 +36,15 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
+unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
+	[0 ... NR_CPUS-1] = INVALID_HARTID
+};
+
+void __init smp_setup_processor_id(void)
+{
+	cpuid_to_hartid_map(0) = boot_cpu_hartid;
+}
+
 /* A collection of single bit ipi messages.  */
 static struct {
 	unsigned long stats[IPI_MAX] ____cacheline_aligned;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
