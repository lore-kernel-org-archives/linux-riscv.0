Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99610E8782C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nap51AE1XfZBlOKJv9KWDZl1dIFC5IaDol1Ga0Dwx2s=; b=vhf/otSyh57D9T
	qNsVL9tDqUPmvjw0xzQP+RulVIT4wco+5KUzaV2rFbFw0CmBHJQs+HOC/LUlMcXiObgMVg/mMFvPn
	oSR5xPIq/BaHYvNjYOhhuYhIvTYI6uuuJide/LYyQGkPkzCtA8GIRUbAYCGJi/igQ9sxE07tozeYk
	xfBnA/LL0n5jKX/3VSsGTb/S9UPW5klA9fnDBDqktqg2J3fyIPfAhFz8wxq7vWaKdAmq/uvx2/93i
	u+HkXWsec89fQe/XREjuRC02LBrRYMy4BnrqDWfIDnPf9EyYj0kyfrkyhWOzoo8xUBm3BEfW/l+Hh
	nLuvsaCWCP4blN7xVKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGgb-00000006heR-0uHp;
	Tue, 03 Feb 2026 13:43:21 +0000
Received: from mail-uksouthazon11021079.outbound.protection.outlook.com ([52.101.95.79] helo=LO2P265CU024.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGgY-00000006hdb-09fR
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8poCbrAdGpdCxECOSffR4KUnny2CVw5NzmLqJWRMYzapjKWAG7lRc1Cbpc8EMFMWEf51SLBf/V8iRzXHRPS4ksHPDJ+rlxNJlHCtc3QEHcOs9ys+GoyN5uSyB9LiDp8yh8ixyhoECevj/bMXGL4KQjM8n+6NjloFE3zRUeMxlIVE+ioWy/lOo4pRcTC9cWoZYyvcfvQ1PBD7Z7WKQhoDChDHXgCACjPQIamOsDdaz+aLzhm2frM5LGZKkQyXqX+6ezPs3QlI4ZkU73grsrXPqRv2YV3hNaphhAc217gvl8VqtW+8ruhiE/Kf9ujJFsRHaWin+MJzk2R1rlVVCG+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktb4H7BQ3WXhZCXg2Dl0PdJVhKOKs/BJ+VRFL6mrv/E=;
 b=fh4QWPwSFO3tLtwIX556A1bEOZ9Eftefwoly4u3Er0W4ri1Y2OyGQfwVa0MmBBpmAtYAH3x3x/Qqk6rCK0F8eHZln0u1TbQ3DTsnJv/n6dtiiTrN5IXaZGw0pXjrYqCKerbxQJk5+1aqDrxf6NQVSSPG5OggaOxN9YP0zGeqDL/hTNXoib6R5n3lorXDTIfBsyQzb4mW+1LKABZcRhXGXHXEC6sqsSyiv1aoaI1ACzjoKteg3MarZmqBr9pEFr57FRiBkWSSl6TgCeBcQ9DgQhPzvsf+1USRl6Kv34D+/xZfeHGKKu+w0Q9+LXcAGgQaas2lr5u4QC6qyWKnmJ08CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktb4H7BQ3WXhZCXg2Dl0PdJVhKOKs/BJ+VRFL6mrv/E=;
 b=JTkWYpuxx/xyJnD3ml2rch0/s4Co/6rRzylSILvnbgpOTeNh0zKRcE0LA1flV1w6PSMepASVd+ZZ1BptgsOmbyWeqXPw2RNwU+1uFW7kXyLEHESepHv3F/1Ici9ZJJyDFNlBS8ZE0UIonRp64Dax4F91DGGRSidhZ3IgRkJ3BA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5477.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:284::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 13:43:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 13:43:11 +0000
Date: Tue, 03 Feb 2026 13:42:54 +0000
Message-Id: <DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>
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
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com> <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
In-Reply-To: <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
X-ClientProxiedBy: LO2P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::28) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3d743a-28a4-4ffe-445a-08de632a2c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2dRVkRmWGhzcFhIQzJRYXZxTTFtZE5ocWJCUDhFamxqVi93NXBRazBoRndR?=
 =?utf-8?B?a3NKY1c1eXdJaGtwQyttNXhTc2hJRlI0bnhUUjdMa05uOFUvV1BneEtDREE2?=
 =?utf-8?B?UE1xdkRNLy8rVTAzUTZndnpXNFI2Ujh4UzFNcnhaYnhMWTBUVHJwTmk2MW54?=
 =?utf-8?B?blJjRVhtRFdnSTBpTDFUNTBzUVpzTUhPcU85UVgvNXIzN3NjLzhRWnZDczZW?=
 =?utf-8?B?N1hBYUFnclRTM01FOUpDN3JtRlk0T3ZxUllMaGU0eDBtMzNtamlBN3BRbkhh?=
 =?utf-8?B?QjZURGRhQXR0RUQ5RlJyQVF4K29yZ0hxa0VMS2QxallJM1hNTnhuL0Ftc3lz?=
 =?utf-8?B?VDhRb1JHdThYUUgvYjJaUHdiMnR3YnZYUWJHZjIyR3BJbi8wVk4yMjQvdU1H?=
 =?utf-8?B?T3VHc2RLbE93OEc5MUJCbFZ1b3Z5b0xXMkZianlEV1FSOVNPMmZYTjAybU5C?=
 =?utf-8?B?WFZxeHhkeXM0anFZTnFSN2NpV0hBTFgwNVJPRXovdUw2c251T216ZzU0cnV6?=
 =?utf-8?B?dkJiQ0ZXdmIrcjVKYjBkQnlHcnNlL1k1dlVoOFJSNURrUXBkaER2QW9qUTZB?=
 =?utf-8?B?MVJtUndzUjhUNldRSnpzTGxMUDczWjhjaFUrYm9lRGpJeXBTQTN2V05WUHFG?=
 =?utf-8?B?elF1OCtwRENYWVFZenJHbm9jNEtORTBjOGRYZHN1b21aSDdQYTY1dU94elFZ?=
 =?utf-8?B?SkIvUjU0eFJRNjVtalJoVUgrVGcyWUdmMDR5M1llZ1RVMTZXL3dwZ2tFRGJo?=
 =?utf-8?B?OW9EVzhZSDE4QzJWeUZzUG93Y2YrREkrTDhIMFJDQW9ZMzNHeTZ6MWsxOGg0?=
 =?utf-8?B?YjQ3Q0lPbUZrOFlaNVdHM0Q5ZmU2OEdheDN6Y3F5aUZnUHZ3SDBEcWF3TEZk?=
 =?utf-8?B?bW50UkNNdDdzWTBiQ0dTL0FTd1pXWDI1UlAwNUlVREErajdKL3krWDZkVVpq?=
 =?utf-8?B?Ry81dWZEOWZMRXpyTmo0aDRkVk5yalMrb0pHaWI5cTFOT3hNZlZKQXhseVEv?=
 =?utf-8?B?bjRsQ0FXNkZvL05OT3EraStRaTlzL09MMk95dHZFRlZkMWUrU0Y4UnovcTlJ?=
 =?utf-8?B?NUJUU0F3TkFUQzZwRHRQNU5PSkV0Vms3Y0lobGxoQ0JWV0dKTU9WaHBSajNo?=
 =?utf-8?B?Y2NGT1VuYzBUU1RZbDdHTWZaNWZ4YmtSY1d5eVB2L3J0aUFoZ1hMV0x6djN5?=
 =?utf-8?B?MTQvcTdBRDZ6eUkrTXdyQ1k1UmFTVE5iMFM2N2toK1Y3VVNCRm9NVk1icVU5?=
 =?utf-8?B?Wk1TTXpCNFlzQXdrTGV5UUJxZGlPdUkvWFlQMzVVM3BGZlhlWVBhNzlzSlpT?=
 =?utf-8?B?MlJMZHZFZjcvT3FKUERTVDBDZTNYdW1aOVZpUWR0YXBFa3hCY0JlMWJYUlFR?=
 =?utf-8?B?NDlZSkFtem45cWhBYWdwWlZLb1lUUGRJd3J0bnU5ZG8zbDQxcWJLQWlTWkhi?=
 =?utf-8?B?R1c1bS9iVkFiUGtLU2pBd1Z1QU5KYUhBNlNKckNBWVl6Z1hwbG85MDVFZGxU?=
 =?utf-8?B?QjVwZ2lXVC94aUtzd1QzM1dJUTJLM3hhR0RCUEdNbjNWUGZrZGh1TVBGM1Jl?=
 =?utf-8?B?cTJ3MVdLSE1wRUNrTWV6cVJDN080am4yZnA3MllFRk9iOGRic3BET3ArVC80?=
 =?utf-8?B?dFBYQ2I4Z0JTWGkrZENlUGpySmxtVTNrSXN2R3dWV0hPb25HcHI1ZTQrRUFx?=
 =?utf-8?B?WUJlR2gxZVV4OGpoWEZhcGE4Qzk2RWJyT3ZSODRicEswZ1NJcE03RTVvQTU3?=
 =?utf-8?B?M3JpRENwL09uR0Z2dVEzeHlBbjhJZWZqVWpCQmdWWGFydjNIVmg1TGtPT0s5?=
 =?utf-8?B?bHVZdUorc0xvTTU3SHlJMzcxbm5qQnpsNW1IbGxhNlVVNENvMW9FajdTWTVB?=
 =?utf-8?B?RWtJaHJXOHdwZjVnRC82S3BZSEZWZEtXUk9vVkRrMjBYZTVlOFdjZit2aTYz?=
 =?utf-8?B?dE5QSmpBTmJZZGFYL2Jnc2tIT3VwLzZERXkwTTFmbFhDN0J5Q0Q5VUZMdjIy?=
 =?utf-8?B?c00yMktHK04rdTlkNDF4ZmF6TmJtK1R0SWhpZ1JkU2E4cFRkaUlsY2Q4aFll?=
 =?utf-8?Q?Hu3uis?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0Z5S1AvSEJwbnkxbzRLN3pDU09qckE1Tk1yYko0VHBQbUZHMExuNGVma3hu?=
 =?utf-8?B?a095RjRmaGZvSE45UTVEQUtwM3RyU1YwYi9tUytxck5yRU03YTR0OHk1YUFO?=
 =?utf-8?B?K3pyQ25ETStRY1BUZ0RMOEJqVVNSNjd6Ums4RnNWV0pNM0Y3bFBhY3Nwdzlw?=
 =?utf-8?B?dUlvSzd4Q1F4Sk5EZ0I0TlR3Q1pnVmpHVnB3MFc1dWZMY2FxMVg0ZHhRSS9a?=
 =?utf-8?B?VDBDeDc0ZnNjNFVqMUR4S05IQ1ZDMkdPVUFRQ3hIK1hrVHRaeElZc0htWWhr?=
 =?utf-8?B?YXFFcGlCL2J4bkhRZU1oYzR5V3dZRTdITzVoUXRqeC9SSWlWdzNVY2xTN0hu?=
 =?utf-8?B?ZG5jSTB5QmpsalJmNmRqdzFpRnB4TWxMRW5ycDdCMG1rR1NSSFVYQVJkdDdB?=
 =?utf-8?B?TC9DNFBIOFQrRS9uRW04Z3FYMno1QTV3KytDSEhkc2dFR0F2UlJ3MWZSS1ln?=
 =?utf-8?B?b2wrckN4eWMyNmllQWx1Z2N3YWJITGVrblBuTlpobE5RY2NxWkdCNlh1RExu?=
 =?utf-8?B?UExoRjFJVzZsbTBKVXFjbHUydXpIM0hMampEdm5FMHplOFlpYzE2ZFJzNzhw?=
 =?utf-8?B?eHFOc1RLa1lUUkNmaUR1NUVqYUd1T0RuM1dNeHljZUhRejI3TDg3Z08rYkZO?=
 =?utf-8?B?bTFabmlNVlZEZitRZ1dLWHFZMEN1U2djczEzcm5xNThRNVRneFZSYXl5NzdZ?=
 =?utf-8?B?ZE9QWlc1YWpJSFBRUHN2YnVRdWs0ZTFRQmhFOGlkYmdBMWlucFlxNFlRWFp2?=
 =?utf-8?B?SlhWSnE3QXNEdlJURyt2YWwxcm9ZZnk1SzlyUGF0b3JHam5jZjlYa212ekFu?=
 =?utf-8?B?OElDdWxzWHZ5UjVYM3hoV3lEbnVISnUvNGpnNzZHaEd4K1hiL1dWa3RwTkpV?=
 =?utf-8?B?ZGtpaWs2VmI4R3pBMllFdUpJT0xxajFsb1h1YUFrcTBpTzlmQmtmaC9jZ2RQ?=
 =?utf-8?B?dzFhRHlJWVVQTXdSemRqcmhsemJMSiszbmxNSmZNQ0FFZlJmakpPUFNOZWJC?=
 =?utf-8?B?SmpPUGtneUZ3TFR2Znp0MHNwVTJKcXc0Misvb1UxMVRFeEY0QXk0KzZIaS9o?=
 =?utf-8?B?cXZUTHhuT25mT0t3OUsveTRJSXNsdDBja09MbzlNNTBETUlFZDRhbUZBRHBQ?=
 =?utf-8?B?R0ZsOTRJR3BTcEErUlJtdVhnbUl3NVRPR2R2WngxNW9iRTF5bTVzOEIvdTB1?=
 =?utf-8?B?YU95cmczNjJNMDlPcVh4bThMZ3ZiWllRVE5LSHNLVVFsV1lUY0tROEFjNjFi?=
 =?utf-8?B?VVVoaU1QRzBMNkdWV0VRdWVHYmR4UHJ1K1FtTnV1bEpFOWU2SjlqdHN6NDRk?=
 =?utf-8?B?bC9uVzRaMFJwS0dyUjNDdVpQK0tsNmd4RWo3bFJ5dkFnb2VKbU1IZDdiTkxs?=
 =?utf-8?B?cjIxOFRqc0dObmRqV01XUlk2MG9KMjdNdjM2RGVwMDJ1VzF6SVlGYVRpNDg1?=
 =?utf-8?B?WGFZYTk5U3lLNWZzZkNOS3M0M3ZzMnc3QjNDZUg0WmdKVmZuNFBhL1hiZC9T?=
 =?utf-8?B?TmNSUFdBVGFUWFJ0MEt5OEFYK056UkdLUFh3MUFJV05xSGlBVjhtZTNWL1hJ?=
 =?utf-8?B?THRVQmthYUFWaCtKcnY5SzZ1ajZGQ0pJaUlFYW52TDJKYkdhZXpIV3VEVVl1?=
 =?utf-8?B?M2YyUHEyVlhxUk96YkttTDNGak9lME1TOXNnS244dUEvOFBRV3hrYzVCVWt4?=
 =?utf-8?B?SGJNekNLM2tsbXNaWjZ4T3hhM1NISDQvYkx3SzZHNFpZL3NFM1g2Uzk2Sno4?=
 =?utf-8?B?Mm1hUlUrWGdsTnlaSVUvbFpXVzlBQnZHaHdiVnVQc2JUa0xMR1FOcDNqK2Q5?=
 =?utf-8?B?M0k0OWpjbG5vOENESVgvcGlWRnUrMXg3T1ZPUDVDNmVqbTFBN2NEbGRGUStZ?=
 =?utf-8?B?OHREUmNibnF5RHhJKzNkd3VTZjY0Yk5KQTZYQXJKVVUwbW9LV1JJYkpPUVBi?=
 =?utf-8?B?ZTBXcXYyempWOHZ4czl1WmhoZlBBK0p2LzNNcVNUZ1VhcVhrU3RDTnNyMmRL?=
 =?utf-8?B?VTdpN0t5bm9razR1K0tOM0kzSWM3SkNQVDJVMTNGK3p5U2d1ZWxVanFPQm1r?=
 =?utf-8?B?K29nWnRvM0pFOVZaYTRucXBFMWZoeXlnbEdnKy9zUUU4WWltK1Bkb3pVeVo0?=
 =?utf-8?B?SDgwV2txZU8yTXEySDhoNmdMVHpUd2wwOWtRNmI3MEJSMm1HakxuK3h1RlNX?=
 =?utf-8?B?N2J1TkJZYzN5UHVsZUUrZldQbnQza2MrdmhOamhUVW9RWW9xM2c2SDZnNFNX?=
 =?utf-8?B?aXRXTkZPKzlyRmdxL2xYM1ljY3VSMjVsZUtNanJPSUZld2U0NC9LNzJRZEZ5?=
 =?utf-8?B?SkpVOE9vNzVhclY0ZnZtN2M0TSt3ekp5UVdoVjdhSWVES0pFakRMUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3d743a-28a4-4ffe-445a-08de632a2c20
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 13:43:11.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XekD8BKXlU2MYgWj78MdIxmGLyg+oyUueodUvliZoXkmvKnpEonIdyUGsug5jM3HJpvBlW8dI8k8sVBDTtBqvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_054318_219664_CC3E2ECF 
X-CRM114-Status: GOOD (  23.04  )
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

T24gVHVlIEZlYiAzLCAyMDI2IGF0IDE6MzMgUE0gR01ULCBEYW5pZWwgQWxtZWlkYSB3cm90ZToK
PiBIaSBCb3JpcywKPgo+PiBPbiAzIEZlYiAyMDI2LCBhdCAwNzozOSwgQm9yaXMgQnJlemlsbG9u
IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBNb24sIDE5
IEphbiAyMDI2IDEyOjM1OjIxICswMDAwCj4+IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUu
Y29tPiB3cm90ZToKPj4gCj4+PiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAxMTo0NTo1N0FNICsw
MTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDEx
OjE0OjM3QU0gLTAzMDAsIERhbmllbCBBbG1laWRhIHdyb3RlOiAgCj4+Pj4+PiBGb3IgZXhhbXBs
ZSwgaXQncyBxdWl0ZSB0eXBpY2FsIHRvIGhhdmUgKGF0IGxlYXN0KSBvbmUgY2xvY2sgZm9yIHRo
ZSBidXMKPj4+Pj4+IGludGVyZmFjZSB0aGF0IGRyaXZlcyB0aGUgcmVnaXN0ZXIsIGFuZCBvbmUg
dGhhdCBkcml2ZXMgdGhlIG1haW4KPj4+Pj4+IGNvbXBvbmVudCBsb2dpYy4gVGhlIGZvcm1lciBu
ZWVkcyB0byBiZSBlbmFibGVkIG9ubHkgd2hlbiB5b3UncmUKPj4+Pj4+IGFjY2Vzc2luZyB0aGUg
cmVnaXN0ZXJzIChhbmQgY2FuIGJlIGFic3RyYWN0ZWQgd2l0aAo+Pj4+Pj4gcmVnbWFwX21taW9f
YXR0YWNoX2NsayBmb3IgZXhhbXBsZSksIGFuZCB0aGUgbGF0dGVyIG5lZWRzIHRvIGJlIGVuYWJs
ZWQKPj4+Pj4+IG9ubHkgd2hlbiB0aGUgZGV2aWNlIGFjdHVhbGx5IHN0YXJ0cyBvcGVyYXRpbmcu
Cj4+Pj4+PiAKPj4+Pj4+IFlvdSBoYXZlIGEgc2ltaWxhciB0aGluZyBmb3IgdGhlIHByZXBhcmUg
dnMgZW5hYmxlIHRoaW5nLiBUaGUgZGlmZmVyZW5jZQo+Pj4+Pj4gYmV0d2VlbiB0aGUgdHdvIGlz
IHRoYXQgZW5hYmxlIGNhbiBiZSBjYWxsZWQgaW50byBhdG9taWMgY29udGV4dCBidXQKPj4+Pj4+
IHByZXBhcmUgY2FuJ3QuCj4+Pj4+PiAKPj4+Pj4+IFNvIGZvciBkcml2ZXJzIHRoYXQgd291bGQg
Y2FyZSBhYm91dCB0aGlzLCB5b3Ugd291bGQgY3JlYXRlIHlvdXIgZGV2aWNlCj4+Pj4+PiB3aXRo
IGFuIHVucHJlcGFyZWQgY2xvY2ssIGFuZCB0aGVuIGF0IHZhcmlvdXMgdGltZXMgZHVyaW5nIHRo
ZSBkcml2ZXIKPj4+Pj4+IGxpZmV0aW1lLCB5b3Ugd291bGQgbXV0YXRlIHRoYXQgc3RhdGUuICAK
Pj4+IAo+Pj4gVGhlIGNhc2Ugd2hlcmUgeW91J3JlIGRvaW5nIGl0IG9ubHkgd2hpbGUgYWNjZXNz
aW5nIHJlZ2lzdGVycyBpcwo+Pj4gaW50ZXJlc3RpbmcsIGJlY2F1c2UgdGhhdCBtZWFucyB0aGUg
RW5hYmxlIGJpdCBtYXkgYmUgb3duZWQgYnkgYSBsb2NhbAo+Pj4gdmFyaWFibGUuIFdlIG1heSBp
bWFnaW5lIGFuOgo+Pj4gCj4+PiAgICBsZXQgZW5hYmxlZCA9IHNlbGYucHJlcGFyZWRfY2xrLmVu
YWJsZV9zY29wZWQoKTsKPj4+ICAgIC4uLiB1c2UgcmVnaXN0ZXJzCj4+PiAgICBkcm9wKGVuYWJs
ZWQpOwo+Pj4gCj4+PiBOb3cgLi4uIHRoaXMgZG9lc24ndCBxdWl0ZSB3b3JrIHdpdGggdGhlIGN1
cnJlbnQgQVBJIC0gdGhlIGN1cnJlbnQKPj4+IEVuYWJsZWQgc3RhdGVkIG93bnMgYm90aCBhIHBy
ZXBhcmUgYW5kIGVuYWJsZSBjb3VudCwgYnV0IHRoZSBhYm92ZSBrZWVwcwo+Pj4gdGhlIHByZXBh
cmUgY291bnQgaW4gYHNlbGZgIGFuZCB0aGUgZW5hYmxlZCBjb3VudCBpbiBhIGxvY2FsIHZhcmlh
YmxlLgo+Pj4gQnV0IGl0IGNvdWxkIGJlIGRvbmUgd2l0aCBhIGZvdXJ0aCBzdGF0ZSwgb3IgYnkg
YSBjbG9zdXJlIG1ldGhvZDoKPj4+IAo+Pj4gICAgc2VsZi5wcmVwYXJlZF9jbGsud2l0aF9lbmFi
bGVkKHx8IHsKPj4+ICAgICAgICAuLi4gdXNlIHJlZ2lzdGVycwo+Pj4gICAgfSk7Cj4+PiAKPj4+
IEFsbCBvZiB0aGlzIHdvdWxkIHdvcmsgd2l0aCBhbiBpbW11dGFibGUgdmFyaWFibGUgb2YgdHlw
ZSBDbGs8UHJlcGFyZWQ+Lgo+PiAKPj4gSG0sIG1heWJlIGl0J2QgbWFrZSBzZW5zZSB0byBpbXBs
ZW1lbnQgQ2xvbmUgc28gd2UgY2FuIGhhdmUgYSB0ZW1wb3JhcnkKPj4gY2xrIHZhcmlhYmxlIHRo
YXQgaGFzIGl0cyBvd24gcHJlcGFyZS9lbmFibGUgcmVmcyBhbmQgcmVsZWFzZXMgdGhlbQo+PiBh
cyBpdCBnb2VzIG91dCBvZiBzY29wZS4gVGhpcyBpbXBsaWVzIHdyYXBwaW5nICptdXQgYmluZGlu
Z3M6OmNsayBpbiBhbgo+PiBBcmM8PiBiZWNhdXNlIGJpbmRpbmdzOjpjbGsgaXMgbm90IEFSZWYs
IGJ1dCBzaG91bGQgYmUgcmVsYXRpdmVseSBlYXN5Cj4+IHRvIGRvLiBQb3N0aW5nIHRoZSBxdWlj
ayBleHBlcmltZW50IEkgZGlkIHdpdGggdGhpcyBhcHByb2FjaCwgaW4gY2FzZQo+PiB5b3UncmUg
aW50ZXJlc3RlZCBbMV0KPj4gCj4+IFsxXWh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9i
YnJlemlsbG9uL2xpbnV4Ly0vY29tbWl0L2Q1ZDA0ZGE0ZjRmNjE5MmI2ZTY3NjBkNWY4NjFjNjk1
OTZjN2Q4MzcKPgo+IFRoZSBwcm9ibGVtIHdpdGggd2hhdCB5b3UgaGF2ZSBzdWdnZXN0ZWQgaXMg
dGhhdCB0aGUgcHJldmlvdXMgc3RhdGUgaXMgbm90Cj4gY29uc3VtZWQgaWYgeW91IGNhbiBjbG9u
ZSBpdCwgYW5kIGNvbnN1bWluZyB0aGUgcHJldmlvdXMgc3RhdGUgaXMgYSBwcmV0dHkga2V5Cj4g
ZWxlbWVudCBpbiBlbnN1cmluZyB5b3UgY2Fubm90IG1pc3VzZSBpdC4gRm9yIGV4YW1wbGUsIGhl
cmU6Cj4KPiBsZXQgZW5hYmxlZF9jbGsgPSBwcmVwYXJlZF9jbGsuY2xvbmUoKS5lbmFibGUoKT87
Cj4gLy8gZG8gc3R1ZmYKPiAvLyBlbmFibGVkX2NsayBnb2VzIG91dCBvZiBzY29wZSBhbmQgcmVs
ZWFzZXMgdGhlIGVuYWJsZQo+IC8vIHJlZiBpdCBoYWQKPgo+IHByZXBhcmVkX2NsayBpcyBzdGls
bCBhbGl2ZS4gTm93LCB0aGlzIG1heSBub3QgYmUgdGhlIGVuZCBvZiB0aGUgd29ybGQgaW4gdGhp
cwo+IHBhcnRpY3VsYXIgY2FzZSwgYnV0IGZvciBBUEkgY29uc2lzdGVuY3ksIEknZCBzYXkgd2Ug
c2hvdWxkIHByb2JhYmx5IGF2b2lkIHRoaXMKPiBiZWhhdmlvci4KCklzIHRoaXMgYW4gaXNzdWUg
dGhvdWdoPyBZb3UgY2Fubm90IG1pc3Rha2VubHkgb3duIGBDbGs8RW5hYmxlZD5gIHdoaWxlIHRo
ZSBjbGsKaXMgbm90IGVuYWJsZWQsIChhbmQgc2ltaWxhcmx5IGZvciBgUHJlcGFyZWRgKSwgYW5k
IHRoYXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQuCgpIYXZpbmcgYENsazxQcmVwYXJlZD5gIG1ha2Vz
IG5vIGd1YXJhbnRlZSBvbiBpZiB0aGUgY2xrIGlzIGVuYWJsZWQgb3Igbm90IGFueXdheQphcyB5
b3UgY2FuIGhhdmUgYW5vdGhlciB1c2VyIGRvIGBDbGs8VW5wcmVwYXJlZD46OmdldCgpLmVuYWJs
ZSgpYC4KClRoZSBvbmx5IGd1YXJhbnRlZSBpcyB0aGF0IHRoZSBzdGF0ZSB0aGUgY2xrIGhhdmUg
aXMgZ29pbmcgdG8gYmUgZ3JlYXRlciB0aGFuIG9yCmVxdWFsIHRvIHRoZSB0eXBlIHN0YXRlLCBz
byBhbGxvd2luZyBjbG9uaW5nIGFuIGludGVybWVkaWF0ZSBzdGF0ZSBpcyBubwpwcm9ibGVtLgoK
QmVzdCwKR2FyeQoKPgo+IEkgc2VlIHRoYXQgQWxpY2Ugc3VnZ2VzdGVkIGEgY2xvc3VyZSBhcHBy
b2FjaC4gSU1ITywgd2Ugc2hvdWxkIHVzZSB0aGF0Cj4gaW5zdGVhZC4KPgo+IOKAlCBEYW5pZWwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
