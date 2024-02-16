Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EE8C4829E
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 01:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3a5TZXT9K+5Uy9DaOWDu/pvMfnSOGilOvPr1tEtwqo=; b=PFBtx+21xn4aRUn9rYvAWZOcA2
	yz/qRc9Uvvf5Xejya5Yo6Ovq8wc3Wh10E5SQtPV3TwHMUJFnTWxOb4oHxOVSIDY0N0xEDZ2G7PXgt
	RF/QCKQFrsK2vshai32v2/5C7SAU5v1XWZ+X7uSVJjrxbwH2wun6hEqzl5BJtqgpC655wkfin+191
	g3UBulgTIZOhfg5UmQfj4WU1rlbzlOi7OqHfTqgpQ4CAI/ruUxFcMI5JfM85aKFG2IwpaWSLgbHUo
	SxFWWcRwc+VIn9jRCKn+lmqBrmQM82B9u2IeB2epIEGd/4h7jLQFw/SlTXLCEU/pXNZ0lQAEa4RUX
	/nIkCX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ranBn-00000000lIa-0UI9;
	Fri, 16 Feb 2024 01:38:55 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ranBk-00000000lHW-2Za5
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 01:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCy85m/QQesTLWkUs4KlguK9EV1eMZEvmuE3MTXWxO4GzhekibJ36RNOOHrhcoDN1lTKOGVsdBawGn1WtI4ULk/NhEssLSJ3GkI4RCzrHWJypfYInjJ/cKfpgoWo2gFCE/2oSZo0bDOCT0E/shBXFhtsnPAp0Bffa5QMg6fCDdwy7/c77dV7UvRyrkx33FJ6WA8MPwvkxxrs20r1iYm4v9JGF6Io79zkd5Zv9LIme3Btj4ONhf7a8fQMHEVgHJUFeizXw5ZV/rVsfHLWkNIsGYb5xctyqs3wpD0uOk0YAE7Ofr9WWmavlld0LL7JQiykIP5xRBRMypbKeDGc5CyOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRqoCLF2qSRo7q6DwNV8Ak27VzeZxUtWgTazHqvXcLo=;
 b=amd2pnUT4MXnX+5g6gfvcU6snMh+SK9NhvOPtPKuVxJbp5ZmtRHyjWgp6PheremAH+/iolUkjZLv5YAoUAL1Zgfmr0zUkhyCTldMQvsHZula0l+oxsBPuii1cD8I4SoFWen11WYN3AHvam23iKMketHLDkgGS4ZNRAAE3NJC9kt5I6UEAcpfsz5DeJcSlsgO7kVhJMg08CCqZ4FEuZQBDIotxc8lC8OcbG/gd68QgordZ064oRwNzdCv/LOx6PBv2hNxmPfdWWAvZWGzOAvVcHiSLwN3jc0sNoPKF+h3LIx4ydYu085KcO5B1bvaqymJmOplDUjQFHcG3UP6uCus4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRqoCLF2qSRo7q6DwNV8Ak27VzeZxUtWgTazHqvXcLo=;
 b=sv44SSiKakliIYzicVDLMEOICh73uqfgij1njY6c8W1W2M2UDijoHM2sva6++jT1Qcbc3fwokHdFGtWlWE8HpDOlwkaXAmyT6g4RHJ3Fc82pHrl7p1QyYYhKVYTI8DQyVxlG69u8C5Cq7SPmZJPobsUgN/Id1ztm8dBnkSBViun2EivoJlYfVYqD4aqZ8G3s7V1mIj+kRUwOFdpYbtURWR9bwFiu5GhKy3V+ev/oUcSDXERMvRXfJKMsKFWdpVsJ2EXEhKFOptFYuw3skzo2+BKIcZRcVyBhyPOGKygosCLia8G8k3fL5Ukt7iFI+rnxUYs+OPi8fcm5iAbTmNSHAg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB2600.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:137::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 01:38:41 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 01:38:41 +0000
Message-ID: <MA0P287MB28223587A81D9C674B5B80B4FE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 16 Feb 2024 09:38:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo SG2042
To: Philipp Zabel <p.zabel@pengutronix.de>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com
References: <cover.1706577450.git.unicorn_wang@outlook.com>
 <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
 <MA0P287MB2822E03B61DF33B4438833D9FE4D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <4a1a0b142ca58e1c22ba246991d4ee657a4ee91f.camel@pengutronix.de>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <4a1a0b142ca58e1c22ba246991d4ee657a4ee91f.camel@pengutronix.de>
X-TMN: [3btn846LVUzC4qqg2FIjQmfZeoeEIoyJ]
X-ClientProxiedBy: TYAPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::28) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <3f4476a6-61c1-48ef-b041-72ae70579d30@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB2600:EE_
X-MS-Office365-Filtering-Correlation-Id: 198f0178-c316-49cc-f4d0-08dc2e8fffa1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBz3DsdpvzGJNmTRxtXdxbmo7q4azzS2B0WPMPwPuaPUk7/dRBGVfRFGtVszH77C9GRARqxBD4WD492RYmSOmyeY1ahKg/VvPAM0W5idnsMiWThE5a23QFK0Jcx3snsiSXPJGlbAQrBAh8Id3iyytTGtvjHvSLZ8kL1eod0uGntKg2mMGtSzcoekAtbKD+Zm/GAVxEKfZYVu2p3m454ODN9R9AgQgoRkenwu/FWm9INDYBjU71fPHzDDOAtFflSWltSePLulTwF5ynSnfcPiF7xmEcio2i9x+q0q0tirYOGQ2WuM3dsx2E2KiY+eQzZMu1t9RngBT32x3+8/A2TySk4vuNCYuI5m8MDQsD3uPeP8PP5/v5fEpWgw6I2es8D1qYPXxFEXdHsa95Pk2yAqZevT/VgQERUxTM9kqKvIvliSJXbfkpMI0SSJmiDqFyGAxHvpYKpeSd17d/gMlUaZsOjJXYCVEbbTJXjEhUH6vnvxq3uwnF8JZeNHQATD6ycdxT8R0ex6xmbqgAJClKFQqCdogQaGktnWiNZVcsQRCdZAfPIUIKg1t4aKP6kVKomy
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdXak1UQUkxTktPVlNZSmVTSXBmSFM5M1JBZTZpUUptdGFhRklzMGluLzZo?=
 =?utf-8?B?UHVmVVBFQkxvT0RtWU9Ic0d5VVhtSzRKbEgzTUp3R2FHTmZ1aWVRa3p2R1d2?=
 =?utf-8?B?cHl5V0ZuS28wY0d2Ym5IV04rZjBRcFIxVmczY3luV05ia3BpdDZzNS9vQytw?=
 =?utf-8?B?bnZDenNrTWR0elFJU0JiZVVRbG9nMFV6UjNDMTJuSUJSRlFQY3VzRGNMUEVk?=
 =?utf-8?B?aWx3ZEJ4UmUrVmtWcFNvUWVCa2QwUUI3SUEzWGRXRXRCZXBrQXFPSFMyczJi?=
 =?utf-8?B?aldJSWRwSVBUU3VranIxOEhzR1RXNEZMSTVybjJPUmh4enNCQlh6MC9IOXJ4?=
 =?utf-8?B?Wm5iOGhJelNXaTU3eksrT2xZL0N5ajZGMEVId28yVytuR1hsOTl2Q0c3a2gw?=
 =?utf-8?B?VkE1VUpDWXFFTHJNMGlWQnh2aWlLOGZ4NzNYRTRVTUo0SXE0SVAxU01NYktR?=
 =?utf-8?B?c2J0S0tndDZOSUFZYUhUSERKcDVqMzRyOVErK202MTB4azFQcVcwYjl4NGwy?=
 =?utf-8?B?QjBTdUJIajZpaW1rcHVIZDNwVTZ1L2V5TlZxTC80a1JRbGQ0SkEvTDRYRW1M?=
 =?utf-8?B?RXVkVlZKMDlzcW03QWJUSGR1bk55d1F0U28vakUzYTVzb0FMNjJheFVYVGk3?=
 =?utf-8?B?ekFxaXdoSEh4UU82Ym8xaXVNdkx5am1Nb3JCeml4eTBCRXg2Y2pLbFE5WG1i?=
 =?utf-8?B?U20rczAwcStkQWMrRk1FUS9venNncjR5cWlaUWZWNUI0YStnbEhvaUYxRExa?=
 =?utf-8?B?SWw5K0IzeVBSeDI4c3l1ZXdNbnlOdUh4SEJ3bmc5UmxHdFYvc1ozVDk2ZEFr?=
 =?utf-8?B?YW9rUUFPbDhNdCtJZ1RWa2twa1AyS3BhdWM1V3NUeVpiZmJFZVovbmlSaGVm?=
 =?utf-8?B?V3J2ekpMcWFIc015SkcrKytjNWgvL2dodDBFRStWYkRiWlBPRlBaUUFIVmRk?=
 =?utf-8?B?NTFZMGUyOFJRYndQaFRKbmVjSjZMSFh6SVFrbXExUm5peWFNaUMzSlFzeG0x?=
 =?utf-8?B?Mlo1S0tkUmFZM3pSWVVVMXpqUWtCSTRzSE95aHBERi9BL1d0RVVOYVlQRW1E?=
 =?utf-8?B?SGZkODhHdWRteVN4L3ZoTlNhWFU0bFdCSnEycFltcU56cW83cDN1QXFucUVj?=
 =?utf-8?B?UEI5ZTJpNThSZVMyWDkvc01QNDdWUEdXYW9OSkVadnk4MTE1dFpqMDZMWHZW?=
 =?utf-8?B?NzJFUFNwNUpGS0hiQ1JMWGhlSnlyeWR0OHV0bkdBMm9lQjUrYzZOdFN0MjhX?=
 =?utf-8?B?anJhbEovY0ZHL1lpeGo3Tlk1NUcxNWhlajdJU3F5ZVFBZWFWYjhlbGtHdWg5?=
 =?utf-8?B?NUxXaEcwTlFOOVFtZ25wbWJLdmthL3JtVHYyVThGb2R3MlZnZVd1Rmh4aW1z?=
 =?utf-8?B?aG96UFhqa3NQYXRkWGd6S0dUZlpHRmtHWlB6RGN1eWtUVTdGN3N2MmhwTDVO?=
 =?utf-8?B?aXVUOVpBU1h3VldVMTVjVGM1eUZKQzdlVDRQc3EyWi9MTFZ1Rm8vYTFaT2FE?=
 =?utf-8?B?VnQxVllWNzhxOUFFR2pZNHoweXBLQ0crZmN4L3RvbklITkljOTBRclFBdE5X?=
 =?utf-8?B?U3NzSTdsMHVRd1VnZHMxTW44ekdMNW42RDg2OGYyNTNSZ2ZXd1VpYzkrWnNI?=
 =?utf-8?B?UmtLMzhXUXZtZm1OMG9LSTBxVGpsY0J3eGZWd2VYNnBPeHM1ZHlROFBZNjBl?=
 =?utf-8?Q?LOhT7sY6MerKqzlzVEOP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198f0178-c316-49cc-f4d0-08dc2e8fffa1
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 01:38:40.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_173852_697944_9D9A5192 
X-CRM114-Status: UNSURE (   8.40  )
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

Ck9uIDIwMjQvMi8xNSAyMDo0NiwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiBIaSBDaGVuLAo+Cj4g
T24gRG8sIDIwMjQtMDItMTUgYXQgMTY6NTkgKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gcGlu
ZyB+fn4KPj4KPiBbLi4uXQo+PiBoZWxsbyzCoCBQaGlsaXBwLAo+Pgo+PiBDYW4geW91IHBsZWFz
ZSBoYXZlIGEgbG9vayBvZiB0aGlzLCBJIGhhdmUgZml4ZWQgdGhlIGlzc3VlIHlvdSByYWlzZWQg
aW4KPj4gbGFzdCB2ZXJzaW9uLCBhbnkgcXVlc3Rpb24gcGxlYXNlIGZlZWwgZnJlZSBsZXQgbWUg
a25vdy4KPj4KPj4gQlRXLCB3aWxsIHlvdSBwaWNrIHRoaXMgZm9yIHY2LjkgaWYgaXQgaXMgb2sg
dG8geW91Lgo+IFllcywgSSBpbnRlbmQgdG8gZG8gdGhpcyB0b21vcnJvdy4KPgo+IHJlZ2FyZHMK
PiBQaGlsaXBwClRoYW5rIHlvdSBQaGlsaXBwLiBPbmUgbW9yZSBxdWVzdGlvbiwgd2hlbiB5b3Ug
cGljayB0aGlzIHBhdGNoIChJIG1lYW4gCjIvNCksIHdpbGwgeW91IHBpY2sgdGhlIGJpbmRpbmdz
ICgxLzQgb2YgdGhpcyBwYXRjaHNldCkuIEkgd2lsbCBoYW5sZGUgCm90aGVyIHBhdGNoZXMgYWJv
dXQgZHRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
