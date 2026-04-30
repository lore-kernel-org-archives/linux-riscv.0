Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B760CD3423
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6ZGj/GGc4TBRj28+7izqVmmHGR9uiywRGYnC0L2W8U=; b=HWsXDqAHlWyVXW
	WNdyKXI0gG7EAbCbEq3mFuhGYCa5fQyZdT/ABrrYNaRbkXpsI8C1PczHhlYA0ZrkQcp5+GKITvT55
	0lDYDT0zOakRiFKCSr4u/h85WTNOlI3xeSi6Z0Yl9wunh1IKrny1q+mPmDVq4jhQqMGrvHEsxf/YC
	L7rkJZcCMRgVROsji6vLEbrjhls8nPvCUpEPdvs8PZjZ/H6Ed3oVx84KqId1MeofeBLnjLVfknCCe
	Q5XRgVXrZIBlpTv44o2DPXuH0kd+0yzUbx0mnwu5crcX2WNrPfSe9zEfW+XyDX8mpKYuUTPZl6T1d
	1xGfVUF9A4DiKG6I+ByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpk6-00000007Kp3-0TGe;
	Fri, 01 May 2026 15:25:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFP-00000005GfF-2cZp;
	Thu, 30 Apr 2026 11:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Si6UMc96n2N2DF/XC4cnF9nZvr3A9AlpPHbLG67E9R8=; b=rQYpwdZ9IY4N0k66yPaAjpo0jv
	dw30q9Pay7jAgH+kzsOXDAn1Km+tryy66fhCB0/8V7z8W65Eqq7grMXPB739Tk8Hh7s99MAoh0kJ1
	IATbofJTZ3H7udHhmwSLlDNm41U3uujk17Ynd4zPB46Aysil0PteKdcZxlaX0hTbveRkxeXghM69m
	ZVjm1mSX0CF11uSQ7uO8GCEwsezmne+tTq4C8XJVwMXugjTlM9x4lxZn0JvksHxhxMQhZnEBckdBw
	MSKcmUe3zdWMDnICFn+WxsVImEJ/mf9OBNa1ikpBqAvw93XG9ovNMLT008WGcu2f1S/hiFAwFfBPN
	9px89Mcg==;
Received: from mail-westeuropeazon11013020.outbound.protection.outlook.com ([52.101.72.20] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFM-000000076ib-0zlL;
	Thu, 30 Apr 2026 11:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIyFbXxqyf3bYdWx+icI2S3mLExqAQQZcyKRuhr8PrIHI2xzLS8rlXJMRZsTjnJ9Fba/+0j7uNJ5AfcQRFHAAZSD3ev1f+NVkfhBsVkACH5rOxXxNah9ChFyT57I/kWF6heKdzY/anNGU6pBiQ36D91rou+yu2WlZyzihFlCrxHrcw3X1SD1qXIFREcGGDLoeTwUU7QD26yXdgg1rRg9cbQIxy72e3JwKlb0eCimNiYF1fM3ZbRxTDMMPGa4gDKEcn1LxYAOwewAC8pocNCEccofpG0bSe86XUWlqRw8kaXlWbl9qRAIMHeO8bzPD/RIvuz4Mh6rZ0q7fgQklfK4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si6UMc96n2N2DF/XC4cnF9nZvr3A9AlpPHbLG67E9R8=;
 b=fnrtMy5Vpv6XciWbZ9Uk5AKp31YZIvfqeAy9NE5QkG+jL1c7CQlIamir3QY2TCOVfi3/9vF7qSnecJLelYQ7e+Trxo+bYB2t8B9DJ11e6qQCc5lvWVlD4vL8yrFlEXZtUG8n0kCRFQg7iE1T+YbA2/zqwDszmkBbDqvM6YZyA2ETiA8hpXH486kubEWkh849QYuQxlYFtlNDXLi2PIAJZWtmKuRLbb0dyfsi/Zx5qgcdb8RI6K5NkWbTj27iEx361kb6sUa681PBpc0OliU6C8C5MvgWbAL5B5SD2UvDcNDABP6hrr6Kx9PCbzUYSQKL5ZQpJLoCc6yF3cw8gEtfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si6UMc96n2N2DF/XC4cnF9nZvr3A9AlpPHbLG67E9R8=;
 b=BS5Y1Ai//6ZqNt7M/YVk29LITvOeHBwWNiFRrNd3fusAX3BY10B7sQpxVri6Y0/Hi2/ptrRGx0fjMr+Tqn0plkrTZpG/HrZ/S6d0FAe8siDwo+UORz7S+ouGVo0yHTzJ4iFjG5JUTtL6za9F54ZwDoTXoUasLYj0IdVbIWC5QwyYMU9cV/yKSh3MAc1AS7so9sC4w0Nu1DzjtnGKc6SJnYsmdzKDgdwfMxf73fUTwKzwWPcN9eCvVAW7nsBcpK7rbZKfHDih5W7GtcLA2tii8dJdPV4e5D49g2xbbfPm4DUAA78GJnMXUGum5n+6cYqEaHSuQaGwIZbEJ4ALQmbQMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 11:07:43 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:07:42 +0000
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chanho Park <chanho61.park@samsung.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Damien Le Moal <dlemoal@kernel.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	JC Kuo <jckuo@nvidia.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Joe Perches <joe@perches.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Dege <michael.dege@renesas.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Niklas Cassel <cassel@kernel.org>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Samuel Holland <samuel@sholland.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Paul <sean@poorly.run>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v7 phy-next 26/27] phy: remove temporary provider compatibility from consumer header
Date: Thu, 30 Apr 2026 14:06:51 +0300
Message-Id: <20260430110652.558622-27-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AS4P250CA0026.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::14) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f5fde0-ba0f-4971-6717-08dea6a8b343
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bjDhtYlwTEjLGAG6PD8fzABylAebhnFcZ+11DQ5eWy476jzU7w8Pu57C4FqUfkvLEqhk1ygyV4jWFwHlZFIUQTsXrF1EzuNRHCkgZWQzt/B3kEXgoK6rkylQSKzyoX5LJB1uGojv6/yY7dEswy7krIaure2AJEg+U9n63r9Tm7U44TLbT8Or6GGTDjSkPg2u9DBl5KGR+hLrXcbasbAOmeo4nsVNDdO/FVPsRGRPZRnqrg0qtoGDqzbadVcO6zVohoinb195wTtpNhqF5k7VblzQI7ELe5dmgSHrUeNJ52MW0a7soWiuSjTbKQT4+dmgqjtM4xXC2va2PXXn9xCIgVTSeel8m8BpXY3qhvZyaLLOnOhggl1Qh0EbfhlNHrr/lb+H6kscSA7VJhfE7bbpoFrzVl8QfMVHucWJIRtZRYHKatInJklU9Rt0ZqX2lcIumm67ZuwnoDS0Axz6/XTUQQQaeiKtXPZQL0zug6j2qmtCwHzbBBmEgJWEY6ZjB8kBYwWuXett42GF2fBwa8ZTsFRlCJfbuxr6QeDWbJf87RUajjZjabJcfSlk3ouLJM8FKAcSqouY6RR1o58KeDEy0fs3Y96vAsMD+oQ4/oFDurzP1d1WqsEwUeHkfmB9ZFgvhVFLjCRSSrAc3XRpJ12epa90JcNEjMKclOubikCj8JFY7pKTqCxVLwvbaiQKinsznczaTWXiqlE3d3BLW7MSH6atPIKcZy6CHX8Mfj2BNuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRCRVBraWMrQWxFUWZTU2xBNElELzFsWHdRbVl3R0tlY28zbGg0MzFrbTNX?=
 =?utf-8?B?cHZDOEo4RXUwYlJKbFFndS9MSm9JMGtmbWJuSWlDZHZYTElRSzBoL0I3amdK?=
 =?utf-8?B?WnBPKzZBdEIvcG14NitoZy9tSGJXWlE4NXBBZXNJb0tpUVUwSXdmQmF3Vmxh?=
 =?utf-8?B?bjk4bUs0OWVKdUxnMDF0U2tCcFRXbFpnMjhkTkxqT1NUaHJmdnpYc1BoV1A1?=
 =?utf-8?B?WVMzNVNmTnlSaklNcDI3eTBPeU15YkcxVU1RUEhmY2Q3cXgzZ1dXNDBJOVBi?=
 =?utf-8?B?cDZ4STNPUEFsS1BSbkowY3FtazRtblZlRUg5dUFpcjQwSkIzS3JRK2dFWHFm?=
 =?utf-8?B?ZHU3Z1dYQjZHMzJwRytSU1E4eStkNHZYeVB5Y0lCVDZycTN6eEZIU3BZZjA4?=
 =?utf-8?B?clF6SG1CSGFmSXQ0UXBaVGVQc0cxNEtUZWpubTVKR0VjQWNOQkhQVCtmVTZi?=
 =?utf-8?B?dHU3dHkzcEYvVDVoR0NyOXdLMzJ3RUtTV1A2YzVvYWFiNFNlSGdLQXRYU2JM?=
 =?utf-8?B?Y21xbTV3LzUwRzgzMWlwNnVCODJyUFN6UzZrNkI1c0xKTE1pZ3hBeVBFUW9D?=
 =?utf-8?B?ZWxGNmpYVGkrYVg5dmtMbTFyTE45YnJqbEk4dlRLNEI2KzRZN2dXSnpBZ0Z6?=
 =?utf-8?B?WUdkbHpWUVlucmtSNmFIQ2tuTSt1QThHMTczYjY1UHp0YjMyRW1BZ25zZmk1?=
 =?utf-8?B?MUltUWhweVpLZ3Vxam1jMUJqM2Z1dWNTQ2xCWksvYXJ3UllvSXpKQ1FkbVVI?=
 =?utf-8?B?Y1VvVWFQL3FEY1ZhRWQ1OEZiMlBQbzl6a1BFTTZTelU3RVg1ZjdWT1EwRDRp?=
 =?utf-8?B?Z2RYdGNqOUlIanZPWTBFdmcwMDdseDFUY1NJRTdUOUZoak9MRURRTERJeWNw?=
 =?utf-8?B?VmhlSkVwQU0zdmRCRVg0V2pPREx2QkJrOHkvM25BVUpqODd0dkxUeHdQVzNI?=
 =?utf-8?B?WWdRYXRWbVRtOTFUTFJPYUxPcFZ5NTFQbW1ZN0hZYy9vazBjK0xGdmRHa3BH?=
 =?utf-8?B?Z0Z1QmRld0Ivb29NRVQ4Uy9yRWJRdXgyVE45dHgvZTg2VUszMThxZlFhSTYr?=
 =?utf-8?B?dG4wMFdWOGF6Ny90L1EwdTVQamFoMER3elVWekFKeTFtMU5pakVDcWNYZVdL?=
 =?utf-8?B?bTRGWDZKcnk1L1pYdGs5N0kxVmt0dU9VV1k4UG01ZkpqcmRsRURVd3ZlUjlt?=
 =?utf-8?B?bXJKalVsYjVLNTZEVnJxUHUrOHgvZGliSG9KTFA4YXFEQUxQZEFFMVpzTDRD?=
 =?utf-8?B?WmEzbU12RXVjbnRmNVREK25tbTZYTlM5YWZ1ZWlZY0h6QXJsMDJxa2NXSGZy?=
 =?utf-8?B?em0yWlVTZjhKQTQxS1JMSGl5WmVyWFlibkloajV0VHErR2JQQWhlcGdMdXRG?=
 =?utf-8?B?TTFPNGY1eExLeENWSGRkMUpJaGtTbUdlWmYxZlRrc3orcXhKaWhwbmhsTlhU?=
 =?utf-8?B?K3pncWtscHY0dVpjT3loVUxsYlU5SVVLMDBsekJDTS9PdHd3TURMUzZpNzFD?=
 =?utf-8?B?bjNON0dZbkJSemdHdEZNTGlNL3VLM1cyTllrdTllcUtpWTJ3cVROcng5UFYz?=
 =?utf-8?B?NUFUeTNEOW1VWHE0Uzg3YWhLRnVvMHhWczNVMG1Pb0hMZUpRWHBsbWlmTXJs?=
 =?utf-8?B?bkQ2cUlza0J0ZkgrbHAzUzZ0STU3QzE5b0Z3blRSclVCNnhiV1dRQmhqc1BQ?=
 =?utf-8?B?MjZIbmY4SUhnaHZsSmMwRzB0NW1rakNTMmM5UExKV2ZuNncvZ24xbGtVSk1B?=
 =?utf-8?B?NVA2bHNOWVVzRzhGdXdXdU1NdENFY0JPUTVwa0dhVDFZQWE2eVFQZUIxbkEw?=
 =?utf-8?B?eVNScXJSVnA4M1VIcG90T2R2TXU0d3crZ3IvNlk4OFN1Y1ArNlh4ZEtuMjlD?=
 =?utf-8?B?N1NZMmZNZzNxandrSUpmTFRvRTR0eldpcVUybVEvOWI5LzFHWGtkeGJNMkQ5?=
 =?utf-8?B?ZzNnNlV0STlnb3VzWVZGUVFqa0ZpbDVYL0VMTHRwYlBkeEs4ejJBOEFadWN2?=
 =?utf-8?B?NkdVQ1JPQUJQT0dLUHZuc05oenViTmF2bUdMRnZSS1ZvWGc0QldOOWJQdTJB?=
 =?utf-8?B?QmxxZGFqckwrVnZQaFE1bWhkVGdheXdFZFBXM1Ntczg4UzQ4MWRjb1VoYitP?=
 =?utf-8?B?VzVvNFpPNVZZbUc1MnFrcnRBa2RvcUVpUnBBNFUwNFZuTHF0WW1CT1A0Z3ZJ?=
 =?utf-8?B?QjhieW5XNlJuSjl4U3JvS0hiUE94d2lpYmM5WjdYeVRDdVlURzIzUjdSQno2?=
 =?utf-8?B?M0lna2JDbzZYcHd4eGxsK1RYaEZoSW1lOUQ5ZXM4QjQ0K0dQTlJZd28vRkZs?=
 =?utf-8?B?MWZxMjRNVk5TaENMa3d2dGhmVlRycmpVcFpYVzE1TU56T0g1MGdUQ3VTRXlR?=
 =?utf-8?Q?O2k9QUQTo3urSp9MmsvYAffK9GCzd+ALIrnsl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f5fde0-ba0f-4971-6717-08dea6a8b343
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:07:42.7151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Cg3c80wgXqplKxSJmmolV7blTeRNxwjaIsz9Q2dSHRgX1MeYE3tXm5nbpUyTCuQxP8aCc+nXnz6acXnGfeA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_120756_304999_3CBE3424 
X-CRM114-Status: GOOD (  10.27  )
X-Mailman-Approved-At: Fri, 01 May 2026 08:25:22 -0700
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

Tm93IHRoYXQgYWxsIGNvbnN1bWVycyBoYXZlIGJlZW4gdXBkYXRlZCB0byBubyBsb25nZXIgZGVy
ZWZlcmVuY2UgZmllbGRzCmluc2lkZSBzdHJ1Y3QgcGh5LCB3ZSBjYW4gaGlkZSBpdHMgZGVmaW5p
dGlvbiBhbHRvZ2V0aGVyIGZyb20gcHVibGljIHZpZXcuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1p
ciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgpSZXZpZXdlZC1ieTogRG1pdHJ5IEJh
cnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgotLS0KQ2M6IEFiaGlu
YXYgS3VtYXIgPGFiaGluYXYua3VtYXJAbGludXguZGV2PgpDYzogQWxleGFuZHJlIEJlbGxvbmkg
PGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgpDYzogIkFuZHLDqSBEcmFzemlrIiA8YW5k
cmUuZHJhc3ppa0BsaW5hcm8ub3JnPgpDYzogQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZAbHVu
bi5jaD4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPgpDYzogQW5k
eSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgpDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdh
YXNAZ29vZ2xlLmNvbT4KQ2M6IENoYW5obyBQYXJrIDxjaGFuaG82MS5wYXJrQHNhbXN1bmcuY29t
PgpDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+CkNjOiBDbGF1ZGl1IEJlem5lYSA8
Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PgpDYzogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2Vy
bmVsLm9yZz4KQ2M6IERhbmllbCBNYWNob24gPGRhbmllbC5tYWNob25AbWljcm9jaGlwLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+CkNjOiAiRGF2aWQgUy4gTWlsbGVy
IiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6IERtaXRyeSBCYXJ5c2hrb3YgPGx1bWFnQGtlcm5l
bC5vcmc+CkNjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+CkNjOiBGYWJpbyBF
c3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkNjOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNv
bT4KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CkNjOiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogIkhlaWtv
IFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1
bmcuY29tPgpDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBK
YWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpDYzogIkphbWVzIEUuSi4gQm90dG9tbGV5
IiA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4KQ2M6IEpDIEt1byA8amNr
dW9AbnZpZGlhLmNvbT4KQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5j
b20+CkNjOiBKZXNzaWNhIFpoYW5nIDxqZXNzemhhbjAwMjRAZ21haWwuY29tPgpDYzogSm9lIFBl
cmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW4rbGluYXJvQGtl
cm5lbC5vcmc+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+CkNjOiBKb25hdGhh
biBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgpDYzogS2V2aW4gWGllIDxrZXZpbi54aWVA
c3RhcmZpdmV0ZWNoLmNvbT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAb3NzLnF1YWxjb21tLmNvbT4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5xYRza2kiIDxrd2ls
Y3p5bnNraUBrZXJuZWwub3JnPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgpDYzogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+
CkNjOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgpDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1hZ251
cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+CkNjOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
PG1hbmlAa2VybmVsLm9yZz4KQ2M6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXgu
ZGU+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBN
YXJpam4gU3VpanRlbiA8bWFyaWpuLnN1aWp0ZW5Ac29tYWlubGluZS5vcmc+CkNjOiBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIDxtc3BAYmF5bGlicmUuY29tPgpDYzogIk1hcnRpbiBLLiBQZXRl
cnNlbiIgPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29tPgpDYzogTWF0aGlhcyBOeW1hbiA8bWF0
aGlhcy5ueW1hbkBpbnRlbC5jb20+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJA
a2VybmVsLm9yZz4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IE1p
Y2hhZWwgRGVnZSA8bWljaGFlbC5kZWdlQHJlbmVzYXMuY29tPgpDYzogTmVpbCBBcm1zdHJvbmcg
PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CkNjOiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZl
cnJlQG1pY3JvY2hpcC5jb20+CkNjOiBOaWtsYXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4K
Q2M6IE5pdGluIFJhd2F0IDxxdWljX25pdGlyYXdhQHF1aWNpbmMuY29tPgpDYzogUGFvbG8gQWJl
bmkgPHBhYmVuaUByZWRoYXQuY29tPgpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5l
bEBwZW5ndXRyb25peC5kZT4KQ2M6IFBldGVyIENoZW4gPHBldGVyLmNoZW5Aa2VybmVsLm9yZz4K
Q2M6IFBldGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9yZz4KQ2M6IFJvYiBDbGFy
ayA8cm9iaW4uY2xhcmtAb3NzLnF1YWxjb21tLmNvbT4KQ2M6IFJvYmVydCBGb3NzIDxyZm9zc0Br
ZXJuZWwub3JnPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6ICJSdXNzZWxs
IEtpbmcgKE9yYWNsZSkiIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KQ2M6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNo
aXBzLmNvbT4KQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KQ2M6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogU2ViYXN0aWFuIFJlaWNoZWwgPHNyZUBrZXJu
ZWwub3JnPgpDYzogU2hhd24gR3VvIDxzaGF3bi5ndW9AbGluYXJvLm9yZz4KQ2M6IFNoYXduIExp
biA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPgpDYzogU3RlZW4gSGVnZWx1bmQgPFN0ZWVuLkhlZ2VsdW5kQG1pY3JvY2hpcC5jb20+
CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogVGhpbmgg
Tmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxp
bmFyby5vcmc+CkNjOiBWaW5jZW50IE1haWxob2wgPG1haWxob2xAa2VybmVsLm9yZz4KQ2M6IFlp
eHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgpDYzogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgoKdjItPnY3OiBub25lCnYxLT52MjogY29sbGVjdCB0
YWcKLS0tCiBpbmNsdWRlL2xpbnV4L3BoeS9waHkuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oIGIvaW5j
bHVkZS9saW51eC9waHkvcGh5LmgKaW5kZXggMzRiNjU2MDg0Y2FmLi4wZmRjZWZhYTNmNTUgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oCisrKyBiL2luY2x1ZGUvbGludXgvcGh5
L3BoeS5oCkBAIC0xMiw4ICsxMiw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5LXByb3Bz
Lmg+CiAKLSNpbmNsdWRlICIuLi8uLi8uLi9kcml2ZXJzL3BoeS9waHktcHJvdmlkZXIuaCIKLQog
c3RydWN0IGRldmljZTsKIHN0cnVjdCBkZXZpY2Vfbm9kZTsKIHN0cnVjdCBwaHk7Ci0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
