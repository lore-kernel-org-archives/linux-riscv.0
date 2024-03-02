Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2706DC54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VLoAdATapxW5oDk8zAlNChgfrJgRk2deaYGB4XdODyE=; b=n1Dmgz4XUC1ZL9uEgcrsAF0wHJ
	H5uGimnUNijWO10MMrZG/FgH9yLE1gxqI2+zIdlVQmZYxBgqGzcAfs7OetCdcv8dLQbRETVRaiz5n
	byYtJH2w3Xun4ucbs8/TTWc62Vn+MvVneCNHGIDeNa05IDTVINBCxFJSwjxK0PNOZDJVP3/jw9X06
	92O8iq9yUXol1WiPjrnzVOhbhQkGeroohSIhS0VEDx0sVPeNvHSpg7cK1qahFkKIhp3amBbBpU16L
	SGsAp+Zbv2yBWz6ToDN3NjcNlJRJMB9+ZwF5HC8is4FU4aA6eb6GoFmYke9p7BbUb2XoURhh23tC4
	w7d2EOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgJAp-00000002xov-3iPU;
	Sat, 02 Mar 2024 06:48:43 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgJAm-00000002xoD-0jyi
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 06:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpAdEBUz4jM26sq+ZMwdfZwF4aSY0smSIp284XK0aHYKdalbsyLVoiSDjtJOvSObPwwO6bFzVtPghebojpqZVDAVFmkAr8HrAVjcet5wkn4byP1xpnNk/BaqkPzIhA4qi2XAW+zTnVeQ/lO8icSYYY/8VV1hsxhXPZfrWARWRsYzZj6Cb9vcMC2J7euAPOzRM6hhpEpemr2KtobQbZZ/+kgUWEuRKFqUwhXDpaIUbFXGONz1t4T6QIb8VzFxeaNnr791NQyEubxFekGCGnyjtfN2KLP0BIEaf+JKNZ78JzBVprfAlbMnGfyj8RJ9TnryAchS7J81OvHX1l+flO9c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fkxm5qRAKlJTpCWYqdtTg9bPJSNrG7xT+BXmXiHMBw=;
 b=Ho7kFkq81qK3G7V+4aE9kBECmxGG1iCKILrIId0CxY76rv8NaZI0Zg27j9/bxal2RDrsQbmas9PrtPWAMsFuIqa/IZmpGK/6HInVDZoiHHaWGau+tGBP7yNctZLiwkrWVAQTVdNsSeb7FwJpUMqwfY9QS5K5Lv6NrVmSm0UVPpXThIFq6iSR6Fndz+ClxilJzW7Ymxc8oelBEKdwyH/ioGOqtOeoQr86IM1PrwQS+64c8cJl2upyhCZqw/CzTFzHmjXjTEurHSqGJkNODtDE5wGfRTMmxl72a/U5ID6h+G3EQ55sMr5ZOY9iXsOU7IRK9SJ5N6E2LPrjcsavEfvYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fkxm5qRAKlJTpCWYqdtTg9bPJSNrG7xT+BXmXiHMBw=;
 b=SGGqmNUuR6Vi1J9Bg+oGzEYm2p2JuYtrfGK98WRR58QwIVcKWYxwyHGFUQDg8klDnNfnLmwF8HvPGRAVAYwlAeNvJ0KlrgCqFUlrI5eFgvrlSxyGKNdicXXMHljOu6rarU7fjOpyIjJcvvPY1JihAuFkdgfcFdIXmm/DTcgqnOnT2B3qEo2K/Orjagr8Tx4n1srQw5awDQWOzEZDA7FbcLGXkuJ7EMTxljLm29ZCFr4+XGq+wwi8GxxiwpXcLFCZk5sDdB/X9MsetwZuZGLcXLf+U0IcwGZ04MCZ+QJLcX120Q/MrMKQvzSWzTdvOlNppQLtul0LjArBFbRuNUeMbQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1726.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:126::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Sat, 2 Mar
 2024 06:48:24 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::c5cd:cb7b:1a2a:3126]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::c5cd:cb7b:1a2a:3126%4]) with mapi id 15.20.7339.033; Sat, 2 Mar 2024
 06:48:24 +0000
Message-ID: <MA0P287MB2822315119DA51FF95EE3071FE5D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 2 Mar 2024 14:48:08 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>,
 unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
X-TMN: [a1A6OKQdhZneiQoREso6YjfS6BkXHu9q]
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e75554dc-6f2e-4e20-936e-007d7d9c65f8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1726:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8d611f-023d-4692-505d-08dc3a84bac5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uW3ILBu1SvqoDgZ/z+CFs2z1pew74zGroJmA+0SydEDvxUKbKpeIF4So6ZzRB416mvTnJ9SvvFb00m4zhBTTGK3r4Jlv+0XXhJYZzu7B45R+RSN7PSTOBRM7fyFUV0Etid5Y+Go2z6kMkWuKVTjEoCsEOsN5BaQJ4I8nE9D2E8gsXECHTbbg4M2cdr+xuM96wlbKGHayTwXOuwRND5uUkIpP3ZyZXxvkhyg6O/13rUcfpFXN9OC29nwLAqGv5QY9RUGiMdsIaAH07w9QWG/PePLOYa8yZFKolBiL/lNNM68zoHpU06n/minhXynlVC2zAaa9+/JaTHXNEqqgs2jk3ij1dkGk76aoyX5QCkjJYTlYm5Gzx64itY9+4MkEJf81ACealfj320L88bXYrMqlYR8UQmRsSNnHlNbw8DCKFpql+gshpMEbuRhFnwe3k8EVKrYemB8jLQswKKnQY3nGCncsnOynVbdgGsa+IJCA6d3g7A7Ua9PMHgaIkWMqK7fGiT8KRvyXmp0z5z82T99ESpzShyFekw3eXcU23Ai88k5Sw04AFNXSnxyWIdHZvVtjJlBvdwxwYSKOW+NPvFPlcJrDqNpLPGxzeAFbDT3gIe5owQ7h1YoqVW27Xnb10QrYfnJ/lyCRHSScTtsaEvRvsQg5gVndqI95xc9kJI54yU4BzIxq/bMamMoojtlnv+T1
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2p0azVlcVYzVmFiZGg5ZW40dzM3RGVlOHlDc2dtR0pabjJDVVR4WGo5ZWg2?=
 =?utf-8?B?eHVNU2NET3BxYTVxemlNdlRjazNWVEhTWDQ3K0xSSmdsYXB2Ti9FaHhZVzJZ?=
 =?utf-8?B?ZHUva0VrZ0daaS9XZXIvbHgzbVFwZVZlY21jSHY3OHJXWTE1L1EwbzgyL3lh?=
 =?utf-8?B?UHpPT0ZIZmx1WjZPeHJDeUw1b0RsaE1DNHRQd1Z3aDY0VThoYXQ0L0NHbDda?=
 =?utf-8?B?Y1gyenp1OXl6dnpJQWZYL1NpV1BmbUFmV1NaNGlGbU1qTzkrVEYvREc2UmRj?=
 =?utf-8?B?RkN4L0hwZGM2bTJhWGdNSlJLb0hLNFZ3LzJzM0RKNkx4WmtxVERiT0M0d1F1?=
 =?utf-8?B?N2htWnJINmJLUUcrRlNpT2hMQmxFaFJXYWI1VDhjdk1RZUlPV0NuTXpVSk5i?=
 =?utf-8?B?dHI2b0F2SlQrL1dnVzV0RUZtQ1N4K2hQVEs1M1RodnVsd1lvRWlLaERsa1pO?=
 =?utf-8?B?bVByRnFQR1BkZXlIUzVWVExzcnY5SHdLWS9vV3lzMVlTUFplQURhN2F3TUQz?=
 =?utf-8?B?NDZBSjlHM2JmV3dFV05IMUR6bUtISWlVWjdiWnZCa3dMN294U0w5Q3R5NUVH?=
 =?utf-8?B?ZWRiYnc4YVpsUEZnWlRpZDNvSis2bXdLTTIrLzI5Y0JvWnduTzk3amFUa21G?=
 =?utf-8?B?Qk14dFEvREFqbUIvZXV5Z2NJVCtoVm1wSG52R1krWk9oc1phMnhMbVJUOWw3?=
 =?utf-8?B?TVA4S2hydFVOaUJtdm9KOHdOdDBMMVBYOTRldXhWMlp3Q3c4ZlhkZlVQemdn?=
 =?utf-8?B?WnZleVdvakw0NU5PVG9wZVg1RWE4SUpRS1FEc2VqbWlIczRUMEZXbFlnYUJw?=
 =?utf-8?B?Z09MaDU1RUxqQVpXZkx0Vk5CbEV2VENzREE1QzN5Zk11WUdTdWRuQUhSeFpl?=
 =?utf-8?B?dGRxSGljVmgxTDE1MVdhbXM5SjhKZ1dMZjdMQjEvT2tkS25YUW0xQ3hhbUZR?=
 =?utf-8?B?M08wQWpacWs0dWVzQUlVYzJ5dUFDbU9IZ1FCaDk3YjRFd05SUWdWNk5LMExl?=
 =?utf-8?B?QW10UFkwS1ZadWFXRWx5WVM3R2M2aElKeUIwV0xwSkVFa1FZZFpXWkVyMzI4?=
 =?utf-8?B?bC9hOVpuYTNONVBBRGZXUjRGTU9TVThEeGZoZzJ1cGo1dWMvNVJCYjF5cTRH?=
 =?utf-8?B?RWVqRExrR0xZczVXMUdseWZweWUvT1pmMUk0ZTkyaUI2L05MSzBHdU95MzJG?=
 =?utf-8?B?YmhDNFZtckVpcTJVMFZmeWUzRHNYc1hxcUFBSGpJMVlDN3pSbWVtZmswemg4?=
 =?utf-8?B?RHVRMm9mR05URlh6LzZ4cTNaWWQrcXZoNTNlTlB0R2hVV0swenY3eVMrSFNL?=
 =?utf-8?B?aW9qZTNlSHRhUTZkT1VXUktJR0YrSVZ0S3UwZlpZV1o1c3dTeW03MHZtODM0?=
 =?utf-8?B?SDI4akt2dE13Z29nZC90NG5oOUNjbk4xOFFEUG9JRGYwbE91UFJCYlArSi8w?=
 =?utf-8?B?SjRVSTNjNE5FUWY4bTFjTE54NWU0VnFLNHdNSGtHajQzOWUxbEprZzZXQUpO?=
 =?utf-8?B?RUN6K3JBT3BRc2x1akNGVm5ZVkFhb29JNjVoRko2TlFCUWNtNGFxOUtCQzdp?=
 =?utf-8?B?Z2NCNlRjR3FiZW82bjlSVlpZUHIrai9XaWcxZVh3ejFnMkJpVm1lb0FBM3Ns?=
 =?utf-8?B?RHJLTE9IQUJZb21LY2lCa2lYZTlEY3l1YXU4RVA5Y3JPSktUcVpxcWNReUVN?=
 =?utf-8?Q?0rP/vHG3ci4V5sG8L1Zn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8d611f-023d-4692-505d-08dc3a84bac5
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2024 06:48:13.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_224840_257698_BFFEF9CA 
X-CRM114-Status: UNSURE (   4.70  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKVGhh
bmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0MWJjY2M5OGZi
NzkzMWQ2M2QwM2YzMjZhNzQ2YWM0ZDQyOWMxZGQzOgoKIMKgIExpbnV4IDYuOC1yYzIgKDIwMjQt
MDEtMjggMTc6MDE6MTIgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiDCoCBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCByaXNjdi1zb3Bo
Z28tZHQtZm9yLXY2LjkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwZjQ2ZTEzMzll
ZjExM2YwZGVkZjdhZDM3NjQ1MmNjNzIyZGJjZmU2OgoKIMKgIE1BSU5UQUlORVJTOiBTZXR1cCBw
cm9wZXIgaW5mbyBmb3IgU09QSEdPIHZlbmRvciBzdXBwb3J0ICgyMDI0LTAyLTIzIAoxNDoyMTow
NCArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVzIGZvciB2Ni45CgpTb3BoZ286CkFk
ZGVkIHJlc2V0IHN1cHBvcnQgZm9yIFNHMjA0Mi4KQWxzbyB1cGRhdGVkIG1haW50YWluZXIgaW5m
b3JtYXRpb24gZm9yIFNPUEhHTyB2ZW5kb3Igc3VwcG9ydC4KClNpZ25lZC1vZmYtYnk6IENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaGVuIFdhbmcgKDIpOgog
wqDCoMKgwqDCoCByaXNjdjogZHRzOiBhZGQgcmVzZXQgZ2VuZXJhdG9yIGZvciBTb3BoZ28gU0cy
MDQyIFNvQwogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBhZGQgcmVzZXRzIHByb3BlcnR5IGZvciB1
YXJ0IG5vZGUKCklub2NoaSBBbWFvdG8gKDEpOgogwqDCoMKgwqDCoCBNQUlOVEFJTkVSUzogU2V0
dXAgcHJvcGVyIGluZm8gZm9yIFNPUEhHTyB2ZW5kb3Igc3VwcG9ydAoKIMKgTUFJTlRBSU5FUlPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
MCArKysrKystLS0tCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIHzC
oCA5ICsrKysrKysrKwogwqAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
