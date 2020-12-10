Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E65C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:25:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD9A2313E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD9A2313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C1lJxi4qH4f3gZnTbpSMijwBmrwn3XigU9uTZQ7Lkzk=; b=3NS8gud7xxHWaCh3tzNVH4Rp/
	ET7xbBelrkmn2vek6xgaDZeR2Nch6rmnCHuS6WCwHGSQqTO2mymzc5Y5VXDJ80pRLHDIvvkWCzO3j
	n/iG5iohhnAZZ1K6dGKlAX47mPY4GBOvePpAlDl1nJfzVN4XagwiDOcDcwoFurMPDDZkLt8hPhsOy
	Vtgb+571VPCh9TcPcDp4+QODqONlGpVaNhvVb/TYbfJM9Yzb0cCDUVfKcAsvAuNBhrf37I+IwkvNO
	rZE73AShkaQ8GeZSLXmQcSpxgbLQKCQSMEPqSzLM+BgN2QPHzhNp7OHT0St8J8ZAFESERUNALHaTK
	wXVc/CN7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCZy-0002kV-Vr; Thu, 10 Dec 2020 03:25:19 +0000
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com
 ([40.107.243.56] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCZv-0002jI-EU
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPOt7//AvgOq5+Ie0uBOH1O+PVWe9/y6wRkMobgSr8a9w+LRmGXXnEmIKrJmyqZ3SEZvQU1Q03i8JHLBRnFrWdJeauq/yhk4pUf430C6zvk6h0YMjadH2sf5Sh5wypp9O72jRzPhpDm006N4EZAFy66h+hICMyw92CdQyxIMIEI6yyHM5yxtpJRWrf9Ef3zJ5sRWW6aTSm6UpjgaUJtKL4mP4yo5o4gUNc2WqAqoyPdgZSBRwsPpMhYqs2/9veL0xWTxnMLegEnBRTcyf6fjGuj8sfxxdLaN8OPJl+7ET5no1n6sAYCCxXa0K1DZg0nueDGOSLBriDqH1lxT2Xpsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5maE5gAhIJn2hmH2+Kbz5AxXy0HYgj8z6owqULWYMPw=;
 b=ZM1L1uyE1OM5CpQcWZENtIzxdyFwkrppMnSYSqStOpsGqUe34LpJJZLeWe2KhmBXgfEC1jy0id0WNGbFAFhJDhrZ3jflWEpZ/E1FUzoA/eorQWatbzYhUGUVrHS9ngmMbuOqkwEQZGUGog55e0os/MbkV+0XrOpWi2RkbF1tQtxm21TrDtbttCmdGf/S1h7rCCQGFoXwL8ALY1vHYoQwP1EUA1R8HSyZxah0rdyMuiPGXN0N4DMrpjtn3QiyMd9W1cHBA7xH+/jqui5OpMBGhRzvWvqhCaH30yk6Hx/DyzMhXMvt+ft7TQNeG9ll0SqWPXSvyi1SZaOVXuEV3ZYGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5maE5gAhIJn2hmH2+Kbz5AxXy0HYgj8z6owqULWYMPw=;
 b=kydOlzAJSFdUP1ma0aoXzat3NmNfRpa2B+Uhg6Lu8Qb1RPAKaNwXE4RvrSleWH+cn4IcQaGfTzFU/HCNmV9TnDtGdWIFnyPRWqPWv1XIio4o8PY24EYnfJq9vP0QGd7y5hvtNphwKUqS4d5t9vyaLUQQbSmZP0MpUWnFk7b0p6w=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2440.namprd13.prod.outlook.com (2603:10b6:a02:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Thu, 10 Dec
 2020 03:25:12 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.014; Thu, 10 Dec 2020
 03:25:12 +0000
From: Yash Shah <yash.shah@openfive.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "Paul Walmsley ( Sifive)"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "james.morse@arm.com"
 <james.morse@arm.com>, "rric@kernel.org" <rric@kernel.org>
Subject: RE: [PATCH 2/3] soc: sifive: beu: Add support for SiFive Bus Error
 Unit
Thread-Topic: [PATCH 2/3] soc: sifive: beu: Add support for SiFive Bus Error
 Unit
Thread-Index: AQHWuOuNd8XmX1lGkUy24amlH//I7Knv1gcA
Date: Thu, 10 Dec 2020 03:25:12 +0000
Message-ID: <BY5PR13MB4453A9D53964A6A03E8080E682CB0@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
 <1605182457-86046-2-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1605182457-86046-2-git-send-email-yash.shah@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [103.109.13.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cbf53d1-fd7d-462d-2a94-08d89cbb3463
x-ms-traffictypediagnostic: BYAPR13MB2440:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR13MB24409077F81CF6DAD327572882CB0@BYAPR13MB2440.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zY8X75OMiIhUMkdfo8QkKV21XoLDqVrRwyryi5oL/mUiHXBErrFkvLM0ki/3r9gOWhXrjbTBYTSgIG8bEWewQV8MUr0LXvGKETa4a+qPuvh3lFOOTMW/g0U62fJeg91jFzRyno4gWgiIpTnqfzQIe3akBU5eSdT+DnFQhaE3zJcQ1YK6GtJdslEnP7SEam38a8eqMyqxB1jJ/jXmFfCvSOyKvzUpcAoIgFGAwVOoHGiQeDMAVZpCM6zK0upu9VOPBxs73JqkF1ShVBwj2UKaQAzH0jLuxvErq5vByyaZP7lIQKTcdgSEc3If+LmOjriVgopjW/Mx0lo8UD023ot1lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(346002)(136003)(366004)(508600001)(2906002)(8676002)(44832011)(53546011)(71200400001)(52536014)(6506007)(26005)(5660300002)(7696005)(8936002)(9686003)(110136005)(66476007)(4326008)(107886003)(54906003)(186003)(66446008)(66556008)(64756008)(76116006)(66946007)(86362001)(83380400001)(7416002)(33656002)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UsLNTuJf0ClSHQ+LNJ4iC5dyM1SOf8MArt82c6wrc8siOGFyLIJCFhvtYQyk?=
 =?us-ascii?Q?ayMovmzfbzazpz5UOIXnTTRjUdZepBxEKT+WzExwOJd9PaKoh1Sc+RHhI/FI?=
 =?us-ascii?Q?QCitAOsHa5oQXhO3B1+LyfdUV+T3HoWIA09gq265urc59zxyEWmiiFdACOAX?=
 =?us-ascii?Q?w0nLiktZ0ZzTGv0LYZVswQa4ElMwfTyWu5LLLQl3et1+LjWhvkQvaRsckBlB?=
 =?us-ascii?Q?zk8Wql9/x1yyL2N8H4vPOYNS8lxjsAFYhTY4i3FctUkY29CayE+2eKg7ZtSC?=
 =?us-ascii?Q?pM4BqsLLEo12l7H2J+dp7sqoI7opnsTTHhlbLH9RL9G6mh9jsl+iqMXFyXBV?=
 =?us-ascii?Q?03kCyMw9kKAhehch/e3xe9JsdKg/ax2qj5QCAMxX/whorYEkbYu4xW3VLXes?=
 =?us-ascii?Q?FCOiA3c0jdzzkdEWNARh+Wzcqx/g+TDtfccnW2sE6AGg3bMVogrjUTI8VYVj?=
 =?us-ascii?Q?U2wYMVokHiiuelDG7L4M8KZOyfVwFstjgTJ0Bdw7vA4CnXPQSawWu9VOpyGK?=
 =?us-ascii?Q?1ZXd5yuVqG1lwIvjpgevCOYb+wxVCx88bQHaP1dXD/2eWDlDaynauy94fGBf?=
 =?us-ascii?Q?onytQZUKtTOGoslHov79qdaFgCe3EjMGvbFzw2C63TJ8Y65grO1mKHstpJl/?=
 =?us-ascii?Q?7VZ2MqxDXd6li+IppHY5z/koSITAM229GfI2AZFO0wEFgMhk0i4dcjb+Gas/?=
 =?us-ascii?Q?oFcLjIixSvLhGesXTlGS7TBsZ0Zg1YGnPKMURxUnL3d+x19XViPODrhfLsg0?=
 =?us-ascii?Q?vXS+Y0y+bKus8fJmxkuP+EXTE3DYrD/zf9k3GSuiSHco6SCGXxQh4QjNaUqA?=
 =?us-ascii?Q?WVn5KSp6izCd4YBez/FEEef34ryEIQVWAXpodRaYsWKEy5U7Zx78J79NtfJQ?=
 =?us-ascii?Q?tgosY1/yWb9O0LztFt45xuXHVjY0PdM7yMHV3UwY2hH3XAcYDe1q0RHLqB95?=
 =?us-ascii?Q?qhvvGzUkhsrvMiJOsFnKJ6cglOB7gDZf1c+sHp4+Kww=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbf53d1-fd7d-462d-2a94-08d89cbb3463
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 03:25:12.3282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HnDptXgmoBVIigYhw89TvSx/dzOJnN3/oMT6ZIQVrResoqIn/9NHwVL9HUbqMZwMaRqmYKtKQTZvLwtTrWC4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_222515_687324_321545A0 
X-CRM114-Status: GOOD (  28.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Sachin Ghadi <sachin.ghadi@openfive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Any updates on this patch?

- Yash

> -----Original Message-----
> From: Yash Shah <yash.shah@openfive.com>
> Sent: 12 November 2020 17:31
> To: robh+dt@kernel.org; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com; bp@alien8.de;
> mchehab@kernel.org; tony.luck@intel.com; james.morse@arm.com;
> rric@kernel.org
> Cc: aou@eecs.berkeley.edu; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> edac@vger.kernel.org; Sachin Ghadi <sachin.ghadi@openfive.com>; Yash
> Shah <yash.shah@openfive.com>
> Subject: [PATCH 2/3] soc: sifive: beu: Add support for SiFive Bus Error Unit
> 
> Add driver support for Bus Error Unit present in SiFive's FU740 chip.
> Currently the driver reports erroneous events only using Platform-level
> interrupts. The support for reporting events using hart-local interrupts can
> be added in future.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/soc/sifive/Kconfig      |   5 +
>  drivers/soc/sifive/Makefile     |   1 +
>  drivers/soc/sifive/sifive_beu.c | 197
> ++++++++++++++++++++++++++++++++++++++++
>  include/soc/sifive/sifive_beu.h |  16 ++++
>  4 files changed, 219 insertions(+)
>  create mode 100644 drivers/soc/sifive/sifive_beu.c  create mode 100644
> include/soc/sifive/sifive_beu.h
> 
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig index
> 58cf8c4..d575fc1 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -7,4 +7,9 @@ config SIFIVE_L2
>  	help
>  	  Support for the L2 cache controller on SiFive platforms.
> 
> +config SIFIVE_BEU
> +	bool "Sifive Bus Error Unit"
> +	help
> +	  Support for the Bus Error Unit on SiFive platforms.
> +
>  endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile index
> b5caff7..1b43ecd 100644
> --- a/drivers/soc/sifive/Makefile
> +++ b/drivers/soc/sifive/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> 
>  obj-$(CONFIG_SIFIVE_L2)	+= sifive_l2_cache.o
> +obj-$(CONFIG_SIFIVE_BEU)	+= sifive_beu.o
> diff --git a/drivers/soc/sifive/sifive_beu.c b/drivers/soc/sifive/sifive_beu.c
> new file mode 100644 index 0000000..87b69ba
> --- /dev/null
> +++ b/drivers/soc/sifive/sifive_beu.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SiFive Bus Error Unit driver
> + * Copyright (C) 2020 SiFive
> + * Author: Yash Shah <yash.shah@sifive.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <soc/sifive/sifive_beu.h>
> +
> +#define SIFIVE_BEU_CAUSE	0x00
> +#define SIFIVE_BEU_VALUE	0x08
> +#define SIFIVE_BEU_ENABLE	0x10
> +#define SIFIVE_BEU_PLIC_INTR	0x18
> +#define SIFIVE_BEU_ACCRUED	0x20
> +#define SIFIVE_BEU_LOCAL_INTR	0x28
> +
> +#define LOCAL_INTERRUPT	0
> +#define PLIC_INTERRUPT	1
> +#define MAX_ERR_EVENTS	5
> +
> +enum beu_err_events {
> +	RESERVED = -1,
> +	NO_ERR,
> +	ITIM_CORR_ECC = 2,
> +	ITIM_UNCORR_ECC,
> +	TILINKBUS_ERR = 5,
> +	DCACHE_CORR_ECC,
> +	DCACHE_UNCORR_ECC
> +};
> +
> +static
> +int err_events[MAX_ERR_EVENTS] = {ITIM_CORR_ECC, ITIM_UNCORR_ECC,
> TILINKBUS_ERR,
> +				  DCACHE_CORR_ECC,
> DCACHE_UNCORR_ECC};
> +
> +struct beu_sifive_ddata {
> +	void __iomem *regs;
> +	int irq;
> +};
> +
> +static int beu_enable_event(struct beu_sifive_ddata *ddata,
> +			    int event, int intr_type)
> +{
> +	unsigned char event_mask = BIT(event), val;
> +
> +	val = readb(ddata->regs + SIFIVE_BEU_ENABLE);
> +	val |= event_mask;
> +	writeb(val, ddata->regs + SIFIVE_BEU_ENABLE);
> +
> +	if (intr_type == PLIC_INTERRUPT) {
> +		val = readb(ddata->regs + SIFIVE_BEU_PLIC_INTR);
> +		val |= event_mask;
> +		writeb(val, ddata->regs + SIFIVE_BEU_PLIC_INTR);
> +	} else if (intr_type == LOCAL_INTERRUPT) {
> +		val = readb(ddata->regs + SIFIVE_BEU_LOCAL_INTR);
> +		val |= event_mask;
> +		writeb(event_mask, ddata->regs + SIFIVE_BEU_LOCAL_INTR);
> +	}
> +
> +	return 0;
> +}
> +
> +static ATOMIC_NOTIFIER_HEAD(beu_chain);
> +
> +int register_sifive_beu_error_notifier(struct notifier_block *nb) {
> +	return atomic_notifier_chain_register(&beu_chain, nb); }
> +
> +int unregister_sifive_beu_error_notifier(struct notifier_block *nb) {
> +	return atomic_notifier_chain_unregister(&beu_chain, nb); }
> +
> +static irqreturn_t beu_sifive_irq(int irq, void *data) {
> +	struct beu_sifive_ddata *ddata = data;
> +	unsigned char cause, addr;
> +
> +	addr = readb(ddata->regs + SIFIVE_BEU_VALUE);
> +	cause = readb(ddata->regs + SIFIVE_BEU_CAUSE);
> +	switch (cause) {
> +	case NO_ERR:
> +		break;
> +	case ITIM_CORR_ECC:
> +		pr_err("BEU: ITIM ECCFIX @ %d\n", addr);
> +		atomic_notifier_call_chain(&beu_chain,
> SIFIVE_BEU_ERR_TYPE_CE,
> +					   "ITIM ECCFIX");
> +		break;
> +	case ITIM_UNCORR_ECC:
> +		pr_err("BEU: ITIM ECCFAIL @ %d\n", addr);
> +		atomic_notifier_call_chain(&beu_chain,
> SIFIVE_BEU_ERR_TYPE_UE,
> +					   "ITIM ECCFAIL");
> +		break;
> +	case TILINKBUS_ERR:
> +		pr_err("BEU: Load or Store TILINK BUS ERR occurred\n");
> +		break;
> +	case DCACHE_CORR_ECC:
> +		pr_err("BEU: DATACACHE ECCFIX @ %d\n", addr);
> +		atomic_notifier_call_chain(&beu_chain,
> SIFIVE_BEU_ERR_TYPE_CE,
> +					   "DCACHE ECCFIX");
> +		break;
> +	case DCACHE_UNCORR_ECC:
> +		pr_err("BEU: DATACACHE ECCFAIL @ %d\n", addr);
> +		atomic_notifier_call_chain(&beu_chain,
> SIFIVE_BEU_ERR_TYPE_UE,
> +					   "DCACHE ECCFAIL");
> +		break;
> +	default:
> +		pr_err("BEU: Unidentified cause\n");
> +		break;
> +	}
> +	writeb(0, ddata->regs + SIFIVE_BEU_CAUSE);
> +	writeb(0, ddata->regs + SIFIVE_BEU_ACCRUED);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int beu_sifive_probe(struct platform_device *pdev) {
> +	struct device *dev = &pdev->dev;
> +	struct beu_sifive_ddata *ddata;
> +	struct resource *res;
> +	int ret, i;
> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ddata->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(ddata->regs)) {
> +		dev_err(dev, "Unable to map IO resources\n");
> +		return PTR_ERR(ddata->regs);
> +	}
> +
> +	ddata->irq = platform_get_irq(pdev, 0);
> +	if (ddata->irq < 0) {
> +		dev_err(dev, "Unable to find interrupt\n");
> +		ret = ddata->irq;
> +		return ret;
> +	}
> +
> +	ret = devm_request_irq(dev, ddata->irq, beu_sifive_irq, 0,
> +			       dev_name(dev), ddata);
> +	if (ret) {
> +		dev_err(dev, "Unable to request IRQ\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < MAX_ERR_EVENTS; i++) {
> +		ret = beu_enable_event(ddata, err_events[i],
> PLIC_INTERRUPT);
> +		if (ret) {
> +			dev_err(dev, "Unable to register PLIC interrupt\n");
> +			return ret;
> +		}
> +	}
> +
> +	platform_set_drvdata(pdev, ddata);
> +
> +	return 0;
> +}
> +
> +static int beu_sifive_remove(struct platform_device *pdev) {
> +	struct beu_sifive_ddata *ddata = platform_get_drvdata(pdev);
> +
> +	/* Mask all error events */
> +	writeb(0, ddata->regs + SIFIVE_BEU_ENABLE);
> +	writeb(0, ddata->regs + SIFIVE_BEU_PLIC_INTR);
> +	writeb(0, ddata->regs + SIFIVE_BEU_LOCAL_INTR);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id beu_sifive_of_match[] = {
> +	{ .compatible = "sifive,beu0" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, beu_sifive_of_match);
> +
> +static struct platform_driver beu_sifive_driver = {
> +	.probe = beu_sifive_probe,
> +	.remove = beu_sifive_remove,
> +	.driver = {
> +		.name = "beu-sifive",
> +		.of_match_table = beu_sifive_of_match,
> +	},
> +};
> +module_platform_driver(beu_sifive_driver);
> +
> +MODULE_DESCRIPTION("SiFive BEU driver"); MODULE_LICENSE("GPL v2");
> diff --git a/include/soc/sifive/sifive_beu.h b/include/soc/sifive/sifive_beu.h
> new file mode 100644 index 0000000..c2ab688
> --- /dev/null
> +++ b/include/soc/sifive/sifive_beu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SiFive Bus Error unit header file
> + *
> + */
> +
> +#ifndef __SOC_SIFIVE_BEU_H
> +#define __SOC_SIFIVE_BEU_H
> +
> +extern int register_sifive_beu_error_notifier(struct notifier_block
> +*nb); extern int unregister_sifive_beu_error_notifier(struct
> +notifier_block *nb);
> +
> +#define SIFIVE_BEU_ERR_TYPE_CE 0
> +#define SIFIVE_BEU_ERR_TYPE_UE 1
> +
> +#endif /* __SOC_SIFIVE_BEU_H */
> --
> 2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
