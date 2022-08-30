Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A7FC0502C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtBaTmZql3l63Vdg14ET8NVVH2AyH7SlT+FpG6I0M7c=; b=myPd0mR1/mq+Cb
	GsD6XGvP2IQXjWORgcJtslqdtuV0jVgLymmQ3Dh7ind5mz55GXs8qu3TgR7U8510GPQfeXw9cpKqW
	DwhQVkQ3ai/15VhlzdcD8rwn6piuM+nDDsrF4LWlK1ewwABFfj1ajXh6SK8wxVkQ2PsCc/hZWQDWC
	3IYDudt/XGeYev2MyoXiYCFX/VXDKyepxzdIwHSaz6fe2GsofRanPC9RmUMko9m1pAHdWElMdEwrD
	zaUB8m9kXJdJ7rtULsfaP0+t4HMQuaHfcm0PjIPVjqZ7bgXVC17vLcHjd0t9EuBZZ6yACs86C1uSy
	F63AkMCyb1qGjB62J75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4af-000fPt-69; Tue, 30 Aug 2022 16:59:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4ab-000fN5-I5
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 16:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661878790; x=1693414790;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yVVvW6u9AHugt31LLrrDXKaxVVvG8OAY12FkqELMbbM=;
  b=OhLHgUUF0riBubYJnpgtZn46lD97nkgD5PkSeVqaGCwbZa9c2FIUhQCz
   uZ9LL2F+UJe2yVZlWA+wBfVnbBJ222EmkNo81BK2OwQ61e7+ydnZ6YbXJ
   kvDXL3ne7jYeZn6fX/6s5C0ITt2E28diC5il/ZXsve4bB5oyXca2/PKkc
   exLWMYkK1+MCFIDsgbgoLFvJFdUdVhC0fo2jcqA/sgpA2La6aaeRkX7wB
   f23yze4W3eeyP7IglJijt+gk6KhC3elPQz/49w7JoCoU59qijVDThbIlo
   /gnR3y80YQdLT13cIRD6C5zw1NFbsy7xvJOqRDTXo+wyqBdol9XPL91mt
   g==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="178346728"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 09:59:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 09:59:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 09:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC4IUw2SygGWVGayzW+Am2Qn21t2ZHAIRiGHe3YtttdM8Neb9NLjaCCl/Apmu1sldyCe0zt/X58kAkC/zxgQhRtWUjLI+Vo2VRC/+SMg06TbMHDtoOyip4maIicC8iKSaaHVcn50GwXAUhgcB6HnohFJXdAbGelUXPdbMTfoBsNVNp7kSjoBs9vEDAhBUPF9yGkLqTdE0P4F22SmoBcLuYyTg8cfIcmIxN0Rhwx4Zw9C7SfYiB+MWodEjMI0AfPysCJ2uShU+zku0kmaj8iB7AV9viaPp2HYYh0ku2llc84iW3t/kyAnfyV/Sxhz4OLmtASFhJymZ2INQ5q0acmjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVVvW6u9AHugt31LLrrDXKaxVVvG8OAY12FkqELMbbM=;
 b=Je0Unvli0i+w7w4k+u2Tx/ZqN1r9cOLu9f+9XLdiBtrn8JG7LmC5PBcMe6PpnqKDwGTTySWficpvFhcGR6F/XDJ0u2hpWxpBK9G3tNdsGcCVm/kLN9jg4OhIBdc5bRSLW1XOY6ZX3ktzlxL9Xg9KYvlchbn3pvTJ15982pTeOactMEonkGHrFwVoVkNQZNgP7MU3u1V1lzTJRjKC77cGYS5HhKQhSk5pPL9542+velXiXdvDhyZTWDvfCDSfRPUdcubPj9H40rjdKeOo30NdzeJw1x2vxjwppHm9tqlCrpI9305/q/19xZ2fwSBVCqjWttUkfbZGfKIQDwbzEwfVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVVvW6u9AHugt31LLrrDXKaxVVvG8OAY12FkqELMbbM=;
 b=g4a0ePTLFNoBAmSumZTT6tDD0HvpM+RAW3+g3YaBhkaoBjBjafQsj4Nesn+qPwCu/MDmFQMM87GbqB6WNZtSUJqZ9Y1dK5hrhmh8OHs2OtZsGNgAgHu6L9wllHZDqgcGfuFObBBN+ZiUfLG3c0cRebJ4CfeCTaHbvpDu5lyINns=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3636.namprd11.prod.outlook.com (2603:10b6:408:8c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 16:59:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 16:59:19 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <Conor.Dooley@microchip.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Daire.McNamara@microchip.com>, <Shravan.Chippa@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Cyril.Jean@microchip.com>, <Lewis.Hanly@microchip.com>,
	<Praveen.Kumar@microchip.com>, <wg@aries-embedded.de>,
	<Hugh.Breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Topic: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Index: AQHYvFnwSpVLiReZPUWC5HM7xMt/UK3Hg2QAgAANgQCAABkagIAAAP2A
Date: Tue, 30 Aug 2022 16:59:19 +0000
Message-ID: <69027950-f18d-c9a7-9f0b-d73ef68197c7@microchip.com>
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
 <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
 <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
 <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
In-Reply-To: <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5994cc3-c752-4d53-4007-08da8aa8fae4
x-ms-traffictypediagnostic: BN8PR11MB3636:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnIPXi5nZLZm+5kuq/HzK3Bxp1KtPzzO2vdagzgvDDnnH3hRB2tXFC8Yf9/zKYJJI4pcQK0cZfXgDRL/MfM6M3KCCEwVMuLHSvm2hC+bNZ1xRN4XoGmexDjWW9c/RyXaYu+f0EoFkxNCi3S+/fShcbExC4ur8j9m0UNtVdXz/M3qPt0HI5CurigUcrOHv5F73E/a417xSnRkHi3OK0k57SbQWvLe+I7nyXBr+NR1doAAWjuO0laRx8yzPpDq6UV7aGjNP+BSzNUWs50ehxSgjw9KZpwkUkwx9jsKdNQUKMImlSLCEOik+wzX00H/z7g7IeAVhLgq45q6fNPeqaUuEzeJjXc1kC7a0w5CyaFKO/iembRPjKfjIRO7UvtGw2lM1BtticpkVPF/qxnxEFvPgI3nLPbE3UR9DX7om8wEdy7082hsFUVNqjsId590ABy0gIaqugmgewuok6F+d+1MIWUadR/BjJRJOXx3lGycwcpANjPkQucJqMfme5jay0fVkuuTTL71CGKaeGMKR87p09nQs2nWFIHKFmS6vbcZoikmVu3K4M4dviW0zrzrfCuSPrp/A2jYEQw4o6CSrtPF+FRInlANJOnBvrEO4JZLWDVmFZVsp8I1i/MFXkm+DVCRz7m+ditU739s1km1xAAw4gFpkzXrYlLw58FB0zFYogd4Dy2ckN+rKawyocr+R20B6BFNteYXXDShfH/3Bc02WNfmitu1Mh0zVXLDghMmGC/Tlebd6+KzroHSudqmKXIvCXwFo42+DSgCXuM0ZsLPLQ14ildm0K4xbWqp4+6vV2vNxpipMXZQkqJFH0ZIyNXReiaH15ayJY/X7J3VxsbxWsYfoVm+sWW2c8P1fXAgRgo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(136003)(376002)(396003)(366004)(86362001)(31696002)(6512007)(7416002)(53546011)(26005)(38070700005)(71200400001)(478600001)(6486002)(6506007)(966005)(41300700001)(186003)(38100700002)(122000001)(83380400001)(2616005)(64756008)(66446008)(66476007)(110136005)(5660300002)(66556008)(6636002)(66946007)(8936002)(54906003)(4326008)(8676002)(31686004)(2906002)(316002)(36756003)(91956017)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTJWQmI3bzhJTGc3OEFIbGYxOEJINGdQSG9FQ3ZHdEY2eVQ4TlphS29FRGF5?=
 =?utf-8?B?VGZublJiL2w2VHVsR1ZHMmkxYzAzdVFHOWpBTmI2dExvYUJYQ2FyREsyVkU5?=
 =?utf-8?B?MWdaM3FQQkRpWHJhUVBWV0tudGY5MG96a1d4em5RMzRORW9OTXd4VzVDRG1D?=
 =?utf-8?B?SlNCbEV0SjBmK2VneHNDTHdqVlhlOEptVjZlWC91ZzA0bnRNWlZ3aXg0Umdh?=
 =?utf-8?B?dUEraHA2dERzMjJ6VGE2SHBzSHZPMjR2d0IvbW5Db3hqcUJhVDJ6TVZXM2E3?=
 =?utf-8?B?QjAyaUMwOXgrRmZlVW9vZFhqZzRNVS96QnduWDZZeUdIMXg1UFFiRGl0QzF2?=
 =?utf-8?B?U2NRWUFudTRNTVFZODFadkNiVTZZbkRoOFQxZFF4TkIzSHJYNmlZK0dxUEpW?=
 =?utf-8?B?bzVBVmxGVTJoaWxxMEVJcGtERUhlUWNVMHRkMm9LSTBCc0c0YmUwU01NSDNG?=
 =?utf-8?B?cHVKMVBxRXFYdk4vTThmRjM0dWNUcndyc21zbzZJaHNtMFNwbGJJR1c1dGZq?=
 =?utf-8?B?b1pNV0UwazVFVWVyN1FEVFJJODJ4aUgwcEsrUnlPSlN0Zy81T3gzazBFQU9M?=
 =?utf-8?B?NVpPZU5ZVmJSZk1wL2hBeE1LMUlFUXJBSzJTZC9hN2VtSktzT05XVVVOZG5Q?=
 =?utf-8?B?L0o5TFlHY3NqcDF5QVY1aWNxME0ydkx0ZnVVOHhXalJFM0I3YTByZkFJT0E3?=
 =?utf-8?B?TkFHRVBGWkpxOS96MGFQcE1TN3RhL2ZPeGVaeFhkbUR4RzQ4MWlPbHFiRzdE?=
 =?utf-8?B?NFp5TkNBa3orSFdsNms2cFF4anp4UFlYdmpEVFIzZWJTeWZLZ2FIS3kwM09n?=
 =?utf-8?B?VVNZMys1MnV3WW9WVFpDbGhzOWYyNWVpeGV6ZzhHNG1wbTFEMTUybTFwVm1a?=
 =?utf-8?B?N1FYcXhnQjBwaVMzV2ZpZlBOZWh2WU9yMFduTWhydEFkMElpUVRHNnRER1NP?=
 =?utf-8?B?cUVtaGYza3dpS0VwZUlldFUxMityNlhSdEYybVpGMnVJRXNWTGxkeVlDbkl5?=
 =?utf-8?B?dmlHck84d3ZPYXVIWGRma0V4ZEswMkt3YVQvRkJMSDkxdWdKSlY1cnUyRk5J?=
 =?utf-8?B?aHZDQnU0VTM1Uk9hRGdXYVY2cjFlNzhHZHVzeVJLd3ZzQVJJOExmZ0VTK1FW?=
 =?utf-8?B?M1dxNTU1eUV2czFBUm5ZZFdpSVB1MzF2K0NjbGVkMmtQcUU5V0dzd08rMC9I?=
 =?utf-8?B?K2hESmJ3K1ZQSTB1QjNMYnljb2pMLzNiNmJId0JLNUxaV1ZRSzhOYkZsNWZu?=
 =?utf-8?B?VTM3RjNacmZEYmNud1lydzdtRkZaUkljWjRDMHBST3NBZ3dqMGJseDBmdjFO?=
 =?utf-8?B?MFllblhZNVBRekgwRWxzZUs3bkRrSGlQUi9OOXllcEVLMUgzb1gwd09oOW5M?=
 =?utf-8?B?RDdKV3VEV1dzYlA4dHM4dEdlVXFKQk0xQXJsaGJYOCs5clhJSmJkQ0hWWlIv?=
 =?utf-8?B?R1RsSXRZeEV3OE9pdE4yNHdwMXVFY1FaNzZXSWErOTlKeFl6cjVGRXFoaTUz?=
 =?utf-8?B?djdxWkVXRGgwb0hYZGRjRFdjaHR6T0hpbUphckRNSU1zeFA4UENNM1N0QWc4?=
 =?utf-8?B?czB0bUV0Rnp2NjBkaVY1UEEwa005UGphWUVkUXVpVEFrSGY2amRyRUtSYWFl?=
 =?utf-8?B?VFhZcVlOZ2RZcHgyeWd5RkRYdGRod2FHNXNrY2NuZkxQRWtmSVA2TmEvYm1h?=
 =?utf-8?B?YjQ2ak1PQ1NWZzk4eHBLa2cyTHBjUGlndlZySVpQVWx2MzJnczNucVppUHk2?=
 =?utf-8?B?RFgzUlZSNEZaeUp1OERqNTNXQmI2KzVTYkEzVG85Wk51c1pmOFVvRmxiZnBw?=
 =?utf-8?B?QXZaeVRGekZONWJwbGk2RG9DMmVmKy9sK2hEOG9RRVRxWFNnN0dIUGRSWmY0?=
 =?utf-8?B?cmlONWhkVnVjWTNwYWh3aFk1N3BuY2JlTkQvWlRabFc1V1k5Yk5zNFpJb0pl?=
 =?utf-8?B?Y1F2MG1SYWgvcUNzdVhJL2dLc2NDL29ubW9zMERlTzlFQXhneFhFdGFqQ2Zw?=
 =?utf-8?B?OWl1WEdmYWVxWDFiVDFETVM2eHpIc2NONGo3SjE5Y0lQcnJjVHQ1Wk5aa1d5?=
 =?utf-8?B?V3U1RHVwOEdSYU5QUE9HNCtEWmdjNWJpaEhnVEo5eGpCdkxzeXVvOUdkYkti?=
 =?utf-8?B?U1phajZxalk5VlFnTXhKTjl2SE5qSnErbzJ2VG1HSE5mRlhHR29wd1BiOVZT?=
 =?utf-8?B?NlE9PQ==?=
Content-ID: <019978C7F39FA74FA02F905FFB17E0E3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5994cc3-c752-4d53-4007-08da8aa8fae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 16:59:19.4279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1qgXR2vjqvMogXQFJ6I1BOpmA0rAIZ3I+Rj1XoXGbmPkpHp1SOtw0YiriJjgwUx4uOnV1/yQdrVeHZmrIUUX+0WCHN6K3bI2Y8Y+THeu+58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_095949_631467_47EE38A4 
X-CRM114-Status: GOOD (  17.90  )
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

On 30/08/2022 17:55, Krzysztof Kozlowski wrote:
> On 30/08/2022 18:25, Conor.Dooley@microchip.com wrote:
>> On 30/08/2022 15:37, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 30/08/2022 13:17, Conor Dooley wrote:
>>>> Add compatibles for both configurations of the Aries Embedded
>>>> M100PFSEVP SOM + EVK platform.
>>>>
>>>> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/riscv/microchip.yaml | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
>>>> index 485981fbfb4b..04ebd48caaa7 100644
>>>> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
>>>> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
>>>> @@ -27,9 +27,12 @@ properties:
>>>>
>>>>        - items:
>>>>            - enum:
>>>> +              - aries,m100pfsevp-emmc
>>>> +              - aries,m100pfsevp-sdcard
>>>
>>> Usually sd card is pluggable, so what is the actual difference here? For
>>> example this one:
>>> https://shop.aries-embedded.de/evaluation-kit/m/m100pfsevp/445/m100pfsevp-250baab
>>> has eMMC and SD card...
>>
>> Yeah, both are there but it is muxed by the bootloader using a GPIO. For
>> icicle this is done by a mux in the FPGA fabric instead. T
> 
> Ah, this is still just one MMC controller - either as eMMC or as SD-card?

Yes.

> 
>> w dts were
>> needed so that the gpio-hog could be set correctly. Out of curiosity, I can
>> have the same compatible in multiple devicetrees right? In that case, it
>> would just be "aries,m100pfsevp" here and I could put that in both?
>> Would make things easier..
> 
> Depends, but I would say for this case rather not. The compatible should
> identify the board. If the boards are different, one compatible should
> not identify both of them. Imagine U-Boot (or something else) trying to
> match the DTS.

It is the same board though, the way the bootloader works is that if it
detects an SD-card it will use that to boot from, and if not will fall back
to the emmc.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
