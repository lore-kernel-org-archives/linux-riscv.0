Return-Path: <SRS0=iCzv=RJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4492C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2019 17:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8014320661
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2019 17:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Py3vFhkO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DIl7dXRi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8014320661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZXvhkOHSzw+Eoqw1eOBZ5ZJYuOnbcA2w9UWsDLkRtUI=; b=Py3vFhkO04tt0E
	PGXX2JRPnu5fFZt0tM66HYcbLr+a4CFK2MB3dZqLszkT34mvbZoyY9qwEJOUhe1MyVwona4E/B/Ry
	iZP8RoyMtdewYzoYc+11peSpJH7dNCJdTm4Dr4iInSgW3ZpMiYlVr4f8erV/BDpRbL3Gt5gHm1uB2
	syvRDrDyzR0Rt4tyBx3LVT1tKKYQjbo8Eauz3cTn+gyH9MeDBo94zgzdkTeAQpkN1Kw7xYYtDIYqr
	NMx5KjIpn8SbXzQIsKN6g/CvdPtoZLr54jtaDllaKA4cgqIa/No5MvERKCYgqCKWNxQRb/kXorNnD
	AL7jq6AYp7b5tegFnPvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ZuB-00024H-Bb; Wed, 06 Mar 2019 17:00:31 +0000
Received: from mail-eopbgr100139.outbound.protection.outlook.com
 ([40.107.10.139] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1Zu8-00023O-3Q
 for linux-riscv@lists.infradead.org; Wed, 06 Mar 2019 17:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfyJSEy40YGzyqYZU3K47P6ZOAVCJufypxfSZ03N530=;
 b=DIl7dXRi2VL3EnpqijTuvFlM3rH048GnNQ1ZsMpr61K//nyQK8AYcPuRgEBwS4hhtaNOj8sOHgXE42HkDkBEz6NkVOsdi1kr/47O2TFF3hU6JTC1Dq9Nj2aSWBjPGXjM0yB9HOQYUw0f4T+o93lIduWoCkBjCsCVOnfS3QPfTLk=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0637.GBRP265.PROD.OUTLOOK.COM (10.166.105.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.18; Wed, 6 Mar 2019 17:00:23 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::edd6:26d6:eea4:dfa9%4]) with mapi id 15.20.1686.016; Wed, 6 Mar 2019
 17:00:22 +0000
From: Gary Guo <gary@garyguo.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: move flush_icache_{all,mm} code to proper location
Thread-Topic: [PATCH] riscv: move flush_icache_{all,mm} code to proper location
Thread-Index: AdTUPa193Tky2RTWTjWRNr9wNwIdkA==
Date: Wed, 6 Mar 2019 17:00:21 +0000
Message-ID: <LO2P265MB0847855A503C55BB11A59A89D6730@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:470:6972:501:87a:d393:5800:ff8e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86dc1b47-5aed-4543-28b1-08d6a25538bf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0637; 
x-ms-traffictypediagnostic: LO2P265MB0637:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; LO2P265MB0637;
 23:u5isfq9yrcuThH/JNbK5zQU+cQhiV/+oiR++QH6Fv?=
 =?us-ascii?Q?DFVrrt3NWF+fZZ2znBULC2sMz1YPKkcrJXTJI8SLQjfDT8k+/bE0esuvv/KT?=
 =?us-ascii?Q?RfPijW/WaW6GjEBYBAEmYJZ21i4/YUkg5Z3KSMPMLXKwjXO1JzEXxTXciSzl?=
 =?us-ascii?Q?oK4K1ANF5+MqceLtkn182TRgkTlbP7p+rO9ZrcqBO3B/ihrHdPsCcqSTmgI3?=
 =?us-ascii?Q?Kok4SEvyIiyCabQIQ6/00tzorFruqH+I56pxN5m6cg5W7m/ZKt5AmxeSLjXK?=
 =?us-ascii?Q?pkI5/phWtURrsQM5KHeiDrcDZkqoidmPT8KPMto3xnHHERkuzzLCZj4IT9ih?=
 =?us-ascii?Q?ZpS9A44Ikj51zyLaaul+eQBiU8L6OPh1N+NOAaXvV0NUxuHQwp98MeFtzvBZ?=
 =?us-ascii?Q?np/nOYPZ0e/QdFdpcgr9aaCqlxlA2iYNDJu+22BF9DVC2YOPlWsZSydyWvMG?=
 =?us-ascii?Q?oaFrugQlLHne5id/xVVHMk94Z399T+6a1QjVNGfqlCHjGAM0G6zKLG1lr+Yc?=
 =?us-ascii?Q?xiZqmDJr/AnAFGFX5MmFhg2zUwtpKVD7V0q9Ygcfhc5d/tcEjgMIX1IBjegb?=
 =?us-ascii?Q?XODGNL3euOHPvZXzja0cm2m6XZjFDzyA6O/u1Z6La/61Bh/TOXpA3aPVPlkq?=
 =?us-ascii?Q?Fc0qX/TLuUKh2V6ssZ8IlSwpZ3dbsNyrugAtI24ACk8NPbzzsUe+sJZutfNQ?=
 =?us-ascii?Q?A7AG6a0taVZsC5beSg8QbeOF6mt049pVPMJhqRpdJHjwRq6YhXHk9ArB3P3C?=
 =?us-ascii?Q?q+HfUKyo+iDqnDMp05mRNht9ZY7ZCr7TjKp/4XPKorRAJ61676JZy8V4Xxam?=
 =?us-ascii?Q?hZ4eeQrLRPtsh6mWI37YzeIlSmODjILiMpKmia0Cq0EnesmUeXIY/kAOABA8?=
 =?us-ascii?Q?lQ6gcQkZSAREPxACjGATCccMRTcf71uo1OQBjQyuFB5s3vhXV430Tvc/7qty?=
 =?us-ascii?Q?9LPk+kc8zzuvzCGKrMHKW/Fbk87nyP8oYLLFa6QBtGe0Lvel0JtWtZ0xhFlm?=
 =?us-ascii?Q?hmV6oRzT+ousNOMqdi2wJT1W9ikUDwQgCWer1DlE5N0VVNmwgCKH9ueSFh07?=
 =?us-ascii?Q?jENHCXbePCRRHa57MFP00fvTREz8wNPz/Ho8rr9IiQ1UBhY84Xo21zPpEb5D?=
 =?us-ascii?Q?gBSUaCOO5Xk6/wdLwYwpxWbpEpecSYW?=
x-microsoft-antispam-prvs: <LO2P265MB0637429C6D36B2E30E5D6833D6730@LO2P265MB0637.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(136003)(39830400003)(346002)(199004)(189003)(8936002)(53936002)(486006)(9686003)(8676002)(97736004)(81156014)(2906002)(14454004)(81166006)(86362001)(55016002)(6916009)(7696005)(5660300002)(316002)(74316002)(6346003)(102836004)(5640700003)(7736002)(508600001)(99286004)(305945005)(6116002)(2501003)(25786009)(2351001)(33656002)(68736007)(106356001)(14444005)(256004)(6506007)(476003)(71200400001)(6436002)(46003)(71190400001)(186003)(105586002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0637;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a3dsIKnNrhShRYY6YWD0fwAjgBvZXWTkbEJevZALexuak3dp+nUqdzC97avu7mw1QeDkmAW7D4dkCprqmBrOhfQalHVlq6X3+rYj6MGl1al6Hg8jqLPnFvjL1ka4Pkx/Eddj+ZoJgsqnk1rvyIP0HnZi4a5o7eU6d8FdEQ8N7UeI+RPWkjaNS0iyYw1whzIyhaO3QMflJg8Ycf/3DXNMXKQpbrA24GGuoSoN3Yzc3+lDwd2lsV5J0+IRpccU4AAVgdlYBsTEQ8e1q9612+rtVluhYjAjiT68vQIUQVF4erwUZLGwvzTf6qWztpARL9T2tdEnvNpZQ7fz8DHdqyG+jWxIsclHO6ZkuoAjeYEWITykLUkcE111eD4+e2mt3HBvyMRCV4cmLKBS1rjPOktrTrsdLY7f02onkJw3TdglPZw=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dc1b47-5aed-4543-28b1-08d6a25538bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 17:00:22.6174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_090028_195063_8B9C91C9 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, flush_icache_all is macro-expanded into a SBI call, yet no
asm/sbi.h is included in asm/cacheflush.h. This could be moved to
mm/cacheflush.c instead (SBI call will dominate performance-wise and there
is no worry to not have it inlined.

Currently, flush_icache_mm stays in kernel/smp.c, which looks like a hack
to prevent it from being compiled when CONFIG_SMP=n. It should also be in
mm/cacheflush.c.

Signed-off-by: Xuan Guo <gary@garyguo.net>
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
index 57b1383e5ef7..f066344aaf42 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -162,52 +162,3 @@ void smp_send_reschedule(int cpu)
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
