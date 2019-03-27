Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973D1C10F05
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F9F2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UATT7yjZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VFfslJRm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F9F2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoYLO/ZOO91r02c2zNMfb7tQyCFpXSREDDLmxAJ+R40=; b=UATT7yjZ0po4W9
	T6rIOQXysuBUW7uxJ2sro6RInhCAx83icRPcr4Vmz6DSf4me6YeCrS109fhkeHjJTSPcTK/p2so6O
	5rpximRMsiBXCbP9BAOxJ4eYsA516Y32Rwoy787R7wb6FReQwnckS9rZol0ZslxXcKk/ddSIN+PNO
	rZETDZbeUW6z4bt1zFRlUwdviXdVp2Im0syL3LjQ60txwpU1VMZCzKhAvXjakZBZkuVn/Pu/Ew5Wy
	epRJhYNAOJU+izXxBKQwB/5l3oRWFwXXF2yfffSPTaNI9mKTLzfpTQZZa8kN5Fz1Wl9BOy4bEYDW1
	pdx1OAwWNnlhPwmGDApQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8wdP-0005zF-4j; Wed, 27 Mar 2019 00:41:39 +0000
Received: from mail-eopbgr100104.outbound.protection.outlook.com
 ([40.107.10.104] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8wdM-0005xc-7C
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73GXrscOF7oDNb7BvZksg+VnZfN+o+ZWacdQz5M6dk8=;
 b=VFfslJRm4xWCZ+6ZGgBwJSavkU6boUCmD/4uXDDGF6YSm+i6zWyK5QL1Lfkwxd3qyBdo3BKiur9q0AcR2kstSxZ3gcOFpaoWaJ1T9qYaGgieQVwXjUK+Hc/4igtOv7SmRtkJj9kfpAGzqf8TtLVI6HmrERlYUFxfdxweLM/V3hs=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM (20.176.144.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 00:41:25 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 00:41:25 +0000
From: Gary Guo <gary@garyguo.net>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 1/5] riscv: move flush_icache_{all,mm} to cacheflush.c
Thread-Topic: [PATCH v4 1/5] riscv: move flush_icache_{all, mm} to cacheflush.c
Thread-Index: AQHU5DXOtAAqoOSTmEqCwKrpsDUmww==
Date: Wed, 27 Mar 2019 00:41:25 +0000
Message-ID: <d141829022c075172b1410e67299fc29fa95c6cd.1553647082.git.gary@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
In-Reply-To: <cover.1553647082.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d7022b9-a187-4ef7-a584-08d6b24cf145
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0880; 
x-ms-traffictypediagnostic: LO2P265MB0880:
x-microsoft-antispam-prvs: <LO2P265MB0880C2CCD54365156B8954BCD6580@LO2P265MB0880.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(2616005)(36756003)(110136005)(97736004)(68736007)(256004)(14444005)(46003)(54906003)(316002)(53936002)(486006)(6512007)(11346002)(476003)(446003)(2906002)(71190400001)(8936002)(50226002)(71200400001)(6436002)(2171002)(6116002)(81166006)(81156014)(8676002)(7736002)(305945005)(52116002)(76176011)(6506007)(99286004)(102836004)(386003)(5660300002)(186003)(25786009)(4326008)(118296001)(86362001)(106356001)(508600001)(105586002)(14454004)(6486002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0880;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dtwSoFc0Wp4ewkbf1/d693phSwBIdttT2vrSO+VB9rOMB02dX8raJ5bn6W9C5U1dImeNjFx5KZ9pQHCk6fWu3s9QIYojWiRoWdA7e4N8byuOHbKU4WRv4QIldik/Z9X4BiOqJVzq9FKX/TYUbX885Xfbuwdvhh6FKj+bwYWXuvHAQyEag17U1UvwVkGVCDm4yvb2sk+F1nIZgSK/6gxKfoS0kYS4pMckG4vsqnvuLXRO0K4eFGlFOA/ZFGOBt6nWCWJBA5yijDnf0KIuYcMe7+tUf095b9yjdT4Mh49oTiaU3M7gJu1GQTGPBy7sj7+nU/+DA/q17hLYBaj9XEOCSZRvsfESi+/VUiqUAzoDfNfncr7I9v7rIF3BRBFpAT5aDbI8+HPRQvPywu0xX6Ggnvrfp8zKUT95uffk6JJ0Kps=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7022b9-a187-4ef7-a584-08d6b24cf145
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:41:25.7377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_174136_259469_EE15473F 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gary Guo <gary@garyguo.net>

Currently, flush_icache_all is macro-expanded into a SBI call, yet no
asm/sbi.h is included in asm/cacheflush.h. This could be moved to
mm/cacheflush.c instead (SBI call will dominate performance-wise and
there is no worry to not have it inlined.

Currently, flush_icache_mm stays in kernel/smp.c, which looks like a
hack to prevent it from being compiled when CONFIG_SMP=n. It should
also be in mm/cacheflush.c.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/include/asm/cacheflush.h |  2 +-
 arch/riscv/kernel/smp.c             | 49 -----------------------
 arch/riscv/mm/cacheflush.c          | 61 +++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8f13074413a7..1f4ba68ab9aa 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -47,7 +47,7 @@ static inline void flush_dcache_page(struct page *page)
 
 #else /* CONFIG_SMP */
 
-#define flush_icache_all() sbi_remote_fence_i(NULL)
+void flush_icache_all(void);
 void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07ec281..17f491e8ed0a 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -199,52 +199,3 @@ void smp_send_reschedule(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
 }
 
-/*
- * Performs an icache flush for the given MM context.  RISC-V has no direct
- * mechanism for instruction cache shoot downs, so instead we send an IPI that
- * informs the remote harts they need to flush their local instruction caches.
- * To avoid pathologically slow behavior in a common case (a bunch of
- * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
- * IPIs for harts that are not currently executing a MM context and instead
- * schedule a deferred local instruction cache flush to be performed before
- * execution resumes on each hart.
- */
-void flush_icache_mm(struct mm_struct *mm, bool local)
-{
-	unsigned int cpu;
-	cpumask_t others, hmask, *mask;
-
-	preempt_disable();
-
-	/* Mark every hart's icache as needing a flush for this MM. */
-	mask = &mm->context.icache_stale_mask;
-	cpumask_setall(mask);
-	/* Flush this hart's I$ now, and mark it as flushed. */
-	cpu = smp_processor_id();
-	cpumask_clear_cpu(cpu, mask);
-	local_flush_icache_all();
-
-	/*
-	 * Flush the I$ of other harts concurrently executing, and mark them as
-	 * flushed.
-	 */
-	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
-	local |= cpumask_empty(&others);
-	if (mm != current->active_mm || !local) {
-		cpumask_clear(&hmask);
-		riscv_cpuid_to_hartid_mask(&others, &hmask);
-		sbi_remote_fence_i(hmask.bits);
-	} else {
-		/*
-		 * It's assumed that at least one strongly ordered operation is
-		 * performed on this hart between setting a hart's cpumask bit
-		 * and scheduling this MM context on that hart.  Sending an SBI
-		 * remote message will do this, but in the case where no
-		 * messages are sent we still need to order this hart's writes
-		 * with flush_icache_deferred().
-		 */
-		smp_mb();
-	}
-
-	preempt_enable();
-}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 498c0a0814fe..497b7d07af0c 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -14,6 +14,67 @@
 #include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 
+#ifdef CONFIG_SMP
+
+#include <asm/sbi.h>
+
+void flush_icache_all(void)
+{
+	sbi_remote_fence_i(NULL);
+}
+
+/*
+ * Performs an icache flush for the given MM context.  RISC-V has no direct
+ * mechanism for instruction cache shoot downs, so instead we send an IPI that
+ * informs the remote harts they need to flush their local instruction caches.
+ * To avoid pathologically slow behavior in a common case (a bunch of
+ * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
+ * IPIs for harts that are not currently executing a MM context and instead
+ * schedule a deferred local instruction cache flush to be performed before
+ * execution resumes on each hart.
+ */
+void flush_icache_mm(struct mm_struct *mm, bool local)
+{
+	unsigned int cpu;
+	cpumask_t others, hmask, *mask;
+
+	preempt_disable();
+
+	/* Mark every hart's icache as needing a flush for this MM. */
+	mask = &mm->context.icache_stale_mask;
+	cpumask_setall(mask);
+	/* Flush this hart's I$ now, and mark it as flushed. */
+	cpu = smp_processor_id();
+	cpumask_clear_cpu(cpu, mask);
+	local_flush_icache_all();
+
+	/*
+	 * Flush the I$ of other harts concurrently executing, and mark them as
+	 * flushed.
+	 */
+	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
+	local |= cpumask_empty(&others);
+	if (mm != current->active_mm || !local) {
+		cpumask_clear(&hmask);
+		riscv_cpuid_to_hartid_mask(&others, &hmask);
+		sbi_remote_fence_i(hmask.bits);
+	} else {
+		/*
+		 * It's assumed that at least one strongly ordered operation is
+		 * performed on this hart between setting a hart's cpumask bit
+		 * and scheduling this MM context on that hart.  Sending an SBI
+		 * remote message will do this, but in the case where no
+		 * messages are sent we still need to order this hart's writes
+		 * with flush_icache_deferred().
+		 */
+		smp_mb();
+	}
+
+	preempt_enable();
+}
+
+#endif /* CONFIG_SMP */
+
 void flush_icache_pte(pte_t pte)
 {
 	struct page *page = pte_page(pte);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
