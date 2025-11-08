Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F778CCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AknDBQkKWfTpjhiY5zmO8IsEr90wes6S7bGTSUikpHs=; b=UxtfTRe8c34EEv+aDsHV2NHzJC
	ZdZrlgmcCmFXzOSu2mKyhTWSTh7RWiPQDCrqrS+mf8cx+VhF8NvGADUNESNQtXYVrODO95W/s6sb0
	CsquBIXo3RRnsaLJliJrmaY1eAfvZ/eHXfhzeTgGjV3sVLFzW4WCKOpuNSFQJO8oProRHBVRt2dtI
	uqXjpS/ZjipYW6dUvBd+mxX3UG2GG1QjJFxluhVl1cyKP589cxxxl9Wr1K35l6eD1/KyOt7kS98T6
	LoKb//znwQPkmShXhK3tUcAFybKXVus2M6Dw/P/ScOwPf7tYUjCtZJwjhz8kxB0EjEmLlVVSLtCgH
	4HMApBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmCT-00000003ISI-2Bcv;
	Sat, 08 Nov 2025 16:54:05 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmCP-00000003IRT-0s0C;
	Sat, 08 Nov 2025 16:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiNw0OHUDx8LmVDGGU56yHkHkwE2gdrjdn9TJIWnN6nORuj//HGcbSkalK+hK1aY7q91l70lTxqmhZfeZFspUJP/YaKZCsA/KOEAvTlxGer69dqUZQcpor533Yut8mhWrSVV8J4RT3RQTueb2VoayOwxLdRsIWAFMMGUDrYLCZPkwQDKqyUeTJY+bQRMu2v6nt03iaCGfyCYGkI0cDZRZWEQtMvanDnGLG1OEHzKHHvXbkNTO4W1S0sm4wrxlQ1U+oxG+BIuy2Gz58EOY449uVSnjemLmUzBIAoODWQ6toaq8rODISZTdLnWpZR3CLZvPkq+Y0/k1NItyzZHUdRgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXmKLlrPXXAjRcz26NAezpUlMFhqM0e9L1ZGBb6T6sY=;
 b=IGQkBEeJJpbH8V3RrAcKcX8gdAytDSiNejTbCVWTkp7Wp202UqoT3ah0VPW4PdNzPAtniHazI0gUj7IUVOoWD5A/zwGgwW0pJZ+eNrLEwFLAU9aW9usRMicZoX/brqetgm2hdckNr+VUTZYdVVgzFvwaYtVirAhIN19oX2uaLCH6ApFwTNRe3u4oshcu6Zv7xnu/FWTeaXvl7VGIa/xUQSFCDr9+TnzkpNDnXxmDeANJjKhUHIzei9lEBOlSwjWlG+Z20Lm9ygIGBpu70D+hkqokxm4zrhZXznW1CAjqv8SP2mF0HptDYSNGVGT3gv2GvVjFIiQa6BczADKGzHA31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by KUXPR06MB7997.apcprd06.prod.outlook.com (2603:1096:d10:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 16:53:51 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9275.013; Sat, 8 Nov 2025
 16:53:48 +0000
Message-ID: <9e8784a2-7ab7-4b68-b928-b4f9e0e224c0@linumiz.com>
Date: Sat, 8 Nov 2025 17:53:27 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Paul Kocialkowski <paulk@sys-base.io>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
X-ClientProxiedBy: BM1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::30) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|KUXPR06MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: bfed7b80-69bc-497b-4e69-08de1ee7631e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVJwTnhROHBDTGMxbUVZTXJCUGNGUU9sOG0zUzJaK2tJZFM3OXpORThBSklW?=
 =?utf-8?B?aWFSVHZieW00ck41ajNRUXN6TTdOK3RDUTN4TlorMVJBbTF5OTlaS0lBZU5l?=
 =?utf-8?B?K05CT3hxdWpqeWlySTN3TDZXWXFLcWlQeW1uUEFmeDZseVNIL1lkbkxZaG1w?=
 =?utf-8?B?eWtjMTFVcEs3RVZ3K3QybUZFcS9HOVFFMHdTMkFGTjVnVmdOWG10U1dmeDNj?=
 =?utf-8?B?bmM1VjM5U0NUYWdpeVoreXNxVlU1UlFOOHdJbjczaFRCSkFqTmQ2dVB6R0JN?=
 =?utf-8?B?a09kakREWEE3dlpIVFpnM2pjbmh5eSt6QnRybDRGcCtoejBzdzU0RUh2b0h4?=
 =?utf-8?B?WS9wMDdRTk1VQjhZaTFmT2M0bGpxYk9uKzlXQmpka2VtZWdONlVCRWlpMitZ?=
 =?utf-8?B?dm1GVEY3dkppWUY3a1ZRQTcvUGFDZk9PaTB5SUlUQjdIZEl3cVpXdW9kS2Zw?=
 =?utf-8?B?ankxbG4wM00wNkFKcXNkdG1UaGVzaUE1Tld0ekd5MVRCL2Zlay9hY014M1o2?=
 =?utf-8?B?QlN5NEJ5cTR6RSt1bWljYzdpWjd4aFRMYkIvbDJHTWRHb2VSZUVzanROeENC?=
 =?utf-8?B?cjZobXhjTktOTDliWGtzUWlKV0ZpU24vTFZtNFc4dEFBZjJoYyt3QlNXTHMx?=
 =?utf-8?B?MmZ0eUpTY3c0cllVc2kzbFRBdHNxSXdwZFJFU2x0NVFVTkl6V0lvRUJDRVlK?=
 =?utf-8?B?cHpNMFBMVlFQZDBrUVZidm9ERVg3SHlPcy9HMFlBUFNYbGNScUgwc3cvRDRu?=
 =?utf-8?B?Y215VllSSUpOb3FBNTdVZlBSVTN0Wi84aFZrRWMvMFpPYjQvY2hpbkFYLzUv?=
 =?utf-8?B?c1ZSTkdQQ0MyT0xGbCtGTFdhSUQwb1B1Ni9icTVYUjZWdUdKZnE2L3NZUDdF?=
 =?utf-8?B?WWY5MkdXcHhYU3JobEVhSzllQnhDWkFaejRyaU51dUZOeVRZakpnL1FxeGxN?=
 =?utf-8?B?SldZQXp4L2xGdlp4RlVrZWplSTJXdU41QU5Qa0I2dDEwZVNPbnpZMHRsd2da?=
 =?utf-8?B?Zk5XeEJUMExaY0lVN2oxWktxV0YzZGxQaStyamFSL0JqT2VnbnlreXBpRHdk?=
 =?utf-8?B?a0FjODFNQmFUdDlrZHZjNkFRckU0OGFxU1FYU09qdTJkRHJoOVJ1VVlxWjZz?=
 =?utf-8?B?M2hVblIwQU8yblV5T01VN0xvdFNFeFE0L20vL2lXZys1NGxMUlJvdFdyMkxD?=
 =?utf-8?B?ZGFKUUVtdkF2N0lsUERaa2xaNjRDbGZuOVBjUnZkdSt3TWhabW13aE4yNWRa?=
 =?utf-8?B?TGx0WTlrdXl6OXkzTW9zNHJtdVd3bW84dmJldzNFN0d2ZEdVbStqWUw2Y1NQ?=
 =?utf-8?B?aWRLYnpOU1BkQnhJdTdzN3lQd2JRRTFCTEdYNE9paDVJV2VjOVVjRWtoZjBH?=
 =?utf-8?B?cXY1UnV6YTZTYlhMam84a1k2RmVUQ0xzYUwwcXNqMDg3MGxOa3krSUFRV1Fr?=
 =?utf-8?B?N1VXL1ZuR2RNZGRFL2hXOFQybnZpVDNzeUd6N0VzczlPOFdHaDBmRk1FVFV0?=
 =?utf-8?B?SndWNmExNlRGV3FweWxuOFlSQ3R0WmhpdmhpMzA1VEhHcUhYblZuQUp2VWhZ?=
 =?utf-8?B?VGY5SHhxcVU1dmVscHExcEtNVFE4NVJwSzUwcEVqZ0VldHhMRDAyWW9XRWZL?=
 =?utf-8?B?aWxZY0lWNWVQc3N3ZGJIMFZQWmVabjR5NmZUM1psbjYwM3BqV0hieTJDT2tu?=
 =?utf-8?B?THZXUHp4N3VvVXFUajNOSVhveDZWOGdyNDVwR2lVbHhHcnZYMXRtQXRXOUxu?=
 =?utf-8?B?SGRvdzJVcmNZS0JjZmt5bWZER1NEbFhic3lqelNXeWFjekZ6YVovai90czlY?=
 =?utf-8?B?VDdoQzlRU1AvWXB6K0JWckhNckpqcHJvUkl2RXhHNks5QlFkaTJHbVhlekhy?=
 =?utf-8?B?ajV3WU9mTEhEVXlxMWRxb0ZkdktnaE9aU3NiYUE2MHhIeGhxWTRuV24vbDRD?=
 =?utf-8?Q?8Srq2Qy/UT87aakVwS0QQX9eknak+OpK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1E5R2tzcEdwZURHOWRneVBQMXRmakF6KzVaMFpyK3B0bnQvem1uUTVBZ2gv?=
 =?utf-8?B?SXRkOXZraXBqNTg5cGRBWU83Qm93NnArbUNsSzFIWVhxN0RNcmZlK3lFS2t3?=
 =?utf-8?B?WmRNaHNBV2Naek9uOFVFSWxjbWlFbjhBYm9uUWU3ZlRFYmYrOUxhWVlnU3RV?=
 =?utf-8?B?TlVOWnFxblFiS1BXL3NMdHhXVGVSbnhlSjBpTGR5SmdrTVJna292UmtzREh5?=
 =?utf-8?B?SFVMRW9lMUZFVitVdWtyQmFUaWxCN0RFSXJWNnFTMU1nQ25RaUR4OGZtRjM4?=
 =?utf-8?B?eWhPWkZ1ZGhCVVNQWm9GdHlCZ2tzRy9jMDM1U2Z3TjZ3UUpjS2FabWFlbVZm?=
 =?utf-8?B?cU9YOFZXSEE1NTg3ZzJjcFR0NzkyRkxaeWVsdjZIemRTcE5iOXBnSVJsbndj?=
 =?utf-8?B?bWFxQW9FdUFVb2V5VFJObEZ0UGZHZUZiOE0xR0JxMXVFSUhMRi9EcDMvWFlD?=
 =?utf-8?B?TXhscUtLTHEvREJWaEFZbGxoY1ZEZWp1Vjlzamk2a0RyK0pFYU9vS2F0Ymhh?=
 =?utf-8?B?OEpOWDBvMG5MMDhyODAyM3BGdFVvaUllcDgyV2NWWkRtUDF5d3FuUGtGQ3pY?=
 =?utf-8?B?bjZjSzkzODRqejFMdEF0N0dQTHVQdjhHTUU4K3daWnpHVThucVBvVzd1NGVK?=
 =?utf-8?B?WVZnQ0JXNHpVNldlenpRQWYycFlvT2l0d2pTTWZEaHFFU0wvWlBwTC8rbWlu?=
 =?utf-8?B?cnFUYWo3MERsZERSVkxKcHJvZXpMNnVicXFPQTEwZXlaaTZrSUFCc0pNQlZM?=
 =?utf-8?B?SHVMMjhRd204NStOY3BVSHFhSmJkaHdTbTdUT2RSRGo5d3E3YnNLdGZWWkV3?=
 =?utf-8?B?ajYzcm5MaDN0L1J5NEZIK3FSUE9YeU9NU2xYaUExS0R1bjZsSGRZd3BXMDFW?=
 =?utf-8?B?NzI0Z2Y1dEJJMHNIbDd3RkZMNE1kcW9hdk9uM0ZIVnNmK2d3b3ZCVXozZlZv?=
 =?utf-8?B?M1lpYlBQNG5CNlRvYjJDSnEzWUFmbEQ2TGp1VldicjdkQyt1VU04eWNzbW5v?=
 =?utf-8?B?UzdoRVh1OWxhV2s2V0xJOVkyUXhaaGM0R3pmRUR6RVY3bnJ0S1ZKNkhPK0Yv?=
 =?utf-8?B?ZTFQUSthU0hIeGF5Uno5d0lEclB1TEU1ZG9mZFl0ZmVxNGdNaHhnRUJGUmZZ?=
 =?utf-8?B?cXFheG8zQmtYWHN2VTFXYm85VjFTdURkeW41SjdoVDRjNUNVV0NvNkUxVFcw?=
 =?utf-8?B?NDd1dHlFK0YyK2hBNHlqeWRwYXhzam10a1RqUlYyQnBsTC94eFFzVW80ZmVn?=
 =?utf-8?B?QjQ1Z05DSGlubkFHNGp3S1M0L0Jyd1VXRDlYaVZNQkNpTXpoTmlLNDdZVGpt?=
 =?utf-8?B?N1lFUE0zdkZ1QTVONEw4SjRjZ1krZXJ1UVBZZXpiMHdWWFNFNlBUM0xHVXlS?=
 =?utf-8?B?U3hZUHkzTGUrR0x0RWFHMWtxa0t5bE5CSkc5TDFBNnhOOHpXVmVUSGhjTHVq?=
 =?utf-8?B?NGhrYlVjbGlmNlp1QnhOQlNTQTVUTDlDRFhRZFZSc0d6MUhVT0FFcjBKVmZV?=
 =?utf-8?B?Y1VGR3RPV2ZPVWRBdFdtY01sUFRNeWp2WS9IV1NqYkNJOWdaemZpWlpzaVE1?=
 =?utf-8?B?MmE1dUE2YWF0dTlsdENXNDJaY0JuMGRVWTYrbHd5Y3pPWGRmSldqTmFZNHVW?=
 =?utf-8?B?TGYwSU1IVVltejNwUGVJRTBlRDhBV0xaeW9jRDRmOGhaV3IxaWw0Y2ZYdC9X?=
 =?utf-8?B?K1hJWnl1ZjhaRHNZK3BHQmhWUHdFWVJXZk4wRThXamhYdGp6eU9aUjhZc2ZT?=
 =?utf-8?B?WFVHSFpkRE5xbXJDKzVFVW1nUHF5QVBGWi9USTZiMjQxNmVyVGRCMm9iZ0Zu?=
 =?utf-8?B?azVYbXAxY2x4YisxUC94RjZCQUhmK0NhMVZmeCtmZWVQWHJzc0tnT3pvR0tX?=
 =?utf-8?B?RkNseUd6R1lORVZxSkxWWFhKZG5TalByazU1VjRFWjVxTTc2MTNreXpibDVx?=
 =?utf-8?B?MHk0NmhGNzBPSlVuMUlNaXQ1OERMaE03MTkwNEt5U0E1dHU4V3lRUVlya25J?=
 =?utf-8?B?WVc5aXROdS90anFlMFV0WCtKeGphdmk1SUx5dEdOWG55cHcxRUlQUVYybWYw?=
 =?utf-8?B?M3pmZmg0akdIN1o2aUwyZFZpQU9hRDdlY3NaNFVWL3hCQm1jaGdmNzkxdWpt?=
 =?utf-8?B?K3dVbWFQU0NhNEZKYXRZVDZFbkNmeXVwNk1lWHZyOVMrUzJPYTNLYll3U1Vj?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfed7b80-69bc-497b-4e69-08de1ee7631e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 16:53:48.7215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKJAZ8yTg4FReizUXPChosJNQ/LPsRymgB1387yTDowip3N+ibEtYcu6MAVeZvBUlm6nfs/M8sqwF+NY2QPfLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB7997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_085401_279309_D2410ADF 
X-CRM114-Status: GOOD (  12.59  )
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

RGVhciBLdWJhLAoKT24gMi8yMS8yNSA1OjE3IFBNLCBLdWJhIFN6Y3pvZHJ6ecWEc2tpIHdyb3Rl
Ogo+IFNvbWUgQWxsd2lubmVyIGNoaXBzIChub3RhYmx5IHRoZSBEMXMvVDExMyBhbmQgdGhlIEEx
MDApIGhhdmUgYSAiY29tYm8KPiBNSVBJIERTSSBELVBIWSIgd2hpY2ggaXMgcmVxdWlyZWQgd2hl
biB1c2luZyBzaW5nbGUtbGluayBMVkRTMC4gVGhlIHNhbWUKPiBQRDAuLlBEOSBwaW5zIGFyZSB1
c2VkIGZvciBlaXRoZXIgRFNJIG9yIExWRFMuCj4gCj4gT3RoZXIgdGhhbiBoYXZpbmcgdG8gdXNl
IHRoZSBjb21ibyBELVBIWSwgTFZEUyBvdXRwdXQgaXMgY29uZmlndXJlZCBpbgo+IHRoZSBzYW1l
IHdheSBhcyBvbiBvbGRlciBjaGlwcy4KPiAKPiBUaGlzIHNlcmllcyBlbmFibGVzIHRoZSBzdW42
aSBNSVBJIEQtUEhZIHRvIGFsc28gd29yayBpbiBMVkRTIG1vZGUuIEl0Cj4gaXMgdGhlbiBjb25m
aWd1cmVkIGJ5IHRoZSBMQ0QgVENPTiwgd2hpY2ggYWxsb3dzIGNvbm5lY3RpbmcgYQo+IHNpbmds
ZS1saW5rIExWRFMgZGlzcGxheSBwYW5lbC4KClRoYW5rcyBmb3IgeW91ciBlZmZvcnRzLiBGb3Ig
dGhlIEExMzMgcGF0Y2ggc2VyaWVzIFsxXSB3aXRoIGRpc3BsYXkgZW5naW5lCnN1cHBvcnQsIEkg
aGF2ZSBhbHNvIHRyaWVkIGFkZHJlc3NpbmcgdGhlIENvbWJvIFBIWSwgYnV0IHlvdXIgY2hhbmdl
cyBhcmUKbW9yZSBjbGVhbiBhbmQgYWxzbyBhZGRyZXNzaW5nIHRoZSBtaXNzaW5nIHBpZWNlcyBp
biBteSBzZXJpZXMuCgpXaWxsIHlvdSBiZSBhYmxlIHRvIGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZv
ciB1cHN0cmVhbSBhbmQgSSBjYW4gcGljayBpdApmb3IgQTEzMz8gSWYgbm90LCBhbSBoYXBweSB0
byBwdWxsIHlvdXIgY2hhbmdlcyBpbiBteSB0cmVlIHdpdGggY29tbWVudHMKYWRkcmVzc2VkIGFu
ZCBwdXNoIGZvciB1cHN0cmVhbSBpZiB5b3UgYXJlIGZpbmUgd2l0aCBpdC4KClsxXTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3VueGkvMjAyNDEyMjctYTEzMy1kaXNwbGF5LXN1cHBv
cnQtdjEtMC0xM2I1MmY3MWZiMTRAbGludW1pei5jb20vCgpUaGFua3MsClBhcnRoaWJhbgo+IAo+
IEt1YmEgU3pjem9kcnp5xYRza2kgKDUpOgo+ICAgcGh5OiBhbGx3aW5uZXI6IHBoeS1zdW42aS1t
aXBpLWRwaHk6IFN1cHBvcnQgTFZEUyBpbiBjb21ibyBELVBIWQo+ICAgZHJtL3N1bjRpOiBTdXBw
b3J0IExWRFMgdXNpbmcgTUlQSSBEU0kgY29tYm8gRC1QSFkKPiAgIGRybS9zdW40aTogRW5hYmxl
IExWRFMgb3V0cHV0IG9uIHN1bjIwaSBEMXMvVDExMwo+ICAgcmlzY3Y6IGR0czogYWxsd2lubmVy
OiBkMXMtdDExMzogQWRkIEQtUEhZIHRvIFRDT04gTENEMAo+ICAgcmlzY3Y6IGR0czogYWxsd2lu
bmVyOiBkMXMtdDExMzogQWRkIExWRFMwIHBpbnMKPiAKPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW54aS1kMXMtdDExMy5kdHNpICAgIHwgMTAgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMgICAgICAgICAgICB8IDQwICsrKysrKysrKysrKwo+ICBkcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oICAgICAgICAgICAgfCAgNiArKwo+ICBkcml2ZXJzL3Bo
eS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGktZHBoeS5jICAgfCA2NSArKysrKysrKysrKysrKysr
KystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
