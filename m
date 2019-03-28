Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DD1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9215421773
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="otYPlheJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PNmzPJxQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="A72yZ9+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9215421773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H3qxyYhH+kZ0yhpZmJqvH/Zsig5DM26ffmmzgBx25xA=; b=otYPlheJPOBSL9
	vs4L3OEma3PI2VET4eopykcWuZGn+Cb/DQLMjMlASltvRuIvQfs8uyxPG+z5tFpXtdLPJ0vcbR9S6
	5/joWPk3yltZCPgEJyazK7RGeyQfruCvId3pI1md0XEWIdx50uvG5heeBRkBbL5QOgxCuyzjcvi8P
	SX1erTOsdH7uyuStIlobNX8oy6tPHxhCb+6NvCqiGmFmX5PjocbZwm5P9MKzAq3pClQVR7XJFrOhn
	7JBaSXC1wAajBiGkMIBTObzicoIpjm0M0jf6Wcw15JE2M77E1IXg+pzSDmuXnOuS9UGOrYY7nvivj
	xK2gTyqpXBUJDf7esWOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Oal-0003E8-1R; Thu, 28 Mar 2019 06:32:47 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Oag-0003DS-8D
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 06:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553754763; x=1585290763;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tzV79LsVyOAbHeW5xQ+RKSVY1UGGitM+oXdK+ImwdK8=;
 b=PNmzPJxQvIHkVJcbe77pv59xEGXHQpiICQnzp5vU+8gCpPDCEX+SgfbS
 bcilKcwnfVJqGPhRPdwy65DYlDZpk5kqxhWdtHv2HRoEjscItu5B/Ea43
 JpnX1pvq5/x/izkeOPKP4a3nSw8d97EOl8J72HDiFoLrX7ixWE+qBKgPo
 HFH8xyIjXyxEGxSa1I3tDctlAO8eaig3YjME0pBkKAi13S8q5+k00YL7a
 XwYv1mqAOt28EdNy/H5hlxN6i1CKZZpzLMAoDZIiMlaVK5Fmm7M4CrGfA
 o9T+77Rg9BTg8+XW9i13Nh0ai8zZ1UUg6pNvW9HwqIEQXa5s0pSo3q4Ya g==;
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="105791381"
Received: from mail-cys01nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.52])
 by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2019 14:32:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHRaJLO3g1/2FGgj/eVrKud42fYHZl/49ujJ8u1MW9o=;
 b=A72yZ9+IzspsE5RB+6nryTI09fURxaTAw+oQqpG5I1e9tct1PqhV/DJgkVEIcJo80EWGVSOB9qqP+uT1Rhu3XruMQb5Pfhjlt5UzUji5flYJ4Ns+WlN6KlbJqyw/JyO8C2zGxxaaUuVNUKos8OSq5cIfvqyIDy4ISMNpbHCayoQ=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5983.namprd04.prod.outlook.com (20.178.248.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Thu, 28 Mar 2019 06:32:36 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1750.014; Thu, 28 Mar 2019
 06:32:36 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Index: AQHU5TAIKaRDCttA7UazIjpcDaomMA==
Date: Thu, 28 Mar 2019 06:32:36 +0000
Message-ID: <20190328063211.13052-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::27) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.49.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d06e27e-f31d-4bd5-0688-08d6b3472aac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5983; 
x-ms-traffictypediagnostic: MN2PR04MB5983:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB59838430C6A3534F9756B7FB8D590@MN2PR04MB5983.namprd04.prod.outlook.com>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(136003)(366004)(376002)(346002)(396003)(189003)(55674003)(199004)(81166006)(476003)(316002)(8676002)(110136005)(8936002)(25786009)(3846002)(66066001)(68736007)(81156014)(71190400001)(14444005)(44832011)(486006)(36756003)(2906002)(256004)(2616005)(6506007)(6116002)(71200400001)(26005)(53936002)(30864003)(102836004)(14454004)(55236004)(86362001)(1076003)(4326008)(186003)(99286004)(105586002)(52116002)(6306002)(54906003)(6436002)(386003)(6512007)(50226002)(97736004)(966005)(2171002)(478600001)(106356001)(72206003)(6486002)(5660300002)(7736002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5983;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jOhD+ohLzl32e4pT+KWio3nLbXgUHFG238AROoTVcGZHqCalUVFs39AEkDApNfsMeg69rQKOKhb4MzI8kAlFqHfEHH36VlSm5ElCti+3yppdRD9W2gCA21HQP+ifFKpJZndaczcYRt3khAjk+t4kMzVYYCsPa6n+VrbETE7h7vZ2O7gtglS5tC7mjnfj4JRM3ny1pJgOzcsevVjZR+2jWjDuVmvtoOzEfUvzG8FGK+kusOmn5pJdGB5rrDtN8i+jkKomKGY1ejvBSeMi77ZxWvSGCS9Ct/NG8Wsi2mPMaYGEIzShBIWQdiDMeKMjTSBL8Q97rmGADtS0XQo8zHDskjfWxwb31jjswKa4OAe2lbAgTHIwJjgXXkMizPf2gpkHyeE9xYJycRSNEgHTjhLk0n1tsQqY2N2uyLgCOzpHgzQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d06e27e-f31d-4bd5-0688-08d6b3472aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 06:32:36.4614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_233242_554451_157730C6 
X-CRM114-Status: GOOD (  26.61  )
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
CONTEXTID are ASID and upper bits are VERSION number. The number of
usable ASID bits supported by HW are detected at boot-time by writing
1s to ASID bits in SATP CSR. This means last ASID is always reserved
because it is used for initial MM context.

We allocate new CONTEXTID on first MM switch for a MM context where
the ASID is allocated from an ASID bitmap and VERSION is provide by
an atomic counter. At time of allocating new CONTEXTID, if we run out
of available ASIDs then:
1. We flush the ASID bitmap
2. Increment current VERSION atomic counter
3. Re-allocate ASID from ASID bitmap
4. Flush TLB on all CPUs
5. Try CONTEXTID re-assignment on all CPUs

Using above approach, we have virtually infinite CONTEXTIDs on-top-of
limited number of HW ASIDs. This approach is inspired from ASID allocator
used for Linux ARM/ARM64 but we have adapted it for RISC-V. Overall,
this ASID allocator helps us reduce rate of local TLB flushes on every
CPU thereby increasing performance.

This patch is tested on QEMU/virt machine and SiFive Unleashed board.
On QEMU/virt machine, we see 10% (approx) performance improvement with
SW emulated TLBs provided by QEMU. Unfortunately, ASID bits of SATP CSR
are not implemented on SiFive Unleashed board so we don't see any change
in performance.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
Changes since v1:
- We adapt good aspects from Gary Guo's ASID allocator implementation
  and provide due credit to him by adding his SoB.
- Track ASIDs active during context flush and mark them as reserved
- Set ASID bits to all 1s to simplify number of ASID bit detection
- Use atomic_long_t instead of atomic64_t for being 32bit friendly
- Use unsigned long instead of u64 for being 32bit friendly
- Use flush_tlb_all() instead of lazy local_tlb_flush_all() at time
  of context flush

This patch is based on Linux-5.1-rc2 and TLB flush cleanup patches v4
from Gary Guo. It can be also found in riscv_asid_allocator_v2 branch
of https://github.com/avpatel/linux.git
---
 arch/riscv/include/asm/csr.h         |   6 +
 arch/riscv/include/asm/mmu.h         |   1 +
 arch/riscv/include/asm/mmu_context.h |   1 +
 arch/riscv/kernel/head.S             |   2 +
 arch/riscv/mm/context.c              | 249 +++++++++++++++++++++++++--
 5 files changed, 247 insertions(+), 12 deletions(-)

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
index 5df2dccdba12..42a9ca0fe1fb 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -18,6 +18,7 @@
 #ifndef __ASSEMBLY__
 
 typedef struct {
+	atomic_long_t id;
 	void *vdso;
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index bf4f097a9051..ba6ab35c18dc 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -30,6 +30,7 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
 static inline int init_new_context(struct task_struct *task,
 	struct mm_struct *mm)
 {
+	atomic_long_set(&(mm)->context.id, 0);
 	return 0;
 }
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..c3f9adc0d054 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -95,6 +95,8 @@ relocate:
 	la a2, swapper_pg_dir
 	srl a2, a2, PAGE_SHIFT
 	li a1, SATP_MODE
+	li a0, (SATP_ASID_MASK << SATP_ASID_SHIFT)
+	or a1, a1, a0
 	or a2, a2, a1
 
 	/*
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 0f787bcd3a7a..1205d33d1b1b 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -2,13 +2,209 @@
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
+static unsigned long first_version;
+
+static atomic_long_t current_version;
+
+static DEFINE_RAW_SPINLOCK(context_lock);
+static unsigned long *context_asid_map;
+
+static DEFINE_PER_CPU(atomic_long_t, active_context);
+static DEFINE_PER_CPU(unsigned long, reserved_context);
+
+static bool check_update_reserved_context(unsigned long cntx,
+					  unsigned long newcntx)
+{
+	int cpu;
+	bool hit = false;
+
+	/*
+	 * Iterate over the set of reserved CONTEXT looking for a match.
+	 * If we find one, then we can update our mm to use new CONTEXT
+	 * (i.e. the same CONTEXT in the current_version) but we can't
+	 * exit the loop early, since we need to ensure that all copies
+	 * of the old CONTEXT are updated to reflect the mm. Failure to do
+	 * so could result in us missing the reserved CONTEXT in a future
+	 * version.
+	 */
+	for_each_possible_cpu(cpu) {
+		if (per_cpu(reserved_context, cpu) == cntx) {
+			hit = true;
+			per_cpu(reserved_context, cpu) = newcntx;
+		}
+	}
+
+	return hit;
+}
+
+/* Note: must be called with context_lock held */
+static void __flush_context(void)
+{
+	int i;
+	unsigned long cntx;
+
+	/* Update the list of reserved ASIDs and the ASID bitmap. */
+	bitmap_clear(context_asid_map, 0, num_asids);
+
+	/* Mark already acitve ASIDs as used */
+	for_each_possible_cpu(i) {
+		cntx = atomic_long_xchg_relaxed(&per_cpu(active_context, i), 0);
+		/*
+		 * If this CPU has already been through a rollover, but
+		 * hasn't run another task in the meantime, we must preserve
+		 * its reserved CONTEXT, as this is the only trace we have of
+		 * the process it is still running.
+		 */
+		if (cntx == 0)
+			cntx = per_cpu(reserved_context, i);
+
+		__set_bit(cntx & asid_mask, context_asid_map);
+		per_cpu(reserved_context, i) = cntx;
+	}
+
+	/* Mark last ASID as used because it is used at boot-time */
+	__set_bit(asid_mask, context_asid_map);
+}
+
+/* Note: must be called with context_lock held */
+static unsigned long __new_context(struct mm_struct *mm,
+				   bool *need_tlb_flush)
+{
+	static u32 cur_idx = 1;
+	unsigned long cntx = atomic_long_read(&mm->context.id);
+	unsigned long asid, ver = atomic_long_read(&current_version);
+
+	if (cntx != 0) {
+		unsigned long newcntx = ver | (cntx & ~asid_mask);
+
+		/*
+		 * If our current CONTEXT was active during a rollover, we
+		 * can continue to use it and this was just a false alarm.
+		 */
+		if (check_update_reserved_context(cntx, newcntx))
+			return newcntx;
+
+		/*
+		 * We had a valid CONTEXT in a previous life, so try to
+		 * re-use it if possible.
+		 */
+		if (!__test_and_set_bit(cntx & asid_mask, context_asid_map))
+			return newcntx;
+	}
+
+	/*
+	 * Allocate a free ASID. If we can't find one then increment
+	 * current_version and flush all ASIDs.
+	 */
+	asid = find_next_zero_bit(context_asid_map, num_asids, cur_idx);
+	if (asid != num_asids)
+		goto set_asid;
+
+	/* We're out of ASIDs, so increment current_version */
+	ver = atomic_long_add_return_relaxed(first_version, &current_version);
+
+	/* Flush everything  */
+	__flush_context();
+	*need_tlb_flush = true;
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
+	bool need_tlb_flush = false;
+	unsigned long cntx, old_active_cntx;
+
+	cntx = atomic_long_read(&mm->context.id);
+
+	/*
+	 * If our active_context is non-zero and the context matches the
+	 * current_version, then we update the active_context entry with a
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
+	old_active_cntx = atomic_long_read(&per_cpu(active_context, cpu));
+	if (old_active_cntx &&
+	    !((cntx ^ atomic_long_read(&current_version)) >> asid_bits) &&
+	    atomic_long_cmpxchg_relaxed(&per_cpu(active_context, cpu),
+					old_active_cntx, cntx))
+		goto switch_mm_fast;
+
+	raw_spin_lock_irqsave(&context_lock, flags);
+
+	/* Check that our ASID belongs to the current_version. */
+	cntx = atomic_long_read(&mm->context.id);
+	if ((cntx ^ atomic_long_read(&current_version)) >> asid_bits) {
+		cntx = __new_context(mm, &need_tlb_flush);
+		atomic_long_set(&mm->context.id, cntx);
+	}
+
+	atomic_long_set(&per_cpu(active_context, cpu), cntx);
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
+		  ((cntx & asid_mask) << SATP_ASID_SHIFT) |
+		  SATP_MODE);
+
+	if (need_tlb_flush)
+		flush_tlb_all();
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
@@ -58,20 +254,49 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
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
+	/* Figure-out number of ASID bits in HW */
+	asid_bits = (csr_read(sptbr) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
+	asid_bits = fls_long(asid_bits);
+
+	/* Pre-compute ASID details */
+	num_asids = 1 << asid_bits;
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
+		atomic_long_set(&current_version, first_version);
 
+		context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
+				   sizeof(*context_asid_map), GFP_KERNEL);
+		if (!context_asid_map)
+			panic("Failed to allocate bitmap for %lu ASIDs\n",
+			      num_asids);
+
+		__set_bit(asid_mask, context_asid_map);
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
