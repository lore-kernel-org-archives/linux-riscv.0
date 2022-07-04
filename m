Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E73C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tdu6pQ2AaYofPAkBaGG0/UiVDWFZlC4fd0zlB3Yd32A=; b=dB0MnNhO3+un4g
	hxinMDWMstDUN1QpltIlL/BRiMqNP8vnOFLwQsRFottWHH6Z8+w92Gw3uLYUkC5Dpnr5+TdhBacAD
	sFvcSPZQwzmCQ5PrKIjmNvbRBpOecpTxEJGsGfe1cn52aG0FptVYhtfYBGBxRXqq8dBE3FctW7WVa
	tPQqVJxaCh3C7awohe9cEiBDlIfaSkvyvIulUdx0f4BOU45r3NaPh87OpsebdkBxD9M4aTI3ImoiP
	E4BsYdVSExZ3Z3SeBSaCo+FSRS+9cUVbV54N+QL2q1dzKDJaJewbDQ8Zg6sH8fL5WW2HbN+uioVyd
	EfCXCxUlqlOxJ0AXRDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Fa4-005M65-6a; Mon, 04 Jul 2022 06:29:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Fa1-005M4H-6X
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 06:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656916150; x=1688452150;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I5Cs1OMarZvZl+q1GbMDS7h33nM1pzBgAWcRMH6gHPA=;
  b=uie0ONn/3v909qS82FMPGiay4vp2Omb8/qSEPQbmLHqySBvdYT4zXPOX
   dvTHI0mS8i4++RgUj3L6+M4rM9DQn9CsWMRwb9rQ0UrN5ZMLpAr0v0N6L
   f7Oyqwm3ABhV1iNBTuPsQyOBH3lQkXT0yMWgrMgXzG1xhn8bvwnfiCkku
   8KqCUtOHAZAAfzGUoZEDtXnHo3hS1c/3aE7MeJMN2RrjDg0rHem4nGBTx
   duAK01zO+GPY+0dCLGG8bR5WP3IfRbs+hPSr3QO1bWlD37JDrPnMoXj2O
   bNBVhOH8g1iAwRR/KNmmBq+Kueud/iPLddLtMThj7aIDhmQV/I8jwTqEF
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="170643197"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2022 23:29:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 3 Jul 2022 23:29:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 3 Jul 2022 23:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ6lJDwUirN8YpMhDZ2cUjK7qvxQBBW1Bdppxl1DVpQ0MWHaXsSPsZvgfbmMJ0JDFX+wvS7bXqiPIC+ZI494vDwBjFGaRhyUwkTCaS+Y2MQa+STOT9VFH7u2Pd5PQm1EteHJg1VYIBYP/n0R8+aPkKvjmj2Rk8UKD8rcen2URD2RY9/Br4jhUK+qB8hRaGM00dvimKinj9DG/ap1iLV+C47x2DdMXhs0LBRIZ6qFqLAmLunclPyuMMpZ8UdxXUqqbo3putIg1vGvDAsMOztEHvfphXHD+3AzoToAXO7YJXxsbr1Jypo1yBaZKw3B1KNy9BG0KjUGeSCGwsVPfcKPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5Cs1OMarZvZl+q1GbMDS7h33nM1pzBgAWcRMH6gHPA=;
 b=m0wmvWU7jyfxHYQScc75+vh2D/PtetVrySDYKqkJxn1vfmzjGHmCHmHUjNk7iLDdtcvDe7OWJsy6nBH28O3RU52fU/DGFVngNMGEc5M/g6+mmmqflnadPy5tn49VG4xos30pRLBVtZJlqk/sooYowXm3XXkNFC9vxweOn2jRZvakeXBCa2Y+UvJc+50rJUCNaxGd+Mp+AQBe1+rWHxAb4KX2DaQ7q3mKjPb9LP+MX8z+TTYWmRQXCXD9VKgTYBgCBISNdnSpnY3oH0Q+F93bsS1yG5Hyi78V7BiZhwzEp8u/Op+qOu6i89V5Os+vryKUhNfJAmmzj3fK1zuELFt5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5Cs1OMarZvZl+q1GbMDS7h33nM1pzBgAWcRMH6gHPA=;
 b=dthTlPjIINqYZdDe3WbuPRUcIM2lajbDUkewNqQWOK3v7/rKW86LX6ykAcpRZiDzMN6FAxivalZxbWcDDkTjxN4FUqb2F/g2D8xaFYt0Li10jY8j/tw1MxzJ2Q8cgQ1zmqxEYKZro0AZk3/Poj9qSeNIFt0RYPIjktJizhUzy4s=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 06:29:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:29:03 +0000
From: <Conor.Dooley@microchip.com>
To: <dlan@gentoo.org>, <mail@conchuod.ie>
CC: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <kafai@fb.com>,
	<songliubraving@fb.com>, <yhs@fb.com>, <john.fastabend@gmail.com>,
	<kpsingh@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Thread-Topic: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Thread-Index: AQHYjt5C7+o+zgpwvEWlpAAqR9vFbK1sn0+AgADcGoCAAEWQAA==
Date: Mon, 4 Jul 2022 06:29:03 +0000
Message-ID: <1ad358de-ac73-d430-aab1-c77df14b0011@microchip.com>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <c373eec7-2cc4-a41d-916c-f073aba5494b@conchuod.ie> <YsJOVZU1gPo3KzdB@ofant>
In-Reply-To: <YsJOVZU1gPo3KzdB@ofant>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2566a4ca-c603-4ff6-1b26-08da5d867d7b
x-ms-traffictypediagnostic: CH0PR11MB5281:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nTTO3Rsr9/HMXAH+tM77uu73DLvbfzzhU2TXUYkBAfdK6qGm/roVVrQdyr27XlAtNRLJWO7qtUBH9UROup27yRznp4+CY/UMxxfRgHMohVmlcsUIb7FR9FmqsTl22KzU/ZCZr2Zg9pVl/BWoqP0qfVAwZSWj0UkmF8PGpleQFGkfcY/YpNEfg5Ojc7gfLFzB5+moKQRtflu0et79FreNYbh0ktruZ/kPMD3HEymsYiywfXdyZ6I3BCfbP0brIT96SfDV6ae+gmtAce6bshxOpv8QFHKqKGV8v913SS997JD1Qwwv5MNG/RawkieoHKtnZ/INNu3aZkEfXI6dgffRtrcVviZAFadOEe4YVpZz+DiFnlADC+M5y67OIbZnHc0l1rdxUflcZEyCW7g1u2w4UNy/UvgULGSDgFwRgMDRBkXG21vwNH93Apdmn/h89oiWm5rU6DvwBMsaGmeOqN10avq/2Upoikb41XM7dNU6feof90h+CtnPQVmf048tUjLYPjclCyac15lknxbxD8VJFswLd9pr6HLS2Lp5egXT70u0+YaTH9kPrVik/soS0JhFAtMYdm419IaPgk+YrxmP0nWveZlBdfpppGWeUyR+XeSdCkkgzshzULmo/mPb0eQQ37UUbPH2H2JBNwYLXRu71u8ZtBBmCjjaLszN2TcEwh/rchbSYqcvk7S7l+rR1tgv8HVpeoDRLpopdTAYrV/D1eBlb/Sr04b2u+8kQp76ou9DREBkiMtYkrJ2fUHtiNQZYNGT7/iMRHOYBbps2HJGGaiCGgrQzgXlTvr9McQK1cdi5RKHSPwPk5nCr7cflRyb8StOlLuv9HxTQdYZJZ+Vt4RuTFU+8yMP/JDaCQYPlpY6C3P78msJkHBJuR5gt2NEnydrTEGqZ/C+vzphnrb2WRDQrKjQ2YRdgXVAFs5qVnw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(346002)(366004)(376002)(41300700001)(2906002)(8936002)(478600001)(966005)(6486002)(38100700002)(5660300002)(7416002)(186003)(31696002)(86362001)(2616005)(83380400001)(6506007)(53546011)(6512007)(54906003)(110136005)(122000001)(26005)(38070700005)(36756003)(31686004)(71200400001)(66476007)(66556008)(66946007)(316002)(8676002)(66446008)(64756008)(91956017)(76116006)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUdjZW5mU3M3bXRubVBWK0g5UCtXdGs5ZHMveDVxQlhmUTl6K1pzc3YzcUVC?=
 =?utf-8?B?N3pZb21TVWJnaFZvYkRQdWxZZzQyVkh6cTJwRzRmc3JkT1RoWFYyS0g5MEgr?=
 =?utf-8?B?NXoyRHR5WXpkUExuTjEzc284cVdnRWYzZ0MrRXArbHR1TWhMdi9xc0NzM1Np?=
 =?utf-8?B?ejBYcXNVYUo3Y0ZlSk5vR1ErQmplSWtmYytRNzJRUGNNdVRrN0JVZXRiUWlH?=
 =?utf-8?B?NlRPNm1GaEt6Q2Y1WHFrbjh4S0FueW9EMWpWZWd0Yk1JSzFEc2JCRFN6aUlp?=
 =?utf-8?B?V0VuQVV5QWU2SDFRS0xuSkg5blRyVTR6YzNENGFQRjd1NElPTHRnRHFSczla?=
 =?utf-8?B?RHZQSlJ4VVpkZHNPYW9vS2NUUExSd1RtMytLV2RVOTZOakxoTnZlNHdYenZP?=
 =?utf-8?B?SWdvbUppS3ByZFMzbW91Z0IraGFEN3FXbzk4L1FacEJPTExpRHVWZ0ZQTG1M?=
 =?utf-8?B?YTVKdnozZVpKcHdjc2hGTGU2UW9nVXl1YURjanBKNUc0RlRoa2lEVE9ScVlS?=
 =?utf-8?B?eUtiTFM4TEtuOGRjalNJRjYyLzlwdDY1SCttQ3pteE9yRUYvb0dFSkdoRnI2?=
 =?utf-8?B?bWl6YVpJR2E4RkJyY0s1R2plMy9rTUtwNWVZVXptdm9qckJOTXZRSklseFZ3?=
 =?utf-8?B?dmdhYzBpbGc2NVNSN3FKdXlIUURqU3lXY3M2NWkxSElSVUpOWnQ2S0JraTVD?=
 =?utf-8?B?aVJQQ3dBMkM2elFRSWVJQUpJMlVSVHRvQmNmak54Q283TlBMdE1ZaXZQWFY2?=
 =?utf-8?B?Q1hMTE1oNjErR1dudXV1Q2p2VnROT3hqNjN3Y2ZLaUt4blcvN3ZVY1FHdXhB?=
 =?utf-8?B?QjEydG1OYzJDOUVHS1ZJRndZZTFkem54STJjQis3WU9pN2I2NWpubVFtWm5D?=
 =?utf-8?B?ZXNRNk1LajhGeVFQWDY0ejVGUnFHTm1XTzdPNGkzZEZUNFBsU2N1Nzgrdkhl?=
 =?utf-8?B?U2lIZTNhenBSTFdhSDN6SWxoV0pTVEJPVVZoNGg5M2cwTXliNS9zMlhEZm14?=
 =?utf-8?B?U29BRlV3MW9ZYVh1aFVaRW81WDBkRXp2cFBzQTZvREtBdlk5MllpcmUxbXVr?=
 =?utf-8?B?ZXk2NmpUdHRmVVJnVTJzcXhsa3o0QWQ1dVNhTFp3ZGdoSnhYZnc4cTZjSWxH?=
 =?utf-8?B?YVM2S0NKaFBsWk5lZkNoejVESGd4KzZVL0FXRFJQMFVLaGVQSWFvT2Z4SktR?=
 =?utf-8?B?czFBWm9UZkRZenJwTHgxM1Z5NWNJUlFKL2FPbHZYR0wxeUZsWUVydDdCWlgy?=
 =?utf-8?B?MGlZcEZqUGNFRVlVbk96bGNoT1lzQUlUWWFIejh3UzVJYjUzNGF5NTJJZDl3?=
 =?utf-8?B?TkNOVjQ3WldDOC9HR01yR29ONHZ5bXlHckJ3ZEcrL2J3QXpCbTVDSTV2dlpZ?=
 =?utf-8?B?N0FBUTQ3NWI5aWtGYnJOZkJqa01XYm9teGFTVkNTQ1ZHQzMxU000UVRpYzlN?=
 =?utf-8?B?T1RKY2M2Slo2VkliMHNMOVA3cGEydmQ4MmVweEJFK2RiR3RaQmMzZFhOMk1B?=
 =?utf-8?B?dVBVVEMvVXhibDhZVS9BMHBHS29LRnVvUzFJSnNmb0htRVFlNEZQL3grZEo5?=
 =?utf-8?B?SFBUZTJiNTNXSlozNkZRUFAxbjVqd3RVQnVKM2NtTmZ0TG1PSlBxYlJaeFRE?=
 =?utf-8?B?MkVKajQ4SWZJdUpvSnUzcmJXWGd4Wm9STHlKOHJTTmFLTlRvMS80ZmRXVmNx?=
 =?utf-8?B?NUpQclI1WGhpMW05c21OTXNYQXFHaGpBTGlYZ1NKWjFVRmdzRjcyVWNrK0hl?=
 =?utf-8?B?WTJhcWZaQkxNZmdhbzhBRXQ0ZDk1aG00eEFSNTBWRWFYdnFBTVBaanZzU3hM?=
 =?utf-8?B?T2Z2NitZZE83d1VZZER4M29JSzlYeW0vYVlodGxCOW1CR0NCUml6TVJGWmQy?=
 =?utf-8?B?SFlja0h3VkVmbmp6UElqTStlQ0ZqanQ1Z0RXeWRpdFZnZEJDQlFDY3YzYlgy?=
 =?utf-8?B?N1haSzlhelNyTUNTT2h5YjR1NnMzMkRVSng2bWNxZUlnQnR3OHl5SDl2UkN6?=
 =?utf-8?B?Z0pjbmhJWFNnUXFYL0pybDhwc0VQcTMrdkZLUFVmQTdYR2trdDRDN0FzMGZQ?=
 =?utf-8?B?WXFaYnJTeXFOZENYcW1VeVVrU2FnQjd2SE1OTFZEaWltNlBaNC9oaDdxZjZw?=
 =?utf-8?Q?4exrw8rMwuKjsyks9wlcLF1Nk?=
Content-ID: <FC3D488096A8284A854444AEA159A1AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2566a4ca-c603-4ff6-1b26-08da5d867d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 06:29:03.8098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8xiCKI94v3HwMZ5JMFEjwlKEfvcT3wMj3yikOwDVAer8RWETQjPcaBbYvKYzb1IdT42M53UGMBVaIo34Y7DfavQFyJOdQ/tQba25xZJnTPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_232909_305983_07358C27 
X-CRM114-Status: GOOD (  22.25  )
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

On 04/07/2022 03:20, Yixun Lan wrote:
> [You don't often get email from dlan@gentoo.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor Dooley:
> 
> On 14:12 Sun 03 Jul     , Conor Dooley wrote:
>> On 03/07/2022 14:09, Yixun Lan wrote:
>>> Enable this option to fix a bcc error in RISC-V platform
>>>
>>> And, the error shows as follows:
>>>
>>> ~ # runqlen
>>> WARNING: This target JIT is not designed for the host you are running. \
>>> If bad things happen, please choose a different -march switch.
>>> bpf: Failed to load program: Invalid argument
>>> 0: R1=ctx(off=0,imm=0) R10=fp0
>>> 0: (85) call bpf_get_current_task#35          ; R0_w=scalar()
>>> 1: (b7) r6 = 0                        ; R6_w=0
>>> 2: (7b) *(u64 *)(r10 -8) = r6         ; R6_w=P0 R10=fp0 fp-8_w=00000000
>>> 3: (07) r0 += 312                     ; R0_w=scalar()
>>> 4: (bf) r1 = r10                      ; R1_w=fp0 R10=fp0
>>> 5: (07) r1 += -8                      ; R1_w=fp-8
>>> 6: (b7) r2 = 8                        ; R2_w=8
>>> 7: (bf) r3 = r0                       ; R0_w=scalar(id=1) R3_w=scalar(id=1)
>>> 8: (85) call bpf_probe_read#4
>>> unknown func bpf_probe_read#4
>>> processed 9 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
>>>
>>> Traceback (most recent call last):
>>>    File "/usr/lib/python-exec/python3.9/runqlen", line 187, in <module>
>>>      b.attach_perf_event(ev_type=PerfType.SOFTWARE,
>>>    File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 1228, in attach_perf_event
>>>      fn = self.load_func(fn_name, BPF.PERF_EVENT)
>>>    File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 522, in load_func
>>>      raise Exception("Failed to load BPF program %s: %s" %
>>> Exception: Failed to load BPF program b'do_perf_event': Invalid argument
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>
>> Do you know what commit this fixes?
>> Thanks,
>> Conor.
>>
> 
> I think this is effectively broken for RISC-V 64 at the commit:
>   0ebeea8ca8a4: bpf: Restrict bpf_probe_read{, str}() only to archs where they work
> 
> However, the bcc tools haven't got BPF support for RISC-V at that time,
> so no one noticed it
> 
> I can add a Fixes tag if you think it's a proper way

Hmm, I had a read of that commit and the breakage sounded intentional.
I ran a git log --grep "0ebeea8ca8a4" & it seems like a mixed bag of
fixes tags. Whether or not it deserves the explicit tag, mentioning
the commit would be useful. The tag would be:
Fixes: 0ebeea8ca8a4 ("bpf: Restrict bpf_probe_read{, str}() only to archs where they work")

Thanks,
Conor.

> 
>>> ---
>>>   arch/riscv/Kconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 32ffef9f6e5b4..da0016f1be6ce 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -25,6 +25,7 @@ config RISCV
>>>      select ARCH_HAS_GIGANTIC_PAGE
>>>      select ARCH_HAS_KCOV
>>>      select ARCH_HAS_MMIOWB
>>> +   select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>>      select ARCH_HAS_PTE_SPECIAL
>>>      select ARCH_HAS_SET_DIRECT_MAP if MMU
>>>      select ARCH_HAS_SET_MEMORY if MMU
> 
> --
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
