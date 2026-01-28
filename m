Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688FD35662
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bFTKkAJDUEgp9QCEsG9g5KhcdqDOUJs12JEIxyzBUM=; b=YdcFSuH7BCwp4Q
	WgVQnLI7Zgc5hOQQdEfixhnvfBvJ7dGYXU50XyBwEF023gNJVAF5To2M8EjVynvcgtq0Qda2RJd3T
	Fs4YiOBhp7LByd6tp6zztdq/03gQL4VUqan02ERjJmUMPxFI9SWEIrN1GwnxRJII2KEN2f1nt5IET
	S78eXdWlQmXAmKExd1giCpak7fYXn8Up9qendZXIwGd/MTHA15B8c/60sgZtG8CCrhgUix/fXyLoN
	6bJvLVeJX3L1gooZf6kYkzHPcXaNquFZZB8eBOdlUFW44X2smZ/9q0+imq3mqVYYGWw+ItAikJvRx
	Ka4t/iE6Z9IgwwiL9Qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Sz-0000000FcuQ-44Uy;
	Wed, 28 Jan 2026 07:59:57 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Sx-0000000Fctk-16s2
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 07:59:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/fw7Z2dSgpMa338s1qkt5cpP43oqvPm2D8wFUA0ugAT9CnlN5jJ3Vkgvtu33SC7JOs9qktPAoyzfdexoIxKcLvSvcg3oTlFTYx137wLv4926Cp1Z5JQDiHML6d5mJi/kfZVB6NwdX1uJcAkXORPR/WTrIgmm5Z4g7ZmvsIpotXQpgm8MZfKPei44BkNoCICMS2axXySILJwYKyb+4CM62z5rbfcgbNmESLTQc0LYMaDReFBSwwRWbQDPUFLFj7tLUNq50/PHeZ3y/qVn8fMK9bWJBcyW3SRvsd0rDFtW5cX9X1TFdQAUzACe9vYg1z1b5ZyXtyzoai4mElto9PdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zbm0mvBidRuq4dQfgzzQjL+rbWqzoyv8DX7TmVRdNJ4=;
 b=Safaj16sLZziBUp22uCrCIHrX9WNsoupjxcLmquAGVAXWDDkmJnlpVm9wjqdUdvo1CuR/bGEuR2XI1seQmfAbfXI7Gh974FvY488IEFWdsPbu+mtzF9qoQZdp5qCZCORLV7w41CEIesAaSlVaNO4BDB/bTB77g8p57Brl/vXorkgT7jm3Nw5ct9RFkP3H3p/2FvV9zlUT5wxhaVSX95XpDVr1becy+LhR6cbUbIkioHntkJvaT+hB1JKzyN6Wrq5a5NEwh1cclHSu4p5PF3CvVna1Rkt5EK+oTz73y3Q9gDjONgytQoNNa11MNk/Szn1AXD3HxMVN3mvoPMHVcdbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zbm0mvBidRuq4dQfgzzQjL+rbWqzoyv8DX7TmVRdNJ4=;
 b=rIAOjY2LSXRLnJhGDfb0EdMbNFFl6rjFv/8+VGVfsR6oZO01mqPwXpSCQfK1M3zJRTucr805b43afxjF217RcHQOzoyzD8Hul1p9Ax8IXALnkuj/15jgaGJdSUsjTLkl/Qk8T+c9MqiS3YxwmXPHtl1y9HwQWdkJt/7LH5Mb2EvzwdwQDL/VUJ93xhGw9KAgb+s69WKFoNsp0RHiUMhHBtU77jTG33WfCl6i/Ls8JTbm0lqfKcuoR/SlHGDR90yPlREbd5lWOwIly58D9NmO2BkVF2NlWCQ+oQDYCbEbdLq12oQ7PBwWLWaceTmUPct6IQgXV2RKoE7o3OPDAge2GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 07:59:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:59:48 +0000
Date: Wed, 28 Jan 2026 16:59:44 +0900
Message-Id: <DG02AXMZMOLJ.8HNHT4KH8O69@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
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
Subject: Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for
 firmware parsing robustness
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:604:db::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3287c1-9acd-4937-0e56-08de5e4334e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnB0VzY3NVcyYVBmbTd1NVNrNU1NUHQ2WEZtT0gyWnF1SVNBSlJHWXhQbWQ5?=
 =?utf-8?B?UHlWaEp4MDJ6WDFuYzlUa3dGRkowSmJDMHMxd1J4ZS8yU3Ura0xVUHpWOVM2?=
 =?utf-8?B?bzVBNEZtdnNpQW5pV1VwdjNEOHpJWXdqZ3hNa2VQdzF0SHFXcGxJM2lnbG5m?=
 =?utf-8?B?czVXZFRIazJNODJGRW9LSHNxbzg1RW9COCt0SjhaTjBjZEhldVI4aVFwNHlM?=
 =?utf-8?B?UUFqR1hheURRdWQ1TVk3azVEZityVEhEV3Rrc0gvMGxCNHBIMk4rTUUyRDZJ?=
 =?utf-8?B?VzR6bmtrK2VXMGtZemVYdlFUSGlEWHFMS3dZc2NESkgwTlF4TnMyNy9SY2k0?=
 =?utf-8?B?clBLK3l5UVdKSHNVdzZFZ3RyMTZkMVBQajZWUThtajB1eDFSdVU5V0t2RnU3?=
 =?utf-8?B?Q015Mk5nd3p3MU8xeUFvd011TVhSbHlvaXZ1RzIrZ01KbFlzenR1Z3BSYXFV?=
 =?utf-8?B?c05ibUhjMEZZR2hXOHpxL1FGaTdCODBaczNCT1FhelJ5b2pNMGtJMCtQclVr?=
 =?utf-8?B?dHZOZXM1RmI3b2JabVhQZXRLWHdKbFVOUmRDRHc0c3dhR2FBbGMzTWo4dGd2?=
 =?utf-8?B?N3VEWE04b3ZTZlA5ZlhkYmRjWFhWU1k0V21qWm1IdjBlWGpyOVRlL1YxU21K?=
 =?utf-8?B?ZmFFT2dqWldRQlgwcVo4TXdySnBKeGdpc2JKVDlydVphb05wQllUUVFGNi9O?=
 =?utf-8?B?NUNSREpJOHBjYTh4ZjQvKzJkRjhHVjErNVFWMkl5YmhGbEJqdi9aVnVaMzhD?=
 =?utf-8?B?YkVjSVBhU1hjdW15SzlkTGVGVjJ6dFBQZ0ZRb01LMUVVK3JEWXAwY2lHakp4?=
 =?utf-8?B?dmFhbEZQZG9ybjZ0a1g3c203T1R3ektmSStPODh2QzgxTS9tU0Jxc0FsOXRM?=
 =?utf-8?B?YWxlKzJub1c5ZDFneUZSQ3IyTGlhWlNQVVpYSkFtVjQ0bUhhNjFWa0pmT0t2?=
 =?utf-8?B?T2hhcElsUWdRcnd1Y0IwejUyRTQrYnJCTHM2cERsMzQxTWN3VVlZVlhRaHN5?=
 =?utf-8?B?UllvL2hyL05YWTFDWnNPU1kzUmJONkJFZU5mcmt1Rm1OckFsaVdqejliVjhR?=
 =?utf-8?B?dFBwYWhNOWZFMStBbnk5NGhLZTFTQmUrSm9BTG5kWGxpanlaYXpEV1BHeFFE?=
 =?utf-8?B?aDNKMk8zNENQY1FqVkFBL0FKNUdVQkZWcUNMUFMvOWFLSXZZOXVjQk9CcE4y?=
 =?utf-8?B?NlNJb2lmcitHM2Ixd1dsZmNxQyt2NmVWaHlZajdrR3JlOWR1NkVkOTlCSUhD?=
 =?utf-8?B?Mkh1bFJQb2VldjE0TlcveE1qTkdLbGFPVDd4NnZzK0VJZVhIZWhkRVhjcFRB?=
 =?utf-8?B?TWJMNnU5RkFjdkN6RVdlQkIydUxQeWN2MTlYVFVPME1MQUJ4NUN6elZQbGcy?=
 =?utf-8?B?WDVCNFpjT1U2TTBuZ3ZEdmRpclVzdTRHOW81L013ckRndjlOemI4SExucDZC?=
 =?utf-8?B?L1lWVEMrdEt4QUppV0tXTWVpTGN1ME5CQ3RIK00yVU84NmVielJZNE5rbWVT?=
 =?utf-8?B?S2VEM0xTM0NyM1RTeG8waW9NMTRsb2VtU2x3T3piR05seWluemdyeXpCTlBx?=
 =?utf-8?B?YXZuWEFuVGY1UitBOXkyMFVFcFRQYjZOWTlLZmh1ajAydFh1UWNJZWtuNWps?=
 =?utf-8?B?RzhORmpCYzBOWEJlN2MwUGlER0MwTUMzb085dWJrcktibVFHa2ljK2xUUEFs?=
 =?utf-8?B?NmFYdWFCY0dmaE50UlN6YURMQW1TaDBWcUhoQ0p2MEVKUk5XWXg5dFhYNWVM?=
 =?utf-8?B?YmRIM0RaUGR0ZXQvWHFJaTlxdExTTFNDQ200WE4yL1RxeHFabzBOUzZ6T3hy?=
 =?utf-8?B?NktuWENtWkdWa28vVVU2cW5wOXhzOTlnR1NHaEUyTVpnR094ZXo3S0VyRGNw?=
 =?utf-8?B?cXVJS3NLeW1HNmRxenRPRXFkTnhhN1kyVFgrWXFoZko3a2toZmFuV2VoQ0I5?=
 =?utf-8?B?MUsrdWd4Uzhab3lybkRCUmtoaHJTZ3ZVanVNbkhPQnJUMHpEcGNNaDNRLzJY?=
 =?utf-8?B?V0dzSVJQT2E4eXV4OWx3UmJOaHZRZ2gvQlB2bmtsODdFeFVUSGNtTTlNNEJq?=
 =?utf-8?B?dDZiSEJjaWRkTUpsaFMva3FZcUVWNzlxVnpQdGRZZ2sxbHhqOVpsYnNva09m?=
 =?utf-8?Q?JOus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRiSlJ6aE5qNFpINUJQSG9MYlZnSitpK1J0bUpXOGZaTWJXYmI3SHdKdlZP?=
 =?utf-8?B?QTFkamFibjZYbGdjVVMwaUhvd3lMOHFpSmxUMXBCUU12RE00T0hLSCtLdHJ6?=
 =?utf-8?B?aFg4bG1Dby83UE1waXJ2eVpEUnNTVU5nZHBENnZlMEt2U290amR1S2VsUWJs?=
 =?utf-8?B?MGdud0xGdUlzRDR5Y2hvaEZ6NzNKUEJDWTZ5bWU1WmJBZXo4VUEzVmJLbkwz?=
 =?utf-8?B?MjZId01CeHI5cVJ3SmY5djllTzh2UG42Mk9nT3VYZmJIcjJOSlR3UjFsaFJw?=
 =?utf-8?B?dktEU1pacmVKNXlhZGd4WDdRMDMvdEFoWVorRmZjbit0cGlSQll0K1VsTWtm?=
 =?utf-8?B?ZEZUMzJuQ01aTGMrdFZJWFk1eUZiSEU0RnAyRFJDNExTYlNjSUtUMTlsVjVu?=
 =?utf-8?B?Y3lPK1YwY1dkVnRUVkxTeENtNTdzMUxXOWFITnp1SjJiN3NKUGRUNEJYTnVR?=
 =?utf-8?B?OTJPR044amhQUGJCMXZtcW9Mek02cndYMlQ1cm1BY3hPeHNQdEg5dTBDSGJX?=
 =?utf-8?B?NmVxNC9mc202YVpLTzlXRmlaOWRKTmdHYVA2TU01dlc1U2Y3bC9la05XR004?=
 =?utf-8?B?MEZWamtHZjFMNGEvbTJoUnhhMW83ZE9YYmIyZmdXbWVMWWxJMFNSRjNMUG9E?=
 =?utf-8?B?NlF3MWhBWm5LZ29RVm1ya1ZKUDdWVUNvSzVMOW8vSW8vV1FmcXRaTGdyVUxD?=
 =?utf-8?B?ZzNjWkZyTjBzNmhTemhqR21KSHRwM0hYMmVzMzRaZWxGbjJHYmhmT2ltQVJx?=
 =?utf-8?B?SDNLeE5zb0o1ZXZMYkpMdjRDV2JQcUhGUjJ2eG1IRkhuMXhEQ013RXpCYmR6?=
 =?utf-8?B?REhBb05KUWFJY21JbXVmVTNGWnFJUlAyK1VFRTEwTXJnMEUvM2xJa2lMSWNF?=
 =?utf-8?B?TnJTR1h6UTJkV2lTT21WRndCVmhJMW9ST205RDdmMnZ4VDUzZm9WKzkrNFZX?=
 =?utf-8?B?OUZnc1pLbHB5QlhDMjlBRmo2OUxtVUJHR0NDU1d4OTVWdGhwUDZiUzdQaHdr?=
 =?utf-8?B?MjlrUmtuS29xb0tCb0piUytPTVQ2MkQzSEp4NDVtVWNVa2tNSlMwcTV0ejRq?=
 =?utf-8?B?SVV4eVZTK1ZOek1qOGw3V0NidTJuRkprdGpFbUNVL2UybUJzMVhNbFU1RXRn?=
 =?utf-8?B?MTZlRWozaUExMUtOOFpkSTdoUnd4S0FqTFBGWmJlMlBBOUliRzZzNDN2MmxS?=
 =?utf-8?B?ZHREdnF2N0w3ZmgzNHl5NkV6LzhzWVJ4VkxQaE05Q3R4WDR0S3lnU04rakg5?=
 =?utf-8?B?S1A1Qllic2duUXdJTlNPZjF5NzFVOW8zZUpTUjIrK1JsR25hbXZ6dHViKzN3?=
 =?utf-8?B?Mm1tWklpNjB2ZVFVZEM5UmxhUm5obUkwenVnOGU5SCswVDVpOElpK3F1OE5E?=
 =?utf-8?B?MDIwVzgvNm1DN3QrSlZZMDhBY0doRUJUZE5tV216TE5xRjRuWmNqbHhyeXR3?=
 =?utf-8?B?alVhd1pKR2NuMUQ4alZNQ28wV1R4SE9HKzdmSUdpenFneGRXUEpWTEJqaStZ?=
 =?utf-8?B?L0VzcWlXdG1Eb1drRGRxOWlwVVBHYld4L1FCN0VQOTk3NnRvck81Y3kxQlM5?=
 =?utf-8?B?WE9uMlo2ZjBJUmpKRks5YmVsY21SSU9acjJLekFSMXNQYW5IWWs2d2lHZVRG?=
 =?utf-8?B?WDBza0ZJSTJnRi9oTnlNUmh3WVNiRGlvUWxmd29mMFFhVlVybFQ5U1hkNTV1?=
 =?utf-8?B?SFhDOE5DcC9rYmlyUUtFTFhubEVmbU83TnplWWJTbXNCWXdWVVU4Mi9yREcy?=
 =?utf-8?B?eGxOZmJrRjkwYUZzdHZ0MXI4VWFQd2lhM3cxeTkzUm00dFVKdTQ3cm1XVXc1?=
 =?utf-8?B?bXF0YjhHWmd4a2FnUWpGc2tUc2Vka3N5aFN3VEFpdGRZeC9tQXhsYmNhTGVF?=
 =?utf-8?B?akZBR0NOOUFIeEdCcXI3WVgwVURrOE5UdTlJVWhjK1ExcmJMWHRLdFpzQWxy?=
 =?utf-8?B?NXo5TS9ZRHVHTHRhMm94bGxzdTlvd2FLSnVrQmlVQno1YUNoRU1SaTJJNjhO?=
 =?utf-8?B?QTZKeHBxbGNUSHhIRmFySU9TdnByaDRGc1ptVHpYSStNcldEU1d6Q0FabXk1?=
 =?utf-8?B?dC9yeEVTQTU4RHVTWkJGcUloN2RWL0J6NTFDUGFjL01ielkzZlEvVENUVHdp?=
 =?utf-8?B?MS9UUTBlZVpZb29tL0hoNUFBQ0tnbDZDbjB3WWtoZGFoVitWeE1ZUmdMcEZl?=
 =?utf-8?B?VmVGN28ybW9BVktNMjc3UlJ5YklzRHd4MkdrdWZGcS9VUFdrUmVacE1LdzNs?=
 =?utf-8?B?UkVqcUVKcHp2aVlDSzVDMTFMdlJUbWQ2YkJBemRqWFRKc1gxRzRIbFZObTUx?=
 =?utf-8?B?R3FHU2Fxam8ranlFVXlrRG1CdTREMEN3VUNrZWo4OWhRNXpIeDN1aHRtQXEx?=
 =?utf-8?Q?XB2xIVTvpOdsteF+NWkiFqQcLgXgh1wlPKajeWuFMuxIJ?=
X-MS-Exchange-AntiSpam-MessageData-1: NxeHHJo1YgQ5gw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3287c1-9acd-4937-0e56-08de5e4334e6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:59:47.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2MYop2V9j7X9p+y15BePGcPzIvfU9Uk6VVAk2fQir4cbn1R2z/MQP4YBTxvBDq8Mzv5k6O0SOAS42zw640gTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235955_304826_E93BFC40 
X-CRM114-Status: GOOD (  11.84  )
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
> Changes from v1 to v2:
> - Added Reviewed-by tags from Zhi
> - Fixed comment formatting nits raised by Dirk/Zhi
>
> This series adds checked arithmetic throughout nova-core's firmware parsing
> code to guard rust code against integer overflow from corrupt firmware.
>
> Without checked arithmetic, firmware could cause integer overflow when
> computing offsets. The danger is not just wrapping to a huge value (which may
> fail validation in other paths), but potentially wrapping to a small plausible
> offset that accesses entirely wrong data, causing silent corruption or security
> issues.
>
> This series has been rebased on drm-rust-next. If possible, I would like us to
> consider merging for the upcoming merge window to avoid future conflicts.
> Tested probing with GPU name printed in dmesg on my GA102 (Ampere).
>
> The git tree with all patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-checked-arith-v2-20260126)
>
> Link to v1: https://lore.kernel.org/all/20260124231830.3088323-1-joelagnelf@nvidia.com/
>
> Joel Fernandes (5):
>   gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
>   gpu: nova-core: use checked arithmetic in Booter signature parsing
>   gpu: nova-core: use checked arithmetic in frombytes_at helper
>   gpu: nova-core: use checked arithmetic in BinFirmware::data
>   gpu: nova-core: use checked arithmetic in RISC-V firmware parsing

Looking good, thanks! I'm staging these into a local branch and will
push as soon as `drm-rust-next` reopens.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
