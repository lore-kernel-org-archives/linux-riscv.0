Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE86BCD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9946Q8bYLEssvHks9oAdbnqyxGif9mb0QQ/xyMD2/iU=; b=pSZlsrFjHGdAQ2
	+hJ0M253OQ5ELfEBbOljmsE8kWI51xnIOd9qvqY2LwLXgeOQ4zbSoVJH6elSUo5CjsffR4u504L0s
	6wcVk/4ICz39M9Hx63nOl//KajpFaEAaQegIdTvl5e2zYlYXmyOQ228z5QQhDcSZF4c0htzsk5Xuw
	4jeybxr3SwwmOTUM7SQOMYHzAXK/ne+k7xWUl2AH7YAdR/Qqoi8R6uJq9GytBCnD/FaUGqh4llvk0
	fDTsuRrJAwaDxvCCojxVJ+1fuLkqV2vfCPwRY+4Qod/4ynuqT0xVVQ6TseRRx4/j5FIeLFATnLYEB
	x3wZbOTVECdvCOKcR4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqnx-0000000BLDi-40XR;
	Thu, 11 Apr 2024 09:33:13 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqnu-0000000BLCq-3M5G
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3LwW1IhO1SudGzUYqlAGZD7YNlMtL2xagdmX51vBpLnYalr8proUwKy4a5qD6t/OrnUdhydhVy47dGoWwlYpWLyXi7XKycPsGxY1IMEf5nnzeq8R/EoS/6bJ+9AaftmxpJZ/lviQDWeDYNs9YcMvAA7rIeRHRFexBC8w+nai7LavqYrPg+CBRuYlALots9IO0widzyZB/+pryNb+nhwI1wvtblsap9a7Vt9NbmQOFAyTFlrv8d4zddvq+4SkqLf9zhfZXJdOCuu6DI2WdNIgdkM0/mrcrmt2/fGnN4DaSbXta7JlPtFr/TTAORwTOfTRZWP0kQKb7SBGIHFZq7Unw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZDKVq0N/Pg2wETew1ZQfXqLkv08ThLu6QVXpB1WLkE=;
 b=VwwuO91JHZaHPf+kimKXLO5rOc4EZmKr84wAv2RViAkk/+/HBUs3dZHsKqzFoVzrgCFmTJRAM7o1vHOHCDe2AZSJmFvDQ7t/zGarOPjktfl/gnsTbFC56krRTO8aSFraXSzaJgj11Mw4zstAvGAK1N4Y11w2BA1VrPxZdDcHPqBYWltQ5LqZgUYeVuBQiN8kfKGmik0+UnqAvjXnVdwqO2EQAQ/ZgKkDUuznYGJ2uHFH/Ug9xelNSRxUN316zi406PE+IhhCk0mIDO4gRrs0WueDo66cUWe73JzyvA2M5LxTVGI5cbEdBiSRu2SxCeF+7A8SvOT2l+5GUhTbcTOoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZDKVq0N/Pg2wETew1ZQfXqLkv08ThLu6QVXpB1WLkE=;
 b=PwlXeffRI3fWroQLJV5okNHD9N4ulOWdT7bOgfu1dJVVTamcWfaipl+462uVZSJw3N0KRZSwqaFqsGQXHsjFRvWtlYpnzycqvoNw+70NfoyekQIGEkuUeWpFTYdPyht72wI646lKknwuJhvKZ9D61TkAFuCG8rxvKP2BdiI9/zW7WFhrNiFQZsErqgn4vcgl49j8l65h3XtOOoqgHFcaI9iyQGlW9BRHsvBWBvtaMPfu+1o/9DM1Mz9PekGNUteFLCSml9KJr8C4n7mR2ltFRaruWyLYGNJRqq+9FxOT4Hfx8CJDiV+gt0liu76FytfDuGp5gLoC8S2OfvS4+kGtbg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4727.namprd20.prod.outlook.com (2603:10b6:8:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 09:33:04 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Thu, 11 Apr 2024
 09:33:04 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: sophgo: add i2c and spi device to CV180x/SG2000x SoCs
Date: Thu, 11 Apr 2024 17:33:23 +0800
Message-ID: <IA1PR20MB4953D0B75F3166917EDA0524BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB49539A9C5F5CFF6644ED2C2ABB442@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49539A9C5F5CFF6644ED2C2ABB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [XUyl0fX9uQ7exBqKy2iOb+TD08wrEC7XfxzYbHsw7UU=]
X-ClientProxiedBy: TYAPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::24) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <171282797355.638379.7504915185168452805.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: afdc9bf3-a520-4180-1636-08dc5a0a6319
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DT5Ofux9KPuJNKSVXm93r7Z6rjW/L5+c7B0i2FtjSN1QZ/OVLb7tWNyVQYJfAJRUgsfWCeKqfWN6AbLLFZSGtlR8fwK5f+2gxobf0UbQi2eKQZqEKTiure/WSWa0r++eJScUe5mKMsn8KB0xd39aTQwi462OcIQ0WvX5u7Tt2lLehGbnT+jmiMrG20yoUgWOLFbwdLG74FibtyBVBH2Yo8vGgc+QLZuQ9Zj16TtNFnXGHHzZFpF5A/tZ9i0BEg3uZsMMVo2VHTN+F9TVRXR0fai8d4KWUNoaVBup0BRVWyO495Sx3z4eRASR48jiv21w+E5YB1mOLHYBUSxBY2DAXMOFSpz7QrfrA2xGRjUzlTxdbCW3JUnTEntutpD7gCXMV45nN8TQdHcISte/mvw+ey3Omu8nSqAxHZQjP5hf7UZEx/6EfLNabe9hWEYs4sMxN32C6jwKcuGnlHbdHDqwSaypwyIagzwhyawFM5yZz2p4ZDWYBS6e7ZvNMPi9hG0mPJ7k4ug45hVUqBnuCgYcNTFBtNUup0vU7xXuW7cRj7gbql8KGUisdg3Ed426X7TvhhUzGOX60IKT4IATyVomWxAe9UaHup9GwW/9VZo9yFjsQZyhdF1Bpd6pD9yMH0jvpICl85XwWKUwMNWClI/CHIgxsyD5NSQnF2jOqckQBJCH5v1BpbWYjpN6nXiKkWHo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFqYS9xMU5SK0MrWHpRL1BWTTYzQzBCL3JiV0Q4ekFOd0NUeHBGcEJVTnMy?=
 =?utf-8?B?ZzFta080dHliZXkwRWVCNHM2N2pZQzVnS2lHOXhJZ0p0TTVGdzB0dTZFeFFR?=
 =?utf-8?B?SGp3N0YwZThkL2puVzN6bFNzY01Qc1pOeWg5OEJYRGlSeVJ4U1RhQzNlOXJP?=
 =?utf-8?B?b0ZQSmxDZTVzZEp1WGZIRUNlNi8zbkZZb0svRXNVOVZPc1VQS3ozSWM5QllF?=
 =?utf-8?B?MDluWDV4M2MxSGZHN2l3aDVkQjlKYmlCRFp1Q3RYcnl2a2FQU3JmUDNOUHJZ?=
 =?utf-8?B?ZlBaMncyMjJwWi9HMmxPZ1Y2dzZSRjJybW9NMHhLd3JVOFgvNGRtL3BwcWdp?=
 =?utf-8?B?Yy9LV241OEpsbGxtSHNhSDQxT2hVa0ZEdTZSNkNDRkFOaWdwclRINUJocVZP?=
 =?utf-8?B?d3A0NWg4Z3B5b0dxQjUrb1NTTExzVmlrUUExbmlsVkM4TFZxbjlUVnNKRXJr?=
 =?utf-8?B?SHpZaWpzckd3M2xuTkF4N01PT3BpdlJCRjBUTURTQm9XMHF3U2pBTi9qZHNi?=
 =?utf-8?B?aFhBR1hISnMxeWs5MU4vd1BPZDNnUUVBRC8ybkQ5cm1nUWNLWU41VVdiaEQ0?=
 =?utf-8?B?bGZtdXp6emltd095YVd6aHRqaHhYUElycjR4MHVJYVZPL3dhTGhDNFdELzdD?=
 =?utf-8?B?SlVFT01WUzhCVEYvY2tpNjNTOHdPS1RJcHVKM2U4cHA5bGNMQ25mWlZGc2hj?=
 =?utf-8?B?MzRNS0RkRUxiNHhlZGRSV0FRRWczb05IN0h5RDhpR0c0SExYQTg1c2pUbWVC?=
 =?utf-8?B?anN4dzdYY3ZiRjcrbEhyczV4K3Q5YU93Q202U0V2Z1N3enF4WFlwNjlUQ2gy?=
 =?utf-8?B?MXZVdDlOMEZpd0h2N3FkblV1bUs0RnRLYlVISDlsNlFlcVUxeFlTY1RLV1Rj?=
 =?utf-8?B?aEFoR0wxUzEzR3RUTys2WHhCR2dxZmh4WUs1ck00NXZaWEFzb0FGQzQ4RW1r?=
 =?utf-8?B?d3BVaUo3eWxWcDZ2Tlo5T3ZzWFhLdXd6MFFER0lRZlphV0hGOE1MNGlzb0dM?=
 =?utf-8?B?NWJsY0ROMzdId2ZmUG4rT3ovdUcwY2RSRWl3RG9ka01ycFJkeFNWT3Q3UHlJ?=
 =?utf-8?B?UjJhcDk0Q1I4cWhKb0x5bUFzU3BkT1V2c2w2V1I3azluUVJvbzdLbGdMNjBJ?=
 =?utf-8?B?VnFOcURzcVZLZkw5Q2t5WU83SU9qTmY4bWlFWXB4SzVjb2U5U3Jld2lqMGQ4?=
 =?utf-8?B?Mk5DcVcxbUlIcytkT1hzRTU2UHBiYmpEZjJFdHNKUEJTTnJVaVBLWFFhN0FI?=
 =?utf-8?B?NWNyRjJQUTNxZE12SXhrNDd6NzJVRTJsQ25kdUNBRysxcFlzSnZaM1hFVi9y?=
 =?utf-8?B?RE50eUMvLzBOaE56RFNrekVGRWR4SmZKbEtxSEVtUmlwdHQrVTBzL3RvZGJD?=
 =?utf-8?B?WUEwY1ZVQmZVZ1NHWVlFSEtMWXZyYlRvNnJaaFNkVXNQenFPdUVTeDR6UXha?=
 =?utf-8?B?NXN1eEhkVEs5TGFaaEZXeVRUNDFMM3d0c1J5T1NFbW41WjFhb1RGTWw4RUtW?=
 =?utf-8?B?Y2FBcmJaVDBvQVdaQXJDY3JXOG56R3RzVHFtMC9tblBINStPZ2NacGlCbW5q?=
 =?utf-8?B?S0Fua1hWdFpSTGN4M2VoR3hXaUZqR01idi80cmV5RU9LOUk4MWRMTWhUK1lx?=
 =?utf-8?B?RmR5dHpLWU9mOHEvNlNjYjNQN01UR04yRnpRYi9uTGFNZFEvcExpcnIvNHps?=
 =?utf-8?Q?rLDksMxfsfDYLZ/uHHWw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdc9bf3-a520-4180-1636-08dc5a0a6319
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 09:33:04.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_023310_957507_491907EA 
X-CRM114-Status: UNSURE (   7.90  )
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

On Thu, 8 Feb 2024 08:21:29 +0800, Inochi Amaoto wrote:
> Add i2c and spi devices
> 
> The patch depends on the clk patch:
> https://lore.kernel.org/all/IA1PR20MB4953C774D41EDF1EADB6EC18BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com/
> 
> Changed from v1:
> 1. adjust the order of properties in dts.
> 
> [...]

Applied to sophgo/for-next, thanks!

[1/2] riscv: dts: sophgo: cv18xx: Add spi devices
      https://github.com/sophgo/linux/commit/4281f8f1489951a97af856e360c5d0bb8dc43096
[2/2] riscv: dts: sophgo: cv18xx: Add i2c devices
      https://github.com/sophgo/linux/commit/65fcc08b4cfe92d5d2c39710b3145d0b56e8391d

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
