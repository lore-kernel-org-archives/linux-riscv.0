Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0429910F2865
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5fyEqITCy2D+q38j+CUmFtIqav3aTLaHYaSVgUYRMY=; b=hmjE1kiKnrWJH0
	VvPLKqREgTxrN4GJA7JTmpnA6wczCow88JzRRYi3VcfuWgWydor/Q+CNGdEG7c5bNnhYcSuRjFXtX
	cljsy8bEqc19oGP/5CVuEYWMna2QZVAxLta8S/4Yts/10tERpxBS7XZpLv4yBqCj7+YRYGbE+V8Q6
	JzEmJE55kAPwBHMCMTTSWIO+i6Cn6BiowoZssJkWkNXMD5J+LvByxpwe4Qcep9ZtFkfMuSDozbdyA
	P0pRCimZYJ16do0OiIBhNNtoOHiBtKlh7EQBEdzfgJ8k0pvYaI1zXBHJZ3wn4D8RY/r/woWNWVDi9
	rFt5EuEMOOsjnhDu2GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CG2-00000007zYg-1aRe;
	Fri, 27 Mar 2026 18:50:10 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CF5-00000007yK5-1eNm;
	Fri, 27 Mar 2026 18:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEHx6I07Xl9TbMFm+HJTb3unqA432EjutWxDi08/gxZiMT9iXSJMFwEHS1ETY/xIgUMsrPVCczMMTfQouSLCptv7MS+giZ5dDZFKetI/di4Uehi9YJax1X9Vqs6YE3NOV7dR+Xvh40Wz85AhhjLPdLgAvkfb3YuS+J2hjUSpdeDr/r3S8TF1u2u1CtlUcRhkqxyqQkMxKdcETQWDXBuOxiQnQscdIdmVc4It7uNioCYJeAMhH6rq99pWbXCVxIg3yC0j8dwM5BsrKmzkO7RfUZbzjExyTQpkeWDtwjFNqHckFJHhh7XDQkWPc7kQRl0VF5rDOdc+a8BqfYVcTjjweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S48+hgH2VmzfEjLMOCn4XbeTFUmmqXzy8WudOwilpqY=;
 b=q5ZYrz/jK9v7ckFnoJHLO15fHGEqTe8ilBND6NtbJgxMmF9cL5S/XhTnUNuzayDcN6KucwPanp9RnUTEKwaolCLJ23qhK1iRfjzyverWNz3iuYjHfp2cjW77hSKIm3mmf8O1ahgpH3HY1DwMMsU+1q7icfvJYsaFZAomxf4u4fiky2J8zvvDkruDu4sGA8bX1oMbP2lbOJxDYX551VHmTjxiGK3kLdxMGpSeZiboLKs7YOiUz6YR4KkOi/6OmNutRpVY10HjQtnJhOfDua62uoC4Yma9GGOQAMRPLScxTIr4fgREHtD7CvWOIuCinanl3uQ0/TsVQtDS8s6/pOZTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S48+hgH2VmzfEjLMOCn4XbeTFUmmqXzy8WudOwilpqY=;
 b=nhvxVNe4j2xzpTT1/OlIgj8h0f5Q7y1IqgrfEv26ZbxxoFay4/W3QSrsAUlWlNVF+/UZMpC+5XjDgFXnGGL0D75ZLDmM+SPGgXENETSK4Zqv+7JbbaYb4mtuJZvQxL+vGBk87ntauokV2ai76T4zG3oaK+0cz0I6UjPoEPt5VynAO5WkUCJFN0P2DSZMainWlrUhwH1kEvapa64Cq/x6B0YV0eGuagnvouDT4mMA9edLZomxsAdmyoKAvD/D2wgCS6n8oWk5LxMTEeSmW3JFDW2YJS7Zhy1fqALzdh35rScptXhDyt5hyyxlasfzncGCQU+qDygY85l7djfjktya9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 18:48:59 +0000
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d]) by DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:48:59 +0000
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
	Heiko Stueber <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 phy-next 12/28] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Fri, 27 Mar 2026 20:46:50 +0200
Message-ID: <20260327184706.1600329-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI6PEPF00000222.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8f8) To DU2PR04MB8584.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_|MRWPR04MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3704dbb6-f262-4fb4-0b09-08de8c31818a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|19092799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: JOgDEosucolsegjG+RBZNlvvP04/WDTKtyetSAeAyLQPryahvNMUotnzm3c3fHmiCcurQ4TkFLizKMTsRh30aA6zPX7WgMXyAhOo+jALXjHM7/5w3RcIgBy1ths7L1r0mfquguICjzC9j0TMSTT4BuwlKEWI/whKAU8+4Zoe5zgJDIw/QqCobe9xrdKPTO7QKi+J5N7xRNYDpoeddnyYo77gXF05puMMi2SRLcXLR7XZXUM2dbQUGuYztNCJ+eg3INMsMRJIawfFUWuEhPNte3MPSMZjEGlHsdPuJAnmZVKQzM4G8ih6FLu7Gg5Z6hZJPbu1mxTRf+S2QEDSeqtmrXsYkYxwH0LcgXX08tgzURaF/Q1P+hj8sJv+kSfbTtsbUpm50GNEgnsQ0cnzbH4Vz7iAD8tapwcATK58qYR5eXMsP9SD04oUmycPxNu1yzG3msNtr103VfBLYvgH67OIXyRZ1yJBMcXf/UbYYR4hAYIRDdR4sSiodCDNgh0nq6h0wyZul7iQromImM0et6GaNRUbm2XcFV62vcHHB8vAsQGiZ0WvLEBIGpx7k85Rtneh6rRyVNdh7TPGCkSWqLQKwp6yCpsIPeYjpsb1lTyVcunoYwTSiKVeNGrpxzygrg/dMt7Sk4g6sYYc28LuBOh1SpvqqYfQr1MXjh7B6Y+RalIBsiZYOiY4LLlMFLGHAZ6onTUtvyNm8ewqZqkaRWrupdtC3AofGT2mvUzOTQPjmsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8584.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(19092799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjljbXRraHN5K3k3WGNUYVpOeGhLRlowZWhSWElPMGhkS3UyU0xwU3RITnBq?=
 =?utf-8?B?T1haT2xORzFEQ1ZnMW5TdU9Cc2VmUmprSTVNQXVFc1lPejIwdHF1cy90b3lC?=
 =?utf-8?B?V0pEUjczdjQyYWpDVjZScnVINmdMM1l4L0FQbzFsZXRTRW5yUjRxZE9vSzhL?=
 =?utf-8?B?cTV3UEd0cHc4djhCRGFGQWdQTG5yZGRVNTNuTHhoTkdEa2cxWnFWenA3OGhK?=
 =?utf-8?B?NUZEcVBGM0lQUjNzemx1YzhWdksyb29oc29JWitaZ3RHRTd0RVVjazRReFlr?=
 =?utf-8?B?OEpoMjlkOUgrRVQ0Tzh0MGFpbWt0eGtGVW4yVS9paWxNQUM4UzJ5bk1OemIy?=
 =?utf-8?B?OU85MkErbk9INmppWnk5UHZVUW1PRmM2MTNvNHF0MVB6Zm96YUVUVmJYWGNW?=
 =?utf-8?B?NzZkL085eGMwRnhOSFBBdHR2MXFRZFpsQkJUR2M3SlZJazhGNGFMRHUxbktG?=
 =?utf-8?B?U2l1SHM0VU5hdXd1cUhjbUxJYlV5V24rS3BiSS91a1JMNEdGMlI2VWJPSlIv?=
 =?utf-8?B?bjFHb0hzYTJSRUxGdmx0cm5RMTBabzZ1NFNWN3R5R1Q3RXFwSEJqV1dSU29r?=
 =?utf-8?B?NmhEWGt5MmFIdlhQZ25NQUlJOVM3QVVCQlkzenR4Sm1wWHJKeWtBcnlXYlNz?=
 =?utf-8?B?VjBwNm9VN29heUZVVEZwcUNMRC9HSTNiV2g1aXJPTUdLRHVoZnBXQi9IUGpE?=
 =?utf-8?B?UEFYdHU4dTdVMURldWd1UTMvb3BnRXJLcXM5eHpYeEh0OHJ4ZzluMTRjSzBV?=
 =?utf-8?B?eVF6Z0d6cW1UcjBld090anVBNFZZd0NuMUNTWEhpSEphVTM1L2FzeUtmdWdP?=
 =?utf-8?B?RU5NV3dLOVRzY2FDZzcxWjBpUjNoNVh5M1U5Vjk4VDRBS2QzbE9WRUtwZC9E?=
 =?utf-8?B?dmRlejNpWXYrTWhDL09mY2dhQ1VEOGtNcUZ3MEY5R282Y3hLeWo3VTRMKysw?=
 =?utf-8?B?SFl6VDVPcTRxYmJ6ekIxMGNpNFRTayt3WCs1bDdKSk9OaWVQdWkwbnp5Z2NS?=
 =?utf-8?B?aW5FMmwydklmcGZCS3BxOGRTTE9Ia1lOS0N2NVJadkJNMU1yaXhyZGFmdFlU?=
 =?utf-8?B?VTVEMWUvUTZPRllUeXBnc2wxU3Azdmc0WmdsZFpHOVlkRTFnWFRNQUViakpF?=
 =?utf-8?B?WkUxKzRpUzdPVVlIZ2ZWeUUxL2pUTkdBS1ZGWjJvVzFZVzJCaDlFQm91OGRE?=
 =?utf-8?B?cytwM21vWk85OVJxbFloaEd0akwwWHRGQWQwSXZveTNxaUczT29vQ0JlVk5i?=
 =?utf-8?B?a1VQWXBHSXEvZ3ViT0NkZWFEbVNXdlowMmhRL05mdzBXd2NnS3FWT3FmSlo0?=
 =?utf-8?B?VFhSbVQyOHppVHpTcFN1UmZ5d3o0Q2I2NlNEUHlOaFBiSzlPVUJEbUZNWVRT?=
 =?utf-8?B?VUdhc1FBSnpFTFpNV1dxb2NKL3JrQ3BsOFVrdGxISk05T0Q5Z01PZXBZN0tL?=
 =?utf-8?B?NTlYRXZaaEowWm1Va2kxKzNLVmNhcGxwQWZ4Uk9QWDF3dFhSOUNJZEszRCtD?=
 =?utf-8?B?Y2xuWCtadWxJRWlkakpYR2hrekV2ZjZ2K1FWNEQzNFIvSjdnTXlHUW5ZdytZ?=
 =?utf-8?B?elJ4S2J6M25LQlZUWXF4VkI5K2oyakpsVVlIQ1hpeFZkclNlVXZTems2ZklH?=
 =?utf-8?B?UjJaZ09pOWRhTDNKMENFZVV2MVZMaldIUi9TVVVWQVZDemNoKzNta2xBcENz?=
 =?utf-8?B?ZTZxRjJIT21uNG9kbFI3Y1ZSY0VvSytDKzhXMGpCZ0NRK3oyTGdYWnRsUElM?=
 =?utf-8?B?RDlFazQ2V3lkQk1Ib0t3Nkw1Yk1hWFZYclp2ODZ5K1ExdkJZeWF4WW5SVS9W?=
 =?utf-8?B?TVI2TWNBVmRxT3ZQZ2lkSGJQa2Nua3Y0dDNWUHlGTFd0akN1eGpoVjBuc0E5?=
 =?utf-8?B?c2dUb05GOFgvWCtFQzU3bEEvWWhVNlNhajZnYld0K2Q0MHp0NlZTcTMrdkhw?=
 =?utf-8?B?ZnVlcUJWMUQrUEg5UEhJRHlYMllMRDlPM2tJYTdrdy9ibk1iOFhtZE1meVpt?=
 =?utf-8?B?NVhqZ1JIUXZjanBSWEFucFdtcENGNHFpN3AxUGpFT3EzMFhBUk43SzFFaGFY?=
 =?utf-8?B?OExlbUF0L0RXcnZnTXQ0M3VGY09wREtHWFJZV1dlRFpwS2VuV3hnb3BqSG1V?=
 =?utf-8?B?ZWRHOS9xNHkzS2FYbmVZdlZQZ21mQVY2MkpUek52czJvanVEVm44SittSXRH?=
 =?utf-8?B?Tm9xL01TUHM3QWxVbzBmQ2NBSnM2V1dNRk9qemFVcGJTeGd6UEJlamJTazlP?=
 =?utf-8?B?YlRDUXkwY1RvZWtJOS85Q242ckxnQTYvZkFKZVpubU1iazdPdSsxcVhJcERp?=
 =?utf-8?B?a1d4eEh3TVBZL3B0aXVUQzUxZVdYRTB3eDRmb2JBaFVlRXNzMGtvalkzbFRX?=
 =?utf-8?Q?cm7WpHv+IaDd7+XUBSVkhjNhgiUz03YLQBUOuyEFoixQK?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Bctp4s+Lqf4u55zlkR5YlhM+thUVaDp7vw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3704dbb6-f262-4fb4-0b09-08de8c31818a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8584.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:48:58.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2xy9Waqoe3oDnieZjJn8K6urlUMP+z12bYBm/vwALevdIxoC5VaypuViU+lWoz8F20/jKFzZot/cpZqOwnaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114911_594747_88E6F835 
X-CRM114-Status: GOOD (  16.30  )
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

VGhlIGR3X2hkbWktcm9ja2NoaXAgZHJpdmVyIHZhbGlkYXRlcyBwaXhlbCBjbG9jayByYXRlcyBh
Z2FpbnN0IHRoZQpIRE1JIFBIWSdzIGludGVybmFsIGNsb2NrIHByb3ZpZGVyIG9uIGNlcnRhaW4g
U29DcyBsaWtlIFJLMzMyOC4KVGhpcyBpcyBjdXJyZW50bHkgYWNoaWV2ZWQgYnkgZGVyZWZlcmVu
Y2luZyBoZG1pLT5waHktPmRldi5vZl9ub2RlCnRvIG9idGFpbiB0aGUgcHJvdmlkZXIgbm9kZSwg
d2hpY2ggdmlvbGF0ZXMgdGhlIEdlbmVyaWMgUEhZIEFQSSdzCmVuY2Fwc3VsYXRpb24gKHRoZSBn
b2FsIGlzIGZvciBzdHJ1Y3QgcGh5IHRvIGJlIGFuIG9wYXF1ZSBwb2ludGVyCndpdGggYSBoaWRk
ZW4gZGVmaW5pdGlvbiwgdG8gYmUgaW50ZXJhY3RlZCB3aXRoIG9ubHkgdXNpbmcgQVBJCmZ1bmN0
aW9ucyBvciBOVUxMIHBvaW50ZXIgY2hlY2tzLCBmb3IgdGhlIGNhc2Ugd2hlcmUgb3B0aW9uYWwg
dmFyaWFudHMKb2YgcGh5X2dldCgpIGRpZCBub3QgZmluZCBhIFBIWSkuCgpSZWZhY3RvciBkd19o
ZG1pX3JvY2tjaGlwX2JpbmQoKSB0byBwZXJmb3JtIGEgbWFudWFsIHBoYW5kbGUgbG9va3VwCm9u
IHRoZSAiaGRtaSIgUEhZIGluZGV4IHdpdGhpbiB0aGUgY29udHJvbGxlcidzIERUIG5vZGUuIFRo
aXMgcHJvdmlkZXMKYSBwYXJhbGxlbCBwYXRoIHRvIHRoZSBjbG9jayBwcm92aWRlcidzIE9GIG5v
ZGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZQppbnRlcm5hbCBzdHJ1Y3R1cmUgb2YgdGhlIHN0cnVj
dCBwaHkgaGFuZGxlLgoKU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5v
bHRlYW5AbnhwLmNvbT4KUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWViZXIgPGhlaWtvQHNudGVjaC5k
ZT4KLS0tCkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgpDYzogIkhlaWtvIFN0
w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgpDYzogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT4KQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4KCnY0LT52
Njogbm9uZQp2My0+djQ6IGFkZCBjb21taXQgbWVzc2FnZSBjbGFyaWZpY2F0aW9uIG9mIHdoYXQg
aXMgdW5kZXJzdG9vZCBieQogICAgICAgICJvcGFxdWUgcG9pbnRlciIKdjEtPnYzOiBub25lCi0t
LQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyB8IDI1ICsrKysr
KysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5j
CmluZGV4IDBkYzFlYjVkMmFlMy4uN2FiYjQyZTQ4NmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKQEAgLTUzNywyMSArNTM3LDIyIEBAIHN0YXRpYyBp
bnQgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLAogCQkJCSB2b2lkICpkYXRhKQogewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gZGV2X29mX25vZGUoZGV2KTsKIAlzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0
YTsKIAljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CiAJc3RydWN0IHJv
Y2tjaGlwX2hkbWkgKmhkbWk7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBpbmRleDsKIAotCWlmICgh
cGRldi0+ZGV2Lm9mX25vZGUpCisJaWYgKCFucCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKIAloZG1p
ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJORUwpOwog
CWlmICghaGRtaSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQltYXRjaCA9IG9mX21hdGNoX25vZGUo
ZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIHBkZXYtPmRldi5vZl9ub2RlKTsKKwltYXRjaCA9IG9m
X21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIG5wKTsKIAlwbGF0X2RhdGEgPSBk
ZXZtX2ttZW1kdXAoJnBkZXYtPmRldiwgbWF0Y2gtPmRhdGEsCiAJCQkJCSAgICAgc2l6ZW9mKCpw
bGF0X2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXBsYXRfZGF0YSkKQEAgLTU2NCw5ICs1NjUs
OSBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2NoaXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlwbGF0X2RhdGEtPnByaXZfZGF0YSA9IGhkbWk7CiAJ
ZW5jb2RlciA9ICZoZG1pLT5lbmNvZGVyLmVuY29kZXI7CiAKLQllbmNvZGVyLT5wb3NzaWJsZV9j
cnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwgZGV2LT5vZl9ub2RlKTsKKwll
bmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwg
bnApOwogCXJvY2tjaGlwX2RybV9lbmNvZGVyX3NldF9jcnRjX2VuZHBvaW50X2lkKCZoZG1pLT5l
bmNvZGVyLAotCQkJCQkJICBkZXYtPm9mX25vZGUsIDAsIDApOworCQkJCQkJICBucCwgMCwgMCk7
CiAKIAkvKgogCSAqIElmIHdlIGZhaWxlZCB0byBmaW5kIHRoZSBDUlRDKHMpIHdoaWNoIHRoaXMg
ZW5jb2RlciBpcwpAQCAtNTg4LDEzICs1ODksMTcgQEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tj
aGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGhkbWktPmRldiwgcmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIp
OwogCX0KIAotCWlmIChoZG1pLT5waHkpIHsKKwlpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0
cmluZyhucCwgInBoeS1uYW1lcyIsICJoZG1pIik7CisJaWYgKGluZGV4ID49IDApIHsKIAkJc3Ry
dWN0IG9mX3BoYW5kbGVfYXJncyBjbGtzcGVjOwogCi0JCWNsa3NwZWMubnAgPSBoZG1pLT5waHkt
PmRldi5vZl9ub2RlOwotCQloZG1pLT5oZG1pcGh5X2NsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92
aWRlcigmY2xrc3BlYyk7Ci0JCWlmIChJU19FUlIoaGRtaS0+aGRtaXBoeV9jbGspKQotCQkJaGRt
aS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQlpZiAoIW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdz
KG5wLCAicGh5cyIsICIjcGh5LWNlbGxzIiwgaW5kZXgsCisJCQkJCQkmY2xrc3BlYykpIHsKKwkJ
CWhkbWktPmhkbWlwaHlfY2xrID0gb2ZfY2xrX2dldF9mcm9tX3Byb3ZpZGVyKCZjbGtzcGVjKTsK
KwkJCW9mX25vZGVfcHV0KGNsa3NwZWMubnApOworCQkJaWYgKElTX0VSUihoZG1pLT5oZG1pcGh5
X2NsaykpCisJCQkJaGRtaS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQl9CiAJfQogCiAJaWYgKGhk
bWktPmNoaXBfZGF0YSA9PSAmcmszNTY4X2NoaXBfZGF0YSkgewotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
