Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D2C5DF8E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFrVGGwZfovdppSoPVkGA7C0z1HBulczWxY+8+Mk9eY=; b=w9aG77ix5Hi3MJ
	gcmJdu9UqOwBZnNdbREpHD5Gv3OSmgxmk+KYkbp2MIzR7Iwy4QY8x6n4joivBbUJ2C9hAmF2X4bWa
	mo1kenE8vWe61QoeT0YifjoCDceEMXzzq3AScTG4zrIMgXIpgOxK1tkxm3XVKteXSam7+Z4mOENLz
	SLPHfA1JMyz0hbP6d3mq2c4f4iYvPW+RdqqcWfrZWKUngnuw4tltjLGYUhbK5bcGkDPkMAF18QXFT
	ay9ntQPT7HC63ezLb8xxn8C8vJttaZy2Pg+QGtyLOLIBgVJpat5X3uPTL3vZ1R7GMH8ueCrat4T8h
	d5pOCma2MOW5E9RpdxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAgJ-0000000CG3H-3m6G;
	Thu, 20 Aug 2026 21:52:15 +0000
Received: from mail-southcentralusazon11012062.outbound.protection.outlook.com ([40.93.195.62] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAgI-0000000CG2y-05wL
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc9jQ+geiqsLB/2SK+xhhjCvOPlGRhKStQ/DAdlZn6O1cqh/dvlbYNvRfleOvwNd9L88LkvRlDHVtJetKrd0XcPED2DSXWdpQ96Xvm7L6AP8Rndg8K8NpIE/NeFY/kR1B+G9BULgiPFMIhIMPbeDf7ZGZznCdvMGYCbUf2/wUQTiH0foEiogeXfVuRtbJsnjcM7teEU0vcx9eB8y0A2l8NACvHmQI96MPf9i3T+MRv97bdIQhxSmJdrLiFfPU7rCt7ucBGD6Y2nHhbjnsXaHhVoFBdp3vNOJTqMh51UUWgJQFpZ5VB+ygNqtegiM92yKcvXuxL8df9FKh1Pm7pXFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7PZpBTstZa6i083ybk+uEoAsr8HkU0Pr2+4F1i18yY=;
 b=ZsyiK6bGcVedm5G8Wgr8MUQeP4wVERS0mmyccYasBJ1kecC4Wk3yo5uqAaylYD5j5PD72lgFNKtSeWjj0UMNs7oGIWE11BcnoM2ofnZ53TctYeqDKzdPI4NRLiyKqnQaVoqN2ApFVHSpOhmYPf8vb29mne8jWFKHwnc7gJdbSHp6brCE7TRGWH93V/Xh++QWUVrAECgcm4/w8JBkOcqjd3O/suqDc0Y0ixPC+DhtDWgczbwqBCDuwkUf5nF1d+Ab+jZb5vTh4zyTGTThF0PWknNXBMlu6qKzB2bGqxSAFDj/OuvO5S/6wJg9l+lEKYnrSoAy7pyOMmQN0DzNOG7BhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7PZpBTstZa6i083ybk+uEoAsr8HkU0Pr2+4F1i18yY=;
 b=fk05bKRi2sRTJ5KvuJgLyYLFrghRwXn7/ZE8YCx7661dT54O4Dz+ygA0E6Z1cQ0EAPQvTFmjHKdw152NMgKSfWl2/p0t+TLZI5A/w1vEhv39/ux6nRngiVsvD0tHDbIQnqBEmRV2y7AZlajHNOfWR9qFdJSLfozD0Azj28fgMw8D3XQUL/iw1CXaIqVyXbnSMgrJS57RDqMwV5GHitrxx2gEfd7ZVuES5zy6sI5wJ31bz9u1x/o9kDYmVZA5R/sDUe83JQCa2b5GEMOpAkznjVJQMZDRcINweypepJO/gYg8/L2VKmD/sMNgFs+m8KWSpugGA78VJIFmF026c0i4rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 21:52:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 21:52:05 +0000
Date: Thu, 20 Aug 2026 18:52:04 -0300
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
Message-ID: <20260820215204.GD244917@nvidia.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
Content-Disposition: inline
In-Reply-To: <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
X-ClientProxiedBy: YT4PR01CA0380.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b39425-3db4-4c92-b1c0-08deff054634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: z8UcOkgdIH5GxFYuE4yrHWxyyA8ou8fV6LOmv4h3wM8JY1BxYvU/JaQRbO7KBztGAS/7LPm9t0/dmQ01ZyNsL+zGgCwHZQU+zTDFqucUkKDsmA/PMi08bv/qJsd3e+hf/t8lu3JsOpZRSxOqHtA1B+V9wifo/zZRu0rhYx3jUJg9mOHhzCC6K4esVwE7clZ/JGtC2jyJ6IR/VQV6i8J5FAYAJ9FKFu1iJZQTjm2BZMaff2WM0pkUDqhdIDQXUFork7jTP4Y4WWkFajdJDDwBgO9dSWW89s6PyZFEh0MFIs4VULT3q5BnRyFaERP+F7s3Q3OOPnfVJwk+ZgsmmDUKOcVvrcUzkGdXUfnfU26ZYqMSOI8oLLkQvhsoiZSbMnMXpWGK92aoa1jfrVgxqoQXefVlyDkdcX/nljr8Ud0GS0Bz6RPKZYaZoDicJ9SdckTyvnyWYTFMntA5s2RdkMVaNRELWBvv9CkQ6fLsL04m6mCzBjNKjAYY6tnPLJ04oK2p0DHUCQujIPtaH2m2m+gYoHQcqrV71u5DvnIEbPNibkfYh8qCKjFCqpM/zyRAk4b/TIOHSE55BKTatrwmypebjF/BDHN2hp2/mcwdLucWGvE3TPuFctL58F7utxdEznHlbXwZ9vQcrDzd2d8g/UT9HXQG822nVPNQMVQkzW5tXYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pB9pMvqnFkIo7j33bMydOw3kkTz3jUzOBqiKtUWPLR0MzYXDshACMerGXifg?=
 =?us-ascii?Q?fosBZ2gjue/Rrygq0883pByg9EOIa7jozTW2WeW/HP4DGPdhhVLwkSzv14wb?=
 =?us-ascii?Q?oU1SttZxjZrWEvE5aCcLveJaErTw4E0hSMsJ1qTW0timkKW0kBBwVDlQyFLW?=
 =?us-ascii?Q?D0ssVowjDnK5FUAypR2k1wjjdn2xaW3xqUW0gFiEvrbWFaZGnSuVVveLOSUP?=
 =?us-ascii?Q?pP63IUfGG/pZrTA4DJg7ZdosT5vZp6rWQus6S63kPGa0Vdl2N9q3MmUbBm8l?=
 =?us-ascii?Q?bzxGnWoJqg//j+mYW8TEwMWA1cnmBrQg8ktFtKXDgJDPv2FVPXLHSOsIjQow?=
 =?us-ascii?Q?DwJxT5k9aZdFzdY8SVXPA1hInMxwc7e2/kGJXZdygacLjm+19b+IfnIlrcK2?=
 =?us-ascii?Q?9V86GMG7eyw5FfeBRzeW/0v9qEdLQqBOpIXPR1jDLo0KnHOr7qHTCnssYsMh?=
 =?us-ascii?Q?MkxlMDsFrNAaSmlyIc7UlLI2w+o1c+fVRtUEweZSvjh0G4p2fNxm5RpZ8v8c?=
 =?us-ascii?Q?pG6pw3tuIg7Ttpe6e5IVIpOAweIG80maUOr104FbbGzT01nsG7NdfWSoR1bl?=
 =?us-ascii?Q?dGNv/ENahBHbLCZXPfnJUrynXguksXsosZ56U82BYbnTlx9EPXlzoeMXWsiV?=
 =?us-ascii?Q?FhCXnKtmUIMUfToAf8IjnTDRKduKkKn4uLtEwdU1sovXe2L7yCtktSIkBeru?=
 =?us-ascii?Q?x+FXUWTj9YWhUVKX4XCOXu5L+J2YrGlL+BMW/0SrgBpOkM2szb01sSLKKhwJ?=
 =?us-ascii?Q?dfjHrq133qVJ6K9z3kdR4kij0Q0TbU5GO0lrs8g8V6gtcWtx41sFNLNvd73s?=
 =?us-ascii?Q?OmInUWuonxqVguNahuh3g8mXdP1IJCbcZScRQl7I3+FWEEJWzU1p0F6ufZ69?=
 =?us-ascii?Q?cNlWC5WyTBjcqUr52Jb45bZE1ucfsN/MXEzlCQsTjY0IFpt4UbjxNjyRpI8Y?=
 =?us-ascii?Q?+s4dFFlhS9blm3MJicP6e+/asUAXnxNU1DcXmePP0tcPCXJWpSOtZeRdcAHa?=
 =?us-ascii?Q?UV3RyNZqyHHTXQfY6Yf5CG3Ni8PQtWccr6ouZsxXzJFJlSaCmrHrbM7gW6Pp?=
 =?us-ascii?Q?Yn0geurXfBCDHtFwibrX2sKeXBGVALcq6auWXKHnS/TTziZ7Jl/9mHVsTI3m?=
 =?us-ascii?Q?AaKO2eUWlqEuYv/NqIArxbFuaPK4NtAP8/kXVAzOG5nDg1UvQYLyDWz7YloR?=
 =?us-ascii?Q?sq1PExlHCPrhaEwJAZtuhCdVI2dU3Oqkp7nd7L+0x2uEvokhGntvRmF5hUVX?=
 =?us-ascii?Q?RUWqdsDMwHZNL8k21ObWzNNL0eFmssRfGzMgswiGwElfwW7H6y2oiN3VPTTc?=
 =?us-ascii?Q?ZJ/FBmTecItYCfSxHyukCS1HDZtaSwdikQCzV++wdkVabGACtzpY7oEQ8hHj?=
 =?us-ascii?Q?8u2zi+9XYXh01tlFrfNaMxBFyjYG9y6KLleXYS73Ids4KtTWGpdUmtZFZc8E?=
 =?us-ascii?Q?B3Tc2Yr9TMyvdW7j4HdxSiWeUTElt4ev1HnguVp7obFMEXNLxzc2DxrFfX2S?=
 =?us-ascii?Q?Dad8cgQI0InWiCCl2NT7+skGegdoA+zOrFtDQvCwxRfBTUq+FocwrwmtG3yb?=
 =?us-ascii?Q?lCAiHGjHKAa2CPOU4jhyH9VbcpN4Xznqn72r9UsFcMeZKKa+dReBlEI+2pTv?=
 =?us-ascii?Q?36cAXU2AcfaK7f/BGMEFPzmQDJEFGeeupccLLY9AL4Rok2v9+nTrUKNkAm4P?=
 =?us-ascii?Q?Nqaeind+qb5GJtUVgleXWjd42kIiiahjASQKCf6HpTr3FqHW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b39425-3db4-4c92-b1c0-08deff054634
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 21:52:05.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cStDjBO7K7uuDcaeSlAm3z5joW7BYBOsxwTXtvc0VUpgE9ZlKt3DwurZwcrlaIIN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_145214_066608_09D0BFAA 
X-CRM114-Status: UNSURE (   6.63  )
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

On Thu, Aug 20, 2026 at 11:41:42PM +0200, Andrew Jones wrote:
> MSI IOVAs belong to a paging domain, but iommufd may replace a device's
> domain while its interrupts remain allocated. Waiting for another IRQ
> allocation to populate the new table would leave existing interrupts
> without valid MSI IOVAs.

???

iommufd is supposed to handle all of this itself, that is what commit
40f5175d0eb7 ("iommufd: Implement sw_msi support natively")

is doing?

The whole point of that commit was so drivers don't have to deal with
this at all.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
