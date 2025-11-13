Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A9CD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNkwcQnb0l06/vSAL5gVfGStVbM6i1ozOz3r5LRPbiE=; b=nEnkFsFC+CaQz9
	/h9UqaZjfVOMdtr6aLWthWV93U3Dm+r49Rdt2TK/QkQ02oYEM4g2avPv1uwjUyEX6Sup55/zWm+sx
	57lHV4pQ/OK438tIVS6bLtHn4iTipCqfsrOLXXg9s9UMk4pHgbESXQMEs45AEZVzZn2VGCvvHkj5x
	jSh5eqAFUT/ikrPE/xu5rlV89naN+FoI1KNuucPnylr7bnu3VhQq8hxQE14rK5fGXv0xED82aGMji
	IufTqbJ6lpQ9SiZ9LVoopdDdhfnmDdyG8TuK+4Jlo9ezQRx195H6CXX8+fTTRLIIr4WYRN5lrkOFA
	CYVKsdL/oF7XtK2eLmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJODw-00000009qvE-2rfS;
	Thu, 13 Nov 2025 03:42:16 +0000
Received: from mail-bjschn02on20728.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::728] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJODt-00000009qud-1km6
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 03:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqkLvMZZSWFTrEZ70WjJWa3rL35g/QO1hnTY8nMN3u7OJIsTYEcBew4s97C+rN9hioojD5XCDvu5BhbHNSO8cEx9VC7a+/AVLhKrcjBx4WnupyaGrAehNBBXuw0d6N1O/x73XSOvFjsvgtNeTDhRfkK9q7lg8VlktJSJDEpp1CEZTqOPtxq5Cgufw9Azt/HzrUIoLgx1rvq7vg4xhx8xZzVT08nxCzRw/XI+SC/fXQ1oH1MR2E5CHRzlOBUKcTn+SXDSPLwByrp+qalZWKlhkEbkSLZHtxJTulMajTMfaqc6NZhD2LMBPyNx7DB71k8xaG02Z6O4yD6SYbMNQtjPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/YxKp1w1FPuthTEdALqQaEdcEt5uPO+mvS9gGWpD+Q=;
 b=bzoh4WGlf3mq6PvDXUf8Mj1PMM996cBS1AVtvbMjn9536+2diYu22QsfRHD4Wizfqe8sM9wtiVPHpBnStMwWfohhKQHY3XNCXMWaJZQw8FL1mUNqZQ0/h3Ayc8jCRMz822D18xt9Q7Yd+BV3uceLaFhW1A8TncAzuF9J/xQs4Jrl061krBkgyRplZj2jyp1zA4xw0Pyqq1LwqQthRgqLr07XljUU8IubZIHg6du/OGaZ/4WaSFIdgjRPjMlP6DTHGtbAZjH6OjMHoOUecoQdYBpWpdN+MF7Ig8ccQy4ldeSMl5QpDYYmVQuYdnol4OyQggR2y56jWtMk5ftnOnjMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1227.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 03:42:05 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 03:42:05 +0000
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
Subject: RE: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Topic: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Index: AQHcT8yr76WB0y2LYU6wjdN+ecXGd7TvGAmAgADiXSA=
Date: Thu, 13 Nov 2025 03:42:05 +0000
Message-ID: <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
In-Reply-To: <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1227:EE_
x-ms-office365-filtering-correlation-id: c12e178f-4a05-4494-e085-08de22669d3c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|38070700021|921020;
x-microsoft-antispam-message-info: hlnCs7Pd531QjbT4AFDHiuQONFos1SJTGsHEv58Ujv00K/+m/uQpsPfaGVlvU8FkAZweXgw+91uWByn4xkjDrBQHFINZit3dkVWrEJbaO6Pq8tEh/xorVHz+mE2/7GvF0DR49udqJ/8tttEp7DwTTp/gekKr6bHgsWz1ZTbZLle/JH5GSkvokE1UT8AL0rmpUywgZPhMEDPhCLPoXYAFIA2H3QnheMI96xn92SPZ8Gumi/YFIrdEzlG2gu9YglW/zfsDTKD2lobsrngpw3zJYK2AWKAh0kctZmCX5yfPpawWsqIHA5aKS7iLRYeOAvEESLRU+xULRmRESHj/868poRS+vMeqoIgLPSKEKViPIzmemiG21X9vPcX1e7Lbd8oF2HNTvUHpE+n1V3Ug+UJz6wSZxur1jjM6f9hqB5ZMSTQPnGeMSi2N9bsnCdnRJz1cs/dUvcR9CQ7Y8/23xSGHIvLwXHUTskGBUDzJH/XCG32ZzaFneFLz4HFImuufQBC/unv9YHk5SKMIEbz93L7lzFk2kQ6MoBWYOPMMhChSBQcO55A2vCanh5WJe4ZCGVCcXdBdtuVpciVm924P0wGvHACp/TG+gf5bLRpOtA3oq5w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXVHUHdQU0pEY2MvSHJnME5YeXVzQ3BkanJyeWVXdWxoZ0F1VXkwNC9zVFFy?=
 =?utf-8?B?NzhyTnRiN0pTUEJOZlRPNk9CTmlGOEZBMUhyM3hKK1Qwazg0eHVpaEhYR3VE?=
 =?utf-8?B?MDdjTEkxejU5c0pXNmdtcE9uZ3VieEZiRXZiNDVYSUlIV1F4eFdWNEhPaDVj?=
 =?utf-8?B?TVRWWW5tWTJXb1VMa1pacU44VG55Z2RDSlB0WHJjNS9JbEJLOXBGS1lsUlQ2?=
 =?utf-8?B?UDkyMXJiUVkvTmxldk0xalZ3M0NmWWpPMnBuM1ZvdGhDRi9tU0puSG9ycnd6?=
 =?utf-8?B?SFNjVXVoRFhubEFIZldsN0dTS0FKVnVLc0lRcXJ1UmJoZ3BabVNoRVd3SXMw?=
 =?utf-8?B?bXJVRU5BangvQjVXTWNQSFppd3pzK3pFVzQzTG1iRXQwbHNJT0hVU01qQ1RY?=
 =?utf-8?B?MXdRTVBCeEd2RXR0c3FORU9Send6Ykxnamk4V2psZmZ6dDlVS2JsMkhuTzhw?=
 =?utf-8?B?VFBkdGM2SS9kT2o2WW1HaTBTVGRZQ25jcW14a0Fnd1VPbkd3ZUNYdjdaOWkw?=
 =?utf-8?B?MGlZNmx3TXdySXFOeEtLVXdSZmFFZTVSTGJ5dXYyZ2FabUtmS2VodkttUFZO?=
 =?utf-8?B?cGxQejJXUTZCU0pscjVxOUZ3WEN3NFpEbWlSMTROV0F0WTJoVjVaaTdwcUZ2?=
 =?utf-8?B?ZklSSUpud1k0dHNOTkUvVmsxNW9Ed1dTdzFSQXNrWHRlc01yU2o5L1VDMzdT?=
 =?utf-8?B?MFNnNDh6bDZNNGZOOWdBMzFxMDV5cjN1V2MvYzV1MWFTS1lQSmNtV21YL1FN?=
 =?utf-8?B?bWEvQTFpRXFrTjJCVVUwVUFoVnFQOWd5ZWNtUUtoS3J5bHZXb1cvWUVQcmVu?=
 =?utf-8?B?QVUybWtWKzEzSXJWRHhjM2xpSjQyUHZERmdkbWUycFJlaFhqNVVhaWN2Ri9y?=
 =?utf-8?B?aFlROXBBUklCYjAweU1CSGwrN0s0RUJxUnEyMmt4YVhvQThHcnJGL2xuZ3Jw?=
 =?utf-8?B?dVZNSmVFVHRrTGpIY0s4bWNmeEROUlgycnIyUDZVZCswSjdnTHRwSlhTRDA1?=
 =?utf-8?B?Rmc1ejd5UEsvUE1YQnR5SnBRSHcxdUVvZnMrYjNqK1RHMmdlWUZuSlZnTFlF?=
 =?utf-8?B?eTJTNEExM3gzK0ZhQVYrRjRncy9tOEtiaUYrSWgwUmxiSnpTYmlFb2hyVEFN?=
 =?utf-8?B?OUxDVGx5STJTTmhEQ3hhdnZ0QUl3OFNTZzRSS2sxeXJrRzJ3UzJ5M3dLNkdz?=
 =?utf-8?B?eGVqakZseTlzREJyYTFwbXFIalluamJpamtDSnJRRVc4Z1BWNWV1eno2NnB2?=
 =?utf-8?B?eDFxUHorV25vRTFXWmRmQmJ4VXZScVU0M1dUNVhJcW13MCtTWm5XZDNPWEZv?=
 =?utf-8?B?OUh2Q3I3QXF4YnZlUXZUcjR4OVBiMTVaVFc2R0R6Qisvc0h0QmNtcTliak1o?=
 =?utf-8?B?LzRJV2pDdWs1SEN2cVdTZzhDdlhFMTkrWXBSUXYwNDlVZGMrUjhHRU1oSUR5?=
 =?utf-8?B?R3ZkWVFVTEo3R05tR2l2SjZ3UE1OUWNuZUpGd3dySldZRHlaUkVTUEJicXpP?=
 =?utf-8?B?UGpCSSthWHFXa1NLczJPVktGd0cxYUhKUHh4WjhCdzk5eHpuSzE0bVJ5cEM1?=
 =?utf-8?B?WHluSEhiTFZFT29TR2p6ZWd5K2NmTW52MXpXZXp2VE1OZTFOWGxoTDc3dlNB?=
 =?utf-8?B?Q0ZHcm45NUZ5YXlVbUFFbk55d3cvZy9wM0t5c0p2Z2xtbVBlWDBBY0RXVXU5?=
 =?utf-8?B?K2NmMGVKekd5Y1h2NDBBYVVQQTNETzFoV0p1MGhtZEtCQlNaVUgrZ0I1aHlv?=
 =?utf-8?B?eGZKQmFTei9tYVVUaTRZVXE4TTlUdWhYYWtrUGN2blpUMmkwTWFSUm1jREps?=
 =?utf-8?B?V3VqSlB4dlcrbklOWWx2TjJ0WXhzWFJYVWtwRXlVdDRtU3hWVml6UHhkcGZy?=
 =?utf-8?B?OTJQTnhvdmVvczhyYmhKdjlpSnFtVlFpUGl4clZqMFZGREQzOCszMmdCRm5l?=
 =?utf-8?B?bHFmTzRnejRmaVczcHdESm0ram9kM3V2MDhpSEJ4bzBTK1dMZU51ZWpWSkZG?=
 =?utf-8?B?aXpvYnZ4YWZGSGVVY3ZGVjNxWWdYZVZBS0dTeW0vOEJKNDV3RU9paVZISEo0?=
 =?utf-8?B?RmY3TFZydFBVaDNkU1ZSQjhJbnUvb1JuUTIwU0JWckt6OVVFTGtHS0grRHdS?=
 =?utf-8?Q?Jhcm8hwETFcC6y7eonkdV7cgk?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c12e178f-4a05-4494-e085-08de22669d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 03:42:05.2735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMK0YvlCwDDvHOatNH0hRqn+styk30e9V/i0roM9mOYIA/GhT05veF7jb4SlkELTtlCsg+sKdnSbjm/jqomxejt1f5h8pSwU+Q3Boym2gMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_194213_462354_3058BF55 
X-CRM114-Status: GOOD (  17.94  )
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

> On 12.11.25 21:54, Emil Renner Berthing wrote:
> Quoting Hal Feng (2025-11-07 10:55:22)
> > VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
> > industrial SoC which can run at -40~85 degrees centigrade and up to
> 1.25GHz.
> >
> > Board features:
> > - JH7110S SoC
> > - 4/8 GiB LPDDR4 DRAM
> > - AXP15060 PMIC
> > - 40 pin GPIO header
> > - 1x USB 3.0 host port
> > - 3x USB 2.0 host port
> > - 1x M.2 M-Key (size: 2242)
> > - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> > - 1x QSPI Flash
> > - 1x I2C EEPROM
> > - 1x 1Gbps Ethernet port
> > - SDIO-based Wi-Fi & UART-based Bluetooth
> > - 1x HDMI port
> > - 1x 2-lane DSI
> > - 1x 2-lane CSI
> >
> > VisionFive 2 Lite schematics:
> > https://doc-
> en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250
> > 818_SCH.pdf VisionFive 2 Lite Quick Start Guide:
> > https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.ht
> > ml More documents:
> > https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html
> 
> 
> Hi Hal,
> 
> Currently the JH7110 device trees are layed out like this, with a nice separation
> between the SoC description and board descriptions:
> 
> jh7110.dtsi               # JH7110 SoC description
> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
>    |  |- <VF2 boards>     # Final VF2 board descriptions
>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>    |  |- <Mars CM boards> # Final Mars CM board descriptions
>    |- <other boards>      # Other JH7110 board descriptions
> 
> With this series it moves to
> 
> jh711x.dtsi
> |- jh711x-common.dtsi
>    |- jh7110-common.dtsi
>    |  |- <jh7110 boards>
>    |- jh7110s-common.dtsi
>       |- <jh7110s boards>
> 
> ..which I can't even give clear labels like above. In other words when new
> patches are sent in it would not be easy to explain exactly where each change
> should go and why.
> I'm also worried that you'll find that more of the peripherals on the JH7110S
> need special handling and a new jh7110s-... compatible string. Then I guess
> they'll need to jump from jh7110x.dtsi two levels down to jh7110{,s}-
> common.dtsi which then both describe SoC and board properties.
> 
> If you're serious about calling this a new SoC then I'd expect something more
> like this:
> 
> jh711x.dtsi                  # Peripherals common to both SoCs
> |- jh7110.dtsi               # JH7110 SoC description
> |  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> |     |  |- <VF2 boards>     # Final VF2 board descriptions
> |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> |     |  |- <Mars CM boards> # Final Mars CM board descriptions
> |     |- <other boards>      # Other JH7110 board descriptions
> |- jh7110s.dtsi              # JH7110S SoC description
>    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S boards
>       |- <JH7110S boards>    # Final JH7110S board descriptions
> 
> I know this will mean some duplication in jh7110{,s}-common.dtsi, but I
> would prefer that to not having a clear explanation of what each file describes.
> 
> Do you think this layout could work for you?

Yeah, it is clearer for developers and maintainers.

Considering Conor's suggestion, what about:

jh7110.dtsi               # JH7110 SoC description
|- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
   |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
   |  |- <VF2 boards>     # Final VF2 board descriptions
   |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
   |  |- <Mars CM boards> # Final Mars CM board descriptions
   |- <other boards>      # Other JH7110 board descriptions
|- <JH7110S boards>

Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
Remove jh7110s-common.dtsi, because only one board uses JH7110S now.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
