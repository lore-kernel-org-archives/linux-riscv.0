Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B868EC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxLa9cO09ytf8PyBJxrFdnyAQAXOVne93xSxe8EV1T4=; b=FIjGfg2k0RXkux+5hN7hqzPLPU
	8oMx1l1YK6sSRgTb7dUnUJAX0ooTYXtJePLME0fg1duyK6Lb7PwX80TMY0L5AindAOYqX482XlSur
	FqCtWmBpYV2uknk9eSRNwGrAdXcWHmlB9NCzOenDg/88IEDe45KI3siwgnv8it7idYp4FBa9MwFuE
	WN8+57kI5UTPCTbScIbat9WGIeuz4B4wktJU37SyblzYvqB3fd4lOKgB6feCyb7KE9v7pZdtL1Kcp
	WesEEy9EW+ayzwNZuucK7RY+PoFYnQIjLx4tuEJ/qxRnWwVaBtVyjFzu44LY+tQouAZ2uE6nUAhcA
	t8bm/Mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfSE-0000000C5sg-0T7v;
	Thu, 28 Mar 2024 02:25:22 +0000
Received: from mail-eastusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c101::5] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfSB-0000000C5rr-1NJY;
	Thu, 28 Mar 2024 02:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pz6k5wXCWBTka0aInD/jTs4WuBJT8qTTWXHu9HImY0Q9w+IHAUnzuPlSgW7bzdhuhUa+Q2N0UOaijxL9DawdbBftlgztZGSRMz5MalTIQ8yObTeNLTW1YkYlvTTeY9BJbq6KY4cTfeIFZrlXQ7V3aXfYEq/OUjajpWwTBSRQAWxM18NNltu3rQ8SJ0suaPY1EQ5ONhg5BdY1q4jw0LAk5Rvb/PWVnUW8lWetepYG4nfTikAF8Q16znSYTBIuGyxSX7O8t2v0OFX6WgyMyi0sYRto+ThEjDUNSPDAaaWMPQ06iwJ4IQbQRFmWiUqWqeZinp72ieuHNPt57DKu731Ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIdUauLTFeCwbakpr4Q2dCGAc61J1SA9QaxWp88h4JQ=;
 b=UT3EakVWFU+jHYB5rzab+/VI+oA+cw0tPiIyAL+sgZxKo/bO97WOdRU8ilrBtceAAaUwyclcfPHDgICCZePMZnxLQbVDywU4q9P01qwZTwdsF+OlgCzZ+tS1jlYVXJDHQKG5+/Oj+X/UscMXhgjMla767Ag3f8tN8CWo3gj3ocnNjlAQ3loB6O4HqtZ00H/kvftKYBw6iQZ+NUCqwzRhrzHTLJzYqnB7qVvDHSnQQBto9I+sbglkGguhr1mk/N6Rcf55fdbXryzaBIVd0QrD3eEXPT/7faSk+EzAdaW+GHIQ6gn/g1GI6/Jd8fEbCJA26mMzeW77Pfr5phDXlDCTfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIdUauLTFeCwbakpr4Q2dCGAc61J1SA9QaxWp88h4JQ=;
 b=Srt+N8d5vmweyREnoJzhieMiTsfHIMcLTCJbEQyXdVX4oH+/YFC7B48tqMOlSVIFguZgIRZnXuXhmot8U1+04qa4GqS/P8H+54VqFJ/Gfm4fyALO1055xwwB4LL1jf0mrrT/DfbghelqSlXYEahu74RC6ieNto3HYQ8CVrkYQZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS0PR01MB7914.prod.exchangelabs.com (2603:10b6:8:14a::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Thu, 28 Mar 2024 02:09:17 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::c97e:78ae:2565:dae7]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::c97e:78ae:2565:dae7%7]) with mapi id 15.20.7409.026; Thu, 28 Mar 2024
 02:09:17 +0000
Message-ID: <c3817e18-e2ae-4ac2-b2b1-f68cf10ff418@amperemail.onmicrosoft.com>
Date: Thu, 28 Mar 2024 10:09:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
To: Andrew Morton <akpm@linux-foundation.org>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: gregkh@linuxfoundation.org, patches@amperecomputing.com,
 rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, yury.norov@gmail.com, kuba@kernel.org,
 vschneid@redhat.com, mingo@kernel.org, vbabka@suse.cz, rppt@kernel.org,
 tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
 mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 cl@os.amperecomputing.com
References: <20240126064451.5465-1-shijie@os.amperecomputing.com>
 <20240327111740.f8d3802b0eae15bcb8727e04@linux-foundation.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <20240327111740.f8d3802b0eae15bcb8727e04@linux-foundation.org>
X-ClientProxiedBy: CH2PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610::33)
 To PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS0PR01MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: b70c428a-7252-48bc-825f-08dc4ecc1281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXiZmPWUjh4e5YXohQeJqLa6+/2pZpB9hFS2n2A+P7swCjV/GFb98xpFg4VAqD+pYTbi1zV05DqCzzTos8hPCerzbx0FYgm530hwQZLqzvRMtRXncU/nE/LxCJqPFUXQFuExhqNlmFdm+AGrc55cQb3ipZZY5UM8OYDMWZLTowQ3d9dLiXxFsZKnS0srOm8bDZ+i1FRd8QcsIgRNpSzwemOTwJTlh6vryBusOOm2Qgjt840XzLSPn3Kd6IIMykxtDFhqTUVCzeS56ozkT6FgdrcvJbv4aMHFwL4D4on8moUy46v+wmHqM33Fip1gS3hhJzHrXEDfkidkR3Xg2e36oktM3eo7N6gX3di/pvTftHbkjnWm+qisdtwyJaWj6q4/Uvwo14L/RKcxd7hhHkYOecOvhbZxSuA/5EjJ6UUhPKX92DKlISrFSi/9niMJehlJPlnZRd0NqGAGWtV4OWk0cCAko+kN1o+ZS0JVetFC5KamA4Xsw4QMZscRa+hfEXC4w07aYX+2oQm41UhLVLXqkhVz9lI+5jv+vZX+m7eAcbnd6mb/xFg/UKIROve+2sWI68eQBeCNENWYwK+WMKYYpd/1MOzaR8MLCOuifOdfPOPQ0I4QDYDjdSTmiZ4KU4aef5WTanbKdfxdX/WiiX/PqoBJVbLtwTSEyNjVEjszGTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmxMU1pwS1BzRHNvc1JMT2x6ZlUxaVVnUGsyeFZ3Yzl4Z0VuVkJ2WGxiWXZo?=
 =?utf-8?B?KzVWRHIzZmxTZ1VXN0orbVZtWHFtZGpmNy90cGRJSzN2a0ZweFJvSjYrTFhT?=
 =?utf-8?B?V0xDbHZkZWF1MEhOa3ZKTDNScnJPOHFuU0EzYmxXeHQ3SmpDeTJycG5Gc0R3?=
 =?utf-8?B?TlY3cFVkK3JVME45bUd2VkJXRVB2MWJZaWdTKytIdXFMS1Y0T0lUbzFBYnZ5?=
 =?utf-8?B?eitmNmQrL2RrL01UM2k4U0xESjhHNVVadkZVYTNPQkM1RHFqOGVQNVJjT2N4?=
 =?utf-8?B?NFM0NU1janI5ZEx2L3E5UDJOYUo2dVlkeEZGVUNCeGRXQUx6T0ZTM3M1eEVM?=
 =?utf-8?B?MGkzd0dXUW9od0ZIMTZzNWNUcEpYcm5WR2pRR1lkWjBPQ0J5VFdyaWhnS0sx?=
 =?utf-8?B?R3hORUhYQ2prZFlhY3k0UXdPSWpNdmtTM1JSQ3Mvb01NTlpFdWgxSDR2TEI2?=
 =?utf-8?B?N3lxdlU2cVFPUUdMS2JIMlcwdHZFQ0dsdWRkTWIxNlNoQWNHZGNoY3c1VlRW?=
 =?utf-8?B?UU9KeGxPR0h1dndpMjAzdFJOM3Q2dmEzTG1GY0dJeGFvSGFvbWNLV2NpUGZ6?=
 =?utf-8?B?dyswRGM1V1orQ2g2WUJKYmhRRmVGZDFGUWdCL2ZXN2xZK2tMR0RZUHQ4NHhK?=
 =?utf-8?B?aEJtUVVWL1ZBdEV5ZkYzS3lxMnVyMkRxdUxDSFRYR1A2OE1jWHR5Qzlpbjl2?=
 =?utf-8?B?bU1PUEpuVWlEWm93U25iWFg5ZXFYRnU5K3hxeldOWkhtOW04aUk5dWxNRHor?=
 =?utf-8?B?UFlyYlhISm5xVVM0SFlaY1lNQXpUQytsUkxIUzA3MGU2NlhZTVM5eW1DdG5B?=
 =?utf-8?B?cWQwUzhlWU9YL2I5bm9lR05hUlBUbU5XWW13ZHlieWt5R3hadnFPdTlLWFNH?=
 =?utf-8?B?M0RucHhrWUVidFNVTDE2U09DdVFGalR5alBXTGJ4SG0rK09LZXRNYUg1UWtl?=
 =?utf-8?B?UlU3VkxsQi9VY1pVRTJyUzZlSkJESmtFWHFPRm0zRUROT3grU2F0NEx6VU5v?=
 =?utf-8?B?VFQxS3ljeHB3YzBnTTZHQlI1NGxxbGRNMk13aFI5NkV4STNwWHNLUFNpbFBm?=
 =?utf-8?B?UWl4cXhiaThOVis5RCtPcXJYZU5uR0xYa1JMemI1ak9NS0VBZktjSjFPMW9q?=
 =?utf-8?B?dHplRVJQb3hzZkRocXJaT0IvczdFcFNJclRiSnNXblB5VWNwRmc1UUhVQUN3?=
 =?utf-8?B?Ris2UytFZFBDRlJFUjdxb0pNbzdEbXdwUFNNeS9Vbjc2UmEvak1ySXRGSWN0?=
 =?utf-8?B?MFh3TytvSG5ZRlBPTFRyZlpPLzBLT1U4MXE2eU15UkU1NEpZTmxGTC9iT0Q2?=
 =?utf-8?B?K0FTQk8yT1JCVUozWnBLOEVjbjdJODQ5ejRjcWt2b2NocXdXeEgwMEMxME95?=
 =?utf-8?B?QU94ejE2MW9jTWF4L3VKOEhGa25BSC81bVdzVThvN3VsMHBZN3NrUGhOYmtG?=
 =?utf-8?B?cmRPRmtFYUtMckZSZkxxcElOcGxCeTZOT1BFZ1BXZmhnL0hGYzRuY01QSURu?=
 =?utf-8?B?eDExNnFDSHByM292OFFJOHdzbldXV0VQWmZSQ1p3amo3OEkxQ1RSLzA2OWhy?=
 =?utf-8?B?Y1BXUzM1SGQ5ckl3OHFJcTNUNXdJNGdIWDZmZTNCUzJ4WEE2WG1Vb2FpZ1dl?=
 =?utf-8?B?b1FWWVdBeTd4TzRzRm84OENGVG9YcDZWY2k0UGJNUGt2SEJXWE5zdXlVREp3?=
 =?utf-8?B?R0pTTlV4ZGkwZFYwWmE2WE4vYXFra1lUc0d5eWdBZzJ6aFUvNStLVm9qbDh0?=
 =?utf-8?B?c2RUVEFXY2dxWTRpTUcvWmdiczQrd0JkcGlsSkRHZmx1M1VDNFk3OWM4cFh5?=
 =?utf-8?B?Q21rMzdSWHBUUmwwdWY2aEhETmVjQjFYK2h3UmRCWHo0NkxqREtxS00wd1A1?=
 =?utf-8?B?TkZsTWx4RFpYRy9LV1N4bXpuTzErbitoSXFwNFBUWTcxblRHMkI5Tm4xZXdv?=
 =?utf-8?B?cDM2WG1GMFlLUUpYT1ZFcXY1RmovcS80REVqNC83ZjBuUUNJeFh3Z1czbEhh?=
 =?utf-8?B?aFppVlV4QmZ4cHNUZW9IZi9HNjI3UzY0b1NZcVNDYW5vM3dxZlJKemlrRmFN?=
 =?utf-8?B?c2pZaWJEMXJqSStrMWVVZE9nR2J5ZlFQOTJKU1lSMUlsTzJmK0ttSUZUejBY?=
 =?utf-8?B?dW0ydWV2d3JPbHdyVXhrSGI4T0RSLzdSSExzU3VWbDJhZVBHRUkxcTNOd09m?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70c428a-7252-48bc-825f-08dc4ecc1281
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:09:17.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lxQFw0xdXFPsMazXDgRh+EiCrqzbtlniEo9q2/Wy9gp7bXwQrzl3SKRruekWydArkLAC+qliQj1CwcSU6NNaCdRQmdiCKzzaSdOGfNKZoHtWTVnUnPMT+8NsjhXmNJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR01MB7914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_192519_390008_3175BFED 
X-CRM114-Status: GOOD (  10.89  )
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

CuWcqCAyMDI0LzMvMjggMjoxNywgQW5kcmV3IE1vcnRvbiDlhpnpgZM6Cj4gT24gRnJpLCAyNiBK
YW4gMjAyNCAxNDo0NDo1MSArMDgwMCBIdWFuZyBTaGlqaWUgPHNoaWppZUBvcy5hbXBlcmVjb21w
dXRpbmcuY29tPiB3cm90ZToKPgo+PiBEdXJpbmcgdGhlIGtlcm5lbCBib290aW5nLCB0aGUgZ2Vu
ZXJpYyBjcHVfdG9fbm9kZSgpIGlzIGNhbGxlZCB0b28gZWFybHkgaW4KPj4gYXJtNjQsIHBvd2Vy
cGMgYW5kIHJpc2N2IHdoZW4gQ09ORklHX05VTUEgaXMgZW5hYmxlZC4KPj4KPj4gVGhlcmUgYXJl
IGF0IGxlYXN0IGZvdXIgcGxhY2VzIGluIHRoZSBjb21tb24gY29kZSB3aGVyZQo+PiB0aGUgZ2Vu
ZXJpYyBjcHVfdG9fbm9kZSgpIGlzIGNhbGxlZCBiZWZvcmUgaXQgaXMgaW5pdGlhbGl6ZWQ6Cj4+
IAkgICAxLikgZWFybHlfdHJhY2VfaW5pdCgpICAgICAgICAgaW4ga2VybmVsL3RyYWNlL3RyYWNl
LmMKPj4gCSAgIDIuKSBzY2hlZF9pbml0KCkgICAgICAgICAgICAgICBpbiBrZXJuZWwvc2NoZWQv
Y29yZS5jCj4+IAkgICAzLikgaW5pdF9zY2hlZF9mYWlyX2NsYXNzKCkgICAgaW4ga2VybmVsL3Nj
aGVkL2ZhaXIuYwo+PiAJICAgNC4pIHdvcmtxdWV1ZV9pbml0X2Vhcmx5KCkgICAgIGluIGtlcm5l
bC93b3JrcXVldWUuYwo+Pgo+PiBJbiBvcmRlciB0byBmaXggdGhlIGJ1ZywgdGhlIHBhdGNoIGlu
dHJvZHVjZXMgZWFybHlfbnVtYV9ub2RlX2luaXQoKQo+PiB3aGljaCBpcyBjYWxsZWQgYWZ0ZXIg
c21wX3ByZXBhcmVfYm9vdF9jcHUoKSBpbiBzdGFydF9rZXJuZWwuCj4+IGVhcmx5X251bWFfbm9k
ZV9pbml0IHdpbGwgaW5pdGlhbGl6ZSB0aGUgIm51bWFfbm9kZSIgYXMgc29vbiBhcwo+PiB0aGUg
ZWFybHlfY3B1X3RvX25vZGUoKSBpcyByZWFkeSwgYmVmb3JlIHRoZSBjcHVfdG9fbm9kZSgpIGlz
IGNhbGxlZAo+PiBhdCB0aGUgZmlyc3QgdGltZS4KPiBXaGF0IGFyZSB0aGUgdXNlcnNwYWNlLXZp
c2libGUgcnVudGltZSBlZmZlY3RzIG9mIHRoaXMgYnVnPwo+CkZvciB0aGlzIGJ1ZywgSSBkbyBu
b3Qgc2VlIHRvbyBtdWNoIHBlcmZvcm1hbmNlIGltcGFjdCBpbiB0aGUgdXNlcnNwYWNlIAphcHBs
aWNhdGlvbnMuCgpJdCBqdXN0IHBvbGx1dGVzIHRoZSBDUFUgY2FjaGVzIGluIE5VTUEuCgoKVGhh
bmtzCgpIdWFuZyBTaGlqaWUKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
