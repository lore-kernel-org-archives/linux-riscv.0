Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52418C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B2B218EA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWB2Glaq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HLRROgTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B2B218EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zAKvRPNM+TpreEgv1u56FLxijFnb++xOkH4pZ6qO9YQ=; b=VWB2Glaq/vFxWOfB+hfI1PwsYZ
	IIH2223guHEZGiA2ZxkWC1lOz7veS2KbnTbxqq6nD6Y9wZyPA7jee6L8cBhprzBBnFULgmWTjOGvx
	V9BLGkeaZV8Fb77p03yAwr7MV2/QD63m2sY1wNElzDCLVx0/I7N01Ixk1sK2GxbAtmBglQKQbJptv
	5kO1sLI8Tcl9I4Go8x6/KUHXfJZ/oVEh6g4tWMT/eBBW6va3iT2TlN63gnInnXcWyEOHiVbgdnjQU
	IhgBLOOXjejv5FQRwbXU116vd8JEzJt3Yuz9+BX9VclnSQyfCxAQU47C8yMgxNM+Vz8QdfhhtELtG
	UD4RJD9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcIIz-0002Lp-1l; Wed, 26 Dec 2018 23:09:37 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcIIv-0002CD-8b
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 23:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545865773; x=1577401773;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=meu8IE2Cb35XRAORiR9qLyyfGNjZhzm1rUp8PRNo5pE=;
 b=HLRROgTWN0/wAyCM2UMk73KiuLIrVI+axPYP05XKrzz9+9FTRdSu9lxy
 F4RDzFOHxW/D0to5XNwiO9oabMYH1RSKa93pPn31NU+oe/feqPQyMB3x1
 822TN35bFKqyzlyfZlQ6bXx6/QMHymn2JFK2IxuMLwDEBr3HTtLNomUxj
 8NNOHdmjMm+h+bnkzjIhw0hevA30KCiJYgt0C3Jovlh3qWIl1l4Bw1eP1
 x+bLT7j1W9reexm198L1K5X0nNaLIb006Enp+uzsN9AF1sKNX5CvorJg2
 lXMjJOXqjK7WavMLw3/8dGE8evayVOBwSSSQrFBi00IPLm9nokPBSoBCQ g==;
X-IronPort-AV: E=Sophos;i="5.56,401,1539619200"; d="scan'208";a="99246005"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Dec 2018 07:09:07 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 26 Dec 2018 14:49:51 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Dec 2018 15:09:07 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] RISC-V: Move cpuid to hartid mapping to SMP.
Date: Wed, 26 Dec 2018 15:09:00 -0800
Message-Id: <1545865741-22795-3-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_150933_345406_E1AE79FB 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, logical CPU id to physical hartid mapping is
defined for both smp and non-smp configurations. This
is not required as we need this only for smp configuration.
The mapping function can define directly boot_cpu_hartid
for non-smp usecase.

The reverse mapping function i.e. hartid to cpuid can be called
for any valid but not booted harts. So it should return default
cpu 0 only if it is a boot hartid

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/smp.h | 13 +++++++++++--
 arch/riscv/kernel/setup.c    |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 41aa73b4..8f30300f 100644
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
@@ -58,7 +59,15 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
 
 static inline int riscv_hartid_to_cpuid(int hartid)
 {
+	if (hartid == boot_cpu_hartid)
 		return 0;
+	else
+		return -1;
+}
+static inline unsigned long cpuid_to_hartid_map(int cpu)
+{
+
+	return boot_cpu_hartid;
 }
 
 static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c290e6a..bd4d7b85 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -83,6 +83,7 @@ EXPORT_SYMBOL(empty_zero_page);
 atomic_t hart_lottery;
 unsigned long boot_cpu_hartid;
 
+#ifdef CONFIG_SMP
 unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -91,6 +92,7 @@ void __init smp_setup_processor_id(void)
 {
 	cpuid_to_hartid_map(0) = boot_cpu_hartid;
 }
+#endif
 
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
