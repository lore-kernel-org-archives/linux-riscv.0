Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE629CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5Jx6e5mvAELknyadBanwZOgE9OFhE1IyZBMpVuP8IM=; b=MONZOSZkwNcPoB
	gF1WutThpAwhNhtG05b3CfTo9wSPHeVWe0j4dfzV+Z/tksS8zEMr0auIW9YUQobGemtYIh3AlfuFW
	kB479AW6vMxx39zcu+P7oSRXnGDggl+C6lxoC+095Psb/X+KcisrclR+ybV6PvsJ+9zmY+SDBDzkd
	rU0Ol6qyjydXONOD9482HWRnFK3y41UH76x1y5DN23esOrDFQZ0KlgYfnFDnORj5BCTsA5ENJTcdD
	mYqxP3i5ezQBaAWEiKNkvCNJaqw9h1qWf7TPOhsjTvHe1Y0t3+lcxa0Qyilz3l3Pq6yN6Eol0Ht4X
	EalDkjffmschJ07hz/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpkp-0000000D3Ju-0Qx9;
	Tue, 25 Nov 2025 09:54:35 +0000
Received: from mail-sh0chn02on2071b.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71b] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpkm-0000000D3J6-1edC
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbP48pPom6ARnyeS31C5uc0jKXEeketRyeV/Nm1HF0HlZbHIlq7PpmIVZlw5AFnihEmlb6zbO5XtZSsTsWyy8/P8WRIGhro9Gp7U/OOnnBYnYhIT2PoDjXcU2jg8B+Iboiw7fiZL6YQL/Y59Vk00NDW8lL96CPwUAaS9l69a3bZV5MBzU4SrLIbX//JV/UKimHyTlLIEC/q1L7O7H/Pq/5cdpxK4J4+qx6p/Xbg6Ca/GNJAE0A+NyrvFjRNoyPTZb4uDgpI/D9vCoVL4R77NNSEpnCxImHimPWoT8/SGmMHqtWx/D0gAP+N6l3E8yHx4IWV+Ui9+1Cmi6rl/CT42Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtfwhYYOKtUc/HqEVzwSfbuWLVe+llYdaDT7PE/RGmU=;
 b=iqrpmymsE2gzjhYXvFJyen0AVXIj8oOAjfxBr1GiMYxXKTeCRzql21lA6opUXj+WkLyOnqGfUCEPgdiyoybup6p2C6GiN7DI07l45TqALzFeS8Qb56pMzS4DJkjvvDRlDJdbbQRevUgR79IJjmanJOby/ouy/kgqw607ySnC5QGSCzBrn/7RBKDAZr3IaIHoBBpEdMo2wsnr1CD1rA/J7F03tlmJmIr99VmxPMJKnDxcrOBueXgGuj27/Ck0kaZQ5iIXVkRQHHxqudsOZZ7S9+w/53zy5uSlHGvu2kYIVqYXQzFMCzlXeUPnHtgyeHUv/rOKY5U2RN+HuC94+Sfjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1258.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 25 Nov
 2025 09:54:16 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.024; Tue, 25 Nov 2025
 09:54:16 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley
	<conor+dt@kernel.org>, E Shattow <e@freeshell.de>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/5] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
Thread-Topic: [PATCH v3 3/5] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
Thread-Index: AQHcWffbynCSA+IJ+0Oz5i411OTTsrT9BkyAgAYhFuA=
Date: Tue, 25 Nov 2025 09:54:16 +0000
Message-ID: <ZQ2PR01MB13071D2B6401DF66E2EF1F95E6D12@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-4-hal.feng@starfivetech.com>
 <CAJM55Z8NsC_-jcrm+ndMonU6EtkSzhAQvoROXZwOWNi9FeQLXA@mail.gmail.com>
In-Reply-To: <CAJM55Z8NsC_-jcrm+ndMonU6EtkSzhAQvoROXZwOWNi9FeQLXA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1258:EE_
x-ms-office365-filtering-correlation-id: 55e2e924-11d2-4aef-9eac-08de2c089874
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: 6Wq6E21Mfkruntdt2L/rcMYinDNm/RnG8jLZTu75ZhC3zB3ByrXqgodh93GrmB0Gk3N3WAjuHAej3+cEIgUPpwC+a/zHOcaoTC19U+9WRFsVAQGZap+VvcNNnwxOIYXRq2u78h8dMf+yDfr2jU87jCDXIkl9snoFvnyi6WXF2Qx6e1IJ1Zr0bwjcwSz/82Zp5+wiDBe47WLdbDypPL0mWM9nmyzpjP7XBcNU0V2SsI4PyunnmlwfgsBft7726m+OOHWDCybulqWsqiq+y8NE7o6teD1LmDhYq0yVj1/I1h8fWMwdGYL0xNKyF4n0u8NTfWBM09MqEwU/B170kA7TgVF3X8ah68EgXrrnQO9fGECHRqpewj1bvsGKbZ5LE5TUM558r8WTXt3VTjpnHPbRKfVcAj4dQkqPcsLW9/BH0hjeFMQai161ziH6tCq3MbYNABkcC47xPvY+y8kIeHW+pgc8+yZFwqGuzMpJDQFbrfWlRlVmlrR6pXeU067weyH7KRqJbz/1f6v6dLgaLJEzMzskGvJuLivnN7nfNSMhDnpvnfLxA9N6qewVj+cxjcRnci1NEl0BT7VgU0GCAAW1DgaorNrQYwbncqlOpLP37wc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWg0cExrTENKOXJUS3M1bGFQYXBqUUczMlZzR0lPRHpiZ3Z5Ym9DUFVmajJp?=
 =?utf-8?B?MlJxOG9vVWNDUkw4L2d5ZUJRYXpXTXBsUXdJZ2ZEY1haVEN2VEtGOXFMNUJI?=
 =?utf-8?B?TnUyU2RUUlVMaVFBbU95aFRhbmFVV091MTdqdThwMkZyakJnK2M1emprUWtI?=
 =?utf-8?B?MnErYmk5QTdISHBBZUowVGNMZTBSbVE2UGVnWmpoaUZDUlI0ZjhtcWtmaGlx?=
 =?utf-8?B?WE1uNUYwd1dTZXEwU1U5Y1ZJV1dBWXNBUHp6dTZmYlpISk8va2RnUXl2b1c5?=
 =?utf-8?B?KzBjQzQvZk5VM3BBWVZOcFk3ckgvako2dTRqT3NxbUI3NVNxNm50Z3ZjKy9p?=
 =?utf-8?B?SVJnNFF3b0JTTm5kWHJqbTl3WWpERzA0Qk5OcjcwN2kwWmVIRm1leC9xcDBB?=
 =?utf-8?B?c2NtalBOTXRjdzJRcHZSaFVNZ2VRZ0NQcHQvL2ZsMXhJS1ZJKzFGTmN4NldD?=
 =?utf-8?B?NSs1VW1VRm5Da0l5Y1lYTzZ4bEdqeGtCSFZpdHRRdllYemNmTlYrYXpSUS9P?=
 =?utf-8?B?ZWtQR21pVmFJa2tZUGthZXJjaS9GbTZZNDBkaDRBUUhqVklQdlo1bEVZQjZV?=
 =?utf-8?B?bk5qUHJMRXRieGlGM3pGL1BWZGpXc1dDTlRqbHVidmQvb3JDejN2MVExZ3RX?=
 =?utf-8?B?R0VZbjY3eGZNNVJSYllpdUExYW81eGRCRzUya3hEZFB3U1hiTStROElDa1dw?=
 =?utf-8?B?S0Jzd25mOUViWDJDanNwRDZqRExIaUd5d0pRNXJWd1ZacUtXS2J3YnZ4SnRl?=
 =?utf-8?B?akRUcHhRYmcwakJkSmRzQm5mbnJrSXU5TEVsNmRWdFhNenJ1YldyQXZrQ3Mr?=
 =?utf-8?B?VDBXSWpRa1Y0V201WkJadVFQRkkvU01lOE5KczF4dzVXNGRhOThIem4yM09L?=
 =?utf-8?B?U1hGVU9KYXUreU1qK2FvTnJXYkUyMEliQlVjQzNuWmZjYzhBOW5VbDlXSUJ6?=
 =?utf-8?B?OCs2bEJkTWFhUWM5eWVUc09oK1VaNm1lSitHZWc4VDMvTWt3NVBVU1E1Nmcx?=
 =?utf-8?B?YUN4ZERJTytHb2JpdjdMczBiYmJWSjNZekFQaEYyU0tCdytnVUxrd1BET3ZS?=
 =?utf-8?B?N2ZMSENiQWliQ3YzWC9oWnU5YzFPMWJqQURvMlY3S1oxcVRpZ0toMHZrQ1A4?=
 =?utf-8?B?aVdiclRSUklFV0hIS0J0aENUNW94eU1mV1crMGlYa0s5R3JuZVRVM25vYi9v?=
 =?utf-8?B?c3duaVN6TGc3dnl3MXM1bTFNV093dm5hT2QzdXJDWDIvdnlKWGp4OTJCbStC?=
 =?utf-8?B?MlpXd2UwaTZDQkxhTGlTNUY1Ny9ISEVpUmJvcU5PdTBpNEFETEJEOWRReStT?=
 =?utf-8?B?Q1VXMXpLam5qdmorNm1YRURucVZxa2ZRMThhNHF5L2doZ3BhMjIwUWZxaDVU?=
 =?utf-8?B?Wit1RGtCY2NkcUQ0Sm9lcDc0TjRQU2tLWjZHd0d3NGNKM1NSMVNkN1VpZ0Jv?=
 =?utf-8?B?K2xxNkdpVmxQOXFFNkE2aTZiVExZZ0cvVllXZU5FTS96ZzcwSFJraW45NitT?=
 =?utf-8?B?ckNERHExd09SOFhpc2E1elNuZXpLRjY1b09mR2FRaXQ0L1doOC9nTzU1WlRN?=
 =?utf-8?B?c1NRYXpjODcxK3BXbm83aCt0YkY1REFHMEliOFEzVCtqRHF2aTZHS1ZQZC9F?=
 =?utf-8?B?TFljQklnc1Y4b25QYlg5YVJHNkhGZTVwOWNVdU9UZFNiTTFaSXEvT1pGYzhX?=
 =?utf-8?B?YldMclhqMjBMZnJiMlFQN2pqc3JYVEJOdWM1T015K2xmY2x0QjQ0b1FROGpB?=
 =?utf-8?B?cXo2SXNVYUt6TjQ3eEc0YUNnbWVBN1BPTUJUZXppSzZoVE54d2RUbmkvWW9u?=
 =?utf-8?B?NGlwR0ZuRWdwNWNVNVNRYlg4QVZPeG5oVHBzM3M4U3dyZjZTZ3dWdUdQSnIz?=
 =?utf-8?B?d3owV01WUjhjWlVCRkF1S2ZubCtxOStnbVhhdjlNanJMeUQyODJIcFFXb3BQ?=
 =?utf-8?B?TG52N3BTS1QvejVTSEJ5bStvOUhBek4rRG9ORlRiaExGV0NVd3N4TnVyVTNz?=
 =?utf-8?B?SWxENlUwSmM3MW1zWnA5ZXdnRzRVd1NQNkRWakVaK3FlVzJlWEgzOHhVMkl3?=
 =?utf-8?B?NEZHUTdmK3ErYU5aVzhNVnZqVjlQdGw4M3JudWFqNUF3YS9aQUFqZElyTXcx?=
 =?utf-8?Q?TuCFPz72LaO6aTHsnSjqwARQE?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e2e924-11d2-4aef-9eac-08de2c089874
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 09:54:16.1937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqQ/8yMSrglOAITAFYCQAxsKvkxFFE1dk0uvsr3kyOhluEvUxjbneCqiPm77Yjpw+p1zbwc0wESDi9l/6EgOdCKnE2ShUHGwjKuUunYRcWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015432_434819_7F8DDF58 
X-CRM114-Status: GOOD (  15.84  )
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

> On 21.11.25 19:51, Emil Renner Berthing wrote: 
> Quoting Hal Feng (2025-11-20 09:29:44)
> > Add common board dtsi for use by VisionFive 2 Lite variants.
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../jh7110s-starfive-visionfive-2-lite.dtsi   | 691 ++++++++++++++++++
> >  1 file changed, 691 insertions(+)
> >  create mode 100644
> > arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> > new file mode 100644
> > index 000000000000..aa375c4a3fa3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.
> > +++ dtsi
> > @@ -0,0 +1,691 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>  */
> > +
> > +/dts-v1/;
> > +#include "jh7110.dtsi"
> > +#include "jh7110-pinfunc.h"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> ''
> I'm confused. In [1] you said "remove jh7110s-common.dtsi, because only
> one board uses JH7110S now." but this series still adds two different boards.

In my view, VisionFive 2 Lite and VisionFive 2 Lite eMMC are one type of board,
but they have different storage components.

> 
> Also this derives from jh7110.dtsi rather than from jh7110-common.dts as I
> suggested in [2].

Sorry, I misunderstood your messages. I sent v4 [1] just now, please check it.
[1] https://lore.kernel.org/all/20251125075604.69370-1-hal.feng@starfivetech.com/

Best regards,
Hal

> 
> In any case I'm fine with doing it this way, so
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> [1]: https://lore.kernel.org/linux-
> riscv/ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.
> CHNPR01.prod.partner.outlook.cn/
> [2]: https://lore.kernel.org/linux-riscv/CAJM55Z-
> MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com/
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
