Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448B9ECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 06:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5742atsdlxJ9rf8AfxKUZkBLWHtXH9nanUFph/V2EE=; b=uuo1h1OUS5r46Y
	bL9z2c8qQnXvb7T2PTQw/p0lrD3gDneA8ftLLMZ8bZcGDW/IqX5Ml9t5wYWwJdaem3+DqEVhJ4tRO
	E77evMqtyGYcg7rajlYIrm0hRaW4MdsWih9ECuAYn2LJV9HlgUYsZSc9FQICfqWSY9/Exn2IUO1uP
	NQsYqL8R+p5BKRVscvjf2EmvFuCdpmmRdSNtsLWRJzRMFx1qJTQMA+spe6tTvsK4THRn8W69bd7GG
	BOxgwm7slmbGhnkB2tA28CDDYVfxg6c2ICafmbcaFf1cyhCbQBCWR1Qts1w5bUPqh+i4JhBcT7LFj
	BEXJ5rB3nIAD2L+za2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT6O-00ErPx-MF; Fri, 26 Aug 2022 06:46:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT6K-00ErCl-Vg
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 06:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661496356; x=1693032356;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sd6PfDywk6lvq4YebIHAwSmPfr/Ved0dd68tbshK9Sc=;
  b=mfJUrS2gHepAkDCwEdyux0gcgQHmspHpXUZDIK87t2veOZQwA93hrdxR
   8kTQZ08lDbCivygXz75Q891pcz9MwOAtT6TnaUpD3TkXUKf/HA8zGteWp
   0CCk2qnodby8UQZRAgMQ2kdbJOCubOlYbHNA5R52B1YBwjIHG1nQVsk7q
   g6Kpn/0DhfL3vzd/+UXNGS2/miCqLVYlIH7lMZcRoRZgJp77IYt0n1opM
   fAR3gM9OJbk6astGw4j+6U3XO7z4D1L75B5gJJME+Uz9Ra+1/PGjLpHfp
   V3BfTvQ6FmaloQv3FB3ROUXTJKT9UsDNOnwJLAivBdJ1gzNP65nNGMh6S
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="174267705"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 23:45:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 23:45:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 25 Aug 2022 23:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEdm792XqP3/7GId6L/CvoI01Rs8K5Xngdj8oc93VH/FpZRbn9MEsRt8ckLEvRMYa6H3gj2pXq1uLif5yjBkU7QStC2ZKdRKYSrd0DvdJfu2mIwU20qnn5Wse0ZXZ1qwM4LROLMNHwT3wIMp2/PhqiyUMjaWoxbJtPeaJDxMN6ZBnQqwibpJdYtgD8iiZXOXNf+v9+P0BL/oU9NNnZIzEgTn93hCcwrVlZBX/iFU5yrLF/jTQ1J12k6PrVQdh0N+tY+wzWheCew5L3FchEk7ex1sH7w9YQ6i06gdJmDfZ0HPDLcp1dZfl/7Z2MVKFgJhcif46ESADczkVphH/B4i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd6PfDywk6lvq4YebIHAwSmPfr/Ved0dd68tbshK9Sc=;
 b=n2T3EKDtydIXv8uKzo/mQfYZl1/34UI5D6TZI8THUs6S3N+3QTWjlwQnnKtqDlXrc/x/JLG+P4gFkLGo88jglfABmfQLNec5o0A3g9XOcnVrRnH0H1Op0xOc9XtO8fxcHnFewRCnO5iRk+Z6jgWH1at9HpE9W8ZDzWWJDxpvd361pGRTscjbm9DO2dYr9vum0H+vV+efOQXFPdVl4w46Aob3eKenzf/fOmJ41WkaMkw0pZSSXK6YyZdNSmafwiaj8reNVgJ4wk2aGUGdH+Sk79ntRhlqFeK9Oiw0UluNZEO/0hcKc7sxLt0EoGKsoQI+fo244T7mFXpHJ67r3B4EMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd6PfDywk6lvq4YebIHAwSmPfr/Ved0dd68tbshK9Sc=;
 b=lLcZEobmidPn3MaLX5RtkFxQljaRYozpT5Q8ew3QvQ3MOpUciBRm2P9g0qB05KXoBTZqsLe4zW+9kkCSBl33rufFKJjei421no8giyWiQlzC4L/fn/4yoI9MKDtNEl58V9Gr49hWJ2dYi8ORd0WKQF58N9zF6LmFHeoeWpCsXak=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 06:45:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 06:45:45 +0000
From: <Conor.Dooley@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>, <Hugh.Breslin@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Topic: [PATCH v3 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Index: AQHYt5zPMZ6mCAaqX0KQWgTJq6Bcaq3AvrcAgAAA6gA=
Date: Fri, 26 Aug 2022 06:45:45 +0000
Message-ID: <9d41350f-2558-36fc-9863-2d55ecd48b06@microchip.com>
References: <20220824093342.187844-1-conor.dooley@microchip.com>
 <20220824093342.187844-5-conor.dooley@microchip.com>
 <6764b456-2e06-54da-2bbb-1efda2dbf52e@microchip.com>
In-Reply-To: <6764b456-2e06-54da-2bbb-1efda2dbf52e@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 399534c6-627f-4cf6-caf6-08da872e9a38
x-ms-traffictypediagnostic: MW3PR11MB4732:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgadjTGs4EYKAL44OYd0kctq6JlaQEn0puhQ6ZAqFI6W+n4KUw8IqpObf2wav9KgUpEkasrikXSbCVJU8kCS4E5Mh+dkbrucD0VGpOcJ4NaUCMwRXrnzNoGN14Pj+TIfs0B4S8Q89UTXVw5Myx5/uNn6rlY2TpYq9f2g8WnAv4rSX4WCD/FqdL5izehDdSDXZppPfuUUZa5DabyM4ZBIK7APdpTfKAfyPUa7SK4G3sC46paEdAzRy2G+4+E1hXj/sa8OJYf/fo41lPaVLjeBR5gJvpEGeU1a8Psx3xogMIvYC/nkXa1hoz8k6wGLzgg8dT2QePeRXuAe7yZtGEao1iXvw1l37w2RcjDDsns8hii4nsgEk5KUtzikT9xAcFix1AuE16GMd9EKhCsllxPOXp1wq9OYHs/PIA8bi+SkftQ6j++1XVrJR5//CTOmwl2QlgiTN19MDDOcsiEN1qhT6J6+2U/BUgN4VFP2t77FaikWd356wDIlay8I9iEDx7ftQrCFNhyRjBZzvwZgQmdPb8piOHfI3lGZgvf1x9eQiotf+u9nHNPDE+1X1bD4tnFoNvNfKg+Dm8v+uD/cTxor2RlsCqMaC2Bvb1BS8QzqD0Tek/redH2IAbtWmEIDaSXNzKuX1t75JYUn9PpJ1cWw463x28n9fscSZ3Y+qtjFClR5xItpqOFe10dzn/U0Zwz91rwAJ/YBKVD1nzZoOVuVkEXP912uh3rgsIGwHNvQx3GNV71iEiisjmP/6A7CjAkJ2wK23evAQUUKlV9ncMuwK3fYOAM/fwxmwntlOrGQb8mfiVirfuyw7aZa6R2puDqonkXgEdc0yWdIz1e5ewRWPhYoNMVdtnIcocy6vpAIYOA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(346002)(376002)(396003)(83380400001)(6512007)(53546011)(26005)(2906002)(186003)(2616005)(31696002)(86362001)(6506007)(38070700005)(38100700002)(66556008)(66446008)(122000001)(478600001)(4326008)(966005)(6486002)(64756008)(66946007)(76116006)(66476007)(31686004)(91956017)(7416002)(8676002)(5660300002)(8936002)(110136005)(54906003)(6636002)(316002)(71200400001)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEFwNTZOZG55aTZ0Q09DQXZsdzZWcFhEaUhpZ1ZtdU5WeDdkRWM5bVJaWGhj?=
 =?utf-8?B?amx2dVk3dC9ZbXF6em9UUUFiNGdMTVIzOUxQd1B0UGJVZmtkM2NDeFhFUDJU?=
 =?utf-8?B?QTZoNk1nRFJET2J3R2xma2tZa3hLOXpZVmpoZmJKdW9RSnpFTUlWUUtJcHBB?=
 =?utf-8?B?S1JUTnhKZUJkMzlUMXh4L3BmR1U0cENlOUdZNTdzNXFabVozUmlwdllnVzBT?=
 =?utf-8?B?RE5EWVcxNUNPOFo3bi9UYjBYTFhLYkpLQnpwend6SjFLRCtZOWVQdE1BbzRs?=
 =?utf-8?B?Y3NnQW9jMUZ0aGlHYkl1bk9XV1d3enpzM0NFVzh4aEtUVWRmSjNMbU5EWWVw?=
 =?utf-8?B?S3RrWURyWVQrRWtvN3dJdkkzS2IrVXlodGN3Ynd5L3pBYzNtMlluV3J0TlJP?=
 =?utf-8?B?Q1BrMHRQd3g1RlhKMnMrclRpMjdYK3M0V2JUOHNVMmVmTGNOY1dYZk5VU2lj?=
 =?utf-8?B?N0o2d2pJd0Y0RXc3YlUxYUh4Y3ZuU04rUEcxSDIxajRNcVMwMGszQTY2NVFo?=
 =?utf-8?B?Qms2SWwxUVZqUEtCNEtxbERpV3RYb2ozT1dOOEV1dDZTak8xYkhqV296N2lK?=
 =?utf-8?B?V0ZodkRoMDhwSk5xY2tZNDlhMlZwZ1JRSGl3UExzSDJZUzFHdEJBTWxvbjRH?=
 =?utf-8?B?OVhOVG9kZUhMenVQM0Q1YXpLYzQ1c0hkdGdjekpKNG5hRDJ5UTZWS210bE9v?=
 =?utf-8?B?NjVMVnhkODd0ZjZCdjRpeGFGUTdZcEZRL3haNEk5ZjhxejRwNm9YTmp6amVL?=
 =?utf-8?B?N3VrOTg2WEtoTFROQ280QnZ4R2k1WU1RaHQ3bEZkMnNpRmpDRjlJNjNhWVo2?=
 =?utf-8?B?a3RlZFhsUytRVSs3ZXZwMzNoUllZN0ZQTnFGcXExaXdUUk1MWGlKQXZvUVRx?=
 =?utf-8?B?SFJUNnBQSjVyM21HTXpFdGVUd0lsQ3cvWk5ueEtxNHdTT3BHcGZqKytPcElX?=
 =?utf-8?B?cy9vbEROdW4vamRUcXRIL3hpV25wSGtGM2FHRGYycHF6ZzgwOTJEcy96SHFx?=
 =?utf-8?B?aTcvQ3VZS3grUy9BR2dta1hkd2ZmMko5NlpadkZhaGdMS3ZUOGVlVjZDcDJZ?=
 =?utf-8?B?cExUbVpHbnRqL3IyZWxRZWNueWphWnA4eTZRNDFGWktBaEUxdytKOGsyN0ZD?=
 =?utf-8?B?YW9yZ3hLRlNGcTZJejNLVWF2NnY1U2g1SXFQWWxpc01sU2VyZHdLMFMxaDJi?=
 =?utf-8?B?dUM4MWVxdjVRalA1bHRQQTVQKzNRbmxZM3J4N25QdGJZQWx5V2dzN0lFd2oz?=
 =?utf-8?B?Vlk1YzdnWDlBL2ZCcFF2c1hZb2RHai9RcTd5UHcvWUtKckhRUlpZYUJJQVI0?=
 =?utf-8?B?NGxueGl6RlV3NnFyelR4Y2twN0V4a0x4dW5vN0M3cUVRU0g2cWVYNzVvNzU1?=
 =?utf-8?B?OVdrelB0RnRYeEdjeEFVTVd4eURzSS9OOThxYnBkN1JCZkN0aHoxek1pS21s?=
 =?utf-8?B?MDFoWUVIMkNIS3pabTJYNGdxYWI4MU1IRXRKeXlIL0h6VjhjMHIveERwa2d3?=
 =?utf-8?B?L2E0a0RuTWsvUUlpVDAzdVJTRDlEWmsvbXZ4VkExSXM5S1JyVXFKNUw1QTBR?=
 =?utf-8?B?bTBGdGtkMzV4L1krK1BIeVUybHhLbUZKT2ZLblNYNXdSVkRIZSt1T0dPMUxK?=
 =?utf-8?B?blU5a0prODhUdWxVQnM3NDMwbWpSK3FIdzVzangzMkZPYU1Rd0xod0xySyt6?=
 =?utf-8?B?eFZWcGVJLzFqUzV5L2pqdmMwTmFyTjVxeDUzOWVHTXRteEFHcFhyODZvKzZ5?=
 =?utf-8?B?c3VJQmEySUJTdW1PRlpscWZhWFA4OWQrSHlxcVhmZ1BuMjNtT0xPK05rMnN0?=
 =?utf-8?B?NzJwZEhuRm9XZnNOcWtlcm1WM2ZYazBTWTUyczl1STlIYzZ5T0tzWE85aWZZ?=
 =?utf-8?B?SVg4KzB2dUk4aS9CRmRJME54SFZvdEJmaDFrOHB2dnprekN5UFByYmd3aitx?=
 =?utf-8?B?UEFPc052THM2R0hMTlJkYjVZem5ObWRWaG1WR1RjVi81Wkxyb1U2bGhscTdr?=
 =?utf-8?B?Y0VzUFJCVFpIZXIzZXBIayszTmVGV091anEzZ3RPTU44MTVHQlVLeTNOTmlR?=
 =?utf-8?B?M1dCYXlKcFdzbWxrVnRNSVllL0ppTlphU09OeDAvbmo1N21Fc1VNZzEzVXpa?=
 =?utf-8?Q?vsh6jDcD8JF+YXjpEwx1QVDRk?=
Content-ID: <6D2927EDF3FD594DAFF6AB7BCB315F0B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399534c6-627f-4cf6-caf6-08da872e9a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 06:45:45.1452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXmIcR+f5nlGVxUSc9Nbz61mKO2PRds8T+VKM6nC3IEo8oyy8tI2WyOpwQ7RniZzC8oLIlqsXvmdj/iaEcJhVGb5A1CRW+nZsRAcmGLqwnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234557_108110_50721C12 
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

On 26/08/2022 07:42, Claudiu Beznea - M18063 wrote:
> On 24.08.2022 12:33, Conor Dooley wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Add a driver to support the PLLs in PolarFire SoC's Clock Conditioning
>> Circuitry, an instance of which is located in each ordinal corner of
>> the FPGA. Only get_rate() is supported as these clocks are intended to
>> be statically configured by the FPGA design. Currently, the DLLs are
>> not supported by this driver. For more information on the hardware, see
>> "PolarFire SoC FPGA Clocking Resources" in the link below.
>>
>> Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---

>> +static int mpfs_ccc_probe(struct platform_device *pdev)
>> +{
>> +       struct mpfs_ccc_data *clk_data;
>> +       void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
>> +       unsigned int num_clks;
>> +       int ret;
>> +
>> +       num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks)
>> +               + ARRAY_SIZE(mpfs_ccc_pll1out_clks);
>> +
>> +       clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
>> +                               GFP_KERNEL);
>> +       if (!clk_data)
>> +               return -ENOMEM;
>> +
>> +       pll_base[0] = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(pll_base[0]))
>> +               return PTR_ERR(pll_base[0]);
>> +
>> +       pll_base[1] = devm_platform_ioremap_resource(pdev, 1);
>> +       if (IS_ERR(pll_base[1]))
>> +               return PTR_ERR(pll_base[1]);
>> +
>> +       clk_data->pll_base = pll_base;
>> +       clk_data->dev = &pdev->dev;
>> +
>> +       ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
>> +                                    ARRAY_SIZE(mpfs_ccc_pll_clks), clk_data);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = devm_of_clk_add_hw_provider(clk_data->dev, of_clk_hw_onecell_get,
>> +                                         &clk_data->hw_data);
>> +       if (ret)
>> +               return ret;
> 
> You can skip this or even directly:
> 	return devm_of_clk_add_hw_provider(...);

That's a left over from copy/pasting our other clock driver's
probe function.. Will simplify in v4 - thanks,
Conor.

> 
>> +
>> +       return ret;
>> +}
>> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
