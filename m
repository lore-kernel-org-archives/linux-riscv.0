Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C57CFA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 04:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCTBVWa4o3O+TFXVUW62JuwXXVObI668328mEL3zw+Y=; b=Smr0pckSxCc6RF
	nqc4rpwAnlAufUrmTSIg7TIWEv1FSvz21F0pG7wxicgPnOn0s/4vMpfLYMZXgyaDZrMA9ONsbL4iu
	Azqp/K+mZLSFRgPVwZhN0Q7eVZ16z+Ixrch7d77vy0ugVWd/xdhYzrOfBnu4HIUDLHeLuE6nASJVZ
	auu8W7kZmTFSoXgHpFEs/KsNzEHUbDUaxsky0NozIxYrnqlossthfoF4aaQg58Qwej75q+MoOWEnH
	fzm+TK0gtXbnC7pgtRYq/08nkX9I8xlpWqiZiKhPuPBh/QzAo0fEUxMxYqRWHs+PBb/eCqr4lGNIc
	y+lANurqNi2Z2+ZBoGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMIh7-00000007njY-2VQM;
	Fri, 21 Nov 2025 04:24:25 +0000
Received: from mail-sh0chn02on2102.outbound.protection.partner.outlook.cn ([139.219.146.102] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMIgm-00000007niP-1SPx
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 04:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZmNwVFrLenVEzp1Fd4y4V21glqT243ZzqMBu8FrtvxlCgQyEIt3xhzT5Ph2MTp47tMwpJKEWpcCkMeQwdyp4xAwhEySY1rSP7CleNFQyX5Q1VDEUjMZ1qEtyvfCVcLDTe3FoJqHsR2dzAbF4iMODexGBQmR/K7deAf3ifiZrHR/tBKLI4l1ZoGGC3b4NEo5wi3xbqlK5+nW9B0mU6vrOTTqMX90UnWUiIUs0U644mDGpH2pPvXYSzWScWVl28RQ84aEmHc6Hujavvavga9ulnoY5WqEmfVyLE62DpBSmlUXTq2/7V5By+8VQ/RFrxvfXtN+0dxKUg1LtCfJ79I1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4laH/J+ASu+H2l/nZ+keS8X7yEqarth+iifRg/XKQo=;
 b=Kfnh25EjWFvvj1kVcjVBBqIoj84GA0TXlft/gb1WzpGhpU1PSEImB47+sXGq3TAwOsLG+5aJ7mJQXWNjhIsuKqei65HHnP+uLFe/Jk2auAHwBJUKR5wz/36f5Q8bLBWSiF7bauEqrIQLk7VKNj+IZBR7+jUyjB3x3DEC4yc3q4WfU8wJzjLx3Rn8YU7fwsGcxAni12xDP31j+6tYlbQBVCn64nOhN/L94IY/wRiFWjFTNOpNBus37YaQmb0nUspGLOEhYYj7JV1qmlnS2cQyHWIt7H/tTDuQVnMjS00YmANdupv1KpW3pw7cPilCkFQifa291pwMta3V6M9Dn1xXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1180.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Fri, 21 Nov
 2025 04:23:35 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.024; Fri, 21 Nov 2025
 04:23:35 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/5] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
Thread-Topic: [PATCH v3 1/5] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
Thread-Index: AQHcWffZZq7M6stxzk+m/AvQeD+fAbT7hT2AgADmvhA=
Date: Fri, 21 Nov 2025 04:23:35 +0000
Message-ID: <ZQ2PR01MB1307A802B916620235B87518E6D52@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-2-hal.feng@starfivetech.com>
 <xxswzi4v6gpuqbe3cczj2yjmprhvln26fl5ligsp5vkiogrnwk@hpifxivaps6j>
In-Reply-To: <xxswzi4v6gpuqbe3cczj2yjmprhvln26fl5ligsp5vkiogrnwk@hpifxivaps6j>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1180:EE_
x-ms-office365-filtering-correlation-id: d2e44f9d-42a5-4789-36ba-08de28b5bcc1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: PzdqPgUF8naRPMlfDOmhQYnvFgeuigAvG6yYOQMVb6yrwH9BNEBltEgvb1OsoAYI6u4HRbxsPVZleQ3dnUFRIijHPSlmfhe/ko5P3CIwkUU1DDrLFJeYJ7/pu1KXzF24Rix/aZqvfgmNuZNfjFJM5vXuZ7BdvNYBYv8uyQ267U6QtRfXtF7mrkXKNPcq7ZkZzFP05JQNh7Dwzw0SsN7332AgD/V7glHY+QIidgUwwsji3DhwWZ/NCx4+tN9z5X9ZnuQfIrlTfHseY62pLNx69v2HQTval1KXp17mCt0q0+oymqQuOe1WVWtC/86+olIOngyJhJhenFQ0LWN855itKpEPk5y7aLpVSJnti5uFfWW0pV/vGgqb4cdQTyO+1t2JF0xDAGohiJ7u/n5G+R8QbXjB75ZX3+D5csQW8LcyKAUhUSNIZelr56VitLBHcCqq/gyi56FpMbXBSOMOu7QWuYtVCnxwkuvJAP9hTk5zPBdsf5k9DNXVes4nhHUDiFFPlS2F5RN3pKb0FEhpL3JwiEX2tUllcV5IZRIgX/IK2eA1ovHrWpwgLV0aRA6L/2MbeXx6ZN0/gjAsbinrd+tSAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnZ6WWFkRy9lT2haQXhNYnVyT2ZoWWFQZGluRmwzbVI2WlFqNEU5K2pjOERu?=
 =?utf-8?B?Ylk5aWhoRlJMcE1kZ0g3bmIrNnpPOXN1bzFIT2ZDU0J6WWtmT1M2ODBvdE5M?=
 =?utf-8?B?bTFWMlh2OWRIRjIyVXpYRkx3dTIzK3JQS0ZZRFBZVTFDYUNzaFFjK0JBY3ZS?=
 =?utf-8?B?YlZBU0NtdVcybmhRVUZESE1JaGRMY01rYS9CUmQ0Q3hMWVlCSlFVZ3BRRjBY?=
 =?utf-8?B?VDRyUStqVE1oeW82b1dmS3dNZXVlZWU3ZWtxNXFkNUZGYU05am9GN1ByelBx?=
 =?utf-8?B?L1ErSTVBMmZUQlhIV2U4aEpLK2VqaWRNTjU3cWlCNC83bzZ5NzJmUFVXb3JD?=
 =?utf-8?B?aDVYMCt6NnVzK25rdmRkTEZ4TjhRcVUrYUoxcU5SaitRVWg2VG1RMHRKOUVq?=
 =?utf-8?B?SFowVlEwcFFoZnd3NVJFMStobE1HajNDNUlteVVQcTFzU1d6MkJVZDhDS3RN?=
 =?utf-8?B?azZ1Q3dmRnBCaDNnMlg1UHAwL0s2bXppV0tjaEhxUkJVakljdUlTRTBDUU5D?=
 =?utf-8?B?MDJtL2RMVkpIbEZjS3dpQXBLTUFTWW1LZG5KZkxrOHNOcUFWaklDZ0xubm1Z?=
 =?utf-8?B?NVdGMjVsOXRTZFBqbWpKdWdBN3BoeWJ0U2VRQmhiU25zSVBKUkhzdE00bTZn?=
 =?utf-8?B?K0dlUW9KTWhTWkZzNm41dVdQS2grc2pRYmtDZWZqSHR4NEt2bkNzTFlJdjJS?=
 =?utf-8?B?MG0rNE5zYlZNZEgzMzQ5dWVXcVErbk9lOXhsdWo4dkI3WTloUDJ1bXd3TXpi?=
 =?utf-8?B?OHlvckd2QlYyS3lrUWlUNnN3ekdOM0VuZENhb0VWTEFzdzB6TDMrMDdYb05y?=
 =?utf-8?B?bXJrallQWDhaVjNTSWl0S3g2MmNqUDVrU3F5MXRha1hlL3hTbHNiUkZlM3hr?=
 =?utf-8?B?MndhV1h5UzdxZ1ZZMHRsQnM0Y0pTRDNmT0s4UHBjQlhEQTFaTmMvWjRvSzMr?=
 =?utf-8?B?UFRqS3QyYWlwWGliWlNSTW0wWStYQkN1ZDEwS2Ixd2t4WkE2a01YaGFMVVkr?=
 =?utf-8?B?SC8zelpIRkJVT3N2VW1hYVdxblVXU0pJNDc1SFEzWEppQitPRFBxais1VXJn?=
 =?utf-8?B?Y3FDdWZQUS9rT2xsTXNsNWpBeWd0QmJxWEdTMGxvK0ZuaU5SUjMrQmswM3NG?=
 =?utf-8?B?RGp4UlZnYUVIaE1HTDVsdXk0U2hUYTRTR2R4dUFibEFKTDhveVkvVmo3OGpR?=
 =?utf-8?B?RVJpRkZxNUZtUk0vaENLL1VWSng4WWxEU050M0ptWUFkSVJNUTZLSC8yRWhK?=
 =?utf-8?B?YmpKaUozenFWUGtVZUZubk1zbzM5OFgwMjRTVGJIcE5TMC9qa0pxekhQNEhB?=
 =?utf-8?B?N2FnZ3pGWlVTemdadm9SL1loWmZzYU9xaCt4VWgxZ0x5U3YyUjRSTU0wMll0?=
 =?utf-8?B?Q28zcjVwU2RaM3ovY1AvQjNYRGZIN3BOTU90MUxEc0tJWEFDU3h3WGJZaVhH?=
 =?utf-8?B?bk9jUXBpSS81VTQ0UVJYZVE0M3NwSVVRWTJWdHY2bW5kRzNIYS9reTZ5WlZM?=
 =?utf-8?B?bmNROFE0M2M4VzkxNWdnMTdtN2Z2d0FhdHhVRFhNQWFMZkR1OWZneENqTFVV?=
 =?utf-8?B?YXJOWllLeXBQbjhqa3V5OFJ3Z3lncWpLS3JOUlVHcTFLU0gxRFZQenp3NVVt?=
 =?utf-8?B?SDg3aW0rd1QwU2lpdmh1alRQL0dXUEtZa1Zvd2JZWE8wb3FyUnptV3JKOWRq?=
 =?utf-8?B?ODczYk82dzQ4Z3Q1ZlV2UGRWcnAyamVrYndOK0JFVk12QlFNaVdoall5Z0lz?=
 =?utf-8?B?bFVsOElKMUxnb0R0aVJneTE1blFtOWVHNEp6VEMyR2FiWWZxRC8wUnR6cFJN?=
 =?utf-8?B?QzBRY1lhYkxrb05Ya2JndVNsQWJSWE50M3gwZzY2bm03YjlMQjltZ3RqbUVw?=
 =?utf-8?B?ajNRSW81SUVwRk9XZkJ5RTJDTWxtQkI0MXBvREpyTk8waFR1RjBVMGdzRDJZ?=
 =?utf-8?B?WFZwUzFQSkpXWlRaSkRnbXF5WVlVeWpCMU40N0c1WEFEVTF4eGx0Y2tTVjNv?=
 =?utf-8?B?eGhvSVBhNnJqM2pYTXhiR1lrWTVsWkt6NzRNVTBTY0ozTFFhMUg3cDBtcDY3?=
 =?utf-8?B?SFVZWEduZlNkY2RmLzhhVFAxNE5IODRMQ1RmbzY5YWFsZWVLbmNKNGVIbkV6?=
 =?utf-8?Q?4y+F6yxCXRHM+WBZ211D56dik?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e44f9d-42a5-4789-36ba-08de28b5bcc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 04:23:35.3749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZQylKsTAy+cd/s89xMHos+pBVHhLVt2+8YcPTMvlACDg5GtdqSO+We/9zn5kRUpA3F5wL4L7n4IWK02X+7/4/lWDDnhsQPc1q6P/0ijeFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_202404_413015_8D71F81E 
X-CRM114-Status: GOOD (  20.19  )
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

> On 12.11.25 21:54, Manivannan Sadhasivam wrote:
> On Thu, Nov 20, 2025 at 04:29:42PM +0800, Hal Feng wrote:
> > Add enable-gpios property for controlling the PCI bus device power.
> > This property had been supported in the driver but not added in the
> > dt-bindings.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Fixes: 22fe32239770 ("dt-bindings: PCI: Add StarFive JH7110 PCIe
> > controller")
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml         | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > index 33c80626e8ec..1e36f92ec852 100644
> > --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > @@ -59,6 +59,10 @@ properties:
> >      description:
> >        The phandle to System Register Controller syscon node.
> >
> > +  enable-gpios:
> > +    description: GPIO used to enable the PCI bus device power
> 
> This feels wrong to me. Is this GPIO associated with the PCIe controller? I bet
> this is just controlling some regulator that powers the VDD of the PCIe
> device/slot. If so, this should be added as a part of the regulator node and
> referenced in the PCIe node using the existing -supply properties.

This GPIO just controls the power of PCIe devices, not PCIe controller.
I think there may be no design adding power control GPIOs for the PCIe controller,
because usually we don't need to control the PCIe controller power but the PCIe
device power.

I find a similar "pwren-gpios" in
Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml .
It uses the GPIO to control the power of PCIe devices too.

Could I continue to do so? Thanks.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
