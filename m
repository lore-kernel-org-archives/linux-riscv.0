Return-Path: <SRS0=66UJ=IV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95868C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 01:51:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342E4619A9
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 01:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342E4619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=jifZS/tCwXZ+k/YMJWpqoM2USnQB7ebgIRtIaM3ID1g=; b=oRztj1mxAb4LbDHzTFxKCI/oq
	gZmIPElcEAvuMRuEsuFFnoatBbM3KqOz8Xcf2wg641TqUL8/gVYhcgX7Y7Hpc/R0anY1zFKUcDeiY
	yJd4WgKuiwUaFT3v+xMJRt1pVZkEECGhIhQvxIO/XM4CBN19YKjELmt30L4jw45ESE3u0QBECnpbJ
	kQ/+Ged3M/A3FQHal1+DUTZqHXlCN14G6PK0NPG7FKGQvjoW82DmrcE5E1aQfaVcV+mx6PfnTRv3c
	fYtMPZXqOJnZBUvueUkPUwGcZyu4MqzUNqCYR7dfx3yrIsbvqT4ARMwhws2Hpf5CRVptGuuPrQxW3
	fGz88VKOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOWCF-00DHwl-1n; Tue, 23 Mar 2021 01:51:04 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOWBb-00DHrs-L8
 for linux-riscv@lists.infradead.org; Tue, 23 Mar 2021 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464223; x=1648000223;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=HcV/aD+VFzmilUAfal6zKlnXmKOdBHt4u4BK2w/aSTo=;
 b=Ug6FzyKy4Zg9T1sP2ur0zEQNDWQtCqJ8RkGnkYmFhEGBlDNefpsycFvy
 S3nXfhuAgmolXCSSDn7pcsjI0kmDUOHFZ/T5lNQITUAjTkASc0P/wi6re
 Y7ny6WZNGfvgGvWmhJiZAaZ7XfEw0BipKeJEs4Vm+QXcm/5Pxmg3qfl79
 qijJdIqCLY3bjnzJSSNg3nl3E6Yj39tU92g9637ZWRHG4Oy+XY12eY1np
 G7N3nTINGs+EdimHUg+9vTpuSOBFbkSv/+R7I+WvvIOX6ToJJiYU+sxfL
 /qKDhbhyRVMOzKzxX5MsR9G6Klgj8cEHUJt3nN60AeX3dlyxoeg42OnEk Q==;
IronPort-SDR: X0uwr+WVN4Adl1JL0KnrhN+zdpHZ/CpSWwVSLKb6uJfYxJazcfyckAfvBeJBhVaIFk76gCGNS/
 vRxSNSV/DEq3bJ/J+/os2vRBoJzOLrzofQ+DRYndD/+cGw23Br4A7SB8MdsxrcdbWHLeetOuah
 Ur0V1EzLlshxYsy+m1Tf6E7ZX/AhXVNmcHiyfCSaTiVEARrDa4bsCvtMavItqKmrXzIJ0PTFUh
 2OmedbLRFTGfJdT+TrO0q3JCVy2KC5RtvgW9AvxURhgyVe+2HWwPKZq2P4fH0zT0LvRbgdj8c8
 7/8=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162748361"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:50:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj0nxLLj2Io0uzk7OWKNR+221wNLgsI4oDScCXFYCj5vANJ2FrqRBxICFEnrtsQL2ocG8xzJaGqQ3uMrWFKxSURShV8oQmfX0kGGOj9xcQBfVCWGaYq2y/MJNdRsmBOtf3Ekiw+jxqhvoTsYDPN6VzcgU9YpJgibuCV0kaWqo8uAYYAjWkD/Sh8FhJOd+jBLFedF+AI2auq7sgeFkJtntTvoQKCZ65bGZBkSu03Fc6aABDnRcVsI+3vZG1UKCqywxcqqdrpv3f69tFKx13DgWd+INgZs+UCUdxxMqdplQl+GmRXeyAr55eOxiWzsC86UuUWJq56Psa0hud/ZaY8B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoKyNpvpyqDHDBW4mg5oT6KniNYK3Sbsc+Ldcey3gk8=;
 b=EJCdguR1SJaSfXK8wCdwyrbjEAHp9AhjTF1bzlcq5AY4a0hcAhWvqRvX2XGrQiG9a/Rr59anbYyl+mT0vYEMzRr2YtIuMcsYZSwn1OrpBfrmd94WHkaKVpT0B9MeVmN/455nS6hItYHtd3HiNKGB1D82MNgsIuyN/JODApzYCkk7Rya1DHE3OLIJlnitqmUAhTGi2oSiUjaRAMQp7XVhG50EaVdTiwIfb4C/22XKDqZBgg9xfbJ9ajk2h2lIjzscmm0uqvj5dMG3ncX5iJSYczzXWc1x0sO8V8ltFDKPlCLzisu1Tm4PwvymM/5IJi1U7x4ScVvsbpjmUgyZdYGvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoKyNpvpyqDHDBW4mg5oT6KniNYK3Sbsc+Ldcey3gk8=;
 b=QyPEP3rZlIdPnNhxAqU1t2nw0RZTwgZfKtwHa4ReHX40Y6BVvZcW+MsLY+l3JbfgPCI5xaqQMwVBqqqcYArYFV6lyhPdkWqSuphW0/Zb2Y9rmdxJu/PoW/oWbGD4ihghHJ7bgACsNOjwmiqdOJJR00KMP8Z83KzUZYXOp07rxbc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4739.namprd04.prod.outlook.com (2603:10b6:208:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 01:50:06 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 01:50:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Wan Jiabing <wanjiabing@vivo.com>, Linus Walleij
 <linus.walleij@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "kael_w@yeah.net" <kael_w@yeah.net>
Subject: Re: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Thread-Topic: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Thread-Index: AQHXH4UpNyri6rPE4UuTaZ9qCWr98w==
Date: Tue, 23 Mar 2021 01:50:06 +0000
Message-ID: <BL0PR04MB6514CC42B4BD551A7C2C77E0E7649@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210323013727.135571-1-wanjiabing@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f01f:effc:52e2:7eda]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9db72f98-8046-4bff-1d9a-08d8ed9dfbd2
x-ms-traffictypediagnostic: BL0PR04MB4739:
x-microsoft-antispam-prvs: <BL0PR04MB4739711EC7A7AC41B1125AA6E7649@BL0PR04MB4739.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ANiNFGxsxkVVd7orRPo9byPGmeCquP+LK3boa1qiPZ9nQHcUFR0rokzC5s/KOP4YjxgCHUwQTUuAvzsXvJ6Y0ebJrWZz604SqbRy4/e5sDlc0BWKRyu753eYTIXqHOZ0d3gXX2HnQFt0qhesGgrGBEJ45OQsP1b7/m1JPQK5VJHZrcfGobHVL5fIxuVt+pF48vzAivAOn5x2UMW6jZyKr07xI+tlA2cnO2ssxCSVd2vGzm99EEwJXwpTqJ1plrsKDFsSZVpminpmxGhkE+flRiTy7tFRDD5/f3uHR/SKMkCqhs4hGiyAExCJjSWo9w6tBbtmKGurNjVPv7A4i1RjN2gHkIL+80QD4c4yWPMXfxfkoDxiKBrbf0yL9Auv2n7qQfxfMFGXaer9cIgKxsZNeTMjps6HliFl7Up7AyTKoJIn0INXKTQPuRTC+dCPLPew7OsYT8GgiVYvuP8weBZZqIx9cMiVq8AAWLVjetltnLMfvThT+YLq10o19luhWMi3SxL5aboK3U8HDQQXmQO6bercEPCTn6RGlKUkIWtE1Vl0XBrEosqv13SPLJTVeEiy/ouPSxtwTKrEj98QsXWyu+cd2QwhzFTFl6v1SnUxX47CJFIz6Pz2reIBvFaJA7jgXJD8BCXpTlmp4EwxDfagai345qaKc+iSvF8xxMB3NBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(478600001)(4744005)(8676002)(8936002)(86362001)(33656002)(53546011)(7696005)(2906002)(316002)(110136005)(186003)(66556008)(91956017)(66446008)(64756008)(66476007)(76116006)(6506007)(5660300002)(66946007)(4326008)(52536014)(38100700001)(71200400001)(9686003)(55016002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LzH3Uy/rYY3XatoNBpj+FUOsq3XfvPu6ev+az5T6LBFlsZ/h/AtX2SowZW7K?=
 =?us-ascii?Q?YDqWy1UzNukOACnhCgCSHytiCeigk9cSRhbHpZs9tF+6PsV/x+4QIPsq8krr?=
 =?us-ascii?Q?iQoeW57Zxe0LOygJvxBBQ8vHmt9UI+hs5qRMDATX2hry5IdgJIFLK94qTME2?=
 =?us-ascii?Q?5CoD4eKN6O03T4qx+DJnB5oYwnpc91iQrQDHlf3Qaej2V61vQdkIokBLjjVK?=
 =?us-ascii?Q?ruVXxuRyK+ZoLOyr64tH+gpIoqwf1zF/qy6zrV0AxRvtkc73ibXKdeEKJg05?=
 =?us-ascii?Q?cTWt6LyxYii+s5YNAuyLo/yr/A8g/4gj1lHjA3Iy8Lqo/96nk4GNs3iL7qvi?=
 =?us-ascii?Q?iQtDc81fEDYMeoM4Wa8bqSWjJ39+KoAEUpDT/Wx9fxWlSAsKEP7XVTM9vcxt?=
 =?us-ascii?Q?PzAk+yGHEC9u5Q4VU1WYw5xYsboJFTi9ypO/rVcF76bU7P8cA04lFt1iXx6l?=
 =?us-ascii?Q?8/9JbetjG8HjIdXze91N8+vAG5LXpEMbZJz1+gL6js4yu8YF1GiFkr0n3cUD?=
 =?us-ascii?Q?GjnXOG7Pn7bP1T1vvu8SVploJJtD98DRB/eQeRjjGJvjLcVNHh6neby3TGws?=
 =?us-ascii?Q?OwNhwfWzOQrxqnSNMR1wW4iAtDXgubAXQpuVVMl+CwsvH7dpZtLZHYTRwTZx?=
 =?us-ascii?Q?Mj6k7kM7/OgxKv2zktFeansuHTVfqsnGtjpDdgsKHAlHiPyKIhZL7HZM79Yo?=
 =?us-ascii?Q?N72g11XQc4q/B9etLo8Orvur+gLHpaiUqxj6awAAFLfbnTywqt+xpxzGC0N/?=
 =?us-ascii?Q?83kUo9Cy8pqUtg7tG6H2NIymc4kEzv5YwBuijshEhWAensdIynu8k/PWvHls?=
 =?us-ascii?Q?Px+hEzG+eXj+8OFCS0QLHScnJp1uMlJw9fqqzBUUIowgDoNuZhA5VeP1RR4h?=
 =?us-ascii?Q?IVPEk2H2+cNrALNHHEcCC9TkC6M+WfXNHmnNs5+G10DjRkTy2GHPDugNvWVY?=
 =?us-ascii?Q?7IYwrUpLzZmBpVd0VcqACn/b+mJ68nydp3I9sHpDjGY6EjEtUgYkEq7cUo+d?=
 =?us-ascii?Q?1KoUk8Y/TCDYiFTOLu5LwWZoYXT1vhtl4eoOQ4+RMYszUAELAZUR8ytrxcCe?=
 =?us-ascii?Q?Da38/1OSpNZfCP2FObLywDoH+9XkV9lYM/rAcRsesg9pTeoL22PXiQldYoFj?=
 =?us-ascii?Q?mTIh0oav6Ui9sm3IhXUQOSWwrqdpwIWlICX3+4RvMieca5kh9/6PI19YpTl+?=
 =?us-ascii?Q?/al6kBeXmurdLtwUJRFa6w9VNnSYA3A9fnu+YFiVcusKVy480O4mm6ObrW1L?=
 =?us-ascii?Q?448tFl5GupVyJJgXQOPn8r89cJpVIqn0ywDhGozFgPwP0mOmMfJ5FTXbBMJl?=
 =?us-ascii?Q?g7CsKZqtiuC9Xh1pAmJCjiXoMyxnEs5DJq9qb5T6TemGVUC50ZCa/aPsHjfE?=
 =?us-ascii?Q?UbLmR9mvMU7flOwJ2i6+L+2+Weh4Ap3Ip7uBymGb7CsfB84nqQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db72f98-8046-4bff-1d9a-08d8ed9dfbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 01:50:06.0686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEv5w0JYspk7M/IOxlkd1lFW/MkRXjXQSo9Xe2tYNGHIITjvYsXFWomb2IWl7zSbPwzKYtTSyF7RgY28PQzO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_015033_284099_02B86132 
X-CRM114-Status: GOOD (  12.04  )
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

On 2021/03/23 10:38, Wan Jiabing wrote:
> linux/io.h has been included at line 6, so remove the 
> duplicate include at line 18.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 8a733cf77ba0..f831526d06ff 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -15,7 +15,6 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> -#include <linux/io.h>
>  
>  #include <dt-bindings/pinctrl/k210-fpioa.h>
>  
> 

Good catch !

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
