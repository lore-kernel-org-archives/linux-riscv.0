Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0578C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1I+1uRtSIYJNGhceCL1bV/6s1ggcawDk7xFIlQwsP0=; b=Ef3QaOD/rv+yyb
	WuNoIKJeDAc41J5h8p+DZN02KWGn4Kxysy4KXsKehlUvE/P5r/kAeyr3Nx4cZkJi3Ksy1aLk4UTF8
	HWITlyT33A/0aU/5GKsFiDj4zkHy67aXb8KX65BF7nKouCk6s92uA+uda9q4sqKUe3KHxWILlFxpm
	ll+6h9IxaidUUAzWJpu+oJAHWdp3OSFH5IY7T3xV2tJsVgdd7vsAWfWTFuOdFEMF54fZX207toCsR
	UgK7dBHETKVNoBg5m304/23R4yAFJcBTwDQFe0RH1eF51dG+BOU4O0F2i5/Oe6tFDiZ4oNXzXmAtg
	TaVAzIwYGFSrPNafgsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9mbu-003Vao-CH; Fri, 08 Jul 2022 11:57:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9mbk-003VXR-9E; Fri, 08 Jul 2022 11:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657281436; x=1688817436;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=65ATGNPso/m/tpy/inYOgZ3nZza+czTamcyMvtT8ZRk=;
  b=sErSIIMKroFWVXsaJ16s/OOXLWIVV7IR5xkANQrSEI7ZlcDuN/gta98+
   /F8k6jBQ3ecoNaOM9Mjo7AqNwqpj9TUooDuF+ruyjec+zhpJvtbGOlSq9
   JNTlK6c6XTiV5giXcbv+/5SrpQzLNmY/9qa424puQ1nl5lqnXIeT8KWOd
   4FQIrbIWClIsDR/u/74Halxuv6K3vnoO+RVVVa8hKBSr9uLqGVcnCZy1M
   36Nxz1Yl2B9JJHnSs60H/oSOcqvnoDJIoUcuikfTSM68+dMfz3E3uJE5o
   cMsDrMe/AxPUUlTGb+rqrZrKvJ9FfxZrEhCmvGFkKq3KEXrd6xa3hhyuC
   A==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="103632131"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 04:57:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 04:57:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 8 Jul 2022 04:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djUVkR+SKBrB9TrbgzDGG8IzbZGLc+xzFqjOdQdhE9VVSURcYnnPIPv3LBGf9jph6h4QjAFDFfNlbLHNDKC9ui/Kfddk9KHuIXHfLEDeYjiQlMl/QBOJ5GDG2CR/fA0gBZ7MUdhRSbbH6hEL1sJcISToQ1UxcYU+XvwycT0vUG9eXmRdboj7QLjIlb+Q9S9NdBA9o34HIui8B1OmY8ZXzDEjRR4pihYu/gMS9B/ygO+xl0GMGhnTxwUmCJGf7yRyGzkNQj+6AuMmx1WmLec+PCl0XpZiXOdH4W+PMVnegCAI8MNPex1PrP0urLhGtweAcPoxREbWD7GTvDnH7e66Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65ATGNPso/m/tpy/inYOgZ3nZza+czTamcyMvtT8ZRk=;
 b=bz4JF2okKFFSsov4Dx6AIHLtf6pbkhdu5jp0xYkGGzIrEaD1krNYXAX86ZaqmiSkqjf2ovPcvD98lfge3CX5aKcGITigrwrZrl2uCK+Og7xCelpJR7c2RXBM/TRArnL734Gf0CcdWmR9HX1Sugzhhd7YuomYduNuh5it+JVbKpTlrBXkH7hX/vfaFw+lI2pMp8f4GdapZX+DZXYILBTNzIIXPdp9HPocl1NpWKvlxePYd/AT0BnQEacXeIW5KUUBO6r8XjjQQqtJiIIEuEmUvicr4WnbEUM6eSVflT7CskuPTNOq7DrCGPJk0T2+Sgp3gu5o3g/OkTeKf74ce5Ga7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65ATGNPso/m/tpy/inYOgZ3nZza+czTamcyMvtT8ZRk=;
 b=pdL1YcYWHWoNXwivdKBMe/e6pWofVqsrWc7zYmM7kpaJd77V9oBAN2x13Xw/0W7Ui9PkAiEafGqQsdztp0SOTLnxgRIY4NA/US2ZCor/HKrRhD64wHcocp5cURks3mYOlTNuXM/Kh0HTWR9pOTBXvy04W2m4MgfESaqva/f6z9w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 11:57:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 11:57:05 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <gregkh@linuxfoundation.org>
CC: <geert@linux-m68k.org>, <Conor.Dooley@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<rafael@kernel.org>, <Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <zong.li@sifive.com>, <kernel@esmil.dk>,
	<hahnjo@hahnjo.de>, <guoren@kernel.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <changbin.du@intel.com>, <heiko@sntech.de>,
	<philipp.tomsich@vrull.eu>, <robh@kernel.org>, <maz@kernel.org>,
	<viresh.kumar@linaro.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Brice.Goglin@inria.fr>
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Thread-Topic: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Thread-Index: AQHYkk3HIdduEfI8FU+fdqjoS8H9IK10I72AgAADKgCAAAyQAIAAAguAgAAFRQCAAASdgIAAGrOAgAAFA4A=
Date: Fri, 8 Jul 2022 11:57:05 +0000
Message-ID: <9f8d4e4d-f24b-faf3-687f-90370939c72f@microchip.com>
References: <20220707220436.4105443-1-mail@conchuod.ie>
 <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus>
 <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
 <20220708092100.c6mgmnt7e2k7u634@bogus>
 <CAMuHMdXUjmG9n3BuRAz_irkmHQbp=7SYxe5VEfOhMdT4D2JfwQ@mail.gmail.com>
 <20220708094710.rxk6flrueegdsggr@bogus> <YsgA/eycDF9TgCIT@kroah.com>
 <20220708113915.ui77mgqckjzalwlh@bogus>
In-Reply-To: <20220708113915.ui77mgqckjzalwlh@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6042a628-87a3-4203-96eb-08da60d8fa6c
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BUDK2yq7pChMPOsHMWtYQllEEVThVqYX+bGStzZkWFd0aaE0B+AB8PdmVdJd1tlJfZnMw0NJi5VpLnuTLie7GB5dfTeopexwzKKMk0L1gboJ2IZUhshhbK9OdFwHsZa09omN/1oYi9ZGSFNl2Ea6yu7ylOjmkv7oOP++3sQ5S3xueI78y+b0iFmch+vCsOwqmD9uADeZpn1gP9+3SklvQTBqCZaPPXbWQXrLHn31Pa4A6Z+OurJhOO6wflPpGtc2xwv6Tm/DM31AgQrNrwhN3KrNkTXuVzFWApSx5UWhpKw5KhQMjICJRUmAqSBVBAqzO3jDkteGpYF8EYs2EsYC34azhR+3+aMItveLuRbnQ7W+laKf7B6OWe1N0d72U2MzQK3fw3YxnbBxYkzkb5wxtAf+bVCOtd7xqsCmq/jy5uM06D9ncAoTZaZFt56uvgJP6LCT8vun0S/14DzGNz2at4EG119NeYhkYlgZCzaaHZuHmy2Ay+6M4ry9wXISNsDC3JygZ9uf4EDGCK+nDvz0uEJNo/gaTdN8zzeXNB9SJO8EA7v7csVohpNTVI7I6osIaiZwOQELotUiqyUCI0vSYcqRPmIDW/RV5KkR9Gfb2pRLupAQ2xd2t4rOGHnNzjdOk6y6A+UUbqwZY8ln6dT8upSNyFbfqWRomWlFSdNUDi4JbCQg3S4PX36+Qx2ZKrFyJAzchPAN6M2lDCF5GouVIfEF4WHGR/YwKEpotvZbfqJ3wpmRX4fW+Ub7hUiR0D55PrqUKoEplvgzrtNJjRnUUy6ssj6eXgE639JD39HRTMb0xwlHTVr/evwW6Fy+olgBQlo7QCojpKIcRPDRD1stmaxHsk5c1o4ZOYo2SGSP2EyWFdnYOHrO2gMDqIFjfl4i+uJbjZJnn8sqyaxiPEa8jaIhpVo1KzvKGYWvxa0CyjxcD1ZdLflKXnZ5O2wSWTBs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(366004)(346002)(39860400002)(66476007)(91956017)(8676002)(4326008)(66946007)(66446008)(66556008)(76116006)(64756008)(54906003)(110136005)(31696002)(38070700005)(316002)(71200400001)(86362001)(186003)(26005)(2616005)(31686004)(2906002)(36756003)(122000001)(41300700001)(38100700002)(53546011)(83380400001)(6506007)(6486002)(7416002)(5660300002)(8936002)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTZYUmMxV01DbnRsUDRRejA1T1licEdwdnMzeXdGemdqYmxBcTJFRjJKcFdR?=
 =?utf-8?B?YzdKSm5XMGI3dGkrMnFrc2pKYm1LSkU4YVgzZ05GdXY2dG5ZRXhoMlBIT3lZ?=
 =?utf-8?B?cmVURTJOb2d1eEhxMEpFc1B2ZEkrNiswNG9sb0JoSUt4RnQwMFJXU2ZvYWlF?=
 =?utf-8?B?SThJMnU1dVB5dUJNZTgwdlA3VC9YcE9hK25EN1gxN3ZLdEZEUWJ3SWtqOVZu?=
 =?utf-8?B?UE1tT2tVQ3hEbEZwNWF3ZmlScGt2T0M2aXhYT2IvTkZnbEVIVWFzWHRpb0FH?=
 =?utf-8?B?bU5iSXJhQk5NWVR5RW11NW03Wjhva3h3ckQzUVhPbTh2UFl4ZzhnUVRRR3ZR?=
 =?utf-8?B?bVoxY0NIcHMzVURZYm4wNnVSMGdCb25sMFpYYUNtSncwOVY2NmxpTWxVbUJJ?=
 =?utf-8?B?S1hVWkJWcm5zaEhUWUdVcU9KTElFNHVuY2dDM1N0KzhRS3hKVXA0NThYbkpN?=
 =?utf-8?B?V0FISjg4NFF6aDl1OWU3YTBWcTRsR0xiV1pZaDhhSGJmWjM4NTNVSEtVN1JG?=
 =?utf-8?B?bFZpd01yWFVtNkE5Qm43UzFCQ2VSRVZyQ3kvdnBMVnhQczh3QzdnQ1ZIQjFJ?=
 =?utf-8?B?RDdjME9obllhWXBNZ1Z4ZCtkYWdBMjdBME5FWGFMVkpUc0w2aVNvREJHbGlS?=
 =?utf-8?B?TTd2bTRjR2pXK3BFQytCTDZJaW5yazdFRFhzRTRiMmpMMmNON2ZjUjhXRGVU?=
 =?utf-8?B?YXhaU1QwMEhWeGNKTmNLdHFnbjlSNXAyMlppR0xoc2NwNFY4U3grKzBPbWZI?=
 =?utf-8?B?VGlWOHZCblJ0WDNiQ3FLTEc5ZmliOHlXMGk2ZU5rUklRT3FTUEVwbkJCNFFV?=
 =?utf-8?B?eG50dGtLdWRSOG5aZlQ5ZEhCaFNUakRKUm5Bc08xdktnaEdwOVZzaFpzeXRD?=
 =?utf-8?B?c0U1Z2JGdzIrNDIzckpQMmh6alFUZk1pOXUrTjZBQlNpTDd3V2hPYzFzSERJ?=
 =?utf-8?B?cy9aN2h3UGkvNkdvNFZXQkZ3RXl6RzlUSkVMVWlQamNTR1NiMFlGL1lESGJn?=
 =?utf-8?B?dlNVSHZwZEQ0N1djV05UNElaWS9XMkNRcFZLMHhxMmhHVUl6MDhRRDk0cVFE?=
 =?utf-8?B?UWJ5cDdKKzNIVHFjQVcyWGlIeVg5VEJJWFpoM1pudzA4YkxwSUpnTkpaRVFz?=
 =?utf-8?B?b0xMRzYvRzZsWnJvNjBteDBpTEI3VS9RWlg5RHB3OGRHTzRoekVKTVhONnFy?=
 =?utf-8?B?cnp3OHpSdnZuU09rKzY5WUVrRlR1eUowMkd2U0pUSkRQVmVxNzhvdUhUN0lY?=
 =?utf-8?B?bTVFd2t5b3IyS2dURFNIb1c4bjllRnZCUEhWdVF5WWRVbHRnenI5cWtGWk9a?=
 =?utf-8?B?MytOenZBMmxtVkljeThueTNISFZOZHpUZEppdC9GbU5xRlEwd1VtWFhvU2dh?=
 =?utf-8?B?ZTkxNVBRcDZJRU9hZG0zODBjS0tlK3YrSFZOdUhsbjBnby9qY2EyN2p2TE9a?=
 =?utf-8?B?ZENuQTNEOFpkNVVRLzVRbldsamJUem1lMUV0N3NiQ25wOGoycFJKckx1TDNY?=
 =?utf-8?B?NTZ5YTFqMWdnbGF2ZkVyRXdrdDE2dVRqbitWcE8yd3Z1elh0TU1xVGdUbGha?=
 =?utf-8?B?YkYyUk1kRkd1QkdZSGR2TngwL29VanZ0dDZtWDJFRHQ5RERxRUkxYzdUOElt?=
 =?utf-8?B?bEFQOWZmRjVyTFQvbVVQV0JIMkduYWNONE5tWlU2NlpLN0V2TTh0Q1RGcmJz?=
 =?utf-8?B?bFZ5NCthbVNFUWpRKzVrZGVVdEJaMEowOENVQngzeVg0K0VGd2x6eExQMjVp?=
 =?utf-8?B?ekx4ZC9aaEpEZ09LZFVIU3k3aU5RNG42b25YdTV4Wk9WYTM2K1ZwRExnMUdS?=
 =?utf-8?B?ZmVqVXIzTzJFZEhBdmoxVm8zRkFRQ0lsNVlFUCtZaDNqNTlrZVc2Z1ZjZE5K?=
 =?utf-8?B?TktUSENTSzNJWFdRbE5aVVFncGxRL0JLZ2llN1Nnb08wVXFqcGRIZzdPY0F2?=
 =?utf-8?B?WUV0aUdONUdGQ2JCL1dNTXZSNFljcHh0SUNTNFp2eVk3Ymh1VnF5Rjg1V05N?=
 =?utf-8?B?Q1FDTUgxVlhmWGhlcmI3cUJGdDNEaVFQc2tGQjNoUXJxbVFWc05TMUVVbEN1?=
 =?utf-8?B?cmYzN3Bnakh4WCtZdjFsczZqYTZoK0ZuWjFyY0d6NmEvLzdmSG9WY2NjMzV5?=
 =?utf-8?Q?bkEib5zL+oAHM6Vi0utlxckR5?=
Content-ID: <EC4EDF3865E62541BCB77A07E03EE081@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6042a628-87a3-4203-96eb-08da60d8fa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 11:57:05.6500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1C2xcqla/op/VIlHLiPJNgw7Bj35oMx3fqwGh9VdE+Wf14NbScd2Yjxpx4rLY7fR9oDPUegjnNjsKTnit7XqYmH47N/CnuW78T3hGl7My8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_045716_632190_A4C75E59 
X-CRM114-Status: GOOD (  19.31  )
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

On 08/07/2022 12:39, Sudeep Holla wrote:
> On Fri, Jul 08, 2022 at 12:03:41PM +0200, Greg KH wrote:
>> On Fri, Jul 08, 2022 at 10:47:10AM +0100, Sudeep Holla wrote:
>>> On Fri, Jul 08, 2022 at 11:28:19AM +0200, Geert Uytterhoeven wrote:
>>>> Hi Sudeep,
>>>>
>>>> On Fri, Jul 8, 2022 at 11:22 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>>> On Fri, Jul 08, 2022 at 08:35:57AM +0000, Conor.Dooley@microchip.com wrote:
>>>>>> If you're okay with patch 1/4, I'll resubmit it as a standalone v2.
>>>>>>
>>>>>
>>>>> That would be great, thanks. You can most the code to move to generic from
>>>>> both arm64 and risc-v once we have this in v5.20-rc1
>>>>
>>>> Why not ignore risc-v for now, and move the arm64 implementation to
>>>> the generic code for v5.20, so every arch will have it at once?
>>>>
>>>
>>> We could but,
>>> 1. This arch_topology is new and has been going through lot of changes
>>>     recently and having code there might make it difficult to backport
>>>     changes that are required for RISC-V(my guess)
>>
>> Worry about future issues in the future.  Make it simple now as you know
>> what you are dealing with at the moment.
>>
> 
> Sure, I was just suggesting and expecting someone from RISC-V community or
> maintainers to make a call. As I said it is based on my understanding.
> hence I have mentioned as guess. So I am not against it as such.

I did a little bit of poking in the git history.
The last code touching the arm implementation was:
3102bc0e6ac7 ("arm64: topology: Stop using MPIDR for topology information")
on Fri Oct 2 12:01:41 2020 +0100

The introduction of arch-topology stuff to RISC-V was:
03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
on Thu Jun 27 12:53:00 2019 -0700

Backporting as far as v5.10 should be no real effort and I don't think
to v5.4 that should be meaninfully harder. If 3102bc0e6ac7 hasn't been
backported already, maybe it should be since it appears to have been
fixing a problem too.

Based on that, I think doing this the straightforward way in the first
place is a better idea.

I'll respin the series as:
patch 1: Move arm64 to the generic implementation
patch 2: Make RISC-V use the generic implementation

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
