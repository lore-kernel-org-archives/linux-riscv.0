Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3097610F286A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buWZdn9tQ0ZmdVFYmuy/9Xauqo8FBa95swmaEBBdbl0=; b=vTqcgoTxfckG5Y
	OIQOCJZXJ5TYmJ+sUnLx1906FYUKyxxzj26507ezkuGNFhCVlNAyjq8qi+A42iqW5n9ArZgqPvT3g
	LwqbNLcxv24I9JU4efK80KhPprNjS/c+tPmDHlQhLwOH/qOd9JetF7+5R6gIpNOPMDV8bLJF+Hq3L
	GuFgysh30OZ4htIE+hadgC8U46Esq3xqEcEP+rnZy/cs6XfY9lnsIwhxF1cjoDmSKwxUN0Z4HGqCO
	WbU/sz/z1g72NBAB+KqrUtnsW6WwFDmenHkDddHx7aHatxgDsiy3lyFWPVxKIK0m4MwLCBLJ/U9ag
	pD9MFQUn9XT2McQ+3pwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CEn-00000007xzD-1Frg;
	Fri, 27 Mar 2026 18:48:53 +0000
Received: from mail-westeuropeazon11010029.outbound.protection.outlook.com ([52.101.69.29] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CEf-00000007xrb-0ia1;
	Fri, 27 Mar 2026 18:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyORp+neUyWe6h5BJWUQe5OFFBqlkFc2SFkylVENgnqkKQKUKwAWY5ZcweBVlGn+u/1yJBnsBXZwf2/kCs2KH7QgRuZnvM0eAwPPJ5YZujNDv4kZGkMMl91G8zbHIuhtX5caVW8BYphhUs5LECWfJGZPGPEqfRwGXtEON02b5UM0Dz98pTIJ7B5R45g0KOlPvyMWzSzVPJUQqGHcx6p9CxLGAAHdK5PkdHwF3Qm/VgkDCF3/3eIND61wxT2tcvP42LszKtx4ZZrWMBWU7P7P1J/udr/NlkRof3FH4IFkU51MIRttCt0Jl+NQIjcpofIAHdDkB/3iT0Y0ZN3Ccd1Nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HxD0fDZKv4y+yv55+7ZCY9qLarNtQ6qqm8o2xNuXOo=;
 b=DNP3X0+8OTC3K100DzHObXhuVzkwT/RxqP/mpRVt5iHvIoqeyWm8a/PoaFAKMf4FnAqBh5KNot9DT82kupId0ByX3sWbWJIKULggvoKzuVrSb/EtYJoYRuE+yEjEQIY7wVTygCcmXVE+UkyWKa4XPXqRalmfjGppEaMCTUcwZ/OON/NIGKdRNROZrPyrTpgqg9X6hbDiwfTGwB2ZqXr96ZXVPw56XHW/sTX9AVhueHFPbr2Q2GKLph0+wolX7cufpyfyrobzqxbhA+S71ddwT3nP5mAh6IC1/8YbANG9o0tMjCbysPcJk7Bv6DJ4fssYaXyVv7u9ZzE+nEfnY08hjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HxD0fDZKv4y+yv55+7ZCY9qLarNtQ6qqm8o2xNuXOo=;
 b=afLtgcGR1mnDeIo7U+phrTWq2wE++XMv8CgFLHjSfoQdNbIDPHlKlzXSUq82yIpwJu1CDzpdgMJtfYRk0lc02kOIVCZ3SLlX+Hocd7wn1et7fExbRSMCPKcM74frnI7RQOyDOpdRinX1iJmgkRXp/mqmiWcL9Tid89SMhTliK3rPtOgN3fVOweoraC/rNxjOmb73zfwiarMRwQiUM2k65LuhGp7fjgaGK35gAjYudvVmA+T0FPbxNrcioYY2b5IISWxnY8fTLmLFGuWhwlrSfw8w6HpYSeDRr7Ui9ejWWqWJJxERLYhc+0KIqa4xS/OF5ArBRuyO+LKn07xWQcez3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 18:48:36 +0000
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d]) by DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:48:36 +0000
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
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH v6 phy-next 02/28] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Fri, 27 Mar 2026 20:46:40 +0200
Message-ID: <20260327184706.1600329-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VIXP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::12) To DU2PR04MB8584.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_|MRWPR04MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa4a6ae-7795-41ae-b4ba-08de8c317426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|19092799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: xzl6cguwBDN1PFigv1w+gKpYe5QVQavLZI+o2EHO6XShfoduglQY4L2EF9hAVPtwJhghl+ZVjhPWHxkbBUzwa53wrmjL1GF0aCHDTFQ8riVkO3cHme551yUGf94s92fRd+XJruUUIq0z35ieZah1vhSFnF4K388Sxtqx6qQ6FEpAeGi8tcqijS4wizJVxiRY62lUj6ZQ5CVpeA3mYqf2q+yi+7G9YAzb4qPJiDC/erIg9VIQcmKRk8NTR9IlD7Xhw2q3ZX50dVWHgmzxKNcWOHCP6rXYJcT7ytI5NNTHLxHfMXOs3BMJnW65yaBK6tFFZw4AnUR+ahGhbw+zNLzQz6MXAKmKS9UpQgQfh/jvF8/8+x+3TsbwvwwEJk3SiRL6ZEehtfZ5ADvyMr30OqXtHf288KzszCpoYLFfbm4OecLR+yHxNq0GEwN8WC83lNbvarloae3LhC1jLghQrpetiGa5BaLo9hHSGO+DvFMqpQ7i5tLDq+pqmwBubkVdzUNHDJu0FxNl6KqtXkP0vs49S0yRnlOk/SLs05k84dtSRWNiA2EcVtZlNEXgufz+8Ft7SeZsIfYHg3799qRFMyOGvatOBAmX7bCCbgOpC2EfqZn22fK8RlTv2gemT22eG+Wx1Cuvu/ygJ8aqft2niE433IJhcdXAnWQpe93OTqhPx9iTV52XhgMfRt34jpBYvgu4NLewiyiLrkjqRkEHk8sUdC6iZD8SpGbjesl6iKvcL78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8584.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(19092799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjI5ODZBaXFOcXBRRU1rRjNsRDFmd1JqNzcrQ3VGblRYMEJGTzZQK1J2OS9M?=
 =?utf-8?B?NmhESHh1MGZwdUxaY2RvTzRjSDE5ODJCVDEzU09xOTB4TkJJSlVQZWlwd1Fv?=
 =?utf-8?B?OW1jTnorTE1waUxVNFQyOUplODA3ZnlnTkxCZE1DbkhUdkRYOVpoWmVFcVZ4?=
 =?utf-8?B?NGx6THNZU0NkUGFqYytsK3JiOWtGM1NmL0IxS1NGVXBKZmdTSGVqa2hLd1Vw?=
 =?utf-8?B?dUlQcGppTmF3SEV6QTVYUEg2Vnhpd2RXUHdKZmk0aDFKVFhidWdzQkFMV0h3?=
 =?utf-8?B?WFVvTEVyOE1zb0R5dkFocXZlQXo5U0drVEFrRVQwRnRnSDcxNUZPM0lKOGJj?=
 =?utf-8?B?aVhSSWFzamx5eS93bEVuSzM3d1c2RTh3UlBOZm9wSHVpdnlQQ0gwMUlQQzQ4?=
 =?utf-8?B?M1RiYXFsSjZDMVdLMVF5d0RtNFJveGlJZXRUTE1kWGVOTXRlbitpQS9mQkNT?=
 =?utf-8?B?azRqaTJVRG5lRU90MjkrcXByaW1aOWI0SkFDMTNNMXd2ZmVoQjY3WnFSMjZU?=
 =?utf-8?B?dndYUk02MzhkZ3doenJLV0lDQ3VzRnFNcDhYWWRIYkNxbWhMV1NGeE96cXZS?=
 =?utf-8?B?MVMzNmtMK1U2c0Q1V21qUkN5dUNIM29HeENIM3ZiUnpVREdWZ1p3bE5YVHhm?=
 =?utf-8?B?UnJENTRtTm5ac09rblU5cmpRbXpaWGVReUZJd0Z4bHFxMU81R2JzaTNyQlF6?=
 =?utf-8?B?NEczQktLK0MrQ2I4KzdJekFHUDlOZFoyMmVaZ09ZQjMwczJJcjBmK083dFF4?=
 =?utf-8?B?dVlqUmRsQWlwNTRJa3JnczV6dWhFWlB6bHd3cHl2MW45b0pielBEbHFuYk9M?=
 =?utf-8?B?YTVTTENkYWc3aFYxbmRieXhhZ3NmSHo4anhoNHlsT2JjdnRwUFFiZFBZejV0?=
 =?utf-8?B?OUhzenlSMkxWVklnSVh0WHBSRzEwOEF0NWhqSWhjY1lFRTBjRzNEVEtIMWpw?=
 =?utf-8?B?RG1WZk9uRTRPNEQ0N1dsSlVsbXl4OTBONGdqdFF6VEVKc2tmSDd4Q2ErSUV3?=
 =?utf-8?B?RDcvK0pEVWFEeGwzVHRKQ1RrR3VFaVpiUVpaaUFJNkFneVRaMmJ6SHhSS3Nz?=
 =?utf-8?B?NXRLVVgxNlBUK0Y2R0hBdkVzV00vaXg0QlNOMFRkVzFaRVd4VU0wc2xBbktm?=
 =?utf-8?B?SG5JR0lKUzl0N1hBUHQ1M1J1dzRnU0wwL1ZIcm5BV2Z6Mkg2QVBIK2daM3B3?=
 =?utf-8?B?clEyOUFRT1hlVDB3bmJFdnhBbzQ3TFpNUWJKY0Era3Mza3ZKSzdzQVRwYmVD?=
 =?utf-8?B?d3VIWG9DcUs4TU1Da3lhR29ZLzNDa21lb3JRVXg3YllMU29jNlNjTENXZG41?=
 =?utf-8?B?Z0FRcmpTTDFFdVdjb0dGb1RUNzYyTmR0c1ZlU3JueUc3RXhMUG5ZbXNRenpX?=
 =?utf-8?B?eGtFU21JUE1jRVpBbnJKR1ZyR0hiSkYyTXl0VlN2aVhxc2ttSm02WEZuS20r?=
 =?utf-8?B?VGxQeUwxWDdGdHo5Mmx2bHQ5Yk5CRVpjOSt0c3JmcUlNQ2x4dFBmSFJiRVFa?=
 =?utf-8?B?U21VNTdaZkZjYjZETjBEVlduVnFYMUZRTG44TTFIK2lvUm9jU0c4RDRJWmVq?=
 =?utf-8?B?SmRJVGoySndLZGlZZGxmSkxFQ1cxNXFFa2RVYytRVWNzclZpNUZEUm5ENG9s?=
 =?utf-8?B?Qm1JR2FlVUpQRWlJdzBvUU01dExpNlJBTkZDZXorV29JekNSa296U0Y1Mk9W?=
 =?utf-8?B?OG1JOEt0alRKd0xVcTlpU3BrL3U2U2dyT0ZYZmc2bWwvODJRNEVJWS9YL01L?=
 =?utf-8?B?SDMxYlZFdkJNRmhlWWpEVXk3OHMzY3lrajdGaXpZK2liUDZWR1BXQ2pmL0sx?=
 =?utf-8?B?ZWxZSFM0OFcyMzY1K3NhT0d2KzNiYjZJWE4xM3FSSUczNzFvb3hwRWczeHBG?=
 =?utf-8?B?TFBLeG81TGppZFd6SzBOTndNL0tOUUJNUzRxcU01TzBiQWlQTFdDb2VWREZs?=
 =?utf-8?B?Njh6NkU4a29ySXl0U1ZSUE5CeFBuSUl6bjZ5SUk1TFgrYXVJRGV1T0R3ZEhH?=
 =?utf-8?B?dVZnRjFKVUl2RTNQbHk1QUNKeWpaSTUxNXdiYWMwSjB6V2M3aVdrb0ZsZWtF?=
 =?utf-8?B?b3hSenpUY3RKdzRWS3Jod21SckoxeXRyOWZaMlY5OEMwMThxdkdnendwRGow?=
 =?utf-8?B?OEVpTDZnOGlaRWRndzYvWVRMakFUUVY5LzU0eTl2R2FDbjBvSjR2d0lQYS9t?=
 =?utf-8?B?TlFsTXZBVTlhS2s2ZmpZYURIYVhiMFVxcGxOZ0JWOUljS0Qza1owRkRrWkxH?=
 =?utf-8?B?bWhRbG1SS1hOZzlHT3VoYi9VajdXSGREVndMaDlieDVLeGN0TjdhV081Wk56?=
 =?utf-8?B?ZFU5dGJ3NlArNjRCOVZTTlVDQTMrenNEMmVlclBpUGlORURMbnJ2NUpwMDN6?=
 =?utf-8?Q?oNY8TkHofVsrs6gXgCkA3lRD9V82aN0W75ryyNYo6TQz5?=
X-MS-Exchange-AntiSpam-MessageData-1: 21RUo40S/oET0/CaMpWSA03EUABonfsMqAE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa4a6ae-7795-41ae-b4ba-08de8c317426
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8584.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:48:36.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3o34+iVsLfhNSlIlSTNkAzVS5FLPmgO2LQKFDbg2R7gglgUgdUIt0BanCsLOSvf59m6Pte8lfQM1nicP7TEKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114845_218010_48F8AEB7 
X-CRM114-Status: GOOD (  10.88  )
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
YXRvci9jb25zdW1lci5oPi4KCnBjaWUtc3BhY2VtaXQtazEuYyB1c2VzIG9mX2dldF9uZXh0X2F2
YWlsYWJsZV9jaGlsZCgpIGFuZCBvZl9ub2RlX3B1dCgpCndpdGhvdXQgaW5jbHVkaW5nIDxsaW51
eC9vZi5oPi4KCkl0IHNlZW1zIHRoZXNlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2VyZSBpbmRpcmVj
dGx5IHByb3ZpZGVkIGJ5CjxsaW51eC9waHkvcGh5Lmg+LCBtb3N0bHkgYnkgbWlzdGFrZSAobm9u
ZSBvZiB0aGUgZnVuY3Rpb25zIGl0IGV4cG9ydHMKbmVlZCBpdCkuCgpCZWZvcmUgdGhlIFBIWSBo
ZWFkZXIgY2FuIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGluY2x1ZGVzLCBtYWtlIHN1cmUgdGhlClBD
SSBjb250cm9sbGVyIGRyaXZlcnMgaW5jbHVkZSB3aGF0IHRoZXkgdXNlLgoKU2lnbmVkLW9mZi1i
eTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KQWNrZWQtYnk6IEJq
b3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Ci0tLQpDYzogTG9yZW56byBQaWVyYWxp
c2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5xYRza2kiIDxr
d2lsY3p5bnNraUBrZXJuZWwub3JnPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtl
cm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogQmpvcm4gSGVs
Z2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+CkNjOiBTaGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPgpDYzogWWl4dW4gTGFu
IDxkbGFuQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21h
aWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6IFNo
YXduIExpbiA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogS2V2aW4gWGllIDxrZXZpbi54
aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnY1LT52Njogbm9uZQp2NC0+djU6IGZpeCBwY2llLXNwYWNl
bWl0LWsxIGRyaXZlciwgcHJldmlvdXNseSBtaXNzZWQgZHVlIHRvIGxpbWl0ZWQKICAgICAgICBi
dWlsZCBjb3ZlcmFnZQp2Mi0+djQ6IG5vbmUKdjEtPnYyOiBjb2xsZWN0IHRhZywgYWRqdXN0IGNv
bW1pdCB0aXRsZQotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5j
ICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5j
IHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMgICAgICAgfCAx
ICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jICAgICB8IDEgKwog
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIHwgMyArKysKIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYyAgICB8IDEgKwogZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYyAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jICAgfCAxICsKIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgICB8IDEgKwogOSBmaWxlcyBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpLWtleXN0b25lLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUu
YwppbmRleCAyMGZhNGRhZGI4MmEuLjY0MmU0YzQ1ZWVmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWtleXN0b25lLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9vZl9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2lnbmFsLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWR3LXJvY2tjaGlwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3
LXJvY2tjaGlwLmMKaW5kZXggNWIxN2RhNjMxNTFkLi5lMDA3OWVjMTA4YWIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYworKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKQEAgLTIxLDYgKzIxLDcg
QEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KIAogI2luY2x1ZGUg
Ii4uLy4uL3BjaS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1oaXN0Yi5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1oaXN0Yi5jCmluZGV4
IGE1MjA3MTU4OTM3Ny4uNDMyYTU0YzViZmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1oaXN0Yi5jCkBAIC0xOCw2ICsxOCw3IEBACiAjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAj
aW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxp
bnV4L3Jlc291cmNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMgYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYwppbmRleCAxODQ2MGYwMWIyYzYuLmU0MTcxMjJk
YTUxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVw
LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMKQEAgLTE5
LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+CisjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1
ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMKaW5kZXggYmUyMGE1MjAyNTVi
Li40MTMxNmFhNTQxMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtc3BhY2VtaXQtazEuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNw
YWNlbWl0LWsxLmMKQEAgLTEzLDkgKzEzLDEyIEBACiAjaW5jbHVkZSA8bGludXgvZ2ZwLmg+CiAj
aW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgogI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0
YWJsZS5oPgorI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5o
PgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3Bt
X3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9y
ZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtdGVncmExOTQuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmEx
OTQuYwppbmRleCAwNjU3MWQ4MDZhYjMuLjMzNzhhODk1ODBhYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jCisrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4K
ICNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29u
c3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291
cmNlLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdy
YS5jCmluZGV4IDUxMjMwOTc2M2QxZi4uYTJjMTY2MmI2ZTgxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpLXRlZ3JhLmMKQEAgLTM2LDYgKzM2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+
CiAjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRl
IDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tj
aGlwLWhvc3QuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMK
aW5kZXggZWUxODIyY2EwMWRiLi40NmFkYjQ1ODJmY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYwpAQCAtMjQsNiArMjQsNyBAQAogI2luY2x1ZGUgPGxp
bnV4L29mX3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KIAogI2luY2x1ZGUgIi4uL3BjaS5oIgogI2luY2x1ZGUgInBjaWUtcm9ja2NoaXAuaCIKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jCmluZGV4IDI5ODAzNmMz
ZTdmOS4uMjIzNDRjY2ExNjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bs
ZGEvcGNpZS1zdGFyZml2ZS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2ll
LXN0YXJmaXZlLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgv
cmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVk
ZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKIAotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
