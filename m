Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6983F459F6
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/1Gz/SVXB+NsPS+gI93Kb3tJZCaKACVZ9dVHKVJ07E4=; b=Kx2w3+dm08nTXH
	k2EI+XvEIi4CuGIvewat202FZBCWSx92yqThJmGB1k69wzLA/0M+Vey4hPxgiO1CiQoZO5EF1V4jf
	zuFvnryVGIwDLGqCphx+WjPa0YH4se/WuYFJGCWtaQ79aZO8cNnkswNXttL1pOfsTYH34R2W9Brwx
	54P4eQ+oeb8bIHMPaRBCgTqqSyMXIWjDxuFzNrA/s4B8IgO8S/Yc1n2j6lXxUb8fkmf0a4KTcHLJY
	HDJbzGYdQe3dTPTN/sNVxhrvTmSWn2CZo60ovtEWSQ68jOC45i76t0UXMRhg84xXNEbbuVfuW1Rj3
	2Y9TMldVMkXQFlKyUt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEEV-0000000CUku-181K;
	Fri, 10 Apr 2026 15:57:23 +0000
Received: from mail-northcentralusazon11010041.outbound.protection.outlook.com ([52.101.193.41] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEER-0000000CUjY-2MxN
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8mhZ0kUPixIcl79HxAGyLwJQ97W8NXmLye6ujCqK32/7yj+JWpqGkLqkWWkS4UuVURMLxL+2CAbPMhgymHSH7mjPv5rpF2m/sqDc9gMiMjYWvvjBXTZYl3IcRc3c7TgrKgSJsz06Pk6j5sEKumNMxSZ702DngJiyTQTPT3ng+AjJvy7k30nozwPbPFHm+AGRT9+Wavc5DgTUnoCfywQFg1q5mbelOUaP2NVMomPZ1xxjfColqUN4ITeAIuf/aTKyxwwpJx6gTkyd0SfauDTUThF7/BlpnhRbSqnsOvdd5gZUznIO+MqFTaTqBmP7jFaky2f+6L71RDrzzSgy55f9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rq8fDp2o+UZ+XMobxnagQD8RfTd92V3oPDlVeIMO+c=;
 b=ltQwFUArogyYzBXbMXTXcVSxQdEKLlMo+Y81QI2NJbLwnmyLgbgh8PI8L6rDGD2gLEtDVhC2Jlot97BJSPUX4T/v2XHp2iD2s6CDVQ+RG03yQZUgD3aNYkOuPBQ4I78zk68dH4BiGOPy4F1JKO7NnyLZMZqLNKWOezWGP3SAfLcBltQNE2M5cn7wwPE1wnk5X/xAwOlKufaTx6MGegnkg50NDatarSiwQrH8gpSbRDQlPcaZlBThGdnnbA3dTLjC/9pCWq1R1uKLROK8/RqYmqRuTle3pfl4qUJM8OwpH+nnJjJWA6m7eTOTaKl82NU3u0ImGLZipiXvQN/6BNyicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rq8fDp2o+UZ+XMobxnagQD8RfTd92V3oPDlVeIMO+c=;
 b=hFRW0rWByMHtDMbgF5cx1Hnha+jEj/Yu3FxPBEBisI5kA1SeCje8HktIkzcvOSGKUWhnZteEhzSREZPERFi1ns9u7xlkye/parLVh8pW3+q5Xdgat2tbBQDTYNtv7FEiLbfykJDNfZfrOOFdcoWFvvp+l9wCGb8KBxLgR5dHGCp4+BoBVrAjjv2zwjZ5+hYf0dKbx2A3mQdMqaZmQZRVmYu2CXxKr/7HYuaz5GtVcBeCTso42qWU5E2Ecil2kOtPmABw9V7kEXQcoAeQh81AkVoLnoxQrsps8/lmxiZkU1qnjq19mKXRsZu8MMYY93tW8RAqD+bcWvMPDK5AURVdpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 15:57:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 15:57:10 +0000
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
Cc: Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	patches@lists.linux.dev
Subject: [PATCH 0/7] Support non-leaf and range invalidation features in RISC-V
Date: Fri, 10 Apr 2026 12:57:01 -0300
Message-ID: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
X-ClientProxiedBy: YT3PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7b42c0-698a-4280-0046-08de9719d2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kU2mD8Ox/NZ1m7mvnaNS4mqNyi8fKLQVAVvB9zZn6hnggaBAtzmHrNFbf9BywoIpQqkSMyN9z6M7Lj1tPrWiEh4p3b41rFOfF3Dgrp7cU6NyDApaHTCEeNglxYGOj4uH5ttwlEUGuvjGE+LSsaLva3zyhrh1ifF/eWO7iMGTApC5ugI9QphnlAOLVyHszkwphqCN5NZynjHd07IpoLmqTBORTSN+5goEM/SLiJq4bNvCMSqTg6m1RoP9HK55VX/wQAm3xPNHxTx1xtFUGCqSTHwvsvBub7pQ4X9e/jVTXVzbLFwlmGXSorYRrq+a4hpzERd7+ekAzvA150RQ6JHO6Aw43Bi8YVytXyB189DSL6o430LhKmjq/ecmVklnQhtPYXF4eAPURCAlst45uK28g+DGgIpxQFX1imjxl5PJeHDbAle3ibRNxQl8Ky3NJe6X73Sb5gO7pc3DX88TfKrEoEmnwrLejbheDYNJpPhq4Mhd63p8rq0aSiHYIfdNNsx/6BfdP2kU5YYPK3TlICG9YbYaMh0fM58hvKzoWZgs08VnAp0zBRAp836G2o6V7jPo9kpTQmK4qAvZIBztMcWXM8oK8Jvi4XF9xSUw4ZmY/LXO+CjnlE0IKutPRSY8Kry6ZRdR/i0zR4PmAQflWpJUDxg6ydUWdMypS0mrhs/l+XOhTRhDiGctRal/qSfW5xYz6PJgSRjPEOFgTjSdZPa0zpCULomvnDJ3zKdpSi5xfv/V+SxNUBQfsaaQ/mOi/npZYFvJe30tqqR7G9N/znlp/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ap3GBl0IX1ygru5/rgIuSmWCZynwbLALHSLVt8OGoFJYKWRw8K6KbAangc1b?=
 =?us-ascii?Q?HcRS2Q4NM/ubgoPGnnzWMQ24rSMoOyn59uNlAJODSXnqc+YhbmJUYnUmTZVu?=
 =?us-ascii?Q?0rEWgZ3pFsl33DhstHhD97DHwcu0oRC4D6BMkw5MZRv+y+HFnPHHFsuJwnMO?=
 =?us-ascii?Q?0zCSJbGt7g38tUEBKJoaj7qLzg3BUwE6mTvt2nbRDjMyXyhU+LduYWkHDrbn?=
 =?us-ascii?Q?kO5dfA8sQrs5NGdCis9DamLtwrlymZuJaBpjw2Z+1BVGBCHdQ7BPRKvQ2a8H?=
 =?us-ascii?Q?51btz5I0T/0wJYwyCVZ1mF9a0Al0UEroTt9iQM/+OU3rlGcyHBUbqKY2QqhW?=
 =?us-ascii?Q?1qOvH/K/fU6eWLB+AJuJZGEDExMm6Nox+kuRKrLNtZT+XjgPO1E4d4HQtRFE?=
 =?us-ascii?Q?VjddXq5ivuSCZuUOWnx0ZSuufZjQqXDGbIli2E1QKWOm58Q1iILm2izNKyho?=
 =?us-ascii?Q?WZ0LQcTp6mspYvQp1c2OOox/hZzMPj0mlQpUd1FVTXfr37wXAyakwnVgvf28?=
 =?us-ascii?Q?yPqovZL1vbBtnOarldM+5JAZ2Dc+a9zem6iN5xLfH+mVg42QDdDUxTjLY8eT?=
 =?us-ascii?Q?u1u5c2AeHbtHgPktPiLStUrXtX9MT6mWcug0DoBqnkn29dzzhRmDZyTq/3SP?=
 =?us-ascii?Q?orgSVHVEDb8iBoD3oIiA9g3djhs81epDphlnctSFHidV4FY/tWQbp0qcpFcM?=
 =?us-ascii?Q?Mley20dy+rt8gfY+G5Dgy5ZJ2jPr+e1+xTZCNfWYUmigqToTX7vbgu+gfxuN?=
 =?us-ascii?Q?qPG1JlxBtgGWjWIsxKKTsQImoin/6cWUSF9fN3k6W8LiVSoG/xXA3r1hcfe/?=
 =?us-ascii?Q?ugktWtSgv1mpGlTiLB5BkNqchlc+XJ9N9VfWgrssAkb+wfKAnTDfnaE/FvJl?=
 =?us-ascii?Q?dWaiFL7QbmSf5DgMJ2y3rvMQiuI7ZSRpVFVUO+cHCi0h9oTmkMqANpyKY6Gf?=
 =?us-ascii?Q?8zGFpxg2RduUnDUjKecDgCOOuXgmOUmrnel44UbIfeEx6Ucw54ncLR8j64RL?=
 =?us-ascii?Q?fB6vbraxF5mBv04LTZaFE6/mPvW1ORi6j1/sx9ogS2XV7XLw23xnJXLJg6uw?=
 =?us-ascii?Q?crcJpBQjhNXGS1qtbZaP/aGoGYeIajcz4/9N7pZ95nHFDnAgBibo33t1Ia+K?=
 =?us-ascii?Q?Th4Lk0f+DICWIqRDIIxAHBpwErDYN3MUZADjTVaBeQWFQ2bKs+nsoIBU4ael?=
 =?us-ascii?Q?2mIfyO9BlyH3dYNz6BXVqur38nTNJyVk1/tZ3FXSFpPnFYqwzeuCX9oz7IH9?=
 =?us-ascii?Q?Ex6qRh9XWmQH/IpPOQvxtDKkobGL1BZAF58wP/fpFARSGEddBm7+zrDVPGQX?=
 =?us-ascii?Q?KB3DCKtV07Qg6Be6aq0VoXiGi7RqDU8gyCFCJ+qW4dUZj14MumpCaRo75L+2?=
 =?us-ascii?Q?ZVChMIlt7nj15xYJYeVLtC2HtZiUxP7rjlyqUSSPwSwgY3GxhvpJZbxJFpfD?=
 =?us-ascii?Q?PDDJ2ee0pNURceAfRszrZYVyM7PFO7+Fn7VAIzUjMbp3Bsk+blyOgapSOVxI?=
 =?us-ascii?Q?tTP1dTGJTDGE59lqyhtynjTJwFq598uHyJNuOWfmypk5US+QrZRkCDBgcMJG?=
 =?us-ascii?Q?wiBhoy4AlbA5+ED1Byvw1EcjdEp6P0rIhrGgwf7Nhlqd7JdmpgVJ33DmTB2s?=
 =?us-ascii?Q?yLr/Ep8Y5jvRL7d1yORAJ21grTupkjRjzeHxV49R9RggS0fggtpbsSbF9obO?=
 =?us-ascii?Q?1CUs7M7YBglrJJL33fEcZirNYra8LrZN15TzqrMctY2oSUcg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7b42c0-698a-4280-0046-08de9719d2b9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 15:57:10.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6pmiRzvCtEVHuqh1efMROgGWIKAUjpopkubjcTHGmzo2p5JATVfaXQxFEm26jUD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_085719_602658_668E2D3B 
X-CRM114-Status: UNSURE (   9.66  )
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

This is part of the patch pile to get SMMUv3 moved to iommupt. From
that perspective it introduces the PT_FEAT_DETAILED_GATHER which will
be used by both RISC-V and SMMUv3 to generate optimized invalidation
commands.

I don't have any RISC-V anything so this needs to be tested by someone who
does.

Improve the invalidation flow in RISC-V:
 - For single address invalidation, compute a stride based on what
   IOPTEs were changed by having the gather track level changes in
   bitmaps. This allows things like unmapping hugetlb-backed mappings
   to avoid jumping to global invalidation.

 - Support the NL bit to avoid global invalidation when table
   structure is changed

 - Support the S range invalidation feature to convert any gather
   into a single invalidation command using an aligned power-of-2
   size like AMD and VT-d.

This is also a requirement for the kunit iotlb series, which was used
to test the math used to generate the invalidation commands from the
gather in this series.

It replaces a similar series Fangyu sent prior to the iommupt
conversion:

https://lore.kernel.org/linux-iommu/20260208144213.94856-1-fangyu.yu@linux.alibaba.com/

The full patch pile is here:

https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/

Jason Gunthorpe (7):
  iommu: Split the kdoc comment for struct iommu_iotlb_gather
  iommupt: Add struct iommupt_pending_gather
  iommupt: Add PT_FEAT_DETAILED_GATHER
  iommu/riscv: Enable PT_FEAT_DETAILED_GATHER and pass gather to
    iotlb_inval
  iommu/riscv: Compute best stride for single invalidation
  iommu/riscv: Add RISCV_IOMMU_CAPABILITIES_NL
  iommu/riscv: Add NAPOT range invalidation support

 drivers/iommu/generic_pt/fmt/iommu_riscv64.c |   4 +-
 drivers/iommu/generic_pt/iommu_pt.h          |  98 ++++++++----
 drivers/iommu/riscv/iommu-bits.h             |  24 +++
 drivers/iommu/riscv/iommu.c                  | 160 ++++++++++++++-----
 include/linux/generic_pt/common.h            |   5 +
 include/linux/iommu.h                        |  42 ++++-
 6 files changed, 259 insertions(+), 74 deletions(-)


base-commit: ac81c0f2e6a779e444c5b6fd43756ef811656098
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
