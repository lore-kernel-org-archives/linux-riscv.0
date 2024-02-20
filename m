Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE1CC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 01:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0XJmfCZRzdPub6HrkaoyRw86jNo57bY0z4bkQn8o6Q=; b=JDMk4m7lajZlWaN2nWjFyc8FYq
	Z2czJxox8mRb+Fhpre3ofnwXypDYfKPwoT3/9+LzmBzOciiP5M7AU7vx6ZsMl5r/cbKH8C7jjL8vb
	PM0tTu48E5Mvarxx/TVb8DrvUNDDFbdug1ifNvsL+eCICo7nfrV9TjUebXsOOv0wncC9IAdqOCGXx
	efTbtcBJSvqoSHTS7COAXXTpfk7Il/VYl/6Q5hZbtIv4pl/0J6Ai3I82snb/hMj3kXYrbis6RAJ+j
	ORaIyOPpu5okV0qKatS0y/r7Oyjg4Xv5f51l6QM1NUZiUculKaTYBI7g7RRnh2aP3mmKSBCXG+yWo
	2Odx6QPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEqX-0000000Cjft-0cS0;
	Tue, 20 Feb 2024 01:22:57 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEqU-0000000Cjeq-2W7X
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 01:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHMqdI8EJnUNKno6z3H3xKFKm0F1/BegYXP5fJxfja030lXcggLs0x5CHOiG01fwK1Bcnz55R2tpBHfKjD0OT+aq/FXZ3wUbhE2Fg6eqAwpsybLp3ECUooE7cPFZ8mRKrU/osBzRaxJTBBIWpw9sHy8puwutlJiOGCQ1Q/bWgqf0FgBLuDlOULPSwF1d5svW49R+sKofnkHqmlVrgo2zIDUIVwrHck7U4IFRZKE08KH7Af0+yrRU+hVHZupHt5KKDdCTkv24bgwu7wjquZVHJw0mChJUzimXBte15jgjbvqc4TV6oInBJVxqMGsvS7EGiipM/sriB6PYbtk6paIBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQBq46gA80BhUPyzmgunlK+x7pDE/RZONsNlUwyMO7U=;
 b=O+Ul9WWSMOvfMCkq+2UCoVq9SkEU7KM5JIXyRv3Vw1DsKH9oQdelIEQpYR59OET5DmHV4ic18JjI9BO6cxlY2pBkSoardnx0DVMR4ssMkyByxlHqwv3xy5aSRxG1CI4tEv/We+MD0zIbnQr1NC9jBPgrMjWGn7lMWGxlgYMl3rET6pYmiWrR7kYg89ZdTt1GGreZZzyNgGsUnjDvWrirMQuBOjRuBJjEzjoAqi1GKhurGzzKjEhgL2YQ7jSEkzyFoPsWAfgnHGvmrA9BoRTkEv0rnOeRamoQbB0DCAUOH7gX6jkke3z7wVreKwqS0dLZM4MRJNrXKdz7up8Pnt/Sfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQBq46gA80BhUPyzmgunlK+x7pDE/RZONsNlUwyMO7U=;
 b=Vw3xoRSN3bw/HCvA/k1NSNt6hww4KNnOEnVcPIgtTLmOyJdscwcUlRB83mR5P9+sKl2N2T7BxXYbmGCbPLM4v01Dmn3uBljaKGpBoVbSC8Xf8CHanL4ZKp//pg4wh1/0rvjApSwJB34a1HutmSRTC0X9Ydl5ESdF1DPnlnfbZqMV6QFtZWslqpJcmlSF1bNP0osbFwcJD2w5BEMih8LhNviF37gBJJ8SusYax+hmP2NY455hkt8KO09fvtMuwzgKCht7ztc3Eu652C3/E0QFKrbQN8bXN4Jp96fbAXvj85RJFWcmtvKIUm7zt1PHxKhco9VM5k1FF9mjWLqF9L/YAw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB1805.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 01:22:34 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 01:22:34 +0000
Message-ID: <MA0P287MB2822D28F96F1A0E76943FA15FE502@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 20 Feb 2024 09:22:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] riscv: dts: add clock generator for Sophgo SG2042
 SoC
To: Guo Ren <guoren@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, jszhang@kernel.org, inochiama@outlook.com,
 samuel.holland@sifive.com
References: <cover.1708223519.git.unicorn_wang@outlook.com>
 <dc899c89e5c30e2267965f185b52d6dded4eb1ac.1708223519.git.unicorn_wang@outlook.com>
 <CAJF2gTRPU6-8Wwds=PRREjU3W0cmCpBcc=w7=J9p_y+XSd3o6w@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAJF2gTRPU6-8Wwds=PRREjU3W0cmCpBcc=w7=J9p_y+XSd3o6w@mail.gmail.com>
X-TMN: [T694EED5EStVhQFksPAETG6khaqgINra]
X-ClientProxiedBy: SL2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:100:2d::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <d77c95a0-3f5d-41cc-9303-06090019796a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB1805:EE_
X-MS-Office365-Filtering-Correlation-Id: 6965ed44-dff8-4a3a-3424-08dc31b268f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tto+YNw8J8/t/hSdv481wJfsIrti2RG0H3+/z70eiBnzANUapu2BPURFqBFOcineauFm1Oqx8v4rXbGuyXwSUGks5o4LEURB3r73T2yv6qNcWUM9skiuQcMUYdHmymeHZ184Tk/ytminWVy+opQBH6omfUdVEmOFP/g94ZUeqIQnDsw+2S6mcVeNa2YAUVjbz9r23XZ2LHNWg4ep0x7QXb7TsR+uXohNNdYmgn8I48sNQ00RZxLpb8zGYGGd7unfJlkbuELe1dyDQ1tH3otmymnAtziaYjP+40jy6K7rFrQn+eQg2nS9qd7/HDFF9oeRkxsyPhggVjkq4MX2hW0JI+qRh1OOsiVQNibiC0NMA3mQFDuU3VGxSgPcoDdVErlHade4gl72KhTVYeirdl8q5NibVSsJhvv4Oh/BcZATitLoARGjFrjFQKptXaA9z6o25X/b/FEETwL0bWENEEaZtn41E6Jgr0eYKBiQ3TqqI+xDfvPHIqz36EGnUwp7g4SNjX5u8A6Ii+wAi5tpeCPprGabf/836EsiYnLUO1+g6aaV7dD0eubZW59d1tat9/31
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVlbUVrRG9GTjVTcVRYSERvVytVemhKUmI4UHh5aHI5NGdaZnhqdWQ5TzY5?=
 =?utf-8?B?M3FSZG1QSjgyK24xR0hPNWJtM2duREhIVlJYNWVSL29ERlcxOHZTNWkxK0I5?=
 =?utf-8?B?SE93b25qZnFuNDZTTGRtVzBLY25SZFpnb3dQZFJRb1BkSVY5VWJVVW1JaU1i?=
 =?utf-8?B?MDU3UjJld2lhZEM5UEo4aURXVTJPYkNqZEVBZm13UEo0b0lBN0ZneTQ3Vk9H?=
 =?utf-8?B?bEJHVmszdGQ3K0o1TDlvQ1NQRXZrUGdiYWZtRzN4Y0k5bEI1aDlpWHRyajNE?=
 =?utf-8?B?K3N4WEFSYWFEQjd4c2VEcTkzSkpSME1ZZ3JYbVFCaUxieS9YT1FIZGpkR0h1?=
 =?utf-8?B?OGNWRVVoT3N1MjBnb2pydkJCcGdVME9IdlhMOTZiSUxvL2RNZFFZdVJIdGJp?=
 =?utf-8?B?b3dmU1JUamVUV2F6UTZHYk1IMmtEYUI2bkxVNC9uSXBxSGpiZ2VaQWlFSU82?=
 =?utf-8?B?MkhOUE9FT3EyMlh0TVVyeXkxZFBDTzgvMjJzU29seCt0YVVHVWRuT3ZrTk9M?=
 =?utf-8?B?d2lIUVRpaWZjT0xERHZMYTE5UThjZURLQWVHTzBSZk5YSGErWHFnSThOKzZi?=
 =?utf-8?B?cW1PVFlycHkzWGxnWEhtUTdRQkVCVEJBNE5JZUZLK2tlRXhHUzBZVTkzQ0J4?=
 =?utf-8?B?VlFWQjJlSGQrS2tUUTFXRXRUdFE2Y1FHSnNQcEhaV0hHT3JlL2FRM2d2b3lo?=
 =?utf-8?B?d2ZKWU5GNVJIZ050WVZMWFA5ZWc2VWhoU0s3SzlYS01ZaWZvSzNTZlNXUkx2?=
 =?utf-8?B?RGJ5UXlwcTh5SmY1b3N1ME5PS094dVJoWXJRdlFYRFNMSmxJUkNBVmRiZGNn?=
 =?utf-8?B?c0xXY2lCSUVxS1c2L29VOXFYNjVwbVBuZjA4cEpRYlRxWlFFbjVlSEpPTk1p?=
 =?utf-8?B?VzF4bnIvZXh1KzJnOHVOTVBNOE5wS2VnUklxYnVTbVFHaXd5MGRTNzBpSVFV?=
 =?utf-8?B?TExhdjRtL1ZreFhubTRTbFczZFFuL2g0QnNRTTY5QXJQZWFCckU2L2l2OGEw?=
 =?utf-8?B?S3hIaDAxWVZ4V1FRRDZlZm9DNTcybjByZ1ptc1VrWU5XSWlMYk9QVFJaOS9Q?=
 =?utf-8?B?VzM1MDFROXJ4YTJ5YmNHbkhvYy9PMGFCWm1mVU9ScHZXQ1ZLVUJ0bVVxNGlv?=
 =?utf-8?B?MzZ6N3BJUFBuRTVJVU5qL21ydVl4OTRGaU9CRnQzaVppUmJ6Z1d5cjVQQkNv?=
 =?utf-8?B?Wjd5dHZRcEcycHBzWVh5ekpqRnhNeS9QOVo1TmZ5cW5WSzJtRGFUQW5zQjQ0?=
 =?utf-8?B?Y0swTWYxUlZGMmNUYjArb0kvNmxMSklNdm51dHRFd3VwS0o2WWFSR040Wmg1?=
 =?utf-8?B?OThHN0lpTW1yS0JQR0lUSk5MT0ZtRjY4MVkxT1p2N2YvN2d0S3pObzBleE4z?=
 =?utf-8?B?ckNWdmJ1b2xISFo5RzkvMTJzNXhjY3ltRkwxMnZwUzdRT1JPSnFVSGZWOWg3?=
 =?utf-8?B?S0F4Z2g1cmZjVENtL1J2dktLeVp0R1U0Y0ViTEdvdWdPOXFLMGhkcW9aWUZ1?=
 =?utf-8?B?bzJRWUlTTnVIdWp5UWdxTlFMSkF4ZUYyaCtacFFMTlNxOVVSSVNLSjYzcHdN?=
 =?utf-8?B?VWRTeE54TmtkNDR5Z3liclNiYm02SkYwSm9XYmMvSHo5SkM1U3QzcmVpWHho?=
 =?utf-8?B?TmpTOHlpVVpaMUlFOXd2R3hvVHVRNlVVRFNpbnZKZVRHbjN3czdrR2xPSStk?=
 =?utf-8?Q?yxK+rSOY2I6NrwYtcbtD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6965ed44-dff8-4a3a-3424-08dc31b268f8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:22:33.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_172254_671482_2D8F9C25 
X-CRM114-Status: GOOD (  12.28  )
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

Ck9uIDIwMjQvMi8yMCA5OjE4LCBHdW8gUmVuIHdyb3RlOgo+IE9uIFN1biwgRmViIDE4LCAyMDI0
IGF0IDEwOjUy4oCvQU0gQ2hlbiBXYW5nIDx1bmljb3JueHdAZ21haWwuY29tPiB3cm90ZToKPj4g
RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Cj4+IEFkZCBjbG9j
ayBnZW5lcmF0b3Igbm9kZSB0byBkZXZpY2UgdHJlZSBmb3IgU0cyMDQyLCBhbmQgZW5hYmxlIGNs
b2NrIGZvcgo+PiB1YXJ0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5f
d2FuZ0BvdXRsb29rLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIt
bWlsa3YtcGlvbmVlci5kdHMgIHwgMTIgKysrKysKPj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwNDIuZHRzaSAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrCj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPj4gaW5kZXggNDliNGI5
YzJjMTAxLi44MGNiMDE3OTc0ZDggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cwo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPj4gQEAgLTE0LDYgKzE0LDE4IEBA
IGNob3NlbiB7Cj4+ICAgICAgICAgIH07Cj4+ICAgfTsKPj4KPj4gKyZjZ2lfbWFpbiB7Cj4+ICsg
ICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPj4gK307Cj4+ICsKPj4gKyZjZ2lf
ZHBsbDAgewo+PiArICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47Cj4+ICt9Owo+
PiArCj4+ICsmY2dpX2RwbGwxIHsKPj4gKyAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAw
MDA+Owo+PiArfTsKPj4gKwo+IElmIGFsbCBhcmUgZml4ZWQsIHdoeSBkbyB3ZSBzZXBhcmF0ZSB0
aGVtIGludG8gdGhyZWUgcGllY2VzPyBUbyBzaG93Cj4gcmVhbCBpbnRlcm5hbCBoYXJkd2FyZT8K
WWVzLCBhY2NvcmRpbmcgdG8gVFJNLCB0aGVyZSBhcmUgdGhyZWUgaW5wdXQgY2dpKENsb2NrIEdl
bmVyYXRvciBJQykgb24gCmJvYXJkLgo+Cj4+ICAgJnVhcnQwIHsKPj4gICAgICAgICAgc3RhdHVz
ID0gIm9rYXkiOwo+PiAgIH07Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwNDIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNp
Cj4+IGluZGV4IGVhZDFjYzM1ZDg4Yi4uZTcwYzQzZTJjY2JlIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+PiBAQCAtNSw2ICs1LDkgQEAKPj4KPj4gICAvZHRz
LXYxLzsKPj4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJx
Lmg+Cj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1wbGwuaD4K
Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS5oPgo+
PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItY2xrZ2VuLmg+Cj4+
Cj4+ICAgI2luY2x1ZGUgInNnMjA0Mi1jcHVzLmR0c2kiCj4+Cj4+IEBAIC0xOCwxMiArMjEsNTQg
QEAgYWxpYXNlcyB7Cj4+ICAgICAgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0MDsKPj4gICAg
ICAgICAgfTsKPj4KPj4gKyAgICAgICBjZ2lfbWFpbjogb3NjaWxsYXRvcjAgewo+PiArICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+ICsgICAgICAgICAgICAgICBj
bG9jay1vdXRwdXQtbmFtZXMgPSAiY2dpX21haW4iOwo+PiArICAgICAgICAgICAgICAgI2Nsb2Nr
LWNlbGxzID0gPDA+Owo+PiArICAgICAgIH07Cj4+ICsKPj4gKyAgICAgICBjZ2lfZHBsbDA6IG9z
Y2lsbGF0b3IxIHsKPj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2si
Owo+PiArICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gImNnaV9kcGxsMCI7Cj4+
ICsgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4+ICsgICAgICAgfTsKPj4gKwo+
PiArICAgICAgIGNnaV9kcGxsMTogb3NjaWxsYXRvcjIgewo+PiArICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+ICsgICAgICAgICAgICAgICBjbG9jay1vdXRwdXQt
bmFtZXMgPSAiY2dpX2RwbGwxIjsKPj4gKyAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDww
PjsKPj4gKyAgICAgICB9Owo+PiArCj4+ICAgICAgICAgIHNvYzogc29jIHsKPj4gICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+PiAgICAgICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Owo+PiAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+
Owo+PiAgICAgICAgICAgICAgICAgIHJhbmdlczsKPj4KPj4gKyAgICAgICAgICAgICAgIHBsbGNs
azogY2xvY2stY29udHJvbGxlckA3MDMwMDEwMGMwIHsKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBsbCI7Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweDcwIDB4MzAwMTAwYzAgMHgwIDB4NDA+Owo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNnaV9tYWluPiwgPCZjZ2lfZHBsbDA+LCA8JmNnaV9kcGxs
MT47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPj4gKyAg
ICAgICAgICAgICAgIH07Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIHJwZ2F0ZTogY2xvY2stY29u
dHJvbGxlckA3MDMwMDEwMzY4IHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJzb3BoZ28sc2cyMDQyLXJwZ2F0ZSI7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDcwIDB4MzAwMTAzNjggMHgwIDB4OTg+Owo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBjbG9ja3MgPSA8JmNsa2dlbiBHQVRFX0NMS19SUF9DUFVfTk9STUFMPjsKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+PiArICAgICAgICAgICAgICAgfTsK
Pj4gKwo+PiArICAgICAgICAgICAgICAgY2xrZ2VuOiBjbG9jay1jb250cm9sbGVyQDcwMzAwMTIw
MDAgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIw
NDItY2xrZ2VuIjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NzAgMHgzMDAx
MjAwMCAweDAgMHgxMDAwPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZw
bGxjbGsgTVBMTF9DTEs+LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBs
bGNsayBGUExMX0NMSz4sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmcGxs
Y2xrIERQTEwwX0NMSz4sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmcGxs
Y2xrIERQTEwxX0NMSz47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9
IDwxPjsKPj4gKyAgICAgICAgICAgICAgIH07Cj4+ICsKPj4gICAgICAgICAgICAgICAgICBjbGlu
dF9tc3dpOiBpbnRlcnJ1cHQtY29udHJvbGxlckA3MDk0MDAwMDAwIHsKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1hY2xpbnQtbXN3aSIsICJ0
aGVhZCxjOTAwLWFjbGludC1tc3dpIjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAwMDAwMDcwIDB4OTQwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDA0MDAwPjsKPj4gQEAgLTMz
Myw2ICszNzgsOSBAQCB1YXJ0MDogc2VyaWFsQDcwNDAwMDAwMDAgewo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47Cj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDExMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw1MDAwMDAwMDA+Owo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2dlbiBHQVRFX0NMS19VQVJUXzUw
ME0+LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa2dlbiBHQVRFX0NM
S19BUEJfVUFSVD47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImJh
dWRjbGsiLCAiYXBiX3BjbGsiOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnLXNoaWZ0
ID0gPDI+Owo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Owo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gLS0KPj4g
Mi4yNS4xCj4+Cj4gT3RoZXJzIExHVE0uCj4KPiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
