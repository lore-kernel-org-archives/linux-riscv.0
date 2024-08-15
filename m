Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C3EC52D7D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33BZqCGQGAUolb5p/bWJ4iNXVy8cOO5BehJNz/ybWHw=; b=XvdItmAPf5Atyi
	1VuRUmL1vquhVGsodHRtGXJzhAQVi4O2sFZlKfM11V5V5KWZeWpChTLMJkmln9QAej8VsC02wWZTY
	8/YvBemcI05DNkeXyEqYj6aOG9SUQJ5EzPT++oD5mqB7kzLXnSzS3hday+SA7y4No1qgleONrB6yl
	SPxP5VxhMML4fj70YphpiWPtbYrr1Mv1gKiraQQUr5QjbaXXP4Wogu2nbOTFaeR+Um+XvpnslLzr/
	W6CTUUsdhvBhwkXNoFbumj0FA/nmObGS+YurcsJh633h5kkPBRCji1M6KcScVNttXuZF1xqH17Zrp
	GqUkh21rdNZk/gpRStxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXo7-00000009dB4-0NBN;
	Thu, 15 Aug 2024 10:34:15 +0000
Received: from mail-bjschn02on20711.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::711] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXo2-00000009d93-3iu6;
	Thu, 15 Aug 2024 10:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3H9ascx/5pCw72JXZDtDzE8iGGh8zoPgS1cE1mKQkeYwKG1FbLdzrCSSH4vYEHVlybjHiTX9ZVnL78DVRd3baBlqb55wwzUdEKkY7zQefI4Y7tX86rgb6x5ZiXBis29l+AymExhCFXCIR37vRnqTDNLEYZU50LLwX/irZr7k+yOCMH8zmljkWN4ITXgPaJD3bXdTH8j80TDk39lwp77T/Y1l+qiFs8PHmX7CduLf2xM+e3vP469GU1VN9/3Pl+b0/8rot8qFktVyC2jP53e1x9CsC5LvrXLzWekHcNOuVL/GCvslyez6AHnzzJeuZmA7msL632eJ7B32wSX+d/RQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDo5SrZ/4pywN3nG4oxF3giT4t7+xTbQGbK4wFKcEBI=;
 b=I3ScJNOdHxbNvrOV9Loou043SdY7SRBdz2wByAW4CSQWULQv6jwWx8FyqomQbwNJdqyP5vDsYFeoHVrJC5bh10pb9tErtg+dtJkqrZqwdkVX4bqn+y3ScdrR5ejaV/dH2Xe2/NBjxDlWGMkjrUjxh2GN6NpbaOux14wTLdQ8l8lGah2ppoJd1MGWe3D1v3bEiq7/7IxARjeUgj2HxbZFXhKltEpY0/smQJjieQK/c691iZ/RnMmG2SqTv2lqYEhqtCyKR4C+lEqU/ycU/z7lix4yBijoMqP4hdV4CuOgir3LE8DOllpCQcqpqYqecRO9Yx45UFgH0y++B9rU6A0kmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0864.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:24::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 10:33:55 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9c31:a452:dc3b:7273]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9c31:a452:dc3b:7273%3])
 with mapi id 15.20.7828.031; Thu, 15 Aug 2024 10:33:55 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IHBoeTogamg3MTEw?=
 =?gb2312?Q?-usb-phy:_Add_sys-syscon_property?=
Thread-Topic: [PATCH v2 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon
 property
Thread-Index: AQHa7MIqi3fKeaFdgUCkV8gwHQ6DdLIjxqIAgADkCwCAACqYgIADTTAQ
Date: Thu, 15 Aug 2024 10:33:55 +0000
Message-ID: <SHXPR01MB08633B523DA1F6C5632F6D9DE6802@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
 <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
 <20240812-overstuff-skirt-7a8aabbcdc6f@spud>
 <8cdba8b0-7364-4c09-b18a-f3f59da1eae2@siemens.com>
 <20240813-haiku-pusher-f2fb037a2f49@wendy>
In-Reply-To: <20240813-haiku-pusher-f2fb037a2f49@wendy>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0864:EE_
x-ms-office365-filtering-correlation-id: 43711e8d-88d4-4375-dc59-08dcbd15c372
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: dzGRQBuEJVAahcmvEqPP4Q/1N7+J64hmgyPaf5P492i7veJDiJt4EFJTOQvZBzBRnu0jPIQUEqjcTZmT9fLuM8Nj0m1I1ifHQYr+Yh3tfT9FBxfeDPv9gX5mWe29mrQ9qBw8PPnxtvw0ruTHk3RCRB/Qimy0g4AGAMSMQLIE8/g1gDsSvG+n65Dt2tpxfs4WIAaNxi/w4CEIjJwBKX98tJzOka5MReGiHbgISwThjuPf4mWPEPe8NfgYz1BR9Thx2RkBZ0DhVsixNMnZ+I0KdOb8S92b+97mHJH1KDrTxLKhcTKP0MvvwsgDUkngtDQEbBqzJ3mcFEqFZBeAB5s6mg7QFu93ZFG0Kcn5lRyVJLnJGxAy7SHw6V269lzAzNAqwAf2rgPoRd/0GFtqqyiR9i6jP4PSwsdFisALcJp0AiUoCrrPLQmBGOd8tG7VgQyLJleZYeAg2Ni4cEsfJbgR5kv6BZq4WZfTtEP7NxBqwe2NbTAtOk8eDE8Ds3slOEq9LQ75QTpDYKbEO8tffgeSWMRuhisvXOZyINiL1wkFdnB24xMgfSjsnbyXbG70LqLPRuZY/c2nn3W11Ci1gJ/rIQgaO5TemBH90rYaXaqFrpVFEqS/EyFveM2OPzKXLO6i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WndoaExqcks3bjR0L205alF5WlJIWjRBbXF3b0g0Q3FvU2pRdk1RQSt5OTZY?=
 =?gb2312?B?OVFxVUtEd2E3LzBDV0NBbWVob1pqa1p0Y1VCVENnT2Y5K24yT1V1MWhvbUdw?=
 =?gb2312?B?dGx0aWc1aG5OMWF1SG9zTUMyV25qUnhLdUZXRmtmRkx0YVFRb0pnL1VJY3A1?=
 =?gb2312?B?NmV4dzRDMkRwemJMZmhwTmoxMEhvQXBTUGxiTzVocmVFL3YrL3Q5aUtGcTJF?=
 =?gb2312?B?MUpJNnZkOUcwUkRSTHhmTWJvQnI1a29Xb2p3UVZqTWlvcExPb29VQlk3R0pX?=
 =?gb2312?B?ZkRNZ1dXeldqSHgyaXRPS3BFOTc5dmM0Q1RuY0s4SE1CR2hyN1NhY0lPVVFr?=
 =?gb2312?B?ZVFSSjZvQzlzaGkrRERCMmN5VjNLejBtMUV3NktONmIxTnlLcjQyc3NKdHNQ?=
 =?gb2312?B?WG5oZ2NSclZlVUM2aUtRbjI1cnBTQmZiUmQvbFlndEhQVzJrSlVrVm1IZEMz?=
 =?gb2312?B?UnhnR1JQTXlPaExXS3Jyd2pQS0s0a05YWnZWYng0WUxXa2hxdkpNcFZ4Y0dM?=
 =?gb2312?B?UnU2bVNBT09GTHdjQVpFaXVPbTFsTEpEMzRhNStibTNQbEF2dXZQd2l3SXRK?=
 =?gb2312?B?VHczc2s4UGNaVGtwQTREQVIvaERRWmwyb2ZwZ29EU0R1SUdyVVl3VGRDQUt4?=
 =?gb2312?B?dE9ESk1UcXZDeTRqUlR6M2YyMzlUeC9vN1llUDhiai96NWNkd21aZDN6Rng2?=
 =?gb2312?B?TC94YXlFQjNuUzJ4RkNEWWJqdUltQ1pVS2hQYnBTcWVKVFRmSGc3Y0JEVTll?=
 =?gb2312?B?SkVWdHNaUFZvc1QzcW5rNlpCSndEamNmRHBwOHBVdGlDS1JKRnRwMzJnVXhj?=
 =?gb2312?B?T3hEd01Xc0hLTW5TL0tDRlVwNk0rNDMyTk1iM2ZhWnprU0x3K0NMaThXdXdZ?=
 =?gb2312?B?TEhpdS94NWVaWjhuS2t0MnBZOXc0YkxSSHNSOGlhZjNkbDViSkhrK3NZSUtF?=
 =?gb2312?B?T2tCb3JPVzhBOWVZQTJkSkJJU3JsRkdFUzljbTBsdUpzTFVHS2hESVplVlRT?=
 =?gb2312?B?QVFhSHNHT3hQam1CWTZDS2FTOEtpR2FrZGk5SkQ1OXAvSi9TMVl0WHA3VTly?=
 =?gb2312?B?bVh1WDk3NjNldm45N3RUSGFRaVN0enp5OUh4aUlaMmNVQ1Q2QzdxbHk2TzZZ?=
 =?gb2312?B?eXJuTmJTRmpXU0RPYld1Ny9mRFdtaXZCdGh2aEpYcFoyZWdGem1tTTVBL3Zy?=
 =?gb2312?B?OVpMUldSZU55OU1CdXhjM1NzdFZjRXpVaTBZVW5RMDlpSWV5dkdxL2liMlMz?=
 =?gb2312?B?cGNjTUg0aTNRamJpR092RXZqZnJQZDlsZW1OdnFMdHFXR2MrSTNmNUszZk1h?=
 =?gb2312?B?NjRGMGc1WjJWREJJQ0JVUXp1ZU5EV0p6M3JmL2NaZmkwS1REb1YxZ2FFUHht?=
 =?gb2312?B?ZjI4cFc0VzNLSDRQcm96WHN3cWxHL01DWGpvckVrRHltbTVYWk1EUytEcXd2?=
 =?gb2312?B?MDVBMmJHSjI0N2Y2Q3QydU9taUwvd2JpT1BCbmhxOUpIUkhmekh4ajk3TC81?=
 =?gb2312?B?cWg5TjhueWpKTXRvQk9iQmRxbUwxOVhmRDdHdGxiU1RtUmlEWUlyR0V1Z2FF?=
 =?gb2312?B?N3IrTEd4K0ozdkFYUytielV3SHRGM2JVNzVwVitlOEFmdzE4a3pTejdRQ2Ew?=
 =?gb2312?B?Sk5qaDlOUlc4UVJQTjlYenJtVHRnUTQ0VXJXMXZ0Q2hyUnRpMkRsL0xtVWdp?=
 =?gb2312?B?aWt2NFdCZzNkZi9UVGJYZVNtNm5qcHNiNkNtQWVmRVFXckkyWDNpckVyWGJU?=
 =?gb2312?B?YnlsQzFhTGcvRDhrZ1pBV1pTd3N4YXhVRVl6RjFJVm5kSVhDL1owMlBVcjFy?=
 =?gb2312?B?TjdxY3hOc2l3ODYwNDBNS0RUMHl6cEdYbnNBOGxlOHVsMmkwTERwZitzL1Bo?=
 =?gb2312?B?UU00R1RrNnZnVDR4QjdyeC8wNVZvTHduK1JWSFAyY1hVa1ovb2FRSTJyNXho?=
 =?gb2312?B?QUNaWDVWVWRWeGZDQi93NnlHMUZVbEVvUDFKMkluRnA1RU9yL2NJL3ZhaWxj?=
 =?gb2312?B?M2JBSlcya1BmZTBEQVpOWnJSLzUrcGdqb3NFRWJQQzZLRFQxcFAwQk1OaVF0?=
 =?gb2312?B?L0I5VUJnQWhvdkkvbmwyakYvNHUwWDNpYnE5V2VRN21qajNkTzZySGlabmo1?=
 =?gb2312?Q?fBdA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 43711e8d-88d4-4375-dc59-08dcbd15c372
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 10:33:55.0446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7spdvmdBOS/xtX5gV4jzZ4sZd3HSNm9HIVo2vLBvkj2fkw5UKsgJsyXfAhW4GQnnKEFaHqrG8h/fhrDl2b+X1gSw5+G9oiqBYJwmkJT/s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_033410_951819_AB66F84F 
X-CRM114-Status: GOOD (  29.72  )
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



> 
> On Tue, Aug 13, 2024 at 07:31:50AM +0200, Jan Kiszka wrote:
> > On 12.08.24 17:55, Conor Dooley wrote:
> > > On Mon, Aug 12, 2024 at 04:15:51PM +0200, Jan Kiszka wrote:
> > >> From: Jan Kiszka <jan.kiszka@siemens.com>
> > >>
> > >> Analogously to the PCI PHY, access to sys_syscon is needed to
> > >> connect the USB PHY to its controller.
> > >>
> > >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > >> ---
> > >> CC: Rob Herring <robh@kernel.org>
> > >> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > >> CC: Conor Dooley <conor+dt@kernel.org>
> > >> ---
> > >>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11
> +++++++++++
> > >>  1 file changed, 11 insertions(+)
> > >>
> > >> diff --git
> > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > >> l
> > >> b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > >> l index 269e9f9f12b6..eaf0050c6f17 100644
> > >> ---
> > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > >> l
> > >> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy
> > >> +++ .yaml
> > >> @@ -19,6 +19,16 @@ properties:
> > >>    "#phy-cells":
> > >>      const: 0
> > >>
> > >> +  starfive,sys-syscon:
> > >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > >> +    items:
> > >> +      - items:
> > >> +          - description: phandle to System Register Controller
> sys_syscon node.
> > >> +          - description: PHY connect offset of
> SYS_SYSCONSAIF__SYSCFG register for USB PHY.
> > >
> > > Why is having a new property for this required? The devicetree only
> > > has a single usb phy, so isn't it sufficient to look up the syscon
> > > by compatible, rather than via phandle + offset?
> > >
> >
> > I didn't design this, I just copied it from
> > starfive,jh7110-pcie-phy.yaml. As that already exists, I'm neither
> > sure we want to change that anymore nor deviate in the pattern here.
> 
> To be honest, I think some of the other users of phandle + offset on this soc were
> just copy-pasted without thinking about whether or not they were required too.
> This one seems like it should just be a lookup by compatible in the driver instead
> of by phandle. As a bonus, it will work with existing devicetrees - whereas your
> current implementation will fail to probe on systems that have the old
> devicetree, a regression for systems running with that devicetree and
> downstream firmware.
> 
> Cheers,
> Conor.
> 
Hi Conor
I know you would like to put the offset value to the code, Just set syscon in dts.
Just like pcie-starfive.c. right?

> > Jan
> >
> > >> +    description:
> > >> +      The phandle to System Register Controller syscon node and the
> PHY connect offset
> > >> +      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB
> controller.
> > >> +
> > >>    clocks:
> > >>      items:
> > >>        - description: PHY 125m
> > >> @@ -47,4 +57,5 @@ examples:
> > >>                   <&stgcrg 6>;
> > >>          clock-names = "125m", "app_125m";
> > >>          #phy-cells = <0>;
> > >> +        starfive,sys-syscon = <&sys_syscon 0x18>;
> > >>      };
> > >> --
> > >> 2.43.0
> > >>
> >
> > --
> > Siemens AG, Technology
> > Linux Expert Center
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
