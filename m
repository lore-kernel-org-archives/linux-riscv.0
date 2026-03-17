Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B0FEDA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvY+Ky2oPgmiF2cJLyaQrdRgiewaJxQ0g5SAkLBoD8I=; b=N3ouLathzqteZ1
	38N9j91E5XsX1v6wfrNkT2GBZweI/SNZiDzKDXI6OUAeuc0v3Tu8quL8giTO1uCKTxVa/0A3jrFXa
	LSiifKo3P1FWu4idJMjhV3C9b9sRUuaoEo7x8/KGoE9lG2un5vZugotZs0hrHqgaag5fGnGbEd2ua
	5fk7dieQ26/mOgo1eWJrv5NBaq2jnCszb15c0te8JvGQMdpg3KaDa9SItmbGpdqzxfd5alFlvsT4j
	Ioz4+0fZqupdCrxJcu5NCC4wPO8EhqFfc41dO5wkfh4lP0SIN4QD+NF8EF1+75sNNvrod6k/phuHD
	E7DWe4TVKVEbECqgu0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dTp-00000007MLS-2rLi;
	Tue, 17 Mar 2026 23:05:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dTd-00000007M7X-22iE;
	Tue, 17 Mar 2026 23:05:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/GnQctZ2Nqp9eQ6XZm6vcHaDeU5CAOFSeimDIRrWi3JFAreLFm7WD5DYOuuTU+ZosxiHHrTaicUPwGkmEAULOVaMBrtbJr4/rkZNYO5tUYvtdEswEb05rL2bYV2IBd+GWsdKTnuRF84kNrJ/uJy3qGHSNPjlUhVAn4McwtNlGN8IUZWGbvDoUfsJ0cHCbtpAjL3n+52jzrRadv7bF/oZjwnXHHmMjgzfErYLrqFfO8xyWH2i+eDouY6G8ZaCX0JcB5jdbaHwJOQJrYD6DYiJrB3cOvOW/0aQqF27Idx0ziechASJWGq/Q1kZ1ipJjkrT9AIj4IZ4q4UKbDcyxmjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxXKpcYQBR72MTHmkOKASUqNwMBJoLjOJWUQcjT2LOY=;
 b=goyCkoLuGkrCrQxkv92tzZ9PFQ/cFt9QOoSxYw251zSUsIVJuuikF5kUJYidcDyPudBf7b0M/wDOPDU8lHoMOgkbjZPOtvUuLFiDw6DPmVyuN+jxSSN8PvA/FDJ34Ih0za/tILKwn9R7wUW7fX+ol/4d2N37r7CMxv1txdTzPN+rI0WuDTBsuxOBAXHVS/pjI1LTwVSEWv3Mz2HRkofKHUfeI7Nh8+5WoKz4nJsAK5+BLJrXhyxW7b6OfvP+i5ThZJ4/yJ3lGXruzK7gJngyK2mG4wK6gX5i/aJGo1EgFGZcwCxiccpfSK93ip39hBdeTmwl7JTT2KTOZ6f4eRHSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxXKpcYQBR72MTHmkOKASUqNwMBJoLjOJWUQcjT2LOY=;
 b=YJtvOpEhAUzagC/4k5KPbJptwI78h4L311bLAckqf/E8CL2vlvCvJvONivhKvly7aQExnCeyZVItfRzsIsK+5gYBohrIvGuUzdY6PQOLJpP/edGdf6fuO6C+0tlaQFCBP0TD/lcfuV/F2gKom2LU++iTUiRZ5aZ9YSZXo8WxO/JYvwOq38FEez4FgUKt+W4W1ATy/5iFDwUQrOdPdei8zv0MmDXqmIjtujIyNdYUggmK1Xfa84hzLPCDEuq0d9m/95/+Lbr92+wyhBDC+VD41la1fAzA14rdLGECZkBlpfR5jjnCWYcsagfs/BIFeJK06Ukf4LoHLKNTxr+hwtyRYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI0PR04MB12032.eurprd04.prod.outlook.com (2603:10a6:800:311::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 23:05:16 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 23:05:14 +0000
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
Subject: [PATCH v4 phy-next 02/24] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Wed, 18 Mar 2026 01:04:38 +0200
Message-ID: <20260317230500.2056077-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
References: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::38) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI0PR04MB12032:EE_
X-MS-Office365-Filtering-Correlation-Id: 81840da2-a5fb-4f80-0963-08de8479a591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|19092799006|7416014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: OF0eleNT5vTvoX4Bq/1mlixOmI0vThv7gd4+a3MzJtJ9KhzqgXQ0p84gdDvzgjEaX8sYAkozHFmDzQTMIUNdzDRTxl0+EUuPKKnBm/FAEzWOV3hX9flmI/9oVKQmNQcRjq2jOZ+zif730yxlE+5YWkW8CG3grOryr+2mCVjlrcHdPzrHMbHfmvtexCLhk3qbdhUxz4GQixIVhFnkbE0GMWBUQMpP79jrsfcDO56EOshW84Z9lY+H4DDiHL66pWsHDnpQiN89nTpIdLYPSZbQYXo15VJrydADJfp+GJn6vWz5/LBNk5pfm9dRzqC+Qev/J2uSkwzL343m1Djyx+Fkz2Q4ZsLVMHdFwKFlZDkUv12SeJBMGBfvAVAtBai6a+jrW468i3+DMKYYFqEkZhcanvkYT3jcZuknIUACW3164ok07KY5fwqedGulQPOtgHuwIu4gWJezCxKN4m+fRYapGfOTbJkBHhQz59rldrVP5IDMfdE5bVYjius4PjN4s6+VQ62BcdauWeejMzQS4quVaKKCIBDw4m0ufiSGsM8NQ5sPU04VLK1Om/fo5plQ01Gs//wCEZ8g2iVDJHcPZVHrni70LxMq8Wo+fsf02BeQngT6VMp3XywpPECMydv5hX51XZsCWmNFg7I6mlTkFB/filpcvk/jn2fNrQ5wFLYtFsA4EoKu9fJ1wuhIZygfKTWT6d4eXxgzXnbjHDkh2Lk9XWaPAhcUHfqBJViBrlyRSSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(19092799006)(7416014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3Ywb0dBUHdmRkMvTUJsTjlNeFFldHhDYURBdzdnbmlYRTMvbkRSQ09jcGpi?=
 =?utf-8?B?SStGcEFuZCszT0M3MnJvaURZc0RMN1o4elFoZVZFMmVqejhMc1ZjbnRqU0R0?=
 =?utf-8?B?WWFFdlZvOE04TmNCZWJqMk9GSWp5Z0RpWUJNTjV2Z1lheGd1a0txaW1ERy9H?=
 =?utf-8?B?Um9yaGlTLzBiczJQbFlSQThzc1lzV1IrRmRPNEFwL3ZCZTIwcDU4UThJUFJD?=
 =?utf-8?B?OCtsRG5PVUJKeFByOVk3SVMyU2NFQkI1MEJwZ3ZPc01FY3lUQ05IUlplSHIx?=
 =?utf-8?B?aHRmaE55a09jQmNPM2h6U01TeTFzMVptalhGNWwxdkVoK2NoQ3YxZ1ZJbVA0?=
 =?utf-8?B?enZITTl5NzRNeVc0MEVHb1JSckowUzhnRXh5eEpxMlhZV0Npc3ZCVVN1WHFV?=
 =?utf-8?B?VURZSUoxdGdiYUhuS216ZUJydkRId0NweGVvQ0lCSElrY1RnekdITDBFWUth?=
 =?utf-8?B?RXBuVld3ZElSNmdaQjVGdStQK2czbG9LUHJjYUc5QS9OYWhQMUN0T3g3V0Q2?=
 =?utf-8?B?ZFAySFFZSU1Jd2FuYW5yZ3BDcCs2bElTQmxSbVNNOUlKMm1kVE91THFSUS9W?=
 =?utf-8?B?bFB4ZWdkd0hCaWxHVEtOQ1VIZC9lQmtVL1MrZEdHVG9jOG9PVlNURnRFK1g0?=
 =?utf-8?B?SkREU0tWNHovWWtOaVEzdWU4RHdoK0c1Y2l4Mm5UUFNwam1yUlIvWUlkMm1F?=
 =?utf-8?B?SzBsVGVFZm5adThQaHNxU0I0dzRhL25aZzlQbWV6eU0xYVBXRkw4WjJsbUdI?=
 =?utf-8?B?SUQvQ29sRk50UVhTRVV2QTZldW5NSWorNlAwbkZlK1lsQWNjRXlmNk92cWNw?=
 =?utf-8?B?OTluUW9ROWgraUtNdk5UYTZsSDFsWjlKZUpLRUFKNDJCb1pVQnkzaGZ6QkVU?=
 =?utf-8?B?R09RUkVpTElEVXk3MHpLWGJwQ0pOb2hyTnc2Y2Q0d01mUzVSaGl0SWlZRktJ?=
 =?utf-8?B?U2V4bEgrelVRdHEyZFRKSzJkT0taTktXQVhVREZvRExJZFNncjlPeERVUzhR?=
 =?utf-8?B?RDh3bnMyNjlocE05QkZRNzNYZEN1NGtPVVBhUWlMSDhkaXlQbmxRcjkzaEZz?=
 =?utf-8?B?dHdtQXl6bTdaYjZ2MnQ1T3A1TXR4WUltODR5VmMzQlRCVmJ1emZVMTZFY0dl?=
 =?utf-8?B?eXJ0Q1hobmd2YUZNZGp2T203S25PMUt3UlRGeXE3Ulp4eFVzTDRMUGxNMUhN?=
 =?utf-8?B?ZVhhMXZrT1ZWbFBhRXFycEhDdmlldDMvaUhrMUlLMzRDQ3RqVytETzlTSFRh?=
 =?utf-8?B?ekdCdSs0TjFMd21DVEl6VkFMNitzR1d2K21JR2tRNkZqUkpwSWJFSjhOemxm?=
 =?utf-8?B?Nmh3UVR3Tmhzb3kvMVNiY3pxWFlYdmlwY0prVlZLOEx1aWgzalFONGF2Z0NK?=
 =?utf-8?B?cEFJcmtpL2dOOE15UitTL2p5NWdJV0JVSmJaRHBlTFlQMVN6dzYxejFLdFlM?=
 =?utf-8?B?WVFJMWxDZlNMcUROUkV5MThGZU9XdmRjVkxScklxZnFiWGp3SHVMZDZCN1dH?=
 =?utf-8?B?dHRkaS9hd2RsYnlLSmo4QnNaeE9pUGp2SGN1L0NUN3RKcjlHL09zS3cxa2NK?=
 =?utf-8?B?VG8xMlp3Vy9uYWxJV2kwcjJtM0x2QTZ4bXp4MGlHMHQxc3RzeDFYcWszWE9l?=
 =?utf-8?B?S04rWmxjVEk2Mm9uejlmMytvamMxSHA5QzZ1T1Mxcmc2TDRGQ0lNTDBLc3M1?=
 =?utf-8?B?VDRUZXc0WlFkL2d3T3JnTFM2QVpMcDJNZ2sxRzlPbFY4azFUekpNUi9FQ241?=
 =?utf-8?B?UUd6Qmp5RUFjQkdURGFlWHhKcVJOZDBYMVRoYW4vT1l6MzNCL0JLblp4UHhz?=
 =?utf-8?B?MkZaanU1MGFZUWJhMkVIQ0NqT3hFRkRrVCtKMG11cHNCemZNTm8vS3Ava1Fr?=
 =?utf-8?B?VzVqV2NoU2lMOHBhcmVzc2ZYUVpvaGpWb1FTaWVUY1owZm1iek85eHpldnRN?=
 =?utf-8?B?QzFnRkQ1K0tBZCsvTHRpN3RsUkFZbW93ZnQ0SDFYRFJkTitJaWJxM0lQRm9s?=
 =?utf-8?B?eDNKdHpFUytuYTdwZ2Y2bEJiZWdhbzlxVFdLR1hPSUhoS2lheVBsaHhPeHRP?=
 =?utf-8?B?QlF1ZGVhWDF3RUF4d20xQlB4Yk1jREFoU2tTbSs2UWVDVCthRi9TT2R6bzZ0?=
 =?utf-8?B?TXRXYmdjUmxyd3VnTjZWNTFGOGRwaTdJREp4R1MrUngrVEJaRGp2Vkc0dWE0?=
 =?utf-8?B?YUY4MFBROWMzSGhOdmsyMXY1OVNSQ0VsKzFPZVJYSWNGeHBwMkVWa0dMclEx?=
 =?utf-8?B?bFlrZDBUL0VFVWVFbDVMY2toR1RuTkNQVUIwTmFkYjNGUjhuUFd5Mnl3Wmk3?=
 =?utf-8?B?ak1oL3BoQVYxRUExTzhNc2QvR0RUbnVTK3BTQWpwMUZoUTNWWmx2Y0xEQ2U0?=
 =?utf-8?Q?FOzAQ9Bqh/kpBijlyRg1G+dXax/hflIjGmkzM0YRnaM/H?=
X-MS-Exchange-AntiSpam-MessageData-1: GO6GCMvrT9YXw1DMiJCD2CCUA/LtXqDkBwM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81840da2-a5fb-4f80-0963-08de8479a591
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:05:13.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfsdV1PLjFRVyu2eVnCuZMi+vdKw+BmFj10J6U3t/eWylCZ96cxUzhdqfUFLd12zRDqDOPq8zsSFM7AeIOvV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_160529_736986_7748F2ED 
X-CRM114-Status: GOOD (  10.38  )
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
bmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KQWNr
ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Ci0tLQpDYzogTG9yZW56
byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5
xYRza2kiIDxrd2lsY3p5bnNraUBrZXJuZWwub3JnPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IDxtYW5pQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzog
Qmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+CkNjOiBTaGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPgpDYzog
WWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KQ2M6IFNoYXduIExpbiA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogS2V2aW4gWGll
IDxrZXZpbi54aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnYyLT52NDogbm9uZQp2MS0+djI6IGNvbGxl
Y3QgdGFnLCBhZGp1c3QgY29tbWl0IHRpdGxlCi0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMgICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWR3LXJvY2tjaGlwLmMgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
aGlzdGIuYyAgICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29t
LWVwLmMgICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0
LWsxLmMgfCAyICsrCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMg
ICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMgICAgICAgICAgICB8
IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYyAgIHwgMSAr
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jICAgfCAxICsKIDkg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMKaW5kZXggMjBmYTRkYWRiODJhLi42NDJlNGM0NWVlZmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCkBAIC0yNCw2ICsyNCw3IEBA
CiAjaW5jbHVkZSA8bGludXgvb2ZfcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNv
dXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NpZ25hbC5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jCmluZGV4IDViMTdkYTYzMTUxZC4uZTAwNzllYzEw
OGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tj
aGlwLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5j
CkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0
Lmg+CiAKICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtaGlzdGIuYwppbmRleCBhNTIwNzE1ODkzNzcuLjQzMmE1NGM1YmZjZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1oaXN0Yi5jCisrKyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMKaW5kZXggMTg0NjBm
MDFiMmM2Li5lNDE3MTIyZGE1MWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS1lcC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
cWNvbS1lcC5jCkBAIC0xOSw2ICsxOSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX2Rv
bWFpbi5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1p
dC1rMS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCmlu
ZGV4IGJlMjBhNTIwMjU1Yi4uZGJlYzE1OWZkNDU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCkBAIC0xNSw3ICsxNSw5IEBACiAjaW5jbHVkZSA8
bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRp
bWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0
b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
dGVncmExOTQuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYwpp
bmRleCAwNjU3MWQ4MDZhYjMuLjMzNzhhODk1ODBhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtdGVncmExOTQuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNs
dWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+
CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpLXRlZ3JhLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5jCmlu
ZGV4IDUxMjMwOTc2M2QxZi4uYTJjMTY2MmI2ZTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaS10ZWdyYS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRl
Z3JhLmMKQEAgLTM2LDYgKzM2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5j
bHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51
eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+CiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhv
c3QuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKaW5kZXgg
ZWUxODIyY2EwMWRiLi40NmFkYjQ1ODJmY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLXJvY2tjaGlwLWhvc3QuYwpAQCAtMjQsNiArMjQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29m
X3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAog
I2luY2x1ZGUgIi4uL3BjaS5oIgogI2luY2x1ZGUgInBjaWUtcm9ja2NoaXAuaCIKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jCmluZGV4IDI5ODAzNmMzZTdmOS4u
MjIzNDRjY2ExNjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNp
ZS1zdGFyZml2ZS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJm
aXZlLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFw
Lmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcmVzZXQuaD4KICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKIAotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
