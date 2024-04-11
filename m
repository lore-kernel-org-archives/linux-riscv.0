Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC37CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:Subject:From:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AvG10W9h3/S89rrHMJMTVo2PKF6rTnLmXj+EORXaC4=; b=qkA/f9wg8CIuKbD0xzEPXbPUu9
	Rpk+NTE1s8HMTfeBYh+Jgvi5wMB9naa2PyXn2fuXq6Ml4eXvlTBvsq+TbUTAR6ErhXTHWJe4Rh03r
	OlgueuHCFTl8X8CY6J7TZ9jQ5/A7WMRs2ssAv52MHt+cpx3ks7A/NiGbzaeGR+88gtpyIfAfHd1P2
	jetIDMp8HTXQvbhZFioDSiPpXZZA/K/SXFPE8liCrBx+qkDOXk8yDTVbyeCV97LgtiMBJn1VsrkSM
	wTDO1wjDkXw7VKc1OgnAin/3JDTy8fq5f3Yw8z6JM92QTktSqvncBT+6w9VPZbIFil2Rw8z8PW/ci
	ds4H0z1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruu0Z-0000000C2ta-1GGW;
	Thu, 11 Apr 2024 12:58:27 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruu0V-0000000C2qq-3ERI
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 12:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0rmVRCkSB7uY7Qv8kgIRvlsmxO8PjegO46id2Po0evBoLtMLyGD804aidjuagPhEfRzIh3m98giYbH1OjxxdHIgwFr0iSSIfKKw2EzHgIevjvqrOY3l/8kRPDZikf/LPCLvKBXEuQ81RVyv4AsKq/sAEqMaKoxbSzVzIDUzQKfvPRVThxzDUI39ViSyV1XvdacEmiSoY3Y7Kel8aTpxWu69aCgfNBnEyl1N9JJICcZ4Ob35S8XuT9HsuHDuu+mFphf+Ysn7GsVwuxXShufEig5JgopLvSeoC3wzehtTY5zV650Y5XXrTijA7kYRHTzOJhHd7nCAyWswmSoDlv5z+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMAwN2wBtFF6gkDJe8BqWPhiteRjwD9J1UVY2M4wgyQ=;
 b=nAzszUYrNioMeMyxe+0/tdbo2mb2KzzTlpSVFdt/0wINNSlI5GWA9qj/kv8r/f4h1IC6/8LdgHemNqbd6fzxa43GNuk0UySBE7/PrBpkjU5AQJjetq8DK+2RImJ+PNwPsizfPkz5Q8EoJa6YtJl0JWjZlxtB5NZfCHL6jrbIpvxdhfNeJsfJaeXeoeOujDfUaKnQJn1z97y++iF0LoYmBxhnKY53NdvBLc87QhNLGAzgDnmQ/7U9m/fxjw9ihupAmz+kfLVwNtzpfOerw4gZqfXXncPsESK56SaOIsMbVbIwj+hDUJwWf7SqXkmEv8koTqUNfSvg/KZ1Fqiu0nX+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMAwN2wBtFF6gkDJe8BqWPhiteRjwD9J1UVY2M4wgyQ=;
 b=hqLMUl/qytARA6RvwbjzGP3MRIuXoH1DrliBRvPOgxDswa4eIE0WJPwlTFsL7vhBpDr0DCjXF3nGci4nY9B1YGuM9FY5YcXxqnHRuHOCaf/HztgvMptqyhI/AxhnkmcXWn6pJA05VKSWXVQuUiHrjT1/xb7Kee+apDk/8xOpkdwW5m3U/7q62fYDWcN+vucFbuZNZIOn//LEEgFbgTCEpnuAV+vGcoZ/VCJyvuzRpU5X/zXHw0lFEvAusqXRettTX2K5UYDisZTKS+eNt3Asr0G7kvSH3m8XPs4hdz4rWeC/ui8uPKg0cInYCek/ZSjBA2tcHDdN9yRtlukiwVUttg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1524.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 12:58:09 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c%3]) with mapi id 15.20.7409.046; Thu, 11 Apr 2024
 12:58:09 +0000
Message-ID: <MA0P287MB2822BC109267BD20922FB581FE052@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 11 Apr 2024 20:58:05 +0800
User-Agent: Mozilla Thunderbird
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v13 4/5] clk: sophgo: Add SG2042 clock driver
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com,
 xiaoguang.xing@sophgo.com
References: <cover.1711692169.git.unicorn_wang@outlook.com>
 <816122e9f22ddd9927e81e627be7f4683ba5c9e8.1711692169.git.unicorn_wang@outlook.com>
 <433e01f22ce5472aeb28cf0182d951bd.sboyd@kernel.org>
In-Reply-To: <433e01f22ce5472aeb28cf0182d951bd.sboyd@kernel.org>
X-TMN: [odXi9fTYkMseVPpNykqV21cWAwssBmP+]
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <f96e7227-9441-45ef-8c08-95d21d2e78de@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1524:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c98875a-ee82-49ba-1290-08dc5a2709b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+6lYQV6IMzMB00BeB/FtGaTdjoRDDzGGd6bg1yoTqI2OBdsy6gIojzPpE4rwBxEqePAxn8yxcVgMiVx3viozEjx+/yfHNOPTobDlEStTt5mUcwCXmDJuS2pS2JE0kmK8vYTTXkyY8/FHuA6CCCA9JMS/JaHTlh0klSvOWGIMIo/E62R14FDPXMAh/Eu1pkNlvhH8mrYfSNdcPLrNS24CbLS4ZVwVZOAEr77F7r3iTQOb9sLfw5vvXKM0toQAltxfaldwCP0yg42/eg1A1DG01d2daEQFmgZCV5YDwjLCmdZbnpqfBEdfm6MRWKixiAap7b+AbnhG6ZjAMm2yH1mZsCljwNJz8jnRKzkHaOWGPcM2OiSokm29KwIY23ut+5J6pp3U675VUw/w29UTjKz8nHTE9qpOzXTskWesL2v5eTtkLBgAcY1JeosIalO3w2oV6o+PbYBAc6rqfA8cUMP0vUj5MbCqSng7e8gvzT8AxmryDQz3237Fo0LbNBHe4dVLzMelaEbP+nF8VrYA2nmpZzJmhIblFke/SFULEaTvBCretg7AKqVm1la5nF+xG6L
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDJlVDhETjNpSGsvNFFRUGFCaFplc3I2M1pNaThvVHZXM1FLaGZGRGFad1lL?=
 =?utf-8?B?dUk0U25VaU5VNk9tOHRWUXNkZWVRdHNQWnRDaEkvZWk2NGFpZSt5NzAwN29X?=
 =?utf-8?B?Nm41YXZuOVZYbkpxbVgwYnRhU3FrWEZweUNQb0QvbGVFSExwSmFwdFR6b25J?=
 =?utf-8?B?c2p5a0VmOUpnN0xyL1NqYS93VVZvR3hzTUxsSjFqdWZnTXdBMk5zNklmTVBR?=
 =?utf-8?B?WG9BWGJFbXRvVVFwRVorWVdmREVuNlBTUkVHUGY3NDhGUjNmZUlLMEE5NmZ2?=
 =?utf-8?B?UGVlT0ZWcmo4VHZkc2h3VmRvVmwvWjJHTHFBQlRscm94R0crdXJENjlOR3Jv?=
 =?utf-8?B?RVpQZmtscjV4MWhLRHRNMC9qMkRQQkEyWkNlcGdoaDdSQXNFSWRoS2lxdGJp?=
 =?utf-8?B?V3k0SmlzR2gyRFI5ZVV2clBzdHZON1N5MFBpdGMzU0RnQzVuazV3WWZMVnFq?=
 =?utf-8?B?eXJWLzAvWkUvMFhob0xORnZsV0VtclVOSXl2OVBpNVYzdXN5R29NMHg3L3lV?=
 =?utf-8?B?aUNzc1pTR0xFYVZYOUJnd2pqa2djWGNvZVEvbFVQZGh4N1lTTU9XWnBMNm01?=
 =?utf-8?B?dlh0aWlJcG5USEZubjRlRzJFQlZrWDAzSEVyWHRBQnFhRjR1Y2F3YWpYMDN6?=
 =?utf-8?B?YmFKSTdEbk15ejNLbGJPNklzYzZvT2c3dTFrbjZ3RWQ5clFSNSt2a0xYc0tj?=
 =?utf-8?B?UGQ2T3EwVS84dDJjVXQ1RFRvbVc3NHNvWTA5WlV1Yisvc294ZG0yMkFacnRV?=
 =?utf-8?B?RXJCUUk1cFFvb2ZldnhKZFpZZnlvQ1A0QTdXYTk2MktIZnprTkxOZ2NtUDlE?=
 =?utf-8?B?RVdnS0VvQXNneElVS2txaDZmdDkwazNtZ29BMkZQK3Q4REJvUEdMTGhldVdM?=
 =?utf-8?B?Z1o1cmxKOXRkY2JxanRvbkhaNUw2V2krMnVKWFRGOStaekRVRERjMHJPMldO?=
 =?utf-8?B?R3Zka2RpUWtnVGdISHF5TlpNZ2FVOG5wd0hJVThXdmRoenBuNXRDOXlmUVlQ?=
 =?utf-8?B?dlJkNkg4Mmp6Mjh4OTNmUXZ4QlFEREV1cWg0ZCtPbFp5Y0tDME1aSzJlL3Ev?=
 =?utf-8?B?RTVXZUFCamc2elluS29mS2lDNnRjU2hBY3J6ZlBCWjNLSjFHSDN5RGkxZGx3?=
 =?utf-8?B?cVV4UFVyOUF4YW5YY1FYdDBrck1KSVZLKytDMjNrZlloN3MyUllYaG12c3VY?=
 =?utf-8?B?Q2U1b1BacVkrdzRCKzBxUjZIMDJ2US82Mk1FNGZpcjBIUUdwMnExTThiMzFj?=
 =?utf-8?B?ZVJGellXSXQzeFFUU1BaNWpTMTJOVjU0S1JMZVk3N2QwWTFsVWM0bGpiMWM1?=
 =?utf-8?B?eDdiTVhkZzcxTHZBUG1EZEk4ZkltVG8wajJUd00vbmFlL3RMdDdkSVczNDMx?=
 =?utf-8?B?K1dnUmU5K2xGU0R2NnNrZ1Eybmd5U0lSL1RzMXJuK3ExbVNZdTUrSzIyNnVs?=
 =?utf-8?B?dE1uUlRsaHcwSHhoS21qSlpvS3RwLytObkd4TXpqbjZRY0VHdnV1TzV5YUhl?=
 =?utf-8?B?U0ZtSStEV1NOSHRFdFk2MWw5U3ZkeEk3UVg2dGU3eUE1czNnU0RqTjZZckdq?=
 =?utf-8?B?bG1kMzVRVWNhOUtoODJReDVlU0ZoTk56am1oRlg1WjNwdy9nTUt5dXZIOU51?=
 =?utf-8?B?bUx0TC9iTlI1VjdlK09zL1FGWUV6U0FBL0FHeXEwcEk1cXZVRTlFR3FHSzJX?=
 =?utf-8?Q?BDr1xdpgWDEytt2ICAak?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c98875a-ee82-49ba-1290-08dc5a2709b0
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 12:58:09.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_055823_859139_78B353FD 
X-CRM114-Status: UNSURE (   9.18  )
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

Ck9uIDIwMjQvNC8xMSAxMjoxMSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgQ2hlbiBX
YW5nICgyMDI0LTAzLTI4IDIzOjIxOjQwKQpbLi4uLi4uXQo+PiArLyoKPj4gKyAqIE5vdGU6IHJl
Z2FyZGluZyBuYW1lcyBmb3IgbXV4IGNsb2NrLCAiMC8xIiBvciAiZGl2MC9kaXYxIiBtZWFucyB0
aGUKPj4gKyAqIGZpcnN0L3NlY29uZCBwYXJlbnQgaW5wdXQgc291cmNlLCBub3QgdGhlIHJlZ2lz
dGVyIHZhbHVlLgo+PiArICogRm9yIGV4YW1wbGU6Cj4+ICsgKiAiY2xrX2Rpdl9kZHIwMV8wIiBp
cyB0aGUgbmFtZSBvZiBDbG9jayBkaXZpZGVyIDAgY29udHJvbCBvZiBERFIwMSwgYW5kCj4+ICsg
KiAiY2xrX2dhdGVfZGRyMDFfZGl2MCIgaXMgdGhlIGdhdGUgY2xvY2sgaW4gZnJvbnQgb2YgdGhl
ICJjbGtfZGl2X2RkcjAxXzAiLAo+PiArICogdGhleSBhcmUgYm90aCBjb250cm9sbGVkIGJ5IHJl
Z2lzdGVyIENMS0RJVlJFRzI3Owo+PiArICogImNsa19kaXZfZGRyMDFfMSIgaXMgdGhlIG5hbWUg
b2YgQ2xvY2sgZGl2aWRlciAxIGNvbnRyb2wgb2YgRERSMDEsIGFuZAo+PiArICogImNsa19nYXRl
X2RkcjAxX2RpdjEiIGlzIHRoZSBnYXRlIGNsb2NrIGluIGZyb250IG9mIHRoZSAiY2xrX2Rpdl9k
ZHIwMV8xIiwKPj4gKyAqIHRoZXkgYXJlIGJvdGggY29udHJvbGxlZCBieSByZWdpc3RlciBDTEtE
SVZSRUcyODsKPj4gKyAqIFdoaWxlIGZvciByZWdpc3RlciB2YWx1ZSBvZiBtdXggc2VsZWN0aW9u
LCB1c2UgQ2xvY2sgU2VsZWN0IGZvciBERFIwMeKAmXMgY2xvY2sKPj4gKyAqIGFzIGV4YW1wbGUs
IHNlZSBDTEtTRUxSRUcwLCBiaXRbMl0uCj4+ICsgKiAxOiBTZWxlY3QgaW5fZHBsbDBfY2xrIGFz
IGNsb2NrIHNvdXJjZSwgY29ycmVzcG9uZG5nIHRvIHRoZSBwYXJlbnQgaW5wdXQKPj4gKyAqICAg
IHNvdXJjZSBmcm9tICJjbGtfZGl2X2RkcjAxXzAiLgo+PiArICogMDogU2VsZWN0IGluX2ZwbGxf
Y2xrIGFzIGNsb2NrIHNvdXJjZSwgY29ycmVzcG9uZGluZyB0byB0aGUgcGFyZW50IGlucHV0Cj4+
ICsgKiAgICBzb3VyY2UgZnJvbSAiY2xrX2Rpdl9kZHIwMV8xIi4KPj4gKyAqIFNvIHdlIG5lZWQg
YSB0YWJsZSB0byBkZWZpbmUgdGhlIGFycmF5IG9mIHJlZ2lzdGVyIHZhbHVlcyBjb3JyZXNwb25k
aW5nIHRvCj4+ICsgKiB0aGUgcGFyZW50IGluZGV4IGFuZCB0ZWxsIENDRiBhYm91dCB0aGlzIHdo
ZW4gcmVnaXN0ZXJpbmcgbXV4IGNsb2NrLgo+PiArICovCj4+ICtzdGF0aWMgY29uc3QgdTMyIHNn
MjA0Ml9tdXhfdGFibGVbXSA9IHsxLCAwfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IGNsa19tdXhfZGRyMDFfcFtdID0gewo+PiArICAgICAgICAgICAgICAgICAgICAgICAiY2xr
X2Rpdl9kZHIwMV8wIiwgImNsa19kaXZfZGRyMDFfMSJ9Owo+PiArc3RhdGljIGNvbnN0IGNoYXIg
KmNvbnN0IGNsa19tdXhfZGRyMjNfcFtdID0gewo+PiArICAgICAgICAgICAgICAgICAgICAgICAi
Y2xrX2Rpdl9kZHIyM18wIiwgImNsa19kaXZfZGRyMjNfMSJ9Owo+PiArc3RhdGljIGNvbnN0IGNo
YXIgKmNvbnN0IGNsa19tdXhfcnBfY3B1X25vcm1hbF9wW10gPSB7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICJjbGtfZGl2X3JwX2NwdV9ub3JtYWxfMCIsICJjbGtfZGl2X3JwX2NwdV9ub3Jt
YWxfMSJ9Owo+PiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IGNsa19tdXhfYXhpX2Rkcl9wW10g
PSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICJjbGtfZGl2X2F4aV9kZHJfMCIsICJjbGtf
ZGl2X2F4aV9kZHJfMSJ9Owo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHNnMjA0Ml9tdXhfY2xvY2sg
c2cyMDQyX211eF9jbGtzW10gPSB7Cj4+ICsgICAgICAgU0cyMDQyX01VWChNVVhfQ0xLX0REUjAx
LCAiY2xrX211eF9kZHIwMSIsIGNsa19tdXhfZGRyMDFfcCwKPiBQbGVhc2UgdXNlIHN0cnVjdCBj
bGtfcGFyZW50X2RhdGEgb3Igc3RydWN0IGNsa19odyBkaXJlY3RseSBpbnN0ZWFkIG9mCj4gc3Ry
aW5nIG5hbWVzLgoKSGksIFN0ZXBoZW4sCgpJIHVuZGVyc3RhbmQgdGhhdCBmb3IgY2xrX2luaXRf
ZGF0YSwgcGFyZW50X25hbWVzL3BhcmVudF9kYXRhL3BhcmVudF9od3MgCmFyZSBhbGwgYWNjZXB0
YWJsZS4gV2h5IGRvIHlvdSBvbmx5IHN1Z2dlc3QgbWUgdG8gdXNlIApwYXJlbnRfZGF0YS9wYXJl
bnRfaHdzIGhlcmU/IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4/CgpUaGFuayB5b3UgYWdhaW4gZm9y
IHlvdXIgY2FyZWZ1bCByZXZpZXcKCkNoZW4KClsuLi4uLi5dCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
