Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4174A1099B32
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd9xRdqA5xvZYrqkdqosP20JyPJZg9Bm4CXSLd5lOvk=; b=OieP14+LkxdKdn
	975BweC8kBxOrz+hMBhGzABOhN4UfRz1DIcqGWhFvij/aiHOMSkzuc328UiewyoNwzfNjddwfgMmp
	Qd9kG+ynvvG/tccK9XzAtAf0N6WjITQdIWqBCEldicmgLWBocG5g4krvY6UqeWsjUn3//SoiiqJ9G
	qO7RfTXdw7+ndkbFr5ta5m/jlNEKsDi5csmWyGTU2tP5Y8/GF9Kro35x/8MX5DgeY2syOjSmskGis
	2StpnfOcZWSG85+bly13vRvhZ6aRN7ABgv8hUMBIrMUaKuY50AV+Kc3PhVrDxEPjTV3fpss78DrB5
	4iW10axrmOpVQo64z1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fDz-0000000DQ9V-3zXd;
	Fri, 20 Mar 2026 19:09:35 +0000
Received: from mail-uksouthazon11022141.outbound.protection.outlook.com ([52.101.96.141] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fDx-0000000DQ8B-243g
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 19:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWsBUEeZc9Xn/C/hJ56cBE7olRPBTYXX/k0Lv/lLDTw99sj4C6X7Va+25WC6w5xhyD6aywFwI14pdGM97q8o+rKKy5PhPvNjYB/06aD1vLOvqTAPQdD8YcaGI0xkey5fwvru3937QMVQC7aHw9sQ3OaaAE0R/T7ZA9LnuBQj0OaGHvRKW+x35xLVFJhgKrt2czh5zguxJjf6Xm1ZW83wMiV0/39wyNJ8hdd39cCTPcEmLFnwKOa1PdKvhwYQZiAL5aLf5rj2X8VQiWcoC/hgPq/pq0OGEl29myZZ2FbZBkljmTsEKbmqHzkdK+VvPirYiTeqKpmFUmuMlkpKt/IlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoEi1kGDWwx3oZIj8f4K51zzKs5bAdWFOJa1H/jqfoM=;
 b=jYTfMisQRNvnmGYd1jX4S3RZC5TL5Y5XfWWlT3ONZ6pI0ww+nyOAkg0usq8Mwegy7GpVzyJ0HsonaGOU+5jMvVw04ogKSCKWR4IjfkKsQz1wXUTbDuWqKICJElr7t95tLwXB0W8EMQK16p/xcrBM+WVxO7rdqebwiNLtTjOA7zy1pCMnniQKETX5ftI2YtJkwbhuW9P3OqURiXJpkSmM9epvHYCL/RaXqH72mgk+AVo+06hK+iumBfLczr8qMRpUqt0kwwd5kvSNzcazxJhtlvNi6jQSwpe46UhlfcLYlFNZcuYYe2wDEMoer9+y/x9bgNRZdzKCbuJxgx4D9PV0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoEi1kGDWwx3oZIj8f4K51zzKs5bAdWFOJa1H/jqfoM=;
 b=AGcN9ibxBXfGzfZSm+AQPzdLdzhwnO8u31KBZWQpvu+R3ekRH8DhHyj5pu97zqtWNJyJge6vVo/NoSQlnn5DuAIrprTSsTPV9dIj7tN5t4B9kMtdfadrCxbQBCsRnYZNY4cTzPeny/Tn/mFe6XXfUMDq9gMGEwFoAMwTDdjLbQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6349.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 19:09:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 19:09:29 +0000
Date: Fri, 20 Mar 2026 19:09:29 +0000
Message-Id: <DH7UHINYV0ED.383QP8YXWF5RD@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] gpu: nova-core: convert PMC registers to
 kernel register macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260320-b4-nova-register-v2-0-88fcf103e8d4@nvidia.com>
 <20260320-b4-nova-register-v2-1-88fcf103e8d4@nvidia.com>
In-Reply-To: <20260320-b4-nova-register-v2-1-88fcf103e8d4@nvidia.com>
X-ClientProxiedBy: LO2P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: b5436c8a-d400-4340-c88d-08de86b43663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|7053199007|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 0/KvFq54Evfkx0wRajP/qkgT8M/uVPhD6zHFeeUb7NdwjKciFqhomB/mMfslKHcq3rEDrsKTirhqOCvvWgex4ahaK3OLe0QpHbRkoI6l/fb7D7uFa000GG037bby3GaA/x8+SaAgVOv7DY954Sny/DqMRNMk3mIl/md+OT8xQZ+NaOAcbYGKAEhVLdP3GYIKO/zn0qpFYhPFanTngI/6Nt6Kh6H5tBWQS6JKPjWnH80bM+JkZ8m3TtE4CeA5UxQjRFEY6X8t558jks5WsAziXhjGpg43XnDCH7DYqoV0mVU3n+KnV+607sb7V+Bi5Ek0c0pN42GVIwwzoXkoPGBagaPiJmX0sVt6u+9ScThv6rzBvmGWATcEOu9OgmVGc5mwVbA/MLZdfllOxvVYGxh/w4G+3RIRFhhoH8VgKRWSSS9H4zWM9FJlt8O5X6ad9k6A59Yk1SCB72xqXRUi3HZkqgXnoKOLtMKV+xMsGKrCE26oNoOaJEhFAVjR/UOOKJvgOZP9Jjwg6i9iDolzZt37ZG1LbtKVrQ8pol0v7QyBmy1rYzbfjPgtRfDc5V6I8FjSXWB+157UQWf/3ReKZ3cHCV8AFSlz3Q2MTPNjNaJVRmNNpFn0riKvTbnp+rSOBWhLymObEy4PzVL7dE1iIhm18WDAgZi4MR0pIHnKvQelkYXAjm+RXzOjLWM0ekMj0eaqOowC0iWbPfCDvEjjdMCoXSmc+sMry8QzJOnoNZFNqRh3h2RIDBBCL4zCyXD0xNXWHJeaqWdIzLwouehGFeuNYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(7053199007)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpFUHVZN0tHU29keFkzYTVUdDNiUUJEbWZnR1FKdGcxVnlHb2F1a0Z1cjA1?=
 =?utf-8?B?RWxlS1JockdCdk5TVVZTSC91YkdSd1RXczdmNEs2TFd2N2xVUnNlYVh5YWgr?=
 =?utf-8?B?V3ZEaUhXcEEvSmI0RDd6eTlZWDdCRDd6Mk5Ta084WUQ4NElrVzhHdUhHRy9R?=
 =?utf-8?B?ZHhkNXF6SUZ3T2k5Wis1MmpULzNCSStkUFFoRzA5R0N6dlVQbVBuTDltNTBV?=
 =?utf-8?B?Q242aEVCOHd1Q3lNY0RjcGE4N0kyQUtBTkJzbXdsMXhVL2wrbjU3S09ZbXZ1?=
 =?utf-8?B?cGVjL0hWVDhNYUhNcndOK3NxRmRzTkIxRHBxRERJSzFlZk9xWXF0U2U2TUJn?=
 =?utf-8?B?UnRkTENOcUhNM2NDNEZWNFpUcE5XMWRNRHpobHZndmdHMjFxYXJKK0VHL2ll?=
 =?utf-8?B?YlVGbmdlQmdEWnl0L21Jc2ZjMThveEltZXg4K2tLZU5jUlA0L21sWFlKcXRr?=
 =?utf-8?B?Z3cvTGcwZW50aWhNTWZ3YzlFMisrL0duNjNzL3g5YTZVRjVNeDlPa2NjNjdY?=
 =?utf-8?B?bCtkWUowS3Q0Q1luTURKeHdTWEFUOWZMcUNRRG9jV0dQcnpVZUVzL3FabTZF?=
 =?utf-8?B?aStjMGxrWXREZ0NHQ2JFY3FWU1h4Q0dJYkdub3FjRFZ1bEpoYjc0a0RlcWVl?=
 =?utf-8?B?SVVGdFZkeUlXSVd0VlFPcE81aC9QakhCbG5zVWxjK1p2ZysxTDMzMCs3ZXJZ?=
 =?utf-8?B?blhlNkYzcGJKYlk2bWxuam9idXc3ZlRmbTh2UmhvNERmNTBrZ2ZFN002cTN5?=
 =?utf-8?B?LzZUMDVBN2VDd3JjTm4wNmFTQUw0YnRLVzVXcDY1K2FuYlZjUmE2U1hwYTYy?=
 =?utf-8?B?TytDcnJmYS9ESjZuaEQ3dEF6clFBWVc4Z0Z3cUNYbTZOc2JIUjVDcEdsZUlT?=
 =?utf-8?B?Q0h1Ukw5Tmpta2pveWxGa2lTNFFmanBPN1ZZNml0ZG5HcktPM0JtY3NMbWxD?=
 =?utf-8?B?ZTBWSXB6VjJOYWZKaXVDWUhSWmNmSWp4V3NqRCsxclRVUTd3NHprSkdRMXFz?=
 =?utf-8?B?VXVka2E3RDVLWWtxY3RhcmNOdHRlZlpTa2NQbVhiRjloaHpkclY4WHNidmM1?=
 =?utf-8?B?bDJhY3h4a1NzVDlMUnp4czNtRUpTMG9NYnl0YzVDSEQrU01iOFU3VzlTbzNS?=
 =?utf-8?B?Q0YzZUZwWFJFaXFLc09jWnZTbGU4a3M2R0h3UGV2aGNKZVZwN291b012Y05y?=
 =?utf-8?B?b3EzZlNnOGlQd3hXcyt2RWtpVkZmclJ0SGNlQm9YT2ZScTRJdVN2SVdMVFA1?=
 =?utf-8?B?Yko1NUI5YnBHcjJidEZaeklDc3NhbE1oeHJoTXZ6KzRVWXEwcmJ0YUNuV2JZ?=
 =?utf-8?B?bXBnOGdBTTJzNmIzeVZpaXlKdVlFU2VEdFZLdndEYzJwQ3l5RzZicERDaUdl?=
 =?utf-8?B?UE9UM1FaN3ZEVytCem45bGRjM1l5SUp4R0JCQmVKcTNYd1VBR3ZZeXZxcTlp?=
 =?utf-8?B?d0xxNFNUVjZXZnAzVlpDUlZvK2tYV1lJdVM1b1N4QldJeC9lWTA4bFg1RXVX?=
 =?utf-8?B?RzNOeTI0ZytjcG5QaW5sZFZ2V2JlOVhzSVY2ZnRKeldvZzlMN2xGWFdtcDg0?=
 =?utf-8?B?ejI2Y0gxOG5PTjBXeXA1TVd2TTZhRWVzUFdOMGJxU2hlbGtkSGVrWWZjbnNP?=
 =?utf-8?B?ZlZGcDROWjlNMjJWMnZUN3BHdGNPbFMyMzJCNXhYVllFL3BzNVBrdytROGRW?=
 =?utf-8?B?S05GcGxYSitwZGR1bklpQmRqTHZwSE1xaVM0d2FMUVdiakxxNUlNbjZ1S25t?=
 =?utf-8?B?Y0puSk9RL0hzbGNYVGxoZDFlbU1ZVGVrS3c4SVFzY0luVkEyWHFzYVY1RUVs?=
 =?utf-8?B?NlpJMmVnVnFkaGNxMU5zSjFPelo0L0t4aVdzK3ZuVWJHNDdNZVk1Z0oxamhN?=
 =?utf-8?B?U2JIM3MwMzZWYnRxa2lwY0ZxYkEzVFIwZzJ1eU8vOFUxak5OUi8vbFZBUXU0?=
 =?utf-8?B?WWc5YnVkbWNycmdZRTNCejRhTVUxRU9JN0haYmNQd0xkZENrZGtVR3IyUXJn?=
 =?utf-8?B?WXkxVmEyNmovMHBnek5oMnlQS29aUFl6azZ6cXFsZ1pBaUVpcmtVdjhEeE1N?=
 =?utf-8?B?aGhSNXQzUVB2T25kamxvTFhyNmxnMnJBdnBLeVJGc0xpUDkxQTVSMU0waHps?=
 =?utf-8?B?M0J5QzR5aCtrd0F3Q2NVOHNyR00yVGlzVzEzMC90R0NyTkZjUXNWekkwakFv?=
 =?utf-8?B?U3JWdDJnZkVtd1ZPSUFNemVISUp4Vk1NRnZDVUo1TVVJUHpDaDRLMU9kQUZC?=
 =?utf-8?B?MnpuUDRGcGVwZjBoUXgzNjR6eU1NNTRIVmZRZWdSaEk1aUJzcmpMVnZoZThw?=
 =?utf-8?B?Z1BQY0xHS0g5WTVJUm1nd2ovMmJSQnVwOEo4TjNOdi9ZRFpmcUF5dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b5436c8a-d400-4340-c88d-08de86b43663
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:09:29.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDLthuHSCffU8aMOn6beGmYLvarJHKq8kYN98+b+/Vgy6MSAnIWPH27O+W3ZkjdP5JoBg+z/1+i8LLgf3Wub+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_120933_533630_05573527 
X-CRM114-Status: UNSURE (   6.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri Mar 20, 2026 at 12:19 PM GMT, Alexandre Courbot wrote:
> Convert all PMC registers to use the kernel's register macro and update
> the code accordingly.
>
> nova-core's registers have some constant properties (like a 32-bit size
> and a crate visibility), so introduce the `nv_reg` macro to shorten
> their declaration.

This part of commit message should be removed.

Best,
Gary

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
