Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6C0C47073
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6pQv+MEdBBd9xpcJ/EFgXypTQ59XfAUrG0eaMPLtnA=; b=xpfbVeT3jKgbeB
	U0FMn+1wtePbxTTj80wyV8/CUIfZfDRPVj5JnjzN3lzqSoRH56sbZyRBRSB/ptiOUZlEshOZZrcFY
	4/5hXQcdVKl47lmhlUib4ZQNknkvoXmGLcmVgstJdHI3VI4k2GRCDulpvP0QHghvXbsKi3EodlJAx
	oJeo8l3QdAHoF8BfCWyh1WuIL8YvxLIlhuqhOnm/dNsuM+xypXlqBBHk+kxjLJO80h041mN+GSjJs
	y/oKsuVzORF76dsjxBXt4MLbCHNQWvfQcKbwUCwezVrtIqxnKL4P6Z7FRfR74qmuYFLZUWj5prcZ3
	DTVCZy7JX0fqshJwaLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLa3X-00FmwP-1N;
	Fri, 05 Jan 2024 02:35:31 +0000
Received: from mail-bjschn02on20610.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::610] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLa3T-00Fmvg-2i
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 02:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LABp2Xd8JFXjhBWoVLQVtpZmBrmzBAtPTFoOWTW3DOtkz3rTxFv56pRoBN3xDlxbE4kEiZ6OZN8ylznwblOATKoptMAOXXWsjmvA98b6N5vcdOB6Go4Tba58HNuBbPFO3jQiZOb5qFJZvt7Ms+8DKR7p3HiK14jq9Io7iCpMwNtlJR374YA/DoyfhKcLMxBzS330DotQT2VRYmb8G9CajVIOgJAFoTnAlswFRBXIjUf4ycvpeZ9QGOh9VCD5Ih1/LdY+6RSVI6SXW+3XbYd+6KST26tXzY/A3nGg/4VrIcxU78y9A7BykAhU2oq1tI9fFa6KBpg160VJbANVLOoRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxmeZJF60lnX5RnKDVwlgUX0Ere9i+J3XylcRcaC1Mc=;
 b=ESdbdyR41eKcDEaoSoxNv/t/MfZRYxoHtk/ZzwPPVTb6T4hbPYPjM28dE6hBXZAUhYy1l77XWC8tUcfXXLNoGe9vG4zAaXBCBBtzqT9o89SVFWyKGP4u+FoHx3e7YTJAKHxr1a0vsSvUgCacVldJ3XDoxrOAQoWwm6MtlkYr14f8Xu/T/C7yD/2WHNspSlgf2TYiJH7l63ThrnG0/411GyLyp8hex0GZHWf23N4NiXErwfLoznpqWGm3K/l/31eyRz6NdbkZf78NC0f7kelgYSQGJMd9BW28l9d2j3a+v29URN31XoqtVJrmKWfUUdCLOyacr3N9/puiE7jTiqXnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::13) by ZQ0PR01MB1222.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.27; Fri, 5 Jan
 2024 02:35:10 +0000
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 ([fe80::4583:3e2:da11:265e]) by ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 ([fe80::4583:3e2:da11:265e%6]) with mapi id 15.20.7135.013; Fri, 5 Jan 2024
 02:35:10 +0000
From: Kevin Xie <kevin.xie@starfivetech.com>
To: Kevin Hilman <khilman@baylibre.com>, Minda Chen
	<minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	=?gb2312?B?S3J6eXN6dG9mIFdpbGN6eai9c2tp?= <kw@linux.com>, Rob Herring
	<robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYxMyAwLzIxXSBSZWZhY3RvcmluZyBNaWNyb2NoaXAg?=
 =?gb2312?Q?PCIe_driver_and_add_StarFive_PCIe?=
Thread-Topic: [PATCH v13 0/21] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Thread-Index: AQHaPpXiMe+t6/O8C0OnZGJ4Y32LtrDKgdAQ
Date: Fri, 5 Jan 2024 02:35:10 +0000
Message-ID: <ZQ0PR01MB098128579D86207B4B9BA7D28266A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <7hfrzeavmj.fsf@baylibre.com>
In-Reply-To: <7hfrzeavmj.fsf@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB0981:EE_|ZQ0PR01MB1222:EE_
x-ms-office365-filtering-correlation-id: 080d11ca-2a84-44e3-88ea-08dc0d96f03f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 10Er+8cBEExcgmcApRf21maOJZ/Crw6wAugR2L6mo0p0zIrJw5hqsB8nLCfJ+egqxIj7+vvr3LY6EujoIloaN7rMeAaeWNMspXVl4ZYSWt10U9oJTCMEwbeHy4D5KCGK2bi21l7BN1eFbiD8stF6mEzH5Wxemmrek47sOQisA67hFX/BkVHKT91M2K4MElewwAaxXJ+UX541gaUtZBQOx0Jv0nJsdpJXsQkhywvvjQnKAP4aNOvL4PVahMdjWetGJn3cqLuGYuoJqTgYh3ZakWs9QuT2uXLR7v32R9Mpr5TBn1K7/LXzuVbKqca5kEBkA5RIl4nVxL8GZfT2yRIy4xGV0oCvp9Y3li7GwHkMn5it9ECe7Nt6jGt3+O5Y68e6lYJNJNqxDXUahkvSpRgkRB5ybus+15wGWlf3dELvtm4BSxHO9EmmovEBz7kJf7X/SX0kOvYQyu0ztqHJ48c8xRziKZ/W8Uuds6faCxD+Og/B8bW0BwKo87h5XX2zeG8QOU712sIZjUy7mqE35OqiZ5wan5+UK5OtOj3ynkxmmyYDDzSh4mm8uu7KEsHID/fv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(508600001)(2906002)(40180700001)(44832011)(5660300002)(7416002)(921011)(122000001)(40160700002)(33656002)(38100700002)(55016003)(4326008)(8936002)(7696005)(224303003)(66446008)(38070700009)(66476007)(76116006)(66946007)(9686003)(71200400001)(54906003)(64756008)(110136005)(66556008)(26005)(41300700001)(86362001)(83380400001)(107886003)(41320700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?MkVIR1huZm03b0VFTXdHVGpEcStjUjFkQnBsRnRXYjdKM1E4V0RoOE5PVVgr?=
 =?gb2312?B?cER5d2VlNmpVN2VWTE9LbUVlb0J2VDQ2M1JqTkNpaHlnNGV6Nkg4RUxxVnpL?=
 =?gb2312?B?UGdSdHV5YlpsaDZqSHg0MnN2UjA5a0RNRS9IWnR5emFXb1Z0bWU5SjFFV0w0?=
 =?gb2312?B?WTRYRW40OVVnVnhkQ1hNS3hvb1lxKzNWMURsdDBiNEVqS3RTNXdoQ2tOemtT?=
 =?gb2312?B?c1VLN0x5Vm9jNzdKaW5FTHhLa1NBWko3NmFhNjJoanQvdVRWamp3SmZCNW5z?=
 =?gb2312?B?Q2FsRHFwdE9leThGenVGem5JQ3F0M1loU2xxVTk0REN0Rng0L0tiOCtLT2pz?=
 =?gb2312?B?a0Y0ZzlpMkNjN2ljVjRMTnQrVCszaURTRW1TSDhEMWU4NFM2c00yVU40S2hG?=
 =?gb2312?B?alpJNW8ya2c5SU5LVnZDc09McVVqVTlUcHE4RTljZW9ldHVJWVBBcGVVbzZo?=
 =?gb2312?B?bW9EZmg1c1JULzVodU9Yb0xBZnZuMUFoVVJEV2JJR0NpY1l1R3p2ZEVsdGlp?=
 =?gb2312?B?YkVHRjRJSGE2OGVpR2xSM1FTZitpaHNBZXR1Q3I4VWtlcWxYV09FQlRuais5?=
 =?gb2312?B?OHkzVW56Q05ERjVSV2JkMUtMSzFXZzhPaXM0cHQzWHpWZWRtcFgwRWFvbUZi?=
 =?gb2312?B?UDlCMzNoWEErRHNkZzRjVVNCZFh5bGx5aERQeGo4VktkMHZ0WDZWZStFR3JO?=
 =?gb2312?B?Rmo1SENKVjR1eDBCRmdDakN6bDQ3VG1uNHhyV3c1dFVhV2V1M0tRbWh3ZWt5?=
 =?gb2312?B?NDBnYW5sQ3FZZTdyd3BEM2lCUHFTZldUYTQyUE1lRTJaRUE1ZGNBQlAxeEZN?=
 =?gb2312?B?S2k5ZUZyMWZTN3o3UmhlQmx2eUFQTXZCeC9vWXlRelhQUTFvUHZzU2wvMjBG?=
 =?gb2312?B?TFJTNXpBZzhkT2tERlJSNGVlMk1BVGRtY2ZBZjNJaElhTVhuVkN1ZnpMQnBH?=
 =?gb2312?B?eGVIOWh2M1JobzBySk5qUHZ1bXhNVEE4ait5L0xvb2J1bys2SlIrMjA1UGNC?=
 =?gb2312?B?RTBPWlNBZnRESlFpSHNwNjZwZXdWR0pKajlwbCtVYVprQUJnbjM1eW9pZFkz?=
 =?gb2312?B?VmdlM2p3MUJ5dzgrM1dHeko1VjNyQnhxTndyWmIxNE9sQ0xnOEN1TDg5OHN5?=
 =?gb2312?B?cHV4M3Z2eFJkNGZBY2svNjloWnNGTFhHTVVEWWY5RTNHUFcyMlNoNGRUQk9D?=
 =?gb2312?B?TGhJTGlUMW9OQUdYUGxITHVlMStqdjBxMFJhcmVqbFZoV0VuaHROQnloZ1JS?=
 =?gb2312?B?TFYrYm8vbXAvQkU3VmlwSzNZSk9YSGo1ZkVnS0lVWHlIa2dUMzBlTlZ6NlVG?=
 =?gb2312?B?eDNBOWZXcUorZUsrSzlwWnJYSUxmM2x2ODFEVGNZcXV1d1pTVHg3MU8vWUo0?=
 =?gb2312?B?ZkNwZnJEMzk4K3lQb2Y1MkdqMjV4VFc5cVZvbGFUbEI0UmJuSW9zVjN3ZCtX?=
 =?gb2312?B?SVVVd21vMUxNckVWdUxXN3VuK01TY21DQUNWTzJCT0lTUjFMMWljSEp0Ui9D?=
 =?gb2312?B?N3pNR2xoR1dRTVZWb25tTEFoT3FCcUg5ZXNVdERvTTJsa3lmN1cySU8zamxO?=
 =?gb2312?B?T0hmR1dGVmhsVjNQWVJmZFdzK3h3Z3ZwZjJ3Rm9mRUF5N3Y3VXhXRDBBSnFJ?=
 =?gb2312?B?eXBzcXhDQ0JVSEE0anRSd0RFclNhSksxdDladHNGY1lHaDVMZktUSkRzeUpQ?=
 =?gb2312?B?dW9nNC9KTlhNVk11NzZRbGZoaVF0Z0JwWDEydXFncjRHUTV1Z0U2dm9wNHZI?=
 =?gb2312?B?S295SllPTXE1bll5NW1vMEhZSTlPSHRuM3IrZHBJbkxKV3laS0hMOUE4d0g1?=
 =?gb2312?B?WTVXcnlOUkM3TG5zMXE0b0RkMEwwMm9vUWxZdWh1dVhuSkNIajk4L3lMNm5r?=
 =?gb2312?B?b1NQRGpaOWZISnNINVJ3ME8zZ2hHUkpNd1d4SjNiL2k2ck5PTWNUTklESzhB?=
 =?gb2312?B?V1BHSk16RXdsZy9qNjhnRTRFVExsNFlvVCtUdlcvN1o4LzFhRnFKVzNnd0hR?=
 =?gb2312?B?Y3NIc1F0MkhaSnZQTnpYZzE5a0E1cWdpdDFJTlYxVDdFOTlWN2RYditUUFFh?=
 =?gb2312?Q?E5NpbJ?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 080d11ca-2a84-44e3-88ea-08dc0d96f03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 02:35:10.6310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VuW/hQSaTVCShMEefGwO+JscG0WbVMEKYx08f3G0Iwx6Y6sEDx5EJOLThoFx20ErRHNbvG33xkw91Mhsl69tgYSNLNY/tWKD0tWqid/srRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_183527_905736_11501656 
X-CRM114-Status: GOOD (  11.33  )
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

> Minda Chen <minda.chen@starfivetech.com> writes:
> 
> > This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> > JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> > same IP and have commit their codes, which are mixed with PLDA
> > controller codes and Microchip platform codes.
> 
> Thank you for this series.
> 
> I tested this on a VisionFive v2 board, and it seems to probe and find my
> M.2 NVMe SSD, but then gets timeouts when trying to use the NVMe (e.g.
> 'blkid' command)
> 

Hi, Kevin:
Could you please provide the manufacturer and model of the M.2 NVMe SSD
you tested?

> Kernel logs below.
> 
> Kevin
> 
> [   15.131094] pcie-starfive 9c0000000.pcie: host bridge
> /soc/pcie@9c0000000 ranges:
> [   15.138637] pcie-starfive 9c0000000.pcie:      MEM
> 0x0038000000..0x003fffffff -> 0x0038000000
> [   15.147180] pcie-starfive 9c0000000.pcie:      MEM
> 0x0980000000..0x09bfffffff -> 0x0980000000
> [   15.368040] pcie-starfive 9c0000000.pcie: port link up
> [   15.374219] pcie-starfive 9c0000000.pcie: PCI host bridge to bus 0001:00
> [   15.380944] pci_bus 0001:00: root bus resource [bus 00-ff]
> [   15.386443] pci_bus 0001:00: root bus resource [mem
> 0x38000000-0x3fffffff]
> [   15.393330] pci_bus 0001:00: root bus resource [mem
> 0x980000000-0x9bfffffff pref]
> [   15.400882] pci 0001:00:00.0: [1556:1111] type 01 class 0x060400
> [   15.407165] pci 0001:00:00.0: supports D1 D2
> [   15.411447] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot
> D3cold
> [   15.419964] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]),
> reconfiguring
> [   15.428245] pci 0001:01:00.0: [126f:2263] type 00 class 0x010802
> [   15.434331] pci 0001:01:00.0: reg 0x10: [mem 0x00000000-0x00003fff
> 64bit]
> [   15.441578] pci 0001:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> limited by 5.0 GT/s PCIe x1 link at 0001:00:00.0 (capable of 31.504 Gb/s with
> 8
> .0 GT/s PCIe x4 link)
> [   15.456910] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
> [   15.463553] pci 0001:00:00.0: BAR 8: assigned [mem
> 0x38000000-0x380fffff]
> [   15.470352] pci 0001:01:00.0: BAR 0: assigned [mem
> 0x38000000-0x38003fff 64bit]
> [   15.477699] pci 0001:00:00.0: PCI bridge to [bus 01]
> [   15.482686] pci 0001:00:00.0:   bridge window [mem
> 0x38000000-0x380fffff]
> [   15.489632] pcieport 0001:00:00.0: enabling device (0000 -> 0002)
> [   15.496038] pcieport 0001:00:00.0: PME: Signaling with IRQ 56
> [   15.502472] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> [   15.509755] usb usb2-port2: over-current condition
> [   15.515883] nvme nvme0: pci function 0001:01:00.0
> [   15.520615] nvme 0001:01:00.0: enabling device (0000 -> 0002)
> [   15.532685] nvme nvme0: allocated 64 MiB host memory buffer.
> [   15.550070] nvme nvme0: 4/0/0 default/read/poll queues
> [   15.562992] nvme nvme0: Ignoring bogus Namespace Identifiers
> [   15.663327] hub 1-1:1.0: USB hub found
> [   15.667320] hub 1-1:1.0: 4 ports detected
> 
> [   46.064052] nvme nvme0: I/O 424 QID 3 timeout, completion polled
> 
> [   76.784046] nvme nvme0: I/O 425 (I/O Cmd) QID 3 timeout, aborting
> [   76.790179] nvme nvme0: I/O 426 (I/O Cmd) QID 3 timeout, aborting
> [   76.796294] nvme nvme0: I/O 427 (I/O Cmd) QID 3 timeout, aborting
> [   76.802411] nvme nvme0: I/O 428 (I/O Cmd) QID 3 timeout, aborting
> [   76.808525] nvme nvme0: I/O 429 (I/O Cmd) QID 3 timeout, aborting

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
