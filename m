Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717FBE77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 00:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=215jSt/qVj1EK0AjtrfudRMHI5ZGnZhhSaMUCQLDJsc=; b=UF3w3RViRVkWNpia/QnLOcgJwE
	d7KZOMZr73pRqgd+/gTI+UCpWK0bNwSxbGABCBJTarU/g+79d3U7ECET7/g+aYE7Bgx4Kp3EnS0KC
	1y1RWrjRumtAXqb55A6w/p++uSVyoQPvk0PCmFeOKQEwaET4uDZ58hBaFqiHG7CXlypWQtHAga10p
	NbPVKAawkQiWicnJsqTad2teW41ML8RfMXiSNRLFbV4gi8s1kYW1MAcmyPZT7gKCoInYTmp+n4Jla
	TmS/Byi+4Ze2pzSn2gym+5eF8nETep90cplphBZheFXsEr1Q0dqYD9IiEpK2JnzsIPvsaLxo8/JsO
	xRod5txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWvl-0000000GaYz-1t1E;
	Thu, 12 Dec 2024 00:19:49 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWvh-0000000GaXa-1pTK
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 00:19:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEEfMBxRzLxI+OnP0F5B4gYKe6IV5xuww8ILOcmdwIlkVRxgohb7v2nQ8Tnpt3aq90TleqoxVOc11bJTmXyOgMPqRqaKSlrv4l1XpqZllG3MckrgZvzknpzXbgCg8Ct5DQ9Ih/ubvkpAVxWmhGM4cgZe4IBeoQwNmFY5GfZAlgske+6pppet+EwLqprJWznv4CYabTOAZqLyiDUSyzQe7d+5GrYGXUl43hPHI/unrZJXLq7JHIlOGJI4L+pmrXfclrR+wsc47/XyJHsp1Ioesmrmk5fgnX2IUm+g1P/hGU/IYkiaN4Q8PaeNlpPGuxNDDXWqgvBq+vb/moslcwrCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1b15VXyTKp9hn3Oi9qj9tJ6Q77OWeGCB8hqP2lCJys=;
 b=GuHdoeXT+9B4msuy6kZnmn4zRGKa+CnybjzRLc3IEO8wxqEHMSAESKK+ubSbpH+BVDdLuLr5p5dooryri2yGayiSugUnKCmoRj4dkSzSStEXoJRgBYTODZd82ZpRPrm9XLcSjPKD4CSgm6ZxrLJPoazAkkW58xUrVasNPwbWxUu4Kv9Rj1aS9n/Xdoj1HXa3p5OioHO07CIrhzmV4wxj9c7keo0LidiwGVYHsOr2Ukny1SveeKtDW7KEgSHdALwqz+53CGv4EnO5wqVUL4YStDli/C8iSQ+a93/qCGnfNgt3GkoO9O9uFR8nCYrzx5x8/AP2fegME8xzvNslO0LG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1b15VXyTKp9hn3Oi9qj9tJ6Q77OWeGCB8hqP2lCJys=;
 b=gli8AVjDy2tAXGxplxoea01zTjWm3rt9IMEAIL3hE1pIVUicevh5YFiylHtetcvquKY//p0qj1zL4aRhiswFfcADby7LVEtYl1XNamEk2zQlUPoSK24yV7RnOQuG6F8bVf/8O6KSbAYNp+U5elF+FhDVwe+pjgo4OlFjR1lOD+6yeuvCMubn302Uz3N5eVkZumHJ45ieVFf3VY/sIoOmsxCm51zzYWnJYLAHJ5TylV5IHbxRrGtNSmrewJOxB8WapUJHd5ncfA3iJxkelbfBSym1Kgb9IoS7QrvowTnuXAJZccCuypQbeKKivO41yItU4BDQVq1VtXwCqEy+Yeldsg==
Received: from PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:33::20)
 by PNZPR01MB10640.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 00:19:24 +0000
Received: from PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::cfb6:8c54:4902:b1a4]) by PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::cfb6:8c54:4902:b1a4%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 00:19:24 +0000
Message-ID: <PNZPR01MB452875A7236D7A2546EC23B4FE3F2@PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 12 Dec 2024 08:19:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
 <0e50f6e5-2442-40e7-8baa-575f139fad37@wanadoo.fr>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <0e50f6e5-2442-40e7-8baa-575f139fad37@wanadoo.fr>
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:33::20)
X-Microsoft-Original-Message-ID: <bc0e26ce-c3a1-48fc-815c-0038bac3b75e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNZPR01MB4528:EE_|PNZPR01MB10640:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5f4197-2b2c-42ff-6167-08dd1a42a06e
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|7092599003|6090799003|5072599009|19110799003|8060799006|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T21mUmpkMW1KaWVJZmRTd3NHWUk3Y1JzMFlmMlFmU2N5REdZQ1pnNXMrb2kx?=
 =?utf-8?B?MkE3VTFHc2FFTk11bi9kSzFLMS83OTB6U0dTa21xTURheUF6aUE2WDIvdyto?=
 =?utf-8?B?NVluc1VBUmtHQnpiZE9sTjdnNWtvN2Z6TkE2b2gyY3F4SnUvWWlzK1VYMERu?=
 =?utf-8?B?ekdPWERVeWo5bzhsdnJldDl4MVdyTnIrdFBNWGM0UmRKN0RpZXF0T2IrZDhj?=
 =?utf-8?B?M0dQOG9mOS8zMEY5djJERW1mMkNudlZoU0EwMFVmb2M3Z2Q3RFlEOVpBSUZ1?=
 =?utf-8?B?ejVzczk3NjQvS0tFM3dzZHZRV0w5VWFwYWZHcEJMUWdUS3BVU2NTNERKcVBI?=
 =?utf-8?B?TndGVnd6UitXK1UwQlRrUndDdW9pSFRZUElRN3l6eW11bEJ6ajYydmlUbVhG?=
 =?utf-8?B?RjhON3hKc1ZudjRrMlo3SThlbWdseG5yNEtZU0pwWXhtNkNVczhKQlUzd2F0?=
 =?utf-8?B?NEZ2dVV4QXJrVDlZckFGd2NlTzRlcHVqTnZvYW9Wa2cyaU9hU0IzYm1sdFNu?=
 =?utf-8?B?c2RMbG1XL2p0YXRpWXp1ajRjbDd6Z2lQWnVIa0xoZUZGWVJlZlBWQkJua3Zo?=
 =?utf-8?B?RmQzUFd5a1pqS2lPVDJmSUh1ZnJ3WnNtbTlmaS9WU0p2WHZncDNUY1BtOHVZ?=
 =?utf-8?B?aG05UGNSdlFRcUhSc3dpUHNUVnVwanJYeFlmc2VyMkZoemlnVGg4UDBXbVZo?=
 =?utf-8?B?dWdvWmFzRGV6MUhEYTFxZnZwclErQjBRaVFIanFQV0U5S3gwNGxlamlPblZh?=
 =?utf-8?B?K2d2SFYvblRpUE5sT3pOV283M0I4cSs2VTZWeU1yci9nc2w5dk5KaERPM2Na?=
 =?utf-8?B?UXNiZkVVZ0xpOEYySXY4ZUJzRHcwNmduUFFnTlhDNGVjM3lXb21uc05rUkFP?=
 =?utf-8?B?UDNyRERINEhPdUJiQkpieExLVHpnQktFNG1vYS9FbWxFZGRhQm1sZTNZY2tQ?=
 =?utf-8?B?djhtWUdaSVlCSFV2bExRTGlJaGRIamh3NmNCRXA5WlBTNFc1dzdwSGx3UWxa?=
 =?utf-8?B?SmlBdm9GZUI4M2l4eXlGSEJ3bkdZNUhTTjdRM3I2UXowQzFIZUtTa1crcGF4?=
 =?utf-8?B?MTg0ZFdQeTVOUUxTNnFsUDc1WERFcTdaOXhVTEJEd2ZJRXV2QzI5bzBIcG9y?=
 =?utf-8?B?alI1T1BrUXM4MjhjMjhNVW1tODBQYWRJVUFNNU5vdG40OWRhMXlSUG50dGJl?=
 =?utf-8?B?WDgrWllxams2LzVCcUtYMzVEVGpjR1IxNjNyKzNkS1dVcVUxb2pIanBxSklY?=
 =?utf-8?B?bTJ1UlVEd0pwbEtRRU0zVzVkL2lXNXhSb2VmZmFrNjhqeGkzSnJLSGpSay9S?=
 =?utf-8?B?eld3R3Z2RDlGckNjL0RUTjRvbjRvU0czZFR2emlsRmYvSHBEaHh6cTZHQm5H?=
 =?utf-8?B?dWZlOU1kcU55dUxzWnM5OUJRL3Rpa3JkWjgxZVdQRlNxK1BaSTdWdkpmdjNx?=
 =?utf-8?Q?N68tmNSM?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9ZOXVHNjlmRkdJaStveTBTOWgwd0tZNlZ4OTNaRVo3Y0xHUU1YOFBhNDVB?=
 =?utf-8?B?czdnZmJINXludXBpTHJMV0tUeUhXZUM1SStqWDBGMXR2dmVjRzFFVnZScVJs?=
 =?utf-8?B?cjkybmVzYlRFRmR0ZG9wSGpKRmJJRWRMS3Q0YVN6UXBNTHU0UmFpRk50WmV5?=
 =?utf-8?B?OEpyYW1OSlRyalR5bThGeFNXckVaVllzeENEcFJpRTJLMHdqY1F2S3FZWWtG?=
 =?utf-8?B?eE9aVkM3aUo0NmFtdldSQXBjTlllaGxac3BrRXE5R2FmUnZDQXN5MS9xaXg0?=
 =?utf-8?B?Y3lmcmtncDBwNXFTbnd5eUFWT0hubFVtM05sNS9BbDJ6RG43ZjJyK0Q0T1RJ?=
 =?utf-8?B?S0NxUmQ3cW8vU2NIM2Fjd3pzWnFscGU4djFWSjZTZndJVitsUnNHZHBBekpE?=
 =?utf-8?B?bEpVQklvR0hHS1FTb20yM3R1UnNBelhaQXF5QjBsKzB1YkFjdjdUZGVqeXNy?=
 =?utf-8?B?TXhhMXBNNmh1NkhIUXBHQTRVem1wczVRaXNRZTRxWHp0eG1HV2Q5NStVYW9i?=
 =?utf-8?B?djZZVm03UkVJM1VlUUxaQ1lwc05TOXJTZTNWWXZBeFI5THQ5WWtVU3U1UjZI?=
 =?utf-8?B?dE44cTA0VVFwNEFob0R5Y1EyT3c2Ynl5cUwxdHNvU3FMWi9kK1MwRS9Wbk9Z?=
 =?utf-8?B?dUNRb3I3ck9GTHBNRnBMMDNaODF1dnRiSDlxc1hVTGM3YXZsR0tESkk1N2Rt?=
 =?utf-8?B?cDZBWGs4T3RKT2huUnFKQjdETlYrNDJqaFNHNjNHYytaRVlqaVhjMUZKV2Rx?=
 =?utf-8?B?dHBLOVQxRWl4Y1ZkdC9wSzJjRVI1UlJIZGRacHpxS25YTyt6RDdXTVQvZVJJ?=
 =?utf-8?B?K0VtK3I0eEQySzh2Tlc3SUFQRFQvWGlNMkk1SXhhbEVOaEhVZ0hqeHlCdmVm?=
 =?utf-8?B?SXpWNmRsTFFERlFxSko2blZzRWQraDZkbXR1a1c4eXVCK1lqaFNYZUQvcTFH?=
 =?utf-8?B?a0dGeXNBbi9wWTlralYzZ3VJdG5lMEZGc2MwbzVsMHRPTVhodmxMNS81YkZv?=
 =?utf-8?B?MmRmK3VtQTR1WCtoTTRtaEh0STRzSUtCWHFwV0VmRTFSWnpqdG42SFpDMXgz?=
 =?utf-8?B?YVZjRDE0WkNRNTNEYXlCZ3RGRExGOUNRSm5WQU45bXhOOFF3UHFBTmJjOUd2?=
 =?utf-8?B?bUZ4SkVjRXc1RFpvK1U3TklqUkU3aGx1QURwa0swNWl5KzB2MTMrS1ZyK1NH?=
 =?utf-8?B?TTB4MDJ0VEwxRmVxcUt5YkVCUkxyVC8vblJtQktjdXNnVE9EaVpqRjh0Qlhx?=
 =?utf-8?B?TlRFMEovaDZCUEg0WWlEbkNURTJkdlN6MFFnUTM0Nm16MjVBTDM5MXFyNmxk?=
 =?utf-8?B?MzN5REU3TWI2ZWhWQmR2d0p4SzRMeDdZUVdYVjFTS0V6S1JWNm81VEdZcmNx?=
 =?utf-8?B?U1RHUTBtd2dLOXArekJQTUMyL29hV1lJS3djbTBrc1FFazNzVWEyRkNLQnVS?=
 =?utf-8?B?blhjamNNQUV1azdXQ1Q0bnVFdzJYV3FwdnNuaHc3VFB1czNud1prK21la2Jv?=
 =?utf-8?B?NmZ1NmFGVnN2endpdWVVM29aeUxHWXNTV3RyY1hCaGJHK1hNbmM1dTlPaGlp?=
 =?utf-8?B?VlI4VVRuaUtRVUtKd3dxbUE5QzIwcGVRa1B3ekNGak5XVk9lRUwvd0E1Zmlw?=
 =?utf-8?B?TW80cmtrWmRjc0RzNzgyVFFaMVo1OGVHSTFhL1pHbkNnTXNBU0F4WnY3bnFl?=
 =?utf-8?Q?BgnreuxVuQipLmA1oT8e?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5f4197-2b2c-42ff-6167-08dd1a42a06e
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4528.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 00:19:22.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB10640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_161945_719993_F632E1EA 
X-CRM114-Status: GOOD (  14.11  )
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

Ck9uIDIwMjQvMTIvMTIgMDozMiwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IExlIDA5LzEy
LzIwMjQgw6AgMDg6MTIsIENoZW4gV2FuZyBhIMOpY3JpdMKgOgo+PiBGcm9tOiBDaGVuIFdhbmcg
PHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4KPj4gQWRkIGRyaXZlciBmb3IgU29waGdvIFNH
MjA0MiBNU0kgaW50ZXJydXB0IGNvbnRyb2xsZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Cj4gLi4uCj4KPj4gKyNkZWZpbmUgU0cy
MDQyX1ZFQ1RPUl9NSU7CoMKgwqAgNjQKPj4gKyNkZWZpbmUgU0cyMDQyX1ZFQ1RPUl9NQVjCoMKg
wqAgOTUKPgo+IC4uLgo+Cj4+ICtzdGF0aWMgc3RydWN0IGlycV9jaGlwIHNnMjA0Ml9tc2lfbWlk
ZGxlX2lycV9jaGlwID0gewo+Cj4gY29uc3Q/ClllcywgSSB3aWxsIGFkZCB0aGlzIGluIG5leHQg
dmVyc2lvbiwgdGhhbmtzLgo+Cj4+ICvCoMKgwqAgLm5hbWXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ID0gIlNHMjA0MiBNU0kiLAo+PiArwqDCoMKgIC5pcnFfYWNrwqDCoMKgwqDCoMKgwqAgPSBzZzIw
NDJfbXNpX2lycV9hY2ssCj4+ICvCoMKgwqAgLmlycV9tYXNrwqDCoMKgwqDCoMKgwqAgPSBpcnFf
Y2hpcF9tYXNrX3BhcmVudCwKPj4gK8KgwqDCoCAuaXJxX3VubWFza8KgwqDCoMKgwqDCoMKgID0g
aXJxX2NoaXBfdW5tYXNrX3BhcmVudCwKPj4gKyNpZmRlZiBDT05GSUdfU01QCj4+ICvCoMKgwqAg
LmlycV9zZXRfYWZmaW5pdHnCoMKgwqAgPSBpcnFfY2hpcF9zZXRfYWZmaW5pdHlfcGFyZW50LAo+
PiArI2VuZGlmCj4+ICvCoMKgwqAgLmlycV9jb21wb3NlX21zaV9tc2fCoMKgwqAgPSBzZzIwNDJf
bXNpX2lycV9jb21wb3NlX21zaV9tc2csCj4+ICt9Owo+Cj4gLi4uCj4KPj4gK3N0YXRpYyBpbnQg
c2cyMDQyX21zaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+PiAr
wqDCoMKgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgYXJncyA9IHt9Owo+PiArwqDCoMKgIHN0cnVj
dCBzZzIwNDJfbXNpX2RhdGEgKmRhdGE7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDC
oMKgIGRhdGEgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCBzZzIwNDJf
bXNpX2RhdGEpLCAKPj4gR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFkYXRhKQo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gK8KgwqDCoCBkYXRhLT5yZWdfY2xy
ID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiY2xyIik7Cj4+
ICvCoMKgwqAgaWYgKElTX0VSUihkYXRhLT5yZWdfY2xyKSkgewo+PiArwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIG1hcCBjbGVhciByZWdpc3RlclxuIik7Cj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihkYXRhLT5yZWdfY2xyKTsKPj4gK8KgwqDC
oCB9Cj4+ICsKPj4gK8KgwqDCoCBpZiAob2ZfcHJvcGVydHlfcmVhZF91NjQocGRldi0+ZGV2Lm9m
X25vZGUsIAo+PiAic29waGdvLG1zaS1kb29yYmVsbC1hZGRyIiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZkYXRhLT5kb29yYmVsbF9hZGRyKSkgewo+PiArwqDCoMKgwqDC
oMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIHBhcnNlIE1TSSBkb29yYmVsbCBh
ZGRyXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgIH0K
Pj4gKwo+PiArwqDCoMKgIHJldCA9IG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKHBkZXYtPmRl
di5vZl9ub2RlLCAibXNpLXJhbmdlcyIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICIjaW50ZXJydXB0LWNlbGxzIiwgMCwgJmFyZ3MpOwo+PiArwqDCoMKgIGlm
IChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoJnBkZXYtPmRldiwgIlVuYWJsZSB0
byBwYXJzZSBNU0kgdmVjIGJhc2VcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK
Pj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgZGF0YS0+aXJxX2ZpcnN0ID0gKHUzMilhcmdzLmFyZ3Nb
MF07Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChwZGV2
LT5kZXYub2Zfbm9kZSwgIm1zaS1yYW5nZXMiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhcmdzLmFyZ3NfY291bnQgKyAxLCAmZGF0YS0+bnVtX2lycXMpOwo+
PiArwqDCoMKgIGlmIChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoJnBkZXYtPmRl
diwgIlVuYWJsZSB0byBwYXJzZSBNU0kgdmVjIG51bWJlclxuIik7Cj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGlmIChkYXRhLT5pcnFf
Zmlyc3QgPCBTRzIwNDJfVkVDVE9SX01JTiB8fAo+PiArwqDCoMKgwqDCoMKgwqAgKGRhdGEtPmly
cV9maXJzdCArIGRhdGEtPm51bV9pcnFzIC0gMSkgPiBTRzIwNDJfVkVDVE9SX01BWCkgewo+PiAr
wqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAibXNpLXJhbmdlcyBpcyBpbmNvcnJl
Y3QhXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgIH0K
Pj4gKwo+PiArwqDCoMKgIG11dGV4X2luaXQoJmRhdGEtPm1zaV9tYXBfbG9jayk7Cj4+ICsKPj4g
K8KgwqDCoCBkYXRhLT5tc2lfbWFwID0gYml0bWFwX3phbGxvYyhkYXRhLT5udW1faXJxcywgR0ZQ
X0tFUk5FTCk7Cj4KPiBJSVVDLCBudW1faXJxcyBpcyBiZXR3ZWVuIDAgYW5kIChTRzIwNDJfVkVD
VE9SX01BWCAtIAo+IFNHMjA0Ml9WRUNUT1JfTUlOKSAobWF5YmUgKyBvciAtMSkuCj4gU28gYXJv
dW5kIDMyLgo+Cj4gV291bGQgaXQgbWFrZSBzZW5jZSB0byB1c2UgREVDTEFSRV9CSVRNQVAobXNp
X21hcCwgPGNvcnJlY3Rfc2l6ZT4pIGluIAo+IHNnMjA0Ml9tc2lfZGF0YSB0byBhdm9pZCB0aGlz
IGFsbG9jYXRpb24gYW5kIGFuIGluZGlyZWN0aW9uIGF0IHJ1bnRpbWU/CgpUaGlzIGlzIGFsc28g
YSBnb29kIGNob2ljZS4gSSB3aWxsIGRvdWJsZSBjaGVjayB0aGlzLgoKVGhhbmtzLAoKQ2hlbgoK
Pgo+PiArwqDCoMKgIGlmICghZGF0YS0+bXNpX21hcCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRU5PTUVNOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gc2cyMDQyX21zaV9pbml0X2RvbWFpbnMo
ZGF0YSwgcGRldi0+ZGV2Lm9mX25vZGUpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDC
oMKgwqDCoCBiaXRtYXBfZnJlZShkYXRhLT5tc2lfbWFwKTsKPj4gKwo+PiArwqDCoMKgIHJldHVy
biByZXQ7Cj4+ICt9Cj4KPiAuLi4KPgo+IENKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
