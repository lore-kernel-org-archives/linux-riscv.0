Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E188E6F093
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFiB3NOCqANG0z/y5ncUgP9ZxK7LTv3/voU1JdXQ4Jg=; b=rpEvuGIooonyTC7OJdnT/8dsRk
	avV7Jz3H0c19qE/hWyX4XlrlFj0jqGzrlpXRmQUUVmgCkIwaGsqfGfHI1/Grs1oXA4wwrVE4rBGS0
	812h/TrpgnKGMCQWkAIajEnUYnLQPzk7nwB/NNmocq96qwa3xUZgJymo5XEXzzd4vK3mbS548ggFF
	u6aASNtPCVE3LTRaUqO1FASl3KyuHm2jUeoNHLFvUIIzb43MhhVRJgyVPpWJf2Zdh0y4+pltSpX2e
	aRmSaFSi7KCxx0blEsxbY8Lo3fdtepWSA1hMMyjya/yrHejdhb6QgaEpys5f3XQYpbUSkLeEDwVRO
	BoN82QfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t708l-00000008SnE-3Agl;
	Fri, 01 Nov 2024 22:29:11 +0000
Received: from mail-maxind01olkn20828.outbound.protection.outlook.com ([2a01:111:f403:281b::828] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t708j-00000008Smm-0bpS
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 22:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQc5/Hb84Z5csrCG5sm6sHR99A8liz96he7EDxT8CWb55Osd4/psSdv0IFmthIN8f8NCMUYdl1P+mN5MSyZHuN0KudGxeLrEcp7fb2YfICzJKc1ZyuFZN+emEin0GuBcBast+I+aASD7RFGl4xYh/IGLKMhxxJUJERZ5LihdxFFoa4DMfUwH4PkWVjEPd8tK4KBxYKiQk49C1nKV2hFNmi74E2w91+cjDf7rVS1PlOqpqlFg0h7u8d7vqExEdg90A0pzBirWDrrrqlPNX+niq+0+0VtkRzHTHupyUkuIamV+KhiXmssdkuzHR1ehlr1xxmiZEMeqX584UMMzPu2s7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4Gq2qe9oA76sl2PQ2k7CBEc3VE1N4TRHPJ0vVDJFQ0=;
 b=sqqpRi4XwmtKr5WksYcBRcu9BOl8VuM0tjppTQ9jT1KF8Y1fNoZeYDX1jqVK0ohdgSjppiHngTm/FProRax+2RWgsRMDTeY1YmKljXEM5c/m/YIZ++Me/5Tbf9cYs1NefNgTfxi5PuQcd97JyitgykVB7zowUQZY/WsKxd0BofAvgoH/myUHDomxppjrjUZZmffbPS+cJ8/wiYTtOdcSDzuP52/Q/bp/tFfSwwNYwnIRjTQXAyUE6VNyAkodW99m1CUI+MKJfmK8cKmdNXisNUUAZ6gK4qPLmREsHgViuR/3NgdWeZB3Dicl6Xzzy7ou5YnfClSDmtGi3Ye/3nnX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4Gq2qe9oA76sl2PQ2k7CBEc3VE1N4TRHPJ0vVDJFQ0=;
 b=vPhgVekF9Cjn28/farMVmfayJ4ZkzZ+LIR1FVDetS6A3Twwn0Zn6/VTQaOswNFpgoWF5JVk+HG33g+Fx/Vbz9P35lLExGYL6YMLjWhZKI4P3trE/bnA181sV0xgw+ZKpzKfpXjmxlDif8kDblY0D74MpMr5C/Tl7vuArFnu+jZt1/itbLfyD+9nSylmgkeFEFlxmNg/Q6hJ8PEEVS2XEvLQ9mGkPrq96DS1uoY16pEpkAlz9itg41C0bJwjYshKLAoPhckUQpZEChdJTpEaRIWyQjPmYQmEki8kixrh0o0vp61g9ORd+iQz3moUjLGSWx+uC+6OogbouTk5EONhIyQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1820.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 22:28:58 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8114.028; Fri, 1 Nov 2024
 22:28:58 +0000
Message-ID: <MA0P287MB28221D96A094D7C3373C1865FE562@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 2 Nov 2024 06:28:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
To: Inochi Amaoto <inochiama@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
 <ihmors43w3ttfun7c4fj75ahh2hnhafdxhlmocbxfwttigj3fq@wxud2d2srisn>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ihmors43w3ttfun7c4fj75ahh2hnhafdxhlmocbxfwttigj3fq@wxud2d2srisn>
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <29cf70af-280f-46d6-a6a7-080fca8b06cc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: e178bb7e-9e43-44ff-46e5-08dcfac492d2
X-Microsoft-Antispam: BCL:0;ARA:14566002|8022599003|7092599003|8060799006|15080799006|461199028|5072599009|6090799003|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVRYmxPN1pnaXpWU2Rvak4wbGNiVzkxc2xUSWYvWHV0V1RPMG5PdU1SMGFz?=
 =?utf-8?B?cHZCS2VPTDQ1VURoR0NBZkRzNFh6WkFvSGVjT2c0bXdjeW9KWG01eHY3WUdB?=
 =?utf-8?B?NVFTVTMvbUlydFg0Ymt6aTdXSFNRT3ZPLzRXdmk0STgzeVRJVTM4WEUvdTEz?=
 =?utf-8?B?c1JKN0RTWUhrdW96S2UxU2JZVkV6czdBWVFuaWdhSVBheUlOY0FzdnNqM3NK?=
 =?utf-8?B?dmpUOVdnenUrbGt6dlZId1RSMzlHSmZvVThPUEpXNmtCQWN3aHErT01rMnFQ?=
 =?utf-8?B?V1pWUmt3M3c5eFZOb3c2U3lDdCt4aGZwQ2g0YjhSNkpQdDEzTVBjaEgyUmts?=
 =?utf-8?B?aXk3bEtTejBOQlBHbU5OSWo2cW1YUFdrWmMvbStPQW5ScStrWFZnUU5kTmVk?=
 =?utf-8?B?QVViRW4yK1JjUTBuM0h2ODVjanNHcks3TTdIUXFBMkxNVml6UGNIVTQ2bVpQ?=
 =?utf-8?B?VENJN1VSZlZ2am9mQ3ArL2lpcHozVU9mM0pteVB5cm1kakE0Y0xJZHNnaWJj?=
 =?utf-8?B?MzJ6WGlkdVpqRCtoS2VxZThUTlRIeXJiTk0wS2M3V2RwNHV2Q2NybW5Takwr?=
 =?utf-8?B?WTExOGZHTnJHRVpPZUkra0xTMXpReEF3SXJMK2dvMmhRYTFiWk5vOWpvWVJJ?=
 =?utf-8?B?QzkzRjRIRXJFc0hldHZsUlJFeE5kcW16Q3BLTnFERDlWVnc2V3VLbjR4a2Uw?=
 =?utf-8?B?enBjQURDTXhVYm1jWFk0Wk9QbkxJUnhzcGJTUm5veC9KZGdQYU1WbXpMS1ph?=
 =?utf-8?B?VlI4THIrejhFTjFueVdmT3EzcWhQc1Rpc3VCVDgwLzFEaXNlNlE4cDNMUksv?=
 =?utf-8?B?d3RkL1ZXWlZrbGc3NGx3TmM2blA1djYrN2d3VjFlWUhMckRNTWVyS0RaU3R4?=
 =?utf-8?B?REFoNlY1a0Mwc1Q0K0NkMzJwaUhSeGZuV2lJazIyMTdxM2J3cGxpS0xyZGZ4?=
 =?utf-8?B?Q01ld0lQdFFFdmRCRmhiaExldi91amlHYVlWN2pFeDFmTUF5OHJVSEUwcGE2?=
 =?utf-8?B?S0g2N1lKdzhIazkvTEQ1QzE2Snl3N1NianRyZ0g3OXZRYVBNWVFLUnd1aEQy?=
 =?utf-8?B?SWdtL3AwSFhYdFJhOUdUbHlNbkpEcS9XRVNVTmprQmpZeTA5QkhHRUd5V2VE?=
 =?utf-8?B?SW5hTFovdHhBTnliS3Y1ME85ZEw1MnlaWkw1d2hkZk1VMG5yeGczVzZ6WUxZ?=
 =?utf-8?B?V3J2MW0rbVltNytuNXJCUWZBTVpKYzdERW9MNVRlNDZqRDZwYWVpR3ZpZkhi?=
 =?utf-8?B?Zk56RVRlWFRQRHAxVDlKMHRobWl4V1VJZ2RUK1VzU3RNejU4RFBKNkpBNWJV?=
 =?utf-8?B?SVRLNjJVSlJLeWV2c2F3eEZ4UzlqMDc3SE9XdVphLzN4M2pnaVZRdlVTWUpE?=
 =?utf-8?B?djgvODdVRm5VRmd1dy9XWUF0UUFuUmZhUUs1S1dNRnN6NmJBRUdGWUNXVWxn?=
 =?utf-8?B?eWh2dUl5VWc5THVGVFg2elIybEVvdVhiVUJwTC94bDVYSURPU1FZbXBPZTRt?=
 =?utf-8?Q?7UKk9c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNTMmxPdWo0U3kyaHZZMjdvV1QzdHBLelZIKzlhZUJYSmZ0NU1YOGNJdURs?=
 =?utf-8?B?TERyY3lBWlQvQmVBM1hRWUtid2Q0N1ZqRlpqTFRHYXJ0ejcvQkg1K2I2anZx?=
 =?utf-8?B?Yk1vTkZRVElGTHl5a1hIbWlvK1FpSWNuT2tCQ09OZXlkdjZ3Znd0bUZHc1BG?=
 =?utf-8?B?dzM5YmhVVzkvVWtiNU5qczJ4bjJieVpwejdBZEFlQUV1U2xHTDFCeEs5UitU?=
 =?utf-8?B?S1hnVnhROEl5Y3NUd2tyUUlmTjVQcmZYYitMN0lWWHdFODN5cVJuWVZRZE1o?=
 =?utf-8?B?bFVYQVFZQTRrUjYzVnRuQVQyYVFPWFRkVmNuaThybkVwVTUrWDFDQksyWXl4?=
 =?utf-8?B?SmZkRXpYL1l5NitRTGN0czlYOFBmTmZDL3pFdVF0bnZUVzdOb09DVlIydVAr?=
 =?utf-8?B?a1I4VThwTC9QM2VpODM0UUZiZWFyYytTdmJKRmJSUXVlWm1ydUplcHBoWTl1?=
 =?utf-8?B?R0dWS0NsNkE1QUtvd01GaDZ4d0Y2MmIrV2hMbUxkbDh1bFc0amRYT2pVcHJI?=
 =?utf-8?B?dklielBDMGFKQjQwayswdCtqTlp4MVJzUjFuVFdJdXhqZ2hZZW1NMElTKzFS?=
 =?utf-8?B?cjVTWlVUWnlRbm8wSEk3bjJ6NkZvTGJwckFwcG5CTjgwald4WXdpM00wN0c0?=
 =?utf-8?B?OGkzblFBR3Q5YTVncHFWYVhYUWFOdHMvQk1IVEc5c3FjbHVZVGJWV2JsdXBO?=
 =?utf-8?B?cHRoTzJpbnl4aWhxbVZoOHBCT1l2Q3M3TERmNXRxRlZlWkw2bWRveXJGOHR5?=
 =?utf-8?B?cldqS2lKSWNkajNOWGpPQmI4Ly9yZlNrNTAvaWt0MUdWRkVBcnJPd0pnd0E2?=
 =?utf-8?B?dGtwOWJjV3laUWpvTjhWblVvRVJOejB5Z1Rla2lSalZBYzllK3VJK3dGRk01?=
 =?utf-8?B?NWVzaEttb0ZRbzZWUDg4WG1pSGw3RlN4R0xLQ0xCaXBkbktuRWhXd0MrMWJh?=
 =?utf-8?B?b09LTUNleGtNN25JRWN3RDBlVnd1R2Zqd0MzYmJUSnFRMTB3ZXNyMCtKOEsy?=
 =?utf-8?B?UnM3VkdUbnM2R2piNXlRMERaK3Nqbi9VMllnTlZPOUlFY2hpNVV0NFVwQjZm?=
 =?utf-8?B?VFIrS0dwSlBuN1p5dFRxTC9SK0lHWTEwVjNMc3d0cm9lTUVpZ2FadXdQeFV3?=
 =?utf-8?B?eEQxWWF1SXdiTXlpSUg1V242bHJBaW1lNmRPeG1CYzIvVW4wV3FGS2N3WHlK?=
 =?utf-8?B?aVNNL2lsWFVuSnJuYnlxU3lUR0VaWTRaY25oTnZDWFMyMnF0RVNsN0tzL1N4?=
 =?utf-8?B?ejVkcWw2YjdXZWg1QTNVSWVMaVV6eFVDODlMcWp5SmpFZEd1bTJVaUtyQUJH?=
 =?utf-8?B?RnEyczU4S1UvNjYzWG1OTkRjOElnNGl4T2RPeVgrblFzVGpwQmgzUlVuRFV4?=
 =?utf-8?B?bWVuNUpDSURYMU9Ld1BrUEtSZ3RTS2ozY0RqSENGSk1MREtxY2tZajNMNDVa?=
 =?utf-8?B?MmVxei8yejhWVU5VN2hmVWZkTEtRR04wejVSVnNLTHlidFVkbGxrelVsczNG?=
 =?utf-8?B?TDkrWTl2Z3RzNzFkMGpvVGtmd2tUTlRCMlF5Q3FkRVRvZk9Sek5pNjljYkZm?=
 =?utf-8?B?U0l1N2lqbmVxRjFTNGp3b3J1cUZuRHJWVVVVdWJYZlR5VnIwOHFZMyt2N2Rt?=
 =?utf-8?B?YUhRZ2pRK0dLNjZvRU0ycksyMmxycUpEcDJmWXRUNFVnS2kzT3V5SlNuM085?=
 =?utf-8?Q?Mp2wHiIWkjZsyqlNW4zZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e178bb7e-9e43-44ff-46e5-08dcfac492d2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 22:28:57.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_152909_234239_1F9FDEC3 
X-CRM114-Status: UNSURE (   6.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Inochi,

Will you pick this on sophgo/for-next?

Regards,

Chen

On 2024/10/30 11:50, Inochi Amaoto wrote:
> On Mon, Oct 28, 2024 at 11:43:24AM +0100, Thomas Bonnefille wrote:
>> Fix the base-address of the pinctrl controller to match its register
>> address.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Fixes: 93b61555f509 ("riscv: dts: sophgo: Add initial SG2002 SoC device tree")
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
