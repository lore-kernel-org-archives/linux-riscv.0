Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2180CD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74eL+760VztMsGs8Ovgk6+OfG7mn/MXM+lBcbd5ldwc=; b=xrNDAAS8Akcqx6
	jj75HpK3UQlZ8xBx9GxXcI4kIRTMZe1KUb7Mp+GYqKc1W8MkEu4tCEXySRQwcFy6A8q+ANB655jlf
	VwaalfeBD8AYRHyssvPsWtOIUg0iGsTvna0BNr9LfsJuJiCWzLmVe5n5WsoRqlYvk21d5v1btg7oE
	ciJ9MvF5aNsgzGjT94S+/KPjF0xr1CnMpDc4ls6KNfmONOr71RFUaiY/gtU+Y0luS5qLClrdV0kWI
	jURGG1ucocQOwKCWrZ9asayH399+G2UrOxac7r4hLPh9P19zQSgwyJclRNSitzruZiTNodbfRND80
	eqDjgeZeQuOtpKVrU2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMZx-00000006j2y-28ux;
	Fri, 08 May 2026 14:53:25 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMZv-00000006j1Q-0Gn3
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 14:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIlT4SmMKbX35pxPXWMLlrHXi/mk/mFF6GkwdcC9wYdtvw2LwDhY5JX+7IfUZVMF9pSIMQHlP0YObkQXHu7Q5fpjSZq6/w71d8Rk4ptJR4D1v2z2KwT/rx+z7xiriBI89NmjYK5jWaNSId7GW0d1Iapx705ejsnD7c8H7dYwgA7M1eOWSy4JNZGw7xCBNqqPrT0ZIE0QXl2vdEUmNsfowVkb/pU0mrCmQZ3eUfso1fkyvNBQBn9ymElT49JWMk9RHofm+LgCYvSoTpAvKXqnA27jp8jX5EdKb39yL/EivnMaG2/JqTTnDh9907UnbIh9m6Dg+HeU0o6bY94Sh74MBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/TZCX3KRM5w+Fc4NJlLCrjUe4pC9l7yswsj1YoLnAU=;
 b=hV0BL5fGAdUvvMDKwmwKpTImDxXlYboUXtOlrjd2ZKWZYBmB6bgBlN1baZpzHVeZrBtc1w8azwowFHOXLYvJXdb075cqLwaLYoX7a2NVsMRCRJMOeqtoT4z9IWYI0zxYz8R8zQOovxa/dLb3d4g8BkmIY7+z/kWV7a2Ekvra98kpZtfS87QhZFKK2mrV4V/J9aQyOcmwjnU9AkmYvJWAwtUQqnMRAGVunHrUOS/qShK9kMqBS7RE7E56WFvzmhc1ooe0qekbkb5DyaYGglEii50iVFaztw1foYMw/pIA+xG8JeuidKHlEaB8nd/PFVMgjSPLnvYi52oGu6AtQuPILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/TZCX3KRM5w+Fc4NJlLCrjUe4pC9l7yswsj1YoLnAU=;
 b=J2v9LpXOFoVgPyTDCXdFkjKhpTHw52rHpis/ngKjip50JUfRosjwo4S/2dLxW5yxiq1lL255zh8WDzFdPGfUg/olJA7Hh3XPYd+gMShGcUf04CmGCQu5A764zmHiFyPp/GpRA32sjc6zUrVFSyfqUuMwk6ca1LkzPqzyinzOox4T0dAy1Lj9ZQook0YQcNG0kWTIP6/WxHAG0fYRYMvSRxUW2jw1ICfu96i4BP3v7A+pogLmgQbctu0OHFmCmIXupKdHaU7UTPMHi9yhYZi4QwkPJQe5DxdLVe0IBEa7KcBVqISfuLH6jwMDgo+bHOTcUa4GQrInIWzO44pO1XCc8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 14:53:08 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 14:53:08 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	patches@lists.linux.dev
Subject: [PATCH v2 8/8] iommu/riscv: Add NAPOT range invalidation support
Date: Fri,  8 May 2026 11:53:07 -0300
Message-ID: <8-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BN0PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:408:ea::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: b34eac10-96f5-4801-1e89-08dead11846b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: ulQQRet67OS9Ncg8z7KQwjbCx41M11lsqUV9CwfkDE5FBmRFU2FNZ++/y/yaYwyn8McMzmNbkr04V64egclnH8unFRcC4UfQtWqeO5y440bmlRECgx+I+L0T2idFRIJgw3MLu++vGvLMsIVNEd9IlRQ5ejNjqKqAoAa4wZLf6tTTMy6KcL9B+oCzh0hb73CJqOimrsyzG8c+Gl2UfRv/CEy7bLLRVVqhpVLisoDISvTrgFlDKm9vas8GIj02gD3qe7VXqAn1Sc/+t9IEW3mo4v/hKyYDyLyhh8qbXulDvtLHoEb3O8C0Ou6AE1wRbe0dtSQYzl17nPgkC23wBcaTVfu8p9YXMhI5PullJo+YfwPLpDxqrN8qi4+GDdCuf8q6zBe4jifAkKjUTOHoBPHPMxDXsKcINY0bv6ueD39rJQULtFPHZzzxYydWKwkcliRUiq2tQ5UUQlJs+c1oT20EYf0Nu+fWB99BSAn3f652Q6tvttixOQrxUdiCMEKTeeTgnXWPnIV0VEMAs+x9yz0ZgZPu9mi6Z5CGgNdUJTzByxK04fpo/+7kdNRmAeD1nZJBsMAiiDGMlCrd05FKLS1cDecAlhvVaTUANFkyBYHj+0yLP5g1TTsRRn0ON+OAWplTSyWXUyTevEI/OMMXfqfLTjZpTrnQLqHLhUBQgAE+xlmp2ZZz/kxUr62uS+c3QvIY3OX7DqdefSaM3zoXpP3R62sDR0VXEcZM6pltmPORgfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Du97cRsNFQD61lNUTbub4mPJzBBnxITZlKV52MslSv5Z/19iyXS/meaR/xg2?=
 =?us-ascii?Q?XoQjBYZjulHclAihIAyptgpLBesvOeYpdQc2xkXqRyWGnY8BOzN7BP29YLyP?=
 =?us-ascii?Q?x2VoYQ1L1BfgWvYJoE3UW/lU/8LdW/dxrU3l+vJvzPkf7b5OC6TN1dUUlacl?=
 =?us-ascii?Q?Q/d4L+Z+L60IEBE1+Yw5OfXFkeYe8j5H6Xv6svPRhep3vicKOfimfyEB5S6i?=
 =?us-ascii?Q?TiZSM7jbhH29Hefy0oyIMVhBiHpNDHUHx0wJ0BlqC/36j5R7SqwtAG/9YmBF?=
 =?us-ascii?Q?eZJLdhZ6iyUDb5TgB9zJ9QyIrX4mLNqjXvXlU9YP8sHnplNFWEdAWRn7wC8X?=
 =?us-ascii?Q?MWe0vY3SLzpUQI5aIdCqLLQuXRo684yGRbSmbCvZIjrygKuStjMoc4jIO4G2?=
 =?us-ascii?Q?zSRuNtXlYvlnJBUXFFn8Z1WSpLn1qziX93IazkW387OyLxj5EG0X6SfDKNCq?=
 =?us-ascii?Q?9YGYvTa2ezxxdRgKGT/K0rQiXY7SIL4GC6tWBJWgVGc3U7nTvkG+XNCxdIIF?=
 =?us-ascii?Q?vRmG5z2nh/J1nlfvw4nw2/yi0JwaSt6DjymjctEmCkhWWUFHuZRHDd5p9M2M?=
 =?us-ascii?Q?7/wU8IE7R1Ny+RSoThoMsKQjyhyT1ZQLuBP01XRfEpWaXPsHNU+yNYVLyq6i?=
 =?us-ascii?Q?hY3QdV71jXQ5A7xPTTXHouC7xFvFnWR/p2EcAt4TwYNHOox/S6QZwpGtsIkX?=
 =?us-ascii?Q?LQW1B5DTU3hwXG6gxUoys6ZKYvzE9m5RR5MFLHIoGEF66F6LOL6nEsfEEiV0?=
 =?us-ascii?Q?dHnUwtXSOLOG5XPL8SOutnNi2MtSpV2ywfmewcR0pIF7wCotthpUt7pgTwqH?=
 =?us-ascii?Q?57YEzRLuLZi7dB81YQ9oIKZwYHx9TrxP1JT6NFebs4Ni0/d9juVpXU3XgJWR?=
 =?us-ascii?Q?rq6pIJEjnhSmim3SqG7mzuLlXEJqaFqAZv5T57cXOiCscz0IRW6oeebOuZxa?=
 =?us-ascii?Q?+7lB3VVeQzjYMpg6GndG1B6NoiKu6ZCWeP32775CwySL57IjZf8X8ROWaS5I?=
 =?us-ascii?Q?6oGwpIwTIYAGpwa1UsE1tGUf3FUJ2GL7JIZZ6SJYs/SgskQAO3Ot3mh/TevI?=
 =?us-ascii?Q?VUraVV+LT4KK0rfqHEkzN6rc/N8PctUmprUe8hcHWr3KwTHagVosLdYEArpz?=
 =?us-ascii?Q?C9yfhbmoo5+ePpa6J2GXWhfQ1SLJ45dvyOti4+xUj94EIHuWU+GoqMn1B4bK?=
 =?us-ascii?Q?uNcjTVcdePCeR7kqhzwBaKx9kiefAqcjdkPZrNt2T55EaMNp5P/wC5QypWbi?=
 =?us-ascii?Q?N/Fx1UnV1QR3qAZZh8bPmLeU+AKBzK9/RgAAYlbp72on2Ef52OO/fMVGFmkB?=
 =?us-ascii?Q?mDze6h3ND24JjIXrYoAEYqFZTmAeBwu4v75/NCiWxsAU/zi9opsVDwCvd/wy?=
 =?us-ascii?Q?3P7UHkGsHe8RTETyIY/RYxGTu2f+BnP8182ifUvZhzLEQ8jjTLT0an/luacf?=
 =?us-ascii?Q?1D+heloFyeDDWuZvtTfjnecqllKcqV7FAEkoZ7CdMOJEy2T3IfzzTGij3xaf?=
 =?us-ascii?Q?pnDgDmkzloMNUdbcbninfIqvHFrdujadHuUohTExhoPM8e+zpKQ6LFzdfG8J?=
 =?us-ascii?Q?AnsfjcyvhsPDJCwFj77G5TEZcyIp8rM0wcato8jukjYq672d0Z+Tm/acMPKD?=
 =?us-ascii?Q?i9ovfFJehRpBnQI3tH0+9YWmafsJGmc0zPmCKYwXRPFHiG0jIiQYdgKxLxE5?=
 =?us-ascii?Q?xvdW5Jkw8SlG/JZjVMyyqgcohyAhiybPWbVGlzKqIVZbWsQi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34eac10-96f5-4801-1e89-08dead11846b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:53:08.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5koltWzFTXwRDB0q5GfqLw8CW7DfehdqCSPY+PbZSGcml2WVOBhbmwD1qVG63Pl8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_075323_106095_BFD92B0F 
X-CRM114-Status: GOOD (  18.27  )
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

Use the RISC-V IOMMU Address Range Invalidation extension
(capabilities.S, spec section 9.3) to invalidate an IOVA range with
a single IOTINVAL.VMA command using NAPOT-encoded addressing.

One iommu_iotlb_gather maps to one NAPOT invalidation command. The
smallest power-of-two aligned range covering the gather is used since
over-invalidation is always safe.

S and NL seem to be orthogonal in the spec, so if NL is not
supported then global invalidation is probably always going to happen
as wiping a large range without a table change is not common.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu-bits.h | 18 +++++++++++++
 drivers/iommu/riscv/iommu.c      | 43 +++++++++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 8c60780363da72..f2ef9bd3cde960 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -64,6 +64,7 @@
 #define RISCV_IOMMU_CAPABILITIES_PD17		BIT_ULL(39)
 #define RISCV_IOMMU_CAPABILITIES_PD20		BIT_ULL(40)
 #define RISCV_IOMMU_CAPABILITIES_NL		BIT_ULL(42)
+#define RISCV_IOMMU_CAPABILITIES_S		BIT_ULL(43)
 
 /**
  * enum riscv_iommu_igs_settings - Interrupt Generation Support Settings
@@ -475,6 +476,7 @@ struct riscv_iommu_command {
 #define RISCV_IOMMU_CMD0_IOTINVAL_GV		BIT_ULL(33)
 #define RISCV_IOMMU_CMD0_IOTINVAL_GSCID		GENMASK_ULL(59, 44)
 #define RISCV_IOMMU_CMD0_IOTINVAL_NL		BIT_ULL(34)
+#define RISCV_IOMMU_CMD1_IOTINVAL_S		BIT_ULL(9)
 /* dword1[61:10] is the 4K-aligned page address */
 #define RISCV_IOMMU_CMD1_IOTINVAL_ADDR		GENMASK_ULL(61, 10)
 
@@ -731,6 +733,22 @@ static inline void riscv_iommu_cmd_inval_set_nl(struct riscv_iommu_command *cmd)
 	cmd->dword0 |= RISCV_IOMMU_CMD0_IOTINVAL_NL;
 }
 
+/*
+ * Set NAPOT-encoded address for range invalidation (S=1).
+ * sz_lg2: log2 of total range in bytes, must be >= 13 (8KiB, 2 pages).
+ * addr must be naturally aligned to 2^sz_lg2.
+ */
+static inline void riscv_iommu_cmd_inval_set_napot(
+	struct riscv_iommu_command *cmd, u64 addr, unsigned int sz_lg2)
+{
+	u64 pfn = addr >> 12;
+
+	pfn |= BIT_U64(sz_lg2 - 13) - 1;
+	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD1_IOTINVAL_ADDR, pfn) |
+		      RISCV_IOMMU_CMD1_IOTINVAL_S;
+	cmd->dword0 |= RISCV_IOMMU_CMD0_IOTINVAL_AV;
+}
+
 static inline void riscv_iommu_cmd_inval_set_pscid(struct riscv_iommu_command *cmd,
 						   int pscid)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ea14630430451a..41e26e267a7fd6 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -929,6 +929,10 @@ struct riscv_iommu_tlbi {
 		u8 stride_lg2;
 		unsigned int num;
 	} single;
+	struct {
+		u8 sz_lg2;
+		u64 addr;
+	} range;
 };
 
 static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
@@ -945,9 +949,23 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
 	/* No level information available */
 	if (!combined) {
 		tlbi->single.use_global = true;
+		tlbi->range.sz_lg2 = 0;
 		return;
 	}
 
+	/*
+	 * Calculate the smallest NAPOT range containing [start, last].
+	 * NAPOT encoding requires a power-of-two sized, naturally aligned
+	 * range. Over-invalidation is always safe.
+	 */
+	tlbi->range.sz_lg2 = fls64(tlbi->start ^ tlbi->last);
+	if (unlikely(tlbi->range.sz_lg2 >= 64)) {
+		tlbi->single.use_global = true;
+		tlbi->range.sz_lg2 = 0;
+		return;
+	}
+	tlbi->range.addr = tlbi->start & ~(BIT_U64(tlbi->range.sz_lg2) - 1);
+
 	/*
 	 * Calculate stride from the lowest changed level. RISC-V uses 4KiB
 	 * granule with 9 bits per level.
@@ -969,7 +987,6 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 	bool use_nl = tlbi->non_leaf &&
 		      (iommu->caps & RISCV_IOMMU_CAPABILITIES_NL);
 	struct riscv_iommu_command cmd;
-	unsigned long iova;
 	unsigned int i;
 
 	riscv_iommu_cmd_inval_vma(&cmd);
@@ -979,16 +996,30 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 	 * If non-leaf entries were changed and the IOMMU doesn't
 	 * support NL, we must fall back to global invalidation (AV=0).
 	 */
-	if (tlbi->single.use_global || (tlbi->non_leaf && !use_nl))
+	if (tlbi->non_leaf && !use_nl)
 		goto global;
 
-	iova = tlbi->start;
-	for (i = 0; i < tlbi->single.num; i++) {
-		riscv_iommu_cmd_inval_set_addr(&cmd, iova);
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_S &&
+	    tlbi->range.sz_lg2 >= 13) {
+		riscv_iommu_cmd_inval_set_napot(&cmd, tlbi->range.addr,
+						tlbi->range.sz_lg2);
 		if (use_nl)
 			riscv_iommu_cmd_inval_set_nl(&cmd);
 		riscv_iommu_cmd_send(iommu, &cmd);
-		iova += 1ULL << tlbi->single.stride_lg2;
+	} else {
+		unsigned long iova;
+
+		if (tlbi->single.use_global)
+			goto global;
+
+		iova = tlbi->start;
+		for (i = 0; i < tlbi->single.num; i++) {
+			riscv_iommu_cmd_inval_set_addr(&cmd, iova);
+			if (use_nl)
+				riscv_iommu_cmd_inval_set_nl(&cmd);
+			riscv_iommu_cmd_send(iommu, &cmd);
+			iova += 1ULL << tlbi->single.stride_lg2;
+		}
 	}
 	return;
 global:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
