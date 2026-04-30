Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD20CD13D2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiQJFlbH9aTlG6hPQsUWEZKIFWwAl7gkj4MvKnRDldc=; b=XU4euItmC5gR2G
	gzO6/s3AHM77QlRXPHB0JdO8NI6pzEqkusosvXRl1wWDMDBvK1BtAmvC/vbWodxfgQIfqG7x2x79d
	QRbJB9K9cYLdSrVSEvmGbKGw7rBWFL0VK55J7xXu1+oXciaeYJd962BZrJVlbBrPY0lpFIi8OzWhg
	HzAEErE2+M/u8zuBOciibOROrJ5/F8nAJk9A6Pgo8xFos76ixTXq03HLFo0wAZLF3heFMvdGLUism
	DkY5U78e6htBzlSTQYkozv5TbkWNUWEX3XdLCZ/k9/4f4/9kpqRPa4oPj/ZFkk0/uAj/gz0JPmGyu
	snABBNq5blhd42MgaNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPGa-00000005IIg-2Itg;
	Thu, 30 Apr 2026 11:09:12 +0000
Received: from mail-westeuropeazon11013037.outbound.protection.outlook.com ([52.101.72.37] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFD-00000005G2z-114Y;
	Thu, 30 Apr 2026 11:07:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF2/MMQO4G53vgqEf005ferzpxnqMMrfXMtlBHxvBSYwZKcHxvpPNlATu5L5QMBJSAd49KKpb72TufDaEPDoWGaEnRuW7Io9FQcfDOzivvU3KghfznQQpQjUxpGy/uhDnWSrg4fOJA8Ld7nrQbe8RDpawPxaVGwEaYO0CZ9TzvAUM6Oad3Jnv14rZ//sCq468wGd2/U1Ty1k740c7oD6LmY+8FfdQp7IDBJ/VNIpLFr9yEgQjG7ppwMcGHErYDp4INVcZ/fj3ZkcbvoI7TfSwyHpeLQuR63f/xG4SyN0JJ6jz4nJZgWLWFXh8slDnwnPfeNiyVDZ7N/Fnv1iRyta7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYEA3WBNYo+AsAnEBH4YZSbMHpGmNo94b2KnUaCvH4k=;
 b=sMiGo3FjTB7EaNttBxkRtZ4FNR6pgfcVm3lwU6LGkKttz753KEYlhoFjWPOaLNnPL3QJ9m8rSzi8D9OKSCwy+yNwyo1W+fYwSh4pA4j4uc6r/X9f7Tgh3TwmncptLRp/zXTLsfvto84Rmax4O44YZ88NJaTNTUhENkysKY9i+m03pX1BEmfaFZ90KPcLiNKWk6TcLpBu8Vt9niWAniDfCwQHN3StTIDjsI2HmmbhaT7rpk3FrGe6E/Y0Le+sxk6jv5ZvWaw3UbdAISBD0w3xQkEn6oULv2caVUPRjMo9FeNXxmtu7cZToEzicIL6cTheSjF3rC+wVSFRJ9MQx+AX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYEA3WBNYo+AsAnEBH4YZSbMHpGmNo94b2KnUaCvH4k=;
 b=AulHh/vv+0fW4G3cwhNJT1DaILqJm3Pz8onnR7MnB8WRBuMHzeys3bQOsKeu/8q02E2Um/qvsrtPJCnFmz6WlrzJs9DZU0BSn/Qu2MEdgBWQpwY78V4ki4FMDa41guRcI27GJHryeapFmcQ+3UWpwuLC1zFy/vLOA1AHaAvuz+gqIM1mBcbmdD3CZqYAKTDaM/UzcNXY1KHb8Q+urnjWJBlR6pkErQbp9pwylwQVuHlBl/EP9xBTLP/QxSVecTX+UDUJo/wwZg6oZv0mFmR0sOBFV69XjK3bTplKDEQRnN49DBGv6lTUOGB5ZShX+4BqalH3A0jpRNVQ9Q9yyqgwFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:07:29 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:07:28 +0000
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
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v7 phy-next 18/27] drm/rockchip: dsi: include PHY provider header
Date: Thu, 30 Apr 2026 14:06:43 +0300
Message-Id: <20260430110652.558622-19-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI1PR04MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc9f532-e0c5-4af6-ffab-08dea6a8aac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|19092799006|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: yCbuz0nS3J3dbPuhi4tjTaamZNkKK4xvcxAaCWsTj/P95RjllAMm89kSGyZsXsk5PtROgZ1crYS1e9NFVjn2fKQj/2BOdmMFY3FjvI2tohIf7/cuDQfY6cLKdwNVu41vZAbpp7Y4GHtOf8SS4911PaCsepM9eM2eZPH3IBJ2dpq3NNQbqs0JtDMsMN09e0HTNL6IvJ1FQX0Tgj6PuPPv+JZTjBqcYPS7DTZXbjQYcwjtQElKzR8pHlXUnVAVt0VahN45iueMkYZhAXvWpvCzSLf7/Q07r1/2Aao1fzjHfFAnbtNLSF3CKsax9dajtbKAXwnMdcZyZwBiKEJAtXLHcKAOAOusWA2CyULuUjAZJPRyimAsxPvIXUsYK5Ygn7w23w7qsniwdY9j1kss6OPLJs3r1YmRcIl4NnKEwFe8+ekX4bMgrqvBZ3JqWeun4tX/TlgqjsktalHscshh0b9wdFe0wXvkA51q0hF7QAsM6wYV4j/WFULg/n34tiFdQJZVBKkO2ETDT3biNV2Ip1I4qSRO6cCFijylGci9JClyKV5XI8lvnoFarvji344I6NFYJ4q9qNZbQjLRpN8owBXPvtLb3m4ujvcZMkGBusiZup/HZFupcAhVQFX8B1DU6P1XDdZWZg+bJNFbf7rdYxW3bNsWmQSyWp3hLWluCPkX36TJUI1wXr1tHvwgL+WNL8CUl5CiI3Gz1Qog+a6DblfBp90D1WXpj7x9Ulzi1WeqEpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amRZLzNseXBTNFJ0ZktieFJQQ0JtK0kxOTFudERxeWNxV2IwMFphUVdBZzJi?=
 =?utf-8?B?ZVh1NU5KS0JneTAxSHIvaFBzZUFuQWZFRko4ZXhIeTlkVzlCL0NwRDNia3VN?=
 =?utf-8?B?VTNtbXI3VWE0VkRtN0NjUCs0Q2VuN0s2d3pVczhVNFBSMnZBV1VrUUtHNFNj?=
 =?utf-8?B?QWxldHRocHo5cUZ3dGhQY1ExYzJCRjFKd3pQOHNHRks5NTM5K3hxcVEvbVV5?=
 =?utf-8?B?RTJPNEx4aXVzTzRyZGVEOTBXUEJUTW5KMlpKUDVMenhjT1doZWNoOHB2b3NS?=
 =?utf-8?B?T3FkYlgwMTkzYTVoVUpWM1BKenBKSkxBeEtiVjRVa3ZtM0lmRk90SHM4blVQ?=
 =?utf-8?B?Wld5bzg4clVGUHFMeXU5ME5WRzJRc05WaU43RFpySXE4YS9uNFk0VS9uZ0Jq?=
 =?utf-8?B?VUp6SStZbFJjVHZ6WjlhSjFjdVBsdXoyU0FHamJUZWtQNHhpWWxsNWIzeG9q?=
 =?utf-8?B?VVRzOGJzVnd4ODcxUjEyZU9uMlZTK0dROHdFTkg5dzZJMndxMXoxc3ZLT2Ra?=
 =?utf-8?B?QTI1ZUkzR1M2bEluUXI2VmpKOG0weW9VWnNpSG5DdnFXT3U5dFBFd05KTy9T?=
 =?utf-8?B?TGtOUmhtbUhLVHpsbU9aVEtZMEJrbkkzcGFzVmZOcmloRENUMEN1RncrU3F4?=
 =?utf-8?B?bWVPNUlXUDBZSVozMmZMRGIwOXJrdXhVYjhCSHhETlpONVIyK0pBRXdYWlRN?=
 =?utf-8?B?RXJ1c2UyM0NKRFVnRjQ2djNmNFhzNTM0TTNDWkRrS0R0TllBUU0rYk1aUGNu?=
 =?utf-8?B?d09GVUFWZzF4M2U4OUNES0VQVGErdHpMcHNqU3BDVURUSjRTMlk3R3J0aE9q?=
 =?utf-8?B?Z2dHZTF5NWs3bVdqZm43cWJvK2w4RnkwUmJDV2FRdy9ncE4vV1BEUW9yM2hP?=
 =?utf-8?B?ZFpubjVNNDJOUkcrUHBHYmgrTjZwK1I0eGVsQWZFRmkyYjhjMGtpSCs2bnhs?=
 =?utf-8?B?bWYvcWRuQmVEUnFFUUJxRDBYMTZnaXFSS3JGeEdWSURBbHcwVVJmNTF4NDBQ?=
 =?utf-8?B?RFFGRE16c29aa0RhNDVLQnlYNXZEeDBOcjlPM1VVOHZadVhZNmhvR2VXcFp2?=
 =?utf-8?B?c0U4eStibnhuZ3dSTjhMMkdQeXRWMG1BZWdmNjBBR2RqdEJ0REt6YXdZMWYr?=
 =?utf-8?B?clZ0SjdkOGtYNFFId2lZelgyNzd1SDJUeFJLeE1XeDBTM0NDNlhHSDFaKzRR?=
 =?utf-8?B?U3JkOHVzK3BDWTZkcEQ0VDhiazV6OVBZcDVBcUFmRlJtajgyeFFEVjcvTk4y?=
 =?utf-8?B?OHptVGM3Um0wMHIvOXRxbldpUE1WdGZPTXBjT3U0a1NTTVRhcHl1UGx5YThD?=
 =?utf-8?B?M2pDa2UwQmdTQVhoK3UxRGpjeFlReTBKQUpGZHdTd0M2cVRJMmZtWTJkKzlz?=
 =?utf-8?B?TWdCamJTOWwvRy90bUZMV014Y0QraUtGYThuQ1dmeFBBN2tOaU02T1lGaXpE?=
 =?utf-8?B?M2NUd0ZXOHVlZmordmQ1RXF0VDk0UTExNlkrWU5CWVUvSE8wTkgyQWJySzdw?=
 =?utf-8?B?b3lYK1JUNEtGUE5oU1VOQWdJR3JVTWRXOVpmQXl2SWpJWVF6QmlPb2dBRjlr?=
 =?utf-8?B?N2JYbWxyanRxNFliMTUwa3BEN0FUMyt6WUdOZ3pSMElBQ2lIMFZ2S2NzZmNI?=
 =?utf-8?B?L1Q2cU9WMmVYYWd1L2hrQUdhcW42aDZCN1A5ZUM1bEpySFd6c3NidU9RRDhv?=
 =?utf-8?B?cUVENmFEUFBoc29DTzc3a1ZMbnhjVWp3SUxhOGo4OG1EL2RNbFBSSlRlbEx0?=
 =?utf-8?B?dW1FRXZuY2Rvak5kWjdIY1N5QnhPd1Z5SzhRUU5ONEYvVCttaXZTMS9aQndF?=
 =?utf-8?B?SW80QzliMCt4a0pXWXlqU1FZU0dxTklDaGlPSkh3S3FpbUgxRGVPaVBSeEtI?=
 =?utf-8?B?cUdjcC9VV3krNC9RT0IrTjlna2J6SmxNM044TnlCeEV1NmpJMnZRWDBaM2sr?=
 =?utf-8?B?YVBzSXM3RkVGV2JDVW1reWgyYjdYZ1hQSXFtVFhYYy9BYWEzRkl6Y09sOUpy?=
 =?utf-8?B?ZGRtbk5ZQm42R0NTM3A1QVpzdEV2WXFEbjRpT3Z3RGx3SGd2OWZPeVJKMFFO?=
 =?utf-8?B?UlJSTC9OVzhsK2lHRTg1aUJKb3RQdlg4RDJOWHdZNEwxbkU2eVZZamYxQUVM?=
 =?utf-8?B?enZSeUgzMVVpZVhLRSthS1B5T2xjUGxRQVAxNHFsWm5pVEpzVG96U0Z2a1hv?=
 =?utf-8?B?VUU5TWhCZDRvWGNEWUE3SmRFejhCZ2hiYjlmOXpyT2IyVGNzaWpzN05kekJ0?=
 =?utf-8?B?cWFQUFEwcmpXeEd3N3h3RUh5cGdYQ25XVWc5NGFUYUdBdkFlZEJDM2MzbHBW?=
 =?utf-8?B?TllXN3NUaVdvVGJNWDRacWpOejlSbDFYcjEyR0t6ZzB4Z2d4V1BVUnU1NGFo?=
 =?utf-8?Q?WZqkmrpaTKfrF/UAlh6tEq7wD7uqYwx9FyI4e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc9f532-e0c5-4af6-ffab-08dea6a8aac9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:07:28.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q7tNqvXXPK4T8YdZBy2T8/mWNPq44y0tvaIV96Tv4AZL1CUBMe9bU+2gBUS9DSjSOC8aQW0QvPN2dPik3aXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_040747_371655_235808B3 
X-CRM114-Status: GOOD (  10.70  )
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

VGhlIFJvY2tjaGlwIERTSSBjb250cm9sbGVyIGlzIGEgUEhZIGNvbnN1bWVyIGRyaXZlciwgd2hp
Y2ggaXMgYWxzbyBhClBIWSBwcm92aWRlciAoY2FsbHMgZGV2bV9waHlfY3JlYXRlKCkpIHRoYXQg
bGl2ZXMgb3V0IG9mIGRyaXZlcnMvcGh5Ly4KCkFjY29yZGluZyB0byBWaW5vZCwgdGhpcyBpcyBk
aXNjb3VyYWdlZCwgYWx0aG91Z2ggaXQgd291bGQgYmUgZGlmZmljdWx0CmZvciBtZSB0byBhZGRy
ZXNzIGEgcHJvcGVyIG1vdmVtZW50IGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRl
YW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgotLS0KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9j
ay1jaGlwcy5jb20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPgoKdjMtPnY3OiBub25lCnYyLT52MzogZml4IGNjIGxpc3QKdjEt
PnYyOiBub25lCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tj
aGlwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKaW5kZXggMzU0N2Q5MWIy
NWQzLi5jMGFhYTUxZTAyMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9k
dy1taXBpLWRzaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9w
cmludC5oPgogI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KIAorI2luY2x1
ZGUgIi4uLy4uLy4uL3BoeS9waHktcHJvdmlkZXIuaCIgLyogRklYTUUgKi8KICNpbmNsdWRlICJy
b2NrY2hpcF9kcm1fZHJ2LmgiCiAKICNkZWZpbmUgRFNJX1BIWV9SU1RaCQkJMHhhMAotLSAKMi4z
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
