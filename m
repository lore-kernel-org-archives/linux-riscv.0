Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB26109192C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtyIwCvmIK5IVz9mL4ns2dXvhr0wCfW2FfJCV2KMzHE=; b=Zv2VcATNPy4Djw
	SQ3E7bvICaUbTEkvlKYVDf171J3pHgdQCSXC6E1mHFHuQDVKnrQU9VyqZ24d4PHt1f/SE9B3EZRle
	jOLMvf2PH7G5FXyWQi8LrZEHmz2AAgUtb/ZIjYXcOtKl53YD6sK4ANMsS4so1qCV9NGY0O4xggrhL
	XIeimpJOUM5QoZ3ygD0NExm3El6koyrAjNr7ncQ+QZSYCB4q3JgurnS1wz1vfOXjZkazIrbifXfv2
	Y30jgx4ZSrCeMfSG0HX5i4rIP2cwcmgtb2nx7jZYjjrFftJPpmNZQdTHznn9LJ8+WYhAIoVKVEq0o
	TELRkW+BaBUkGAaaPFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LxD-0000000Bhu9-2DvR;
	Thu, 19 Mar 2026 22:34:59 +0000
Received: from mail-norwayeastazon11013060.outbound.protection.outlook.com ([40.107.159.60] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Lw1-0000000BfsA-3WNs;
	Thu, 19 Mar 2026 22:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSaCS5CYbN6Uh1L0PgEEV6iEUmh/zLEV9eI2VAT+6Jm+4SDujBTeQhf48pILTL7aD4ZlAmVMRxlONm5ScFupVef48ARTiuZsSreOROiKO6wQ/efSeP1BIVQdt9tpaXF6nZBYfd/svpGXCyi65YyWsgnPJL3KRjLGJF9bwG3ni37Dt36bDVfvigtN+4W6/nJcIqiIvF58DlOeX6cBUdfJtikJOIOArnetrN7rY23/BoLZXMy6J/+u4zjItA5vSPoQ4T9uIIZ4STJzS2LUVEFnRgqZi1n+k4XWprK566QTNr2RxSl1q5RSSq4aieBVPDBgse69TmjxqqS1mfr/GYiUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmByo8vP5R5ywxu3EV0K1L0EUI2yeBwe+fqBWhuBtkg=;
 b=fcaKuBAX6qsGulvN/+5wY0aQPdP0l8oK0ur6vta1SHSXcknrVz00Gg4VZGy9bCjHE+MlERMzt6dw0GgVW0CxpQpaMEHQJTb3Gxjf5/RKIXiNWBtHIRy/hsEur+Lp/5/kC5Y80d1CgEi6M2A2hcNLSMHY6/pXLoIgEi9dTlzv6RCgSYDx3s0qs3mPUj4LC/F56X+06BYXnUVTgWb9/uguW9gn+1APTbRQqiAahL08FEwy4PuukFLmMO11LoDW+h3GjJbY2bQf4OOi+3AGDrMonG2E8YnPtEMawxNFkEpSQCt0HjYGyaWlicgv6ugXLZIJZhn79/HoCX9+H5Bd4BS5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmByo8vP5R5ywxu3EV0K1L0EUI2yeBwe+fqBWhuBtkg=;
 b=mc83rNQ+vfpf+p7KAyRBKN/VPL5j0A4A0cSupZKLiC/q2tbuiCi8FjOplI45Qc7/UyboH0XcjtihxNkVC20yJT/1/OzhC860xANTPeoBAo05Anh3jQ+kuE4jKFyCWhmW1BVWM0okinsrTo4Kp2EOs51lDGkpbhHD2ogcBAHkgE2jl4J9knAawsgTeSntrxuXRoF/Z5wGIWrOItleGU8qIHLFhv0LOiRKO630TJ+93UM9JQ7N/tVKOPPf/mLTj/G6UPxzgQN7m6X8CeJm7UdrYiah/0MvfCXE4uAsmrq7Qo1wQGDPb54KRdBfTjQlV+WQPCRwoHMbn4+LsHbT6+h5ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PAXPR04MB8079.eurprd04.prod.outlook.com (2603:10a6:102:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 22:33:21 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 22:33:16 +0000
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
Subject: [PATCH v5 phy-next 18/27] drm/rockchip: dsi: include PHY provider header
Date: Fri, 20 Mar 2026 00:32:32 +0200
Message-ID: <20260319223241.1351137-19-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR08CA0229.eurprd08.prod.outlook.com
 (2603:10a6:802:15::38) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PAXPR04MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f71c39c-aa80-4ee2-4847-08de86078368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|19092799006|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q7wpKQvc05TUxqvezrHRwYf35/uJfSfHGllc9KA2FB7Bluel9frQYnQuu0x12cPP8FPypdDzElAyUjQzjaf7gEFsR1hZiTMM02kFBUBNm0oboTFPxFhLvsdRPOIJcMTJ1zammmvbvXK0YMl4zG1nR90zghYcVKAUkobIIy19NOPR4ZdTCBff6rNR8N6Ot4pjmAdTrUNvsX7GzPPAPAMEYu/IHlu8ZjsVNA/L7CFqLp06tFmwWuKZiB5juRwRpIpR8BwwEblFtI8pg7Tm0a8aI9oj78KUslc6zGz+Ch/5hUX3yL5WM0pvn34dW+s9eDVBn4XBbv7Q0BcuP5kLqC9qqiKUzCWId5cRkUQyo/ommIPRus3bb0huajDOb2qoMd3eynh0kCmIWF8h0nwiDAIykNxV/IoHWIJZBHLXykvOV+zbX0kfTfvDESqgWO8vWXrHWkKE5yEfhBBAcV/NYlPETLGkXzsT8NJvupOUFOl6JJkAe3Ct3gZ9H3ykoqI0NRvaKtqHAQvJQoG977bpMvZpQkbLsXWrKeeZgCUj89bh8gRRByCtv5VfwpWAY8cP7jYmBbyXGH6Dk77lOr7DsRCINDIKQK7CZ68R+g9Kv/WzP6lj/bW4W5jygVn85Wb4gzz9sA4WUlcOoAeOTw3vXBYXzWkKp7ibvkXnCSidOEpYlNeJ73pBkDCDo8xPYsRhWfV8Gy9RPGGB6X7mJphOxca3i486iytjoHKaPhoUDuDGWZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNMRmdHNHIxak9iTFIvSUJ6aEV4MlEvbjhFc25qWFZmM3lLZ0lhUFJtbS9X?=
 =?utf-8?B?OFBQcEVJTlFVcGQ2OGdkWnY0ZlJUNXBoL1RHLzFpZ0dhTUlWUDgzYTdoNXNS?=
 =?utf-8?B?dXcwSEF3Qk4rR1huZjNJQ25oV3AzRFh3dzg2WXhvQi9oWHdNcUVEbWlRc3hX?=
 =?utf-8?B?MWlGeE5CQmNydXI5MVMyUk4weFNsZnBRRGJvQldVU2FENjFJSThYUlNONmZy?=
 =?utf-8?B?VWtvTlFGWmh6KzNXdGhwYURDdXRnWHhZblhvc1ROTVRwek1BNk9DRmZFVFV0?=
 =?utf-8?B?eEUrcnhZVVJpeUtBTmtNbHgzM2U5STdmSzRSYzR1QmNNczk5YXN1d2dkU042?=
 =?utf-8?B?V1lrY1lTdCt5QjVKRUpjMWFBeHJGNHdjMlJYVlQzRjN5aFRVV1k2MzFiUHha?=
 =?utf-8?B?bXJCMGNmdzgxR0VWVlIvZTBkYWdoSXY3VlplNkpka2VNc3p5dXNrTnAwWEgv?=
 =?utf-8?B?S2k2YmlMTjZqWE9vczRkR0hXVzlUd2JiOGRNeXpnSVVWRzd6WUNMN09kUStk?=
 =?utf-8?B?cDNzd05CMWZmTVFjUEpzak9tYTNJR0d5VU5DT2Q3ci9CRFdEQnE3aXEvQXN0?=
 =?utf-8?B?QjFBTXluWlF3RUFJeUlmdG1TT3I5SjM4MjArbVhPSHhmdDU4NFZZcnNkOXYv?=
 =?utf-8?B?MVVZRkRxYjl0bURwdFkydEZuWGswNWhUd2VPRSt0MERuNzI5cDNMRUc4YTRi?=
 =?utf-8?B?NjQxeE0wU0hHYU0wVjhGcGlvckovaGRnT1FZSEJUUnAvVWhRaFJlZGpHSXFx?=
 =?utf-8?B?TUpJZ2hRSWp6V0p6cUlJdjBLeTl1YlFRMStlb1hBTTJnaDNaOE9nb1dSd2dL?=
 =?utf-8?B?ZDFFZnplYnI3NW1jSkxzMVBzME5YL25ZNzgramE3QUtnd25pK0pySzVCOVNn?=
 =?utf-8?B?dHJnd2M5Z0FoTzlPUUw4TnNmSSt1N1hrNWJLNXc2M2k5OXQwMEdYWG5MMTRK?=
 =?utf-8?B?V0g1eTNWQ0lLZmV3ampXc2hIcUM1WDQrY29NUlhIRG5EbnpyUFdQN2ZpLzND?=
 =?utf-8?B?bTZsZFE0N1dnaHpyTlhmRG9nb0pHc2t4REp2U044dnNYVEd3cXNSVXYvT0VX?=
 =?utf-8?B?V2V1LytPOEh1cy9BcTMwMmpGa2poU1MxaDl6TlFETGJwUTk4S1ViaTZ6QkpJ?=
 =?utf-8?B?Wm95cEpsYjlEMFpaV2ZsOGpmRlFybjViUGIrRVkzQ3ZXUWtqUTkwa2tYWlYz?=
 =?utf-8?B?bHFLeUpoYkE3eDNvSGdqL0o1U1N1eGlmTW83L0tzcHJFV3ZNNXBrVWNOOW95?=
 =?utf-8?B?M2V6YmNBWlQzZS9NTHpFTmNvcWE1Q01GNm9ZRmR3bjlCSkxHWEwwSTJKZnNB?=
 =?utf-8?B?MjlEak5lRVNPV3hCNnFtTlBnejgzS2o2eGI5ZzdIR1FydjBCb0xJYUl0TXV2?=
 =?utf-8?B?b0RCdWFYaHBucVNCdTJXOXdVTXhQcy84NnJQZTR3dDNLalBPWGRjYnh0UkNJ?=
 =?utf-8?B?WldMNTE3YnE4TGpHelJ5TUtIQlVBa2VRUFltaXV5WWd6bEg2ZUh6bTZpdFZC?=
 =?utf-8?B?RUNYRXZ0Yyt0QklHcDdBQkd0c1pTMjZiN2hSMWZxZXFoMThVL2czS2tNSWNa?=
 =?utf-8?B?UVlFMXROaGkxZjdWQyt4bHlocVArUHdrc2hXZU05ZmhaZGNSeVphdDFxeldM?=
 =?utf-8?B?cStRYkNrWkgwUmpaaURnWjBaUklOT0JEazNuMUtnejJselZmZ1l3OU5hWFNZ?=
 =?utf-8?B?dTNtK3ZJSTRsMExaYVZxbXNPUHNNcWNMbGJ5Qllha25ublV4MEluN0xLS1NR?=
 =?utf-8?B?N28zdUJabUFNeGJQSDU5bC9FN3hJcUczWTVXV2NDTHdNaHM4YXY4YUZJUVNs?=
 =?utf-8?B?c0ovWlBrenVsRk1CNE03MWx6VWovMER2RHFwN3Z0SnpVREZXQzY4RlNBRFVH?=
 =?utf-8?B?cUphb2hDWFhzME8yOUozUkZHcWJJNTgrTkIwR0NmU291bzJPbkpCTVBhSTRu?=
 =?utf-8?B?eTlDNHlFZzBudFpOMFpDQ2xZZEltUWtPYlkySDk3Ui9mYXI0dU9LdTFpU1ZE?=
 =?utf-8?B?REgrWUovM2tFaEZFREkzMUIyTTF1OW5BOExrRjZ1U1A1ZWpNSkY5NFY0UEhI?=
 =?utf-8?B?YVUyZjd2Yk4wWjVKTHR3cnAzOUJDMzVzeVIxbC9HVVJBb1EySXk1Sjhvbk9v?=
 =?utf-8?B?bXltWjMrTE5oWjJKZ3RJd1Mzd0tkaHhLZm5ybWxydUEyQXJEWmRVMTAvdDRz?=
 =?utf-8?B?cG54NjRsbkVkcXJWZ2xLVHFQWmZYZFRidkpqYktzV3YwNlpxdWpLWmxVczZv?=
 =?utf-8?B?aDBERVRtaENkR1BJZUQzMGRnZFRqbFpwSXVRZ0lVUm92dUFST01VSk1Fa01i?=
 =?utf-8?B?Y3NrdDh1MjhaeWFRUlQ3ekRWdXZEMmZLUC9EY2ZBNXFiVjFVZXFRWTdvZVVv?=
 =?utf-8?Q?JS70Ite8uCNSktj3S0XT/IZee8VkETaM5OrLjSyENACin?=
X-MS-Exchange-AntiSpam-MessageData-1: p6wXQDXZlAvo4FfFE8C/sRlQofMNSrKktag=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f71c39c-aa80-4ee2-4847-08de86078368
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 22:33:16.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0KtJVLgUck3Im38belRBgGQN3fi9Er6gHxSpiPnAptixiYhfzl/WgizfZx99nBKoXIWSNers2tc0jp4gs6xyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_153345_997843_86815D5B 
X-CRM114-Status: GOOD (  10.43  )
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
ciA8c2ltb25hQGZmd2xsLmNoPgoKdjMtPnY1OiBub25lCnYyLT52MzogZml4IGNjIGxpc3QKdjEt
PnYyOiBub25lCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tj
aGlwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKaW5kZXggMzU0N2Q5MWIy
NWQzLi5jMGFhYTUxZTAyMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9k
dy1taXBpLWRzaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9w
cmludC5oPgogI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KIAorI2luY2x1
ZGUgIi4uLy4uLy4uL3BoeS9waHktcHJvdmlkZXIuaCIgLyogRklYTUUgKi8KICNpbmNsdWRlICJy
b2NrY2hpcF9kcm1fZHJ2LmgiCiAKICNkZWZpbmUgRFNJX1BIWV9SU1RaCQkJMHhhMAotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
