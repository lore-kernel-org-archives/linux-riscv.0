Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE178C79F80
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGhZjnVpYCKPXE6HZEZElSMXQaTOJYNuoGkhL0CkMyE=; b=UxtboP12/bdhQD
	hRqRfp8LyNIIWUogWNW1TlAQUIryQ7tMVNWfMgKFOlltQCKSoK50nliGYjEVwFv+kx615O8RQGMre
	fKCMyFW1LICMb1WHrQ6/wr6yQaIeGDgBbUQBRvCBxLQwJIj2lvygF94OnoqUr19wa+t+Nj8jLRchS
	fvN2+Vz8YPU7ca2btGPo9J1g5jDgvIuG6xDLTK9MyoQWHhpEPN5fvDXUEPm9ntZOHY5R8SOH3ebbW
	xu1j2bBlmzjGuQzRzljtWTfUQr6spyGIyCsxyqHDM8C5L7m3IV1PLS01/TwsDk6+AgST3YRcmgMzd
	iNl8zvxc6z8n2ur1bK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WM3-00000002epb-2dNJ;
	Fri, 04 Sep 2026 16:01:28 +0000
Received: from mail-northeuropeazon11012064.outbound.protection.outlook.com ([52.101.66.64] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WLy-00000002em5-2hbt
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 16:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlpd7RpJZMBr6aJgSKFqFn6M7RhEjDd9W50ojP3u0zFNn/DwpZ0fNkdTWGrwO4uNPXpHnElkPxBrY4l8fUkizqwxPGujhbCmqVd4RdHLuSzzPcnnk5ME3V3wTefAoOISziH+NukM6fAj44TJVFznsu5F8d8M7rnRRjMgisr7LwYwOkC2Jt1KU2J3uD2Ca2+fnsMegQACzyXDKGPBHhJE10Ml2Df6Z6E/PLGHzZE17X7wnINiJQBIhcl+oww4w5kMOgpW08f29TIfhKoxW6WeUdEHy8ihjqCklZJm9V5jmEybRp6EMB7430Y8BUm9Cl6s2vZgDGpu2x557VNeZz3iRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5hJynYPpHQDNmMm4OXy2iLZNSIeAfURS7sAyMu0ISE=;
 b=tYfOpnH8Eu7h9+4LUOUKuZr+eBYTur4d4EAlCvckNMRxINBSLtcGL9KWMOIlozY/V96E0Gh1JVBk5cRUeyNjr1gv73JI41bkbslecbPQMhUjGBLIoFHfhAQOEK6oABmKdkSy3j/LEjk7UQj4K09CGlioyMOTgdZBGNKo2rNsswMqnOpG7ojmM0PGvPE3IiVd5xNBHomxy8ewvZxKN2nOhXMtl3eVNuvGDpLvA5YMKDcNWYvbOgInTNo/pPlyqxeKQH0pruMbY6Z7GqPn1TtSfrGLwqb2FHnVvYWEgBKuEd4SwMGKhglYLINewxZZ55lMHCOZhUMef/AfzngG3EMfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5hJynYPpHQDNmMm4OXy2iLZNSIeAfURS7sAyMu0ISE=;
 b=Z+TGWUznu8Prp0pq0aKyoOFOhw8mRSXFYdQ+GdM/ORIvMfW/RHpvPCegnwpZfL4idCDgWpy3INzrE1IuiqiiIhUN1zAYthGI2dwQPYXDQjbfwlUyG4MSddXiRqD2d6S/DOD6zfl+lY1FqAbslEG3pB01eA3SvnzQZvqU+ue+peZrCntvB9jzIqtXnZS1LY/G5nzddw3eckmlR/st9wQfkU/FhM2GuvdFQFdZlFjKk2sdMaUAMPm5JcS7BI/vEzOpDutFPs1N5BBEG6EzCuTJ/dA/lwR2cbRgUi+jTV7LieA5NxbFnnAMqHJJddxE01o6T/DnR9RblAmnrMwKKX/qRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11714.eurprd04.prod.outlook.com (2603:10a6:102:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:01:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 16:01:19 +0000
Date: Fri, 4 Sep 2026 12:01:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/26] dmaengine: sf-pdma-sf-pdma: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <aprrRyCXBUpHf7Tn@lizhi-Precision-Tower-5810>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-12-panchuang@vivo.com>
Content-Disposition: inline
In-Reply-To: <20260709135846.97972-12-panchuang@vivo.com>
X-ClientProxiedBy: CY5PR15CA0063.namprd15.prod.outlook.com
 (2603:10b6:930:18::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecd23e1-6bd8-4100-6332-08df0a9dc1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: xS5HgTuBeHl8hf19uT5ztx5CVlxDqZ30+vw9ACERWkj/2PCGJ1zciMRqAMh7Dn9NaAMr3u30vvTI237qbrUO4kW3fa3UcR0oxeRHXhIQzqXi+h8GbBvXlhTByeDmWJyEpt+YPX6oFW6A85jnUIhkaacJa6k+0lFozD8mmMjG6rl7XIjoOKuLHo1wSZg3IkgCsTxOekVNB8wkEji7cvkwybaVXI/UUkUHq4ArtGviQOBMUSwbBOA8J19X1xWA2LHUUHdvEyKqF0x5EEipKr/gMKJZYZZnYo6fyXJqokQ7q0MBLN4Tvk8rt0gEEgRd2iOECU9GXUDBgaO2SARJgpTz7vB9CuZGZqjliNR+JtjuLuTtNM4p3gMTx+NgXTZ2QbfodalyhNEmuyl0UoJvByaePk/tSAQ4wLl1qfrHJyPLdoh9tuKLrZLUgUzzbYlzeXm1HLXD8sIQvYDjXFZ8ZJ6E4qJTvkcBRkdTC2TCQT6bw+D4HfNr1WP3N0uu6E8Urow0cQz/W8c6kZkSUs+HG3qgDpXBXRLX2YCdOnA7WO301/kIwNmkN0bo8H1hAGnqOdWWcwgLb+u37Zs8rEd1uuY54KJlIXThzSSWcXf++7X0m7wYbvMJYrEvPA5qjTXsoIhZNaqOitXly/fLZVnPuK71VqccNb08pOJL1oYHHr4f/mI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6I2EA3xcxFQxgMrkPzk5ylnhpg+EW1Z92AdNGwXTATKV5afJlbrrMJSIGniM?=
 =?us-ascii?Q?neKcFwmbUMzne3HnCS48+n04ynSn1v+b4MBFjpEwGpLQXM2jQgByHTWA3Jok?=
 =?us-ascii?Q?NmFk1jgvVQ4yc2iqvf4ANgfRdlmZmgFSG5sTw53yMDUCyem7H3d0IXaVgicT?=
 =?us-ascii?Q?VEynPpM049j8CuC7cn8o/m57U0Oha1nbfEes+73R4LStH1+fzgAiO0pYSSRH?=
 =?us-ascii?Q?hGWY8wqo/pcQWsLfT2eFRt2Kjk1YbL0X1yPU7cuUpG8xqZdVfJCLTa94+5dj?=
 =?us-ascii?Q?pUxbNEKKJY5jYdGwMLRlLGOfFjZeX3kQxlFJGWdMHsDJZ3WuOPeHwoqolmG0?=
 =?us-ascii?Q?whytmL5vWpatRqi1tEvS1ZOpWAUD6s9r0So6AX1XJPOp358jzclq0RDNTfGk?=
 =?us-ascii?Q?99a7VH+fQe3duijQQj/hCci4+e5AJEInhxqxS0Ly5yZ9e0l+abOQjDZVVREO?=
 =?us-ascii?Q?p4ol5bEuhWKmfcyRVtW+Kya3SDEB5G0fOOxrZDig0+O8hg/ekpEwbwTIsxZA?=
 =?us-ascii?Q?nEOhV3LOhIYPrUFB/jWBB64oHlFgPPGP0lgZwxJ6obMswLOsIH13bqIGkLZf?=
 =?us-ascii?Q?sX+HDjmmjBaL1JH9EMsTXN1a3CeC0hXXsGoSs/aGXw7bhZ0a3pSqZOrIv4Q9?=
 =?us-ascii?Q?nmmucjGy4abjsthrmkWcEeKAMZNNXqRS4X4QdzReNRHkSNompLQfu0ssAcTB?=
 =?us-ascii?Q?iJ/TbHBvVdRh8DGFXv4F3c5pAgjJPBJ4RsJsITgzSuFSOOmvZBNeA5+In0gF?=
 =?us-ascii?Q?0ySFDHZOIbEEAeU0Ert2ywHBHM6BasZJ01qYJG3ZeGL+R7cItQVSrYGvvVO4?=
 =?us-ascii?Q?zZckpEupFJd+IC0US0ApNNc/k9btTHaYVvBOhtaRRevxnHIDLbE19nJflOeI?=
 =?us-ascii?Q?3lc8kGGI3SyvGnieWSvvX+Ga1m5gS6hCCw0DvStcuyS9X4pCa5QZqxuZ95ek?=
 =?us-ascii?Q?Gjt+sIEBEI1fxC4cfYtRWWF1xUe9IqN1JXNR3NJgHqdU4h8BZban/4AyrGNH?=
 =?us-ascii?Q?o+CwnWCdi/er+w5ddLYrmIEcd3xqiGrsX7UGK4CVWHqcmChah2vLUYCGvlqL?=
 =?us-ascii?Q?RsmkUGFhnEOvWeBL59Kz3b9PghcbmW7o7P/1S7JbyXA+Fsh+x52Flxg4NiCD?=
 =?us-ascii?Q?yoURVKA2+e3+yUqeH4jxu0YnydkkFC/SStuswwz3uZs8EbIcJUkC8NRdI3Q+?=
 =?us-ascii?Q?tK0RhapsPBRIZQt9buMSDPRayFj8Nx9dON/eE83LaODglqNxypVuP1+2B1Us?=
 =?us-ascii?Q?EbH/jfLtTyM6nUGzyUfeTttRNlhSfzwu4jSjXr8svV1NzvjsV3CAHD66mWz/?=
 =?us-ascii?Q?V4zIIycZ4efZjkBiFcXclolB+HkXl5K1dN3AOdwbjC1N/dViWrrCvz2BfeU/?=
 =?us-ascii?Q?mdwkaqNpOaugOzDbO70DnCn91OzsJpKAVJDDlQhvSAY6UOfEJJqfVJ+7o/O3?=
 =?us-ascii?Q?KtfURgd1MMpmbmlV6XLBH/cGeqVQTyuY9PIa+CJF+sAnW3ECZfHyPr7vw2cu?=
 =?us-ascii?Q?2DyYdhea6d9Xd3UW+V/LCKpd66VVzgD5/lwWfsuXauKjTYWg8PuJ0nQND9Cp?=
 =?us-ascii?Q?WKWnZRJxQDW0lvy0nfQXgccNrhnGVIeM4mMOZsClquAYNj7Chz+OSDN3KAIz?=
 =?us-ascii?Q?UUA7Py/8CyCsP1kvSJaqrLZuroGjVBF4smhPMS3Y2yVaA/L7S0ouLkcFFsdM?=
 =?us-ascii?Q?DLPLo7CXc9eG8A/jzHIFlrE/7n0/7GLAActLsKQp5Cd9Fn9KCyZMoq6fftjV?=
 =?us-ascii?Q?mULZxE5WvlLfoVZ+Fk7UE9kMQnYNj8nTYi55SLwApYTZC+gEUcbH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecd23e1-6bd8-4100-6332-08df0a9dc1d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:01:18.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOXtqIWFvj7fkYQ4K+sIAIA/JV3Rcgsg1i9LFuYzlLgWqWGisLWPyZycOh9YgZ3Bvjh7gRv29CbYT+8RgF5uFHnvUv4U7ZmlYOZgapxBoMGk+Mp/Lh0KDGY5AQInYcNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_090122_693765_3E4D6384 
X-CRM114-Status: GOOD (  15.12  )
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

On Thu, Jul 09, 2026 at 09:58:15PM +0800, Pan Chuang wrote:
> The devm_request_irq() now automatically logs detailed error messages on
> failure. This eliminates the need for driver-specific dev_err() and
> dev_err_probe() calls that previously printed generic messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 6f79cc28703e..5e5694750c57 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -411,10 +411,8 @@ static int sf_pdma_irq_init(struct platform_device *pdev, struct sf_pdma *pdma)
>
>  		r = devm_request_irq(&pdev->dev, irq, sf_pdma_done_isr, 0,
>  				     dev_name(&pdev->dev), (void *)chan);
> -		if (r) {
> -			dev_err(&pdev->dev, "Fail to attach done ISR: %d\n", r);
> +		if (r)
>  			return -EINVAL;

should return r, like other patch

Frank
> -		}
>
>  		chan->txirq = irq;
>
> @@ -424,10 +422,8 @@ static int sf_pdma_irq_init(struct platform_device *pdev, struct sf_pdma *pdma)
>
>  		r = devm_request_irq(&pdev->dev, irq, sf_pdma_err_isr, 0,
>  				     dev_name(&pdev->dev), (void *)chan);
> -		if (r) {
> -			dev_err(&pdev->dev, "Fail to attach err ISR: %d\n", r);
> +		if (r)
>  			return -EINVAL;
> -		}
>
>  		chan->errirq = irq;
>  	}
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
