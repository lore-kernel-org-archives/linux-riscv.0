Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFCDC25B5C
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 00:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+VdfhFBt9PtQfQLc3P8cQnJ4lti2VLZejxtHAmhgbg=; b=aJiZ6ogrXb5zPw
	ddZy+qPFCG7VAO01dLzcvRBsHqy9JIZ40C434yJcolddpTLa65+eK9raDS0h6VofcIBUX7b2hxdxQ
	dwZDuxVWp7S5BY07mkaqnNSlvaAOSQ5BRATIz2GHtqCymRnBBjuRnYLvuUP29W++jo8j+mSxlnvPw
	2m5i0t7UJTq31WS/nJoTplRsV+vt3Cnhzjw1XWDybBBZVFr6jn9qmk2BRyvaFQESjfOU4Kp/XmxoX
	Wu6VXsnfByw8y79SSQECXIczMFfd/OpuDp1pSH0xkqJx/xzndNswgVRR8YUEOHSqKKgDkoRZEKjc+
	IiWg6D7n9VvCf+F/Qabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2KJi-0000000B1lA-34TI;
	Thu, 02 May 2024 00:28:54 +0000
Received: from mail-vi1eur04on20601.outbound.protection.outlook.com ([2a01:111:f403:2611::601] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2KJd-0000000B1kO-2Is4;
	Thu, 02 May 2024 00:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHo/3ID6lS+AdqFu0gzXQ6LAIReaEeHmgHou7j+2joTeo4B/TVLHXrhtCrlLlyHBVnUD9ZRx4d8wuMth4jYLdLzMwaTn+mEBzKAE7fIB9WyBMImr9/eWYyf7ln7uF5FUTr/IFvaxIO3t/uWu2OEkCW9LtJAJQs9TBvl5ZOwtKaw3Li588GF582swUppsSTjP5Bf494m7Ob3edHQWffSXJHoXyIzbsj1qscSQIndLCiSu0z7D2MuKW3lmPoFzumz0XlyVfEyV6UCsvEApzPDK3NTt0vMLVBOtzUb10TdymWrHxP7ur2IxPcSYwOtdE8j17yYNWhQzU2hYZ8VkmeOt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ2SPCN2M7ohOGJj3Bl0H2FL8GmKXIEX+qlx+hJJ6Vk=;
 b=WoL3nKdwZP1YWz4sB5WcllieCBPhjhapCun3qthlUYj0blEH1t62CMMgNTAEnfmRY9gG69uQLjQCH9k1smx+KK2w4eN2elqiXlVu/D30ugEOgrre+/teu4bi5tm0BjTS7ddFmnEpznEDlwC9exMg6LeCPw3rFNxY6TOy8ZtzBjsIwZ6Osg6jxWvaG6LKqU9XmSIDs0AMrbMwOGky1fGBVl+16fY2AH88wjyhZE2Qtx8BvZFytYngTqX7MEPhdJbsPCKd8K3omF+cmc0BjlwJfyEugFE8SJr1A8v8h33qCRDrZeNUmogsmV8xn8UWUOGv4SruCjDvxYJxFvcmNYzBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ2SPCN2M7ohOGJj3Bl0H2FL8GmKXIEX+qlx+hJJ6Vk=;
 b=OrXuO1DF0OYCGccyVr6vQCYh8n/oKQIXVB3PspIE8ar/nEzxpvy7nFtvS/KmP2fwGWGQ/ILBmYTkXcFGC62fyHTNGw3z2Q43ALPxx/AGuz2mpzJKk7ERw21kky09QmrgICHaNEIwUmfrvwgX/gS6KDLyBQvdhEHvNc0Cih04/NE=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8092.eurprd04.prod.outlook.com (2603:10a6:10:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.26; Thu, 2 May
 2024 00:28:44 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 00:28:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin
 Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
	<heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches
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
 Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
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
Subject: RE: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
 cleanups
Thread-Topic: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Thread-Index: AQHam8Xj7phXRd8k+Eq6Rs1zefiOObGCYIcAgAC3AKA=
Date: Thu, 2 May 2024 00:28:42 +0000
Message-ID: <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
 <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
In-Reply-To: <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DB9PR04MB8092:EE_
x-ms-office365-filtering-correlation-id: 65567ff6-a480-4765-c129-08dc6a3ed231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|7416005|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?1QMqElXeCqFjLQXHcTzDnVygRky25BofQFpiRTOSFrI2EX/xtqUmsFJuW5eJ?=
 =?us-ascii?Q?wLAbZv9JCdV0gErgqKWqZ+00K7/azYHAMLMpsiondY6Hk5cRYsxdOIc+Lnfq?=
 =?us-ascii?Q?aGXgz5b+pcbYFS/kfQyVK0E4ajF/JsAcLzgQOWpODIajkmynSbYNPEVZPR43?=
 =?us-ascii?Q?DVdrR0lptvTQl/qsiK1L2Ki4WJ1ggAVsty6ipJVVOaDeRYN2eFSje+n/V4SK?=
 =?us-ascii?Q?FRbShhaGkJThkAzI1SiAhAAuuzthpec4N5xnBRVe6hvQ9tRd9zDRfC+olLmv?=
 =?us-ascii?Q?hmeB3gDaQS4EFsdFtIYIEUNeHVf9pZzp9tww4eEj5eSH8TaDW/X99vQ0Vyfp?=
 =?us-ascii?Q?siSlrg//L71WLgXMPmsPsJx0qVveP0GNLiRih6HNGSQLwgKbA0rewLF+GvsD?=
 =?us-ascii?Q?S4JY4PM3UPPTbg9RJQ4xF2c5A5UldDuChGihQ+qAE/Ngz2Cjph+f06uiVGKk?=
 =?us-ascii?Q?w0mWso1WBPWdCwOVfmhp1X5BJLQJgjmbXtCsO3lX1kJpo42CQLn5CCFSosV0?=
 =?us-ascii?Q?o7spyqaMlp9s6T0lyIklqdzqei8dEx0B+CkPDIMWR/Zm1EIW/NuCxN577b88?=
 =?us-ascii?Q?M8xXhygwWY3qgU7tEpsEzVG6xXnW54hs5LPSOZaC/RpDAkhkxa+224VBIet8?=
 =?us-ascii?Q?8IBfBObrHscd1mnhJyK6ymwW0iakOJwN7VJQ6SoBoq9WO9Eo3nkPtOSqbxJq?=
 =?us-ascii?Q?kzH+3b3/p/mx/LrtyhDTwMhFClCIsunacWjTvemmr5YM9omjXw7wpV0Zl0K+?=
 =?us-ascii?Q?8XfS5UjdqqCZy/GbkIwpNttFWMqwkILaohgxtJC4XKPn3Q8cC2mRhAAymnXy?=
 =?us-ascii?Q?ttqoGakLRKMIWa1oykfHXz5q/2BF3qBJCrJjzyZREF9UQs9GESUvmpswzSk5?=
 =?us-ascii?Q?EOR/l8Vzw+s0n/VzJjVZ3nFrNGer33JhlbH6v94Kk0JKgEyCir5n9Xpu4bUU?=
 =?us-ascii?Q?N6/Ze8YBRDleHk9asy1MnjbNK81uXsRCq4AuKR2F+3HToHJd0RV/c4HgFPNm?=
 =?us-ascii?Q?19rpSaRSd+fiE5uZKNhw3Xp7AaHmT6Zs7A6g11xxntvdkW+doVoccvm4DzAe?=
 =?us-ascii?Q?G0cwHEJTXzkwM9XO58nstGUuKLWcAFXFQ36c9j/ZR0HsdkdhA/tktrGh66Sv?=
 =?us-ascii?Q?ekiRtGidaBMmioh1NDa9BMt5zSTo1ZJ2lqcwmt5b/fYHIu0DKjA35e6y/zbU?=
 =?us-ascii?Q?axpyIJw9CpP0cDfIqK40U36VjuGYCY1aEeBfyeDIvw7FLoF938sefH54oXqN?=
 =?us-ascii?Q?RVSWKEFg6XTWo8htb3U21KdUG2DxexWe5s4Xu6LQ4jgIPuyiIGCLZQnOkFAF?=
 =?us-ascii?Q?eczaQeLAqYGS4xZRzvZPbMRoDBLbkagKzXqkkRGCGBVg2w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CpVog6jI5OKurZJAU0XhgI1TVxEpz+zzjIglGeKnV+kYFgVQpUJpj7oZv3l/?=
 =?us-ascii?Q?9ctRCgWOY6x1qJhee0xaWwqwctu7Wuvns8lNyx7oviqqyHUUvy6SPcTuJ6B+?=
 =?us-ascii?Q?6iyauZENPOgyHvMId0Cv49R6ET82zHf+4DE64UqiVvZmcnNPnu7rxPopKYSW?=
 =?us-ascii?Q?yU58e61oGCEMcZmfVX8yWz2kcPMoy3O8ZXFah3zc2w7hsJ78ESjRrwDaS7Vr?=
 =?us-ascii?Q?z1LTyZ9qzsUHjoLcXrcisqMH3ALAHEs9qCK0Ru2L92WLy7gLpFah7fUXORUf?=
 =?us-ascii?Q?c7M0HFoT6Imcjwqf9XmhkjV6i6gC/U99qWbo5hN7L8viTGos5vs+RxDN6pND?=
 =?us-ascii?Q?lTgF2lVblVe1+XEO1eyOzYwP7txpzHSbh7eetLm+BBvNEwO0WP0PgjmnTq3L?=
 =?us-ascii?Q?4yZNVNmMivRqrgTBU51WmTiAgdoPespEhCI7nee804oqvY7U9H40ATRtH5H2?=
 =?us-ascii?Q?djif00m+tGZc6hETjDC6W/M090h1cl3JSTgZS9NTrkbPRZpvFDbqYhDPyecg?=
 =?us-ascii?Q?JAm4GK+zZIJkM+F90n6OCf9tNTzUbsYaJ7Sl6+/5j/TQS2LmlTEhVnt+Iwfj?=
 =?us-ascii?Q?mdhe5BZ6GsUsFvZ6zpVBhkSpqoNyoHWn/asmsQ7onmc9YLQTiU0DAMvAds9G?=
 =?us-ascii?Q?lEgP3xit9oKfgf+vVENqo+vjSHsvlWfagbvqtMoFJqH7WvrFMIr5o7YNpRGL?=
 =?us-ascii?Q?DJlY/ctBGpD5E2qoBx7MQuXxkw1ynJ+HYUf0duzLqSoIA8FbvyTaIE8AQzdu?=
 =?us-ascii?Q?qEYwgem8x/BYwRA68JB/mq03MtqofZU3rVUNjp/lLQdm+e7vib88gY3P3Aoq?=
 =?us-ascii?Q?TAvPAa25ygj7ALXkOmtJqs6ODgTB05UTyi7vc09ZloVFM1oakNTjUTNmyIO3?=
 =?us-ascii?Q?poINkGPCg59gJRY7tNWEFWVADaWAdhM/4ZUejxDLWDfXD6JauuWwSjKtB4ZY?=
 =?us-ascii?Q?2OfmKInCQYJXC9SpROmHIGsxdKYWj6Ak+ReFhZcA1045HRoQLN4dMIolMP1J?=
 =?us-ascii?Q?2XZooo3r513l1OjIFtMxbHbGUTyDLTSL9CeEFtNuH9lYY1neQVDE5TLLAFHK?=
 =?us-ascii?Q?T6F6rPT3ym4RCTi1nMyEyINBn5stuTTBM1vNIGX1BkitfCLoeb7h0C/BXQx5?=
 =?us-ascii?Q?cWApztl5EWXgXUUepSshbgc0y432VcIqkx2Zi24uRRXMjJ2JFV7Ji9T+tlBn?=
 =?us-ascii?Q?7+R8rOng04OEm0IVdodMODxDorPGeDoieMZDAM4f+N6TEt6B5tPkFMn+8Asz?=
 =?us-ascii?Q?Y4YhwUbmB9/tiCYMpzRNlNjnQ+HvTshWEeza0kd1+uREqyzE659qp9lYq4D8?=
 =?us-ascii?Q?lcjn9+5rFgiyBbWMFzW+zVOidSuWBcRqmNavWcGyUMPDZkfC3m4fvsikRqq5?=
 =?us-ascii?Q?5INb2gRbOW0Ikx4UP01fOyzh9mJ5iYwNAtHentOnZEmV/p7U43dAnPGYaB6H?=
 =?us-ascii?Q?KOEdPq5sPTa6MCiycNaRAEsE1h0kbeqUsFAqxSl8hRqOoSQ2eS5nn9tnmeH2?=
 =?us-ascii?Q?F5+MhyIQUO1O+jfaeawPnqU8JLJH2aNxcG5M+rAvb8kpbRWTFO5KpYL1PScE?=
 =?us-ascii?Q?dZHQSv7K2xuIaqpD2Zw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65567ff6-a480-4765-c129-08dc6a3ed231
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 00:28:42.6706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI8YFo/Skwu6zxqn8HobTDaVWaQ3DE1QfrDFSC77Z1GbtbvHAb/vXlE5OMCOq7z2b7VvcAGEVu75OyLmNIggOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_172849_634117_FEE0566D 
X-CRM114-Status: GOOD (  23.80  )
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

> Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
> cleanups
> 
> On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> > @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct
> platform_device *pdev)
> >  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to register pinctrl\n");
> > -		goto exit_out;
> > +		return ret;
> >  	}
> >
> >  	platform_set_drvdata(pdev, iod);
> >
> >  	return pinctrl_enable(iod->pctl);
> > -
> > -exit_out:
> > -	of_node_put(np);
> > -	return ret;
> >  }
> 
> This will call of_node_put() on the success path so it's a behavior change.  The
> original code is buggy, it's supposed to call of_node_put() on the success path
> here or in ti_iodelay_remove().
> 
> If it's supposed to call of_node_put() here, then fine, this is bugfix but if it's
> supposed to call it in ti_iodelay_remove() then we need to save the pointer
> somewhere using no_free_ptr().  Probably saving ->np is the safest choice?
> 
> The original code is already a little bit buggy because it doesn't check for
> pinctrl_enable() errors and cleanup.

It was introduced by 
commit 6118714275f0a313ecc296a87ed1af32d9691bed (tag: pinctrl-v4.11-4)
Author: Tony Lindgren <tony@atomide.com>
Date:   Thu Mar 30 09:16:39 2017 -0700

    pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()

of_node_put is expected in probe, not in remove.

Thanks,
Peng.

> 
> 
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-
> iodelay.c
> index 040f2c46a868..f40a1476e4ff 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -156,6 +156,7 @@ struct ti_iodelay_device {
> 
>  	const struct ti_iodelay_reg_data *reg_data;
>  	struct ti_iodelay_reg_values reg_init_conf_values;
> +	struct device_node *np;
>  };
> 
>  /**
> @@ -884,7 +885,12 @@ static int ti_iodelay_probe(struct platform_device
> *pdev)
> 
>  	platform_set_drvdata(pdev, iod);
> 
> -	return pinctrl_enable(iod->pctl);
> +	ret = pinctrl_enable(iod->pctl);
> +	if (ret)
> +		goto exit_out;
> +
> +	iod->np = no_free_ptr(np);
> +	return 0;
> 
>  exit_out:
>  	of_node_put(np);
> @@ -903,6 +909,7 @@ static void ti_iodelay_remove(struct platform_device
> *pdev)
>  		pinctrl_unregister(iod->pctl);
> 
>  	ti_iodelay_pinconf_deinit_dev(iod);
> +	of_node_put(iod->np);
> 
>  	/* Expect other allocations to be freed by devm */  }
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
