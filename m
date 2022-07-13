Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8525C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc7hfOyU1WvzEYd31kIu2PKkwbuMK3GsiKPwwblOlQI=; b=qNvO4Y7ozhmEKE
	84stz9XERDKZKx8+oWzPyp2YXDYxDvsdU6UUQ5C8YXZ0uOaEv1iJNmZF5jItLx/w/z+TzmXISHoJU
	p0ugNRNWZArRZ0tHgLdfHqAK1VFJ6Qme4aauqc5o1B6KuWy2jxlylxfVkyqLZME8xUWmbSk7J2jyh
	6L8LEJ4ELY63U3D6KrUq1E/0Pi3uixnpPgd5FdiU/Krs1yTkuqCUoZus0NxgwJGAwsQj81fT1NXSs
	zrXJsBe7iuVR28WUIszueMjDU9D+4hZLVQjRd3F7VP/m7Pi09m14bJxC5U5CaY3vN7BXcxbEqnnqe
	IFKAWi1tN/34zcq4ztWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjdG-007wdS-4e; Wed, 13 Jul 2022 21:10:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjdD-007wbi-6P
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 21:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657746651; x=1689282651;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=T3idWAeckcmMOaHZ4xD5kLUt4wfy7uh9AGYeV0j3LeM=;
  b=pP7znQQy95GKOCmytBTvE3wbnTgGWZYTdJCFLI2mt86PBe++ESUzJ6XR
   ZkrkmljwqNOcBPHeFPD4u8zamHO5usup/Pah5cVFijkgEYs1jLPrG2J1J
   2OlnYV0Dw1Ar9LN67GjttuJamKFDdY+3ryynviMrLVqfjh41JiN7KsKDb
   mYKgtP8Az0j5sAxxvwgxzu8NzLgLeq3Oo7yg1S2l5Uj4g1BCp77Fg/rrF
   F8tU+SKBcULppt2D83czt/qIkv4F3/Nn20B5GYsjuA6n32Vbar+Cbesbb
   5vsyFDtx/v5aYlHasKkxsx6fqtDJJythoLlb1x1hN6GIrhMzMDUXANM26
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="182038735"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 14:10:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 14:10:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 14:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUG3ZBJJF06gx87TG9aLCzr6oNxLOAc7O6K+fcTflw0IYkCA5FKEFaB28R40aa65toyjnm8+McvTIjMU2/HfZqufTk7eUdhGOnz4TD+BN+8mh+ATcoq6bDlRj4a9S6Lozd8ZAouni4HuVkkRqNICKIOwdZj7tVB8YptRxs3zbU6PogOcqR+su6wodvr1vw1bkdOF+nukcHG5e6VlXHwVXncqpdu6zLWuFI5U6cw2YkH069q4eB7zARA+qTVJPNQKfkozPCUjiwEEtEyxj5CzS6CVG5WQriir6wbzo4NyKVzTdAGXs7FIN0dd9c0WfNo486Q2smOAEc44awKBqAYOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3idWAeckcmMOaHZ4xD5kLUt4wfy7uh9AGYeV0j3LeM=;
 b=mAJ7bVdX4sYhUdxBNXNUmDHVeqwcK14XZE+RriphrL6F+J6zTsDytKVR9us3aPl4aHCJaAILkAcO9puKaUIUntKz/C0DbPp/eou6uSV3+TfppZQD3eh4EIcHFTvKXviF1Zej6fLf2y514f/PxLAlROC/MNW1LXe9XvmZGBu7AAoZZSU0OGP/RNWvdT6BYvmnqr2bGcYEW3bWsPoPNhsBvjbiXcNX0HFexmOdBEfBTKnSgUC4OIRZDkaMlQ6GyO0wbEABjdGDOMebeHhZjftrSTtqaV1hs6oTz0onFLFROS4miqVFn6xf3hWwqTpqoqRbvVq3mxFP9CXy4tDeeqf5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3idWAeckcmMOaHZ4xD5kLUt4wfy7uh9AGYeV0j3LeM=;
 b=NFrL6sYtoeaqYi6R/60ov+EFZ7StwJT8zZ2+8p7shpQcz++k8f48xN7vxgCbJkPeMlAsuaYRyBj56s3/xI3ZsTV5ANYBVl5lc+0jIzNJZdnX2zx3Wnh2/hKrMFVEp5Keo/r8fZOprh+wtTAHmekj5xwLeza1PVN6H6857SPR/X8=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by DM5PR11MB1497.namprd11.prod.outlook.com (2603:10b6:4:c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Wed, 13 Jul 2022 21:10:28 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:10:28 +0000
From: <Lewis.Hanly@microchip.com>
To: <andy.shevchenko@gmail.com>, <Conor.Dooley@microchip.com>,
	<Lewis.Hanly@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <brgl@bgdev.pl>,
	<linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemr2KX1URl4Eaxdmj5tFzD4a18MrcAgABgUoCAAAHZAIAAN8GA
Date: Wed, 13 Jul 2022 21:10:28 +0000
Message-ID: <0a98678605def630303974e40da9990fffd2ad74.camel@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
	 <20220713105910.931983-2-lewis.hanly@microchip.com>
	 <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
	 <debb6cf6-65f8-53d2-d8d7-3ed1c3d5a8c7@microchip.com>
	 <CAHp75VcoiCVrdEMDrDC8qVZZwYgLTdi50tBxB4BQk=tWQWyOBA@mail.gmail.com>
In-Reply-To: <CAHp75VcoiCVrdEMDrDC8qVZZwYgLTdi50tBxB4BQk=tWQWyOBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0621e7b-840f-4b9b-ec93-08da65141ce4
x-ms-traffictypediagnostic: DM5PR11MB1497:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9ynXkpR2VynNhsGsQn1KEQD1XBON/8fvmmV7jl6sB3H53idecHtS1aQ+D43fz162ndFO9SfuC5ZKzhy9hKPUS7sf5cf2AeKcGS3ZOQdsVmAecM8eg87BXgkIUeC3ToUaAdszD0NS3TGLV+OxcF/+pqEBSJ7u9w2c0FNmONHEcIbILHnXlkvFeG3+/k9bFsaWDJvwoZlyCu0ZsGIcOm5Rh0usWoyBZMoOxLqOHyFy2YSLZF4NyxWBjwa5qCNDqdSW1gCfXy+zUw6/OEoDZ8hOY6qhBzmQ57OKaivbcnFRGB7Iqt6DmCFtYplpwG8VNOO2JiIwwryLLI1LWWVsZ+yhN4HrwXIQhJuLEEtgE9IjeN0PoVZNCrmf6spkf+zS4rMeS62YHMULNUnsvVQ3P4fxcWHs6F56GSNWgrueiTJoxrKZrk2IjFGpbnWg5PolRbmq+07yoy+41rpBnCb1BfiLzMqgpO3PudySSV1ZV+sxVhPs4IUFxL94o6dOcWpSeyAphT82NHV2E1Sf0rn7fO9Hhigq5z/hEz8skSQwKeCm5CJKHv7KeKP1JCy5YW1i/nFdKtq3YLudduVa+jfi1TFDhYCF2MYIXr37iL3I5pHDMhIs4U8A79lEVP4LlSuTqxtj2SMiMBmmXvuy48FAwkiQyoP57A2764usn1LxZnC0mRq8kH3dlgmfFxsvdXOUgSRu1rTzF76D8ZwI1OJ5uggk6P1f3XqYE6NFVWNfehAV9dCYvfphYYTEJagWX9guXdjpdAK5PQBUk6ZXKa9OOWf3dwosoUzCSPRuwlEQWUd9rGvHvR2+GQYhk5tmC1p0LoY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(346002)(376002)(136003)(54906003)(64756008)(66446008)(66476007)(2616005)(41300700001)(6486002)(71200400001)(66946007)(8676002)(4326008)(66556008)(2906002)(110136005)(478600001)(4744005)(76116006)(6506007)(8936002)(91956017)(5660300002)(38070700005)(86362001)(122000001)(26005)(36756003)(53546011)(316002)(107886003)(38100700002)(186003)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXRRMXRmYmorazdtWDhCdHZudWg2YkhseEFDYTZXZXZJUi8rL0E5TnEvWHE0?=
 =?utf-8?B?L09yUWJndnpMWUU5S3JFS1g5Vm9KVnlGa2dNZk53MjZzMEtRbzVLTE1SQUJv?=
 =?utf-8?B?ekhSSkZpajcybU9GYVdkemJDa3dQNFNBNXJlS1VyRmM2TmtIcmRjNHRDeGdl?=
 =?utf-8?B?OTlNcXU5a05GVDgzMUlVejZaTjF2M0puYnNXMXlFUFJOazN6ZCtFM0t0MkJU?=
 =?utf-8?B?TUwxbzZKRFVXcy80RzZNTGFmN1cxUkJpT3ZQRkJsMUQ1MmVieDk5a1FsQmJq?=
 =?utf-8?B?RlJDSHF6UWcrbWMzNi9qTGg2eFVEYWMxd1MzY1dmNGlwelY2ZmdmTTc0UUZC?=
 =?utf-8?B?M1dzMzIrdmpXUnRmZ0Q0L2M3TGNiQTRzUUVIRStSd0huNUJWMXNzRVJzQm5N?=
 =?utf-8?B?a0gwSXdzbDJ1ZWpub2lFRS91aERnUnNMdm5KeU5ELzhOUlFDWkZnakFLNUtB?=
 =?utf-8?B?cDhvaE9Obm10SW5MRlUyYlR0VWtwY21CVFppUVZLWE05VTI1aUh5L3J6ZEE2?=
 =?utf-8?B?ZG1iV3dNZXQyZVlpdldubU5oY24xYU4zT0srWDZiYjZqQ2tRa0VKaXFuRVA3?=
 =?utf-8?B?Nm8wODg4S3lFZjlqeTk1MzNWOG1DSDlVNUtzZ1NXNkhKQ1JON2JyVjlhNG84?=
 =?utf-8?B?TDVXREt5Tk04NG9QbTh0MWh6NFcweisxaG8wUkpRQTFsSTZ5RFVuTXRBT29r?=
 =?utf-8?B?NFFLOUVwOHByNk9JajBtNE1wc1dMS3lyMisvL2pSNzZMYWNDR0YyQ1NtSHJQ?=
 =?utf-8?B?bmlpbGFDTmRUY0VzVEk2eW1wVWpZV0syUThLVytwODRZTVdMdUdYa3J6WEZM?=
 =?utf-8?B?WFFyR0g2TnhKOFR5anNRTmNUQ084ZGxOeElNS1c3NTFuNlIySnBNRm1yUy9r?=
 =?utf-8?B?NkJrU0Y3TkRITXEzNmo2QkUreGtrOFk0TmdEbW9ieEplYkIvdndEcW9nNW0x?=
 =?utf-8?B?bWpIVC9JMW94c3BCZTFZTzlvak9NR2F0SjZhZ1ZsVm91ZjlYbEp6b2VWN3lF?=
 =?utf-8?B?a2ExU0V5V2paNU5TalczcnVIN1RWV1pHc3VFSlkwcVdPNm03NXVWZ29sTVIv?=
 =?utf-8?B?Sk5NRVpFVmVjclNtMTV3cFFxc3djRlkvMGZEU0UycnRzMUIzZmVTVUdxNkVy?=
 =?utf-8?B?QUQxYTRLK0xZN1FPZ25aUGt4TGdVZTRhT2EzUWltSGNvR2NhNW1VMS9FUHZs?=
 =?utf-8?B?UTJnNllobit3VzB5WGxmUEd3ajlXY3o5a2RoWVBQMll3R3NpYmhmUjJIK21L?=
 =?utf-8?B?QUNwR0xaQ2VGbUxocG9HK2ZuOUs0Z0VoL21NT3hEL3FsVCs5ZlMxaExLUytS?=
 =?utf-8?B?ZlpIVVJ6SllnRlozWTE3NjFWeGJpcnArelBIUnQ4Y096ckw2MHVWR0NyZzRH?=
 =?utf-8?B?SEM4VWk5aG1odUcxdXVzM2pWOVhDTlptREdIRVNodHJNNjNBK2RlR2Q1TjZB?=
 =?utf-8?B?K3ppbjJEVGsxdXhoNk5KK3haUzRqZ25za2MrT0dXUWRadU5Ib3oxYTRyY2hN?=
 =?utf-8?B?T3hiWFlCT3pkc3lnRTc2WEJiRklQeW9MSS82akV1T0tOdE02MWUyQkprSXlU?=
 =?utf-8?B?MGhCUlhrSnRHT3FURWtRaC9vdmNiNGpRdGhDSXphMERRQndvM3ZLZysvR3ZR?=
 =?utf-8?B?YmZub1dKc1VnV3FrdDRMNllXeVdBNjc1Mm4xSllJcjhUQnR5bjNSNUEreGJE?=
 =?utf-8?B?SS96MWZZRktrY0RwS2hIcHIyQTJXNWJSaHNIZVhXS0xEbXVhZEMxYnFuM0tO?=
 =?utf-8?B?QVJkMGxSc1dtMUZ3eVlScjZpYzVoK3VkVWJSMDNUZnhWZjhuaHYyKyswbEMz?=
 =?utf-8?B?ZDdrUG1JS3ZFejAwSEtSYlNCdTVJUUhOVWVaSDh5K0V2QWNNcVp3SGY4MUFF?=
 =?utf-8?B?VERTUXVMVUtRblVBV29wcjcyaGQyNDZuS2VDWlB1MCtBNXB1Sm12MFJqcTdh?=
 =?utf-8?B?alZGbjZQTmFrWWlqNWRrK2dOOG8xYlpSNzFPd2crQWs1Y0pSN0ZuV00rTGxJ?=
 =?utf-8?B?d095OVJ6cjY2blZka01GU1FoMjJkakJHNHlZcFB2OWJHYnFreUNLNitrRkdE?=
 =?utf-8?B?QzZYN0xwZUpjb1Vad3NPOENXQjdiVzdmU3N1M1BmWFkwTmd4RXFlVlZ6d3pI?=
 =?utf-8?B?T2lRaXFabjNqM3hMbC9wUFB3M2Fka04zL2htUFpqMlhnMVZyYTZUOUlxTjBC?=
 =?utf-8?B?N1E9PQ==?=
Content-ID: <8D3B2480B2492348BF3F78E138B634FF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0621e7b-840f-4b9b-ec93-08da65141ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 21:10:28.4393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDr/XD9jFElmY+udfPIpCfoy0m11VTGQyJMyewqrLUNUhmulFLXEm31VBsxz90j96EBcCAsbH1ul+LhM1p6BjPVv5Z5jQwCtEgFa1vfsH9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_141051_267479_CC80C85E 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, 2022-07-13 at 19:50 +0200, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Wed, Jul 13, 2022 at 7:44 PM <Conor.Dooley@microchip.com> wrote:
> > On 13/07/2022 12:59, Andy Shevchenko wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the content is safe
> 
> ...
> 
> > > > +#define BYTE_BOUNDARY                  0x04
> > > 
> > > Without namespace?
> > 
> > Does byte_boundary even need to be defined?
> > is incrementing an address by 0x4 not kinda obvious on its own
> > as to what it is doing?
> 
> The less magic is the better.
> 
> Btw, have you considered gpio-regmap? Can it be utilized here?
Yes I have considered regmap, our register map is not mapped out to
fully utilize regmap. We could use for one/two registers but not fully.
> 
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
