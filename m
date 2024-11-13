Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8DD41C0A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kWTSNKp0z+jacNkvn1QmtrQ0Iso+1X7NFUq1OWellQ=; b=ZZKoGiwVMGDaLCQyM/xELoWJLK
	9vMVhCTnONwvMIh+e9CWWRsg2sj47sYGPREer+BY3EzCM6EPDI/h1C/KYBtQ/fOTYkWa7IY0M7XBa
	OoiWh9ldimK78MRYfcMnhiP2ptYwKhduGDoWtnaPrbEUb+RpwF9w2FC0B2kU1p1WCCoffvF/ZFylM
	qQCMdtEXsNZw75vuHgKeRs+XnhDAF+5AnNZf8MrgkL6XOzBjTaWG2Em1V8Uk6R0ewDbx+6SydEZJK
	5RIpDzgEDD3ggGoxM0TGZtJN3svHpbmn+nwPG2Bm/EG9RXm0PF+NAx/CvzMfGfM3l8DFumG3/7AXO
	38CP3XDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB76O-00000005vOL-0AMI;
	Wed, 13 Nov 2024 06:43:44 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB76K-00000005vMJ-3OVX
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 06:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoYoIMBIC4EgxGamUlvJ+Ti+duKRAaODBhMncOB/BN8Rp94LrIxoCBAm444FXwAJtVcjpPTK5ZazkawVUCKg+lJ6OMRC29ymIPJ55W4JX1315FiBfiBhQCFEOncVGhELs5Bq7cvLDjkuD1N9ShqzLW5oZOtObFp3DivYNWxN6bNAW3dy3vvSUvO1oeFxWBruqvkarNsOHwH4rsF+2Dx/zr/s4yzQ4wVqRyAGT8yquZ90/4fHI9bmkTTaeZ09jHIrxlzhgl2mS5dxiae2SzyWyLjV4LMqQV9Ge7IjN4wIw/g+pr7kSTNN88COavRfX2DTO6Wj9VMUeuZrtBlN87JWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nLT50cmzbKuoelNT6OmB6gKOsYGwagSNu4JPQDp9KU=;
 b=tNT4zUs/XWPoGGi4WjCEVDKNFuXQSvczV1smUB48XRPQXITn1zfBw0WT7gx4qgJaiuwEC+cHw450RcRFhe9Q/ntxfWZhUzxyUl3R78teiaEGVBsZxXXCzk5oRscJwndjPD/woImNwnAWU7BjBXBze/zHI3rDhaJv24QPZB8hpRUMr7vCbAiG1pNMS1TdtOY19RjRA7K4g4+dPVOf3tb3KFBO+KcX/bBexG4SvBwBoHLyQrbYkISny4YiN7CJQSatL3Y6fsqImeuZunMOwpfPC8Hf/cuXGvBl1yvFPQppXQzkAxptl6m0zQj6mfXKu1xRc0h+i/0FPe1wVuEVnVCYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nLT50cmzbKuoelNT6OmB6gKOsYGwagSNu4JPQDp9KU=;
 b=b11823fIPvCXsHhomRf1Ag5QwdAuq1E4mu5g9J2xFETQyD6bqdTN9msef/KkLzsGPr3XyXP2GSWAHSSF0vtojfPmX7cXrETAv2t026VkJqfkikQ2wNnYTz5iKac04pw50u9vmMphZVuPcLbm12OJjCmMeeTlNyTjZ5isM7yeYb7OpRN1quatwh9T+JuthnS3GIUdHBbK9mHg1fQX8RxbgjGDa904VHnMOBYwUj+4wov4XwWr1tr6+mmiHz3mw0FXcukXFCd56msFQctcTLJftfMnsmNUnghQSfxykLGSM422dfHtxzQs3DTCL77Be9bnADATR6MI3XeBm7eIqjACRg==
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
 by PN3P287MB0917.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:176::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 06:43:21 +0000
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d]) by PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 06:43:21 +0000
Message-ID: <PN1P287MB28185C9DA26A773775BDC4C6FE5A2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 13 Nov 2024 14:43:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Thomas Gleixner <tglx@linutronix.de>, Chen Wang <unicornxw@gmail.com>,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1731296803.git.unicorn_wang@outlook.com>
 <8076fe2af9f2b007a42c986ed193ba50ff674bfa.1731296803.git.unicorn_wang@outlook.com>
 <87cyizmzhf.ffs@tglx>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <87cyizmzhf.ffs@tglx>
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
X-Microsoft-Original-Message-ID: <51e60288-2bc3-4267-b39d-0f8b90ec8f24@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB2818:EE_|PN3P287MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: 658f539c-1a5b-43b2-5f23-08dd03ae772e
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|6090799003|5072599009|461199028|19110799003|15080799006|7092599003|4302099013|3412199025|440099028|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFMM0h2MGhVdE9KTmFUbjNDQk9NQjRxb0RWVGN2cGFhSnEzL1ZENGFBYWx4?=
 =?utf-8?B?VE41a2V4azVJNUFKYjFIc0tMOS9XWjNzeTkrTjBCdFY0SWRXMUVDV2RRekp4?=
 =?utf-8?B?U3E0TU5NaXdJMjIwdUNPTVJDeHl4M0x2M29uMFUrNTJKSU81dmR2MVl3MlhQ?=
 =?utf-8?B?NmgrZ0JDT0NuUG9MeXJQd0hKRmJhMzRWUC93cXlTSUwvMUY1YUJtaEhQQXBx?=
 =?utf-8?B?ZEttdWFBK2U1aXhDQytlTW1zWGR6QlVVUm1MNFNIZk81SHdtejQzb2NUTTY5?=
 =?utf-8?B?ZFM4OGg1bXNJUmFreHFaMlF2aGdSbktrZW96Y0xWam9qS1VMOUxURStLTFdi?=
 =?utf-8?B?UkYwM1owZkM3eXU2WEJLWmUyakljQWFGWGVCZGVoRlFaaWlDVklVclpWRkQv?=
 =?utf-8?B?YXJ4bFhZWW5kZUMwaTdFVWMxWFZzQVhVNG1EUGMvUXJLOG52SldHcGY1bTls?=
 =?utf-8?B?K0gvdnBlcmJjSU1Wb3RoODJhNnluVXZnUHdDV1VEaGkzcnc2VzNZekR4OWxr?=
 =?utf-8?B?UDZscE53T3ZKK1hUeTdwdEtaSWlvTVRkNXNXM2ZUNnJHMmpTd0s5TUwreTBj?=
 =?utf-8?B?aWkyaVFVOFg4bEZMSno0NktlK1pBbXJPUlBpL1VteTFrZXFyQXgxaGRGRU5F?=
 =?utf-8?B?QVJPVlk3ZXpMUE8vTjdpZmNQUk1YczRSSmZ6V1k1N2hMSDlNMmphTi9QMkkx?=
 =?utf-8?B?ajEwUzRLQ0NXR2lKZWkwM3hEUllQMEx6YTE0QXJhOG9DemoydkJlYUlKMGNT?=
 =?utf-8?B?a1M5V2o3NHVGeHJFbmJWRDEvNldWckFBUXdGcjJRZ3MxZ2hQdUpSNFVvVFAv?=
 =?utf-8?B?dExJamRFRnVnOEJSelF2Ry8wQ0dWMm1tRUlOaGt1NmpybzlCZGRNVTk2eHEv?=
 =?utf-8?B?UE1acmxOOFpTa3ZEM0FlN1FwUjZJekFwQ0RzQ1hHaExQVjVKMzlxVDlYZHhq?=
 =?utf-8?B?ZS9aZFJ6MWxURGpMYkdnd085WkJJTTkrM25EcjYwMVAzN3A5YTFRMitSUmJl?=
 =?utf-8?B?WkJaWXZLVGFmMDAwb0tnYTBvS0IxbUhKMjM0ME5pWW5yWTJoaGxnOTZYb1ls?=
 =?utf-8?B?NUtwSlB1RE1OblR2Qys5dGF2ck8vZkxHbFpOblNNL3d1OGtXQ3p3ZWNrdG9F?=
 =?utf-8?B?cERmdUU3SVhmM2l6Wm1ybURmWkhWRkZicEdod0lId1BJV29NWmRydzc1d05k?=
 =?utf-8?B?QzF3ZEllOFdDMXpPZUV4Mm5aK1JjY0UyT2xzV3BkdGVSaGFRSWsrREhIYU1G?=
 =?utf-8?B?ZnJSaDV1bWpFWFhydkZLdTcycHIvWWh1K2FKbG1HaU8wbHhXUXl2YnZhQ0Ju?=
 =?utf-8?B?Yks5bzh6ak5mMmVtbTNTeURveHRhY2hHQ3VLRHFzNVVZQlNoYUlwZGVuQ1Zt?=
 =?utf-8?B?NkRPQ29mRStFMXNWdTVMOEVsczdab1k0MzB3UzhRc0czVHpCWUhiaktCQ3l1?=
 =?utf-8?B?dTFwZTMrdFFZb2JsSXoxbWhJRTkxL05mYlZKdFdJeDRJbGlmcTlXOGJlOGdm?=
 =?utf-8?B?Q0dQbWpIeFdsdm5mQ1BXVEd3V0ptWVhVRUVNYUg3SXF1OUYvL1g1ZUwvTUtv?=
 =?utf-8?Q?fat9P0wmXtUH2OgC7Rt8rTmfYDGV4JGGbBg/btdauzHito?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0ZocEhxRXFtM0JncEttQy9sT1pLRUQ5R2ZWZk9MWTZIcGxneTlhYVlUeWU4?=
 =?utf-8?B?NHRmRFp3YVU1KytFU3JzcW1ZMnhTa0hheVpwVkdnWVg4Q29HTk1Ub3pUQmRl?=
 =?utf-8?B?azJHUHRNaUF1ZTRDeWV1TjdnSHI3LzdWc0h2dXQ5Rm9RcFpBanNWd2FJTVdC?=
 =?utf-8?B?dFkxYW9LdFlzYWUrc0RRaURWWEVESmFUajI5d2xkUk50VEN3RmlnWUp0UlE0?=
 =?utf-8?B?b0c3ZUFaV1pWeHBibUtFYy9ESXNiclhUd1FsbW5uTWZGQ25LMVVqV2hkVkha?=
 =?utf-8?B?M1l5WTQraitkZzlzMm1jZmtBamxaakpZV01NV3p2aWNxOWRFU0UrRXdUa2xy?=
 =?utf-8?B?WWg5RVdMYXNjM001bVlaRWhwbVFnQ1BuM002OVdrMHRSbFFRZURqZy8weUlS?=
 =?utf-8?B?aGMxcnhVZitSVzlFcmJBU0RNVVIvcHpldTREMXQ1Yk9vOGc4UWVjdGFGSy9P?=
 =?utf-8?B?WTY3SXVDNEFOUVN3aW9Xa3R5MUgvMTd6ZmVrMjdiMnNkY3VuWi9CbmVFWmVq?=
 =?utf-8?B?dy9SRVFHSE05V0RhbWI1ODh5SjUxK1ZFZy9mZzRKcDFrTGN4OXhyN2NJSzU5?=
 =?utf-8?B?ODgvaGZQSDB6dncwMVFmTEFYaHhXVGZtWDVOUmM5citoVGN5bkViSUdUYUFT?=
 =?utf-8?B?Zys5QjZnRm0xa3FxZTZrcSs1SUx3Ym1LQUZmTFcyUktuUUJkSGIxZXkvWW9H?=
 =?utf-8?B?UEFVSHpvTS9PUWNzUUZCb3ptTmlKdG1DR0lSMXRyU0JZQzMvNUZ6MHp0WXdV?=
 =?utf-8?B?ZlB0R2R3VmpMTTVRT0RDWEI3T0IrN0lPWC9URTVkUHEvNjlTMWttNXdVN1VF?=
 =?utf-8?B?c2pZZ1hjRmhrbDVBd3owWlM4ZS9UaG8yTEdneWtKSEpoMkpiZC9UK3FFVUdV?=
 =?utf-8?B?Y0ZKeGlLOVlsTlV0TXU0OFhyK2pLV2VMYUdHTHhUbHdibjZuZTI3dXB3bGRG?=
 =?utf-8?B?WHY4YnQzTFFnSkI3ZHBTbVpwUVJqdktUOE4vTjRFWWxkVC8zYXh2SnRpa2RL?=
 =?utf-8?B?MlJCaXJpd2g3LzBjSGZSNUc2R1dhaHM4M243ZlYweURJQ3VaT2s4RFpNaytm?=
 =?utf-8?B?amFOakZOM2FIRENCMmhHTFV4QkZKVVlodU8xTFZDWUw2NDJvSWxCcW9BYjFH?=
 =?utf-8?B?b3pCK0pZYVlFaHJnUURmYTVsVlBhODlUMTVaQ28vTFFva2ZiQW1adnBJUEJi?=
 =?utf-8?B?T1BIRFVBR2RaRDNCcnFtVStUTVpXZnEzaklNeGlMMnhrWHJwMFdDNWVneE5j?=
 =?utf-8?B?MUJiMHUxZFh6NkRNL3FSdFBQeXZxN3BkcElVanlsK3luTks5RGNxWDRoaFls?=
 =?utf-8?B?UlA5VmlCcTcyYWpIcWZybkk3Ukl2cG83Qnp4V0k4dEVlaVBkdFZmTHhmUjZR?=
 =?utf-8?B?anhpUzc2a1VMTWQrbkVwekd2L1RtaDRtL0pEUjU4UUdDaFNtUHdvSHExak5r?=
 =?utf-8?B?ODNKTVpLT2FTWjNKVXM5SXNlMTVpUUh0aHc3ZmJ4bXRkRG1FbUt0MDd3RDZx?=
 =?utf-8?B?SXFqd1pkWmRvV3lsL1NwOG1uT0Y3T1ZQb1o0WTU4V2lSam9nY0NDN09IQXdZ?=
 =?utf-8?B?ZWIzUm5tQUNZdEI5RkUxVjNxN2RlVEpSa3BIRVdEekVtcjZIVFhMUWVjYjdD?=
 =?utf-8?B?UVp5OFcwQmNuaEw1WEdtMmtvU0VKbkh3cTZyVEI2cWFhQ256a2ZIUGQwdFow?=
 =?utf-8?Q?70mp3o17GTZ95tyXKFFL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658f539c-1a5b-43b2-5f23-08dd03ae772e
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 06:43:21.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_224341_097193_E21B7AB0 
X-CRM114-Status: GOOD (  23.74  )
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

Ck9uIDIwMjQvMTEvMTMgMTQ6MTQsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBNb24sIE5v
diAxMSAyMDI0IGF0IDEyOjAxLCBDaGVuIFdhbmcgd3JvdGU6Cj4+ICtzdHJ1Y3Qgc2cyMDQyX21z
aV9kYXRhIHsKPj4gKwl2b2lkIF9faW9tZW0JKnJlZ19jbHI7IC8qIGNsZWFyIHJlZywgc2VlIFRS
TSwgMTAuMS4zMywgR1BfSU5UUjBfQ0xSICovCj4gUGxlYXNlIG1ha2UgdGhlc2UgdGFpbCBjb21t
ZW50cyB0YWJ1bGFyIGFsaWduZWQgc28gdGhleSBhY3R1YWxseSBzdGFuZAo+IG91dC4KPgo+ICAg
IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvbWFpbnRhaW5l
ci10aXAuaHRtbCNjb21tZW50LXN0eWxlCkdvdCwgd2lsbCBmaXggdGhpcy4KPj4gKwo+PiArCXU2
NAkJZG9vcmJlbGxfYWRkcjsgLyogc2VlIFRSTSwgMTAuMS4zMiwgR1BfSU5UUjBfU0VUICovCj4+
ICsKPj4gKwl1MzIJCWlycV9maXJzdDsgLyogVGhlIHZlY3RvciBudW1iZXIgdGhhdCBNU0lzIHN0
YXJ0cyAqLwo+PiArCXUzMgkJbnVtX2lycXM7ICAvKiBUaGUgbnVtYmVyIG9mIHZlY3RvcnMgZm9y
IE1TSXMgKi8KPj4gKwo+PiArCXVuc2lnbmVkIGxvbmcJKm1zaV9tYXA7Cj4+ICsJc3RydWN0IG11
dGV4CW1zaV9tYXBfbG9jazsgLyogbG9jayBmb3IgbXNpX21hcCAqLwo+PiArfTsKPj4gKwo+PiAr
c3RhdGljIGludCBzZzIwNDJfbXNpX2FsbG9jYXRlX2h3aXJxKHN0cnVjdCBzZzIwNDJfbXNpX2Rh
dGEgKnByaXYsIGludCBudW1fcmVxKQo+PiArewo+PiArCWludCBmaXJzdDsKPj4gKwo+PiArCW11
dGV4X2xvY2soJnByaXYtPm1zaV9tYXBfbG9jayk7Cj4gUGxlYXNlIHVzZQo+Cj4gICAgICAgICBn
dWFyZChtdXRleCkoJnByaXYtPm1zaV9tYXBfbG9jayk7Cj4KPiB3aGljaCByZW1vdmVzIGFsbCB0
aGUgbXV0ZXhfdW5sb2NrKCkgaGFja2VyeSBhbmQgYm9pbHMgdGhpcyBkb3duClRoYW5rcywgd2ls
bCBkb3VibGUgY2hlY2suCj4KPj4gKwo+PiArCWZpcnN0ID0gYml0bWFwX2ZpbmRfZnJlZV9yZWdp
b24ocHJpdi0+bXNpX21hcCwgcHJpdi0+bnVtX2lycXMsCj4+ICsJCQkJCWdldF9jb3VudF9vcmRl
cihudW1fcmVxKSk7Cj4+ICsJaWYgKGZpcnN0IDwgMCkgewo+PiArCQltdXRleF91bmxvY2soJnBy
aXYtPm1zaV9tYXBfbG9jayk7Cj4+ICsJCXJldHVybiAtRU5PU1BDOwo+PiArCX0KPj4gKwo+PiAr
CW11dGV4X3VubG9jaygmcHJpdi0+bXNpX21hcF9sb2NrKTsKPj4gKwo+PiArCXJldHVybiBwcml2
LT5pcnFfZmlyc3QgKyBmaXJzdDsKPiB0bwo+Cj4gCWd1YXJkKG11dGV4KSgmcHJpdi0+bXNpX21h
cF9sb2NrKTsKPiAJZmlyc3QgPSBiaXRtYXBfZmluZF9mcmVlX3JlZ2lvbihwcml2LT5tc2lfbWFw
LCBwcml2LT5udW1faXJxcywKPiAJCQkJCWdldF9jb3VudF9vcmRlcihudW1fcmVxKSk7Cj4gCXJl
dHVybiBmaXJzdCA+PSAwID8gcHJpdi0+aXJxX2ZpcnN0ICsgZmlyc3QgOiAtRU5PU1BDOwo+Cj4g
U2VlPwo+Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHNnMjA0Ml9tc2lfZnJlZV9od2lycShz
dHJ1Y3Qgc2cyMDQyX21zaV9kYXRhICpwcml2LAo+PiArCQkJCSAgaW50IGh3aXJxLCBpbnQgbnVt
X3JlcSkKPj4gK3sKPj4gKwlpbnQgZmlyc3QgPSBod2lycSAtIHByaXYtPmlycV9maXJzdDsKPj4g
Kwo+PiArCW11dGV4X2xvY2soJnByaXYtPm1zaV9tYXBfbG9jayk7Cj4gRGl0dG8uCj4KPj4gKwli
aXRtYXBfcmVsZWFzZV9yZWdpb24ocHJpdi0+bXNpX21hcCwgZmlyc3QsIGdldF9jb3VudF9vcmRl
cihudW1fcmVxKSk7Cj4+ICsJbXV0ZXhfdW5sb2NrKCZwcml2LT5tc2lfbWFwX2xvY2spOwo+PiAr
fQo+PiArc3RhdGljIHZvaWQgc2cyMDQyX21zaV9pcnFfY29tcG9zZV9tc2lfbXNnKHN0cnVjdCBp
cnFfZGF0YSAqZGF0YSwKPj4gKwkJCQkJICAgc3RydWN0IG1zaV9tc2cgKm1zZykKPj4gK3sKPj4g
KwlzdHJ1Y3Qgc2cyMDQyX21zaV9kYXRhICpwcml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2Rh
dGEoZGF0YSk7Cj4+ICsKPj4gKwltc2ctPmFkZHJlc3NfaGkgPSB1cHBlcl8zMl9iaXRzKHByaXYt
PmRvb3JiZWxsX2FkZHIpOwo+PiArCW1zZy0+YWRkcmVzc19sbyA9IGxvd2VyXzMyX2JpdHMocHJp
di0+ZG9vcmJlbGxfYWRkcik7Cj4+ICsJbXNnLT5kYXRhID0gMSA8PCAoZGF0YS0+aHdpcnEgLSBw
cml2LT5pcnFfZmlyc3QpOwo+PiArCj4+ICsJcHJfZGVidWcoIiVzIGh3aXJxWyVkXTogYWRkcmVz
c19oaVslI3hdLCBhZGRyZXNzX2xvWyUjeF0sIGRhdGFbJSN4XVxuIiwKPj4gKwkJIF9fZnVuY19f
LAo+IE5vIHBvaW50IGluIGhhdmluZyB0aGlzIGxpbmUgYnJlYWsuIFlvdSBoYXZlIDEwMCBjaGFy
YWN0ZXJzLiBQbGVhc2UgZml4Cj4gdGhpcyBhbGwgb3ZlciB0aGUgcGxhY2UuCkdvdC4KPgo+PiAr
CQkgKGludClkYXRhLT5od2lycSwgbXNnLT5hZGRyZXNzX2hpLCBtc2ctPmFkZHJlc3NfbG8sIG1z
Zy0+ZGF0YSk7Cj4gKGludCkgPyBXaHkgY2FuJ3QgeW91IHVzZSB0aGUgcHJvcGVyIGNvbnZlcnNp
b24gc3BlY2lmaWVyIGluc3RlYWQgb2YgJWQ/CldpbGwgZG91YmxlLWNoZWNrLgo+Cj4+ICtzdGF0
aWMgaW50IHNnMjA0Ml9tc2lfbWlkZGxlX2RvbWFpbl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbiAq
ZG9tYWluLAo+PiArCQkJCQkgIHVuc2lnbmVkIGludCB2aXJxLAo+PiArCQkJCQkgIHVuc2lnbmVk
IGludCBucl9pcnFzLCB2b2lkICphcmdzKQo+PiArewo+PiArCXN0cnVjdCBzZzIwNDJfbXNpX2Rh
dGEgKnByaXYgPSBkb21haW4tPmhvc3RfZGF0YTsKPj4gKwlpbnQgaHdpcnEsIGVyciwgaTsKPj4g
Kwo+PiArCWh3aXJxID0gc2cyMDQyX21zaV9hbGxvY2F0ZV9od2lycShwcml2LCBucl9pcnFzKTsK
Pj4gKwlpZiAoaHdpcnEgPCAwKQo+PiArCQlyZXR1cm4gaHdpcnE7Cj4+ICsKPj4gKwlmb3IgKGkg
PSAwOyBpIDwgbnJfaXJxczsgaSsrKSB7Cj4+ICsJCWVyciA9IHNnMjA0Ml9tc2lfcGFyZW50X2Rv
bWFpbl9hbGxvYyhkb21haW4sIHZpcnEgKyBpLCBod2lycSArIGkpOwo+PiArCQlpZiAoZXJyKQo+
PiArCQkJZ290byBlcnJfaHdpcnE7Cj4+ICsKPj4gKwkJcHJfZGVidWcoIiVzOiB2aXJxWyVkXSwg
aHdpcnFbJWRdXG4iLAo+PiArCQkJIF9fZnVuY19fLCB2aXJxICsgaSwgKGludClod2lycSArIGkp
Owo+IE5vIGxpbmUgYnJlYWsgcmVxdWlyZWQuCj4KPj4gKwkJaXJxX2RvbWFpbl9zZXRfaHdpcnFf
YW5kX2NoaXAoZG9tYWluLCB2aXJxICsgaSwgaHdpcnEgKyBpLAo+PiArCQkJCQkgICAgICAmc2cy
MDQyX21zaV9taWRkbGVfaXJxX2NoaXAsIHByaXYpOwo+PiArCX0KPj4gK3N0YXRpYyBpbnQgc2cy
MDQyX21zaV9pbml0X2RvbWFpbnMoc3RydWN0IHNnMjA0Ml9tc2lfZGF0YSAqcHJpdiwKPj4gKwkJ
CQkgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4+ICt7Cj4+ICsJc3RydWN0IGlycV9kb21h
aW4gKnBsaWNfZG9tYWluLCAqbWlkZGxlX2RvbWFpbjsKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBsaWNfbm9kZTsKPj4gKwlzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlID0gb2Zfbm9kZV90
b19md25vZGUobm9kZSk7Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3Qv
cHJvY2Vzcy9tYWludGFpbmVyLXRpcC5odG1sI3ZhcmlhYmxlLWRlY2xhcmF0aW9ucwpUaGFua3Ms
IHdpbGwgZG91YmxlLWNoZWNrLgo+PiArCWlmICghb2ZfZmluZF9wcm9wZXJ0eShub2RlLCAiaW50
ZXJydXB0LXBhcmVudCIsIE5VTEwpKSB7Cj4+ICsJCXByX2VycigiQ2FuJ3QgZmluZCBpbnRlcnJ1
cHQtcGFyZW50IVxuIik7Cj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCX0KPj4gKwo+PiArCXBs
aWNfbm9kZSA9IG9mX2lycV9maW5kX3BhcmVudChub2RlKTsKPj4gKwlpZiAoIXBsaWNfbm9kZSkg
ewo+PiArCQlwcl9lcnIoIkZhaWxlZCB0byBmaW5kIHRoZSBQTElDIG5vZGUhXG4iKTsKPj4gKwkJ
cmV0dXJuIC1FTlhJTzsKPj4gKwl9Cj4+ICsKPj4gKwlwbGljX2RvbWFpbiA9IGlycV9maW5kX2hv
c3QocGxpY19ub2RlKTsKPj4gKwlvZl9ub2RlX3B1dChwbGljX25vZGUpOwo+PiArCWlmICghcGxp
Y19kb21haW4pIHsKPj4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gZmluZCB0aGUgUExJQyBkb21haW5c
biIpOwo+PiArCQlyZXR1cm4gLUVOWElPOwo+PiArCX0KPj4gKwo+PiArCW1pZGRsZV9kb21haW4g
PSBpcnFfZG9tYWluX2NyZWF0ZV9oaWVyYXJjaHkocGxpY19kb21haW4sIDAsIHByaXYtPm51bV9p
cnFzLAo+PiArCQkJCQkJICAgIGZ3bm9kZSwKPj4gKwkJCQkJCSAgICAmcGNoX21zaV9taWRkbGVf
ZG9tYWluX29wcywKPj4gKwkJCQkJCSAgICBwcml2KTsKPiBTbyBub3cgeW91IGhhdmUgY3JlYXRl
ZCBhIGRvbWFpbi4gSG93IGlzIHRoYXQgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUKPiBQQ0kg
bGF5ZXI/CgpIZXJlIEkgY3JlYXRlIHRoZSBkb21haW4gYW5kIGF0dGFjaGVkIGl0IHRvIHRoZSBm
d25vZGUuIEluIFBDSSBkcml2ZXIsIAppdCBjYW4gc2V0IHRoaXMgbXNpIGNvbnRyb2xsZXIgYXMg
aXRzICIiaW50ZXJydXB0LXBhcmVudCIgYW5kIGZpbmQgdGhlIApkb21haW4gYXR0YWNoZWQgYXMg
YmVsb3c6CgpzdGF0aWMgaW50IHBjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKewogwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiDCoMKgwqAgcGFy
ZW50X25vZGUgPSBvZl9pcnFfZmluZF9wYXJlbnQoZGV2LT5vZl9ub2RlKTsKIMKgwqDCoCBwYXJl
bnRfZG9tYWluID0gaXJxX2ZpbmRfaG9zdChwYXJlbnRfbm9kZSk7CiDCoMKgwqAgLi4uCn0KCj4+
ICsJaWYgKCFtaWRkbGVfZG9tYWluKSB7Cj4+ICsJCXByX2VycigiRmFpbGVkIHRvIGNyZWF0ZSB0
aGUgTVNJIG1pZGRsZSBkb21haW5cbiIpOwo+PiArCQlyZXR1cm4gLUVOT01FTTsKPj4gKwl9Cj4+
ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gK3N0YXRpYyBpbnQgc2cyMDQyX21zaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+IC4uLi4KPgo+PiArCWRhdGEtPm1z
aV9tYXAgPSBiaXRtYXBfemFsbG9jKGRhdGEtPm51bV9pcnFzLCBHRlBfS0VSTkVMKTsKPj4gKwlp
ZiAoIWRhdGEtPm1zaV9tYXApCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJcmV0dXJu
IHNnMjA0Ml9tc2lfaW5pdF9kb21haW5zKGRhdGEsIHBkZXYtPmRldi5vZl9ub2RlKTsKPiBJbiBj
YXNlIG9mIGVycm9yIHRoaXMgbGVha3MgZGF0YS0+bXNpX21hcCwgbm8/ClRoYW5rcywgSSB3aWxs
IGNvcnJlY3QgdGhpcy4KPj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNnMjA0Ml9t
c2lfZHJpdmVyID0gewo+PiArCS5kcml2ZXIgPSB7Cj4+ICsJCS5uYW1lID0gInNnMjA0Mi1tc2ki
LAo+PiArCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoc2cyMDQyX21zaV9vZl9tYXRj
aCksCj4+ICsJfSwKPj4gKwkucHJvYmUgPSBzZzIwNDJfbXNpX3Byb2JlLAo+PiArfTsKPiBQbGVh
c2Ugc2VlIHRoZSBkb2N1bWVudGF0aW9uIEkgcG9pbnRlZCB5b3UgdG8gYWJvdmUgYW5kIHNlYXJj
aCBmb3IKPiBzdHJ1Y3QgaW5pdGlhbGl6ZXJzLgo+Cj4gVGhhbmtzLAo+Cj4gICAgICAgICAgdGds
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
