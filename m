Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5747EC83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PVx5KCMQKg5863mpW4BoH/rpkjv0/NgfH2FkpR392AY=; b=sdipdopdPDYRa6AsXglz+RxEg3
	DLuZKNZk6qiFMSUVT75ChBB5ka5RHoyFvhjegwBaja48Az7M/kePUc6+XMpZaQDwOGCUZ//NOGt9H
	VCyvHOl9/2RylGyCO5KpVQLANjZmqbV5DgHvO9vmlZAKI+kARuiY64PawOiNYv5wR0Tf1e5DPLOlQ
	NPJbD5AptxmJIDUUB7c7uhosoQrYpB+q4IE8XjI+O7Y/HysSSb3mnLbtHO2DZdwQbPrmbM5lxW7qL
	pzpJfHJRe8wlK8hOF7zs6bTz3VPuTJeG8yM79KP4Q6mEPoZDWf+QN8YDRepPHo6gVCLSUL3gXCs0j
	f0ueIrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzu-00000006NZK-2fze;
	Tue, 01 Jul 2025 18:46:26 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdeT-000000060B7-0RHG
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:16:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HiwG//WiRRAxc54F89CCsCdk52KIKUSoKpDR3hMF0DK5h1/ykluYsGVDfqNVShDjwtwpE2q3SuTLPw4YEesi5ZMb0zy6VWgeD4WVzjnKQP/xtuHpcWD8TF07a0JLDsSEtnEpsB9K9uNsARuULQbZl/7P06QNb/vlFs5KuqSnfHB2J+lbvipGwEbts2e33a5LYF+mZnp0XG5qEBcTPqV+cuV2R1d0yLTezNbILaC6Mdpt0vlMjii4cNarRwZKw+0xXW2+mEN8Ivps1QzpShGg44eSb3uVYUxpxv0R2g0dkz7bdiRFoBIqDaGfKH8LTk7KhY+YXCEE4q7j4sRL1g6OFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=Dp5qdhm/9+0cjtbhljcfVuUY2QFrVK9x994QOdMDVZ6gnr8PqepPZgHB1wR91xUUHdnCMyhjzoyGGTL5PeUQ57Q+tiSj3eoeL1GI92aIuvcClgqS/BkJPPGaC51v0P1qfqFEfUyyVlErX3MXRANdCYE9XpuPhK9qEsKgmiWsW44o9hIx/AUZzhIzXdGJhbALGI2OaLgVoy3nBuNE6ozgqFsPBeYz96LOojU7JNRg0joyVfsEj5g40hIV/B8u3+adG7cdpcXYcjPkzA1+Mxh/FTRf0SAa5CWaRL34JC7gPzQOo7OmD3L601g/a6Nmok8VH0sUiJdcQHWrSpkg4LXDWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=L76V835oea6Z6xZcYU+n119v4oGOOHtYRz4zkEPiSaGE533WtocXvcNbImk+xPYqsSXcbYb1m31ivLOpvX35dsJQ5llqbaZ7WnrVCIO9KDNLlBrtZzdi82PRCM2undnAl3UmEri+DtdRYEfEFD2LCTQJbL+vGyi3AaaElFgIN3peNTKI1lkZkW1NVem2RZgmlwzK4atRTRYDoSJDQ5FFUsGvcMQWWcM/AvNIabRx2sz6fisuVU2iIyi7WByc3NwIMW4YWfCRZFlTvVBJZso9bNILWCOM1M8WPvyp4Z5tlSB6VRxjxCSZutY7QCk8Rd4lTClXUW9flarmPJ9JHjUmOA==
Received: from AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23)
 by DBAPR03MB6535.eurprd03.prod.outlook.com (2603:10a6:10:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 16:16:05 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::d0) by AM9P195CA0018.outlook.office365.com
 (2603:10a6:20b:21f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 16:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 16:16:04 +0000
Received: from outmta (unknown [192.168.82.134])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id D42FA20083983;
	Tue,  1 Jul 2025 16:16:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (unknown [52.101.65.80])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 7037C20080076;
	Tue,  1 Jul 2025 16:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0RXommwIfJ1eU9vt1pgFcYy+xrp0R7IFerD31iRHjeikyrEsZFwZk1Je0tbMn7pQwRXE9HRJCjbEsmed69a5yCgRjlcZIeQG+Z2d4NXblFKc5Xe+62yAzQesstKqc6AxB0Weshlxe2mT2sG9tKBuDGppR6VduFqbDK76l1LTOIllKfybOzAJDfwPQdlFme5kaQLAZv7RfehprBTc5Tkucja8uJWjC1IHbyAH50XgzhSS0MK0wfOsUXRbXYV7epgh5jMG7YRg+aM1KUgnHwKLydDdx9i2K1vSpRhMMxrzYQkfsiPRXYcptD73AGj5asv8T0TUGuoxVoszrCJ69cTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=wASw0IXGt9bHoDxCRRHX3F4WTYRjnrbZG/HDbLKFoWgPncraPDqS7usnuxKeQL4Gz0bxFhcS6zvPWnXjKTy4PqyKG2CYLCb5aKoLMkQHHSmyd3YtDcKVdSa1LMz/UpGl51Fhh1DIpeUXYGVQRgmm3FxGZLRVRuqyjlj0HErdsyB9D+N8lEXJaAs9Dn+76gxdY1wq0RylW2dnhdYlRoho0KV/cwIPIKcoFgD1s8GuZRzI8/f9GqUC4w8Fpptpm62Uvfg6loHcEeJ5ybf3QlMQA/T92xkxsnK4GyBg3l0JtqIcYcwxLLhuW7PLADbtJHutcnKxvZjYdbQygKOweWJZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=L76V835oea6Z6xZcYU+n119v4oGOOHtYRz4zkEPiSaGE533WtocXvcNbImk+xPYqsSXcbYb1m31ivLOpvX35dsJQ5llqbaZ7WnrVCIO9KDNLlBrtZzdi82PRCM2undnAl3UmEri+DtdRYEfEFD2LCTQJbL+vGyi3AaaElFgIN3peNTKI1lkZkW1NVem2RZgmlwzK4atRTRYDoSJDQ5FFUsGvcMQWWcM/AvNIabRx2sz6fisuVU2iIyi7WByc3NwIMW4YWfCRZFlTvVBJZso9bNILWCOM1M8WPvyp4Z5tlSB6VRxjxCSZutY7QCk8Rd4lTClXUW9flarmPJ9JHjUmOA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by PAWPR03MB9858.eurprd03.prod.outlook.com (2603:10a6:102:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 1 Jul
 2025 16:15:59 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:15:59 +0000
Message-ID: <c0037d24-5e24-4682-bc51-889a854d409e@seco.com>
Date: Tue, 1 Jul 2025 12:15:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/18] net: macb: remove illusion about
 TBQPH/RBQPH being per-queue
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-10-ff8207d0bb77@bootlin.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20250627-macb-v2-10-ff8207d0bb77@bootlin.com>
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR03MB9020:EE_|PAWPR03MB9858:EE_|AMS0EPF000001AF:EE_|DBAPR03MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: a2205764-b992-43dd-5d60-08ddb8ba93e5
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VDcrem9kUDJtRTdtVHpXT0tRbm50WE15K1VJKzJ2UnhwZElidVljc21MMjRl?=
 =?utf-8?B?VGRmMGdCbitGMjNva0NuSTFpU1A0NCtOdUJLYmdXa0ozclp2ck5hMlhtTnE0?=
 =?utf-8?B?akpETmgyY1ZNTjBDbThWYXg2SkdBV0VlM0NaMUdNOVpaRXp6WWpmYXFNRjFQ?=
 =?utf-8?B?bWxueHBJRGlMMk5oSnBEK205YU5Cck82ck53U2I1R2pCdXlhK2NHY2NtYlVT?=
 =?utf-8?B?UUYyMy9ibTIvemJtZmltM05zUUFMc281Nk1TRU45NVNCQnpCVHVXTDhrSDlW?=
 =?utf-8?B?bWNyZlhWTEkvcks1Tnl1TzJHeXJENll2aU5zaWtaNy91dUhNWkFrMmtqaUJN?=
 =?utf-8?B?VEtlaEJrL2hIbEZQUU9LWXUyYXhYQUFjZHV6enhJeUcvVFYxeTBDQnhwemQ0?=
 =?utf-8?B?SEJOMnR4SlNneTRIMmkwR0JoNzVyc0o3RXMycWNWMStCN1BxbGVKUzZYWVZ4?=
 =?utf-8?B?eDRyWFZSR1Fmd2lHL1RhakZiWVBPK0o4bnQ5YXo4NEptdXU3UzkyUmVQZUFQ?=
 =?utf-8?B?dnBMM0tCVW1ySFFWeVhKb0NSd1laaS9zVGNRblRnaVJwOVhiMTRXRlBuejBO?=
 =?utf-8?B?SXNZV1liSElScnpXQnF3UmJkd1ZUL2RxRWVNZDZQZG9OK2NzdEh0NWxkeTY5?=
 =?utf-8?B?ajNZNTU2allqeU5rRFVsUUs4OUJnVFI1K0k4ck5WcXB0bWttMTBIMldEVUJv?=
 =?utf-8?B?dC9mVkpHQmNENnN4L0p3RENIdlVqUGlwN3BHNG52RFh3bytxZ1AzRDVvRmJa?=
 =?utf-8?B?L0kreUFucHBTaloxVEVwakg0aVArZHBSd1FlWkozQ1R6eGlnYXJtd3hBRUtV?=
 =?utf-8?B?OHd4ZE1MbCswVTM5bHNZM0RSWHY0ZG54RmxPK3piZzVuNlNRcEJVZ2ltS1lF?=
 =?utf-8?B?d054aVpCemZ3TWJ4TEZHUFYvRmxsL0FHaEYwV3BDZ3dJV3JoaG4zOXBJR1p6?=
 =?utf-8?B?bUkxR2MzVzUrR3BKc3dZaDRkWFRDUkp6YWdmbE1OcnJFZjlEaWRaaDVrK1hF?=
 =?utf-8?B?elVON1BvbUZNbkpCV0lqSUFrREdJb1cvZ2RXRGIwTk96NUtFQ0htdjhWenZ0?=
 =?utf-8?B?NFhpVUZGZWtDZmIvMGlhbTcwTjA4elBLYVdlNkx6cjlnc3RiZ2k5TkNPME4w?=
 =?utf-8?B?VjM1YjlZbUNoZnpEYnllTDQySXhrSGJocmt1cWk1UHNWRXR6cFlLU1ZPekFu?=
 =?utf-8?B?VFlLd1JLa1h6UkMzYmxHWFA4K2E3bHhpdE4vUzE5Ny9jOHhkZDV3R2NQSFV2?=
 =?utf-8?B?MWhGS3FrbTEvb0FiWjI1Wi9UMlUrQ1VwNkRuSCszVjQxOWJzVUk1UzRJbzJT?=
 =?utf-8?B?V2lYRHZZeDBEK0pEdGo3OCtzLzM0NlRVUTVVUXQwNkZoWjg5VlpMZENxZi8z?=
 =?utf-8?B?TWdsWHV6KzRhaVM4VzB1NUtRNTU2b2RTRzZjKzNIMTFXWTF2T2hWN1Rkblpi?=
 =?utf-8?B?dTAyZjQrWXRnOE00Zm9YdlhzeWswNlo4dWIrbTZ2VUhyc2pDblJ2d3llQUU2?=
 =?utf-8?B?Y01zeVZSOFBYZWs4MlpXa1EraUN6ekpuUURPcGZqa0E2VlRmakRDcE1uWldv?=
 =?utf-8?B?clBEZ0FZdUZQQnpFYnpTQ3ZVaytIMTg3QjFveTVMcjhDVVVPQlk4TmUvWkJs?=
 =?utf-8?B?dW9QdlVzVC9jam9XZHFQZDE2K2kxQm84THNYZ1N2b2d1UEgvaGNOYjBRdnJz?=
 =?utf-8?B?YXoyTW0rSGI4VC80alBwd3JyR1pPN3VZdnF2Y1JhZFFNQ1dRcHp6alVwVVRs?=
 =?utf-8?B?UDhpWU9OTGEwYm1Pdnh1Slk0VnNJSExpcXNHTEhvOWlvYVh3TW83TmFaVGlH?=
 =?utf-8?B?aEJuT1Nwbi9mUmxPMEFFekVvdW5iZDJqZHNJdFdGWU5YV3VQd0pNRjkrR1Jk?=
 =?utf-8?B?N29SM0JtWVRaMFZvRWlkV1N0cW1UN2lPaDliOFZVaUpYL2FiTmJEWDlsMXNC?=
 =?utf-8?B?SmdUZ1pXN3FJUFFnYUNyWHlIUXNvSDh4M0dsWGR2NTM0cWJkOGg1dk8ySGpQ?=
 =?utf-8?B?eU1zaE1oNkNBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9858
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 989aa8ce-a947-452c-b560-08ddb8ba9109
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|7416014|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDF0NEtwbXFFTHk4eHZXWXNxTG0rdXV4a29lTjRHeUdmRkdHNnZYOGtndmNy?=
 =?utf-8?B?VVBsbXVVbFpnUXMzWWxFY0VvdzdGcDBXanZtci9XaEN4aUNXOExyWlI0Vk5M?=
 =?utf-8?B?S3llWFlWY3UxV1M3clNIVHB3RGNYWXZOMHRBdmc1VXh4Ky9OdjNxWmo5c0lW?=
 =?utf-8?B?LzhDZUpORGxjMEZSVlY5ejRzWkZJQlowTG56ZW92ZmhPaWgwRGI3bnB3ZlRu?=
 =?utf-8?B?dHgwcGo5V2VPMU5ERUFFUmIremxpemIrVk1LcWxZa21sWkMwdXpWZ2RZczZx?=
 =?utf-8?B?aElxdmlDSS9Rc2RySDFHUlA3aHc1aHFLbStONmZiUjR3SkIxcGhmL1BZL0Zo?=
 =?utf-8?B?YktOSDVXNXRtSGU3eTdFaC91Zy9qSlVVcmhjU1B3T0pIb1dCY3gxNnUrZmRR?=
 =?utf-8?B?QnRRd0puaXZzT2lSbjljbVY4SzhMbGdRT1dycmNsZFNnVXdJVS9hQVI2TE93?=
 =?utf-8?B?VjM0NDMyL0Y0QUt5cTNETHVoWHNDbk91OHY3b1hub3dpQndGakpvK2l1bC9Q?=
 =?utf-8?B?UnBvdytLaWVubzA3UkVmampOVmdGb0x2d0NGSXhsYy8rOTVDeTl5TmVWb3pU?=
 =?utf-8?B?alRoSGdMYWxyMEFweUZKQndJNk80UzRTTDNLYmRIUFRmR25Ec1pSRXNpMUdL?=
 =?utf-8?B?YzdkQ0tUZVFJWHpPSnBaV3drVmpqcW1hWURKU1lUemVOZE1MQmpyWnRleSta?=
 =?utf-8?B?dXhGMlh1cVNMRlFqYTZaWGJsUE5TV0RESFNwWjVLTExGKzZHTWxVamJLYWxU?=
 =?utf-8?B?VXI1WlFCZXZyTmIwMlU3V3pEQk9xbmlMeHhMemg4TUtLSnVmY0dOSXk5ZUlS?=
 =?utf-8?B?bWVRaEhwN0RvNE1leFNReTZpa3lPdlY4bUROMWVrN2trYWZ2bUZVWnZyOTd1?=
 =?utf-8?B?ZmphdG9JUkV5cEtmUzZBOUttQ2JuN2RGRXJKVndoV0MwUy9zaEJYMVVoWFFC?=
 =?utf-8?B?cXNhc1k1RFVvRkxwTnA4b09DQTNLbnRidEJsL2NGaUhnT1ppaURrbWpjZTNY?=
 =?utf-8?B?ZUpGeFZUMmZxNWtwWjNWM0dFeStZdWxjKzU4U3pOMmoxQzNyaWIwQ0pIbFhP?=
 =?utf-8?B?ZFFTTUZVMFRIaXp6aHVMdjI3RWxPVUNVS3JQbGk0WmpTUkgwZnVYSkdqZmFu?=
 =?utf-8?B?dzYwUHFlakk5YVpSRldQNEk5S0U3dGpMSitibDY4WXFTOGh5alRNckJQYnJP?=
 =?utf-8?B?aHFNOCtzcmx1MEpLdkRRSk4vN09JaGd3ek5lb1BGWURKVXc4Tmw4TVAyMTds?=
 =?utf-8?B?TldqWExhQThoRTdtRWxCOFlqb0ZXSVB4NE5SdmtUdW5tN2RkTmxKRkVMWG9Y?=
 =?utf-8?B?MU1OeWQ5Nlpwc0tUVmc1eE9rVCt2OERvN1dPMGxCN2t4Nk42eFByN1p5QkRF?=
 =?utf-8?B?cm81ckp6Q0dtYXk3Z2k3V3BieS9vUU5VT0NheXFiZU1UWDlnUG5UaWhwcnVn?=
 =?utf-8?B?dzFFbkVLSms0ZUtoRHhjcUVmZWR4cVV3akRJbFhWRm1OeGRkQmRCSjdGOHUx?=
 =?utf-8?B?SkdWRWxvWTR5bCtpOWo4dHdvZE5PRW45LzFjSkF1K3ozWnkzMDB6dGFCTzl0?=
 =?utf-8?B?dVlOaXNZa2sxVmp0Nm1BRWZuUmIzYXh4R2F0YzVBb2YvTFRxYVB3Ri9zWjRo?=
 =?utf-8?B?QnlhNjZRNGVzWVNHcFM5MmZLNi9QOEZadXkyQmVIeVpkenRadWdZVjJEeVlh?=
 =?utf-8?B?TmRCeDNIaVlvWVkyYzFZQmV6SVBoMmkyTk5pZnM3WG82NTZKd0VaeDFHeUhQ?=
 =?utf-8?B?VGF5MmJISk9UQmRtRkQ2Qll5bWIzMnVHeXNtcmM5M2JmY3htMzlXN2tRNkc0?=
 =?utf-8?B?bXExa1JPOS9XOUxJekxoQVcxYkhFb3VHTlZHb3huN3BOeE9XMWNmK2FySURV?=
 =?utf-8?B?L0dUWXBKUWlQZU8zVjlLV2RyZXhZVk51RlJSQ0J6MHdnMTFNcC83NGx6Z2p3?=
 =?utf-8?B?bThPSUZYTVFla012RWJoWmNWMjdoc0FBZXNXeTJJbERQRlZWbFJwK3VDU1Zu?=
 =?utf-8?B?ZXdzSjJlVmRmVzhDQVZvYkg0aWJjWXF3OUZkNVJZbm1RRzVVVURFR0hxVWtG?=
 =?utf-8?B?bU8yaTljVnpKLzAyZE4vZldUcG0xRzd1L2dhUT09?=
X-Forefront-Antispam-Report: CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(7416014)(36860700013)(35042699022)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:16:04.0957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2205764-b992-43dd-5d60-08ddb8ba93e5
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_091609_289850_C58865DE 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message.
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IFRoZSBNQUNCIGRyaXZlciBh
Y3RzIGFzIGlmIFRCUVBIL1JCUVBIIGFyZSBjb25maWd1cmFibGUgb24gYSBwZXIgcXVldWUKPiBi
YXNpczsgdGhpcyBpcyBhIGxpZS4gQSBzaW5nbGUgcmVnaXN0ZXIgY29uZmlndXJlcyB0aGUgdXBw
ZXIgMzIgYml0cyBvZgo+IGVhY2ggRE1BIGRlc2NyaXB0b3IgYnVmZmVycyBmb3IgYWxsIHF1ZXVl
cy4KPiAKPiBDb25jcmV0ZSBhY3Rpb25zOgo+IAo+ICAtIERyb3AgR0VNX1RCUVBIL0dFTV9SQlFQ
SCBtYWNyb3Mgd2hpY2ggaGF2ZSBhIHF1ZXVlIGluZGV4IGFyZ3VtZW50Lgo+ICAgIE9ubHkgdXNl
IE1BQ0JfVEJRUEgvTUFDQl9SQlFQSCBjb25zdGFudHMuCj4gCj4gIC0gRHJvcCBzdHJ1Y3QgbWFj
Yl9xdWV1ZS0+VEJRUEgvUkJRUEggZmllbGRzLgo+IAo+ICAtIEluIG1hY2JfaW5pdF9idWZmZXJz
KCk6IGRvIGEgc2luZ2xlIHdyaXRlIHRvIFRCUVBIIGFuZCBSQlFQSCBmb3IgYWxsCj4gICAgcXVl
dWVzIGluc3RlYWQgb2YgYSB3cml0ZSBwZXIgcXVldWUuCj4gCj4gIC0gSW4gbWFjYl90eF9lcnJv
cl90YXNrKCk6IGRyb3AgdGhlIHdyaXRlIHRvIFRCUVBILgo+IAo+ICAtIEluIG1hY2JfYWxsb2Nf
Y29uc2lzdGVudCgpOiBpZiBhbGxvY2F0aW9ucyBnaXZlIGRpZmZlcmVudCB1cHBlcgo+ICAgIDMy
LWJpdHMsIGZhaWwuIFByZXZpb3VzbHksIGl0IHdvdWxkIGhhdmUgbGVhZCB0byBzaWxlbnQgbWVt
b3J5Cj4gICAgY29ycnVwdGlvbiBhcyBxdWV1ZXMgd291bGQgaGF2ZSB1c2VkIHRoZSB1cHBlciAz
MiBiaXRzIG9mIHRoZSBhbGxvYwo+ICAgIGZyb20gcXVldWUgMCBhbmQgdGhlaXIgb3duIGxvdyAz
MiBiaXRzLgoKV2hpbGUgYmV0dGVyIHRoYW4gc2lsZW50IG1lbW9yeSBjb3JydXB0aW9uLCB0aGlz
IGlzIG5vdCBhIGdvb2Qgc29sdXRpb24Kc2luY2UgYnJpbmdpbmcgdGhlIG5ldGRldiB1cCB3aWxs
IG5vdyByYW5kb21seSBmYWlsLiBDYW4gd2UgYWxsb2NhdGUgdGhlCnJpbmdzIGluIG9uZSBjb250
aWd1b3VzIGNodW5rIGluc3RlYWQ/Cgo+ICAtIEluIG1hY2Jfc3VzcGVuZCgpOiBpZiB3ZSB1c2Ug
dGhlIHRpZSBvZmYgZGVzY3JpcHRvciBmb3Igc3VzcGVuZCwgZG8KPiAgICB0aGUgd3JpdGUgb25j
ZSBmb3IgYWxsIHF1ZXVlcyBpbnN0ZWFkIG9mIG9uY2UgcGVyIHF1ZXVlLgo+IAo+IEZpeGVzOiBm
ZmY4MDE5YTA4YjYgKCJuZXQ6IG1hY2I6IEFkZCA2NCBiaXQgYWRkcmVzc2luZyBzdXBwb3J0IGZv
ciBHRU0iKQo+IEZpeGVzOiBhZTFmMmE1NmQyNzMgKCJuZXQ6IG1hY2I6IEFkZGVkIHN1cHBvcnQg
Zm9yIG1hbnkgUlggcXVldWVzIikKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8u
bGVicnVuQGJvb3RsaW4uY29tPgoKQXMgdGhpcyBpcyBhIGJ1Z2ZpeCwgY2FuIHlvdSBtb3ZlIGl0
IGJlZm9yZSB5b3VyIGNsZWFudXAgcGF0Y2hlcz8gVGhpcwp3aWxsIG1ha2UgaXQgZWFzaWVyIHRv
IGJhY2twb3J0IHRvIHN0YWJsZSBrZXJuZWxzLgoKPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvY2FkZW5jZS9tYWNiLmggICAgICB8ICA0IC0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
Y2FkZW5jZS9tYWNiX21haW4uYyB8IDM2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKPiBpbmRleCA3MDdiMzI4NmE2Yjg0MDhh
M2JjNGJiYmNiMTMzNWFlOGMzY2Q5NWFkLi5hZGM3MGI2ZWZkNTJiMGIxMWU0MzZjMmM5NWJiNTEw
OGM0MGYzNDkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFj
Yi5oCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKPiBAQCAtMjA5
LDEwICsyMDksOCBAQAo+ICAKPiAgI2RlZmluZSBHRU1fSVNSKGh3X3EpCQkoMHgwNDAwICsgKCho
d19xKSA8PCAyKSkKPiAgI2RlZmluZSBHRU1fVEJRUChod19xKQkJKDB4MDQ0MCArICgoaHdfcSkg
PDwgMikpCj4gLSNkZWZpbmUgR0VNX1RCUVBIKGh3X3EpCQkoMHgwNEM4KQo+ICAjZGVmaW5lIEdF
TV9SQlFQKGh3X3EpCQkoMHgwNDgwICsgKChod19xKSA8PCAyKSkKPiAgI2RlZmluZSBHRU1fUkJR
Uyhod19xKQkJKDB4MDRBMCArICgoaHdfcSkgPDwgMikpCj4gLSNkZWZpbmUgR0VNX1JCUVBIKGh3
X3EpCQkoMHgwNEQ0KQo+ICAjZGVmaW5lIEdFTV9JRVIoaHdfcSkJCSgweDA2MDAgKyAoKGh3X3Ep
IDw8IDIpKQo+ICAjZGVmaW5lIEdFTV9JRFIoaHdfcSkJCSgweDA2MjAgKyAoKGh3X3EpIDw8IDIp
KQo+ICAjZGVmaW5lIEdFTV9JTVIoaHdfcSkJCSgweDA2NDAgKyAoKGh3X3EpIDw8IDIpKQo+IEBA
IC0xMjA4LDEwICsxMjA2LDggQEAgc3RydWN0IG1hY2JfcXVldWUgewo+ICAJdW5zaWduZWQgaW50
CQlJRFI7Cj4gIAl1bnNpZ25lZCBpbnQJCUlNUjsKPiAgCXVuc2lnbmVkIGludAkJVEJRUDsKPiAt
CXVuc2lnbmVkIGludAkJVEJRUEg7Cj4gIAl1bnNpZ25lZCBpbnQJCVJCUVM7Cj4gIAl1bnNpZ25l
ZCBpbnQJCVJCUVA7Cj4gLQl1bnNpZ25lZCBpbnQJCVJCUVBIOwo+ICAKPiAgCS8qIExvY2sgdG8g
cHJvdGVjdCB0eF9oZWFkIGFuZCB0eF90YWlsICovCj4gIAlzcGlubG9ja190CQl0eF9wdHJfbG9j
azsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBpbmRleCBhNjYz
M2UwNzY2NDQwODljNzk2NDUzZjg1NmE3NjYyOTliYWUyZWM2Li5kM2IzNjM1OTk4Y2FkMDk1MjQ2
ZWRmOGE3NWZhZWJiY2Y3MTE1MzU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYl9tYWluLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2JfbWFpbi5jCj4gQEAgLTQ4MiwxNSArNDgyLDE1IEBAIHN0YXRpYyB2b2lkIG1hY2JfaW5p
dF9idWZmZXJzKHN0cnVjdCBtYWNiICpicCkKPiAgCXN0cnVjdCBtYWNiX3F1ZXVlICpxdWV1ZTsK
PiAgCXVuc2lnbmVkIGludCBxOwo+ICAKPiArCWlmIChtYWNiX2RtYV9pc182NGIoYnApKSB7Cj4g
KwkJLyogU2luZ2xlIHJlZ2lzdGVyIGZvciBhbGwgcXVldWVzJyBoaWdoIDMyIGJpdHMuICovCj4g
KwkJbWFjYl93cml0ZWwoYnAsIFJCUVBILCB1cHBlcl8zMl9iaXRzKGJwLT5xdWV1ZXMtPnJ4X3Jp
bmdfZG1hKSk7Cj4gKwkJbWFjYl93cml0ZWwoYnAsIFRCUVBILCB1cHBlcl8zMl9iaXRzKGJwLT5x
dWV1ZXMtPnR4X3JpbmdfZG1hKSk7Cj4gKwl9Cj4gKwo+ICAJZm9yIChxID0gMCwgcXVldWUgPSBi
cC0+cXVldWVzOyBxIDwgYnAtPm51bV9xdWV1ZXM7ICsrcSwgKytxdWV1ZSkgewo+ICAJCXF1ZXVl
X3dyaXRlbChxdWV1ZSwgUkJRUCwgbG93ZXJfMzJfYml0cyhxdWV1ZS0+cnhfcmluZ19kbWEpKTsK
PiAtCQlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkKPiAtCQkJcXVldWVfd3JpdGVsKHF1ZXVlLCBS
QlFQSCwKPiAtCQkJCSAgICAgdXBwZXJfMzJfYml0cyhxdWV1ZS0+cnhfcmluZ19kbWEpKTsKPiAg
CQlxdWV1ZV93cml0ZWwocXVldWUsIFRCUVAsIGxvd2VyXzMyX2JpdHMocXVldWUtPnR4X3Jpbmdf
ZG1hKSk7Cj4gLQkJaWYgKG1hY2JfZG1hX2lzXzY0YihicCkpCj4gLQkJCXF1ZXVlX3dyaXRlbChx
dWV1ZSwgVEJRUEgsCj4gLQkJCQkgICAgIHVwcGVyXzMyX2JpdHMocXVldWUtPnR4X3JpbmdfZG1h
KSk7Cj4gIAl9Cj4gIH0KPiAgCj4gQEAgLTExNDUsOCArMTE0NSw2IEBAIHN0YXRpYyB2b2lkIG1h
Y2JfdHhfZXJyb3JfdGFzayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAo+ICAJLyogUmVp
bml0aWFsaXplIHRoZSBUWCBkZXNjIHF1ZXVlICovCj4gIAlxdWV1ZV93cml0ZWwocXVldWUsIFRC
UVAsIGxvd2VyXzMyX2JpdHMocXVldWUtPnR4X3JpbmdfZG1hKSk7Cj4gLQlpZiAobWFjYl9kbWFf
aXNfNjRiKGJwKSkKPiAtCQlxdWV1ZV93cml0ZWwocXVldWUsIFRCUVBILCB1cHBlcl8zMl9iaXRz
KHF1ZXVlLT50eF9yaW5nX2RtYSkpOwo+ICAJLyogTWFrZSBUWCByaW5nIHJlZmxlY3Qgc3RhdGUg
b2YgaGFyZHdhcmUgKi8KPiAgCXF1ZXVlLT50eF9oZWFkID0gMDsKPiAgCXF1ZXVlLT50eF90YWls
ID0gMDsKPiBAQCAtMjUyNCw3ICsyNTIyLDggQEAgc3RhdGljIGludCBtYWNiX2FsbG9jX2NvbnNp
c3RlbnQoc3RydWN0IG1hY2IgKmJwKQo+ICAJCXF1ZXVlLT50eF9yaW5nID0gZG1hX2FsbG9jX2Nv
aGVyZW50KCZicC0+cGRldi0+ZGV2LCBzaXplLAo+ICAJCQkJCQkgICAgJnF1ZXVlLT50eF9yaW5n
X2RtYSwKPiAgCQkJCQkJICAgIEdGUF9LRVJORUwpOwo+IC0JCWlmICghcXVldWUtPnR4X3Jpbmcp
Cj4gKwkJaWYgKCFxdWV1ZS0+dHhfcmluZyB8fAo+ICsJCSAgICB1cHBlcl8zMl9iaXRzKHF1ZXVl
LT50eF9yaW5nX2RtYSkgIT0gdXBwZXJfMzJfYml0cyhicC0+cXVldWVzLT50eF9yaW5nX2RtYSkp
Cj4gIAkJCWdvdG8gb3V0X2VycjsKPiAgCQluZXRkZXZfZGJnKGJwLT5kZXYsCj4gIAkJCSAgICJB
bGxvY2F0ZWQgVFggcmluZyBmb3IgcXVldWUgJXUgb2YgJWQgYnl0ZXMgYXQgJTA4bHggKG1hcHBl
ZCAlcClcbiIsCj4gQEAgLTI1MzksNyArMjUzOCw4IEBAIHN0YXRpYyBpbnQgbWFjYl9hbGxvY19j
b25zaXN0ZW50KHN0cnVjdCBtYWNiICpicCkKPiAgCQlzaXplID0gUlhfUklOR19CWVRFUyhicCkg
KyBicC0+cnhfYmRfcmRfcHJlZmV0Y2g7Cj4gIAkJcXVldWUtPnJ4X3JpbmcgPSBkbWFfYWxsb2Nf
Y29oZXJlbnQoJmJwLT5wZGV2LT5kZXYsIHNpemUsCj4gIAkJCQkJCSAmcXVldWUtPnJ4X3Jpbmdf
ZG1hLCBHRlBfS0VSTkVMKTsKPiAtCQlpZiAoIXF1ZXVlLT5yeF9yaW5nKQo+ICsJCWlmICghcXVl
dWUtPnJ4X3JpbmcgfHwKPiArCQkgICAgdXBwZXJfMzJfYml0cyhxdWV1ZS0+cnhfcmluZ19kbWEp
ICE9IHVwcGVyXzMyX2JpdHMoYnAtPnF1ZXVlcy0+cnhfcmluZ19kbWEpKQoKQ2FuIHlvdSB3cml0
ZSB0aGlzIGFzIGJwLT5xdWV1ZXNbMF0ucnhfcmluZ19kbWEgZm9yIGNsYXJpdHk/Cgo+ICAJCQln
b3RvIG91dF9lcnI7Cj4gIAkJbmV0ZGV2X2RiZyhicC0+ZGV2LAo+ICAJCQkgICAiQWxsb2NhdGVk
IFJYIHJpbmcgb2YgJWQgYnl0ZXMgYXQgJTA4bHggKG1hcHBlZCAlcClcbiIsCj4gQEAgLTQyNjks
MTAgKzQyNjksNiBAQCBzdGF0aWMgaW50IG1hY2JfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAJCQlxdWV1ZS0+VEJRUCA9IEdFTV9UQlFQKGh3X3EgLSAxKTsKPiAgCQkJcXVl
dWUtPlJCUVAgPSBHRU1fUkJRUChod19xIC0gMSk7Cj4gIAkJCXF1ZXVlLT5SQlFTID0gR0VNX1JC
UVMoaHdfcSAtIDEpOwo+IC0JCQlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkgewo+IC0JCQkJcXVl
dWUtPlRCUVBIID0gR0VNX1RCUVBIKGh3X3EgLSAxKTsKPiAtCQkJCXF1ZXVlLT5SQlFQSCA9IEdF
TV9SQlFQSChod19xIC0gMSk7Cj4gLQkJCX0KPiAgCQl9IGVsc2Ugewo+ICAJCQkvKiBxdWV1ZTAg
dXNlcyBsZWdhY3kgcmVnaXN0ZXJzICovCj4gIAkJCXF1ZXVlLT5JU1IgID0gTUFDQl9JU1I7Cj4g
QEAgLTQyODEsMTAgKzQyNzcsNiBAQCBzdGF0aWMgaW50IG1hY2JfaW5pdChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAJCQlxdWV1ZS0+SU1SICA9IE1BQ0JfSU1SOwo+ICAJCQlxdWV1
ZS0+VEJRUCA9IE1BQ0JfVEJRUDsKPiAgCQkJcXVldWUtPlJCUVAgPSBNQUNCX1JCUVA7Cj4gLQkJ
CWlmIChtYWNiX2RtYV9pc182NGIoYnApKSB7Cj4gLQkJCQlxdWV1ZS0+VEJRUEggPSBNQUNCX1RC
UVBIOwo+IC0JCQkJcXVldWUtPlJCUVBIID0gTUFDQl9SQlFQSDsKPiAtCQkJfQo+ICAJCX0KPiAg
Cj4gIAkJLyogZ2V0IGlycTogaGVyZSB3ZSB1c2UgdGhlIGxpbnV4IHF1ZXVlIGluZGV4LCBub3Qg
dGhlIGhhcmR3YXJlCj4gQEAgLTU0MDEsNiArNTM5MywxMCBAQCBzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIG1hY2Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAkJICovCj4gIAkJdG1w
ID0gbWFjYl9yZWFkbChicCwgTkNSKTsKPiAgCQltYWNiX3dyaXRlbChicCwgTkNSLCB0bXAgJiB+
KE1BQ0JfQklUKFRFKSB8IE1BQ0JfQklUKFJFKSkpOwo+ICsjaWZkZWYgQ09ORklHX0FSQ0hfRE1B
X0FERFJfVF82NEJJVAo+ICsJCWlmICghKGJwLT5jYXBzICYgTUFDQl9DQVBTX1FVRVVFX0RJU0FC
TEUpKQo+ICsJCQltYWNiX3dyaXRlbChicCwgUkJRUEgsIHVwcGVyXzMyX2JpdHMoYnAtPnJ4X3Jp
bmdfdGllb2ZmX2RtYSkpOwo+ICsjZW5kaWYKPiAgCQlmb3IgKHEgPSAwLCBxdWV1ZSA9IGJwLT5x
dWV1ZXM7IHEgPCBicC0+bnVtX3F1ZXVlczsKPiAgCQkgICAgICsrcSwgKytxdWV1ZSkgewo+ICAJ
CQkvKiBEaXNhYmxlIFJYIHF1ZXVlcyAqLwo+IEBAIC01NDEwLDEwICs1NDA2LDYgQEAgc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBtYWNiX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJ
CQkJLyogVGllIG9mZiBSWCBxdWV1ZXMgKi8KPiAgCQkJCXF1ZXVlX3dyaXRlbChxdWV1ZSwgUkJR
UCwKPiAgCQkJCQkgICAgIGxvd2VyXzMyX2JpdHMoYnAtPnJ4X3JpbmdfdGllb2ZmX2RtYSkpOwo+
IC0jaWZkZWYgQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVAo+IC0JCQkJcXVldWVfd3JpdGVs
KHF1ZXVlLCBSQlFQSCwKPiAtCQkJCQkgICAgIHVwcGVyXzMyX2JpdHMoYnAtPnJ4X3JpbmdfdGll
b2ZmX2RtYSkpOwo+IC0jZW5kaWYKPiAgCQkJfQo+ICAJCQkvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1
cHRzICovCj4gIAkJCXF1ZXVlX3dyaXRlbChxdWV1ZSwgSURSLCAtMSk7Cj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
