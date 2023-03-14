Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D4C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nrYZ5HrJcD/U4vMCrtpcGW6vsGcu1Ts/4DOIxko29U=; b=jSqMWvKRjlYt8o
	KIwixgjV6w7vLeAlblk61dyNci4ZYTYK5/kEV8eTQjDwBky/59X6xxfWzSWMZWzkrnsC6++K3bYwT
	JycSchoB1j0T2XI1SoKeTwu7yI7YCOWHU++A77UbApj0GMsCF+ni/oH4Wzzi3XAPcYjx6z5zZ1WPS
	IPIZ6K1eOf9B0v6YBdsN9tr16QY1PWMq1j4NMG8lpIcYEzAzFuAVS3VXObtTkl3PsbP1aeEzQdito
	xLP+5ER5+I/hqSEoiWsWkXpxAiLNu6Vm4+G2v2zk5nPJxpiBV36TmKz5mpY/ZzORXv9uALuG6QBsG
	an01N4E/94iErDsia/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5z4-00AWCA-0P;
	Tue, 14 Mar 2023 14:50:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5yx-00AWA9-0V
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678805430; x=1710341430;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rh+plLuChogwjCVkrCVlhy8G1dIcmwhZ+Uhcbv0D51w=;
  b=s6cJq3wrAPDkfrq0lBFKPs9V6L/X4bEZVYD6kmCmeSb1aMhO/StPUbBE
   BBgo1oGRt117viLF3x5xwGwY9xhDpJIoW/Rwc59lfaMoUJQbdMa4EnUcq
   4GifalSnYEVKLET3fFLHAVdYanbaH1VzD5A1OhwTa2V8hgrldtPbIOQC2
   ow5mj/ZBUjZhaFrQEM80JH920bwqzE27OVYhF7n8A71bC4s6CRbBuG0zg
   rBmYX2o2f5g4pU2X8g3kYjXbbqwwJrQzEw6Laa0at+Lb21CViCdqX23Xb
   xrcX5DMicPKoLcAkMbcY7ulgn7bkNvL2ibi4JHcwkCi/dRgrblEModeTs
   w==;
X-IronPort-AV: E=Sophos;i="5.98,260,1673938800"; 
   d="scan'208";a="216255967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Mar 2023 07:50:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 07:50:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 14 Mar 2023 07:50:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu9wYGEif1reTu4sEgcUu8IahOasYlUOnEnO0eKZAOpVtmR0hxuVmc1lZr2hM1hdSsZYPNnkrLp5wYtipaaequz/evxf429Hj5xVLKstlYgK7sjlE6VY+tDX3Ug6zzms314/dIwueCjE3CxTpH1o4W1ylLEjvX+ZEoqe9QwOFA9E7bGjErH64G/2bg2M6OKnZsuX1rYrYS74756cYlcb4b8sW1RQAyD6wyCvSyLiixVzDvHHDz2218AXpTXDJ6Esrut87u8TkQGIrE38MDRfDPW1tJzcD5a8P80fGwdDv+2trv0tiaOEMlJhTyO1PhL6HJx0qN4NbZSsMwd/CMsD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh+plLuChogwjCVkrCVlhy8G1dIcmwhZ+Uhcbv0D51w=;
 b=I2ADUXkuG4qpA8ed2t+FXb0ACir1G2mlSngpayFcfmnyB87y5RVLYfJdhtc/JqVwpRUQToLZzuwA2zH1OZChCjCwsklMXpIpi10ZUzzxvEOo7JrqLmbOpU4ThoW2DRvNxAxKSURKpkT/WX9Zjvhg1calJ9BhZlEjpsGiaEirXEmD1Et3qgg4D8YxAfFwyFj7u54fbdnfUaMrWkWXBO3mhAFjHVi0FVuPnHKRYJYXigCClO4xLIpb5X2N7U7GjIKAN8njIrf1UnLPNgG9C+sc5ZNDbTLrhLgiQir1dIwODVe1HZKGJpPejhb7BcN2rdWJyaZCvT3WSurbQqZ29CiM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh+plLuChogwjCVkrCVlhy8G1dIcmwhZ+Uhcbv0D51w=;
 b=bX/g4ZmvpIPUwLDv8qOSyF7WeNWX4+oxRY4MZvz9T6iL799l3brtIw4F4CGIBsCj3ErTV9cFWBFUo4eNLurIcaHk7uxnlak5yEvrUN4tPPTKmQXsaw+DhA4AbwrBif3wYPIlf/jFkvogckaZgwnBgiKRomLe96BQAJ9msfh+SWg=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:50:18 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 14:50:18 +0000
From: <Claudiu.Beznea@microchip.com>
To: <conor@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <jassisinghbrar@gmail.com>,
	<linux-kernel@vger.kernel.org>, <a.zummo@towertech.it>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>, <b-liu@ti.com>,
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>, <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v1 1/5] clk: microchip: convert SOC_MICROCHIP_POLARFIRE to
 ARCH_MICROCHIP_POLARFIRE
Thread-Topic: [PATCH v1 1/5] clk: microchip: convert SOC_MICROCHIP_POLARFIRE
 to ARCH_MICROCHIP_POLARFIRE
Thread-Index: AQHZVoRLYZNt644yhEaJqnt1gjfLKg==
Date: Tue, 14 Mar 2023 14:50:18 +0000
Message-ID: <a0fb3657-8f8b-565c-ca78-895dd5e8c94b@microchip.com>
References: <20230309204452.969574-1-conor@kernel.org>
 <20230309204452.969574-2-conor@kernel.org>
In-Reply-To: <20230309204452.969574-2-conor@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|MN6PR11MB8194:EE_
x-ms-office365-filtering-correlation-id: df9210f7-5422-40b7-6f08-08db249b6d9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H4KsqrIozZK66OWs84Ob4E7GmVm4k9sw0Letwfs+hoAMUlm5j2jWSW6IcOgBQ9IHBrnZprxA9BLp2LKrsdkMxcrgxedRGRibUviEBpcxAG7tWzGwruQt6c3LNl/KzlpJD6NhzdR05Cba106UGO5tq+pis2nbGEUn8m9Gl0SddqqmznHavzAY5BYzxbqjOUoReev+3wl2zy0Ier3GF3o9b351XVuh2VjQSiDjJThtNSFjGww7zTN7UToMahmW5tpS8JWD33hw/XXsVALn5Tcd1SAaevulRoPtMBqN4lr/ghu8o+g9t+4FNRSUtWlJdA3kjIGxwRCwolom3rSPQx6Es6sXJSCWinjcHPOJVtajZYSY7Z2EW03LcWiLSjnNdvhI7ol/S7xQXvKXw/q8KpCPvhh58HvKhiMbUSfRrWJicSwWr1az66DOix0hFOzP/Bd+y0J/4TIPZwMWcTCDlXnRU4oJIPhEOosqAxkg2KozGM5mhFZbEEZiyPhc3mX71zkS4RWZh2g9mzJc1mRDkxr+rSlyXqNMv8A3dJzgYPPsqmAjGAWRjTbJ8lnMd0vutvESqDi0uZT+02p5nF/tBLcibSN9kSD0YtL81Rr6XJiU/K0XZkZRUPA13YZd94vemXR3KNjIjA+z1kMPJavIQMA+xIEYMX1EfPmxpWfyvb63hmY4YKC9MCMoF/kX2nrAITkVAqwAr/aseTHyqWqwqk3nKvecF41Z1O3kFjtIFOzSDIrupLOjo0PFSc5Ke68G+jqxneofVEAu79zACJ7VoUR/bw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(86362001)(31696002)(38070700005)(8676002)(36756003)(66946007)(8936002)(7416002)(4744005)(2906002)(5660300002)(110136005)(54906003)(91956017)(478600001)(316002)(76116006)(66556008)(41300700001)(66446008)(4326008)(66476007)(64756008)(38100700002)(83380400001)(122000001)(53546011)(107886003)(6512007)(6506007)(186003)(71200400001)(26005)(6486002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0U4UnhPcU83Wit2RkFiWjgvVjhrNWVtZW5LbHhGNTZOY0VFZm5BcXhHR3d1?=
 =?utf-8?B?SDVZT1o0ZXE2amNkaDlGVFFzUDZxNHlVd3NUWjRlZFlhdVU4RmZNTG1GR29Q?=
 =?utf-8?B?cGFSanJIWit0QzFIT2FlMUFWWXl1SXFJYzJmZitXVVFZWUlTd3JsT3NtKzVP?=
 =?utf-8?B?QnNkSFJWU2ROVkZJWlFyZUpuS1pZS1lTVi81bi9mc3c5ZW1iZWM0ckpISDNV?=
 =?utf-8?B?UzBManVETFZZT1p2ZldsSXE2SlpISy9zeXMwamcxTjVscW5rTmtYc1hUeHB6?=
 =?utf-8?B?MFVsajBKL2JzbXJlbUJkMVhUbXAxNk9WNGZpbUNoSkk2OUN6eWxteTNpMnVh?=
 =?utf-8?B?WHZPaDJtWm9GbUlrRGhqZXorTHNvQWVzNmNpalBYNTdNeDg0SFVwZ29nWEdB?=
 =?utf-8?B?MzkwQktqUDE0aFBnWVNIMG5zaU91dlg4QkRQbWFURm5wMlExNm9qS3lKdC9y?=
 =?utf-8?B?R1QxNmllRGpGV1pDWDRrRy91OWFhalBjK296M3FNbjJaclplZnBNY25CY3NQ?=
 =?utf-8?B?Tm1YaXRSd3F2NzRoKytBejZEUTFBWkdWcU91TnNHNGU1MkEwQXVERkRFbC9n?=
 =?utf-8?B?bXkwcFhzSlFSaTZiUU1aRFdna2poeDJBdkQ5Z0tkcnZ6aUlhaWhmcFZSZ1Vy?=
 =?utf-8?B?cVFGYVk1VHFYNG5YNG85OFk0bDZqQjZJWWs5THFEQlI0d3JodEhsU1hOdG10?=
 =?utf-8?B?czl5MW9pMC9zS1kzSFVyaGEyKzQ0T2R4cUNKMjZoRmdyRFZyTFgvMzlGcGJH?=
 =?utf-8?B?SFFMVTZrWkhxZm92TDBRUUNZbmFXeTZ0RkJ4Z1AzZ1pZeUZNei9JUmcwZlNT?=
 =?utf-8?B?N3VWWmlkaC94dGNvVkY1Y1FWY2huc3pUNVh0cld5MmIzdk1CWlpyQ2t0bTlK?=
 =?utf-8?B?WUlQaUFqR0xJbS9CaGFIVFV5TnNMakJXK3JJSTF5R2hsdmpjdUZXN2JkRkVQ?=
 =?utf-8?B?OWxSOWhYbGNwU3FKY1FValRQaloycnZvamcxWUg1dFUyWmw4Q2NMSElYck1p?=
 =?utf-8?B?TFpNNGxXbWFWS3pRSUhVL2hrZ2RyUEdzMjdGaFg1c0NhYkZGNFg0U1JFZGdo?=
 =?utf-8?B?NjZtMXJJaTNQUDdZTk9sLytxQldwWVdjbytrbmZ0UUlMcWJqQTdvZ2l4UStm?=
 =?utf-8?B?eFo4dUtETW1TQ01CNWt3WUpiMUhQZDc3TkVwMGg0WXlpS2FENG41L3RrTktj?=
 =?utf-8?B?RTNmNUdLRXJSVFBFbkd1YThlY1BKK1dZTzNtdTZOM1FJMnJyMGs4ZzNmWlFM?=
 =?utf-8?B?ZUZVSldib2RZWmJrYS9nNnB3Kyt2eGxKZ2pnY1ZYVGdvTngzWkovSnRnbEFy?=
 =?utf-8?B?cGVKMjdlN1QyM2o5Uy92OVRaekVORXhzTVZsM2VMdXlqUGhybHVoYmRKNkZ0?=
 =?utf-8?B?bWFpSkJyOCtvT2VsaVNobngzcjlNTkJEVHVPbkttZWJrcGVJVkxTMGpiQU56?=
 =?utf-8?B?UU9YZlVhZTF0N0NmSjVteUx3bWkxOHQ0aEMyTGpPcU8wSjhLSnJHZlJHOHNY?=
 =?utf-8?B?WCt4Um9ZUWI3NisycWZMaVVQc1hML282cXNUS0l6T0NYNGJoWEdxRlh5TGtN?=
 =?utf-8?B?akxUU0llcVd2aFJOb1hzaTFYdkNqTm1YNHJnUkR1NXNWdlNJMjRsZ0ROVDlV?=
 =?utf-8?B?ejdxL0hqd1JQOVJaMmZZWHFtTlorZGxNcndmQmZYbG9sTUtIaHdJd0IrWk1y?=
 =?utf-8?B?N01Kck5zeFE4YnRXbHYvWm1wNlVMNEJCdGNhQWNqR2tabGt6SCtTQ3Q3ckxN?=
 =?utf-8?B?dHVwQzhseWxlTjNkb3NvYmpDWWlmREcrTFpYZ1ZEYUd1SThheUx2UENEbDZx?=
 =?utf-8?B?b08yanBQdFF1a2hLTzFLbXRUNjlKNy9selNZSHhSSER0WWttb0xkSmpUbVRl?=
 =?utf-8?B?Q1BVZ1FrSFpKYURvQm5qd3MySGpoRHhHeHlqMk96aW5kQmZtZWhYdE5lUG1p?=
 =?utf-8?B?M2dVd09zQk9pb00wOUpMclVjYldEWW9MTnl2UmMyekRRbFlpVmIrc2wrNmVI?=
 =?utf-8?B?bkJ2ZXJXMUVQMVUrQnE4aEN6UmJYL1BiK1lqWUNZaG4rZzBMcWp2M2tubGQy?=
 =?utf-8?B?SVhEVDhCbGJsNk93dlluV2lCdGJSYWZ6UmhQbFRFYjlrTXNycm8ybk9Zbk95?=
 =?utf-8?B?SDVrTllKeVRncm1yNUxPemxtNXZ4ZUR5Wkh2K2ZoNzduWFVNTSt1OFliTFox?=
 =?utf-8?B?RWc9PQ==?=
Content-ID: <2A638E4DAA41B04A9B5050044F136B4C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9210f7-5422-40b7-6f08-08db249b6d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 14:50:18.0218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1dN59FW3BAZH3rQPUloOeLefbxyJ86Qh6SXl2IrO4mDsVHB5Pt7Q/z6Ts3L6A8CimPbLjUAUhCDSANYDFF9jsYoXfyoNdqKoxcpDk9dr8wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_075031_629301_98E72AFE 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On 09.03.2023 22:44, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the Microchip FPGA
> clock drivers to use the new symbol.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to clk-microchip, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
