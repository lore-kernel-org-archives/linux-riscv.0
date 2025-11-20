Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F23CF8544
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 06:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t7aLj4llIMUJhP0VtbfWadua0yhTU/Wdt6XEz3WnYGQ=; b=gFnO0KrU46uzG3hF3gsNsCx9i/
	MrUw729K2mltzkccnTBhcN+aZq5qaeRNEvYlkNA+rjB9Fg0Blq41lvwMDvRazmTAmfic4Z3am87BK
	H+a7sZi0vYnzhUlGsEAfB7cEc3J2lFYvTgvL9zQJc1slNA1iWlkhtu2+NidaONlYDBQ13yD0PDHK8
	ecdtdizW9M0ub0uBFjYQVA/eAZw0YgewUnTm65IDAw2FHtlSmiAhgoh3Hj3s+hgjKcCgoiBrNiv54
	h57fCXiLovka9lyLaUsaWBLxLzSKa0piItlIuzQbcks4IqlqmArf8mIQmaKDYXSJ8C9A1+9eRFnYF
	E0aoxsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy6Z-00000006Dfw-3MVS;
	Thu, 20 Nov 2025 06:25:19 +0000
Received: from mail-koreacentralazon11023124.outbound.protection.outlook.com ([40.107.44.124] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy6V-00000006Df6-4AZg;
	Thu, 20 Nov 2025 06:25:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1LDPHuisOQwfUlKEJgXuEAxIg4SKtDOczK68sW526LYJStnBdE47D0lrSouyjlle8iJ9rVCEEcNb5+ur2OWyTDa8SlR7HgtPrc4eaDMg5XkhbHK1aZUo9DfEdnMk3TVJhw2reio9W0Q8HML21ROZMkifvoqCf7/WB84MwOHFMElzpGQcxDaxQwtaOYLvNYwnOPey3cnCYaMalzklxfBDhrpq7/T0dZmccHkU2luw47I/6BXqOCgb+0Q5YXjNF/DbECUKQjFtkCWzBAFNdUdKeMGlP6VPvvRmLydYJOJSxdcLba5KcAgRU9xZI6siKRm6unFhLwdzTahvx81Om7odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA5WMccklP4Oq1396jW28CPeYFxHGqB433IHOa9uf18=;
 b=eujFLaMeeBSyWVjX88T+gcoC/1g+ZTbMeHaRPYBJG4qYUaH6UluJTca0Xb7yA6m+wNSpvKgIVFfzdoAI9ANI/Q/UpRNy2yLQ/VyT04mmSym0IjshVyDIEJ3/LQHfg8QYrTgq/+AFeYEhGJkrpyxgxPFf9XhvrIkNhslZ/P68AajpSjjYH/mBs/mos/h02hy1hakqDRtUIq1Y3S9ZevNSoFBeCBl4Tn4Chs9AL3FwmlUAIlnEKJRv23bMwqHSJNOMo2kWa/Ya48CgnvOJCX7pVY98k08zqzbfLc6NScsjZB70eIl3V9baj0tE/Ve/SP1INEgGOExfp2CSwdAQ/e4+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by TYZPR06MB7256.apcprd06.prod.outlook.com (2603:1096:405:ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Thu, 20 Nov
 2025 06:25:00 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:25:00 +0000
Message-ID: <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
Date: Thu, 20 Nov 2025 07:24:53 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134724.447131-1-kuba@szczodrzynski.pl>
X-ClientProxiedBy: BMXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::23) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|TYZPR06MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 71232807-e726-4898-3b9d-08de27fd887d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REtrMks2dDA3UEIvVzZZVTI2QlNEMGZHRlg5Y2ZIcjdEM2htdTBNbytkNWdh?=
 =?utf-8?B?NDE3RkFBNWovWWlqUTRXenFiRkpreHFqMEZvOHk1TWdCWG9RSHNTL1NJT3Iz?=
 =?utf-8?B?cVN0TE96VEdpSittL2o0V2lXQytYc29Xb2NPYTRTa2VoNGZUNS9zMmxxT0wx?=
 =?utf-8?B?eENuUUZjTHBGNHM4cjBsZzRDNVZ6anp2SFJWZ0IwVXFYdXVJMG5xMWI5SGxF?=
 =?utf-8?B?QU8xVzA4UFpiMlJMdEVOcTY5Wm50eHJZSk5JR3cxajMxcWdrUVF4aU1LZU1M?=
 =?utf-8?B?VndUc1VucHlUckJrc3lTZU83cHNZeHc2dUo0cnBmWUZEdFZhTmtQSXE1OUtt?=
 =?utf-8?B?UGhPVDlZTXFYL05rTU5yNEREdnVqWm1UcHZWRWdOSm9nWC9YVzk2MTFvcVpH?=
 =?utf-8?B?MFpyNUJKN0ZuV29jRCtEVG5kWlgzQVZzd1h3QW1KMEZuaC9PTWJmZ0s0NkZJ?=
 =?utf-8?B?UVlpN3BaQ2IxZjR3QWp2VUkwckJPVXEyV1lsTTMzUTIwRHNlcCtpWlpTQVAz?=
 =?utf-8?B?T3gyWVBLYnVqZUFHeWR6emJNQmpCcnpScXVUcTZoL0pueHhtSURtMWROd28z?=
 =?utf-8?B?QWRSVElpWkd3Z0N2QmtDV3BvODkxcEV2TDFTekZGOEgvR0xxOFFBbjFLSzIy?=
 =?utf-8?B?cUpNdFozM3FuZXZYMG1uaFJBSnBNNEdOa093SWxPM1Z4ZXhsV1RTR0NmRk1M?=
 =?utf-8?B?bjh0dUpwSEd6VTlMMWY4VDVKK1NxOWo3M1FxZFpyTjcwd0ROYkw1bUYzZHVX?=
 =?utf-8?B?WmNQSXlHdWFGdFkwOFdXRlF4bXU1TnFrQWgyWFpueDRFWVBRRjJpY3JJNmU0?=
 =?utf-8?B?VzJLU2xwMEhRdE9RQllTa0Z2TmVWaC9KVlQ4K0hnb3BQS3JmSGEyQm1RNjNW?=
 =?utf-8?B?UFdzbTZMdEs0VjYzekYyV1BsVWt6b05iaWo4VHdzVVMybmJZY2FTMlZkbG5O?=
 =?utf-8?B?Q1N2Y2JjSVhFZmhGTUNXTFZMY0o5aHAyZHNGZlBCRnlleGkvNkJPV2dUam5y?=
 =?utf-8?B?Z2NtdGlrc085dmdGblNJeSsvSW91ZnlJdkhsUkVLcUtDNVJuZFJoN2NqU1o1?=
 =?utf-8?B?R0RMNzNVdFMzVDRZenlQQUF0U0UzSGNmZnlrU1dUZURVcjRXNlUySFNtSHZM?=
 =?utf-8?B?cStSR2kyeSs0dUFPNWFQeERHTEZyYkpydWgzSzBxWk5hR04zVVdwYkFxR0Fa?=
 =?utf-8?B?TlFZUWlSMXE2UHJHQWM4Q0Q0NjMyeGV5ZzFWOFZIdis0Z0VnNWlRREdhNkZH?=
 =?utf-8?B?Q25JWjJ4TTZpcDYxQXZvc3ZGVFR0eGJyaUdwOEpVaUt1WEpwVU9XYzhDSUVT?=
 =?utf-8?B?Z01ZOURhVXltVlpHbTRhSFFldGhyREx5TE5sU2ZYajA3RDJoRTdGam9IdnVi?=
 =?utf-8?B?eXZoenhwZnB2VDlkM1Y1TE8rdStxOFlna2FVbTV2MjVSRVJ6V3FRVDk5TXNR?=
 =?utf-8?B?d2V5SHRHM3FJUWczcDQyNkRUMjY3ZStjb2NQcWJYY0EvMXd5aXkvOUhQYVR6?=
 =?utf-8?B?SlEzNS9yWUZhQnhSaG1yUE03dHQ3OElCWWs2Y3UxY21pLzEyeWhYRi94T2d0?=
 =?utf-8?B?SE5lNlMyYW9MMnFEVFgvaW5tVy9sVzNmcGhZdUZ2aTVTTHRQLzNVUE1RWis0?=
 =?utf-8?B?NlF0WUJyay9FU3pndDV2WDVFQWM3TGw5c1F1N1V6QUpESWhVSlhyNG93WWZY?=
 =?utf-8?B?K3dYY1RPZTNVQVBzVVM3SkpCQllJOGFMYUJaK1ZuVTcwVzhmRzBXeFkzcks1?=
 =?utf-8?B?TDFoZWhjb0JrZldkQ1JDS2ZFS2dHM0pYWlRiRzNuU3VJM0xHV3BIRm9TQnN4?=
 =?utf-8?B?dm5Jd2lsOExnSngraVJDYWczdUV1TStvU2MzaldvUVAraFlSOXBrTng3dVlD?=
 =?utf-8?B?dDdCVnNUOVJSdk12WUd2YlhlemxWYlZTdnZudm45OWdZK291Z28wR0QxTkdG?=
 =?utf-8?B?MFV2ZVVlaUtmQzE5S3lvank3N2NLbEt6ZllYVXQ3K2dicE9QdjFOaTdrTWM5?=
 =?utf-8?Q?n0wR0FQKZJONLO/ZkrQXcBXj1C9Ur4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVTbEdKQXhFeTJ0RkNYTTF3WHlxZW02TGxhUmNtdDFWOE5rNWhCK0Z6ZHAw?=
 =?utf-8?B?eHlpb0FxVEpzTVduOFJIM0dmb1pRdzlBbHo5V1IwdTMvMWVjK2EyclcxWmtL?=
 =?utf-8?B?dWFKS3drK1A1YUJLSURBRW5DWWtSL0dXbExBSDN1MzE4OEhkWmVIam94dG1O?=
 =?utf-8?B?VUdDTWpldnJSL0dsWmdQWmMzTEV3QytDTU1CZ0orS0FGdkhzRGhCQU03OFZO?=
 =?utf-8?B?aDFqbStWTk0wZjNkeFJ6bUxMYi92VE93RE9VbGcwT0J3RXUrVXZSU1laR2ly?=
 =?utf-8?B?YytjMWhBTmh6b1BpWjQ3OEtuM1VtUFFwMjUwZFF3aWlWME16VzBiUjRLcCt5?=
 =?utf-8?B?Z1dNSUdyTUwzWC93Sjg2RzlIMmprWmZ2OVgyWS9Kem5lQzRZVGFKbFFJZWZC?=
 =?utf-8?B?b1pscTgyR0pqOVhTZWJTVXhvZlhYSWxTZEtrYWJWaDlrb2czTjIxNFJPRkpM?=
 =?utf-8?B?SDVjMUo3VSszbXZhU3pwc2JTZUdxNk04VmdhcU9xZE8zdysrRStLQWFzM242?=
 =?utf-8?B?Z0trT1ZOeE5HZjVsNnlBRk1nRGM4czRtdWdXdmNodVZNa0dzaS9aMzJ0N3BP?=
 =?utf-8?B?Z0E3a3hkbGFBUzRneWNCOFBUSXFlWnRoYmZvVmZ5dXQ2Qmp2UjJZTHZhZmV5?=
 =?utf-8?B?cFJwK2hEejBTa0Z6b2g1aHM5ZmYxeWM2TTVwMWlUb05jc3BTRVI2RHNqY0ZQ?=
 =?utf-8?B?M2JSdWJXbFJHUVZkTkRzR0l3dndOZDVNdEs4aVNpYWlNZW03UHRYc29vajVl?=
 =?utf-8?B?MHVZa0F4UzJKZm81ZXFPUTJqOWc4OFZCWTgzdDNySVFVeUNoMXVzWjlBNG9B?=
 =?utf-8?B?OVZMMEJyaC9NdnFyOWtaclZOWnJSZkErOGdBUzIyZmU5UjBNQWduUVZpUHZa?=
 =?utf-8?B?Mk5kbGQwYW9wcUJ6TEV6bmM1QjBybnQyUldmN0ZWbUd4NXFtZ2lLNnEzblla?=
 =?utf-8?B?bWFUSFV2MkpIdlZHd0pPY3R5QjFEOUlmR200em16a2llRDMvUm4zQnpWdE1W?=
 =?utf-8?B?UU1qS01uNjc0VDZFRGYvdUtNUWZtZkZCTzRuSkFGZExraXZUQ0xTSFh3R1pR?=
 =?utf-8?B?MkxGaWVtMHJ0eFVaNk1Yay9ZNkZpNjB6enNSSzZrQjBKVThneG9qSFFqNzA0?=
 =?utf-8?B?Nmx4VWlzRVRia1d4eVRRM0JsUDFOUit0czZGT01obmYvN2Y1ZFphZkdDK3hX?=
 =?utf-8?B?alJFbmxpc3l2b3R5VnNxQlg0Wk5FLy9GM0IxQ211SFFkSmZoUmlPUFQyOHNp?=
 =?utf-8?B?NDl2UHduTUhDczF6STR6VjJiWkJoZ1F5QnBVcDNWQjY5aUwyc1lEMCs5b0dZ?=
 =?utf-8?B?RmZuMGRFR29iS0VyczZzQjJxNkZ5bkRBZnQ1NCs5d2xIa3JxSURrMXF5bmJn?=
 =?utf-8?B?RDI4SXhpZ2FHTjV5UkNYMW0vK0djWm9nOXRjUFhDVDE4djNDdS9sd0FiUGtX?=
 =?utf-8?B?QzY3ZXNBdjZsd0IxRmp1QUVSL0ltTnZ1YTN4WnhjTklaVE9xYko4Qk5QUGEw?=
 =?utf-8?B?b0ZYSG1JY253VllWSkd1emhOMi82WlVuY2ZBTy9OeElDM3JkcDg1K2R3M3I3?=
 =?utf-8?B?Q1RJZnFjUkZYZUMvbVpJZkNHUXNPeGl0N3Y1MEdiMHNKakVFM0NqMlNRaUkv?=
 =?utf-8?B?SUkzcS9Ua2ovNVVsV2xialNPeFV6TU8yQUw1VUJ4WFBwekpOVzExU1F0MEZz?=
 =?utf-8?B?b3Z3ZEM4eFZQRVVxNFdZUGtMZnlyU3oxaVM0VjFuN3hlOFRrSGxqQnNBZVox?=
 =?utf-8?B?VjgvelpLOTVROGd3M2VlUWN5UkRlai9kYnRWVGQ1OXpJTXlCeHZKNDltWGcx?=
 =?utf-8?B?V0l3cTgzME9CQVZXVmRoWlI1WnFKMVYyMTd4SE1QWkZlU3JCWmVueExXSUxU?=
 =?utf-8?B?cTdNQzEvS1JFazY5Sk5scERCNWNMOEUwa3puR1lFRDBFS0pBUENYd3EyT1lz?=
 =?utf-8?B?aFBSKytoMnRVNlFyYlI0MHJMdDI3QnhmVm1SVGp1TDNKR0dTVUpUYmY5QUhH?=
 =?utf-8?B?ekY3YjB1eS90WlRNVlFuN0tWWENDdFpoMFYvZ0xSMmRMYmpibmo4SE43NmVM?=
 =?utf-8?B?bVl0UVp0S0t3NkFOOVdtMjdBVWtJNVc4SU9Nb25LRHJQZEJnMXh0WnVVODFK?=
 =?utf-8?B?WFJCcWcwemYxaDlFWFZMaUdBY1dNWHk2a25vQVcxQklEalBFdUtrdVo4Nml5?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71232807-e726-4898-3b9d-08de27fd887d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:25:00.6557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SswwvN4CwjBVrd+FIH/za239jEeZmg43AHobNLG3xNwo8T1bM3gyAdujajjC+z0LNerSYJElB/R2pdX2p7Xgnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_222516_039311_C1D38FA9 
X-CRM114-Status: GOOD (  15.24  )
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

RGVhciBLdWJhLAoKVGhhbmtzIGZvciB5b3VyIGVmZm9ydHMuCgpPbiAxMS8xNi8yNSAyOjQ3IFBN
LCBLdWJhIFN6Y3pvZHJ6ecWEc2tpIHdyb3RlOgo+IFNvbWUgQWxsd2lubmVyIGNoaXBzIChub3Rh
Ymx5IHRoZSBEMXMvVDExMyBhbmQgdGhlIEExMDApIGhhdmUgYSAiY29tYm8KPiBNSVBJIERTSSBE
LVBIWSIgd2hpY2ggaXMgcmVxdWlyZWQgd2hlbiB1c2luZyBzaW5nbGUtbGluayBMVkRTMC4KPiAK
PiBJbiB0aGlzIG1vZGUsIHRoZSBEU0kgcGVyaXBoZXJhbCBpcyBub3QgdXNlZCBhbmQgdGhlIFBI
WSBpcyBub3QKPiBjb25maWd1cmVkIGZvciBEU0kuIEluc3RlYWQsIHRoZSBDT01CT19QSFlfUkVH
eCByZWdpc3RlcnMgYXJlIHNldCB0bwo+IGVuYWJsZSBMVkRTIG9wZXJhdGlvbi4KPiAKPiBFbmFi
bGUgdGhlIFBIWSBkcml2ZXIgdG8gd29yayBpbiBMVkRTIG1vZGUgb24gY2hpcHMgd2l0aCBhIGNv
bWJvIEQtUEhZLgo+IAo+IEFsc28gY2hhbmdlIHRoZSBTVU41MElfQ09NQk9fUEhZX1JFRzEgbWFj
cm8gbmFtZXMgdG8gcmVmbGVjdCB0aGUgY29ycmVjdAo+IHJlZ2lzdGVyIG5hbWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogS3ViYSBTemN6b2RyennFhHNraSA8a3ViYUBzemN6b2Ryenluc2tpLnBsPgo+
IC0tLQo+ICBkcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGktZHBoeS5jIHwgNzAg
KysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKSSB0cmllZCBpbnRlZ3JhdGluZyB5b3VyIGNoYW5nZXMgaW4gQTEz
MyBkaXNwbGF5IHBpcGVsaW5lIGFuZCBJIGNvdWxkbid0IGdldCB0aGUgTFZEUyB3b3JraW5nLgpB
bSBzdGlsbCBuYXJyb3dpbmcgZG93biB3aGF0IGlzIG1pc3NpbmcgaW4geW91ciBwYXRjaC4gRHJp
dmVyIHJlZ2lzdHJhdGlvbiBpcyBzdWNjZXNzIGFuZCBJCmNhbiBzZWUgL2Rldi9mYjAgYXMgd2Vs
bC4gQnV0IG5vdGhpbmcgb24gdGhlIGRpc3BsYXkgaXRzZWxmLgoKQnV0IHdpdGggYmVsb3cgY2hh
bmdlcyBmcm9tIG15IHBhdGNoLAoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L2FsbHdpbm5lci9w
aHktc3VuNmktbWlwaS1kcGh5LmMgYi9kcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1p
cGktZHBoeS5jCmluZGV4IDM2ZWFiOTUyNzFiMi4uZDE2NGIyZWE1ZGZkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGktZHBoeS5jCisrKyBiL2RyaXZlcnMv
cGh5L2FsbHdpbm5lci9waHktc3VuNmktbWlwaS1kcGh5LmMKQEAgLTMxNCwxMyArMzE0LDExIEBA
IHN0YXRpYyB2b2lkIHN1bjUwaV9hMTAwX21pcGlfZHBoeV90eF9wb3dlcl9vbihzdHJ1Y3Qgc3Vu
NmlfZHBoeSAqZHBoeSkKICAgICAgICAvKiBEaXNhYmxlIHNpZ21hLWRlbHRhIG1vZHVsYXRpb24u
ICovCiAgICAgICAgcmVnbWFwX3dyaXRlKGRwaHktPnJlZ3MsIFNVTjUwSV9EUEhZX1BMTF9SRUcy
LCAwKTsKIAotICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhkcGh5LT5yZWdzLCBTVU42SV9EUEhZ
X0FOQTRfUkVHLAotICAgICAgICAgICAgICAgICAgICAgICAgICBTVU42SV9EUEhZX0FOQTRfUkVH
X0VOX01JUEksCi0gICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjZJX0RQSFlfQU5BNF9SRUdf
RU5fTUlQSSk7Ci0KICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoZHBoeS0+cmVncywgU1VONTBJ
X0NPTUJPX1BIWV9SRUcwLAorICAgICAgICAgICAgICAgICAgICAgICAgICBTVU41MElfQ09NQk9f
UEhZX1JFRzBfRU5fTFZEUyB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjUwSV9DT01C
T19QSFlfUkVHMF9FTl9NSVBJIHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgU1VONTBJX0NP
TUJPX1BIWV9SRUcwX0VOX0NPTUJPTERPLAorICAgICAgICAgICAgICAgICAgICAgICAgICBTVU41
MElfQ09NQk9fUEhZX1JFRzBfRU5fTFZEUyB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgIFNV
TjUwSV9DT01CT19QSFlfUkVHMF9FTl9NSVBJIHwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
U1VONTBJX0NPTUJPX1BIWV9SRUcwX0VOX0NPTUJPTERPKTsKIApAQCAtNTI4LDYgKzUyNiwyMiBA
QCBzdGF0aWMgaW50IHN1bjZpX2RwaHlfZXhpdChzdHJ1Y3QgcGh5ICpwaHkpCiAgICAgICAgcmV0
dXJuIDA7CiB9CgpMVkRTIHdvcmtzIGZpbmUuCgpDb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHRoZSBk
aWZmIG9mIHlvdXIgZHRzIC8gZHRzaT8KClRoYW5rcywKUGFydGhpYmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
