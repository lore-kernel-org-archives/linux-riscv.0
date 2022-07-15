Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19159C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4p1tNvXA1N8WAm1pa1u4qQ5KDr2nqzZc2dQ2s6Cs2M=; b=mdd2pBM+S4kac3
	Pi36hIA2sdnF/zvAbQ1yciQ8xfTwBR0hgl0mx4bq14Tq9yHdgpiXToXHr1QFnVfszqvaWRW6qYWnK
	MqMADOjKc1F+/nYjJrLfCos9jiKDRJUGwiCQ5wNcINLz2jr4bWBwNVUyMQ7od8PjO2wq84mM8ON4f
	Qi2bYwr2tj0xRZ97mLuMRlOaM8/fb/JJU9EXlilGWDFu+iZM56U9XDWoaZWbRwOfZzmhpczrLomdt
	GTWPMDDqYB7St2N1uzr3+riob7DZ9+zoekB8gHMWITk3B6DpzA1xatKeTlFfAkZ/CvOMd6c3NKyoS
	lJsG4H9HIre/XtTs1/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGBu-005APp-28; Fri, 15 Jul 2022 07:56:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGBp-005A9v-8i
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 07:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657871805; x=1689407805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=p+1XQa3yLKJBYUlIurjD6ggr50FFfwPBykWCsFeBYHA=;
  b=CiYqnRsS8AWshz1S+2UhSNBbbws9A2iAqmBl75osI4LAQOa7u+Jz5iJY
   oNJbs6oX2hAMTEcug3R6F11gdnuvwwbwr7jcQM6+9zmOZfxais+rrtplu
   WzF2qrV0zem0Dik7hD2+Wsuv0MGZIlMg6xa0+vaNw1XDCmy8E/0G0r9OR
   w7sQzAvienR37Cxk912IRhIx5f153O3/CAEt+anLMHLPmkHXUmpwT3FkT
   kKfOzpdnzewMBuEus2GZWtU+eheenUtxGscKTxjcAcL0hcAunl5fuxwqk
   qOuUKQ3IGpmNHM+CBXjkoJ7YgXm2CDYU0mfmKbbWcYDaOuoZF83Qb4Xcc
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; 
   d="scan'208";a="172437292"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jul 2022 00:56:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 00:56:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 00:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyMkrMskE9thL9m7JiDSKgLvBut8brYVbnB6wen953hGMECRcdWC4tyrcnGhOu8y5pzvaFSSHqXZvM0VfNR749DclxOtKxC6KDzBj3J2NY8Qk/h8mDSyE+fYWjFyBUMk3d+LB7H5Y6ygWsYk10p8mF6nZHdJT3QY0VnZH/ZSLrROK/6jck5RXQLLttyolx7eJg22qkZfvpu3BZYSCIXqIHCPrXQDBPyBo7KD0wS4BVP/brTe8kLqGNAUXQs4/mzJbv9GSTuae91VT8sF/WoR9Ip59tuAzCTCQE0hsD/EZThA6BRmAHZ6DZ34VRWv9pqXOlLpENtGhqNc/cdJh5R8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+1XQa3yLKJBYUlIurjD6ggr50FFfwPBykWCsFeBYHA=;
 b=d9onGqKnNzNVYtZcr9mE1SLI52lJeKg4bDKLZb3PEiUNGsWHxVyVUzXwhCRDrKY1wGy9hYJmnF4NxfBiSv1M8r18Y1z3y6l2cAm6fLTf6KYBnzAJiAqI6ORK0RetNTIP7xWosMx0N/+AsBwp26jwov0WJttgAGjNHghC1vcpipQ+1e+1nT8BOgUWKusDLRej4Jb8Te/E6eTG7pIA0px5E9ucmmTxMuc5CINO+pZQsz6ZyLB4zpB5wl/f2psYvFrt+MsyrKKBSzyzoWAo+o3AYiti/E+3UmtxveOJw47yDGO1rsZap0/xlZgWT0YqZfH5kxMHPEJtZ3DUwiAgXKGf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+1XQa3yLKJBYUlIurjD6ggr50FFfwPBykWCsFeBYHA=;
 b=U1J8qlUhagoVCmLt8FXreQ5lbDDYMFeUGDckf5a49wgygjwVMQujYvXmocQ+aBcPHzYEWy0BHqJ4fMgR0hVOnj1YyxpMDYhsvczM9KhjgY0OGxQllERIq/+FJBi0NLlKPzHQldMaevbyuFJRBXxfH2UxTbbJ3GKPJ/ys52sk3mA=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 07:56:31 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 07:56:31 +0000
From: <Lewis.Hanly@microchip.com>
To: <andy.shevchenko@gmail.com>, <Lewis.Hanly@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemr2KX1URl4Eaxdmj5tFzD4a18MrcAgALgwYA=
Date: Fri, 15 Jul 2022 07:56:30 +0000
Message-ID: <9deafd52473cd0cf87f1cd6bd0b0ca985668218f.camel@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
	 <20220713105910.931983-2-lewis.hanly@microchip.com>
	 <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
In-Reply-To: <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95b4a6b3-4025-4bd9-9765-08da66378786
x-ms-traffictypediagnostic: DM6PR11MB4516:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wwUbPy+0KN5OdLopid9BXSEchCpZzQgjfsQO0vPF4u9lO9C7zGv6BShXtAJqB8TF53+cmTrRsNVcGlpuKuoAZJn8+U+7hYVNvtPZNTilEe3Zf6RElr21FwxuG7wLe9TBSFt0lkXe1/TFW9yjWexmpI8mtx2XVbJpYvpqcQVKrnV2P241osMZTzlPI8/ySMLY/P0kSnyyTb4XkHd0JcCfXfJIl+xtbtQoUmQ7lP4dnz74KHCScuAopYyHQRYsXnX7wq+2cQJIbVZHi4cuqFE6kCXNRrUvJfGJ3F9R6wc5DyOblWSGgv+U2Hac63sWFYCJCzs6pNJ5nXTp9kBiJT8AXdJHQFWmK3Sthj/vNiTEAV1PrE3TgETsQNBoQ9bqgggdkG1/XLw5b0TT1smjUaLyBTGxurpcSbcZHrtH7xuSBwwbQlyICzzF7ztMQbXEdZAdhTLh0mrDzUW9TJiM2suiPorRINUyTQcdxhdKLqTdPWHrBGxP3CwsmCQo39U86STmGvsaZXBSyJj7wFInsqWvpiiEZG9Bn/8QBmuS7Od0YK/rMfIVv8Fou2QXyWcOKRakYpAz64JM95pPO9LvJyjkkN4w31VSjHB9TGCrWoBI8e7vNsrX2hGjt3xrCjvtMsVZtjzSr0lfbvpG9HOrG1cY35FU4ncnQ/W4wK74a2JxXN6VS60EFKHseA9DP5a6qgMM9hjZLIH6DUBZ08fR9BE2OGNSjZ7+IOL8roGal3uNtWEUY1jXTjfWrLeVBvwaMjKtpZFtrkLRmvoz9tqOxf3SZshFIG6GG4Mu2UhcM3kmvgMz2rcaESV5ISK/cuTa5YiIOf6U+S2kIOM1kkhLvb9PeylPLb348zUW2YPCFyWie48=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(366004)(136003)(376002)(26005)(2616005)(6512007)(110136005)(107886003)(6486002)(71200400001)(2906002)(8676002)(41300700001)(86362001)(66476007)(122000001)(5660300002)(186003)(53546011)(6506007)(478600001)(54906003)(38070700005)(83380400001)(91956017)(316002)(4326008)(36756003)(76116006)(38100700002)(8936002)(66446008)(66946007)(66556008)(64756008)(341764005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThkVWFIdHVQTjdhQmI3Zkl5UCtmbWI3dnNISk0zNDBuQW1TRFkvRWRiN29i?=
 =?utf-8?B?MkpTNEV3Uk01dEwzcTRrMEJVaFdIaTRjVXdVNWI2cXFzdTdUV21ZV0xscGdp?=
 =?utf-8?B?SzNKS0QvbWV5Y2dCM2lWMUZmRFNZRCtqUUp1dkZkL0tKbmFzdXY3Vmp4c20w?=
 =?utf-8?B?S1ltT2E5bzdpOXpJL2cwUUp6Ymw2cjVXVXF4NVFrSzVpemlvVjdOd0lrOFZS?=
 =?utf-8?B?OXBZVHRicUtpY05SSlVJb1pNY09Yd0VzQXVsa0FqUVM2ejZJcDltcHJaNjR1?=
 =?utf-8?B?d1JTOGtFOFFXZHRPVmRYaVFoT2thZ0NSdUl3bVE4TjFJQklURy9nRkE4YmtZ?=
 =?utf-8?B?T0ZSWVVlZXJ3K255ekVVRjBtWXFBNUJmZ0UrdFVUbDlSRDhJWE9XZ21NWDVm?=
 =?utf-8?B?cDRNa011YW8yNjJ3K1p6cWJzWjBGSjJUSDMrL1VXVlJ6Y1Z2NkRvZ1VjNWVm?=
 =?utf-8?B?ZkRZZ1BtbGdCNml3bEVYSE9icTFVMk4yeHdFTktYbE84azI0eGE5Wit2aHJ4?=
 =?utf-8?B?T1BDQThpWEV4RUVkSE12SFlBMWQwU3R6MzJORi9udDZRTkNGMUFTb1JpV0kx?=
 =?utf-8?B?dUZFMlJMZmk1QW1RdmE4WjVjRytHTWRoU1VEK0l4Qnp0UWFVMnM3eHdRT001?=
 =?utf-8?B?dHJXV1RtR2gyUk1FM3pBY0FNTUswMWcrTGcwNHRVSVdLT2lYY0JTWEdaWmd0?=
 =?utf-8?B?dk1kM2dFb0lXaWkrVG14SVJEaW5mUmlrR2Q5K1ZHemhkdjgrZXRmc2RjRE12?=
 =?utf-8?B?WTBTcGJsU0pYdDljbFFxdVMva0ZXaW1DeG1Qa2t0WVMzU1BwZGpONEh2RHFI?=
 =?utf-8?B?cFVXdFlmZGV0RmhiWDRJMjlZQ2hIb1A1ajk5WkMwcHlMaHNESTNwYkNEYmM2?=
 =?utf-8?B?d1BlR2htNDZoVHNXZHZETXNNY0hyRHR5QmhTTlR6SUpXR1RQRk9tc2VEcDdy?=
 =?utf-8?B?YlFKOVUvWE5sWW5qd0Q0VjVSbkNLM25UQlZYdXYvTjEvN2VqQ3JuTDhrckl2?=
 =?utf-8?B?SXpIY1hqWEVxaDVYYkIzdXNDK21LTisvUk41dGgyY21ITXQwcXhwWEdhdHZC?=
 =?utf-8?B?bXkxeldZWEdyVk95cm11SGRLVE5vUjFYZHFUQzhWOXhheDhzRjFYcU5ZYk03?=
 =?utf-8?B?MWR3bFhuRmc0dTFyelNzNUZYVWgxNGp4R3A0Z2tmVmVsQmxrcXdVaTlrMVAr?=
 =?utf-8?B?bzB3WGY3ZHlieC90S29kcGN2RkhPaGVmZEFnK0F5RXhaZjFDbEdkV1U5TWQy?=
 =?utf-8?B?akVTb1VBRVpHQXNiZ1Vpa1lGME43TlpZQ1VjRk5GcFV0WEhJSmVYUmZDU1VI?=
 =?utf-8?B?bE1hNUZobE0rUGkySTJJc3pTV3oxZEg5SVRDSkpBay9qS1JETmFaWjJiT1Z5?=
 =?utf-8?B?cCtWamQ2UlV0a01KVi9wMWlXRFpQSHY1VjhKYmNzaHFWRFRad1pLREtUN092?=
 =?utf-8?B?UCsrNGhtNzNZOUlza0Zyak5sNS81dnNWMXBTQkdRdUs1V3lwRnZwRlEyVDlr?=
 =?utf-8?B?T1Y2eHl5OVoreUVTcmlFOVZMUGJ1Vy9vSnFwYURDeU5tUWc3Q3ZERmFUSEFG?=
 =?utf-8?B?cnplYUVaWGlWeFY4eXlpcEZLNkFBZUZmNGNrOGw2RzVwc010THd2THkxd1J0?=
 =?utf-8?B?K1BRb2tBbFJ0WHEvbGw4ZFFsYlg0Rkh2UjRxYjUzMTFsSDh3anozNDRZcXBo?=
 =?utf-8?B?eURkZUMrYkpyRXNCVzRYR3BuMmd0NUZ4ZUpzbTRIODZabWpkQy8yelNUR1o5?=
 =?utf-8?B?MVJvOUM2TlZOUUVraVg4bVo4dVhxZFFibTBFeUx6OFd2MmZPSDBJSVA3N0hQ?=
 =?utf-8?B?ZkNNYnJ5WlltTGRubmJxOFFaY1FGdGNzcFpnYS8wd2kraCtnRDlrZ2cwSVZE?=
 =?utf-8?B?aHVlRy9VRnhWTWZjcUFhWnNmclpSeE44L2VmN2s5RFpHQjh2ZzdwUkVkV284?=
 =?utf-8?B?VW9NMFhCQXl0ZUtiUUhML3dxQ2JPRXpDeU4vNzlxWVMzTVhmdTlFMjBpZFYr?=
 =?utf-8?B?NFJtQ3p1UzBQTlA1eXlTL0l3NjlLN3J4V1EwMHdtNExLMVlBVnNmcEZNdE1G?=
 =?utf-8?B?Rk5IYXNYQXZ2SjFnVnA4QUhKTzFwQ0tVZmU2ZWMra1BXVDlJdFRWbGNVY3JP?=
 =?utf-8?B?Wis3UWx3eUxYWXFTYXI3c0dpSGdscEFpTjBBRy9uaGFlbzZ5WVkrb2JkNUlK?=
 =?utf-8?B?MGc9PQ==?=
Content-ID: <81E741B2995CC24699582F4BAEAE0B07@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b4a6b3-4025-4bd9-9765-08da66378786
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 07:56:30.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QE7WjUomJo8L9XOJinRFCEthN+OfWb5ktSE2lRhmC+lQSqYMFuqyosxeDm7xJH8zQYQrNkNNxmz4zrWByUJuMsKYqhKU2d4kWNXCFbAw/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_005645_342000_18842B53 
X-CRM114-Status: GOOD (  29.30  )
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

OK, I have gone through all comments and taken on board your review
comments. Version 3 will follow later today.


On Wed, 2022-07-13 at 13:59 +0200, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Wed, Jul 13, 2022 at 1:00 PM <lewis.hanly@microchip.com> wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> 
> GPIO
> 
> ...
> 
> Below my comments, I have tried hard not to duplicate what Conor
> already mentioned. So consider this as additional part.
> 
> ...
> 
> > +config GPIO_POLARFIRE_SOC
> > +       bool "Microchip FPGA GPIO support"
> 
> Why not tristate?
Not a module, compile time kernel driver allways for Polarfire SoC
> 
> > +       depends on OF_GPIO
> 
> Why?
> 
> > +       select GPIOLIB_IRQCHIP
> > +       select IRQ_DOMAIN_HIERARCHY
> 
> More naturally this line looks if put before GPIOLB_IRQCHIP one.
OK
> 
> > +       select GPIO_GENERIC
> > +       help
> > +         Say yes here to support the GPIO device on Microchip
> > FPGAs.
> 
> When allowing it to be a module, add a text that tells how the driver
> will be called.
> 
> ...
> 
> > +/*
> > + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> > + *
> > + * Copyright (c) 2018-2022 Microchip Technology Inc. and its
> > subsidiaries
> > + *
> > + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> > + *
> 
> This line is not needed.
OK
> 
> > + */
> 
> ...
> 
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> 
> Why?
I am using data defined in these headers.
> 
> Also don't forget mod_devicetable.h.
OK
> 
> ...
> 
> > +#define NUM_GPIO                       32
> > +#define BYTE_BOUNDARY                  0x04
> 
> Without namespace?
> 
> ...
> 
> > +       gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> 
> Unneeded line.
> 
> > +       if (gpio_cfg & MPFS_GPIO_EN_IN)
> > +               return 1;
> > +
> > +       return 0;
> 
> Don't we have specific definitions for the directions?
> 
> ...
> 
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +       int gpio_index = irqd_to_hwirq(data);
> > +       u32 interrupt_type;
> > +       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> 
> This line naturally looks better before interrupt_type definition.
> Try to keep the "longest line first" everywhere in the driver.
> 
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> 
> ...
> 
> > +       switch (type) {
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> > +               break;
> > +
> 
> Unneeded line here and everywhere in the similar cases in the entire
> code.
> 
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> > +               break;
> > +
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> > +               break;
> > +
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> > +               break;
> > +
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> > +               break;
> > +       }
> 
> ...
> 
> > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                            MPFS_GPIO_EN_INT, 1);
> 
> Too many parentheses.
Yes updated in next revision, using macro rather than * BYTE_BOUNDARY.
> 
> ...
> 
> > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                            MPFS_GPIO_EN_INT, 0);
> 
> Ditto.
> 
> ...
> 
> > +static int mpfs_gpio_irq_set_affinity(struct irq_data *data,
> > +                                     const struct cpumask *dest,
> > +                                     bool force)
> > +{
> > +       if (data->parent_data)
> > +               return irq_chip_set_affinity_parent(data, dest,
> > force);
> > +
> > +       return -EINVAL;
> > +}
> 
> Why do you need this? Isn't it taken care of by the IRQ chip core?
irq_chip_set_affinity could be setup directly at irq_chip strcuture
initialization, but I am checking parent_data before calling. So I
would say yes I do need this.

> 
> ...
> 
> > +       struct clk *clk;
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *node = pdev->dev.of_node;
> > +       struct device_node *irq_parent;
> 
> Why do you need these?
Yes I, for setting up the hierarchical interrupt controller.

> 
> > +       struct gpio_irq_chip *girq;
> > +       struct irq_domain *parent;
> > +       struct mpfs_gpio_chip *mpfs_gpio;
> > +       int i, ret, ngpio;
> 
> ...
> 
> > +       clk = devm_clk_get(&pdev->dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               dev_err(&pdev->dev, "devm_clk_get failed\n");
> > +               return PTR_ERR(clk);
> > +       }
> 
> return dev_err_probe(...);
> 
> It's not only convenient, but here it fixes a bug.
Using dev_err_probe instead of dev_err.

> 
> > +       ret = clk_prepare_enable(clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to enable clock\n");
> > +               return ret;
> 
> return dev_err_probe(...);
> 
> > +       }
> 
> Make it managed as well in addition to gpiochip_add_data(), otherwise
> you will have wrong ordering.
OK.
> 
> ...
> 
> > +       ngpio = of_irq_count(node);
> > +       if (ngpio > NUM_GPIO) {
> > +               dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> > +                       NUM_GPIO);
> > +               ret = -ENXIO;
> > +               goto cleanup_clock;
> 
> return dev_err_probe(...);
> 
> > +       }
> > +
> > +       irq_parent = of_irq_find_parent(node);
> > +       if (!irq_parent) {
> > +               dev_err(dev, "no IRQ parent node\n");
> > +               ret = -ENODEV;
> > +               goto cleanup_clock;
> 
> Ditto.
> 
> > +       }
> > +       parent = irq_find_host(irq_parent);
> > +       if (!parent) {
> > +               dev_err(dev, "no IRQ parent domain\n");
> > +               ret = -ENODEV;
> > +               goto cleanup_clock;
> 
> Ditto.
> 
> > +       }
> 
> Why do you need all these? Seems a copy'n'paste from gpio-sifive,
> which is the only GPIO driver using this pattern.
As above setup of hierarchical interrupt controller, very similiar to
the sifive architecture. 
> 
> ...
> 
> > +               mpfs_gpio_assign_bit(mpfs_gpio->base + (i *
> > BYTE_BOUNDARY),
> > +                                    MPFS_GPIO_EN_INT, 0);
> 
> Too many parentheses.
> 
> 
> > +       girq->fwnode = of_node_to_fwnode(node);
> 
> This is an interesting way of
> 
>     ...->fwnode = dev_fwnode(dev);
> 
> 
> ...
> 
> > +       dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n",
> > ngpio);
> 
> Noise.
Noise removed.
> 
> ...
> 
> > +               .of_match_table = of_match_ptr(mpfs_gpio_match),
> 
> Please, avoid using of_match_ptr(). It brings more harm than
> usefulness.
OK
> 
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
