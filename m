Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1056AD49C9E
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0lMKM473Oo6sDmia8/UYAkUHVF6WufqYyCc8xgs0Es=; b=zkiESsHE5r3bDS
	wbATY1ZgzcRUa3+EgfYHtDuPqPPEtayVsRkAzL2tRJVcE93WBcg61iUDMxfQjXgSdhvn+E0VNpro9
	9AWT/pUbsmFX2YZQCNBKEyo/FqTV3rguwEQ9vTn2r5EfKEm6dEVLYqxPw195tC9Gtm0uWx33UbVvr
	VHlOf4y1YyIgkuqUnE7HzCunOcMWm4/Ntrb5HKqW/ewUKbSMGrz/fOLeRDYVph7wXLy2Zkq0rpS/c
	xsOV14LLtJUswXbEOYsNVljF6uFPjKQ7fx0vLEY9/ugUV4/IPsp+uBICnTo35c+EvhcyKNWK9hKra
	H73z8gwVMNWbeL3DkMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyQF-000000027eD-0M7t;
	Sat, 31 Jan 2026 00:01:07 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyQ7-000000027aD-3wnC
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 00:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZudfTUgtabTMz0b9aMDyw11i7IC0xNqpKXBjB53qX7CwWzVe0NtJZ1IBFQ0Gelab2RY92PI3iGtn/Hw/k2NY+GxRywioqB+O0s7hCa8opU/A/KnBoFhNGcdF+n2kYkzQBbnmeD3qV5rxjssfrGpLlKNjz5FgzXeIqWRhXdAe5YH6fWP5TULvmFKNEI2IyV744A/XsjKMIzRBNZKzv/XYdWyfRqFpPT5Bab3l6u2oZZVmTJ4WGIPoXxwvh9ibvmYk7Q4g8UoDC/9Cqppquq8Kejco1MbM7dgytVLTOj1Nqqy6M5hMyvuRmRpuTXFyM/AAcLQeB5ngXqkCBtMNmwMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+XoQyH7QP68qNsNuvWkUhF7o75j5Jq4PC79lVzUvI4=;
 b=lMd+g1Mk6wUoGxEKduAfTUXAZ8IU3bAZi9OQtDAOZSU94Efl/tnWwpPyH2bQAqD/l6Yr4AYgL85XXLSh51L+ooSWGb/NMz6RBkZ3sDZTg0rKgmv3K29lEHSnskSb6CZ+mBjG80IwdDopBgczkd4yiGis4MtAt5XlZJdwxh7Q8KKKudCEwTddS2UyjjXZboDKsfuUEx7XJ+cEJ7uDcihIC/Qe0P/9RGUlWaBIcajUStRLLy+gcQeey1a+TgGs+CGYI+BEPQN2KDhMK5HiDUwr2bLsfjRIBv5n+UmVyClDa/QgXQpfmeCEOqfv2ev21DHnyoNKKctBW/tvY4Pe8n3erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+XoQyH7QP68qNsNuvWkUhF7o75j5Jq4PC79lVzUvI4=;
 b=jaZiPHP14toHynv5AduoCOl54F3aE7lOaJ7YgNewUaA/gJI15VMbfy8+piCoCvnhmOFvVST5KhPlSBtYtUTIkLXWUQmNJMG8WjMKp86Yd+v3adVpUB/oYu6kBmygbkNX2IUdi8ADxL1xvubkc910U3/fYiWjzAmV30BCKFi/It9cACzcDPMhtJEj7NxM3IATh6+qRAGJnK68sW6qBZRh4GTB5oQFC9Hl5Z9ttmiY4IpygpneXkQUx6XZzdM7wb57ljo+/204sj0pZk+YHT7kI5y31USg5WgmSyil8FmZNgYxHZZmlMnr1nOrMoOOxOgETIOHw/otFthvLjmIGq2SqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Sat, 31 Jan
 2026 00:00:48 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 00:00:48 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>
Cc: lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>,
	patches@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	xieyongji@bytedance.com
Subject: [PATCH v3 4/5] iommu/riscv: Enable SVNAPOT support for contiguous ptes
Date: Fri, 30 Jan 2026 20:00:44 -0400
Message-ID: <4-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com>
References: 
X-ClientProxiedBy: IA4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH1PR12MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: ff88d8b5-aff7-445b-fa7b-08de605bc9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VELueSmf+XZC8J9bII5gtRWQEf4XdF9AfuxxxM81KcqxDGeOrSZlS5bDOZuu?=
 =?us-ascii?Q?Jpx3X6Fy6kkzqg2+JYKhQyHzdOk3Zyys9JzOkS9aTqsRIZMV40o/zGHKEi11?=
 =?us-ascii?Q?KGYJLgDix32uUf3NVZjiEpbh/o+7rVCLHXfuD6HA/+Ots5sipoHfkyKw/YSa?=
 =?us-ascii?Q?V4LrpGl+PsmTJBSK2Y4XssfiAMstb2ChrOBs9spC8Sx65t8Zk22zuHzunniD?=
 =?us-ascii?Q?GpZb+DMhcmP3yEt9eiqay1fC+Od/hpygVjm0itGB7f7EvudkrCW41pM3HpWz?=
 =?us-ascii?Q?3pgFBR6o/fppMgVvgMOOTrhTuXWUfJM1ICP1N2IGBmc7YVbxBxJwYONhpyhi?=
 =?us-ascii?Q?bJkcQIh5epkapC9klS/u2IOpZU01sLvm9HKumAXeYtRw3gABUxX+oyX1KZPC?=
 =?us-ascii?Q?0aw58ne8EjGtPLQJMabl+e4dWfj4tLlBeHUkgxtvqCPdEPN4ehdrhm1+LT7a?=
 =?us-ascii?Q?qOA33PNQ5pOWUq2MdCEpjBCYW7l04APvFfaur2eOWMvfG6QQFOFNqrvhbvVF?=
 =?us-ascii?Q?/IUTH1849Kdtr6vK3w/xdMzb5aBcXt1jNxhY56sbFh/wT+j8eKsbGCVmUUW2?=
 =?us-ascii?Q?g79qUbJGYGtScHkhya/QgWGhxh7ZI7v6VWcF0ZvdsSaMoya827eXK3Ig2Njr?=
 =?us-ascii?Q?m/kmWUHV2SD1NTdD5hwTzmYpA9RZYEeukZNmVME+qVyrI+EXLmvCe77odaFe?=
 =?us-ascii?Q?jVozAXe4sidk7pmgCsTSh5OLpAXPiZvXcKwn0dUH+fi7QSGA17oJJN1cUxr/?=
 =?us-ascii?Q?N1fBMfOriZcPXE72GkIaCor+5lrsMH6rwH5L+rqd5YE0iyc6bG/m9WLtViua?=
 =?us-ascii?Q?Q5FLJa4/iUg1fnclEmotl8MG9MQQLVdJo21oAa0lktiN3e+7CmVVCAYgxxB6?=
 =?us-ascii?Q?uh8LfRQyvgxWOh0fOuoCUnqlr1ZmH3h5x0nEWgSVNoh9PWWjzHc+lVx8SjfL?=
 =?us-ascii?Q?uTBxOvMoejbB3bgIZ+sb2NEAAOdi8Oz9XncthZ2ZNhXEhtz8/QH176plEu/h?=
 =?us-ascii?Q?g2C1r+g/9uz0J0mrHN6jCkRSLe12d6Lme9Y74Bg2yUm7vBVUgFbmvU4WyZPY?=
 =?us-ascii?Q?CTh2XVkHRAAd3R0G3jlgLKsjJ/4NOGw8VcAxA7YWQG4fT6Xq3aNxUqxcGVc8?=
 =?us-ascii?Q?buHGAy9CF6WIaMsNH96DfUl+xVVHm2tiej5OY6T0iN7O4myrkX5N9Cj+zHjD?=
 =?us-ascii?Q?C0emfyRLpY4ysmS2LI4OZR4gvVjlKNusZMdUG+4HQ8YhKj0mxOXpxO522F54?=
 =?us-ascii?Q?IxQ/D3fmKdQqrGtTgo0TOeSKs8kEcSwJM9hayx3LUDuA1lxuxJ86B4jfPcGQ?=
 =?us-ascii?Q?7NqOHOawRjNn0QTRtd+uiPU4N8ibT8XFVoXKq9zEduoEn2fugFeR0Zfi3boy?=
 =?us-ascii?Q?/2AzzkY+db1PXHigE5F/KXmi55+JxTotkat2Xo0IHnB6tsEyQUhglXBxUK9h?=
 =?us-ascii?Q?5sgybEE8sxqFa1WZOXpGCLzlWMpTaz4mH3yyqDejH9ZnfzdLUpB3skuB0e5a?=
 =?us-ascii?Q?KgYI2OO+gwDkWAeEwA9kTyLsQhD+APXi4S4pwNtGpMDMpNVQhfNcNOqHZLsm?=
 =?us-ascii?Q?1ef0yaI2T17IbcxwmmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b1CgU8VvFrUKgVoiFzej9IuNpaiCnoMlR37CygStOdxYV+8tMhnMcA8vikAd?=
 =?us-ascii?Q?4djnaz2GsbEqcYRpjD6F1PJlFLe3gWHwMTFTP39XROiEkIwiLw3EPmFuOpUG?=
 =?us-ascii?Q?/oTL7vqxqay5zDRApw4sXd0+behjmrzVY91rebDJVdAuNUsg2zEvcxDmhDHj?=
 =?us-ascii?Q?XHkGXet5ZDlTo3HDhRcuQ5yglejchTRg8lHCWF2wWTuGC8kTMsEGyuVIMXJN?=
 =?us-ascii?Q?WTlTw5BctRz5p32KqmTPtIUP0FdM2CE2qPzxUit2MPHy6zTxQzsZXhaD1skQ?=
 =?us-ascii?Q?tUuCLKSjuBzScEDM9cQLeJRhLpv7Y/6KLJbiojBd3JT3RATn1pPstemASw4e?=
 =?us-ascii?Q?/j5zoeJZqtwZVzD7XkXXsNei2NgDOeWAZ9MumoaQJ0K6sxEyZscg9aSJgt5V?=
 =?us-ascii?Q?TnpL6Rr6EeoCzyzdflh4O3zyYib9jhU7ToZFspUVroi82T1dMeawSGNWMxNA?=
 =?us-ascii?Q?VGreKc0+QFWv+p8E9ZpFrqx18E1zQiJtoX0KuWydD5cTFODM3NlGqNyeJck0?=
 =?us-ascii?Q?mkMRbbrYyeapC9HFQAJi2LKPQ2IzQi4V/AwL0cN+vk5sIaZD6E2BClNvhl6b?=
 =?us-ascii?Q?m2cTK57/3cG1WzLcUpZviiCEz1D6wz6PQJ0H0NN+hheEm9j7EOrYQ5KDOpoz?=
 =?us-ascii?Q?dULJSaRw2HV6CdHuv7T+nh42I9JUzdtsSdM54hCoump2g1STz/T/cum7pb5l?=
 =?us-ascii?Q?JOJotepFAHDQq3IbDkINCpo8BMz3Q0GEKX7ZgPmtV9pc5GBmWTed5SmJHNQW?=
 =?us-ascii?Q?VQwr05V8lP5wKJe6N3H0OfzzxXyDZjw39/HYNqPoIl5gQoX1H1CoiGct0Slm?=
 =?us-ascii?Q?s2TUsMNY3N0720HHBQ6b1h922vHRebZyW/VUjKuhwNdNUtmQ/A8aLIYthTvN?=
 =?us-ascii?Q?9xyQsvHKaM79hjveXf9Oo/rz4myz1mYyNqZmyWytKJT4xqOHrbvlyjdEMKAJ?=
 =?us-ascii?Q?abY5EaeGWqJyFIt6pu9VpnT7eTStm047+QzXgUAAu/NflVhWoNdyhGWMV+xu?=
 =?us-ascii?Q?WGwaUeqOmptLu1kSNJ0TOeRrPbd3GfRZMFEfNo1FSj/CmdkiTJKfczgFdZss?=
 =?us-ascii?Q?4DwkbcuyqS6IR3dZd8KDYhHj2GSRgufRD5YQiAi4ovPwWuTYznPiyRME1Wxu?=
 =?us-ascii?Q?0hzb/MyGeuQXTKFJt4rLAmfb0u+/3dK1haMf226M32BiES0VWYayO+O/3C3L?=
 =?us-ascii?Q?q5VwceaYOhM0OYZuKlq1hDeDDor0CmLTkgtgfnouhngiRSI+xjPIl+3knUSY?=
 =?us-ascii?Q?cpNIW38dN6DPmDDWuRBK46IlgPYQmed81A4RB+FY+JQ5MP7buZ4SaDh0qffA?=
 =?us-ascii?Q?Gocir1Ptpsh2o5shUxHrBLsA7C6RIZTi/J1b4TDIFtpiHGVibDN1o+bmT6hj?=
 =?us-ascii?Q?mpx7wzneRDoS8LOYAIXhfbv1D1E61OI/jqcLCM+enWYL3ljA0wF6aSroj11e?=
 =?us-ascii?Q?chkR1WUcx1zktcYInDmWa2dfHpykzcQkL34oH38KfF7JdXc2qhSkNQSV43kY?=
 =?us-ascii?Q?WLv3VtsPgQCx8DyEVs9iEk+PVpIkDBFjVdQ6l6OGQSQTAvAmOvbqXf/rYcte?=
 =?us-ascii?Q?jIeUJJyTJxBjdJsGqcyci02eyLDp1lSnNF47+xXfTQ6S1U7lgV66mmp8Yjfa?=
 =?us-ascii?Q?V49MkXI8k3kPNytFp53P1nk3b3x4xq/plakn91ApW1F1q5ZJ8OlSL/SB7vnm?=
 =?us-ascii?Q?cGJd3Gh/5HN0JBGJLrCDGaKtjSJfp8AV/bmY433emntnpSgaHg/npxm/iGS1?=
 =?us-ascii?Q?HZRE+jgxvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff88d8b5-aff7-445b-fa7b-08de605bc9a3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:00:47.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+9AIkkDLopSTEEAaJGLIimCrtYYAvJQhJInJIBu51CridPz7QQyhENtem9umGNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_160059_981491_907A0EB5 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

This turns on a 64k page size. The "RISC-V IOMMU Architecture
Specification" states:

  6.4 IOMMU capabilities
  [..]
  IOMMU implementations must support the Svnapot standard extension for
  NAPOT Translation Contiguity.

So just switch it on unconditionally.

Cc: Xu Lu <luxu.kernel@bytedance.com>
Tested-by: Vincent Chen <vincent.chen@sifive.com>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c02878f00294b5..4e2e08114bbf15 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1185,8 +1185,13 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
+	/*
+	 * 6.4 IOMMU capabilities [..] IOMMU implementations must support the
+	 * Svnapot standard extension for NAPOT Translation Contiguity.
+	 */
 	cfg.common.features = BIT(PT_FEAT_SIGN_EXTEND) |
-			      BIT(PT_FEAT_FLUSH_RANGE);
+			      BIT(PT_FEAT_FLUSH_RANGE) |
+			      BIT(PT_FEAT_RISCV_SVNAPOT_64K);
 	domain->riscvpt.iommu.nid = dev_to_node(iommu->dev);
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
