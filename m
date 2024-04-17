Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA69C04FF6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 00:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fa5j6htAhJeIkji65BZO7BDON3lClUIamzkALpYSzI=; b=sNRNhYO9S4ZNf4GpxLR5vVtjXc
	CnEj++K+RQ/kKvAq3J2ox7R2F69kR79z0weIRCEB6tirSzK010zdregcJsmt33wpqM8KoMgOtPSKX
	DK4p7ZaXtJdVfKk4A9cwWpj824Ady3n+CVwrmccnbYdUP0dmUjZKDttsITh/OmB52w2mNW6nOe4re
	2UiTqlihCvkfq9/ZwnoWGijvSgz8LYb2kywV97lVJOsGjhLx+LJAn1hwaMLhbQwTJkKqz+pntKcCc
	ytNv0SOLunmW8dogMgNa8+XrrYI+hdl5UWQ4mNC0H1TXq/hoEQU3CSTYQ1IbfHqKr3ZNzfnLZ6FOO
	2A9GYJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwsjb-0000000EFct-0JUw;
	Wed, 17 Apr 2024 00:01:07 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwsjS-0000000EFa5-2Pdz
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 00:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsyKP5ishRLXZ7wVZeNAnVpUY4aSSVSRGDB6YljKWuVSgzBoucoDXz6VSJ9Zyd8e+phMcdM26WPOKFSKnn0Pw86QtQh5iUVQubkukYRmcPpok0oABe8DusN8Tt7c4BY3ry+Pbd+XCX2PJHI1hCdHc+0csjn3+fqGN+EZSfs4aosVh+xIzAl2OWUc2+s/FBTR4VvtlfPfXDBBHHPnX6r2oRZtvDH1b29g+Lvh608ZecQCo2yRBZ1l+61P+kwTjAH2wKIsBFknMJxVyyXGsmNMaNYws8WHEhOsJ5L3CQNO27AQt0QH1VYYx8y+nmtrC5t5Qm1MgJ9pR7jI/gDWhiDEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA/JWBoybBau7SjbgcugZNDu/G5eQKw173HmHJdAhJY=;
 b=SimbWnTCqyxjLumkLX7HqFNfQjILDmEolEhHcwqaG/TPmGrlWtoGph9XyNenRUPmsV83+VzkS3Lzf1ntOWeo5diNIAezV65oGaHhY9p2W2kLTVlChu/kfpw+OrhZcFXKmT5HAnopszsB5hGJsHqzm9QGbPaHzIm6AZJ1YxMLliM2CrwAu9sOJ9Z+KxFArBTLzs0rAqSCReKZy8dT4ZENdFMpQTAwjRqjhenKCr9FQPoXjFKs6aWO7izbiaFI9JMPh+MCsmcwy5QEtBqmnRSje0RZTsxN0DXQ0SFP4hboSYtsJsjbBoEAVPDVX+4Dwx8VU0n8NVkKlGKlfv3XW8JtXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fA/JWBoybBau7SjbgcugZNDu/G5eQKw173HmHJdAhJY=;
 b=uqHnMyBBIzyYjYp+g2eWRmkmjEYrw/hGBLprq/Xflw3KAStZy+QExEOh+m+C4TixkzJmG9s4+qz/tr0Q6Y5OyMu8O2QC0vAdEnvIQc58k+2fwAhVv5xeiOgQgSh3RLEg0n0FZw+jrmUyiwDEqwGuK9E+zbMDr8RybOcQzbY5z/9FraBTFaPrAzNleqe/zucFtCuZ0g8WIf9lrtoRsdwCrBViha23oYDSE7W3fY4ZGMcIWwbVprYq36ZJdjt5LQKwwD5+qNqI2nDOEo9tD5e/3yYeNuLIr1e3fNTh3ZjhhgR3G/daIolnxTd0CgyJj70GBgR4Yz58OaTVk7ATgjx2ag==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1455.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 00:00:33 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c%3]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 00:00:32 +0000
Message-ID: <MA0P287MB2822D66AFB826428DB13E527FE0F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 17 Apr 2024 08:00:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042
 support
To: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1713258948.git.unicorn_wang@outlook.com>
 <032c06642b01f06c86ba8bcd2108d18c005b57eb.1713258948.git.unicorn_wang@outlook.com>
 <20240416-pretext-cognitive-295526072596@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240416-pretext-cognitive-295526072596@spud>
X-TMN: [8YyUbG5YfFeNjWhzcYu+9xbHjs8TDo1H]
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <553df95a-8b6d-4486-b047-0d5f8af91ff8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1455:EE_
X-MS-Office365-Filtering-Correlation-Id: d57cae31-fcdb-4ecf-c60c-08dc5e716694
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sudoPhejsCiyen+dYIAbGqKo5shvPfSQORoUbvOMDqlhR2id/n62a3p70de1+47w1KkAfdTDGjo1PqJ47YOwCJNi2R8P8t22TzUcPQIXPNtmWXm8GKgWdUpqwKnxVlFVi1HQdFBugZbYr0KOgUTC3+XGS0W5gmmB/37IjPgHVXxcvX6Vlqj2O4Iu+F97NezI0pqod6V6fHcL/ewMinI35bo147UFBNNpRkJCqhrGgJUuu7HWnF8lVl7coJ+5CoJOTEPjiaIEQJO8RoQGqUtLpsxmPI8S2TVxRKhG0EHm/u95aKZN9e00ETm3kaJXak/zEgPs5SH32ey4OJhQad6lZrbo5DtbE+dwpP71clczH2EizK1+M3JgT+4f2MsIBZDqTU55R3jXL2vM9RzFkAtdX5EDxn1Rg1rmwunsnY1uKQQAY0eIZJ0KeLyRonztOuD5aVMBOD5TQmI6mHLu8LlU06hg5k/AAEMwJvAoTr2yap1PE6XkxIbfbkYHebLqXPzZp/SL2Fne6GIiwrrI9ejIDir03x1GDB/1lwes1Bl17jWBos+pmjSPYEjKMEX5cw9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkN1eWd5azJ1TGxtWnppL1ZuQ3hSNXZVSXgzQlNmRjlWQjQzeXdxRGxRMDQx?=
 =?utf-8?B?TGpESmxQVjExYkczOTBhS3h4UVlla0xZaDlQdGFBZUFiUlhQOCtvMmNkazlN?=
 =?utf-8?B?TFZ4Q2RXaHU1QjcvOUdoTEdVR0dBTk9xZ1NjZVVyeTBrRU5xZzh4cURjbUdW?=
 =?utf-8?B?M3lBMmNlQkV6RXhKRWNwS2RwR3BDSnljdXU2VGdiU0RBU3l1cVZlVnZJWXoz?=
 =?utf-8?B?VDE4R2EzVXFWYklZUHk4TE13TEg1WUw3cUFveU91RUF3ZXJuVHlQNmlrQ1hi?=
 =?utf-8?B?U3JLWlh6VUs3TkhnVXh4SnhlNjY2QklGWjRXTWMzS1AxUTY5SGpyT0hWcCtS?=
 =?utf-8?B?YXlVOHJ5MVYwdWRySUF3MnFyLzU5SU40Vjk1Z1VQVkxIbjNhQlRyNkh3TFh6?=
 =?utf-8?B?MFdTbXZNNEpwdFpqQzhCN1JuQ1ViWFZqWEZFcUF5NmQ1bEJnL2tZa3NpVGJK?=
 =?utf-8?B?NDRSSFRhUXl0c0VINHBZVlFhcTB3WGNENlRXbEd2ZXNKbFA1WC8zcitnS1Av?=
 =?utf-8?B?N3VpbkkydlNnZ3pSenNMZXB1dlhBdzBHMVQ3SEQ3Zm90YnhiQnN2SklsQmlE?=
 =?utf-8?B?S3BzWHpjS2hHTU12NVV0M0ZpamRsSmtSSFFuUWpzL2pRNWxFeGFodk13TUxo?=
 =?utf-8?B?Y0hkQXlRTDdRc0FYWVJvZmtCa0cybmg5bGNPekhacm9ORktsWGxJVE0zQnpB?=
 =?utf-8?B?RXdBZlQ1QklKMmZPU1Q4aUpXWGc0UkREQ3JKd1pZTHFSUlVieU1wTVEwdHJU?=
 =?utf-8?B?TnI2dE1sSjhPSUYvOXhwK1Jod3pGZTNZbEdpUTJlK3ZmQk82TXhpUlNTQjJ0?=
 =?utf-8?B?cUZWeEQ3Nysrc0ZRQVJERW5ITmROa1ZINHdHMDk2d3dKM014d202K2k1RWtE?=
 =?utf-8?B?d2E5angzc3V5a211RzlkckloblNUL1pHRUc5OUswSjFqQjhOMXJzMG1mOHA3?=
 =?utf-8?B?TVBUQTVkN0tqdGxqYlVMNEMyMStNa1RWM0RMYWwyYi94UWd5YVhGTyt5V1hR?=
 =?utf-8?B?VFFEclBiYTkzZ1JYRFFGVERUT1JFRGVYL0Uvd0xrZFV5czVPOXdpU0I3SVp0?=
 =?utf-8?B?WkJiaFNFek1qTDhvVW04ZXNMQ05TT3BremNZdEFuOCtaV1BHMmZ4Ym8yZENk?=
 =?utf-8?B?WktMTW5wN0FMbWlYeVp6NjQ1c3l0cDRRWkJvT0xoeXlzNWMzaUlMSm8wcVdH?=
 =?utf-8?B?SGJBUUhVZE1lQ2JqRWg4Qm04WklXSWJqeThqVnJiMjBnZjBmQm1xMFpZTHUy?=
 =?utf-8?B?UmVscFR0WkIxWThzZm44TTJZVTNQWWt6ZXZ3TTQrNDdybE0wLy9vQzBzWXJH?=
 =?utf-8?B?RlpuVjBSNHIvMEVzV2tBaWhHZU5jM0IyKzZTV2JabzRvL2QzeWtsdHE5bytX?=
 =?utf-8?B?WGNDZXNydjMyZm9Ud1JtRkNSdGt4dlErY1doeEdaTXBYMmlqN0tvVUhZb0xw?=
 =?utf-8?B?a0ljbU1ZR3drRzhaMTBpdWdCVWVxb1VCTkxad0NjMTF2T3d0c2QzWHhtb01j?=
 =?utf-8?B?dENEQkRuSW1nK2RiWGNOVDA3cFprdlVpdzZPTFc3a1VRVm9FTkltZU1uVVN3?=
 =?utf-8?B?MVpwYmNHbFdrMCs1STlFMDFuNXpWdUZaRW00Y0ZDTHhiZEQ5QzJsNnVXM0lt?=
 =?utf-8?B?bXR3eGVYb0duaFhKRmpJc3hVRnFIVzBuU24xQmhlRVhYbEZTeXNHNy9DNk1M?=
 =?utf-8?Q?UkWHycfN7INId+w8xLbh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57cae31-fcdb-4ecf-c60c-08dc5e716694
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 00:00:32.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_170058_655276_5C40E3FB 
X-CRM114-Status: UNSURE (   8.33  )
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

Ck9uIDIwMjQvNC8xNyAwOjQ0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBBcHIgMTYs
IDIwMjQgYXQgMDU6NTA6MzdQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgpbLi4uLi4uXQo+PiAr
ICAgIGFueU9mOgo+PiArICAgICAgLSBtaW5JdGVtczogMQo+PiArICAgICAgICBpdGVtczoKPj4g
KyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBjb3JlIGNsb2NrCj4+ICsgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogYnVzIGNsb2NrIGZvciBvcHRpb25hbAo+PiArICAgICAgICAgIC0gZGVzY3JpcHRp
b246IGF4aSBjbG9jayBmb3Igcm9ja2NoaXAgc3BlY2lmaWVkCj4+ICsgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogYmxvY2sgY2xvY2sgZm9yIHJvY2tjaGlwIHNwZWNpZmllZAo+PiArICAgICAgICAg
IC0gZGVzY3JpcHRpb246IHRpbWVyIGNsb2NrIGZvciByb2NrY2hpcCBzcGVjaWZpZWQKPj4gKwo+
PiArICAgICAgLSBtaW5JdGVtczogMQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBtaW5JdGVtcyBpcyBu
ZWVkZWQsIHRoaXMgaXMgZm9yIG9uZSBkZXZpY2Ugd2hpY2ggaGFzCj4gYWxsIDMsIG5vPwpZZXMs
IFNHMjA0MiByZXF1aXJlcyBhbGwgdGhlIDMgY2xvY2tzIHByZXNlbnRlZCzCoCBJIHdpbGwgcmVt
b3ZlIHRoaXMgCm1pbkl0ZW1zLgo+IEkgYWxzbyB0aGluayB0aGlzIGNvbWJpbmF0aW9uIHNob3Vs
ZCBvbmx5IGJlIHBlcm1pdHRlZCBmb3IgdGhlIHNnMjA0MiwKPiBzaW5jZSBpdCBpcyBub3QgdmFs
aWQgZm9yIHRoZSBleGlzdGluZyBkZXZpY2VzLgpZZXMsIEkgd2lsbCBhZGQgY29uZGl0aW9uIHRv
IGFsbG93IHRoaXMgY29tYmluYXRpb24gb25seSBmb3Igc2cyMDQyLCAKdGhhbmtzLgo+IENoZWVy
cywKPiBDb25vci4KClsuLi4uLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
