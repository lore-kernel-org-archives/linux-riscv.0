Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B7EFCE3A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWVMLcAI5J3Z9n0j8ugJScG5eEHnaH7/ZThDS6ae0dM=; b=tEwmEQa3+2xcYn
	z8R4MbtXgSWt1jcNRWM9iT3gC/m4I+JMnBqbWvAypWB/Vv9JrCGu31BbBuk8OMOQdcbVSQKRRgFvb
	MYJUlMqe6J7JA0WF51mwCZGQfp+XyLctxP0TQgLtEz8duJSnsXNFGpUskkOKGzVHv2EHwRejil84o
	MramhYP1wiBbMYJXgjsaPo9D/qGlJw3T54G38Vp1qu8CNlC5JlkJR6bS5RtKuBaZ0Ex7pWaOKlQju
	BklNOXxL26lmSjUKUFhV/veqlNPhY/uwF3JZur0hk6zzw4PneXh4hn5OPBs7cISis+265+jBJ7XDu
	KX/0YJi+/qS9O8DtRb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqW0-00000000Df9-30gW;
	Wed, 04 Mar 2026 18:00:08 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqVw-00000000DWN-1vQ3;
	Wed, 04 Mar 2026 18:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVjxfQT52nb0MpOgoXSusonG7HV/0TICgegzgkmanT7fwewNLkQga3Exlz2jBswUycCUIxQHAphPnRHPuVB6eV3ANWauCTNAksCF+SpfT8Y8l8xhpaGXmvO1Zd+rJqlfwaDdHCSjxvybRyQoBZzlxjuoTrsOe0wuzl/wwKYzTkJoslulwQYH1Jt5qHrk2BNeA/0NNjdsfAh+LPq0fSbAKy6JX5IhF6wMgl/1IVUdrbcMswxB4XY+rm09USPTekcIn637IM38XVDZz2CWBpnnm6H+86Vd4Y78Ih0VUnCLGOE2h76F9S4g1fGYsv+gerij90vUw8ZSEaj0AQ4a9OGkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceHfKrwDkaVZ4m9zNZBUXFNT+TcYWEWBtyTjhfMj9cU=;
 b=n9M18o3GGwtF/Sl1H60TyTrdkEJdmzI71pe5hEvrHxZFdW16vHlcAdpyVlKfWMIZmPuQ47zbGJNNgnOjIFH5woDdDo2Z90Dq0srf+7mxWhnhDlI6jJBj7vSHNZYd9mynkPguIUMN+aST5s/af0J+sLgbf6dcyJsjYMPAAqmdn9CAALZGvFLHIasPd2G8/OVcjs9TZrov+cWdLresEy57dbXSAtgsAIhRwhy7AEjBJmC5go7nnnpWUG0IVhlh8mpJZ5nrVQqiKfl35mX764+e+raW2lyyCCR5KRE8spCH2SoqEuRd95Tw/2cqxGouadxKtZM5jn48R26IKVVnqHV27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceHfKrwDkaVZ4m9zNZBUXFNT+TcYWEWBtyTjhfMj9cU=;
 b=Lr04GwQMSMzAYALP5MctuqoXmXPdC4QQu4jILcU8JZSeiid+bQNXkyptHop1A/D3HOYvb1DfJsgH5mYE3TQhCjjXVRwx8xVkCZrmKdSro7wMJyuYs8EQAI34hgy0+GzVI7VC7r2QWndRuFpL2JkmkzbYpuhOLhGGYF8jNlafwpFwTJRm5hATmX+ha1XdtYG2ui9tutsaqdydxwFS7+7gO1PoH1SGc8tylzx/7JlSVPkpXblM7JfGZRJ3mMna3+Zgx9jzlTnmp9vZ57CIwUz7qfPX5b2egW61p7qXbCzybkSvIGavAHlCS0UmXDmaxKf7XQS2raYOHFy5Ik93Y0z+wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:59:55 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:55 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH phy-next 02/22] PCI: add missing headers transitively included by <linux/phy/phy.h>
Date: Wed,  4 Mar 2026 19:57:15 +0200
Message-ID: <20260304175735.2660419-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: e527be39-3114-4308-110a-08de7a17d783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: heHpzibL5yMUPRIdgqqyA/uh8XF6rOwwrWh8P/m60Mu8vDZueugso0NxEQSwJ2yg6GBxNo+m3xK8sc8V/OAVe+OE36IDqZEnBuM5+NrJSvMc7NsN1G23x4VvqZwsLbwJjuaFTxk+oZmhR5gIIxjEWvsV7KybvUJf8pkUyEnH4ZbHeqmYhM65JfK7+lbIRdk3BeLY4rCwV4IoH3RrUK0eGkQGa4iHtT+KahX1erhxFexE6/FZFtE0IfSDFdb/0C6JuEk9GeHaKxWj3ug89snhcX4ux9Ma5FgDxI1f9/NR+jndd5FkOdKE/ZQESTpMweokx0hBoF5ruOVVe1fAXh7HzrcIWA+aHEW0OmBhbpIR0UZEWraSMEQ4s6A+xYWtwKn+kYqL0ipiVs/M/+JH/i59pQanLpnzOYO/v3ITgdwzb7M0cvoIoOlwW8UoFrDBEgrYO7qPEILOkWIOYyvQxqJmeLc2eKT3IqxzvfHs4po1+J2FNp5T4buIGOsItykTGQ+xC4f7U4kTcNHonI+qO18EDFcUMBMSbADxDyccd4qO4iqoq3shkxGbCAxUTMyoW2352AAGueroL1YuLJZ7AdtTUMy4MNDyRrIJ/t4WVRRax0vi8/zcTpAPh3SlCuPKgTDdgo+RMVbKPj85aXjz3cDJ6CH7kp4BmeH7Qy7Fyhf3y0T4Pxz8eDjn3bm3ToJrD/6nUv0an60EfCtzT5F2PpJmUmErUDwx+29USuMYZSgmDfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNnN0pYdm5VYWpTTGFkWFNSdThrV05PMnh6Szh6WVd6MW9pNGJ5cTBSRVRL?=
 =?utf-8?B?UUVHRGFUWS9CY1RGbkRERWgzTnU0K1ZyeER5M1ltUEdqODJSOVBPK1BlT2ZL?=
 =?utf-8?B?bVFFcnJPZk9RRUEzL3c0Y25BV0xRZk5Ud28zUGw1dDZEaXZqcE9ETWRvbFdW?=
 =?utf-8?B?bWhHbXFKQTBYVGxxUWMzWnZmZW1tTTJFSU5zSUdnRG9GQzJrYkdyME9GUXFU?=
 =?utf-8?B?N2tLYnpCWElLMFU1aXBrU2x0OVhrQUlNc29FRy9MSTk0SkExdTJNZ3pJTzBS?=
 =?utf-8?B?eXFoY1lGaGJvUjR5UE1MSC9lMXpQajgyQUpOUzhVRDRaU2dzdjNPb1FlQUta?=
 =?utf-8?B?aXdPSGNraHAycUo3eGdQN1pGbWMranpVbkFZNnAvNTFXTStoOVprZmFtY3hx?=
 =?utf-8?B?dFFrQ2xQTVhmODhTbUU5dmh5VkdUaXM3U00ybmVJMjRSWmd4UVZORUd3S0Na?=
 =?utf-8?B?VnVFdGZzTkgrVkI3aURNY1Q0VU81WUhlM0JrOFAvUkN1dnRudForV2QrajFR?=
 =?utf-8?B?akdPZzlTSGROMUQ0a2hBeldBS3dORUNubVpuMTF0TkNIaDV3dGMvaDA4S3dR?=
 =?utf-8?B?K3hxZnFqMWs1b2pPN3RSTkpaa3RIbVdlbVlsRU1LeklZOTRhZHpkZDVmT25z?=
 =?utf-8?B?Z2ZGR0N5Szg5QVRQTktseHd3R1dwViswZnFIWlJ0RjRoQkE5elNwOU81aWMv?=
 =?utf-8?B?NDRJOFgwWUEwUDRBRE9TUmNCME1LdStKSzg1Q2w5M1UyN3dYZG5qaDBKaWQ3?=
 =?utf-8?B?aDNZSmliR0pvV2IvMVRzYUw2UXZUOVRlYTBmVTZKNnBkT3FoVTFxZWdxSWZD?=
 =?utf-8?B?OUVPNE9weDdDYVZNM0RIWTlYNncxbkQvYmJtNjBENFdBQ0RYNnFJZ3ZnS090?=
 =?utf-8?B?TG90YktvRkFJRVF1NkM1QWtEWXhUdlFKWG9CaGJ0WUJBV1FmS0VKRExmK3BC?=
 =?utf-8?B?bmYyaE9ndURFWFNYKzRiaVZMRDBnMGFsaDkxZmgzMC9CK2s0QUN5ams1dU9U?=
 =?utf-8?B?L2FFMHpnSkkvWStlb1k5K0xud3hSZzVsNkZHS2JkQ0xTSmU4Ty9Ub1NKaUxz?=
 =?utf-8?B?SUtMQ0tiMFN1U05xTXpaK3V0R1M0NFRIeks5SHAwZDR2bFU2OVBmazRaQ1hI?=
 =?utf-8?B?NE52QkkvRllXOGtXZVpjL1RhNVVuNnhzRmMrcmVXTUZsYmlaUzBsL000Tm1l?=
 =?utf-8?B?cjhvb3hyZ2ZLYkhNaXZ3bWZCRjRtNzVpTnVDUmZ1YzBxOWtGWUY2NGsvVHJk?=
 =?utf-8?B?WnYzZEpackd1NlY1azhzUWR2cXB4UWNEWDFIdDRGUjlZMUhORVVkSXIyOEt2?=
 =?utf-8?B?VVdlVTB3MDBIWGxuejNyR1NSOTljT1I0Z1BnWlZaR3lvL1JrdWRrV25sWjBW?=
 =?utf-8?B?WHhhQVhtY0hUcFUwNjk4YkZCRUw0c081VWpjM2oxMnEyZ3BnOSs4bFN2N0FV?=
 =?utf-8?B?WGozM3hoRXVIZXlsMlcrQVE3UFBsbURYei8rYWZNN3FxWTY1WlZHcXQ0VkJy?=
 =?utf-8?B?Yy9Bd2hMdExRZzJHUE10b09hTjhjVG1YcHU2VjAvV0F5Undvdkt2ZlhWd1du?=
 =?utf-8?B?ZU5mTTBqL0FIaFVzVmJnUDVJYUx6Um1MaWN0TzhMMWhwZUltS29wYTlBZHAy?=
 =?utf-8?B?cmUrTlBCd3hyV3ZiV3V6QVp1VDJqR09SUWQ4V0l6QXFpTFJXM2RNRjlUMlky?=
 =?utf-8?B?WERCVnc2Tk1DeVdZZktFU3dZSjdHbzRTcjJIQkNJVWt1aEZGRkw0MjZwaHRo?=
 =?utf-8?B?a2ZwNjhVQUhvK0t1dDNPd3RtbWZxUFB2S2lQTFQzS21USkhDL2pzTisxNU5Y?=
 =?utf-8?B?SkN6c1JDenRZMG12TVkyUEdBRlNINjRuaEdHcS9tTXNaQXQ2UlhCUzdaWjJI?=
 =?utf-8?B?LzlGNXdPcStVZ2Z2Q1lmUFZJb0dKUHN5WlVJMGljRXF6L0V5WkMzaWNkaXpa?=
 =?utf-8?B?b2xtVmhVbjRWWkQxc1FNMXZRYU14UDNKQXdRM3ZsTGg5aVFsWU92OUc4TnJ6?=
 =?utf-8?B?OGtyMXFDMTRKMXVSajB6aHR3SXg2dHdscCtGV05pdVN4ejExcXA4aWhzeG9P?=
 =?utf-8?B?UE5sNWZRTmFQWlZDMmhrb3dyaXdHRk9DYkxlVk10UE02Qzh4SmdCZGNBV2lz?=
 =?utf-8?B?WVJFbCt0Qm5qZStoekRmcmZ5TlExd2tFU00wSEx5NUVLbUt3eDhWMTU0cGR3?=
 =?utf-8?B?VzQwQlptUkpkU3kvM2lMOEJNNXYzOVlqQ2lTL2kzOFFpUFVMdk5zb2ppQXBk?=
 =?utf-8?B?d2RnV0hBelU0RHk2SkdhSzhuc016WTMvakNFbVVXNGlpRmxGQmg2RDMvZldC?=
 =?utf-8?B?djAxam8vUVFlc2xJY1FteHRmZW53WWFpeEdlV09ZUzd6TWc5NHlFMjZDV0NH?=
 =?utf-8?Q?8R6L32K4+0acQw3mYde8m1WQ/1bI8go74d6MswJEXaG/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: gKA0zf/rB60xVdvMek8KHBflZ0DvKLoyDCg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e527be39-3114-4308-110a-08de7a17d783
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:55.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlbY4RZo+pvONRpeWBWLMqWRt+EjQNkwOPrKJAoZao55rfsYU6rp6W/5LbvSYlXeeHg7V3BcVsKoBYC2eSGVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100004_512244_D0933CF8 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIHRlZ3JhIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSSBjb250cm9sbGVyIGRyaXZlcnMgdXNl
cyBQTSBydW50aW1lCm9wZXJhdGlvbnMgd2l0aG91dCBpbmNsdWRpbmcgdGhlIHJlcXVpcmVkIDxs
aW51eC9wbV9ydW50aW1lLmg+IGhlYWRlci4KClNpbWlsYXJseSwgcGNpZS1yb2NrY2hpcC1ob3N0
LCBwY2llLXN0YXJmaXZlIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSQpjb250cm9sbGVycyB1c2Ug
dGhlIHJlZ3VsYXRvciBjb25zdW1lciBBUEkgd2l0aG91dCBpbmNsdWRpbmcKPGxpbnV4L3JlZ3Vs
YXRvci9jb25zdW1lci5oPi4KCkl0IHNlZW1zIHRoZXNlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2Vy
ZSBpbmRpcmVjdGx5IHByb3ZpZGVkIGJ5CjxsaW51eC9waHkvcGh5Lmg+LCBtb3N0bHkgYnkgbWlz
dGFrZSAobm9uZSBvZiB0aGUgZnVuY3Rpb25zIGl0IGV4cG9ydHMKbmVlZCBpdCkuCgpCZWZvcmUg
dGhlIFBIWSBoZWFkZXIgY2FuIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGluY2x1ZGVzLCBtYWtlIHN1
cmUgdGhlClBDSSBjb250cm9sbGVyIGRyaXZlcnMgaW5jbHVkZSB3aGF0IHRoZXkgdXNlLgoKU2ln
bmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KLS0t
CkNjOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgpDYzogIktyenlz
enRvZiBXaWxjennFhHNraSIgPGt3aWxjenluc2tpQGtlcm5lbC5vcmc+CkNjOiBNYW5pdmFubmFu
IFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+CkNjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDYzogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IFNoYXduIEd1byA8c2hhd24uZ3VvQGxpbmFy
by5vcmc+CkNjOiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4KQ2M6IFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBKb25hdGhhbiBIdW50ZXIgPGpvbmF0aGFu
aEBudmlkaWEuY29tPgpDYzogU2hhd24gTGluIDxzaGF3bi5saW5Acm9jay1jaGlwcy5jb20+CkNj
OiBLZXZpbiBYaWUgPGtldmluLnhpZUBzdGFyZml2ZXRlY2guY29tPgotLS0KIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWhpc3RiLmMgICAgICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS1lcC5jICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1zcGFjZW1pdC1rMS5jIHwgMiArKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS10ZWdyYTE5NC5jICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5j
ICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1o
b3N0LmMgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUu
YyAgIHwgMSArCiA5IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCmluZGV4IDIwZmE0ZGFkYjgyYS4uNjQyZTRj
NDVlZWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3Rv
bmUuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYwpAQCAt
MjQsNiArMjQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29mX3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4
L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRl
IDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVk
ZSA8bGludXgvcmVzb3VyY2UuaD4KICNpbmNsdWRlIDxsaW51eC9zaWduYWwuaD4KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYwppbmRleCA1YjE3ZGE2MzE1
MWQuLmUwMDc5ZWMxMDhhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1kdy1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZHctcm9ja2NoaXAuYwpAQCAtMjEsNiArMjEsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHku
aD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRl
IDxsaW51eC9yZXNldC5oPgogCiAjaW5jbHVkZSAiLi4vLi4vcGNpLmgiCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMKaW5kZXggYTUyMDcxNTg5Mzc3Li40MzJhNTRjNWJmY2Ug
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYworKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMKQEAgLTE4LDYgKzE4LDcg
QEAKICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxh
dG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2UuaD4KICNpbmNsdWRlIDxs
aW51eC9yZXNldC5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLXFjb20tZXAuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5j
CmluZGV4IDE4NDYwZjAxYjJjNi4uZTQxNzEyMmRhNTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLXFjb20tZXAuYwpAQCAtMTksNiArMTksNyBAQAogI2luY2x1ZGUgPGxpbnV4
L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRl
IDxsaW51eC9wbV9kb21haW4uaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtc3BhY2VtaXQtazEuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3Bh
Y2VtaXQtazEuYwppbmRleCBiZTIwYTUyMDI1NWIuLmRiZWMxNTlmZDQ1OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCisrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BhY2VtaXQtazEuYwpAQCAtMTUsNyArMTUsOSBA
QAogI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Bo
eS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxs
aW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8
bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNp
bmNsdWRlIDxsaW51eC90eXBlcy5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXRlZ3JhMTk0LmMKaW5kZXggMDY1NzFkODA2YWIzLi4zMzc4YTg5NTgwYWIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYworKysgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMKQEAgLTI3LDYgKzI3LDcgQEAKICNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50
aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxh
dG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51
eC9yZXNvdXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CmRpZmYgLS1naXQgYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktdGVncmEuYwppbmRleCA1MTIzMDk3NjNkMWYuLmEyYzE2NjJiNmU4MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYworKysgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS10ZWdyYS5jCkBAIC0zNiw2ICszNiw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5
L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1yb2NrY2hpcC1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAt
aG9zdC5jCmluZGV4IGVlMTgyMmNhMDFkYi4uNDZhZGI0NTgyZmNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNs
dWRlIDxsaW51eC9vZl9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2Nv
bnN1bWVyLmg+CiAKICNpbmNsdWRlICIuLi9wY2kuaCIKICNpbmNsdWRlICJwY2llLXJvY2tjaGlw
LmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2
ZS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYwppbmRleCAy
OTgwMzZjM2U3ZjkuLjIyMzQ0Y2NhMTY3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bs
ZGEvcGNpZS1zdGFyZml2ZS5jCkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUg
PGxpbnV4L3JlZ21hcC5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgog
I2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSAiLi4vLi4vcGNpLmgiCiAKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
