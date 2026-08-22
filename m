Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F5C5DF97
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSmLZuIz17YaI+SEs26UGYYUFq/8qJx6Wlf4pGMVjB8=; b=LKn0ZzFbLj5oOt
	syWuGm6DPFp3AMr1cK4Mkwgq8nSFUvtzzIDp3BVJ012YClK1aeFr+hUXTOHmbNHfL6HpGHqEJ1Bzp
	0yaWmazrbF1V9b+ml9r4OUty8QviCL4k3nWwvD3lDzOCovRsjfBRp8ZULtfRqwM9lksvKRcOjC5HI
	By4xJAPu6Z0Cp2NXf9tn3Ud0wH7XzdUSc18Ug6++DTQ47h5B2Fpa5mPEhlB6uoLfE/TkFks76im34
	E/I4JrkTtSHJWnX+FMGGIiajaJ0BESeo8NDAYABB10e7gILVoyN3zAg5MKrDqdR/xVPB1ctK8ZpYf
	iDVgLHY+lcjcf75VL11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmMl-0000000EZhq-2GI8;
	Sat, 22 Aug 2026 14:06:35 +0000
Received: from mail-westus2azon11012016.outbound.protection.outlook.com ([52.101.48.16] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmMj-0000000EZhW-488k
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 14:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pinTY+dEmots8R3kx/FqpV81uupvFSSBoenHIksajq4HvZz0d+45d07GAQMC3HGIBFPTckkrlnOJjGsQKmmQYnYOb4BdzmzjsZJVy+Mvkcr3FqYUpMDpKVjtSNVguxwK7iybIMfC5zVKuOk2l71mrYkIQJri9GfPIP0o7yhloKn7abSq0AYEFSJQ8sbhHzPmsDQsSC67+FlF4wWpL26FYTvXzrGQ7JsbfEUMV9DEnc1vibJeXhK5kc8J2Sip/fNaE1f1/twLjTbTY1VaAyKzet5UeHFtW23Kyojsf9Im/uwVt0EXyNYIZzY7Dsz3lJaRu5YFznvsNShrJDdkkJ95hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcHZr7sTtFtGIVkh/sHUBq2WiLMMwirpo5pcr6k3ico=;
 b=GqRKkC2od//bg6afMOHrOYv+Hupj1xgrp18M8YZbwTbNoiV+oJwS0MudngUqGeIhQty+PKZTncmnPfz6m3VLVlQrZQWyeYd63uDtfJHEjmD8MvcsZMxcwkVTFl0xhsVWcijn+SXyqOQ/PB2MVQvzmnKRUF2wtm4NjF10pu0Zi/1SMYQ07ma7jCGZw5bLECdBWBkfcpwjeB7wgoQ0KoaPik9Km86d+9K7NNhiZWBw4/r2XPcQOGfwPgwQQZDnbJZgOZrC/yVNHsphhpI+RW3V+xHu7GA/TiwLVImMN9RLV6yX+7jWBcNpgQ+q3CwkTWg2QX/He30rJNbuf4xwG2GPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcHZr7sTtFtGIVkh/sHUBq2WiLMMwirpo5pcr6k3ico=;
 b=FPdu3AoEDAJBCmqlPQhn4RU/1sL9x/3eE4cfRz+ey9ULBdtnYn41xBIjpMpYxUdV+HNuX65HTYgjXDTgpbVhEojw/7GdM+Yl/DnOy3eKao7/WEVBWKaMKYa5iWm7qezHuOi6dmckJUXcA3uajI9vm77l9pwRmbiIC3HVfO8QbJzhea/OFJlsCH8quReBRYUu79yBpSTVb9iMqrAIn/VjM5iCh8WpXpMDV39hOc9i3ATz/kdbm1vKLkcP+e+izGd5eODWwiVE3LjNmmLbNPDS81EqZ7kjja3cRuaF9gBwb4lrzEZquDltUKv953GH9t1ey8wUqat2uWmcZgTKyGMuBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by EAYPR12MB999180.namprd12.prod.outlook.com (2603:10b6:303:2c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 14:06:26 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 14:06:26 +0000
Date: Sat, 22 Aug 2026 11:06:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
	tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <20260822140625.GM244917@nvidia.com>
References: <20260821120204.GF244917@nvidia.com>
 <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
 <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
 <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
 <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
 <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
Content-Disposition: inline
In-Reply-To: <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
X-ClientProxiedBy: YT4P288CA0049.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|EAYPR12MB999180:EE_
X-MS-Office365-Filtering-Correlation-Id: 83552b8d-e09f-4541-984d-08df00568e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: AsibcpkqezYxrW/RAfjzf6/QvyerviqGMCdm9WOdhKECjK3TUzU6+sSyFFcuyFvPiSD3vdA5mnBxc18cZ056+zpRAQUyIjwbJlbJE3nTsSdj7gB4+5UjascHkiwNQNlgDfwEiNQCu4piSJIUSFkgaFmIZWKvrQAFEA9bcDUGF/zLx++xuUNAIHXEjNXNBrr/rJJ1AEFInfd9fDpxnDDa0Fkth6NitduUpx/q2LFQTcJQk/ZBKFSgBTEqgXpdiJah0jKF6VhoH4DUUVzjH7RvlqtrL3FRowg3ohbA71ESU73ZLcbpG+lJUzYnF/KLqyZaDz3UEnhUosKyC9b7OwkQruGNObXFalj+D1pRNg9iti+EpxcMLfz13/mT3sV20oGn4SjekBnnoWXiM3orFk/28yNXn7GFSqNMs2UxI2FFaraeh4iGxYM2i+eku8wd79VTwDIWwe7sbAoFXiO3Y75Ex9/cOhCN8ZVyzJh4ZHPjhbt4UnS8Ud2seEopDNbSN7TjUxkyF9BixtT9R6ZeE1KCGwmivdPb9VNCmhtXL1Aztftv2TUys6ILSnbuei/oIo43ytm8fVAnreOV0SOL7WSb5p55UnqimPWjwWFo5qQoEwj4AcsWguXJ1cALwEZBMcR3eyx07fcCm8Lz0oQWqmVsVKibd15gqp7dFKWwndx2A0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZkzG9neCMh/eT0tUmJ3rfSCr05DA9vOHJ2rWCLx0afaG6KQR5Ss1TDg0tXm?=
 =?us-ascii?Q?vUWwi+qkbZVufrPMiM2RT9o22api28TjdWx2YVXIpddJVKA6uX/lKURGmYXr?=
 =?us-ascii?Q?PLkqy0UQLCL8PT+I08sfrXyI5JODB3/bKPDzbV9eJ0IwjNn98PGxf5sjT8Qm?=
 =?us-ascii?Q?MG2Q538DxY+1nJRNf0LyiE9mBFjpDPSPoF89Zo6mL/PBDELCpkgACjFjPb0g?=
 =?us-ascii?Q?yc/td4+JTTrrT/bwHZCMFgrOEDP3Fh6hydFF9c+BE/YfnPHRUVjaMsaWhFZD?=
 =?us-ascii?Q?Zgv3dPcUcYMfNWY5keOJssb15hEdzd+aMjgvHH+oo2zUBqMBE9MeS16W+9Sq?=
 =?us-ascii?Q?peExSzBvYOhyZcQCM+ngwGhfqKZf70D7mKvVCLsK6cEVdAdv1SzbwDcLL2X5?=
 =?us-ascii?Q?sLUioy/yhFBD5sFALGBWSJRrQ016w6im68Mxw34lNs7IoFBbzGtxQBN5DGXW?=
 =?us-ascii?Q?0TIWH1JKvBmRGP+AKF1TvZ4ohVNkRmNsBo/6XVbVHaKtiCwMH7k/bwW2mMNm?=
 =?us-ascii?Q?bKZvyt/Qv56WpYg3jFnpdMraO3FCjtKxdjqoepGSJi2IUDOSgkS8DpNarirx?=
 =?us-ascii?Q?iQAt8nC23ZbYcVbM5FUnNDDNcsr5tOLK5p8sGHBhAKeHkfujdBxLSdSdcE87?=
 =?us-ascii?Q?x5rKEyauAbcHfKpNPHm8O4wym+CFpE41xI1bkXNxw6K22Za4V1+VtAHvv5A5?=
 =?us-ascii?Q?yEOx6VWzMguaKQ3fYjxhMI5rCsRWkiu+q+TlYxS9U5SQTdsivx1ANyXdBHIS?=
 =?us-ascii?Q?10hiv0ZY35gJV4kjdglKWaTqvvvPo3dYLnFeqQQ4cFynLYpsxTDcUD4C3CFN?=
 =?us-ascii?Q?uAX4WqR/q91mxhxQAq/n+vaCmzgWCYKzQt09juf1Ii6UqZiO98qADHrwVJGN?=
 =?us-ascii?Q?suffDrKNzGgjC9UKanZCwSR8RhJch+xQnuPaD3gbJR++yVFmAioyvfUuGYYv?=
 =?us-ascii?Q?V9AmcWoDIC5bvc3cVepZimDIb5Ymz8bvMyIw10hrbDQKMT4OM5+pTsbQf1zh?=
 =?us-ascii?Q?tTQsyOJ/YDngbEemLK9ERfTgsSWxucWDaVScSF3g5ibmMd5etMnIm/QE6hum?=
 =?us-ascii?Q?/h1De88LLVmhRePw1xHSHzv7zdIGUquhttFzhaQp1ybouLcGXB7sTSxdkgkt?=
 =?us-ascii?Q?NWJ9QlQNxispTqu+qrfIvSMm+8zmIq9dCQ69kquqvMxxASPeT/iPY85rwU75?=
 =?us-ascii?Q?IhlFdQN7TdXX61LE2J9OzR7re9t+rrL5eoTUbSeRqqgDprwGhoYjO9vsO3m6?=
 =?us-ascii?Q?9AQ3jM56oawRVOesOJAJ7xxUhwd5zgjBLFSIR+B+OKFl39vR4HwIW71TSaid?=
 =?us-ascii?Q?eBJdC2lmNon8SRlW2JhyOVnM537IJDhy2PyNo9TPXWgqu7KoehdI4oBkJy9h?=
 =?us-ascii?Q?nWDy83iba1KO5URoyKHVju2/u9QNsKatyLuqev/Pd1OAntKsfrfIEQ7tJQsd?=
 =?us-ascii?Q?iD8wz1j0qVlSJU4fsuYOQjbzfo3MzSPZSyP80DnSJbvH0hUJSHJ7E0RTg3ux?=
 =?us-ascii?Q?IPo6gD+7XEJzgn4C53egU7VY0EtfZdZVkfp9662rV73H/eAxa8uUNNdQgC9j?=
 =?us-ascii?Q?aKkyloC3zuv++KAvB277Wemyj49nVassjv/F1nCLCwsI5MUl8sZlbpk0NBC+?=
 =?us-ascii?Q?guoQrrQM3X+IEw5bD1/CYwyeXOk/V6QOCQtOPWGUhEVsxNuxbAerxFR7zGgT?=
 =?us-ascii?Q?+v4jzV7F6vfGoN7gWeSx/e1ZekOLe8o4b6nTkOdgfJ3k8wmd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83552b8d-e09f-4541-984d-08df00568e15
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:06:26.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzVkME1XFKyLAJntCI76PcgL8RWA8kWzC0IMk7wKAkxfNBeTqYJRIy1FAN9ZnqWQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_070634_040302_B59D65B4 
X-CRM114-Status: GOOD (  27.29  )
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

On Sat, Aug 22, 2026 at 03:50:05PM +0200, Andrew Jones wrote:

> > The viommu can set the msi_addr_pattern
> 
> msi_addr_pattern should be under the control of the hypervisor since
> it, and its companion msi_addr_mask, represent a block of GPAs. It
> will necessarily have to match the vIMSIC topology described by the
> VMM to work anyway.

I mean the iommufd viommu, in the hypervisor.

> > It is unfortunate you can't learn the vCPU the MSI is targetting from
> > the MSI descriptor, in terms of linux that's a pretty difficult choice
> > to implement.
> 
> With the RISC-V IOMMU MSI table and irqbypass support in KVM, we can
> write the guest's MSI messages directly to the device without
> interpreting the IOVAs. 

Every architecture can work this way. Nobody has impleented Linux
support for it, and if we do, it must be arch generic.

Not being able to discover the vCPU from the MSI descriptor means you
can't use any of the existing less-optimal Linux flows and are forced
to implement this hard thing..

> Guest changes to S1 or IRQ affinity therefore do not require MSI table
> updates. And, when a vCPU moves to another pCPU, or switches between a
> VS-file and an MRIF, the hypervisor only updates the MSI table entry for
> that vIMSIC GPA. The device message and S1 mapping are unaffected.

I'm not sure how you will end up controlling the msi table..

> As I understand it, Nicolin's series addresses the ARM split between
> SMMU translation and ITS interrupt remapping. 

ARM is basically the same, the ITS page goes through the S1 and S2, so
the goal is to get a valid ITS page into the S2, tell the guest to use
it and create a S1 pointing at it then feed the MSI descriptor from
the guest unmodified to the HW.

Exactly the same as what you want.

> The guest-selected IOVA must be preserved for S1 while ITS routing
> is managed separately.  RISC-V performs MSI remapping in the IOMMU
> after S1, so guest MSI target changes do not require corresponding
> per-vector coordination with a separate interrupt controller.

In ARM you'd manage vCPU mapping in the GIC since it is already doing
translation lookups, this happens without involving the iommu. It
doesn't need to change the descriptor to do this.

But conceptually it is the same thing, there is a part along the MSI
chain that maps from vCPU to pCPU. Either in the GIC HW tables or in
the IOMMU MSI tables, doesn't matter much, IMHO.

I think the two x86's also have a very similar thing where the iommu
interrupt remapping tables can do the vCPU to pCPU translation.

Again nobody has built this and if we do it must somehow be able to
work generically for all arches, so it will take a while to get it
sorted out I think. Since riscv's HW design boxed themselves into
doing all this work I guess you have no choice.

I strongly recommend you keep it seperate from this initial series
(And remove the irq domains from this series) and come with a proposal
that everyone can understand how an arch could hook into all of this
machinery.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
