Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652FA1090233
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAa36em9MtDmkjQbUf9vzYm0cMNMoqAe5B6Yrx69Xd0=; b=Vu0RHQOITRi/r+
	r3+y/wI8FoCK6Xnx8ZXOOPOcaRiq3+KqtnyVbfV4mBCd+kLlqqNMkic7qmkaB8PifIbVtUJekSo7T
	ct+gRh5MYs3S+UzhV+eWtiJlAM9epNsIt2W4mJo5b+A1AaRFMit37n2VLDXp/S7ZWPApgmwYztqqG
	uUZ3w2Fb+FlER3JDAYMJ7kNuw3Dgmfhbb0oCypTvbE/EWDLB0rZuWgt8qQ9jwaF0MfdovWRba7mm9
	TJYUub5nqJsvWfTj3839rChRfYp+x2TqG17pFLiKHCF3q45jSNRvvDzSZsJDwN3/3IL3I2+cTpu3g
	nehW2eg4oxuL59gDJlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EIY-0000000An4F-0COW;
	Thu, 19 Mar 2026 14:24:30 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EIW-0000000An3o-2QvL
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 14:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfIBEbn5MXi4iW8pwI1mxhDX044lTtyAmeHuBYsXDdAqrCM2NiPPaFn5mGKDDJNCpxh9NkmfmT8ZB+ckiS7LuRlb6ia1aKNY6h+p5z4q3zxSeQDT3mn00FpdCo+AEN1RMjnry20ATbdn9yjsaIlT0S0rbn9M1WwLTnwcDqTkk6Jro8ZHmwOBWtwsrqdcg2u5kf2Fm+4hxZ5sPy/yQjZ4kDDOH6xZcCFCc6Gy8yr/T4+hx+GNmDe9WJcCI3fs+ZmliC3tquOi+2IDoIxsCXZQse1PAsh1cLk949Q2S7zhaV7iRlKrpkbNov53p6IANSSlSxKEE6n/vnUYYCCm/1YNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LuoscX8wYh0t/7n45al+s4/CVUUoqdXkbQA0Mv0Q8E=;
 b=Oi+CdDIVqlp4QO5HlQ3JbxBJnut13zmuR/9sfJVn81J3M4N479Cc0nFdvZzTPfJ2/U75VS1QdTmu3+Jo20x+/RXUDDhua8gow6bOSlsxasMVQLnj924tUkD+3fg1JnU8mGG66g3AiAEsJ4KnKVtoBMoKXtzuMo9VkgStkOKvU410ymrpoBnDwL5cqg8h/3eawUUNk0DkqWqz425AG2PSrxA3Q5WWv8qxQByHXqPlf2uMoK7KG71bvTp9xtMo8EBeKBP59pfGlOCvjgusex8Prmps9s7Ui2vYsURRXOZz3FQSrfBBh24boNAStmgr0Mjh27McEXMZ9yL64eIRIxzT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LuoscX8wYh0t/7n45al+s4/CVUUoqdXkbQA0Mv0Q8E=;
 b=Bv6ZIO/7ISVhGFHIfTapjdRM8CIyYOFiVXA8gWYFzrxlBwZKubwh3jmgmZ0okgLrjTqW9XjgZj8BBmnXvqturDlUhTmGbVPnP/udGkFXMCVcsPmvK+lmf5o0fQm8Fhsm5kxEevlKq8vQ6JOk3MjAvP7qewBsb/xr/y9qzLGYlU5t/6uEcTRwye/dGJ8akLDWEJ1M5aWp3hzyRa+bqIeqhmUg9FzH4nNRx7VsNTYHvhHW/sWLSqKdSDpzkMZI3PaW/sfm5sSRTmDPlg3Z+2/2Xx7lSvD1EBJVIOrCVAyRHQETv/Vj1YpizZoHDjVakTkYdpbCKvkbPuZzczzEBacpZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 14:24:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 14:24:22 +0000
Date: Thu, 19 Mar 2026 23:24:18 +0900
Message-Id: <DH6TSMOUZOBM.22IUOPF69484D@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 5/8] gpu: nova-core: convert FUSE registers to kernel
 register macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com>
 <20260318-b4-nova-register-v1-5-22a358aa4c63@nvidia.com>
 <DH6ECIKZRESY.D4VBM1STGPH@nvidia.com>
In-Reply-To: <DH6ECIKZRESY.D4VBM1STGPH@nvidia.com>
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 53034919-98e6-4d05-d538-08de85c3370d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yhVv3PrAgQm9qT/JnLTAZrKJoCfOraVFJc6oKRdhEVj1IA1AZ58ekoq7nAEPav5tK/ABEg53DfCTh7JR2hhEgeZjqNueavfKWNSGj0o7N5vuG/J9t3b7OUGeCxu9v/gZYyZXcYum44xvW/BkKMLzLW+CXPpO8wMEZYXWhSqFJBHC1/ogTHPNENDNsdXMrfH9GsAcatSdaP5y3MsgAH1NKRMz6jqDDy3UBfEMZKz2szOE0+JJOZuAJkTfTB0PnvumWyCFqgbnGkujKT+1TGdm4b1IawsK2dinsCWYKocSynTj73iDFpk8xipyKJh//76dYRsOoBiQkTmnvudsCIyheOzNs5gSEYgg87DY4IVHHcsoZDAbGpvrXQmoypx3wnPsvxK+eWlz1vDESiZtgltlc7Do7UcFBsm4GN2V4tH6feJAgU1DGdXJidxTDRIL7x4Nv11fAg2nCckHQwb2rBCBhTTh7K49pnCvMLhxZf3iTn9/DCFFZ/OLDnIEoaYq8EjkkQTllTWzlKv+KjqlncKVmcQn4XqC5lRfsGCdedYjAJTwWW9af4aPzBbP1gWMhpDLzoLPQkYMFtK2Qu0ud+KHcB5/2ucTsZFNHvB1b55oEYrJic3w7Fvo6VpNOWiVF66ymGji2GUZECeG6ZAklyxdO67T7MU1ScT3c/Aavd+9WvPDUzfYhSwWuODXoFO4uRHTTZreOZUfOtF9MdC/d8uV4eizPzcVk4wHwwqjedoJCxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak9rUlk5KzZJUHZvUG9DSm52djFZdy9XVVhFUVJ1dk0xTHJWWHBBdjVtTWxa?=
 =?utf-8?B?RTR3TlpBVFFKOEJBR21mYXJlOGFRQVNEK1N4VUpQQmp1OXUwd01ETWFiOVUv?=
 =?utf-8?B?K2ZNRzE1REJGNEVPbEVBbzBXeXBBMVkzRlVybk5aRnZEY0JaRzVQUWVscDVS?=
 =?utf-8?B?K3p3M0o2TmF2T1RsbXlFK1ZDTWJKSDUvR2xNL0xvRzdrQnIwMTE1RS9sbDFV?=
 =?utf-8?B?WGtLQ0NYdytlbjJucXd3R1RjS2VGYXRFTWNSSjBzVTdPZzlwSWczYW1FaHVa?=
 =?utf-8?B?eXNxQWtPNHpzaGZCVmZKZzRCZVhUWnBWU2tIa0FCWU45VGlQZExCVW9LOFlx?=
 =?utf-8?B?RkFKcldiSXV0N0hQOHI0NXFwY0Rha2NldE95MXZWZUppdUw5TThCcmgycVBB?=
 =?utf-8?B?Z1ZYRExHU0U0dFBkdGlVMGI4Mi9xOTBxb3F5MEUxZXRyZXBBT2RJcDFiam5a?=
 =?utf-8?B?NHNBcUhyajJlQ1FKYXVXdVppMHlpT3JKWmIxQVZJYldsV1dTdmFMZS9IZUdP?=
 =?utf-8?B?ZStQWU8ramJYYk4ya0VxWFlmQlV4RWZNQlR0ZjBsK09TamVYRW45QTNoTHY4?=
 =?utf-8?B?aUExdWxrYmlpTndDd2xzOWlsbUpiUExnNE1RN0hTaEdqYm5GbGhHdEY4YjJJ?=
 =?utf-8?B?R042QnplNlAyWjN3ZFgzU1dVa0M2b25valpNUHNETWp6UXcrQ09mWXJNdk1K?=
 =?utf-8?B?aER5NFJjUlUrUzRQN0NTbUZlODFyQ0Y5REwvRXRDVUp4ZExjL1lTUzNCZnBo?=
 =?utf-8?B?TmtHWGdMMlpDK3I2WVptN1VGSWJzenIzT2VUdG1YMGcvQkZ6N3FTUEFFVkFK?=
 =?utf-8?B?ZGhudUJmcUlmc3cyVU5VVVl1SXUrL0hNTDRtOUsvc2I4WTI5YU5SR0FmM2Ji?=
 =?utf-8?B?ZVR5SWNObkZhakxiNERxUHhOcEFaL1I3L2FnRkNoczVjZWo2T2V3RmcxaWJn?=
 =?utf-8?B?NHFWaEJ4QzIrRFJlRXp3WFBtWHREbUZET21veWZOTnhrZWd1QXlyMTZHRTIx?=
 =?utf-8?B?S2NPWGlrNS9mdCs4ZWFyWFZ4WWlsKzBFQ2EzL3B0MTYzdWkwK2hML1YvWFQ3?=
 =?utf-8?B?K1cvdkxEazBoSFVCS3ZXNXg0SjlyRG9ZWUJsVnpHVWcrNDFSTnVoMWhyNWVM?=
 =?utf-8?B?Qk5TeGxaaVEyL0gyb3c4N3duNGdva0hCazRweWQyellYaWd4enZVcXlMU2pM?=
 =?utf-8?B?Wk5JNUp2NnovT3Vienkxb0dnc3A1bTZ5MDNhSFNsY1ZKWWdtK0hEQnE2aWpM?=
 =?utf-8?B?YUFZSHJNYmhnajNJa01HNUkwdHlrVXBjY0xnR0tVanlHcDZuVzRITXNseVhj?=
 =?utf-8?B?d3I0WkZNOFNvTnU4cUkyRmhxNmpidi8yaHYzQnkvSU9XTmlETmZDOVZtN0g1?=
 =?utf-8?B?cUFkMTdTcnpNV1NPNE4vZk50d3BBVE12Z3FGZnZmWkw5QkFwOUtvRXM2bjhw?=
 =?utf-8?B?SUlGc3dQTHhZNHRXUEJFTW1DZ0dpamVrVVBmVjRnQ2ZQeW5icFI4S3ZSekg1?=
 =?utf-8?B?VUc0S3JDRDJBNmJLUnZERDJGdXNWeW9WRzljYmFXUko2MGhBU3l3QW9GazF1?=
 =?utf-8?B?Y0VhNXlydGlMWFZCUFZXZWJsSFVqS1hjUm1hOVJmSC9WT0ozL3JOWFE2YzBz?=
 =?utf-8?B?cWMza28xTFFnN1FKTWYrWklYR1ZnQVJLMUVsYWxIV3lVWnJWRmZCU002U3Nn?=
 =?utf-8?B?ZTh6NXRjdFRDMUZCVWE2b2FoYk5CeVFGMy9jaUxCT3ZrdDRqNUp3THRySzE5?=
 =?utf-8?B?YWZCZzhQVGNBaGV2UUVEMXpkZk1mdjNaUGUwZ3FxTTYxTmo0TTRzMXAwRksr?=
 =?utf-8?B?UDhVU3hDcnhldTZ4Qmc5Y3EvOEQ4R2l2SVBFRGVUTzdIMnl0VEpxQzRHREt1?=
 =?utf-8?B?TlBDOUovTUwwcndxLzBRSHp6clNvN1RrNXgzcEg3ODZVS08xdTU4UkhLdTZW?=
 =?utf-8?B?aXAzSmFveVJSV2lhUjR1bkNsWDFzNEVMZXBYS2FhNmVDdWNUYXA3V0daM2Vm?=
 =?utf-8?B?T1dVemcwMDhDdm5iclJWNHhpYURsTGNYbHNEeWR3b0ZEdzRqaEx3VUFEemRK?=
 =?utf-8?B?MjlwTG5UYkplOURTdVdCZGJMcFNYOHZGZmZPb055OXVwazZvbWQya1h6c241?=
 =?utf-8?B?dkJuZTVmaGQyNExWWFB2d1VWUGdsdDF6ZGQ3QVNaTmViMEtISWMrR1dWMEM2?=
 =?utf-8?B?TXpKOWNmeC94aDArc1F1bTlvK1dRYlhJTW5vMkxpeS90R3pJV3NwVjBTTlVS?=
 =?utf-8?B?MU1GSDhsSVNYMk02eWpzK09iSDFSMTd1YWhuL2M1S2FZcDN6VWlJOFdxL28v?=
 =?utf-8?B?cTI1aENBK3NNczU5c0MyZlFJUHNyK1c0Z3dhVE5HeEpVSS9jd3FwOUtWbEN6?=
 =?utf-8?Q?LwGQXZpLQ2u/FEplr5HTgJwsmdKrbg/5spoLCH9oSIKzH?=
X-MS-Exchange-AntiSpam-MessageData-1: ktGmCNvkmuqnLQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53034919-98e6-4d05-d538-08de85c3370d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:24:22.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHCR4tiupA+RbJTXBqVC0rQSjllDi0OvFxyX5FrLIXVtyzYw1tm69J1Q/NGBMB8zlda16q1RKNLjrVA+Oqouxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072428_626313_2FE262EA 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu Mar 19, 2026 at 11:17 AM JST, Eliot Courtney wrote:
> On Wed Mar 18, 2026 at 5:06 PM JST, Alexandre Courbot wrote:
>> Convert all FUSE registers to use the kernel's register macro and update
>> the code accordingly.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 20 +++++++++++------
>>  drivers/gpu/nova-core/fb/hal/ga100.rs     |  3 ++-
>>  drivers/gpu/nova-core/fb/hal/tu102.rs     |  3 ++-
>>  drivers/gpu/nova-core/regs.rs             | 36 ++++++++++++++++++-------------
>>  4 files changed, 39 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
>> index 8f62df10da0a..e3eb6189819f 100644
>> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
>> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
>> @@ -4,7 +4,11 @@
>>  
>>  use kernel::{
>>      device,
>> -    io::poll::read_poll_timeout,
>> +    io::{
>> +        poll::read_poll_timeout,
>> +        register::Array,
>> +        Io, //
>> +    },
>>      prelude::*,
>>      time::Delta, //
>>  };
>> @@ -60,16 +64,20 @@ fn signature_reg_fuse_version_ga102(
>>  
>>      // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
>>      // at build-time.
>> -    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
>> -        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
>> +    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
>> +        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_idx))
>> +            .data()
>>      } else if engine_id_mask & 0x0004 != 0 {
>> -        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
>> +        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode_idx))
>> +            .data()
>>      } else if engine_id_mask & 0x0400 != 0 {
>> -        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
>> +        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_idx))
>> +            .data()
>>      } else {
>>          dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
>>          return Err(EINVAL);
>> -    };
>> +    }
>> +    .into();
>>  
>>      // TODO[NUMM]: replace with `last_set_bit` once it lands.
>>      Ok(u16::BITS - reg_fuse_version.leading_zeros())
>> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
>> index 629588c75778..1c03783cddef 100644
>> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
>> @@ -40,7 +40,8 @@ pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
>>  }
>>  
>>  pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
>> -    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
>> +    !bar.read(regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY)
>> +        .display_disabled()
>>  }
>>  
>>  /// Shift applied to the sysmem address before it is written into
>> diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
>> index 515d50872224..281bb796e198 100644
>> --- a/drivers/gpu/nova-core/fb/hal/tu102.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
>> @@ -29,7 +29,8 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
>>  }
>>  
>>  pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
>> -    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
>> +    !bar.read(regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY)
>> +        .display_disabled()
>>  }
>>  
>>  pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 4439464aae4d..9682a94b8b77 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -294,17 +294,19 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
>>  
>>  pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
>>  
>> -register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
>> -    15:0    data as u16;
>> -});
>> +nv_reg! {
>> +    NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
>> +        15:0    data;
>> +    }
>>  
>> -register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
>> -    15:0    data as u16;
>> -});
>> +    NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
>> +        15:0    data;
>> +    }
>>  
>> -register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
>> -    15:0    data as u16;
>> -});
>> +    NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
>> +        15:0    data;
>> +    }
>> +}
>
> What about using data => u16 here (like below with => bool), then we can
> avoid the into()?.

Of course - I overlooked that, thanks for pointing it out.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
