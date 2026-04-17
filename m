Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC580F8E497
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMhgBT/xazME9QEObzNNne+qFgPjljw/vaPyVHwvqZc=; b=maWmpO7TyNx+nD
	lEStP4l+lEiFPNmy3N9IhrAtqgMbvtsA9od21DajVHXP3073QmOHfS6V7p2BzGQzgp2LFrAPXhkQk
	n5xBfVpJUNRSLp1OmsREgWpStguEHCGivo5l2tu4s2HxFuWVYwNwRWk4yc+hXhJPxxrYUL6Vsfkmw
	ByljRCTElK3UPYkC+uGcuTYPmX0pLaC/X89syE8oqGn98ya+ElF23nLy8+wBWdubloiWHctOEL482
	lm9mytpotEjtx8BC9LYOFYlRDXDIh4TY50+M8BZuW5UWiHyHC9ig0CGIX1MOaWD8DIuVNKGyeRiJc
	z4PAA+t45wyGNLW8EsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXAS-00000003Efv-1FxU;
	Fri, 17 Apr 2026 00:34:44 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXAO-00000003EfX-0Ysq
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 00:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hws2Uw/M8oz+2BtmqCL4CSFGo2k3/RLOX3dyx+bZQ/TIcbMRS1zq2tQhW4JCacUbNH94oHdRVG6Kzlfz0XkWpxNGzkqkWrYVIAaUw+s5/Obg+GqaTnwXxI9wb9TNGs9G6GYPg1gbGp8v/nZASdvelsQX5MY99eGNeufCwtcDbvObZPFqtU3wksTqcn/1aBzfDSwZsGAl2nUX3JBaPpZNXGaQsBxlcJxY6R882pf/UszSmKzP7++f1w6daOZ/lXamWNz14zqxtkCsZv/OGBT7lYEof6kilb58uRjcQ751jsS3cOhXLSNwTfNhyvnHPt07rsYzxdJZGFtSquKPOnCWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os+Gus1PgKcWqG0+14CJuLxdgnK4oYtVmpjW2HcLUMw=;
 b=hg9+hjfiiDyV2f/QEeePnRLmHEl/5ISIBS0uHndfMoOLg2jVTrBHRqq4aUzUL5q9vIBwos+MR5IWrzGoAoeQoSTKL+K9tgj8DPh0JaRxb/yhwSnkRsl892PBkYnk7qTor3ieKFd9xZFmOxIfVcB8Qhu24dexomyV+4Mlkbd7Nay8DMKn9e+c9h9mtmc/3q/Hgw5AG2mcXxKcjo/LZjqnsUfWWFnOXZoh9w5IDzvSX8daCmTupMRjBJl87OHkfCaOWkHIxhRENj7UldYxPuAC3n35D5z98w5s8ghDLVx+RQt9R4vP4vF84m2GW5VWCPxiqVjwTDeg9V68YAdCKnyAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os+Gus1PgKcWqG0+14CJuLxdgnK4oYtVmpjW2HcLUMw=;
 b=nfYlhv851TVhN3Tof16ocCA/zhvL0lk/B8ftx2xXKRlBuJrasLUtPs4kpw3U1x2hXwWVvsXAhp+FMQHNTLSBZdafx0Py3Xs6nSzAZO1OVeu9qDOpFCAWLkrDAFkkJ9+DWCg44SKDYN5AtaWNlLriENc0YIgoTUfQofvAHDqcNUBoKdiFsptiQKXx3/n33u3nGGObCOotfnp38PJBpnfS3uJFsVCpknoKL6uAoMlAyP+ZLiuQLZ3XVGNH0dxE5nm+prkT9j8apWmCJMHSowrFo1cxhesKf7h7Vn5DTYM2iPeP6RWcxpUHiGX1vB4gzCXwSA1QAglw0ljJR9dRJf1y6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 00:34:32 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 00:34:31 +0000
Date: Thu, 16 Apr 2026 20:34:28 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, yury.norov@gmail.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux@rasmusvillemoes.dk, arnd@arndb.de,
	cp0613@linux.alibaba.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arch/riscv: Add bitrev.h file to support rev8 and
 brev8
Message-ID: <aeF5Q2XauRKBDssy@yury>
References: <20260415093827.2776328-1-ruanjinjie@huawei.com>
 <20260415093827.2776328-3-ruanjinjie@huawei.com>
 <20260416231441.GA12905@ax162>
Content-Disposition: inline
In-Reply-To: <20260416231441.GA12905@ax162>
X-ClientProxiedBy: BN9PR03CA0668.namprd03.prod.outlook.com
 (2603:10b6:408:10e::13) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3c05a2-4d5a-4489-1d10-08de9c19172d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: kigddsrwFiDesteyawWvPIQmNU6ybiwQJUQTtFSZbx9A+tVag4H5ej/JbJ0qP2mUHOhsIDVxLtcpRrm3wH0JPKIjE6/tMONDzIFDhYLLcsd/4DNhgLRpYM3tE9ymG0qTanKZMC59iRBsQk+5KpKjHEVKmcORDt0k3sjic3Xy6MAtEwoWEyB9MmYmMVq3jrwwMq2a1UiB7TvyxnLuFrwJGgwfqKnO35Hmcpmnluz2KG7EdH2JB71EyYfrJclY30Pgvb78VDVNYxp7zlgiWixa9LgUzoJbzTR6jlz0/vQGFBjSAx4wsARCViPnQDOiSCIohxr3K/WkxPFNrMge1np47KXLLqfJ27sWtOKYT2piE0833FY4pSzWLMdL6fUqnVglow8cRER/Cs4TtFfzakLeP6innLm9PbKafdVq4c3l+EBT20SdOTeR9w9oJ8G+lBNu7IMWsB2AxTs/cp5pTHEMs2HBuYNotDPFJDS8eprvaoVfXHYbYoOgqqAOUtokq18pJ9Gk+DLsUxoz78gxlIrxbNVEFBOg+8NpKixIs6da8xmnoNqTVLejg/9ar1eK59nG3SzJoG+R5wxkcJ+GoMtCu1PEZKVYWKL2xg1L9PU3dftDH116XzYfdZYD/mW/fyoAicVNBSytNJFCGoK85NsZaxucO3sv95zG4npKaBx1tanbJ/It21KjHnXCEBOLCoBZngEQy3MRpGyAyd5plAHM6xumq2SS9J17alLKIrfp7QA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2Tc8ueXmfOZcJFrQKp1RJ7kcDwZ6RD9SscRlMrmCV/+XsZxKEvmdSp2QB+t?=
 =?us-ascii?Q?MerLZU0M4seqfYN5GzTHw3kAAdOiGh9fT5sGWWl3ugUb7LFYHd9iKoetrTX9?=
 =?us-ascii?Q?5Wpswc9pVKjgWtYZJcIdV/d+vkGYDoIErx66XwNt/592/fTGR51RO3Nl5gOm?=
 =?us-ascii?Q?LY0lPUdfUZqeNAUPlBscNQgoigKZ0uy7tehCuBFNn7xDr0lvy3SipfU38ggo?=
 =?us-ascii?Q?+ED4SqDyjy1/sSkk8nBT1o45qdI96cHzif9KnuKmTS1q3yElOWnUAgG4J2kH?=
 =?us-ascii?Q?WoF3O2L/RiU8yaqSaxVYuzvuxXbzz7vZDFo3ZluTjXUxQGdFu8ESGlim4mPu?=
 =?us-ascii?Q?AuB87OOPcM+qZ1RfnWdgjQ1qkJytx8Gct/eQ3/5P9GaACaDUQsvtOPPfuj1V?=
 =?us-ascii?Q?d9iCp8CwmJopA1NKt+pzmhGSDu3BPoJVOorwZrEDNczS9QdHFOeEIMLkBhSa?=
 =?us-ascii?Q?PmGK8r8PoJe1Emf9LK6aYyXu9SqKlk0wb3vruy4RkFUO525n4J0ljshoIkQf?=
 =?us-ascii?Q?kiBK/wvHL6+q1QFYpii0JB6lEOfGcjpg0nzsDuyzcI0wEXRSZACBlQm+uiUo?=
 =?us-ascii?Q?xGoedMVSzkHXf2QDZfLTmvJY0i2t7Kcww6YFV/OkShPZiHHGrJfXEfGFwi7S?=
 =?us-ascii?Q?9ahO2WA92NGWCle2w7FMYK8w1ZbTi6OS7YjoRuf2utxk57bQjrwFEzh97Voi?=
 =?us-ascii?Q?2M60mcT3zEXmFxKlZlcLOBffjVppOo3xTDGQ5OuwZDJRqnJfbej2n98laCnK?=
 =?us-ascii?Q?Yk4tVYNUQWNoAX9aeS4k2NRIjBqEbgciHq/TQAauD+6fmwzl620tLbnXvTL+?=
 =?us-ascii?Q?5gcmq2kKv7wumO2vXD+fZV4wh/ZJ8JzBnrKqDQ9LPRO0zbr1ba7KOqt3xcFK?=
 =?us-ascii?Q?YUpjKCbnacrPfHSTo4CoE6eZWkgnsLbN750FHo1irE87oDrkwt9qfOzoCIBR?=
 =?us-ascii?Q?IuN8cueoqFPac28XLbfMwTOoQJjjVhNUYfRNRkD0n7Rf2f3Fco52RqAV/YF9?=
 =?us-ascii?Q?biUF3YlZSr+hU2v43XkHaZQfuuzcR4uLW3P/v2NX+K+jo5+yrk1yLRH4XwhJ?=
 =?us-ascii?Q?rk2gUBNCG73r2PyXONtZcqQAwIUbCh5aQBW5Nk39WKkXGcHDDBxKFO8PW12+?=
 =?us-ascii?Q?D3Gy48xLW2wdVkoO4Tpo8XWJbJWvqw1OdDPHLmt5l4RjqcSyhE0PE/I2gvVH?=
 =?us-ascii?Q?u4xyz9yPtKi82HzIlqo5iOZvBz/NU3xdoNBChqczApv5QaWWd/M0fHboBYr7?=
 =?us-ascii?Q?ZNRNK+Y3Hs8vL01uj3Z54G0FJV4oSA29HYRwVy8YODdAAIxxvMe4nU93Ru5m?=
 =?us-ascii?Q?ZBastkILK7Q0ki5doRyFQhAdVQvv8Mpy2uMi3DA0JhsMep0VYRWAkM/O1mp+?=
 =?us-ascii?Q?NkkO4/mwQncV6q0Ic3J8mxz8BJN45wGByp1cXJhvhxnHJy1JhEJXYSXqJMlN?=
 =?us-ascii?Q?QhESD8WNHKG0nvrjYJzZ11tygP2jId3z40ZmB99zP4CLF/eJnD8AyGeo54YM?=
 =?us-ascii?Q?lFfaszXJXzuNDds+XCUc5kPZjmF9nwUB8QQblOxVMqOyPr/AASr4raqB4gaH?=
 =?us-ascii?Q?iwRzev9kn0Wi22G3FdiNmH83uweqHBOLvWSoSVbAKzhWtQWoB2eU/6YHaNu9?=
 =?us-ascii?Q?g+LawGzpJ26eaPTKGPi6ppOSM0rXHz0abzrxg4oLvT26gfiBHIAIPGv+movA?=
 =?us-ascii?Q?fqiHjbNTTIPzJdQnxWvgC7JNzD9iq4iic4Jzl7FX9LvhiH2Kk+Zq5jf4CHyH?=
 =?us-ascii?Q?lvrv6Ez+bf+m1Xxmaf7kbsJ9/cF2zLayFkY0ZbrAO1+ywVgqYFu4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3c05a2-4d5a-4489-1d10-08de9c19172d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:34:31.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc8NaOm2rPWxHW5F9EyLqfdLyuV1bmPABQdTWu//IwLks6ZW5nUlkDaQyM9wYl6TSQX9J9tXBF02hrE7ZnPobA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_173440_195784_A64DAD9C 
X-CRM114-Status: GOOD (  16.73  )
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

On Thu, Apr 16, 2026 at 04:14:41PM -0700, Nathan Chancellor wrote:
> On Wed, Apr 15, 2026 at 05:38:27PM +0800, Jinjie Ruan wrote:
> > The RISC-V Bit-manipulation Extension for Cryptography (Zbkb) provides

...

> > +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> > +{
> > +	unsigned long result = x;
> > +
> > +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> > +		return generic___bitrev32(x);
 
Hi Nathan,
 
> This breaks the build when CONFIG_HAVE_ARCH_BITREVERSE is set because
> generic___bitrev32() ultimately calls generic___bitrev8(), which uses
> byte_rev_table but that is only included in lib/bitrev.c when
> CONFIG_HAVE_ARCH_BITREVERSE is not set. How was this tested? This seems
> a pretty basic build problem that has showed up in a variety of
> configurations (at least all the configurations that our CI tests).
> 
>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- mrproper defconfig all
>   ERROR: modpost: "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined!
>   ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined!
>   ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!
> 
>   https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/24529356842
>   https://lore.kernel.org/177635154368.6552.7060101263009785041@8692ffc4d55e/

> Yury, are you intending to send this series to Linus in the 7.1 merge
> window?

No, I'm already done with this merge window. This is the material for
the next one, if ever.

Just as said, I added this one for testing. I am so far have no feedback
from robots. But your report is enough to drop it.

> If not, it shouldn't be in -next at this point.

What for do we need -next, if not for early testing?

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
