Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4AEC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XTUwGEfHIO1bNbTe2MsGMJgcichwzWwTCdHAxqIEL8=; b=WQxc5vO41CGJCN
	nWEQf/ObT/CmERtXmq45C4xtx94/NPDXgtKu51tb3iiFOt6fzBasklMnDZ4FGcXTqfckUqms5l8UH
	ys6/u2bGhpDFclXwkIAwQrUkXJCQK6KaUukdbTTXA7S+V3M3FrWgYSr4OLA9FgQs1bOuIrPc8lB12
	AmeyPz0hG33raMe+he8bJzewXjHf3ITf0Tkvb/UA5P9SZLwTQMeUyEGgEqhEF2Sm3KkmhWCcUMU8J
	h+TIRbwoyU8OQnuwAmliV+n5ChrYor8/1E1MTSc0KPwj8GfaOsKPksTRRC9QZUlTisARwXWQnTdah
	xg2sqXLQ+02X6rVs8qQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmAg-00BV0H-8G; Mon, 27 Feb 2023 22:40:38 +0000
Received: from mail-lo2gbr01on0712.outbound.protection.outlook.com ([2a01:111:f400:fe15::712] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmAc-00BUyR-Hr
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUolWnC0qLPkH4St/P+V6UjUOh4p/b7JYcH6DRyJlVXAabnwFu5QJtWQCPNZFOlTMCpYCoZdrWsKX1Ork/7geCMWYqDurm4HtD7EZ/Yr8QS0xudwelpAe3WsORn3WVPTaxE+8jTqJbvsIk0E8VNwOTcwzjxqlw8zxV18zB5TWKJ2OAFV1LGxLVuG6Yx7q5iS1Glv9OKe1lm7n/r6OtXDD3M/dXQ64bE98cDAgL+hh9fYIpGMyVW1JDEwBZCKi0XW3LZlxYLkVHEX/hGSsBOjCRfc39+VGtjFyEIJf2KRBpSVXR9dBRVrnfZ1Iko3ANJgK1nunaq6XW9Y6wRZworH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P37vhgEEM8o+g+z5xPR0wm413ERn7I7BXqxCq1wGFmw=;
 b=JlvVWIPJ8FOxnrbsAIC4QFMgrNdRRNozkiovVPexKq6Uuz/kf/NJnyQOTppQBg+5s7xYkmRBG7oGfU8Aqxy8F1hBUYcSEdmCPbiq9cdJgBR9ZvbLWOIqzt0HlwzRhsLf6QJOKV8aSvZzSX1/Lzicykg7rRj/H2A8dsUItmIAeTOqYQ/rVddbB/TxNFxpKq1ewQFjC1gdMLxdyOZC1CuAPseOhWVuZdCY+mCnJlnobAQA+Pfn1mL39cfnMGub25+VRQQTC8rXZszciAYlA6kX/5TrSZ/6mKv3KILHvdLo6a2/hATal/NGjTBStHVFJxOweB/URuJ8h9FV/vfdpvS1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P37vhgEEM8o+g+z5xPR0wm413ERn7I7BXqxCq1wGFmw=;
 b=sXRrH9sWnfdouhCwC65LkXbBj3O/NqCFQKx2ZJmW395+y+3/AoTfQm/TiJh4n5DEQXRSvAGsPtgEKMPOZ+Ir2nSn/D9ZONR/bvCDdbyQwAG/Bt+DENH8w5i8X8zLObKRs5I+aX7Fg7X8avEculP29VHEtjk7DA0EKFO25OYFH2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB2130.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:72::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 22:40:26 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f2a:55d4:ea1d:dece]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f2a:55d4:ea1d:dece%3]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 22:40:26 +0000
Date: Mon, 27 Feb 2023 22:40:24 +0000
From: Gary Guo <gary@garyguo.net>
To: Guo Ren <guoren@kernel.org>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Zong Li <zongbox@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 heiko@sntech.de, philipp.tomsich@vrull.eu, alex@ghiti.fr, hch@lst.de,
 ajones@ventanamicro.com, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, Zong Li
 <zong.li@sifive.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <20230227224024.182c8cad.gary@garyguo.net>
In-Reply-To: <CAJF2gTRirf6woe_phDMM84Yy9TGyzhc+767qK0qvNQNaNLmUGA@mail.gmail.com>
References: <20221111075902.798571-1-guoren@kernel.org>
	<CA+V-a8tbFhefuYF0UrGNrKZn6CpHEUhOvsf4GNmdLza0gWvf=w@mail.gmail.com>
	<CA+ZOyah9dBzzkHyy6wxk+hok3K1YrR9h+VdA3aTW5+m9ne04SQ@mail.gmail.com>
	<Y/phgGFWMf/4WRSS@curiosity>
	<CAJF2gTRirf6woe_phDMM84Yy9TGyzhc+767qK0qvNQNaNLmUGA@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB2130:EE_
X-MS-Office365-Filtering-Correlation-Id: b67c99f6-ae0b-41cf-4f44-08db19139eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dENOSuhPkBK64j8K/bQdpbJy4f192R0vEaTaFE+OsElkkBxhTmbI3RtU/3w8zr6yOzuZVGwikdj1UAXgQUE5MrlCLM2udHwky8CTcd0mLzr1dd/mVBj6WAhYvrRX7jKZeEyQKMe2bd217hZ7oY/XNYgoyzzkDO7SsRRPwvbEbjQP7FBFy0oXnECYzVkr7J1nbceQTUiVXTw+9RCg9GcLCKMcPjnWCOMlsHfyW5Tv83WYxSq0HVOFEkVFKWm8ty+moGaFYrWtZbYPKQGVFYFYKwEMMdmKhGXcTKIh77T7sinBsaZL4Lr2Zf9eGDNLV0Cf0GIcvJgqG1Zz7Q3f/CXSNJbamnbnbylXoeMm3ZxOVBCifOl5lfv7pgxMyWizBR+717ApZoVJYaMasY4QQkkq/XXSzjWtNJdpogx+EfktVDxIDqpp0kwp9ZqPBCLbk1pVv3aiFx+pzbD+/cfBB9kHkh0Vwv/HQdP0NPRJ02MIeYT5loXUMnC1mCSKNRrl7X8r0GuF+5/76SOm25Q/4YInigQnU5la3m2QvcCB7BHvB3oVHD8ugPRlOFXydMRFBCPku1YEb5fDiY/4Drq3VMDxJ89pW4JLHA4vRazyhiuPvq7UrwbUhOzTBAZ9PV+ZdmIa
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(376002)(366004)(39830400003)(451199018)(7416002)(5660300002)(36756003)(86362001)(8936002)(83380400001)(478600001)(26005)(2616005)(6486002)(966005)(6506007)(6512007)(186003)(8676002)(66946007)(66556008)(38100700002)(53546011)(41300700001)(1076003)(66476007)(4326008)(6916009)(54906003)(316002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bGZCZVQxR3pXMVlBTzlYekcwMGNEbHg5eU1lT2pzZG4ycWViY0RDenprMmY4?=
 =?utf-8?B?V2l2K3QxVWFpSk1jemtpREwvU0pZNGZkRlg3ejMvZ1ZDbksrVVo2NjdrK3NM?=
 =?utf-8?B?UVBxVTFoNTRWY2NFWXdzcHJtcGlRUjE1WW9NVGdyZEc4MHZVVHJRTDg1L3Fz?=
 =?utf-8?B?QlVLSkUzcllRZm5uYkhMSnVxc0tkWnl2NUE2czBvZHJwWUZ5dUwrTTYxUkJC?=
 =?utf-8?B?NkRUakJDaHhwTmZ1QUd0djN5T2lOa0tvU3VUcEV2SVdYcVBsdDFrUDR6bXhK?=
 =?utf-8?B?L2pVLzdaR2tzUFMraE5EYXhvRXNWcXZvcTdBUXdQS0MrZzU3T2dzTjVRc1JV?=
 =?utf-8?B?OEtBanZwTTgySGg0Sm4vQ0RCemkvdGJQb2YwL2cra3hqbGNNTC9TcTQ5dVJB?=
 =?utf-8?B?UmFwK3U1RHlyKzFncnJ4SEpVbjZjK2djQmxPTVc0ditSQVd0WVJLMVBuMzhG?=
 =?utf-8?B?cjdaRTBuUXE5eWNSSTU1WXl2TXV6dTQ2QStpbzJZdmo1bDNRZ0MrTnlZTGlu?=
 =?utf-8?B?cGxZUHd4bUJRVlA1OW05RVNDL0ZOM3loZ3JGM3laMExHUmd5MnZPVnVjdm5m?=
 =?utf-8?B?ZkVwT0xEVTRibDJyYUZiZGh3bm1mV2NQNU9NR3BXbEpWK3RoQ1NNNU9Rc0pq?=
 =?utf-8?B?VDZiL2VSTytkblhvUGhXNmNrVXBMRVVuanJIRUJtUEpucEZCQktTRVEvOHow?=
 =?utf-8?B?YXlzNjh3M1QrR1laUGhNdCtOQm0wcVM3dGFBL21JTmhvaUJ3VVZpdzhoanNo?=
 =?utf-8?B?YU5oMzNoVjduRWlVQ0I3M1ZRR2VDOVRtVVlmMkJnWkR0MEpJNWovQnpUby8w?=
 =?utf-8?B?N0hVL0xxL3BBMjlrSEsybm9WT2p5K1JieVV2UG85SE1QSG54MUNxYTdtOFBk?=
 =?utf-8?B?V1crMk80QjVvM3ZuZStma0ZJc1Q3R3N5Q3FyUURmL1BoeTlmUk1mQmdhQnpP?=
 =?utf-8?B?RGdlR3c0V2FGcDVCMlVSRlZkNU5WQkdRQ0VWRVBiREJyRkYwbXRYaWh4RVds?=
 =?utf-8?B?YStoS1FSN3BZS1E5TnFGbWZXcGtMamk5TXdkVjMxbk1xcDMyRVRyVTFtd3NH?=
 =?utf-8?B?eThUbjdYaXRjdG1hME90c1RZR3pYdy9FOGhWV04yWWxGb3gwbS9rVCtzcFRa?=
 =?utf-8?B?Z1Fxb3RPQ3IvVzhqRXo3d0pXV0lweXc4TDVLWUpUbytaU2l5ZitFV0c5ajZG?=
 =?utf-8?B?WjhLdDY2SUhwbmJ3bEFrSFBQYml3ejZKaW9xZ3RFdkNLanRJVGExbWoreDU2?=
 =?utf-8?B?VUxaTlVPM2Q1RGk4eE81TnV4M2lPb3VUeWRNanA2L3QwNCtISnpObjl1QzAz?=
 =?utf-8?B?OXoycTdlWGViMm5lbkpJampjV2tFUGpQZUFMbWY3KzhGMG9mazg3WWdLYzAv?=
 =?utf-8?B?bmNXWmtNUzdjY3MrNXU2SkFVdDc3RnA4VXFlNStwZDhPUVF6RVRHYUx3Sk8w?=
 =?utf-8?B?bEVuRFp0VzRWM2t2ZHRxWkpLVGlXYk0xaVFYWmJiRGFqSnJFbVBRQWRNVmRh?=
 =?utf-8?B?MXE0Rzl0Nkd3M0ZpZldtRUNkNEtHQ2Zzc09scmpqVGJnbVRjazFHajhTQlJt?=
 =?utf-8?B?MllvWDlQZDFMVnI5emNCMnQ4cm9RbTM0ZUpBWUtYWm1PM3FRU2d1ak5DZ2F1?=
 =?utf-8?B?V29pZTdEdUl1MlpLd0RXY2tDMkhYSjJTWThiUENMK21CckVRSWhsWjltTnlw?=
 =?utf-8?B?ek1ESjFBZUhQaXVvaDc4bWFDQXJZUjI5cTlMV2ZpZmpXZVU4Q3V3QnVtR2R3?=
 =?utf-8?B?RUJQUldJN0tWTDUvNXNickN0emtaL1FSTjlyMDRzZXRtcnl4RlJCaStWQVRI?=
 =?utf-8?B?SzlWTW1iY09aS2pIYmxoOGRPR1Jkc3JtM0toY3M5RUN5Tk5hU3ZUZm1hVXVU?=
 =?utf-8?B?VTlYQ1AvY2lEdTRmbFhnN1FpYWZXWnBhanJYWnJnbEZwT3NmUnptT1pKK2tm?=
 =?utf-8?B?aDlFMWV4RXdIbUdpMDlrbHhqem5wQUNtTFAxck54eTBlRlpvZHY1eldWRkZ2?=
 =?utf-8?B?Rnl2MHQ0SExybk9XRzMyVEZBVjJ1Qy95ZktHL3hycVNnZURLMHVrMmwxdG5G?=
 =?utf-8?B?RmJRa2NmWFo1cTByTkFsR0xLQ1ZnaHkrK04ya2R5NDFpWDdXNTN3UFFnYW1H?=
 =?utf-8?Q?8WQBcSAWbC/v299OSiCtwMdaw?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b67c99f6-ae0b-41cf-4f44-08db19139eb4
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 22:40:26.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+QVe2acWIjYJU0elDh4o7CyYU14lejYLSTFdRMJ0nIulGK/moGbhuqCH5UI9lo3bWWcp/cQHm2FzDp7QJIugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_144035_027400_524906C9 
X-CRM114-Status: GOOD (  44.94  )
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

T24gU2F0LCAyNSBGZWIgMjAyMyAyMzoyNDo0MCAtMDUwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFNhdCwgRmViIDI1LCAyMDIzIGF0IDI6MjnigK9QTSBTZXJnZXkg
TWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBG
ZWIgMjQsIDIwMjMgYXQgMDE6NTc6NTVBTSArMDgwMCwgWm9uZyBMaSB3cm90ZTogIAo+ID4gPiBM
YWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IOaWvCAyMDIy5bm0MTLm
nIgyM+aXpSDpgLHkupQg5LiL5Y2IODo1NOWvq+mBk++8miAgCj4gPiA+ID4KPiA+ID4gPiBIaSBH
dW8sCj4gPiA+ID4KPiA+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiA+ID4gPgo+ID4g
PiA+IE9uIEZyaSwgTm92IDExLCAyMDIyIGF0IDg6MDAgQU0gPGd1b3JlbkBrZXJuZWwub3JnPiB3
cm90ZTogIAo+ID4gPiA+ID4KPiA+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBZnRlciB1c2VfYXNpZF9hbGxvY2F0b3Ig
aXMgZW5hYmxlZCwgdGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiB3aWxsCj4gPiA+ID4gPiBjcmFz
aCBieSBzdGFsZSBUTEIgZW50cmllcy4gQmVjYXVzZSBvbmx5IHVzaW5nIGNwdW1hc2tfY2xlYXJf
Y3B1IHdpdGhvdXQKPiA+ID4gPiA+IGxvY2FsX2ZsdXNoX3RsYl9hbGwgY291bGRuJ3QgZ3VhcmFu
dGVlIENQVSdzIFRMQiBlbnRyaWVzIHdlcmUgZnJlc2guCj4gPiA+ID4gPiBUaGVuIHNldF9tbV9h
c2lkIHdvdWxkIGNhdXNlIHRoZSB1c2VyIHNwYWNlIGFwcGxpY2F0aW9uIHRvIGdldCBhIHN0YWxl
Cj4gPiA+ID4gPiB2YWx1ZSBieSBzdGFsZSBUTEIgZW50cnksIGJ1dCBzZXRfbW1fbm9hc2lkIGlz
IG9rYXkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSGVyZSBpcyB0aGUgc3ltcHRvbSBvZiB0aGUgYnVn
Ogo+ID4gPiA+ID4gdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSAoY29yZWR1bXApCj4gPiA+
ID4gPiAgICAweDAwMDAwMDNmZDZkMjI1MjQgPCs0PjogICAgIGF1aXBjICAgczAsMHg3MAo+ID4g
PiA+ID4gICAgMHgwMDAwMDAzZmQ2ZDIyNTI4IDwrOD46ICAgICBsZCAgICAgIHMwLC0xNDgoczAp
ICMgMHgzZmQ2ZDkyNDkwICAKPiA+ID4gPiA+ID0+IDB4MDAwMDAwM2ZkNmQyMjUyYyA8KzEyPjog
ICAgbGQgICAgICBhNSwwKHMwKSAgCj4gPiA+ID4gPiAoZ2RiKSBpIHIgczAKPiA+ID4gPiA+IHMw
ICAgICAgICAgIDB4ODA4MmVkMWNjMzE5OGIyMSAgICAgICAweDgwODJlZDFjYzMxOThiMjEKPiA+
ID4gPiA+IChnZGIpIHggLzJ4IDB4M2ZkNmQ5MjQ5MAo+ID4gPiA+ID4gMHgzZmQ2ZDkyNDkwOiAg
IDB4ZDgwYWM4YTggICAgICAweDAwMDAwMDNmCj4gPiA+ID4gPiBUaGUgY29yZSBkdW1wIGZpbGUg
c2hvd3MgdGhhdCByZWdpc3RlciBzMCBpcyB3cm9uZywgYnV0IHRoZSB2YWx1ZSBpbgo+ID4gPiA+
ID4gbWVtb3J5IGlzIGNvcnJlY3QuIEJlY2F1c2UgJ2xkIHMwLCAtMTQ4KHMwKScgdXNlZCBhIHN0
YWxlIG1hcHBpbmcgZW50cnkKPiA+ID4gPiA+IGluIFRMQiBhbmQgZ290IGEgd3JvbmcgcmVzdWx0
IGZyb20gYW4gaW5jb3JyZWN0IHBoeXNpY2FsIGFkZHJlc3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
V2hlbiB0aGUgdGFzayByYW4gb24gQ1BVMCwgd2hpY2ggbG9hZGVkL3NwZWN1bGF0aXZlLWxvYWRl
ZCB0aGUgdmFsdWUgb2YKPiA+ID4gPiA+IGFkZHJlc3MoMHgzZmQ2ZDkyNDkwKSwgdGhlbiB0aGUg
Zmlyc3QgdmVyc2lvbiBvZiB0aGUgbWFwcGluZyBlbnRyeSB3YXMKPiA+ID4gPiA+IFBUV2VkIGlu
dG8gQ1BVMCdzIFRMQi4KPiA+ID4gPiA+IFdoZW4gdGhlIHRhc2sgc3dpdGNoZWQgZnJvbSBDUFUw
IHRvIENQVTEgKE5vIGxvY2FsX3RsYl9mbHVzaF9hbGwgaGVyZSBieQo+ID4gPiA+ID4gYXNpZCks
IGl0IGhhcHBlbmVkIHRvIHdyaXRlIGEgdmFsdWUgb24gdGhlIGFkZHJlc3MgKDB4M2ZkNmQ5MjQ5
MCkuIEl0Cj4gPiA+ID4gPiBjYXVzZWQgZG9fcGFnZV9mYXVsdCAtPiB3cF9wYWdlX2NvcHkgLT4g
cHRlcF9jbGVhcl9mbHVzaCAtPgo+ID4gPiA+ID4gcHRlcF9nZXRfYW5kX2NsZWFyICYgZmx1c2hf
dGxiX3BhZ2UuCj4gPiA+ID4gPiBUaGUgZmx1c2hfdGxiX3BhZ2UgdXNlZCBtbV9jcHVtYXNrKG1t
KSB0byBkZXRlcm1pbmUgd2hpY2ggQ1BVcyBuZWVkIFRMQgo+ID4gPiA+ID4gZmx1c2gsIGJ1dCBD
UFUwIGhhZCBjbGVhcmVkIHRoZSBDUFUwJ3MgbW1fY3B1bWFzayBpbiB0aGUgcHJldmlvdXMKPiA+
ID4gPiA+IHN3aXRjaF9tbS4gU28gd2Ugb25seSBmbHVzaGVkIHRoZSBDUFUxIFRMQiBhbmQgc2V0
IHRoZSBzZWNvbmQgdmVyc2lvbgo+ID4gPiA+ID4gbWFwcGluZyBvZiB0aGUgUFRFLiBXaGVuIHRo
ZSB0YXNrIHN3aXRjaGVkIGZyb20gQ1BVMSB0byBDUFUwIGFnYWluLCBDUFUwCj4gPiA+ID4gPiBz
dGlsbCB1c2VkIGEgc3RhbGUgVExCIG1hcHBpbmcgZW50cnkgd2hpY2ggY29udGFpbmVkIGEgd3Jv
bmcgdGFyZ2V0Cj4gPiA+ID4gPiBwaHlzaWNhbCBhZGRyZXNzLiBJdCByYWlzZWQgYSBidWcgd2hl
biB0aGUgdGFzayBoYXBwZW5lZCB0byByZWFkIHRoYXQKPiA+ID4gPiA+IHZhbHVlLgo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAgIENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+
ID4gPiA+ID4gICAgLSBzd2l0Y2ggJ3Rhc2snIGluCj4gPiA+ID4gPiAgICAtIHJlYWQgYWRkciAo
RmlsbCBzdGFsZSBtYXBwaW5nCj4gPiA+ID4gPiAgICAgIGVudHJ5IGludG8gVExCKQo+ID4gPiA+
ID4gICAgLSBzd2l0Y2ggJ3Rhc2snIG91dCAobm8gdGxiX2ZsdXNoKQo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHN3aXRjaCAndGFzaycgaW4gKG5vIHRs
Yl9mbHVzaCkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LSB3cml0ZSBhZGRyIGNhdXNlIHBhZ2VmYXVsdAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRvX3BhZ2VfZmF1bHQoKSAoY2hhbmdlIHRvCj4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3IGFkZHIgbWFwcGlu
ZykKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdw
X3BhZ2VfY29weSgpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHB0ZXBfY2xlYXJfZmx1c2goKQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfZ2V0X2FuZF9jbGVhcigpCj4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiBmbHVzaF90
bGJfcGFnZSgpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgd3JpdGUgbmV3IHZhbHVlIGludG8gYWRkcgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtIHN3aXRjaCAndGFzaycgb3V0IChubyB0bGJfZmx1c2gpCj4g
PiA+ID4gPiAgICAtIHN3aXRjaCAndGFzaycgaW4gKG5vIHRsYl9mbHVzaCkKPiA+ID4gPiA+ICAg
IC0gcmVhZCBhZGRyIGFnYWluIChVc2Ugc3RhbGUKPiA+ID4gPiA+ICAgICAgbWFwcGluZyBlbnRy
eSBpbiBUTEIpCj4gPiA+ID4gPiAgICAgIGdldCB3cm9uZyB2YWx1ZSBmcm9tIG9sZCBwaHlpY2Fs
Cj4gPiA+ID4gPiAgICAgIGFkZHIsIEJVRyEKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgc29sdXRp
b24gaXMgdG8ga2VlcCBhbGwgQ1BVcycgZm9vdG1hcmtzIG9mIGNwdW1hc2sobW0pIGluIHN3aXRj
aF9tbSwKPiA+ID4gPiA+IHdoaWNoIGNvdWxkIGd1YXJhbnRlZSB0byBpbnZhbGlkYXRlIGFsbCBz
dGFsZSBUTEIgZW50cmllcyBkdXJpbmcgVExCCj4gPiA+ID4gPiBmbHVzaC4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBGaXhlczogNjVkNGI5YzUzMDE3ICgiUklTQy1WOiBJbXBsZW1lbnQgQVNJRCBhbGxv
Y2F0b3IiKQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4gPiA+ID4gPiBDYzogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiA+ID4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiA+
ID4gPiAtLS0KPiA+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gPiAgLSBNb3ZlIHNldC9j
bGVhciBjcHVtYXNrKG1tKSBpbnRvIHNldF9tbSAoTWFrZSBjb2RlIG1vcmUgcHJldHR5Cj4gPiA+
ID4gPiAgICB3aXRoIEFuZHJldydzIGFkdmljZSkKPiA+ID4gPiA+ICAtIE9wdGltaXplIGNvbW1l
bnQgZGVzY3JpcHRpb24KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+
ID4gIC0gRml4dXAgbm9tbXUgY29tcGlsZSBwcm9ibGVtIChUaHggQ29ub3IsIEFsc28gUmVwb3J0
ZWQtYnk6IGtlcm5lbAo+ID4gPiA+ID4gICAgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4pCj4g
PiA+ID4gPiAgLSBLZWVwIGNwdW1hc2tfY2xlYXJfY3B1IGZvciBub2FzaWQKPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jIHwgMzAgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gIAo+ID4gPiA+IEFzIHJlcG9ydGVkIG9uIHRo
ZSBwYXRjaCBbMF0gSSB3YXMgc2VlaW5nIGNvbnNpc3RlbnQgZmFpbHVyZXMgb24gdGhlCj4gPiA+
ID4gUlovRml2ZSBTb0Mgd2hpbGUgcnVubmluZyBib25uaWUrKyB1dGlsaXR5LiBBZnRlciBhcHBs
eWluZyB0aGlzIHBhdGNoCj4gPiA+ID4gb24gdG9wIG9mIFBhbG1lcidzIGZvci1uZXh0IGJyYW5j
aCAoZWI2N2QyMzlmM2FhKSBJIGFtIG5vIGxvbmdlcgo+ID4gPiA+IHNlZWluZyB0aGlzIGlzc3Vl
Lgo+ID4gPiA+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+ID4KPiA+ID4gPiBbMF0gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjIwODI5MjA1
MjE5LjI4MzU0My0xLWdlb21hdHNpQGdtYWlsLmNvbS8KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IEhp
IGFsbCwKPiA+ID4gSSBnb3QgdGhlIHNhbWUgc2l0dWF0aW9uIChpLmUuIHVuaGFuZGxlIHNpZ25h
bCAxMSkgb24gb3VyIGludGVybmFsCj4gPiA+IG11bHRpLWNvcmUgc3lzdGVtLCBJIHRyaWVkIHRo
ZSBwYXRjaFswXSAmIFsxXSwgYnV0IGl0IHN0aWxsIGRvZXNuJ3QKPiA+ID4gd29yaywgSSBndWVz
cyB0aGVyZSBhcmUgc3RpbGwgc29tZSBwb3RlbnRpYWwgcHJvYmxlbXMuIEFmdGVyIGFwcGx5aW5n
Cj4gPiA+IHRoaXMgcGF0Y2gsIHRoZSBzaXR1YXRpb24gZGlzYXBwZWFyZWQsIEkgdG9vayBzb21l
IHRpbWUgdG8gbG9vayBhdAo+ID4gPiBvdGhlciBhcmNoZXMnIGltcGxlbWVudGF0aW9ucywgc3Vj
aCBhcyBhcmMsIHRoZXkgZG9uJ3QgY2xlYXIgdGhlCj4gPiA+IG1tX2NwdW1hc2sgZHVlIHRvIHRo
ZSBzaW1pbGFyIGlzc3VlLiBJIGNhbid0IHNheSB3aGljaCBhcHByb2FjaCBtaWdodAo+ID4gPiBi
ZSBiZXR0ZXIsIGJ1dCBJJ2QgbGlrZSB0byBwb2ludCBvdXQgdGhhdCB0aGlzIHBhdGNoIHdvcmtz
IHRvIG1lLgo+ID4gPiBUaGFua3MuCj4gPiA+Cj4gPiA+IFRlc3RlZC1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgo+ID4gPgo+ID4gPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyMjA4MjkyMDUyMTkuMjgzNTQzLTEtZ2VvbWF0c2lAZ21haWwuY29tLwo+
ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzAxMjkyMTE4
MTguNjg2NTU3LTEtZ2VvbWF0c2lAZ21haWwuY29tLyAgCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUg
cmVwb3J0ISBCeSB0aGUgd2F5LCBjb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHNvbWUKPiA+IGluZm9y
bWF0aW9uIGFib3V0IHRoZSByZXByb2R1Y2luZyB3b3JrbG9hZCA/Cj4gPgo+ID4gSW5pdGlhbCBp
ZGVhIHdhcyB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBUTEIgZmx1c2hlcyBieSBkZWZlcnJpbmcg
KGFuZAo+ID4gcG9zc2libHkgYXZvaWRpbmcpIHNvbWUgb2YgdGhlbS4gQnV0IHdlIGhhdmUgYWxy
ZWFkeSBidWcgcmVwb3J0cyBmcm9tCj4gPiB0d28gZGlmZmVyZW50IHZlbmRvcnMsIHNvIGFwcGFy
ZW50bHkgc29tZXRoaW5nIGlzIG92ZXJsb29rZWQgaGVyZS4KPiA+IExldHMgc3dpdGNoIHRvICdh
Z2dycmVnYXRpbmcnIG1tX2NwdW1hc2sgYXBwcm9hY2ggc3VnZ2VzdGVkIGJ5IEd1byBSZW4uCj4g
Pgo+ID4gQEd1byBSZW4sIGRvIHlvdSBtaW5kIGlmIEkgcmUtc2VuZCB5b3VyIHYzIHBhdGNoIHRv
Z2V0aGVyIHdpdGggdGhlCj4gPiByZW1haW5pbmcgcmV2ZXJ0cyBvZiBteSBjaGFuZ2VzID8gIAo+
IE9rYXksIHRoeCBmb3IgdGFraW5nIGNhcmUuIExldCdzIG1ha2UgaXQgd29yayBhcm91bmQgZmly
c3QgYW5kIHRoZW4gaW1wcm92ZSBpdC4KPiAKPiBBY3R1YWxseSwgdGhlIGN1cnJlbnQgcmlzY3Yg
YXNpZCBpcyBmcm9tIGFybTY0IHdpdGggaGFyZHdhcmUgYnJvYWRjYXN0Cj4gcmVxdWlyZW1lbnRz
LiBNYXliZSB3ZSBuZWVkIHRvIGNvbnNpZGVyIHg4NiBwZXItY3B1IGFzaWQgcG9vbCB3YXkuCgpJ
dCBzaG91bGQgYmUgbm90ZWQgdGhhdCB0aGUgc3BlYyBleHBlY3RzIHN1cGVydmlzb3Igc29mdHdh
cmUgdG8KdXNlIGEgY29uc2lzdGVudCBtZWFuaW5nIG9mIG5vbi16ZXJvIEFTSURzIGFjcm9zcyBk
aWZmZXJlbnQgaGFydHMuCgpBbHNvLCBhIHZlbmRvciBjb3VsZCBpbXBsZW1lbnQgZWZmaWNpZW50
IGhhcmR3YXJlIGJyb2FkY2FzdGluZyBBU0lECmludmFsaWRhdGlvbiB3aXRoIGEgY3VzdG9tIGlu
c3RydWN0aW9uIGFuZCBleHBvc2UgaXQgdmlhIFNCSS4KCkJlc3QsCkdhcnkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
