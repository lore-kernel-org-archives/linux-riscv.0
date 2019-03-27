Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A06C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 10:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5C82070B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 10:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="juJiMMP8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mdKITtOR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="eKq5m7eA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5C82070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3AsAPWQItcdsg7atwXyx8/kze+T/kHRxOICg5m4yRmw=; b=juJiMMP8IlNx7l
	V81MJGrB29m2Pkvi5S7lLS30+llDrtJLwGcw5FKkzriSnBsUIKMWajfUxmmZJcmydXLsFMA/Vn68D
	D5mJxD3oF1OQp82IllwvqQnRyQbGPDsWPSm7z7b7LaRubSPFNyzCxZklogTBN+2/XtCHtEAQRvMZq
	KG2IByn5to9DusJex2UWVa6GrivD2+wnrhu/GG4cUvo1xAzDYqgx/3iKPmWgbLmNmGz4aEq9sBBsJ
	ZDS6IwilZTLdH4/lGEbI+7COfu/syFM00hERzUkqbyj8zDtBgoVsSpWXV7Bg8s+oU/nNe+zGM6I7P
	WjE7Bm/JhBm4JXV//xsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95OG-0001sq-Tj; Wed, 27 Mar 2019 10:02:36 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95OD-0001s4-5p
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 10:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553680953; x=1585216953;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WGhHsx2/IsbYasDR9yvpG5dyjHBhuI4rIX8oHYDhoMY=;
 b=mdKITtORsP66+9bNKVLFuMgo1C3ug/3HJ4C3pAXKd5pvWxzZ+4CQjRLw
 /hRxZqUc0QTMt3/l+VXwrtEXx7Iyke2Z3xSTEj29pFrU+qlnDFfbsOb8D
 tpkGnaghszmyOSOVGNeHgqnNhPIzAUpjBONnlT1pkWLQ/LIHzyThVey6H
 jgUai7gM1P+2jIxlHcH9PFhxJEq3G5q8UpTgUDoaja2mWgWciQiciqA3M
 Ba4vtIvVpxmOV1I+IoAc6OYEq/dFiUEYfLE8jeqsixUH+i6gr4Y8y3DTT
 zoEOgaYBBanC8GNR/aVDvcKqt2wQb07xO7zj+/Mm2Xhk2nBsCNefAOnZd w==;
X-IronPort-AV: E=Sophos;i="5.60,276,1549900800"; d="scan'208";a="209996981"
Received: from mail-sn1nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.51])
 by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2019 18:02:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbf8AQMOME0WIneMEQovolUDU7wpvy/c4nAg3Wk2owY=;
 b=eKq5m7eAYSTP3xSl/XlJJzdjzWIBAvx6rIt/xaklVtkNVny9zNkWNLPhI2GW0SraLs/lms1mmSyCcBtH2+M6ufkcwx8sjjxP5gFodpJsidqQZS9f0eJFZEJbWNwHo95obFC/iApeF6UBwGIjnaT6fG/MSyX1sdhli+Zc36unFB4=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4460.namprd04.prod.outlook.com (20.176.104.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Wed, 27 Mar 2019 10:02:24 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 10:02:24 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH] RISC-V: Implement ASID allocator
Thread-Index: AQHU5IQth95RRmVyw0y1O3lxWJG/3w==
Date: Wed, 27 Mar 2019 10:02:24 +0000
Message-ID: <20190327100201.32220-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:a03:80::33) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b5a453b-e4cb-4f4c-0e53-08d6b29b4f99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4460; 
x-ms-traffictypediagnostic: DM6PR04MB4460:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <DM6PR04MB4460BE1A9D979B7079018CFC8D580@DM6PR04MB4460.namprd04.prod.outlook.com>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(52116002)(110136005)(6116002)(8676002)(102836004)(8936002)(68736007)(81166006)(81156014)(1076003)(5660300002)(30864003)(71190400001)(71200400001)(99286004)(106356001)(54906003)(50226002)(3846002)(97736004)(316002)(2906002)(105586002)(86362001)(6486002)(66066001)(6306002)(6512007)(386003)(6506007)(966005)(72206003)(478600001)(186003)(2171002)(44832011)(7736002)(14454004)(256004)(14444005)(4326008)(25786009)(305945005)(26005)(36756003)(53936002)(6436002)(2616005)(486006)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4460;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 71sdw6AmTACftWrt5ylzuT3vyffPzwTDvjGa2R78WYDNJ/8UsmsGd9xzxHSLD37iDLP0qidWRMLwdecp5DBT4yKvb8lyNuRQ52PGRyuzvl3z5H7BBPnjRGRQhnuAwFYv7L+2wsw8MLcwC+WR051+1gyXRqopFO9Mlmm4hABrJibHjL0HqpVyhTfj5AIIVpr/Brgh8CfMu/QxW8fUtDkvCMRe8sYPFZZY/ZeCjmDzRoaA0db+Yz0Twnaai3cBMYi9QDbkDQYvfKtVLR2VpoS9IDE61T27N4HXPSAGjctf2NijXJib000lVmfZEtOJKw4VH4Og1+A1rz+AR8CoWByzbzKqpeQDcVxY4QOgDGhodSZKRZerg0QRqdvJ1Ttb0kPjaEm3OOkf9YsrkDh/yqoKRLsMpL63WwEFnmO+b3DKiOo=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5a453b-e4cb-4f4c-0e53-08d6b29b4f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 10:02:24.8382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_030233_432138_99929F1D 
X-CRM114-Status: GOOD (  24.09  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we do local TLB flush on every MM switch. This is very harsh
on performance because we are forcing page table walks after every MM
switch.

This patch implements ASID allocator for assigning an ASID to every MM
context. The number of ASIDs are limited in HW so we create a logical
entity named CONTEXTID for assigning to MM context. The lower bits of
CONTEXTID are ASID and upper bits are VERSION number. We allocate new
CONTEXTID on first MM switch of a MM context where the ASID is allocated
from an ASID bitmap and VERSION is provide by an atomic counter.

At time of allocating new CONTEXTID, if we run out of ASIDs then:
1. We flush the ASID bitmap
2. Increment VERSION atomic counter
3. Force local tlb flush on all CPUs
4. Re-allocate ASID from ASID bitmap
5. Force CONTEXTID re-assignment on all CPUs

Using above approach, we have virtually infinite CONTEXTIDs on-top-of
limited number of HW ASIDs. This approach is inspired from ASID allocator
used for Linux ARM/ARM64 but we have simplified it as much as possible.

Overall, this ASID allocator helps us reduce rate of local TLB flushes
on every CPU thereby increasing performance. The number of available
ASIDs are detected at boot-time by writing 1s to ASID bits in SATP CSR.
The ASID #0 is always reserved because it is used at boot-time for
initial MM context.

This patch is tested on QEMU/virt machine and SiFive Unleashed board.
On QEMU/virt machine, we see 10% (approx) performance improvement with
SW emulated TLBs and ASIDs provided by QEMU. Unfortunately, ASID bits
of SATP CSR are not implemented on SiFive Unleashed board so we don't
see any change in performance.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
This patch is based on Linux-5.1-rc2 and TLB flush cleanup patches v4
from Gary Guo. It can be also found in riscv_asid_allocator_v1 branch
of https://github.com/avpatel/linux.git
---
 arch/riscv/include/asm/csr.h         |   6 +
 arch/riscv/include/asm/mmu.h         |   1 +
 arch/riscv/include/asm/mmu_context.h |   1 +
 arch/riscv/mm/context.c              | 204 +++++++++++++++++++++++++--
 4 files changed, 200 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 28a0d1cb374c..ce18ab8f53ed 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -45,10 +45,16 @@
 #define SATP_PPN     _AC(0x003FFFFF, UL)
 #define SATP_MODE_32 _AC(0x80000000, UL)
 #define SATP_MODE    SATP_MODE_32
+#define SATP_ASID_BITS	9
+#define SATP_ASID_SHIFT	22
+#define SATP_ASID_MASK	_AC(0x1FF, UL)
 #else
 #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
 #define SATP_MODE_39 _AC(0x8000000000000000, UL)
 #define SATP_MODE    SATP_MODE_39
+#define SATP_ASID_BITS	16
+#define SATP_ASID_SHIFT	44
+#define SATP_ASID_MASK	_AC(0xFFFF, UL)
 #endif

 /* Interrupt Enable and Interrupt Pending flags */
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 5df2dccdba12..dcbbefb89ebc 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -18,6 +18,7 @@
 #ifndef __ASSEMBLY__

 typedef struct {
+	atomic64_t id;
 	void *vdso;
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index bf4f097a9051..785dd65aa904 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -30,6 +30,7 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
 static inline int init_new_context(struct task_struct *task,
 	struct mm_struct *mm)
 {
+	atomic64_set(&(mm)->context.id, 0);
 	return 0;
 }

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 0f787bcd3a7a..aa43f6aa727e 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -2,13 +2,158 @@
 /*
  * Copyright (C) 2012 Regents of the University of California
  * Copyright (C) 2017 SiFive
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
  */

+#include <linux/bitops.h>
 #include <linux/mm.h>
+#include <linux/slab.h>

 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>

+static bool use_asid_allocator;
+static unsigned long asid_bits;
+static unsigned long num_asids;
+static unsigned long asid_mask;
+static u64 first_version;
+
+static DEFINE_RAW_SPINLOCK(context_lock);
+static atomic64_t context_version;
+static unsigned long *context_asid_map;
+static cpumask_t context_tlb_flush_pending;
+
+static DEFINE_PER_CPU(atomic64_t, active_context);
+
+/* Note: must be called with context_lock held */
+static void __flush_context(void)
+{
+	int i;
+	u64 cntx, cntx_asid, cntx_ver;
+
+	/* Update the list of reserved ASIDs and the ASID bitmap. */
+	bitmap_clear(context_asid_map, 0, num_asids);
+
+	/* Mark already acitve ASIDs as used */
+	for_each_possible_cpu(i) {
+		cntx = atomic64_xchg_relaxed(&per_cpu(active_context, i), 0);
+
+		cntx_asid = cntx & asid_mask;
+		cntx_ver = cntx >> asid_bits;
+
+		if (cntx_ver)
+			__set_bit(cntx_asid, context_asid_map);
+	}
+
+	/* Mark ASID #0 as used because it is used at boot-time */
+	__set_bit(0, context_asid_map);
+
+	/* Queue a TLB invalidation for each CPU on next context-switch */
+	cpumask_setall(&context_tlb_flush_pending);
+}
+
+/* Note: must be called with context_lock held */
+static u64 __new_context(struct mm_struct *mm)
+{
+	static u32 cur_idx = 1;
+	u64 asid, ver = atomic64_read(&context_version);
+
+	/*
+	 * Allocate a free ASID. If we can't find one then increment
+	 * context_version and flush all ASIDs.
+	 */
+	asid = find_next_zero_bit(context_asid_map, num_asids, cur_idx);
+	if (asid != num_asids)
+		goto set_asid;
+
+	/* We're out of ASIDs, so increment the global version count */
+	ver = atomic64_add_return_relaxed(first_version,
+					  &context_version);
+
+	__flush_context();
+
+	/* We have more ASIDs than CPUs, so this will always succeed */
+	asid = find_next_zero_bit(context_asid_map, num_asids, 1);
+
+set_asid:
+	__set_bit(asid, context_asid_map);
+	cur_idx = asid;
+	return asid | ver;
+}
+
+static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
+{
+	unsigned long flags;
+	u64 cntx, old_active_cntx;
+
+	cntx = atomic64_read(&mm->context.id);
+
+	/*
+	 * If our active_context is non-zero and the context matches the
+	 * current version, then we update the active_context entry with a
+	 * relaxed cmpxchg.
+	 *
+	 * Following is how we handle racing with a concurrent rollover:
+	 *
+	 * - We get a zero back from the cmpxchg and end up waiting on the
+	 *   lock. Taking the lock synchronises with the rollover and so
+	 *   we are forced to see the updated verion.
+	 *
+	 * - We get a valid context back from the cmpxchg then we continue
+	 *   using old ASID because __flush_context() would have marked ASID
+	 *   of active_context as used and next context switch we will allocate
+	 *   new context.
+	 */
+	old_active_cntx = atomic64_read(&per_cpu(active_context, cpu));
+	if (old_active_cntx &&
+	    !((cntx ^ atomic64_read(&context_version)) >> asid_bits) &&
+	    atomic64_cmpxchg_relaxed(&per_cpu(active_context, cpu),
+				     old_active_cntx, cntx))
+		goto switch_mm_fast;
+
+	raw_spin_lock_irqsave(&context_lock, flags);
+
+	/* Check that our ASID belongs to the current version. */
+	cntx = atomic64_read(&mm->context.id);
+	if ((cntx ^ atomic64_read(&context_version)) >> asid_bits) {
+		cntx = __new_context(mm);
+		atomic64_set(&mm->context.id, cntx);
+	}
+
+	if (cpumask_test_and_clear_cpu(cpu, &context_tlb_flush_pending))
+		local_flush_tlb_all();
+
+	atomic64_set(&per_cpu(active_context, cpu), cntx);
+
+	raw_spin_unlock_irqrestore(&context_lock, flags);
+
+switch_mm_fast:
+	/*
+	 * Use the old spbtr name instead of using the current satp
+	 * name to support binutils 2.29 which doesn't know about the
+	 * privileged ISA 1.10 yet.
+	 */
+	csr_write(sptbr, virt_to_pfn(mm->pgd) |
+		  ((cntx & asid_mask) << SATP_ASID_SHIFT) | SATP_MODE);
+}
+
+static void set_mm_noasid(struct mm_struct *mm)
+{
+	/*
+	 * Use the old spbtr name instead of using the current satp
+	 * name to support binutils 2.29 which doesn't know about the
+	 * privileged ISA 1.10 yet.
+	 */
+	csr_write(sptbr, virt_to_pfn(mm->pgd) | SATP_MODE);
+
+	/*
+	 * sfence.vma after SATP write. We call it on MM context instead of
+	 * calling local_flush_tlb_all to prevent global mappings from being
+	 * affected.
+	 */
+	local_flush_tlb_mm(mm);
+}
+
 /*
  * When necessary, performs a deferred icache flush for the given MM context,
  * on the local CPU.  RISC-V has no direct mechanism for instruction cache
@@ -58,20 +203,55 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	cpumask_clear_cpu(cpu, mm_cpumask(prev));
 	cpumask_set_cpu(cpu, mm_cpumask(next));

-	/*
-	 * Use the old spbtr name instead of using the current satp
-	 * name to support binutils 2.29 which doesn't know about the
-	 * privileged ISA 1.10 yet.
-	 */
-	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
+	if (use_asid_allocator)
+		set_mm_asid(next, cpu);
+	else
+		set_mm_noasid(next);
+
+	flush_icache_deferred(next);
+}
+
+static int asids_init(void)
+{
+	unsigned long old, new;
+
+	/* Figure-out number of ASID bits in HW */
+	old = csr_read(sptbr);
+	new = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
+	csr_write(sptbr, new);
+	new = (csr_read(sptbr) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
+	asid_bits = fls_long(new);
+	csr_write(sptbr, old);
+
+	/* Pre-compute ASID details */
+	num_asids = 1UL << asid_bits;
+	asid_mask = num_asids - 1;
+	first_version = num_asids;

 	/*
-	 * sfence.vma after SATP write. We call it on MM context instead of
-	 * calling local_flush_tlb_all to prevent global mappings from being
-	 * affected.
+	 * Use ASID allocator only if number of HW ASIDs are
+	 * at-least twice more than CPUs
 	 */
-	local_flush_tlb_mm(next);
+	use_asid_allocator =
+		(num_asids <= (2 * num_possible_cpus())) ? false : true;

-	flush_icache_deferred(next);
-}
+	/* Setup ASID allocator if available */
+	if (use_asid_allocator) {
+		atomic64_set(&context_version, first_version);
+
+		context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
+				   sizeof(*context_asid_map), GFP_KERNEL);
+		if (!context_asid_map)
+			panic("Failed to allocate bitmap for %lu ASIDs\n",
+			      num_asids);

+		__set_bit(0, context_asid_map);
+
+		pr_info("ASID allocator using %lu entries\n", num_asids);
+	} else {
+		pr_info("ASID allocator disabled\n");
+	}
+
+	return 0;
+}
+early_initcall(asids_init);
--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
