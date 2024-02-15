Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44CC48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch/Ihz0/sN/UHgppv/yQysbDxZs0XnFEMGoQ06CIsYk=; b=Z3qwWpAtUAc54D/xYmbFL3xuGw
	hkGevMncp4emm+1vRYmgTOD+1mqcUPRTKbwnqq1mR/r6rmcykxbm0QOHqgrrSVX+ZelxfxmUjqE8p
	X3VgInEUaRrvOdG7ON8RIgtP9u6XD1gH5LHO3TtfuoGxCBB5/M5p1zraqWllHv9qlsY0WStlfhNUK
	FahfAdEbKLg+TuczUWZS4ZvUa1Pzi9B8wxsY7rDHUTsxLZuI8/Cd/aHXTqHNGm/aUhYqZs6Yy+8NR
	Gtn9X7lYSGhuXzgoJcc89pq17yDQuhbN7Pk0J6Q1JiY1xgs5D4RDY3KQqE0NIGlHbIKIg6AecLEzm
	QiPma14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXab-0000000FSJB-18hC;
	Thu, 15 Feb 2024 08:59:29 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXaX-0000000FSFP-3qTj
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 08:59:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl8b6ZdRW/5NaaHO45GgD38jaRcmDCh8+L2mQyFV0B7/0K2oHgM+JmaOGzCFWMCAx2UXbs5yh/wJi8PwrtZDxIpPPqrfoCqPLTnvpPYCtRVpdIkAIpV9Q1m/Z7CMXdYbpECIyWcvU5rdiPgSmRv9PNZLgi4P3Xg0w/ZVdUSenqidp2eP6sFntA+yjp2sncWmsPt5VEJLkC9uurXin8wzqIKlAD8MEKHUq6PdyZGTwRn1lPhtDZYFUZUMG7LwT1CehK9AZwvNafVn4Bq9yY51aLFShUsB2tJpeCrlDq9FJqEUJow44dWNXwI7SriNX4oJMbIFSEhSU1PHmPhS7+oGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvw0StO6sF3Mb2RacrswPFgqc6BX3Cu+vPdrOS/mZTU=;
 b=I4GlS2sRM9sZLkge0xLeoHYfVahbwcX2VjiQy27mWrXWAxhv2BRMGwlK0WpeuxR53uJQV2+jInVIjcr1kIuUtqwJM+0qpeD2bJwQgwgrg3ww4aIc8Si/KTWmXtzVtJvB9gPfJq6xCVV90gKoJiSou1NWAgXxQOhnRgd0MjQ/E0AH4BJkGZ+eCIurMqwv8SN8JZ3t4O5XXJLc6jzxVlQCniL0m6jyK25xnfIp122VZTA9XI83YzS0PJBj3k5CHQKPfA+UgfPXpQqspmgmLcJb9zMY7CRRYc8YgaQ2X4fiCRt44vhonq8Cy2MG7C0yuv+ADQTuT4pp3DZimj5zOjT0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvw0StO6sF3Mb2RacrswPFgqc6BX3Cu+vPdrOS/mZTU=;
 b=uRr3EtWTwQ4R3DGmpFFtHTdaadl5wXGBiAM37Dq+u8bXSpYG3RXjHoXTrTuV9w4Pq/B/RQcqmxJ2b2Mq5YAObfJkdJrKWZbhnKOdKTCPkEeZ7BfKl5eeSD3+fDgGHZHArdaqQkV2p4DcqvpoLxvX/VGT1MmxmB4Na/nN5FwHd2cL/oiI9skj4dPZvxX1ht39ZCwNAYbbdU1SsE1+VAUUepnLF82hW1iFma+uISV5ofhNbkV8AHQ5RaIt7znOEp1I3gzr2eiHC7wTOcKV4fwOkpdVnblg56tETezn21p+g3LjOaZW5uJSuoKavCl051go6JzOKU2JqEWDswxw/2YsUA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1645.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Thu, 15 Feb
 2024 08:59:12 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69%7]) with mapi id 15.20.7292.017; Thu, 15 Feb 2024
 08:59:12 +0000
Message-ID: <MA0P287MB2822E03B61DF33B4438833D9FE4D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 15 Feb 2024 16:59:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo SG2042
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, p.zabel@pengutronix.de,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com
References: <cover.1706577450.git.unicorn_wang@outlook.com>
 <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
X-TMN: [pkaefth7PK0ow5jywzr+6ygs02ZBz9xw]
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <4e6987ee-4772-4219-a02e-e818980b0685@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1645:EE_
X-MS-Office365-Filtering-Correlation-Id: f48ff6ac-8d65-4380-933e-08dc2e0460bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPTHHHsjJgDEv3uZ2C/M4WQaD7eRzoqhg74jmyXNkS4SMvfPUByufXO3A5askxZU6IlabNQQZamN0ZSBudIll8bJN3OelCa97IkWOTRS8/VH0O/6U96ajYwloMzkzklQidF0iwkSstF5LuMZHzslsymdrjgdGULF7lLZNAqnAHLFWt8/SVjihUc7vrGCZmS6fcUQct8Yg2r7k8CcRVGJm1VlaJ9HhpyNlbgQnoLOPMHVzukiCZ6S4no4wh3T6W6bz3COB3mo16F/r6VhT+yoth5AF/0EdvXtsF+ze5LK0X697DoqtbIvKqcxTFw/LHSkHnYyeCAXOsXffPkQiwENjuOtAi3uoehxOTSJTmHwAOEqtAT/D7s3hoP0YKcynezTxbv6yC2dTN96uMhUu3L/2JMm8ZcHtt9DcA9oOLDfpSpZhfyBPo9Jqv2Ys3vo8nXpconITu2fC7B3Yiy1fYpDb/b9aeN+DWJmD0U4usV9SkB+E1V73biVKrM5C7xds0n4rfXU3b9M/kqWESk5b5e+kAxjo2upCfQdrHPVkQG3QfCg7xhQcQL/qfBd+rFIBwc+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVYrNGswNVd1Y0ZaVWRtVW82WVZxVDM1N1UySHQycmRRaThUTFdEMTNYV2Zh?=
 =?utf-8?B?TmthZEYwQUVZRlZ5R3h3QUlvcWdXalRYK3hFVzNPdSsvTVY0R0pNcWZwYVVs?=
 =?utf-8?B?azNNdDQrckpzU2swWlpZM0VxTFdXYmVlZFlINy9sdnlFamlSVzI0NmhIR0da?=
 =?utf-8?B?MzVsbFp6NDBiNHhtdnZHbWQzTHgwY0hMQm9TNm9MNkhEb044TjZRcVZ5bmdp?=
 =?utf-8?B?Z0lLYTRIS2dBbmpmUHRiWmo5bGplaXYzWGxyUzlSNU1TVzdIY2F2NnZDTkpw?=
 =?utf-8?B?aHRUWlpFR1lCYThlUnBaa00vaW1JUmpFL3VVbEF4eXJWeDBuRjdoeWhDd1ZS?=
 =?utf-8?B?NmcyYmkrQkR2eVlzODdrazVYWVpDSGYwTHFqOGNYT2hXdjFML2d0N2NVcjc1?=
 =?utf-8?B?RUhudkhKMER4bVd6V1NSNVgvWDdRMmVZeHRZaHJUbTU4bHNqcDd0citlU2Uz?=
 =?utf-8?B?cXV6c1lNc2RIR0h6Ym1CMEJESWZzT3ljOWM3TFo1c0tqMHd1eE1zK0JrK3FV?=
 =?utf-8?B?Vm9Od0YyMVFNbXl0Nlh0SldwQ2FMb0FqU3d2b1Iwa2NqUjV2djNlNjVsRGNi?=
 =?utf-8?B?UmlpTm5EVWxnL0dTalR1a3VDWGVwMnRkNktvSnlRbEhzdkptNnJMNW94Z25V?=
 =?utf-8?B?OFRIWkZLTDFvK3JWYnh1eEh0V01UUTRSQlZLV0h3ZXdLOUlkWHJnbk1scVlI?=
 =?utf-8?B?Y3lpS01KS2hrRVNaZk1KR1d2UlpOYjF3WjAzOHphdkVpRUVaOWZTL01IMTFI?=
 =?utf-8?B?aVEvcHk5VDdkUGtDRU1iQkN1ZDBVTE81Tmh4YXQ2anZ3M0FxV083aFliVjBJ?=
 =?utf-8?B?SDFJVGxhK0dJeHZJQ0dhZ3g1UitwLyttaUQzQjF1VHRKamxEY05HZEh6MU9G?=
 =?utf-8?B?OHpDYm9HWnFyVGMrUlpiMjhKa2ZLOXBUZEZvQ0JwRHQreXNxZWdrY0FjYVRD?=
 =?utf-8?B?RjJ6dzdDcUtERjl5YnM5Y3Y2Um9kVFdoTjZFaTVFT2ovTVRUd0Q2WlNqQzlZ?=
 =?utf-8?B?VHlIa3hiVFA3OVFLNTNvbzFXK0ppY256UnRJU1ZkM0pmOW5QM1Nnb0NMZWFu?=
 =?utf-8?B?b3dxTHhyWkw3L3d1MHZkRWJYYzNDTG52Um5WazJYaEE2OVcwVzgvbk1GTWJR?=
 =?utf-8?B?ZUhHaFNwNlZNeHFmWkE2V21DZWpqck5UY2xwZERVZE9UNmEzbGhsMUt1OWtm?=
 =?utf-8?B?R2NJUlE3ZzMwNEtOWnRBYURCVkZMMXVvVWRrSE5ic0RyMWR3VlorWVp3RzZX?=
 =?utf-8?B?TFpRdm5WS1E2SWJxTDNTa3hWdzltS01jS3hWcjBHR3B5Z2FuKzJHeHZjNXd1?=
 =?utf-8?B?cUd1VW94cjV3TUlWQWN2dGNXanpVVk90dW1udmRCK0VuVUlzV2xrSXRJTXlr?=
 =?utf-8?B?VklVNnR1N0FNRTh0ZVo4VG1UMzNMMmVhbmMzR2cwSWFROXFld3FxTGVxS2pa?=
 =?utf-8?B?OTZ1S1k3aUY4bE8yNTBNNUdxc2JkeXpKVFFDRzFRTjFsN1hhc3FmU1lHOFRJ?=
 =?utf-8?B?N2pTQis1TVlTQ1VWaEo2UWRLTG9MLzV0cFZNRmM1RjIwd21SU1ZTOElHcHQz?=
 =?utf-8?B?RURaVlViSEVHWS9qa2pJTEllcXJRU3dSVzg1ZzJSaHVBVFEzdzBMbGZIRmln?=
 =?utf-8?B?clVvWFRWZEx2Vm9LSHEvSDYvYW9Oa2ppZmNOTytYK0JOS3Z0VTFrYWpFKzVO?=
 =?utf-8?Q?JnI7MJz+YUxMhUb+vOxC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48ff6ac-8d65-4380-933e-08dc2e0460bb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 08:59:11.9411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005926_012374_EB7E8D9D 
X-CRM114-Status: GOOD (  16.37  )
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

cGluZyB+fn4KCk9uIDIwMjQvMS8zMCA5OjUwLCBDaGVuIFdhbmcgd3JvdGU6Cj4gRnJvbTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiBSZXVzZSByZXNldC1zaW1wbGUg
ZHJpdmVyIGZvciB0aGUgU29waGdvIFNHMjA0MiByZXNldCBnZW5lcmF0b3IuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiAtLS0KPiAgIGRy
aXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAgfCAzICsrLQo+ICAgZHJpdmVycy9yZXNldC9yZXNl
dC1zaW1wbGUuYyB8IDIgKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9LY29uZmlnIGIvZHJp
dmVycy9yZXNldC9LY29uZmlnCj4gaW5kZXggY2NkNTlkZGQ3NjEwLi4yMDM0ZjY5ZDU5NTMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9yZXNldC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9yZXNldC9L
Y29uZmlnCj4gQEAgLTIxMyw3ICsyMTMsNyBAQCBjb25maWcgUkVTRVRfU0NNSQo+ICAgCj4gICBj
b25maWcgUkVTRVRfU0lNUExFCj4gICAJYm9vbCAiU2ltcGxlIFJlc2V0IENvbnRyb2xsZXIgRHJp
dmVyIiBpZiBDT01QSUxFX1RFU1QgfHwgRVhQRVJUCj4gLQlkZWZhdWx0IEFSQ0hfQVNQRUVEIHx8
IEFSQ0hfQkNNQkNBIHx8IEFSQ0hfQklUTUFJTiB8fCBBUkNIX1JFQUxURUsgfHwgQVJDSF9TVE0z
MiB8fCAoQVJDSF9JTlRFTF9TT0NGUEdBICYmIEFSTTY0KSB8fCBBUkNIX1NVTlhJIHx8IEFSQwo+
ICsJZGVmYXVsdCBBUkNIX0FTUEVFRCB8fCBBUkNIX0JDTUJDQSB8fCBBUkNIX0JJVE1BSU4gfHwg
QVJDSF9SRUFMVEVLIHx8IEFSQ0hfU09QSEdPIHx8IEFSQ0hfU1RNMzIgfHwgKEFSQ0hfSU5URUxf
U09DRlBHQSAmJiBBUk02NCkgfHwgQVJDSF9TVU5YSSB8fCBBUkMKPiAgIAlkZXBlbmRzIG9uIEhB
U19JT01FTQo+ICAgCWhlbHAKPiAgIAkgIFRoaXMgZW5hYmxlcyBhIHNpbXBsZSByZXNldCBjb250
cm9sbGVyIGRyaXZlciBmb3IgcmVzZXQgbGluZXMgdGhhdAo+IEBAIC0yMjgsNiArMjI4LDcgQEAg
Y29uZmlnIFJFU0VUX1NJTVBMRQo+ICAgCSAgIC0gUkNDIHJlc2V0IGNvbnRyb2xsZXIgaW4gU1RN
MzIgTUNVcwo+ICAgCSAgIC0gQWxsd2lubmVyIFNvQ3MKPiAgIAkgICAtIFNpRml2ZSBGVTc0MCBT
b0NzCj4gKwkgICAtIFNvcGhnbyBTb0NzCj4gICAKPiAgIGNvbmZpZyBSRVNFVF9TT0NGUEdBCj4g
ICAJYm9vbCAiU29DRlBHQSBSZXNldCBEcml2ZXIiIGlmIENPTVBJTEVfVEVTVCAmJiAoIUFSTSB8
fCAhQVJDSF9JTlRFTF9TT0NGUEdBKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0
LXNpbXBsZS5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1zaW1wbGUuYwo+IGluZGV4IDgxOGNhYmNj
OWZiNy4uMjc2MDY3ODM5ODMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2lt
cGxlLmMKPiArKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5jCj4gQEAgLTE1MSw2ICsx
NTEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByZXNldF9zaW1wbGVfZHRf
aWRzW10gPSB7Cj4gICAJeyAuY29tcGF0aWJsZSA9ICJzbnBzLGR3LWhpZ2gtcmVzZXQiIH0sCj4g
ICAJeyAuY29tcGF0aWJsZSA9ICJzbnBzLGR3LWxvdy1yZXNldCIsCj4gICAJCS5kYXRhID0gJnJl
c2V0X3NpbXBsZV9hY3RpdmVfbG93IH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxzZzIw
NDItcmVzZXQiLAo+ICsJCS5kYXRhID0gJnJlc2V0X3NpbXBsZV9hY3RpdmVfbG93IH0sCj4gICAJ
eyAvKiBzZW50aW5lbCAqLyB9LAo+ICAgfTsKPiAgIAoKaGVsbG8swqAgUGhpbGlwcCwKCkNhbiB5
b3UgcGxlYXNlIGhhdmUgYSBsb29rIG9mIHRoaXMsIEkgaGF2ZSBmaXhlZCB0aGUgaXNzdWUgeW91
IHJhaXNlZCBpbiAKbGFzdCB2ZXJzaW9uLCBhbnkgcXVlc3Rpb24gcGxlYXNlIGZlZWwgZnJlZSBs
ZXQgbWUga25vdy4KCkJUVywgd2lsbCB5b3UgcGljayB0aGlzIGZvciB2Ni45IGlmIGl0IGlzIG9r
IHRvIHlvdS4KClRoYW5rcywKCkNoZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
