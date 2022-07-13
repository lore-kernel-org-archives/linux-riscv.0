Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A49DC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=028kKBP3EybI5GYJl4hy211zcfo4e1xEDIxXBa6ZEy4=; b=2rc3X7qFGOM3QJ
	e2nGvaPyP+RzHPwsL84lBgkyR4Um6o65elG5rMFswTeZqK3Hbg/0z4aHU8xQ5Np0YMSQvtlI5RxW4
	1yuWadOPIq8b2WCQX+ounnFvIiwRKPE8tkLtuAtKwXIa/OoZz0jgeLASkwIOpaN+e0hFMKtM+dE2f
	Xm5eGMA7bwSyX3OMkHZ85RZlarpKN2GSOxYQrjOLmUx0xgczLZrTJYxm8afySFNqh/wRI3AfJKe7r
	M7heXMqBySoX49q5TN28tODoRFnk26J9l6dhlI+jTxaW7I/OCt01imk+syFCQJgEwHWMPECtzWXDM
	tVutIxz9AuR+zJY+j/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBY93-001rnP-Am; Wed, 13 Jul 2022 08:54:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBY8y-001rjB-PB
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 08:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657702492; x=1689238492;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EnkAiLmdRtxZF25w4uQ6DCdaA972SMesEKRhU/QgGow=;
  b=s9HXhenUDfWAfLhuAQra4n7scVW6b/MIFLuRF8aP8v+Jsw0/Jxl/d4DY
   wucCAz609La8ZK+84iJoCzcU4RdyO6HU6zTdlWanE6EmV7oXIul3peV3B
   cnWM1TH8Ti6RbmDwfVpQbSV0KSnp4Mh3MuIuLYamhj5FSBV+ttYyvZc9O
   llSllX10TqTNfI722CQjQFO+ZGZwY+opCrJDTZltRI871DQk7qZ7zx2Fb
   UdnjadfaEwxAr6Tw+Yk+Dfy0U9OIyOkKmYhPYAr8+wt9a/0waw3Fp0JJF
   79HtPVUR7WCqcCQa+xRzvAJhNSFv0s1oBV95EbSYcCp8K7BkgsDWeT+JB
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="167606916"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 01:54:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 01:54:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 01:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7p2hcWxVEgR2osKWh51+ynG4Ki4tNXrZ9/PzURqASAC9/VUDxdD53yUFI1WXw1QsPz+A/LXFNM6LCu9ZeidQHJsWsvxPcCsQDMOVPxd/mra36h8oynOXiJdPToszK+Wm2jjsoBrOOrMnVp17QH0I2Gm/SFR5PErU8bARzrwbzw95ueh3+CJRMpcQKcH5nievHlGu4YeNztjCo37kPvgWo2YVrBVbqWU2TSqSoybbhaOw+YIpLDHzdqmLx4kkiEd37ytvRGs9isr78VsmXk0GEgDH4nuQJzxVaOIBW7ByIHIDF60pBNPkxNXnaQfuZ1TKmHkDYI9/11NBYrjvGyAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnkAiLmdRtxZF25w4uQ6DCdaA972SMesEKRhU/QgGow=;
 b=G55XcDQ5DYp0GU9NSsLBV93kwPlmkQVjb7B/peWP9idw4dQAalDOCVrQIhpWQoDDknYFDXe/lwaPzY/P3V61t9x8gdRXv2qa5rDWB4cicsZG1hXye45IWRG0N/CrG7c//tsPeZJ/2F6OMrpSSvS+iU75VUDDjUIUsO8sON7txPIHLmZ1v7MIlVamqSnXqgatBKeB93E492W6A7xH8Xv3jX2tBTtKeRmw+8Dyk+gB9fYAqeBuH+CW0ucFZz5wDYtIc9HB0iouBffVQcjS2WRjjDE6H8QG4Rp/C+S/OKYiOTRw7WR8IpJL3Tke1zpN4jdED42RNXEW5N0dHx+Aujl1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnkAiLmdRtxZF25w4uQ6DCdaA972SMesEKRhU/QgGow=;
 b=u4ujDXu/Hn5m3ls5dzj4LI+mMk9PkPuo4DnRXIWhRcb7f2RH+UTqeBDQ69zeyCiw1Y5x08SnHtWrz9d56f483sR7+csWJHvUy2n+MSooFF/z8vep4z7z4iwwIlDDKg5c7JjUFcoNYJCIv4Di4L5oLEr7ZUMeCUz/RJb7+FG/j+Y=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BY5PR11MB4467.namprd11.prod.outlook.com (2603:10b6:a03:1b9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 08:54:47 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 08:54:47 +0000
From: <Conor.Dooley@microchip.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v6 3/4] pwm: add microchip soft ip corePWM driver
Thread-Topic: [PATCH v6 3/4] pwm: add microchip soft ip corePWM driver
Thread-Index: AQHYlftutkb03ZS7CE62xip0d2IE2a18AH4A
Date: Wed, 13 Jul 2022 08:54:47 +0000
Message-ID: <c49776c2-4807-91c1-010a-a33bd98b68b7@microchip.com>
References: <20220712142557.1773075-1-conor.dooley@microchip.com>
 <20220712142557.1773075-4-conor.dooley@microchip.com>
In-Reply-To: <20220712142557.1773075-4-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebfb92ef-2a35-4743-de2a-08da64ad56d8
x-ms-traffictypediagnostic: BY5PR11MB4467:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YEpd7cdlyIEBubKqdOI+UAywNIvGMDS4p3VmcfIKRjfa9FsllkYVUN5hbd6uSb7JIOSdQi62eqwTUCSKoYiFjKHvMz4GDKVaYP4FlimECkTvLtVbNctYFFjPgqfCuDro7uEmLB7v0th/xgp5h9t6jnLbPwKsyQ8vrVTl0PKGVHBp2n9Fp0aKrvIr7lTvdR6uywM0Pyln+CzoA+p49MR5wH0+7+/DyAmSukMLRwKscaor7NlwgsqXCMjp1VM4mHK4FhWqk3srQynLHDzGDKNvRIg7Lor5CgyS3XIAjDdIV0qs2auMMCTO+j12t3H3qrOD/pkWT+Za7Mnq5cjclbVXf7LX8ZjTG9zU1CGUj32A44s9KX7TbiTVobVZ6bhkejdsiPPs8MyKJAqOQ5h7phZo881BrUYkYfIF33HPOo4v5j7WsVulELow6wSQX37fVoa88YESqaInE1f11utRPijM/Es0PRrK4F5Ha9Q83tE1UM6xl8K+CRPHc5iyM6GFb1QSaJ7ucI9AUv0yxbHPWrOZuMh2opIY8AK5cEqX1fIOswp8SoU0kdXJNEBStfu83PFBTa147VDTSv1S/DJ7lNQUoH/VenUy7HeDOxHhw5QSgdUP6HRToO/CMoRgyXBqfWklZPZ971gLE3osC2U3rehNbUptAvg7U+5CCzeS4UEE/0N6TyeS7KlnO5/h97vX/e43QIe2eZR0LyXGK6VtzSV6bXX0Himic8gwrazKoCST7281OQAlaP+5EqkW1Z7bVGSsWLXSWAhQLbTEg4aKzUfkIjA3lGDyHoaSlO+SUpADPV8tltmmIPQtqPURBM8EpdJyMTJY1hsqeO5nEwK0xUBKn/e26+Vc/yj8qmQKEmp/IAXmZTpIB/uWzZbrXnIqVttOGRDRkNgUGJSXW6LcRA9X+m/ugyo93iqPeqLinprAQfzWvJlYUvcUBgp23tOmUmvx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(39860400002)(136003)(376002)(316002)(6506007)(26005)(91956017)(478600001)(2906002)(86362001)(8936002)(41300700001)(966005)(5660300002)(6512007)(53546011)(6486002)(2616005)(31696002)(38070700005)(38100700002)(122000001)(76116006)(83380400001)(64756008)(4326008)(66476007)(30864003)(71200400001)(8676002)(110136005)(66946007)(54906003)(36756003)(66446008)(31686004)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUNBK25Wa0lRMmxzMlZrRnpvbUUxQkZ0VFJydTQ4QkRCK0F3R1d1U2FZbzA2?=
 =?utf-8?B?U1BnNDZUdXFmdzlTekhzRkpUbTBPb3ltcjV1T0h6ZWZ4T2JsRHQ5UFJqSHJq?=
 =?utf-8?B?K2dSVTlpdkZ4T2lNOWd3MWlvT25NaTBpNW9IRzBrVkZzWVRLcWJGMFBpQW1T?=
 =?utf-8?B?bk5pTENydkhPdlZWK2t0WWpydnUwUVJ3SzVWaVcwTnZFK0VYRzVJQUFYV2Qv?=
 =?utf-8?B?L2laVFV1UDk3N1g3K1cxUVJ6VkZtSVZqQXBqdU9yWWF3c051MGZvanA2OGVr?=
 =?utf-8?B?Vm42NzRDQ1FkcldmdC9nWlpsM0dwcTFTRGdTSjVhZDd2TUZJNk1iSmpMM3BF?=
 =?utf-8?B?MVRSVXRnUWlaUjQyYU4zbldoMjRzUXNSbGJqSEd4bjk5WUJEUlZDVXo1M1dz?=
 =?utf-8?B?MWZJZUM1YWVIUlFyYjBaK1hOMzdjZDlvVTRteVE5bE5wVWVDTmRseERKWmhL?=
 =?utf-8?B?QS94ZXpEcnVrcStoMUdtQnNBTWMyVlMrQzBVTGNUMHFia2dtVnJReHMxenBn?=
 =?utf-8?B?ekFqbk9NT3lsalpVbE9nbENJNmtGQ0YxZUdvajY5ektENlZmRlJsWXhZbGI3?=
 =?utf-8?B?RWN2MjQ5UGxTazdSYzY4ZjJkaTU1d2UzaWY1TExySmtLSXgrNzJwQXUyazJa?=
 =?utf-8?B?aGZlN2NMek9KZEIwRS91aDRMcFh3cTc3TXRsUDlMVnhCcnZKcFhaMXNmVElZ?=
 =?utf-8?B?dW4vYWQ3cUozdXZySGd4ZWh5T1c3aFYwZWQzT0Z5Q0doK2hGRVo4WjI1djh1?=
 =?utf-8?B?ZngySFJLMzBPVmduNWFHcFBmVk5oVGhSUnVWQmpURDNpZ0tVM3lNdmludmd2?=
 =?utf-8?B?VUgxQnpacHpUN1hYNjd0WEZuQVpmUW1mR1VXK2JNdjBHaUdaMkJpUW5FbmNJ?=
 =?utf-8?B?L2dBdzFCSFB0dE1qK2kya0dtWHlMNGhsRUZNSnZWWXVhOENFZC9lVmtmbGpX?=
 =?utf-8?B?Q3Q3Qkg5NEhBUG5CaU9tWU1QM1AwNEc0Qng3djFxNGtjeHZOSzQwZ3FBTmxx?=
 =?utf-8?B?VWsvMnhaUlR2WXRPZ3FlOVUzYlhBby9LMXM1a2V1UklqNXZFdktzdHRZeWdR?=
 =?utf-8?B?cWRvUFdVQlp1VExRY2ZnV3V3LzIxUkJKWDc3NG5iVTF1VTU5eEhtN3NWa0wz?=
 =?utf-8?B?S0t4dkhmUW9GYTczZUJJN1RvZ1poRE44dkVycVpwSkZNQjN5MS9WMGdVZG0x?=
 =?utf-8?B?Ny9CcGlybVNoZUErejlxTTQ3ekVYaGhueVhFSkEzcGtHVjlXcmgyNDFVM3Q0?=
 =?utf-8?B?cytOYmpNWjl2MUw1V3piS0pnVFdDL3lLZ2luVUJEZ2pwVkl3aEZ0V2hxNWR4?=
 =?utf-8?B?ZFJsci9MR01xOVJBQlN1LzRBTFkzb3RnZ0xwd21ORjJ1c0sxVDZtMUhGd281?=
 =?utf-8?B?a05LWXZETytXT0tGT1UwY0FKMFFPY2NCN2h1RjlDUGtFUjM2S251S09ha3U0?=
 =?utf-8?B?eXZLT0IyaiszWVVrVExsQTdUUUY0S2Qwb29qQnA5UlluWWxBcy9ZTHRoSXM1?=
 =?utf-8?B?ekE2aGlGMWxQeTFlRWNVTi92QmZPQkdLK3hKdGZZdjhLM0daZytic2dpSmlw?=
 =?utf-8?B?Q2pKZ25HRDhzZ3JJUGlRcDFlVzEyR1J1QU1adFhGRHM0MkN2NUE3VzhuR0V3?=
 =?utf-8?B?ZmxsSk95cmkvc3JreDFOZE8yZWZWK3paT3o4Z1F3aHl4Z0wyVzdNUjBTVjNN?=
 =?utf-8?B?K0pjR0ZCOXVYcXB4TXJPVzN4VDg4WjZNL2tEaHNiUG5ESzdPMlp4eHo2cjRu?=
 =?utf-8?B?NG52MmVPVUNFTERDNTk5SzRUMHhrZjZBMDVOTzhIMEdUL3dBVlNkbEFQQ3hH?=
 =?utf-8?B?Y1lJaE1EZEZheWtPSGNIbEpTd3U5Skltc203cWRCdEJYYS9ZREdZUUxPeWRF?=
 =?utf-8?B?aUZJOWZMNHhVc3VsYmNWeUYzZ0V1NUptSU9YZytadzlBbWJkdGcyVUd3R0RH?=
 =?utf-8?B?TVlkTzRLYXhzbWIxb0xpOU1McTBMaGxtdUhsU20zSXIvTHdCeVV3ZDBmWDl6?=
 =?utf-8?B?TndHKzZEbzdxY2M5Qmc3Z1l0MGU4bTBxSjVFcWVZOFE0NnJDeDk3MEpoWVZ2?=
 =?utf-8?B?SHZUSFk3V24vZGV1NzBzNENqZnRNYlF2eklpTGROK0lld0xoOEY2aWUwS1Rs?=
 =?utf-8?Q?OVXePG14HuKw+0tIXd21H1eud?=
Content-ID: <E01EC61D67606341BB9B5B1B46D3CADE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfb92ef-2a35-4743-de2a-08da64ad56d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 08:54:47.5207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4tUnA86QMvLIkTC2eMHB/F7rs0yTnjlnsDuJu6+lLmMvrlp5ehJY/aXMDXZojrToXb3tmQJvJErEs/zNGIkOswvFBjaqSL1MktRcUFcuHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_015452_996068_79CCA0CC 
X-CRM114-Status: GOOD (  27.73  )
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

On 12/07/2022 15:25, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a driver that supports the Microchip FPGA "soft" PWM IP core.

Looks like there's a couple W=1 warnings about the mutex use, I'll not respin
until you've had a chance to have a look at this version.
Thanks,
Conor.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/pwm/Kconfig              |  10 +
>   drivers/pwm/Makefile             |   1 +
>   drivers/pwm/pwm-microchip-core.c | 370 +++++++++++++++++++++++++++++++
>   3 files changed, 381 insertions(+)
>   create mode 100644 drivers/pwm/pwm-microchip-core.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 904de8d61828..007ea5750e73 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -383,6 +383,16 @@ config PWM_MEDIATEK
>            To compile this driver as a module, choose M here: the module
>            will be called pwm-mediatek.
> 
> +config PWM_MICROCHIP_CORE
> +       tristate "Microchip corePWM PWM support"
> +       depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
> +       depends on HAS_IOMEM && OF
> +       help
> +         PWM driver for Microchip FPGA soft IP core.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called pwm-microchip-core.
> +
>   config PWM_MXS
>          tristate "Freescale MXS PWM support"
>          depends on ARCH_MXS || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 5c08bdb817b4..43feb7cfc66a 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -33,6 +33,7 @@ obj-$(CONFIG_PWM_LPSS_PCI)    += pwm-lpss-pci.o
>   obj-$(CONFIG_PWM_LPSS_PLATFORM)        += pwm-lpss-platform.o
>   obj-$(CONFIG_PWM_MESON)                += pwm-meson.o
>   obj-$(CONFIG_PWM_MEDIATEK)     += pwm-mediatek.o
> +obj-$(CONFIG_PWM_MICROCHIP_CORE)       += pwm-microchip-core.o
>   obj-$(CONFIG_PWM_MTK_DISP)     += pwm-mtk-disp.o
>   obj-$(CONFIG_PWM_MXS)          += pwm-mxs.o
>   obj-$(CONFIG_PWM_NTXEC)                += pwm-ntxec.o
> diff --git a/drivers/pwm/pwm-microchip-core.c b/drivers/pwm/pwm-microchip-core.c
> new file mode 100644
> index 000000000000..3e28868ee499
> --- /dev/null
> +++ b/drivers/pwm/pwm-microchip-core.c
> @@ -0,0 +1,370 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * corePWM driver for Microchip "soft" FPGA IP cores.
> + *
> + * Copyright (c) 2021-2022 Microchip Corporation. All rights reserved.
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + * Documentation:
> + * https://www.microsemi.com/document-portal/doc_download/1245275-corepwm-hb
> + *
> + * Limitations:
> + * - If the IP block is configured without "shadow registers", all register
> + *   writes will take effect immediately, causing glitches on the output.
> + *   If shadow registers *are* enabled, a write to the "SYNC_UPDATE" register
> + *   notifies the core that it needs to update the registers defining the
> + *   waveform from the contents of the "shadow registers".
> + * - The IP block has no concept of a duty cycle, only rising/falling edges of
> + *   the waveform. Unfortunately, if the rising & falling edges registers have
> + *   the same value written to them the IP block will do whichever of a rising
> + *   or a falling edge is possible. I.E. a 50% waveform at twice the requested
> + *   period. Therefore to get a 0% waveform, the output is set the max high/low
> + *   time depending on polarity.
> + * - The PWM period is set for the whole IP block not per channel. The driver
> + *   will only change the period if no other PWM output is enabled.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +
> +#define PREG_TO_VAL(PREG) ((PREG) + 1)
> +
> +#define MCHPCOREPWM_PRESCALE_MAX       0x100
> +#define MCHPCOREPWM_PERIOD_STEPS_MAX   0xff
> +#define MCHPCOREPWM_PERIOD_MAX         0xff00
> +
> +#define MCHPCOREPWM_PRESCALE   0x00
> +#define MCHPCOREPWM_PERIOD     0x04
> +#define MCHPCOREPWM_EN(i)      (0x08 + 0x04 * (i)) /* 0x08, 0x0c */
> +#define MCHPCOREPWM_POSEDGE(i) (0x10 + 0x08 * (i)) /* 0x10, 0x18, ..., 0x88 */
> +#define MCHPCOREPWM_NEGEDGE(i) (0x14 + 0x08 * (i)) /* 0x14, 0x1c, ..., 0x8c */
> +#define MCHPCOREPWM_SYNC_UPD   0xe4
> +
> +struct mchp_core_pwm_chip {
> +       struct pwm_chip chip;
> +       struct clk *clk;
> +       struct mutex lock; /* protect the shared period */
> +       void __iomem *base;
> +       u32 sync_update_mask;
> +       u16 channel_enabled;
> +};
> +
> +static inline struct mchp_core_pwm_chip *to_mchp_core_pwm(struct pwm_chip *chip)
> +{
> +       return container_of(chip, struct mchp_core_pwm_chip, chip);
> +}
> +
> +static void mchp_core_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm,
> +                                bool enable, u64 period)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       u8 channel_enable, reg_offset, shift;
> +
> +       /*
> +        * There are two adjacent 8 bit control regs, the lower reg controls
> +        * 0-7 and the upper reg 8-15. Check if the pwm is in the upper reg
> +        * and if so, offset by the bus width.
> +        */
> +       reg_offset = MCHPCOREPWM_EN(pwm->hwpwm >> 3);
> +       shift = pwm->hwpwm & 7;
> +
> +       channel_enable = readb_relaxed(mchp_core_pwm->base + reg_offset);
> +       channel_enable &= ~(1 << shift);
> +       channel_enable |= (enable << shift);
> +
> +       writel_relaxed(channel_enable, mchp_core_pwm->base + reg_offset);
> +       mchp_core_pwm->channel_enabled &= ~BIT(pwm->hwpwm);
> +       mchp_core_pwm->channel_enabled |= enable << pwm->hwpwm;
> +
> +       /*
> +        * Notify the block to update the waveform from the shadow registers.
> +        * The updated values will not appear on the bus until they have been
> +        * applied to the waveform at the beginning of the next period. We must
> +        * write these registers and wait for them to be applied before calling
> +        * enable().
> +        */
> +       if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> +               writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> +               usleep_range(period, period * 2);
> +       }
> +}
> +
> +static u64 mchp_core_pwm_calc_duty(struct pwm_chip *chip, struct pwm_device *pwm,
> +                                  const struct pwm_state *state, u8 prescale, u8 period_steps)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       u64 duty_steps, period, tmp;
> +       u16 prescale_val = PREG_TO_VAL(prescale);
> +       u8 period_steps_val = PREG_TO_VAL(period_steps);
> +
> +       period = period_steps_val * prescale_val * NSEC_PER_SEC;
> +       period = DIV64_U64_ROUND_UP(period, clk_get_rate(mchp_core_pwm->clk));
> +
> +       /*
> +        * Calculate the duty cycle in multiples of the prescaled period:
> +        * duty_steps = duty_in_ns / step_in_ns
> +        * step_in_ns = (prescale * NSEC_PER_SEC) / clk_rate
> +        * The code below is rearranged slightly to only divide once.
> +        */
> +       duty_steps = state->duty_cycle * clk_get_rate(mchp_core_pwm->clk);
> +       tmp = prescale_val * NSEC_PER_SEC;
> +       return div64_u64(duty_steps, tmp);
> +}
> +
> +static void mchp_core_pwm_apply_duty(struct pwm_chip *chip, struct pwm_device *pwm,
> +                                    const struct pwm_state *state, u64 duty_steps, u8 period_steps)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       u8 posedge, negedge;
> +       u8 period_steps_val = PREG_TO_VAL(period_steps);
> +
> +       /*
> +        * Turn the output on unless posedge == negedge, in which case the
> +        * duty is intended to be 0, but limitations of the IP block don't
> +        * allow a zero length duty cycle - so just set the max high/low time
> +        * respectively.
> +        */
> +       if (state->polarity == PWM_POLARITY_INVERSED) {
> +               negedge = !duty_steps ? period_steps_val : 0u;
> +               posedge = duty_steps;
> +       } else {
> +               posedge = !duty_steps ? period_steps_val : 0u;
> +               negedge = duty_steps;
> +       }
> +
> +       writel_relaxed(posedge, mchp_core_pwm->base + MCHPCOREPWM_POSEDGE(pwm->hwpwm));
> +       writel_relaxed(negedge, mchp_core_pwm->base + MCHPCOREPWM_NEGEDGE(pwm->hwpwm));
> +}
> +
> +static int mchp_core_pwm_calc_period(struct pwm_chip *chip, const struct pwm_state *state,
> +                                    u8 *prescale, u8 *period_steps)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       u64 tmp, clk_rate;
> +
> +       /*
> +        * Calculate the period cycles and prescale values.
> +        * The registers are each 8 bits wide & multiplied to compute the period
> +        * using the formula:
> +        * (clock_period) * (prescale + 1) * (period_steps + 1)
> +        * so the maximum period that can be generated is 0x10000 times the
> +        * period of the input clock.
> +        * However, due to the design of the "hardware", it is not possible to
> +        * attain a 100% duty cycle if the full range of period_steps is used.
> +        * Therefore period_steps is restricted to 0xFE and the maximum multiple
> +        * of the clock period attainable is 0xFF00.
> +        */
> +       clk_rate = clk_get_rate(mchp_core_pwm->clk);
> +
> +       /*
> +        * If clk_rate is too big, the following multiplication might overflow.
> +        * However this is implausible, as the fabric of current FPGAs cannot
> +        * provide clocks at a rate high enough.
> +        */
> +       if (clk_rate >= NSEC_PER_SEC)
> +               return -EINVAL;
> +
> +       tmp = mul_u64_u64_div_u64(state->period, clk_rate, NSEC_PER_SEC);
> +
> +       if (tmp >= MCHPCOREPWM_PERIOD_MAX) {
> +               *prescale = MCHPCOREPWM_PRESCALE_MAX - 1;
> +               *period_steps = MCHPCOREPWM_PERIOD_STEPS_MAX - 1;
> +               return 0;
> +       }
> +
> +       *prescale = div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX);
> +       /* PREG_TO_VAL() can produce a value larger than UINT8_MAX */
> +       *period_steps = div_u64(tmp, PREG_TO_VAL((u32)*prescale)) - 1;
> +
> +       return 0;
> +}
> +
> +static inline void mchp_core_pwm_apply_period(struct mchp_core_pwm_chip *mchp_core_pwm,
> +                                             u8 prescale, u8 period_steps)
> +{
> +       writel_relaxed(prescale, mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
> +       writel_relaxed(period_steps, mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
> +}
> +
> +static int mchp_core_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +                              const struct pwm_state *state)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       struct pwm_state current_state = pwm->state;
> +       bool period_locked;
> +       u64 duty_steps;
> +       u16 channel_enabled;
> +       u8 prescale, period_steps, hw_prescale, hw_period_steps;
> +       int ret;
> +
> +       mutex_lock_interruptible(&mchp_core_pwm->lock);
> +
> +       if (!state->enabled) {
> +               mchp_core_pwm_enable(chip, pwm, false, current_state.period);
> +               mutex_unlock(&mchp_core_pwm->lock);
> +               return 0;
> +       }
> +
> +       /*
> +        * If the only thing that has changed is the duty cycle or the polarity,
> +        * we can shortcut the calculations and just compute/apply the new duty
> +        * cycle pos & neg edges
> +        * As all the channels share the same period, do not allow it to be
> +        * changed if any other channels are enabled.
> +        * If the period is locked, it may not be possible to use a period
> +        * less than that requested. In that case, we just abort.
> +        */
> +       period_locked = mchp_core_pwm->channel_enabled & ~(1 << pwm->hwpwm);
> +
> +       if (period_locked) {
> +               mchp_core_pwm_calc_period(chip, state, &prescale, &period_steps);
> +               hw_prescale = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
> +               hw_period_steps = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
> +
> +               if ((period_steps * prescale) < (hw_period_steps * hw_prescale)) {
> +                       mutex_unlock(&mchp_core_pwm->lock);
> +                       return -EINVAL;
> +               }
> +
> +               prescale = hw_prescale;
> +               period_steps = hw_period_steps;
> +       } else if (!current_state.enabled || current_state.period != state->period) {
> +               ret = mchp_core_pwm_calc_period(chip, state, &prescale, &period_steps);
> +               if (ret) {
> +                       mutex_unlock(&mchp_core_pwm->lock);
> +                       return ret;
> +               }
> +               mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> +       } else {
> +               prescale = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
> +               period_steps = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
> +       }
> +
> +       duty_steps = mchp_core_pwm_calc_duty(chip, pwm, state, prescale, period_steps);
> +
> +       /*
> +        * Because the period is per channel, it is possible that the requested
> +        * duty cycle is longer than the period, in which case cap it to the
> +        * period, IOW a 100% duty cycle.
> +        */
> +       if (duty_steps > period_steps)
> +               duty_steps = period_steps + 1;
> +
> +       mchp_core_pwm_apply_duty(chip, pwm, state, duty_steps, period_steps);
> +
> +       mchp_core_pwm_enable(chip, pwm, true, state->period);
> +
> +       mutex_unlock(&mchp_core_pwm->lock);
> +
> +       return 0;
> +}
> +
> +static void mchp_core_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +                                   struct pwm_state *state)
> +{
> +       struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> +       u16 prescale;
> +       u8 period_steps, duty_steps, posedge, negedge;
> +       u16 channel_enabled;
> +
> +       mutex_lock_interruptible(&mchp_core_pwm->lock);
> +
> +       channel_enabled = mchp_core_pwm->channel_enabled;
> +
> +       if (channel_enabled & (1 << pwm->hwpwm))
> +               state->enabled = true;
> +       else
> +               state->enabled = false;
> +
> +       prescale = PREG_TO_VAL(readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE));
> +
> +       period_steps = PREG_TO_VAL(readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD));
> +       state->period = period_steps * prescale * NSEC_PER_SEC;
> +       state->period = DIV64_U64_ROUND_UP(state->period, clk_get_rate(mchp_core_pwm->clk));
> +
> +       posedge = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_POSEDGE(pwm->hwpwm));
> +       negedge = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_NEGEDGE(pwm->hwpwm));
> +
> +       if (negedge == posedge) {
> +               state->duty_cycle = state->period / 2;
> +       } else {
> +               duty_steps = abs((s16)posedge - (s16)negedge);
> +               state->duty_cycle = duty_steps * prescale * NSEC_PER_SEC;
> +               state->duty_cycle = DIV64_U64_ROUND_UP(state->duty_cycle,
> +                                                      clk_get_rate(mchp_core_pwm->clk));
> +       }
> +
> +       state->polarity = negedge < posedge ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> +
> +       mutex_unlock(&mchp_core_pwm->lock);
> +}
> +
> +static const struct pwm_ops mchp_core_pwm_ops = {
> +       .apply = mchp_core_pwm_apply,
> +       .get_state = mchp_core_pwm_get_state,
> +       .owner = THIS_MODULE,
> +};
> +
> +static const struct of_device_id mchp_core_of_match[] = {
> +       {
> +               .compatible = "microchip,corepwm-rtl-v4",
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mchp_core_of_match);
> +
> +static int mchp_core_pwm_probe(struct platform_device *pdev)
> +{
> +       struct mchp_core_pwm_chip *mchp_pwm;
> +       struct resource *regs;
> +       int ret;
> +
> +       mchp_pwm = devm_kzalloc(&pdev->dev, sizeof(*mchp_pwm), GFP_KERNEL);
> +       if (!mchp_pwm)
> +               return -ENOMEM;
> +
> +       mchp_pwm->base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
> +       if (IS_ERR(mchp_pwm->base))
> +               return PTR_ERR(mchp_pwm->base);
> +
> +       mchp_pwm->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +       if (IS_ERR(mchp_pwm->clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(mchp_pwm->clk),
> +                                    "failed to get PWM clock\n");
> +
> +       if (of_property_read_u32(pdev->dev.of_node, "microchip,sync-update-mask",
> +                                &mchp_pwm->sync_update_mask))
> +               mchp_pwm->sync_update_mask = 0u;
> +
> +       mutex_init(&mchp_pwm->lock);
> +
> +       mchp_pwm->chip.dev = &pdev->dev;
> +       mchp_pwm->chip.ops = &mchp_core_pwm_ops;
> +       mchp_pwm->chip.npwm = 16;
> +
> +       ret = devm_pwmchip_add(&pdev->dev, &mchp_pwm->chip);
> +       if (ret < 0)
> +               return dev_err_probe(&pdev->dev, ret, "failed to add PWM chip\n");
> +
> +       return 0;
> +}
> +
> +static struct platform_driver mchp_core_pwm_driver = {
> +       .driver = {
> +               .name = "mchp-core-pwm",
> +               .of_match_table = mchp_core_of_match,
> +       },
> +       .probe = mchp_core_pwm_probe,
> +};
> +module_platform_driver(mchp_core_pwm_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("corePWM driver for Microchip FPGAs");
> --
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
