Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE09E8784B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFxf0rXbEPq9tkbyiVZCMbZKnwJMURqKkOy/oQyQcsg=; b=2ds1v2xJTcft+/
	RpmrJk/LJupOXoaVWxboBXmharw1ljORLAmInHHz20e1QJyWLE9Ybah7KNbRULrkFbq6thxAlxH4M
	v0kP8iOiMRJUmJ096L0uoSRbnwMmfNISQAL23f2x18PPeJEeiem2VK1Ecmd6L181aIyyPvL9fEGrj
	KnP6rGHtRCauZqDaE1OvQ2ixg/J2GmNGS7RRi1EOcbu2xwy8VKM8SizMQIxsCv3J7zPLTHW1sLd2Z
	/s8zHgQMt36NjPPSAub6mn7zKCEcxZilQ1RSQ9cO8HNxDqww8wiZn/K42k3fiVOS24eqwx/WlJ2wY
	lYkU068/L6CLhug35yYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJkp-0000000706N-3pmW;
	Tue, 03 Feb 2026 16:59:55 +0000
Received: from mail-uksouthazon11022112.outbound.protection.outlook.com ([52.101.96.112] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJkn-0000000705w-0BKQ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 16:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9MnT5Uzdca96uRz2jqZAtA6m17HvRNVyOyGPgpayqBZBGFxZ7IlmzstVL4CNUcJs7M9MEWnpCX1KMsyfF3/Oq5oBETta9i+9X1yV8xKm6G9tzISVULxa6j2X9IhLqGr3oxsPriZLzwvDqQpLZ2CgJgHnrHU3c+mXwIUrVwGz30guyHX0d5IBGKhw4FswTD42x0ZgCLB2SYoD9s5i8yROmSk2zethHE8BPhA2FGvPtDIV9oqN9PXB8HcmlxyXQ+qRBWyJ+V5wV8Qwa4dyrl8S2UYGhwbxVZmhAth4za4XQwBbXuKHQvxeuRddYg/BoIkJWQu6CWTum2NUeKrLj9wQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wbxZZj0vcR+rkwbTJzBddLo0byJ1QOYAakrB4ZFt5w=;
 b=ASwOhsw79IxwBf2+Rq/0HNiVmOZgstaub14kztDYubs9vkjrN3KLu6LhqDMXm8UVgwZIIt72Hym1OaOYPnXzUkoOCdOX+SJLIfZ4fzlZdpe5K+MAo4FE4CiNCQPzFivXYp6/7Dof7Jx43c6aDfHg5+cCYhK2qMKvcm8G8SsRtuHG/bCYUF2/llSlIedmOdfskL7GlaxmoxiIWzuWo5RZiF/GSXbelsL1Gf+lEMCg15XYSt8xptH9/il7qkzxn83Kbf9RM8Od65WWmtdhr2WFEmpPPHNSbpeadxpKsJ6KYyLiI6ryLGOgbh+tuQ25sFza28mrHKux0VWM1p+hgerB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wbxZZj0vcR+rkwbTJzBddLo0byJ1QOYAakrB4ZFt5w=;
 b=ikm20+dMkKqr8tufB7j8j1N7+IIt4aQN7Xlz5ZSDvV7aOsNbxvkvPWugTgRKd79M6G+skDl6w/X1DgMMRRu7c+bFwf79yRBGE//gP1efXEBw8QU9f9vI3xSyo5Pp5JvYKAd9jkpZQEhTr73absEfzQrEtyNWj6j9zY/ongmtxhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7522.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:59:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:59:49 +0000
Date: Tue, 03 Feb 2026 16:59:48 +0000
Message-Id: <DG5HJPIYMS7B.152WPGG9MZZJ5@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>,
 "Guo Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com> <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <20260203150855.77c93e22@fedora>
 <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
In-Reply-To: <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: ba751822-5024-481b-8184-08de6345a3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejZPN3ZVaEpJZFZqazNNcG85VjRLSHNSL0lBV3JBUVNnaUxGN1pWZkVjV0xP?=
 =?utf-8?B?djVYbzhqdXRzcDArYTVudDBKV2R3TXU0Y2ozV1R1VkpQRGlSQlJlTzZXSlRa?=
 =?utf-8?B?ZFY3NzdqVlViWFFqZ0I1ZGk4MkVMRnhYZ1ZYYzMrZWtQZy9XS3V1UnBOclVt?=
 =?utf-8?B?Q1BpNkhTSkUvaG5PejB0ektkTmVJQStabGMrRGJiSjdrTXFXdHJHcGFTbkdL?=
 =?utf-8?B?Tm9tL0Jqakl6WEp4alkwRHJpN0tKMGRWV1NYVDZCZTlLeElOUnQyY0tJMjh5?=
 =?utf-8?B?NzFKT2ZMYnFkamVzZGdKT1hPZklicUtmQ0xaa1g2VWRrQ2cwdHkwZHBwK01C?=
 =?utf-8?B?TDVUNW1vOXBMckVTQWR4ZFpvNVlwbEZVaE5PWXFwaUpMdVYwZnpOUTdXUmxN?=
 =?utf-8?B?eEhRbWpyYnlJNGFJTWErMHY4YU5Pa2NmdTFTOEdDblZRUHhlQm9heTB3b250?=
 =?utf-8?B?d05rdjJla3lvLzNqL0JJZmtXb1dhMkwwWUZDN3h0RFpQWnlhVm9jVzhqc0Jv?=
 =?utf-8?B?N0dZbm9HaTJiSmU2QW9aQWNDYTFveFdwWEVjR293SnlySENxdWhJVVUxZWtD?=
 =?utf-8?B?M05FdVErdTJlUllnRXFqbUZ4NTBOWVFMcFJ5RjlhZi9JTlRSOExGay9xaENU?=
 =?utf-8?B?bk5SWkIxSXE5ZkZWa1NoU0FVTUZkTG1CUnZabzAvL1N6YTZiY3hNWDd5M3Ni?=
 =?utf-8?B?UzhuZGJ6a0hJTkRHOFJOUXFESXVsWWJpZjhjdlAybS9HeXBJNldhdC9wOG00?=
 =?utf-8?B?SGhTUjgxdWVFdHlTVVhXSGx1RWNRSU5PcnZTN1h2YU1EalovcHAyUUJEQkF5?=
 =?utf-8?B?Z1ZyZDFvcWVMSGJlSEk4dzN0OE95Z1MzOHFsMldYSTd6L3ZJMFZ5WWtjQ3hz?=
 =?utf-8?B?NmVieTFaZ1ZzSW94UlZPVk9CYUNLTHEya1hBemFkRFlwVXl1SkVyaXN6RVZo?=
 =?utf-8?B?UVUyTnR2bzBJY0tNTUVVci90THlndFU5MHZ2S2ZnUWI2UFF1bU51NmY1Z2JU?=
 =?utf-8?B?NlROWG11VGRvY1RYWVozb0dIcjhpTWp6S0FIN08xODJGQ1J3TGZIZHZKRFlz?=
 =?utf-8?B?MldoYWdnOGI3Q1p6c0RuSEplMDU5TVArVjM1WUtDZk1ldVlUQVFoakZYdHB5?=
 =?utf-8?B?aGQxekxpVUdxTUEwTzF1WGMzRk1UbDRSMzN3MTNaVHVuTkNwcVlYM3Y4ZW0w?=
 =?utf-8?B?YU1sb2RPTDJoYy92aFJ2d1Zic2V4dGxwSGdLeDRaRk1vblkxTlJ3WGlCU0xv?=
 =?utf-8?B?c0VlZ1MwUDBuaVBJaVlYWVd0T0J0VVJ3Vm1Wc0FGdmZIems3WDNGR0M2Ri95?=
 =?utf-8?B?S1NxVEQrNlhaUU04Z0s4MjBmVFhrQy8zZUI1QzFXRkFTUkZ5L1hkQWFPb0R6?=
 =?utf-8?B?QXNwaW0rM1p4eWlxZmEzOVRsb29xd0lVMUpadDhMSlJ3WUtrNTVKNTFmekZO?=
 =?utf-8?B?TFlYZG1aR0FYbWJCbEdZcnRldjJyeWwrVTF5ME5FTFZJMjJhU3F3M0M5cDdK?=
 =?utf-8?B?Wm9mcW1GVDJBMnI2VldvVnFUTVo3V09FMGJSMS9ja2JKRTFpdWpqeS9iWWli?=
 =?utf-8?B?UXl3NFpjeGlTWnpMWkpDL056eFhNMzJxcklONDZMenRPam43VEpVL3NRMTJC?=
 =?utf-8?B?bVBEeUdNNDhxeTlEeTYxOHBVdkU2SDRyeENNUE1US0xFUlhNRGVSNXIydlRq?=
 =?utf-8?B?TFdZOWduNjhtZGs3Yy9PTmtvUDRGWjJWWFl4RHFnblZubG84dlphN2c4Si8x?=
 =?utf-8?B?TDkvK0t4cjROTHdHT1dMRmJac2xtc0pLNkxvMDFFYzM2RWVUeXZ1TWtNZHFz?=
 =?utf-8?B?WHZqSlNSR2NWZ1dlNTA1U2FaRk9WRkNKZG1GNXNIWTY1WFY1ZW1Nc29adEhO?=
 =?utf-8?B?ODg3VjlqaU5Cb1ZrYkJ1MWtoRy9UNGFKRE03N3ozOVhmRG5JQ0s0S2hzWElK?=
 =?utf-8?B?YVJHZFhMUllXYUpEMis5UmdVZ0lmeU5hZHRRNVAzK05JWWtrek9zcFF4QXV3?=
 =?utf-8?B?ako0czFTUVJLZkVudnppYXZUejZRZVBjRXA2UXNQUjVQVGFKamJJMTR4THpv?=
 =?utf-8?B?YlVNNFpva0lCVGRScEo2THY1N3pyQTNjU09ONTFUd1JUUGh2Wm1sdFFzdlVS?=
 =?utf-8?Q?yAs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlR5Vzh6Qlc5bGUycFdod1Zab2R0ZnRkSE1vUlpzQm9JK2RycWhkdGxiV1l3?=
 =?utf-8?B?dnRoeEZvOFdRYjAwUUloa2tWMnZETUlyZEltaDBMb2NKM05vL3ArZXF0SlRJ?=
 =?utf-8?B?V01PYlhYNGJDQTVuSktKU2dkQlFKNjBNc3AzNFlCa2w4S25YaHB3TktjbDhj?=
 =?utf-8?B?ODEyV0E3QkRIOHhyOTl4ejVqZGRxdkw2QXBReWNzWlJFaUp3aGxla0pBdEtG?=
 =?utf-8?B?RkN2OEpsTStrcDZmd3RtVXlvbHJiZjI0Nm5CWTBEbkJJTU5PK0FoUFhIYjNn?=
 =?utf-8?B?ZFg2L3B0YitaOWtqWDBBWEZMMjRyUGliNDNGeUFBazBpZktrWGhFRzN6bHZ1?=
 =?utf-8?B?QUFPVHdEQUNOWklIVzB1MjJWclBHa2dHQ21MdjZxUkcvZ0VsbThVcVFtVjMw?=
 =?utf-8?B?K3NIWng5MWJFNTNiUjljS1paQ0tRb0JTQTBZM1NEWHpjbmFJLzRzaFpabWJw?=
 =?utf-8?B?RE13N1VZVWZHbnV5L2Q0cHhtLy9qQXA5NFYvZW12TVdCT3pWMldGMmVYQmdJ?=
 =?utf-8?B?UkZwZlp0cWxEd0RhMWVjd2hSQno0YjlFRjE0TFR4cENiWFc4bVVLTWNlTHBp?=
 =?utf-8?B?YWdWTFpyaHRzdHBnKy8xcFRLY3J2YmZHNWZydkd4TG9vcWttdUgyQVJsUjVm?=
 =?utf-8?B?eTk3QURyVXpCOFVXYm1XdWI2aEkwQStpMUxBWkRhMDZuSWZGK1JYSGdvcTZV?=
 =?utf-8?B?bFp6OG82VDJQS2llaDE0L1NETEljRXpkYyswNUp4UWRKb3BxcU0xSm5tWXh0?=
 =?utf-8?B?UFc1cFZnMDFjVlVtSjRoVFpVU2Rma2NBMGpiWGsvWUV1SUZlU291YnltUTND?=
 =?utf-8?B?YnVTckx4SW1qTU1VNFVOdzNCSDltcy9KdGhscllYTllGYWhMbHIxd1JXUTM1?=
 =?utf-8?B?MlkvR3kvSjZXV3FRVjNySElFTzRSY1VCbTJ0TmkyT3MyVmxWSDYwWGQ3bytQ?=
 =?utf-8?B?c3ZTQ2NDWXNxWlp2U3M3bklYZE14ZmNkdjIvYkdXNVJVdUdUR25ySjdJRkpk?=
 =?utf-8?B?T2pYdWxmdEI2RzdaZmVwbXhEZDY2Y0FmUVdRd0hzWjQrZ0xRVzFJRFJEYmhz?=
 =?utf-8?B?cS9iRjZnUStnOUVvZkNEMGNzVVRYSU1CbjFoTUFZa1FhZjJVU2JjUjhidjlo?=
 =?utf-8?B?ZkNWVjVPRmllaEVUNjRWNmJrdUlsWUpxRjhaL0ZFWWRjUVVlK05yNDBoNTJx?=
 =?utf-8?B?akdEdFZoZysybFZZODJ1UTZSRS9wYUhieFQwcXM1UjUzYUpXK1haNVRzZ3pZ?=
 =?utf-8?B?cEYycXh4cWQxTGRFVGt2YXFWTDhiei90Ni8rUzV4bHJoUEZyMFJGYmtXTjVs?=
 =?utf-8?B?dnc2SmZLR2NYMEpEWjNlQk9HN2tteUdETXFKT2g4Ky85MnQzaVRBWU10cTYv?=
 =?utf-8?B?UFpCbkJ3TG1iRUVDN1BmUlg2NTFZMTFZUFl1aGR2NHlVd09jSW1jTmtOQ2lU?=
 =?utf-8?B?VTZtZXo2K0lRSTBIQ3VKWjRmWnlQZ2cvU2NDRUpFQS9aR2dzSzVVS3Y0NFMy?=
 =?utf-8?B?ekxkcGJXUU50YmlDM21xSlEzcWx3N05oWitpYTJZT3B2bko5aXZvSVpIdEpO?=
 =?utf-8?B?dldVWVhPekV1VGlCQmxsTWswbnlHM3JTT3JiT2JJZVJoV1FVWVUycXZVcGtm?=
 =?utf-8?B?WGc1OVcwZ1lycjhLOTNQZXMrSklLUnk2R0Z5Y0pyN05MTktlQU5VdFlHT2kx?=
 =?utf-8?B?THlLSFo4L2sreFEyME96c2ZhTnNKOFNwRmFIamRITHZ4T2hXTW9HdHJNbWpu?=
 =?utf-8?B?TmlHNytMSXJrNW9sa0EvSGg0UDBxemNMRkVpb1BKQTB0WUU3ODBXTG9hMWgy?=
 =?utf-8?B?d3NjbzU3MC9nbWttL0I5S1VnYjd3cXBpbjZxVHlMSzc2NW5hdktkR3B4WDJS?=
 =?utf-8?B?SXQ0L0dzOElCZ0s0RThZR3BlZjdReTRhdFVlMTc0MjhxanUxOE1RU0k1WmR4?=
 =?utf-8?B?ODhScFArNTRsRi9wWk9YYWpVZVFucXVBdTZLVmRGREJMM1ZjakJyR1Y4Zk1D?=
 =?utf-8?B?UVJBd0s4Z0NmSXJkT01WeTkrV3Mvb1ZBYytwdjdHR1pSbHFQQ0U2L2Y1cHFT?=
 =?utf-8?B?eE1IQmhXLzE3NGduaGdLR2hrZVM2SDNvWW40TlJEdjhBNFZpa0NiWkJITXJp?=
 =?utf-8?B?SUZod2JOMGlybndZOFA3aEpyR2taYUtxc0E1WWFJdFFDUGtTN3Y0UkhlRjND?=
 =?utf-8?B?WU5SMURzOU12cGd5K0orSjBmK3JZZXJ4bkdzU0laL0ZMRlYrRHVXOUtQRGhB?=
 =?utf-8?B?V0ZHNzRoaGFRcXgvRFF6RW5SQ1FvTUJCUlVydndxSW9uRkRlS28xbDN0OUJN?=
 =?utf-8?B?eksvWWJxNlNOOHIyeHh1eU1uYnNkMW1peEFoYzRzOWVJenI4dTZOdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba751822-5024-481b-8184-08de6345a3f7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:59:48.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h50KXbK2Mj9FMsX4YHpSMGWjJtlqpvieFUUUJ99c0L+ocIPL90sQkUgeJsC+auMAv89jdlSMbgtSLOGY3NFwCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085953_082432_E5183288 
X-CRM114-Status: GOOD (  17.78  )
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

T24gVHVlIEZlYiAzLCAyMDI2IGF0IDQ6MjggUE0gR01ULCBEYW5pZWwgQWxtZWlkYSB3cm90ZToK
PiA8c25pcD4KPgo+Pj4gCj4+PiBUaGUgcHJvYmxlbSB3aXRoIHdoYXQgeW91IGhhdmUgc3VnZ2Vz
dGVkIGlzIHRoYXQgdGhlIHByZXZpb3VzIHN0YXRlIGlzIG5vdAo+Pj4gY29uc3VtZWQgaWYgeW91
IGNhbiBjbG9uZSBpdCwgYW5kIGNvbnN1bWluZyB0aGUgcHJldmlvdXMgc3RhdGUgaXMgYSBwcmV0
dHkga2V5Cj4+PiBlbGVtZW50IGluIGVuc3VyaW5nIHlvdSBjYW5ub3QgbWlzdXNlIGl0LiBGb3Ig
ZXhhbXBsZSwgaGVyZToKPj4+IAo+Pj4gbGV0IGVuYWJsZWRfY2xrID0gcHJlcGFyZWRfY2xrLmNs
b25lKCkuZW5hYmxlKCk/Owo+Pj4gLy8gZG8gc3R1ZmYKPj4+IC8vIGVuYWJsZWRfY2xrIGdvZXMg
b3V0IG9mIHNjb3BlIGFuZCByZWxlYXNlcyB0aGUgZW5hYmxlCj4+PiAvLyByZWYgaXQgaGFkCj4+
PiAKPj4+IHByZXBhcmVkX2NsayBpcyBzdGlsbCBhbGl2ZS4KPj4gCj4+IFRoYXQgd2FzIGludGVu
dGlvbmFsIGluIHRoaXMgZXhhbXBsZS4gVGhpbmsgYWJvdXQgYSBwcmVwYXJlZF9jbGsgdGhhdCdz
Cj4+IHN0b3JlZCBpbiBzb21lIGRyaXZlci1pbnRlcm5hbCBvYmplY3QsIGJlY2F1c2UgeW91IHdh
bnQgdG8ga2VlcCB0aGUgY2xrCj4+IHByZXBhcmVkIGF0IGFsbCB0aW1lcyBiZXR3ZWVuIHRoZSBw
cm9iZSgpIGFuZCB1bmJpbmQoKS4gVGhlbiB5b3UgaGF2ZQo+PiBzb21lIHNlY3Rpb25zIHdoZXJl
IHlvdSB3YW50IHRvIGJyaWVmbHkgZW5hYmxlIHRoZSBjbGsgdG8gYWNjZXNzCj4+IHJlZ2lzdGVy
cywgYW5kIGltbWVkaWF0ZWx5IGRpc2FibGUgaXQgd2hlbiB5b3UncmUgZG9uZS4gVGhlIGNsb25l
KCkKPj4gaGVyZSBndWFyYW50ZWVzIHRoYXQgdGhlIGluaXRpYWwgcHJlcGFyZWRfY2xrIHN0YXlz
IHZhbGlkLgo+PiAKPj4gSWYgeW91IHdlcmUgdG8gZGlzYWJsZSwgdW5wcmVwYXJlIGFuZCBwdXQg
dGhlIGNsayB3aGVuIGVuYWJsZWRfY2xrIGdvZXMKPj4gb3V0IG9mIHNjb3BlLCB5b3UnZCBnbwo+
Cj4+IAo+PiBsZXQgZW5hYmxlZF9jbGsgPSBwcmVwYXJlZF9jbGsuZW5hYmxlKCk/Owo+PiAKPj4g
YW5kIHRoYXQgd291bGQgc3RpbGwgd29yaywgaXQncyBqdXN0IG5vdCB0aGUgc2FtZSB1c2UtY2Fz
ZS4KPj4gCj4KPiBPaywgbGV04oCZcyBoYXZlIGNsb25lKCkgdGhlbi4KPgo+Cj4+PiBOb3csIHRo
aXMgbWF5IG5vdCBiZSB0aGUgZW5kIG9mIHRoZSB3b3JsZCBpbiB0aGlzCj4+PiBwYXJ0aWN1bGFy
IGNhc2UsIGJ1dCBmb3IgQVBJIGNvbnNpc3RlbmN5LCBJJ2Qgc2F5IHdlIHNob3VsZCBwcm9iYWJs
eSBhdm9pZCB0aGlzCj4+PiBiZWhhdmlvci4KPj4+IAo+Pj4gSSBzZWUgdGhhdCBBbGljZSBzdWdn
ZXN0ZWQgYSBjbG9zdXJlIGFwcHJvYWNoLiBJTUhPLCB3ZSBzaG91bGQgdXNlIHRoYXQKPj4+IGlu
c3RlYWQuCj4+IAo+PiBUaGUgY2xvc3VyZSwgd2hpbGUgYmVpbmcgdXNlZnVsIGZvciB0aGUgYWJv
dmUgbG9jYWwgY2xrLWVuYWJsZW1lbnQKPj4gZXhhbXBsZSwgZG9lc24ndCBhbGxvdyBmb3IgcGFz
c2luZyBzb21lIENsazxFbmFibGVkPiBndWFyZCBhcm91bmQsIGxpa2UKPj4geW91IHdvdWxkIGRv
IHdpdGggYSBsb2NrIEd1YXJkLCBhbmQgSSBiZWxpZXZlIHRoYXQncyBhIHVzZWZ1bCB0aGluZyB0
bwo+PiBoYXZlLgo+Cj4KPiBXZHltPyBZb3XigJlkIHN0aWxsIGdldCBhICZDbGs8RW5hYmxlZD4g
dGhhdCB5b3UgY2FuIHBhc3MgYXJvdW5kLCBpLmUuOgo+Cj4gICAgc2VsZi5wcmVwYXJlZF9jbGsu
d2l0aF9lbmFibGVkKHxjbGs6ICZDbGs8RW5hYmxlZD4gfCB7Cj4gICAgICAgIC4uLiB1c2UgcmVn
aXN0ZXJzLCBwYXNzICZDbGs8RW5hYmxlZD4gYXMgbmVlZGVkCj4gICAgfSk7Cj4KPiBUaGlzIGlz
IG5vdyBub3QgYWJvdXQgY2xvbmUoKSB2cyBub3QgY2xvbmUoKSwgYnV0IG1vcmUgYWJvdXQgbGlt
aXRpbmcgdGhlIHNjb3BlIG9mIHRoZQo+IEVuYWJsZWQgc3RhdGUsIHdoaWNoIHdvdWxkIGNhdGVy
IHRvIHRoZSB1c2UtY2FzZSB5b3UgbWVudGlvbmVkIElJVUMuCgpJIHRoaW5rIGl0J3MgZmluZSB0
byBoYXZlIGFsbCBvZiB0aGVzZToKKiBgQ2xvbmVgIGltcGwKKiBgZW5hYmxlYCB3aGljaCBjb25z
dW1lcyBgQ2xrPFByZXBhcmVkPmAgYnkgdmFsdWUgYW5kIHNwaXQgb3V0IGBDbGs8RW5hYmxlZD5g
CiogYHdpdGhfZW5hYmxlZGAgdGhhdCBnaXZlcyBgJkNsazxFbmFibGVkPmAKClRoaXMgd2F5LCBp
ZiB5b3Ugb25seSB3YW50IHRvIGVuYWJsZSBpbiBzaG9ydCB0aW1lLCB5b3UgY2FuIGRvIGB3aXRo
X2VuYWJsZWRgLgpJZiB0aGUgY2xvc3VyZSBjYWxsYmFjayB3YW50cyB0byBrZWVwIGNsb2NrIGVu
YWJsZWQgZm9yIGxvbmdlciwgaXQgY2FuIGp1c3QgZG8KYC5jbG9uZSgpYCBpbnNpZGUgdGhlIGNs
b3N1cmUgYW5kIG9idGFpbiBhbiBvd25lZCBgQ2xrPEVuYWJsZWQ+YC4KCklmIHRoZSB1c2VyIGp1
c3QgaGF2ZSBhIHJlZmVyZW5jZSBhbmQgd2FudCB0byBlbmFibGUgdGhlIGNhbGxiYWNrIHRoZXkg
Y2FuIGRvCmBwcmVwYXJlZF9jbGsuY2xvbmUoKS5lbmFibGUoKWAgd2hpY2ggZ2l2ZXMgYW4gb3du
ZWQgYENsazxFbmFibGVkPmAuIFRob3VnaHRzPwoKQmVzdCwKR2FyeQoKPgo+IOKAlCBEYW5pZWwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
