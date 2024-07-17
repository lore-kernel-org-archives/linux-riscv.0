Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688E3C3DA49
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 02:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKcG7poRSnC0l71/Mu8m+5Wg9AoXV7iT8cMhvjszN/o=; b=GyuW4SSxToGyPkQtiOtdmxQtcp
	qndryK7Ikyulb9jDzHCC0ZZ/B0AYCQS8e60MJpSVC6C0KsoxqscvWwUSu7KQVVKMOil1aS3LWd4v7
	05aC4aw1LnGzJ6ARnV8ObvH3NGPjvToX0zr6fblpVAng4TTrPvlzplP4ynytveIr4DeogdDfa+ZNf
	KMySrVeyIH/bnJV940J/ySWs7gMX6Bujc7ODGOpb1kpglBfjixtgDBrmc7acH44pohVbP61gnePRi
	3ns45SfuRQpzR+NTlT205xtrnPAXnA19fSQq+19OuEmJNz6BdCX1ksAbgPIsaf0S8X0oYcapHtuXC
	F9g+qhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTuCK-0000000CLDP-2TSS;
	Wed, 17 Jul 2024 02:15:16 +0000
Received: from mail-bmxind01olkn2081b.outbound.protection.outlook.com ([2a01:111:f403:281c::81b] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTuCH-0000000CLBc-2Db7
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 02:15:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1Z3ug0vb5iGmvjouTr2elJorZ9cLxIqvb0n2DQN6sNwt0xihdFLYo3upOyr8yUYqt1r2g2VQRPG747SHLCmND129tkP5omCPyUnOfe79HSUCj/eXQvLi1NKFb8Mn1waV8fP1vmNUtCxzauFPqmB1V5h9w9dV9Kkkd6xETqHn8AxGicwmw62GAJZnl815xBXfrCMEkmUMghtYVRCJDxES2Gu/bMHl6QoiOVIhvqC3Uf904tEjke6hneJ34N3rq/U8GliZ/xFqBemNl3784yvNxJlMRLdi/OSl6ojnGc2jJ3EJkqbuCEG3d0+qV4caYyY4JRgi1HXbZQcrQD1BzfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rii14YrJLaJ+M9FvTgB3lwmilGEKwFezas2Z+xgjn3c=;
 b=Etqi2ctBwNcD/hGqFKl2n3h/BAbiZquv4uL9GBMYx99zEzZzUUDPS2zKE9FFpBaFosdS31K4HWEsPKG77vMDJXhkOnjQtDU4P3+hudSSYY9xH6pB3zZxOouYm1NzhGcwnnGysPXXBC9/h6/4tmN3EiIyHhEXmferrovRiGVnJsZDAprOoBeP2hS9GrPiEZ4/baG+QUTxqIHvfeiQDCTX/erBvq2g/5sWut/cvcbqHeCcREzuxWt1MDISv0ym78Uxu6o9defDwIcOpRDInp34fcwehPDg6U9+Q8B9UKSpOnMayeyRHaQeNFFT9YnmERNSSKwJaxEbUmVk7krNKLKp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rii14YrJLaJ+M9FvTgB3lwmilGEKwFezas2Z+xgjn3c=;
 b=SS/xll2rdpQtCHSYEDUlMRjsFYPtEbJYEa0jrECxIC8jFtf8LXYrjfU62QGnlrOFQfWHv1xrMQuGgxaPKaaXzScjWSd87WWaJCoIWTXQek6kmrfg4gL7BJrUNu3MTGLwXicJaSM5rRym2JzVXrqSIDv9CpUjYcd4Qoar00Bp8r7WIIIzXc9msNkQ0/Q4fkOmu9hJ8dyMRnk+iWjvfkupSUqFWLFRHBnaph4MgYSmk8BCtbajXgb5m7rdUN4fKw/fgv6hXxch/4xUI6bMvPgRMOwR6ZgCPDpFhkHBsHP3qXAvUUDMF407qkDJTNx1qsZ9zY4kLffEc8o2SwwR46v5Iw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1588.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 02:14:58 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 02:14:58 +0000
Message-ID: <MA0P287MB2822A2F07F21FC5445EF8946FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 17 Jul 2024 10:14:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
To: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>,
 Haylen Chu <heylenay@outlook.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221281561CCE511A5094D28D7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240716-cloning-canopy-a6799dc7f3b9@spud>
 <MA0P287MB28228BA5CC8B6F61A4C237E9FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953D97AE6DAD99C386CB7DFBBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953D97AE6DAD99C386CB7DFBBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [GYOp0cl81B2eN/SCzWhkmlf4tuF4+QYn]
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <88d54304-23a5-451c-971c-59d3720a0a1a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1588:EE_
X-MS-Office365-Filtering-Correlation-Id: d2644d8c-7a33-44d8-7a61-08dca606406f
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|461199028|3412199025|4302099013|1602099012|440099028;
X-Microsoft-Antispam-Message-Info: klGHeewaT5fU1FFvsF49INoLX/AIbtq1NyXksSkrA2s69kcGP+zdv2u8Sa80zGzoc28LQQx1O1XGmto0l8BC7lWTdXJDDcLUg4SZGet7/8YYIUN3y+9RAdyPVEoLoKWHBQiK1khxkTz8FBExlkVJNuiYcl4U6Vx8Ye6QF5Dj3LAkwSs0k8D/Sb8f03s1BsH21n0EtgIOwYx5XJIKlirqYSHB6e4+APS88Y9qNz42ccXMZX0cQMVOT5j8cIVMuqgESGfilmwQO86p1BgR8YUsN0sVgd4lbvsG/E8rTHpQiDoRyYrN7wRCj2pqSScG0+lbtmoPdgLXaaBQ9C7Vo5wRA0pBxirx4Oy1FlRPBeH2M1PBKMmtLZeULTFgZ7wKBtxnzgYjzcB1DYYXM1zv/Pm03VaLDa/D8+rGu/21WIr1YBBdhkJeRc0Y1wNJDHW0IlRbZ7YkReB5BqWbRxaovz1PWN56JSh9EvDQJnZfzmb0k6Ccwa5wGka4D2V0Up3rjTXNaOfcjXRYEroI9avS9cD5Gpz5Ul5ACocH99yhyi6SulBi3Ew4h2D3h5LGCwsyt6G+a66bJMeaNMOeFBIDVmZkdIesYYCVEiRdaOkgXlqG/Ne2BOeTJL/YORxx/vC3JteM/ZlvS5zKREN50oJkCHrPgdKGU62vyTzXG9O9q4837Edt9gBTb1ZeqyxZFypprV5JLWtsxHweM80puUlOLlRiMjpr8eCsJlydPytcuq8Ogcpp5TBEKzXDTplq3KJT9Hro
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW14a1FIeE9NQzhzOTRIa1BVQk5GRXBtZHlML04xTHFqcGJRSWdWZi93R2Jv?=
 =?utf-8?B?ZmdVdDE0WHVTaG9zOU5vT1MxdEk4VWJ3bUp5RkQxTGxWRVhLclBjUkxucFE3?=
 =?utf-8?B?N3piRDd6aVhJOXNZcllMR2Nud2hPbitpVXBldUNsaHQ3Q01Lbnh4U3kxYk1Z?=
 =?utf-8?B?WkVBYUsvaFNGUjRiNlM0U3VxaUVNNktoVFg2U0dYelFvSklWYUQ4MUIwekpW?=
 =?utf-8?B?VjFDeVVSczlQWHpVc0dqMTZDQTZRb2IzZjRURmF1Z0VFYkFRdjNMVFdRZmds?=
 =?utf-8?B?VGtoZ2tZQjhVNE5YSFZuaDJnWXB2Vm9jdTRiR2YwTTVNNmZyMGRUZXVCT0lh?=
 =?utf-8?B?SmJpdVJoWGxlM2F0U3pXSElpMlpxdXQwb2Q3MVppdEhTVjQzdkNTd25RbmdV?=
 =?utf-8?B?SUFrallXU2ZyTUFUM2REeDN1Zy9mcGU1cXV6Q0xTd3BvRnV2MEVrQk9lSnZQ?=
 =?utf-8?B?ZDFpS2JXMG1PNDRZQjFhU3RQZm52aWNrTkp4YUt0eXQ2WkFtZUgvYzF1d0ZR?=
 =?utf-8?B?cE5lQnlZTm5IbUZBNjRoUjV3OS9YRmNDV3B6U291OVB2WHFlTTlTY3I1NlBs?=
 =?utf-8?B?ZVV3Y05GSVZwTFY5T1BWdDZ0TnhYb2hlYlFLSUZCdHRpVkdQS21pN3dUd2R1?=
 =?utf-8?B?Um95Z0JIVHZrYkpBTnN3c3NDNWord2lUakE5bVMycSsycGpGVXYyZWM4bUFl?=
 =?utf-8?B?d3BQUWR1OFI4dnFVUDlqWTFvWnhvbWV0dGRvK3pTUGE5ZnhkdjB3QTMwOEZM?=
 =?utf-8?B?R0NwQU1tZG02QlhMdm1icHBORDVyOU9lRE0rZkV2UVRPempyUUoyL3VWM0Vi?=
 =?utf-8?B?bEdOSlRvVE5CUmNhbEFmMVRTWHVHMndZZkVralZlOHBxMFJFb3VlM0J6ZTU4?=
 =?utf-8?B?RXVLWXNqRVJwbmVjRjFzQ2RDS2ZaMkkxQVBTNFlDaEhMVk01TWlyenFRYjN6?=
 =?utf-8?B?dFZOelpkTjY3WTR4aDFPRUNxN3BVQWpVTzBIRExXV0NUZ2hrcWhpSGdwejNm?=
 =?utf-8?B?endxdFNUOEVhcUw4azhDUzBrNjNSVnRiclQ4SnRvM1ZVQUhZN01OcEduVnZ5?=
 =?utf-8?B?YUdNK1d6RHNqSjgrT3d2QTAyck9qVXI4NXVRVjZPdHdCYTl3SGlzaWJvY3Jx?=
 =?utf-8?B?WmRxS0xiS0g1aGZPbEhHNWtySERyQkpEYXlSdVAxODlKUGo5VjNFdTZsSTRq?=
 =?utf-8?B?QTJNTVk3VjlzYlBsL3JaalRzN0tGMnYzVzVxb25QVi9MdWZsSE9OMXdiWjJL?=
 =?utf-8?B?ODZnUFhNcThKeW1PT05ES3VIbmVUOElEZXFPRTl1cTRiNVhMNmZSZzd3VkZY?=
 =?utf-8?B?eVoyNThXNTlBazduNFBmWlRuMFM1L2hVUFJWeU8yYUxSbFduRUtZWTkwcjZB?=
 =?utf-8?B?akw5TTNvZ1YxdmVIUmxPTzVTSGdHUlk1STQ1MUxlcHp6Rlh4aWE5RW1odEQz?=
 =?utf-8?B?cnFsOCs1UGhCbTlzV0t3d3gwTG9tWEhtQnVpUmFYWS9xT3FtM2dGMGlGeXhx?=
 =?utf-8?B?ZEFYWnJUUGZpNEpHOTc5bkM4K2JaN2p2NWpITmdEemt5YitDZ0RDQzJxS1V1?=
 =?utf-8?B?eC90NFg3R3FzR0kwN0hYa09oZEtSUmNiWnBHSzNpdUZpUjdqTVRrVHJzZFpT?=
 =?utf-8?B?UHFoY212b2V0dFRsUFN4R3U2UVY1RDhVdEJEUmplOU9EYVhBbzRWaDVoQyti?=
 =?utf-8?Q?SuSIg4R//xDagspVj8Yj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2644d8c-7a33-44d8-7a61-08dca606406f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 02:14:57.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_191513_708243_2DDF9F8C 
X-CRM114-Status: GOOD (  16.12  )
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

Ck9uIDIwMjQvNy8xNyA5OjI3LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE3
LCAyMDI0IGF0IDA4OjA1OjEwQU0gR01ULCBDaGVuIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjQvNy8x
NiAyMzo0OCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQg
MDg6NDM6MTlQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMjQvNy8xNiAxNzo0
MiwgSGF5bGVuIENodSB3cm90ZToKPj4+Pj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBkb2N1bWVu
dGF0aW9uIGZvciB0aGVybWFsIHNlbnNvcnMgaW50ZWdyYXRlZCBpbgo+Pj4+PiBTb3BoZ28gQ1Yx
ODBYIFNvQ3MuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhheWxlbiBDaHUgPGhleWxlbmF5
QG91dGxvb2suY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgIC4uLi90aGVybWFsL3NvcGhnbyxjdjE4
MDAtdGhlcm1hbC55YW1sICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysrKysKPj4+PiBJIHNl
ZSBzb21ldGltZXMgeW91IGNhbGwgaXQgY3YxODAwLCBhbmQgaW4gcGF0Y2ggMywgdGhlIGZpbGUg
bmFtZSBpcwo+Pj4+IGN2MTgweF90aGVybWFsLmMsIGFuZCBmb3IgZHRzIGNoYW5nZXMsIHlvdSBj
aGFuZ2VkIGN2MTh4eC5kdHNpLiBQbGVhc2UgdW5pZnkKPj4+PiBpdC4KPj4+Pgo+Pj4+IEkgdGhp
bmsgc2cyMDB4IGlzIG5ldyBuYW1lIGZvciBjdjE4MXggc2VyaWFzLCBzbyBpZiB5b3Ugd2FudCB0
byBjb3Zlcgo+Pj4+IGN2MTgweC9zZzIwMHgsIGlzIGN2MTh4eCBiZXR0ZXI/Cj4+Pj4KPj4+Pj4g
ICAgIDEgZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspCj4+Pj4+ICAgICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvc29waGdv
LGN2MTgwMC10aGVybWFsLnlhbWwKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3NvcGhnbyxjdjE4MDAtdGhlcm1hbC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvc29waGdvLGN2MTgw
MC10aGVybWFsLnlhbWwKPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi41OGJkNDQzMmNkMTAKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9zb3BoZ28sY3YxODAwLXRo
ZXJtYWwueWFtbAo+Pj4+PiBAQCAtMCwwICsxLDU1IEBACj4+Pj4+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4+ICslWUFNTCAxLjIKPj4+
Pj4gKy0tLQo+Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy90aGVybWFs
L3NvcGhnbyxjdjE4MDAtdGhlcm1hbC55YW1sIwo+Pj4+PiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4+ICsKPj4+Pj4gK3RpdGxlOiBT
b3BoZ28gQ1YxODAwIG9uLVNvQyBUaGVybWFsIFNlbnNvcgo+Pj4+PiArCj4+Pj4+ICttYWludGFp
bmVyczoKPj4+Pj4gKyAgLSBIYXlsZW4gQ2h1IDxoZXlsZW5heUBvdXRsb29rLmNvbT4KPj4+Pj4g
Kwo+Pj4+PiArZGVzY3JpcHRpb246IFNvcGhnbyBDVjE4MDAgb24tU29DIHRoZXJtYWwgc2Vuc29y
Cj4+Pj4+ICsKPj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4+ICsgIGNvbXBhdGlibGU6Cj4+Pj4+ICsg
ICAgZW51bToKPj4+Pj4gKyAgICAgIC0gc29waGdvLGN2MTgwMC10aGVybWFsCj4+Pj4gY3YxOHh4
LXRoZXJtYWwgPwo+Pj4gUGxlYXNlLCBubyB3aWxkY2FyZHMgaW4gY29tcGF0aWJsZXMgOi8KPj4g
U29ycnkgZm9yIG15IGNvbmZ1c2lvbi4KPj4KPj4gSGF5bGVuLCBzbyB5b3Ugd2FudCBhIGNvbXBh
dGlibGUgdGhhdCBtYXRjaGVzIGFuIGFjdHVhbCBTb0MgYW5kIHVzZSBpdAo+PiBldmVyeXdoZXJl
Pwo+Pgo+IFRoaXMgc2hvdWxkIGRlcGVuZC4gSWYgdGhpcyBwZXJpcGhlcmFsIGlzIFNvQyBzcGVj
aWZpYywgaXQgaXMgT0sKPiBmb3IgdXNpbmcgU29DIHNwZWNpZmljIGNvbXBhdGlibGUuIE90aGVy
d2lzZSwgaXQgc2hvdWxkIGJlIHNlcmllcwo+IHNwZWNpZmljLgo+Cj4gRm9yIHRoZXJtYWwgc2Vu
c29ycywgSSBzdWdnZXN0IHVzaW5nIHNlcmllcy1iYXNlZCBjb21wYXRpYmxlIG5hbWUKPiBhcyB0
aGlzIHBlcmlwaGVyYWwgaXMgdGhlIHNhbWUgYWNyb3NzIHRoZSB3aG9sZSBzZXJpZXMgSUlSQy4K
CldoYXQncyB0aGXCoCAic2VyaWVzLWJhc2VkIGNvbXBhdGlibGUgbmFtZSIgZG8geW91IG1lYW4/
IENhbiB5b3UgZ2l2ZSBhbiAKZXhhbXBsZT8KCkFuZCBhbGxvdyBtZSBjbGFyaWZ5LCB3aGF0IEkg
c2FpZCAiYSBjb21wYXRpYmxlIHRoYXQgbWF0Y2hlcyBhbiBhY3R1YWwgClNvQyBhbmQgdXNlIGl0
IGV2ZXJ5d2hlcmUiIG1lYW5zIHRvIGRlZmluZSAic29waGdvLGN2MTgwMC10aGVybWFsIiBqdXN0
IAphcyBIYXlsZW4gZGlkIGFuZCB1c2UgaXQgZm9yIGFsbCBjdjE4eHggU29DIGNoaXBzLgoKQW55
d2F5LCBhcyBDb25vciBzdWdnZXN0ZWQsIHdlJ2QgYmV0dGVyIG5vdCB1c2Ugd2lsZGNhcmRzIChj
aGFyICd4JykgaW4gCmNvbXBhdGlibGVzLgoKVGhhbmtzLAoKQ2hlbgoKPj4gT3Igd2UgY2FuIGFk
ZCBvbmVzIGZvciBlYWNoIFNvQyBhbmQgaGF2ZSBhIGZhbGxiYWNrIHRvIGN2MTgwMC4KPiBTb0Mg
c3BlY2lmaWMgY29tcGF0aWJsZSBtZWFucyBtb3N0IG9mIHRoZSBTb0MgaGF2ZSBkaWZmZXJlbnQg
cGFydAo+IGZvciB0aGlzIHBlcmlwaGVyYWwuIEZvciBzYWZldHksIGl0IG1heSBub3QgdXNlIHRo
ZSBmYWxsYmFjawo+IGdlbmVyaWMgY29tcGF0aWJsZS4KPgo+IFJlZ2FyZHMsCj4gSW5vY2hpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
