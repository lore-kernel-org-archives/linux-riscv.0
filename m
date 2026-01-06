Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23FDCE9D42
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8WVNQuhEon8bQYpOyJW7nw/IjxVm8LRfFz8Sju89AU=; b=ztlJn9lJH9MIWE
	hUbfLlI+GubcVjCAdLjdjUQkwho2DKUg9qxnKJkMNTb3svSbBti6qIM5hKIzKTUS7nmPD4oPwjMAc
	j46Du9LJ3amh9BhJr/SjoWho6b3ohJxBuKM7q0AyttUK0FjuX/bSROQrw4l39mt48r0f2W+rIsUS7
	UvE0XLmD8pj/ck5R6FxoQv7jes2pn9hqfHBlGdKRTnPlNOyWKRcXfaTvbgiC+SDCrW+Y9RH9XcXtm
	+Sffu2WuCYhD22MPLLf90V/CTYxfbU2E7LEMxyQH23C+PYRWfaMb4HudveM0Gz7spic4E1Ic+QnIL
	+8DRB0tUqhynv6FW+1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8eH-0000000DMKu-1lSn;
	Tue, 06 Jan 2026 15:07:06 +0000
Received: from mail-centralusazon11010049.outbound.protection.outlook.com ([52.101.61.49] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8eE-0000000DMIn-2D8l
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 15:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as2VVJcBH0JanaL/R2SNWFQtXn5PQGf1Lgj8IHDrZoiB3YO5RpFqyBDURSHR2XHqi4/QN7i3DR6NqunpfQKHR2BO/D6MBMUh9UJIGGA0tL+i1x4yCx/mopENb74zV+6eys3LS/f14OxZvrfPRYnjdd6HBGpJRN2R8U/V5b3VsfUz9CQAI2Au/Bf9OL/G8QnoMknTknNYmT1Xu/ta+ZqSKwz3EndvFLG+ZSRhQD18Q7fgf8FBygS1HNr574CK5frNUlrGLIK4+wehZGpjOz2nZZxlb7nMqd5Brm5j1FCXfoCNVmdCH9ZiN9LaoZrwlR1CME0juL+zVhqKu9E9PuAu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGbW3CUCxKAcxSnk8forEZkLl+BFi+WYplycKmiUzAw=;
 b=jAHF78DPUrQ2y9IkcMYHoiW60p8Tnh7ZA2EoAer7xCeZ0iqJw464J+4//3lDzv/qD0JZgdrs3nxzMAyK2RRDckG8zOy8Tmx2dBzGcgLp4P8amYVY4+3lFfH+8b+1kRhXzjTBIP4BhO3BgAgshSTRLx8aCdPJkpC/B6FpTyDOd8dxQoFXn+Kg7fHbV3TG+kfBPFMTF5Ok/6UqmRFQrCrqEYglvJR3J1qt4kFdrdn2KRM+vymi3qu920T9Tn5eacpBix97F64jKevNZXUajI37A9zoC/jBM7J52spepp5VQiIEOvZ5ljDNkgposK2pngwv43b2EhENYUoUIx9YSlO3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGbW3CUCxKAcxSnk8forEZkLl+BFi+WYplycKmiUzAw=;
 b=WdykitBmvmpFO8IwEUwUWc0kqTI/xsXFUo4vrOo1BPVifkp7xGuFhp3jGuVZ3+hRFi5LuWYPtX0QOVoodeM4JUp0GaqFlBeWtjhfyCR7NTrlKuIpyoXTkmDX1zNoGBstnH6bb9jCg2xSk2haW4nyqYUlCqUUckOfbB1bLSaY2m5vQWj/SX6tvhgLZTgUd2FjvSx+fRgztzYWGN7rvIOkMrePIPrwDH1dxSIR7n6Fd3eZYp4PuQFapX0cVacHYZuW3pJQWMKM0fwW8a3Z56jtbbxTzKxAhe8d6om+/WSpsqqyVVy+cJ4ivAxDhX+QA1mrgsr59H/dqXEP3THOUm7jAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:06:55 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 15:06:55 +0000
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
Cc: lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>,
	patches@lists.linux.dev,
	xieyongji@bytedance.com
Subject: [PATCH v2 4/5] iommu/riscv: Enable SVNAPOT support for contiguous ptes
Date: Tue,  6 Jan 2026 11:06:48 -0400
Message-ID: <4-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BLAPR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:208:329::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d2763f-5dc9-474b-4e43-08de4d353881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rJe9+AQhqCRNffxdT/SyghVlMd7yzv1Byw3UdrvLOCTVhCpLqkRFFr+RBxDN?=
 =?us-ascii?Q?pFbKTdhYmEgDccXtpffNV9tUrikfJpGCbz8GG/TAWqYDA8A2aYC/ljAJVRDC?=
 =?us-ascii?Q?FZt+bcR3Vm8YjjRWVWgaaKkD25jS5ND56GY/+tQY7xyyQ37Z8EvexyU0CcTp?=
 =?us-ascii?Q?qnE9hJfIXAS3Opqs2lcPUYiwk5HSKZJvLRge6saeW8D7VHoZOin45Yct6qqR?=
 =?us-ascii?Q?JiTxUH6VEo39dkFFWssIOZ7QbhcGV24tsX6D+Hmab52bc4OmLInHtXMTgNtg?=
 =?us-ascii?Q?KeMRVlLdwrteRdkVxIXlAhmzb7+QDxcq7NflBDaOxf+UO3aUY5WI2537vMgx?=
 =?us-ascii?Q?guvB2rhEDpY7Xe3maP48z/fha29HM1xfM4cc5E4j3MbUdiCoZNR9jyALIhTt?=
 =?us-ascii?Q?vJ+/EvdnurM15SyfSOPIa/PogCEZNHiZ+sQXoqfml/59T9beDJF4SazcpHzb?=
 =?us-ascii?Q?MyfcsCNIJi5EXbiGEqTVaz8M2nPY6tZvEVgBemvTyiNZb3ZA0Heev2oWTccA?=
 =?us-ascii?Q?CZ7AIRyG6GbPQPXEVK383b8M+/cEc87fcdtJy9aPfXFxw73VvUsFyQFjN2M5?=
 =?us-ascii?Q?F8NW933KZS+fUlHrd1O/vgIAh9MVqJkh+qpAlBgPcB/AXcRrGB187q4U3MWN?=
 =?us-ascii?Q?zGhOUpG/+0Ql3bIlIwzZhTk0PvfbLFwOTvrJ4CbpHWswGw4LyKNO6sYZ83DS?=
 =?us-ascii?Q?lV/YzH4/BHEry5Vn3P9g7lkXYTlScwETlld0Rm8ScpmUgDXCNIpqhKUyn51x?=
 =?us-ascii?Q?d0rnb1fvZYRGZjA2MMhuQ2a3NFtjg9/2iKr/t8oBUleC6L5tx4I1jaFEyar/?=
 =?us-ascii?Q?ULx/Ky11ceYjZ+fslgedyS8eUzQrWPJ/k5X1Rung1r0N0rHwPNQrlNuj2/7c?=
 =?us-ascii?Q?KgHOHE2ytUAPXSGi9PxE/JNkz3C/jFTO9shHw2pSzZYO2EnTS7RDCaFcvYuO?=
 =?us-ascii?Q?TN8Cl8z549wv2+fxjDH/3XnyZy8MnGvCE7Y8MfBpbJpL0PNGHbidq7ByE24j?=
 =?us-ascii?Q?aPQwOWGEVsb7KstBqiFOPjVgRf1Thcft6D3j854RBu0w5Szi6bT+dl2KmxBR?=
 =?us-ascii?Q?TyFJdJyEjXXXBYMXWJDQ0fnN9t0n5t5MIl1AgPtocrgXj9Dz519+Ql3jbzDA?=
 =?us-ascii?Q?C+Q8C3HWPMUwf7ZYGyvy33jZVgulN7SzPpd/lcIheKaVfp74+1U1v7NA1ajK?=
 =?us-ascii?Q?K3iM9ewBAyr/Pa8OTy5x5G9+N3EEr80PcKEQ4lbDQ9/OBH4IZ63TSeuhJK8O?=
 =?us-ascii?Q?d3cmezjbfTajHcDKLLJbYil4Vuf41zhlHeySrewaw8FFJm+/fr4dqxYKVVrs?=
 =?us-ascii?Q?1GBdaietFc0WhWfZYZ0nYeBHdmnmnJJgton2UoDrSL0M1gYd4pC7Tbgs5ldv?=
 =?us-ascii?Q?cB7FvcHaWTC7JcAQ0Y76B4xtneXkYxlq5hgbxY0y+0XIN+BCVoEPcYg9HOmC?=
 =?us-ascii?Q?sZaegr7pawjUg8ASW0qRKlUNZ7qdsUN0w2urW9uusoZzARu6EDm4D51mHZql?=
 =?us-ascii?Q?7zn5O5NpJO7acNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dh/U0Uc5tMcNo3Y6VQ75/riVSJe/ZRP0cIAK+cegkUJ4fs83t608wI/Ozgp8?=
 =?us-ascii?Q?uMcTzIcttJJQt4zYKg0TfFD9iWvdfpuOgNw6XCvtyukI7MhwnRm/s5+RuFFR?=
 =?us-ascii?Q?OjtBYbM7H9XGbPLHNsh1H62uow9wKPi2iAbFoRAu0QgXqclMM5j2Y0NwKpER?=
 =?us-ascii?Q?QwhZ8bKkEi1nHtRLRI4jTOGPrgFFf3gf0f5rMIOQqrCQciRmzjjSRDpPKSh1?=
 =?us-ascii?Q?OC9N3LkC7qHj4ci9SBs2oNQ699M0RCOwa/yz4Bjr2O4o4aA/dA718CfuqVEB?=
 =?us-ascii?Q?cN45RXW0oHSTIvWf4Qd4VbcqQM72ldTMO6dyUBXZfvQsn21yNyAhjRkdzxgq?=
 =?us-ascii?Q?ygFhUfKITiVchW2S7h9ohdn3oTOw9sCaXOKNfLld9jH4Qa8aIPYiIX0jsBtM?=
 =?us-ascii?Q?l2USP+6kEsmrwyCj/Rc1jRmyyV3cEZIEDIgJKPDsU08/j7KBNKeuFB9lTI9M?=
 =?us-ascii?Q?h4/Bow5Y7wUZqWft4lrUXHZn3gfdntM/SX/m4XeeTf5206g1iQNilfIkQRyp?=
 =?us-ascii?Q?5nxfPHRGumc/wuJkEwwTB8DnPI3R/M95fO7ze4DeDGooEtJldihWjOq8FThE?=
 =?us-ascii?Q?3Ez8B7ZqIDEcf3vs7YRQmY7E2UsMJy4hgs8KZZudBRCLwhUg98FixNLn5Rq+?=
 =?us-ascii?Q?vbUrlomwOry2FkHShUBCT/nlKtRwXwsjf+V25jQf4ggbuBW6GRzRGKTzghrr?=
 =?us-ascii?Q?OsmQyBz+xoWKkiZs/O+QE+qmfCZX66sU2tjoyzBMpb7w69A6JSzSYl9SDmPz?=
 =?us-ascii?Q?vvmv4ieeEelW5YxmvV/0BbjE2lxeutGNYEVVOTnF/eWGB6XKoksU3PZ+7I1j?=
 =?us-ascii?Q?DSVyM31b3Gwh5FJvE+w6wZ40i+rqGGyJUqjwf/BiW8raFQFzc2hd9JUcyO6I?=
 =?us-ascii?Q?cpPY02f2zbURi9Vvd0TWhAMlxenlznFg36GPPqdLq1dIw3VQx0CqR68WxMtk?=
 =?us-ascii?Q?uLy/wsuSKF+k/0h2riCC77Id8NY54YKTbhtS7P9A7pV5YDWZFG2a+yo/j+O/?=
 =?us-ascii?Q?tiJqa6Mq17MAkS9V/Jr+rLe7BVxN8+0zqKw0PW7Ba+1+sYc/J/vnzsroKnFp?=
 =?us-ascii?Q?IW4iW5ChiDWZZiKmqS89a2CSRIIgC39kjIk691lstTgClCOeU0IjTOagg/jY?=
 =?us-ascii?Q?EpLGbW4raPNwoT4xYqcfxqx9++6Mn44U4a1aJs7vTPU2pseLwzEznmsAnFUI?=
 =?us-ascii?Q?hQra2UvPVi3iuJzdYTGbtzvifcDQRXWI3+ZUALtzVGayS4wSFOYWG3yTGbit?=
 =?us-ascii?Q?xOJ8jm2EmFdh2UL+4br3aCqRiSNLPVP24CL1tuPCfW8Px/Ws7Rl8yyJ1rKvq?=
 =?us-ascii?Q?rX2CQ2Tm1kCzkWrWX31cUu+5NqoS7W2fnQ+W0Cwm/qTuFeKRcizPGppNYciN?=
 =?us-ascii?Q?QWhDXVHaoyt6mpdlRoNasAx1AR+FxaaQIjdi9WdKGV6Eh/Gffwh9ziO4j3O1?=
 =?us-ascii?Q?UK5L8/03BggftYxr7zUB7TXuBSMlNOLLQMriYmpYwMmqHWMNRpDlpmbuKfqb?=
 =?us-ascii?Q?x2vhFUqQcQAPOPGo1tooTXPu2sDRFA01DZEVH8kT08gFLA6t7pd08BrDmptZ?=
 =?us-ascii?Q?bJaPS+QQQtG7e65eH8l5H5axE0rH8ftoG03agYR07k5euGfg6+VM0ddy4D7M?=
 =?us-ascii?Q?lc2YQuHSOdN0YcKwEuWxBXG9JlYjCx7jCtgeMDbnf1XbZlxDEhO/Ti2ZDj96?=
 =?us-ascii?Q?Kr7qkQJC+3YjXGySsDZAl3DpGALPI9JvVWvTN8HX+kp8VwM7D+nyn7ycGTq5?=
 =?us-ascii?Q?7s2nIl2cLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d2763f-5dc9-474b-4e43-08de4d353881
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:06:52.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcUugrScFQAygvu/4LGE/Du3UKJHBVyhWfks26q+X7jcdcutWXmfnyqD8kwKiejY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_070702_563174_B63B97E6 
X-CRM114-Status: UNSURE (   8.80  )
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
