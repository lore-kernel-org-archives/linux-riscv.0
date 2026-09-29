Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BF6CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw8ablg0SJf987cyDIrbeJQCO+uj9h1MV55ab2HpCH0=; b=pYusIyt3JwTr1S
	vvhXl4H2FOO+t7Pp80gUT6+RgahWjROadHhm5kkChlY/bLsBxOsCyV/cTcvnpF71vufBbiu88qcd2
	sPJPJKJgLeAdP/mOtIx8KHgx46rnVczMRT0gOtBzhHvJyL2qbtXJVez3n0KE9f8qbsDoN15Q9jOgG
	zXVjgsILFwCol3zZuXOp9hgRm/vuG2ZS6/NpPfn+9+uW6azKxeCVDK6AS1B2GotbEQNodgPLWLsy9
	fdLrXYS4yAYS+fH8aYZPOdao5le22DcNzCxAggBKyK8TiVeBXf8U2WHJ4RH/vphcQBZiUl5wTbbSV
	cfMDc7OkYUdFNngeQ74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVqS-00000003Nuq-0Dgj;
	Tue, 29 Sep 2026 11:18:00 +0000
Received: from mail-ukwestazon11022093.outbound.protection.outlook.com ([52.101.101.93] helo=CWXP265CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVqP-00000003Nu4-2grh
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 11:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMBz9Lr0oSW9sA3o1qdNb7SfAUMKgALvvLDzBWt6PkdKhMJleqPRNnEusjisKIHjs8p+eQB0AC4seJ6oYf+a4tnsmH8MdI1eeXvQkGmWnv4EX0vLzyOBYmcqFsHoI8eH8rVOzw4b596qDW0BxlXe/hehTIa6vE1gUibORAm/SygqVjMe4LisbRJR18e2xL5AYoZpcHbJzevnF/y4PHt3dRhH6Jp2kgr7n6BuLpBplbpSGIkULluaXovBTwNUj587UDAfaPiJQqIYjx0CoTZqYqYmqX/+CoriwCvietgAHHKKszqC4vEMgMggPnHsxuBHijJO143JXLx1iz79N11dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibM3GthIA2jgx2uZ/fVzSC/EKYdkKPuQx8+AeoTjnhQ=;
 b=b1If3aoyYA4ExJLnEGjMZ9Wd2CMC/9KV4d3xnkoypiEa5AoBfCOuOxGtGyXBvZHNRk3OnQYZus5IjlOvygcfMfCmD9ODfsLYchLdhjbSSQ4qSCxrYZVJ9QClexnS22Us0cl7076lFJk2Ec3AzGtlMgc/mYw25MTgG0fr3aVUlFEB6y7sIIgU60vF/+E/dsZpak6VReuAT54Bhb3RogYt09Le9Ox0TgG01LRVa9/ULkiAvxrEZxUpzV/k3fKggS6QHLe0ss/uCVqrTpQJ9HD5pClaFzQsibNTxR4qAd5xvCPtkNsLlm96qNOlMTc0vQSi2M7u2NXOPiVeyNMuVemBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibM3GthIA2jgx2uZ/fVzSC/EKYdkKPuQx8+AeoTjnhQ=;
 b=UVUSglJ09pJRTbFxbABG0cZeYcXVumiTMd587RwEid8Rr4nquMqLzTyiN53C6+WCkmUTKsBjasTwdjwyDFxXoenMOueY3g6kXLBGq+X6qnB0xgWhwCyZLUDU9GoZk4W0DDrOEsjNNuofVNcDHHoZhkujQeMAZqbogAC3ahxdMZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB6727.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 11:17:49 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 11:17:49 +0000
Date: Tue, 29 Sep 2026 12:17:48 +0100
Message-Id: <DLRRBILPITPS.25SC9GL1ORLPW@garyguo.net>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <ojeda@kernel.org>,
 <fustini@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>
X-Mailer: aerc 0.22.0
References: <20260929095612.1072417-1-tomo@flapping.org>
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e69f01-e445-4fff-400a-08df1e1b4b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|10070799003|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GaFMdwD13rZMNpC9yLGxLpg0/lgnQWD4ofuzGbXtqEbbjd8y+X4JCfAFy5Ts8KYqx7g1DCVU0HJ+kFBEgfjI44DaRu/vrh+/2bQE5ylx0fjYQWm/uBxV8j6Zmi29m2eWnQfX2w05+iuIWT0sB846Od83n6m/+w+XXsd74nc8dFSZf0ThW4DEtP8zNVtClL1OEi+2nXiiAXs7ANzRMImUW9tQndEqBUOjLDqkHtL4hKjwrfPX6t+SH+fFnHFurmmzCC5obF+6hFd+Fav/p1XQ+kgIpU7waUSEDfFVyA8NUiOgmVbyz5608STTOAVmJUqGfoS7Ysj9CDTmMwmqzh6pVKamAqs3aw9PXThLUihu/ekw9CtvVJ30nZlwsyO6U2rZqJ4a938qUvvdXe3Udo34bErl/tmsF1V8NjDXnZD+PL+LjT+I0sRIdXCSszhUWp392gHC6hOcYo4pulpJeFVi9eKNL7IH3DH27x16KllQMIRxr5vTJ6Qy2tZ0urGhrGvi5X19SaV20pUXam3iC/YBwdU47nV/0VarVqJNMBlYOrJizRC4fu0KSVAFfsBYms+lqZ6Tc5trhEr28INIMEbopPzzxuMw5lyoy0ULfqJdivGT4VUndKyi+/u/dsi1eCwWGe9wfL4ChI60KNpUCEaDJI4W9HSX7Wm90wfpttTam+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3NvdVZDRmtvRSswSDhlZUk0b0k0ZG5xaCtlcFFVMTBzSDVKeUNQdVZsUCtx?=
 =?utf-8?B?VXJkdllIWjJSY0RnSklTelJ3REszMEYremRMcDdSaTNFTXJDMnZ6bW1aOGwz?=
 =?utf-8?B?UjJsN09YdkNscjU1a1I0MzRLMzB0dEhMNG4waDRIYTluSlNRSmROUmI1VGU3?=
 =?utf-8?B?TURPMU9SVjhNZGwvWGppNVlSdE5zOXVXR1Y5MDBjbG5hNGJNNy9mUHdqNitr?=
 =?utf-8?B?eFdVQTY4UTdSZldGSkFjSWcyb3hFRlJDbVliQUpEbFRYajVVWlEvWVNROGdR?=
 =?utf-8?B?Vll6QzVkTjJNR05rMkpiS3dnNXpmUDhJYkhWb1ZvUHVVZjNlNFQ1YkYrd3lp?=
 =?utf-8?B?WUJybUhQM3EyTk92MGRNVWlWMVJ2SENERitGdGdKMlZqT1NtSnYwbXVmVzlR?=
 =?utf-8?B?dEtGTklES1prWmhWY1NsQU56Mjk1K2VPa1cwb01KRmIvS3BuWHp3MzQ4YVBB?=
 =?utf-8?B?aUFTU09Ua1R0VG5jNUZxMzYwWUxqUkJpd1ZjRUU2U29lOFRPbzFCOStWOWZJ?=
 =?utf-8?B?MGpMdkdzdXpLTWtxbGc3VldYMTJ1eGVsUFRMclowQ1gxMUU0am5Nd1BzYzNK?=
 =?utf-8?B?ZjJ1SGVFMlFLL1RuVFFUb0xaU1ZPR1huc3NkeGNTTktLazhuNG5mV0gzVzRK?=
 =?utf-8?B?U3llWlRrRE1leFIyZWVZdlRETWJUWkc1ZzgwYklsMlY1V0Z2cktoV25nNEZK?=
 =?utf-8?B?UG1BcGE1MXFpQVhOVERLamxwNjNtSCtvQy9LOTRSUGpHY1RFWGRrNWlEMmFh?=
 =?utf-8?B?enB4YXFPT056aXdSdSs3UHl6RGwzNWtuV29tb2FtVUJzZlh4OTlFNEJIbXBK?=
 =?utf-8?B?TWMweE9vazlIY2Vnd0E4VjVPOElwejJqTWVkWTJFY3NsL3ZaU0JKZFdOaiti?=
 =?utf-8?B?Mk4rb0pJeFpraWIxQURNbTgrcUwyTUcrRjRkNUJ6UW4xdnN1UmVDcDQwWG8y?=
 =?utf-8?B?ZE1kdXI4OU9reDlEQlNkRG9CSTZGb1BwUkRDR0RaVTNRTHhNYy81aGlXWi9J?=
 =?utf-8?B?cGU0dUVkTVZGYWNNbzY2QitHbjZFK0l2TEh5eEZEUFVicmdNUnM3SVpmUVZp?=
 =?utf-8?B?OTlDMnF4T0h1eGY5RTJtTFh4YjNyeGZEVUx4ZWlZMlhmK2s4Q3Q0endEV01F?=
 =?utf-8?B?UDFjNEZiektHamozQzIzN3ZvTm9SK01wNnlWbmwzUEtJM1lQQzFKWmxoRVFs?=
 =?utf-8?B?Wk1Cb3VLOCtwR0o5WHlFdWR0eG5aWm1UZEo4SGNkaEpKVk5iN3ZyQU9YMXla?=
 =?utf-8?B?bTlSQ1lKazNoby9MZGlMT3BzbThZWWtPRkhCR3RBZmxrdERJNGVua3J0WjVX?=
 =?utf-8?B?QlN1M2l5eDBhV3A0N3NTZldrSFgvL1hKWlZSVlpPL2hDY3UvSUd4S1o2VWFo?=
 =?utf-8?B?bU9OYmV1ZGFjZzlRRDN4OGVBck1wdEEyWXl5OUJMbDZ1VGdrUWYwV1FBVldj?=
 =?utf-8?B?TnhRT2JCNmtiSEFlSHZ4YTNjeGNzblZraGZ0OERtM2FtUUQ0SHVzbmNKTUZh?=
 =?utf-8?B?ZE82UjJrcnpaOHZrMGZsSC9RWkU3K2tmcjQ0WG1DZDllbU43ZWxwblllVWF3?=
 =?utf-8?B?NUVVVCtBK2w4cUUxRVc3ekJiZlVQRkUxSHJKRmRHVG5HSzRLVWJvblZsbVpv?=
 =?utf-8?B?aitobnRhcGg5enJLeHY0WW9yK28xa2pTL2ZoK3pJQWRocjhpY29acGdXUHFI?=
 =?utf-8?B?TnRsL0J1NnpuRUp0bTh1Mi95bXhTcVhnWWpvOUFuaWR1TDkwYWo5Q3Eva3E3?=
 =?utf-8?B?THprZDNHNkZ0ZVJ0VnVvWXppbklzYnUvYnB6WG1LaGk5a2NFc0pMMG1ReXFw?=
 =?utf-8?B?ZEM5U284eE5ja2ZtUEF6NEpkWFpFbjNRWnV1Y1RRUktTWEQ2d0JzYzRKcnNw?=
 =?utf-8?B?aFF0TVVCWE9DOWs5UmY1a29kQ08vVGN2bHVSR1RGY2JidG9Hd0o4UmVXT0xj?=
 =?utf-8?B?T1pmc2Zva3RJREgrQUtvOU9ZR2NOU0I1YVl3Z1dXQ1pYbzhOdnN1UVl2MFhS?=
 =?utf-8?B?SkRsbU1sUjlWN3owQlFQU0hJTlNjWGZzeWdsSTUxNllZbW0vdzdIcTB1VkNR?=
 =?utf-8?B?VWM5Z1V4c3VZdzJWQm9rRWNudkh3Rm5IeGhORHBtRy9PNlFqZzJzZ1pWUGxn?=
 =?utf-8?B?Y0xtVFhYZEs2bStxeElCaExKTXFOL3NjakxTVXpIZ0hoRUNIbTJkQU9PZGlF?=
 =?utf-8?B?VmlMcVN3a2dBeVk1dzdQY3dmeWZ0L1NMWFVBQlE5VFVud0lLcjMxOHE1YlQ3?=
 =?utf-8?B?eHFncHFFZngrV1ZnVzkzQThXaVVLdlM0Zk01Sy9DeEtabVRxN21oOE02VXk1?=
 =?utf-8?B?SWlDNUxaWXhXdzlNR2EraDljclhUcVltVk1qT3lxdDA3SDk3R1NjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e69f01-e445-4fff-400a-08df1e1b4b93
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:17:49.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MceS/Yn6CqDtZ91n87kpa90QbiyjRfEFbSDMNQTubJxGl5RbVFUQ9soL0ZADsQrVEXBx/jICHWnimr8LCvba7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_041757_695071_8398853C 
X-CRM114-Status: GOOD (  12.57  )
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

On Tue Sep 29, 2026 at 10:56 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
> 
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!
> 
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
> 
> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
> 
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/pwm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
