Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE75C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/Ga80JbUKc6+Ehqfc0BX1jnIXkFENAS5p36Iz67e+g=; b=uwz3y3Rpyj1miym+bTaNZ9YUmA
	kRjhAzVDJZP+fqJSTtE6FuHo4e9tJF6+82QlLQxllEO0lZulIA7yP6y3epMbtPlMOAiKEqGk88AIn
	KA+pOpdDzD92mVlFYJNmnBVlr5iFJXPbogQDPW2W0QI8JXZiOlg7owFKxSW+21YKRhmPZmZBx67AV
	2DTeKXpMVcPZBIhQoeHQvJYhdiSz9huJV0nzIHo48iPk+d3mBDUv/rTo5mmvZcfwhMDgj/cbt8Od/
	coKmOKHcbBspiFcgCAcgVorI7Z1BsCODdOcKhEWqKK5bP33gY+JtuJV/mlvHomK92b6sNwasr+B6P
	NYD++fWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZK6-0000000A6S2-0tLK;
	Wed, 22 Jan 2025 11:55:06 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taZK2-0000000A6Rd-3pUs
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 11:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjgVxHKKcTRUWP+Ee4IYh1jMtkeIqOX7uIeBiZh4LPVQxXpTXXpwfQSy4RIUW2Lu6auN4P6STUglxIn4Qjet1OfVdcQLns0EBUzB/bCBgw5RJbpCDiQK11VopTdgff1vGqDhsOqB5Zh4mO3E7ylLS2VH+oHOxabT/GqUddolRrrMs6pj42EPT7Ylv6j9lW8LVYA7jmsKsDCVkLAdWVa4zKvPjqGCT/fSVdamLjAzJuSm4BZIziuzvLGDcRktrAMM9RdZFrtFz0wIisart5YdSQPYa4S58DvJYyEKah7SfyUeTta0XIhTa3n3lwNcQs9nyhJ86TqR+FkGt+43pj+xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM6OGmD1HQtdBW3KLIqL1m0iPbrjo9MCMSvwY6w8Ofs=;
 b=wbBVPd+/Bb8smAXZwykxG7Cdtq+2Nza4yMLpydg/rj2BntIoND5a1VejyzCNsqz7OgSYrldpQbrnpu2ef0WZp+T1K7BB/QSUdBqH1Oa6baaIz5avyyFnmSQ2KYHFKUmx+zVXCPPuLYeTlGpDKRzQ95Av6q2JFjru21LyqbzFM8Jdm2lb7U2518mYtfw9BBvzzyLOsQI0Zrh0alXeyDncM0BWsam3wCn9LRGgmAfS6qDr7zOeWwTRjdRDPfDtOEYhxk0dAa4ygt3yw/a772yFODfkdXO7rb3WgZg+MjN1WnCB7E0WKG14KNhU58ix9MqgAP0xJEXPWtPZxHyi1AuRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM6OGmD1HQtdBW3KLIqL1m0iPbrjo9MCMSvwY6w8Ofs=;
 b=pc1qFeu95TwQKSC5BA58+VjlokX4dp4hKby4ijk8jh7P9ZmDb6eQRu0fipQ3AtbCns34zqR+YxtRiu/Oxi3M6N4GIruc4ODC/YunlzfJXYlsZXqBpHkHitsDzkLCyfLJb9vByHXK6GJR3gBXaQPia70A+oeS7md5ncBvV707AJbdNSkB4/iZTNDEe27Fzmeb35MfywTi5dClETPWBLzXzQEtAChXPV3zPZ/gHChQkDBGUb+CvRjYQR2rpOpW0cBPjCDiiRqjeveLiCSqwiIBybXidvg1iNbmya3v0/oCPKUM9qCaxGhsFJCPIbX0tbstjMRU+G9fPNZSCuE5zczM7A==
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:44::15)
 by PN2PR01MB9672.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:152::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 11:54:31 +0000
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869]) by BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 11:54:31 +0000
Message-ID: <BM1PR01MB254554818778F4EC9449EC68FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 22 Jan 2025 19:54:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com,
 Sean Young <sean@mess.org>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
 <4a7db3ecac9ac2b00c063360334834d6656672e3.1733281657.git.unicorn_wang@outlook.com>
 <e2we4klv7w234zyc4vnbcydieyhcte63sdwcp43vmolmlasv5f@scsiepnnw3db>
 <BM1PR01MB2545319120D9B3932C8C8806FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
 <dlnfivdhol7faotaqygpvdi2zbgpwrvcruppbkgfleoa6msxib@voe7dhqvfmy6>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <dlnfivdhol7faotaqygpvdi2zbgpwrvcruppbkgfleoa6msxib@voe7dhqvfmy6>
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:44::15)
X-Microsoft-Original-Message-ID: <ff003ea8-e668-4278-bf0f-1b73b0c4df2f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BM1PR01MB2545:EE_|PN2PR01MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb60b58-9c36-46f5-8a24-08dd3adb8807
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|7092599003|461199028|5072599009|19110799003|15080799006|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkFxQzhxVkFaNndxWEZtTnhrY3pyQXowa25lNFpIQ0s1OURZREo1TS8vTEZa?=
 =?utf-8?B?QUNTdUZEdXFXRy9OWVlTcFVKSWpSamJjcWhxZ1d3ajRFM2t0ODEyZmRvRVpD?=
 =?utf-8?B?dlplR3U4UUpoN003UFUvSFY4eElKRGw1SGQxRFplNk4vOS9DUExrVE9FMFZV?=
 =?utf-8?B?cHVpbXFWTWlUQ3lkL0xvUlNWUnl2bUJjRnE3M1k2STQzUGppOEc0RVBEbDFL?=
 =?utf-8?B?dDh2eGt1TkE2WTA0TjVWcHUzK0FKbUdjY1pUZnZUelo4eElLZDhjOXhOS2M5?=
 =?utf-8?B?WVEzeThKNSs5a2F6QXVZR2xRRjJqTy9HTTJWbjEzeVVvRk0vV045VTk1czdp?=
 =?utf-8?B?OHpDQWFtaENkTmo3VFMxS3RZeElqZldadWpxQXNkaW0vb25aNlZqWjBBUERW?=
 =?utf-8?B?RGcrZGR0a0tnZlg3SUwxTmpOd1BCWG0zQzJOazMzS2hickYrTlhxTWhZa0wv?=
 =?utf-8?B?cFhiQ3hTaFNQMFUxdW92U3p5bkxUOXQ4TUYyRnU5N0I0MkVWRVZ1dW96bDFw?=
 =?utf-8?B?cUlvaS9iRk9ES0F2UUttZkdBRUVTMWxGRWpZZ0VpazNGSEZJcm9LVWRmcFlh?=
 =?utf-8?B?TDduZFJpQjE0OWF2cTdLZEg0NWVhVWlvUHVLbVhVSWx6K1FROFRuT2JOcVky?=
 =?utf-8?B?WTVmWkZ2ZkQ1TTVoRzBqMEJnR082Z0Z6YVBTbDRwZUxJTDhxU2I1OVNRbW12?=
 =?utf-8?B?VmtCZWZVT2ExdDAzRFd1WjZIZW5JNk1Sb0RIbmFsVTlYK2VJaGZvR3dQNEl3?=
 =?utf-8?B?Z203TlQzeUt3dWZnSyt5WkhneGIrQlNSbDdvSnZHZzgrQlpHUm1ENVF4Y1ZN?=
 =?utf-8?B?OUZubTQ3MHJlakdwV1RZZHdHUW01VSsvV29XbDhMUW9ySmJxVTJFRzlaQXpS?=
 =?utf-8?B?UzFWSmVMc0tqejZtZ3hobDdzSkpRcGR4UUtsVzQwaTZCUHhuUGVhUTk4NmdR?=
 =?utf-8?B?WnFROEZ6RG85WThmM3FYR2dpS05FNExuYkphdm4rbEJBTGtNdDRpUkpIVjRN?=
 =?utf-8?B?SkhBNFV3R1NKajhObjZpZWRSZVV2WlJtQnNpM1hQK1RleUs4RkpFRDhGd3Vv?=
 =?utf-8?B?VUxYdlluS0V5MkZvaTBiNGFHdXZBWm5URzhWVWNCaE0zdWRubkdLY2g0Ym83?=
 =?utf-8?B?ZkZPTzVWN3ZTSXgzZW5uaUhJYU1jVC9kYS9Nb2ZSdllTdGxtRkJ3SE43akFY?=
 =?utf-8?B?Zmk4OXZlMDRYME9ET2JUNG1BMzc2VjVuNm83MmRaRzFhR1M2YXNuSU5UejJj?=
 =?utf-8?B?SVgxOEMrS1FUWjVVU01WV1RmSEtPb01vbjlrdkF4RHNEdXRpZUtndmpTcE9r?=
 =?utf-8?B?OWs0YlU3RjF3NWphcGZkVWJyd2ZFdmZMTi9XaUpGcElYbklnTGpmMXgzQURa?=
 =?utf-8?B?N2xHZlB1ZFcyRUJJOEovUTJWeGFSSkpUeHFqU3BNYTJCRVVWcTBjTlhVK2Rm?=
 =?utf-8?B?T1cxVjNtS0Z2WmU2aGx0cnpkUmJ3S0szbTV6SFVaaC90UDdaVE50YzNrWGhz?=
 =?utf-8?Q?y/0IKE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFkNzhvU2M2d3hCMTJuamZFdkJURXZzV0VranpydXhqR2YvbHhReGwvU3lY?=
 =?utf-8?B?cHVnTmVacTRPQWZYZmVSdmpSSU5MQW9zQmtWdUs4c1FQT3hlT01qMDNyYzRF?=
 =?utf-8?B?eEZOLzBkSnZaZFo2ODRSR2J0NTNhQVRGMnIyYVpEQ0ZmRjBGMFd1TFZSSCsv?=
 =?utf-8?B?R3Joanl6Z21kQ0tOTThoWXFRQW1SeHJTS3dXa2xGcmNINWhxTmhtK0dualp1?=
 =?utf-8?B?SXE0enlXNTVhMEU0NVpwN1VtN2JiaFphK2xWRWtPMlRUdWRUaDhXc3Jhazc3?=
 =?utf-8?B?K3V4elJNVG50TERmYW55eXcxK3NzbDJoOTBLNEtPckZ0eUxKZTI5ZE9zYUVp?=
 =?utf-8?B?TUFFVzBEMmNtWGgyN0hBY05WeVN5K0Y1TGlaOEdhV0VMZDBkbzV0ZTVTZVpE?=
 =?utf-8?B?a1J5ZEpPbFd1d1FGRmZlYUhjQmVkZ0IvTzNuV2hxZ2tvL0dFVjRQdnFpeHpn?=
 =?utf-8?B?djdQZ2NuT1Q2SVN4OGhxNitHQUV3WXJwalRVZjhoRHV6ZkZZQ3F1N1k0TnVT?=
 =?utf-8?B?OUJPRkREcHpKUnRhVEhiR3FqY2UyZ3N5WUdsdUJCQmQ1Ui9LdGUvMnd2dVdJ?=
 =?utf-8?B?YjB6TUpyM0JxaDZyY2M3VXhpWnVRY0UrS0xtN0xsSjFRRGx0QmxxZ2JGcWZZ?=
 =?utf-8?B?dEgyb0gvcm0xUWxQT3V6WGVtcVpLS3NvR2lnaVdGRWhzUlp6b3o3SldhdFNZ?=
 =?utf-8?B?dmZlU1lWVlgwcVdqRVNlTTNXdkg4MlVoV3QyNjU5LzhhYVk3a08wWDF0V3Zm?=
 =?utf-8?B?am53ZjNKY2dRRmhFRzFZcXVIYXpuSXZSeVNEUFNZZ2FIRkZCQlNRRnFCdkZ5?=
 =?utf-8?B?NVVjeVhyMGNtME54UmhPeDJhMjhGWlBZelhZT2dwekc1dkFqRDlxaXZNNFhO?=
 =?utf-8?B?WGl4ZmRYNjkwa3RDaXd0bndZemVlYU1tclN6MU92U1lnOTlDaHA4SUFzaXEw?=
 =?utf-8?B?MTZmUmxYejNPZE9nbGtkUjIzU1ZBYm1yVDVHbEZmamZwc3haaTFiaHNrOG5L?=
 =?utf-8?B?WWJqRHFiSUlyaDJzdGhUK253R0NaSHZRN1A4WVl2V3JPWnZmVzd2ek92cVM3?=
 =?utf-8?B?R3Y1Z0xPMklyM0tZVnZjOGE3eTZyRStydzZWOHZuNXdudzlKdU5UUWZIaStV?=
 =?utf-8?B?RXRmdnlzNm9tS3lVRllmc1M3S1UwY0VMVzRiYllBaHg1MmkxczVOSFBmMHMx?=
 =?utf-8?B?NWVZcm5qaHFmSWJBU1NpZGJ6NzV5WUNlZG5zSXNHNVFpVTJDU00ycmJyMUVQ?=
 =?utf-8?B?eWlMS2pIZG1MU0hGS2ZFVmNJY3V3c2lITFk0N3I1QnEyaU54c2NVbXdnZjMr?=
 =?utf-8?B?eDRZVHpENnBJVTRkWHRiRXA4V3NleWI5bDQ3c21OWFJUSFppTmdPNXg4SDRv?=
 =?utf-8?B?VU9GdXpOVU5heDRUNERsdW5BU1RGcU9meXBibVlxUERXWVYzUE5HNHJha0FD?=
 =?utf-8?B?VFdxczM0VHhKTnZvdVFvVzRzL1BHOGYwdjdORFpaZ2hoM1BGaVJMZC9BYk00?=
 =?utf-8?B?M25pQTF3eWZTdzBiUFFOMmhRRThvOHBnZnhTVFdvYzRaMVprRmNMY09PVW4z?=
 =?utf-8?B?SXM5Y0N3RTQ5UVFCZUl5YnNEQnBjajJNR1JhZEcybHE4R3Y3QmRWM0diTjln?=
 =?utf-8?B?ZkNGbWZPMUFCbFN1di9ER3UxbXowdTJReEF5c1F5M09DTndORWNUVzlQaG1v?=
 =?utf-8?B?bTFQZzhKM29DQ1hxa2lEc3ZxNVlNR0V4QUxJUGZGbk9LcUNmcnl5MDk2VUFS?=
 =?utf-8?Q?w9xcbIyaMxhUl9N9Iwu8P9IYbt0SC6qUDS0uHbm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb60b58-9c36-46f5-8a24-08dd3adb8807
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:54:31.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_035502_948833_32B122B9 
X-CRM114-Status: UNSURE (   5.45  )
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

Ck9uIDIwMjUvMS8yMiAxODowMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhlIHJhdGlv
bmFsIGlzIHVzdWFsbHkgdGhhdAo+Cj4gCW11bF91NjRfdTY0X2Rpdl91NjQoZGRhdGEtPmNsa19y
YXRlX2h6LCBzdGF0ZS0+cGVyaW9kLCBOU0VDX1BFUl9TRUMpCj4KPiBjYW5ub3Qgb3ZlcmZsb3cu
IFlvdXIgZHJpdmVyIHJlbGllcyBvbiB0aGF0LCB0b28uIChXaGljaCBzb21ld2hhdAo+IHByb3Zl
cyB0aGF0IGEgY29tbWVudCBpcyBpbmRlZWQgbmVjZXNzYXJ5IPCfmYIKCk9oLCB0aGFua3MgZm9y
IHBvaW50aW5nIHRoYXQgb3V0LCBJIGFsbW9zdCBmb3Jnb3QgYWJvdXQgdGhhdC4gV2lsbCBjaGVj
ayAKdGhpcyBvdXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMsCgpDaGVuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
