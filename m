Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1D8C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+aSkF/xdKcfmOHfsAPCP0cqdWYwBGMXX4UWr2pw9cA=; b=jAIDrR0xPdFMEU
	Wjkv157Y0Bj2vMCxU/w3b3IsH3+JMS1HO6qpOWkV8h57iiv9KKzASUeNKGRbsFHglqwhDQbNaQQN0
	P3kE2n/tJOCslwCkqTsVRNVsOeaq9L9VNmSmwRx/1jzw/xay2hCACKZoFlcAuqmHFU4LzqQ3c8ygM
	uZp71DZHkbpnO8fodz7RnhwcfEwJ/1aGz3eIeYlz+sT/HrTIk8O/l51TwCPdC867zIT4KywcKdutA
	fQX7FslzKdFPab7edUgjwCLUYuBA3b9Ks00GcLFkRiJuSmH457i9AbqnDVRWNdlyuJtDEP69FEt00
	ut2ivaaAgr+vjonSE5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYD1-00000009z4Z-3Ad1;
	Wed, 22 Jan 2025 10:43:43 +0000
Received: from mail-bjschn02on20728.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::728] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taYBL-00000009ymr-44lC
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 10:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+fYDuu9l91X4eprnvc23IeX/N7LYnMT2/jh7t8O1P0ERVXqz7xa18gqUZr/hIBcIvaQ0Glf43Hni8ygRyb8uI7C0YHqK6HJFpZTd/vnw/tGptS1qQb+nMiUwsCHGKHOnyOIgXyX5UviqWhiLetiXJ/pGfk56+yiZqrHlcp7Ljz9dqJENbLgbmNCLibHmFbU1oFhj6ugwKH1csLNeEy9WoHDedDtGLxLRbl6DN8JXgIA0/jvUOM7gk1VduEAPOEathPFjlGSHFx/ClCem+RrX4Qfhb56tO1WeTWe+AbmJsbUKA5Hw/Zv7JczluzrloMRNIOX9glD9/AI/fW4FO8mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9TXrGQIUlcUP6dfyFiTfiAJIkXCv6LFPKyhP1s9QBY=;
 b=PtEgBZwEUi48QTiqW1MA5esKsBBi1jW5QDhPfkhTKS86NAfN8nK7zKlK2OjMQ6XHCLPxq9df81JE8A5QqqVDl9+DlfHKBtKInJTEVKNuOWFYT5KGChtX1/EsE33uErNGn5EECMcndPKv2IVRKdQ8Yxh/SLSXO9oczepe8687oPO9yGxwmMtGAeYL2LIATS3AX0fpZMDjXfvjCsztptFajTs5rt7tcIJnpb5Kxa3pTfGZg5nJah7pmCbyIcl1REAW6YFlMjsVYf6V5TPldLKrzuOvqaNHlc9p64bx2CKAtQ94Skt+4LIcrwKnzBCWnb91maI8+j6BusrcldkgHKL7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0854.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:19::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Wed, 22 Jan
 2025 10:41:35 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9]) by BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9%5]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 10:41:34 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Topic: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Index: AQHbZessMJgcIL10+UmGw9zpa2rChbMVwlmQgADRYoCAARlKYIADWKIAgAei6jA=
Date: Wed, 22 Jan 2025 10:41:34 +0000
Message-ID: <BJXPR01MB08553280FF7E342451053A6FE6E1A@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20250114-recollect-dictate-104e890d116e@spud>
 <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <dd3aefec-0e1a-4025-812b-daa67a53f4ee@freeshell.de>
In-Reply-To: <dd3aefec-0e1a-4025-812b-daa67a53f4ee@freeshell.de>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0854:EE_
x-ms-office365-filtering-correlation-id: f6debd74-f880-4c04-a8fc-08dd3ad15790
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|41320700013|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: rx0ORIaFVG7b1nc2oGm9Q82f/Nyfp1pX07f1ZuGIEratC4z//4r6x0Ea+iVCB0D8hz7BThbutxPQLPbtX1sBjKEEPB2FDO0TajeYJGbXtPnPb7yKF9Lp58C31hIVx8atO/iNNr1N0gLBcEcBqkyt0x87EfBBWs36u53GFFVkQlcUi3xKr84QF0Fz3GfQb7C5eiWovxtEcAmFwg2YFep2mZ95atm50t0AIJUY0pejF7WjkfbcPcxwYZ4HDWlxr4KQUYQn0uSxIjh05jtJS8GfgGmCinuSuRQ5Uj56qm/6vd+U3uUqFmlORppSNBov4Q3dLb/G72f+uHivb4CoFhPCy0A0cjf+0EFH49QZwXGy6j2aEVoS8J5NFUd869W5epw3V4JUFpwbvZAX9gQUHxBhJUZqeU+mVsZg82zo0qkXRTrmF5l3g1QUcnapFBEUTl7sn3V9X6c50IyNingySOjXLxj9X2lr+Yft7X6fVwsD8HrOOIg2VItr1bnln7Nr34mRYgr/aC2v6n698xHh7woQ5QV33DF64KqhNhMiSrHwFhctv+4ej4D9BIbQaPLfgUSAwSCUyDeOOzqThKNsi01CdWCIjITql40tjCqE8KVYwaY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWxLcm5WNDVONkRXekxoWDhwWjkrL2l5cFlKdnUzK1h3dUp1SVM0NkhjVUY1?=
 =?utf-8?B?L2hVWWhPRWNMRHdmUzdxTDN4Z2UxWFdDNGlvdjVBaS9Vai9IWHJubHRFTlpr?=
 =?utf-8?B?ckdpRWpoQmtLZzJ2ZGJnd21aVFBWN1l5SFVtUFRyYzRUd1dpeGdoa3BkMHdl?=
 =?utf-8?B?OTMwUlliTEJvaFFmMkQvWTlJT254VC9YckI2cEl5OEI3Sm1lU2pRQ2pxZVFG?=
 =?utf-8?B?MFR2ejBpbTkrak5iYldNcHYyYVhyMHMxclc0aE85MGlMa1hHeDhYSGRGcTN4?=
 =?utf-8?B?L3lCS2swK1VBcVVHMnRKRjYvUk4xUkhUZnhGUnVNUWFMUkM2bmtlaGtvcUxo?=
 =?utf-8?B?bWg3cklrMFp3eE9RcTNiaExMNHh6MTNBRm9td0Ivd1BYOFk0Yk9KeFQzT00r?=
 =?utf-8?B?aUFvRmlEYnphNnFjM3FVSERvWkhaTXZuc1VrdmdFOUE3UWlJQytZbVB1NVJV?=
 =?utf-8?B?WjJzZkxXNGpKc0x4Kzk3aUxRMmFLd0llUVBxdy9vcUxqbDd3cGVZZVo5Yk5Q?=
 =?utf-8?B?ZDNQWWtuWnFSTERWVlBMdm9BZDR0dFprSEZTV2Jncm4wN21ZZjExMytXOTJs?=
 =?utf-8?B?K0VwQmovdEV4T2J2RWRHdG1tcUkxbE9oYngwTDVwUlBlVmJXQnhXRnNhTGRM?=
 =?utf-8?B?bTduVVlURzhSZ2w4bis4WDh2d1RCamlzaG5sd0duL1NnV0tVSUJLaXYvZXNa?=
 =?utf-8?B?c3pLcGNOdis4UkZSK1F1aXM3YS9aUVUrbjNPTDY2cWJpa1pUU1R0eU5MRERQ?=
 =?utf-8?B?MHEvUnFmdEpibnVWSjRsTTRDOGtHTlRXZHNSNWJvZG15QlZjeldTWFUrVmVj?=
 =?utf-8?B?d0JDaWxXOHl2d0RNVUEvZHEwRmQyZVUrL1pxN3krRUM1MmFTeVR4QjR0WXg2?=
 =?utf-8?B?NVJOWklzZkNoRU5SODBOeU02dEUzbzJ2OGsvbkNjVWorVGRTYUpmN0lCVmxR?=
 =?utf-8?B?R0l1ZDFaUFdTaU1KQkJ3NEJDcFIvRzRpQUoreWVORXZqZVJiWWc1Uitzb3Y2?=
 =?utf-8?B?aHZmb2VuS2JNZFR2eVFZRW9wQ0dORkwwRC9ia0oxMVppQms3NURPYmZjRGhO?=
 =?utf-8?B?emJEQWU1K1ExeHZCNUpBczVWZElmNGdUS3VlL2xJVDJEUjJ3V2NYWWZzN2hm?=
 =?utf-8?B?d2Y0eFZwNFZRTkJCSDhIMlVDdUQzQWhWd3RsUHMwbXdWY0Y3eEtHL0FqQzNS?=
 =?utf-8?B?cjdib1NhY2ZiMGFQMGhOM1dXOVFWdmNDQUVYbHFvWVNua0tNR1hEdjR3eU5l?=
 =?utf-8?B?a2NLcUFibWNqVkd0VjF6cVRzQTEwREJ4UVhJS3F0amxYNGxnSm9JNU04VHIy?=
 =?utf-8?B?RE02RGcyTEovaWFaSWRtMUwxbnJXQS96QkFKVW1McXRMeUVmakZqTCtScFps?=
 =?utf-8?B?Unl1RVowTEVDV21PcEgzcU5aeTBCZEYvYUgzdkhLRVUxTTVYeCt4NkpyL0h6?=
 =?utf-8?B?QWdHdkNCNm5xbzhSSWFvMVRnNVF2c04wUkFMcU13aTFvSHBqN3ZJQndZNUs3?=
 =?utf-8?B?L1F6N2pGOGN5VGFsNDN6czlMOUJIY3NwcW5xMlh5Umx1ZEtudFhjZUF1S1g1?=
 =?utf-8?B?aFdqVVozeFpRSVgwS3Q3SEp4R0tCZGRvTFdNRDhuL2RWSk0vSTR0dmJCalNw?=
 =?utf-8?B?V1ZsSzYrdWs5Y2M1S1VGcGhSMzlhZy9IYW5LSWhLNkwxdjlaNytmZCtxS2xw?=
 =?utf-8?B?aTBzVlQxWXZYQ0lXOHcrbGdPK0lkWG0yZldtbGF3TTBPV3BKZlc1aW5qQmpN?=
 =?utf-8?B?TDdTK1oyY2lIQmVONlJWY0g1ZVh6NHM2NStSUDdiWml0M2dqRTZ6eDNBby9D?=
 =?utf-8?B?Q3lGdkZsbnVoeEFwNnB2c0ZUVnBYMkwrODhIUzdBSWxyTms0enp5QUl0a2pt?=
 =?utf-8?B?K211ZEhxNytnalI5SXFaMU9qMDdyUkdVZk1raTFabmRPSjBPSWg5V0xueE5t?=
 =?utf-8?B?YmZuOWlQQXZ4aVFrczBjMU40L0QvSEJoTlY5RnhlR0ErREYvUmlEV0dkaVRx?=
 =?utf-8?B?VmNwV0Jha3ZRV2JEK0Era2sxczUvejNVbjBzR0FwZWpoaVlRVXlnN1ZCTk51?=
 =?utf-8?B?Y3NsN2FiNXd1S1FZS25nZ2lLMWtrcjBidFM0SjIyMnpjaUlMUW96RTlZSXF0?=
 =?utf-8?B?NjJRMFBtUW9XaWIxWE9aK2FvOHAwdHNiaWJmc3V0ZWFqY0pocUtXT2phVHNR?=
 =?utf-8?B?Rnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: f6debd74-f880-4c04-a8fc-08dd3ad15790
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:41:34.8006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZ5DoGfg60Qp/oE7GolU+kr/+Fds8kuKwRZmsC5tsZ5z9jAeU+VR7f52nTNQ5GrIVD3PxsIfBbxjEFSJVgx3+Zzy6fylE8MCa4mCgsID/MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_024200_013028_7F091384 
X-CRM114-Status: GOOD (  32.63  )
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
> Hi Minda,
> 
> On 1/15/25 02:58, Minda Chen wrote:
> >
> >
> >>
> >> On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
> >>>
> >>>
> >>>>
> >>>> On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> >>>>> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
> >>>>> block that may exclusively use pciephy0 for USB3.0 connectivity.
> >>>>> Add the register offsets for the driver to enable/disable USB3.0
> >>>>> on
> >> pciephy0.
> >>>>>
> >>>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>>> ---
> >>>>>   arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> >>>>>   1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>> index 0d8339357bad..75ff07303e8b 100644
> >>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> >>>>>   		pciephy0: phy@10210000 {
> >>>>>   			compatible = "starfive,jh7110-pcie-phy";
> >>>>>   			reg = <0x0 0x10210000 0x0 0x10000>;
> >>>>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> >>>>> +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
> >>>>
> >>>> Why weren't these added in the first place? Minda, do you know?
> >>>>
> >>> The driver only require to set syscon register while the PHY attach
> >>> to Cadence USB.(star64 board case) The PHY default attach to PCIe0,
> >>> VF2 board
> >> do not set any setting. So I don't set it.
> >>
> >> Does this mean that the change should be made in files where it will
> >> only affect
> >> non-VF2 boards, or is it harmless if applied to the VF2 also?
> > Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.
> 
> Sounds good to me. However some tangent topic related to this series:
> 
> Our questions and answers in this discussion are a representation of what is
> missing from the documentation.
> 
> What do I want to know? :  "pdrstn split sw usbpipe plugen" abbreviation.
> 
> What are the full words that is from?
> 
> I will guess the words are:
> 
> "Power domain reset negative? Split... Switch? USB pipeline plug enable?"
> 
> When this is explained for me I will send a patch to add information into
> documentation at dt-bindings/phy/starfive,jh7110-pcie-phy.yaml
> file. I know that the functionality is already said in discussion;  What I want are
> the full words to expand the "pdrstn split sw usbpipe plugen"
> as any abbreviation would also be expanded and explained in documentation.
> 
> It would be difficult to improve the documentation before our discussion about
> this series here. Now it is clear what questions and answers are missing from
> documentation.
> 
> -E
In my view, pdrstn split sw usbpipe is bit17 setting. Set to 1 is mean split the PCIe PHY from
Cadence USB controller.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
