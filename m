Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC96FE9D814
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pQQTTNklkxcyaPFkwsJNj12vsBN3qFYA990Pisc/zk=; b=wRfaEXF6wq1/PS
	9feOY2jiBZ10fukyzWoLGJM5DpmGs6Uo57o1ocX9VxT+HNNHzO1Y8us6snc3LQpg2VwTxO5mYRHGJ
	1xsB1zPqlMXrIhjY8/1e6yd5xovxWvK4bcUW8uFAbu+oHyENdaND3RxVGcwtCWzhrtXCYxj3Yh5MR
	nXwKxXIiSZWo3LBthB/P/JlcXOT7CjwFmME82//tu5bzNm6FCxhMsHo/GSqPXHg0fLnArmnaeYD2k
	EGSep0GiSfwT2hy2x1/EKnJMyb6nyPCxrCwvlECSDGnq98AfLHSmuQ62ik8urBKZpPhtTbl/8h8ch
	VVfT3yYN0yBQKt3ABkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0GT-000000061pj-1rzJ;
	Tue, 07 Apr 2026 06:50:21 +0000
Received: from mail-sh0chn02on2120.outbound.protection.partner.outlook.cn ([139.219.146.120] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0GQ-000000061p2-06o9
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 06:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7JQg6/COAE3o9dgGcPIReAEvMJaxtGGrdo9Yr3WWjCcdJrgccgs9UWheohlYVVc9b2SrfauSRHWvKuYg+vNDRAifXLP+u8mVvJQeYOeyN7Z4aZz1XJIQeSNRSh8vwpiUHz5YFkAy8Vlz3zvjCiPPO5Ojlyky1QauvJdlSrMqG2U2Q52nH++hDXCPLCCYIr+k+FXJn7eQATKkP1p6DAHhp2iLV8qW/8GtC4SEFCeuF43l/Qc0A6TUsL1fVr3S/1c0QKPE2HtqB39pWh5T4sJkP1YxpV66RmppJlgcx/nIYe5MXzrmGEIGK/xzyZ8yKgRgVvPDQSuDdb8iqEG7usLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krYBL8bYbuTpSXyTVIqdlAKaMWxSC8lJqiM2/pEafVw=;
 b=UcFSx+ok2/frkhxx6kknra0PlVYBIwk5qQ1DmiVaCZ3M/Y/W3P2MjHQGTgOKXJpuWA6qGzYEyTFQesMPTeFIMSYzwD2Ir4+D/+Q8tP16Bs8D6Bf7q6qW+sSnTl65f3fl1j+qlJ9D4xeMwD9B1aTmpM6am7idbPZW87eO8WDLsPViEIhNny/fD0D6TPzNf69bTjMN3gBjIbct+iuqwnlMx25Lt3fUHvntyjE8tKnGLDRUY74VL75dRfw0RxUZZTnVBnXfyNirR9XId2Lv1oviKs7vOP+P6nr4arax8O4lVEkExMQ1yENAF6S42+hMvMhmazbz8f5PBcB1PSghlN+gNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 06:49:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Tue, 7 Apr 2026 06:49:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Alexey
 Charkov <alchark@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
Thread-Topic: [PATCH v1 11/13] dt-bindings: hwinfo: Add
 starfive,jhb100-socinfo
Thread-Index: AQHcwy29Jbuv8/tn4EuVftDhed9T17XQEsgAgAMcUeA=
Date: Tue, 7 Apr 2026 06:49:51 +0000
Message-ID: <ZQ4PR01MB12021DE82F5D893BBA15A659F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-12-changhuang.liang@starfivetech.com>
 <20260405-strong-watchful-marmot-fdfad6@quoll>
In-Reply-To: <20260405-strong-watchful-marmot-fdfad6@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: e45a7a0b-8c4d-497f-77a7-08de9471de32
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: xllWX3rEL5413XMPNoFzAWg/o4CZqMK1zcQ7kMdOK4Fvp7F3cvNb8CAIgHJG3DT7HWhLaJzk9WFnhTsm5PlPZoaCputGsx6nFHZi5A/EfppEv0W2qXYXHn3KNfG8aRKU/ESVpeOvjqPcnTK3UIxEwmgSUaM/pKknMgtNRjx+ree7PjtUyf0PiPmoirvr+n4y+Pw6NfavYBKfSvnnjAJ4BjtV6h35gdGne9sW+ufiWpXBXQK2AL4p4iwYf+Mz7167egm2iMAm4knnbfK4l1vbmEpk3VOU60yFe61vknSmQqs8IT2rOWypvkDF+tXgsuHMPzJkkTsGSWEdbt+vZ34/dTQVRY0TuN3C5UshECBzmTSTUx+GTVcaDg4lHhaD2BmV7WaLSUM0xd/3GVuTKUHoESygUUyJLgJrtEBRU8fssxJ+eZrVT08tV52zyFtbAr08CF2lrgOXqTC0MuTWxfCMt4zA7KnvPs5iM8mQTX86sybK8g/z+q+1TCO0NExCPeNy95CPbqef832kYxk6IE2Q0ssM+nI1T3amR4dO+NNcTIlXGFQPTqw412mEVrRjTQdVurOtJTJr5XWleiSRW3R8mqf7khCw6jMm5AYSmiA9To4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWZTNi9Nb1lFRUtIQnUrQlBlaDJFdUhJYUhkOTR4UWY5L1hIRUtHZTZJNFdH?=
 =?utf-8?B?MUEzNjltSHgvcUZTdGZaVHFpRDE0dlYxR3h6eE9nS2ljUzBsMGJzRFh5eC81?=
 =?utf-8?B?WVhRQk9HQmF3TWhqL3lkNXN1U2Fhb2JUL3V5dVJFL1J2cFB5OERUYm1YOGZR?=
 =?utf-8?B?UDdIeEwwYzNVV1R6Rkg5LzVFMFh5V2QyWjFpeGUrTVNRS1NFOTVFYkh5WGs5?=
 =?utf-8?B?eTlKWEZGVFM3YUJqRm1DczVDcDBuWTQwcmhmbSt3eWZjWTFGY1NsUVlvMzd5?=
 =?utf-8?B?V0hUS0hjOHEzQWd6Y3piOTV1YndNdTB2NVpsSkVTdVFmdVpZMWcyczFQQXhN?=
 =?utf-8?B?TFUyZkh3QUFqODlXOWFQL3NZL3pKdWRpMVZEaUU4UTI5WHFzUW5QdC9KeXZS?=
 =?utf-8?B?eDd5WHZEMTBHd3J3d0Q0UHJtbEhwWVFYOCtZWnNEbWhmREQ4WXE4b2hQQTBF?=
 =?utf-8?B?TTlVSDhLT256NGJnRlRZWjQ0L09LTStidzI3SzBzN05KUmVBN1R3Tm53bm5I?=
 =?utf-8?B?MW9sMGFxNFlNMmF6QnlyaERoT3BhMnZNV1lNc2lsd0FQd25tQldsS0hCZnVo?=
 =?utf-8?B?Vms3cGdqa2FBR2ZHMFhLek1FM0w3M2ZyYnp2bnMxTmlXbWJVa0I3bTJwSkU0?=
 =?utf-8?B?ZVlJWE1TcmZzanNsVkRTcWNDV29FamIxOGhiQzQ0cUQ3ay92aklNbUxRZXM2?=
 =?utf-8?B?WStWMHJFR05kS3R4aDhaaS9waStDRjZ6bEN2azIyRkw5bkhIY2diTDlqTmho?=
 =?utf-8?B?VWI0SktHajFmc3JQeDBaQzNBazBEVUgzamVSVmROZzJkeWdzTGdVRTh1TEY4?=
 =?utf-8?B?T0NuOU9tb0QvZG45TkwzazZrNUVLR1BGK1VueXhicWZwQ21MWWordDVNWkpz?=
 =?utf-8?B?c0VLdXI4MG83YmllNEhtMXRyTTBEZDVXb0xzZDFyZXpVR2tIS1hkL3N4L2Nx?=
 =?utf-8?B?N2EraHpqMjduWGNxSThqOW8wTm9ndmZJREtxZjl2Y3cwRlBqYXNBaXlTb01k?=
 =?utf-8?B?M2h3aEgxcDJHenNYVFpyWGduRVc5Y3RvdVUvRVVuUnJWSW9qVG1PTkFVL3RH?=
 =?utf-8?B?Q0ZneFI5R0lENVNUWHVYUjlvYTlLZXp6V1hyRlIrRTNGYmpqTWF5QktpcFBY?=
 =?utf-8?B?WmM3Q2VGY3c1cGlLMFplalRpakNWKzZoWUpnMjBpelNlaElKNWlVcCtjRkNk?=
 =?utf-8?B?MWt6MkxDTDYxUlVGTDQ1RnQrZ2piODhKWm1pTzYzalR3UU1ldjVHTVJGNVFC?=
 =?utf-8?B?ZUdZY0JzMnFUampVc2ZRazA4WFpZQ25sWHFCblpyRHp6SUxFazBMRVpROExG?=
 =?utf-8?B?b1FIM0hjYm9jblAyZi9Dd3M0ejY4K1YvYlp3WHZQelAyUVMrQitUanZXbDV2?=
 =?utf-8?B?UjhUMUVIRjJzeDNmOS9pQmh3ZmlkV25SSWExNHVsaWRmWWlmRzBmYnMzMmls?=
 =?utf-8?B?WHA0bk9id3pwYjdrRFF2bWRqWUFhWVRHSThmWEZLUkpNT0xUOXRJN2Q0VnR6?=
 =?utf-8?B?SlE3Y25SdlllNkVhVjd4ZHY4Q1BTUThKZ1gwTFlVZU9iaUNKcjlXdjhQeUdJ?=
 =?utf-8?B?V1hITmV6ckc5KzhKS0VWL2lJTTFnanZFVDNyWEo3VVppR2pvZkZCUjRHM0do?=
 =?utf-8?B?U2JCZlBzZTlQUFd3eVRsMzVPM0FYY2RKRE5RMTFoblFoLzBKNkluWEo4OEVa?=
 =?utf-8?B?MXBSTXVvNkxPUmdOV2RmSzZuaHAxQzZ5ckJieUNEbitlNTl3UkhXSzFBejhG?=
 =?utf-8?B?R05XMzZZU1U2eXh3ckY5MkV2TUdYR1lQd2UrUUJLMHJOYWZHeEhTaWdqUzBO?=
 =?utf-8?B?eldSS0VuMTdLWHhleHJuVEcxNk1hMzNsbmRPWHJRTHBUWnJjU3FuVDlJajRZ?=
 =?utf-8?B?cWVOa1RMU0VPcldMdjZzUU96MENlL0lRL0NJMkJrUWZuTndwaUlIVzlqSmRo?=
 =?utf-8?B?dGVMWXcwTGNleWJ5MEt1ZDJnaGJIeEYrSE0xbEpJTU9HdjdmaXZrRWt1d25W?=
 =?utf-8?B?dnM5RGhVTFpCN05nT0RodzlGZzNIRDNZVGtnY0hvYmJnRncyd2FGM1pZV1hX?=
 =?utf-8?B?ZnB1UWp2enh4cDNlN3lIME5BK2dwTnJxY0JlbVdWREQrM09xclhlbDhscWZC?=
 =?utf-8?B?Q3NSVWpOYVoxSTlKL1VycldPU1pjc2kyNmlSYjZSMDBrcEgzemlZWHVrZmZq?=
 =?utf-8?B?dnNxU296THN0bmc4dDJmNE1IRTdodDhYMWRXajFIc3VmZm1qRnExbkFRYW1J?=
 =?utf-8?B?S3VpaGREZWRwVFMweWZNSkJPQkVGN0RqTml5YnpVU0c1OFNvaGZHZWIyVTVL?=
 =?utf-8?B?cm53YnBuTEpoOW9sbjgrQ2JJODRUY0MrbFY3aTZTbjE0aElFc2Fpck1KalZP?=
 =?utf-8?Q?FyrXN9hCbW2pPcjw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e45a7a0b-8c4d-497f-77a7-08de9471de32
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 06:49:51.2772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayI4NtVLek2NYvOWBXWc3hw+Mg+Vkz/u7KBb9sp5pjtOh3SbdLIpGZwsPI8T44KHZtwYEmrue92hj2QdL/7aHfxtZn0x9Lmb4AwkYbdilQy6wGyyTjCpvKKKbyhy/45K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_235018_078562_6EB27417 
X-CRM114-Status: GOOD (  18.55  )
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

Hi, Krzysztof

Thanks for the review.

> On Thu, Apr 02, 2026 at 10:49:43PM -0700, Changhuang Liang wrote:
> > Add starfive,jhb100-socinfo for StarFive JHB100 SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../hwinfo/starfive,jhb100-socinfo.yaml       | 36
> +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yam
> > l
> > b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yam
> > l
> > new file mode 100644
> > index 000000000000..cc6b7d5a4c91
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo
> > +++ .yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/hwinfo/starfive,jhb100-socinfo.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JHB100 SoC platform chipid module
> > +
> > +maintainers:
> > +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> > +
> > +description:
> > +  StarFive JHB100 SoC platform chipid module is represented by
> > +JHB100_PRODUCT_ID
> > +  register which contains information about revision. This register
> > +is located
> > +  under the syscon.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,jhb100-socinfo
> 
> No, not a separate device.
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    chipid@38 {
> > +        compatible = "starfive,jhb100-socinfo";
> > +        reg = <0x38 0x4>;
> 
> One register is not a device. NAK.

I noticed that other platforms have similar practices:
https://elixir.bootlin.com/linux/v7.0-rc7/source/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi#L205
or could you provide me with alternative suggestions? Thank you very much.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
