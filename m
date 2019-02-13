Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D6DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1E6222AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iL5X/XuR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aFEbMyXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1E6222AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A57V2roDiIPnB41LpU97C67UdyiZZ2y9fphC5t1se/Q=; b=iL5X/XuRxzMKOOFPMcf1b9crPG
	hM/2qs6bdX3CAOzn5JxlMIsWKqXcw05cecLumMdFACInBVjlgdvi7lG9hOGMXE0F77e/qdt0u1CAn
	Hcul4ThoBrMArEX4VHV3vMTun8qsQB4keWdNPO5M+xeEh2Sxh3VZzszCq3tba+ClduX99WyNKQCj8
	uzmPdv26pyZcpezVQUnIIba90W+zEbAmjIh5Kn+fXLKKyEOKv8NoPHUURA+X2D99mG/uxE87IC4a0
	0K9iDU8rxeaJsEI+URBSVg8fYTACy5ul5IG3lI6A7OA1i8LbrYCfh12jr5+qdcBxVnq+no7zaQS9T
	0jTLy23w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0zE-0003IR-CX; Wed, 13 Feb 2019 20:18:28 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0z8-0003Ca-W1
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550089103; x=1581625103;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=h2fKv5100GvHj+ysLhrtvyrBQOE+5MV8IiW0LUcjPlE=;
 b=aFEbMyXxBzDjy6FL7GIzAL8ah3O2yL7oOnHYQg3GNJxq6QqvyMJz4n7m
 b04QflmuKyFQKXmoETV+WPGLrChxW1mFIFtsmB436YTGO4/y9CtWZrhZc
 4GYvK5rplZUrGytHKjwSDzGX9PNSq/sjLfvytNtPwocuhPTk5/fKFQxzR
 a1f7Xh/8MHwOGYq6h0Vh8XKILbmT/ShGpIodvaYClGB8cGYaMlBQgDg1K
 3OM+LK9OlDqBR7LDjCsLNpBFPPxrB4OlDHpR17k/y2uCj+n2Q2gQkykXc
 OqA04Tiar2dWk+tepJJsnTWDm6rYi7ETaL6fPN029B9kIvsTxPnqYnzcJ Q==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="102463814"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 04:18:20 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:56:54 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 12:18:21 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v5 PATCH 2/8] RISC-V: Move cpuid to hartid mapping to SMP.
Date: Wed, 13 Feb 2019 12:18:06 -0800
Message-Id: <1550089092-28783-3-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_121823_139895_76381075 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, logical CPU id to physical hartid mapping is defined for both
smp and non-smp configurations. This is not required as we need this
only for smp configuration.  The mapping function can define directly
boot_cpu_hartid for non-smp use case.

The reverse mapping function i.e. hartid to cpuid can be called for any
valid but not booted harts. So it should return default cpu 0 only if it
is a boot hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h | 18 +++++++++++++-----
 arch/riscv/kernel/setup.c    |  9 ---------
 arch/riscv/kernel/smp.c      |  9 +++++++++
 3 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 41aa73b4..636a934f 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -19,16 +19,17 @@
 #include <linux/thread_info.h>
 
 #define INVALID_HARTID ULONG_MAX
+
+struct seq_file;
+extern unsigned long boot_cpu_hartid;
+
+#ifdef CONFIG_SMP
 /*
  * Mapping between linux logical cpu index and hartid.
  */
 extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
 #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
 
-struct seq_file;
-
-#ifdef CONFIG_SMP
-
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
index fb09e013..61c81616 100644
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
