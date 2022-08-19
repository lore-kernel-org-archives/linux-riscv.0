Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018DC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKQIKivoTR+iPnk7pnykQxp7uHQCeJUPCUlOzp7Xb+s=; b=pW/Vw6/fLmLgsV
	jSBb9t2MSEvsayGmBXe0kzZOLOvmnXOBl6YNxKdQ114t/ztssdnM1Nv+HKsu91maDClxwfnd37uAj
	Sud+q3VYEoXVqRE3o9tSoWWXqxSAX0PEAoJhl7SGDPMKaPWi/vL8RkppOXja+bTo8s7Q5EO+ABxXd
	CJYTpc4Ln54ANoT6KzjV8oW32eEIajrAEYCXS4E3rQuv2uGXJzSWDJq8gkCdhbgspnaCgR8Bb3pLu
	lZMETXhezeDaF1w7XyJaf152NeL5DV+CPj+uY/bsECZpjBGGMCAxUqStitUNnCgb4UAoR034l5/I6
	uEVyR0akXj+pbZ/8FcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1v5-008hN7-JY; Fri, 19 Aug 2022 13:20:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1v2-008hLJ-9d
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 13:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660915212; x=1692451212;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wxJx0fkH1pBo8E34X08s+7n1trbf+g1Est7PXMMH7Z4=;
  b=Z/WI9bWkXWOp0Vwkcu8BBCfsGDABy3aT00uYU7nV2+Mp2CI/+E9o0WgR
   PO0q0NxNfDTP2egupkULLq1I2FY8ixZZZMIZgoWi5k6ZxMBGOcc0zQ9Ot
   XopxHwR7LTB2Cr8cGScxcgx9apgFZKfiwcx6YYfMoyC6vJBiaCafZbWVL
   E4G8oAauVCW1XY10XLhwh5ODEMw3TSh0Dcdfs5JS2NEwEopz0ltC2NCmM
   zywNnTv+GuYQrt17/T4b28GFQgioWFtyqlWuBCI+t1jHtKoGmA4/CexLq
   t/0ynuyPvh9gdbusk76K195fkff7UY5cPbEiqkrTVf0eCjXs71qFhknQs
   g==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="109797847"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 06:20:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 06:20:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 06:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmOl5SHcBgcNsksvB/uqSmy+kIjoaZP2ECIFdkxy22nuvxZEY0qeqgzjN+xgEGTaw6Q9ZNKtKg4k71txXuZTUxy4gxYSAUx/6QYPB9+c1SAYSGftH/WijplegfHp+3nDC0koGgA7O0kSLYYMXdQ/fB40sKZXtOyVTTRX8kfT8uv1dcV1T1qzyHZILCq2r0SI5wdV3DcEoy5UBVqEsrZ2Hsx0PrZz2SxOw9tIJdWWNl71LztYjtcyAvCLAsi7KoMPYt5KqlO94y0B8gtdn22tmQPEOFfLpX3oEDBMOyTwFUCynPBcqVINtJ9vZJxdfILCEX7nhXsJliv//bzuwYcVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxJx0fkH1pBo8E34X08s+7n1trbf+g1Est7PXMMH7Z4=;
 b=VCQept8hfTL1U0aTVPjABzeccv896xMTORHoJbuZnV2oAOdbWLyBwyPP8AZ1uLw6mosd04GMf1uK+EquyyjnO+9Ts2YZKraA1c9GWt1XS66xBU8D/kuSXogm9HcoQ813IXdWWJDxiY/I/Y9tJGc4CX++Sj925nyM5dO0qatFcOdizSsb8akRGvjfI2xCnUSerVnyVYrLwW6W0bMSj8EL5uYrQRNiUYxISbAMTnall3uU8RFNnvHogYYBhmGyV0eP7izXJtQhghJxH+6yYOu9JNPC2vcctXU8SYxOiFOBAVUyx8Egf/t1EFW2JsvITKPp1GI0BH7DsbgbH6yUNldaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxJx0fkH1pBo8E34X08s+7n1trbf+g1Est7PXMMH7Z4=;
 b=gW2PR9nHHIsPnldmaDFMA8TbJfAgJN4r2MXK011W0XHS/xWbhXZQZGdDevduvWK2fWuiEwb3HMKuOQ3ZRdipLM1f5ZPe+MARrQdwQOxTKYpEFOR092wmr2zqizLmE16a3N/LyvqaDoEsC0BhxEfmizltKuhKTrb+Yl3Xq4H23lk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3665.namprd11.prod.outlook.com (2603:10b6:408:91::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 13:20:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 13:20:06 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/6] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Thread-Topic: [PATCH 2/6] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Thread-Index: AQHYs8coaq+wNsk760ijXKDYrhqZqq22K3mAgAAJsQA=
Date: Fri, 19 Aug 2022 13:20:06 +0000
Message-ID: <cc784668-eec9-ff52-1d65-f55efcfae079@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-3-conor.dooley@microchip.com>
 <0976b1c1-a8e0-5a61-51ff-9b47f29569a5@linaro.org>
In-Reply-To: <0976b1c1-a8e0-5a61-51ff-9b47f29569a5@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eef67cd1-64f7-45e6-37af-08da81e58867
x-ms-traffictypediagnostic: BN8PR11MB3665:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qESaFN17U5jCRyV7nqh+5J7MD7enKZ4Z/nueJZNZxRU6KUeWGIVdSg5e54DJLzCDei3iIovpE4vs8j7oPUeWjBi33HLz4TFAweyvxbG6FC9zm6r6Ech8g2QInTdPLXqMMPVvnDcfJ2RuDPOu5CCrFGH50hMN+WMJeDcmdb8eTs9EW32VwC+m9hz9vmeBSr5D+htJntIlNvV7xiGd2eIHyS6qRWVuS9yDb6b2FPKog98hiM6hDGH2gPSAhiVSV8dItX1n3r1CkidjPkGkHP6vLe8ff1yddfWo16NFu0PG8Gsn9fo5IlWAmGSV7gBGpOGZtPcSFqXKLtqhU2lfjKm0LyI3tlgj2JKxiDJBRRXxTb11yKHUEx0Fv+Kxtm9EYbRpcwm6L8Cah9Xlt0iRvAPrNFJjCHnIj560DeQohWoWsYRIXT9ZIqSFPEw8gwx+oO/EsP0NtgVHzcck7+cq5w6aORnNOkQRP+Y+BfO+QIDwvqwc2AiVh+Oh1lbRTz1ij9GuvrTRtiOq8z05hTQ9mN/vM1FKCeiclL3wYFxqvFac/mUJcWZr6Z04pgNUNcu0ZafEiFDm+Ji1mM4LR8saadauxT3rRNSf4iPWJGZJs8w2pT3z1xUnZWjuiVae153N1eGfOICvzMqjncFwaovWA87NYRFqkjnDUk5ml5/hotEbAB1SSnDmhYIHx4V0Us0GsApG6EFyXqDaJ2KBw5yhScyHQzbgCIMWOj1UE8FY4dOyUOJDTOg6Tw1I3LT1K/wh/lDzk9rp2/a4TE/ijnI07xNfDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(54906003)(6636002)(316002)(110136005)(966005)(122000001)(38100700002)(31696002)(5660300002)(66446008)(8936002)(7416002)(66946007)(478600001)(6486002)(4326008)(64756008)(8676002)(66556008)(76116006)(66476007)(91956017)(31686004)(71200400001)(36756003)(186003)(6512007)(2616005)(26005)(53546011)(41300700001)(6506007)(2906002)(86362001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWdKRmpaVjB5aUhjV3RtTXRMWUZwaWsrMzd1bStMbk8rUGVkbU9Kb3BaVmVS?=
 =?utf-8?B?RnZtcVM3bElneG5DVHY3N1VQV3YxZHc2MlZyVnlKRDE2UXBqRWorajVyZFBH?=
 =?utf-8?B?WnphTTcyVW5DQ3MvQW9VNm1QY2lzK2wzZjYzMCtmZk9td3VWMEk5UUNoblU2?=
 =?utf-8?B?cWo0VHJzbnljV3gxbXJKVjNqMS9BYlhnY3JnejkwK1dFb29DdlRjeDk5ZzNX?=
 =?utf-8?B?aFF1OHBjaTdNakc4MUpORFRCWmlrZWRLc3h2c29sc3NNN2h6RWN6a1hGRXBn?=
 =?utf-8?B?QXA0UTZHMy8wTEcvYWd5TWtwU0JWTjB2cHlraGc1ZXozMkY3bEFPR1ZSZW5T?=
 =?utf-8?B?azN6NmRQWkUzM1RiSXVFQ0hiai9xY0p1dG45Y1dtUTZyV1RpNnh6SmorOWNL?=
 =?utf-8?B?cHFnN3ZDYnB0MXJyYVU5Z3ZYSTgyMkU0TWVJVlF3SnpGdVdjZUQ3TnFCRmpx?=
 =?utf-8?B?V1VtMXVvQk5tY1Y2Qkw4WUFPVjZncFRPYjBmQXRzbmJtNnJ0dHZjL2dxT3Nm?=
 =?utf-8?B?eEl2OW5aOEVvck1PRWdXU2xkY1FqdDBWRlNyb3JuUTVSbmp2cWhlcnVCQVRq?=
 =?utf-8?B?aWxjNTVTZG9RSGFHbTdPdVBzb3NaR0MzVnpKbG1OaWVkNElCc3NIUHpXYUxE?=
 =?utf-8?B?R0FWczhhRGF6bDBCZGlqK1hLZ24xTC94NjBXMHR6VDBBTFp4N1VYRTBQNGcw?=
 =?utf-8?B?N1cvYi9id1ZFanlCQ1JxekNsamxWb1JEK3R3MTk0UXdJR1AyendNQ29JNGtX?=
 =?utf-8?B?dUhoWUo2a0RzZWdQTncwS1EwRU14ejBIc1djLzJlbzY1Q3hDMWsxTG1hQmZE?=
 =?utf-8?B?b3dRVUdjK1NLaTYwSzE3c0ZlUXBnWUdvNC9IZ0UzM2dvT1ltdkR0dnRLcXNi?=
 =?utf-8?B?UFp6Q1JLellUYlZGRWlLeElSREM0NzlybDlwQnZ1clNzb0U2UXRXNXQvQlVZ?=
 =?utf-8?B?RUpnd0ZEQ2tnUy8wcTd5M1pPSk9PVnU0c3BBRWpmaEFOaTVqajRWdmNHQWdo?=
 =?utf-8?B?SVFsNS9qeFovejNSMlFhRXZtVytYSTRqZGpPSXgvcGh6TVBiZkRramlpY2FU?=
 =?utf-8?B?T3J2VkJCYWEvY2tlaU5xdlFlWlR3Qk9ZVXd3d0lScS9hQ2lkaE9FM00vR3BY?=
 =?utf-8?B?TWdkWWxLMERid2g0QUhOdzNlcExIdEt5Mm5LeVErVksvUnUwQ2tTR2ZDaU53?=
 =?utf-8?B?Uk16d0I3cCt3aGpIWFI1RTRkdVNjeURKUnRjZ2RTQlpuT09rOWRvQ2VreWI0?=
 =?utf-8?B?Mm1EMFFFakl4KzJweWJiRkdLc1RvOGgzRXJtYXNyQnJmaTR1LzZpWU5XSUJi?=
 =?utf-8?B?S1krdHN1a3UwemNoV3NlWkVOSCtqdUtzaGVnN0tvNHNMNWl5ZCtGUzFyZ3J2?=
 =?utf-8?B?bG9WTUdPLzgwdUR0b1RUQ3BSQkJDNHNOdXpCenhVTWhkeHZCNzJESVhDZnl2?=
 =?utf-8?B?WnRZaGFnbjBYVVAyVmJUM29GRGYwY0hHeHl1REVkR2M1dmx1TGRxclQ3Ynds?=
 =?utf-8?B?Z2R2aEhueDcvTUx6TG8vdFhKekVZaXJKUndxZEpMcVJIZHBuSjUycjY1OFZN?=
 =?utf-8?B?WkdqNmZSNDFxcm9RazNISjZyYXRSMWFGYnJoVnY1RTdIK0pXV21NVlIzdkI1?=
 =?utf-8?B?TGV0emF3R2I1SmV1TndZNzVadkFyYVlyVXVLaTZqdldFcGUxbDlCNFk4Tisv?=
 =?utf-8?B?YklrSjdpYy9RMnBVVU9ZK2VsSFVuaGxNcDJvVDZFdFZmU0VYMURXQ05FOXlC?=
 =?utf-8?B?dnlSZDRseGxRT0Z1Uk1QWDI3MlBwM1psaHk5bGRycHJRQzY1YldqSWJWRkN1?=
 =?utf-8?B?TU44RXcyVTJjZTlRN0VSR0F1aENhVXhMTkVEM1owSGc2eis3eG1RQUxlZURW?=
 =?utf-8?B?bFJFTFd0aUZXVjh3U0Y4NWU3ZG84bEZNZytqNEtFRDQxcUF4VWp2OXFENTU5?=
 =?utf-8?B?T3ZvSmZFa2VwZXFZMmszQUJSRXBNR2poSDRmVXpqNisxMy9jaUo3RDdBaC8w?=
 =?utf-8?B?M2VrT0ZqL0JqR01xcEtjTXFXR0xDeFc3em5EVHBWMkIzK3M4dGt4WGZtWTE4?=
 =?utf-8?B?K2N5WVVuWHJkUnpQUk8rNDM3YWNWN3ZXTGJva3hEdjQvY3dNeXlqUGk4d3l2?=
 =?utf-8?Q?+I1b1hKf5kS8BmwgUNh3cVo6G?=
Content-ID: <685EE89536690A41A885DF81047FAB14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef67cd1-64f7-45e6-37af-08da81e58867
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 13:20:06.2150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtG/auPtjEo7cvBFVfNj2Hd9qsKAT/ZDmowD4Op1XGT2igKuzjulCWwtcL4Jai4i70B2hR585XcwbSxn7eZbiAo3n2hVlZSK5mOfhwomyKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_062012_490096_203A5BDA 
X-CRM114-Status: GOOD (  14.60  )
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

On 19/08/2022 13:45, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 19/08/2022 15:22, Conor Dooley wrote:
>> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
>> ordinal corners of the chip, which our documentation refers to as
>> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
>> highly configurable & many of the input clocks are optional.
>>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +  '#clock-cells':
>> +    const: 1
>> +    description: |
>> +      The clock consumer should specify the desired clock by having the clock
>> +      ID in its "clocks" phandle cell.
>> +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
>> +      PolarFire clock IDs.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    ccc_nw: cccnwclk@38100000 {
> 
> Node names should be generic: clock-controller
> 
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Further, the label is not required in the example.
I'll fix this for v2, thanks.
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
