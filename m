Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6DC54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Zff5NlAgV+nkN2FELCx1DE7Zd+xUk6kT85tJNTIuYM=; b=B9+M2NZQ3u1JDidRZRN0Cw+E8z
	KAY5ACUvv42TA6yR3KcoRy4H/zwlvMcg3XPWBtJ/HWfTintB6wZKNt1dq5am7VPG2ZK7HSyTH/Un+
	RRSSeDbmaFu4NkSFfoP90Hg1x4eFT4JNeTBVkbQeeroDVyDmqljemxGpv4B7rpjvxyCzr9x/1ZQOc
	pQegib8rOG0EmCf6zfQdf0yXSrVoyz+QU2J1jm3CM3IzZdueomu1hPokcS2LDM/p1Gc8Y611QXGw8
	fynjcWACeSMt61pk6VrkXKTIokzqKAQ8EWbusLOtdieDI+CiGCvA8e9m8oYUd2nX+a/bH7VpwhwGy
	ZcAKY0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkQj-0000000EI11-1RMd;
	Thu, 14 Mar 2024 12:43:29 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkQg-0000000EHzk-13ml
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 12:43:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO9UAEvzEyrBdsfb/dDJ6QZ5FYG/Q9DtfyDaxofyqWcrja9czYcliuASlJCktP4QDfoQbtfwoIgj2XYWfRi54UHi9+4ycxchTyef2qAEIfxtYLujq+LqNHVtRiROuLF7oitM4M2+TbUfbVyZJKCW1tZsaowmw/gdBwUsvbbQmKcUkUCR/KOHS0s1jBOaD1aiE3CfGP3FDN6y3VfCwqLR9IlmrTShY57WhFUZ1+bQiwdiTkR2fJLzo6xzh783inbbJza1m0GNROjWBcE6SnLtMxmhPpP5tlPNr34P88vK61wB9+Dh7Oz7thlXj6ogszPGyRsJ14wa0vrswwQhz1ckEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHwRG6fXRxioGNcbnrS19cZFgJoPXJdggfSsfQtlF1s=;
 b=jutJIHh86KtIKOPmzNjnY0WpaHKFtOI+oAmQzV/SxU47SEoVT3hQ3TN3LAaIJwnsfhXH1aceipKHW0tKZ41w5EB+bQlQMg/UAuyF0Hmdq9hUP3T50XrcLgzjczRZpvcP3AsKiLVc6HYXHAuooNIIP0mKflgfIS+AudH1BkFS68NrPlzogsw5SOUxk7NcoM1lVO0f3+w7AAXg27FuwvTNq7jTLkOdMqJym8RWVMHjc4n7mHsW3gW3t3DGuGAYdBqj9URhCK5FG3cmHE2SpKes/y3C+kX/NvOMhXE/+LfdHLBiw1e40Wqa+ILDtZRW1nwDg5Uyv3oTPjGvUQbV791Ifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHwRG6fXRxioGNcbnrS19cZFgJoPXJdggfSsfQtlF1s=;
 b=JE3MfMJH0rgA9MbJA9g2nEHCZmuRlWj+VCx+Fwx2QcRa6dcAB/6ifJXcojmHPjD/4oNnze3/XmMMUZVuHNMwrLUTAoGbHCORrhZl/lkam6RyMMnpFo3vgGBRBiMTnAExcsMvWFf7g6jxH0xPZ998MtTV6Jv6hyjlByWel7B3t2ba8qv0hAAYTSEClpbPjTLdRu2lIllI8oSZF3DbL57EI5gaO7YfTOQj38lwX3Z+fZM7plbw+yUow+ajphHtLZwbt0EgOKq4IzYPsVPvVFOR+T4/r+ykgmTSb87hl1Km+y184oJ3w62yaZhqw2i8LNQwXIPyN+Jrhp3pXzp8CKB+Cg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0627.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 12:43:14 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 12:43:14 +0000
Message-ID: <MA0P287MB28229709A260ECC6348CADF6FE292@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Mar 2024 20:43:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: build error for sg2024 device-tree
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>,
 Device Tree list <devicetree@vger.kernel.org>
References: <dc78535c-eab3-4501-9ecc-0464e90c9b54@codethink.co.uk>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <dc78535c-eab3-4501-9ecc-0464e90c9b54@codethink.co.uk>
X-TMN: [UtrNd26olxlgjrsOqdaKtdUDP1VpkHSs]
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <79329cb1-7e3c-42ff-b558-bcd7b5f45de5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0627:EE_
X-MS-Office365-Filtering-Correlation-Id: e42161fa-2b3d-46c7-6306-08dc4424509c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zP03ZOwJNzDf8PkEN7O/GIhg4pCS8y1Z7JDcwA4BYdTcx0aeNZEpKtiF6G6vX+LfL1Ck9cAus0Rfc7gpFJIrKFNYhu7HOEB5UjKm0lRWynpIkdSRk7E3sQvbWETD9X6cAt67J8reWHz8/Pon2/JIboX9sEgLztLuG6XtteJ7K2zM+2M+pafDEWtv8M9GvRFzrUSQYa882vWJ8fv7ua8clSUABn1rOzCNBXFzprJuex8WyIJrJ55U0stG/PcZLiVqWstFtNVrZnTxif5jbXyk/JE+lT0qqY719MTHdB65ksDEc09wyox77j6tdtV9cQ3VyZ0AIWLMLjrOpUg05Y5nrdXW1MNPZNN7C+71XpsbY1L+ikthCPaXthqvIsQ1iLaREpEl3rNloi/LOQXgcg/pfK+sUrWHATI1PCuatx1HiYRj66QeJwrWvyRod+Pr092W7+c97Zjd/dH2OV+MGuqBUmFDIZdFUZinUiVJmvOWzYaA1EZeJ4oiEjAUrpFQp268Kr0G+1fJ470L1fGw8L3K5zWhWLh3ppk772eN6lfHIohviOPym6yLbtiF04OSa6BClI6mWX+hWG/x5aNPmLKnrkjpG4rA6EGLFcmgmnvFAqdAjNJPxRTfQc1Vb9W7b3hgyAuCPYMLXW9QZWbz9Qzp4APN02nE9SDPBCvlYYTC8II=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VxdDZKZFVLblk1NnVzTFk0cVlFOWlLYWE5dVp1VEZwaFpUZGUrc290MUtx?=
 =?utf-8?B?bExKL0xaQVlNT0JUMHd2bEZQRFNmSVp3YzMzbURFaWxHUFVoUWtUVkYreGxq?=
 =?utf-8?B?RVBXUDVtZzZEc0lydDlOYWVyK2NIQlBWWDBYZGtPNDkzakRJV1lMbzFwdGtt?=
 =?utf-8?B?Ny9hRlRmL1pXSXE5QlkzaWlZdlBFWXVYWXNzdzExS0o4VFdrbXJOTFJuTEZm?=
 =?utf-8?B?SmVvMzBIcFZwZE9xQ3Y1T21uNEtReWFQTUM3VmpBcnFjbDg0a21lUHZYaXQ1?=
 =?utf-8?B?UHdYU1NaWjNIM2k1QWVFYk1GaVdpdDVhRjlMZlZWcVZCQnRzWStsMm8vY1Ev?=
 =?utf-8?B?dmVlSUswaTdCUmh5SzFYZXBFMVE5S2dLT0c1RG1oanhMTU1WK3BjTWtHOU9x?=
 =?utf-8?B?RjZKRTBISklJbEs1STBKc1RObjZLUXNWQWwrTlJhWEJBd1MwNFltanRWSDJ3?=
 =?utf-8?B?NkhrZmFZY09LclViRDE3NndTVzdqUUhpelBpVWRKM0x1bXB4ZWUvcU9WMng1?=
 =?utf-8?B?R0pzTVZ3cGEvSUgrdG9relNxeW02c1BMbEdSSmpjSmsraVFGaWdlR0hETytq?=
 =?utf-8?B?S0FyY21zU0djVFpNWUx3VDU5bGtteFE4TkY1S3d2dm05bGN6cW1FMVZIMnA1?=
 =?utf-8?B?dXpvUVp4ZnJveUVudlNzS292c3Z0SXk2dm5xdnJXbHovVkkvN2VocFg3NkQy?=
 =?utf-8?B?SUZVUXpqdGdISmhZeFFPdS9PUHJUT25XRUdvdUxGbVRsVi9hQ1dEMGlyQXdt?=
 =?utf-8?B?c3p5NVdTclkvM0NKMDlJZkhrRG4wWWtNZDZ5RjJDbjFYcW1PSkxnWnl2MVlF?=
 =?utf-8?B?OVJOREJZUE5pYWI3L3lTdythNkVjUW1DYmN2UG1tUVlJdllYNUowMElQMit5?=
 =?utf-8?B?SGtUN0RFN0dmN1E3MTZraUROekRacEg4c29KRU1ZcjlXRi9DTlhWMUJEZEVY?=
 =?utf-8?B?eEwzTkxwRVlTdVk5MnN1NjlZbVk1VXoyaFZpekVLNTdiczl5dXpwTzFkdmpm?=
 =?utf-8?B?THphYy9DVnVyZldjb2svU0Vsb2M1VWRtS0VqVDBaakVubUI5YkhUTDRJcHdz?=
 =?utf-8?B?eVd1a2xZaUMrN3IxK245aGhqak5qTWtlVDRYS2dCdnVKUm0vbXNobGc5MGlG?=
 =?utf-8?B?WVpKdGFqbXdHRDJPMGVOZU9kbUZBQlQxbGFVYWp3cVU5OGFuSnNYUjljeDJt?=
 =?utf-8?B?RFF1dGZGaUtSSFR1MnZKMDM4OHppWjcrS1FTeXpLSWVkYWphbnhUUkk3TmdM?=
 =?utf-8?B?YWoxSjlncCtQdEIvL014blVqR0dPTjdDdTBVSHFTNFpEQ01QNjVDYWFsa3JZ?=
 =?utf-8?B?TzNMY1FZc2QxTHJYcldDdk5UNUl6VmpkRVUyZjhOZU80WHoxYURZbmo0R214?=
 =?utf-8?B?YzdqMkRvbktEMWMrTjJJVkI2ZHZXa1FBN3hBRXh2STl1d0pPZG9xRTAzd0FQ?=
 =?utf-8?B?MGpBVjRxekVaMFRoemFCU0Nlb1h5VmZpc0duRkxCcjNiYk1TYldZNjhVc2NQ?=
 =?utf-8?B?UnJOaE1sSUNJUDlKd09OVVFPSmxMNTl4S0ZIR0hOcHdrUXBKbGpJUEErVngy?=
 =?utf-8?B?WFpzcFpTanRKeFk1TG5COUdRWXpMLzdzMXMrODF2aE1ScEhoa1g4bzdobDls?=
 =?utf-8?B?eFNmT2RpaVRJYU1Cd3JoaTAwa2RIUlYxajk0YUpzMzllSGtzTllvY2ZkSzJz?=
 =?utf-8?Q?jBt7pglXLP9n6m291AoR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42161fa-2b3d-46c7-6306-08dc4424509c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 12:43:14.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0627
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_054326_482318_DBA098D4 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RllJOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvTUEwUDI4N01CMjgyMjI4
QTk0MTE5NjQyOTc5QTAzNUM3RkUyOTJATUEwUDI4N01CMjgyMi5JTkRQMjg3LlBST0QuT1VUTE9P
Sy5DT00vCgpPbiAyMDI0LzMvMTQgMTc6NDcsIEJlbiBEb29rcyB3cm90ZToKPiBCdWlsZGluZyB0
aGUgY3VycmVudCBsaW51eCBrZXJuZWwgSSdtIGdldHRpbmc6Cj4KPj4gwqAgRFRDIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0Ygo+PiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gCj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1w
aW9uZWVyLmR0czo2Ogo+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaTo5
OjEwOiBmYXRhbCBlcnJvcjogCj4+IGR0LWJpbmRpbmdzL3Jlc2V0L3NvcGhnbyxzZzIwNDItcmVz
ZXQuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+PiDCoMKgwqAgOSB8ICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9yZXNldC9zb3BoZ28sc2cyMDQyLXJlc2V0Lmg+Cj4+IMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+PiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+PiBtYWtlWzVdOiAqKiogW3NjcmlwdHMvTWFr
ZWZpbGUubGliOjQyMTogCj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxr
di1waW9uZWVyLmR0Yl0gRXJyb3IgMQo+PiBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NDgxOiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnb10gCj4+IEVycm9yIDIKPj4gbWFr
ZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4MTogYXJjaC9yaXNjdi9ib290L2R0
c10gRXJyb3IgMgo+PiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDgxOiBh
cmNoL3Jpc2N2XSBFcnJvciAyCj4KPiBDb25maWcgaXMgYXR0YWNoZWQsIGJ1dCBsb29rcyBsaWtl
IHNvbWV0aGluZyBpcyBlaXRoZXIgbWlzc2luZyBvciBub3QgCj4gbWVyZ2VkIGZyb20gYW5vdGhl
ciB0cmVlLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
