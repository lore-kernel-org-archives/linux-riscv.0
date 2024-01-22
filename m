Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67451C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:From:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp6lpswRz2YmbPUGsemTyHC2rkjPEkvLlajtGsHKwic=; b=EYFyfyssoy4yzynBiQCO61Q0mG
	uQoyYyO+7UyBhTeNwJ7ascB+AKczFrfnawWSDnBWOP5SiAZJzeJezKm7J7kYxqe2rmQWgcR6/yB7l
	UHeOTmCDL5IqpoUjkrA5t/2QVuW7WWWEiIWolxLjuAfy3ggpp8vAr0cdwNVpTx8ySd71ZRVH2ZtFi
	44GO+rv8mpRTDqrDK0VaUnQW8UJB6vk8/v3zdBRBjuf/mUTDuw3PEmOl6FBjDtfgVg3ii6dwyY6pm
	UvkEN1b5ZLcsGZAxIkwJbIZ5vDB7P66Fo4MkIAZT8y5QE2hpdrlAdrq+bETnLB4pMZo/q2zxoEulA
	2iCDzdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRlCM-00ATfk-07;
	Mon, 22 Jan 2024 03:42:10 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRlCH-00ATcG-1A
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 03:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsJbhUCAYadbPfgiRz/8FIKtFUHkjHI2AtNSR8j/nJbQTBFRYfKIG6GTPDX+wQh3k+Iwaf+Bte4qfI4Bn6Xv2sHoiwGez6ytdFNeaY/QNB+3qSvjfxkVrNhbWZzWwQ144RqP0hgh+QURhxeIiEqAeq1StAjZPB3BkET15D5zWnYr3A6dpvrRBGk3sGHe0fqomCYsQ4YkRfZRgRM/O+2LF/Wqn8F+w7eFfkp41GgF7ChUdLi2CkNxmMLDZe+obq6go7j+jyYrRrbAzxkUleObVfc7CrajxwbDqwSnc/tfPbK5bfm1vSX1TAsiGYEQxoZ5/UZo1Sr1LbXQiy/cQsWh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDyp1LG0RquqpZwnX8RcW2qxfzZBPEbclsvmofzKBCM=;
 b=OFt9IfgybjpOTPsufSZgChvGimId6jH1pcjFcKb8tdMvWtrWVngWlrZ6eiBFylat99Qc4z0wx2HdLUj+q+/O7EfcyIscbsP0Cbq8zEaafhG9z3JcodLF2nq/J6UwFnU54x/+X3DgVEnRHo8gR5RcBXXd+gGJYvicK0mK99/G4POloFIqkqFEHjvi0P8SaS3XptZu86IUAzr8HL3CcHNjj7A+PlGjyyDIS9HX74aHP/aG4I4Ss00U4RZkbY7vjDFsinHPYannGLO6ea6gtmb2TcqI8wVo5RhFBeDimUUV8xYvhYl0uG6DXHxCQcWDI9kYPSi9mC8NRKGLdIv3MRAchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDyp1LG0RquqpZwnX8RcW2qxfzZBPEbclsvmofzKBCM=;
 b=NCgHwQLYEwH0mhvolGKlVzKvBa9ItuY3RYPKcDsYtjeFWFXkHYy/pc3u6IlVFppWNdh93d6BNJtQV3RatKjC1EmKKtATLRLR09VD5hMo4oU3AbqGeSsWiQX2e9FR2ALzPqUL3BT+pymF1wGacQlUFCA6I0r/Yka/2b1LRHghF9jrIdqvgRQU3EPzgQZUkCYsr5efMfTtuA5/NlrJJeBm6L+rrwpmBQ9Y6MFOnV4JMllyoDdYfuArPKJe7blM+6uq5HLqok3F/OHiqIsfGFXUsXu4bq8YvXsi+perEDOvqs/ycqcAel8lY7SHId9J0bAGyBZEfM5HUvwc1Khhp0CSkA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1618.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 03:41:39 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:41:39 +0000
Message-ID: <MA0P287MB28225C6758E08536CC495B48FE752@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 22 Jan 2024 11:41:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
 control module
From: Chen Wang <unicorn_wang@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [uBWA1LTfOhipSzRK1PxfBW8Bye851o3L]
X-ClientProxiedBy: SL2P216CA0148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <ad1d8d85-770d-4541-88a1-770864164eb9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1618:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d60b22d-8026-4752-2020-08dc1afc0936
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1XtjZ8A202dczqQKLKNCiQ71/F2j6OG5d8K4Ca+EfPJWfvMvuYJQ6kirX4vhy5JfgTg3l4Iuud7zSXm8GEBNZe44tlCXiNimb+nDlvGyXBg8Q0QuYQIk5ERPiE5I0XNuNbUwsj7IWOxWo+4dVl3NbgnOdGhKIJr3CPhw6Z4z3YEjkFp4TccutskPmx/kk0sGsDxu0Q3YMHaV5xbZ9wAanMeena+CbNI5nM1SXvfBQCqaBf8FCqzBUeVNUXiUwuZW8O0ideMGdHc9f9R56C4M9G0jxFkdpHsKYF2/eIU6r/uJDglsv7n2pNX7v28O1l0ret2kqCJXr2yM3rFyxLf2BXDSjjuyGKAJoGkuBDP8V+JM+tCTIxYrzW83Z46sADKbrUvdIFxT6jMOxty74bAa//K2ZaJaAK8LqNVYdNlKuclWTeY+/1fIk5YXQcyNJPgqW0qyhNLwrldmaaG5asqg4OquKR2tGg5/vCOILU/fK2VbNSsLWgw9EGnmVLF581NnD0r7f2C3HqkgWUre/1hCc61zhpvtMOiRRYORz+cvagTcQmPMM/RfEoUMaCLT23H7O55qTxF5VGjQBOQt6bi7CdC+j3C+Bo+KF6U0R2Ds2oYfSaUqwSRLmmHOC8a3BN6Nm/wHdByqhp6FUnXqCXTlw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5pZENOcklqcUN6ajRPTitESGU2VW4vUUE3VFVOaDcwOGZvWVBDUFlJRGUy?=
 =?utf-8?B?UjNsV0xjS1d0Sm1MZjhaa1V2VFJ3ZTNuSm9ndU15NE1Xc1IzdjlRZW9JT2dX?=
 =?utf-8?B?VUkvRWRjSm9DRlVKUytEcnR0blRxSXFQT2FJYjdFZk5pQ3N3Q3J5OWRBY2lF?=
 =?utf-8?B?OCtpTVU1cWJSNFFPVWZUajkvNnlLMzNMMnNNQVdMa2lZbDVGd2pkREwveUNp?=
 =?utf-8?B?M1lSY0RTWGt1Zkp1UXRENHltUU8yK3VkeVVLakxrVitCeW1aL2toN0ZyVGUy?=
 =?utf-8?B?M0ZOYWNWTSt4aFVsYVg1TS9Rb2VqOCt1SXVmMWFyZnQ2NVMwalNyclhyWDNK?=
 =?utf-8?B?Tll0OTdXempEZ2tZU05xMUwrdi91WUY1OXFCMk1SUm1FcmhJdmtnSVZOYjFI?=
 =?utf-8?B?YlYzNW1mRG1yM241MlN0UTVsd0UwMGVDOGtTdkpQSEtWaUs4b25PYnZaalBB?=
 =?utf-8?B?VXFlV0tqRlpQeG5IV0diQVJMVXd3dXBXOUkzbFdLUHMrcXhBVS9ONlNVNWdO?=
 =?utf-8?B?dTZhT3V4RDhuVGhueVpHYTFZVldIdkR6Y0NIZXU2c3VzTTFpeVhHd0lzL3Nv?=
 =?utf-8?B?ODkrMm5OcjZPTzVEV0YxTEV1TlF0a2dEa3VzYjdpRGRyN2NyY3JEYmFFK0Fn?=
 =?utf-8?B?dkxoaDN2R3BoWWF6YmJGSFVnUm1jQ1BWdWxYWmV6dTJ1VnpYbER2Z1ViM2NT?=
 =?utf-8?B?cW5NWjZSVVV5Q1FZVWs2VmhZYm5RSGdXNXhsMExUSmEvOTB4MExtNVdKZDd6?=
 =?utf-8?B?cDFrdTNtMlZiYkNPQWwrdFRkTGo1U0cyUkk2eUV5Lzh4RFpSWFRoblNiOUdV?=
 =?utf-8?B?WWJ6dlo3bFo1SjRFTWlzOFdMRFBmQUtHUEx6Q1k0TUlLbERweGkrMzk3SkJD?=
 =?utf-8?B?WHZGZWhSM2RtS0NmMm9uTTNjVDNiWTVIcml4UkUwUTJ6TngxNkk5NXA5OWk4?=
 =?utf-8?B?bWNFTUNLTDlDanJxZUI0ZlQwekRITi9FSUo3aU1nNTgvclB5RlNJb0NUYVB1?=
 =?utf-8?B?Um5NZEMxT1pNWUNXbW52dDc4YVloK0kvcVJRMUZKTFZaeFhxZU1hcCtudFh2?=
 =?utf-8?B?VlY2R1JXL1ZGS3hsSUV1OUN3ZUpyaWl6TFhVMlFITHd1V0xPNVA5a01JaEVh?=
 =?utf-8?B?dWV3SG5nNlJOY0lIU0hnZ01SN3N1R1VqSEFyWkIzOVNnVVNaT25nYkNkS2pG?=
 =?utf-8?B?UDVyRHl6MDIwRG9kdElReE1rWFBsN3hiaXR0ajEzS2lLOXp6ZlY4cGw1RzYx?=
 =?utf-8?B?ZWM4dUFXdzh1YmVLOHk0cjNWQzU0dndNTk1aZDlKOTc3RzF6VlEybnVaWG5U?=
 =?utf-8?B?K0lyMU94YmZhY0xhVnVpSEltMWVjMnhrKzlUS01sWWJEMVRuQytlUG1BVCtR?=
 =?utf-8?B?SG9oZ1BXNC9odTU2RVhRSmQzRlZTajNDd2tHaEtwdkhOWnMyVDlyemFWQ28z?=
 =?utf-8?B?Tm0yT3JrM1ZVUkpHSS9EUVNPbEphVnVCU2plM3JiVkgreVdWb0psamR0YTQ3?=
 =?utf-8?B?aU54M2xsSUNlTE9sWHhkbm8zaUxiYTFLZ21iS1RnU1E5b1VOMVpRR0RvL2VF?=
 =?utf-8?B?N1lWNHlhc25Cb08vRFdrYnVCT2d2b1o3WnlNY004YXNQMlVzR2hyUzR6NnQ5?=
 =?utf-8?Q?M7HF9Xht+QwsaiKkzGx05Xn5l+CkmEhJ7G5vrte6ot5Y=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d60b22d-8026-4752-2020-08dc1afc0936
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 03:41:39.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_194205_424655_7511D9A1 
X-CRM114-Status: GOOD (  19.29  )
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

Ck9uIDIwMjQvMS8xOCAxMzoyOSwgQ2hlbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAyNC8xLzE2IDE5
OjM3LCBDaGVuIFdhbmcgd3JvdGU6Cj4+Cj4+IE9uIDIwMjQvMS8xNiAxODowNiwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDE2LzAxLzIwMjQgMDg6MjEsIENoZW4gV2FuZyB3cm90
ZToKPj4+PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4+Pgo+
Pj4+IEFkZCBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIFNvcGhnbyBTeXN0ZW0gQ29udHJvbCBm
b3IgU0cyMDQyLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dh
bmdAb3V0bG9vay5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgLi4uL3NvYy9zb3BoZ28vc29waGdvLHNn
MjA0Mi1zeXNjdHJsLnlhbWzCoMKgwqDCoCB8IDQ2IAo+Pj4+ICsrKysrKysrKysrKysrKysrKysK
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+Pj4+IMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCAKPj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3Nv
cGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbCAKPj4+Pgo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCAKPj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29waGdvL3Nv
cGhnbyxzZzIwNDItc3lzY3RybC55YW1sIAo+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvYy9zb3BoZ28vc29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwgCj4+Pj4KPj4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2I1MGJiNTZi
NGNmCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyAKPj4+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sCj4+
Pj4gQEAgLTAsMCArMSw0NiBAQAo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4gKyVZQU1MIDEuMgo+Pj4+ICstLS0KPj4+PiArJGlk
OiAKPj4+PiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2Mvc29waGdvL3NvcGhnbyxz
ZzIwNDItc3lzY3RybC55YW1sIwo+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+PiArCj4+Pj4gK3RpdGxlOiBTb3BoZ28gU0cyMDQy
IFNvQyBzeXN0ZW0gY29udHJvbAo+Pj4+ICsKPj4+PiArbWFpbnRhaW5lcnM6Cj4+Pj4gK8KgIC0g
Q2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Pj4gKwo+Pj4+ICtkZXNjcmlw
dGlvbjoKPj4+PiArwqAgVGhlIFNvcGhnbyBzeXN0ZW0gY29udHJvbCBpcyBhIHJlZ2lzdGVycyBi
bG9jayAoU1lTX0NUUkwpLCAKPj4+PiBwcm92aWRpbmcgbXVsdGlwbGUKPj4+PiArwqAgbG93IGxl
dmVsIHBsYXRmb3JtIGZ1bmN0aW9ucyBsaWtlIGNoaXAgY29uZmlndXJhdGlvbiwgY2xvY2sgCj4+
Pj4gY29udHJvbCwgZXRjLgo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArwqAgY29tcGF0
aWJsZToKPj4+PiArwqDCoMKgIGNvbnN0OiBzb3BoZ28sc2cyMDQyLXN5c2N0cmwKPj4+PiArCj4+
Pj4gK8KgIHJlZzoKPj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4gKwo+Pj4+ICvCoCBjbG9j
ay1jb250cm9sbGVyOgo+Pj4+ICvCoMKgwqAgIyBDaGlsZCBub2RlCj4+PiBEcm9wIHRoZSBjb21t
ZW50LCBpdCBpcyBvYnZpb3VzLiBJdCBjYW5ub3QgYmUgYW55dGhpbmcgZWxzZS4KPj4+Cj4+Pj4g
K8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXN5c2Nsay55YW1sIwo+
Pj4+ICvCoMKgwqAgdHlwZTogb2JqZWN0Cj4+PiBXaHkgaXNuJ3QgdGhpcyBtZXJnZWQgaGVyZT8g
WW91IGRvIG5vdCBuZWVkIHRoZSBjaGlsZCBub2RlIHJlYWxseS4uLgo+Pj4gdW5sZXNzIHRoZSBj
bG9jayBpbnB1dHMgYXJlIHNwZWNpZmljIHRvIHRoYXQgY2xvY2sgY29udHJvbGxlciBhbmQgeW91
Cj4+PiB3aWxsIGhhdmUgaGVyZSBtb3JlIGRldmljZXM/IEJ1dCB3aGVyZSBhcmUgdGhleSBpbiBz
dWNoIGNhc2U/Cj4+IEkgZG9uJ3Qgc2VlIG1vcmUgZGV2aWNlcyB3aWxsIGJlIGluY2x1ZGVkIGxh
dGVyLiBJdCBzaG91bGQgYmUgb2sgdG8gCj4+IG1lcmdlIHRoZW0gaW50byBvbmUuCj4KPiBoaSwg
S3J6eXN6dG9mLAo+Cj4gQWZ0ZXIgc29tZSBkb3VibGUgY2hlY2ssIEkgZmluZCB3ZSB3aWxsIGhh
dmUgbW9yZSBkZXZpY2VzIGluIAo+IHN5c3RlbS1jb250cm9sLiBGb3IgZXhhbXBsZSwgaW4gdGhl
IFNZU19DVFJMIGFyZWEsIHRoZXJlIGlzIGFsc28gYSAKPiBzZWN0aW9uIG9mIHJlZ2lzdGVycyB1
c2VkIHRvIGNvbnRyb2wgdGhlICJHZW5lcmFsIFB1cnBvc2UgSW50ZXJydXB0Ii4gCj4gVGhlIHBj
aWUgY29udHJvbGxlciBvZiBzZzIwNDIgd2lsbCB1c2UgdGhpcyBpbnRlcnJ1cHQgY29udHJvbGxl
ciB3aGljaCAKPiBpcyBkZWZpbmVkIGluIFNZU19DVFJMLCB3ZSB3aWxsIGFkZCBpdCBpbiBsYXRl
ciB3b3JrLgo+Cj4gU3BlY2lmaWNhbGx5LCB0aGUgZGlzdHJpYnV0aW9uIChvZmZzZXQpIG9mIHJl
Z2lzdGVycyBpbiBTWVNfQ1RSTCBpcyBhcyAKPiBmb2xsb3dzOgo+Cj4gLSAweDBDMCB+IDB4MEZD
OiBmb3Igc29tZSBQTEwgY2xvY2tzIDoKPgo+IC0gLi4uLi4uCj4KPiAtIDB4MkUwIH4gMHgzMEM6
IGZvciBHZW5lcmFsIFB1cnBvc2UgSW50ZXJydXB0Ogo+Cj4gLSAuLi4uLi4KPgo+IC0gMHgzNjgg
fiAweDNGQzogRm9yIHNvbWUgZ2F0ZSBjbG9ja3MKPgo+IFNvIGl0IHNlZW1zIHRoYXQgaXQgaXMg
c3RpbGwgbmVjZXNzYXJ5IHRvIGtlZXAgdGhlIGN1cnJlbnQgY2hpbGQgbm9kZSAKPiBtZXRob2Qs
IGFuZCBpdCB3aWxsIGFsc28gZmFjaWxpdGF0ZSBmdXR1cmUgZXhwYW5zaW9uLgo+Cj4gV2hhdCBk
byB5b3UgdGhpbmssIHBsZWFzZSBmZWVsIGZyZWUgbGV0IG1lIGtub3cuCj4KPiBUaGFua3MsCj4K
PiBDaGVuCgpoaSwgS3J6eXN6dG9mLAoKQ2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgaWYgeW91
IGhhdmUgdGltZSwgbG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHkuCgpUaGFua3MsCgpDaGVu
CgoKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
