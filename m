Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C973606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4Jfz/VN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=havZJhh4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F5sRLbFnjOe1wkkkOyReN9dsOv0GS3dIZMGsuPJjDXY=; b=i4Jfz/VN1WKxr0DbhAxA6eoJGP
	cuJ6CsWcrQurLFYxWk+QrOyXJsbcflGZdtmVIJms7MKVgSzq/T0SVQHdOKmqSt3zs773ILwia65lj
	gTyAhR89RbNGFVaKlM1njSG6fMnyEOlDi3NW8oKJhpaq9FWSYHh5N/eWQprrYsYoe4YL5Tl5TCmQr
	cl4wFgZw26zLSbAsC/IEeRIxVW/tOsv2UPjAXvT1RUdW4P9DAj9AhsJqnso8kaKHTvA8l3Upc60CD
	Vcx/3pc09+yHeMXseBRfpWL1FIFdhpqEl89tHnn4syqXRfNt9svFlX735aP2otBatT4Pz5TYxBrBd
	UgpBqLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1F6-0000000HVyX-1xqG;
	Fri, 27 Nov 2026 19:04:20 +0000
Received: from mail-ukwestazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c206::3] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1F4-0000000HVxw-2eBg
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 19:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk05Hrdqu3mcCERVDexZkkAxUj4xuZlo6nw+dk/SRIaCUKoCnqojxRUnwYt6EjAfNV91gl8WelsmOlkwweNfx7zTE8kW4llfhX62767qfKePwsM0Uqkz1kdKgN3C1Ka0iQ3uy9iHKiepnGKGGFnOSN+rROlMT4nPVZ+nLC3WFWh+Xgsqp9g3WA7xDcYqz/avKPb3kMahB9vZCj6PYHWhQrpAzm58BRuiMjPT62dRyWVPXqDH9bZ+wqM+su9o3rSFiTHX4Hkgl/BXfl5iM6nTEjWlV7yY98HLGQ3HJVerXtzISW9tbF4EywZIJCfLgLcRuhkZrMCFnXv66zihttNGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFSb81OH1Zc71qNeNLUeZqQDChDNpTk4G9+KLoHuDH4=;
 b=ioHT3gDC4MBN3FJkiefhlxeuJ4cMT/PGKRQk6BXtpZM9/9ogSKYcRXLvjAif8ruc3QlifDVFV8tXaZ0FgG7i5Cete3rlE95vTw0CuignA/nUonmfHHvMKAsE3q+DVFebif6XsLEGfgf8KcBWpabvnEfo2Y7OcGCmaJtLAlyYHmdN5IZu69+YXaYi+niw+3Ynsyw4fACYqwQTBrD7c0whdlE3qrc3GdX170IWj38aQH3oZo6P5kOj0MAKQGlzM4Mezq6qwpyuqk545n/VvkmXUUeEVdEgfkT7pDadO5pAD93Ft74yW2PkUMCaMljStz7nMP9pn2zwGPK66i04yWUsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFSb81OH1Zc71qNeNLUeZqQDChDNpTk4G9+KLoHuDH4=;
 b=havZJhh4XzbG73Mz22agzUkKoDfuJ+xaaM1PmLDjzGwuN2tDLLmG+Y4fmnguIGm3Kx1zVcG7hjB6wO3Kfz4lrJOW0vC0GOrNY7yCNLTdHWUbW8d4rwXJJlQaBuwIeEAcYTdpxrDvqF2TfMiktdKj8Y9Ggk0b66F32Tar4gYFCwY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB6976.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 19:04:09 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 19:04:09 +0000
Date: Fri, 27 Nov 2026 19:04:08 +0000
Message-Id: <DN686PEEVSKX.2U3UDJGLRJCQZ@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome
 Brunet" <jbrunet+clk@baylibre.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Maurice Hieronymus" <mhi@mailbox.org>
Subject: Re: [PATCH v6 5/7] rust: clk: add devres-managed clks
From: "Gary Guo" <gary@garyguo.net>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.22.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
 <DMYELN5M09W3.1SYPKW7DZ70E1@garyguo.net>
 <189F36A9-D1C1-478A-A195-F94D037E4376@collabora.com>
 <179580269373.2809466.3866997464599192193.b4-reply@b4>
In-Reply-To: <179580269373.2809466.3866997464599192193.b4-reply@b4>
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 9973d7c5-72a9-477d-e8cc-08df4cb9375d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|7416014|261022115727099003|10067099003|56012099006|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261022075727099003|261022105027099003|261022113327099003|261021121427099003|261021130227099003|261021123027099003|261021135927099003|261102123227099003|261009223027099003|22082099003|18002099003|5023799004|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Lnw/uQx4mrgbG7UJVrJk0LV/6FqozJxO7YuL38mO0+5VM/L5jRjXXPzr7TLmzRjdSdMu3zwiKGBBRR1/Bxizyf6f3qdsBCH6yv8o0shPu7WKZLJfBZFAsWodUrdqfE0AxaS72sdj+j8mX5lqNXEHGxRdAada89OQ/xTSWXVWH3M1GmG9D4aAHNPqJWQyxolsk/ljeaKXDnL2i4hCaYV1syJr4C4YrpaWvS4y96bxJ10XW/+b5GmSnAraJ40yH0omle9oqSWYmTwSIRCj0ZWQNtVVIrUh3VyDXL2tFuyGYHx+KEu/MsQN/8oDxBP2DXudkv+vaAtd6gchLzesYsskECu1U0iyZvh6BHeNwvAUSbOkDSF+N3unlKrFkPZoECcTSNLTlm77e1D54qs9bp1qgvxFSFqjI+n9fhmMKd6ZZmK64KO3MBWQn7euG5F8TB05Qg/hWkbt1M5Z/eE+8yZJpcuIEvVVi/znYWRqGtXg1S78RfFkld/wF6agTVqZ4sOpWzVbwaqsXUVUVarbfwU3qabqKMOXLmydl1sNwEMNwL9hqay4vOt1rrkYt4N3bLjzQtuRFKL8hD5bvdau+Nto0TwKkTtNSUF19QX7fMEyzh/v8X0PoUuhfmaxFgdv1+td4r5PD5Lb1ZOdYtABzhFn9TD78jxWUJZN1R4+0T/9XWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(7416014)(261022115727099003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021121427099003)(261021130227099003)(261021123027099003)(261021135927099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdKSHVrb1VtOEs3clBQS2czSEt3azdNNVNIazNwK0hJcE9UVFE1Y09TYzVs?=
 =?utf-8?B?MGpoNUtIaEtJMkgxN3hqTkxEeE4rSmYxR0JSWjYzRWxkNmI0NlNYeThWcjZn?=
 =?utf-8?B?N2Y2T1luWitEalNHYzFPYlVqK1pkNGg3YmN3UDVkeWdpaytNc1ZGVTR6YXdt?=
 =?utf-8?B?ckxCU0RNNkVBTTV4cUc3VFN5dGRwK244RnQ1NkhNTlg5dkNBTzhPOGdHcTY1?=
 =?utf-8?B?WUx3TnUrMzIvdE42YnoxMGFXZmFNWCtvczk4STByUytEWmw0eC8wT0VpdGkv?=
 =?utf-8?B?RExrdHp0S1VETGVQUFlzczJ1bm5QMjlJblM3UDB3b0ptK1Y5SGdWUGNFRmdD?=
 =?utf-8?B?dDFzV3NSRzExaERtWXgzL0piZ1BPQUdzNnBhZlVTTHJTQkIvSUxnQ3RCYW9M?=
 =?utf-8?B?NDh4MGdOSGR4MFZITytsWks0SHBWbnVEazNOS0xoWU5hTm9hc3h2THVJazdY?=
 =?utf-8?B?N1ByQjVrYTFZeGhLcy9Ga0Q0NythVFphYS8zU01qd0wwbzZQN0pBN2NRMDI4?=
 =?utf-8?B?a0VtSGtxOUVVL21CRWoxY28yRWVKckVEdXY0NDVPSGdnZU90ZU1JZXRyazU3?=
 =?utf-8?B?Tk1ydmhsOWo2b3k1c0w4Tm1FT2tpa01ZNXAxMXo5SDB2Mi9lRXlMaXU4ZkFq?=
 =?utf-8?B?NkJtYXFVK0NKNmhVOVFSbDkwcTF5K0lvN0JqMitPT0RscjR3dE11MjhNQzYr?=
 =?utf-8?B?TWxrMTZpSXlya01YdHg0QlFzckYwRHFTQWVsOHNpT2trTFJjc3V5ZVRybXVi?=
 =?utf-8?B?TFRtb2VoK3FzalQ3eXd5bFZmSklmZ3VnNm44Y1hnZ3hnUXhkU09VRVBWZmNr?=
 =?utf-8?B?SnZ5ZUU0ZEtHZmhzRlVHVkxRUEpDVm9KeXhkTHZ3U0EvUHdBYnF1dFFqN05k?=
 =?utf-8?B?b2k3QTZQUTIyOHJ2YmRFY01mbm9jbTM5aHRUQnd5aThzdkp0OGNzUER4WWVU?=
 =?utf-8?B?NWdhMUhyOWNsbzFETVF1VGlxVTVxTUZWa2lCS3V2aEgwcWVmS2p0Q3JVUUVV?=
 =?utf-8?B?ZEhHUEFIV1lKcTQ3clRDOUljaEltTHhBWnNpNWdKbjhYdmppM3BPNGEzL1hZ?=
 =?utf-8?B?OWF0WHVuN285NkoyNEU1eDUzNWxLNVovOGhxcC9FbGlSVi9EbHFDOWhVVmlD?=
 =?utf-8?B?OW1hNStMRHJwSGRpTHdieGhvcVB6QjV3ZTJ4cWZwMTl3YTBEeGtvd3BZcWpy?=
 =?utf-8?B?SHowbmRyRDg3WDd5RlhJTXY1QmJNWUFXbjBYb2kya0hZbUx3dkJsSmwwNmx4?=
 =?utf-8?B?NEZZdXhXMUFvamVka0gyTk5TeGxLS284aEFJZjNCQXhOVThvRmNpejFXSkdS?=
 =?utf-8?B?dkx2K3BpcnFtVCtZemZEYWUrVFhMM3hjZnpYbzVwQTJaNmlNVnZNclFDVGMr?=
 =?utf-8?B?SU1ONHp6MzJzOHVsV2ZDc0ErVmRIOVJGUVhIbzJiT011K3JUNWFxNWVydlha?=
 =?utf-8?B?a0xTMWJ5SUhLQlduVTBIdmpaRHpjQkwwdTBMM0VuUTNKVW5TNU53NVQyZ0Vz?=
 =?utf-8?B?Q2Vvd1BqeUUyaDdiTnNlTjlvYjBERll3cHUzSE9OQ2cwRmtJbE9TbTNuc2VZ?=
 =?utf-8?B?dVc3ZGNsNkRVYnlEL3o5eUNOMFJXMjVTckFoMVZaSWRBY0Vkc092OGZRUk1G?=
 =?utf-8?B?RHNMdkVtbiszbUg1blUrVDNRTDRGNzk3MzZ3eWd4SFJlQkE3UGRlMzlxYmVx?=
 =?utf-8?B?MHlkQUdIY29ETmoxYzFSU1VuNDBPb3ljck5wd2E2SHJmYmpzRGp1ekxLZlFw?=
 =?utf-8?B?WWxqRzl0d3oyWEgvK0Q1YjNqUkRpYnFDd2FyN0dkaUFuYVZSemxMb0FQRG9m?=
 =?utf-8?B?WjlyMlpWQUErMFhvc2h2eFNGMklJY0xwbkU4TkYwYk9XUGZFd1M3Tm9wMmRB?=
 =?utf-8?B?em1SUXhjcTZyK210aFJ4RElEL0xpYVgwQVhVVEgvS0pJZ0FJS0xwZDc2OXN4?=
 =?utf-8?B?d0h6UjlRaWlpM3VsSHBCbzdoNlVBa3FrKzlEb3J0R1I2QnN2TU9EZWFKQmts?=
 =?utf-8?B?cWtBRGFwMmVPL21QZUZqOXJRQy9HT2ZvbHJKRVNlaVhONXJBb0FNbHhKcWp5?=
 =?utf-8?B?eVRHckdtWXNzeDZEL0ZTdFNrTUtJUlhLZVNiMmlleHAvUy81Y0JRMnBFYmdn?=
 =?utf-8?B?VnVSUEkrcjQzYXhtSnZFa3ZsNy9GM2xZdDRyZnJmNm1QSWZUOU1QT2c0ZFBL?=
 =?utf-8?B?cUNBbHpselZVcXR6ZnFTZ1JhMEV0NFZFVUNzZmh4U3pNQWduQThOM0xIOEhJ?=
 =?utf-8?B?d240RjZBZzJiQ0NQZnM1TThpd3BidXhXRVlCcTdhbVROb281aGpUdmtacXlG?=
 =?utf-8?B?TGhtYlU2S1ZHeHVvTjRaZHJGcVFSOUlsR3dzQUJIcTRnME9ZSktadTAva0lt?=
 =?utf-8?Q?NgvGJNNgiNRawyyromhEci0tWI8fCPCcRbjRk?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9973d7c5-72a9-477d-e8cc-08df4cb9375d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 19:04:09.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EY0eRcwxpBYstF6ur23rY0qYyix/AetWbYpOT7P5LmCisjrkZdJAkhZxYRhpWbQ98gGKmwMBo2RlZiV72YsXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_110418_674228_D277764D 
X-CRM114-Status: GOOD (  13.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpIE5vdiAyNywgMjAyNiBhdCA2OjA0IFBNIEdNVCwgSmVyb21lIEJydW5ldCB3cm90ZToK
PiBPbiAyMDI2LTExLTE4IDExOjQ3IC0wMzAwLCBEYW5pZWwgQWxtZWlkYSB3cm90ZToKPj4gCj4+
IAo+PiA+IE9uIDE4IE5vdiAyMDI2LCBhdCAxMToyNCwgR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+PiA+IAo+PiA+IE9uIFR1ZSBPY3QgMTMsIDIwMjYgYXQgNjowNyBQTSBCU1Qs
IERhbmllbCBBbG1laWRhIHdyb3RlOgo+PiA+PiBNYW55IGRyaXZlcnMgb25seSBuZWVkIGEgY2xv
Y2sgcnVubmluZyBmb3IgYXMgbG9uZyBhcyB0aGUgZGV2aWNlIGlzCj4+ID4+IGJvdW5kIGFuZCBu
ZXZlciB0b3VjaCBpdCBhZnRlcndhcmRzLiBJbiBDLCBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGFu
ZAo+PiA+PiBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpIGNvdmVyIHRoaXMgY2FzZS4K
Pj4gPj4gCj4+ID4+IEFkZCBkZXZtX2VuYWJsZSgpLCBkZXZtX2VuYWJsZV9vcHRpb25hbCgpIGFu
ZAo+PiA+PiBkZXZtX2VuYWJsZV9vcHRpb25hbF93aXRoX3JhdGUoKSwgd2hpY2ggd3JhcCB0aGUg
QyBoZWxwZXJzLiBUaGV5IHJldHVybgo+PiA+PiBubyBoYW5kbGUsIHNvIHRoZSBkcml2ZXIga2Vl
cHMgbm90aGluZyBpbiBpdHMgZGF0YSBhbmQgY2Fubm90IGNoYW5nZSB0aGUKPj4gPj4gc3RhdGUg
b2YgdGhlIGNsb2NrLiBUaGUgY2xvY2sgaXMgZGlzYWJsZWQsIHVucHJlcGFyZWQgYW5kIHB1dCB3
aGVuIHRoZQo+PiA+PiBkZXZpY2UgaXMgdW5ib3VuZC4KPj4gPj4gCj4+ID4+IFRoaXMgbWlycm9y
cyByZWd1bGF0b3I6OmRldm1fZW5hYmxlKCkgYW5kIGRldm1fZW5hYmxlX29wdGlvbmFsKCkuCj4+
ID4+IAo+PiA+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRp
YS5jb20+Cj4+ID4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlk
YUBjb2xsYWJvcmEuY29tPgo+PiA+IAo+PiA+IEdpdmVuIGFsbCB0aGUgZGV2aWNlIHJlc291cmNl
IGxpZmV0aW1lIGNoYW5nZXMsIGRvIHdlIHN0aWxsIG5lZWQgdGhpcyBub3csIG9yCj4+ID4gd291
bGQgcHV0dGluZyBhIGd1YXJkIGluIGRyaXZlciBwcml2YXRlIGRhdGEgdG8gYmUgZHJvcHBlZCBh
dXRvbWF0aWNhbGx5IHVwb24KPj4gPiB1bmJpbmQgYmUgc3VmZmljaWVudD8KPj4gCj4+IEkgdGhp
bmsgd2Ugc2hvdWxkIHN0aWxsIHByb3ZpZGUgdGhpcy4gTWFueSBkcml2ZXJzIG9ubHkgY2FyZSB0
aGF0IHRoZSBjbG9jayBiZQo+PiBlbmFibGVkIGF0IGEgZ2l2ZW4gcmF0ZSwgYW5kIGRvIG5vdCBj
YXJlIGFib3V0IHRoZSBoYW5kbGUuIEkgdGhpbmsgdGhpcyBoYXMKPj4gbGl0dGxlIHRvIGRvIHdp
dGggQyBvciBSdXN0IGFuZCBzaG91bGQgYmUgc3VwcG9ydGVkIGluIFJ1c3QgdG9vLgo+PiAKPj4g
4oCUIERhbmllbAo+Cj4gR2FyeSwgaXMgdGhpcyBPSyB3aXRoIHlvdSA/IGlmIGl0IGlzLCBJIGNh
biB0YWtlIGFzIGl0IGlzLgoKSXQncyBhIGJpdCBhZ2FpbnN0IHRoZSB0cmVuZCB0aGF0IHdlJ3Jl
IGRvaW5nIGVsc2V3aGVyZSB3aGVyZSB0aGluZ3MgdGhhdCBhcmUKbWFuYWdlZCBBUElzIGFyZSBj
aGFuZ2VkIHRvIGJlY29tZSBndWFyZHMgdGhhdCBnZXRzIGVtYmVkZGVkIGluIGRyaXZlcnMgKHNv
IHRoZQpsaWZldGltZSByZWxhdGlvbnNoaXAgaXMgdHJhY2tlZCBieSB0aGUgdHlwZSBzeXN0ZW0p
LiBUaGF0IHNhaWQsIGNsay9yZWd1bGF0b3JzCnVzdWFsbHkgZG9uJ3QgaW50ZXJhY3Qgd2l0aCBv
dGhlciBkZXZpY2UgcmVzb3VyY2VzLCBzbyBwcm9iYWJseSBrZWVwaW5nIGRldm0gaXMKZmluZSwg
c28gbm90IGEgYmxvY2tpbmcgY29uY2VybiBmcm9tIG1lLgoKVGhhdCBzYWlkLCBJJ2QgbGlrZSB0
byBoZWFyIERhbmlsbydzIHRob3VnaHQgb24gdGhpcyBvbmUuCgpCZXN0LApHYXJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
