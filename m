Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988FBC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Zb8IbblcMSNh8nO+iuQfkuVtOWM8RIAX2Q2qzCcuRkQ=; b=b1UCywJGuDHKqx51vINIYVeBjK
	k2Bzfxdxv3u/TQ7oMbwyPIgnojx42bf2trn9mnU0nw2+bqmjRCcIkPmByDHzpTpaTj9q1kMcGwNwF
	U9lIgjxyyEyyOxk8MA7aDHTwtto5LCl6eClX4Vwhe18b/VpuwGfXCxtqGs4xjBXtdNFGB5SkTx/tU
	bCD9NbCDIk0vw1RFZUbzzqL2IMvIUHY70nz1AKvX1K7zirB4lnmTek7PufHIXsYG9i/QAXhtUtmw4
	5eCcUNXxI80B3hewOE2jwUSbX/6sGyZQC1dNYA4Ir2+qk4FiNvNDLv49Hsk1TKFUhqwurJlmey/tZ
	QBG7RRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virq7-00000006pO4-0XCw;
	Thu, 22 Jan 2026 10:22:59 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virq5-00000006pNX-0HBV;
	Thu, 22 Jan 2026 10:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFYZxw/WjA5t/U8e4atje0viQuE8MYxMKfgZ8w9sRaK9nWLi6ZC3tIkpi1vhkEzFbGepHHY3E7Y0QggGPRfNDvLEJhTmuEIaA7NCp4us+S9OqZ/m0Gb5DK0i04Rno2LxzEc5dT4i5CfR0bpRh8x0qjTQrwXWD5mGyWNFD1kJsQi3vniuC6cMzBOq8Q9ECHDzL692j7n/tax5nEp2Q+uWixOCOwGzZ0P8DPXeINj9RwJDkV9feaYnuxBoKSJ/pIyMqKbWmjvC4726pCZKalrrXEDT8nSsWC8n4kY/O7wjG9gl4yeqyX6N3Ol4gdIov/NlmPTv2pV6eb4nXbVgHdBW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KshWMRaeKt8+Y/udjcsuhr1um7EFjxjytu7mKhSjXro=;
 b=ARMrBWye7Ph2u5i5OHvwrbeyEl3R/yKcXAv39LM+upn0OO4Q6i74oux/9Vp3PvhaeVxVl0iLPgqkDBMGL403+r7m3dJxNvFeJOmBXL5QCDnEgmC/fhTLbi24HnEbWwLsSmVtFXxuozngGA3YR+I42gmSvgLImkLGZaymoSXiJotHCc9PYYTRtKjVqyqYXvWVGGu+OUeh06LYweWDxTkCOlLxpogefGxaxO+1O4KjqkX28Qoaa94d9H92xCqRjtaDiAtCJT+8sT8Lyn0mWzTI5kwKITRGgtINJYtU2gBrq/JLwp3+H0qWptbu95j1YDbE9WoK/DMpptTTt9Z698wFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by PUZPR06MB5818.apcprd06.prod.outlook.com (2603:1096:301:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:22:49 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:22:48 +0000
Message-ID: <6825d5bf-9d99-4872-a61f-1b145bfd2efa@linumiz.com>
Date: Thu, 22 Jan 2026 11:22:00 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134835.447357-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134835.447357-1-kuba@szczodrzynski.pl>
X-ClientProxiedBy: BMXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::18) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|PUZPR06MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3419be3b-e288-48af-fac7-08de59a030e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmxROEU3QmJ3T2gzeGZ3bTJCWjdzMXY3cmZ2eDQ4T0tIWGxmdFpyMU9XbUM4?=
 =?utf-8?B?bndnOSt2TEE1YU9tZ0RKK3czQzdOTTR0SjExck15cTZuM21mb1hjaS9YckN5?=
 =?utf-8?B?aWhsekhDMHArSm1heFhUTzJGWmlsM1ZqZ2JXQXlmRnAybkNJTkx6RXJwMTNX?=
 =?utf-8?B?ajVQdDJxeStCcUQ0RUdNQUhNbGdYK1djUXNBWDlZRTJLb1RZNWd0bGpNNlVs?=
 =?utf-8?B?NzJ5Y0JmVFE5WEpONXA1dytVSE1zMHVIWVN1NzcydmtkdTlKUFdKNnNTMnN6?=
 =?utf-8?B?cm1IRXVjU2Rqc3BMVzVPUFlwcm9UUHNIRWROQndkQU5OZzRNVE9yODVYWkpx?=
 =?utf-8?B?NmJnYy9rLzhmOUc0bjNCclNzbFJCeUtwUXFHeE5aTDdQMk9vRERpeTR4WUYy?=
 =?utf-8?B?dnk4aCtmOW9VcFJwVkRoZmFpUzF3c29HMnVaUEdQSFNoK2JwT05va3Jlc2wv?=
 =?utf-8?B?eUZRYzBhS1RleUdKOG10VnBEeFRIMmZoRld0T0Q1MnRycEc0OGlaTTVEOHpJ?=
 =?utf-8?B?TWdkTENCeWdKT0N2blArdUxBNWMvaUpiYTZnRXhSZWtMMUJ0dVkvV3RNTjgz?=
 =?utf-8?B?VDNJMkRnZ1JYa1pZZEZGTjF2K2JwUThkTHpLNHJCdGF5YTFMNjRtU1l4WEFO?=
 =?utf-8?B?aFljTER5aFpHZThqRkJqUGVPdjc4TXBzQWRLVCtQTHdFYmFQQ0pNYjdvSTI3?=
 =?utf-8?B?NWNFdU5IK2VvSzQ0M001eVRkT0tKenArRGI1b2tEZi9jMnhMMmNzOE03UGNU?=
 =?utf-8?B?TTdLQ0EzcXBmbk90c1pSbEdVN1h1QUVUd08zZ0NMZ1RZL3RSQTYrR09hMkVE?=
 =?utf-8?B?SUM4TTVid2VTdUFya2RNWjFsTUpGdWV6NzdISWF6STFwWWZBcnpYZjduTWdj?=
 =?utf-8?B?VEtBU1NHTVkzSUNHN01nUWljaFdHOU9KTExXODgwU0dxL2ZpOU43a0txNERE?=
 =?utf-8?B?NU0wWlVrM2dzWDVJK1hFcVc3SWc1REtScFMva2dsZTkyTmpKWnN6eUMrY3Z1?=
 =?utf-8?B?Z2tRN1QvUjdzbEt4c3dMQXlXN2d0ODdWS2d3cjNWOTZXSFBzTm90QmEzOXlN?=
 =?utf-8?B?WUs0U0Uwd0VISlVlbEJhajhReVN5alZqcVJIQm9LeVRKVnVERXpLOUdPMSt6?=
 =?utf-8?B?S25IcHFZTHl3aWRHaHNLbWQxWm81ZmlaTlg0QWRnUzVTMkhydGFwOGg5elBQ?=
 =?utf-8?B?ZWNZVmVFanlJamhndEJPTTJvZFowRmx2Qzl5ZFlZY0xpcmFYZXBmeUxTWGFE?=
 =?utf-8?B?TWhlaE9hSmdrZFNaYVNOclkrZWc3RlZkbTB5aEw4STNCYXdCUmNDZHJLb0sx?=
 =?utf-8?B?ZXRXYW9mc3NqVld1V2lWVE1nVXZDaFpNQ05GTitpNDBFQTQ0TzdSOFcxWGJX?=
 =?utf-8?B?MmJxc040am9RNnBiZkRpeEQ1SFpaNDNCWUlNNkVhYiszQ0pNQzdITXJ3TG5J?=
 =?utf-8?B?Q0k4d1ZaSkVPVmpNWUF5Vzk0eC9EL0EyU3hONjVQVmdGa0VYR0NKaG9OYThy?=
 =?utf-8?B?cmcvZFBYQWpwVU56ZkJtTUtOSWRhS3hMZTlTUjNwRDk5clpzbU45VkxOcmlU?=
 =?utf-8?B?a0E0RXZVWFcxOEFCN2tDU0lrd0FDZ015RXJrYndBMXF1Y2VTQTR2QTBzdmVP?=
 =?utf-8?B?TDFhbUVEM1pseVpOa0pyNnBKZkk2VHd4czgzbTNLRlpLM3hoUDduMnJMQTlP?=
 =?utf-8?B?ZlZtWGtPa2Jic1MzUHpocE1rZVhKUWpXZWhSYTdJR0c3aUhvRllvdy82RHYz?=
 =?utf-8?B?NWRNQUZYbGJHdEdiVkdmODU1aUxwSUUweG1pZGFhM01Yd2k3MXorUVc0SlZO?=
 =?utf-8?B?TE9hQmVFNlZVanFHMVNUN2U3MmhJQThaQVM3SDNVa24rQUpRYnZUSUNjcG12?=
 =?utf-8?B?VTZtaWlDWEtHSFFMTk5CWDd2N04rdGkrRWlXK2J2cjBoTzExWnV1dXJsRmF6?=
 =?utf-8?B?eE9tV2ZCM3NuTjZUK3pOSVdSSzdkM2ZqbDNDazBrR3dlWGFqemVCWHhib2Iv?=
 =?utf-8?B?MmJmZW9xUnVyQ1pYRk9DVzdqZXZqV0txT0Q2MnROeUx4SlNNZEtwb2lYZ1Rr?=
 =?utf-8?B?MU1HT2pzeDNzVHJBTGJXNTJmcXo0SE1nMFBDdVZVVDU2ZEs4cjV3Rkd1aFpJ?=
 =?utf-8?B?dVBMNElvVjNMMFFuWUhCNlAxdGFkdzlaSEt5MlVBYmc3SHZvSEVHMGdlc2pm?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC9vaW04WjY0VVJ2WGJyeDNkN3VTRGFxUjJ5dG9zNk9uTTJucDVOdUlWa1Jm?=
 =?utf-8?B?SWVLNlRTQ1c2bU1XaUE3MEZ1cjVISVpiRWdVblhYOEh2Q0RxYW9xNmdHSzZ0?=
 =?utf-8?B?NU94SmlmWHp2SnN4YUxQeG5lSWdWSW1ha092eDcrUTVvNmVNVWdlT0R2aGkz?=
 =?utf-8?B?M3hPOUVUdE1nMjArMTJIZDBwZEJ3T0lOTm5mcTZMSHhlL2lxRnhxTXY2Z3Zi?=
 =?utf-8?B?T3ZKemRtcEpnT0ZKM0RpVmhaRHZtc3NWelBLQjBMNjdVZnl1bHJ0bzFXcjJu?=
 =?utf-8?B?dklBSkx5cHFIQTA4SkhQMWdJMnZzR25yb0dPcXh3blBTZzZrdDk5OGVHaG4r?=
 =?utf-8?B?QTZTa1JyS1JTZGdLeEZzZjUwcVBYSHNqc0RVVmtLaEcxMEh2aUxzSWtnTTR1?=
 =?utf-8?B?Z0s1eDViV1lhaUl4UFVlOFNYV2o1SWF1QkRiWXF1NlJ3ei9oWDZudnhvTzFF?=
 =?utf-8?B?eHVoZ2JZano2V2dvbzI1KzhGR3ZyZ3NFWmNCWld0aTJXWUFtbVNqNi9jaXUx?=
 =?utf-8?B?a3dOZmJTbUZMS2NiczVFemRKYnRxeFp5L2hHSTI3UHBMbjR6b210dlBTdEhq?=
 =?utf-8?B?Zit2UWFEWFFoTDJzb0ZWYUR0UDBIczFsQ1VPSVJDeXJmbHc0SFhXZGx1Z3lw?=
 =?utf-8?B?Unk1Z2JONnNXTThNT3k4UmFEUjBSWlYrL0YrU2JITXdoMCtJb0xlWWdWd25F?=
 =?utf-8?B?ajhPcmxETG45Y2VEemdnTjJ3RU44eGZxK0Z4SnBmZUJhTVRUTTBpY1NZdUFB?=
 =?utf-8?B?Mjl1WTF0em54WTZhckNneUYvQ1pkM1NZYnlKSkZlaWhvNXJsODc0L2t4eWlo?=
 =?utf-8?B?WTd0S0VLaEZSS0hVRUtpNjhpV1ZtWjNpNGJleXh5TGVOYUZVU280QjY5dW9R?=
 =?utf-8?B?bXBvSE1Nb0JVQ0NlTzQ4TzA0MklLMUdnWEVkUGtiOWdGdHE2S2gwUTdXbHVq?=
 =?utf-8?B?eUNaWi9naVd6UTBLSjdzTXRDSFFEMGVxTlNGM1ozYW9VdmEyNjNMT240VDUz?=
 =?utf-8?B?U0o5aGI3T3I5bEFoL3k1TkpkQ25paDdMUVBidXJEU2pYS0c4MWZnTVBad0dz?=
 =?utf-8?B?a0VlWjZzVEFjeW5YbTBBYnJ3d1Zya2xsVTIzd1lVZGlnT0hYc1VxVFhOdk5B?=
 =?utf-8?B?dlA1WW9CMEZLMGZHRWt2aDBUOFluTTlOeTN5TFB1Y3NoVElBVUYzUEllZm40?=
 =?utf-8?B?YWdOMTZEU0FQZ2gyVy92OFpBTnkxbHU2a3llMTNQSzVHSllKT3ArcURuME5p?=
 =?utf-8?B?MG5JVFh4ZFgwK1RLUGlVT05rVk1XMFN5RlZHbXl0N2RJSWxDNzhQalk3cDdT?=
 =?utf-8?B?QU9LK3BzdDVFV3E2bE1ybHJyRUNBSGN1QWpWK0xxdExVYml6RUg4WDgzcTh1?=
 =?utf-8?B?VXVDWmZKbTdWRzA1QUM1UWFhN0Q1bmt0eDg4WUdqN2VaQ3VIeVN5ZmtvSHN5?=
 =?utf-8?B?SmE1K3dGSytocmVrSkp1Z2s4aTVSL01MZVREMjM5WVk5TDI0S1czVjlsQ0dL?=
 =?utf-8?B?TkRMS0lCbkc4aVJvZm5kaUE4d1A2bXBDVXBMdk5jNnlUUWEzOHoxQ2lzTCsw?=
 =?utf-8?B?T1ZQUXRsWjA5MTRURzlyb2lIZFVCdnd1OWhwWHdnVExsWVhBQ1ZtbHZEUzZI?=
 =?utf-8?B?UkgrbjZ1b2NuV2EzaHZTYmY0cGxPb0xXc0hpK2lKZDhMTDFnQURrN1ZxV2pS?=
 =?utf-8?B?VitjU2g1OG42UkR3a2hyMk5LRWczR2E4dXF2K1laT2Z1Z255K1U1RTJtOThF?=
 =?utf-8?B?eUlUNVZYVGtnVWU0SkxaYUJQQXRveFloaDE4YUNSMTV4MGRJSy80V0poM1gv?=
 =?utf-8?B?bStuVDJPRTVCQXAvWWlNTjl1R1VseGM2bFZBYUlZNXM5eGUyVlhNNG1YUWNO?=
 =?utf-8?B?aW1OcHRqK2tSYlpwUWlKWnhLanlIT2N5VlhyeTdjYm1EeU1lU1oxRDFjZWU0?=
 =?utf-8?B?YWY2RXRSOFZzSUYzYTNyZ05odlBxZHlxZzVvSDFqU3hJcDBZZ2JZa3k4OVlz?=
 =?utf-8?B?NWVYUWU1R25HUVR1SUVub3RkZUFIZEdNbEhxTHFPRWJJUEtyeUw1b2dxSVA3?=
 =?utf-8?B?VWhWdFU2ZUFLZCt5VmtsMCtVN1d5dmtpV2VXeG94VnR0dTRMUGlaWWluUHZN?=
 =?utf-8?B?T0U4eXhkUTdtWVdkN2EzYkRzYllLWEoxRG9yQmt0SWNqZ3JjRlQzREVFQnlz?=
 =?utf-8?B?TTBRUXlGVTY1MGRXaVFqYUhiMWU3ZlloNlRrMmNLSFJHYWNKOUpVUkMyR0Za?=
 =?utf-8?B?bGl2dVFFcm1ZQk1NODBIa09CZ0pVcTdiQXlIdXJlY1JjN3NwZUxyMFNsUGI0?=
 =?utf-8?B?SktkOVBleDB0T3lEaG9ZR25NZFAyS2J3c1NqV0tmbXU0WEZORjM2Zz09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3419be3b-e288-48af-fac7-08de59a030e6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:22:48.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2T7vThY1pr01On0i0AerlcY4QetCgDh68Fu6X/29sckFhN6OJotHFUBG+GT31gVjzjvJCC/h0iT7/LX32mq4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_022257_111069_295AB7B6 
X-CRM114-Status: UNSURE (   8.29  )
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

RGVhciBLdWJhLAoKT24gMTEvMTYvMjUgMjo0OCBQTSwgS3ViYSBTemN6b2RyennFhHNraSB3cm90
ZToKPiArc3RhdGljIHZvaWQgc3VuMjBpX3Rjb25fc2V0dXBfbHZkc19kcGh5KHN0cnVjdCBzdW40
aV90Y29uICp0Y29uLAo+ICsJCQkJCWNvbnN0IHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikK
PiArewo+ICsJdW5pb24gcGh5X2NvbmZpZ3VyZV9vcHRzIG9wdHMgPSB7IH07Cj4gKwo+ICsJaWYg
KCF0Y29uLT5xdWlya3MtPmhhc19jb21ib19kcGh5IHx8ICF0Y29uLT5kcGh5KQo+ICsJCXJldHVy
bjsKPiArCj4gKwlpZiAocGh5X2luaXQodGNvbi0+ZHBoeSkpCj4gKwkJcmV0dXJuOwo+ICsKPiAr
CWlmIChwaHlfc2V0X21vZGUodGNvbi0+ZHBoeSwgUEhZX01PREVfTFZEUykpCgpGcm9tIERvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS9waHkvcGh5LnJzdCwgc2V0X21vZGUgc2hhbGwgYmUgYWZ0ZXIg
cG93ZXJfb24uIEJ1dCByZS1vcmRlcgp3aWxsIGZhaWwgdG8gd29yayBmb3Igb3VyIGNhc2UuIE5v
dCBzdXJlIGlmIHRoaXMgaXMgZmluZS4KClRoYW5rcywKUGFydGhpYmFuCgo+ICsJCXJldHVybjsK
PiArCj4gKwlpZiAocGh5X2NvbmZpZ3VyZSh0Y29uLT5kcGh5LCAmb3B0cykpCj4gKwkJcmV0dXJu
Owo+ICsKPiArCWlmIChwaHlfcG93ZXJfb24odGNvbi0+ZHBoeSkpCj4gKwkJcmV0dXJuOwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
