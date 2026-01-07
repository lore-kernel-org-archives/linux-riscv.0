Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0ABD0D14B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LWVBihY5k9DQvPUTHYLKwZk2RfOkbPC1K2AGjkGys0=; b=qjVaT0Ff/1O4G2
	t+6sNqSi+TxBaa8jVgzwFEQ/pBcmxTrPQmBN13dagwGnO/JobHEVD81TJ0ZwAuWMvHR50cUFBE9Vc
	vJyVE4qF7mXtRj+O9C+0cjZ2LdSPWLt9auj1NFYpcpE7ek0Tcs06m/eO9Ff0KzRxC1tE25KHUKId3
	uQ5y6+H7O7r95hlSATQL0VftjnS7V0uEBisU7RYkiKzW89A7vlUQ2FFiv111EsGiVVS4onj/Qe8FX
	NHM3X6iBxT4j8Ykp5h6Q6rdTpJuKSTFJDMhEoCPytRce7/ksiU6dV6f3Pt+CDlptf2oT7XLoQgXt8
	wTU4Q6O22DjshuVnL6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXRW-0000000FNct-3Kj1;
	Wed, 07 Jan 2026 17:35:34 +0000
Received: from mail-uksouthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c205::5] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXRT-0000000FNcW-3WiV
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 17:35:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSWIjdx5hk4gHhbWTuseICfFekhEL7noHMZE4PDRDNahsXUiO5RYmmUnFZ6RapxEDI+cnJXYlcUTeF5i4NyGY70cK7Ow+myE7QKfQrKaXCD8FCRMSPwDKd3WSPPgnmvQxkfNTDs6IuiWKG4rOK11geNr7FOf5mCDUn42yC8LRah1zSjh/94X6JxcwINLxmXveaJBFILavo2PAQTDvILJYKxaGtjEhc5gaz0JnHJHDGWthGpllUVHK+MvFOvnEWY6bruG84HD2A3fGRBmgR38J4PR+qSZZSWcLgwJdcmylrJODnmfnCBAYIjD8oKBZMSsHTr+XlFeworUG4lxstkCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAyWIQ2KLkFvsHf0ra/WOby/OMBj1Gpmah+5bPWhk3E=;
 b=PZazAIUHElO30+Wd8ssQOQZ0ehCrVQQb40nxZguICCcylG84cwsIOhuqK3cfJ0LOFNhb2jBUSsq4Qg1hcJxLJw+lT1x9VqCsqPwtA0QB054JXKNbptoykqSHn+rN5fmCXBWgJxLtLy50gbZcwDrL8b/6c7InDPE3i93v2IOccjZVbSK5ZdSIt2f5cnZIOXXIHojqfwb0wwhqMTEpsZenBcq5CeLv47KxvxK9h9GolyoEhihPIwQ4PFznHOnxv9S96wbMbG3fxc87LXeti0rtCRwaBNRreU1Hzhrk+u1x5+jHrDVmTmY6j8km7Mc9VIHhA1ia9u51tGUK5j5fwlPbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAyWIQ2KLkFvsHf0ra/WOby/OMBj1Gpmah+5bPWhk3E=;
 b=IRAvgd8BFQFkdseZnO2Cd2JNrNYCRurXmUdvtBJ48Pga3JUOnQylJ6AtcqY58Xqi+Ul5Pszy3aWC67ZN9/JjIUiiqAEccwLQ54/ETq/LreQHgddHVY7PR0xQbrAIKbERqJ0qwV8gsXJV5YmgjOop9Me3q1RWFihtk00WWjJPAfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6264.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:35:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:35:25 +0000
Date: Wed, 7 Jan 2026 17:35:23 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, "Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?=" <ukleinek@kernel.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, "
 =?UTF-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Implement Send and Sync for clk
Message-ID: <20260107173523.5550b5e8.gary@garyguo.net>
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
X-ClientProxiedBy: LO4P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b70c78-3bd4-42e6-e7d7-08de4e132458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BdbftHq9m/k8rUDQUtobCOUOdllmt6NkT6B1m8IwIqHPdpWSrJ6/4G14/H6r?=
 =?us-ascii?Q?Mcc3ZBvNsaR0uVngXb3GmUZQXCLEB13kSZyQw+fKjWyTDJRjoHuulcVsnPv6?=
 =?us-ascii?Q?AToMIu7zwz48hZuCHuu94tWpeop0zmvNKxq9/RPruY73HpOAnUuQ7gFOzw0e?=
 =?us-ascii?Q?sU60eZGgPcmFnbI5Vf+vHuWOA+vskVJj/0rnzylLoTsKDIoiFkwBWw/RDqye?=
 =?us-ascii?Q?vBGCTnSYoyWRG1TZPn24JXvP70LNt2c084k7u8yBQNb/E4rsm6t6xbzw3Fdp?=
 =?us-ascii?Q?X9byrVTSS16qaSWQT45CW6jaxG28+B5EojNTWcEuhyMPgOAIj2HWw2TyiqFO?=
 =?us-ascii?Q?9PiRV841RzMlvkFoV+/0YvoAgNGZz/oUFT1/VSa1eUX5FqiEDCktH2u0uwEz?=
 =?us-ascii?Q?+LXqoTO2Oz59vWAWEzPDqO6OygXPinFbM6+3kSkm3yRc6GEMIPe4cYt8nk9o?=
 =?us-ascii?Q?p0lUJpoo9QMcy7nHFYoBNOKpS6l7jhc9qrOKQOskdXRMDSYpoi6m2vnwrT9d?=
 =?us-ascii?Q?7ePKW2Vju86QjyyIC0vOwBwRuui/dXILC7s7j65hcq7h2Y+uksWEriMXCiZ5?=
 =?us-ascii?Q?6T7iG3btnHceeWMvohhQgn5rSoosLxsCYNew4tJW3ZHVHRNTzBGYEqqmQ9SB?=
 =?us-ascii?Q?pi+BoZrUphnQWZ3sl7Xmb5TBNQJRyp+SiJLu8qKXfD2fYGwj/KgFSeh//ayc?=
 =?us-ascii?Q?KxYfHOhHWp9IoRJ/PhL+hIfDV4MFDqkcHfoqKdVBuUShbdj9UtyWpem5ltV5?=
 =?us-ascii?Q?09i/+n8sApL2VW5/88fe7K5MB9/PWTCyiRVxN69gVX/QTfeFQKd2zz2Sz2Kr?=
 =?us-ascii?Q?xSzZxLHoqlOvtPUWmV1VpCFIosOBiyp7pmyVUYHeaG76EqOZbm6jnTDo5493?=
 =?us-ascii?Q?0qKoKa3jtWNUBniToy7c0Rplg7BuPV/A34MhHJTOkiD4F1cXrOBKzyI0PRxx?=
 =?us-ascii?Q?1HBxvl4SFN1hLMdeDW3JU+ar7LcfMSusqxchWCQqmsvsbn0hzNQZ+a4OVn9n?=
 =?us-ascii?Q?HSfOMWAGgmovcXCoDxt/At5m376XhKSzDYGJ6M68J4uw5gu6RaCKIOpd9XdH?=
 =?us-ascii?Q?Q+hKpHtogXmbrdLb20HtkI5F7w7VxBKera+glZUEmMDE3wTQzteTiES/IB1/?=
 =?us-ascii?Q?/FTyntwtjpYFt1eCk2FU6eSMYYEYzN/fJp5ZRFtNPBAvYtw+qFX9lLUNovDW?=
 =?us-ascii?Q?iqv8t6w6e3fD7FFHIEkbZkSB4/8RqtVoRIfxMNRXBtvpeyI3dgqlyhaVcBhC?=
 =?us-ascii?Q?WqGY/0udTLP8qvDbvan7gO0IxD/RRvRHSAgGj/am4MYUlCWIN2LgBHAsJb6K?=
 =?us-ascii?Q?loY5ej0MCpy5LcU5/yAqyhLti2HUVfJPlJtw8k9AwIQRnCcKD7L21bhqqECk?=
 =?us-ascii?Q?1VmIQHYeDF9YGiTZDm52eTP9Da/4AW3RXGIcyuin4c23n+ROEWaKuU0iO+Aw?=
 =?us-ascii?Q?v3Uyzx7v59G0CdQydFnz9yUIwyM1g51x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHNzthN/oyALapL460T6r7Ykn92538Z14QolaA8pbN4DeiAwCqSEmNJ84tOj?=
 =?us-ascii?Q?WCchtz5VecuDgGhiZ7dwvSFBApwjHlE6K70apmIQt5xXrrRmKslXCR/RbJDv?=
 =?us-ascii?Q?/XkuJlLHEwsCEOvfZZThK3mBB4+3y9STz0NTqm2vcMwMB0Y0W5Aa4TYuHTJ9?=
 =?us-ascii?Q?M9OABO4rzaOr/Dl4lwVzXc8WpjjYiJO8AIUe0NG27wOlpm9IzIXxektDeF/P?=
 =?us-ascii?Q?D7NtV27rFGWk/UhNsAPh8mJJdnUo/nCES3xinRcYTreSmMrhbC/smye5yozf?=
 =?us-ascii?Q?s573uQKEgrw/zq9PxrMZ8pDcYInNOwXUFtbXVlNXNN9qsgysvm512D8aJ6ni?=
 =?us-ascii?Q?9XYXhWvsQw8qXoM3MUv3DvsSGRNJfJes5WElu3GTlXDkAkMIoGTkC3/74nbZ?=
 =?us-ascii?Q?iN/01qAzcT4kZILWqP6eNayV7DI7rUV6QmEcZ3hxQmfiHiCFitxSYg7wunAt?=
 =?us-ascii?Q?5fkLfhEkQiKr1MLUcUx5Ocorh+1vMa+hSxPspWmWevXeLjNlpjBU37BnhMLa?=
 =?us-ascii?Q?cJei40ZTuwFLxY0I6wcxNZBnfLq3UQWWZAlYP2syF/FUaXQgWtbERfvFSUfp?=
 =?us-ascii?Q?9wy1aJ8A3sIuIISqqpK8J9MBaUwptGD8CspZztz8wCOBanmmirM/74PsGfkk?=
 =?us-ascii?Q?KZ5gVrZZOt0TK3OoQaZ94Ua6CqtpMVNAUqaiUGRnRxJvL17rYvjtWkT5GiLs?=
 =?us-ascii?Q?FeO7ZvwU6aa+iRK2tykw9UHWelHvk8DV/rIxOShnGbAVkc5R9ZeEpqUsDKYC?=
 =?us-ascii?Q?CDlfgJXbMdhfVPFIxphYMLP59/0oaMSgnMRQZ/E+CbuEyWjiyWInKXdSJIGP?=
 =?us-ascii?Q?TImHCqs8Zno/r1peaz4M+/jMr2R6zNNXIpC5npGFoa9rAjxF2zXyDjb6WtEm?=
 =?us-ascii?Q?GgMz4f/fr7DPPdR6ECDek9nDMlDrHJ+M/C6t3WtbKYtwqwjftGlu7r+oUIdg?=
 =?us-ascii?Q?V8M6rJuvjTqhKUTD69HbbPAddy2WTPwJswr50vM0jlF7/HgymBVaAk9h785i?=
 =?us-ascii?Q?6ISvg4yBvXQEaJn79EsOXHCDZz3+vbWg7RIQyxY8E8HGh5vI7B6FcJlDzLY+?=
 =?us-ascii?Q?cbB3foUg1O8t2MIMbjX2vpA8Xmz8+A5X1HzZ95Bf52f9W7CRCsu7JBvNHNhA?=
 =?us-ascii?Q?QqTx7nxwPFdEUAlgr1NtvmnNIkXrb6XtjEqisFNcByWDQHm4bBBEheCKDpzm?=
 =?us-ascii?Q?u/1tEkXjkoe+OjxX0sIsrHc3iIHXbwhfw5ZodCu6LoKAzz6DnocPbaDoMKjn?=
 =?us-ascii?Q?18GgPR1djvLOl5RCPQeJCKfnA24o8y/iVMP6SyxWNLfi6qkqhByqpME+0d0+?=
 =?us-ascii?Q?EwmZWcIUDGNrIYMnSsZv6uXWTEjR9fOqEfGbv5EGXq47yaLhZ2lsFTmn2ZKV?=
 =?us-ascii?Q?9CSH9v7gWWsIQGPFExBJM574sDOz1yw7qedNxu+hEedJZ5xrXo3SjAyx7pZD?=
 =?us-ascii?Q?rZDYi4o37OBJJ6LsvuO/+RelQyeGO41FTdwbvYoRpk73i2vwjRgH0x+n6dpJ?=
 =?us-ascii?Q?rAe/Bi1I3hXFcPxkhINRvE7wx3MxtBOfvELF1+H5EJKr2RhLKpYuN5IRSDjB?=
 =?us-ascii?Q?a4/FLXUELWL7pWDN2hIDA8SVwC9S568LpjDKA4dCKC+F9K9OO9QwhnhO8rhL?=
 =?us-ascii?Q?jxi2DHy0n7RwGg5gPMM1ZUQo2DzkBqmFVD68xQI5mGyU2xOzc/IKOqy8gjyN?=
 =?us-ascii?Q?w30w20Fm5Yyaf62k1qidd4lBh5sANKL6r64pm3T9sYapsoAZ5Wo+B1SqT5u+?=
 =?us-ascii?Q?zTB8haXykQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b70c78-3bd4-42e6-e7d7-08de4e132458
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:35:25.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEDOXcK30LRiGoKJU4fBSyMWdzKQ2kXnmMjzeSXsGyMu7YIGZ2D9AzWco+kXOad6fn1TuXxoebHMpCocLlXviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_093531_921319_97B2DFDF 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, 18 Dec 2025 13:27:39 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> The Clk type is thread-safe, so let's mark it as thread-safe in the type
> system. This lets us get rid of hacks in drivers.
> 
> For Stephen's clk tree.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

For the series:

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> Changes in v3:
> - Rebase on v6.19-rc1.
> - Pick up tags.
> - Add fix for pwm driver as well.
> - Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com
> 
> Changes in v2:
> - Rebase on v6.18-rc1.
> - Add patch to tyr driver.
> - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com
> 
> ---
> Alice Ryhl (3):
>       rust: clk: implement Send and Sync
>       tyr: remove impl Send/Sync for TyrData
>       pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
> 
>  drivers/gpu/drm/tyr/driver.rs | 12 ------------
>  drivers/pwm/pwm_th1520.rs     | 15 ---------------
>  rust/kernel/clk.rs            |  7 +++++++
>  3 files changed, 7 insertions(+), 27 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250904-clk-send-sync-3cfa7f4e1ce2
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
