Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C2BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwanozkrI0K3F043L8u9hG/BCJxmlkr4fn42TYggeVA=; b=q5NrThB7C22R1i
	k4S5DJx4gPmjGPyKgb0Wj01njvEIrS/XP1yPBHTKw+ZYbemYCjDgRQTnyFhIbdAHw5aDsrEg7rEjP
	PsYLckHG2udPYsQpjg4VqrWoyLvsbg9HatLNfC77GvnM0WUvis1FShCtGOWTvo7JsI0+2R9TakwKr
	7r81AW6PENecFlRlcjnuEnpSKVIfG5OXIi7bgrTCpbx1e/KlicnBWLmyj+qbb1ANHkHRQvaCKXweQ
	oyS2Dw0T+yFjQT9S9UQLPdya2rljW0QtYa77E/CfrYgoVgWNUHD2ThkEHavGtVvOyleCovwHXCB7j
	+Za49h+2VNO3SNMnMrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90Hb-007L3T-HI; Wed, 06 Jul 2022 08:21:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90HY-007L1p-Fq
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 08:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657095672; x=1688631672;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E9nRQihHdZOdqr+KpJF+ASnZnmfNgPvtTpnYtXpxSDc=;
  b=iZjFfv+xyf5DCPJXCO+Je4x7mxmFzo6I5ybFMmuxlUHIEevjvMct2qhH
   QUXXFAikyTnwBi/FaFaAJCpGZGV/EClVvjt6ie0DnbZHxkIvmO1LSdG5K
   QcJ2XOIhm4SoE7ctM+A9U4bfVBjLfbpJJAAziqxXHmoggzJsjQwrYQ6QE
   AkFcqFgASm5yVw1FophD4W7n9V/TnsQZX0QlQLiJqU7vBPra32ltqFauf
   Uhr8GS1SzQsQSbkiR5cx5TGQQJ6Ow5z1+lXVJBgZEn3eopdl/sp7mbe1j
   l9/bh8vrBb6VmYnCl2iwj2iAaqZ5XvcpTdVjHisazBE8B3vKvn0QfM9Vk
   w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="180946454"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 01:21:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 01:21:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 6 Jul 2022 01:21:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBmU2Fr5DB0zSUsMNB9Pby86+v/0LrCU7S4nu1ufhZnLLNxrKY4ZqCmZhRRaSPgX8jXNICHxTQ0akQjgnu0oX9KRWGbpo28CRd5ajI0JFdLACgbYxs+8dPp+5P6jpkOIj+hB6G111Py1JP88odK30L/hKlQN/h0KpYOatqe6GlAJC9rJPsuMEmd+5a0RjRmA7sooiCx7pdCg5/+2PKlGR9Wh+B7aeQwbnbZ5XPmpQKp9Fcvre5XbyXwVvFj9F/ezVI8fsXDaoUA5DHTUCfYZBbjbArznmbdxxPk1o+qjCVsy8FlJANPiGCUH7cWFhco0ngL/okFSq6ZVzc/DIT8xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9nRQihHdZOdqr+KpJF+ASnZnmfNgPvtTpnYtXpxSDc=;
 b=Ftq0NU0Eh82OI4o49Y0hg0EnIsa9e3ajWmHHTXCa5WKcrWCT3CNJpg5AtQtkSX6ItpnY+8N5s5ZdkWq285KMruKE0FAuk8Qu4bJ1nJtLohoQD9P5Gga5nSdoLrpfkeVcZv65B3v5C4CaqVkoKaHLb+NdsNwhw0foYZGjNFtRn0NWJwYCJvFpl6buedYUM3BAAv/G7+g+MHaW/j9pJm0rfpfLrr8NjK2HjjIwmwXMBSHk/0M1kzuUCGO4OnIzTdLs1qQEstIGKQ16mfn6cGRj2GXnVTwt3Beh3UAe9aNP3rQYjLTFZmqxvnllr8JMMRT65wKTYX/YziaVmDQX5LhawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9nRQihHdZOdqr+KpJF+ASnZnmfNgPvtTpnYtXpxSDc=;
 b=DfxscX9sd0p9DGcR7Z1uNwKuNYKz/8IK+wT6rn6SKdKQwEpb0i7LYIBYtAVZbAIcSWhSgNgmZRFjr5+IfRiTN+kyvUFmsXSICL6mFjFMfSbIx678Efito+iMzAXuZyxg6Xytx33NHmzysgL0bL2tRy109eF4rpVXNoTvMzz1lx8=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.21; Wed, 6 Jul 2022 08:21:03 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 08:21:03 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <damien.lemoal@opensource.wdc.com>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Topic: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Index: AQHYkLmL7CYc+NRsR0eTQHc1KpCiaq1w/ESAgAAE9gA=
Date: Wed, 6 Jul 2022 08:21:03 +0000
Message-ID: <e2e7ed45-e905-13dd-1c43-96ee41d961c9@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
In-Reply-To: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f8ced39-d854-4ca3-636e-08da5f287784
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IShs7s6WDbmB8bBMudNwpoZBkbbKDy+OQhwxWE+gF6k2yi5Lhe8ihJ5Vtgto73ZuSvjNXOreJRhVpdwvi3fcJxemrpoAWebJJeJiyC20te5mvSbDtBjPtAVbKJP5nnxbOuEUr1C5QupFgd7AmpGp79YZ8INn/Xx90Q4xO+rkqxA3O+Mrcq4OgzcBn9SFQKkOPwtXGcSEJ9vEim0cVhylsRs+Z97FcIFRNwJV6Dr90Jg+9zo+vtIxyD4RaYXV+HygR8/OkpGKmcG8t1DuPW3KVZ2r4kqU597SnSydATJ1NvEvjQLPpNXyDPbWDw8qZIbkqK8LuZtN2bU1mlqdhJqUkBVhhaLge6qPx9OGSGBYzYtnX4tMBdYRYrpU5AS3MiwQdmXINhU7Yok5unE26tqp/JGy8Pj/7HgXPZ6Vc43VG1ORMp9EZixUFnJeO5EvWxdlKuKpB7M894J+/uxuI/jCuJgC7yIg6aFsUS6il+rzYfVjrk/upjA7ovqCRalofC7pujamSN7UEDnNFpnjWan+vd8AihLU4XWr59XfCxHHzGOnNYnTSnZa8c0mIFPITuSK1tmpwRlPX2ThymjA84KxbDm7WpTd/kQp14daTKsE8tMOfcpGMS81JqxzJdBP+Sqk5+NNtg0YlIkblP3ga3YmwxXdXZhHAirCyupP9tM2vVAb4pI1CTKU8O0+F53b8DvQtIPGDa8Bk5CcTOd2j30NQkLXrpBuZxxmmrqWaIEOQkR1EZ9fMP37/Gm+sqMjhXxidgYQOvxFETo8CRg3YJQElHwWT7AK8RX0IkjrPfnJ/VVmwFkHQOGQSEzfeFGKpp+szRbrxi/i3JYLqQ73yKR70xt6ehO9bNmdG4ORItmLqHCecp6KNhee596CtbuEyA7bCwlcU7AYqDkPqKAGP5Bu+1WRqfN5PQpL3CZrMNuWIRI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(346002)(396003)(38070700005)(122000001)(54906003)(316002)(8936002)(31696002)(86362001)(7416002)(5660300002)(83380400001)(66556008)(66476007)(64756008)(8676002)(4326008)(91956017)(66946007)(76116006)(6512007)(26005)(186003)(2616005)(6486002)(38100700002)(966005)(478600001)(71200400001)(31686004)(53546011)(41300700001)(66446008)(6506007)(110136005)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3c3YkR5VEZ2Zk9XTHh6RGgxNVBEWFgvUlYxRVVDK1Z4SUpwRWM3MnllaFdD?=
 =?utf-8?B?RU9YZFNsRU1ITjl2ZStjVW1iMDBHd1NrZ2wzUnhYakRyZFR1Um1iZ05Qc3JT?=
 =?utf-8?B?WmthRUp3VGVSeEJaMlBUUDV0T000bzBmaWI3WkRtVkxWWUgyck5mNUJ5SUFY?=
 =?utf-8?B?REJWVUwrYVBhZm9QWSsvYjhQeXp5amFXdklpaHNkY012eXhBWDlSdEUvMXUr?=
 =?utf-8?B?eWhOdzJkZXBMQWVLeUMrVHcvOVJpY2N5MDNHbEFYSE9ieTk5RndZQ2dZOHl1?=
 =?utf-8?B?dkNlUDZFZUxIM0NiSDdIQkQreGNGUG1oM2c3TlRyNHp4N0g5Qmc3SEdjclNw?=
 =?utf-8?B?TnJLa2hoS2xnd2p6K1hyeCs2VVEwZXdIRVFsSHVtOWZUWi8xRU5Ja1RlejAv?=
 =?utf-8?B?aWNOTWFwMzNaMk41ZXB0RVI2Z3RlUFgrbkVzbU5GZ0JxWHY4ZHJMZWlTcTZq?=
 =?utf-8?B?Q1gxcXFnYlFKYjd5V01ZMk5BY3B4cmsrUW5RM3ZFN3hLTHYydE9UUlFFdmZJ?=
 =?utf-8?B?b29scU1wQnRZSjM4WGpvNFduMUpqNHducXFTZDRHS0oySmZjUlc3Zjg4ZzRh?=
 =?utf-8?B?a284amdJREFleG8zaXNVWHdSS2cvQm9sWUpzbG0vUy9QSGdHZUZWVlM0MUM4?=
 =?utf-8?B?Yyt6QWdXNnh4aVNObWplY2dQMDVRQUowbEw5ekwyQ281MXNQSHdGdEsxQVRU?=
 =?utf-8?B?eVFzQ2ZsWGJIZXBBbEhJKzY0K2ZKZk8yM3E4WWlENFRsVXNoVDk2dVgyQW9y?=
 =?utf-8?B?WUhGMFAyaUE4TFB3OExOUWhtN3NOQ2FnaXkycHBOZG1xd1JzZXc2MEZ0MzhD?=
 =?utf-8?B?TDBWdFU5ZEU0cTBoWSttTFJUUnNjUVJCbEtzU3BPS2VLK05Fb0cxR24zQWdC?=
 =?utf-8?B?bmIrM2QzYzkxeEtuZ1JDNVBPRG5rWG9OSkttbGI4QkdIb3plNEZVODB2Ry9F?=
 =?utf-8?B?bHBsQnBacG9zZDZVTzJBYkcyOFFiK2JQNllqWDF3WExpZEFLN2E5eWxZM1VJ?=
 =?utf-8?B?Wkp3SU95ODBsRXVrRm15VCtqMkhlWE4rUkpXdGdDL1czcFEwY3FpMm1nWFJJ?=
 =?utf-8?B?UzNJU1ltZGJRZW1pVFNiTGZoRytHN2MzczZhQ0VKZWtCWTN0aTBjTStwNEdh?=
 =?utf-8?B?YU5odnVZNm4rNWZ3VkZxSVo2eit6bEJNWEdCdDNJWWt3ak9aeW1hclFMVTlB?=
 =?utf-8?B?Tkc0VjNoL281MDhpemZ1Qk9uRVNiVHpTY21heGZRUituT2tNWEpBbmp4TjZP?=
 =?utf-8?B?MjlJZEZKL05vYk1teGEyeEtZUm1qR25ybnRuZkRlVFIvdzdGa014czFNNVB1?=
 =?utf-8?B?dFgwdHA3ZmY2VUVLQjNwdm5OYTM5bmJmbldzbkxHMmlXUld5c1V1VkhVTEts?=
 =?utf-8?B?ZUIyTWpYN0tHMzZ2VXJCL2RFbG81d3pMYVBIcXhYZE9KMVRBVkF6aDcxb0Fj?=
 =?utf-8?B?YjhoMEhQZFNpek9WSm8xVVRMcXhRRGoxWHB5SFp2eWFNZWhXalNRSWdaSkpa?=
 =?utf-8?B?a2owVUt3T2FvS29vZWVTaVMzQk00b1dMTnRKWHlvVTlMOEdMb1pSb1M3cmhK?=
 =?utf-8?B?OEMwZ0RyLy8xa09sS1NPdENzM1FFNHlCNlcvMlRhK3NjR1FIMlpKRm1wbElx?=
 =?utf-8?B?QzhveklZdnhLcUphdkQrSHUxRzVTVnpzNGhZL2ZOcUN1TDBOMzVzaldORWhL?=
 =?utf-8?B?cm9LSEJqc2VyMmJCa1F0LzRaRmQ2d0RNWmdGWlVlcmRqUTlPRnlydVBGVnpC?=
 =?utf-8?B?bklUOUhCTE9YZEYwZXE4L2RPVFBJRkJnb2RkaG9EaFE2clVDeFU5cDc5dk84?=
 =?utf-8?B?akxkWjN3WXdVYXdCdHkwNkx0cisxTmRBaFYzOUFhMi9wa2lLTWtmRFRNcGln?=
 =?utf-8?B?SWt5WDNVTnhDKytkYk02aFpWa0Y1UHRkL2IvL0xpUTRESFRtLzdlUHV4ZTNv?=
 =?utf-8?B?S2M2ZXFhaTloNnVSdk05UCtSTUZPaFpZTlVUTkEvK1pId2JCaW5YaTAxa3BE?=
 =?utf-8?B?SWlBR3A1SFBhaTlrS1prS3Z1dTBZVFdGK3psWlA2RDRxTVJOZW41YUNBaVVC?=
 =?utf-8?B?c1BMcDR1eDNHYmZzdkpVUXlhMDE2RFF6SndWZkZiVyt5bXNhOTdreE9wVlB3?=
 =?utf-8?Q?/ko4KEsxn1ciEqBGEsFkYQwXD?=
Content-ID: <4154BF3429AC0A408FA7CBC5A18BC49A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8ced39-d854-4ca3-636e-08da5f287784
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 08:21:03.4529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxU4xA9IB24ERnG45K6Hl51CXa8uLo0RIeMLNvxG3HM5GmMUTisX89QT928PmloLe3VuXXLvGkvsWMm8bHQcfumtZncd+1kUMAnY6bKizGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012112_575329_BA1B75D4 
X-CRM114-Status: GOOD (  22.64  )
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

On 06/07/2022 09:03, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Tue, Jul 5, 2022 at 11:52 PM Conor Dooley <mail@conchuod.ie> wrote:
>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>> out of the limited stockists none seemed to want to deliver to Ireland :(
>> I based the series on next-20220617.
> 
> Digi-Key does not want to ship to IRL?

Hmm, odd. I did check digikey - but with search terms like "canaan"
"k210" "kendryte" which returned nothing.
I've had some odd localisation problems with digikey before though
on the IE site. I'll change region to Ireland & an item will become
unavailable despite being purchasable.

> The plain MAiX BiT is out-of-stock, but the kit incl. a display is
> available (97 in stock).

Cool, make that 96 ;)
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
