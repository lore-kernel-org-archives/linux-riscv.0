Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D722C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLFSgPPmgolQfZMxXu/fzBAypKVSzhYxpkCvoMNDVng=; b=asL7LNiiXHeqQ9
	zm6OqbsZdTRRW2FfUz4etsv5gHyZoIMEobryySw/mndL+EtgS0ks2aJTdqtbAJJ9MViWH4PHOGxG8
	VGlUXqH0AhOHWXit5WYH0zdJ+++zFwypvywaytYCTDeG0WzNrx0CYEMK89NA51Y0i1DtOyrFer5Ym
	q6CRj7mtwa80qpAGk7MisjultwQwIQGa4r0WLYvMoVaPxZoqY0w/U2YsF+KqbcykWV7PO1pwY+YXO
	V/0GCuCXHq5A2i56pS5wVwoHeTG+7Nbckfb2RzZH1iRoX9fnaQ1N8eM6Ay6Vd949yfLU14Laj9UoU
	mahbro72ZwmvUEsIq/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70YK-001Mpu-Fn; Thu, 30 Jun 2022 20:14:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70Y7-001MlZ-PA; Thu, 30 Jun 2022 20:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656620044; x=1688156044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9oMVQm4fS+av6oDmDFASzGhMnZqUD405Scp47h9X8f8=;
  b=Yv3tmC8bSE5xt/D5D4vEE/Varxz7D8MFGUYm/7nzYks6V3xYUlrPPFA6
   dff4W4HCGZBx1AfDHvA1IMRQ/UoQttbR+/7BmRpwLZWi2YAqPXVOJo/lo
   6AcSIzGNgwwZ6mhfMK+G7ktrNZDdG6X0biRRN6Yg2Wu0F5pX7babQTD1J
   PFaCd5Io/TAHVM0mF19OjcGrMA9hE3b1sAfNVvTB/2AuIHUbWhI0fEmud
   FLza3KwLs4/R+LgNuxuE0C+Vosstzw8DX5bmW4avhk/65oPzJu9eXLVc1
   +GKxCdmhtJHKl8u2mWaLBFNT66dFMgCy9g1tvccNght7Y0Cp7BzVyb6Md
   w==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="170313668"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 13:14:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 13:14:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 13:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h898lVtx4wOu+nAln2EB2eHRGh93g/en9LqeWexEtKzaLSjVWk2NHzHMacbIMWSUSTGDziHdKnXN3liZvnDSuw9qwZvcJkJYcuuYJVJ8FCqVO5GRb6xpwL8+f7VBcP1wPWnZcsyYMIuCDiQGiIVYNPDp7VnPeuZFDCPTu3YelY7W8lI7mak+OlzhrxqAtyf/UaLWauZs21+F8BdZ72+5AC9uO9vAJbum6PhmIvhuF5j884el52gkkDsREFZm7EjSLClU1+H1Yl5amTQBsIx56iGzaFiuiTtgEANfwW0XIvt9ADyl4CQm0AZL77mVDsus73MBXAy5TbT+jNZ/cE0+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oMVQm4fS+av6oDmDFASzGhMnZqUD405Scp47h9X8f8=;
 b=CcmnfO5LDG33ndoZkBPs2g6vMXjgak/2hfjpg80lkzyMcURgNMDJ+d+cvV8boGnUfz9KmKAJ/Gx4ogXz4WbbRTvw9PC22rvdh9s1o/FEwqeKCBEUSgHQl6EVQUun/R8BbZLM9fcmWycR7zAv3nDjx82e2klBdk/lS+fKnCISt3pPELBETbIWMh2WwEGhjCeLON6HVJNRQbv4CPiW02jjr4Y82A4hPc28LPcuLQvwQNWGP/92kN9weWCJtGaQDFdvbJgA8hKko3tNhLQN7/wF2P64pTT00Fk4s+WBhFtFxBJozOQhax7WuA3v5CuExDyT4AclER71cLMnMyLAb8wEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oMVQm4fS+av6oDmDFASzGhMnZqUD405Scp47h9X8f8=;
 b=WTiCw49nzkW7LNBSgMg3DBJHcWSdgI6R6rTKbjJky/FwfmrrB16e7kP/HQvUu++P1ZBcZdmCZ0EtVTXspXKZGaYNXUu8qV5ls9k2c1gh3PTQptZlInf0ejjWgWSH0S2fSJ9Lg1OREiUCHjPm9HWocycmBxMXN00VE8LigMr+7/8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 20:13:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 20:13:55 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyAgAAEPgCAAAqJAIAAMFoAgAC8ZgCAAGP7gIAAEAqAgAAdSoCAAA0zgIAAAdqA
Date: Thu, 30 Jun 2022 20:13:55 +0000
Message-ID: <ddb8238a-003e-fe5a-2a11-cb34c324fb33@microchip.com>
References: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
 <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
 <20220630200717.zlc6z6zcqbsw7euk@bogus>
In-Reply-To: <20220630200717.zlc6z6zcqbsw7euk@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dc8fa1a-09f2-4a9b-5b97-08da5ad50f57
x-ms-traffictypediagnostic: SJ0PR11MB5895:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rjE/WxOyEH6rLOL1USiiDQ9XfcSfCchAX5RWzC+f0dg/LkdvDBOnbODGK/D172lPweb6Wz6gfgsWcoPxsbNm0TIPFlq1VanYLiyahwK/jLFoB3oAy3Ol7SNlNPInhM+66FpCG3RpgZGq0bra3eq9cEWILnuC4fO9NGU6sWSk/JeiEEx3ewTohbAYDha97ANV75P7kzfaBt15GmqZrkN1Ek36LSmh/i/5ARwPVDTK0MnYQDZvTfXFDODugxr91+HyHy8MpBS0IBA2Cx1N/HSHvJ/OrrzlfXwSzK2rw6I5zP++J7ZNE+YonstKqszdyh8AEOeM0CotNNrLQ8boRNnpQy7nTlZ5wHV3I8fG8X+iY6V2IrzvYPUAN9U7ohivWZ/fjUseA/qF8l3YkpomfrpxhS5LjUhWnYFDWB1H/K1hOwKW4SaVDxKwHuQ6Gtd1Z7I/lyo+KMNkWUJFWtM1cxU1uq46H6hKfPCTtaP4Dtp57nTRfR9m0sgRSOEfNTNyEKkZ2BmM1MdArBq6iTWN15QFMJs2W/pwc9rbQ79WMw0jq+s1YZgg0z2Jh17lbKBAZ6DyPwuL+dfcLYzdX7W/T1dbqwyc7DTAxg2eCJ32JjrGZaG/WkVjazwNGlxlm061rcgof7vhLeL2886HQqzSLXtHvWePrvRiOvUVw5yj4eVKmCqu+aZ6/vZbgGdTBVgU1dhW+ZjpSNFL2sSI+FI4DyXz5tAXgxIsh8MOuTeX8MTAcjuUsXF2BeumDh6snPuDxAKpwGO8r4IZKUUA28h5Sn473RmSLFuAnKt/to0on2jQxc1KIPsiFYv2f8aLOCyMqnIez5Xn56AEE9Wmn/x7kETpHM6qCsSm3rsCGBwt3PzXDZ0bTd/62w19DkVGzxKgdqhsQbgMeKSkKKoTTAAuoWf9tN4VMawnQ0kIvIMBEfv2G4o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(136003)(346002)(376002)(8676002)(66446008)(4326008)(966005)(66556008)(76116006)(2906002)(66476007)(64756008)(66946007)(91956017)(8936002)(7416002)(5660300002)(6486002)(38070700005)(122000001)(478600001)(71200400001)(54906003)(2616005)(186003)(31686004)(316002)(107886003)(38100700002)(66574015)(36756003)(26005)(6512007)(86362001)(31696002)(53546011)(6506007)(83380400001)(110136005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE1zSXRHOFV0OUVUSXRNM1ljQ2dNVFcyeit4U05ZOFBVYlRkU1gxKzlNazJr?=
 =?utf-8?B?SFJIM05qaE54MFRiOTgxeVFUd3BsTjE1aTR0c29XODFiVXBBRnNiemZUT0dj?=
 =?utf-8?B?UFNna2F6UzhsUE14Y29wQnR0WkV2eXRSMDUvVHYrRG96d05pQlhaU2cyWGxG?=
 =?utf-8?B?Rm03ajJGYmUrYzVxWTM0YjF4ZzJCL1lFNXNXSzVlS3IwN2U0cWpwcEpncFpB?=
 =?utf-8?B?dnZwTk5oTWprL0U1alBJRWNWcmRBSFNNYU5KNVVHVE9LWTdKT3VPaTlQbVpE?=
 =?utf-8?B?ci9XeTBVV0Q3U1I2am9UenlEaDRxakw0VUExQ2dxVU80ekFoQ2h2eFVNTENx?=
 =?utf-8?B?U2dzenhpRGhRdUJhNis5YVJjbWVocGZ5RklhK2ROMUdORkg4NTBUekNwRWcz?=
 =?utf-8?B?WGMrQ2hCNEVLVkt6REJVRHVnM2QydEp4eVZpQ2grcTFZeUVLWHMwSE5yUjk2?=
 =?utf-8?B?S2NjTG5ncmE3U0R3c2pXbVZCYWdRckpLb0FPc24wY3JlbFRldHdrVndOL2VB?=
 =?utf-8?B?Z1BwQjgrTUpsTEc5Q2JxTXJPWEN6NG85RmJHNTRjZlhqT203NjRpdmU3NytJ?=
 =?utf-8?B?WisyRVJmbnRsaUN6Mnc3UlFIUGJTaktTYlBFc0IvcEljVWdPYTZLTkoxK3BS?=
 =?utf-8?B?ZWk3dVYvdXJIQXNrSVQ2TnRPa2xITlNTOGhkcDJKTFhWVE80K1dtbnpYWFJ3?=
 =?utf-8?B?TjR3UWQ0a3dHZFR6UEtLaXMvOFpRdThLd0pQZ1NITnpXNVhHUUZVWmdXeVB6?=
 =?utf-8?B?VlE4VUl4TGcwbzNJdWVEUWR6ZUFKcXBEUjhzMG1sT25KWCtXb1Izekt0TndG?=
 =?utf-8?B?S0tCVzQycnp3ektoZnRGMjhaOU1pbzlBc1F6WTN2WXMvOHdsNCtJcWtYMFVl?=
 =?utf-8?B?aHBuM0NLeVkyM0R5RGRmTnF4Uk05QmRqSVJpNmJSS3l3dXE0Qll5ZnZTdUxO?=
 =?utf-8?B?bG0za3A2UHBEN3o4Tytod0ZlTWFvSUdjbUNFbytPOTBUa3F3a3V0QXlRMXQ4?=
 =?utf-8?B?RUZVazlUVUVPb3FsMXhUaVdQRjRrSHpBR09XbytFeXNuakZyNnpHcERCdlNy?=
 =?utf-8?B?eGY5Nnh0dHYva1F5eU1EUzUvQWkyRTR2RFNTdTdBeWJXL05WYnNWdVlGVjZi?=
 =?utf-8?B?L2hBYjU2ZTVUZjFGTEhFMjRoNXJLa1VOWVIvZFYxazFaTTlleEtIUUFyWUNy?=
 =?utf-8?B?dTF6QndBeEVwbU42bFNtTDIxUmI3Y0NlZDBzYTZoWmdJQmgyeVkyaUpwcGFM?=
 =?utf-8?B?WFArbnVHSWhoMXR2K1dLaEZRazNrL3dsZXRkYVNTTFBBcUtmQThQdEk4aG1N?=
 =?utf-8?B?YU5ESC9uMGlGSFdZeFZUQWZUKzBEMkpLaTlHNFRNb3djMmlFZjlLeUFId3Bz?=
 =?utf-8?B?OTNWM2xsaHVnSTdRR0pFbk9UOGVGelVzNzRmSGZ5eUp3bm5ZdS8rTU9ncFlj?=
 =?utf-8?B?b2pSTk8xSEx2Y2tCSDFXM1h3SW9BenQ0TzFkUXdqaFNoRUZwRERJRG1vMFBZ?=
 =?utf-8?B?ZXIyLzJaWVNHdStudURESkwvVkpjby92K2tGY3lXbGRxbFFoWlZLcS9Ya3lN?=
 =?utf-8?B?aHBXWkhpZmczUkJQdm45dEVySmlTcmlkTzJURExyOXFjVWF6UEovYnF5SWRq?=
 =?utf-8?B?Mitxb28rQ2NSc1RKK3MyL3labWd3SzlBSVI3ODVzbjRrZklPNzEvWkFTYjM2?=
 =?utf-8?B?czMydnZ0Z1Y5SDFTM0EwT3phYjlIOC81UHUwc1RGczNwakM0SXdqMzdXS2ta?=
 =?utf-8?B?Q1RFZW5xZlN4NllEWFdXdHMyak1zOGptL01CVCtZazFYZURsdUU4M29SMzVY?=
 =?utf-8?B?UkhRY2g2WERJRUNmRFFRZ1lSVXVMRFNoSzYycGJLd2NzUHd5RDIvby9icXRq?=
 =?utf-8?B?VHVIL2RvSVBpbGlZT2lwZENpcE8zU0VYaHZ0RHE2aU8xeVdxeDB4SGZrY09X?=
 =?utf-8?B?ZXNnWWJSdkw0d2c4NnJnVWFmSFVJQ0VKR0xwaTdBeHM3QjVBYkI1QkwrQ25J?=
 =?utf-8?B?V3FEQ2cxVzdDK2RnWGx5dDBVVW5YYlhDa3NKc3ZSZXdCTnhaeDFZU0I1NEh1?=
 =?utf-8?B?QXhhb202U25tYjdJM2JVRDVrVlNqa3ZXcUIxL0pzdklRZFBPc3Nqb2U5VjA5?=
 =?utf-8?B?WkJlV083MEJ5V1gzelJGZUFVM1kwMFdNczBwak5YUnRhVVZGaTJsaEdDdHRJ?=
 =?utf-8?B?N0E9PQ==?=
Content-ID: <4194F1C1A3FF0349A3FDF2A7D221A9F0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc8fa1a-09f2-4a9b-5b97-08da5ad50f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 20:13:55.7638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vheoykh3NLQn5rcF6OKaiw+j+Yf/2otg38G75rMIwnL4v6Ko7j3ulDMxQptNmQN2StvXkjIBIut644AwLg4t1Os2Rht24LjEkbW1t8ap2vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_131403_865854_F0EFA08D 
X-CRM114-Status: GOOD (  28.21  )
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



On 30/06/2022 21:07, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 07:20:04PM +0000, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 30/06/2022 18:35, Sudeep Holla wrote:
>>> On Thu, Jun 30, 2022 at 04:37:50PM +0000, Conor.Dooley@microchip.com wrote:
>>>> On 30/06/2022 11:39, Sudeep Holla wrote:
>>>>>
>>>>> I can't think of any reason for that to happen unless detect_cache_attributes
>>>>> is failing from init_cpu_topology and we are ignoring that.
>>>>>
>>>>> Are all RISC-V platforms failing on -next or is it just this platform ?
>>>>
>>>> I don't know. I only have SoCs with this core complex & one that does not
>>>> work with upstream. I can try my other board with this SoC - but I am on
>>>> leave at the moment w/ a computer or internet during the day so it may be
>>>> a few days before I can try it.
>>>>
>>>
>>> Sure, no worries.
>>>
>>>> However, Niklas Cassel has tried to use the Canaan K210 on next-20220630
>>>> but had issues with RCU stalling:
>>>> https://lore.kernel.org/linux-riscv/Yr3PKR0Uj1bE5Y6O@x1-carbon/T/#m52016996fcf5fa0501066d73352ed8e806803e06
>>>> Not going to claim any relation, but that's minus 1 to the platforms that
>>>> can be used to test this on upstream RISC-V.
>>>>
>>>
>>> Ah OK, will check and ask full logs to see if there is any relation.
>>>
>>>>> We may have to try with some logs in detect_cache_attributes,
>>>>> last_level_cache_is_valid and last_level_cache_is_shared to check where it
>>>>> is going wrong.
>>>>>
>>>>> It must be crashing in smp_callin->update_siblings_masks->last_level_cache_is_shared
>>
>>
>> So, looks like there's a problem in cache_leaves_are_shared() which is hit
>> by the above path. Both of the if clauses are false, and the function falls
>> through to return sib_leaf->fw_token == this_leaf->fw_token;
> 
> Both if() failing is expected and that statement
> 	return sib_leaf->fw_token == this_leaf->fw_token;
> execution is correct.
> 
>> Both sib_leaf & this_leaf seem to be null.
>>
> 
> But this is wrong as last_level_cache_is_shared checks for
> last_level_cache_is_valid which must return false if the fw_token = NULL
> So we must not hit the above return statement with NULL fw_token.
> 
>> static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
>> 					   struct cacheinfo *sib_leaf)
>> {
>> 	/*
>> 	 * For non DT/ACPI systems, assume unique level 1 caches,
>> 	 * system-wide shared caches for all other levels. This will be used
>> 	 * only if arch specific code has not populated shared_cpu_map
>> 	 */
>> 	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
>> 		return !(this_leaf->level == 1);
>>
>> 	if ((sib_leaf->attributes & CACHE_ID) &&
>> 	    (this_leaf->attributes & CACHE_ID))
>> 		return sib_leaf->id == this_leaf->id;
>>
>> 	return sib_leaf->fw_token == this_leaf->fw_token;
>> }
>>
>> Any ideas what to look at next?
> 
> I wonder how did we not get last_level_cache_is_valid as false if the
> fw_node is NULL. But it should not be NULL at the first place.
> 

I didn't have the time to go digging into things, but the following
macro looked odd:
#define per_cpu_cacheinfo_idx(cpu, idx)		\
				(per_cpu_cacheinfo(cpu) + (idx))
Maybe it is just badly named, but is this getting the per_cpu_cacheinfo
and then incrementing intentionally, or is it meant to get the
per_cpu_cacheinfo of cpu + idx?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
