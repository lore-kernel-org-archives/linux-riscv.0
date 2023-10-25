Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EB5C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 01:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeaD17ijkwpqijmiHlJKosk9tZMtygmbs1sduhBhtm4=; b=gsdm73cFARQPSrwi8ALcaHQahZ
	4zwYH+JMYmfRwP+A9IPV2gFmwir9NJ4BL8eEGLrXrjofkDqMeVLHLkl+9d3Zn7CUpwLvu3IqKUyHX
	wUCAfhQR/5Q6kfG7rpyln8c0saKlrJI9lNiE/PBq5yDQvVYYZ/KLcnxzfjMnjogh+KwQSc/dKiBld
	W01UhxEoedBnlnEZjHHgHCjrpo7bFoGP6zx5lcxQmYR6I1GCXtp4bWDKzmqntUB6K1nxrmltIgSsC
	WkUBBoxrg0FcLdtp2Y9EiKS4DuIU4tKcx1C1W/6RAut9C562JMcDcy2U1UdBs1tk9Aa2Z8fP1rxqj
	4pxxclkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvSKu-00B6my-19;
	Wed, 25 Oct 2023 01:05:28 +0000
Received: from mail-bmxind01olkn20820.outbound.protection.outlook.com ([2a01:111:f403:7011::820] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvSKq-00B6mZ-20
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 01:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNGUkXorBQgPR3XIoQvuQwdSIMDWEh1rL7YGBwT2SagSdjRQkiwlzVClBRq+oG80M5tCEXXnCO+dACXvCcwpbfd90wCKDtXnKGc8zqTqcN0djcGs+5QNu+VZRJfA3oL4Cd21uE60Qf8vcpinqA9O0KiOWXwd3o3sOsI+3AH9muiFjBi4cmd9oBMjbvUdcIU+r0Tu4OPv0uFqk/dH0LY/nl31N7NFp/RzrswfHKxVig8oxQ/+0vLNKTcczHSt9qHkwswaA8MfX1nfp5mcNMEX/VTCLN8sZcTPfmcex+80AU/KNw+Xx2AhdnwFhoLdXKzGxEDaHKDT2nBBIWF1PEviGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnRXckoE8o5ieiYWdmKmvUktpDSfNXWX/dVI+emY/DI=;
 b=BQ4L5AMZJYw5/nJyXEXpbvU+wXOx5lY3HMYpyJ7lO3lfTG2KGIhS4oUlKoe9D4FKLl4MJDC0eQjt6s5lKqcMFKa2BQ/dEXg69TqrP4VwrOYay7jM7Hkeco30RThADMvlNhfz2IKOrGqydIGTXEmjHXSKmRw2oQfs/m4V1vGOCxQUXt0X1FcapDMza8XQ90Mqsn9VGcbwA5ZJQD0nmeJLbsRNuYm55zsOtkE07cB5xHa5QFq3YhzIaiIkLH9lMnCKCPw4FNQ6bsHUMzDfB2lH/hZVbwITI/WbXbnf9wsrVjFQ23lt4XVF6uHhdr1yhZ6k93k9sjIzFZPwKkgllZjI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnRXckoE8o5ieiYWdmKmvUktpDSfNXWX/dVI+emY/DI=;
 b=FHxePgVzJWDZEeWO96yCL85a/vS+6zM1HNMblVWr9gpNKSgkBv9RPdB+TZPWyq0Ln5kdunjDtXtuAmgDHHyW/hkl2W9TPLDq8/DSMFMWSgUdn0pLHQy7opKG3SUP7rWx92K1SoGq+4BjnZrKAy2LQMl2gNFew7OOeHsSJR+OYBmv5tNjyJoUsUyK3cizGo6bNPgxfpLl2foUOB3snegwWjEb4gAfK3wJRBH8nW2ea0c1fOMULw9OH+cc3C/gRXYRCYXLSccQdIILzFDftOMRybl+cOudHfc2El3T+B8g7JzwUTkbooPA80eIQqaKnhThk6QVh4Zry5lEtv8R0rM3Xw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 MAZP287MB0519.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Wed, 25 Oct 2023 00:49:01 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::d479:bebd:2f6a:caf0]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::d479:bebd:2f6a:caf0%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 00:49:00 +0000
Message-ID: <MA0P287MB0332C00AB091FD7139560E25FEDEA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 25 Oct 2023 08:48:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: sophgo: remove address-cells from intc
 node
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Chao Wei
 <chao.wei@sophgo.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231024-maternity-slang-fd3dcfb211c0@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231024-maternity-slang-fd3dcfb211c0@spud>
X-TMN: [KrLksE9OeS3RxoMfgpTIYAzV/Gr/mtBh]
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <6781c916-69b0-4eaf-b8a1-ba77d3fbaf25@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|MAZP287MB0519:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c16334-07c2-4cb0-1471-08dbd4f42d5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UOu8zsMzzZLITwIOab9geEBQYYVEqcQL40YgjwPiHy9cPtivydwEDOS8CIVum4bXzfuqF0yizICumr0cItmnIQk3U4pZTixvJchWK2CWMaOWFRLF5alFby/lK1saxEAVCA+pehsUH92at+g97IZgPYo7M1R3Ifta2qILBjd6XFtFfGLqns0YKLF+SMb0U8rnYK/pQJEkKtW5bvfrrHVw6jHJ8coJTaotM+DDhOW2e4BmEfsfGt/SHoPcuZHMbv7mIqJBGv1VZ1NcnR3L/G9nxNZqRy30/3LbKzt9j+Rew82UxYGOAJZL4DpjM3X33LE5yWVW37MY6wnqMp40pXWjSIrwX4/uFuY44MnWNlaAv6750Jf4K+S80KrrfMBaa3/TkhwSFYTPC4IEUBdSC7FIYWJBnqXDuIEqJYQEHlWKF7X7hyrp3ruC78R8DFrz6kucfRDSyq4ml1obiwkM6eHvb56nkmwjMO6jnC89a+vTKHZRi7cz1BKyZvkZUzNph0K7cV6ZOXiwLxkshYEXRQII6sN+M1IHalT/Tcmh2W/nvOI3iWSopA56Qmp/hHeRZo4FdeSlTbTkpklp4D5JeJBQLqls7a3waNZ04DbdeS7vu0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czhFcTV0YzVHTEJ4QVpDb0l2SWQxNlJJeDZFeFd5LzdOajRQWmFZV2tvSmY0?=
 =?utf-8?B?dHFzTzhsVmFPZDNZaEFveWwwcEtURCtOdjdJaWtOMFpFT0x3MlJBeWx4Tklj?=
 =?utf-8?B?a29VcEwwM3F4Znd6Z3hXMzRMSnhGVlQvUTg0Q2xyOWNIQUtUcHo4ZTNJY0NW?=
 =?utf-8?B?TjlwQXh6ZGVlYW1OU25uMi9vQmJBaldZc1ovdy9qQUFKWnJHRjBCTTZLVEU1?=
 =?utf-8?B?VG8zcVVRY3hNMUpab01JRFkweEw3MmZoNm9VZzcrbml4dEEwekdNZFRjM3hl?=
 =?utf-8?B?dHdQRytOZzdvVi9uTTBnaXBKZER2SGFPUStLcXFMWVYrcng5MUZtNFY2aTM0?=
 =?utf-8?B?TGhyMlBtTlNoSVAxa3JmdnRoQmJBYTJjbVBDYUNCamxTdndkOW0xcW9lcUlN?=
 =?utf-8?B?b01zUm9iaTBXdjBaSVk2ZHRWUVowRkM1ZmF3VWJDVUVwS1lReU4xVmM4blRy?=
 =?utf-8?B?dHU2UlRQdWVGWHQwNXZ6Ky90eGdJYUMwMHFud0R4bGJvOGNuMHFGTHFaMU1u?=
 =?utf-8?B?Qkt5RGp4TGpnVWdmK0xDWllVYitCVk9PNU1KUjQyRW1sb2RtL0ViRTM4YW9x?=
 =?utf-8?B?TlN4clZkclA2QTVTNzUzQzE4OEk2VU5CSVRZL0I3K2w0aGRLUFNUcW1mcFFL?=
 =?utf-8?B?dEVsTzNOV2R6Sko2VW5nSTl1blY3MWRhV2lTeHk2Mkwrb3IwdEFBM2lNcThu?=
 =?utf-8?B?MDYvSDlFQ0lWWEZ3dERDYkFGZmdwMnlUUzVZQmhPdnA1QXorRTFaSkJjd24w?=
 =?utf-8?B?cDNReG9CckZSWWJmclltU0tNQ3FJS1RhdEdHbnkyVmd6TStxaFZKRG50WkpC?=
 =?utf-8?B?U0ZvSTc5V3BScENkT0lPVEpGNWdUQjNUSktjaTVPRmttSGJvUElmRS9wZ0U4?=
 =?utf-8?B?cC9vYVdtTGNnTlBEdEFUTFcrQmlEYWtRQlpZWlB3QWZ0VXI1WTErMThpc2NB?=
 =?utf-8?B?YzZ6ZnNEOW16T0FzakxabzcxRldrSGQxcytvVVdpcVlTV09mZnd3bzY2RThN?=
 =?utf-8?B?SGNwdzUzY0YzZEdicVlDTDBpQ28wZFppTGRwUzZPUHBiZ25BYWdXVC90YjVi?=
 =?utf-8?B?dVlLbDFkU1RibmFGWkROQlBsUlhYaEpEMStLOU5YNzlScHJMNVcwdWxsWUJE?=
 =?utf-8?B?QmdkU3FYdjZILzhZRis0WVMwRkFUckZ4UXo4Q292TTVTd2dFY0dZSyt4N25Z?=
 =?utf-8?B?akxxa2QyTFZNeFRiQnVrTjNUb1pRWnJ6N3ptcHAwblM3T0tsNEJhRmZ2WmFG?=
 =?utf-8?B?RG1scExZa3dhakJBaURiTU5LcE1BWGxmOXBPc2hETzdReHNJbmU3d0VJMFpX?=
 =?utf-8?B?bVNWS0RFWGsvZDRaNFpGOC9yeDBxV1ZUd1pVcFlIQ3ZYbDQwV2MyVjQ2TkVp?=
 =?utf-8?B?LzZyQnhNVWtZU0NVY2k4ZHFaVXNUMnM5SFp5Tm5zRzQrcHNCT2pTRWVrVVFL?=
 =?utf-8?B?SWR1Um8xcnU4SCt2Z3lGSHNZWE50b3V2UnNQeWoyVFNhcXlDN3lWSk9CVnJR?=
 =?utf-8?B?UW9zbjhVYUNVWlVsYzV0Zk5sYk9UVWRhMGdvS3EzM3ZlZHZBVkE1RzcxRHIw?=
 =?utf-8?B?QVV3SVo2S1U5YkdHV0dvNWcvd3kzMSt1UXB6dGNTSU96WU5DUzZWWHFHaURj?=
 =?utf-8?Q?/iJDVHzr/sLm5cRE9rtfyeAzHMwO7tIMOfIzNTG2m7J8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c16334-07c2-4cb0-1471-08dbd4f42d5d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 00:49:00.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_180524_772025_2CA8BDA4 
X-CRM114-Status: GOOD (  14.74  )
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

Ck9uIDIwMjMvMTAvMjQgMTY6MjAsIENvbm9yIERvb2xleSB3cm90ZToKPiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gQSByZWNlbnQgc3VibWlzc2lv
biBbMV0gZnJvbSBSb2IgaGFzIGFkZGVkIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+IHRv
IHRoZSBpbnRlcnJ1cHQtY29udHJvbGxlciBjaGlsZCBub2RlIG9mIFJJU0MtViBjcHVzLCBoaWdo
bGlnaHRpbmcgdGhhdAo+IHRoZSBuZXcgY3YxODAwYiBEVCBoYXMgYmVlbiBpbmNvcnJlY3RseSB1
c2luZyAjYWRkcmVzcy1jZWxscy4KPiBJdCBoYXMgbm8gY2hpbGQgbm9kZXMsIHNvICNhZGRyZXNz
LWNlbGxzIGlzIG5vdCBuZWVkZWQuIFJlbW92ZSBpdC4KPgo+IExpbms6IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDkxNTIwMTk0Ni40
MTg0NDY4LTEtcm9iaEBrZXJuZWwub3JnLyBbMV0KPiBGaXhlczogYzNkZmZhODc5Y2NhICgicmlz
Y3Y6IGR0czogc29waGdvOiBhZGQgaW5pdGlhbCBDVjE4MDBCIFNvQyBkZXZpY2UgdHJlZSIpCj4g
U2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiAtLS0KPiBDQzogQ2hhbyBXZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Cj4gQ0M6IENoZW4gV2Fu
ZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+IENDOiBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPgo+IENDOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc+Cj4gQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZl
LmNvbT4KPiBDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDQzogQWxi
ZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ0M6IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnCj4gQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDQzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxODAwYi5kdHNpIHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+IGluZGV4IGRmNDBlODdl
ZTA2My4uYWVjNjQwMWE0NjdiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgwMGIuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgw
MGIuZHRzaQo+IEBAIC0zNCw3ICszNCw2IEBAIGNwdTA6IGNwdUAwIHsKPiAgIAkJCWNwdTBfaW50
YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ICAgCQkJCWNvbXBhdGlibGUgPSAicmlzY3YsY3B1
LWludGMiOwo+ICAgCQkJCWludGVycnVwdC1jb250cm9sbGVyOwo+IC0JCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MD47Cj4gICAJCQkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiAgIAkJCX07Cj4gICAJ
CX07CgpBY2tlZC1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpUaGFu
a3PvvIxidHcsIHdpbGwgaXQgYmUgbWVyZ2VkIGluIDYuNz8KCkxvb3BpbmcgSmlzaGVuZyB3aG8g
aXMgd29ya2luZyBvbiBEdW8vY3YxODAwYi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
