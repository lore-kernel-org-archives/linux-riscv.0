Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0301EC7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 02:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mmIMcRxpMMM35YK7x+q+WWJQCZ8oEJHaotfpGHzeYw=; b=XreKHBdVeJt9ON
	z/MkEVn9km8iH4PPYvjV1uECnSj8xUXo/HgwKCYdXR2i8NFJr7jKC9KgWpKZ9iXGVqho0dV4Koy8j
	M9qx01DfkNLKuhmYM4ZKdX3fkF2clFSzAkqebYu6kYf+z6xj2KCImIEmSMdGsg2nzLC1P7BU/FoZt
	u4oj1tCjXkJrtNrAg6zY0kXB6SiE5yD5Ing17nIqWM+dfyAkG92CKnMmeB6TQfouFF6Ght9am0W8h
	LWgURSv5i2s0V38ZdI8GmNis4+d55490XaeLvikptPJtfDbCmzzYS/NqXOkeeUv1UVNZheiFpnEcW
	OgAbBb7EFUf0hvtSMtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjUw3-00000000EXd-0igr;
	Thu, 29 Aug 2024 02:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTuJ-000000007EY-3hjH
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 Aug 2024 01:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8xr4bulAlAyx7Ink3zX8skmSSw0UIqCoOhAF6K9sGs0=; b=Sn1Pc2ZRqAmH6GqrQF830EJqGv
	+uIN0aRGxGFAElAtaR54YTk0PDo1d+0EjRHhNTnyQqpEUFekukN6cY5L1Q5UngaXMMhe1S8qY3HHY
	iUrQvak+aGC45wL76vDtgbAV8U+RdPrDm7nua5YPwSf7njuoDMkxWNYsP/I4xnU01f8TT/kXokXWa
	s3XT7j2TWZht8FeXeDn6s1Db5ZaGN/nuRrYykaN6h2R503ATa0BBgoyFnV53+RDZgiwECE+VLB8dW
	SixBn1ukDTxUUppmrNpvetnAawdNTEGMu777JG8mQ+zUtDfBkZHHyuV5+NmHUZJ+52XkTIJJ5ssMw
	pqmGnvrw==;
Received: from mail-dm6nam10olkn20816.outbound.protection.outlook.com ([2a01:111:f400:7e88::816] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTuE-0000000BJ2V-0h5a
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKVIpWicsASfZvZtK3lubumNRe+cbMeEPISo7vitiByYY10j33H4E7wSVr5raRqxZ043TAVAAbdl/hLIXzRI6d0T0EUWIjXGk3IcXUr/5zylZ+RsmFR+pBRYGQW+sRKnt8JnigK7oBbpfZDBl9TXpoUfvVefDGWl+TyvZUQ/Lq+I8G41/qQIR5F8MLg6PKyrFClP5U3rZq5fHtocjlO82nYK6QMVPndhplYBNGmvR2wPY0qGydv15Qdkb1Tqt6I+c9wrIoXsxSD4kN5hKLuUu5CmbbGFcf3AxFvSCLqZWAj6kFLoIIc5RNrwSiOdB7dBOy8KZW9QOTT9Ne9bNZ1NDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xr4bulAlAyx7Ink3zX8skmSSw0UIqCoOhAF6K9sGs0=;
 b=XIcpuhapn+KTm8fG6GwVHEtMR7QtKKWgoXrH7XKnNv2Obk32L2AHL89yHeLBbZZJZZ1HVxbt6Zmiiq9GZFs3n8rP0+B3wBfylpq3vXOoGLGZI+gy1h+r9X2w/7DJrJIaWh62xPeHKAaM4eVJwKndh1lZWVMj46YpalR3DJPsjsrsD4jq30lqrAnw7FqpodytAwpD/knWDsaXxDhJ4mdDftLQvwx+UkEUwQVAn0I0UwOVEMTDkDcukYjAvPzSJ9+9ELB895m3KQUazxZ/GRaVyXrV5hEDlPTnusR4bX1pR3/jNXqLz++ZxWgFB3dXBrzqyKKIv2OQuURP4GuBgm2MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xr4bulAlAyx7Ink3zX8skmSSw0UIqCoOhAF6K9sGs0=;
 b=iP+TJNNax+7PLLy6ZW0oDI5JBlolSe/y6xQYnhYAzVUXijrKHP+KHdl+YF/G/09RoER3KtI9ak8zFqxMxJarbJty7joE+YpTFa/NoZnwIVwoY8sHmZbKUmgQKSiBniSx9toWnataSZIfQMFNF6irIJoKNb65kRb8mWEZzBuPrwTSjTzEHTliOIOJiNBLL2SeMzXW89gW1z0FUw9TdnyMVmVLuugypPm33EuN8KkD0KabClhfS2qQI9TmIJHBMMpndO8O0iYV179Nawr8LSM4WYNQCwaMealjxJcTKmZPXWZJlugUXI9As7+VOc/wCmMBFN8Ia9JrOM0mPZ8U0lg3kA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4682.namprd20.prod.outlook.com (2603:10b6:208:3d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 01:24:45 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 01:24:45 +0000
Date: Thu, 29 Aug 2024 09:23:40 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
Message-ID: <IA1PR20MB4953EB8E0A2F3ABBA10D9D55BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495396729244074C36E51E11BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953D9A62A26337E7EBC73DCBB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <Zs9kuJ1+aLdvFHrU@vaman>
Content-Disposition: inline
In-Reply-To: <Zs9kuJ1+aLdvFHrU@vaman>
X-TMN: [T+yMfJTNJ5RJpafa5NVRU/espw6/NQW/KxNkXWcANNY=]
X-ClientProxiedBy: TYAPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <gqi5sjzeetfal6hu665otb3yrqdt7cez3ukubxmyo3xm3ltwac@y2xuhqvhvft5>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 2076731a-d36e-43de-4df1-08dcc7c95d53
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|461199028|15080799006|6090799003|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: BFNtDDmAme50EpB4IyEKY9jlj1MWjtII4SH/UirLryTgnrcpxHVcREG3sEE1D1mxnTXCXdI6E+qZ+VYHfSi6z88uDd4LbrDKieAOLpgqwlBLBm9VXqlHmaXgTZEifB7Hzwqxt4rTc9RriO7a2WP3+8ioQme4FIWSvdGP1cONav5U29gIf8plMtFrHUFR5zqIk3pLEXSjyt0ob6qjHYeobSWiLwEAaHVlxNoCKi436c9stKBWdPvtHoboiAeEp3GzPVj1zYEpW9wsduX2e7lBvO5l11QfOQzh3+8tUmMLXmMMB542zHKrptNVPS51TIJBMLfizdMr64NilL5BQViPhxV+zuynyuGRiHGJxyvk1yEJdmLTj/PUDTmaspE947wPxgKqVyeYVCeciykVpfm7xNeaNcBb0qg2z145GcmKeWRQkElJuz2GHRzeqb/gRBbDgnY8Ij5057u3w2Zk7X2ODztQDCD0tL0IgrkQDL7jIQdSgzy/cu0+UfteUGvxKUB01QfGw5McNVonCtoyiNDnOviCW2J7PzuFTLtY/a1QyavobYxGEM038uUvxwC/c1jt7kGiKYB9CJhddBsDjaZJ0edPHHm7hmsAvYP/G5fhXETDhlQwkqR1JnOqpeTEeo3IlMQud+BUcKl8MOTPJIQws/hB6GoZGOo7+kEjqdbqbPxcVMKeHxO07zE4+v0VxldofZ1aaRumvCC5ZBB4ZHQSHbXr7unLHiaGeLRLvfaU9DvYjxNExSl8LMY0sbAWbYFuX1g7cgr/U4HifnpXUMcLfg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UKFfY5WHRG8rlcKd0wEqGGuPGt+7GcPyuLTAVt6UQVspgHHGojTZEavB8e5X?=
 =?us-ascii?Q?HTalZ6Z/bT16E0PXRn72YVQ4B+X8KWPGyThEQ9eg3VKLqS15d/lFfCWQ9ZFO?=
 =?us-ascii?Q?AChP9raR//FRxImKOt6kQE5my1QFww/+Ec7wFM2LFRFjtvNoXWuy+JTdHF1N?=
 =?us-ascii?Q?SN7HhlZRl1TzsEhdxoQqYULBQc+xCTy+0laAgtmykJbYjGaoPM2RP5M5z4RK?=
 =?us-ascii?Q?VCsZBBUNWiOteZlM75TsZpT3jvgdGeUej8QnGY+YrxpWrTIKtUN5DrAZujN8?=
 =?us-ascii?Q?fyciP4Aa0EArc6SW/Pk0Jad7wKTYcTpfFdpdTn2Ys2+1WMFn+dsCymcmSy6Z?=
 =?us-ascii?Q?KZsIHWjDdgwVq7cFtlthPm0XtOoaH0dylxy/AYZA3TDSG2GzFOfFj4ya/Akj?=
 =?us-ascii?Q?JYCHc8uqE8gA8Kmb4qy5YACO1n5m3MuZQC7+B/gxAwvIKA1A3prHEDaCNYl7?=
 =?us-ascii?Q?PCZs5SiNfEnV6cMfSKCEUiA2JmS7cMzQvrJwTyIWvzgS+2Sclid3e3Fj7xjw?=
 =?us-ascii?Q?EJ5EPoAFk2Bs2qruJyCCO4zt1llg0zFhtwxc3uTIaA+UvKutMkliV0w50wav?=
 =?us-ascii?Q?tsO//WvQ11B/zpnM1jgX++S0pzQy0oqEfoY66Fbn61q7aHokYaJ72DP0b7Jf?=
 =?us-ascii?Q?bb1YKvW4bJtKUG2O/IEoo5x8MhelbBxAJL3jYG85pKPrUrVYELaa9vDA5925?=
 =?us-ascii?Q?F6BoKmDlVcQ4IqQJvuUA/1tJyxVlVCq/hBVBnI0/+fS2Ilf0YB2iQxs1EcYx?=
 =?us-ascii?Q?B9KpW8f2E8389vadAJVe+27jdBLthwZ5LcZJb2rzzQd2TuCyU3K8Izhhx5Lr?=
 =?us-ascii?Q?pRKW4ZY3d7NDTHv9SmD3hjXA5JIDHHvGA1hQZlGjeDHO8YC7Q+9vS+JHAu2E?=
 =?us-ascii?Q?EQGpsEhVtfbWCvOYExR1dCvdmfU9AMATxE3LR/S6EWxN0Hzb/c6V8gL8OBxL?=
 =?us-ascii?Q?oQm+gdcMxmNNQiq2LCqIYIrmKXGfkUNs1OyoIxJF66AwY3X45R4DR/Y6V+3G?=
 =?us-ascii?Q?QM0N8SPUkPGNJLK/MvqEWDiZTduguyJaUctKGfA2rAvV0tD1pX74eqsFncJP?=
 =?us-ascii?Q?q7Qk1ns6eLuD0ThXQrLwprSO45aqBPGcIFP6qe1JwI9OWeIEDYZVWFZTsqVK?=
 =?us-ascii?Q?rfLzOHnM6TYBnwCPh/SKS9eIlStt8jSyczlzy6PKZyXTkdV189DYHNiMF/Ye?=
 =?us-ascii?Q?jNH6vsyZifPvFIlYxrXs43uu2/D9L7RSU12eBztLUTox4CdUa0HGiBj46OcW?=
 =?us-ascii?Q?mkdYDwpoS4EnK1xWhnwX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2076731a-d36e-43de-4df1-08dcc7c95d53
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 01:24:45.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_022458_625758_E5941D48 
X-CRM114-Status: GOOD (  27.94  )
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

On Wed, Aug 28, 2024 at 11:26:08PM GMT, Vinod Koul wrote:
> On 27-08-24, 14:49, Inochi Amaoto wrote:
> > Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
> > its request lines. The multiplexer supports at most 8 request lines.
> > 
> > Add driver for Sophgo CV18XX/SG200X DMA multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >  drivers/dma/Kconfig         |   9 ++
> >  drivers/dma/Makefile        |   1 +
> >  drivers/dma/cv1800-dmamux.c | 257 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 267 insertions(+)
> >  create mode 100644 drivers/dma/cv1800-dmamux.c
> > 
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index cc0a62c34861..df010ee1de46 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -546,6 +546,15 @@ config PLX_DMA
> >  	  These are exposed via extra functions on the switch's
> >  	  upstream port. Each function exposes one DMA channel.
> >  
> > +config SOPHGO_CV1800_DMAMUX
> > +	tristate "Sophgo CV1800/SG2000 series SoC DMA multiplexer support"
> > +	depends on MFD_SYSCON
> > +	depends on ARCH_SOPHGO
> 
> this lgtm, maybe add || COMPILE_TEST for wider compile test coverage?
> 

Good. I will add it.

> > +	help
> > +	  Support for the DMA multiplexer on Sophgo CV1800/SG2000
> > +	  series SoCs.
> > +	  Say Y here if your board have this soc.
> > +
> >  config STE_DMA40
> >  	bool "ST-Ericsson DMA40 support"
> >  	depends on ARCH_U8500
> > diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> > index 374ea98faf43..60d05b305082 100644
> > --- a/drivers/dma/Makefile
> > +++ b/drivers/dma/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
> >  obj-$(CONFIG_PXA_DMA) += pxa_dma.o
> >  obj-$(CONFIG_RENESAS_DMA) += sh/
> >  obj-$(CONFIG_SF_PDMA) += sf-pdma/
> > +obj-$(CONFIG_SOPHGO_CV1800_DMAMUX) += cv1800-dmamux.o
> >  obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
> >  obj-$(CONFIG_SPRD_DMA) += sprd-dma.o
> >  obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
> > diff --git a/drivers/dma/cv1800-dmamux.c b/drivers/dma/cv1800-dmamux.c
> > new file mode 100644
> > index 000000000000..a907c72325c7
> > --- /dev/null
> > +++ b/drivers/dma/cv1800-dmamux.c
> > @@ -0,0 +1,257 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/module.h>
> > +#include <linux/of_dma.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/llist.h>
> > +#include <linux/regmap.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#include <soc/sophgo/cv1800-sysctl.h>
> > +
> > +#define DMAMUX_NCELLS			2
> > +#define MAX_DMA_MAPPING_ID		42
> > +#define MAX_DMA_CPU_ID			2
> > +#define MAX_DMA_CH_ID			7
> > +
> > +#define DMAMUX_INTMUX_REGISTER_LEN	4
> > +#define DMAMUX_NR_CH_PER_REGISTER	4
> > +#define DMAMUX_BIT_PER_CH		8
> > +#define DMAMUX_CH_MASk			GENMASK(5, 0)
> > +#define DMAMUX_INT_BIT_PER_CPU		10
> > +#define DMAMUX_CH_UPDATE_BIT		BIT(31)
> > +
> > +#define DMAMUX_CH_REGPOS(chid) \
> > +	((chid) / DMAMUX_NR_CH_PER_REGISTER)
> > +#define DMAMUX_CH_REGOFF(chid) \
> > +	((chid) % DMAMUX_NR_CH_PER_REGISTER)
> > +#define DMAMUX_CH_REG(chid) \
> > +	((DMAMUX_CH_REGPOS(chid) * sizeof(u32)) + \
> > +	 CV1800_SDMA_DMA_CHANNEL_REMAP0)
> > +#define DMAMUX_CH_SET(chid, val) \
> > +	(((val) << (DMAMUX_CH_REGOFF(chid) * DMAMUX_BIT_PER_CH)) | \
> > +	 DMAMUX_CH_UPDATE_BIT)
> > +#define DMAMUX_CH_MASK(chid) \
> > +	DMAMUX_CH_SET(chid, DMAMUX_CH_MASk)
> > +
> > +#define DMAMUX_INT_BIT(chid, cpuid) \
> > +	BIT((cpuid) * DMAMUX_INT_BIT_PER_CPU + (chid))
> > +#define DMAMUX_INTEN_BIT(cpuid) \
> > +	DMAMUX_INT_BIT(8, cpuid)
> > +#define DMAMUX_INT_CH_BIT(chid, cpuid) \
> > +	(DMAMUX_INT_BIT(chid, cpuid) | DMAMUX_INTEN_BIT(cpuid))
> > +#define DMAMUX_INT_MASK(chid) \
> > +	(DMAMUX_INT_BIT(chid, 0) | \
> > +	 DMAMUX_INT_BIT(chid, 1) | \
> > +	 DMAMUX_INT_BIT(chid, 2))
> > +#define DMAMUX_INT_CH_MASK(chid, cpuid) \
> > +	(DMAMUX_INT_MASK(chid) | DMAMUX_INTEN_BIT(cpuid))
> > +
> > +struct cv1800_dmamux_data {
> > +	struct dma_router	dmarouter;
> > +	struct regmap		*regmap;
> > +	spinlock_t		lock;
> > +	struct llist_head	free_maps;
> > +	struct llist_head	reserve_maps;
> > +	DECLARE_BITMAP(mapped_peripherals, MAX_DMA_MAPPING_ID);
> > +};
> > +
> > +struct cv1800_dmamux_map {
> > +	struct llist_node node;
> > +	unsigned int channel;
> > +	unsigned int peripheral;
> > +	unsigned int cpu;
> > +};
> > +
> > +static void cv1800_dmamux_free(struct device *dev, void *route_data)
> > +{
> > +	struct cv1800_dmamux_data *dmamux = dev_get_drvdata(dev);
> > +	struct cv1800_dmamux_map *map = route_data;
> > +
> > +	guard(spinlock_irqsave)(&dmamux->lock);
> > +
> > +	regmap_update_bits(dmamux->regmap,
> > +			   DMAMUX_CH_REG(map->channel),
> > +			   DMAMUX_CH_MASK(map->channel),
> > +			   DMAMUX_CH_UPDATE_BIT);
> > +
> > +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
> > +			   DMAMUX_INT_CH_MASK(map->channel, map->cpu),
> > +			   DMAMUX_INTEN_BIT(map->cpu));
> > +
> > +	dev_dbg(dev, "free channel %u for req %u (cpu %u)\n",
> > +		map->channel, map->peripheral, map->cpu);
> > +}
> > +
> > +static void *cv1800_dmamux_route_allocate(struct of_phandle_args *dma_spec,
> > +					  struct of_dma *ofdma)
> > +{
> > +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> > +	struct cv1800_dmamux_data *dmamux = platform_get_drvdata(pdev);
> > +	struct cv1800_dmamux_map *map;
> > +	struct llist_node *node;
> > +	unsigned long flags;
> > +	unsigned int chid, devid, cpuid;
> > +	int ret;
> > +
> > +	if (dma_spec->args_count != DMAMUX_NCELLS) {
> > +		dev_err(&pdev->dev, "invalid number of dma mux args\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	devid = dma_spec->args[0];
> > +	cpuid = dma_spec->args[1];
> > +	dma_spec->args_count = 1;
> > +
> > +	if (devid > MAX_DMA_MAPPING_ID) {
> > +		dev_err(&pdev->dev, "invalid device id: %u\n", devid);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	if (cpuid > MAX_DMA_CPU_ID) {
> > +		dev_err(&pdev->dev, "invalid cpu id: %u\n", cpuid);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> > +	if (!dma_spec->np) {
> > +		dev_err(&pdev->dev, "can't get dma master\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	spin_lock_irqsave(&dmamux->lock, flags);
> > +
> > +	if (test_bit(devid, dmamux->mapped_peripherals)) {
> > +		llist_for_each_entry(map, dmamux->reserve_maps.first, node) {
> > +			if (map->peripheral == devid && map->cpu == cpuid)
> > +				goto found;
> > +		}
> > +
> > +		ret = -EINVAL;
> > +		goto failed;
> > +	} else {
> > +		node = llist_del_first(&dmamux->free_maps);
> > +		if (!node) {
> > +			ret = -ENODEV;
> > +			goto failed;
> > +		}
> > +
> > +		map = llist_entry(node, struct cv1800_dmamux_map, node);
> > +		llist_add(&map->node, &dmamux->reserve_maps);
> > +		set_bit(devid, dmamux->mapped_peripherals);
> > +	}
> > +
> > +found:
> > +	chid = map->channel;
> > +	map->peripheral = devid;
> > +	map->cpu = cpuid;
> > +
> > +	regmap_set_bits(dmamux->regmap,
> > +			DMAMUX_CH_REG(chid),
> > +			DMAMUX_CH_SET(chid, devid));
> > +
> > +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
> > +			   DMAMUX_INT_CH_MASK(chid, cpuid),
> > +			   DMAMUX_INT_CH_BIT(chid, cpuid));
> > +
> > +	spin_unlock_irqrestore(&dmamux->lock, flags);
> > +
> > +	dma_spec->args[0] = chid;
> > +
> > +	dev_dbg(&pdev->dev, "register channel %u for req %u (cpu %u)\n",
> > +		chid, devid, cpuid);
> > +
> > +	return map;
> > +
> > +failed:
> > +	spin_unlock_irqrestore(&dmamux->lock, flags);
> > +	of_node_put(dma_spec->np);
> > +	dev_err(&pdev->dev, "errno %d\n", ret);
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +static int cv1800_dmamux_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *mux_node = dev->of_node;
> > +	struct cv1800_dmamux_data *data;
> > +	struct cv1800_dmamux_map *tmp;
> > +	struct device *parent = dev->parent;
> > +	struct regmap *regmap = NULL;
> > +	unsigned int i;
> > +
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	regmap = device_node_to_regmap(parent->of_node);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&data->lock);
> > +	init_llist_head(&data->free_maps);
> > +	init_llist_head(&data->reserve_maps);
> > +
> > +	for (i = 0; i <= MAX_DMA_CH_ID; i++) {
> > +		tmp = devm_kmalloc(dev, sizeof(*tmp), GFP_KERNEL);
> > +		if (!tmp) {
> > +			/* It is OK for not allocating all channel */
> > +			dev_warn(dev, "can not allocate channel %u\n", i);
> > +			continue;
> > +		}
> > +
> > +		init_llist_node(&tmp->node);
> > +		tmp->channel = i;
> > +		llist_add(&tmp->node, &data->free_maps);
> > +	}
> > +
> > +	/* if no channel is allocated, the probe must fail */
> > +	if (llist_empty(&data->free_maps))
> > +		return -ENOMEM;
> > +
> > +	data->regmap = regmap;
> > +	data->dmarouter.dev = dev;
> > +	data->dmarouter.route_free = cv1800_dmamux_free;
> > +
> > +	platform_set_drvdata(pdev, data);
> > +
> > +	return of_dma_router_register(mux_node,
> > +				      cv1800_dmamux_route_allocate,
> > +				      &data->dmarouter);
> > +}
> > +
> > +static void cv1800_dmamux_remove(struct platform_device *pdev)
> > +{
> > +	of_dma_controller_free(pdev->dev.of_node);
> > +}
> > +
> > +static const struct of_device_id cv1800_dmamux_ids[] = {
> > +	{ .compatible = "sophgo,cv1800b-dmamux", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cv1800_dmamux_ids);
> > +
> > +static struct platform_driver cv1800_dmamux_driver = {
> > +	.driver = {
> > +		.name = "cv1800-dmamux",
> > +		.of_match_table = cv1800_dmamux_ids,
> > +	},
> > +	.probe = cv1800_dmamux_probe,
> > +	.remove_new = cv1800_dmamux_remove,
> > +};
> > +module_platform_driver(cv1800_dmamux_driver);
> > +
> > +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> > +MODULE_DESCRIPTION("Sophgo CV1800/SG2000 Series SoC DMAMUX driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.46.0
> 
> -- 
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
