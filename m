Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF5D17148
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 00:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3vn5wGYrtCk+8ikwX+YCUIX60+ldiYt7fOsE9nk8ms=; b=fTx7CUGGOSVP2MTxANJbZX+yG5
	a4GLUTHuNRKoGCvX/nXWyXT/WWOhELI8EdWuR6AMmwuIYj42qA4zVcxCYaDn5wLM/TbHP5JCGZ88/
	uabJWQ+dOy0PjZmYLjivitE3NeKK8bIeqkgboOz2mYjcSaeD1mf+RIV9XDsUGF+YcDrSp0wGqxOfx
	7v3cT7CiBvhhdAys63NeQtcMQxj/XYCo4aJNOrSXHazQFqry3oKeB+HOPHokPxLS3ndy0C40k9sj4
	IcWH9ZKMszWRQQNwtE7a03QZZowIR12fhklEgHD2SLWKJUfEmQlRCeTfLYcTbau8bBqulHD9ZX1iq
	VB/p6SUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t32Ko-000000090Kt-2d1n;
	Tue, 22 Oct 2024 00:01:14 +0000
Received: from mail-bmxind01olkn2082d.outbound.protection.outlook.com ([2a01:111:f403:281c::82d] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32Kl-000000090KP-3zQy
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FafXmeh3EQYrZGv8XFuhgKYbkxRxttvtYBnefdjGik3+LMqPJJgHUUIB/IpZFxA4jpE5VN6Kgq9bh0cPo4vhJfhE5rLA1wGP8Xc+22AGcixQvDvxexRKAKm0sw2V0dpo+ySfB3+dqxWb+cepcLaL1iX7PCuZOi/P+DE3lbE3hZ5WzH6KVtVylD9GsfdSERI1AmFhJlkE39URTj0ykFqg+TOnBycfgj1ogKKkPFPv5v70kL1zRrfHwVixUg+hs8xrgzl0eXptm6TRJXubteDeofljHsVx0CqZ1xmo79WOJKQV2/PtDcYkJ2zXbCkgG9bVGKUTngudUx73UmQTlglu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjsdPWen/+4LcIJ9uvtU/REM/BoF4LTHcqWcgdIGfRs=;
 b=oa8MVLR2/P+7offOya35FSmZdjNfx5u0qAlQZFmXhmqBMesqxWP+qi0vFnrQjmwhpf1EURb1uNM4BNKU7XhI9QzmCMhd0B04A6J5t5S5PudDQzvRZrUUa85xObZ2xw5mz/gt1m9wDwgMnB53a4cwR0UFb4OZ/Iu1h8q5tSb96AwYPIOOb0dZGssxgIIT3iyRPLs27iiCYPFs9T0tue/5e1K1cMRQO7PrWgLiBpHUAQsq/6KDwZWYE+UI+o9SEuXKmjt68j/4l2r72kZokZ/5ibiw0tuJmR4wxpiFZNiJQUvah78YoqVSaOd3/uDX6JOmJ5XOi5v3dRR53IZW5C95GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjsdPWen/+4LcIJ9uvtU/REM/BoF4LTHcqWcgdIGfRs=;
 b=B7EHuFsIyRm2KsSCvQxA8Ov/xA17PpNiEyKgOxIOHgTYlrv4w9/aTvKwnOjDOtNJVs108ObAXjBdsvQkw+icWcc98DMA0nbZpW84gfTT3f9WfgSFshf2bm2DDwi3s53zsL7pM2kk/OK50hSYlgWqrMQZdcT87rBVvxep8bqN61aW/R0KgbxWeICeJyuoLC8WeIpn1SMKyjBaY7C0UrcDRTeR5aLsL7KmC6fXtZbBvExUZ20m0PGUmwSFbGW/u3/gAEop/ziZ07EUlbWsSNIEVhYuU4L2jVxFs+xM7i6KMuDqRrm99PkKJDH+qo0j80djA6SqzJ85TF+cN/yU0307Fg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0857.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:175::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 00:00:56 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 00:00:56 +0000
Message-ID: <MA0P287MB2822808440B26B1C445118BAFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Oct 2024 08:00:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] pwm: Add pwm driver for Sophgo SG2042
To: ukleinek@kernel.org
References: <cover.1729037302.git.unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1729037302.git.unicorn_wang@outlook.com>
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <ce80a5d9-67a1-4695-849e-9dd7c1da258f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0857:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f7e59f-6032-45f2-284f-08dcf22c9a6a
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|7092599003|15080799006|6090799003|5072599009|19110799003|8060799006|1602099012|10035399004|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZnY0hPQlprT29ZS2taSmhPYzAwTkZwSkt5VlREenI2L1hnb3VhOU9yaXkx?=
 =?utf-8?B?ZnBLOFk4eGVUZkk5U3RjT1M5Y3J6TE1EdGJMeGQxRng5K09aYzJsamxKMGdP?=
 =?utf-8?B?MlFQT29uVHB5RzdCQjB4RjBvb01wV3VpcFplZVNJMUZBamxhem14K1k4ekRk?=
 =?utf-8?B?UGFUdlY0bVhhN0RzUU9VV210UUxpSVhnUlUxRXliNHJGU0lHQmVQZUtrbUpi?=
 =?utf-8?B?bVhSN2V6ajhKeTBreWVXbGhyeEI2eXFkZXFnMzUxUTM1VkhJa2RDME43eVI0?=
 =?utf-8?B?SWFHbTZOMUsvQXgybUNCNFplTTJuY2xxOXhnaEVGbWNyM2VwS0x1UytxYzVu?=
 =?utf-8?B?bTJpZnRJL0hPQVUrSCsrZGhqTnFjTmc2K0FROG0wL0lLVHpNWmhWcUZxaGQz?=
 =?utf-8?B?OFMzcFJEbThwK0o4NTVZRVBEdi9UWFNEbE4rZUtSZ21hMjlWYms5R05uMk14?=
 =?utf-8?B?YStHSnFnSnZ4Tit5RXc5WnlXcFhnaUtxaFBiTk53LzJkcHo5K2dTWEczRUdm?=
 =?utf-8?B?VnorckgwVDhkWUtZTjZZam9NTkRyenlxUXJGN0laWHcyQzVyM3hOSXlBT2tn?=
 =?utf-8?B?UFhCS014RlBLS25oSkl1YUw5cCsxZXZsaVUzdFNJUkZGYzdIQlYwRjA3OWds?=
 =?utf-8?B?RUxEbWFzcnhNMi9ReVNEK3c0alRscWNCOWNQUWRsNHkxcVNpa1ArREhGeDEw?=
 =?utf-8?B?bEFRdUsvOXVQWXVIUDB3ODJLRlVDa0pzUWRtSmxWaFVnOTFGWVludytCQnht?=
 =?utf-8?B?bW1LVDRCYmdJS2k4RXlneGlmaXA3UGZGOVJPZG9sRk90eDIzR0ZMNGNnMlZQ?=
 =?utf-8?B?WTloRHZISmJIcmsyaXBLYTY0OHFsNytnUlQ5amI2WmxhUmpZWU9hNVVIWUlK?=
 =?utf-8?B?bHpBR0RZejkxcms1YkJTdnZuV1JsYytoNm96OStNRG4vUldJeHVMcUMxcUxm?=
 =?utf-8?B?Q1ArWVgzWFV0dHF2aWpMQXQ1YnFxT2dvMFIxM2paa2IwRWJLYzdKUlU4ZDFS?=
 =?utf-8?B?Y2Qzc2RHbEp0OUJEV1B5bDlTbC9TWGhxS2VZL25rRmxxbWF3c29TbEg0OXRP?=
 =?utf-8?B?TUVWelR4d3Z0Uk9rYnBublV0dlhwL0FvaGNWWkludzNBVzhJcjEyQzdqd01r?=
 =?utf-8?B?T25SYnYzNlhVRlRGa3pHcnJjeU5nM1RJZDQySVl2Zmk5UzRKeHNPTk9reUhs?=
 =?utf-8?B?UVB2OHFQMHVad2ZleUYzSW0rN05JektHUkRpUlRSaUpGMU02czdsdTNwYld0?=
 =?utf-8?B?NVNtTDNWVnFrQysyVGlFQnBrWnRJZ3I1YlhqL1hvN2xaOWVXQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3ZBVk45UGdzTFdxL2RIbTFRTlc4aGhBNHAweU93MU9FRU9sTFhkbWxxLzVh?=
 =?utf-8?B?aTNHdlhYSmt3YmlET1d5YlJISmZVZC9ibTZFQy9RNC9BV1RwaVd6OUlmMURZ?=
 =?utf-8?B?RTNaNGpkNS9XUVJuTDd2NXhKQm5oYkE4ajA0T0NRelpuS29YV3VCUXJsbnAx?=
 =?utf-8?B?T3U1bms3RlhGUE10VXZ4SlhDMlJTbWJ5OEdlSGRRa1ZIZFRCVEJWTHhxaCt0?=
 =?utf-8?B?SER1eHdERmd6WUFxajlwaGtqNExsRGVUQUJwc3RSUStWYkF0RmpLaVNDbmVt?=
 =?utf-8?B?UEpEVUMwMWZTL2UvT1Y1eGlBWVhlWXBXcTJrMkdxblpUcUdZb3I1SS81bkh3?=
 =?utf-8?B?dWR3NXZoUy9wNjdqeVo5YzAvOUVRc3N4VVBsM29EeHJCZDVna2c2VTVPcEps?=
 =?utf-8?B?RC9wRThVZzNxTmNPRkNUUmx0TVJDd25mS1VSRVRqc0tjZDlBTmtMT0hWQmJs?=
 =?utf-8?B?Qmc2ZGNkRCtzOElBTlhJakM5eUw2Z0o1a3ZVUktwUk9VbFZrajZabUlUdjV6?=
 =?utf-8?B?czNPell0b2NlVmpZUHZhUUVwLzRYWmlQR3hxdlNFUzRYbmRZYUlwMHBURlBG?=
 =?utf-8?B?WXFEd2l2enh1R0N1cmNoQTlia0RDb1BvYnMvSytjbzdsRlhNWjVuWmJ5Q1Ew?=
 =?utf-8?B?U3EzUEIvdTQxRU5ITGkvM01Wb2JwQ25EL0RkcW5TcjhFNXZ1MDV3YlY4ODJ1?=
 =?utf-8?B?SFdySnRGMDZDZUFRSEZwYWRhOFdzQlhadXlubmVOOWZQSzlZck4wcTZZVnRN?=
 =?utf-8?B?dVBjYzlCSXdhSmxNMy9NbHJuTmw1bkVZdzVlZU9kMkZVb2MweXdFTUZIbHBC?=
 =?utf-8?B?YjNnYUt2MVhCZVRXcnZnZEJrZVFZWnlkN2hRV2RMSUNRNStHQ2VVY1gxRUZn?=
 =?utf-8?B?K1I1L2JIUkd4UVBmdHZ3bDNmbDBwVU1QMnNDOGF0SHJIYk9iZjZkY2VpMHhQ?=
 =?utf-8?B?bEJmZmljb3FFUXpTMklXamc4L1RaTTlSeEpjS3hUdGNOVGZEQnJUdVdBQTZm?=
 =?utf-8?B?SWJtaU01djlLREd4YTgwa3FXckJndGk1d1BhWkttYWJOaElZT1czUDkwb25O?=
 =?utf-8?B?alRrRHpYY0lXL1FSeEFwNFJmdGtCdFdWd3dSZitNOWhVVHJHaE1GUUlaQzBX?=
 =?utf-8?B?NFFnRkl0YzNhRGJVWmVrOS9ZN3h1ZmVHRlJlNThsaUFUWGszM2lkejI2ZkVm?=
 =?utf-8?B?RGpYaFFSTXJTdWM4dzBrT1o3YW1JOVV5c2w0Z1RnL0VQOXAyaStOeTJLK2Vk?=
 =?utf-8?B?VXFWK3FrK3E1dWFQcCtQbHJQdHY5SkhnMDB4V1NiRUFHcHZWQ3VBMzRsYkxX?=
 =?utf-8?B?TVordE4yZEZkbEE3T0JZczZhQXdhNDdXbW12OGUrNGxQZXE2VzdwWUZWNW93?=
 =?utf-8?B?Uy9jd0VGWVd1UXROTHZHU3J1ZTBBRWt1SFg5bWNad01QWUpESURnV21adEhh?=
 =?utf-8?B?M082SlNzYmVPT0o3UUxnMkQ2b2lXZUVEdTFqUDBLNWYrcENBTThnb3BlNkZK?=
 =?utf-8?B?Tmo0Z2JDbFlXN0FmcENMSXBvbk1ObG41QlZid2hpUE5sU0RDaFNJWU85Vmlk?=
 =?utf-8?B?Z3plZTMvdDdrOWNwKzBRaXNkZGk4RGptS0UvbUdqN1NybEtoaHN6WmpUR1RJ?=
 =?utf-8?B?MW5MZmJ2V1FVWmRvT3BqTlQ2d1lXL0Q5UllrblhLSG5XekVpVElmNnV4NDdR?=
 =?utf-8?Q?kYRilImHSLcFLFZMLKGK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f7e59f-6032-45f2-284f-08dcf22c9a6a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 00:00:56.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_170112_030146_14005D59 
X-CRM114-Status: GOOD (  16.82  )
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

SGVsbG8sIFV3ZSwKCklmIGl0IGxvb2tzIGdvb2QgdG8geW91LCBjYW4geW91IHBsZWFzZSBhcHBs
eSB0aGUgYmluZGluZyAmIGRyaXZlciBwYXJ0IApvZiB0aGlzIHBhdGNoc2V0IGZvciBuZXh0IHY2
LjEz77yfRm9yIGR0cyBwYXJ0LCBJIHdpbGwgaGFuZGxlIGl0LgoKVGhhbmtzLAoKQ2hlbgoKT24g
MjAyNC8xMC8xNiA4OjE5LCBDaGVuIFdhbmcgd3JvdGU6Cj4gRnJvbTogQ2hlbiBXYW5nIDx1bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiBBZGQgZHJpdmVyIGZvciBwd20gY29udHJvbGxlciBv
ZiBTb3BoZ28gU0cyMDQyIFNvQy4KPgo+IFRoYW5rcywKPiBDaGVuCj4KPiAtLS0KPgo+IENoYW5n
ZXMgaW4gdjQ6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMi1yYzEuCj4K
PiAgICBVcGRhdGVkIGRyaXZlciB0byBzZXQgcHJvcGVydHkgYXRvbWljIG9mIHB3bV9jaGlwIHRv
IHRydWUgYXMgcGVyIHN1Z2dlc3Rpb24KPiAgICBmcm9tIFNlYW4uCj4KPiBDaGFuZ2VzIGluIHYz
Ogo+ICAgIFRoZSBwYXRjaCBzZXJpZXMgaXMgY2F0Y2hlZCB1cCB3aXRoIHY2LjEyLXJjMS4gWW91
IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QKPiAgICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBb
M10uCj4KPiAgICBBZGQgcGF0Y2ggIzMgZm9yIGR0cyBwYXJ0IGNoYW5nZS4KPgo+IENoYW5nZXMg
aW4gdjI6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMS1yYzYuIFlvdSBj
YW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQo+ICAgIHBhdGNoZXMgYXQgdGhlIGxpbmsgWzJd
Lgo+Cj4gICAgRml4ZWQgZm9sbG93aW5nIGlzc3VlcyBhcyBwZXIgY29tbWVudHMgZnJvbSBZaXh1
biBMYW4sIEtyenlzenRvZiBLb3psb3dza2kKPiAgICBhbmQgVXdlIEtsZWluZS1Lw7ZuaWcsIHRo
YW5rcy4KPgo+ICAgIC0gU29tZSBtaW5vciBpc3N1ZXMgaW4gZHQtYmluZGluZ3MuCj4gICAgLSBk
cml2ZXIgaXNzdWVzLCB1c2UgbWFjcm9zIHdpdGggbmFtZSBwcmVmaXggZm9yIHJlZ2lzdGVycyBh
Y2Nlc3M7IGFkZAo+ICAgICAgbGltaXRhdGlvbnMgY29tbWVudHM7IGZpeGVkIHBvdGVudGlhbCBj
YWxjdWxhdGlvbiBvdmVyZmxvdyBwcm9ibGVtOwo+ICAgICAgYWRkIC5nZXRfc3RhdGUoKSBjYWxs
YmFjayBhbmQgb3RoZXIgbWlzY2VsbGFuZW91cyBjb2RlIGltcHJvdmVtZW50cy4KPgo+IENoYW5n
ZXMgaW4gdjE6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMS1yYzYuIFlv
dSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQo+ICAgIHBhdGNoZXMgYXQgdGhlIGxpbmsg
WzFdLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIu
MTcyNTUzNjg3MC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbMV0KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI1OTMxNzk2LmdpdC51bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20vIFsyXQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2L2NvdmVyLjE3MjgzNTU5NzQuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bS8gWzNdCj4gLS0tCj4KPiBDaGVuIFdhbmcgKDMpOgo+ICAgIGR0LWJpbmRpbmdzOiBwd206IHNv
cGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBTRzIwNDIKPiAgICBwd206IHNvcGhnbzogYWRk
IGRyaXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00KPiAgICByaXNjdjogc29waGdvOiBkdHM6IGFk
ZCBwd20gY29udHJvbGxlciBmb3IgU0cyMDQyIFNvQwo+Cj4gICAuLi4vYmluZGluZ3MvcHdtL3Nv
cGhnbyxzZzIwNDItcHdtLnlhbWwgICAgICAgfCAgNTEgKysrKysKPiAgIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpICAgICAgICB8ICAgOCArCj4gICBkcml2ZXJzL3B3bS9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKwo+ICAgZHJpdmVycy9wd20v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGRyaXZlcnMvcHdt
L3B3bS1zb3BoZ28tc2cyMDQyLmMgICAgICAgICAgICAgICB8IDE4MSArKysrKysrKysrKysrKysr
KysKPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjUxIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIw
NDItcHdtLnlhbWwKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9wd20tc29waGdv
LXNnMjA0Mi5jCj4KPgo+IGJhc2UtY29tbWl0OiA5ODUyZDg1ZWM5ZDQ5MmViZWY1NmRjNWYyMjk0
MTZjOTI1NzU4ZWRjCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
