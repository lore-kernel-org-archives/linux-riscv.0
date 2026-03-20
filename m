Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6521099B30
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTihRou4b3gpAfcV5W8uUjz2w/CaPsxqn7qQ+z4yZyY=; b=KsXhdu0Lqft6uY
	rLZpWpPQYhU1uOGDw2XINij4+baMMhzLuxsMlMNZnm5THycbkbCXN3qvL3VfFkDgnUqSGZ2lqSUPt
	mo3WNnpjSVFu43vin5ibzGAWZO6Beh6/oG3uF5dq8jE+KuTXQWvzeLvXaTxAq8XYVl3SQYiETpPm1
	4mudAS6eCuHoNo943FS9QeNR8RS0c81MqW/p8NKXV5SZfdlZ+aEDX4dAyzNikxi9kn5ElX8Bi06ep
	jZPyJGS8kW8AOQUKXP2VviUG5XPRJCD1AmhxOUvN5lJeEiQXjHrIdInJzgerdegBAzwAYNxVpDZMc
	U/h2emy4JDTZh4/3bHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3gNY-0000000DYvR-2XmP;
	Fri, 20 Mar 2026 20:23:32 +0000
Received: from mail-uksouthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c205::5] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3gNW-0000000DYv3-33w3
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 20:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJORbRZ0tgOEH73z9I41oBmRrCeWdSbWrUeQIFIcxtAl1wMWn9FLnnDWGkpXSCKb/CoFmVyQmKB/gi0KtA5sVlt2b6W79KwoFklL6DTRVHH0OEgxpT6RsFyEpKj4WxI9z9nGmn1OZIRhHYkTRKJL+FGtwaLyV+gak63YYXyfjfmdvmg6nlM6HT2Q3avySenxrfVyuYPWxrSlfQwGXx9gUlIXSpu+kUyTlFKM2K+VkMipHhFbPqcrCWB6dPBmiVZhtmgc3ZuV+V1bTtpbe7RZEGMe4ftV/xLqYOLLNm0TAkMSE19+qeiIZFjTzSZy+botosfIestKuX00uLlUSZaoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRopKqhLqB19VVPA3dXSM4eLQv/QdxeCVMb1YU6C0ow=;
 b=AWrIZ+/Uuf6R9K33P9NikjTTyHSILasWbcTc/9JcgvtPuQb98mQ2Y8zZbX62gqQ5PNu/inBeCe2cGzO6L54O94+et3sj7B7oO/EzWV/N/9QWUVi2P9VjIo2ntlOBqnCBiQfPM/FJMcc2xwXITS2Sz7Mu7/2S70yBEN/31CgD82T0hjmw718PsmN1PTrHtvyHBRoNXNue3OlS301vJlmvUlwJjuX+W+0S6+6U5TC1k/Bo/44cCaTbiYFDqMWzr4uAK24gALfWtci5pLdRXZEJhktGYGQTrkNF6r0/SJDlOT+v6/eMYSmpntFOM1y4EcK3KuULAAAtBUZ9dm3huw9IIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRopKqhLqB19VVPA3dXSM4eLQv/QdxeCVMb1YU6C0ow=;
 b=i3uIDcPyMCuZdCmrd5MDEgRfqmmrviN811C5kv8qoTf3F2yG1IA8K+2+cNvZWpw6u5fa7sMseUCa7BhMTkHp56Mhma1ridMwkUNLqxdVRsjUvfcS6ObjyETfigAyoWwUIiC4+JJrg3PE70RowcThf+ATobEqWHp/Ju4dfHo0RPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6710.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 20:23:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 20:23:25 +0000
Date: Fri, 20 Mar 2026 20:23:24 +0000
Message-Id: <DH7W24B5FNVS.27HW7GCD3RTXN@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] gpu: nova-core: convert falcon registers to
 kernel register macro
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260320-b4-nova-register-v2-0-88fcf103e8d4@nvidia.com>
 <20260320-b4-nova-register-v2-8-88fcf103e8d4@nvidia.com>
 <8f9da1e2-fb86-4653-b702-333fc920af58@nvidia.com>
 <ba3c5689-5e34-4097-8823-c37a48a4f358@nvidia.com>
 <354b3e67-9bfb-4538-a865-695ebec6b433@kernel.org>
In-Reply-To: <354b3e67-9bfb-4538-a865-695ebec6b433@kernel.org>
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 5412a774-b56f-4593-44cd-08de86be8a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0Mq47dd48UnYi3hNUDnZPP++6vVoyfK/xpUk1LBajSJITVZXfDtMVSbc/lUH8fMFAaZNgF+My4SX928S1k1nMtP8yj3PY1Bp4NRMgAvnd6s19axS7puly2RHHbTeIx8+t7kLBdv5T5joO/AGxCtGFKogjJcBeBvttqFb7NhrftpxkDkm8hcEicSiw+5YRN27P0+uzjR+5tZe+IjcJ33GAKv5rrQ2j3ApaDSjdug2/7T9Ds1HaDSdM4hV7gNcBJr1K69xVS//C/raCcZs8Kaz1FgqVwhaqop6rNylEoqMhyyGbFvt7S+5Y9vwWPq1ennCCazXdCrFkRRE31f6cjPHDgGpn6/Kz0dobZyMC9iQ8zCrW9U6o7Maoaa1//PaRWoOYPyGknXQEC2awWypwQIjCOPPj2W42kXzcIylu81MWDSqVQnsdi2H8Z+U8vkYkFlZZ8bL7CAe3XcDd6wQBvcOy7kbYOWPemCyqqcP4Ub9h/PSgJGeg8vO4sQmCnjlcPRQnT+BJwDHTux0XtkR4MukqngJl7xAgxpHWtGsZmI+6KFhrAyxz1Ec1vlSDBmLjcvDWngdZ/F29goJ96U5HqvnMhyBulPavcQsPuTBN8Xcat6a5Qq0fYP/qOposIUyJJA6w8hViQzZDJjqdhGiPAryzV5voODgHDlP9g8EBjJgYkTbhJ2ERCWhOZAJ/Ad96Jp3u6EXfDRoprIBZNVwUw5n5dFE6XfOaGA8MBAXzzqUNqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkVHSnc0V0Yva1hCbytraWRsdElrb1N6RzRsaUFpTmFVMG81L2NMeFJCZG9m?=
 =?utf-8?B?blJTZmpTWk0wRUgxblpib0ZFdTJGK1NHT2Z3aXM2WCtsTER2bmdnVkxCMmFY?=
 =?utf-8?B?Mys1VmUwTXA3bVo1TkdxeEtrdGNPWkJvSWNNcm42bmN3MXpwQ0JCbGw2VnRC?=
 =?utf-8?B?bVRmUGtYYW84OUhJWlY2UCtmNWJZcmY2ZHp6U0hsK1Mwa3V5d25XMFlhTlAr?=
 =?utf-8?B?M1dXNGlGeURXaHgyYlZWTlB5bHBwQVREZ2VheU9iVEhWeG83ajkrbUx6NGZp?=
 =?utf-8?B?cHdEdlB5T0hkemdCelY4Y1hwVkM5c1l2UFlnbFRZM1ZiZk9DZzEzaVowcGhn?=
 =?utf-8?B?UFU1WGNYdGdtZnQrRlcreG9Jd09kTlkzTkUxd1JRQUEyNHhRRTNtYUp2ejZn?=
 =?utf-8?B?aThMQXE1Ym1UWW9HNEdWcFVxNUUvU3Y3dnI1VUE2R0tDSnc5RE5jMnJERWRp?=
 =?utf-8?B?THljckJYZjd4MkFseHlzelQxREduM0dybWRDT09iRGMrdFZkbE9wRW1JRUUx?=
 =?utf-8?B?bEFyVjZINmZpd2gxWGt4ZnhhczVmQkZFYXZ5TVUvajJUY0dUTVlqdnBLakxQ?=
 =?utf-8?B?TUpObTJxaEthbDFkNXpNSTlhR0xKMk5ZTDQ3aDdzVmtvc21yVUMvWTYzRzE4?=
 =?utf-8?B?YXkyNzJJWWMydzJ4cFZGZjRrcEhLem1rc1hSSHd4dFZXcmpxQmlURVE4WUNW?=
 =?utf-8?B?UGdvbFR2OVlqQVBEVFNrMjg2cFRVVU04WUx4ZGhqTEozWG5rVDloZ3JvNUEx?=
 =?utf-8?B?VGR2VEtvckFCNjdDZUk0bUw0WkJLNktqOFpGTmV6dm1oNkVXbUlKRnJtSmd0?=
 =?utf-8?B?Y29mS1JZOVJVMDR5SmVUYyt3VnBaN1Qwd2ZJbWd2Y3hiZC9sV1AvTWRYNXJJ?=
 =?utf-8?B?dThwVkMxUEZ2K2tjTXhNeE51MEx1YnZyeUVmVU03c3A0aFY2NTlVL0NnZm1v?=
 =?utf-8?B?NVlTNWZLMlNpZjRqdjMxYW9VdnIvR1B1N095MlZlZmtnak4zdHExbmI2Zm4w?=
 =?utf-8?B?TmhKVkJUeUhBaFFCdVBlTkd2UEFzbGg5WDJ6Qkt0Skg4amhDT0ZPMmVsMDdP?=
 =?utf-8?B?N3FiZ1JiYjNKbzF3S0VLTURiZVpMdGE2SS8wbEZOMWk0WlFjWFNreDNWQ0VF?=
 =?utf-8?B?Nyt5R2hnUjBnTldaQ0oxYnJWQ1dQV21mRjMwRFpsVmJWM0k2RlJDL1pDMnVE?=
 =?utf-8?B?NXgxOHQrZnk1WFlEQVFyS2hKYjVXRlRiUTRZUFN3SWEzUVNxU1Z6SmZZeEpY?=
 =?utf-8?B?VjUxMklDVWhzakY2aHVxZnpEMEN2aVY3SkovZU9uVXA5bW5zTlVRN3lwWCt3?=
 =?utf-8?B?OGVwK2NDOVdOdmd5TEhDOWx0dEpzRW5xTzNCSDRtUVhtT0JKQU1mamFPbW54?=
 =?utf-8?B?eWJCRVlnS2MxRDYyT0JkQ0t3YjM4a0kzeHBpYmtIcWpEeXZaQlAyNmdWRFB3?=
 =?utf-8?B?d1VFRGtTZlp0SDRibXc2YWc5WlpXRDhOVkk1ZnI5UThha08zck5kL1V0RHdv?=
 =?utf-8?B?Qk5jV0hiWEltRWZGdWg2czNaVzR5SFZSOW03VEtUMVdTeEUzaXFnZkxmaUxO?=
 =?utf-8?B?KzRsa3NxQmU2ZkQ4eno0VDdmd2ZSaTV2SytmWk5pZSsxSktNQ2h3RWNqb3Ft?=
 =?utf-8?B?SVRLaFZYbk4vV3V4aytFNHg5RjlsQ29hY2VjeVc4R3FENzVmSHJQM2Fkb1pL?=
 =?utf-8?B?ZzgvN0htbTE5cUJpKzFEYXp1SWc5alJBSk5qMjZLdVlBMlp1MmtvcnFvbm55?=
 =?utf-8?B?bG42QmNZTzlEazdYbGJTczhOZTh0U3BQcGJVRXpDZC90VkptZGJUS0NaWUJV?=
 =?utf-8?B?NU9ZYzZoRWNCcUNoT0QvTW8wYTdCQUVOcWZpenNzSGpYL2tNSUJqL2VieVVV?=
 =?utf-8?B?aWFPeklTTjZscXVtcjdYc3NwNGkwMTl6VmlTam1yZ1U2TzhaUGRFbGJXbjdE?=
 =?utf-8?B?MW1mQkc0eDZtM1ZxUi9EKzYydDJtZWliRHV6UjlMMHRibExPbUtoVkxzamhm?=
 =?utf-8?B?RVV0RzlqaUxUSlBrNGJ2ZFRJYmNXdlExSGFqdWlZZE5UU3FzcFh2eldhRlZL?=
 =?utf-8?B?MHUxWnJMN01uMGE3Vnpvc2E5SW8yS2pmeFNpTXNwYjdLVTJuUm93clpQamY0?=
 =?utf-8?B?eGdEQ3Q2NzZsWUY0YVlxUDZHWGd1UjNhTFFmc2Mxa0diL0lxV2dSbGgybVBQ?=
 =?utf-8?B?VnNwWXF2WUFLdGRBYkhibElDemI3aGhuOU5ldDFxVTQwMTVRWEVtNkF3eXFq?=
 =?utf-8?B?MCt3THhJdFN3Yjl2dTNLbFZpSWpPNkk4aE0rdDdWdzQvVWpFcUlLQm5heDZm?=
 =?utf-8?B?d25XcnQyckRxU1RvTktKNjd4eXozU3krQW5Pd1QrZkNnTWhDS1I3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5412a774-b56f-4593-44cd-08de86be8a2e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 20:23:25.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0McqMW9vbAheX/EiylgUJKQYijykpEnQo/MCgOSCQ3Te7cWA4UledLqzsZzgPD/8L9hCmMT+1yG6nb3p+F01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_132330_796167_790B3B8F 
X-CRM114-Status: GOOD (  16.37  )
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

On Fri Mar 20, 2026 at 8:07 PM GMT, Danilo Krummrich wrote:
> On 3/20/26 8:52 PM, John Hubbard wrote:
>> On 3/20/26 10:38 AM, Joel Fernandes wrote:
>>> Hi Alex,
>>>
>>> On 3/20/2026 8:19 AM, Alexandre Courbot wrote:
>>>>      /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
>>>> @@ -616,9 +462,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>>>>          self.hal.select_core(self, bar)?;
>>>>          self.hal.reset_wait_mem_scrubbing(bar)?;
>>>>  
>>>> -        regs::NV_PFALCON_FALCON_RM::default()
>>>> -            .set_value(bar.read(regs::NV_PMC_BOOT_0).into())
>>>> -            .write(bar, &E::ID);
>>>> +        bar.write(
>>>> +            WithBase::of::<E>(),
>>>> +            regs::NV_PFALCON_FALCON_RM::from(bar.read(regs::NV_PMC_BOOT_0).into_raw()),
>>>> +        );
>>>>  
>>>
>>> Overall, I think the series is good improvement but I still feel this part is a
>>> step back in readability, and we should come up with something better. I don't
>>> think there's any chance anyone can memorize this syntax.
>> 
>> I must reluctantly (because I know this conversation has gone very
>> long, across so many versions) agree. That .write() statement is just
>> brutal, and we will be relying on AI in order to even figure it out,
>> I fear.
>> 
>> I'd hoped that there were other, simpler forms to express this,
>> is that not the case here?
>
> I mean, it is barely different from the above, except for the
> WithBase::of::<E>() argument instead of &E::ID.
>
> It becomes much more readable if you break it down (which is what we should
> probably do):
>
> 	let boot0 = bar.read(regs::NV_PMC_BOOT_0).into_raw();
>
> 	bar.write(WithBase::of::<E>(), regs::NV_PFALCON_FALCON_RM::from(boot0));
>
> For other cases where we read a register and write the same register we will
> have a way in the future that can omit WithBase::of::<E>() entirely, see also my
> reply in [1].
>
> I want to expand write_reg() to also be able to handle variable offset
> registers, e.g.:
>
> 	let reg = bar.read_reg(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// modify reg
>
> 	bar.write_reg(reg);

If we add API that allows you to do projection based on a register, then you
could do:

    let reg: View<'_, _, _> = bar.project(regs::NV_PFALCON_FALCON_RM::of::<E>());
    let v = reg.read_val();
    reg.write_val(v.with_foo());

I'm planning to introduce `read_val`/`write_val` on `io::View<'_, IO, integer primitives>`
but with some traits it should be doable for register types, too.
(I think `read_val`, `write_val` makes sense here because they're views of a
simple value. I cannot use `read`/`write` here because they're used by register
mechanism already).

Best,
Gary


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
