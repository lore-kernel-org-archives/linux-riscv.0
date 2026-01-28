Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA181D35662
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWYkYrymE+/q1pdZ6UY3SgfH17XzeAkLtaSOmyx+JKM=; b=chhbHVAmuxgFaE
	i1u5TCClDELvJttz+hru+ijsK4UkCAeKv+rv+8ZYxuWXrxQq55URNsBxYQeloG1/iYZXsUN6e1QqM
	qpiE3lc183vc09qsI0Mz9quZnG1qcOEUtcCKuOvMVoz5KvIGo2b0dP6cbUJA/x4pJRyLRFbp9xT7F
	+ljP7HBoydVHgSZmmxyCpu5nY0YJRuw3wZzdwwBT+J8HxYWSP0DrWMD8U4sPB3JEDE0sCc7zRKsX0
	VQw/CWzuEUuydiDrAOI6PRSSObBRCBgXLMQUS0ySjyEruV+wF4qJzvcfiE5KzdPJEu4/xseZPobrK
	5kWtTdFNirezipmtaNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0SF-0000000Fcmd-2XgU;
	Wed, 28 Jan 2026 07:59:11 +0000
Received: from mail-northcentralusazon11010066.outbound.protection.outlook.com ([52.101.193.66] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0SD-0000000Fcm8-47xB
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 07:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqe4JXmDRh7k9bxg6Mmtdvw+YH906iaOGSLO88rx+J/cNgVHX/Ia5Fpj6M3tSPP6SO8fjHqovaaCMAboU1yW7ZTfAIVwpkezoU4R71lEhWCDHjyoDLUQjlBD91t6MT3XYahrqUhdfsYmgguT7JgUQVigMkiI4h4RclHifCP2ouXBPtTAXdYxS6MnjG2end2nMYtuXK7AtExYfl3Y3bKG/P03k5raDy2xt/aj04lA61qYUgUvaCSlkjoCDySuFdtMruig7KhFMQW45cxwgW17C4n3Yjrgywk6LqbqRAqu9RmhxEOsTPCsyABp9gC2Tv0W6FFSiumJsrAAuxdiDwPhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5ewJuOnj4y6Yaw5dRer5gycaUeV6/CWh2gD5oSCXX4=;
 b=fe+E1HlaQ4tb7iDGz78JXA4S55Bg44ZregR9gyU8RYiEssM+Ok3mSleEaAOnOrkKV2w1quFWo3f2ZEq0EAQeBfHygGj8B4SPxdQkedMRiBRxO0vbzSsaZhRMuPMSFtAb6GGiJCEGs8XTYcA4gZcb3fKvZVuKKtHohRhJOuPmVnFUohpoE8eCuoe8DOuCow4a/z6gp1xwX1Q0tI92a3Kc931fl2Ewm66Wt320dTMZzVdJ8tD3DY0iZW2MTLdBtIrJPmLEiRWWZpxrp8sCMZCBasufy4cuEiVTLLSH8rXBtLzD07PPPhC5XKJYz63wCDXNRwxa4YssBmNwcSS6O7zE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ewJuOnj4y6Yaw5dRer5gycaUeV6/CWh2gD5oSCXX4=;
 b=ME7jdpJj83BtrmhReygb3XKkgDbWBPmYtVsmjMhLZXHmjGmr7tow3akVuslqjHbQBV3GLEjINOm/kBo2cnBlluLEIb4SMEC3njIl0r6NcSIuu3FOyMqoBDFMO/qWN8bpM214kowrPXmRsykyQKUoff0JFeUoNy+L+AbX9OK50/dohvvG3pJORuYWlTkIrEbH94EymraGEJLlb8hznv+aXHYOh6sPuP+LU5GWTvp0j85VPXz6POw/15kfrWISEncPDp8Zg5yNmr9wzwtXoyhBLMUUwg+mzyCEC7BRE+ry64vISl99SRsgNftk3fDfMH0n2vZInCZqM5r+HWBPOv3CLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 07:59:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:59:01 +0000
Date: Wed, 28 Jan 2026 16:58:57 +0900
Message-Id: <DG02AC8I2XUA.2UM92327TQKAL@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c37a08-efcf-43e4-de07-08de5e431943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnVEZlc3WUZ3OFlJdWthSm1TMXhvY25WSDVpeTFmZXVOWGtPeXkzZWpPOWhG?=
 =?utf-8?B?S3dXbS9MS2lqY0Q1Smt2RTB0UnpmV09NNWM0R1FzeUdBeFVoVG9DbGZ0cVdq?=
 =?utf-8?B?Z1pQSmFaRWpReVJRelBBb2FRMDdGd2NZWGRseCttVWpCWmF4ak1vdDgzWDkw?=
 =?utf-8?B?ekI2N2w0OU1qOTBCUm0zeTFCTFYvQnpmNjJ5WHJic0ZyQjNsOC9EZnZEU1ZL?=
 =?utf-8?B?V2lCZldWRkdnWjFaeWYyM29GVU9rMUdrSWVaQ3czTHFvcFJDbjd0Rko0ZWZW?=
 =?utf-8?B?SUhJdGFzK01JMGpUWkFnYVYrK3dKWnZYdUVFOG1maFpZVUl3cU82TFNZODFn?=
 =?utf-8?B?R3FWZWR5K3d0eG5LbDVGVDFLTUJWV0JhN1NKYXk1WTdwenAyRXBCbHQ4d1FP?=
 =?utf-8?B?OWNxOG13ODNtQm0yTitmcEU2NGh2YVluNTlGTlN0S09uQ1JkMFFoTEE1WCtD?=
 =?utf-8?B?QTE1WE9DUmpIZGlBY1NQV2RRQ2xGbThLUExQc3hTY3JsT1c3aTlSRnE0djE1?=
 =?utf-8?B?amkwNnM3YTN5V3FqRk4rT0E3TTVxdlVhN3lWSkR6bzI2WUo0c2FvZDJ0YXJ1?=
 =?utf-8?B?bVFuM01DKy90WjdUa2pucG5BdW5FcW1kSTJRb3Q5M2ZzNC9IRVAxbE44SFJM?=
 =?utf-8?B?ZUtrYUtOaVNJdVRsVmRNUFF1RVpmZENlckRrZHZlR0NmU2NSR1RCNzE0MkNI?=
 =?utf-8?B?alJ6ZDVEL01reTh1QmdYZjF6MVVNaXRraDR4YkFnakN2TE85NFRCVVNwaG1I?=
 =?utf-8?B?NXJwb1JMUTRHUG5tbEhnNGkwS1RObUdzaW5OSm5KTHhyem15ZUU5VEF2UG9z?=
 =?utf-8?B?OHlJNDdzdE9PbGpOTUYxL2pmQXhnczdLNm9IZ1AybStoY0tBaFFjczJtemtt?=
 =?utf-8?B?dzBwTW40SGJmZWdYa1N0UHZxNjJXc1N1SzZwRWh2ZVBScGZZZnVCKzdScDNX?=
 =?utf-8?B?VVVkbGUxUWNtOWlhakpyb1V2bUtwZHJ6YXZQRzcrL2FMM0xYNTRvWmwvTWtG?=
 =?utf-8?B?ZEt2ajhhTitaOWJQQkhBM1hYY0tvQ1BUa0ZhcFdBcGdOT1lBaUtSYWlVWHgz?=
 =?utf-8?B?OURDRUJRbGxZbC9uVzc5Q0NKWVozME14SnB1QnZ4RnNSbEN6T0ZOTlZQaUhD?=
 =?utf-8?B?eFRmMWN4S1lzYjFJazdTZFNsY0lMemxwTDlmNnNlMVZKTFd0czRqbzYwRGR0?=
 =?utf-8?B?dy9iMW1JSVdmcVN3UklYTjhkRmNIT1BJVWl4emFyNElIekNJdXNkRVFGRlk3?=
 =?utf-8?B?d2NWTEJPWTZhWG1LLytLcXhhZ3hQcVZXdVA2dGFuK3NhbW1DUTlOSEQ4Q1FJ?=
 =?utf-8?B?cWtUY0NuTHgrN1Mzand5OUoxaDlGSlQxQ3E1bFJRWmU3WTFQaVR6OWwvcmlQ?=
 =?utf-8?B?MHZYQ0lKd3JLZ2ZucXBzTVZ2cmNZc0lYSE03c2dKcmszTnRPV0tnU0MraFpn?=
 =?utf-8?B?TCtWY0FJWG5rYlF0Yjg2Q0MvTEpOaGNhYXhlYVBZUmhnWHh3N01GNnErN1Zp?=
 =?utf-8?B?NXduaFpYT0ZhSTFVYnNtV1dhL3A2bmRuVFhOdFh2a0RCM21iem1aUGU1UlBM?=
 =?utf-8?B?d0VjbThDYmdNSkhiTTgwdGZrc0VHUm90N1hOWHRtS0FnU01rRmt0LzZaZ0Rv?=
 =?utf-8?B?V1hPeFl1RGx2ZVBGazI1V1pvSjZhSkM1Y2dJZ1M5cVQ4bkdlTjluRElyT1ZV?=
 =?utf-8?B?SmtGY3BKNmJFbCttTlI0R3VOWjY2TDBFM00xOWN4Y2Q5UE9pODg1VXB6RXZI?=
 =?utf-8?B?R2N1eVN6eGxkcjRGaEltS3J4S3FjRzZ6TnBZanVHaUV3bDYwNVRGN0VSQmhR?=
 =?utf-8?B?YVZydFcwdVV3YVd1YW53QzdJL3ZGbWZzWWhvcHBDaXhWTmM3VHkrT05uNSti?=
 =?utf-8?B?NWpCamVJbG5nWkdZamRvU0VxVDZSK2w2THd1akNnZXZsUExOVzF3YWVwVTFp?=
 =?utf-8?B?aE5JZ05lUDJlRzNxVUpnZEhETWNHVVZYSnFta2hSTU82NnF6WjR1dzJlNkly?=
 =?utf-8?B?Vm1WdE9FVW1OYzk0QktmNnlTSlpDZEowK3lyZnlocnhabXlXTnNNVmZMRUxV?=
 =?utf-8?B?ejJnRVFUWERadW8xQnloOElETzZqNnMxcmdJM2NkRW8vcFdRWDBCY1lQNnJz?=
 =?utf-8?Q?2W5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0sxZGVUTkpvWE5PV3JTUTJ6Y1NuSmpHdk41Z25IbnFyS0Y2V0pvSHBzOGZv?=
 =?utf-8?B?SUhjdTUvQWkrVXNndUZEQk1OSkdlNzFQamZETVJKNEdqckh3aEhZdHNBY1RV?=
 =?utf-8?B?RmxuUXZQeS9MRTlwTlF0WnhrcTNlYTNGT1hHZi9peGh4SHUxTTFzTW1SeE0x?=
 =?utf-8?B?SzZMYXRITmNKc0J3VFBERS9FRGIxSnJDM2h0OTgyWllpN3NheFowdHlTZWRo?=
 =?utf-8?B?SXlTWnFESXdaYkZGbXZCeHBRak5Ra011MDZ0ZEdQVWE2NE9xRTZDcU5oZXl0?=
 =?utf-8?B?eVJXOFBMeTY0V0ZMdGNCNHdHaEhoMUJ4elhMVVVrNmt1bUoydnp5T1FUdzZ4?=
 =?utf-8?B?MTMvMjFmZmMzdFJCWjVTM3lnMkwxOG9QR0lBclBWNU40ZUgxSUJQelV0cVFh?=
 =?utf-8?B?aHdUVkFIZHRDUE9tZ2ptY0NVWlBKRzhpOEdBcVhvS2htYmN2dllwelBHNjZZ?=
 =?utf-8?B?OFVzbzEyam1KSE9aOEcwcEZXQ0hiaE1Eb05aUjJQVUFLWDRTT0RkQzJCZDJr?=
 =?utf-8?B?eWQ0NkVYUUxwSTF1V0piTU9RSnhHdEN0OStnSUY4ZEplZ2VtenY1cHdsL2Rz?=
 =?utf-8?B?SVBkWS9pVDJoYldoSjRxUjFtOXlmbjNJREpqeHgxbGNsZjdVOENVWE5FN0VJ?=
 =?utf-8?B?ZFU2YUtRVHVtVlRUbmhRdTkrbDVsVno0ZkJGNi9tQjBKY1ljSkkycS9wZzJR?=
 =?utf-8?B?TFEwNm1nUlV0bWZzYythcmhtWEF2RWFWS2NNZ0tFcEZBTlp3amZIV0x0T1Rs?=
 =?utf-8?B?eC8rYjJzNUZ5Skc3WmdxZ0pwS2lzbzlidWlCalhGdktHeWxSZlZIMEx5Z3V5?=
 =?utf-8?B?cG5URlR3UStlZ0Z0ZXF5eUZEaS9YcFJHRTA1ekRBazI5NjZ3OVhqbjZ5c1I3?=
 =?utf-8?B?NWlxcmRMZUthcVQ1NnovVGd4eWZFYk1oK29iTldDbC9vU01aQVAxUnZBSmF4?=
 =?utf-8?B?a0FhZnhIdXh4aVNiT1d4ejJqbS9PdDFlaTh1eEdyNUU5TWZxd3ZnZ054ZGk3?=
 =?utf-8?B?UzRnNWdkZW52RDVGU2pYaDRuUzhnOTVwQlR6UUR3OU1aamZzaDZkakV2Zk00?=
 =?utf-8?B?azRDVlBtSlJiWDB5OFdVNENZY1FxS0lnUndYbytOQkpQWm9EaFQzN0FraFVx?=
 =?utf-8?B?eFduNnFTQVNZWnZicXg1SkRza0g3alpXWW9Qa2JuaUVZZEtvY3J6T3RrdE1P?=
 =?utf-8?B?WTZHdEhka2VBeHR3dFJVYU8zZzRxNmdXQVZqMndIVnRRdTZwNEMzY3dKZmgw?=
 =?utf-8?B?Y2kwb1NaZ1NwY3JpU1lYY1FwNlY5SFdWWk1NMmVJcEo2TkFscjRuc0dCRjRo?=
 =?utf-8?B?VUsxamRGdmFsTDNMd29KL05RbVZlR3AzSGg0QXN1WmZUMHNJZjBXL01PZFp4?=
 =?utf-8?B?aDVhcEFCU3FLdGdMa0d1cmRXYUVLV2Vva3NtSlNxZjlsRldFMXNHNHc4LzU5?=
 =?utf-8?B?aGk2YXlQTVlyckdvdktOaVZHYjYySHh3aTEzMzRpa3VndzFlN2xUR1R5NThn?=
 =?utf-8?B?bjVGR3Bvd3N1bjltcEtBM3kvd29hYXhDcGpqRHU1MkNrYm00L1UyajhWaklM?=
 =?utf-8?B?Mkk2dWJXY09ucVAranp3Y2tlSDE1bEFsT2RUc3ZCZnNybnh0OTFpQnhyRlZK?=
 =?utf-8?B?M2ZsbXMycVdNYVdGbXFucWVjQTEvQ1lKcGdkUGdzVjZMT1U3bHY3UXJSL1FK?=
 =?utf-8?B?UGhuWWQvc3NoWmx1dWpSM3RjL0lEYVVKT2RBNEVnUWp1OWNDenIvK1B4YUFR?=
 =?utf-8?B?NCtmdnY2MEh0b1Z1djU4cHp6dVpGSFVBTHdIbmZHTmhLVUVXa09vcEhpcTVO?=
 =?utf-8?B?NGJUenBqU1MrYUhXTEJGNjNXemRmazNWMG9pUHhvSlI1MVVHbCtsSVFQaGVB?=
 =?utf-8?B?aGdPTHh3OGpmaTEzMjlpUm9jaGwrSzg1YituSzJaMFBCVFdLMi8vYnFHbExO?=
 =?utf-8?B?L1lNeTkva0c5T0Z5SW9GV1lLTkt3Yndld29iZk5wQWYxWXA2YkpXT3FZd1F4?=
 =?utf-8?B?dHc3b2ZGQWtCUUhyV2FEM1hpTUxFaGZNNjNkdkliNGNjK2VjYjJjTm9ZcVVm?=
 =?utf-8?B?Z0tiRXJZTDlyWXVUMDc3dlhNd0g5dUpFOUMvQUUzbzUzYjRhSDFiRi9LUHhx?=
 =?utf-8?B?aElIYmlrbDRSb0M4VEEyZG80M2JTSjI0ZGl6bTBMcDhzRmxQMU9sd2ZIdG1m?=
 =?utf-8?B?OFR0OVpHa2xlaFNkS2VZcHNyMTlEUnhSTEEzQm5pc1FSUkY2elM0blVvbFlY?=
 =?utf-8?B?V2JqSGFpMmFQRm9VYVFuWEJkQi8vVG1CczJqcjFpcFcvanA3YVZwQXlLYlgr?=
 =?utf-8?B?QkRHY1FtV21pL0ttd01DUnE5aVlxdjlWbDRKSFlZcTIxMkgvTFhJRnNubncv?=
 =?utf-8?Q?dk5mbT2RStzfuQPNLXLdUgZ+ySHXaIfioi28bbtc2FOxk?=
X-MS-Exchange-AntiSpam-MessageData-1: R1VnVwMmhxKiOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c37a08-efcf-43e4-de07-08de5e431943
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:59:01.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43pJYI8R2DJ78jV6D9et10ZQ8GIwL2Zzc1pgqvqsgfdby3dkrU5tJtAm64N2WnC1zNRqtpEz9r08+bHGdPAyDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235910_024108_6B67CD17 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue Jan 27, 2026 at 5:23 AM JST, Joel Fernandes wrote:
> Use checked_add() and checked_mul() when computing offsets from
> firmware-provided values in new_fwsec().
>
> Without checked arithmetic, corrupt firmware could cause integer overflow. The
> danger is not just wrapping to a huge value, but potentially wrapping to a
> small plausible offset that passes validation yet accesses entirely wrong data,
> causing silent corruption or security issues.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>  1 file changed, 35 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index a8ec08a500ac..71541b1f07d7 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -46,10 +46,7 @@
>          Signed,
>          Unsigned, //
>      },
> -    num::{
> -        FromSafeCast,
> -        IntoSafeCast, //
> -    },
> +    num::FromSafeCast,
>      vbios::Vbios,
>  };
>  
> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>          let ucode = bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object = DmaObject::from_data(dev, ucode)?;
>  
> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
> +        // Compute hdr_offset = imem_load_size + interface_offset.
> +        let hdr_offset = desc
> +            .imem_load_size()
> +            .checked_add(desc.interface_offset())
> +            .map(usize::from_safe_cast)
> +            .ok_or(EINVAL)?;
>          // SAFETY: we have exclusive access to `dma_object`.

Missing empty line before the SAFETY comment (also in other places).

I will fix when applying, no need to resend.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
