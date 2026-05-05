Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A7FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj13Yfi+sjpga60f91nQFcQqf/Jt0jmpinIsXdvxq9U=; b=xIgAXenRBtS5So
	tsgBVttCr5yBOrAWLZmd+Pygmw39iHWT0ds53SQ494jGJUM0E780LBdc6r6Fv20FQ2hPOiyS+pveY
	uXBITsFI1bCr6lsIvanog3ZF6T+Q/uuxS0Jr5Izp8iGTptJe6E/p/+VrlCihzgMVsFknpCKCD0SR/
	Q78IKIin4lhUfG/G7eio65jUBXkehaoES1OfqtPLylclk/d0zz8R7ec+XPVLgqUuHj5+7K8yl/5rn
	kuxnbozdOGbXr/qwsJg4utckvzSfelSlIyzA4/cLcMlwKFXnZHXi1ZZeiskS6kMS+GqvPA0r74WS+
	yJf2hLXrhJjNXG2Dezyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJBO-0000000Gyn2-3gdX;
	Tue, 05 May 2026 17:03:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCgE-0000000FmQh-4BuW;
	Tue, 05 May 2026 10:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=woTctB9zfV3kVuKS+4vKRMy5hWrTaNujHFCObkBZAnM=; b=ePrS+cSlLe8XJuSF+x23jA4xbo
	j8BvU/Dw6jcYspPBe5jA35u4xiV8I4ImzuqCnNgB37WBiqe8AqA8/d0R4OavDCFXGjVVTjxHDzzLp
	l03Zw8YPiMM3EI4K0697qeWlhBAjqUE0vva7hzjki1jqwJMXvtgbWyZt0hJyj6P/4JG2oj4JrNGM4
	XTVh/2z3XET9maoa/mSJ5GsZ5Nth9vKkrtsbfRY5+4ox0tmfEbpR6UAVjIYoSRj2AeWjk2EXvg7jw
	9QlcnY2ZDFa9zPdFhPalGyIF2jILP87Z//GLRNThnoLZB1A3/1v2iJzuVnOgk0Xdl2hkqcZSLQDFJ
	Ir9otgnA==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCgC-00000002YnH-0gel;
	Tue, 05 May 2026 10:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjc/XcX5Xi3gftO/QR3TNFclAPxzJ1Ye0NZrzYIugLLXwiwqCaLtwkOGP92Y68BjNVQ8ROAksrZi3LaOKhbS/PRvNAE9N3BAqE+VoaaTD8Lo6t74z2JDX2RGpItxUIhEiXh4MFtlG97PAowYdNyIDo5Z7LxJiwBNk5Zy9ohPqyCSoXwn4t5catRnHEd/KNCByyOdRQ6CTBJ/vTMYkv7+voo4+gYTVOatJhr8Xf3r+PJsd6Nq/MgCI/on2oVmUeTztKi6hRggqXV4Wb4dT3ebHBCnyQT9eDhyg7tXLUQfd8oJ81ntyC3b6IAUHN2OHijwmspbnexAuM+T2/vUSAuvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woTctB9zfV3kVuKS+4vKRMy5hWrTaNujHFCObkBZAnM=;
 b=O1aIx+YSD85hkbftxeJ8mNSDlxgLInhj87sY0idnGHuKnY4ydCn0m5jqEmb4exzOxZOOZ7NOT5zMhDgyJxzVPKA72zNEavO0ao9jMuJQZKQDHXhLlPkpLV66GQSoUm7exd0h8Rf2hjIdogjQemeIH5C2lrIUBG9mUxAQPGhQxtUfpkpWKVoDhxnJJguQ2ZO/X64jTj2nPjD9o+mrdCixPexLuvJN73+FgqvkfLcL85xdGWvKQntf7L3hs+NmOBCmz4x8e1sD9VFMR7+tkQjLK2EB8wN0BIW1miF24YPx+udGocT60md4QI2u2ACl4sD0/Lp5I8XvC19BVMHN6iNvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTctB9zfV3kVuKS+4vKRMy5hWrTaNujHFCObkBZAnM=;
 b=ntLTqdHqqiU0CI5mTawIMdaqVuNWcW0iJtivJtqlnsbo5ksDUSG+g6aj6v6YLTv0zFRNCYLbKCP5aG5Ck3ZbP4ZZWpxq2MGU3iYMsFdNG7ib5Qf0A4BhO7f4o1rT0/WhVsRW/aJOQilYh6V93WUzM6ReZVqMchKZldFv0lXqsvpGi98fy3kiPA/Bk/PBUTfetEH/K9da5N45bkDTMNxkTiILMgklD5yFA7OLHOubqkWd2KnoUnkp1C8syPRYCK1TrKay2PVe/sIhcnSjdfTgZymboqmpCiolPtkdCZleop4fbL8wYx2Chhbeo6eVyxx62d7FzTn60AIOmZHZlO6cvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:06:50 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:06:49 +0000
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
Subject: [PATCH v8 phy-next 30/31] phy: remove temporary provider compatibility from consumer header
Date: Tue,  5 May 2026 13:05:22 +0300
Message-Id: <20260505100523.1922388-31-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM0PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::30) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 7692dd3b-4163-40a7-a6d9-08deaa8e05ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bryDzflHbYPLhMaJA93nNc5L4wFM2zA3K/fdiCPgknQStefqfUIHxLndT/mTpokM/Sx634bk6robM4A5HRrxuXIb99KozQXDm1CvVpjMt+n6aK7QWJ7Aao78M4ekKst6JBt0gIEqhOPfLWw6z9YsQfdNEUvwxWTx9wb6yZvr2lW8uSocJU1zj3wW5v8QhwXNFI0D1v5oG4T5VdwRFt6PgnuFHZ6uQz2n1FyOwLsKJIYJYIk/Lebtz5A8Axg43Cb36HRFSrd7ewZ19mV8DXSE3JxNsOf3+u/5fhg8fbruG6E/LOOSUU7biBE6pNaA/E71TaWnE/Q4KjRHVVqFWU+p6gGpLXbQ+U0tJHgSkUBTZO+adpe7z0Bqaja4HjgYI9SaPvgtVCeKnHUzl0Iec/SIcR4I1axb1ojDecQPy7qP+a8njeaXVTicJjoA5iIYEKjK9ePA/LZaMCRCaMpkOm4wxTff6d63I45aX7KRovsmjMHJXb27uwq/hmGxGXTt0l1uo9kU4JkhJybWr7CkWa6s/r74NmMWL1/Dn0uFXgI4QViAU9e0LSIxLkbmmqY4UAsrt6J7fJbLFjCFtOTwCYLyIBUrujSpBrMkR7qbdQshtVhRIhHIli/JgNxdSAfxQutykoCRVV2IFyyMGlj/mduWAHyUD6LLIoT8L5c+IqqGuydV0QEh/bfNOhUtZhgSKHrY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJxdW5IVXE0YlRYcHhERVVRQ1pHK2JIVkNnN2VMcEVkRlR0VkhBRzR1VEtt?=
 =?utf-8?B?bEpNS1haWnBBZXNGc04yVlpLcnhGLzdIOU5RTS80NXhwQTh5c0dxTnd2TURy?=
 =?utf-8?B?eDFualNLQURrV25neitnNmp4UWhmS0doK1hXU2ZHN211ZDh5NHRLaHNOdERF?=
 =?utf-8?B?Q0dBTXFyTzJxUnRMd2dod2NKMHNudkxsODhPNW9jOUlEZk9xb3RQMUVaL2ly?=
 =?utf-8?B?ZTBwbEIxdHVwbmRWTFZMN1pqK0pzT044NDBVaEFHZlE1T2E1K3VnK2txSGNB?=
 =?utf-8?B?cDhza0phdytocHcvR09CUXVtZkJlOFNteVhlSjVkY21oU0dBcTRXcTB1Qmhi?=
 =?utf-8?B?WGJsYVliQkRQUjVrSXZjUE9kTUxvZkNjU1N3aFV6SjRHSVVSOTlQYThVMUs5?=
 =?utf-8?B?VDY0a3FLYlVLakpuNld4bmp6SEhNU0dEWkJ5S2NtRHVOSjV5NStWckY4QjY0?=
 =?utf-8?B?dlM3ZlZ0VE5BdE9TS2xDNVU3WUZZWGM2aFdQTjZoVEVDQlkvQjhWSXhBNEFn?=
 =?utf-8?B?RnhBbXI5eXVEd3h1eXY0eU15VURHSWpoOW9wblltWkJrNkNDNnA4ckpMUmNM?=
 =?utf-8?B?Nkp0NGJLMSs4a0FldTlCL1gxYzYyZUs0WmpDK0NnZGdSallmT3M5L3MweCt2?=
 =?utf-8?B?K3RVUXdCaElkY0JJL2U4OUxwclRYemovdEpNK1FpRDBrRDVnQnF6UkJnN1dC?=
 =?utf-8?B?Q2xPSnhlU21aN29PZHRndmNwVEpGSDVZRXZlNldGY0g2SEFCa2VhQ0h2VDdk?=
 =?utf-8?B?NjdGMHcwSUMwUFI2aHljcTd1MmNTMDRyVWZxc3d5MU5BY2c2VWdLTW1sSWxP?=
 =?utf-8?B?U1laME1zQmpIWjlJd1YvMGVOckRwUDM5UlhLNzdFcGRTSUZRUWVlRkhOaGdJ?=
 =?utf-8?B?UEpkK09ORDBvYUt0TWkyTmlMY0JLanpLWWNNUFAxd2lYWksvcWU0dHl0dEYy?=
 =?utf-8?B?ZEY4b3UreUN6Wnphd2MxNnVybXhxSktwZmVqQWw4eXAzN0NDVXpzSHkyV09I?=
 =?utf-8?B?TjdMa3VQcTV3cndxQ1ZrTkxoU2h4RXZKZktOaE1mSEVGVXZXbVlGMDQvbVdL?=
 =?utf-8?B?b1VDNnMxVWF5SW1zVDV6K1ptanpjWi9zWG5HUzhVajBSU2dmRnRCYTZJSnJK?=
 =?utf-8?B?L1BQcTUxVHRpWVowakpPaE1MMlIyTzJPeUd6TW5XTnhXZG4xb2ZuTERTZUlt?=
 =?utf-8?B?R2R3M3VTWi9IRkxPcTI3RThzUTM4MHlMSUFKUEd5d0Q0SXBLRTNhcDE4OEda?=
 =?utf-8?B?QXVHeW4yK3p3MDlGZ01wWlhDaXJGMi9kRlVNUjNmRUZKSjYzZ0hCVExxd2li?=
 =?utf-8?B?QW92ZHhWUE41S244VXBCSSs1ZWw5b0NHNm5PbU5Ld2dLN21pTE9OZ2pqRmlQ?=
 =?utf-8?B?c2VZL3h3NzBrSkV0NHNUcFdYbjRDSGxqNTJ5QjY5WEJCcFIwK3Y1NHJxRXBi?=
 =?utf-8?B?RWwyYXJ3ZHNKZ0g2NE0wbnJ4clNvODNyd3lCOWZmWkFMUlEweEhqQVNKSElN?=
 =?utf-8?B?SVNEdUtwc2t3a3ArRS9UZUs2YXgvWU9TYmtDMldnSHZJSXg3aGRJRVZXaUtF?=
 =?utf-8?B?M1JkR3dnZzNOVDZvMHdVVVlabG14T3czRXk3V055eVZDbHNnMDViNDJGMlZD?=
 =?utf-8?B?bm16M3VzMTRBVEVGcUNPbUdIc01CVVJUeDFsVHhHTGVCcjNiZlRySngwMTVN?=
 =?utf-8?B?eGNCSWRsNVp1VmRRSExoY3BJMDZBOFFEZHNhVVZ2SFZVWmJKU2JLUHBHdDhO?=
 =?utf-8?B?OVhLRFBieTVrelhWc0RLbjA1OGdxS1owOEpKM1FPLzhKNWFzbEoyaTdOQVhW?=
 =?utf-8?B?VkNQTGVNbm1PZTJ6amRNZENWSUtQVmM0S2ZRenR6Qi9iWjgxVjZZdmJTeTA3?=
 =?utf-8?B?QTVMdzQ4VkpPdllTcUYrSFIyOWRuQ01NOWxRUTdJR014bFJxZmdJMytEaUtH?=
 =?utf-8?B?NVlraWdmWlpnU2ROZWcyVDlFaDhSUm80R1RvOElCVUlpY1FYemo4M0VsdXcy?=
 =?utf-8?B?Y1AwL1pOb2JpSS9ZajZZNEpwc2NVM3ZrNXNPTnVyNW4wcmFDdlRYamxDMTl0?=
 =?utf-8?B?MC9tV29rRzZnaW0veThkdWtla2Y1WlBXVDU3eDNNNU5RUzZnOXZJa0lKamNE?=
 =?utf-8?B?VVh0U092b2xjNUJBeWR2ZEpZSU9FNHFnNC8wNU1Fd1k5Yk9rdysxYTdGd3hK?=
 =?utf-8?B?SVVPZi9aaG1JRk9hOHJvZUdhdUcrNHI1VStmUkVXeEhjMGh3bDBuQzNZaFhP?=
 =?utf-8?B?MEpBT3pzQ0hsQUFmQ29OOFJuVHhTRGF2QTNNVFp5WGdNZUpEeVE1NFU4VUZD?=
 =?utf-8?B?USsvdllMV2Fwd1FrNmVYSGJhTWJMODIyNm1RQlBRc1d1Z0tJamhnZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7692dd3b-4163-40a7-a6d9-08deaa8e05ff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:06:49.7966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YhScbFfWWyv6GjLbQ64J+szlYee4XNJBWOlEWeyjVkDHr3+Vqo1RicmSXcM0wkWQDhAO9Bo+0R1RTycJ+YTsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_110704_281547_B23B1136 
X-CRM114-Status: GOOD (  10.55  )
X-Mailman-Approved-At: Tue, 05 May 2026 10:03:41 -0700
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
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgoKdjItPnY4OiBub25lCnYxLT52MjogY29sbGVjdCB0
YWcKLS0tCiBpbmNsdWRlL2xpbnV4L3BoeS9waHkuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oIGIvaW5j
bHVkZS9saW51eC9waHkvcGh5LmgKaW5kZXggZTY1ODY1YjRhY2ZlLi5jY2Y3ZTgzZjEwM2EgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oCisrKyBiL2luY2x1ZGUvbGludXgvcGh5
L3BoeS5oCkBAIC0xMiw4ICsxMiw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5LXByb3Bz
Lmg+CiAKLSNpbmNsdWRlICIuLi8uLi8uLi9kcml2ZXJzL3BoeS9waHktcHJvdmlkZXIuaCIKLQog
c3RydWN0IGRldmljZTsKIHN0cnVjdCBkZXZpY2Vfbm9kZTsKIHN0cnVjdCBwaHk7Ci0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
