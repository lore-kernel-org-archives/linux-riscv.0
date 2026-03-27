Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA01061B2A
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCmknSVtvzVuqyZl9nP7arE0u2nN7q+u8nZdrSlNboo=; b=Cbg0Gdz+dSAsw3
	9k1l5fUg8hfzc1vK/6L48oimMT1ACv4Iz7Rlo2izNCoPTLP7x7yp3eXbBGJhtTj21Vny8KGfkrZ8q
	hbJdDXpKNB2vWPVUrKLw/DnU5MNeNeYv4gDU0f+wVOcXa00tMhWOuVt+OVc/nmghztTyoSzKi6y1b
	aEvXn+U8EToylceBLjrhtY2Rr7H3/lYif2ZS3qU2ScKRiQfskeTNyuPqBczysgNS8JzpDk7xrfjPm
	TV3gxKNvE31gXl17cAgNkmUzYFi3sRT/do1Mz0NFNuQBzH/13dnmHyB2DzwTmFWxbo/0lzILSchKK
	nHWrqyFOn5q0K+6YnAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MuY-0000000C41g-1876;
	Tue, 31 Mar 2026 00:24:50 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CFs-00000007yG7-0Hah;
	Fri, 27 Mar 2026 18:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ldfyqdx2WbcvX71DKQC6DW6XY9onfKO9+CxvKhi/2hu096lteXRABaz5ATL+2KmRyWiFZXoATt7530FyLt7FppYl0PH15t8JTkepY6b5u+75hp3knpz0TuptRuXjsy5WJORUyeQNlIKdsKlIIBwW93KT8MgLtUHlj5AE77G0sSYP5YlvWrXsP0B8j4GDVIynskPySAnv9F+x7/429i7GkTVdzV4QDxJL06PMpG3yHEpn+mNneHRLTrX4Z28dIFTJLvQcQmpwUWpYHISBa/LGlSjJ0veLjjsdbVjeF9d618bW9O5XkdAtdq8ZltmZWFZ2GyCJD54r+JFYNbi45jta/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kx2PNVmBmuTf5xQdzjTme21ZIKSQ+6QgjCYigrgnZ8=;
 b=Pqp2cfHODmd8t/xVJESWA9jcxl4FSGFF2yFYczyABMhRQ6SD+GPIZD8DYxkGhqCOOyav9LUtlOlygOaCmaBm8Te2Zw7wj73TC05X/C/YBiLt3tJRaGV2NWafE9TNr27yjiBFFdPhSW7rRr2zFnvadKYWz0k9hjDQ3kqkeh08AozoIXZkYopBA8HvLV7uAMDK9godpvIOgzkkZCnuJeV1tBUCZXhh6QGDRKxBWHj9bFYdLbkuU2KQlrpGgP3yeScocuOii37TV02OayAHs1TQBW0Zwo0QTVpZFR/L3NQBgo34t1z1E6BRkLjF68xAnmL9gQ0l2knpR/BmTJEifG8V0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kx2PNVmBmuTf5xQdzjTme21ZIKSQ+6QgjCYigrgnZ8=;
 b=Cl0Vz1uM/r/0GAPm9k3mASKf4Gjbdpr4+oJ9uRkNt7Gj2VY46moYwD0BPXl1rPDU66tMIGVy4WUUWYw/BBxyjGw+X/eG76TeeUS0DVvJIusNbXHoQW6RpP25QeBfKaAIlfr/doORzXVvluxth1m5wzdmZGGtUlASNE50TsR3bykVQ7vOXm77/fHq5RBWqOh0nBRh/7a+3y0mSt20Si6z2IlOmb93y20tzCjoD/fudETLzyFeaeRTHE1+i9Vzn+hfxsUUgKXRRvYR7kwM6mrrgJe2iXU8oG+1YvgegD1BWufmgx8+T5jcLuYwjE96GBNVNmeBFPyStLTsO1qGWtQz0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:49:33 +0000
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d]) by DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:49:33 +0000
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
Subject: [PATCH v6 phy-next 27/28] phy: remove temporary provider compatibility from consumer header
Date: Fri, 27 Mar 2026 20:47:05 +0200
Message-ID: <20260327184706.1600329-28-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To DU2PR04MB8584.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8a5006-3bff-496e-c7ff-08de8c3195ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KuOvgrmi+ToHJsCKybuTeyONEVJoTM+99Xb15cW8QNrQfD1WU7RoyYPsvR5TRXfHXcvGl/W44Y090VRBKG2gtas+XXdqMtEOHIS4bl3HBcxS+FzYQmP9dXShnic0axn3BvRgrZQLPrTkF4N2uVDCfAmPs9AZglqbJ7P1fYMjZGWVtYpyil01iDrZUaSNILHV3ZmnpgnSGEqA4dO9kJHNZ75miSquB9P1JZoM5cql0KzQU8fRQbl6/l8OMt3FyvyB3YXsQNNpjb7kU9nTvGvfef63yNaXLNKJZB7AUAfGqRmk0F9lHz4zu5BN514bO6nbeYbvi7IpZJCkXIpnvIDxMcxy1LyjPAhzx5/7p3JGIkjhaAmF68s/gn4VkA3qEJzW6gmV+ARO6fHzHjZTQ5pPzzua1Fx72y69E0TN+jD5Q9p3wTFqyjZdbXZ2jSY8mVN85Ca+9QY/kOphFOgWtA+h1RSi8vz8zES96hikbbob8h3CbuSyvjijkNqWL1FyLHx056ocFhBGFu8PZc/1aTiNfFon5an8mpCc/z7Dh9WpSf2NHln8dvMwt+IOgW5ehYNnhcVSajSYkoB3eEKfdZTx1pnQQN3EmE9f7nZ1UnXP5+iul5VnmHob+v+yAJAxp6rLWk0pmzIlDCTk+Jxq0CQIfwMarF5u1RYLpHcbOEYyw667djP9zKoC6J4SAhNyg3mWiCCipixQ4L0NOsx/rdU6YxrkMY4qIWMn9y9SSt3r4so=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8584.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0VTZlVBZTRwcDhVeldCdG9xd1JkUkZSQ1BvcitBOVBhVFdBYTlZdWhucVp0?=
 =?utf-8?B?elJVNkVDTVVBMVNJYkUvTDQ5WW1VZGhWWjRQcWpLYWt6VTNWV01EU2xYV28r?=
 =?utf-8?B?VVVJRFVrellNbmRRam9QQlV3NGxaelNIZ245cXpCT3FGaFVBcktVcXZ2eHdZ?=
 =?utf-8?B?L2VwbnR4UU1yaU9odWhCWEM2SWtEWDNCcUo2Wlh5VWR2SWxCdVZiSXo5akNK?=
 =?utf-8?B?RkJhTlJvWVlsTXFJNXVrdEtFOGk5cEQvNXRrMzFuamhvcHBGRTVOTW91Nldo?=
 =?utf-8?B?NlVJY20rV01GZU9nSDZXSnNLNWZLeVhMZ3RkR3ZrWE1CaElOREwwaDE5R2Nq?=
 =?utf-8?B?K3R1eVRYS3MxY0VIRkN0Sk1DMVUrZ2p3ZFY0NjAvbzFORjNQYlh0eVVvanR5?=
 =?utf-8?B?TGZYSEVaZ0srUkYweW5CR2xzeUdFWE5sTkNTaUJLcENxVW9ZWkc4Uk1BU3l1?=
 =?utf-8?B?Y3crMEQyTURwdExBQ3JoZUNyZ3BxVjdoMnFtRW5GZFFINVUvcEFVWG1Danh6?=
 =?utf-8?B?MVd0eDZMSmliSDhFVkRCQkVIVFdPaVdWR3lBRDJvZm0xYS85enpOSnZQbXRO?=
 =?utf-8?B?NHUvRVZxWXJhbG4yMDV4OC9ucU0rL3JtK1F0STcxZEpWMGtzenpoeUZKYmhG?=
 =?utf-8?B?cTF3VWVZQUFBb0dmdHZzSDM2bjZpRTJicUdKRTRQVU43bUl3c2ovazBpZmdw?=
 =?utf-8?B?N1AyMGdLc1ZvQU9BU0h2dVNZTU5LcXNzQWpUcDJOT2VydysvS25FMHBkOHRu?=
 =?utf-8?B?OG1MWUZra1dnTVdBTkkxeUxCcXkyUGYwZnU3QVZhdUxzUHhPbXowWDZCWGRr?=
 =?utf-8?B?NzA2L1o1eVZBdXNlc0VsbEw3cTcwb3VRN2JJVUQyVDJrb3luZnJicnJkdjVY?=
 =?utf-8?B?N1ZRRDhkbWxLdmJsSEQ2RXBWQ2NhVVZVMkxiOXB1enNQWGNKUThLQ1ZQWGtN?=
 =?utf-8?B?Wk5SeGZ1czQ1NUtZTlVpTCtHT2NmcGJRdC9VNERmbVBwQmNYRFB1UmMyL09y?=
 =?utf-8?B?czIxQ0FrWjdiZlNObGdBRkJsMmV1dmJaU3cwcEJsU1hPSzV1cUs5ME9sTDJw?=
 =?utf-8?B?M2VUNFRYTTdRc2FIM21VQngzT2VYZ3dEazVzWTBEbVpLbmxiL001OVJCN2ZO?=
 =?utf-8?B?Ky8vc0pZV1lLY2NXOW5rYXlGVzdSbHNGRmlxSEdTWTdMRWkydWRmS0RFR0lS?=
 =?utf-8?B?MHBXN0hzdjlYUGprYTV6akJvRUVqb3VmaHdxeXJkY0JVcU1zd29lRG9DTWdM?=
 =?utf-8?B?aUdVVGhVclpwR2c2bktsVDlUNmc4elZ2bUcveURVdVJ5MEl6UWtYcWJrZlZv?=
 =?utf-8?B?RnRzZTlrRDVhdFlzc0hzSTQ0ZTk3U3dsNno5UThFS210Zkttd0VyVjNWb1pm?=
 =?utf-8?B?Y2tHaXpkSEdVZEJsSFFUYUUxN3Y1WWpsdlpvMjdnMkhVVnFEdFhTaEZoT0hx?=
 =?utf-8?B?M1NiSHJCeCsrRHJBUWYwZ2QxTDQrNnNuN24xM1lGdDVsWVEwOGpPZmJ2VVpD?=
 =?utf-8?B?WGVHMHNxSnI2aEpjVThCMnFIbWNBVms3SGNvNWwyNGxpOWlHQ2U1OTQzNGli?=
 =?utf-8?B?ckhBSFppcEhabW53S254ZVVkZ2l3ZFVHTlJiNDV1R2dUUDdSN2RNdndoUlpw?=
 =?utf-8?B?Mk1FQ2xwVXphTDB0WGV2WGJSTDFlcENiVEkva1RvRVhWeHZtU29NTU5ldzFD?=
 =?utf-8?B?THlOZEIrazBpc3V6N0xvQjNvZVcwMWNvdTI5UnNBQ211WUtxZ2tMdnZzSGFy?=
 =?utf-8?B?QmRpeklkeExjaFptRzc4NUtFa0w3a3Ava1g5dVoyOUs3Y1NqRkozSVVJK2g3?=
 =?utf-8?B?VWRmWXloR3ZYTFY4NVRhekdUYUVWMlAvSnZzL3J3M3ZmK1VFY1ZqMzdBRytw?=
 =?utf-8?B?Zm84ZExhcFd5Vmxlenl5dkZnWFhpMnlSL3plZjduVGVlWVRGR1NES25RWjJx?=
 =?utf-8?B?MXpQMUFkVlRMVlVnaVBLMTh1U3gwUXBNM1JKcnBXM0Frc1h1bXVTMzdLbFVC?=
 =?utf-8?B?THZkZlpNUmF0eUFmbGU0Q0xoM0ZJMk1va1pPMSs4NUFaY3JlMG9TY2p5MUpX?=
 =?utf-8?B?WE16WnVYUURUOU9USlQ3aitTZEFxc2RBQ0gxbE95eFdHTTBQZDBkZFp4c3VK?=
 =?utf-8?B?QjhkRklFSGxCU0NtcGZXZ0ZiVFFpSWNuY2hLclA3UTNCdjU3SWQ1SXpnV3lM?=
 =?utf-8?B?ZVRHa0oySDZETmZ0c0hxSmVZSFR0eEZJdzZoUVIyRWVvNVQ3dUlGRCs3RXlw?=
 =?utf-8?B?Rk1ybmdlUUpqWjhhNjlDMnJLWWNnd2dJbjVERFlNUGtLT0FuUnl0WE9GUCt4?=
 =?utf-8?B?aGF6bVAxSUNMWjREQXd4UnM2bndkN0V1V1hMdDB3KzczTnpaVm83WEJjc1hQ?=
 =?utf-8?Q?9b8YEBpQCdZsDZIme4g4hJ5jEgJbt8VB1pi7zFeS6+cAC?=
X-MS-Exchange-AntiSpam-MessageData-1: w02HcxvM2p694GRQ0PqzfUjaC5v82EhS+UU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8a5006-3bff-496e-c7ff-08de8c3195ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8584.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:49:33.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEcFdBvCDT4eSDj5mgStcJK4C4IWaBURMO587kBftUEPeYIFWSEB/KI5nsUlNAIybgXs/BzTs+dn2IO5JscVNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_115000_327131_5A573CE9 
X-CRM114-Status: GOOD (  10.08  )
X-Mailman-Approved-At: Mon, 30 Mar 2026 17:24:46 -0700
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
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgoKdjUtPnY2OgotIGV4cGFuZCBDQyBsaXN0IHRvIGlu
Zm9ybSBtYWludGFpbmVycyBvZiB0b3VjaGVkIGRyaXZlcnMgdGhhdCB0aGUgQVBJCiAgaXMgYmVj
b21pbmcgdW5hdmFpbGFibGUKdjItPnY1OiBub25lCnYxLT52MjogY29sbGVjdCB0YWcKLS0tCiBp
bmNsdWRlL2xpbnV4L3BoeS9waHkuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oIGIvaW5jbHVkZS9saW51
eC9waHkvcGh5LmgKaW5kZXggMzRiNjU2MDg0Y2FmLi4wZmRjZWZhYTNmNTUgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvcGh5L3BoeS5oCisrKyBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oCkBA
IC0xMiw4ICsxMiw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5LXByb3BzLmg+CiAKLSNp
bmNsdWRlICIuLi8uLi8uLi9kcml2ZXJzL3BoeS9waHktcHJvdmlkZXIuaCIKLQogc3RydWN0IGRl
dmljZTsKIHN0cnVjdCBkZXZpY2Vfbm9kZTsKIHN0cnVjdCBwaHk7Ci0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
