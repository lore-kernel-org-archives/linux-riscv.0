Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9540CC5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQaP/amj/BhUx354GZH53vyb5FSzYEM9AmdAjmUz7mg=; b=teL3IklZpZZrkR
	9m7ibqtZOC4ANCQ6PyhwqBg9ut5CQ3hV37T+QKCAt+PNlNiW1oZM6ufu0gI5gktWlVO82O8+92djT
	DJplJD1kgW083zg305I/ITBfy0mpp2j6X65CvcuYs6OvY9bO02Ixmcvvqi1yzAsC7Cp46mBG7aZL+
	52vB6mzq7DZUqF9mo7/VwIQjPrjBffn9NvUmPS+8GQ8fd9VkFFsWsBBRG8Ul+ntun1g1Ia8GKviCO
	R5TxE4pXFXbAznNVUhXPXCOQYTJ7X8QlpiWen6i542i8dZDdbiWlZy1NILLiKeLe16inqPRljkT1Y
	gySCDgotighfv7qwJxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNwr-0000000DFsQ-2S35;
	Fri, 21 Aug 2026 12:02:13 +0000
Received: from mail-eastusazon11011015.outbound.protection.outlook.com ([52.101.52.15] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNwo-0000000DFs0-3fFp
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 12:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xv6v8vJ2EO4Ma3z09yZrdvqzvLiWeDCpkK0SzZKjzO+eRwD5PhvK0ViWEYKrpbcX2/9GCM4KmXQq3N4cD/PYXAV+2x19d1RExb+l02occOF+H4JfJzM0MXz3IX2xqrX8iXD+M+8YekV44QnU0KL48YDW+G/VjnqP0SCnzFfcJNQWiJAFkJDruRjisjmQPOCJElDtny8R+kg4ebgq+lZNJR/ktgG8f/cSvtmSkaZxRl50FxtHefW4RV71hJT1lRyfRlM/56sUZLlFNEoygHGl/plaRMcx+S9xFIYQvYfEE0pa1Z4Xna6foUDvWQHJBvJ0EzTl3A8Uzn4D/Y4UPHYsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJTK6vcd0z8UYg6glV8mmKpybwYoS64IXjelVBD1rnQ=;
 b=u3ypeuvs5Oyk1NMDXEW2pqJ4eLXfyjplK/HoVwf1iEmFRv0Dfp0WfVtw4K6LQm1fEEHn1++/DGBWXRMj8OkQDyXQ1s9vYv14WEBMa3J6mOj7TJYLLl1JH3vefJt2jWn8e8V0neS3SHGOCN2WbxAqqKgSqcPhLR0F27q67qtnf3/ObaRpxx9RJmq7+hziguPMDjznN1edSbqmWnBBjiyU7XxorMJ4dXNiT7MHZN3ru3bjFuC/xl05aJUb6vWgUt55xxVn7KIUht8PnSMXblK1Ja/HSc5uLQjEHjBuFI0Zm89P5tpnctkwlSUMJ7+b+E8zYaepnms0i7un0mrazOWM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJTK6vcd0z8UYg6glV8mmKpybwYoS64IXjelVBD1rnQ=;
 b=hJTYLM8Y3/ZgKd538sVK7CN96Euz73fA+U8g3b5uFKuE5DSV7tWqIi7b5Z82f2/mcM6jGpZaHbxd5tbP+EHN71bLWdImFddLtz3vzZomrDQUz/LCM0mpuwhL4nRB7mOHjQ4iUEje74sMnY1sQamla4iDo20jC3iPxc7oDS/7tG9oZFe9xM1kR9pBeMLSnDveR9xal3W2n/NscdFBtyeatqLfYpM1mxlY9D7h05xY744Fz5OQb+WQMCoxgHznka+dFfyjklD7o9Cf46ZDd4OckBnl4QiISG7qEoo0yesLgP0Rnab8fR4GeXg14dVBO1y6h2OEISzDeTp3WddSzIL4Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 12:02:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 12:02:05 +0000
Date: Fri, 21 Aug 2026 09:02:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
	tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <20260821120204.GF244917@nvidia.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
 <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
Content-Disposition: inline
In-Reply-To: <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
X-ClientProxiedBy: IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: f2164a1a-626d-4e02-32b6-08deff7c048b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qRBV3uqtPu3yaB6PqIyypK/AhV+dKqgDxUwycUVkyVgU8Hnc4ojLgYsAgcW90v/fxEkiNwjZ3inKzuwPFi6JAHpD24Hg6HKNBNll2LC2ltUIgwxIXVoQ6a4wa0He83/SXh2EuLC8eOoXGtQudcTdOdcPQQudRkYXQllWqEof+5F4TfOPT8XV4kFyrKVbRJRkyvog64eDGmSNbj/Hqulw9EVlMgeMeUl7RwFRqUNUbgS8ExgO1ung6HvgQbfBxg4+w7fzuHJan4ywKA6eun93R5IRmtEccWnG9K+xoh9tML8H3FEIeynhKx4pHEm/CzykpvoUn3tcSCYxYa37x/kA4IKN35LQuS5hmv2OT9qDJRaiyhUVTrr8lj9VXY/Im3pmls1EG9RhNth4t+9FhQkx7dvRX0zfOFYGmvMDOGe0Ez5wD4s8Z+wTywwgeA+6rK7KXIHeceFK42EwoxfhdleIqekBqIeFChqJ5Mxvg3ctYHO8cc8IPLAoNTW/pdkn8lvcDZnEBoL4moOASOmkiePIpD4S0TsUt36LW70Pk5K+kNwUjQHwkTrbHLaXdXnIB5r69PAP1YDw8ARR1fbRe/Fu50YScuPXhodUPOmJXZlB9yO0q5aIU1q5M1pReNmaTFmCm39WSgp4zDbeKGCprtghF9mplznlJVzrz0jMQwiGTbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AbkBJeYkhigpMV6xkUeLAhj/spXC5gCEU34JQbEcJrL4wCyHBJ2oyfd+Zh4z?=
 =?us-ascii?Q?BHY47mbWC3Iw2DDFwR+qhpbI0Scvm/Z++ZEnErETnQyjjspsZsbOdU/iXB7T?=
 =?us-ascii?Q?LW5k1rMym2QRoiWo/NVGMU8aXc7G0LHpo45Y67f5fesTItpYflqs1lrh1Pl9?=
 =?us-ascii?Q?Vyp+TDYyCpi/YGdhZOvHXHmGx3U0yesacqntajhwdiILWnzFextzvrm77fWI?=
 =?us-ascii?Q?ayBYqHllUvlFiNQjOf1HqU4BAqg6J/xJ2CHkYMzySPcu7QqhfALGiN3PtE12?=
 =?us-ascii?Q?uKfeF8pPr8qTws/QWzFhP6CeDbdER71vgygQnzfEy9PH6OwchPWsII6xEMKg?=
 =?us-ascii?Q?jvIbMRoAjw6gMiRflsxuv+iRtLWzMAho3zTgMAcRysPPMhkL9ZTPC7vMOw9Q?=
 =?us-ascii?Q?zsKdC2DqTRpfiCedyAwazlSGsMMT8DM6QYwkqYAV20mxZ7ZSjPD3Ozb+wYlw?=
 =?us-ascii?Q?yQLHBEIYj1Cren620gGETHhXe6bjF11qezgC6OXE3jzSREQ8Q+pE4QB+dQKV?=
 =?us-ascii?Q?n4aBnRkxdc15yqFsaVWpHhw70L4P8hWrrA3UXD045pGz9hEc+dWFWE2EQtFQ?=
 =?us-ascii?Q?QFlmx3kq1F6O51TVF4jRAbSKRFUuirsm0i46KtTEl8z7TPzAeT3pnPS563Zp?=
 =?us-ascii?Q?GAqnSGA8R7Oa36HAHp+lFO+HMOm/QTlRYAETBdwF60LEG4EvkpoFxBDFtz0w?=
 =?us-ascii?Q?G06r7LTo23pYYbYcjplTkmaSgr5laiozHxv4cuCMNcW7Fwb/CQiYV1UIxlTU?=
 =?us-ascii?Q?R+jBN6CmQXNvZeJOQgvB5hlyU4954f79zGQ/E9CbIkFceLFBhuN0m5uvvj2D?=
 =?us-ascii?Q?PqGP/wkJdeh/g6v7Hh8edxxxkoTjEpcCi2KaHKCTcxT8H3VXqB66sBQcVddj?=
 =?us-ascii?Q?WfN2q28bSpJuBx0l2x4P4zfeuWAc2n0ITdN65xBo240Dr7RW9ymmfb4zY/6b?=
 =?us-ascii?Q?x5MAXQvDiyiTagZQ3bNRB+QuA34JliM5h0LCb+NicKjsrd23iUkPiX+bicFs?=
 =?us-ascii?Q?N+f42NDobZdNORv/ayKJvtqd4vlXVNbqiVZdzQX/02ke0/l+P/ZwqH2zSUdt?=
 =?us-ascii?Q?3OdJtMqKSEqb82v0OM3kgQa+moh2Rb9503dsA6A8fC5UpKWhXF8pjtsQZKfr?=
 =?us-ascii?Q?sDcKRqvT9cpeOlOY6uyGRZiR3dpXBypdJ0OQdRcSrly/cRPmMcphp+DYWEjh?=
 =?us-ascii?Q?mKIMMSsLarfaFEtfC39gRHReoqOV9ncpaVBCB+OugLOE/X78+EtRtsLmiPX0?=
 =?us-ascii?Q?SjOjFtCrYq/uplJdp32Jcq9JwLJh97UkWj+QzuBEJZwhtMnBkmX58PPRxw0K?=
 =?us-ascii?Q?2fno3kEFgb2FQcwuLWolYsw77gOxyre/amVEWKcKNz45WBFEDI0iOmJCyx+d?=
 =?us-ascii?Q?OxqNnThq5H8LGCw0vTdKV7rYekIfF8tbQg5VKctASLZ70sSefLpxN3C6MW0/?=
 =?us-ascii?Q?PAvo0J2OZKNDfucUpWUI54NeX9o9xvBq0oNqrNYgs59z3f7uVrjFMpno+nq/?=
 =?us-ascii?Q?PHyoPE+DpHlPG96BeJn/wKLNAXxIuk6yUhyHphOJ2B3iO3N3+hctY5PXI3MY?=
 =?us-ascii?Q?hNjDMnaWKykn1xslW8c7etWv5ecVYaLHIhy9dne/hFMGVebRSTXz8bH6xtPg?=
 =?us-ascii?Q?vCR2P7Wcyjst28/xvyb1pRbCyzVVauN8NMOkwrUlKcL7lmxGYouUYBOMnKlx?=
 =?us-ascii?Q?U5eA1iHLgqDVKr3MTzQaSqARB1ogIdy9W4iQa7GPmeFk0/sT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2164a1a-626d-4e02-32b6-08deff7c048b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 12:02:05.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDNak8COQXAPbfe28SqMp6yNjDyI5lm9aApmzn32uTI8nHaC33ORo66vLBAVnQL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_050210_937012_D0AC1CFC 
X-CRM114-Status: GOOD (  15.57  )
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

On Fri, Aug 21, 2026 at 01:07:03PM +0200, Andrew Jones wrote:

> > What I rather expected was for riscv to have a PA window that is very
> > big and not just one page, eg adjust iommu_dma_prepare_msi() so you
> > can pass in the entire PA space that you need for the affinity
> > changes. Maybe this is a list of phys_addr_t ?
> 
> That's more or less what this series does. 

But it does it in a completely different way, and I'm struggling to
see any justification for this.

Again, just pass your list of PAs to iommu_dma_prepare_msi() from the
irq domain seems like the easiest and most ARM aligned thing.

When you need a new IOVA for an affinity change the PA's are already
mapped a simple offset calculation is that is needed.

No weridness in domain allocation, no messing with irq stuff in a
finalize function, no hackery to iommufd.

> There's no big PA window
> because the IMSIC PAs aren't generally contiguous. iommu_dma_map_msi()
> factors the mapping operation out of iommu_dma_prepare_msi() and returns
> each IOVA directly. A batched list API would be possible, but it would
> only move the loop.

But it keeps the entire flow consistent. Trying to pre-map MSIs and
mangle all sorts of things in the riscv driver is undoing the
generalization and what is expected to be be common code.

I don't want to see any mapping of msi in the rsicv iommu driver at
all, that should be the most important design point.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
