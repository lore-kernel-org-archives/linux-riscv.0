Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FEACCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sfzDKPFYbRaPlidBp7c7qmYR4LSDjsLDhjlksF2dFM=; b=ZM4+HLsxDOrUCv
	Qicx+lTnl1eevU+NMMbK5l7fJPw4qAHj88rAGuJnjow0coBtTdUfpz7TTPQURaABAO0ioo/509M7Z
	xrComvoyzrg0PGhSQjaIDCrvhSj04o3yDjQ1BxJsG9JrcdhL0SW3bWYeQXQBra/4wLcvPLWxllJm+
	5NA0zDJuCEyqCVkf7b9KhSn7FDkeuvEpdHiIFDQ2Y7YN9gHMoHI/zXrn1d6DY0doecVbCYmo8x5GD
	jtSVkoMCvQdepP60YEKc22H1asY23c+MNj7edYUEvRw3zCEJORrSg0CLu+FO2Y/+/Fq93z7I7n4gd
	dfeU64ALLgvQwDtXJnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99aO-00000002zLM-07lv;
	Wed, 15 Oct 2025 22:03:08 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99aJ-00000002zIG-3MCM;
	Wed, 15 Oct 2025 22:03:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGsr+VdtLSjMMNDEgCEkujsMAfyuGbFWZ0oT5z7QJ0pq8KpR5gs23fmcWbq5awqQQjUp7oLfQ3WcxejVbFf0M3UXx1ChRA6kU5SXUmKU9hQ6U2twNNJN63y4luN8zQ26wB02bPBtBvZDln5NPdk0VNjCKH1BkLMovNfOJBNR/ExCOUimSnM5chKEVzRjlECrEoyAuMz1IbbrG/E9fjmBtBAnxgYDkzkKjS/mx10Qi/aErAlxEf+dciKh/alaRGGIkMPJUKotFW4K9CUTtBoIbJ3J/qe0/1r+yr9LfgKLSB0/ynah20sQrXT0f1FeJA4WIllu2RqjEddpae5rTnajBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SGRrPS3HdagIo/c2OYsBv+ocTyBUS7cJdVp/ApU4Ww=;
 b=itv+XtdYBgxoeQBwLYfTsLMX6A5Kmr7PE6m06cSF/XPwPEDSVUQ1eALkgRMH2eIyddZoMIVyXdU5elWqqKvQO7TWeshd/3zmj9KuI2h64O7VjV67PJXK+4HNryP1/NBbElP6aoF/thCEy1/WDzqdJR5hA6GQMVae5QzZhv5W2ySr3sRJqwk0vY2eXyNYfk8Q1Ywr2f/ZQaajQpKr0nH5kDFbjr/RtMGFXKObshU3zSXQ9Q3+2lUNjwV+J19j/cYGB4S+hLjNjrNzoutPgSYIm/05Yx+nT8vF5oEmt8VudWIhFYMvW7MC3D23tjBjcHcfG1Tu/BGl3pxc8ikvFj5FCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SGRrPS3HdagIo/c2OYsBv+ocTyBUS7cJdVp/ApU4Ww=;
 b=maGviLPjtdymgUrpwbT7HAu6eSV7myau0SyhSc3EO6EC9+wczrlf4ZB73LqloDZRUHyDMqPz2MwOIZ14il6LeCBjuO4Qf+Xbyyyv8IrHRgZxPRxdwI7PvdsVL9dnMfnpZf3nfJ99oahutHnfkcONyyJkpsPApzYcG4L0rUuMFqNLkgaiBFK5JYpIijn2KTbKPQCDCC6YsMcDw5AfYhtpbfjDXzwv5pgqepo/IHTImgTZ3mO3Sa5NR1TuLT6k33XNpY62zfuD+PGdZvaVSRwskFI3EFnZMuJuM1vqDif+wx5aikjtNRKXlve0JYVGGt2ahCLXBHScM49IExoLmiE5zQ==
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 22:02:47 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::dc) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.4 via Frontend Transport; Wed,
 15 Oct 2025 22:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 22:02:47 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 15 Oct
 2025 15:02:38 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 15 Oct 2025 15:02:37 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 15:02:35 -0700
Date: Wed, 15 Oct 2025 15:02:34 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 15/20] iommu/fsl_pamu_domain: Implement
 fsl_pamu_domain_test_device
Message-ID: <aPAZ+hknPmn7GSns@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <a54211182e22db598b2a26f589e8f5f34ad78f98.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a54211182e22db598b2a26f589e8f5f34ad78f98.1760312725.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b86166e-0e94-4460-4e10-08de0c369370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DEm0E062OZeDr7Kx+MIKv7FX+QtY7de0TPFI30lACvZPV0ZDNM8T3+VAr4OH?=
 =?us-ascii?Q?zCuVB2yM89Q3zz6ga1y1GIwptgqdw9ALXvLpiFZUY3aFcZOnd+khIjfYM4uN?=
 =?us-ascii?Q?2p1qmNH33WE/R7dvVhl7ZPEdITCOzPnRk47hJlXeNZlWa6rpwMyBK+nap7v7?=
 =?us-ascii?Q?HFIqV1RI0o3AIB6OuQi4pQCAcODUGfnrthUXtyBBCeN1AGQwo6JVCNamOygM?=
 =?us-ascii?Q?e9hrWHLuqSWJoRaMMPvYr7OIN+2mTbhX6o/Pj7rhU4sNthpD5Q8eU14dztLk?=
 =?us-ascii?Q?vtzosnkyrUVkvVcMYI3650biT5SeS+sFr08sNpoGCggjt63HzHLU+6h7PSsc?=
 =?us-ascii?Q?gGMF0GqJd4rSL+jXJAZE0aOvj/dVnWQnaNeyWz5kKhJ1eMOfJu7aMMX71rhN?=
 =?us-ascii?Q?mIq8RANuPtLajMyaSPMOyUU/5ckZNQHIptC3PUkAQZY5VR2b8TrMyu7G3jMq?=
 =?us-ascii?Q?hUccut6BEUxsLDlz0mHNrM4EVgxtvUbQe+sVkrjmoawriKs5IXBiIqEOotj5?=
 =?us-ascii?Q?HkC6BfBMTNZRxBkBUjO1HWxyP6p0kcfh2vpKcGmKFz1ylbUlzTIUPZymY7rR?=
 =?us-ascii?Q?hbK7/FTEuWq7egEQWHK8nNMnwgiboeCSwtmB8whWLYTyYT9/ucDbuDMSqQ3H?=
 =?us-ascii?Q?rWXGsjLeBEG5OktuGX2fJydIG8c4IaNDjIbBVHJ7VTQDLwAnG7DiiYp/+GkR?=
 =?us-ascii?Q?P3lUEo6vMO1hQ2E8TEF1IpHiCWac90FXWRG7Uk5TMkoY2OJtXhe/NUhRXqoM?=
 =?us-ascii?Q?NWGhwHMh1SP1SHeZ+L19PJ3ZSwZN8MUx0UUYsnAOepV3msUFl69SpqEYOffn?=
 =?us-ascii?Q?aJu1XFa1dbnt2hIXQZxUc70sI9eOtaMj9052s9lmI469wKM1HZBKArdyPgeP?=
 =?us-ascii?Q?9nPOTEUkgXEY70vbY9bfF9YBR3Rj6HvPBvN+0wXJA7yFWYcDvRR4tQc/g/xb?=
 =?us-ascii?Q?fjCMlEtlijhVqIO7OVS42LrkyjqdGyT4g10l9E7v+q4ryBA+5Qe1QBCV2Mxn?=
 =?us-ascii?Q?qOr0mUUtyu4p8dKM3Xwjmyl2Je8g+onb0BmboltkCPzOpP/bZyREH6vvrIZd?=
 =?us-ascii?Q?Giy7ANM323Cva97iZew9lrlBp23WLEYBj2SPPl/J8tCtGsvffRKjAANOadXN?=
 =?us-ascii?Q?5WgJ0ttHdO1FyMOyDyHq5Fnll/xld5dHUwlkngK8pPgx8j4nG0Wq8v5qX+1L?=
 =?us-ascii?Q?EkIGJmPGL5cHWwUQtBY0CGYcJ40Zg4lHTYVCBIuUSYtnj659zV2q00o6XxEO?=
 =?us-ascii?Q?YoaEocPesTdf5GNbxPkK3mXMvvlSe2BAJYLl/CCtYNCgq1c180eX+WIr9hK5?=
 =?us-ascii?Q?DUOisyNnpZnqVZG0NTzw2iHp2VLFmUbvOsOCsDIH/08knEP8Xs//Q6SIO++x?=
 =?us-ascii?Q?tB/1RiDJZfEm+NnOlq4fJculdL/iuRPfYkIbTg+YBcTEAApQfS/n1d3v4z/o?=
 =?us-ascii?Q?iLTjAdxzrPISKaWBL4RMu0oZjjOJipqD0+4E7poQtB3R7uLAex3QZQO9WbKD?=
 =?us-ascii?Q?BEVlTXGsi42QwDjHQvCzhFE9sTzF6B96LFNjcQnaOjKqnHvOTu1Lds5P2hf8?=
 =?us-ascii?Q?MEdh4WjGsZ1DubHsImA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:02:47.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b86166e-0e94-4460-4e10-08de0c369370
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_150303_839255_ECD4B846 
X-CRM114-Status: UNSURE (   8.59  )
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

On Sun, Oct 12, 2025 at 05:05:12PM -0700, Nicolin Chen wrote:
> +static int fsl_pamu_domain_test_device(struct iommu_domain *domain,
> +				       struct device *dev, ioasid_t pasid,
> +				       struct iommu_domain *old)
> +{
...
> +	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
> +	if (!liodn) {
> +		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
> +		return -ENODEV;
> +	}
> +
> +	guard(spin_lock_irqsave)(&dma_domain->domain_lock);

Sorry. This should be:
	guard(spinlock_irqsave)(&dma_domain->domain_lock);

I have fixed this locally, and did the full build tests on all
impacted arches.

I will send a v2 next week while collecting review comments here.

Thanks
Nicolin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
