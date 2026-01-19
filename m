Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF21D29C4D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss1JiNy/gh+VLzePy+uqnfJVbVtMCLWH8KNWWevmDmE=; b=J8qbbz3JrPU+fA
	vbaUAmCTgkKmiV4iVWtFesMDWZ6JI71KhesESfkuQQxQYjou5TrHNQUp5+aAxs6B5sPtBGy4KotMe
	GJdftvSx8f/NgbkBlwJT8YcUYOgom2yk0Nt3CXiWVyFCkCmAWFCr/w7mVvu2ZTNbh7HXmUl7IwWSn
	tTr2xf8iRBqRwPAu1XhS5D9ga9eOvhPq3B8QgOZpp4bahCZsXYGulm0mriY/sAv0Y+yGujrl6j0NV
	tWxtryoFImU7Z2EtvS8I0qInw+OpMtIAaAw/E4Ep7bFKYSESppFVRUh/mPeF6hgLxXysD9pviLJKc
	UcUH8tsgojCkxZQCTsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhssZ-00000002bvy-2Vgc;
	Mon, 19 Jan 2026 17:17:27 +0000
Received: from mail-uksouthazon11021143.outbound.protection.outlook.com ([52.101.95.143] helo=LO2P265CU024.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhssW-00000002bvW-1Myj
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 17:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao6Pwl8i6A81baxdjXqK0RrQpWs5/jiuz5Ao0KbG8fOBhBv9r/GljqJSD+87ARQ+ckIeaaGnqBCKOmADBof7rzz6UERK5Yul1WX12NY0Hp/wGLzGPUCiJcvDiYq0iwg+osV7WcIdkyQ1MRzUKNfXNiYjtVpYxvRuQI3cwRO8qpUDDJC8ZX7MIZ+vRnkcIzYFdOMhW9CYyDqZoV/oWNDzBSrTrKC8rihCFwJAmEKu10bv7WTDC/XDf5Lgd4x5zXII5dmOLqjTaHRE3ahTgUX81DSebAKOuCVmCfOpAjpaHpCyJlEwOq7nS8HRMr6UMOJ7Vb5DeSStfMLwdWD1AGOaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B0SywX0slKyYjvwO6YhyHQMeANAAbLepB4d4/tSq5s=;
 b=ngY17oa/XoSR/WydF9MQINZM7A8t0OVL0olq7C9x3DBg49bH49+QYv4K/ab7L4gXCxBLEh0bS+cVhbH/6nUanANIMbWksfF51ix83vESFs24cLBi3XQz6onyuXCUs31/au/+otU3AVUSvB3TMfptrvjb7UvjRSmZnm9UbYn3/1W+T3NmdVW5b3zsfPpNlbAWbYmSv9ayNwQmA0x0CN6byFD8Peb8RvCfEhaV7sHYTpE4FexWhM7uzJmu7ACcokdZJ7jj/7dyvWFOy2kh/82moze7XsNN4W/gsxkPDBJL16V5JDfMYr9tZk2OeA598UDbpEkQqlwAKVSdupKcq8sulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B0SywX0slKyYjvwO6YhyHQMeANAAbLepB4d4/tSq5s=;
 b=x8wnnZmKPPTTStYjwP8XeTKjzEX/NbMtIYSaRo67Tzyl/l+dmBKzr3S0hraKhfTCKK+ZAW9jBsBs4aCA/QntOcnn7P8s4qX+/+N3ew93K6OCXq4myX2W0JGZxvnoK3dPnizpVI2ClsFq1xQ/GjWD2ALDrGor0iM+Zwxco3tSSwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7229.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:346::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 17:17:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 17:17:19 +0000
Date: Mon, 19 Jan 2026 17:17:19 +0000
Message-Id: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
Cc: "Will Deacon" <will@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Mark Rutland"
 <mark.rutland@arm.com>, "Gary Guo" <gary@garyguo.net>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yury Norov"
 <yury.norov@gmail.com>, "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Chao-ying Fu" <cfu@mips.com>, "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "olof@lixom.net" <olof@lixom.net>
Subject: Re: [PATCH] riscv: support CPUs having only "zalrsc" but no "zaamo"
From: "Gary Guo" <gary@garyguo.net>
To: "Vladimir Kondratiev" <Vladimir.Kondratiev@mobileye.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
X-Mailer: aerc 0.21.0
References: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
 <8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org>
 <AS2PR09MB6296A1D1EF4ABD1C45202440948BA@AS2PR09MB6296.eurprd09.prod.outlook.com>
In-Reply-To: <AS2PR09MB6296A1D1EF4ABD1C45202440948BA@AS2PR09MB6296.eurprd09.prod.outlook.com>
X-ClientProxiedBy: LO4P123CA0695.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7b78a0-892f-41e6-bd0f-08de577e9a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0t1MFBzNTJyNGJaT0N4cUIvY1h6UGFrZG1JSWtURWJDeDl6MVk3S0syWStB?=
 =?utf-8?B?L1RBNmhxS1ZvMGQ5N1FtSzZjcm9YRU1HZ0tHRm41T0pKc3B4SGI3bWJ0d2JL?=
 =?utf-8?B?K1JRMEJHRzByNnJFR3JkSG5jZHBNMXNKZjdmbG1vYm54bXlYdGVzU1p1dnBG?=
 =?utf-8?B?ZU1jd0VEeGNwZ3F0QkFGSEk0alZoVUdmVUxTMEJ2bXFOc3ZWT29lTU9TQmVa?=
 =?utf-8?B?MUtSNnd0MnJPUHVxNDBWME1POWU0SkJMcENZN04xWnFNbGVoOEdSNVVrUG9T?=
 =?utf-8?B?MjZrcGNaNk9MMjQwSUhiQno5cGEyTFpCeUdYeXpia2NYZkEwTWx1YWFrSldV?=
 =?utf-8?B?b3QyNk1sQStVMlpGSU4rUit4ajJIb0VvMkRPampVOGd6WThQV1BlQzM0dmRY?=
 =?utf-8?B?SXptTnBuUmFrNkhjWDl4ZWZ2M2d6YmFkZFkzQlNLM1JKOXpoaG83bEJNd29L?=
 =?utf-8?B?MEkwWU92dU5tTmtqYVJ0YzZ4dUJ1RFcrYUV5RnNHcjRYQWdYNDE5QXlFTDJU?=
 =?utf-8?B?ckZRZkRQSUFzR0tDTnhCL2RVaWFSc204NWM3NHI2M2hVeFBJU3U5c3RJR3lw?=
 =?utf-8?B?cG0vd3V6L3g5RFBwK0RpQ2VEL3lhMUx1SDZySXNpTGROOXloODRHb3NlRHJ3?=
 =?utf-8?B?THc2Ty9GMUZ1MFl2aVhiaVVGS1JEbGhVOHh5Y1k0ZU1KRktMbE9xa0ZYdDUv?=
 =?utf-8?B?SWwxNjFZZUJKRnpwdWg4T0pncG1Vb1VCcE1qZmhYMFQzdzNDSUZYZUVTaGlL?=
 =?utf-8?B?dEozMUlzTVdiMGwvd2hyVU8zQTRxdGtTNnZLVzZKY3ZaeXMzbnlQUXJCek4x?=
 =?utf-8?B?U0Q2eCtucUp5RnZQYVA3d29JS1hRdyswSXR0SmVETVN0UnhKOFFQVDIxVjRz?=
 =?utf-8?B?dWU0cUNNZzlYNFlMSFdKMXdnTW94Qk8yZWFXOWdZMDhFYkgxT3cxTUsrYWxV?=
 =?utf-8?B?bUJqOEZtV3BmQTBRT0RKb2phK3JQMlY1RVpUOGtKVXhIWjlqTVcxaDA2cmZJ?=
 =?utf-8?B?UzdvSnhwU1REakR5OTJzT0t1Mm1WVHhkVHRPK1R1TGN2MC9OWGZOQjZUY2Zp?=
 =?utf-8?B?UjdZaHUzWEU3KzhxNjRrTVF0U0NqY0xpVWxwYkZmcjA3ZVR2Qi9XcXJDbllv?=
 =?utf-8?B?TUtzSmxUQUxOMGt5QngrWFFJWHdhMXFMRnlYcW5LcUU2V01BdkZlemgyT3Z0?=
 =?utf-8?B?UkppdHBIK01NYnRNM2ljUm9wUEs4b0MvSm1DNkdMUndvVkpNb01DMXh0a2o2?=
 =?utf-8?B?dDJVV2xoSVhLNmV1OUVXdXJDVjdZZlJOZlVFaXZVVXplSVMxeDM5UFJXOU9v?=
 =?utf-8?B?SHdoRkZqSzVHZGx3azYxVUJ2R0tMM204Nm5sNk4zOGdXMUhVMisya1RqUWN0?=
 =?utf-8?B?VTJmdWdqSGI0bS9Tdm1DVnhmZzVncFprOU5wbHUwa0lNczRWYklQM3I5cnBQ?=
 =?utf-8?B?M2ZNRU5sSHBWU2drejJldDNKWGY2M1FoMUlrWVpPNkQ2Y1FPUnJsVmlGRUhx?=
 =?utf-8?B?aEZ6djhNa1creUZkZE9pSmZtK0ptTzd5UUg4Sks1d1hpVGdYbkZPMERCQVVi?=
 =?utf-8?B?Z1plUVZlQVFDYlhsWm5CamovNS9SeG8zTnN0Yi94S1Y0TlpRdzhLSUlUbm5P?=
 =?utf-8?B?bXppS2hlcDZnMURqWm1xZE5pSWpuUGlzLzVGeEM1UDlWMTF4OWE4R1BEOW40?=
 =?utf-8?B?UUJyUkxsbmdHNEtPTmNER0lUcXYrYTdQb1BDY2pzZG9wSXhOZkpON2RSeUYx?=
 =?utf-8?B?WC9Od09OTVFkak96ajQydWppOWhCUFl4V2tGbUY4RGFwZVFNTGRreGNmOGRp?=
 =?utf-8?B?K29NbTN5M09CS2FwejZPMTZkb0IxTVJpR3BCdkgzRm1mTjJaVWhoeVJkSzJ1?=
 =?utf-8?B?WTZsU2oybk1UT1dYYmN1a3NxKzhpMjVFcFlwNmEyZHprS0J4R3JFdHhaeDVS?=
 =?utf-8?B?dVBYdmlDYi9iSjZNMmhQYmJ0RVgzV0xZSVRUR0d0UVFhVVpsSzczcW1aT3pW?=
 =?utf-8?B?M1BTQVdnWnJXUXZiYkhHQlhQOTRDeVRzcVNDYm1nU29qcnJmUWFBUWlkWTlB?=
 =?utf-8?B?U1lhS0dQbzVscTE0bGNBRFpiekRkVHdzRlZISStrVlVVeHExc09DT1hQSkY2?=
 =?utf-8?Q?hhxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dpQllNOXNVUnVzaFVncVp2NmJxMERKWnJxSVlSV2xncWo2OWhkSERDOWcx?=
 =?utf-8?B?clhaeHhoSWJIY0xGbnI4RVRITERuckZBQ0pseUQ3em9ySTh4YUNWamRzb3Fx?=
 =?utf-8?B?QzVFV2FMUG52WVpZRUZWQnNaQm5PTlVPSmpVTkpMY0JLOWlTeFk1MHVvRGNp?=
 =?utf-8?B?dURIWEhlM1RUS2ZhcXRRQ3E1ZWNOYm02eU1LQWh2SkhULzlnc08ycS9vdTdv?=
 =?utf-8?B?aXIvZnpFUTQ3TEJvcnliQlZGbDF4cnY3OUZucDZMZmc3NmV3RFc1dTFwODNj?=
 =?utf-8?B?SnA2YThsaFNQdlU2RVpVdmdFeDlQVjJpNkFXYVlOKzBTS0NqMVlpdWdwcENv?=
 =?utf-8?B?VHMyQkZXM1d4NDVxbUVJdTUwd3YwYml5a29VMXk5T3F1eDV5RjBoZmhWQnBV?=
 =?utf-8?B?enNZS2h5YkxmZ0Z3ZFAyR3o0S1h1cnJ1VWNXTFYzTTI4cmYrVEVGNWc2M2E2?=
 =?utf-8?B?UWFGcXBjcXFFR2JNTjV3RmNySCtQZHpNMzNNdVdZQ0VBMzhrMTJOMzFrOHdO?=
 =?utf-8?B?cHY4NmQvY1VQYkNYdDhIaHFFSTgxbWkydFUvU3FTaHJVVUpIVEhUYWd4aEhB?=
 =?utf-8?B?RTR4M09SVU5KbmZJVEdvM2NyRGpMMzFBOURNekxaUGNHMzN3blptaEkxRW00?=
 =?utf-8?B?akFtLzYyV3VSKzNzenhWVllTNW05SnlsbnJTVTRrTW1IU29FbW13NmxnaWpR?=
 =?utf-8?B?SnhiRENDUnl3ZWVoSTBENjd4Q3VPZnlaTXFXLzBRb1kvcHhQOXJ0YjE3OGlx?=
 =?utf-8?B?OTl1UlgxQVp5eEZEU0w0WituVGxFdS9TZk1Dd3czT01IcXlPYld3Y3JjWitH?=
 =?utf-8?B?UUJUVWdNVC9SRldHbENaemxlZFZHalgzdlliOWkwcGFQTWNNSTgwaDE5QzRT?=
 =?utf-8?B?WjFmTnFJQzhFYlVkcGgvbHdJQ3dPL2lBT0VueUthRFFSOW1FZGRhZkE0SDVi?=
 =?utf-8?B?NHRaSVVON2doZ0dmeEFNVVBveTQ2VFMveFBqeVkxQUw4SzZIRENEKzJqTklI?=
 =?utf-8?B?OFJRbS8xZFAwV2NjcFU5QWRFM3JqdzRBOHFtTkUwUVBhS1RGMWRzZ1llc0xk?=
 =?utf-8?B?dGZqTEZodEE5a0RES3QwakVZellPMjZMOE1YeVp3VmpJclNKNmVPdUwzVm82?=
 =?utf-8?B?NnFmZlE2UmFuVWJrWTRKMU15M09nTFlYNThjUEVOMGdMR09IbUx0TGt2STcv?=
 =?utf-8?B?alRtWEpnT1h5S3dsNThkRGNBMWZLVE1JbEwxYmZoaVQ0RU00QU9ydU5kSEI3?=
 =?utf-8?B?MHE2ZytOUlBaY21VRDJrQzNLZG9QR0VPM1F5aTJSbGM4aHNpRWkwYUt4Y3ZN?=
 =?utf-8?B?UW90OVFoczcrRE9jcGJTU2N3YkJBU09Zc05PcHE3cUEvQmlXQWxWekFCOG9k?=
 =?utf-8?B?cWd4K3NiTFgvcnlsc1hrQ3R5VXRGOXAyZXdZOERQd2tYVzBPOUsyMEk3Zm1l?=
 =?utf-8?B?KzFDZU9nNU0ySVF0eU5XamhORWlvMGt0bGE2dUFmRVVjY1ZNMzZpcXh6YjV3?=
 =?utf-8?B?SzBzQnVpMUQxeU1hRmQxU2UwK2hlZkl3b1ZacnNBZ2VsM2l0ZUtXbjZTQ0hh?=
 =?utf-8?B?UkVOdHZVZkVFNmgvdVF1SURTc0RxM1dmaWZXZUg1cUkwR0lqb0dPT3k1ZmZr?=
 =?utf-8?B?MitkU21RSzdyUlo4Q3llTy8rc0lBTldQS05YSnN6WkdxQ0xMWDFOVGJMUXF0?=
 =?utf-8?B?UUoyU0tTS2I4MlY4T0oyK0xEeTdwSFBuK2x2M1VaTkdIN0lmaS9VTlFXRzQ2?=
 =?utf-8?B?d2gxbHFLVEdhMk9ScUZwMldxWndCR3U3QXRQaU41K3o2Qm8wci8wTDgzNUpm?=
 =?utf-8?B?RWN6RVB3emZEckVTTFJ2RVlyaytNNXBsbFRXSFRSWm0xNmtqNStpbmhSWFF0?=
 =?utf-8?B?K1BaU3FiSS8yU1JSVFRsem5LQ2tPK2N3MzIyUm9LUDQwV3Qzbk1kTlh3dTRj?=
 =?utf-8?B?SXl3NVNQdk4yZTh3SGFqMHlxd0dKRVVhRENaZmJ3UytoaUhKRmowRGhhQkNU?=
 =?utf-8?B?eGF1WHlGa1lUVVRwcE5pZE5IVXBIMkN2RzVNcHMzTlRoV3p5ZDl4VURDN0JE?=
 =?utf-8?B?eDljaUxobzVudEdtb2NKVjd3SXQ2MmM1cDA5OUNVMXQrZFBwS3RQN1N1eXZL?=
 =?utf-8?B?T2ZyR2thTThRMzhWajdqT091eThtcGlwVk1nUTQ3N0s1QlRQMXIyRVpHS2JD?=
 =?utf-8?B?bjNYRCtBRWVTR0h5L3lkeTQ2L0NTWjRnT3FXQmRncUVoRlRYTmJwM1hiam5D?=
 =?utf-8?B?dDFCZU1vNTd2R0hPQkR6QUNDdzdCcDJ1YWI2SXJjOVJCZkNiUUIzMEtsOW1i?=
 =?utf-8?B?alpzRmE0bi9DeWJLRThueWErdnhnLzZ3dzFMZE5iWkpXbGhlbXpKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7b78a0-892f-41e6-bd0f-08de577e9a2e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 17:17:19.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HVjNCBj1S4einhBX1DNrgkdMeQ51rz2j8rskn6c5iz9tdA9zCfiMfumsP/L/WtCYC85S02dKaJnoG6gNM806g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_091724_513272_57CE803A 
X-CRM114-Status: GOOD (  28.37  )
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

T24gTW9uIEphbiAxOSwgMjAyNiBhdCA3OjI5IEFNIEdNVCwgVmxhZGltaXIgS29uZHJhdGlldiB3
cm90ZToKPj4gPiBIaXN0b3JpY2FsbHksICJhIiB3YXMgZmlyc3QsIGFuZCBMaW51eCB3YXMgcmVs
eWluZyBvbiAiYSI7Cj4+ID4gdGhlbiAiemFhbW8iLyJ6YWxyc2MiIHdhcyBpbnRyb2R1Y2VkLiBJ
dCBpcyBwb3NzaWJsZSB0byBpbXBsZW1lbnQKPj4gPiBtb3N0IGF0b21pYyBvcGVyYXRpb25zIHdp
dGggZWl0aGVyIEFNTyBvciBMUi9TQy4gQU1PIGlmIG1vcmUgZWZmaWNpZW50Cj4+ID4gaG93ZXZl
ciBtb3JlIGNvbXBsZXggZmxvd3MgYXJlIHBvc3NpYmxlIHdpdGggTFIvU0Mgb25seS4KPj4gPgo+
PiA+IFBsYXRmb3JtcyBzdXBwb3J0aW5nIG9ubHkgcGFydCBvZiBhdG9taWNzIHN0YXJ0aW5nIHRv
IGFwcGVhci4KPj4gPiBOb3RhYmxlIGlzIE1JUFMgUDg3MDAgQ1BVIFsxXSBoYXZpbmcgb25seSAi
emFscnNjIi4KPj4gCj4+IEFyZSB0aGVyZSBhbnkgb3RoZXJzPwo+Cj4gSSBkb24ndCBrbm93LCBJ
IGFtIHdvcmtpbmcgd2l0aCB0aGUgTW9iaWxleWUgcGxhdGZvcm0gb25seQo+Cj4+IEFyZSBkZXZl
bG9wbWVudCBib2FyZHMgYXZhaWxhYmxlIHlldCBmb3IgdGhlc2Uga2luZHMgb2YgZGVzaWducz8K
Pgo+IFNvcnJ5LCBuby4gTW9iaWxleWUgZG9lcyBub3QgcmVsZWFzZSAoYXMgb2Ygbm93KSBib2Fy
ZHMgdG8gdGhlIHB1YmxpYywgaXQKPiB3b3JrcyBvbmx5IHdpdGggYXV0b21vdGl2ZSBjb21wYW5p
ZXMKPgo+IDxza2lwPiAKPj4gPiBJbXBsZW1lbnRhdGlvbiBpcyBnZW5lcmljLCBpbnNwaXJlZCBi
eSB0aGUgcGF0Y2ggWzJdCj4+ID4gYnkgZGV2ZWxvcGVycyBsaXN0ZWQgYmVsb3csIGltcGxlbWVu
dGluZyBzaW1pbGFyIHBhdGNoIGFzIGVycmF0YQo+PiA+IGZvciB0aGUgTUlQUyBQODcwMCBDUFUK
Pj4gCj4+IFRoaXMgZG9lc24ndCBsb29rIGxpa2UgYW4gZXJyYXR1bS7CoCBUaGUgZGVzaWduZXJz
IG9mIHRoaXMgY29yZSBqdXN0IGNob3NlCj4+IG5vdCB0byBpbXBsZW1lbnQgQSBzdXBwb3J0IGlu
IHRoaXMgQ1BVLCBhbmQgdGhhdCdzIHdoeSB0aGF0IEFNT19JSSBiaXQKPj4gZXhpc3RzIGluIHRo
ZSBtaXBzY29uZmlnNiByZWdpc3RlciwgY29ycmVjdD8KPgo+IEFic29sdXRlbHkgYWdyZWU7IHRo
aXMgaXMgd2h5IEkgcmUtZmFjdG9yZWQgdGhpcyBhcyBhIGdlbmVyaWMgZmVhdHVyZQo+IHJhdGhl
ciB0aGFuIGVycmF0YS4KPgo+IDxza2lwPgo+PiBJIGd1ZXNzIHRoZSBwcm9wb3NhbCBoZXJlIGlz
IGZvciB0aGUgdXBzdHJlYW0ga2VybmVsIGNvbW11bml0eSB0byB3ZWFrZW4KPj4gb3VyIEEgc3Vw
cG9ydCByZXF1aXJlbWVudCB0byBzdXBwb3J0IHRoZXNlIHNwZWNpYWwgY29yZXMgdGhhdCBvbmx5
IHN1cHBvcnQKPj4gTFIvU0M/wqAKPgo+IFllcyBpbmRlZWQuIEluIGZhY3QsIGFueSBBTU8gaW5z
dHJ1Y3Rpb24gbWF5IGJlIHJlLWltcGxlbWVudGVkIGFzIGFuIExSL1NDCj4gc2VxdWVuY2UgcHJv
dmlkZWQgbWVtb3J5IGFyZWEgaXMgTFIvU0MgY2FwYWJsZTsgb3Bwb3NpdGUgaXMgbm90IHRydWUu
Cj4gQWN0dWFsbHkgImEiIGlzIG5vdCBhIHJlYWwgcmVxdWlyZW1lbnQgdG8gaW1wbGVtZW50IGF0
b21pY3MsIHdlIGp1c3QgbmVlZAo+IHNvbWUgd2F5IHRvIGRvIHNvLCBhbmQgIkxSL1NDIG9ubHki
IGlzIHN1ZmZpY2llbnQuCgpNb3N0IFJWQSBwcm9jZXNzb3JzIHRvZGF5IHRoZSBmdWxsIEEgZXh0
ZW5zaW9ucywgYW5kIG11bHRpcGxlIGRpc3Ryb3MgYnVpbHQKc29mdHdhcmUgZm9yIHRoZSBmdWxs
IEEgZXh0ZW5zaW9ucy4gT24gdGhlc2UgbWFjaGluZXMgeW91J3JlIGp1c3QgYWRkaW5nCmV4dHJh
IHNwYWNlIG92ZXJoZWFkIHRvIGFsbCBhdG9taWMgYWNjZXNzZXMuCgpBdCBtaW5pbXVtLCBpdCBu
ZWVkcyB0byBiZSBzb21ldGhpbmcgdGhhdCBjYW4gY29tcGlsZWQgb3V0IGNvbXBsZXRlbHkgdXNp
bmcKS2NvbmZpZywgc28gc2F5LCBEZWJpYW4ncyBSSVNDLVYgYnVpbGQgd29uJ3QgbmVlZCB0byBp
bmNsdWRlIGFueSBvZiB0aGVzZS4gVGhlCm5lZWQgdG8gcmVidWlsZCBlbnRpcmUgdXNlcnNwYWNl
IGNlcnRhaW5seSBzdWdnZXN0IHRoYXQgQUxURVJOQVRJVkUgbWVjaGFuaXNtCmlzbid0IHRoZSBj
b3JyZWN0IHRvb2wgaGVyZS4KCj4KPj4gSWYgc28sIEkgc3VwcG9zZSB0aGUgcXVlc3Rpb24gaXMs
IHNob3VsZCBhbnlvbmUgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbAo+PiBjb21tdW5pdHkgY2FyZSBh
Ym91dCB0aGlzIGNhc2U/wqAgSXQgd291bGRuJ3QgYmUgZW5vdWdoIGZvciB0aGUga2VybmVsCj4+
IGFsb25lIHRvIHN1cHBvcnQgdGhpcy7CoCBBIHNwZWNpYWwgdXNlcnNwYWNlIHdvdWxkIGFsc28g
YmUgbmVlZGVkLgo+Cj4gVXNlcnNwYWNlIHNob3VsZCBwcm92aWRlICItbWFyY2g9cnY2NGltY196
YWxyc2MiIGluc3RlYWQgb2YgIi1tYXJjaD1ydjY0aW1hYyIKPiBmb3IgYWxsIGNvbXBpbGF0aW9u
OyB0aGlzIHdpbGwgaW5zdHJ1Y3QgY29tcGlsZXIgdG8gdXNlIExSL1NDIGZvciBhdG9taWNfdCBh
bmQgYWxpa2UKPgo+IDxza2lwPgo+PiBJZiB3ZSB0YWtlIHRoZXNlIGNoYW5nZXMsIGl0IGluY3Jl
YXNlcyB0aGUgY29tcGxleGl0eSBvZiB0aGUgdXBzdHJlYW0KPj4ga2VybmVsLCBhbmQgaW5jcmVh
c2VzIG91ciB0ZXN0aW5nIG1hdHJpeCBhcyBtYWludGFpbmVycyAoYW5kLCBpbiB0aGVvcnksCj4+
IGZvciBhbnkgcGF0Y2ggc3VibWl0dGVycywgd2hvIHNob3VsZCB0aGVvcmV0aWNhbGx5IGJlIHRl
c3RpbmcgdGhlaXIgd29yawo+PiBvbiB0aGUgY29uZmlndXJhdGlvbnMgdGhhdCB3ZSBzdXBwb3J0
KS7CoCBJdCdzIG5vdCBjbGVhciB3aGF0IHRoZSBnYWluCj4+IHdvdWxkIGJlIGZvciB0aGUgYnJv
YWRlciBjb21tdW5pdHkuwqAgQXMgbWFpbnRhaW5lcnMsIHdlJ3JlIGFscmVhZHkKPj4gY29uc2lk
ZXJpbmcgc3RyaXBwaW5nIG91dCBvdGhlciBjb2RlIHRoYXQgZG9lc24ndCBzZWVtIHRvIGhhdmUg
c2lnbmlmaWNhbnQKPj4gY29tbXVuaXR5IHN1cHBvcnQsIGxpa2Ugbm8tTU1VLCBmb3Igc2ltaWxh
ciByZWFzb25zLgo+PiAKPj4gT24gdGhlIG90aGVyIGhhbmQsIGlmIGJvYXJkcyB3aXRoIFphbHJz
Yy1vbmx5IGNvcmVzIHNlZW1lZCBwb3B1bGFyIGluIHRoZQo+PiBtYXJrZXRwbGFjZSwgYW5kIHNv
bWUgc29ydCBvZiBzdXBwb3J0IGV4aXN0ZWQgaW4gY29tbW9uIHVzZXJzcGFjZXMsIHN1Y2gKPj4g
dGhhdCB3ZSBjb3VsZCBiZSBzdXJlIHRoYXQgdGhlcmUgd2FzIHNvbWUgc29ydCBvZiBjb21taXRt
ZW50IHRvIG1haW50YWluCj4+IHRoaXMgYWNyb3NzIHRoZSBlbnRpcmUgZWNvc3lzdGVtLCB0aGUg
ZGlzY3Vzc2lvbiBjb3VsZCBiZSBtb3JlIGZhdm9yYWJsZSwKPj4gSSBndWVzcz8KPgo+IEkgdW5k
ZXJzdGFuZCB0aGUgYXJndW1lbnQsIGJ1dCBJIGNhbid0IHNheSBmb3IgYWxsIHJpc2MtdiBjb21t
dW5pdHkgb3IgaG93Cj4gaW1wb3J0YW50IGlzIE1vYmlsZXllIGNoaXAgdG8ganVzdGlmeSBzcGVj
aWFsIHN1cHBvcnQuCj4gQ1BVIHZlbmRvciBpcyBNSVBTLCBwZXJoYXBzIHRoZXkgY2FuIHNoYXJl
IGFyZ3VtZW50cyBhYm91dCBkZWNpc2lvbiB0bwo+IGltcGxlbWVudCBvbmx5IExSL1NDIGJ1dCBu
b3QgQU1PLgo+IEdvb2QgaWYgcGVvcGxlIGNyYWZ0aW5nIExSL1NDIG9ubHkgcGxhdGZvcm1zIHdp
bGwgY29tbWVudCBoZXJlLiAKCkknZCBiZSBjdXJpb3VzIHRvIGtub3cgaWYgYW55IGtpbmQgb2Yg
cGVyZm9ybWFuY2UgZXZhbHVhdGlvbiBoYXMgYmVlbiBkb25lLgphdG9taWNfaW5jIGlzIHF1aXRl
IGhlYXZpbHkgdXNlZCBpbiB0aGUga2VybmVsLgoKQmVzdCwKR2FyeQoKPgo+PiAKPj4gUGFsbWVy
IG1pZ2h0IGhhdmUgc29tZSBvdGhlciB0aG91Z2h0cyBoZXJlLgo+Cj4gVGhhbmtzLCBWbGFkaW1p
cgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
