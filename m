Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8161091929
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqpYYS0bNT2tUOS44mpZENDwbWuVGnqDyEOjaXQlhRg=; b=NFDaOrKKojP8Dd
	tobMIqLd+4yqFvND29Pjr0DbvMPSa40feVwkqZqj2P8FEYbJbhv21SyNaPTdoLnzp4wdTuI75Fgyd
	vomXmdDa91k2dcfCCavaZqtb2DKTSME2k1xp0tBQop5cAsw5IR3+OThH0/sf3M0J9syNVmk/X2AW2
	4wyJRLGYq2zM+Tz3dt8VQg3oySN+MlWTGZ/DYShjzZQ01cZwl9Z4BFE4/vWgo+ZnxtT/xzpBTWTUd
	K2p6vV0EgDS39muZj06b9Y4SBwXOWJojFdHyOI6yXzdcToIWw0W1qWR8jomF+jz1khvIHy+k1o4rT
	/gIbv0kZv8ycSP+R5OVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LvO-0000000BfHI-3F6U;
	Thu, 19 Mar 2026 22:33:06 +0000
Received: from mail-francecentralazon11013009.outbound.protection.outlook.com ([40.107.162.9] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LvI-0000000Bf9g-1flt;
	Thu, 19 Mar 2026 22:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzUqfJoOPecluXkeAcvX/AeTGcvgsXKk8Nbquw+vwkd656mb/saXJ9zeBUpXB4khGgbnqhQyjVNMyuBK0QnCNMQU0Q5MxLpYDem3GDP6JFOGs9q6li04EgIst9hE70S3ySnHjRS4jJ68RwUXF8aDppTLizfALKRR4PKJecsUsB/FwMJm7TJSIYcyt/ZaT61VJCr1taUV/UqaImxcK1Yr40a/jyAn0tpGGxnPWnj2VnBUIyavx4VgHmctdURai2t1a5vbecpP0TJ5N3u350bl8SFLCDvp+GnRcNQzDfMugFthxha8JNwWBB3RRB+3AfZgahLXKVr5xEKifUa2dSTC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLJqBnYouQqh5qS2S5ADGrJeTBgpFcRUJT3ZIejU24A=;
 b=kfMWCqRJJs8uRBJwOskxxr5T8z0WnVIQ36WlbgykbWsWUQrBr3WCj4qLrEDgPQ3OtrvYy4+oZStieFhqIXHpMMTb3T2QFoqYjbafs2VArTlUdcQ+cTbKqBz1PxWdWuGtDnv1ZHioAF+ot+Jf5L2mkWXQNdMU/pQCK+G/HvhE5DpIisho4b1aQRLJqbHE+hEgLp4BgINjja8DnndcTX6lj2MaE421t66J/Qz0v6mzD5dPlyRSEwf3gZu3FAzHc6ti/9rgl3zkEzODts152RjHNHbUEgrX1Cg3tA3778YU3dJ6jIUGaq9l5bHQRIIzbq83V+OEsQLPig+Rol9hRXI1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLJqBnYouQqh5qS2S5ADGrJeTBgpFcRUJT3ZIejU24A=;
 b=QZHyfwlW5qPdaUdMw+akkGTURzHV6gk32NNVRiyUJrLBFIZ0NXn/apnlJuWvxDlO0+85k0uu30jdFCSY12cUtAh7IZLtTGG8AlrmCEXaSP1nEibtHKvWIMKP/9kwlTUobeC5QQQerIYMYK1zldNgGkmtTuBEpdvBJijgpITKOzdbFTETZOSNCemLvH9HjQZHODi58Ttceiq3HU8YI1ygxHmSVJ5CvdR2ztOHjI2dAjPXEs5E0/e8XRk5KdAFQXV79rB5h0eiNhMWHxGhOJTQRnJgn6cU9KA/2O4dY+iXr7HLVBMET0B53yPDCeMf8fC3b3e1UqyCGT1s/zbT1xtlEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV4PR04MB11355.eurprd04.prod.outlook.com (2603:10a6:150:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 22:32:44 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 22:32:42 +0000
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
Subject: [PATCH v5 phy-next 02/27] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Fri, 20 Mar 2026 00:32:16 +0200
Message-ID: <20260319223241.1351137-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV4PR04MB11355:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d107028-ff1d-4616-bde4-08de86076f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|10070799003|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: CDSZxqx+6y08SDwUfYb2iSEdG+NeNpbjDlc9qXNz6A3plPZA4YcVxuyA6RLcGJZVNMbBl39yKaHF9gsVQrTWVFriFWNxhzA1A6+4GQxVKD4Ut8Myex7xNHakVpxtR3fcF/TCU51mpMs1N47EpDZUUR2ymm9lZmcGdQnSQsIRSIO6GgP4a/AmfyJrD1jOMCUWACMwOXUpdQxUJSiXAnbM8M5PiCGwPE0JJa5EXpqRgoVMV1EySOeTerJx1bhkhu7hywi+obtkkbsbxjx0QnyockI8y2DKuSrWTwBdFkZJIPLEYiS2SAe0qxKM2oDQkiI/yvAY4mv92Gsj+DscVuwyNVEpMb7Kg1+cCpcCu6pxIxpN3GsLxq3wuDc48/TsKkHnDG/CoKx1osDQsI8kenRqizvPz2CF7xl2b/YNAgA7c2gEezaEKh283TpHAvKmM3Qbj2154PTLEFQd0YQaNPrFekxEFVJsDWFjsAuK9CvE/53+E6Tp4ivorcYYFC3K/KD7wXTca5Q4ISWvRQHpRp4bva9/i759MMhkPQsrkZFfQL0t38lUNXmeObd9/Jd80YMWYcWOzWC8LvyYPgQARbXo7CFyg67hUCbM1Ek9PjwBViZIaoq/st3JZE06wmxXQirPfBq2/i6tw0hI32E2/svMzPG6piuMx3vXb9Suj9qQmQLADHWjr9p0yyLkCl1rd6vKxgCGhI9TinbBwYb0TDxaoRLe11rdmipAb3XYDqtuUgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azArSlZUU091blllVXQ5T0Z1MUcwR1JtUkVHcE1McnkyNm5MY2JNT0hKTFFU?=
 =?utf-8?B?Zit3R2Q2VjVaWngvVG9TU0VxUHpRa1pwQmRHeUs5RDRGWCtPVGxzQ1F5ZFow?=
 =?utf-8?B?SmVOR0QxSm4vK2tIb0JaWTJHS2dNa0M5N1AyL05OdmdiaEY5UVNwckRKb3RG?=
 =?utf-8?B?aWJuam0vbDJHRnVLd2tTVHZoMVBBSEtOcjBiVUZMSWZyTjZsZ25rRGNyZlE0?=
 =?utf-8?B?QVJpVjM4N05vai8wMDZZcTZ5YyszMEZXdXBDSFFaSCtPOS80Z09kSUM3VmZY?=
 =?utf-8?B?V1NHRFUyZHoxOFVLS0lPbzgvYkgzTkxXMEdpeVpGTnA0QnVzNjBJU0owRkNj?=
 =?utf-8?B?RW5LeUhYMGdsQlU4TzREbnlsVU42U1RjbWhxOVpyS2tRNEZqeFJpZDUwSXNI?=
 =?utf-8?B?aTREMGxPMjdFVm5TTzJlNmdzNU90bzVzZUZqUDU5SkJUdFRVQXVTWTByckI0?=
 =?utf-8?B?RkcwS09JMWs0WHgwNCt1SGpEeDhxZDgrTTM0eXpOdjVnNE8xTE53ZFQrUkVw?=
 =?utf-8?B?WTZpQ1I1UWZYRUF2OUdiaGRGUll6TlRnU01qSFVyL0R1cURIWVFVRGpyd0hR?=
 =?utf-8?B?SFhHVTFjOElGTWJjSGYwM3IrVFJjWGJXZkltaDFod25ONjI1OFFxYUxaRGh5?=
 =?utf-8?B?ZGM1MCt0V2pYZlRPWkNzRnl4SHdlY1d2dGExRE9JbHpPVFowb1Y2WlBtRmpT?=
 =?utf-8?B?aE42bElpME5IK0ZjWmdCbWw4d3BWYkdLT1FOZlRlc3ZUNkt3ODg0WWtvczdW?=
 =?utf-8?B?emlxbnNpNlpSdWFKNVRNS0dkZkpvUlU1S3FJcVIzQitqeEdJbkt5UEhsSk82?=
 =?utf-8?B?R1JIY1hLUmtHMmdXeGI5ODlNWis0TktwTnhNMzNpMjJibWFkWkgwNDRBYUht?=
 =?utf-8?B?N2JQemFtSTFRSHFySkd2N3orQkFKQkRjVWtJTzVKM3VtV3RzS3pHa3I4N3Ni?=
 =?utf-8?B?ZzVsZ25DeDQrMDB5d2ZSbnpCM01MbURXdGgvMUdMME9YRE12Slc0Ry9oTG8x?=
 =?utf-8?B?Y2JvQS8rcEl2bHFEQTRJTXpPa2JMTTM4NUNHa2FzdjFwUEFDU0Z6eHNwbGMr?=
 =?utf-8?B?OWNYaVp2b2hpTWVSY0l3N01rYkI4Z0o0UW9WcWhuUU1HNnhGM0d5RWx0dE5k?=
 =?utf-8?B?MGNKQ2hkMG45WUxNMGE2YzJFSk1VYy96NERMME94am9hdndvc29pOWY0ak1K?=
 =?utf-8?B?bmRrS0VybHM1REpIUUtaZy9aTUorRUZEWDdETVg5T0krSGpacXY0ajY3ZWdL?=
 =?utf-8?B?TjhpTSs0djk5NzFnNVdNeFJwaG9oRUNrZ3kxZFhKenhvTllmNlpwMFh3cVNX?=
 =?utf-8?B?TlhZdUJqc1RQeWg2emYyeVQ5VGI5WnV0UzlhdTkyUXZPL2ZLRnJYSzNYNkFI?=
 =?utf-8?B?YkpjRk40MTBRZkNXVTFldHFrQmxtUFc3YmlabG1KUzF2WWs1MERZL0JMeUMy?=
 =?utf-8?B?ZTU2ZldIcGpYQ0s4a1RSd3pVNW9KNUl3SWhyaHVhWDN6d0dSYVJ5Y0pFSG1j?=
 =?utf-8?B?bHFKYmhjcnRFMkVhWHlGbjQxRzVUZCtJeFYzcTl5bWdKK043OUgwVExkUzJq?=
 =?utf-8?B?L29Wbm5ScHhFa0Zyam8zc0tGMTBCVFdJVWo0YzNQeWFlREhVOElWY2k1WW12?=
 =?utf-8?B?TFZXVEVGdFM5Mlgxd3UzM3NnZkNvUGoxZVRzTktRdUNvaXd6bVlKWHJackhX?=
 =?utf-8?B?MG1XS0NwSEpSaysybFFHS2xVcWN0RUF1SHhRbFZDZUtJNHJ4WG12RnpJRnNp?=
 =?utf-8?B?Wm5ESHdXSm4wVEZuS0ZMem1oSFpsU1B3NEQxVGdSYU9EbTJROHpZdzdjQ2NW?=
 =?utf-8?B?ZEJzS1FxTi9JTjN3NFpmK1MrUGswVTh4UUZ1U2FBWm1JQ0MrS3hFZWRZRjln?=
 =?utf-8?B?UTRyVm16QkM1TSsvTCtLQ3I1TTFVQWpQR0FtSmVldUdXejUyYW9tVlV5L1hD?=
 =?utf-8?B?OGNYSnJHQTBpekw4T1JlcFBzMUQyQWVDaHlCd1o0b1RLUkFiN1dscnVYYzI5?=
 =?utf-8?B?cm5pV1puUGQzdTZKbHdDN054ZWswYVB6RDEyZzhud3ZiMVFJNGtteVJUczQx?=
 =?utf-8?B?ZTBaazV2K1ZrRFd4NUlGYjhOWlh4OXU2K0hNbHlld1hHQUNQKzBlNW5HYWlS?=
 =?utf-8?B?OVNLVGNjN1V4clRrSVB1WXorT3l5L2dIckVyaWNoTEl4SnRva0Y3U3R0VmNO?=
 =?utf-8?B?UkJVSDBWbG5DdHJlY2Q2b0FwTEk2bzV4VWtVTnVTUXI0eGgwOS8xdmFyKzds?=
 =?utf-8?B?SHZEN09IdlorMmRRQ2I4WXlQZG03NGg2UjZqOWk3Y1QwRldEVWM5L1huRkRR?=
 =?utf-8?B?eWZ6WE1MZ2ZTK0Q1bDlsWGh4bTdTbnlKdTBZQlBIYVR6Q1A0d1ZuT01GQm93?=
 =?utf-8?Q?p51Jh1womAfko/ZGPQovCwJ4xGMRVZB4zonjMxIfB7Xnw?=
X-MS-Exchange-AntiSpam-MessageData-1: Su0X2ezl2MR5ER4kkXNy7Vd/eHwHh+sDhCA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d107028-ff1d-4616-bde4-08de86076f4b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 22:32:42.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDFuM3Q29qxSss1364HGWa0ARJNtDsAB4sgUa4Wda7JtsZ0RKYwmWBwTFbQ/Z4UoQLLkYTqqBcefYbrPltxIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_153300_445994_42C33E18 
X-CRM114-Status: GOOD (  11.41  )
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
aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnY0LT52NTogZml4IHBjaWUtc3BhY2VtaXQtazEgZHJpdmVy
LCBwcmV2aW91c2x5IG1pc3NlZCBkdWUgdG8gbGltaXRlZAogICAgICAgIGJ1aWxkIGNvdmVyYWdl
CnYyLT52NDogbm9uZQp2MS0+djI6IGNvbGxlY3QgdGFnLCBhZGp1c3QgY29tbWl0IHRpdGxlCi0t
LQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMgICAgIHwgMSArCiBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMgfCAxICsKIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyAgICAgICB8IDEgKwogZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMgICAgIHwgMSArCiBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMgfCAzICsrKwogZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaS10ZWdyYS5jICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1yb2NrY2hpcC1ob3N0LmMgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRh
L3BjaWUtc3RhcmZpdmUuYyAgIHwgMSArCiA5IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUu
YyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCmluZGV4IDIwZmE0
ZGFkYjgyYS4uNjQyZTRjNDVlZWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2kta2V5c3RvbmUuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
a2V5c3RvbmUuYwpAQCAtMjQsNiArMjQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29mX3BjaS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVn
bWFwLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2UuaD4KICNpbmNsdWRlIDxsaW51eC9zaWdu
YWwuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9j
a2NoaXAuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYwpp
bmRleCA1YjE3ZGE2MzE1MWQuLmUwMDc5ZWMxMDhhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYwpAQCAtMjEsNiArMjEsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNp
bmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3Vt
ZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogCiAjaW5jbHVkZSAiLi4vLi4vcGNpLmgi
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMKaW5kZXggYTUyMDcxNTg5Mzc3
Li40MzJhNTRjNWJmY2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtaGlzdGIuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMK
QEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KICNpbmNsdWRlIDxsaW51
eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVk
ZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2Uu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtcWNvbS1lcC5jCmluZGV4IDE4NDYwZjAxYjJjNi4uZTQxNzEyMmRhNTFkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYworKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYwpAQCAtMTksNiArMTksNyBAQAog
I2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9kb21haW4uaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9y
dW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvcmVz
ZXQuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BhY2VtaXQtazEuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtc3BhY2VtaXQtazEuYwppbmRleCBiZTIwYTUyMDI1NWIuLjQxMzE2YWE1NDEw
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1r
MS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BhY2VtaXQtazEuYwpA
QCAtMTMsOSArMTMsMTIgQEAKICNpbmNsdWRlIDxsaW51eC9nZnAuaD4KICNpbmNsdWRlIDxsaW51
eC9tZmQvc3lzY29uLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+CisjaW5j
bHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgog
I2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25z
dW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5
NC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jCmluZGV4IDA2
NTcxZDgwNmFiMy4uMzM3OGE4OTU4MGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS10ZWdyYTE5NC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxp
bnV4L3JhbmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2UuaD4KICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktdGVncmEuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMKaW5kZXggNTEy
MzA5NzYzZDFmLi5hMmMxNjYyYjZlODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpLXRlZ3JhLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYwpA
QCAtMzYsNiArMzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxs
aW51eC9waW5jdHJsL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0
Lmg+CiAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYwppbmRleCBlZTE4MjJj
YTAxZGIuLjQ2YWRiNDU4MmZjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLXJvY2tjaGlwLWhvc3QuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9j
a2NoaXAtaG9zdC5jCkBAIC0yNCw2ICsyNCw3IEBACiAjaW5jbHVkZSA8bGludXgvb2ZfcGNpLmg+
CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogCiAjaW5jbHVk
ZSAiLi4vcGNpLmgiCiAjaW5jbHVkZSAicGNpZS1yb2NrY2hpcC5oIgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMKaW5kZXggMjk4MDM2YzNlN2Y5Li4yMjM0NGNj
YTE2N2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJm
aXZlLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYwpA
QCAtMjEsNiArMjEsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNp
bmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNl
dC5oPgogI2luY2x1ZGUgIi4uLy4uL3BjaS5oIgogCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
