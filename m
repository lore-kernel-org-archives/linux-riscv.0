Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7655C5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H76b0PhIncKbQwgILwmBfJUh3Q12cu2aJMZz8LdMnE=; b=TMp5hWQJCt/Vgv
	UvDr77RGNWy/e9zMN797sAWjE1+X87K5620vDoPF9RPZHkYNKbx11rBn7+vzEUBcm8DuwAvRBtVw1
	yl6dZpeTL8BwwgLPL0QFIoGJe+38ijYuiU+E/v1t+XhN8mbFZFatwKj4bxElOOFcW8R/kllyqoIDY
	rv3XkE+mMfudODpf0Ysr6VtR39b0sOSpCbAtcFkjvovRGLwqjmr5zHr/IQduH1RhG3Hn2rullh7m5
	jGWPXoHMTNsjYURo3F6jD7NgLh720MRO5aObAVm7fl6K6FQdLW+ZhoJ01DXk/iQq1q4UN4wbFqczq
	1mWOdEVV+bm1Z2yqo3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD7-0000000DOKx-19XT;
	Fri, 21 Aug 2026 13:23:05 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD5-0000000DOJ5-0O5d
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5935dUVKnFMBsFr4xGXzBS5QhCnNycBy573zyO8HHFcSnc6MYKjG6rlTQIZmTdI0jvie29zRg3YLtiJWqF6k2VNVeAEoxxaHlGg8PUM2mR/dhWzZEIuHWAydLbY5FwOa/a8clrcrdGlZ5XNYbTqRqdpk2tzQMskHto9FujKbJjXJcPD9U9Acx1erI28mEAS13+PSazuHQMcW0Unr8kiQd4Mcifjqn0rotY1OBEqkcSQasthS/bIP6/CvcZxApNplYdNbwKVwjXr8+cAMSNcBj8ZDgaSBQvXuRwjCz3nNDRoxcZ3SIqMOVLvMvO7uIq8+s4+j800f1+3ivY3nHhoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMpBOxAMN81zHy+/pYsVwm6ePPDi8Tv0GEqt16OekJ8=;
 b=bKf4lh8h0gbDekg8tNsnC+782ONQEgYXOOIVS3HwrBmFFZbJ0QgMnqqoXeLbLVJQ0Zs8NrOI0CxIkzvrEpauTc+ldnnp7y0ZgPVfjyjs7uZFtxTKLzfeo2Vjnt02N/EXVd/cWZdQvjWTHPanGAZUTmFwieHDXLIWU9Pw3d9P6gxbo6Z7Tjhny1lpUdPxLkESOXrVieepqOPOolOSmRL/p21o279qVxKv5+9CaDBzITQaFGbjgTNKajG0FIjd9AarGlB+3c+DWuEh8iMnb++ydNp3aWepIoWvSmDRI/e5bI2FgNFPKuOmLfc/RjDg0VgZqantf22615CsnLOXof1fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMpBOxAMN81zHy+/pYsVwm6ePPDi8Tv0GEqt16OekJ8=;
 b=MYJRO6iwwYYGrQIoTHVy/gAFszYYkUp7fntNuomy/9Xm/2/dVsNHJFiLyEBtPsRMIMYl1s1d5w6LvqFu3ywXJAqWqWlil1ShCJh6y0iDwdzJd3C+ynYJsQoaRXpJxxbQrf8+ot+UA1Ci9vw2EJjAVV9RE/3h/VLW7xLuSZOl+XxXcmcAti9W7fA/01vxoNouxLUzbiGu7OdQelHuCf3vyK0t1SJbEJqJmhkY88sco90tONT/PF5PsQ8xLAnGKZ8OIdC85MF7wjUMdlMlNSrxIeETnAkBIJzB66jWTz+gUyggxU6gU2c2tkqDsZhzrVQIcef7EoDLApQKGH/x7fZbHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB6848.namprd12.prod.outlook.com (2603:10b6:806:25f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 21 Aug
 2026 13:22:53 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:22:53 +0000
Date: Fri, 21 Aug 2026 10:22:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
	tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 13/21] iommu/riscv: Preserve MSI IOVA state across
 domain replacement
Message-ID: <20260821132252.GG244917@nvidia.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
 <20260820215204.GD244917@nvidia.com>
 <wshoqx3xyz7f2jmhgbyzpkm4ppl64olswhw5u6dye7nmomkari@j2zg5ecuvsmg>
Content-Disposition: inline
In-Reply-To: <wshoqx3xyz7f2jmhgbyzpkm4ppl64olswhw5u6dye7nmomkari@j2zg5ecuvsmg>
X-ClientProxiedBy: BN9PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:408:f8::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: db705181-5ac0-44e7-a92c-08deff874e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: WLIzP2bXex9Uw/bD+vNjI0Ob320IsEBb5MUXMMzkzMnLdl42++fGQUtk3kBeQ17Lx+L8j2FBBvAdqsFcV5I63otXxOfnAkrLHmjUJT3RKt7edUB6V6FAl2/B1TrDQLiZD6ZvqiaBXRcJmJ4h2nUVIRbdBZzfYfLV2r4t2ElcfGbQrJUVIKnmaVxp4NLlVzd6PZ49t2S3L+eP6kOyUKbYD8a0/ej+dtNcNlcUA+z+dLcoUlyK/ZBugXe2VhFOvkA4c6WQ6X6FZXbnrReNmEZRPSzeeZRMrFsAskdAJg7WtewJlQfFu1k/XpbshXwnNus83VaWoqMLZIfDK3/bVH7J+RjZ2/jNXLSXU/+blW8uX9eVymExGwnEPaP4M9OOvLNeFGbJa5fbQ2vBnvGMiRqE9J/hsdQC3Iys9TdU3EDi8+Vb7BFRZoJVEfCfzOzGXI8PityUy8uRNzO5DfD1ZVtD0TcGa3Ki1nms3DToZ+SDjrvZx3XX8K3rsRH6RJlMwwMRcVd7Rz9S67Y2Qj/qtz7in3TZGN7lLs1HBfF7cKHMB8O9iJfaL1iY+aDVaFehACAlgHEKL2whAFPP9A1ue9f2XKAYEr9w4zA95z0JniWy6gx7jmiuTZ+4hO9S3TYiI2clrz7xJ7oWnW7UxqvOLwnXhwn7A1nQ7npHVEmPZynv6T8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2wwpl6IPNkAupFN4uAPy/Mo7h7KkSK0XseAOHRkic2J6JIlF2W2grA9Hnid9?=
 =?us-ascii?Q?L3wVnwSRb05uUlzWY381tjoB4Aiks92qqyxeJWCiJy87ferw6OhfSA1OGk/a?=
 =?us-ascii?Q?caXwbvH4+gWXJUmstAzOXq6ku4VR8si9uIq5rV1ZJSCIzlqTmAT0zRFf0I8C?=
 =?us-ascii?Q?m4JljIEEVbdEm8IyIfCQylo8XEYmptyX1Al1CIXZqyZLNdxylR5yJlv8IoSK?=
 =?us-ascii?Q?v2rWzLJbas0N7u0FLyKcD1zzgVzleRxNogh9YBWJZmHDFdM1f8NNd10z3Dc9?=
 =?us-ascii?Q?3qubX64GNvmQXtcjAWgbKrqbQxdlUUeVPPMI9sYyEh3FlPei3+Ewgowjt+PX?=
 =?us-ascii?Q?fkHJznjFYOZa/upgzLBhAXKbrbFQDPNxMKgm57KKhMLducYMxC6Hh48gniq5?=
 =?us-ascii?Q?36ko6qTK7xcXP99qDbyp3I5ddDxMY0xH0+ngc0RrX139JQj+HvGsUf0SRBSs?=
 =?us-ascii?Q?uGUmAh07N/KBGWt3eErfStZ2m4Z0E1uYeuCf7HiSgv6AfOYSg/H4g036zum6?=
 =?us-ascii?Q?P9uqUkJUOw6QKuVudzdw7ShXs3xVV14W9iNO5xIwjKXpIxG+fv0BVvRatB61?=
 =?us-ascii?Q?z0+mdcYvlG5fXFk4SJR2L/tVSN7UDVbSGANj7jtc/AmmQIHMeEIlch0/rugf?=
 =?us-ascii?Q?OcGHFvVQ7UQigJ/LIb5eIKWVOvb+kgCEVOtACtZc7PXg7cRxKdN24nDkfFDV?=
 =?us-ascii?Q?ug1ynGYI11xMUO/LDqOzHLUlo4q6Km3fRWuncx0sgIr2u9dN6BOuryuG2US5?=
 =?us-ascii?Q?b7BqX5dk5u4GW8RWyZC6v6tpG7mXxe7LkOmsABC1/goiI5l/JLssnp9fk1Gu?=
 =?us-ascii?Q?NDI4Chj7sIGCp/i68Rir9kfwY8mm9apvZLmC5kPGXemNNI45dUt91GVm1nGX?=
 =?us-ascii?Q?+yeRhN0nQ0/6VpUe12O/P81yMR9rZONmR6FrtRyZ0kr7fDf14dTpq2JW1ZPc?=
 =?us-ascii?Q?gxDu/3VuC9QbyOKf4R6tI1Ps2HE5XkNjZ/J+u8Qz55bLlGhxs7wfHxehLQfS?=
 =?us-ascii?Q?Cyf8Yi0tZag8/nvcTj7syTHskgKcrSjulARdhNCr3OTw1+MkxQTJopXKtblW?=
 =?us-ascii?Q?mtu9AajgAf+4m0CIm6UUMv9ny5VNZJI1h7rjHDkRd22x62y8WjMBzJ4muL5s?=
 =?us-ascii?Q?yAb8jZTdRq9mJmwtegzuh1RUha8NXQIZ1l5pr006CWBbRzJDBG5SQH5+Aknd?=
 =?us-ascii?Q?mbC4C5T/FcSMdBtETh1Rs7z8qTlUPTICCQ2fbIQBwwU8G7Dak4qdQGl0fr0S?=
 =?us-ascii?Q?gqqT9B9Ig1LEiMZthKpe4LePXNOSfNi5JoD6a/mCdslKYIZf8l08ixsEVSlr?=
 =?us-ascii?Q?oCfL28eULlOn+eqy1SWkMLKvc3b5Niz6XvxztUZ5DnVpfaKJV2Di0jS64eII?=
 =?us-ascii?Q?KnL4BXTz7l1m1QcdbsCzXpYXKiqLl4jDbt+NVL30FdxbKioI83g94dUCNvi3?=
 =?us-ascii?Q?DfhK+L4a0Iw8NeMFfkhorR+6u5r85ZcncluYYFjmat07WWQCL5kr3EJOv4NK?=
 =?us-ascii?Q?vHV+uU0OIeI1T6bXObrLay8v+LaVFIoH5FsHGNHYsDI+dlfgQwOQWzF5XoJb?=
 =?us-ascii?Q?JMSq2aiGA1bSmA65pyydUG7XNxLMCL28kEBb/a5ULyLXxlhXA54M/8/eIp6c?=
 =?us-ascii?Q?EwmE1fVxWnnUdt10kIArxHiC8QqPNQ4aJTTO2v+FWHNjGqw6gnQ6h+S+CcrP?=
 =?us-ascii?Q?fHwkHLLQDFUGufbwgUow7+xB/wi2z4E3rvOug7Hta1ZHBZIa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db705181-5ac0-44e7-a92c-08deff874e6a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:22:53.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TivBFf34vYkPrGdJLT8jxdQ5kPVmZ7hRTPSumwLYNpBdiaGPq7Aq4Yf/gqwGEAvw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6848
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062303_166665_1B346D20 
X-CRM114-Status: GOOD (  15.52  )
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

On Fri, Aug 21, 2026 at 01:14:39PM +0200, Andrew Jones wrote:
> On Thu, Aug 20, 2026 at 06:52:04PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 20, 2026 at 11:41:42PM +0200, Andrew Jones wrote:
> > > MSI IOVAs belong to a paging domain, but iommufd may replace a device's
> > > domain while its interrupts remain allocated. Waiting for another IRQ
> > > allocation to populate the new table would leave existing interrupts
> > > without valid MSI IOVAs.
> > 
> > ???
> > 
> > iommufd is supposed to handle all of this itself, that is what commit
> > 40f5175d0eb7 ("iommufd: Implement sw_msi support natively")
> > 
> > is doing?
> > 
> > The whole point of that commit was so drivers don't have to deal with
> > this at all.
> >
> 
> This driver relies on that support. iommufd installs all required MSI
> mappings in the incoming HWPT before attach. The additional driver work
> is to populate the PA-to-IOVA lookup table riscv needs in MSI composition
> on IRQ affinity changes.

So it is all because some of the MSI state got leaked into the iommu
driver? I do not like it :)

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
