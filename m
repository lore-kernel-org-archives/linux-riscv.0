Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE7DECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w5kb1YjjV2ydjcS2hr0J/5NmFZg6pAlMJUOIg+mbOQ=; b=Qq+0b0X/vTi8Vd
	ad/eGmSUk9Yy6VwCFP2tY6sPrCx6BnODRBexsEFWXV9joN2kuuAdkRmOD4B/koaPOlKvTDGxbfmt/
	jDSSIlYiK1k4Xk0LcKEPpV3+xBunbxucjRUw5y0V2mK8/lhbQEDF5BuAdh7qPbHZAxwf+m848NWx2
	FQKxglBQtVnqjYkAKgAdIpJ7FQiV0j3TlP5GI5bQXX40JqxspCRKDKkTFUdbyHvEE61dBL3P/4+nm
	I/Zeq3t5ebGn7S8f0uTvN3kgcF8eTtyXuZ5WV2day72e+tkkvQDV8ISSPudGT+392YS11W0NNcEVG
	LwS7ZJ5Ao6UBxbpCFDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCT7-003Vbj-4C; Mon, 05 Sep 2022 13:48:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9cb-000bdK-QL
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 10:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662374789; x=1693910789;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1tAajSU3YxRg9haF8keeSe6wLS+bENdPS3ZSJrGtYQw=;
  b=XvBbdbn5Fnu/er8XupwyeBRKgkMlEBqQZ4RAxj3/oLopHrXIcCshsqLx
   yOO0GvbUHGG1IOvyaZtG44H7smn3cvIVP6acdoV5qwiM/ms7H3kASaBFU
   htpNbnSoSY0yGtAvLY6RtzYJ3LacgiIAjlTaBb86NIT5691YkFDunpAeH
   8QYIb3Z3qLWQh5eFOdO9RFTnITcmWI1eIZSSJE/63DIh4676ahcveVe7k
   m+u0G6OqbBIYjxQhEZmAdn63pPgXxGR85aUot8BYJ8MBYgCUZkANqA5Ux
   ye4x62W0EncGnC+DbZ+lMp5LOQ6HH0OZHhhLbrAdrUqWOj8I0jWX/2re8
   A==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179203804"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 03:46:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 03:46:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 5 Sep 2022 03:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diqgeCoPO2Yetu0bWhwUQQ/g0Ald/UNiwJqtlCPESOrHxWeCovIvHxLWBBPevVpL+8ihwbUt0wUxvits4fY5nxiiUDXVDyPeSsAmdOogPpa8yMPMqDqxDeS62oQlkPCeWQfTrXR3PuvUZdeUGevzA15CuFGB7Idx5D8ie8q/MmV35hhxqwgyXaImMX1KmldR9dbA3oejyBwqoNNoNgyourEebWy1R/P3LZdgCKIglp8t0TsoSASL6mhAdGxWB6icUqn2M6FOO7rWbemdAzuQq6tAgL7ahX7UBFvYHY1y6U5UwHvX0ClTVQB7Yj5h1/940Xhp1jhjfPX53k7C6v6sSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tAajSU3YxRg9haF8keeSe6wLS+bENdPS3ZSJrGtYQw=;
 b=LYdZCHjvMoTaGIEM2EGlecxpU4oVBKptqQEVWH3k8WBjBOYXiJhDzP4AekJ4fIRVvOPfRWHSxze6fjwHT0WM04yvp3ktqP1/LevpySz8cu2tke0K40p45ZnvQT0uI9mFmOHaj8zMrYPbLlwXGDYMGtTpGLJ9QBfHc6nUxe5BppwvmrW6r4GAjOhzPhl4PQj2S1f7e1QImBH1lPlrPt5R/eb7ob5zta/M/M0xSgJ0Ln/qcqVkrWGxq+8b2wVQHKMKV7agryvSwevAbpq0duhr3di47it9hZeE9ElsGgLyJzJs6D8i91kSr+ObAskJghRPZtpja+v1nLMfpw8+ddllYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tAajSU3YxRg9haF8keeSe6wLS+bENdPS3ZSJrGtYQw=;
 b=vBK4XNvb95ThXLLNeL2cFqBngZglVkBoJKhENlFQd6yaB0tjYh7dwv97zc0AB888UaKTU+QH4Rrk4B/RzTBvYBM+VKNsDEeG3nxcd76Y+JKGFXtkN1vx0zSeeSMh5dDeYvuNLe7HLOh4Le/qYTjMZzfLOpAKheakbaa48aBkh+w=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by BN6PR11MB4052.namprd11.prod.outlook.com (2603:10b6:405:7a::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Mon, 5 Sep
 2022 10:46:19 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::d9b3:8e55:269c:b122]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::d9b3:8e55:269c:b122%6]) with mapi id 15.20.5588.012; Mon, 5 Sep 2022
 10:46:19 +0000
From: <Lewis.Hanly@microchip.com>
To: <andy.shevchenko@gmail.com>, <linus.walleij@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>, <maz@kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYsJ/Hf9/ChBUZqEipNmgMsTD4GK2601kAgA7F+QCABy7jAA==
Date: Mon, 5 Sep 2022 10:46:19 +0000
Message-ID: <e46a88a8b6b60e56db82c3a42f7ba38068aadecf.camel@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
	 <20220815120834.1562544-2-lewis.hanly@microchip.com>
	 <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
	 <CAHp75Vc4cMGBdJpOsRMDLWU+6+eYwbsF3-Mz40-KazLGhwkHMA@mail.gmail.com>
In-Reply-To: <CAHp75Vc4cMGBdJpOsRMDLWU+6+eYwbsF3-Mz40-KazLGhwkHMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75205cfc-4e84-4eb5-bc56-08da8f2bddbe
x-ms-traffictypediagnostic: BN6PR11MB4052:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 21t7SLQqW6nYoPRlE34mQRHLLAnCSXNTY6zM0jTc+fIFPXumHwL4j7JI6ibx8PvxrZvRJAAKPvCAhaZHDyY6EE//FKVTNy5lOX0YgCh4DoI8MLtRlla0UoSHBBYxXqEwoaY6PRo2vCrNh/8I2dA3vBqsZxoVypGKqIVZV2Xf/jBCTcgfqqDdKseTr1DX4q9WWDnNf6DdCszpM2VAW5ssJ7G20us1m1OekR0He1kfPToK0JSthH37IOs2u5BW/7tioMqq34EgyepmqN61joc7z7xtYNlHNhbvtTEtSU4WxZCEr8oja5nN3S0Y02J3UqbcEs1SAr9fXUK56CN37fnYwcxa7c9UHaP1kp8RCXXT5jKtPajQE3MHMNgyNaEQtVFhpY3HUWF9cpRcsPlGKcy7AZygPRrSQ8zhP6eaXAprNf48sCtJ3Ri+U4sdJKYi1XHNp3XvoD6OFiiRpsotmbe/wJ30emXff9ms/uT13KvAdnJyNh1jtts6492uM3kJ2llu1GEYnriPR/zY8YIQP03WVxJIdGvvD4tVZFA95OCBqQ5Oqup9KZAooJoAQA0k1vWjE07Shj1wshEDjFLIl4pw0EyneLwfOwekWJsqchXTblcQevj83Cwh55CFVjN1DpsWQ19LoL8MJdkbpPDHcNHw3RuS9uA12GMja6xo8Eg7e9K003m+v+P/00I2OZTfqu7/csOB9wEz2LVZBfd0FN+EYqelFRAzEWxX4xzZMA6r26anjGkDZ9+HNDOpU7DiJoT2w1cAJlaumRtikVBIyDpNTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(396003)(346002)(39860400002)(6486002)(478600001)(38070700005)(2906002)(2616005)(86362001)(8936002)(41300700001)(186003)(4744005)(4326008)(26005)(6512007)(6506007)(5660300002)(66556008)(36756003)(71200400001)(66446008)(38100700002)(66946007)(8676002)(54906003)(66476007)(64756008)(316002)(76116006)(110136005)(107886003)(91956017)(53546011)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVNSU0FLZWhWKzhmbWwxMG5Zc3lwMk1BdEFSV2RsMUZtTUpPektJOTQwL2xS?=
 =?utf-8?B?K1A3cHBKeVRkekNDMnVkVE1PTG5NbGtnQ1dQRUttc1ZPMjc4RGFzalJnbVlw?=
 =?utf-8?B?VmdzM1g4ZWlQbWxQNEJWbXIyRWJyYWs1NVNINENnV2NGTXJJdG0xT2ZUZUhL?=
 =?utf-8?B?WThwT3dRWVltZmxadExETzhtTVFZYmM3UGN2KzVUbWh1KzNsUzZTZzJNTnVh?=
 =?utf-8?B?bXVwcVl5VS9Zb1ppWU04V2tNZDdoa21yQWJNRTlabUhSckV3d09JaHNVVEtY?=
 =?utf-8?B?Zi9QVVpRMnZkYVBWUnNJaXMzV0N6VkVOc0R6c2wyNExOWE9kajJEQ2NvREFR?=
 =?utf-8?B?RzlWaFErR29vV1VwVTNydSt3TFlCbkg0SU54RXhyMkVZTjlzWnhJd0hGMWRJ?=
 =?utf-8?B?Smtpei84dmlFS2l3RFVXenBWTXV4M1R4dis4S1BNdFZJbXhYRTdnRkNBcHJv?=
 =?utf-8?B?cVNXY0RMS0dkYzBvUHViWUhuMUIzTENZOVhqOXY3RU85OE9ra3VKUFZnSjUy?=
 =?utf-8?B?Y1RhWXBySjJ3TDJnbUwvY3NqdjAvQ3ZLNklzYTVyZVBpWmx6SFFoVHdFUW00?=
 =?utf-8?B?N0FXWGlVNjltdk9yU3FFeUxOWjVqRVhzWWRBWHllN0JlMzdXYmFWYVE3REFG?=
 =?utf-8?B?QnFoMW0ycjhtYVU2ZWZsYzVNWGQwS2xnNDZqSnpINTlscGVZRGFlT3FtNTNG?=
 =?utf-8?B?bENJWlpZSVBPSUphY1M3Yktmdkw3eWFsOHJMaXZCY0NXUng0cXQ5UzNxYkVa?=
 =?utf-8?B?Q2tTQVFjRi9HOHV2SjV3OVYrbExmcnBucG9nQ0ZMVXg4Q2pnc2E4UXdZcVVJ?=
 =?utf-8?B?MFRpaWZMT21IbEVZSjg0NUtvNjFWVGxhZStBdW02YURXQ3Y5ZW1tREJXMmNW?=
 =?utf-8?B?dTlyWU1IV25kTy9zUnVXV2hCbVdCRWF2anRvcXJxMi9aVVdvUWdKZE9nU3Yv?=
 =?utf-8?B?RzFRTGFPL3J5dUFDV3k3OHp3K25sdDBBVitxRGhpL0d2TjVUY1RJSG1JVElL?=
 =?utf-8?B?cmlLRXBhd3ZXZjl0c0kvMVFFM3h6SmVlVXhkNksvVWl5WEdVaFBlb08vTGpt?=
 =?utf-8?B?T3NKN0hPbTI2VTZoNHN4TG9VZDQyVTY2Sk5JenBLdzh6dG9hN2xycks1ODQ0?=
 =?utf-8?B?d3JqRGZ5ODJ1QkFXSFU5N3AydnVpdnFHekVhNTFrQ2lrNTRGV1RkTTFraHpq?=
 =?utf-8?B?ZCt2ck55aThlMi8wSFBMYmNKVGU4OHp2UTBtcGt0R01SMExLRUgvSkp3ck84?=
 =?utf-8?B?cHpkZVAyOXpYN0pZOFVXRFpOK2xIcFpDa1VTTk1qRzBMNUo1TE1rRHFUeUVl?=
 =?utf-8?B?NFVnMnlTcHYxUkFpWXhsTXBPRHdYYkxrZStLSlA1MkY4TDU1eC9lT1lpM3Zl?=
 =?utf-8?B?RDVSMnI1WStWNTYySElRbm1jZDRSUFVDNzlDMTdHcUtVRXZsbk9oUGl4ZzQ1?=
 =?utf-8?B?c254TEhhM3RUM2V6WG1kNXZveldMNXdQa3l1c2VPK3JSUFRyZllLbVhIa0ht?=
 =?utf-8?B?UTNWSlpmaFpMNGk3aVd6YjFaNTE4TWdTbFc1aEZiakZsYlFlM21lM0ZWdktk?=
 =?utf-8?B?cnhLYVo1T0JVZU9odGk4OWlOYy8wTnpyOVBPcms4V1FlZjZCbkJhTk1DR2VZ?=
 =?utf-8?B?anBTcFVvczA2SlJmN2RQWG95WDA0bWZscUNpbVdmcDBnUlQ4eEZoaTMzQU5h?=
 =?utf-8?B?cHNzVWlndGlCd2szUHdEU0IvMU12dEZzTU91WjZHQ0pJbVNyOG5SWGFOMmov?=
 =?utf-8?B?OU0zQldWUFFKZ0JEemtIa2lxV3ZIL05na2dGVFBBME52c3lkeC9mR2pFeEFi?=
 =?utf-8?B?dUJwSmc0N3pUZGp4Ymc4b2tYd00yNUpxcHg5N3dubGEwNlNoRDl3bkZKUTFr?=
 =?utf-8?B?dTlnWGZ4OXVUUkVoNXlMRXhFQkRnL1Y3YU5hTjhWSGlKbUpNY0M5a2srNG83?=
 =?utf-8?B?QjVCT1YrekY2OTNEdmd2c2FIYjNEamtDblZ3dVZPVURoeFZyaFJKbEpDN2dW?=
 =?utf-8?B?SkdWZEYvZGJONmtkTjJRL1NESDJxWktTZ3ByR1FNcmQzTXVPRTdWMHFiSUFv?=
 =?utf-8?B?Q21uY0JjMmU2S1RSbXZNNW5sL3VvMkZISGxFS3ZtWTNQRkhTdnNxRzBFejBu?=
 =?utf-8?B?cTdwNFl5eEQ5WXA3b25pUUhxdmdKemNleU9NRUZEVVlZblNYei9pRm9GZWZC?=
 =?utf-8?B?MFE9PQ==?=
Content-ID: <4139CC13E76B2D499095B37799AA5CE3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75205cfc-4e84-4eb5-bc56-08da8f2bddbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 10:46:19.2820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o5NnqlGFS2MRlRgN5kS/oZMU522TSYKYLQXGm0dCdXpj6cpWftVvoAi68I+NZNJFUscx5sCKfsEJ8T82keU27++dsyIpjb5N7VOWGima+4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_034629_926793_ADA5B664 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, 2022-09-01 at 00:04 +0300, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Mon, Aug 22, 2022 at 2:30 PM Linus Walleij <
> linus.walleij@linaro.org> wrote:
> > On Mon, Aug 15, 2022 at 2:08 PM <lewis.hanly@microchip.com> wrote:
> 
> ...
> 
> > This looks like  textbook example of a driver that can use
> > CONFIG_GPIO_GENERIC
> > See e.g. drivers/gpio/gpio-ftgpio010.c for an example
> > of how to use bgpio_init() to set up the helper library to handle
> > the GPIO side of things and combine it with an irqchip.
> > You get get/set_multiple() for free with this approach.
> > Also see documentation for bgpio_init() in
> > drivers/gpio/gpio-mmio.c.
> 
> I would also suggest looking at gpio-regmap.c.
Thanks Andy I will review the regmap.c file
> 
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
