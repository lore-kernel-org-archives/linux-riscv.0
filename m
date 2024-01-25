Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A4AC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afRs44wzLOgZpxZWQ+8siTsE0SyghZbluGAPEpQT4p0=; b=oBS6egTVAIgJiK0tG5qqkF/Rfx
	WVK3KWQLPC0ysf5uuiOA4iLsYbGsezIX6XszbYwKN59AnbTpyhjVFEe9L7AvqN4AcOUHx6Um8zp0p
	SRRIvyi7K0fbHFQeKuBrFbtc2FlgQ9e5lImvCrF2/zvUHLjRfyjc6noCIJLNADABvWiE6/HM33D2P
	Y+rIPHg/FpEfJXGlp2hxi/ql8gPyrdBdpj966Lg3otRmvb3L5pHRYOlvPNrLTGAjArAnoKv9mNYhO
	VqTp/kFTeRcJGr1TYxfjOVMwBskN69h9LJGfx9FVZCWnQTDTq+5LPJVRQaqchzILKXd9gbvSH2L4t
	ha6vSWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0gZ-00000000Mzt-3VgG;
	Thu, 25 Jan 2024 14:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0gY-00000000Mys-0BxJ
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=UAJt3reeZAE7HCOMsHyi6NWHajuOmRchEC/Bx1v47Y0=; b=pVr8Y4aY94+H7bN/s8hxO+pjHH
	OSFf9GAy0EiSZ5b/b7QmOy8OKa1DBbrVUO3oM1tByOZCdl3uS3sq0jsNvYOcP1IokGHYAj3PFZwt4
	X0p4RQV3IXd0/8EnaGZ9Yg+pZPcHUAP+vjtXUyaig1BoalVAIfCNeIH5Mhms/2ggAleG8G2bYvwcW
	XxHLJxxlzxzKgArPtaiWv9j0NV7gNWV/eI29mwgqNwbxXWVazVVY7yo9CQU6K0oo02qauaU2t20Za
	kuNhe+V67ub4w72pstxkc3+MmTMP5E9pm7ndmEemYiF2nxBrLIciku74Z/pwq7j4NXHpaatKqcbeY
	nB6MbxOw==;
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSyWz-00000005HE3-1ZSz
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9jVbdVITKYA9Pv1EIqEvsdpn38SMP/e2XlC2QSA2pNdFjHj3otvyBx7QBUq+BLyOvWuzTwW5IEQTn6+9qI+4BI/5Jq1c+4IH/1MW/MRmek43hOoeN7tK3DXVtJZVRMV33McZtNuzARjlg5ubymMe36/C7yILvAP+jt0Bz5KLI8reT7R6qXwCabEyrRULNPkyox2fqB5GTxPCCm7o2M6IheN2czW5Og28W5hgfswrM42spz5rUGzDUpBq1SjxxidRvdsjVHEoFxIWDcwAqHS9QbzOZMYWTKhO3l9vRUp+sdXRHlGDku/q1B2LvHfg8crvbm2imlj3jh0E0fKauTEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAJt3reeZAE7HCOMsHyi6NWHajuOmRchEC/Bx1v47Y0=;
 b=ZoAOHN4cH5IKYx78Qk+DNyD2YWeGqDhYh17LraF0N8Fhxha99KtOC3gaHQZnDVD+6cPtwt/peiowJuqn/E5sUpwyEp3YFhgFhp+Ad9v+lOu7ToHONzWeF6hkbGn0o2qUxo6TumjFLInHgGYTyTjmHFqJcF6oTGxSLAOzIYY0tsfk9pk/CZEFk1q+ozVYkm6lAlcqcLQtBBOQQp+SnriHjieG6MwnflwdDHq7xRTTAEVIV/uO/w4D1zYRVOwK8C6ugqoxheiDlFLr3EiOC+K6m3gDRnkWyYy1RbEmIGCSXlhPD52V2zFiuMBqyIbQJp6cO864HWjMuYLfx7jqmVwDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAJt3reeZAE7HCOMsHyi6NWHajuOmRchEC/Bx1v47Y0=;
 b=Kb3G5uO8cz46lSGHblio/HXF/V68odq9/cHzNB/50WFNEX0OI53cPTLo46Yb4ZbKSOWj7m9d/PR3f8Ay7tWu+WsxOho1GctLpLfozfVm50iJWj3rjQ0n14ketffitI5Rme1VSBoV+5prikVqB11IO+cI4Xrr73wg4LnVm195G3meiB9Sia7wnOYgYZz80sJmxv4GyN3SZYE9le4xyKmAk04CJFCPeTKeH/U9M3ST5+1fpya7CdPQ0UNeyBtc4xN0L/rA+iDTATzR0UfAJFtvzcv0lfMY4noXy/GK5CeSvoKub4wOfkVMC4DMv7hD9kj2rwcCHSzgKX4JoUvA4vyasQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0714.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 12:07:48 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 12:07:48 +0000
Message-ID: <MA0P287MB28226D07A5DC0200132358C4FE7A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 25 Jan 2024 20:07:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] reset: sophgo: add SG2042 reset generator driver
To: Philipp Zabel <p.zabel@pengutronix.de>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com
References: <cover.1706161530.git.unicorn_wang@outlook.com>
 <34650036ea5f1c500da54c67c3a67b91c4419399.1706161530.git.unicorn_wang@outlook.com>
 <bf30a97b4c39e5c606583783058ea12520c1146b.camel@pengutronix.de>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <bf30a97b4c39e5c606583783058ea12520c1146b.camel@pengutronix.de>
X-TMN: [LuvVD9ZtLSWSLaotXcME2xH2c0qrxrmE]
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <bacc7ff9-4d8b-48c9-9f97-0f92fe491595@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0714:EE_
X-MS-Office365-Filtering-Correlation-Id: eadf1b71-e15d-4a7a-904a-08dc1d9e3f55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gmtzmgpjUqD5H9U0c2GWO3FQS7AM6iFhPtRHiZ+ycZ2IvrsciHq5ivREfNdfE1MDdxmD4CY/OfF+bo9GRX7lqrD5XdTlMA/V8J85rPGA2m9G0LUl+/0SW802M0/SXJNaj8M81v66i4MFz3SYIihDS1r0qUj2xrNQCG6cobczQO7pGxiQLxilDKz1aczca5GfSIvS9zgZGKn8x8/Pc9zWp9bs6FGFHLT/yoM40ib8R0OMUEbXYfpQHBublIxRb+wQDOY3/z26brnH250ajcmb15IX6YISrKwMj5Q1IDuyHO10WC0uPLyXNfnnL1kgRasFpgwvlDFxRamMDktO2XRHQpH2kqo+dzOYYM4uMfYV6p+/AFYA8ecKWzAhHqZJlHyU3dvGPsO/idL/Viic47ikhmmvYM47zMbSgXFyAicAFkzMI89Je70yIXqYs9AmJj8ZV0brA+JxBne3K2/yX57/4cIRX5Ym/XF8uC6btfgjG1MN8OcwpPq4VzSMKqjimfXweStjFWL5rWJJnL8oTXSGw+c2FkCNaIGD5PPMGwOXpbKvAJqUHoxcEq49P2UaIl4B
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dkQjVMbkFNc1E2aE5qY1dFK25yWk9IK3dBeVBHQi9WbWd6dHhvV2toRVBy?=
 =?utf-8?B?RlFNL0ZMU2FXU1BMUklUeDk0Vm1CWDU5N09HU2RoeUdtcU0zWmdCNWJyU3RE?=
 =?utf-8?B?Q1JBZHg0TzhWQkRWUURjVjFoV29xdnhET0owdHRIYmdKN3NEdlVOYmNlT1Az?=
 =?utf-8?B?SDc0MEF0bkFNdlY5TUN5cnRLVStJeHVEdnVTMG5WSVJwY29JcmtoenI5TVF1?=
 =?utf-8?B?cW8yVHhRQm1VVmF3ZmhFR1Q2Rkh6eDV3SDVGQ1U4RU9xNWdiaTJRaUZVa0JC?=
 =?utf-8?B?TER4YlYyYk1FUWR2QVlHT3JFdUlDUjBkdnJvL0hrdyt1UG9ZRXNmR012MzQ4?=
 =?utf-8?B?SE1hVzBvVlVjYk1KOSt4RW1YNGNTS1grZzZFOUF0dVUxV2tnODFWL2hZRVBT?=
 =?utf-8?B?eWR1OG0rYzd3U2xLelhBM1I2RWMvRkpTa2hDRUw2cHZkcDFra0YxMGhVbE9q?=
 =?utf-8?B?ck9VUUh6V0pzUEdlblNZUElHcElvMGk0T2FTUzBjSkg1OTlTVktVcC96cmtV?=
 =?utf-8?B?dndtMThHc29Lc2hUSFFHMS85dENLRWpwSkQzWTk3QWhiQUpTQW51bEV5bFZD?=
 =?utf-8?B?Mi9HdFQrMUlxWmxDT0RVL3ZoSGM5SGFXdjZhU2lGVEFlT3NCREJMNkpWVjdv?=
 =?utf-8?B?Qlc0Si9BNmZrMnBqY2I4dXB4b0pnRGU1NlJlQUh4RVp1OWdRSzZnVk53dGxG?=
 =?utf-8?B?R1BMTDBWc3VraEVXcTQ5L2lvWGc1K2pPdmhIcnNJb2NqRk1BaWV1MjhzK2p1?=
 =?utf-8?B?VE0xQWQ2M05ybEZFeFhYOElLOFc0SjNKOVVrd1Vac2pIcUw0eDJkOUV3ajU1?=
 =?utf-8?B?cmpnYzIva0JITDdKcmhTSm14ckltczNzQjlKZ2Z4KzM3V0FHdGkvMXByZGJp?=
 =?utf-8?B?ZG1TMTJyTzlDSXNXRXlEN2V4SlJlaVl0Ym16VElRMTcrdnI4ZGp3RERVa1J3?=
 =?utf-8?B?cDZ1b2ZZQ2R1aGI4R0FEb3g4SmZhaFZJdDZjT29JTGVNYjhFZWZybmp2cWZD?=
 =?utf-8?B?Qnl3SXdianROempsZUdHdUJBSytVWmtkM1J2Qnl0ai9HcmRadmhqN0F4NUNa?=
 =?utf-8?B?UktoYjZNZFdjN2pPbEdydVZwY05Uc3lQcG0rRWN0QXRtdVRWZEJ1eFRGbHE1?=
 =?utf-8?B?clhnQzlEeWxmaSsydjhMdUVvVVJlRDYxaDljTUtveVBPUkc3Mmw2SnY2b3Ns?=
 =?utf-8?B?UmZpVTlOSEc4RDBqb2hZR1VTM0habzRneGl6aEdXK3FzWlZraUJaMHZXdHpp?=
 =?utf-8?B?WEJYVzlHYnRMdGxIUnZtRjJrS01DbTMzZmVUSEpZYnZtd3JMcEprdE9meFlL?=
 =?utf-8?B?ODRjK2I0bk15cHRjL0w4YUZ1UzN0VXpRNzg1eGd0eXhkY3BYQWg2WHhhL2NT?=
 =?utf-8?B?SFF6NitlejJEWVZiNzZxZTlCUkVuQ0ttMVpEekU5akJTdmRwTE4rcGdrVkYv?=
 =?utf-8?B?TXpYbFRIb0FvTy9pRmJzTGRVRWxGRjFyMHJFV1g0WEVlTzRHVkZvc2w0UXdL?=
 =?utf-8?B?L0pCQVhYREFheldYKzV2T0d0bHVKbWN6OFlISENqekh3MFFtOXhHWXhyOW1v?=
 =?utf-8?B?blhNcjFHNU9yUERoY0N2WUVsSHZRdmJXLzFOTVNyTjg5OFNPbkJMZkNWRnJ6?=
 =?utf-8?Q?oK2F0wP4z8d+vNRBRDvSZjQ0uuGbnABryJVfxhOiZ8jo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadf1b71-e15d-4a7a-904a-08dc1d9e3f55
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 12:07:48.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_120829_614097_C6D1DC89 
X-CRM114-Status: GOOD (  13.08  )
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

Ck9uIDIwMjQvMS8yNSAxODo0MywgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiBPbiBEbywgMjAyNC0w
MS0yNSBhdCAxNDoxMSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBGcm9tOiBDaGVuIFdhbmcg
PHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4KPj4gUmV1c2UgcmVzZXQtc2ltcGxlIGRyaXZl
ciBmb3IgdGhlIFNvcGhnbyBTRzIwNDIgcmVzZXQgZ2VuZXJhdG9yLgo+IFN1YmplY3QgcHJlZml4
IHNob3VsZCBiZSAicmVzZXQ6IHNpbXBsZTogIgpPay4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGVu
IFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9yZXNl
dC9LY29uZmlnICAgICAgICB8ICAxICsKPj4gICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5j
IHwgIDIgKysKPj4gICBkcml2ZXJzL3Jlc2V0L3NvcGhnby9LY29uZmlnIHwgMTAgKysrKysrKysr
Kwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3Jlc2V0L3NvcGhnby9LY29uZmlnCj4+Cj4gWy4uLl0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVzZXQvc29waGdvL0tjb25maWcgYi9kcml2ZXJzL3Jlc2V0L3NvcGhn
by9LY29uZmlnCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
OWFkOTZlNDllMWRkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9yZXNldC9zb3Bo
Z28vS2NvbmZpZwo+PiBAQCAtMCwwICsxLDEwIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKPj4gKwo+PiArY29uZmlnIFJFU0VUX1NPUEhHT19TRzIwNDIKPj4g
Kwlib29sICJTb3BoZ28gU0cyMDQyIFJlc2V0IERyaXZlciIKPj4gKwlkZXBlbmRzIG9uIEFSQ0hf
U09QSEdPIHx8IENPTVBJTEVfVEVTVAo+PiArCXNlbGVjdCBSRVNFVF9TSU1QTEUKPj4gKwlkZWZh
dWx0IEFSQ0hfU09QSEdPCj4+ICsJaGVscAo+PiArCSAgVGhpcyBlbmFibGVzIHRoZSByZXNldCBj
b250cm9sbGVyIGRyaXZlciBmb3IgdGhlIFNvcGhnbyBTRzIwNDIgU29DLgo+PiArCj4gRHJvcCB0
aGUgS2NvbmZpZywganVzdCBhZGQgYSBkZWZhdWx0IHkgaWYgQVJDSF9TT1BIR08gdG8gUkVTRVRf
U0lNUExFLgoKaGnvvIxQaGlsaXBwLAoKVGhlIHB1cnBvc2Ugb2YgbXkgYWRkaW5nIEtjb25maWcg
aXMgdG8gY29uc2lkZXIgdGhhdCBvdGhlciBzb2NzIHVuZGVyIApzb3BoZ28gbWF5IG5vdCB1c2Ug
UkVTRVRfU0lNUExFLiBJJ20gd29ycmllZCB0aGF0IHRoZSBjb3ZlcmFnZSBpcyB0b28gCmxhcmdl
IHdoZW4gZGVmYXVsdCB5IGlmIEFSQ0hfU09QSEdPPyBXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5r
cywKCkNoZW4KCj4KPiByZWdhcmRzCj4gUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
