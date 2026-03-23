Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF45F46127
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJms+O86J9iD9GwC+b7OkwHRGGDQZhfJ/SN0CqVH5Vs=; b=hUr/yx8ch+Ir/h
	YreJB6HFEvyWcYgmWQoJ9dfNLVS6DMTFviK/70mJNxRKzPW9cmL74wv6/nzHaCN0clZp5wEEQkeja
	Yy8BdqKAslA1bBJQHyizzILxoizs1mZIX2Yd8iy62gQgHf1255IkOXTfxeoc1rvmykwmzxzb8LQS0
	+ddYy3AWxYvzXKw26slmqLgz8qv7yZAd2cLChqvoYrgptbwLlTAtJZDO4PSZu31ZzbWzzEa3QQ7xQ
	Pf3VjGKBIejDGu/444hzqXH5Q0Rwzp92+Z5sutZsNlaOQMzq1GDuGbHukhAXQlsMp3EfSXWiE8FRX
	4Y14RZLNLocvy4MhpHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g0i-0000000GtyY-1pM8;
	Mon, 23 Mar 2026 14:12:04 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g0f-0000000Gtxp-0sqi
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 14:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxOYiJBfOlyi86cnyYLePSx5PbXsUiAbO1IgOt+DI2HsLsXt8ft2ZqivG4VrWNpWQMJd+ga2/5AMo7ihJENvO4BbQuqlHpvB4E+IOWnQc//55UFDcEl8e/ysdTs5U0+jvDxOZP/U5le/Vd7bMD6/fJZcgK0hFqrwSbnqhQH2v2bmk+0RgFtbfF4aA6j2jWoZk5K03B9YrXoWO/ieqYG1THetmKbSozyetzYeFQeP8tRTIr62ftSd1yrd9ngM0tD2kfdDVmAOkdvT78KYwlz7c+0SHHxTgYN1TualnRf6Vqo8KeyOySOUbb4WdizLYuWRSzGtxq0n/cCdaUm0IMBkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gy5rEUT2APkeE3WGeo2E3eWqTaSb8kgNVX6qZ0NVrI=;
 b=dCrtyMrt2GMnwLx9e2mnOIySx3A3D/P7fGVfViibql7Q2fbP5qHr0oOgD1d1K6eX8xwX2YCaKpF/mhO+8bNqdbcrN3lgBC9ICiAoKn7fqSHoeMjj64z7n5mPNnNQa0AGhBWqBmMfARNXItsulzMwwG7l/pv1jt6ZsU/ih44XWXfnp5GZRv55//MFA76FzYWghrEjekLtftam1l+aSYWkPnxiqEMDrC8fWZOxP0TVxMWAaEzU5SC9+p26f3BG+UeOTh8zKuUD2BXuPdcpNSead7mKL0CZ4gWztaI64FgzJSTWNq7d9d38JNf1bbNI3rdEVttb1JMUAMv9JIIx3+oXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Gy5rEUT2APkeE3WGeo2E3eWqTaSb8kgNVX6qZ0NVrI=;
 b=MO3XXNqKsLwNT/MOli+rsZZOzXULFea5Q9AWyKVPiicbit+lH15x/DBj+g2LwOW93NUWodhM6xov46wKzrU3bJiQZiCrQofgAH8NuDUHf6oRo3LPJKckQCedmYcwD0HMVCENg9HukWi0FgW87c9OxUPSNLx35l6Vf6yExf6Ep9sbA1xBV8W9tZoJ2gOBk4OTg0UYBCTvVU4TlpKhtoGOkER3X3H5MJET2ZXqr065ckyhBGVrGkOqFL1II6eZZJ6ICGlnBDMPeMcNxob0mH02ftUotd+jYr3ogiwi0Q61fWRX3sWBq8SCjV7M1zz2tAjUt7wQKvl+y+nNE0ICFJW7IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9613.namprd12.prod.outlook.com (2603:10b6:8:276::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:11:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 14:11:49 +0000
Date: Mon, 23 Mar 2026 23:11:45 +0900
Message-Id: <DHA81784G24U.1446CUTJC271J@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 01/10] gpu: nova-core: convert PMC registers to
 kernel register macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>
 <DHA4EQAOO8QW.3AFGNJZFQX6N7@kernel.org>
In-Reply-To: <DHA4EQAOO8QW.3AFGNJZFQX6N7@kernel.org>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9613:EE_
X-MS-Office365-Filtering-Correlation-Id: 470a1ea5-fa6b-4cf9-b955-08de88e61fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f7TRLLCdp3t6bmwy2q/OgiHArhu4/1DJUzIMXFFUALsDt3XINBxI1uCAdP63PDNofkx5UodAkiutBoL2zAnqIaBu/Y51QfX4xf+g4IrG/iweLRHiadZHSzw4O+Rb+vO0iPfcSH1XU954PZGehGX5U48oJ8ydVZmeB2pbvB95ok7kCVQllsA+wvv0UuSSRyRhvsDuAazOOazV+e2dwhYVjgZRqYGY4Zl2ipxocSO9EhtqhYU3pf5M7ZiBerRxvlQ9CXvgZ9dkCkUfc2sMdnnl3zN7sIfCYFQqrwIwPtzhP8yMsWOJtBFjvpLIpCg5gTJW1cLdU+KCwLfQsD3cd8ComhJuCeUYU6CKQy/GhIjnFPqyJog+xmmkI6UrwewPjwwFrJJ+BVIvGOumrUi4BNDcwJ4HR0azGhv0nH9g361n78EA/DKI+99tiHd/YDIy12oG1voMwhNozftLfax0gtfv+BjmFtBu2oyrs4Iq9fQthMVe6Vt6oRq2KKNXi1CcHyaN6Ns9SDXsaFmaV8jIyaCC8Zce8ed3jh1UVir6tcI5DB4mRQArLCqgWvue+ex5CRDk8RWzUJJKEhlwNWjnFPFlH/ikN72TWRmWjxgWgTTOblyOJ7BxzkNDTibFlAfREcaUFuYFZp3DXR3gdxy24e1B2SAxWTrrDos+s9dMKHXRob8PUhHB7z6/JogBdOlk8i5jKRCFoqE2EXrjfKnnVXAXDu2wtrtsyU9YYIV4IhOAgIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpBYlZrcXB4UVRsaytqT0MxZjd0Q3pOSVluODRXS3BQU2VkdTNMckdLdVlh?=
 =?utf-8?B?Q2tSaE1aS1hwZ1AwdXFONm03SHN1U016bGFUSFJhNUxQaWdLanQwemJYc2VF?=
 =?utf-8?B?cnhaS0Jhekg0WHlBalB1VlZFdjR3WnFPdnlVdmRSNndvM05yYUowQU0zZDlU?=
 =?utf-8?B?empsK2tpMG9oUzNkMjA2VHI5ZEJOdnMrQnNRbFY1aVI3UnplSVgwS0FaRVFs?=
 =?utf-8?B?TUlpeGd5S0JRbFMyZXJMd3J2TmZPS3dsRWhsbHhvbGR6WFZmcm8rQkU2bThF?=
 =?utf-8?B?ckxYWmNDbytzaWtETCtXSUZ1MzF1MFhOVndwZzArcTU0M1YwbGFqalpFTmFU?=
 =?utf-8?B?bHVuSFRNZU90ZGdNQ21HT2FQdzArOWZNYjF0eEo0a1ZmZU41VmEreWRDbkU3?=
 =?utf-8?B?K0pINnJFTjA2WlA3TjdiZ09aZDEyQzBYaUFGTjdOd3lDNmdYVlExc3hwUnNn?=
 =?utf-8?B?bG9zakRzWW85b2N0UC9FZllEUnh2UVVHeXVSN21rckRIRVFodjBXOE1kMUpv?=
 =?utf-8?B?UU9PQXFaODZqa25RbnRsK3N6SGNCOURNbVRYQi9Zc1Jtd1ErbUhOQ0haZzFP?=
 =?utf-8?B?T2JXMVZHRkcxdXEzOFd1aktOeHVlRkozbUUyN0NZcjVRWWhMOUtVUmZSaCtV?=
 =?utf-8?B?aXpFSllZcWxnRE9iZW0xajI2TGVqbXR3dDNEa3ZlTlV1cjk3Z1FmNTRpbHl4?=
 =?utf-8?B?WnlpVFkrVW0reldYR3oySTA3Wkd3UzRjbjBrdURuODUzZjkxQWlKRWU2c3Jr?=
 =?utf-8?B?MWQ1WXhLUzYzSzBUQjYySTZLRk9yVWVMUE9jL3JGUWUxdmNkQUNoMFEraUZl?=
 =?utf-8?B?UnQ3NHhTOFZqNmFmN0pGdzREcGRjQzBaTVlxZmZ3MW9WYnJZa1F0a3hpNURK?=
 =?utf-8?B?dFlaTjMvSVFJbXZGZW92RnMzZG5PRllmTFprMVZjV0swUzQ2OXJadEZ5YWhN?=
 =?utf-8?B?bE5NQlEwOElZUmJRdVIwRU1VY3JaMGszT2xSN3JUYnNRWVFGQWpFeU9Xckkr?=
 =?utf-8?B?NnkzcDVwdlZCZ0o3elhmTVVOSDR4MnQwSm51dXBCWHJEdkVJMFVQaWlaY2Nq?=
 =?utf-8?B?SEFnSEFuK1ZwdlRmYTN6clNxcDR3Uk1ldysvNS95ZGcxdk93ZC9XSWZYZDB5?=
 =?utf-8?B?NjNxWjF0eG1CaFoxUHRsTDVFWFRERjJCbko1YXlMeEtmN0ZDbmo1cHR6UlAy?=
 =?utf-8?B?U2pTZEV0S3VucW5tUllLcWZVUndwelFIRDJtdUFTUGFlcE52NEZoV3l5VjZ3?=
 =?utf-8?B?dk9FSCtEYjMxU0YydjZuZmVDTithTzJWWHhLUWUwZXdZYkgvTk9wYUtkZG92?=
 =?utf-8?B?UUpkeEtxOGdnSFNEUXNKelEvbEQwMnFXUFBWbW1LSVRjd1F4Q2xuQm8rODV4?=
 =?utf-8?B?Q2dXa2dCZG9pbklnNkVRdm1ua3EyUVY5N1VCNWRVZ0FkaHhkMXg5SDFzMk1t?=
 =?utf-8?B?TVZwZDluL0xKTFpwS1YwdVB1SGxvQmJpcHpBNTlzMHIwMWlodjFTcitLdldt?=
 =?utf-8?B?czhqbmppdlJhTDlEWUhFY1VKL0EzQlhjalZGZUpDai9tU2RXWjBuVTVneS9G?=
 =?utf-8?B?dlNWOWYrQmhPT2l4enBtaVB4dHVhMkovS25uVmRMc2JWWWVaWUZvWmFyTUtI?=
 =?utf-8?B?WFdEcFBOa2ExSmh3VDNCZUxBUC9NOTF4NWV4SFlaKzM1eWxuK04zSlJldm53?=
 =?utf-8?B?WkU2QTF1dlJLNzhlNHJmZWFLcmFZaTZ0cXltcEFQL005aUVhdVdzSUpQRkQ4?=
 =?utf-8?B?OHE3VENzbDFza2VLSEdrbiswMzRCYVRkN2ZhRGlwRWRldzRtMVVFMnhpemFo?=
 =?utf-8?B?d2dxdDVaeE5PTFd6QkJZTkhxOWZoekx0VWM0UnN3TCtQeENYYlpSclFaaXVS?=
 =?utf-8?B?UHVvYStIckszbWdsUGt4R0ZQb092RkxxbEFGQkM4VFZUaWZWNForN2VheXhR?=
 =?utf-8?B?endiUU16UERScE01bzlxNHpic1cvcVJnbGNRYkZIZGxKd0YzSmREbGFKWnly?=
 =?utf-8?B?K3B5VEo5VXM4TVpZcHJORzhmbWhaRU81cDVvTmV1cUViSUE2ZTZIUVN5N2ds?=
 =?utf-8?B?bGVaYXVGMnJ0c1dwcGoraXFleTZUVnFZL3k0Sk5vaHBBOStJdjFybXhRVzFs?=
 =?utf-8?B?aUlybVVlbjBFUTVZT0UyNTVaQnliOW1ZQThqdDZoTTI0R09yMmJ0R3NNbHlQ?=
 =?utf-8?B?U3F1ZkJCajN3NUVzdXVvYm1OTHJPQXpPZDl0NDQ2QW0wbGVMcXlHTm9DQ0VU?=
 =?utf-8?B?QkRQNm9NZGtOZDdIVm56dncxN2wvRlRQSFVEV3hETWpsaXhFY1dkZWxjV1pY?=
 =?utf-8?B?L1NObmpMRVdIelMxMEhtbXh2aWhqRTE2d01ESWZRdGpXb2lPcXcvcVlkQ1VF?=
 =?utf-8?Q?UweGuUYLGj1QGYEC4AUhtNqYZNxew2PLZesdNV9bbQI+B?=
X-MS-Exchange-AntiSpam-MessageData-1: 1SQ3csX2/DYVyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470a1ea5-fa6b-4cf9-b955-08de88e61fc2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:11:49.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzXIeXCRSyqQD7IgZ869r2o0QiXxsLeH/+hG4wCORjjdLo3fgU+DnAURCWKOY/6dg6sj/gy/+7kJZ/IdqjdXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_071201_262967_2F68E6CE 
X-CRM114-Status: UNSURE (   8.73  )
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

On Mon Mar 23, 2026 at 8:21 PM JST, Danilo Krummrich wrote:
> On Mon Mar 23, 2026 at 12:07 PM CET, Alexandre Courbot wrote:
>> -impl TryFrom<u8> for Architecture {
>> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>>      type Error = Error;
>>  
>> -    fn try_from(value: u8) -> Result<Self> {
>> -        match value {
>> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
>> +        match u8::from(value) {
>>              0x16 => Ok(Self::Turing),
>>              0x17 => Ok(Self::Ampere),
>>              0x19 => Ok(Self::Ada),
>> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>>      }
>>  }
>>  
>> -impl From<Architecture> for u8 {
>> +impl From<Architecture> for Bounded<u32, 6> {
>>      fn from(value: Architecture) -> Self {
>> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
>> -        value as u8
>> +        match value {
>> +            Architecture::Turing => Bounded::<u32, _>::new::<0x16>(),
>> +            Architecture::Ampere => Bounded::<u32, _>::new::<0x17>(),
>> +            Architecture::Ada => Bounded::<u32, _>::new::<0x19>(),
>> +        }
>>      }
>>  }
>
> Can this use bounded_enum!()?

If we move it outside of `falcon.rs`, yes. I didn't want to make too
permanent a solution with the `TryFrom` macro being developed, but if
you prefer that way that's doable. I guess `bounded_enum` would need to
be in the root module though to be accessible by both `falcon` and
`gpu`.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
