Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0B8C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZ99qQt3B0EUAEEEPIOqhoLWVKJEP7LkcsVTuXb1zuI=; b=NcCXoqLO6b27FL
	9RU1owWMLrTrLkKVbj/yH93+loR9Rp+Pw7AxStDw4xvrE2MAmaNkmmHAEBSTyKLS2vHXD1+lcSagH
	E9Ind5kMRZgDWX4BHmkz2XkhZFRAbi2WmW1Kq2rQvn0fodkScKcPENs3iNmkfOsWR105XHNYgn919
	6T9vWSo6Bk/mYP0Tyl1B09g4uEz4jlf1L4RzGYi7yzJH8w+lKrnQ9W/Kj0BIJxVgccs8KSbLT+Zw4
	rpULbYvvgnwGBks7VaV9Bg+OOzFGt6H/H3lfC65kilrXYmMMDMcUnhH/B/wLtqPnnf3vdia74/jbc
	bi8GV10itZYa5vi2q2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1bkl-00000004bv0-2qQj;
	Tue, 30 Apr 2024 00:53:51 +0000
Received: from mail-bjschn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::706] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1bki-00000004btL-2lrA
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 00:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RM+klsKa7sg+iZ7U9ahW08xZmjGINUzbn/EmTTBIf1LP6Dbq+8SLFSr9gmZawHNY+GnyBWpxXAhmdJNeGaIZPHOtG3JjK0zFfHVSuoR5396Xe3Djuyme+GELoSUM68SSLq8UbFMnafOpI4j0tzY5sn5+c1oWJ7qKU9DxlIRyPKO+z80imnQ3bJptlg7jDc+7wT4d1w1oE4MPYiFvUJkvs/XiZMc2n0Gbo8Ny6csjkSxwP8qAmG20+lZRbIq7KRqud/4aU1kNVEQPIVaLtuFMou8PttK0jlPlZkPGDO+/HqrF2/wXFGOJDzv/xJUUWaNLFxiyZhBgdPr5NBlsczFZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w+CRUPvPl7hO9cUnDrUA37EWQl3YhnsgPyi8+o1HdU=;
 b=PDE8u4Al/HFlWHbd+g0B34AqF5+3ApHW0ucARwgq1A22+MZ9LNRkPMHIObVXj1HJGfTPL15GIgl706Xp9Ia64kyrhmVIbCLCyoyzVkWd3AjNDkn0P5sCJx0n4ni5Ubbv9twO2lQPMFO3Vaa8SNT1b2bN41zROfu5AZFcgn75HuhpZwG/pvCG1VA5IFyjwUUCBUQ28TlllNBhh3c9Jv4eWgCzVoja+pBMo5RN2JMHbgQTrNqh7awGuA1OZzE6V1bG5aQVTKJw+oLGu/JQ6awa/qzh//0Nqzf5P/g3lDiiNzYmCIYQCdtYk1WNavl7IcCw1lr07hvlH/J5MtuKPKRbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0551.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 30 Apr
 2024 00:53:36 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::3e54:57b5:e3e3:7f09]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::3e54:57b5:e3e3:7f09%6])
 with mapi id 15.20.7472.044; Tue, 30 Apr 2024 00:53:36 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley
	<conor@kernel.org>, =?gb2312?B?S3J6eXN6dG9mIFdpbGN6eai9c2tp?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYxNiAwMC8yMl0gUmVmYWN0b3JpbmcgTWljcm9jaGlw?=
 =?gb2312?Q?_PCIe_driver_and_add_StarFive_PCIe?=
Thread-Topic: [PATCH v16 00/22] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Thread-Index: AQHagPDufmdBlaBn9kKVvS/pnjIg0rGALuWQ
Date: Tue, 30 Apr 2024 00:53:36 +0000
Message-ID: <BJXPR01MB08553956E2560A52CCC3FDBEE61AA@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20240328091835.14797-1-minda.chen@starfivetech.com>
In-Reply-To: <20240328091835.14797-1-minda.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0551:EE_
x-ms-office365-filtering-correlation-id: cd9c91b9-b6a0-4489-a2ba-08dc68aff78f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kHe2O6qlkODrLOs7QDdxonWpD862Qsv+f6kdfjsiFlPFXqZgO0An8oUdETyLRapEjsIdwv+lkLJBTmuI/X3D61UGsIvcIMxzdW8SPY7OnoUx6Rkee1qhjYb6lyzIeiOvNYkREOUxl/LCA4pmvMaquoSWj+D+tm9VkRBNc4v4sLoN8CPVrO7vz2/ZCwF7TwvXpSskHHrje8sLWuRg0B7zjaDjpwmzbyVa0hlasJE4OaWZ7RxYuqkagSZea3hKUu5eFGCNLrWryjfDDVqwuUTmLZzXCaHZfaThS3USx3wMTkp+ykGd6N/U9ovfFea0q21JQj1MPBSNrh0S2AGFFigqWluMzK+C21CeqzvlYsZKOAKaIhG4ueEQQM2a9zW0c6EQVOA7Nacw6pM8n7MFnt7SEL2qX54Lqzo15p0Vt/mcWFFNP8eeC4ccv8ZVaMyiF8OndSYTXPS7lZ1waF10mALYRfqrGYCRsmsoSy/KNJH//zaVAdhUxyjUNfDHed4X/s1qIoWlEapywOEs5iqoMrvIuH/fgp9bjexRW4e1SRgvmp5943HbqSBuaCA50sqDijjjUNLcBGJpRTzyGFk31JggE28aYV/Ym0lMvqNKASxfP9ZrQ+5N2Q/veu67CSe6a8uE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bS9sOHZvd1Q3bldDaTE2VG1sYzFNdlg4YURTNUpQYjczRmMrdDhFZFJ2VVlM?=
 =?gb2312?B?RUpoOGM1d3pBbVRUc0VLUzUvelRITVUxQ2JxVUtkOVpXeEMrb1IzSjJ3a3dx?=
 =?gb2312?B?Z0g1S1o4R20zajl5VmZ6QWF4NktJOFd0WXRTMHZlMnFIQ1pOOHovN09LSmlB?=
 =?gb2312?B?TmhTOEswQ1g2YWE5dXl5OHNtNzkvajZuSmtKdnpRM2NHTVRGY3h6emYzazdN?=
 =?gb2312?B?L3RuaWFTTXhIRTVROWVLMzRPNThVK0FtYjFBRlZKbFk0R3ZGSWRLKy9ER3pO?=
 =?gb2312?B?RVVsMit4ekM1dXdMQ0l2VVE4OUFtNnRDeEN2YmQyeVEzVkoxLzlKRXBiOTlp?=
 =?gb2312?B?dVNpN0RXN2hwZTQ1V2M0Ky9GS2ZTU1NRNVltMlZQSitZd2ZzU1ppU2gvRC9J?=
 =?gb2312?B?eDk2WEdEaXJrTDFpdzEvb1prNHE3WjRXS1FkOVRlME9CS21Tck9hZHhxSVpB?=
 =?gb2312?B?RG1TQWw4OGlEM1FDOXo1Y3E5eG8vK2YvY1Z4TDhkVjhPSTdFcjVJOGdtR245?=
 =?gb2312?B?Q1U2OGdGKzExc3g2eHc4M0hMcEMzZ0hVQW96TjZCWW53SVgzVnI3MzlJSWRw?=
 =?gb2312?B?eWRUd09KZGhNd3BaOVNlTlJWQWtsN3ZJaGszU3llNUN2ZlNRM3Y1Rjlja0RP?=
 =?gb2312?B?TzFOVGg0aFdReGRCMGFJM1ZhS2djU053UXdEUTYxSnc0Um96L2NDVkxuZ2hJ?=
 =?gb2312?B?NTErVEMwY3pPeFFYRzJtTkUwVUtDYTlId001ZVRIbkxWbjk4ejR6M2xDMEFj?=
 =?gb2312?B?WFR3UmxhSHJBTVZudkVLUEpLU0cvcjJVNmxPeFkrSDVPMW9jNWRCSUw1Y29J?=
 =?gb2312?B?UlF4UHhUaENuaStSNUl4Q21Wa2h0VjQ0aEZxMW5JdDJmZThmdWJPa2FzdzZ1?=
 =?gb2312?B?V0FvOHdQdDBQR1Avem9MeHBMdXhTc0JOWERSRHZ4ZkQ5UHdhTklBUXFkWUs1?=
 =?gb2312?B?V2ZmVm0yZktZc1A2UXBpVW1qOVd2eFZwa1JtY1pGWWFrdVFadk4xQ1hlOHZF?=
 =?gb2312?B?cm4rZ2lJZ2puNVVoOFEvYVQ2eEQ3UjJsQW1GUjNaRHFBWk8vNWVIRVp0VWxk?=
 =?gb2312?B?WEdzWG5MeVh6L3pUTFhTSDc5ZGh1a1NBMnI0dWM0SnMyNnorSU1kNTBvUFNn?=
 =?gb2312?B?djhSM09nNWZpSU1YV3Y1YVdmOXI3MHMybUhvcXN4TmNnQWluVmYwb3NVRHZW?=
 =?gb2312?B?RkFOSjVmTVJyclhOVlkvOGd4QnpiTmNDWkk3Z2RuOHJFMlNUNC8zQjMvays4?=
 =?gb2312?B?NGQ2VmpmRUhxcXlwb3ZSZDRPcW56ZmhWbVhSQ2JoNHVYQ2RabGhrTVBLNWxx?=
 =?gb2312?B?WEdKYjN4T3ZYMzgyTW1qRzBVNWZwcklXSUpQZlhUTEJRaWcxajIrUzkwRitQ?=
 =?gb2312?B?cTZkdG00YVluWExDS2s1dVc0UENzY0g3Z0xPMTMwWmQ3cmpjbGJ5WGVGeEZD?=
 =?gb2312?B?d3NjMnpwamVWT05rOXc0dFZjVkx5YWcrS2xKNU9OTzN1cEhMOUlYV0hjSFI0?=
 =?gb2312?B?VEV4N05aRjB2RU42RmU3RmNLZFMyUFRxVyt4blpwUURqQmg4QVMzdmUyRGow?=
 =?gb2312?B?cjBPNnV6cXNZanBIMUtHNmVjM05MOHRTT1A4TElvR2RvU2JNM0doQ1JBSWxG?=
 =?gb2312?B?aXNJSnAzNllHMlBsRjhNa3BpSUlwK0g2L2MyVmNmTlR5UDFYM3JhMjV0b2d5?=
 =?gb2312?B?Yzc4TVBvYko5WHpETEp3a3NwYy8zaCtWcVY0TmZTSHZmU29aWnNsVEhMK0p4?=
 =?gb2312?B?UFBBNUVkeVRuM3lWTGxYblI3TGJVVHFSSVVBeFoyaldBWlplZ2ZueDE0NzlO?=
 =?gb2312?B?Nytrb25sRUtBKytTbnd4TkFzQ0JEN1ZWM0NoNWhDcGlFd3R5aDYxcUM3Q202?=
 =?gb2312?B?TWU4VUJNMjJqTmVXdkdwVXp1Qnl0UnJyZGg0U2s5UDJ6bFUwU3cvK3plcWFW?=
 =?gb2312?B?N2h1blhZOEw5emp1UXhoazMxNjFDbWoyQ0R6MWR6VUJ6VU5GRlVDUjhzM00x?=
 =?gb2312?B?KzAyWXo2Y1NmdWpoMkhkZTRhczQvYmYxUEUva1VMdzlOK1EzOEE5Nys2VzUr?=
 =?gb2312?B?RWRxRFdMYzhvcmtkMU9mWDlaWEhHVkwxYzMveFE1endkUUZETFpnMEZIUEFO?=
 =?gb2312?Q?bjBiSIZeEdvF/rDe1Ks578geu?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9c91b9-b6a0-4489-a2ba-08dc68aff78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 00:53:36.1146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VG/4iNJAsZaXKAW48C71BGgS1wgYr7fHMiSPBf2W+pB5Fq1rzpKXC+DQWo4UFm24PUYL70iwGrecs9yEIRvCElV6T3j6MdW/tAy+6gN+iSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_175348_733758_C7B4481A 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the same IP
> and have commit their codes, which are mixed with PLDA controller codes and
> Microchip platform codes.
> 
> For re-use the PLDA controller codes, I request refactoring microchip codes,
> move PLDA common codes to PLDA files.
> Desigware and Cadence is good example for refactoring codes.
> 
> ----------------------------------------------------------
> The refactoring patches total number is 16,(patch 1-16) which do NOT contain
> changing logic of codes.
> 
> These patches just contain three type basic operations.
> (rename, modify codes to support starfive platform, and moving to common file)
> If these patched are all be reviewed. They can be accepted first.
> 
Hi Lorenzo Krzysztof ,Bjorn and other PCIe maintainer
   Do you have any comment to patch 1-16? Hope patch 1-16(refactoring patches) ready
to merged first.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
