Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F3C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O14Lsl9AU3rLuVQeqqhJrDGk5JxcLNP1jjh2v6E/Jc=; b=Pr6YGoJmYZI2xBev01S5YPer09
	cmrolCIkfFHVGgiNwzl0JX2kJuUkVN7DlcjVEOxYPqZxoausbrpyO70p/L194kDyT0tSaF90EA3gf
	VUdxZUkEbyDCrZyjbH5Bj7z72q176klyRJxNQXtGeVDItNYTvHHJrHkhQd5ikHGSKLaz8FJ/Gd8/Q
	BfCADa9tPyfD0wVhg6eB6yeHNB7mpy/iL1QPg8jWnWihQW2caRXUImmUmFNOX+T7M+5Axem/o8xKT
	uq212d/R1CphlwYaX9OJpW06w3mgCoke4+/3x/eibHThKqSOgNXKf6zJA8/A+L5DGNeXy9SAqG8xy
	QsZWwCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXU5C-0000000Cupv-14R8;
	Fri, 04 Jul 2025 00:15:14 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTjB-0000000Ct91-0CJM
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 23:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvRt6vY0ishmO030QVmLBr3liWTchDrjcDwxmYhRmLh1l6oj8UrnG0mY5c/30+myXbpOCZdvbviVxq8AmDUXlA1lX0ta2Dh0XGy5rkhA3ArueyDG4NtGuZUcrDwYQ7hqUPVLsaTfh4C7M+6SFFVBGK8+VLDpBFnlAtO4nDzegYiMLQXBDTKCrTnTseNKt1DVgqMa2dcb7NfbATbehtB5C6SpFIJtyUULKEPm2Cf8xrvo/zsLEs+M7iRCBjcOtQOPkZSYK9m7VaSumYr4izLXywSPz5+/xCshgr2Gmn46nPtWVc6B8+iMGkMNGRQdt+KjQN5xbSB2jJWfOjhYR+//CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39+5ko4B4WT/LTrvuXA+Elb1j/N7uaXeFmN4lBRKDvQ=;
 b=XjlqCGYbO0f7t/xO9LWGXv6+6tYXTeTgxelr2Tz/DlFsCa5RqbOzhHy55ZgmfXma+AXC1jjW6tQ0axMY8EHLCCWeVk3IF8JzYIvui1SA2K11NXSQMT85nYySfRvKb1R4yINmzwzMX5ziBp+bvkgK5d72jLKfgPjJpoQRgxW9UWm5EXRbhlYTfHyk/t2VELaLJcZLL5aPFPmpUNFKLMQW+C27qrmiLVgzM7FcjlKpAdobHgwceU0TNFHqF/u/bmcJbwFzSCztPCyJTkeFQvOeFm9ma4Y8mT47vtEKztSq8/4M20MRK+OIZ3wJZUMMKHOTdxhDKFY1kFFTxVn29g36Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39+5ko4B4WT/LTrvuXA+Elb1j/N7uaXeFmN4lBRKDvQ=;
 b=k8lqrZ53TO7QQWtCiEyqTUimceO2x6vOw3WxcYLQd/GD+Px79hUe+BDnyVX8uWSLM9ql8HA+pzCVflAKZmt+9OVipiJnu36n6vo7TRnbFN8NGpENHNyw6oM5cWlaMWIj/K/ZwgBGPU4ng2LSeUNoB9kR5jP6IJw+cDR/EZ5qDo502pF7OJp6n/yXpRxImHZ7M4frxZAL1C+h5QpS+df91E6tSALe18peRIMXq0NfUcgQKTK6nHr8jsAiy2A9vZRNh/kMBLwC7F8PLthZ3eSrmvSHP8ojQUheL5oLChKFtrt7kvDIk5M6FcjFDnb5s8ZRERBTQGICijj/0aK0581kpw==
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
 by MA0PR01MB7954.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:52:16 +0000
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c]) by PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c%7]) with mapi id 15.20.8835.018; Thu, 3 Jul 2025
 23:52:16 +0000
Message-ID: <PNYPR01MB111714C72459231C3CEBFE09FFE43A@PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 4 Jul 2025 07:52:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>
References: <20250703004024.85221-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
X-ClientProxiedBy: SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32)
 To PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
X-Microsoft-Original-Message-ID: <bd8fd9ee-1394-4a3a-8551-36f11fad4b20@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNYPR01MB11171:EE_|MA0PR01MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: fa19f6a4-3978-4934-1872-08ddba8ca37d
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799009|461199028|19110799006|7092599006|8060799009|5072599009|6090799003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akdXeDFVTElHWmpLMHpVU1hpeXFLNFArdldBYmFWSGdseXZHdUt4UkQrUE1t?=
 =?utf-8?B?ZzFYUWorZFhPYW52ZmhtM0syOXVxRFk3U3FTZ2Z4cnVvK3BsWUZsSGM2NDlF?=
 =?utf-8?B?SHRveUJOZFpycDBGZjNiYkMzdVF6cE1QRTcwdjFUTG0xNUw4NlZrcmUyWTg3?=
 =?utf-8?B?b2JHRE9LNDIyZHh4TlRsdkNlM0tsSXFrZEhWZmI1cENTb3BGNkU2RFFuOHZK?=
 =?utf-8?B?UEplWXlDY0tnVkJaeTF1bFhUNWlvSkVEU1RaVG5ndUJqeHRiZHc3OGZGRnlH?=
 =?utf-8?B?TXdHY0lHNnpXOW9rQk9TclhGV0Z6bGJ5REFoanY4dkZqTUlKcFIwVENDYWlR?=
 =?utf-8?B?blZxR1IyS3gxQ0dBY1hHQ0NNNnhmSzI3MGpBSk1aanQvMng1SGxLUWg2K1JL?=
 =?utf-8?B?YXlVN0Q2Z2F1Mk44QVlEVklwWUJOTlhXcFlJbFd5aTJ0dFhDTlNYUVNuZFht?=
 =?utf-8?B?Vk1TaVdsQS9QZXQ4bTBLOW5uUVZrSTNXRjFST2hsbHVHZ2IvS2tma1VlZlV0?=
 =?utf-8?B?QnNYbWhJSmZZSVRpSkVKN255Q2lqUERnTXFqR1YvdHVGdWhSUkxQVHFpMG56?=
 =?utf-8?B?b2w1UEJVeTMvc0c3QVU0UTZWNUdwVzNsdVNKTmJpbGE0d2hBWHFpRWRRaG1m?=
 =?utf-8?B?RVVockhXVGhWc1p2RlVTeSt4MGxscCt1VDVpTzJKUFY1dzEyQUZsc1pEK1R4?=
 =?utf-8?B?cllybE5HSm9JMG5DSEtqa0trTlJvUXMyekd1elZ0QnRoV29uREJkUURCRGtq?=
 =?utf-8?B?dUs0cVV1endpRDFjUG1jVFFVd2c3aEd1VmNISCtRSmU0elVWU2R2UEhVMW1t?=
 =?utf-8?B?NzdSdVRQTnk1N3kvWHBwSXF2dDJDRGdXMjdSdExOSU96a1FYQ2phTzVlTkpV?=
 =?utf-8?B?R3kvYk5xSHEvcmYwYlhGMS9BcmlnczltUFQwakxCcTNHbzdEaTZSNDUvR1BI?=
 =?utf-8?B?V1dmV3VPdUF2Z0VPVVdtRGl0cWYwRlRLaDZiTEtBRG1jUkRXRWZjcGFhT2tt?=
 =?utf-8?B?OUZQMzRBSlQ5WFd5d090NGtPbG4rdXZ4V3BBRjM3eVlXSkVZcnJSbVd4RzNZ?=
 =?utf-8?B?UDVPbFZXZGd1cmt3L29tWGovYVBqYVdIdkl3dXJDUlR3SVNEQkRGV3dqZ1ZR?=
 =?utf-8?B?aWVMOVM0RDA0djNFRDM5dlRSOGwvTThLbW5KaXZyd1dhTUl2Z3VHNDdEWStl?=
 =?utf-8?B?bTcwYjIxY1dxb2RxZUtlejZ5T3pHUWRxRzMrc2RwbVZmcUpwVkNsVi81YkNS?=
 =?utf-8?B?SFVpdTNRVnpUL0RuUFZpVXZrOU81REtzeFlYLzBSOGxMemJqVDN5enhjTlZR?=
 =?utf-8?B?MS9MWUNwQW4rVTMySmhTeW5NNzltSGJVTldoUzF0d1lDb0lFNitlRnI5TmNs?=
 =?utf-8?B?TkNGZysxSFU2V3djai9OR241MU11S3NrVW1hWXU3TE9SSFNwNmFqdm5DQjBQ?=
 =?utf-8?B?SU5EYjUrVE5ydld2WHhQbmpQUE4xaG1KZWROekRkaHBLRFNrTjVFdVNmeVlO?=
 =?utf-8?B?WmN3ZGd6bVd3emJRUWxaR1VmbE9CNHEzcGQ2UWJTcXRtcTJnSHdPNUdkTUF0?=
 =?utf-8?Q?9a6BZPsIrGKMasOILuKn/w0zM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHY2LytLWUVoNks1UnBPNUlWOFlyUUhtOUxsQjJqeGpXcjJRcUtVcDBwUDJS?=
 =?utf-8?B?MHQrQnBwYlJSemFEd2d4dS9LUm1OaFZ3ei9JU3dnSi92dlQ2elhDYXRDVUM0?=
 =?utf-8?B?eTRRU3RZbDFJVmJQN1YyOHFRWVBia29SRUw4TGM3L0ZQbkFUdVR6QXlvSVdP?=
 =?utf-8?B?K3UzbGZaclFWOWRET0dhSGpZcmoweDdFbFl2ajlrVlNDNWVhM0tsRmd1TWE4?=
 =?utf-8?B?a1BRcGxuQk52QjBBcnhpZ2d4VXp5Z1NhcGpBNHFqdmhlbUNCRU5lZ2FLeVhU?=
 =?utf-8?B?b2RHRC9SVXN2ZmtGdlE3VnNFZExXbUFaWFlYZjhNRWZqSVFNRG1aWGVLT1ZX?=
 =?utf-8?B?L0VobWo2QytiN2lEU29vRWNKb2lNbE5UaXZhRlN4ZjNsSGo4ZjZWQlNEcXJ5?=
 =?utf-8?B?YzNxZnZmQ1FJUWpiaTdGMUZpNG9iNDNmWk02TytCUnlmdktyOWRETlF6L2tE?=
 =?utf-8?B?TDg0T1NxK0Z2ektuTDI2YTZuT0c4cUtsd0E4a1kvRUVaSEo2MXA4WjlSTS9j?=
 =?utf-8?B?bk1EWUVQYWZKdXMwVEdOV2RaT1hVM1M2anFkVjNCTHZlUXVGek5hbU1QOTgz?=
 =?utf-8?B?TGV3Qy9ka3k3MGNFbWNEWFhnZ0pTQzcyODF3UWpOYnpDUllZM0t4Um1UMFNa?=
 =?utf-8?B?Y3RvUWQ2ejduNEdCR21VSGhmaUlxbGJOSVhKdDhtUGN6UStoUEtjMG1BV2Qv?=
 =?utf-8?B?YmpWZEVFUnkzSlBnS3lYdUU0SkZhV0xzV2FrMFZBZWg1eG5EVlFPU3dPOG1Q?=
 =?utf-8?B?ZXNsSXVZMGZLT2hreVNLTHc0MktDbHp5ZWw2OUxjT29pQTdPc3ZtZFNIRHls?=
 =?utf-8?B?a2hnN2c4NU0zdXhkeWdoazloV24yTmJuTkJnZVFNWm5PQVVVaS9XNWp1aTk2?=
 =?utf-8?B?cHlKTjNldGx4bUZ1WDN5c012ZlY1bGdvSVhtbUhwUWZYVzdVWDFXWmFsR0Jh?=
 =?utf-8?B?dDlXQ3hnTm1NczNmWjUyaS9pZkNjbHFkVVVpTVFIWElRd0NWS2VMcVZCV0x2?=
 =?utf-8?B?NUJHZ3Q3b1JxcHloNm4xVTRuTVVZZFExbTdOZ3E1ZEMxdjZuSTYyV2NvUnMv?=
 =?utf-8?B?d1JEeWNTREhaMDEvYXM4RC9PZGdhNkRtRzhTY3pvMStMZXZ2YWUzSVJrazBI?=
 =?utf-8?B?REcrRjYwODJqeFBPUE13Y2VtVkVFTE03MnZBUGZmeElrU0I1RjdrQTdUR0p0?=
 =?utf-8?B?ekUrU285dGFYVGJBNERieSt1d1FaL09oU1RoSEFyY0hoZlZ1UHBpaTFtVDRt?=
 =?utf-8?B?cjY2L3dOVWRlOHR3S2VFVmNxUEJ6ZS8vemZ6bWhIcGNKWWN0MUdaU0NRQTRl?=
 =?utf-8?B?c3RWV2tOTWJRU3dXaWdwU09UelhJbGozVThlMkZaamt2L0duRzI4NXh6T2dC?=
 =?utf-8?B?TXRGdU4rMzVVTnBZMjV5Zmc4cTg0U2FaSkY4UXdiNmNoVWV6N2tFTGthb1dH?=
 =?utf-8?B?SGtvdFZHQlB2TjlkQWt4RTZtSmV1Yk4ramx6elc2dnVKekNzTTBoVC9lUmdP?=
 =?utf-8?B?aG5aeGZ3cHhRbWdoSUNxWng5eUY4MG9INzJVRnU4dzMyWjdNTTRMbktNZEJB?=
 =?utf-8?B?ZmZBMFNUVy9pWTFKMDR3Q0ZBZEJpQVNSdWp5Y0R5WEhTQ09obUVyNUFoSEZh?=
 =?utf-8?B?aTBRemw3Z2tUN243ck1xdGpUdHZEd3gyREw0T0gza0RKdVJmcGRPVklBd3Iv?=
 =?utf-8?B?Rm1SWmhlOXAwcWZyNGkyR3JIOFV5UXl2YlFjTTVhK0VHOTRaalllNEppU3li?=
 =?utf-8?Q?29SZ4Ujp708uWvDX6A4Jj9P1dgTIjg7kDVZEIvT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa19f6a4-3978-4934-1872-08ddba8ca37d
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:52:16.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_165229_104869_D0F4E421 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2025/7/3 8:40, Inochi Amaoto wrote:
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index 96ccb6120114..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -113,6 +113,11 @@ &sd {
>   	status = "okay";
>   };
>   
> +&uart0 {
> +	/* for firmware */
> +	status = "reserved";
> +};
> +
>   &uart1 {
>   	status = "okay";
>   };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
