Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3644D2E022
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9/AMDRcqXxPLnIQlg5kKk2iMZVeV1q+MvRUF1q5q0M=; b=J8tUyTbN72TqpY
	UD+j/RwOTViCQeP/CCSiWYqXF36i9qwSYNwKiNrH6pz3sRlLuyc4z6M699DaHMqU08HBk50ou4eOI
	FxnHywizu4zvrPtBu3z+CClJ2BqmLcZe0MZSvdNuPbrDe+vCXRonlwFtlTHZv6uQaPsIj2fUnKPfZ
	ZqMYsFDuYXuGNr2o/YI9qux0Ufcd9cG1dLqc65tp+9imu/fUf9hh4/1epLWTVuQ7KuWDiiq7IJuJy
	3kgq9nakyJ3bSkLUVfhdW6MU4w0w/cJ3kvEV+pvbEn/TG7qlwPK/EsFvFkOG5x0HeIFwYZj4ugb8m
	AaZMSWcatMkRzS0ABzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQS0-00000009AzA-3lfV;
	Fri, 05 Dec 2025 07:42:00 +0000
Received: from mail-sh0chn02on2100.outbound.protection.partner.outlook.cn ([139.219.146.100] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQRx-00000009Aye-2eKt
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 07:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfDujxF7dd9XAQAyYHdwmHQEzNcqRYX74geMXSTC8eU2WpdY/L4MabGwXljhuKqDu7fkIPCSloR5NKqHuzXeqmCOm9q7+fOTU24ssU1sAMkBwemBfBzSYmR68lDuvHwk1UFnn627VfitwPlXxrlFoMa9yoIN3lidbmE4RYDFHUFc2Ic5oCq/ZUzSGgpAJsYC95slZ9gtgdS1zCDztFi/fUj0p6QQ48QDuptev14HrMX4MwolmJcRQIxpyHOiJtGaRT+dpG6icFUCyi1jKlD38LpMw+gBPQTXGbg3Ik/WMBP1HfcTtw+ug4SAjlZ10SA5gFvIi9R8mE4vFV7rwDGs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgu2V/X8jNkOmo2VN2FOWperMZoUk69OHgrmYx0n+Dk=;
 b=IJBYuK7Q1d/3uy7dT2wJ6uoSt2mLgsWDZLepfhHTJCavvnIxAYKB1k9WvGvGfp7gC5wAeWGcM79xRvO6G0tHsNtJcs53JXvgQ6j8dJEkh1tcq3zDi1pjTag9yMHrg8z4x5yvNzWSmlKDBxO84V/mrhTsTPy7CfCnTa0fXPDuwpxoEvEdW797Ly4X8QSIS6m7s40aNO14DJGADa2AIXQMiPojvCndrjxFD0OBHqpJg3Oq0W7Bt8Y0cfupS/SwRLP+VQmjsg6wYX8cAznGoOfTFwgoFbUm0fVnJxwn75woFQMXaGflqs4Npsb9okFRhSZByBR3xo48nsGDdZuZehMqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1163.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 07:41:49 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 07:41:49 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Anand Moon <linux.amoon@gmail.com>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
Thread-Topic: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
Thread-Index: AQHcXeD7iJDD+48Vx0WE8jBy+XuFyrURxH6AgADyShA=
Date: Fri, 5 Dec 2025 07:41:49 +0000
Message-ID: <ZQ2PR01MB13076311CBBFE5B948F394FCE6A72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-5-hal.feng@starfivetech.com>
 <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
In-Reply-To: <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1163:EE_
x-ms-office365-filtering-correlation-id: 5d7881bc-375a-4fea-3a0b-08de33d1c010
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info: 9vYSNtusDQz/zcZzd/CV2E+CT3MkVYQKSqD+58KnvM2yTrYHAqlPADOeTjS5gN8n3TGCLQlpTgkMS1m0GW3lNuVUXKgnfy0J45aGPcD17nbS9FMopw7vFh0pEOPbIhjY9na94kzhCusuf36EHgpV50GwjogL9VWJNgixZjzdSg+5p9wtE/6sH5FLrPArpe8Xgw2a/EnL05kPbUscBx8B04yokAeFRWJxc/QfTv8rbcYoNfB8S86dFQIvEYf557HaCGTYWGiZ0goOpI9mDgElpotXccwncdSKFF9Cvpo5c/G671yYk8V6R7SUjya+cMEN9C7x7pCR0BAarzF3SQxnzyyK9POihCLOGp8PiMs+2wJAFO7l8ae6f70nkBba3LUzhFn8ZqOjm32/sQX9Qo+horvDf4xJUkWiFNpf1Nll4LZEcnYqkWFhaP97TMe1X1ErcjHeP+nwWDxRoK2cQHIct6S0EOXUrnOYGqKnFMKd40Tf7qVQltSa+AeLuYRYTLj2BLdbwwNTfqMhLlvWc/zweD3GFxAzmO+5YMkZjqeZuK2E5nyifP4FqMWqQzxEp0iJ5Uut3xu8m/G8LLX57JLLI4DeZ38NyZTo6NLDn8vfBCE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2ZOVG8yVmJIR044RE9MZS81V25BY2twaXl4QWo0SGlKR0kxS202MlZxNEx1?=
 =?utf-8?B?UnhSb0FtYzhrV1JPTGRNV1ZsbjMydXovTGhmQ2F5QzI5eVZncHBrbUFLbHc3?=
 =?utf-8?B?b24rN0V0MERPVHdmVnZLVW16T25HYTZ3MDA4ZDBzc1J5eUhxVFQvbTFIdVBN?=
 =?utf-8?B?UVI0MFBsekFZdnJZeHBDWjVhZndDWmFicjA1QUFiSzZvS3NIdG1PMnoyVE1Z?=
 =?utf-8?B?cmJya2E1TlpUeCs5QkJMY2Ntcm9MaHdZUWhqMkdtSm5XNlloUWVLb0piZzlj?=
 =?utf-8?B?ZGRKelJnRTJlb1V6Nm5nRVZPNU1XbWloQzRYMUJ6ZHdzWFdyR3p1NXRsZlgx?=
 =?utf-8?B?UFhjdjlUbXlYWlBwK01lOEJzY0p5dTdFNGsrajZxY29RQ2xlbyt6L0xCY0hn?=
 =?utf-8?B?ZFRjbzRhbk9mZVBtYlp3a2dMM0VEVXR0bTk5aHVqWnM3cHFwSlBWREo0djRu?=
 =?utf-8?B?djZOalhvWXk3Z1ZOOStwTWxmSXFpcEthOWp1b3pkSVZLc1puYmJ2Y09mSDdv?=
 =?utf-8?B?RjlKYUYvQ1JUenJyZUNPRTdpaEVLYmVZRnhydGxuMVJrTzErUlhxSE8wWkx2?=
 =?utf-8?B?UkxXbHRVUWJqakttZXhOUGJnWHBNdEQ5M1VFRlVYNnF1SWFJc1VxaWRpcHhV?=
 =?utf-8?B?V3hvSmh6WU44OGhvb1JqQUFPQklBcEZxYVZOR2RVYmZxcVhGK0F0WG5obHhI?=
 =?utf-8?B?U2tmM01vNTZYb0dZMCtHc0h0ZkMyeTJ5Q3RyUzNSbVgxYmYxQXhFNnNQUy8r?=
 =?utf-8?B?b3dscVYyOFY5RllOVElPclhKR0h3NU5Nck5yd3cwb2FoSHRFMWZMdUtTZGh0?=
 =?utf-8?B?N2ZvUW5TNEl5NVJjc1dIS3BWOW42NFRHa1lKYytrTnhhZ3FYZ1N6eHVHVzBp?=
 =?utf-8?B?OWpwRmdSVHZBd2JzbkE0alVDSDVocHhLbDNRZVNBRERXdy95Q1ZibThQK2xV?=
 =?utf-8?B?d3Fhek5NWWVmaXZyL2N1ZEVpRk5sa1RPTFZUZys3dkpPajdxc1NqWER6aysz?=
 =?utf-8?B?Wk83M01ERHBKWUpzNW9RZzVFcldGMGZ3WUV5ZlNoMTJseXk0R0pFM2JKRDhQ?=
 =?utf-8?B?NkhDWDZuNmVIcUppWVZpWVVRc0xJNXdHcHFrTERMSFBiNkRIQ21EVG5Ra2ZO?=
 =?utf-8?B?UFJSY3F2MnVRQjZvNjJMY20zd0RNNGxjYks2OXdITlJkMzZ3Q0o5dTA3aGMz?=
 =?utf-8?B?cUdHNTZYWjRpekV4NnF2Y2dBM0lZMzZXQVdFUXJIaTU4WnZjZkJ1S3l2TTd5?=
 =?utf-8?B?cWo4aTROMFN6KzdqbXB6WVIzS2poU0dCMTFueEVSZTgvLyt4bWE4U0FubFBW?=
 =?utf-8?B?VWIrVjN5MkJ0V1dYb0VBRjNkWnhJNnJxZkVPd0JFOWtUWnBiSnlFQ20rQXNt?=
 =?utf-8?B?MlFFblBiYXFQdzlFcVhZYVJ6ME5rRnZEVUZHVG1SdjNEME9ZSXFVWjlaWUlI?=
 =?utf-8?B?cytLN2lRTkN4aVJXREtNTHVWTHlyc1pDWFFtTE5VZzFLRXVUVjA0Y0FLdmpK?=
 =?utf-8?B?bzNUQkJKS004WStvTjlGQVFoVEE3a0dqUDAxYnFDeDQreWZ5c3dxSGYwZ21P?=
 =?utf-8?B?SStsdEczVTRLSlVjdUxvcGJuZjRqTTV2bHJ0OGNlcjVybVNMUnFwclhTY2V2?=
 =?utf-8?B?c2oxc1VkUFEzY3NDNlBkVm1JK0JDTEJidUlFTVN0SGRmdmlPdWZ4c3A2WTVt?=
 =?utf-8?B?Z0pCSVo5K2lyejhGK1UxbFJuU0FVR21JYUJWZFpMbFA3OGVLdHZUNVQyekMr?=
 =?utf-8?B?MGptU2ZNU2ZtYWF4SnB6RklaQWpRbVF1dkt5UDNNanJaQ2F3cG5lNEd1emJP?=
 =?utf-8?B?aGpZT1ZXV1JkYTIraGxLL3I3a2dURmJoemd6a29TOGNPNWhia3R0QUNBcjZY?=
 =?utf-8?B?allJbE1GUTRBcVZQdENDdElYanB5TnB6Y0dkYk14WFRleDQ0bFpJRU9zUFph?=
 =?utf-8?B?UUpLM244UDdEUjhrVmpSQ3NjNi84S015UVhZblFpdnlka3FjT2JHakRxL2dX?=
 =?utf-8?B?d2FLbjI2c0xSYVdQTGFMQnZFcHd6UXBoQ3EzbEdUd2hrMnAzTXlrc2gvbWxx?=
 =?utf-8?B?VVBiaGtYMmhnZVk5NkFHdkRIWUJ1czdzd1Q0K2VKUGU2MjcwdHJvVUd6Yyts?=
 =?utf-8?Q?Q2wrILScjfwyMXs/v4uuLCDzz?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7881bc-375a-4fea-3a0b-08de33d1c010
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 07:41:49.6630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tEp1NwGVIGF75DwXPvYQ4M4Tw56qdb+yDIoLAw/a7cYW4zSBFSUVlRWQyJxi/DYWsMCp9IOaOHKiQvwN1B7peP1WYYEUNrgK9r1jwbcqV90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_234157_670285_FA38DBF5 
X-CRM114-Status: GOOD (  18.24  )
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

> On 05.12.25 01:05, Anand Moon wrote:
> Hi Hal,
> 
> On Tue, 25 Nov 2025 at 13:27, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > Add a common board dtsi for use by VisionFive 2 Lite and VisionFive 2
> > Lite eMMC.
> >
> > Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Tested-by: Matthias Brugger <mbrugger@suse.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-2-lite.dtsi    | 161 ++++++++++++++++++
> >  1 file changed, 161 insertions(+)
> >  create mode 100644
> > arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
> > new file mode 100644
> > index 000000000000..f8797a666dbf
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.d
> > +++ tsi
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>  */
> > +
> > +/dts-v1/;
> > +#include "jh7110-common.dtsi"
> > +
> > +/ {
> > +       vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> > +               compatible = "regulator-fixed";
> > +               enable-active-high;
> > +               gpio = <&sysgpio 27 GPIO_ACTIVE_HIGH>;
> > +               regulator-name = "vcc_3v3_pcie";
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +       };
> > +};
> 
> The vcc_3v3_pcie regulator node is common to all JH7110 development
> boards.
> and it is enabled through the PWREN_H signal (PCIE0_PWREN_H_GPIO32).
> 
> VisionFive 2 Product Design Schematics below [1] https://doc-
> en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf
> 
> Mars_Hardware_Schematics
> [2] https://github.com/milkv-mars/mars-
> files/blob/main/Mars_Hardware_Schematics/Milk-
> V_Mars_SCH_V1.21_2024-0510.pdf

No, GPIO32 is connected to the WAKE pin, it is not used to control the PCIe slot power.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
