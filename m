Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A5BCD13D2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWwmxyZzBesqIUf17yNNpDyy9WfV0nQ/IRkhn1TZsXE=; b=GBO7X7Q9nwcL7r
	jg7onhaeGgx82occxDMwPRph98X+jfgxaHIZ9ochUKxtCKS9Krfmt2FPrtmnsjG++RbMRQMFt46m4
	TgtmY6OboZL8wF1Ny4TV3fHrQh99AqH0964AFEML5U2PATffoaciw5gS/IhYf6yXmkf9ZPmrDKYfX
	C1iUKW6sbqXVCekpw2Gi5FszYTWGkfjMEqEjz9ZnpX+UpD8UeVd8ZYTlTTFz8aMEf0MST6XT8f40p
	v14TBqFcwjWZlxqR2JXqfdGqE/k4Mc5hKvqe1y7E5+a0YhxcjbZ3jM+kuNY7wQubwUeRKGlY3gxyH
	3eHVoEZ+WLdz2XHwcqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPEj-00000005Flb-1o6B;
	Thu, 30 Apr 2026 11:07:17 +0000
Received: from mail-swedencentralazon11013047.outbound.protection.outlook.com ([52.101.83.47] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPEd-00000005FeI-0zw3;
	Thu, 30 Apr 2026 11:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4h1iu6mlekwyHXT6VK6SfSSwbY435VARL42Zc2ea3Pji0HjM4KBVO5K5sl8v4lsx5je6iXF5ayrG/w7Y2AodRnK6Z0ceKb407mziAv3aDfboL0ip2DEtUtdS5lBfdqXtjkzwaScCqgAf/Sy+lnmA0Wy0Hvb8JCgpdr/qtltZmoYZ8ynBd7SERIdKodKxf2NF41GN4PGcOyt65YJyqJo6ia46JftNA6nJLAHgMFas2kkv3GNdHv3TBWd+LED2DZYQ4IwWyBucVK3sAEczZY6qex+fIRawMOWHJW5iZHMeXVidzwFy/xD115ykevFNbD74+v1qoe+1r88CvzxTG/dGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVauDuVwmD+ZQKnIuah022QgJoygjPauUp0xZSKihRM=;
 b=XIB/VIccm/C/p6iDrBH48TCsVyYBGaHshcOYkfTXhr8QOWFoqTbCdaaaQTn9umRcwTCDxMsxNK6N1VZeopG0EcFCmDvlzPQBAAeQ4aS5/lsTGlo9pZ6QsN/0uRc8Mco12hHxR8HnQod6gUTkwgzPLB6nm9N2FqCuOzrK3rqcgtAHi+TqMf7/sJ2X+rfkZS8WtbjeMxdNmoVw7jPTPYBl6kSX1/WSCDbHj1PxkSUK8+FzITaXGLGBRHBHUdUFJBaU651xtT0VSL4KWnE1jCS87QXz2Z7mzxqqLfoKO4XiLsWRSZKAC6hjoqBEIahPOGo7mtxgZ3OFf65gSUydh02obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVauDuVwmD+ZQKnIuah022QgJoygjPauUp0xZSKihRM=;
 b=Y73JJvgCtUsDcqBoFPzd/2FVR9Vy+Yf2Z08INX3MWrvyiC8YOQ3QrhyQv+cvax/+atKRZwe9AlTJVlt01NPtS7UywABcIz/FzXVuP3BkKf3CqB1rFdMjSdldfbA/hGaPzkLCgOQ4eYF4dlYTjpSyGvBJpH+wB6D3+H5hLK7yjklJlLR7+jEkk8+gU9FZbyg1b9rHHc/VPX7+ivruREJtNqVhNBCOHlDHZIZRVQEpSL+8kseX59w/LG4suCAxJuxEI0Kn9hqYZqCEb2omf/NEd6lnGCey3TiOx3KzsHhIbJyRRhKt8HU5FFxG7ObI+HLXVHhoIAkRTXbFBq61TBKy2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GVXPR04MB10609.eurprd04.prod.outlook.com (2603:10a6:150:219::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 11:06:59 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:06:59 +0000
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
Subject: [PATCH v7 phy-next 02/27] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Thu, 30 Apr 2026 14:06:27 +0300
Message-Id: <20260430110652.558622-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM0PR02CA0109.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::6) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GVXPR04MB10609:EE_
X-MS-Office365-Filtering-Correlation-Id: 8840f344-7489-43b9-91e1-08dea6a89982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qw63ik/bkJrbuaXQWl8NJQXPoAy0OBaG3g1K7RMoaJYPSMJVm8iES+vWgZLG5bwawnNkDFcS+Md8l1+Qkb9x9bdm5hmCCHE73P4xNz1uLFrEFZJpKf4hcsnxT5yZxvnTyY68usbo7DWL2E0SyaqZyc4sYv6CLKGHwpvfNiHOlj/H7egnnyoGPdIZl9Kn1tP4TugYbGx0THTsWlWg8t3OvoGGltfjczu26XY4IM2tmq/LVLsPuiVMNQLLfKk45lOGCOmLtVEGr9/U5bSKYMkqsiHZnSwivORzwoBjFFNGCn2lf1lRnof7yAdHS0719HOlKT2bzyAkke7WKh8GDIg7ZdEfclDqmZytIq8c6IW9CZ3JLecmKPdHy2gimHVFxJnOReykHMhBHS9T9JPwJm/AUWd6kk4n3RzO/dtqaj9u0efyqsU+5RRJEJ9r5WlaIwjZQFuLhy8Eef5vfwowW/gnf+2Asyqux5/mk/xn44uNE/R7mXls8Tp/F9TAEOIeXlG2DjD/y6wL2ZTq215du9Hr+tbYhbx4+by4CXPs9Gx4qKPjHpaer4ku6EzlMU2Es5bhB2c7S3tw/qjsEeSs2i3EJhk8HOEv9rXNdi5HePgkepcsLEbd/WCsjJS9SlJzlfEIWwrmsxgRv0Wd0EJkbazfBNxsJb0CEDcnrdrHF9wRgaIf/pu79HoizGjijP+WDcrn/iRGtO8mJAqAd0+yCj8yVf6kuH2rDXlftUEklLEFJfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNuMUFjODBpcTBOcGdhbCt4Umd3NEphUXpJWnVlKzA3YnUvK1U4N2JIb001?=
 =?utf-8?B?UzJaM1NKNzR0dFpyMndhSGVFcytsb2R0TVlZLzZ4by9oLzFoakZLRkp2dWQ2?=
 =?utf-8?B?dDlGcWo4UEZaVVpYY0Y5RmNxMGpDL1NiOXNvWHpnSGpSV1BLU2F2SzI3QTVy?=
 =?utf-8?B?Ym1qeG9FdTlJZmpiaUcwKy9nbllyN21lVWZZOGNKWWVXWS9GdjFaRGlvbDNz?=
 =?utf-8?B?eWd1Rjk3K09zcTdTMWVKcnZFZXg2SHhFeXVlZHQyenovN2tubkp2Z3Zmcncx?=
 =?utf-8?B?UXdmc2ZiOHZSL3dkYzJZRlNocWg2cncxQ0FpOEFJOFA1bkoxeGo0MXltNmMr?=
 =?utf-8?B?b2tNN01NdG9CVVZubjBvZ3JDSWdTeVFzUmI2TFNEdFF1NmR3bnpHOUJYZjRn?=
 =?utf-8?B?ZFhmMFJCV3ZqS203bzkxNk1qUVk0ankrSk1HTHE3eHdHYmtlZ3ZwM2Q5Nmx6?=
 =?utf-8?B?Y255Q0JZb0VYOUpSam1mcWZaR0h4aFZ0YUNUWWlyZWpZUVh6SWxBbWxadzl1?=
 =?utf-8?B?RnNoMkRNNjd4QzdEdUVTb2RJSWxnRUN6RTVqQ25tN05oWVhRbG1MV29qb0ds?=
 =?utf-8?B?bWRsNlQzY1VzQURsMFlwdWlEbGpzODZGbFoxbnV3azI1TVYvbUdwU0s2NTVs?=
 =?utf-8?B?dVU1QkFIYjlpclFYL0VWQXhYaDVOKzl6Nm1PRDVSeEhMbXdsMWVremkrUGdz?=
 =?utf-8?B?dXNqcnIyclMyMlhLeVVPenNvczVFZUFMZkQzNDBuSkltYXdRVHJtdTQrUE10?=
 =?utf-8?B?WVFKZnJiY0VJYkdNQXBlY21FSUN2SWtJSStock9QWFpYMnk5bkZZTEppVGpa?=
 =?utf-8?B?YzY5L0ErNWphTU1uY1A3V29aaHJTVVFpdUd0c25VczVhRlp0cUIySi9wY3NY?=
 =?utf-8?B?K0JFRTlwSFdxNGJyNUMyRnU3ZDZrWmwraXVMYlRqSUcxbkF3dUt4d0R6SU9C?=
 =?utf-8?B?Nkp3V2x4aCtScE50K0Y0WWxJY2hmZVJXdUYwVGtoTDl1SzVIRFdKRHhzc1My?=
 =?utf-8?B?YzZhRkFlY1Y4aDlsbStOcjNWS25GK3Y2Wmk5K0ovNVR1OUFMT2hVNUZ6c2xN?=
 =?utf-8?B?SC9LRGt5V1kxWHlkTVZwVzRDeTFSWk4wVjJsUGNxSVNMOVBPWVgrdXZIbDMx?=
 =?utf-8?B?QlhMdUR2ODVEZEpOaEhFL3l2SVJCTmpJWGZqZjlNN1ViMjFXblBpQmFXWnJP?=
 =?utf-8?B?UUJDc0NPelRuY2ZlK1dPUWgwcE5acERHbEhQWnJIamxWMUovZWJjSy9GVGsx?=
 =?utf-8?B?U3hBNkpyeDljUm5TZTE3eXF6dkNnQXdJVm14Yk9RVWZ0VStOWWFXOERwTlZv?=
 =?utf-8?B?eTg3VmNyNFI1SGw0RzIrMWlOWHg0NUJTbWxqOXBnYlprZDlXQTIyNDl3UHB0?=
 =?utf-8?B?Sk5YTTdRanFGd29kR1JpMjlISGVHbThyMVhVNE1jZHgwTEJna0xUbVVwWWdY?=
 =?utf-8?B?Yk1WaEUzNUllYzhZUE16VFdJWVhmY0hQRVd5V29JaFFmZDVka1pZbklZVTRy?=
 =?utf-8?B?bHdHTWRDOHczVVVTTDkxRldQQ3lIZU5hTThOUGVLUWlvZy84dlV6SW1obngv?=
 =?utf-8?B?bzZuT252M1lPbDhTY0JwRy92NmFNWjlpUzlOL1Z2YXppcEFnOWROU3VYUkV5?=
 =?utf-8?B?azVIUURqZFpqdFZNS2lqbGFVZUNKVkg1Z0JlQ3FOOGVic2pvaE5weGMxa1dD?=
 =?utf-8?B?dHloWmErNS93MHpsTlNnMjRtVkVGODdNcFhHM2kwY3BlVVZYRC9EVnJ1dTVm?=
 =?utf-8?B?K1ZlbklzR1lwRVUxaGpHUkZOTjlHWmNOV0I1MmNKS3VwZXpDUVEwM1FaUDQz?=
 =?utf-8?B?aFhYZm5Ta2gyZ0VBaGtmcGFmeWN3ZnR0VkgwdWhFZGNCSm9kUWdLY3RVWmxv?=
 =?utf-8?B?c3FHaUF1L1N2bjh5WnhJTHorS1VHeHZWTEc5SFkvSmozVXp0c1E3aWpIU25Q?=
 =?utf-8?B?WDZIRkZiMTdUNzlObHYvYUtHTXlWaDR0QnQ5dVY2dTF3TFB5MWRRdHdDWlU3?=
 =?utf-8?B?Vi9YSzRsYkdKRytvaHUrRVB2UDQzUENDNVNDMXlBN1QvV3lxUjhsU0xxVytt?=
 =?utf-8?B?aysrMnB1RUFITmxiTzNkZzM2WXVzcDVIOVR6RXl1UWJhMy9qUDNvcktPWjdk?=
 =?utf-8?B?NjVGbk9GMjBJRUdjUEQzRkV3aU82NURaSUFWUDEzSTltTTFoeWRDalhLNktu?=
 =?utf-8?B?M1lDcGtncXo1S2Vxc3FhV3NndXJ0eFFaVS9EN3JqbG9OVktlZFFqU2V3QlpM?=
 =?utf-8?B?UFFMUTVuNm1UMzdKL3N6VXpuSHpDMFQ3T3Znb0ZiY084cGJIMVZnaCtmdVFi?=
 =?utf-8?B?TXlVRTNNUFBHazFDLzNNTUJjSDRmTFdzWGNHdEtOeHozTFo2MVhyL2djYUJR?=
 =?utf-8?Q?6IOY+uXwK2V8Wg+ammkYaB7ZHxJUfZDZT/XDA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8840f344-7489-43b9-91e1-08dea6a89982
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:06:59.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrlFdvl2koy2/GNIsgYz1DuxIRFijPZNE/YhRgRkcMiQxG8Cm2s3eOyxmMLn9TEaruRe/J1IPq4XgsNV+DyBBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_040711_299279_0B3642E7 
X-CRM114-Status: GOOD (  11.72  )
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
aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnY1LT52Nzogbm9uZQp2NC0+djU6IGZpeCBwY2llLXNwYWNl
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
YwppbmRleCAyNzhkMmRiYTFkYjAuLmZlNDgzNjkyNWM0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWtleXN0b25lLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9vZl9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2lnbmFsLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWR3LXJvY2tjaGlwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3
LXJvY2tjaGlwLmMKaW5kZXggNzMxZDkzNjYzY2NhLi5hZTI3Y2UwNTI0N2MgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYworKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKQEAgLTIxLDYgKzIxLDcg
QEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxs
aW51eC93b3JrcXVldWUuaD4KICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvcGNpX2NvbnRyb2xsZXIu
aD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYwppbmRleCBhNTIwNzE1ODkz
NzcuLjQzMmE1NGM1YmZjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1oaXN0Yi5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIu
YwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgogI2luY2x1ZGUgPGxp
bnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNs
dWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJj
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1xY29tLWVwLmMKaW5kZXggMjU3YzJiY2I1Zjc2Li4zNWEyOTc5MjNlN2YgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jCkBAIC0xOSw2ICsxOSw3IEBA
CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX2RvbWFpbi5oPgorI2luY2x1ZGUgPGxpbnV4L3Bt
X3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCmluZGV4IGJlMjBhNTIwMjU1Yi4uNDEzMTZhYTU0
MTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0
LWsxLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5j
CkBAIC0xMyw5ICsxMywxMiBAQAogI2luY2x1ZGUgPGxpbnV4L2dmcC5oPgogI2luY2x1ZGUgPGxp
bnV4L21mZC9zeXNjb24uaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KKyNp
bmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2Nv
bnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3Jh
MTk0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMKaW5kZXgg
OWRjZmExOTQwNTBlLi5mMWQwODgxNGE3M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLXRlZ3JhMTk0LmMKQEAgLTI3LDYgKzI3LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8
bGludXgvcmFuZG9tLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJjZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaS10ZWdyYS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYwppbmRleCA1
MTIzMDk3NjNkMWYuLmEyYzE2NjJiNmU4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2ktdGVncmEuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5j
CkBAIC0zNiw2ICszNiw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUg
PGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVz
ZXQuaD4KICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jCmluZGV4IGVlMTgy
MmNhMDFkYi4uNDZhZGI0NTgyZmNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtcm9ja2NoaXAtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1y
b2NrY2hpcC1ob3N0LmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9vZl9wY2ku
aD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAKICNpbmNs
dWRlICIuLi9wY2kuaCIKICNpbmNsdWRlICJwY2llLXJvY2tjaGlwLmgiCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYwppbmRleCAyOTgwMzZjM2U3ZjkuLjIyMzQ0
Y2NhMTY3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3Rh
cmZpdmUuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5j
CkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgor
I2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Jl
c2V0Lmg+CiAjaW5jbHVkZSAiLi4vLi4vcGNpLmgiCiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
