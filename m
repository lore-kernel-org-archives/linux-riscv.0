Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D1EECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Oy5pRQGo3S/UKo2g24tYsMCmGhiaDbCM2IfsYJrq0s=; b=nYZKJyZrhLwFx7
	QHhsjpt8UbqKAY4PT4qPMaawzN1grO0E+s2MDx5e9Z9B9dtftNzOrZx/LseRIVeWnNoIU8qq0GSi9
	47Bs8KKBCLc5aUctga9li4BT4jqEtE9fwCXxBFRjH4BMLFsrB84ofVZ9eDYQg53JzRutAmGqoRCSq
	No7xVjOBbYFaN07HIgnR6js+1dDAcHU7JgZ0PGIdQHm69ie8nAeW71DN0RMVp9Hd6y0vQ5RntEA/4
	D6nRqDGxr5ZZmmbRjHh8vaKBvt9AhoNrYvjLsLS23nFl8S7l8oB10DKwLHxxX/i5cyscI87DObu4W
	B3Zo4De2Rq3QP7EkZv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnZC-004AGK-HV; Sun, 04 Sep 2022 11:13:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnZ9-004ADy-5G
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 11:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662290007; x=1693826007;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KBCZ2uzUynDmomK6Mt5ZZInD/zML7Fbjn1mbCcXAIeQ=;
  b=LR3KMufjZ/8JP7SV3wJ6pzam+HTDRrlqe1lSShwDMv/4rwpfltUWV3OF
   YrkREe5+32APoEz0fI7QkIL47ZXs4LIJGfecyNKtZUHlT1EEO/QKFz7le
   A7bOoJ9fFu3yUtWDnsJ1ImO/X/RTyAzf/LH2CoINz0nvhcDYBRomlqtCK
   vKOJfcmwJ7lZ3uhWXtZmDRAsnbzzRpepZIFFvkpTPMCH7cvlGu9XGFFPe
   f2oPlZiJPhrkTgMk5PqmOabWopwafU08WUABc3Fi7airdZ7LaWLFdi60M
   3lQFNnbtMLDntFJ3Hn7u5FXipqC3xPq5qyL1cbhZy7KHlX/rGBlJ2X04t
   A==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="189345834"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 04:13:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 04:13:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 4 Sep 2022 04:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3025c1YmlZUfCubHIR9AOgm8WPWKKyYJiivd3uKS8bBdwneZDPwLeuI/9AEwmh7AX8+K13wFUbdsPd9+U7rIr99fXmkPLJ+8qe26wGepvOfuRgs3GV3vaOTnD65nLxsPwZLq0Sa0AB48KeLUNViCqTeIhJVt4T2OM+vdfckhWgCHzirNS8mQJ9sP5buVGoJwWTp+7A1nYZFeG9+57b758fdpMGJ+VHNdsAP3VIaf5QpgEXjwhOT/5H7eWIZZ2lL+CEVln0lroNxmElZANapn9rebBKuo0FBxBTVQECkBsA+i64KAORwkBCYLGgHZqJwMROkfWFPdLpiBP3CUeLV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBCZ2uzUynDmomK6Mt5ZZInD/zML7Fbjn1mbCcXAIeQ=;
 b=eGz0R2Z03ynt2MjoY3q8T4aZKaz4LDnJv1vS9OVvwgJgpaJMKlVom/8ItjeDAs99uOvl6De9j924Ptp71e4/3f6LT+CWgv3WvbZlqljS/X5g0aQYXXQukaGCIwE6h33k/6qym7+w5NxX2f9FMR5faDix0ga4TKqBIHzdplSjTDvHxhnnEj2G1IiAdMPlNnM2a7CDTLtsxBdv6G00pErogE5woIryuMARuz4wrn0aHlMsDl7ZrsazBrkd2agDbgjY1TKa3Vhx5L46JD4qqmFVPrqZA0CJjmmtoNfm2Q6kjKfyzVOe8R2mMPPq4Tgg2VdjQ1JAi6IVYKHSmLGBeWH/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBCZ2uzUynDmomK6Mt5ZZInD/zML7Fbjn1mbCcXAIeQ=;
 b=WbNV988KLVXKq5yUH3z6ikgrH98SlC8yCy4bUoNbFWZRrSMh/+kLF3wEtwi+0fRtswaoXfbWQSfZQ5c8tyjp+IUedhBcZuhIKNAsP41cU1pLDZ1jQjGin0Ipn4PXECWbQKQun5iidpcC7eVqbwE7q4pChM/8ir4q0WcaYobmuJg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Sun, 4 Sep
 2022 11:13:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 11:13:15 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <Conor.Dooley@microchip.com>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <heiko@sntech.de>,
	<jszhang@kernel.org>, <lazyparser@gmail.com>, <falcon@tinylab.org>,
	<chenhuacai@kernel.org>, <apatel@ventanamicro.com>, <atishp@atishpatra.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>,
	<lkp@intel.com>
Subject: Re: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
Thread-Topic: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
Thread-Index: AQHYwC/gSov6LLzR/EOOdHeAB9nrWa3PFAuAgAAFpYCAAASWAA==
Date: Sun, 4 Sep 2022 11:13:14 +0000
Message-ID: <8551463c-376c-8c64-6bf3-31dd5d9133d8@microchip.com>
References: <20220904072637.8619-1-guoren@kernel.org>
 <20220904072637.8619-6-guoren@kernel.org>
 <98efc4d8-f846-1ff1-2635-d18b7fca4ac8@microchip.com>
 <CAJF2gTQn0PpjERzKoBpx6npUs+gZmBNeRReNgeRP7RPod2WssA@mail.gmail.com>
In-Reply-To: <CAJF2gTQn0PpjERzKoBpx6npUs+gZmBNeRReNgeRP7RPod2WssA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51d06006-648d-4580-bac4-08da8e667664
x-ms-traffictypediagnostic: MN0PR11MB6229:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7WC7pkV5o8E5X44uMMR7aoQH2OPe2nDsbUNcDNBPF/KmcyjkUUjKoSNMtWzK8ib5PVb2TSbkPAd39itvdckQYR3gB+98ZMK2hnNCTnwTbTQ0WEX5+EojVnH32ehgAdfgTOADcRv9DyPVCgSzf95Tg4WKHVBAAxC6e2Gvl86oCWakqpdzeQ0mFzNwfpVEYgEkQQLlpbWZ6BMA7dsRniD/cAiiN181zUFmeBEB8zUC0cEc8Ajixgq9BBBJ/jSx2mMufyrgWWmfumW+5sJVWtjVVtA0Kamp/iQv5ZaLgJgPY3kiERuBuXn15z25QNXOAi0klygFXsNhXfZIW7qs1wNtmDo8d8YB1V+8cBUzOqD19b8FdeX4SSgdHGPpWQGsit6B2d8tAVuqfevOPpv7tIWKVwHJNnnaZdzlQ+ietUKEOOw7Jor2RZNz03/TgjPqIuhDh14dGw+bIS3Ba4LqHumUlyImupD12Pu6VN4RoNPKTlknsmQ1QkhXXwWGzYEIA1fhIF42pVlgGla3/HMPgOROqsn8kkfPZFkDQdnfByJud8hzPCqlJ8iGk8mHD/AHerLtyC3iCSmg2tnMa4nyoprYkR6M9NqoUlcL3cgxqhNzmA4hjXqk1Gi6zkeHrms2r2e1VVxL8DVY5UzEai00Ewws/q+Jnfl0OTn8ox66Hg4ohf+yRuXy0aA7FUwYG4LV8vGGYpMrhWUYmwsgUvymlM8COBMp4atYByOkiyF3nkq2cN1+l7vJOZLQ3tgdrtvSA9klALeoWwDhlz/U+6X/C25xiVmi8eSMtzI2NKBdKNLV23L2hk+knl3Vw63E94vDKAE56aLqc57LgDqWpbb2eHYXMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(366004)(376002)(39850400004)(122000001)(2616005)(186003)(5660300002)(53546011)(6506007)(6512007)(26005)(38070700005)(31686004)(71200400001)(41300700001)(478600001)(6486002)(31696002)(36756003)(83380400001)(38100700002)(316002)(86362001)(54906003)(7416002)(8936002)(2906002)(64756008)(76116006)(66446008)(110136005)(66476007)(91956017)(66946007)(66556008)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L29BbmY4TGIrWG1Xb0tzRmYrdDdRM0VSL0R3ZUdINzg2Q01tSWFDTjVOeE5C?=
 =?utf-8?B?enB0TFZURlBnTXZKN0Z6ZTFhMFppQUJDcmhncUV5R3cyVDFLM0Q3MWRKN3Nm?=
 =?utf-8?B?RTd4ZFNGaUZScXM1d3lLeWlxNklYak9xcTNZeHJCc2U4b2w4SERvOTYxaTF1?=
 =?utf-8?B?MllLaEFya3J2VFQxVjNHcnVBckc1YkpKMG1RajZUK0hLZHkrQ1g2SGJLT2tl?=
 =?utf-8?B?WGc1S1V3VDEvdEJ6TnJrOEkvR0hWMXZXT2IrdktJYkwrclRtRS80ZGhJeXQv?=
 =?utf-8?B?cE1tSytwSmprT2hFTmxDVE1IK2xzT05oZThHLytvRzJHb1V5dFROU3MzaFlM?=
 =?utf-8?B?dnE5RmQ2OXFSTXRxTW9mV2RPVkV3THRWeTdKUVJ4dlF5ZXFkUXdyRDZnYjUz?=
 =?utf-8?B?N3c3SlVLa2hVUjVyd0psNlh2QTN2aDVra1h4clhkLzd4bEdnSXdJRFF1dktL?=
 =?utf-8?B?VWtZeVZWcUpqaVNFK09BdHczaTNwRnZoZU04YUZrRU4yRnV1SXhDcEtXZlVq?=
 =?utf-8?B?NUkwV2JOVUhjdysxT3FOd1h1WVNGOWE0bzNSWVV4VGxHN2lWSEZuOEJnWHhF?=
 =?utf-8?B?MEFNMUQ0K0srLzhnQWlYQ050TWhHQ1hzNUpVOWpZMitoYzhNTjFtRGgwUFhr?=
 =?utf-8?B?L3NlSE84cXJGRXdJMTRLcTJCTWt3RGRySUdYeUFnK3B4enprNkJyUFFITmJL?=
 =?utf-8?B?Q0EzWU9FeE84bWJtc01LTlY0NXQ4VXBVS241ejdBWUdMWVNySngwMlNGdHFk?=
 =?utf-8?B?MU9UZXpSTGFzeEdYMTlWL0pncGcvMXlpTzdFc1VjTWI5ZVhUd2NaaEtNUE1V?=
 =?utf-8?B?NUJVTUx5TnkwUU0ySWhxc2FZNEhEeHZJYzlscUFZZjdxYk5ua09oZUVoZXZn?=
 =?utf-8?B?eWR1V05JRFpIeDE3WElpVllueTIwMXZVOGdNTkc5Tk4xZmVJdzQ2aGZFT3Nn?=
 =?utf-8?B?U2w4NXFqMXpCV3RvbGtBOEJPczk5NlVESGNwU1dGSmxxZ0xVMzIyRHdodlEz?=
 =?utf-8?B?bEJ1QzA1TytHRHVCRWUwYjdrR21qUWFwamJXM3RVQ1NGaXZzL2xUUzhicmsx?=
 =?utf-8?B?TlJSelpNUGdXai9zaVhTQ2tqcjVzdTRkMmR5U21tOUdKS2xoVTd4UmJaZVd0?=
 =?utf-8?B?QmF0YjQvNU5oZWhhNDYvd0EydzRaeXZmeGc1TU56UHVlQ3dtYlVwa2h6Ujc1?=
 =?utf-8?B?dzhjSVUzMHlURVUrZTErZTBWMVNleGVLRnk3WW9BWEpjNFNEQjB5YnkrclJh?=
 =?utf-8?B?SkQyZWNsUWtEV0dMc3RHWlhIWjBpaGhzakNlcVFwMnAwQ09rNFh5Nng2Mm9M?=
 =?utf-8?B?MWR3ckpNa0ZsUnltMG1TR3hUaTZGMTNyR1pIdTNOVVYyaUNHc2JSYXBIemw0?=
 =?utf-8?B?cUhiZzNVVUlMME5hTHhDNzJRYVN5Zm10M1EwMjFqRktiQm5OdXVvYjBOTi8w?=
 =?utf-8?B?MHNPUklhNDRZWDkvMU1Hb09LbVptTE01UjlFNnlzaHBlb3hoajZNM2VSUndJ?=
 =?utf-8?B?K2VHa202bXVEbllGUDlVRENFeXRNa0haZGs4RVhJdmo2MXpQKy9GaVBYSW5P?=
 =?utf-8?B?ZXpmODhaalJVYW9HZW9NeklJZnZxaWRPKzRmc2pCQ0t5dGZseVkvYWpmeDVB?=
 =?utf-8?B?Tm0vZjZFTGo4YWlCcmRlRDJVMkltZzIyOHRYREJoRzBzd0NoeE5PVUI5T0ND?=
 =?utf-8?B?TUZwdnkydytMSnQ1QUtKQ2ZvSEtCZ3F4NHhmdVJ3K1VqTFBIT2lTemxzcHIw?=
 =?utf-8?B?aWd4NTVjRzNvZnFIdjZUekRoZDgxajlvWEgyZFhuaUJ1VjB6UUYvQ0ljR3hH?=
 =?utf-8?B?SWR2KzFTdXlmNHpHOE80RkQ3MmhRK2FQaFdsRDZCSjlmWTBaY0t0TmNxd1l5?=
 =?utf-8?B?VkZRNEZRdnNUejZSMzlVaENyNUErV042RldsOVNhOCtwK1NCM05CQnhDV2Jq?=
 =?utf-8?B?NnpYSzRJRnNIaGt0bW1FQ3A3NGZkVnVWRWJCTTVWclZqcEFNYWFOQlBCUFFr?=
 =?utf-8?B?dW9rNEIydHNHVnRLNEY5SkpwUGhrUVhCTzZIb1hlL2szb1NhODJYc3JWc3Rr?=
 =?utf-8?B?cFdUc2kxdnBSNW9lQnYva2RiWEZZWmZjQmVDR1ZWcVlXbG84ZjBIQ0hjQStU?=
 =?utf-8?Q?1buZ8oNA4ORoy6eW1sTDNbLpi?=
Content-ID: <D895136B1C75344388AFF83D06899612@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d06006-648d-4580-bac4-08da8e667664
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 11:13:14.9842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXksz9Hon7B/Fe74Cz/Ond6ZzlVMiLTcoI/0DBcbrnLPUbVrcIaJmGUBrVp0EFwmp0ZS4m6ITLkGmOGoIydc7KhIy6fOsHNQhgyrc5gOUi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_041327_242401_8AE1831F 
X-CRM114-Status: GOOD (  23.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 04/09/2022 11:56, Guo Ren wrote:
> On Sun, Sep 4, 2022 at 6:36 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 04/09/2022 08:26, guoren@kernel.org wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>
>>> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
>>> O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
>>>
>>> ../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
>>> ../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
>>> 'kernel_start' set but not used [-Wunused-but-set-variable]
>>>   185 |         unsigned long kernel_start;
>>>       |                       ^~~~~~~~~~~~
>>>
>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>> Signed-off-by: Guo Ren <guoren@kernel.org>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Is this then a
>> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
>> ?
>>
>> Could you also add something like:
>> "If CONFIG_CRYTPO is not enabled, ...." to explain why this
>> may be unused?
>>
>>> ---
>>>  arch/riscv/kernel/elf_kexec.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
>>> index 0cb94992c15b..bba3723a0914 100644
>>> --- a/arch/riscv/kernel/elf_kexec.c
>>> +++ b/arch/riscv/kernel/elf_kexec.c
>>> @@ -182,7 +182,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>>>         unsigned long new_kernel_pbase = 0UL;
>>>         unsigned long initrd_pbase = 0UL;
>>>         unsigned long headers_sz;
>>> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
>>>         unsigned long kernel_start;
>>> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>>>         void *fdt, *headers;
>>>         struct elfhdr ehdr;
>>>         struct kexec_buf kbuf;
>>> @@ -197,7 +199,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>>>                              &old_kernel_pbase, &new_kernel_pbase);
>>>         if (ret)
>>>                 goto out;
>>> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
>>>         kernel_start = image->start;
>>> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>>
>> Instead of adding more #ifdefs to the file, could we instead just drop the
>> kernel_start variable? For the sake of compilation coverage, we could then
>> also do the following (build-tested only):
> Em... I prefer:

Uh, that works for me. The below diff is:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 0cb94992c15b..4b9264340b78 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image,
> char *kernel_buf,
>         if (ret)
>                 goto out;
>         kernel_start = image->start;
> -       pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> +       pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);
> 
>         /* Add the kernel binary to the image */
>         ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
> 
> 
>>

Feel free to include this patch in your v3 then:
>> -- >8 --
>> From: Conor Dooley <conor.dooley@microchip.com>
>> Date: Sun, 4 Sep 2022 11:27:07 +0100
>> Subject: [PATCH] riscv: elf_kexec: replace ifdef with IS_ENABLED()
>>
>> IS_ENABLED() gives better compile time coverage than #ifdef.
>> Replace the ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY in elf_kexec_load()
>> since none of the code it guards uses a symbol that's missing if it
>> is not set.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  arch/riscv/kernel/elf_kexec.c | 28 ++++++++++++++--------------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
>> index 0cb94992c15b..29cbf655c474 100644
>> --- a/arch/riscv/kernel/elf_kexec.c
>> +++ b/arch/riscv/kernel/elf_kexec.c
>> @@ -248,21 +248,21 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>>                 cmdline = modified_cmdline;
>>         }
>>
>> -#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
>> -       /* Add purgatory to the image */
>> -       kbuf.top_down = true;
>> -       kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> -       ret = kexec_load_purgatory(image, &kbuf);
>> -       if (ret) {
>> -               pr_err("Error loading purgatory ret=%d\n", ret);
>> -               goto out;
>> +       if (IS_ENABLED(CONFIG_ARCH_HAS_KEXEC_PURGATORY)) {
>> +               /* Add purgatory to the image */
>> +               kbuf.top_down = true;
>> +               kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> +               ret = kexec_load_purgatory(image, &kbuf);
>> +               if (ret) {
>> +                       pr_err("Error loading purgatory ret=%d\n", ret);
>> +                       goto out;
>> +               }
>> +               ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
>> +                                                    &kernel_start,
>> +                                                    sizeof(kernel_start), 0);
>> +               if (ret)
>> +                       pr_err("Error update purgatory ret=%d\n", ret);
>>         }
>> -       ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
>> -                                            &kernel_start,
>> -                                            sizeof(kernel_start), 0);
>> -       if (ret)
>> -               pr_err("Error update purgatory ret=%d\n", ret);
>> -#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>>
>>         /* Add the initrd to the image */
>>         if (initrd != NULL) {
>> --
>> 2.37.1
>>
> 
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
