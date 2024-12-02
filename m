Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF30D49792
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 02:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIa7X6cu24CpN2Ci+hcILjW1BKWpDr/q2BIIp161plY=; b=snpsJRZSnIm40dF0Mnsh2bzlUZ
	PPPvcBcmOk7rpwZE4ufBHvkOHK8sVnl3txw7MmPq1NZpfJjtOxtvjiosPNS8ro41pio3dkzITInjc
	lGotZV/POtvG0FsOkz3ZI/FA86064wBTsi17JZegS9R9G6vaeOJiIXTN/kT8dQDgHaws9+iLw6OJQ
	8gQZE6VsKTvQsLyx/WystEI3BtasLJ4WdeXHYLrS3XcGxRvXyO5acVyKnZbIeYyQ7YlaaJAALt903
	Fho33oGcTXJzT7TO4/zBy0NPFcE1T3lue3zmYoW0pTNWiRLcq+Itd4t7EG01o3vURF8UM00j20Hfj
	adTNzo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwPV-00000004ph1-0wHk;
	Mon, 02 Dec 2024 02:43:41 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv0A-00000004fdr-2ui7
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 01:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqzYTrKYPIfxCPhLD9fsbNobEN/MmZz+bmZFn+IzYCK3tPjScMzhTd4W/qH/DNSMsRsM7uRO/MuXUUVsetbP7A733XP9bqW8sVSIom+xxDehdl1nCSiccAS+fmx8C2m7vjHApI9KhEFgRz8EAdjUPNt2gOOR8Ue+5qayM3rT5DY8kY7AQdrGHxw/8zaGeHMQBFYSWcR2vaEpwpRl8t46B6f1u8KIhV7F3mM0Js2CcUCws6U8zhF/VE75oza7eKEssQNQ/fHtsZDjKk9b8ZWKYZbjYsshDwe1sK5suoCtYZ879195Ev+U0NyZvKB/2MHTxyGq05R5YHAYbpDlGdG0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unIjfumOIbj6MvEdaMElnhmqgQvlPVF+bAFpF/CON2Q=;
 b=P0C2Dsl18WKOX2ySGf1Ry7eNNaihIFdCD4Kn2wv6F6Dhlfg9CcNf1/nfiRGR40pI4rZ8+uOlgzbrwB4K5bvcEK3Rcevs92amg0e7/mVw5K9dLW9DznznpJOapYMOYE17Y3Cm3q+D89yCYctGA5oGsr8tYg0qiM1/vS5x+vYG+nxyNJh0zSfWsQq/3nkvquB3pW6J/CpktInKN+EAU/vOUFA8wGxBw3vonfbG5scaZO0VR9iknyCA4GPdRq8toV6vMoPdAYJyZzcBJao3gVhbGzEzASRx1RXUARF+MAM6RAblO9aYt0xHvrKHqYWzgQpJ0/wYfXQQzPWMwfpJEgA3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unIjfumOIbj6MvEdaMElnhmqgQvlPVF+bAFpF/CON2Q=;
 b=ce+qyb70bO7lISc15J+g5K9STRwENLkNekMbvz4UmNthgNZMQEu92ybwGqCJ2mE0bl2FNUBs6gq0revICP/UzQGFgvGVaaNmg5Hf4Ej2/OsEFC3nMlP4V9MHUSy8kinlY6Xzd3ozTCpOJLtgUga+6glh7pFF+31rfHM77TYNvQUUCn8Q4PjczPer0vYNVQEodC9LYUoo6McsIyxEThj+JbI29XMO6BH+4oAZEQgQBxymuBLBR7/Fn9/CVSDOPzGRQjLJTCQxRfCnwYznQnSLQgAmJzdt6qT+UMH0l9fq9Yhn2TQjd/b3vnRLsFf1CDXRG8J5e2d8zG78VWI43X7OuQ==
Received: from MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:68::20)
 by MA0PR01MB7395.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 01:13:04 +0000
Received: from MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::285f:e601:b80b:465a]) by MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::285f:e601:b80b:465a%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 01:13:04 +0000
Message-ID: <MAXPR01MB398467232518EDC15113B93BFE352@MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 2 Dec 2024 09:13:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20241129195000.GA2770247@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241129195000.GA2770247@bhelgaas>
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:68::20)
X-Microsoft-Original-Message-ID: <848e1bff-1945-4279-918c-4177ece805f4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB3984:EE_|MA0PR01MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a01d3e-b2df-4b48-029b-08dd126e78da
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799006|19110799003|6090799003|7092599003|8060799006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0s0WWVBTmZTOUZ5OXpjY3pJdUtzMW1hMEhjS3FJeVpDWnFwT0NVNGVYVnhM?=
 =?utf-8?B?V2p2MHVaUDNhVkwxSkVDRHdCWGQvdGY0TkFPNkVtSVFaelFjVHl1d3pMbmVs?=
 =?utf-8?B?ejBvRHMweWhBYUMwODJ5ZVl6UmZoU2ZKdHhBNHhudmYwRTVVRDhtNnU0ZDhz?=
 =?utf-8?B?WldCZzZUdjNaY0ZCbHdlYnI2OHEzSTVNWm1EL091eml1eFlJN1cwVHQ2Y1V1?=
 =?utf-8?B?cDZ0eFZocU0xWWkvMlRXSC84U1RqMWgzQVZvWXVLN0M2cDhvRlFNVEx1ck8z?=
 =?utf-8?B?MkJ5NWZ2dlJ6WUdEZS9CNjYxYlJadHdXWkRMTHVzd01wRW53TTFlYkpZS0dN?=
 =?utf-8?B?dlEyRWFuV3l6UEVvTXhwOGJQckZhUWxWYlpwaXJkdlU0Z3VETHpxMG1jYXhR?=
 =?utf-8?B?MWVGU1VIdWJJS2U0UG9OK0JZRUlNN0w0cVpZZ2JEUlljdTZoMVJvdjR5ZVZi?=
 =?utf-8?B?RklaZHlBc3RiQmRXa05OSG1hUGRpWVhLdkxGQlBnQ01ycUZ3bllCYm01UHho?=
 =?utf-8?B?dTcwQ1Z6UGZGZFRJcklUTEdZUU1UV1hCR2tMNDFQZ1ZMR0loNlZSaEJEUXE0?=
 =?utf-8?B?SmpNNHA4RG9tT3BZOGl1ZHA3RGZDd29uTHp0YWFrZnJreTVtRTgrSDBWaUxX?=
 =?utf-8?B?aXp5RktNTEU1NDBXeEFyc04xQmFmdkl6RTcwcVd2ZlYzbmJpbVNLamt2cWsy?=
 =?utf-8?B?MFl3T0RCaHBsQWNQelJGMEJSZ0VqVUpac1NxVEdKSHhjRzJpeGM0bHErenJV?=
 =?utf-8?B?UkZDUVQ0K2RwQlFPd29uSmptOHJ1WE0wZTVaZ1JVUGo0NVFpYWc0eGpUME1z?=
 =?utf-8?B?ZTFOZEtNNHNTOWFnN0F6SnNUcGpwRExOWldvVmY0VEd2RTljOEk3cm1mRXR6?=
 =?utf-8?B?WmQxbFVnT3RTNmxSNk41RkFxVlRKaUUyU0RDOVBLZW83QU16Qjg4RUFudzhJ?=
 =?utf-8?B?bEFDQ1c3cHByamdOMVZrWmM0RWpPMktUTERwU29ITkVkcWhpREUra3RPZTNN?=
 =?utf-8?B?c1U5L2NHTStuSUdzenRYMG9jRm9JT243ZWxCZy9JSFY2UWFnZ01Lam1vVEJm?=
 =?utf-8?B?NW5ZY3ZoRXpsamZic3Y2dzMxalpycTlySENnOGpteGo3Zm5xQkU1cjlVU011?=
 =?utf-8?B?Q2VWQjJuQ05lZWphcDg1SHI3WjFjYUdSYjYrTk1rbUVOakpQdWViRXQxTm9L?=
 =?utf-8?B?QjFkamtsUzYrcjZna3hkRmg3SWdmcjlWbWxML0UwZWVHRFZ4ZW1rOC84SmNF?=
 =?utf-8?B?Y2hNMDNQMmxWVnozeUo4N05XU082aEcrbWl1YlA5TEZUaVcyT2xtMUt5WjVF?=
 =?utf-8?B?NS9jZmhEeTlCMytJeDcvcXM2R0NCN0dMTEh6VGhhNzV1OXJFM2oybkRZUlNU?=
 =?utf-8?B?NmtHQkJpVVJIeVowN3VycXNFMDVpVVErU1ZmTXBac2hmN0YxM00zMWpJV3BV?=
 =?utf-8?Q?llrTKXb7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtXY1RDaWc3OWFMS0FROU4xNXRmU3lzSVMvSFFJVlB6QzhtYzl0ZDBsS2VN?=
 =?utf-8?B?MEZhYUlCanR3M3krbVgyZm84b2hmelpnMG4vVHg3TG5PbytNU0NYL0dwYTc3?=
 =?utf-8?B?ZUVhemlZYmRLODFFYmlVVHpzc3F3Y1NIUWhlbWk1RlBZT0swNngrRlU0M2g5?=
 =?utf-8?B?R25UUnZ2UmhJUHZZZmp6eE42Q0tDbEx0RW1WTmdvdjVqaVlpTEU4MGlzZW5x?=
 =?utf-8?B?MFdibGh5ZDBzSmEyaXJ5ZUNpQnVudUkvaW4yaDVWc3dHZXhTaFNBNzRwSmEx?=
 =?utf-8?B?Ui9SVm9XQ0cyb3l2aFNkN0pYS0E5eVBrQ3ZDamQ5QTZuLzYydUloVjNLQ1gr?=
 =?utf-8?B?b2F2aU51UmkxYUJpRlBDSWRkZUEwQXk4UnE1elg5cEFnOVJqcTdiNHFxdURO?=
 =?utf-8?B?aFgrZnhsRk1PWklaZmZLSGpaaHdtNW9ndjJBR20xRG8zay9DS24yblZUNDVX?=
 =?utf-8?B?TkhvcWdTL0hqelFLT1VGMzZtNlAxL0luZEFZODNvM04vTFVYblhRSndubVB5?=
 =?utf-8?B?bXE5bWdMd00xbEpXOGtMTjJ2Ym9EMXZHS3ZyVENLd2FKTXhmTTlQejdBWDQr?=
 =?utf-8?B?Q01KODg2eGhsWWJPWGtVQW9SZUVjUEs4dnluTzNIblJ6Zk0vVnhsK0I2U2dV?=
 =?utf-8?B?aExMU3pDNkxSNzJBMjRxb0hHOG90cWVLejdUaHNnU2l1OVZpdDVkd1Rva3o0?=
 =?utf-8?B?ckNjcjE3aEtsTmFVUW1MWHRkQ0d1UEczNGp4bjdXNEdFVHhYaEVGcDEvOE5l?=
 =?utf-8?B?OHJxcmRob0FSQ3BrOGlhZzRJVHkxR0twbUpnd0VML3NZVkZ1cHdyZW1LaXpv?=
 =?utf-8?B?TVFOeDROWERxTURFdTJqZlpZRUxBVm5yVlVhaWpHWVFiMFhObDd0N3ppMlF3?=
 =?utf-8?B?UTJNUWQvYkZJcFBIRlg4WTV3cUhNYkljdmpzOUlUVUgvRDhMUEU4d24rQzVG?=
 =?utf-8?B?SWNOMHpjWDNIQitLbXgvemZhRUhteG5NL0NLRGplWE9YdnVmYk9TdnJmTlVO?=
 =?utf-8?B?RVBpRDN2blpBR3RtdUowekdXUk9mOFhmbEZLMXQ2dmt5MjFxdkRRdCtNSnE1?=
 =?utf-8?B?ZHVMMUdpK0RXOVFBRjFKNS9WYkRxc0xiT1o3cmpNenFFZ1oyR0FURUgzdXpi?=
 =?utf-8?B?Nkhnc3R0Um1jaE9McEZSaWJiazEvUkZKdDBYQ3BlN0RHTkxSeXVRVVh1bm8w?=
 =?utf-8?B?c2NhdW9IQWROMG8xdm91TElGQ2tQc05ocHRITk5LSUdXSjFsZjBHQ2dzQXMz?=
 =?utf-8?B?aVo1cTFXNW5leks5c0FBSWR0YnY0eVk2NjRPOFVVSGxQdHJPWjF2R0hLdkVS?=
 =?utf-8?B?c2FqbkRMMitYZTV2YmgvYkNsbTVJVGgvVkdMQW1qSDRZallOSUN5bFI3YTBs?=
 =?utf-8?B?M3prYTUrR09DSE9JdjV6SDhHclg2Smt3NG1vZ3pEbDErTndNa2lhbnMyYmNV?=
 =?utf-8?B?TThwdlZCUTd5TG5rbGpubnUrM2RITGw3Ni8ySktCQkx2di9LdUozUFNZTGU1?=
 =?utf-8?B?UzlyaXNwTWF6eTFERVJEREg4WWpvNlRtek8vTWIvekN5RE10NzVYUjVvSFIr?=
 =?utf-8?B?Lzd5VllzTFNMa2ozK1ZEY09nMTZmbXRvN2pnNmdpTkpzTlhBWGUydGtVZk1s?=
 =?utf-8?B?bFRNNTFBdFltVTc2Uk5Ra3d6Mll6Z25mNTFPMFpqUU9vUUN5Vy8xV0VTZkpv?=
 =?utf-8?Q?kLS3BdxbabnraBTVuaaY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a01d3e-b2df-4b48-029b-08dd126e78da
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 01:13:04.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_171326_747834_1A687F6D 
X-CRM114-Status: GOOD (  26.70  )
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

Ck9uIDIwMjQvMTEvMzAgMzo1MCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBPbiBGcmksIE5vdiAy
OSwgMjAyNCBhdCAwNTo1MTozOVBNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjQv
MTEvMTMgNToyMCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPj4+IE9uIE1vbiwgTm92IDExLCAyMDI0
IGF0IDAxOjU5OjU2UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4+PiBGcm9tOiBDaGVuIFdh
bmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4+Pgo+Pj4+IEFkZCBzdXBwb3J0IGZvciBQ
Q0llIGNvbnRyb2xsZXIgaW4gU0cyMDQyIFNvQy4gVGhlIGNvbnRyb2xsZXIKPj4+PiB1c2VzIHRo
ZSBDYWRlbmNlIFBDSWUgY29yZSBwcm9ncmFtbWVkIGJ5IHBjaWUtY2FkZW5jZSouYy4gVGhlCj4+
Pj4gUENJZSBjb250cm9sbGVyIHdpbGwgd29yayBpbiBob3N0IG1vZGUgb25seS4KPj4+PiArKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvS2NvbmZpZwo+Pj4+IEBAIC02Nyw0ICs2
NywxNSBAQCBjb25maWcgUENJX0o3MjFFX0VQCj4+Pj4gICAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ug
d2FudCB0byBzdXBwb3J0IHRoZSBUSSBKNzIxRSBQQ0llIHBsYXRmb3JtCj4+Pj4gICAgCSAgY29u
dHJvbGxlciBpbiBlbmRwb2ludCBtb2RlLiBUSSBKNzIxRSBQQ0llIGNvbnRyb2xsZXIgdXNlcyBD
YWRlbmNlIFBDSWUKPj4+PiAgICAJICBjb3JlLgo+Pj4+ICsKPj4+PiArY29uZmlnIFBDSUVfU0cy
MDQyCj4+Pj4gKwlib29sICJTb3BoZ28gU0cyMDQyIFBDSWUgY29udHJvbGxlciAoaG9zdCBtb2Rl
KSIKPj4+PiArCWRlcGVuZHMgb24gQVJDSF9TT1BIR08gfHwgQ09NUElMRV9URVNUCj4+Pj4gKwlk
ZXBlbmRzIG9uIE9GCj4+Pj4gKwlzZWxlY3QgUENJRV9DQURFTkNFX0hPU1QKPj4+PiArCWhlbHAK
Pj4+PiArCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IHRoZSBTb3BoZ28gU0cy
MDQyIFBDSWUgcGxhdGZvcm0KPj4+PiArCSAgY29udHJvbGxlciBpbiBob3N0IG1vZGUuIFNvcGhn
byBTRzIwNDIgUENJZSBjb250cm9sbGVyIHVzZXMgQ2FkZW5jZQo+Pj4+ICsJICBQQ0llIGNvcmUu
Cj4+PiBSZW9yZGVyIHRvIGtlZXAgdGhlc2UgbWVudSBpdGVtcyBpbiBhbHBoYWJldGljYWwgb3Jk
ZXIgYnkgdmVuZG9yLgo+PiBTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24u
IEkgdGhpbmsgdGhlIG1lbnUgaXRlbXMgaW4gdGhpcwo+PiBLY29uZmlnIGZpbGUgYXJlIGFscmVh
ZHkgc29ydGVkIGFscGhhYmV0aWNhbGx5Lgo+IEhlcmUncyB3aGF0IG1lbnVjb25maWcgbG9va3Mg
bGlrZSBhZnRlciB0aGlzIHBhdGNoOgo+Cj4gICAgWypdIENhZGVuY2UgcGxhdGZvcm0gUENJZSBj
b250cm9sbGVyIChob3N0IG1vZGUpCj4gICAgWypdIENhZGVuY2UgcGxhdGZvcm0gUENJZSBjb250
cm9sbGVyIChlbmRwb2ludCBtb2RlKQo+ICAgIFsqXSBUSSBKNzIxRSBQQ0llIGNvbnRyb2xsZXIg
KGhvc3QgbW9kZSkKPiAgICBbKl0gVEkgSjcyMUUgUENJZSBjb250cm9sbGVyIChlbmRwb2ludCBt
b2RlKQo+ICAgIFsgXSBTb3BoZ28gU0cyMDQyIFBDSWUgY29udHJvbGxlciAoaG9zdCBtb2RlKSAo
TkVXKQo+Cj4gIlNvcGhnbyIgc29ydHMgKmJlZm9yZSogIlRJIi4KCkkgc2VlIHdoYXQgeW91IG1l
YW4uIEkgdGhvdWdodCB3ZSBqdXN0IGhhZCB0byBtYWtlIHN1cmUgdGhlIGl0ZW0gSURzIGluIAp0
aGUgS2NvbmZpZyBmaWxlIHdlcmUgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgoKSSB3aWxsIG1ha2Ug
Y2hhbmdlcyBpbiB0aGUgbmV4dCB2ZXJzaW9uIGJhc2VkIG9uIHlvdXIgc3VnZ2VzdGlvbnMuCgo+
Pj4+ICsJaWYgKHBjaWUtPmxpbmtfaWQgPT0gMSkgewo+Pj4+ICsJCXJlZ21hcF93cml0ZShwY2ll
LT5zeXNjb24sIFJFR19MSU5LMV9NU0lfQUREUl9MT1csCj4+Pj4gKwkJCSAgICAgbG93ZXJfMzJf
Yml0cyhwY2llLT5tc2lfcGh5cykpOwo+Pj4+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24s
IFJFR19MSU5LMV9NU0lfQUREUl9ISUdILAo+Pj4+ICsJCQkgICAgIHVwcGVyXzMyX2JpdHMocGNp
ZS0+bXNpX3BoeXMpKTsKPj4+PiArCj4+Pj4gKwkJcmVnbWFwX3JlYWQocGNpZS0+c3lzY29uLCBS
RUdfTElOSzFfTVNJX0FERFJfU0laRSwgJnZhbHVlKTsKPj4+PiArCQl2YWx1ZSA9ICh2YWx1ZSAm
IFJFR19MSU5LMV9NU0lfQUREUl9TSVpFX01BU0spIHwgTUFYX01TSV9JUlFTOwo+Pj4+ICsJCXJl
Z21hcF93cml0ZShwY2llLT5zeXNjb24sIFJFR19MSU5LMV9NU0lfQUREUl9TSVpFLCB2YWx1ZSk7
Cj4+Pj4gKwl9IGVsc2Ugewo+Pj4+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24sIFJFR19M
SU5LMF9NU0lfQUREUl9MT1csCj4+Pj4gKwkJCSAgICAgbG93ZXJfMzJfYml0cyhwY2llLT5tc2lf
cGh5cykpOwo+Pj4+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24sIFJFR19MSU5LMF9NU0lf
QUREUl9ISUdILAo+Pj4+ICsJCQkgICAgIHVwcGVyXzMyX2JpdHMocGNpZS0+bXNpX3BoeXMpKTsK
Pj4+PiArCj4+Pj4gKwkJcmVnbWFwX3JlYWQocGNpZS0+c3lzY29uLCBSRUdfTElOSzBfTVNJX0FE
RFJfU0laRSwgJnZhbHVlKTsKPj4+PiArCQl2YWx1ZSA9ICh2YWx1ZSAmIFJFR19MSU5LMF9NU0lf
QUREUl9TSVpFX01BU0spIHwgKE1BWF9NU0lfSVJRUyA8PCAxNik7Cj4+Pj4gKwkJcmVnbWFwX3dy
aXRlKHBjaWUtPnN5c2NvbiwgUkVHX0xJTkswX01TSV9BRERSX1NJWkUsIHZhbHVlKTsKPj4+PiAr
CX0KPj4+IExvdCBvZiBwY2llLT5saW5rX2lkIGNoZWNraW5nIGdvaW5nIG9uIGhlcmUuICBDb25z
aWRlciBzYXZpbmcgdGhlc2UKPj4+IG9mZnNldHMgaW4gdGhlIHN0cnVjdCBzZzIwNDJfcGNpZSBz
byB5b3UgZG9uJ3QgbmVlZCB0byB0ZXN0Cj4+PiBldmVyeXdoZXJlLgo+PiBBY3R1YWxseSwgdGhl
cmUgYXJlIG5vdCBtYW55IHBsYWNlcyBpbiB0aGUgY29kZSB0byBjaGVjayBsaW5rX2lkLiBJZiB0
byBhZGQKPj4gc3RvcmFnZSBpbmZvcm1hdGlvbiBpbiBzdHJ1Y3Qgc2cyMDQyX3BjaWUsIGF0IGxl
YXN0IGZvdXLCoCB1MzIgYXJlIG5lZWRlZC4KPj4gQW5kIHRoaXMgbG9naWMgd2lsbCBvbmx5IGJl
IGNhbGxlZCBvbmUgdGltZSBpbiB0aGUgcHJvYmUuIFNvIEkgdGhpbmsgaXQgaXMKPj4gYmV0dGVy
IHRvIGtlZXAgdGhlIGN1cnJlbnQgbWV0aG9kLiBXaGF0IGRvIHlvdSB0aGluaz8KPiAxKSBJIGRv
bid0IHRoaW5rICJsaW5rX2lkIiBpcyBhIHZlcnkgZ29vZCBuYW1lIHNpbmNlIGl0IGFwcGVhcnMg
dG8KPiByZWZlciB0byBvbmUgb2YgdHdvIFBDSWUgUm9vdCBQb3J0cy4gIG12ZWJ1IHVzZXMgIm1h
cnZlbGwscGNpZS1wb3J0Igo+IHdoaWNoIGxvb2tzIGxpa2UgYSBzaW1pbGFyIHVzYWdlLCBhbHRo
b3VnaCB1bm5lY2Vzc2FyaWx5Cj4gTWFydmVsbC1zcGVjaWZpYy4gIEFuZCBhcmNoL2FybS9ib290
L2R0cy9tYXJ2ZWxsL2FybWFkYS0zNzAtZGIuZHRzIGhhcwo+IHNlcGFyYXRlIHN0YW56YXMgZm9y
IHR3byBSb290IFBvcnRzLCB3aXRob3V0IG5lZWRpbmcgYSBwcm9wZXJ0eSB0bwo+IGRpc3Rpbmd1
aXNoIHRoZW0sIHdoaWNoIHdvdWxkIGJlIGV2ZW4gYmV0dGVyLiAgSSdtIG5vdCBzdXJlIHdoeQo+
IGFyY2gvYXJtL2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTM3MC5kdHNpIG5lZWRzICJtYXJ2ZWxs
LHBjaWUtcG9ydCIKPiBldmVuIHRob3VnaCBpdCBhbHNvIGhhcyBzZXBhcmF0ZSBzdGFuemFzLgo+
Cj4gMikgSSB0aGluayBjaGVja2luZyBwY2llLT5saW5rX2lkIGlzIGxpa2VseSB0byBiZSBoYXJk
ZXIgdG8gbWFpbnRhaW4KPiBpbiB0aGUgZnV0dXJlLCBlLmcuLCBpZiBhIG5ldyBjaGlwIGFkZHMg
bW9yZSBSb290IFBvcnRzLCB5b3UnbGwgaGF2ZQo+IHRvIHRvdWNoIGVhY2ggdXNlLgo+Cj4gQmpv
cm4KClRoYW5rcyBmb3IgeW91ciBpbnB1dC4gSSBsb29rZWQgYXQgdGhlIE1hcnZlbGwgc29sdXRp
b24geW91IHJlY29tbWVuZGVkLiAKSXQgc2VlbXMgdGhhdCBpdCBpcyBhIHJlbGF0aXZlbHkgY29t
cGxleCBJUCBkZXNpZ24gdG8gc3VwcG9ydCBtdmVidSwgCndoaWNoIGNhbiBmbGV4aWJseSBzdXBw
b3J0IHRoZSBleHBvcnQgb2YgMSB0byA0IHZhcmlhYmxlIHJvb3QgcG9ydHMuClRoZSBDYWRlbmNl
IElQIHVzZWQgYnkgU0cyMDQyIGlzIG11Y2ggc2ltcGxlciwgYW5kIGl0IGlzIGZpeGVkIHRvIGV4
cG9ydCAKdXAgdG8gdHdvIHJvb3QgcG9ydHMuIFNvIEkgcGxhbiB0byBpbXBsZW1lbnQgaXQgaW4g
YSBzaW1wbGUgd2F5LiAKQ2hhbmdpbmcgImxpbmtfaWQiIHRvICJwY2llLXBvcnQiIHdpbGwgbG9v
ayBiZXR0ZXIuIFRoZSB3cml0aW5nIG9mIGxpbmsgCmFjdHVhbGx5IHJlZmVycyB0byB0aGUgdGVy
bWlub2xvZ3kgaW4gdGhlIENhZGVuY2UgbWFudWFsLCB3aGljaCBpcyAKYWN0dWFsbHkgdGhlIGNv
bmNlcHQgb2YgcG9ydC4KCkJ5IHRoZSB3YXksIHRoZXJlIGlzIG5vIGRlbWFuZCBmb3Igc2NhbGFi
aWxpdHkgYXQgcHJlc2VudCwgYmVjYXVzZSBpdCBpcyAKc2FpZCB0aGF0IFNvcGhnbyBjdXJyZW50
bHkgb25seSB1c2VzIENhZGVuY2UgSVAgZm9yIHRoZSBTRzIwNDIgU29DLCBhbmQgCnN1YnNlcXVl
bnQgcHJvZHVjdHMgc2hvdWxkIHN3aXRjaCB0byBzb2x1dGlvbnMgZnJvbSBvdGhlciBzdXBwbGll
cnMuCgpBbnkgcXVlc3Rpb24gcGxlYXNlIGxldCBtZSBrbm93LgoKUmVnYXJkcywKCkNoZW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
