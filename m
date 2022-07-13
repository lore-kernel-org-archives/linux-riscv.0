Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6542EC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu3MFh1FFUjTtmMyU7mzbwNtCRmPVp1m2XEQkgNWWCw=; b=F/zG2KWidPL5yp
	xbYbNd/ZN3vvF6DgO99vy7k7kLedtWqpIIUA8zbmYC75vDPgjpTp0kzsVY3Wm6ZLmqPwJTQViqwgS
	Hhbh+b6gmOQF3VSwFQHZZrbTQ+EpCc+g0/FxVQii86J4nLb2rQRDwPG0LGfqOW59nWVFhfYvtJnlQ
	zFV36i/MGWNM+P7CKJ0+z91qQxC1L/RC8BJB5tYj4yveurmOUINBY+5aBxE52yuN51YI9CbA4yEIr
	IA5JmjiaTO8Hkuuat8102u39LmpqrcvMZwOuE78c0RYcgGwvYu2W/AtxGtmwTpc9Wnxs1mURnA6nc
	mrt8ibyfD7FmpEhAZODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBgPb-0066YD-79; Wed, 13 Jul 2022 17:44:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBgPX-0066VH-VZ
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 17:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657734271; x=1689270271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IwVwahZzpQ1N8ll0hnE/mDJqM+M1Dz3QCQsraghctSI=;
  b=HymYEnp7FVPJ4DYVqqPdsF/G4HZZEyYi1Kc4pwXnAiUNQGyVtgugj1tM
   Duwc54/ZPDTK5GSJ2EC7qyfq2K6CCIgajX61xHmztLXXa9CPqxkboJwo0
   CKV8xoNFwPy25PRuTEXwNK5N8y7lHSE0u9uKYSvnHKFa6OKpSs3mwDV+9
   tQlOcYvnPVHHqCbvWyvz1wnCaqHH6C6pJOxRC6OsHitCLmnZelY55vC/A
   0/ofLAFWj4hPsIojhmdWzARzc17cXALMr0LF0sx1czJN87jvrJcqyemDZ
   09qG4OCyy/V8gd7/QZYvgY+T65zvtIWmG32lCckN8mKK8ST4RqAuad26a
   A==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="104322994"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 10:44:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 10:44:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Jul 2022 10:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd0+xm5TlC5JhyNAo+WoPMKekPT8pkZ1rw2sryivoN1qeaGT1RUbAaH7x6Dw5xWOlapvUJIF7J5MpruzjpCifO6h2esdidAApkpKJjyF5rRg0h6BiWylFfi2nHVw8fIWYH4lmMyDMLN1IG06jjT6Vxp7966ZdQ8/5xRI98IdsbGmguM7rsrbOYMKOuTQ83JNRbRT2ZrcYww8e1jszwFmHehbbadZf8MiRkZWE1bCQ+HQDf8WHBCluqIv+fx3VcKkqsv7nHJ/hbH6+ReoUvonUfb0Ex4F2fprfQ/tO6meoEgyzBalqYGoG5CQa+ti6pJvR9e6d7D0OqUM0y6/yQa+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwVwahZzpQ1N8ll0hnE/mDJqM+M1Dz3QCQsraghctSI=;
 b=XQ30TnCrhkffZbOlsVdJZ7oqo10ISKSlWDlO6N1MyfMdI5vfsQsAgR/aFVJOIJpJG6Lfn/EVt8QEP1f0J8WRepfS9EkJaLGhOEHsCJhCFw9CIJqTyuAab2O4kOtztli55Fk7cW38nsdt4eWzgjP732chL3WfCsp8NBn3SH4Qu7o5IO2oXeSo9QNKRq3Mw4mT8s306b6RqONuxffCqUpR9RVjznrxBm/OwWdayGVQ0gu5pvJadChrPLa79n6zKq9GbrGL5ZCWkWUd44LrYwYicF8X3/bJbrYa3l5ZltQTPaaJ47ZrtzRvuZy1AH3iqDgwi3Vymnc6pi4su9BPfnuynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwVwahZzpQ1N8ll0hnE/mDJqM+M1Dz3QCQsraghctSI=;
 b=voKnBiGBDp3xPMk3DRonkyFrVPXHno7/a09tR9J1jvS66fM9CVDonOFlhvvEKFlNWvyctufb+xs01PkJC0295mnSU5s35uLQBvuLUU2xnXWPTL3DYrxxWBNRrr1gvroNaGeeuer3nyrGjlsaRQ0gwB+QlFUcUso1M5cHT2J/UWk=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 17:44:17 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 17:44:17 +0000
From: <Conor.Dooley@microchip.com>
To: <andy.shevchenko@gmail.com>, <Lewis.Hanly@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemVrcQOBoUV020qkXDgR8Pgq18MrcAgABgUQA=
Date: Wed, 13 Jul 2022 17:44:17 +0000
Message-ID: <debb6cf6-65f8-53d2-d8d7-3ed1c3d5a8c7@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
 <20220713105910.931983-2-lewis.hanly@microchip.com>
 <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
In-Reply-To: <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a02a106-8ede-4adf-e240-08da64f74f26
x-ms-traffictypediagnostic: BYAPR11MB3221:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TSJYZLEm8XYzVK0PlYniWcuFzUlOKcBfuWy8+sGQqaTavYLj5Qkq3nNBF4vOLXRWvdQtQ8gMOIR8Riea2nlx0mg725uVJQkjWBaedvMHThaBrVh4RM+UpHPeBWp92pTbhnCkYtw8cDZHVEk8tZIrcTyn3nrWK5Za0Up+5krzdWoPWpBzuxnLgAHBThy3Pw3lMRbcQjlAiW9P62l+nsb9sTN6HVJKo+SPvLNikqK+8ZVCbfQBsCWXtlM3RjMSuFxFEo892BB4h1Fyao+kzROMPY7EVELAeEGtb8ofFyjPu6l/2RpD5d2BFwQ92ssbUeLbOcC9DH8XgMO+CeLfAkQN7yx+2bX6VKFL2YS2SzY62DWE40sxH6shQOQe3praHVxRdx5Qv3XS1toiLr1cJj8mAjZO7JVCqntlpeh6I1KgdvUy0Bq4PuuPU39LtmXxHmvzCfI0qwRQK+SfbszSuEsngeWXk0BbF/y9fxFe3kMTZDBMj+5NpUY6UdHKRyol03RJFfceOMP0mLGw4iAHqJ0EpCFdNU8zz7ajRAZCbxR7KLYUal2Prj1/gyTZ8jefccCXLWJmKyF7uPk7kjaOwvTXiXLFlVZ+/xTmV8pN9QWFFAlXuu5B/vGhZ2wMVGos+TXdpzD4cvTJcS3e1n2EvsztNGmSIe4WauYFQpf5fQpB2mq24Z8GKi//bzl9+vz7aflspAHhunEVh/Ul87/eWqdnsXByk+dUjgmgd+ZcrcfCurjJEXA09qw1pn+ZbB5JN9BR/283WFM21Sgp9LBkCvXJB722dzBfQ2EVoU2SiMZSpHOLmfy6x27zpsC5Z2pLMFppkGy7ksKbSHlcnazCLyZ1CPBW7agimVqtpt1fxyIS84jRm9RkTKkGUYYJJhRvX8bm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(346002)(376002)(39860400002)(5660300002)(110136005)(6636002)(53546011)(76116006)(54906003)(66946007)(71200400001)(41300700001)(2616005)(91956017)(316002)(6512007)(4744005)(31686004)(6486002)(186003)(478600001)(26005)(2906002)(107886003)(6506007)(31696002)(122000001)(86362001)(66556008)(64756008)(36756003)(4326008)(66476007)(8676002)(66446008)(8936002)(38070700005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekZ1dlR2SERQWitYRVhyeVhLYlVXNlh1bEkzNHUyOWVQUkFuNWRIM25wR0pp?=
 =?utf-8?B?NTdNYTE0dTNwK1ZobVlodWF6RzFuWUpPK0hTdkhONytIOVVpNGl0emlmK1ZD?=
 =?utf-8?B?UFZmRFpnK3YyMmpYUnhBbG9tb0xWWXZPVjVWQjdaRzJCdGROZGQ4OGM4dG5W?=
 =?utf-8?B?MHdNdWMzbjBTNkE2WERLWnlPS0xBT0VyZjN0M1l0TVhobmN3SVNJKzdVcEZ1?=
 =?utf-8?B?TW5lUTBFUkgvNkpESVYwbmlveEZFT1RkRlgxOXJhdjlTdzdnNytpYi9ZL3ow?=
 =?utf-8?B?VVZOTUpIdUp3bThSVVkvUVpTRHFVUkllaWxVRGF0c0svMEJiSEp3VTREdXJK?=
 =?utf-8?B?bEJmYXFDNVZUZEZqVjZVOE5GczlVNkltRjEyWjV2N0Q3UnhsYjRqWHBSb0Mx?=
 =?utf-8?B?RTA5YmcrQi93UG1EL0xnSkZaVVZBSVlWU0lORU5tT2c1WE1VRnBkSExjcWZG?=
 =?utf-8?B?b0M0Zm9heWc2aGJxRXRldGhxd3VyVW9UcjdWei9wejFXMnhrV2pOMm9veTRJ?=
 =?utf-8?B?d2NONjdsaHlkZEhVWFljQjJMbEgvYVBXbVJOTWJTRlhMZVhYWFRtRGNDQTFP?=
 =?utf-8?B?SjdVRmFUK1dHbndVaFpzMTFyV2hPU3RMdlErYVFmVkFqYk5WQ2c1Q2hQeGdr?=
 =?utf-8?B?eXN3eUNBcUw5TW9FRlAxc3k0OElCQlFQNUsxUGpxMTJMYXdncThTQ2ZqdXVP?=
 =?utf-8?B?NUphMThFbXZBbXRmajcrQ291eFI1dmxsZDhJTmNGUVFZdW0yaXdQVjNjYWZU?=
 =?utf-8?B?djJhdzJjYmk0NE5mUXVxeDU5UUZRd1poTERuOURjM1NlN3J6ZU13cFQvYWtG?=
 =?utf-8?B?VklLZ0ZlOGk5Q3NPWlBmSUh5WHNXTTZ4cFRVeko1NUg4ZEM3cFA0aFVtdUt0?=
 =?utf-8?B?K2EvMElmRlRyUUkwa0RZRGpOdVhLN3pSbzlGekxMSlFIZkF6Mjlja3hPdGhS?=
 =?utf-8?B?bmtVSDZuN2NNUUg5UW54MStHUmtLc3ltelBsdWdVaHA0OW5BNFc3ZjA0aGxs?=
 =?utf-8?B?bXdIZ25nQlNUSXRTZk1vQjBEMnNDNjJZenNwNktaNjBvN1JpOTNlbkJYbnFn?=
 =?utf-8?B?dWxWbi9sMW4yYTlUYXhWdktnRWxQSi8vSUVqdDNTUUhQRFFkck1ReGxYRDdG?=
 =?utf-8?B?TktVemd2bG1lcFBNdDZqVVArbEV6b0JiV3BOVWpaOWE2REVEWlFDcENlZVpr?=
 =?utf-8?B?aWtuaXlsN3B3V1hkMWFZNTdJYTlzM0ZsVFMxNzFMNUFRSmxWQkladThQZzdU?=
 =?utf-8?B?NTdnMG9QNTRWaHBuZThISmJ4VWhlc2ZPRHArZ05Pa05GVDg1cEhOa1BMQVVt?=
 =?utf-8?B?SWk2VHpKTTE0UUhjbDFaY21hWEVTWU5LVzBFaVo0QVhSbGhsVVNHdjdSQjdE?=
 =?utf-8?B?U0t1VUpUQVExNVJhQVNjbWRUY3hDUTY3YVN5SWc4Z08xWTU3enJEUTRHd2Qy?=
 =?utf-8?B?MzJlei8zNjFCS3dYb3Z0N1pyQm9Yc0ltMFdxeENsWTZqdWZkV25QRlFIeG9s?=
 =?utf-8?B?Y3pDR1hJanN2UmZ0NFJOUytuNE5JUWxCNEJ1UG1EMUFrSXMvQWpzLzJDSlhh?=
 =?utf-8?B?Z3hjQW1GK2syeUR5QTRvMjl4dTkwVGl4TjBNWU5mVUd0L0NIeXEvZnZOYmJp?=
 =?utf-8?B?a3J3czI4ZUZhRENYeEd1RUNXejRZaUU2RkNDRVdENlIxdGEwZHBrREljbGV5?=
 =?utf-8?B?TWFCVlg2dlJQOE56czlDQkpkUG9icWNBYXNPcE00UERreGtvYmZiVVJ3NEo1?=
 =?utf-8?B?WEVPUHRJTkJ0RnQxaHBESFN0ZFdGZi83NEZKZ0tIazRjTE0wdHRURjM4VmRI?=
 =?utf-8?B?Z05QeUdCajVId1RiM2VUVGxLQ1pKNGVma1NRT0d2bUhJaHFScTRnYVliNnBk?=
 =?utf-8?B?ekRjNy9yZnlZdzVLQmVxRHhpTlF0dm10N01iRTg4NjI3SER3ZkN5MmM0QkJi?=
 =?utf-8?B?SDVCZC90eFlTZ3pVK01UemhzUFBrVFN1SzFjUkYyNHNKWWltL2QxbXBpZnhB?=
 =?utf-8?B?ZS9kK01qdmk2aC92bzU4VzVnMFB4eExsdGpaSVBTOWNmbituUXRHS1hIOERH?=
 =?utf-8?B?VEZyZGg5ZkNSQ2ExVlJjdnVEQTBCUEVLRzNhR1M3TlFUTDErRDZVa0YzakRu?=
 =?utf-8?B?a1d6K29oMmFZT3ZYTkN1V0QwY3NNOWEzaG1KZUJUSmJ4d295bkM2UlVCVEZ3?=
 =?utf-8?B?Vmc9PQ==?=
Content-ID: <032FAAA89541DD4CAAC1BBDBD5618552@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a02a106-8ede-4adf-e240-08da64f74f26
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 17:44:17.3369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGjMt8qoJ73Od3GkzrpDSzdpPawP5q+lAY8PaKLz8TR+cNtuDOggHHNk52oG1inFaM7F66eLYDOnHtjL/m0nec3HN2bwMkAV59SXlwNZ7Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_104432_332640_2CE7F000 
X-CRM114-Status: GOOD (  13.28  )
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

On 13/07/2022 12:59, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> 
> Below my comments, I have tried hard not to duplicate what Conor
> already mentioned. So consider this as additional part.
> 

>> +#define NUM_GPIO                       32
>> +#define BYTE_BOUNDARY                  0x04
> 
> Without namespace?

Does byte_boundary even need to be defined?
is incrementing an address by 0x4 not kinda obvious on its own
as to what it is doing?

>> +       if (gpio_cfg & MPFS_GPIO_EN_IN)
>> +               return 1;
>> +
>> +       return 0;
> 
> Don't we have specific definitions for the directions?

FWIW Lewis, they're GPIO_LINE_DIRECTION_IN & GPIO_LINE_DIRECTION_OUT
I thought something like this would surely exist but wasn't sure.
Thanks for pointing it out Andy.

Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
