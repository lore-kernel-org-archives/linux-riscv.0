Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3FBECE581
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pywPi7oR7UczqXKvl+Ec6p3SNCd+TAeggY/XFS0re30=; b=xtwuo2MkYPZlOnt4sgcMBef9KT
	V7YU3UyuYeYr6bN/QJL7fvKCYO1a9RIYnKraJQY3YiI1H77rQZEzdsfhzmTgM8Ww2nlFvog9wdF/X
	lSoQCn9o/V6qA25Qqtjvow+OmwGLbmVy+K+ObXFr/UUKZJek2tpylSO5jj3NP8VxH3FH+MkCEyoyE
	JMnhk8UIcKcKSOiB6dOCDcYGnp/UrFYn1AxIFembQxt1UYiM8WrPg0Ro6TMLDgRt1gtW0PHsnP0OZ
	TVIr1PUFleKjfFMH7XnviNsM9QuT5QfsmC9DX40/deanwSR9l2pca15ZDQSm1u/EfdvHliz9ZZPSM
	J/+6DQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnk2-00000003ZGS-2q9o;
	Mon, 09 Sep 2024 23:24:18 +0000
Received: from mail-bmxind01olkn20824.outbound.protection.outlook.com ([2a01:111:f403:281c::824] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnjz-00000003ZFg-42J2
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 23:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWwUhV8+ZRDcgsWlMAijvNOzdrs0dZ6IIGw6tjtEyqRh2Ha6bTrzDiwm3sv1FnxG8BG2IUOykc+7YzTFsNFwXIUu4lGt9Ldvn+43rgxEz9c9KU5N22AFB5TR0prAuJUMaKFX1IVIa3ifX63nYdxVnBrB5xZbpTTzJODBSQ36VCbHsJx92On0W49KSX3n0sxxjbpaV/J6xX1ssLaUd9fmE8nceAux/kz+FYEAcmCnbuM/Sm/zDurkKOkk+aiIJeULA3y0YKsusms0qFvyn7xVJ/mZwTnHbWgOxZ3sx9n8nrhtShPfPZlR4qfeVAGGw0ZWejfg4mK6LDJL1Rs4zdHeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEiZrUrEtdrSIUL9KEcJsBCmbVHKNtjFNi27XS5oS+8=;
 b=HookQElCE36N5nOVT02GFDveSWnz74OGq40ZogcfrC/biDTCYgOwCdxgrrg16/iKsIFnXVNJAS2BNYnMwwapv1uTrzuaxH92yTiRQ0iUlkfuMKuRaiDzZQQlZNyN4xeXS9YA0LpTeeyUa/OUKaM2PGsMPeUy16GQpIYnfMmLv9pfYP2ot75SD5Znqt6POOZSoArJBTkxjJFJjFKCzH1kiM5tTjoWUWkoK/mI1pHAa+EhMo9T0UKskLj9Zod9pv5bRyFn1HGmmY26+2o+MBju2E3Jv0jXY0Cx02TyuKr/9wQNetxnQugT8Q7nn9KZkKHa1cKZQ7eMUQn9Jrh/Ut9hjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEiZrUrEtdrSIUL9KEcJsBCmbVHKNtjFNi27XS5oS+8=;
 b=WG+YBXbzFScP71gvXeWp4LPbL+3n3dc15h2KGvVSg7G0A671W38GOxKR5RCCf0p84UdAdFZEi8ATroVGbHuxIPTFE4APRVG6DBA1PgCbsW8EHfx/bF+5AbIh5t+IKnA2sWd1uM4aRXcVydQMoGazrw5TLGovdejoAwoqmuISkuhVHLYhsszdYOEAYHcI2ot6Jur3T03pNzkgu9GfRuuB9rjDdJyMQuuOR2C0mX91SNOTjkIZ9ImRsmTIUiy0/JOndL86wKHJaL9HR1qVTUNZCwkuUbVD9Ee1ZMhIRgUOysuBZh0U78uCCXgZqdTQV7s1NEAKa7q1EU0umP9cm/IH8w==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB2133.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 23:08:15 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 23:08:15 +0000
Message-ID: <MA0P287MB282257F6614C3D43523CB4C3FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 10 Sep 2024 07:08:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
 <202409080100.h6lX5Asm-lkp@intel.com>
 <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
 <MA0P287MB2822B10767514B3E04E8E468FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <qcpqwvffln3cb5lxnhwarmeawiudurc4v35rqz7jo6xo2es5bi@2q4e4f4zn2vu>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <qcpqwvffln3cb5lxnhwarmeawiudurc4v35rqz7jo6xo2es5bi@2q4e4f4zn2vu>
X-TMN: [pgQpsBM5yz7Tp3fDJcasQ8aQK9r0aGlb]
X-ClientProxiedBy: TYAPR01CA0225.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::21) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <25b44694-0701-4577-8168-9c356e5fe74f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB2133:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e303450-9b3d-4d44-3447-08dcd1244863
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|19110799003|5072599009|461199028|6090799003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: GwpAmNBZaWJuMv1mp8y3pFW4Qv2ss7mv1r9f0r7/biD97t4xjzblJVwy8w9rNfqueCzcC8CaqM3UMZ1oEuSPRSdRY0g76nCeHfgBcfTpvzNp4FP9d20zZXKC1hnaQmaiLT5IQ9tY8w2rcFnyEfGH9hhwvwplTTnWC57jNHy9Qrs1HFF1dWDCE8uU/wHpdDb5zoqWwUvgfj/RmJXPYXL5CcLach//Ag3K6v3swcUdryPPX0rKYkyJcuEBEqPJ6Uy0Uq/crBrnJfPvcBacqdkOM95IcPJ8Z4ufcvzmmyw4KqzTajpR5/qcyM6RQfr3YHRM5o65qpBn0lpKShrsAyRs9Rw+HGICJjqag91qgvW0uLSEoKIJPdZ44GGXjxry+n5BxBTf44B36ISyggv2fsmcjVw5oNj9qC4Wb6ckrW3+LykoEd+s8VHZ/8/wuKyQDqrwb5UI2M1EtK8DA6fhT/Itz89l0h9pJes9x55GJvhTAzcJEf/HHFUJZrcLr7IKKp/ithols+qWM1IFvyBInqDR/p7LbXbbMaGUDcR2Es7Omem99x1oLv8woUKx0UTyK1+h78cLglx8ZaFOXh7seZLCRf+fKK3qzonioioA6z3Gm+7bf5y7dGgtCR3kEmsQoL4b/pmfLt4aHooVA/IEJkGZkglHHsZwDY3JcQFvjEnpn3iYZIcbhRNWqI5PQbM9SlvgInf7LxotTAtmCVCWnnEyv9a8v2TOXRJkUY6VVfRc+2g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5DcVg0U3VRSFU4ZkVGcnBCRlVYRXVibXIrS3I2N0N0VzRQNkFCUk1Gcmpo?=
 =?utf-8?B?UXlMWVU2WmY2TG1Qb1BGVkNrSXcwdlhSdGU5M29NU3BZYjBpNm8ycHlrTWFm?=
 =?utf-8?B?cjd0bEtrTUVZZmJ6czNRV1BaT3E2cGxwdVVsVW1nNGxGRzhNYkJDVFE5OG5B?=
 =?utf-8?B?eVpQeEpTYklpdmVtWWRrWVN2VXZYTUt3WDAxbkxVMC8wTGJxbkg1Q1plbXZR?=
 =?utf-8?B?V04xMnlFZWNDL3FsTnNmUlprOHZMYnlzVjlYVXJ3UElKNjB4eENHNFd3NEpZ?=
 =?utf-8?B?eUh1RUwrMU9SVStwMXJjMENzSTBJOFh0WXJvdE8xaWpqVnVIeVl0SllydzRv?=
 =?utf-8?B?WnFCRUFCWnVwd0puUitBM3lKWHNBY1JiT2FVaGllSk9ZdTBmSkRqS1g2bnNY?=
 =?utf-8?B?eGhiL3JuaTNWSHN1L2dKeGJ6WW5kNm9QeVNUUy9rZlRqOEJNajRFV0NBZWp0?=
 =?utf-8?B?dHQvaTJ3aWFETVhkY3BuNjlOTGMxcXAvd1BENXZCVUloZFVpSzRRL056MVlt?=
 =?utf-8?B?dW1ZNDlCUWtYbDcxdFRwdDlCOTNuOUpETUJnbFpQZ1ozOXZwMVhtdDNVQmxK?=
 =?utf-8?B?MEJlc3Z0N01nczdJYTcxV2VURW1hei95RExRb3Z0RWlPejVJRFhjV1ZRdWE1?=
 =?utf-8?B?bFM4YW1ybFdhNWZ3SGZDRHhaWVJkeGx0b0Z4V21rNmFNRkU5eFRRNXVkc1FY?=
 =?utf-8?B?RXhudk5HcE5CYVcyT0ZtUERtelZVa2lwcGlLaTBzQUxQRHJzcUpidnVyZmcv?=
 =?utf-8?B?bWxMVm9OeGxVVEViVEdlb1E4aE1mang5V3Y0MVFKT1hCN1R1amgrUW93VGFn?=
 =?utf-8?B?eWd3TThQcG1wTTUrT2dZZVlobzBWSkE5dW94MUl2S0k4VUxvNGc4QXdVdUwy?=
 =?utf-8?B?S0FZeDhnUVo1clBYUkY3eUF5cjY3V21WazBiVlo2WWxtdmROMm84ZFNudFZO?=
 =?utf-8?B?cFhVVE1Sb2hoT2tnUlViQnAxcEdsTFEyTGQvVUtnbU5PSG1LRHdZRTVKSUhR?=
 =?utf-8?B?dHRnZWtuQ3JlTEtEWEF5c2w3c0tCU3A2MFhJOG9EdXJhakRKMHhRMlM4b1Y5?=
 =?utf-8?B?OHluMDRzeVcyUm1SWEVWdE5QL0hlL3JjUmNnc2JsYlRFbVFSZDhZOHhqU2ZZ?=
 =?utf-8?B?dVRpZjl5ZmVpZnVXK21nQ010aFhlNUliZlltSFVseUhMZVlBOU92UWF6OHB2?=
 =?utf-8?B?emhFYS8wQlB1OUNPVDNLT2JKTFRueHBFV1JsYk9lNlF2WktFR0JNT2pia1cv?=
 =?utf-8?B?Rk1LanFHc0xiUyt3czk1Qko5SjVEbzU2UTNKZDFZdXd4K0dKSnMyZkZHSXZq?=
 =?utf-8?B?NDRhMnQvZVBoV2g4clpZRWFnL0w0K0trb1IvNFVwb0NFSnNEZDRkTzBrSDJE?=
 =?utf-8?B?V3ZrTGx0d3JDMUtVUHRMTHNHTGxtM0huS2luNmZraGZCRVdMcTJpTjRuU1Er?=
 =?utf-8?B?bFZpWllkU2hsRENNZWJWMG01UStzQkM4azk3RTN4eU0rZGpieTgxSVd0S3d2?=
 =?utf-8?B?N096VldsSGo2bHcvem1uZEZvV2hYakdnMVJOcXlsbnNaWlBJQ01ZdDJQeHI3?=
 =?utf-8?B?eHAzQ09pcnRwRHdJYjNhcElCT2NPN2lmYnpET2NLNkkrTWJ6VlY0bTFtQVhY?=
 =?utf-8?B?VGJYWTN1Mzk5OE5vN3RUY2I4TUF1bEtJc3RVd1lZMjYyclRobktSVHhFd2Qx?=
 =?utf-8?Q?XbD/Sp9mkfjEc2Yf9H6Q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e303450-9b3d-4d44-3447-08dcd1244863
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 23:08:14.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_162416_024332_DD7A3FB0 
X-CRM114-Status: GOOD (  10.24  )
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

Ck9uIDIwMjQvOS85IDE5OjQ1LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBDaGVu
LAo+Cj4gT24gTW9uLCBTZXAgMDksIDIwMjQgYXQgMDU6MDg6NDFQTSArMDgwMCwgQ2hlbiBXYW5n
IHdyb3RlOgo+PiBPbiAyMDI0LzkvOSAxNjo0NSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+
Pj4gT24gTW9uLCBTZXAgOSwgMjAyNCBhdCAxMDoyNuKAr0FNIENoZW4gV2FuZyA8dW5pY29ybl93
YW5nQG91dGxvb2suY29tPiB3cm90ZToKPj4+PiBJIHdvbmRlciB3aHkgQ09ORklHX1BXTV9TT1BI
R09fU0cyMDQyIGlzIGVuYWJlbGQgZm9yIG02OGs/IFBsZWFzZSByZW1vdmUKPj4+PiB0aGlzLgo+
Pj4gQmVjYXVzZSBpdCBkZXBlbmRzIG9uIEFSQ0hfU09QSEdPIHx8IENPTVBJTEVfVEVTVC4KPj4+
IFNvIGl0IGNhbiBiZSBlbmFibGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzIHdoZW4gY29tcGlsZS10
ZXN0aW5nLgo+PiBUaGFua3MsIGl0J3MgcmVhbGx5IGEgcG90ZW50aWFsIGRlZmVjdCB3aGVuIENP
TkZJR19PRiBpcyBub3Qgc2V0LCB3aWxsIGZpeAo+PiB0aGlzIGluIG5leHQgdmVyc2lvbi4KPiBC
VFcsIHRoZSByaWdodCBhcHByb2FjaCB0byBmaXggdGhhdCBpcyB0byBub3QgdXNlIG9mX21hdGNo
X3B0ciB3aGVuCj4gaW5pdGlhbGl6aW5nIHB3bV9zZzIwNDJfZHJpdmVyLmRyaXZlci5vZl9tYXRj
aF90YWJsZS4KPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKVGhhbmsgeW91IFV3ZSwgdGhhdCdzIHdo
YXQgSSBzYWlkIHBvdGVudGlhbCBkZWZlY3QsIGhhdmUgZml4ZWQgaGVyZS4KClRoYW5rcywKCkNo
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
