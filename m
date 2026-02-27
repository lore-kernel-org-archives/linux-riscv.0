Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69727FEFB5D
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOC1PbGafzzUJp+n2CSZRnTnTH9ahY4vt/FX1e6xfWQ=; b=kRWVTsxJRAWb1N
	aSHYqJDo1Smabm4hGa0AtMG4P90hu6uUN1oIN0zFyEZYEFGA31SeXyfL27mEmNE9tNAKRQiVBzQgG
	A0p2FbvGNeATCTw/WkU37mgkQkncgIFXn7s+K4K1qoQxFQddpW49E1oQYoM/8OHhY2xYZhA94j4tk
	D3548XAuP/QpIhVawbtZOUYXk1aFvDiXz/Hj4P//uphi2PzhB/sG0ZC3gc12zp1IYrUKDkAnCra2G
	m+cf7WwdwKNKvXgVtPJwHclJH6zYidMM7h5haD3blujS5ZsyE0u+x312zimpwQD2YrGc2gJWtcE5x
	4m0zw2LK2k01EWcBDUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzj3-00000008bvE-10Fx;
	Fri, 27 Feb 2026 15:25:57 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzj0-00000008btB-2qyY
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 15:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcVLaZQYdWHAZBUEjuy3zQOk0gKn6VBtIy1xcUwOjrCG0rSzYVtx1iIYCbLhJyOiYAcS9NvdyFQTktRyLpCiIvAocUWLvKA74LCu25x4z/M727hnEQ0s2soxYaHZMvQ8uxyzt0Oxs4IHMVChONeK1n/3YK5muH5eEPNIBD0Wkoetqq3vKy3Z5d4Te0Xk+YFsIWB9+QPdYhtxRol2R44Pb4EO1ImjzcyZ7m14YAwEvrt/54+z1k7qJUa1fWsUKqVG0jETosDjURem9lW767i+qHLCc//L5Ut4RCswolvjsE/fyQBHni89If5L2jx4rhl1/AD1UIlLqj1rJk55cjx7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuVjgDhAuZM2iiwXz0FnJXs7F1x7q07QYyv0b05PbyI=;
 b=auW2rR6Q4Ikk86ZCihOBrMLiQC7LsTvdJNyHFgyfzQQvYj0GVtBr5QlBtvuZ++kFhvwUUy4vR7ccyZyENFU2n4c2NLNWQnlpdy3+e0VnH+08BV4cnVbxJeHsLAYOCQkAR3SovBAlGrS83bloL7OUtLZ+T5ae1+6PnZvsdG2/jhApVifs8o8Sw4GL9qtg2BxTElNHgn4ImMI1BsM40qXeYZ5xVk+CfbLAQ5QMyWMApoQUh3LWgc3R1LiC8e87gZ5ucwigv0D2OiwBLJ2MS0gueem0hHQOxGAfGykG9QJiMD+ETMbAouM0HsZLmf46Em3ebynihVM1SmI200iGXnT8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuVjgDhAuZM2iiwXz0FnJXs7F1x7q07QYyv0b05PbyI=;
 b=DqiU60XNCi3UDwR/ENql86rbn984eF0GkkPksoLO+k36uEVMQJtpHFiYQlTu1Cj6i5HcTjiApyZMy8WezK6uwx2uTnK80lIShOdNrX/Y7o7v0ypwVgn2OE2QpauT0FEFl4NKqB6DQ3N6EJ1Vuncz1DGnuEWfFHf1RAxdQkRyehYvMxnZ24/IHqgxEt61spyy3/gcR7uZrZA6SEhzMiX/zpn3Gxn7DfhnW50AeSbIqk9h0PO2U8c3APvxwiD6AC2mgypmvUlMhxr4eicXXyUhM3s3NuiJEZ5mlb3brjI3IGfH9EuVeg47/lOW17L6k6dUWzdpeJpw5Ucor3Zt5jjRUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:25:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:25:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Joerg Roedel <jroedel@suse.de>,
	lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>,
	patches@lists.linux.dev,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	xieyongji@bytedance.com
Subject: [PATCH v4 6/6] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
Date: Fri, 27 Feb 2026 11:25:41 -0400
Message-ID: <6-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
References: 
X-ClientProxiedBy: MN2PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:208:239::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY5PR12MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 25494f4c-4143-4db3-6b7c-08de76147815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: XZp/EfElWNOfjYD6y0rmetJLxLP2dFlaVbsGhDnit6kH1wPTGi5h3qiNchflhu2oN71L5Ps0dUkBJkV5ZpEV/W7Tsfi5Lhg9/VeAXNcQutMxvVzxAO2xFJxZwUaw0Ae6DqluDhlQyXfSvM+yzRqsp9gnj+ApwEWJSRkq89UEXC+lNQF0A3MKECdDwZ4Sv42za1FyqOmtcz1xpSclyLsTarf+lbJGtuWW/2WlXO1BztjUjFzJXO8sURLLN7H7krWnvI/eSb5wmUeAyu09vrhOpjsvvxb2QJ0BWsQj0VRtuaFodN5cexCEzf90YU1UOIhUqxoUwSR1X99E961e+AIyB+KW4iDtMMMv7mNe5fHuHPxuE5+RxImM1WVIUPrEfli2Aot1HrB+dJZCUH1Ct1INrmwwaa4nJHUiISHBp69QrlYqQ3VHmMeRzccFkX3ASnKy8mZk8NT5pWdYp1PQCi2oO3rPAWPG8JKGUiLglbFXif6xaJdRZfBTcduCyJuzswCggpQiSmrsVowT2wF8VfWlAMqGORfJ2bCLoLUkLVRSx9uyurf1fmyW8MBBX4fDAQbyG22c00pOEp7TPAmOwTFVeS972NLMxmhm2fyocHI1UWgOgYrJiPK9qHbFsBE65Wg8+c1mfIJIscgqUTsBVePsRyyZ0pgs/rstoa2wLMemUnSFIs4OJ1/nyhiLL7CqEq/ZJFJ5ARLw59vwwHsGY5vo8Jpl7UmV3Bulhs01VOVdAnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p1oUTWB4P2ZEWFzNOwbrEkYZqh1fwkNraW13vS3tR6rzH7QSJbGFCxCGQtAV?=
 =?us-ascii?Q?lDg6H6+o2/wkiF4jG+t4WYgZbXFg780KBtO7+cEUlTmFSIb/k0bzsfZfbuk0?=
 =?us-ascii?Q?Kh9Zr/PBP9KjAULsCu1KtcJ9+cRdDBfqT/hQfkKMnFWVgYnyJcTNq+CfpKhy?=
 =?us-ascii?Q?eJFh1oYRMMtGXJ5wsJSHn6tVORRssCj+8ITNnKhe5ZPocON24n7+RHpqkIAz?=
 =?us-ascii?Q?USqaHcCXuSF1SzJ4tbi2Tb8mUPG6bSXEhiq+S2+YP3eUwmksioPdMILEor9P?=
 =?us-ascii?Q?x+6QAw2AcU3EcVXdxzIDtVhVqur/1ZcQIN8JGFn0Qk7FqYNSyMV/3gwDwiC6?=
 =?us-ascii?Q?eeVCa9GDPOl5i5I5UNv4HD+VdQjvNvKrw42he/zEm4o2vb7tkf+dMYVFC8nL?=
 =?us-ascii?Q?zHQvFpOFh9iKafctVHhGVnpEjJbemSaZM9LKPXJj4OR90kZ5fpQJxM6Kc/MM?=
 =?us-ascii?Q?hdFH9MiDpXlRMbq+GzGY7HCiec5EmXkaXjeinfIieZnMOsRoG5hmAGBALYb/?=
 =?us-ascii?Q?SdL3UvUM9r/G6hYcx0IYlbiVL5YqF0ccZU3dBoiizSqxzLN+V6AzOyEiR/NG?=
 =?us-ascii?Q?tP7/4xgLOxeGzOObTBB9pRDT9L9dpGtZapjf7uFV09Wv8AI2cplImi1KhaKy?=
 =?us-ascii?Q?vDrGCkIrv36VhJRPOsiY+KMBHUdScEfVWimTFvbuQOH8XoON4RN/klOeQvJO?=
 =?us-ascii?Q?lVohfNa42GJoGz+Irido1hmI5NSdI81kJnxjXGdaG1f6Dpyom6XdRlWv+D6Y?=
 =?us-ascii?Q?C0h4bm6jLUMAzUOCooWTaXRyEOFinIlff0upER3nKPUb3kFCQ5my4YtYh2zj?=
 =?us-ascii?Q?YL1302bZzO2ILnzNCc76FSVHSmKWfBy9/swXqtu8sgvkRjPtrckmfYT2fZ1S?=
 =?us-ascii?Q?dLrPCYvNEEdp0UJTSZF6a/anxAbgJXclMhNYiAVHdECalwrdzgS/bhZEskw9?=
 =?us-ascii?Q?Lz0/Ag4JnR3hm7qOUi/qay8bbYLEz6d/ucfBVlTbQSBzZtkb7+2uj/mM3FgQ?=
 =?us-ascii?Q?36m7Kw5MZeD+jnI4Ujq6slB/xXPbT9JPAx8VU4laNtueY3DjXF27mmoKrVMj?=
 =?us-ascii?Q?jYgyGFMATXqCVVx4NMOs7awDt5UVVN4KKBkKEta7RQ1JNOvaoZY54wLY+E8O?=
 =?us-ascii?Q?i1qc4A6hPMTLQzOn6n7KZ78E2FNK/aOxd5RAA4WGq8Awk4OKanQ/PCrq9De/?=
 =?us-ascii?Q?fracJm5Uchjm4J8XgfmXLomshfBwi4+a1wvpK4Kc4UobBfAAUN9S80jXz0po?=
 =?us-ascii?Q?LJbIGuaJy8fO8x6wNBFuhcf80wcdTyHrQ4pv/8+Du7qPlBvmlEsCQnO08Ve6?=
 =?us-ascii?Q?jssoeebJLcMGQGao396PniR0BHWXkmoKNT6Ulp49T9siSb21KBlGT5wdqmv+?=
 =?us-ascii?Q?dQhn2EXEPYMN7+JdBKXZ8QxF/x/cE9d7VgAxRMQWrAkHlHD4oOsgOBS+mvJt?=
 =?us-ascii?Q?QTFLELq09iwWAScrQS1eHrDigRO/Dg8MoPCyXwRtVFUl8Kcl8v4T4eNusYjz?=
 =?us-ascii?Q?LWS44rk4qv1JQWh+2yMcOwSXxg5Crk7oG3yBWnlWapnis3fZ4t0BYhkF8STw?=
 =?us-ascii?Q?hANDnbVG8uCIzNi3J9JGK2+FPtss2eSlDps0s+xR8JQJ19ofZOdBa7WqkgoK?=
 =?us-ascii?Q?fnvL4XMKpouhwquWXdO1ZuoBFKynhoBeyaa9cN3ustjapFhDxLajdL4DM2aM?=
 =?us-ascii?Q?3Tlf5rr1z53Tg01Kb7SzEgLwogf6Yu+cpp4Bxna4iwWaKBAWN9VMUoXf2yfG?=
 =?us-ascii?Q?arga90cDaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25494f4c-4143-4db3-6b7c-08de76147815
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:25:42.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E4QfHRJh3l9AnKTnYKV04WSsfDlKi0UkKZ2j1cGIUBXvhusZwgkiFDHCMFtbYe7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_072554_720876_2327C876 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This driver used to use a lot of page table constants from the architecture
code which prevented COMPILE_TEST on other architectures. Now that iommupt
provides all of the constants internally there are only two small bumps
preventing COMPILE_TEST.

- Use the generic functions for the riscv specific phys_to_pfn() and
  pfn_to_phys()

- Use CONFIG_MMIOWB to block off the mmiowb() barrier

- Require 64 bit because of writeq use failing compilation on 32 bit

Tested-by: Vincent Chen <vincent.chen@sifive.com>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Tested-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/Kconfig      | 4 ++--
 drivers/iommu/riscv/iommu-bits.h | 4 +++-
 drivers/iommu/riscv/iommu.c      | 4 +++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index 849e72321d8a82..b86e5ab9418392 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -3,9 +3,9 @@
 
 config RISCV_IOMMU
 	bool "RISC-V IOMMU Support"
-	depends on RISCV && 64BIT
+	default RISCV
 	depends on GENERIC_MSI_IRQ
-	default y
+	depends on (RISCV || COMPILE_TEST) && 64BIT
 	select IOMMU_API
 	select GENERIC_PT
 	select IOMMU_PT
diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 98daf0e1a30690..29a0040b1c32ea 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <asm/page.h>
 
 /*
  * Chapter 5: Memory Mapped register interface
@@ -718,7 +719,8 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
-	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, phys_to_pfn(addr));
+	cmd->dword1 =
+		FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, PHYS_PFN(addr));
 	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV;
 }
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 5016475587b868..c7d0342aa7478f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -160,7 +160,7 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
 	if (FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb)) {
 		const size_t queue_size = entry_size << (logsz + 1);
 
-		queue->phys = pfn_to_phys(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));
+		queue->phys = PFN_PHYS(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));
 		queue->base = devm_ioremap(iommu->dev, queue->phys, queue_size);
 	} else {
 		do {
@@ -436,7 +436,9 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
 	 * 6. Make sure the doorbell write to the device has finished before updating
 	 *    the shadow tail index in normal memory. 'fence o, w'
 	 */
+#ifdef CONFIG_MMIOWB
 	mmiowb();
+#endif
 	atomic_inc(&queue->tail);
 
 	/* 7. Complete submission and restore local interrupts */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
