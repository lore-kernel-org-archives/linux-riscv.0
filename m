Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF574C021A5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OX24GxzEqOF9+f3hbdJP9elDirEzz++aesbXJ5eT9c=; b=SqNzU+ewoge7gh
	G3urw6gAla3+m1BBmOZn/xRxCivgb7/JqLOujfUIDyS8bhm4+LGOkOIvlJ+y7YzJTcmiIWIhCptlM
	I8nK0rmsD5j7axxnOm/RJsV2oanS+meFU1AHKCHKgr00M/qiB50c6fLix56P/wnRn0YKPqrM8KaxZ
	g4icQBIc0yfRovZeb76LcwiAIL38hw8TFRi/9bw/vVbpIFnRMonmUJP05/JMpkJoVHSHJf7nk22ep
	lyEfJ+Mzojbg1HpHsi5OyGZms/SfUKcOZpbqALPuYLvq4/mnMBjR9POKNnHvNbIu1DSDzUcLarbiN
	JFpF059usQJRIHHsWRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spVgd-00000000wJD-1dwW;
	Sat, 14 Sep 2024 16:31:51 +0000
Received: from mail-cwxgbr01on2070c.outbound.protection.outlook.com ([2a01:111:f403:261b::70c] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spVfX-00000000wEK-21gL;
	Sat, 14 Sep 2024 16:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxO/m6k279J3nvqOr9zpFbNzzX9Ts0yaPvJPEubieEanvIkjM+mJvjGlxLYhhbJJmgriK6aC75AUDSVscdcHKPxzlq2Qkp4DPXNU1aBcmeo2RS6ga+68n0+vdoe8z3RltfAuhtVVPpXSc3vMqnIBdB1gYIwHaUgQnvb+TVB7ab0Sfr6RtPUWcx9Qr1lNh4OVYqc6A+yOneKPwIQuJzqn1Dwpv8PNEEzjVkXfE7WreVKFgEZqVd44o6W3dI0puwrxQ5EAzxGZAZVw8og4ZfS8vG4SBEP4WdXrGkxeT1NBoG1gpWGisXQiokJRiknZzlANTjucCDgEIAItQmpusoe1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXvepcBFcvzoLZcbn5buzwvcucRec8m7DP4ut7EudyU=;
 b=U0tOYyNeDHfKyGc5P+QGbXyuWQNLErybPwdHnxUQMEKI3eqZqaS0c3wzg+h+b4pdXLyDpZ+WFiHKCwClB3F3FEaAHjRD5NJE/vgrB+f912g0CJhAoTK1/G+znNfQ+dJX3hlKAHUbal+neMVtYt8WhgUDQyuieG8C4PfWALpWCH9C0BLFSc/Zo/iYlpxNGqHgEbfmYStw86Xpn3cBqhiY3G6UibP1a+urlunQb4uOYk4GOPjuAyoyc/UE/rG3CP0W0zjXVOSzfqgabI9RIKZwVVX3iSWEw+E8mlYFtwg09H90PJSxlriqDfAQV/Raz7K0F4F7zvevlMad4fRjugYn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvepcBFcvzoLZcbn5buzwvcucRec8m7DP4ut7EudyU=;
 b=Ncom/Y0ioV9m9A0GEId/nMEpdL85Z7iMVLB2uz2TZxge+tOIV1hQsYlyE5PJpfykdCDI1g4yurPSo0MXL4SrCgYN7axmlC7w0vFjf8UhBmJmSuFet8jme/0e6CkvrqFpFUMeZavDAHxi5AEazABiEsmpmjrkIKGQKpZGQftLjuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LOYP265MB2192.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sat, 14 Sep
 2024 16:30:40 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sat, 14 Sep 2024
 16:30:40 +0000
Date: Sat, 14 Sep 2024 17:30:37 +0100
From: Gary Guo <gary@garyguo.net>
To: Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami
 Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240914173037.422902b9.gary@garyguo.net>
In-Reply-To: <20240913-shack-estate-b376a65921b1@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
	<CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
	<20240913-shack-estate-b376a65921b1@spud>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LOYP265MB2192:EE_
X-MS-Office365-Filtering-Correlation-Id: b3da886c-e44e-4924-9664-08dcd4da920c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFRqRk9jcEd2UUVpNDREWHhrWmhyVWE0dktLdEZzK05XMjg0Y2lFNm1VcytB?=
 =?utf-8?B?RXBiSWsycUx3K0xuR0NLdDFwS0JNck9IeGtocVVuNVFRNG42RTJsOUFSK3JJ?=
 =?utf-8?B?YWozaGE1ZVVFVXhKUDhlWDZldVhjenp1aWFLVDFDeHdWZENFWlltZWVJMWxI?=
 =?utf-8?B?OHZmMjRlQytMRU5keEhLUXo5M0c1NEZGbFBSeUVWVzRkQnVBaEhCOFFJSFl2?=
 =?utf-8?B?MElLYWd6WG5ma2pZRWVHOUtuODBVaUVzK2Y3d1JnT2ZSK0U4RjU1MHNwM0RV?=
 =?utf-8?B?cDFVZWNCT3c5cEhnUmVGSTF2dnlxZWdkQnFmZUEwTnkyVjZUWU9ZQjJFNWNz?=
 =?utf-8?B?YkNUYnM1ZjNORVFIV2d5Si91ZFRCdTh4YlE2THBIN2lsRU1OYThKMzhKc2x5?=
 =?utf-8?B?QnpXaVEwMzdWWkpvdTNiR3ZMNnJreWowRE5TZytHTVNiTGlud2ZhRWF4WTFH?=
 =?utf-8?B?WTcvanQ0N2ZQWUFZUGpiSEt5QnlsTFlnaTdpbFp3YUhBNjlET2xHZi9qamNa?=
 =?utf-8?B?dWM5d2dDa1BIUjVjQ2F3NU12KzVUVmdEWVFzdmZYQk1pSWxBNEV6eC9BNXhH?=
 =?utf-8?B?NWQ2QnIvNitVQTBHOEhmc3MyZWdmQUtBQ05SMXBYWTdwdjZpeDZwOEliaDZt?=
 =?utf-8?B?QkVQN25qYyt1VEFSTXFWNFZ6eXhuRTBMT1ZxUTByVTFxVUk0cHdIaUlyUlpG?=
 =?utf-8?B?ZTNYNWo0bWJKbFJuUzFzRWEzV2NmRDdybzhRVWVnZXEwT2Zwcm1yQkRrdE1v?=
 =?utf-8?B?YkdSekRSbGx1YUgxTy9TbHlpMUliRTFSNU9hVWdxR3BJMjJ2R1l4akYvSW1w?=
 =?utf-8?B?dFVUbmNlZWdwNFBtckVjU2FFbnVtTllTYTBPbkMyR2Y4ZVJIeGlmcGROSGlN?=
 =?utf-8?B?QzBEajIzbnQyb1B2TkRSYkpOcVdGUnlJeWpaU2hwNFYrcU1KeVNJRVl0RDE1?=
 =?utf-8?B?QlNzY2VwWWxBTE04a0NKQW9hK2NWdVdPbWRua1NNZkVxeXlJOXc4RStKNEFi?=
 =?utf-8?B?U0xpaUxCeWNYWkppK3ZhR1p4WHpuQ28rRytyV0ZPZjZCUzl1NHdia3FpWkJ6?=
 =?utf-8?B?VUM1ZW9jajBnL05HbFdvSFB0UHByOFBua29hcjAyemdiN1VPemdlMGRYbHVI?=
 =?utf-8?B?UHpwM1VkUm1QZWZSTnlZdmxiUGVUc3N1cVVYVDltMThKeHErOFN0NTZPbUZk?=
 =?utf-8?B?bDNPc3B4MHlkYmlkRWpTVHFNaEtaemdwc0tSL1NIbkQySVdFcVA5QjdWODdw?=
 =?utf-8?B?aEFBZG4wa0ZRZjNPU3ZVWDBCT01WKzMxNU1UenFneGgxQlNscC9QTklsSXBh?=
 =?utf-8?B?amRBRW1hUkVpSlprdnFiSVZRMGpwT3FzQzk4d3NWcG5BQkNqZWpFVmFVNjZM?=
 =?utf-8?B?dHAxQW94bnRkMXU5R0xDQlhBR29FVWx1T1ppeEo1eTVGZGk3dnkvZURZVEMr?=
 =?utf-8?B?Q2xCY0ZaU1hWc3FPV1YvV0dYTmpDWDlSYUF5NkEvSDgxWllCRHhHeEc0SlBi?=
 =?utf-8?B?SjJrYm9IdVlMcVFTREFqZXVvV04xbXBqZTR3eEUzMEZEOFRMbHh1NW5sT2NQ?=
 =?utf-8?B?WmtsMndjeXcvbmxtdUMyT3RwWDB6SDhhTk9HT2JHdHNYQ2ZFcC9MMnVQdk1s?=
 =?utf-8?B?VWtNUk84bmRsT05YcGVlejdEaGovdmFEVm1zaGdYQkI0U2lRVU12YlZZRFlD?=
 =?utf-8?B?MzNMYkhhbUpoZU5zUDZXcWpucVgrMDJ6UmNMY3I3M0licGRSVmpEWURjRlUv?=
 =?utf-8?B?MFlpNUlMVFlET003REVidDlYUzZNSTgvREFST25EN0RUZ29NRlNjd2pyVy96?=
 =?utf-8?B?czFVSk82aXgxampyNDV1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGlRWDdaSEFXSWVjbUFGU3ZSelNxb3puN2dNUTNvKzExWWNaZnRRRHpQYzVJ?=
 =?utf-8?B?MmlobFdrbGNyZkthdVp4TUFsZGlWN1N1STF6eWQrS0VZeXZTSEVDaTRvZnBL?=
 =?utf-8?B?dGRjSitsUWRtK0pLTXRKeGtQYWl5MjE4dnVYeWQ2TmtWVUxkd1lpazlBWWZN?=
 =?utf-8?B?UlFMTlRFWS9jY205S3RBVjBvbmdCKzEzaDhoYXpVZUk3ZjFBVmtTejFxTFN5?=
 =?utf-8?B?ZFFTemZHNWUrZCtRRlJ5b3JPVkZ4bHZYM3lBREVlZm1FdVBodUdhVTQvTWN2?=
 =?utf-8?B?dVEvQW92THd3WVRYVTB3TG1lbWVyaW8rZDFnQm5UekxxVDdQM2gwMTdKc3JH?=
 =?utf-8?B?WUNuZGYwdWNoRng5ckxhbUlsQjRpUnY0Y0JtS2pRVlhmRWZJT1VTVzhNeUJq?=
 =?utf-8?B?U1ZzQngzL05DN2UwdHhOTEQ0TDBVZTBDQnJVQ0ZSU3dacUlHSlBDMEVlbEtG?=
 =?utf-8?B?dUVkaTlRZ0twWkk4QVZNSHdITnJjSXMvak90ODM2dkc1UitCSmY1NDN0cWJF?=
 =?utf-8?B?b0lWcjBaaURid05QNEl5YXJEaFFDTGwzVVlaQ3VMMHBvekVETllUTDhmUDhB?=
 =?utf-8?B?YnlQTkRBU2k5SjhTWEcwNkNQaDBkRDMvYVFZU0pCNHFvMjFBMnRYVFJRNzhM?=
 =?utf-8?B?MEJ3U0M1aVZldnEzUHlETCtQZ1VEa2dENFNITUhJWmhkRS9HN1ljRlBFRHFh?=
 =?utf-8?B?d2dpNUJoTnpsZU5LSzFKdmpKM0xoaGxKOCtlWnVLMlA4eVBzcVB5V0NiNDkr?=
 =?utf-8?B?bXZibFlXcVk1Z2VySWtUWUNNOFdLRldtUTRrZ3pxcndEQkxiQTRvU0pNT1J4?=
 =?utf-8?B?L05wYU5zNDlyOC8vd1FoOGRveHZVbmJ1STBpR2R0WThoRVJETmk1S0lNTGV4?=
 =?utf-8?B?R2V1OVZCRWRKT21rRWVKdHpaa3ZEZGJBdTFOR2F6ODdHQmJPKzA5OS90RDVM?=
 =?utf-8?B?Y1QwVXZYaHZ2NkFQL0gzeksxWWFNSUtyakgyODd2dERsNzFNYkJaeStpbW5Q?=
 =?utf-8?B?bEJFakVoSlFxNXR1eThIdTVpcGJuVHpVRnBHSTNVM003ZXNCbjR2ZHVwRldp?=
 =?utf-8?B?TmFpcXNZNitSTU85TzY2TUYyZTNjc1Y0MGMvM1ZRZ2J5d0s5UFZnaDg4aG5s?=
 =?utf-8?B?Q05Bcy9YZkZDR052NTUzVlFyTWtVV2pFWDFsR0ZjbHMzWTNoOFN2Sk05SGU2?=
 =?utf-8?B?dG1wRjk0UG5nWVA4cmJPemVRaE5uSGRmajJEMHpMVlhMZ00xK3ZzaUxjUHRv?=
 =?utf-8?B?bnNhNHI2TWdPeXRpRkdsSHFwUlVlMXltZUllV2V2QlFRUXJGeEpQdU5ER1Nw?=
 =?utf-8?B?am5jQ0MrUGMydS9UY3VZbHltTlhYN3RzRnRjNVNjb21yMW1vdlJNVUNlZnZY?=
 =?utf-8?B?RGNMNk1BT2VBYUxiS1dlR1lxWm02dHdoL05LRDF4eTVkZnZlSkpobytiWitL?=
 =?utf-8?B?bEpaQ1A2YUdSSWVOMFZQZnRtWG0zUzJZR0pwaVBBUld0eEt2RUpUWUkyUHZv?=
 =?utf-8?B?WlFuQ0pNWFA2SEZnRHlCMmZxMFIrdStVQ0szUHJRZlRJeHRXTjhCNkdvL3Rl?=
 =?utf-8?B?ZWNSbVhzTC9IRk81V2NjQUpqWmJ3SUFGcEZIeG1mT3JqQlRueWduMm9wcTF6?=
 =?utf-8?B?N0pWV2JyQm9FWEIybERsWWR6cXUrWC9NZWdISW00elJGMmlDTXJYdGlYY0hy?=
 =?utf-8?B?QlhBeUx4TmFiQVdTZXpRNzhGejUrNStxOGFFbmVrbWgxMXRDbFRIWldZUHZU?=
 =?utf-8?B?TURUdmJpUnVJSmhJbVBvZ05CajVQdkEwTUFxYktla3I1dUlpcklOcVZ4US93?=
 =?utf-8?B?akpZWnJPaXdEcUdIUWFPRTlaR0lpbE1BNFdyV2ltaFJTQTRNc2dzQnRsai9o?=
 =?utf-8?B?ay9ZMEwzNHVvbUhzU2V4bjlkYU9RVjk2UGhUTnhJK21KdkgvNFFXSjBWTVNu?=
 =?utf-8?B?RGdNRGNMaXgvNkJkSzV5YVJOK3Z6OUNFOCt0cERBNVg4aEdvcmNJb2phUmEw?=
 =?utf-8?B?SndmQkxkaTNoSDZWU3VsUlYzTlQreWc2eC9RSHV3WHV2R3JhUitHL01la3VS?=
 =?utf-8?B?KzdpUUQzUEZOWlJrUG9JR3BXZUFKbTE5TmFGQURRK0ZYWFdqWEdCK0o3d3h1?=
 =?utf-8?B?TStadlJLM3pFSXpveHljTXhSTDRLZURRdGpHS085OVIrRS9GOUh0NDVVc015?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3da886c-e44e-4924-9664-08dcd4da920c
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:30:39.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNpC78nV1ydBNTx8fEv1kblSluLfVhO2qVtZ/GoO4VSEHyD7cUX26dwjJFPtHKsTXmmqXqIPnNTiJr+lGAdzUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_093043_555884_517F9BEE 
X-CRM114-Status: GOOD (  23.68  )
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

T24gRnJpLCAxMyBTZXAgMjAyNCAyMjoxNzo1NiArMDEwMApDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIFNlcCAxMywgMjAyNCBhdCAxMjowODoyMEFNICsw
MjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAyOSwgMjAyNCBhdCAxMDoy
M+KAr0FNIEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZTogIAo+ID4gPgo+
ID4gPiBBZGQgYWxsIG9mIHRoZSBmbGFncyB0aGF0IGFyZSBuZWVkZWQgdG8gc3VwcG9ydCB0aGUg
c2hhZG93IGNhbGwgc3RhY2sKPiA+ID4gKFNDUykgc2FuaXRpemVyIHdpdGggUnVzdCwgYW5kIHVw
ZGF0ZXMgS2NvbmZpZyB0byBhbGxvdyBvbmx5Cj4gPiA+IGNvbmZpZ3VyYXRpb25zIHRoYXQgd29y
ay4gIAo+ID4gCj4gPiBBcHBsaWVkIHRvIGBydXN0LW5leHRgIC0tIHRoYW5rcyBldmVyeW9uZSEK
PiA+IAo+ID4gUGF1bC9QYWxtZXIvQWxiZXJ0L1JJU0MtVjogSSB0aGluayB5b3Ugd2VyZSBub3Qg
Q2MnZCAoYXQgbGVhc3QgaW4gdGhpcwo+ID4gdmVyc2lvbj8pLCBzbyBwbGVhc2Ugc2hvdXQgaWYg
eW91IGhhdmUgYSBwcm9ibGVtIHdpdGggdGhpcy4gIAo+IAo+IEZvciBzb21lIHJlYXNvbiBJIGRl
bGV0ZWQgdGhlIHNlcmllcyBmcm9tIG15IG1haWxib3gsIG11c3QndmUgYmVlbiBpbgo+IGR0LWJp
bmRpbmcgcmV2aWV3IG1vZGUgYW5kIGhpdCBjdHJsICsgZC4gSSd2ZSBiZWVuIGF3YXkgYW5kIGJ1
c3ksIHNvIG15Cj4gYXBvbG9naWVzIEFsaWNlIGZvciBub3QgdHJ5aW5nIHRoaXMgb3V0IHNvb25l
ci4KPiBJdCdzIHNvcnRhIGFubm95aW5nIHRvIHRlc3QgcnVzdCArIHNjcyBvbiByaXNjdiwgY29z
IHlvdSBuZWVkICh1bmxlc3MgSQo+IGFtIG1pc3Rha2VuKSBsbHZtLTE5LiBsbHZtLTE4ICsgcnVz
dCBidWlsdCBmaW5lLCBidXQgaGFzIG5vIFNDUy4KPiAKPiBsbHZtLTE5ICsgcnVzdCBmYWlsZWQg
dG8gYnVpbGQgZm9yIG1lIHJpc2N2LCBwcm9kdWNpbmc6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC9zdHVmZi9saW51eC9ydXN0L2hlbHBlcnMvaGVscGVycy5jOjIyOgo+IC9zdHVmZi9saW51
eC9ydXN0L2hlbHBlcnMvc3BpbmxvY2suYzoxMDoyMzogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJl
ZCBmdW5jdGlvbiAnc3BpbmxvY2tfY2hlY2snOyBJU08gQzk5IGFuZCBsYXRlciBkbyBub3Qgc3Vw
cG9ydCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgWy1XaW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4gX19yYXdfc3Bpbl9sb2NrX2luaXQoc3BpbmxvY2tfY2hlY2sobG9jayks
IG5hbWUsIGtleSwgTERfV0FJVF9DT05GSUcpOwo+IF4KPiAvc3R1ZmYvbGludXgvcnVzdC9oZWxw
ZXJzL3NwaW5sb2NrLmM6MTA6MjM6IGVycm9yOiBpbmNvbXBhdGlibGUgaW50ZWdlciB0byBwb2lu
dGVyIGNvbnZlcnNpb24gcGFzc2luZyAnaW50JyB0byBwYXJhbWV0ZXIgb2YgdHlwZSAncmF3X3Nw
aW5sb2NrX3QgKicgKGFrYSAnc3RydWN0IHJhd19zcGlubG9jayAqJykgWy1XaW50LWNvbnZlcnNp
b25dCj4gX19yYXdfc3Bpbl9sb2NrX2luaXQoc3BpbmxvY2tfY2hlY2sobG9jayksIG5hbWUsIGtl
eSwgTERfV0FJVF9DT05GSUcpOwo+IF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gL3N0dWZmL2xpbnV4
L2luY2x1ZGUvbGludXgvc3BpbmxvY2suaDoxMDE6NTI6IG5vdGU6IHBhc3NpbmcgYXJndW1lbnQg
dG8gcGFyYW1ldGVyICdsb2NrJyBoZXJlCj4gZXh0ZXJuIHZvaWQgX19yYXdfc3Bpbl9sb2NrX2lu
aXQocmF3X3NwaW5sb2NrX3QgKmxvY2ssIGNvbnN0IGNoYXIgKm5hbWUsCj4gXgo+IDIgZXJyb3Jz
IGdlbmVyYXRlZC4KPiAKPiBUaGlzIG9jY3VycyBiZWNhdXNlIEkgaGF2ZSBERUJVR19TUElOTE9D
SyBlbmFibGVkLiBJIGRpZG4ndCBjaGVjayB3aHksCj4gYnV0IEFuZHJlYXMgc2VlbXMgdG8gaGF2
ZSBpbnRyb2R1Y2VkIHRoYXQgY29kZSAtIGx1Y2tpbHkgaGUncyBhbHJlYWR5IG9uCj4gQ0MgaGVy
ZSA6KQo+IAo+IFdpdGggdGhhdCBkaXNhYmxlZCwgdGhlcmUgYXJlIGRvemVucyBvZiB3YXJuaW5n
cyBhbG9uZyB0aGUgbGluZXMgb2Y6Cj4gL3N0dWZmL2xpbnV4L3J1c3QvaGVscGVycy9lcnIuYzo2
OjE0OiB3YXJuaW5nOiBzeW1ib2wgJ3J1c3RfaGVscGVyX0VSUl9QVFInIHdhcyBub3QgZGVjbGFy
ZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gSWYgdGhvc2UgYXJlIG9rYXkgZm9yIHJ1c3QgY29k
ZSwgaXQgd291bGQgYmUgcmF0aGVyIGhlbHBmdWwgaWYgdGhlCj4gd2FybmluZ3MgY291bGQgYmUg
ZGlzYWJsZWQgLSBvdGhlcndpc2UgdGhleSBzaG91bGQgcmVhbGx5IGJlIGZpeGVkLgo+IAo+IEZv
bGxvd2luZyB0aGF0LCBJIGdvdCBhIGJ1aWxkIGVycm9yOgo+IAo+IGVycm9yW0UwNDI1XTogY2Fu
bm90IGZpbmQgZnVuY3Rpb24gYF9fbXV0ZXhfaW5pdGAgaW4gY3JhdGUgYGJpbmRpbmdzYAo+IC0t
PiAvc3R1ZmYvbGludXgvcnVzdC9rZXJuZWwvc3luYy9sb2NrL211dGV4LnJzOjEwNDoyOCAgCj4g
fAo+IDEwNCAgIHwgICAgICAgICAgIHVuc2FmZSB7IGJpbmRpbmdzOjpfX211dGV4X2luaXQocHRy
LCBuYW1lLCBrZXkpIH0KPiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5e
Xl5eIGhlbHA6IGEgZnVuY3Rpb24gd2l0aCBhIHNpbWlsYXIgbmFtZSBleGlzdHM6IGBfX211dGV4
X3J0X2luaXRgCj4gfAo+IDo6OiAvc3R1ZmYvYnJzZGsvd29yay9saW51eC9ydXN0L2JpbmRpbmdz
L2JpbmRpbmdzX2dlbmVyYXRlZC5yczoxMjkwNzo1Cj4gfAo+IDEyOTA3IHwgLyAgICAgcHViIGZu
IF9fbXV0ZXhfcnRfaW5pdCgKPiAxMjkwOCB8IHwgICAgICAgICBsb2NrOiAqbXV0IG11dGV4LAo+
IDEyOTA5IHwgfCAgICAgICAgIG5hbWU6ICpjb25zdCBjb3JlOjpmZmk6OmNfY2hhciwKPiAxMjkx
MCB8IHwgICAgICAgICBrZXk6ICptdXQgbG9ja19jbGFzc19rZXksCj4gMTI5MTEgfCB8ICAgICAp
Owo+IHwgfF9fX19fLSBzaW1pbGFybHkgbmFtZWQgZnVuY3Rpb24gYF9fbXV0ZXhfcnRfaW5pdGAg
ZGVmaW5lZCBoZXJlCj4gCj4gZXJyb3I6IGFib3J0aW5nIGR1ZSB0byAxIHByZXZpb3VzIGVycm9y
Cj4gCj4gSSBzdG9wcGVkIHRoZXJlLCBTcGFjZSBNYXJpbmUgMiBhd2FpdHMuCj4gCj4gSG9wZWZ1
bGx5IEknbGwgZ2V0IHRvIHNheSBoZWxsbyBuZXh0IHdlZWssCj4gQ29ub3IuCgpIaSBDb25vciwK
CkRvIHlvdSBoYXZlIFBSRUVNUFRfUlQgZW5hYmxlZD8KCkJlc3QsCkdhcnkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
