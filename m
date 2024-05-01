Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB4FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTabLy+lQ72YjItUvX4DBZy5hPhMFXXLf7b2nSmpEp0=; b=O28dJcI1T6iYqc
	YPuVfl6lQP8gNZN0uRSrF3stcJLcWgbpltOj/dFOp28YRJBhxNk5RbjI7By2ur0/h99LtLeAWmlml
	X01X9Lin4zYP2pF+xgC0ul4THjE1eibDOX1AdkLjlvEp23xZToWrGhijSD2jaGlqy1W8ffYe93u88
	Q3QT8eM9hxm2hC8CVT44ARBwIFeo/7+UNvdtcXHos9EjNWEyx4w57pfR/6MyuR3QTetpwKZT+0D5d
	MiVWy1cNkcPj4XGU7rnIsDErK4b/tzSTxTZLtIv4C4PXVbsqNg0R7Dqk1MoRs/uKYheuzBT9i3nP8
	OS2fff6rqOyIb6PMdh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2JKV-0000000AvjN-281d;
	Wed, 01 May 2024 23:25:39 +0000
Received: from mail-db8eur05on20618.outbound.protection.outlook.com ([2a01:111:f400:7e1a::618] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2JKR-0000000AviL-0Pyh;
	Wed, 01 May 2024 23:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ymx2E7nMxrJ7c4wCub3hBuFXf5Enk/DpRuIe/6rWXqR9ySpWkaNNgPdlVBWRsMLf/k/dGU6Z1t05G6o6uF9eJnOXx0SAJvjHeYCkY58pVW+my+VsEzAK648iG3hx+1aOX9S7xpnfhQ7Pez4e//n6zsN5D4VWlNMd5OqMuUY51DWlPVB1XOyZzMnnaW5C3+spXPv9fmD5dSgD6NbuU3ZBexapK8Wpm9lP3fS+EKVxQo317lwdBu9/MwqkvRcbH5tanHrha69yc4vB5Va6DJtHfYz5fSiHbiaQuw6iYvUa5cIYenLD3/YE6ppuiArV97h1FWr3pgQoOx2RGL5A8ffV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5fQkyoB7W2HmKb8aqNx4MqIa1/aS+2BFZx/8bjW5zI=;
 b=RkzmRHgC5Wot/CNYu+qhN1far6CXnAdY0YThhTSCcn66H26xp4Is29mU2GqWtip7HWv0wh8gH1GbyAzfhrGR6ujMYn1FRT0Ppm8HGsPcYJ319/dRF5oG450X50uQhZTB4IWZ6VNUd0aaKB7RDNRbsnDT+wJzpXQa43QPAXbTrG2ugyikEyPgWk4C2+5mDwk0MnqQK4FstL0C9ox5wS6wdF4MGeWTkKDRdb41pkF/61TUfzXgyX0zPpvTg0uq9fP5COdE44aFKu+z5RZAFu4nU4V19OQT5AVH8J/Azgtu3Wi8vUFeEkyPfMwVn5P4xvYPwK5teNjaa/IFV/XJHQpxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5fQkyoB7W2HmKb8aqNx4MqIa1/aS+2BFZx/8bjW5zI=;
 b=JWVEGVnz3gHmAs3HijSdBSo46gigujeAxTodJZ+LI2PiUC3Vh54eaYwHC6ospCYZ3c7kk0zQNRvnUN6jmGPwyEHgacpY4RYbg4+a/msrvHvyek6cCS14D6ye7BifbzbUorm+6BCXYWoGtUtUc6DP/yoNAGiBR/Ioiw6bm/vC95Q=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GV1PR04MB10241.eurprd04.prod.outlook.com (2603:10a6:150:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 23:25:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 23:25:25 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	"soc@kernel.org" <soc@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Damien Le
 Moal <dlemoal@kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>, "Ghennadi Procopciuc (OSS)"
	<ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel
 Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH 08/21] pinctrl: samsung: Use scope based of_node_put()
 cleanups
Thread-Topic: [PATCH 08/21] pinctrl: samsung: Use scope based of_node_put()
 cleanups
Thread-Index: AQHam8YmBGCJNNA84UmfIILd289ovLGCk2mAgABx0FA=
Date: Wed, 1 May 2024 23:25:25 +0000
Message-ID: <DU0PR04MB941755376CA87C2EC70FDF7088192@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-8-797ceca46e5c@nxp.com>
 <34193501-5b7b-4ffd-8549-a04c6930d02d@kernel.org>
In-Reply-To: <34193501-5b7b-4ffd-8549-a04c6930d02d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|GV1PR04MB10241:EE_
x-ms-office365-filtering-correlation-id: 1ecc1975-1626-4c5f-fa77-08dc6a35faca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015|921011|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Zm92QVI1bGJnZHIxT2ZNZW9xQWFTTjZCSlR6TitRdFBQZ1h2N1FZK3hKK2dT?=
 =?utf-8?B?d3Z5TkZWaDlmWmhJV1g4M3U1bjRKN05yMjUzSmhFQWJaaDAzMXRHbU9ycGhP?=
 =?utf-8?B?MFZPUGd4Yy9HUCtReGJIY0RwOU9Zc1hSZ1dUU2o1Q0lGWVc3NGZQYVA0eWh0?=
 =?utf-8?B?MTJoMUF3N2g4ZWNBN2NabE5ZOE0xNkplMmxjaGl0UjBWclA5L3A5dTF2dE9v?=
 =?utf-8?B?N05wQzcvS0JveExqck5NcHh0QUwwODNmWWJQLzBLTlhuNXdxYkhoWUpaZ2h2?=
 =?utf-8?B?YUNYUmVHTDYvMGJWY21tUWlUdnNRTUhyUGc3enA0WlRRYmcrRk9rMUw3d1Vw?=
 =?utf-8?B?TWJDbDlOSEo4QXNyaFBNd0JBbmp3SGc4VDFWSW04dU9xQThCR0hQUWRCU2JO?=
 =?utf-8?B?VlZ6ZU54L0pONnNIR3pBT3Brc3hyTkFjTk40dm90YTArSTJkRUp3RDlFUy9R?=
 =?utf-8?B?dWZYZmF2eVZseWFCd0EvNmpTVXJlajN0NnlmYjRrSnlKUFhlelF5MFQ0Mkxs?=
 =?utf-8?B?eXdsMTg2MHo1WGN5dUV4TzkrRUNZQXFNcmRCS3oxZ3RHb2o2cHhZWnB0aTJJ?=
 =?utf-8?B?L2EvZGJZQXVTTkloeGsza0FJZGN5RmtBS3dCdkFHMW8yQnBFQ3ZucVJ0eEdG?=
 =?utf-8?B?ZkhoVHdsUGtjc1Y3eXRpUGhnNzViN3RVS3lEcU1DVy9YSjlubFcveU5xd2Ra?=
 =?utf-8?B?S1U3WmxSOGVrZjVzcXJDTHdYOFZGYzdFZnVkdXFhcnh3NkVJaGdJNUNQYmFv?=
 =?utf-8?B?cjcydWhJMjRJWCtSVVIzSVEvNDdsMWRWdFNRMTBmOTNKaW5HNjFtMTY4dkxN?=
 =?utf-8?B?blVGN3g3RTY3N09RTkpsY1NlLy9ReE91a0JMS2h1V1ozemUzYnlnU1dDNDF3?=
 =?utf-8?B?czdpK3luWmRKVGRrVEx2alU0djIrS2I3QkUyWEVVUHdUdGlST1BzaEx1djFB?=
 =?utf-8?B?OGdDTXB5R3BIWnI1OVZZaUJodkpFTHN3UmRYeFV2OURUeW5ucCtjaytlTmlz?=
 =?utf-8?B?STl0R2dKNmNRSFVHZ0RYVWdiVEdlZnBLaEExYXZXS0xGWGlsZjF1OGtOcS9x?=
 =?utf-8?B?MStMbEJ3dzVySHNxcnNmZG5uam45UzNoUTV6b1h2R1lYaFk4ZnJ4UnBJak03?=
 =?utf-8?B?M01ibWhEc0NpZ1R0V09TRXNpQ2pqOWZmb1Mxd09XZFg1d3lwWTdmVkVzNllQ?=
 =?utf-8?B?YlA4ZE9KM2ZhTmRQRjI1V20yV3AwTGFKV2RiLzY2dmxFNmE1eDNRV2s4VmlW?=
 =?utf-8?B?QXd2U1VvQ3RHRER5czJwN3dBN1RWRmxkOVFEMGY4dkVaajRSdDJWc0FkNU5m?=
 =?utf-8?B?Szg5T3c5U1lTR1BZd0gzYmdpdmhhSkhvRGxGbHhYT0JQWVFQcVpSWnR2Q3Uy?=
 =?utf-8?B?Y002eTd2SEw1L1J5L2JaTE52M09WaGtXdlBXcE1sTUNFb0NLNDhEWWV1WHRK?=
 =?utf-8?B?RVAyR2tEN3RjNU5TS3dDenRRTDNRMjJLM09ZWHk3UjRWZnFUb2UrT0RSSlI0?=
 =?utf-8?B?bGd3Vnk3SmxlbWVQZWtiSmI3SU1iaVJTUUYzWDF0WkdURFU2Q3kxbGhnSzJy?=
 =?utf-8?B?MlFOQm85ZGROaWNsNmhYS1NISnFTbnlJbEFtYW42c0h2L1NKQjFBZk5TblB3?=
 =?utf-8?B?UVFuWUVUVG9UcUNMWXJmNkIvdEVOQVhPM2dXd1V5eUVrQndTTHU0OEZLRDJ4?=
 =?utf-8?B?aE0wNjhOOFFWcm9nd0NUNGdjNjJ1aXJ1bUFMZS83cmExdk0rWWhtNGNKWlM0?=
 =?utf-8?B?dW5JSlk1ZXBjS0NNZE8rTGtBUGxDWnRmWUZNS0EzTldLY3dwODd6T0Q4NitF?=
 =?utf-8?Q?ecs+/6H9G7rwzePKqPBFXtVSCx3cpadhirpqo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(921011)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWlUT1gyWXp0Kzc4c1VqRk5ZL1RJbTRXbFFwdXkyRTFTaHJ3SEVQSUNIK24w?=
 =?utf-8?B?VjRPMlArdEpHSjJoQUVtVGZyRTZlV0xpcXJkTEFzQjFaQjBTZnhkSmx2UVJl?=
 =?utf-8?B?a0h3Wk45THdjZUVTVjhGaStFNnI1dXpBdHUrMmQrdlIrVERLeDlUOUY4K0dn?=
 =?utf-8?B?aDZvRTQ1NEx2VVN4aDFTbEJueHNYOFlvRmFOQnFraXFUd1pLMFY5RXNsclNz?=
 =?utf-8?B?Z05UUjBidlZmb0QyOGpnU28wQmhQZFIzVGl6eGpUcUhsWTZnb2pjUjFObEI5?=
 =?utf-8?B?S3NVN2VWM2RYV2EvanRrMzBLVWwzb3ljSE5LcDRpaGNGQVRFWElJUXFQMnlI?=
 =?utf-8?B?eGQvRjR2N0kyWTF3MU1udUhidmorWmpRSytmQmJLYjdFYURRY2RzTnZwR1Mr?=
 =?utf-8?B?S00zd3dxTGNDN3dhd1Q4aWVwSGE3dWlwaEEzV3Z4dzQ1WkY1Tm1BMUN6NUY5?=
 =?utf-8?B?U0pZUkx4UDkvazNOTUdmaHdCdEFYSFRjd3NOc0ExczZEY3QvMzA1bkYxejJE?=
 =?utf-8?B?aFYzNVVUcnVDZ2p0Ykw1M3VMU1R4Y3pvZmVUM2tPS2E5NFBGS2pRWUc2NzJN?=
 =?utf-8?B?SllCcEFxbjAybTcvUytEMWZ4bGhxaitMeXF3anNBOGxWMU1WNVcwUjR6T3ZU?=
 =?utf-8?B?dGRjYmdZM0xaUGs3ZlFwUlViVklkc3QwQlg1cWRndXlmQWltSmpCUU9QRnBR?=
 =?utf-8?B?SFFPWkNKeDZqc3lKZWNlWGhTZzd0QTZjQURjNDB2S2Q4eFp0N080Sk12UGZX?=
 =?utf-8?B?U0hld3pMWWtWOUVDb0NET05CTzFkdEROUjJYd21XWXNYeWkvUzVMd1ROdktZ?=
 =?utf-8?B?LzQ4R084Q3Rwbjk2K1JEWVRLSEMyckRWajB4Qmc2ck1UMGNkblFiS09tTk1H?=
 =?utf-8?B?SkFYUm52RnB6a3owemwrdGE3SmQ2QnE2RnpuQ0ZKUkxUTXJaUGVGK3BrZWQ5?=
 =?utf-8?B?NWZodko2NElYMUhyNWREOThhQTdsemVqbWdPL3k4Vk9wSk5udVZ1YmY1OHEv?=
 =?utf-8?B?STlSV2dxRGhOV3FjeGlMd3BMZ2NpMHZrU2M5YXM5SDVyTTM0cVpSWVlxQWZD?=
 =?utf-8?B?TkhDN2FlelJyaGhMdWtzenFjS09ESlBGRFplNHA5UUI3THd3ckxNT2JVYVZS?=
 =?utf-8?B?Y05hY3lDUmN6eDZET2pycjhEaW1xOUJycEpMV3Y1M3lKc3RMUmJWRzNicDN3?=
 =?utf-8?B?a1lYQmtKbURTcTE2RTZpOEZhSnBNSkdaZVEzRE1zbFNJTitoWEp3cUoyZ3g5?=
 =?utf-8?B?S0drNlRHYUFiWkttK2ZJamk3VTZoeUYrL3hkS05GSWVjZHZpRzFUYk9YS1FB?=
 =?utf-8?B?MXd1OHA1R29BUXF2ZGpSd21XdkQyYzVobnY0UUJKSTJ4RXREdlpoTkNFcmlh?=
 =?utf-8?B?WVhacEJXTjZ1ZXRCZzdsN245dElqWUJlUGFLYVozR0NuLzRxd01rekxmc2lh?=
 =?utf-8?B?Ym9wRURmNFR5SEJDbjRZZ0VJZUN0eWt6YU5LNHJ4UmliWWpGVGszcVF5Nmc3?=
 =?utf-8?B?S2pZMEdudTkzcFV3YWp5Q1o3TnN0L1RKdkNaekZIZU00a0dLQ2V0NmczK0Z1?=
 =?utf-8?B?d05yTURFZmhIM013T21HSmJjNzluMEFocmtYQUtjdDFjOTNNMWkwaW9iT2V5?=
 =?utf-8?B?MWJwa2U1elFnMDRWd0o3cy9RTGVzUmUzWlBKNlErQkY4SlFSc21FaEVRZE0r?=
 =?utf-8?B?eFJuN29IVS9DQ0N3R09IWGljL2FqYWVRREoxaXA4SENUaXY3Z0w5TEQ1MUxB?=
 =?utf-8?B?czYwK3dISHZQaGhOVms0eDdWWDBvOHoxYUpraXRsZ0YxS0xZSjRlZzdCazNu?=
 =?utf-8?B?NDlROWppTzlaSXJudjF4cWhkd1RnMXJaeUNqRWp0R2NVZndLK3N5MTVXcVNH?=
 =?utf-8?B?WlkzTE9ZNHFKV1UwRUxpQnRWK1dLeGtFd0tBNTZvUkxqOGtacTZyaFZTMjhB?=
 =?utf-8?B?bFNTdGM5Q1g0bkVjV2krM0s5czVITU11eTlBM0dmVjdrRkErdjBkeEI3RVBi?=
 =?utf-8?B?ODczNFdYMjlwclEvdDlmeU1JOU9pZkhIREt5bUFFUTJVV2VvSFVJWWU0V0pz?=
 =?utf-8?B?UU9JTEFMNXNENVIxdWRRYkVTMkowTldYc0FRdXpLazdkbzYrU0YxRzd1TFU4?=
 =?utf-8?Q?/L3E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecc1975-1626-4c5f-fa77-08dc6a35faca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 23:25:25.3103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghjxKUsI+Coy8Ono9sx8NzlzbdLDcJYbNd5FjTpZMp7O+P/w1uhXLynPLIDB9X8Jf8jexwNOPauz1zfWm6gTUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_162535_200122_5574A0EC 
X-CRM114-Status: GOOD (  19.67  )
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

> Subject: Re: [PATCH 08/21] pinctrl: samsung: Use scope based of_node_put()
> cleanups
> 
> On 01/05/2024 14:56, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use scope based of_node_put() cleanup to simplify code.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos-arm.c |  3 +--
> >  drivers/pinctrl/samsung/pinctrl-exynos.c     | 16 ++++------------
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c    |  8 ++------
> >  drivers/pinctrl/samsung/pinctrl-samsung.c    | 26 +++++++-------------------
> >  4 files changed, 14 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > index 85ddf49a5188..9a57b3ceb536 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > @@ -56,7 +56,7 @@ s5pv210_retention_init(struct
> samsung_pinctrl_drv_data *drvdata,
> >  		       const struct samsung_retention_data *data)  {
> >  	struct samsung_retention_ctrl *ctrl;
> > -	struct device_node *np;
> > +	struct device_node *np __free(device_node) = NULL;
> >  	void __iomem *clk_base;
> >
> >  	ctrl = devm_kzalloc(drvdata->dev, sizeof(*ctrl), GFP_KERNEL); @@
> > -71,7 +71,6 @@ s5pv210_retention_init(struct samsung_pinctrl_drv_data
> *drvdata,
> >  	}
> >
> >  	clk_base = of_iomap(np, 0);
> > -	of_node_put(np);
> 
> I don't think the code as simpler. Previous was very easy to read, obvious, no
> error paths.
> 
> To me any conversion of such of_node_get immediately followed by
> of_node_put is unwelcomed. Easy code is being  converted to complicated
> one.

ok. I will drop the changes to code pieces as you commented.

Thanks,
Peng.
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
