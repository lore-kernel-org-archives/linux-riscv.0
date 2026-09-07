Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD68C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:CC:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kYizS8znY+uyML0lbeOCoF02p5FJcSnrBm3aebItwY=; b=NTZWFxRKiZPk6l
	5lB2A5TTAUpqdlpQRZq/1CC8yrONFHosZHj8Pc/Ap3kr1d/G4EAMeXoV/VELxfRoj6AltgL5OctVC
	8R+wq3IzRJuRCj/P7mU0Zx8QdZvw+hiXBmt0S9QECR5RgTHW1iZJSKElwNY+7xZmDihC5Ticgluwj
	S+pDkzzD+H97VpMruV7miTaS6QX0oXsD82oBprMq6yFwMCckECcErYoEuWRdUaRMzG47GvM/lRpnn
	ujzx7DiSSubHea46mjX9X2n11sSjqffz7Jw9lBCdtR81YJqllzJNGS3+yutESWn9AYSTa4ELAKU9K
	IOT0BMFrWyHGl220L0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R0O-00000005qmn-3Ki0;
	Mon, 07 Sep 2026 04:30:52 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R0K-00000005qm3-2yEl;
	Mon, 07 Sep 2026 04:30:50 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873iojQ2399040;
	Sun, 6 Sep 2026 23:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WoMXnesFiBhxVVGYGwr881/Ity3rVNq/N5suxTghJ
	jw=; b=OgsdskivdrmfqksJB1HR1BzBfmytTQfbebBRKiVAXFJcivmhH4mec2bJs
	pioUnQAqUnrSeBlPIOeq6skygtKtP3k0hlAh8AD9T+AVB/WR6nLRXs2KbcpUKNsT
	bYVhkh8/3yX18BlYCbUqz+WCogI4zhGMAkGsxR8cuH8cl9R7P0UIiU8hNxczKV+V
	stAdG2ImL2RFmWmHpc6Ko5vCAllPnaa4vzwIKP4GmHo/3iJLRh1ABWzhoS+S2U0N
	Hlt4n63XLlQCTN0P3d5SzvnsNFjFWF2RRTrHubMmVG7nRThAIBg7GpBINjjCn7vD
	CkxvtWjQORHevXeIYNn2CDEPaBbuQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6bmhb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 23:29:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rw9UTiPVylWdnVnXbxiVa4h2j0tBkuXTP5pGDD6eP687k+XwAt/7JtklVQHfPDgv0wRFvtaDOEEnVa0MgCl7m+EFuDUlbq1qhRhinWacIO9922FFDnu5CaR1ze+lZnsjF2FHig/DgufhGuoWq5nHIsMt9+jiLKmpphRQEd3NlrAwomNjE01IT3wjK+Js2u1/oCNn8Q61cF+OwFty+8HqhkUTdMpzL+7782jQcniIN9xKm/n+NUaAeX+qblfvJaoR/HSkZ1v/nvK8Z0/mlk/vqwb5IApmd8WqoTyvEqERG87ehSyB/UNo9aAlMMb0/62dPcITnXjNR6JAGf/BFI0CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoMXnesFiBhxVVGYGwr881/Ity3rVNq/N5suxTghJjw=;
 b=HWqgTQG3XVWEoXjzk0U6pDGSPQVJ/gz+AYigr2hQC8M9QEGp7N9KZMY6Yibh1AyeD8aQNHREhNf9klnRwzrh1+RaTCiemwna2Zqh/cTZdUt/Uss5FFV/4dh5oLpG1ymUsKe6mohm2+SOWess7oT36fWeQi4U9V0kozOOM6KeVgJoeQkN9YpXdEWmc9cYa4mt3DHr0ocN1cUNpo60ETLu4rA4MaQ59sO1jZ/ddn2nJngFHC3PM9W8kqhe2Ezps3xIFCmj/IhFeoTXOqM5pMkjZ4XaDYaE/zs+as+pNpT3Od2uByeLD8lZbzLFMTnHPcU+32iDlGDz2bcOoQrx52pdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoMXnesFiBhxVVGYGwr881/Ity3rVNq/N5suxTghJjw=;
 b=WTntPemqYJvF76CzaL9r+guuy9hj7d5agpe5DkcT8OSKAKIrk6ev85twpO4p8fEYgVHA3k2L1kzNQm1wVxryitvU4m5MtsRXTGCHI4L8qvrmSwPDjAdPuyv593rQCpye9XRkLkWS33p4iQCsOLPW0f8FEKH/+gvV5nh3XPyfDo8=
Received: from BN0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:408:141::22)
 by SA1PR10MB6296.namprd10.prod.outlook.com (2603:10b6:806:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 7 Sep 2026
 04:29:23 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::21) by BN0PR07CA0004.outlook.office365.com
 (2603:10b6:408:141::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 04:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 04:29:22 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:28:48 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:28:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 23:28:48 -0500
Received: from [10.24.68.110] (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6874SYxU781882;
	Sun, 6 Sep 2026 23:28:34 -0500
Message-ID: <f28b21f1-046c-45a7-b542-8398d5e63335@ti.com>
Date: Mon, 7 Sep 2026 10:02:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
        <mailhol@kernel.org>, <msp@baylibre.com>,
        <florian.fainelli@broadcom.com>, <jonas.gorski@gmail.com>,
        <andrew@lunn.ch>, <olteanv@gmail.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <pabeni@redhat.com>, <kurt@linutronix.de>,
        <hauke@hauke-m.de>, <chester.a.unal@arinc9.com>,
        <daniel@makrotopia.org>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <ansuelsmth@gmail.com>,
        <linusw@kernel.org>, <luizluca@gmail.com>, <alvin.sipraga@analog.com>,
        <clement.leger@bootlin.com>, <justin.chen@broadcom.com>,
        <dlan@kernel.org>, <rogerq@kernel.org>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <opendmb@gmail.com>,
        <andrei.botila@oss.nxp.com>, <wangruikang@iscas.ac.cn>,
        <amadeus@jmu.edu.cn>, <kees@kernel.org>, <tmshlvck@gmail.com>,
        <c-vankar@ti.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
        <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
        <v-singh1@ti.com>, <oss@vassilevski.com>, <haokexin@gmail.com>,
        <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
        <lgs201920130244@gmail.com>, <linux-can@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <spacemit@lists.linux.dev>, <linux-omap@vger.kernel.org>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH net-next 00/33] Remove comma after sentinel entries in
 match table
To: Jakub Kicinski <kuba@kernel.org>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904085811.7e2c2db6@kernel.org>
 <cc1f9d12-e853-4000-8236-9e7f5a9ed314@ti.com>
 <20260905110300.2b4825d5@kernel.org>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260905110300.2b4825d5@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SA1PR10MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 243db8a4-64ea-4733-3d5c-08df0c989748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|82310400026|1800799024|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kev/CobYf6esPThUcNkoIJW3MnGLpQ9NfOAi2bAp/v+wr2Dg42v4I1LqaljXShlKDxwmEeIps39cHMB+vprH76Z9jeEn+106d768BzKG+V/oXp8DT/LqSqswiIO48PM5Qtpu8/d3I5fp2PDwZe9rkdfmfQzAVvpgF8Eqwa8X4z/uoBMOladsZdSnVa8JxUOlRNDu3YgiflDqGRaLzXpIlPcOl4epvwdpY3K5nIcYbb3aP+hAQfsGJfaGmUe8JiMjne5evPrupHLNq627nKfZIa7uOrVjLi4dOObLxlBT1VpfAEDI3/RX7mQcNQU9CEHokPAzteN/y7j8sgk14nRQ24fQtRk+WkRKGjfK1s2qEAptNF1mgdRFirxH2XLI+r/rWA8AW1kRG6gEHToI5W/59qWG93okiCyEOJpT3iAyO0+RuE4A67TczxicXG47bwMUm80/DQVktO0wDmIk2KJBwp+XX2E1w5GR/0NOzme98gzDh4PfurnPq8JzUqqxXhuOkkQ6yiAeuM/5ZB/yY6CX9TwmBffwTH282Sj1d9EROLTvlonhWQwTMam/6ZaFenuoAK/dgRuSiuYAmEptsFFy9YoghgiVGyx86Ppm3tSoyuhaKAn9dDWEWetiBda464GhYK+2EUtXzyM4mPEXolieFADOmBzUPqOiFF6/+93AaXDGw5fm9mHAIO7pdqR9orFTdRY8QZSbGSPUr38dkonxpQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(82310400026)(1800799024)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ts7IvxCSY2KxMs5RhbAYYd5+3EiKlUq27xpul/Eq6l2Dvgb7eg67m+Vvae+Jil47YXljUcnDk3ogVeXoVaS9AGjP/kFWuSeaG764Me65hZ7ZSpyMqS0rjxusHgYf2U5D4tcCk8UHsxBHgo4vY22fFm9gkmehgfsey+UQXutndox9XYPkJI2nysMzwUUcoMpxGkXFoiwymjhu8KVQAiLpHhw8Sciyj9flE54B+HMtad/rzLzVAeoy5WegSq6URVQQvyZbp1YIYPXilhuckN0ZxiZ36+y4mRuNu7ekd0g00H3pj+ynhDOBlaivHjJcg3kvW2klUnq3+vfhCAzzhP3YNAJhNGoCyAlUYer5+6LVcQ7G7I6caPCEflzP79EE1jSC2tSmHUSv2dbNHwYRI8jmDcPHUQzHpZIaZINJO7GZXfQOCImONH0+7FIMGBvP9jy/
X-Exchange-RoutingPolicyChecked: x3RycQ3T49l2DDf2z7uxEJNFwrRIOMw2wnFzOGZyNSU3njptWC3bz9mx4gbe4bPqbkqGvGzhXQXR+ILjKXix0LqiiU1jHAxKd5fo7jS/psxi3Kr0+zayaKpzZ8v8URU6Yyz4x/5CnuXcC4GZlZ/Z/bU1KuNA4UrnaDzjynIIBoSIJhsxz9Zb+FAfnd9uUzDgBzQ970oZXi9wSvC73C7MlNenp5Ii0QeKZXFUC25XN84t3slJbZTtZIqc0f3KMafyfM3kBq0KogIHRD5Z4ylvolx4a0pERG3aUAwUSzUiV1uEGcebddR5yter+hjYkod47hSTZglugjoB7XUa/49cEg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 04:29:22.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243db8a4-64ea-4733-3d5c-08df0c989748
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6296
X-Proofpoint-GUID: TcIj0pVKLjqkCcPg5GohwvIHdEwPC0Kd
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9e3da8 cx=c_pps
 a=cX17BFbqy3c2X70AxBoB8A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=3HQJJnglLaSNX05as70A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TcIj0pVKLjqkCcPg5GohwvIHdEwPC0Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NSBTYWx0ZWRfX5pdAEjPz8xi0
 WsWw3vjC2upIKrTndSc2o7BQnaW/LzjBmhUSVqzDgzL85PSJlvlM8BzpXZUq+UWn70rEVdddwvh
 TZK5+NHR1QmsQx8W0vqe+aDLA+G7YgQfRpWaNcFtquNt5INt4f15DF2whwrmbX2mYDGPNRiwOnc
 kleVvYcNU69bc5cJpehoYIOUnX/TeZQBoE11WV9wKqcy0GaF9zSVUGfRpsKDxlpEICdUzFZDjKL
 h6o2rY0CUGCUJcSOnQxWQRx1Qs9uGv9PR6uBMeN5GapB/jDDXgLQkpL3JPDgyOEZVQiQvfRZmZp
 Mf+jwWXFcvyPgm/EqkKKzEsCuNfqpElffXd15XwBr7POTh052ShD/C3w3rat8X1M1hVVKYoYDqS
 c7ijz+CCVHo4IUEVf9Q7ritm7tFA2SgTiO26jlEd01fRwQBCQF4vEbkMQ5HZAMuojYfYicdn+U/
 HNKYqK8CPxWshraaiqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NSBTYWx0ZWRfX8NWGrkFcSxXE
 Fsc9qijGcDDH3GpnYshfu5SOBPhr/6Pdtl1r3StQDdRdKZMoflTUVb20HG0Jbx9G0WciL3ivi2/
 ag33ThHL3XkwSHo55MVi5W4HGvwwtHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_213048_864718_2B42C4BB 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDUvMDkvMjYgMjM6MzMsIEpha3ViIEtpY2luc2tpIHdyb3RlOgo+IE9uIFNhdCwgNSBTZXAg
MjAyNiAxMTowOTo1NCArMDUzMCBTaWRkaGFydGggVmFkYXBhbGxpIHdyb3RlOgo+Pj4gWW91IGZh
aWxlZCB0byBzcGVjaWZ5IHdoeSB0aGlzICJjbGVhbnVwIiBtYWtlcyBhIGRpZmZlcmVuY2UuCj4+
PiBoYXZlIHlvdSBldmVyIHNlZW4gdGhlIHNlbnRpbmVsIG5vdCBiZSB0aGUgbGFzdCBlbnRyeT8K
Pj4KPj4gVGhlICdjbGVhbnVwJyBpbiBhIHdheSAnZ3VhcmFudGVlcycvJ2VuZm9yY2VzJyBzZW50
aW5lbCBiZWluZyB0aGUgbGFzdAo+PiBlbnRyeSwgYnkgY2F0Y2hpbmcgJ2NvcHktcGFzdGUnIGVy
cm9ycyBhdCBjb21waWxlLXRpbWUgcmF0aGVyIHRoYW4gYmVpbmcKPj4gYSBzaWxlbnQgYnVnIHRo
YXQgc2hvd3MgdXAgYXQgcnVudGltZS4gSWYgYSBuZXcgZW50cnkgd2VyZSB0byBiZQo+PiBhY2Np
ZGVudGFsbHkgYWRkZWQgYWZ0ZXIgdGhlIHNlbnRpbmVsIGVudHJ5IGluIHRoZSBjdXJyZW50IGRy
aXZlcnMsIGl0Cj4+IHdpbGwgbm90IGNhdXNlIGFueSBjb21waWxlLXRpbWUgZXJyb3IsIGJ1dCB3
aWxsIGZhaWwgc2lsZW50bHkgYXQKPj4gcnVudGltZS4gVGhpcyBzZXJpZXMgJ2NsZWFucyB1cCcg
dGhlIGRyaXZlcnMgYnkgbWFraW5nIGl0IGEgY29tcGlsZS10aW1lCj4+IGVycm9yIGdvaW5nIGZv
cndhcmQgKGFkZGluZyBhIG5ldyBlbnRyeSBiZWxvdyBzZW50aW5lbCB3aWxsIGNhdXNlIGEKPj4g
YnVpbGQgZXJyb3Igd2l0aCB0aGUgY29tbWEgcmVtb3ZlZCBhZnRlciB0aGUgc2VudGluZWwgZW50
cnkpLiBJIGRvIG5vdAo+PiBkb3VidCB0aGUgcmV2aWV3IHByb2Nlc3Mgb24gdGhlIG1haWxpbmcg
bGlzdHMgd2hlcmUgc3VjaCBlcnJvcnMgd2lsbAo+PiBjZXJ0YWlubHkgYmUgY2F1Z2h0LCBidXQg
aXNuJ3QgaXQgYmV0dGVyIGlmIHRoZXkgYXJlIGNhdWdodCBhdAo+PiBidWlsZC10aW1lIGluc3Rl
YWQsIHRoZXJlYnkgc2F2aW5nIHJldmlld2VycyB0aGUgdHJvdWJsZSBvZiBwb2ludGluZyBvdXQK
Pj4gc3VjaCB0cml2aWFsIG1pc3Rha2VzPwo+IAo+IElzIGl0IHBvbGl0ZSB0byBhbnN3ZXIgYSBx
dWVzdGlvbiB3aXRoIGEgcXVlc3Rpb24/IPCfp5DvuI8KCkkgYXBvbG9naXplIGlmIGl0IGNhbWUg
YWNyb3NzIGFzIGFuIGltcG9saXRlIHJlc3BvbnNlLiBUaGF0IGlzbid0IG15IAppbnRlbnQuIFRo
ZSAncXVlc3Rpb24nIHdhcyBtZWFudCB0byBiZSBtb3JlIG9mIGEgIkl0J3MgYmV0dGVyIHRvIGRv
IHNvLCAKcmlnaHQ/IiBraW5kIG9mICdxdWVzdGlvbicgd2hpY2ggaXMgYWN0dWFsbHkgYSBzdGF0
ZW1lbnQsIGJ1dCBJIHBvc2VkIGl0IGFzIAphIHF1ZXN0aW9uIHRvIG1ha2UgaXQgc291bmQgcG9s
aXRlLiBXcml0aW5nIHRoZSBzYW1lIGFzIGEgc3RhdGVtZW50IG9mIGZhY3QgCmFwcGVhcmVkIHRv
IGJlIGltcG9saXRlIHRvIG1lLCBidXQgSSByZWFsaXplIG5vdyB0aGF0IHBvc2luZyBpdCBhcyBh
IApxdWVzdGlvbiBjb3VsZCBhbHNvIGJlIHRha2VuIGFzIGFuIGltcG9saXRlIHJlc3BvbnNlLgoK
SSBzaG91bGQgaGF2ZSBvbWl0dGVkIHRoZSBjbG9zaW5nIHJlbWFyayBlbnRpcmVseSBhbmQgd2ls
bCBrZWVwIHRoaXMgaW4gCm1pbmQgZHVyaW5nIGZ1dHVyZSBpbnRlcmFjdGlvbnMuCgo+IAo+IFBs
ZWFzZSBiZSBtaW5kZnVsIG9mIG1haW50YWluZXIncyB0aW1lIGdvaW5nIGZvcndhcmQuCj4gCj4+
IFRyYWlsaW5nIGNvbW1hcyBhcmUgYW4gaW5kaWNhdGlvbiBvZiAnc2NvcGUtZm9yLWV4dGVuc2lv
bicgaW4gdGhlCj4+IGZ1dHVyZSwgd2hpY2ggaG9sZHMgdHJ1ZSBmb3IgJ2VudW1zJyBvciBvdGhl
ciBzdHJ1Y3R1cmVzIHdoZXJlIG5ld2VyCj4+IGVudGlyZXMgYXJlIGFkZGVkIHRvd2FyZHMgdGhl
IGVuZCByYXRoZXIgdGhhbiBiZWluZyBpbnNlcnRlZCBpbiB0aGUKPj4gbWlkZGxlLiBTaW5jZSB0
aGF0IGlzbid0IHRoZSBjYXNlIGhlcmUsIHRoaXMgc2VyaWVzIG1ha2VzIGl0IGNsZWFyIGJ5Cj4+
IHJlbW92aW5nIHRoZSB0cmFpbGluZyBjb21tYS4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
