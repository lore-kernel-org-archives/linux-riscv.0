Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA77ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEGLZ+99qaw3PlmUlkg1Al3g5Tgv5WOtZwf2FOg8yt4=; b=M0sg/5FK1kr3/W
	2Ssg+9FR1beiAhnqUKKsdet79yd6HET7o5lU9wH8jx4XRTa40HyUv98WH8MW//E3preQ1eoO4wfDp
	6qlIgzrm2a4HSR2Yeaz2iye+rUNTEsi5298QPt7ZXFDs6RLsRe6igXaaCeqybIPCVcqpMMkZcW911
	nn+yYC8z+lerQhBMT32WwEgm/B+SGNVEfoDGVEG5ipsuf77RXhjUXDNoetstaZTZb4OFmYzthlYeV
	VAGAksn4pRioN4E44OHp0q6OMOsRPmZ0OeuQzmjR2TMLmUud4YUwRiz2xE0C2j1qOZuQ5qYpDkWD8
	eGxpDu0qLfD9mGWw+0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU09a-000rjR-O4; Fri, 02 Sep 2022 06:27:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU09W-000rgJ-DA
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662100063; x=1693636063;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fy50VC0UYAOYZ0ZcUH7vIbYvhcpjWQp/t5TQoDM2Uqo=;
  b=wQof/+baKIyNz60ykWGJxbLq/gFtB2oOMu77YzlbbtjZLBPwUfB3RZxI
   LxSC2y9srA+WgUU3QATbAC8EqMJEJJrn3ctOKC+weaaXmcSIqOHoVue2q
   OfTeNj9MrHzhmHcXhbcSCUDSrFsS7PklO79o/A7B6qkqgYripj8sntsW0
   zNBTEtJRsPmR2VA7OQUZoUfNnv6iWrePDGUqx0V7Z0rQP/5APaH9L2mbp
   THOT2v2Xx28Q63e9O3J+nCbcOoBM9EWhR8csbV9WQSsvHwkPb8Wg/3RK0
   yr6aleJ0VVy+0b9eaj5IK9PvnjaXpQajicSM0la4cHKSiy6p7UReHXBVi
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="172086447"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 23:27:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 23:27:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 1 Sep 2022 23:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGMKdi3No8LMCghsSESHGIzC97+w2HphKpvDsyFrMtCYRgyBycSSL53mRDOsKNMHEGiJ2ZiWFP1dGePHSdM7lcsuGBgQka6sKUkVDo6iibt+Blhbv8uI4ElirYV5M1xXjXkL/ypReA0H2FbSPRMaje03xsxdes77a/Cdt4UGoqG8wiycuqSkOZ/Cm4Azrvu0NzE2TOXD20mbij2NwA/qT+3KhV/rMWk1rkS3k8uM6XfhEOiz5pszCrszRnPgQj4o+q2HtLa3/EDFudn7W2msaPtAQQQyP+dztMqx32N6bv9s0bPx9gdsVqpGnlU/OHKXKx/65Qd/eX5UJr6lz+Xf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy50VC0UYAOYZ0ZcUH7vIbYvhcpjWQp/t5TQoDM2Uqo=;
 b=nLfTGNT60QjIzOEGPZybk8KQQCU3MLO7HvkCsReQTo7KaOMIIERndEfWfKaOuVzCcBVOO1Lgj85smPrTaHlL+1yoF7JsoNxztRcNfQksdPy04pfK+yWgyi2r0M0ycfIkpGzMlEqTEU489VA+IFKUHz6a75KBDiPVoY7hBQulKD8nmV2lO2pdzRn9vmT8iTDg5joS7+nCqOEZ7OV3YkiwOz8uohoShq9mJNvE3tvcI604ryYIhU+n4q8upC8yMLVhpfpiB3Lr5r3BdRMPc41GT5KWfL6E7fWhvVha8OX57YwZGgvU4myr88vpor026t2lYjIoYUV4uYQzhLvDd03e6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy50VC0UYAOYZ0ZcUH7vIbYvhcpjWQp/t5TQoDM2Uqo=;
 b=NilMdPyXmH1Qhwf6Ketv2lu0xm/RUcefTQGEXwkZFcWQVFuQbFMVkrt7/czB6E+NkeyBxcuT2nj3MDucJAVuRFkA9DML52W3024KF+J5gd30i3G5jWdbWBS+WC2wzbI7MkAwcmZnKlFa9eerBWOiWNoAg9Tp5lK6lTjTcyDRQEw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 06:27:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 06:27:24 +0000
From: <Conor.Dooley@microchip.com>
To: <cristian.ciocaltea@collabora.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<michael.zhu@starfivetech.com>, <drew@beagleboard.org>, <kernel@esmil.dk>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 0/3] Enable initial support for StarFive VisionFive V1 SBC
Thread-Topic: [PATCH 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Thread-Index: AQHYvlRcpKoVIbqogkSJP0ZrelqTMq3LrWOA
Date: Fri, 2 Sep 2022 06:27:24 +0000
Message-ID: <04151f8b-5722-b5a0-a4ab-4958f55b8dec@microchip.com>
References: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
In-Reply-To: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2abe7821-481a-497a-f784-08da8cac3319
x-ms-traffictypediagnostic: MW4PR11MB7101:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d1qUtdykOMFrcSIGyO3jsvSPN2yfHlZRgO9T1145N2twG7nkddmJpJTzVg89ynfquHJhxJ7FaEOCpGU0tBJ2WRJ6tBitN0+veAcWLcP+l+pUPq72o2mEu1lxsAKYlM0AlQWhNDUp9BFuMT4rAxzzi6VIYxqHaj20/eBpBRh03vI13HfPpau2H4goQDr6cgedfIh4cGcc6d2slmEmq/I3dhwvIbCYWqLugATxTPvW16dgoNss4WJJ8ML/loYUvH6Kndd3CVgLffnS8EJ3TVYHB/pRCswj3myG5UfI+zbqio6yqWUMhXRGq4R09p/oNDMgWWsZsV0Wr5Y4k++LriO8dOOiys+sQb4a88HSqLmUS/oJvbF/BDnQ+3/2iOKjy3M/otdYvjIkyOwH/x+RumF+aAAjgsgAzZPr1dO2Yr//sF5GrZ4v50ShvzvlDRL7V0xy3NZxIyxrnZ2wtyPS5Lx5QcIAGC36L1AlTE6MGjw9tQCOFyWAas+/qIM5kIsRb706yFpdKTUOtYXODd2FJL3ggKW0wt1nr0+oE6nsUplogAAxX4mYU6Y9h8WE3AWyNg2ZOS9ABL4haBf/hKrhK9KDokT60PjayEhWovikcQj2wR5qyadC3LR+qSybEFdQSvq5Dy+XUDEWhKrGFJ3254kPKTl3czUMDpnjCIQ2+ooqd4pKNCdLJ7V/UQDfCTMRIiY8KC9CP1PjKI9hpLo3Ojmg17+O1Kk3J2koXVYktlVwz98nroc0Crl6XtAbSfK+pW3dIrecieA6e97J7aW22w2gFfG4vDL3gUHMMOPWumK7A2a31D+lchmqgtkiiQDtWpw2rtcAXSV3wkCpH9P+Ewk1BUI9nI70ql0QVPxPXE21OQIgMSQhXpWz0/lDTY6V/59jAyMOKBtbpFyheNonRUuNdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(346002)(39860400002)(376002)(478600001)(26005)(6512007)(53546011)(71200400001)(966005)(6486002)(41300700001)(83380400001)(2616005)(186003)(8936002)(5660300002)(7416002)(6506007)(110136005)(2906002)(54906003)(316002)(66446008)(64756008)(8676002)(66476007)(4326008)(66556008)(66946007)(76116006)(91956017)(38070700005)(86362001)(31696002)(36756003)(31686004)(38100700002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkVWNTdEekNSN25hSjU0a1ZHN0hJMk1CWmpuR2NxQmZTTU9CSHRGczhyVU1v?=
 =?utf-8?B?Y0RuWGEzakh2N29HMDYvRTBtM1dMZ2FMZFdia1kwbXovNWVNQW0rRE1kVGc4?=
 =?utf-8?B?cG82UGJWdkxhSzZzVUh3UDM2OW1pYVJkU3BaWU1kcUxXR0lXalNDbUdHNGx5?=
 =?utf-8?B?UHNham01dGJka3NyVXJIdFhmR0tzNzE2Q3J3TU9jd0djRHFJU3hiRXlOK0Jy?=
 =?utf-8?B?UUc1blRkL1VUMVU2ZVhycnprNzIxYll0VlJ6eXR5R1A4YWZCYzRrZUlPYUJ6?=
 =?utf-8?B?RVpEcjZWWkpRa0ZXM2hUOGdoR1B5cE5mUGdvODJLdER2ZkYxaE15Tkc1K1RY?=
 =?utf-8?B?Z2QwR0FVV2dSZkVsa0dKTVpvVmRrendoSFNramt2RzNyUVhxRDltZ1Mvckph?=
 =?utf-8?B?Vk03Z0ZvZkpSWXo5LzgveWl0VkRTbnBzTXZKckZ3a0JoRk9wTmtldkRxNkEr?=
 =?utf-8?B?d0xrbmFKTktoQ3RzaFIyYWFYTWh3TnBiNVpoU2Zhd1F3V3grOTVQVzFXcW1o?=
 =?utf-8?B?QUl4dHFmSitEOGVCWDRXa083eEhqT1UwS25KVWxiQnVMOVhpK1NWdThLM2Q4?=
 =?utf-8?B?VmVreGd6SWlYNURoQjdtaUxQdjVyTjh2WWpQZHFZaHhtS3pSdlZLKzVDZVcw?=
 =?utf-8?B?NEMyQTNaYmRIRkk1NlBrSXlwTkxoMkJicFQ3NFNoZDd1MEJOYm43VkZMbGo5?=
 =?utf-8?B?cmhCUTdQN1ppU0w0WmpHSEoyRFRPTjRjVE9YSkgxWGd2aDNWbDRPUlEyQUZz?=
 =?utf-8?B?cHRXRmh5VEhYclV0c1hGdlMxMm5kMkI2K2tmRFh5TVRGcWhXN0JBK1JVc0Vw?=
 =?utf-8?B?RUN4dUN2N3ZJNllwRWl5N2w5Y3VrR1dPYnE2aUtFK1dDZVRDYUxoVDBrRFhI?=
 =?utf-8?B?elhUck9MRVEwakh3cnU3Sy9xT2d4ZUxQNEtSN2lCdjVSVWJjZ215cjRCZnk0?=
 =?utf-8?B?YTNHVHV5WWpXTnhYQlF1UlJBUCtlSnZBbytJU1BCNE1EeUpWaEJPRnY4YVlF?=
 =?utf-8?B?ajlLdDk4K0M0VU5HTGdRUDNNanppWFlMNk1kMjlJK01ZeU9MK0lFc0UwNVFx?=
 =?utf-8?B?VWFuSXZVQTE3QmlrQVdUWS95WFBYYTJ5Q3BidFdWMDIrQ2VLVmQwQmR0VXh0?=
 =?utf-8?B?NFZNd2NKUlJRbXVsZWx4WWt5Z01TN29DNzhlc1hweFBhK3FaR2k4RjhDcEV1?=
 =?utf-8?B?M1o0Z1hWRnBxVW16Ulc1YWVWMVMzaitMaVhIV2xxQlVGSDZHZDlVMzFEL3ln?=
 =?utf-8?B?UTZVTVpPSTFiOWlDOFZLRjFaUUhBamoxNmFWTVlCUlpYZlVYSzl6Y3YyVFc3?=
 =?utf-8?B?c2x5UWprMlo2THQ0eU12OE1LaS9hdkxyZ01kbSt2Zm5jckJlOU9BRllYalk3?=
 =?utf-8?B?NEZwUFZIRkREY1lzYjJ5TGNxTU1QN2hOZjY5Q2NiYjhzWk5aMWtWNjhacnd1?=
 =?utf-8?B?ZDRtQlhVOXB4aFJnaDNxN0lpTWJFMDFOWkJ2R3krbnJSR0RTMDJyaFo2dTRo?=
 =?utf-8?B?YW1hSmRiblJZZ2JpQ2dRcmJqeTdReFM2UXEvOEREWnEzZ0xZZXhmU0tHZVNV?=
 =?utf-8?B?cS93QUtyM3B6WWdBNUFWSWtIa1JhMEZUblNGc0RnSUozTTFLR3VVSjZMbXV6?=
 =?utf-8?B?RFFGbEsvWUh3Z2dEMG81c0g0NzNjZlZCU05vZmZjQWtwdFZXYlRNbWhCZW51?=
 =?utf-8?B?VjZSYVpGOEJZaUJiZ09FSHJXMUFzY0VmNkFsNWdLZXlhZTdUK0xWLzNoOWhI?=
 =?utf-8?B?cWpXeTNGWWpFMHcvRmxWeW5QNzdzMG0yMGRjUytIQzA2SnJWTUwzbUt3cFBt?=
 =?utf-8?B?d20zUG1OVWdveUdaTTRiNmV4UjVkbEdUK3B2RzRsOTR6K1B6M1RxZEkwYmVy?=
 =?utf-8?B?eTRVYTc3OEZ2SmxvZWZRenZaRmQvOFBhS1RSamR4Z1lSL1l0NkJ3OG81aGhD?=
 =?utf-8?B?dFBkVGN1b2tLaVRYV0FqWElDaDZWdHEzSWwwSWxwYi91L3RZWUxBN3AzSHR3?=
 =?utf-8?B?YVd3SFlLM3RxZEhFdmdJNUt4VGN5Z3lsaW5xWTgwdTVwRHVFdEYxeTY1TlYy?=
 =?utf-8?B?TTBrTXdIMzVmaCtPZEhUTGJJUXU4ajA1SGZwL1UwQlJENGtOVGJjSWZ0ZERn?=
 =?utf-8?Q?FYqHbQ5bIw8RHVuhUCXkwzP6f?=
Content-ID: <7F7748178F3A3540AFB1CFC6A36FA33E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abe7821-481a-497a-f784-08da8cac3319
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 06:27:24.5637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TojLm9jXe71CKYURPelQSNJrhGhI3HkiC3qysroq4bSjDzZraWe+y8kt8S0cYEWjUKgVrZQAe6u+MnckX474UBZ9wLs9TNC00K/+ZN3CdTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_232742_534956_8F06F0DC 
X-CRM114-Status: GOOD (  20.10  )
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

On 01/09/2022 23:42, Cristian Ciocaltea wrote:
> [You don't often get email from cristian.ciocaltea@collabora.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The StarFive VisionFive V1 SBC [1] is similar with the already supported
> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
> 
> In addition to documenting the necessary compatibles, this patch series
> moves most of the content from jh7100-beaglev-starlight.dts to a new file
> jh7100-common.dtsi, to be shared between the two boards.
> 
> No other changes are required in order to successfully boot the board.

Gave it a go this morning, dts stuff itself looks good to me. No new
warnings, although that's to be expected, & boots fine.

I know that most jn7100 stuff is not really wanted upstream, but I'd
say that the minimal vision5 dts is an exception to that, so with the
one comment on patch 1 resolved:

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> 
> [1] https://github.com/starfive-tech/VisionFive
> 
> Cristian Ciocaltea (3):
>    dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>    riscv: dts: starfive: Add common DT for JH7100 based boards
>    riscv: dts: starfive: Add StarFive VisionFive V1 device tree
> 
>   .../devicetree/bindings/riscv/starfive.yaml   |   3 +
>   arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>   .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +----------------
>   .../boot/dts/starfive/jh7100-common.dtsi      | 161 ++++++++++++++++++
>   .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>   5 files changed, 186 insertions(+), 153 deletions(-)
>   create mode 100644 arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>   create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> 
> --
> 2.37.2
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
