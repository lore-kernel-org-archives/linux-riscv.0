Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3693C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7F9+hStGPcHmv0EKU43SmUTb5wXf6h3jRDgRlcGhNfk=; b=CYUtaqwJ3tepSW
	a7wiWQXF8bfWlZZZeEHIQ3uQyGUomMU/1A3oPGl1p0ShNV600Lh9XLD4+YE7XNmDaf1kW9nojQol5
	M575BLjta+1hvBgoMG3UUIgptAnEVmJtbD/ubDStQulfD+a5FKHamsSYHYYOZy2cE+IPsnQbOCOt/
	NfOrFawVv9fIvfhTySpXlXKMrKOrWE8JG2lBq8dOe+zuncRoyY37fvLanLp1Quq49hR1zdp5BoWxm
	rSAR/wGLOyJR79hYAvCeDQFymtKpfM4rb8ruJwgneon9xqpwwNxRa7HM+vbUHEWtu/83/cEx05wsw
	gZ9d3ozU/0ps+0cBnu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtVy-00F0XP-NS; Wed, 23 Feb 2022 15:25:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtVu-00F0Vl-Iy
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 15:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645629910; x=1677165910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=efD1yI0mnd3YJlske2NZB8MKGnJ54CLYsHlCQeCtVdU=;
 b=UFW1JlAmjSit2mRVQjwKhsKo7XToQL2HoucMpMPSa9kovmKEKs6hTbk9
 1Ok9yxMYAQBfnsd81ObS35iIQWH7oLDXLbrO8CyWNQGy89iLLg8pjwIdq
 k4W96u3dl6AHJglul7zM5L5LjqICNxuN1EiP9H3rBRPrdKv/MoZdZJxgf
 LWU8etGvSFZ1FGM/0xqXASXkGMRMMmlZBLLsC/ReGNhU00AdMGaPwuxVG
 4EqsKdFmpxRsQyNoATVDHijZhWHNVoyIBKN/g1C91HwMBBrMxuNBxm2xq
 cFZx+w1pOqMBF7wD2BGxjg/9Pa8Y1e1k3VBv5Zz168ZehgnMyek6T9T90 w==;
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="149741061"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2022 08:25:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 08:25:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 23 Feb 2022 08:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY8kr+j1yZ68C3WCJLO99UXXJOdVDKJKp1U9VFWKW/nnIOGJ1AFZc7HWzdGGa/iIWJqTNN2N58yo9yUgUfvdbdkhlfs+r2XCY8rQWU3Q9WqbzzSIaNh+3StVhVx2x9NWS8h0OXOWWHbx2NfYRfBdja0XEQtzq4cLHUhNf0H3cvQzRq4QJExeXGvXFEZoEgKWRwm5876edIw8eIoiHxkrxlOTZdj3jwu4OZ7JLW3RBgXnyd+bBeXgi8lRkR7lQnwq6R4rQcafYSbW9WRPNaBMyXoC98HgFaT6PMLFrwVNbV+Woqkl0olT5JhYeeSjLjQ69Pzqw0eK6x4lkcFfKYIeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efD1yI0mnd3YJlske2NZB8MKGnJ54CLYsHlCQeCtVdU=;
 b=PM0VTiP1+PNn1PiY/HMShkKUT762dWxDyYQFhRkVQsUYLI15CqG5mMw1ufju/WCGgzze0Usd+gLy9K2NLRVLrq0Lhbp9AnOySg8Vr72WpG5d4DDtbxXI+as6hdAOHtFo4sbVwGnDTgzSPu4AK8XY8m+tEQEAnc+cPZBszScZZ2RUA7ZwhiYn7+ms5TSM7T5hzdqWc3PVZJJW/TICUUczvdPqZIMS91nRKZM7dhioh1J/cDW4E8Z9N8SK8eXpPajaqdmdRscFRFrTK7Qx6Q+mqT8JN9lWFkjcUcjVeE3aIkDdvHCP5iuKWoYxfnIhVHfoIJ0bcQhp3nqljqBqQZskQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efD1yI0mnd3YJlske2NZB8MKGnJ54CLYsHlCQeCtVdU=;
 b=fXMCYktQXkRT2RdS1iJ4RVjScAGV67+V2furn9cvZxHk2QVfkR7+3Oyoz2DLZi5PKn6J+U4VJXKf6s7F6urQDB8El0Il4HDW2XbBesBxvj7to09c5gaLdO3ef/rqOZGBAkCZayg98dW5UV2z17PhBtX62HqAIPGwmd0iFht8uhE=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by CY4PR1101MB2104.namprd11.prod.outlook.com (2603:10b6:910:1b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:25:00 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec%4]) with mapi id 15.20.4995.016; Wed, 23 Feb 2022
 15:25:00 +0000
From: <Conor.Dooley@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <a.zummo@towertech.it>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>, <palmer@rivosinc.com>, <robh@kernel.org>,
 <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 03/11] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Topic: [PATCH v7 03/11] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Index: AQHYIaqttStvU5ae7EKFzk9c8SSw/KygzymAgAB+uwCAAALKgA==
Date: Wed, 23 Feb 2022 15:25:00 +0000
Message-ID: <3483b6c4-67a7-5ed5-2953-728ea8ba5874@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-4-conor.dooley@microchip.com>
 <5b0681a0-ff46-7eb4-3644-0d1173c1f0d4@microchip.com>
 <YhZQRqHib2+GR7Ma@piout.net>
In-Reply-To: <YhZQRqHib2+GR7Ma@piout.net>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dd5aa6f-8cb2-40f9-c9c7-08d9f6e0a870
x-ms-traffictypediagnostic: CY4PR1101MB2104:EE_
x-microsoft-antispam-prvs: <CY4PR1101MB21045DF18D328CF454DC3F62983C9@CY4PR1101MB2104.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AFqtwHeYR2GNdiczTZC18CaXzw67IHRBe+EQiQ/nmpeJlmehJi/3GDQ6ZJ7c09rYle4CA1pb9XrfiyebHWGyp+fT87GgafSCawyym2+/5iWYFhwzMNbR5Bh7pPAFMN5FpDyDdmRseYr4Z6Wlf8jQUBVORc7Dal2YQ3E9jr6YbmGca/u+LHxVjbLr/Dgt9D1SL2d+xAhrFvIUp1K8nl1wb/M47Z/PI8IY2NbR4sRJIZf+pd60wxZNi/j5eHN5FuJ4vS+z6A7bobtEPx5sZA1zlKXlwhZztbSl/xfRatf6ZD8Lg8gU0SlN1GHS8IAnIIQQBj+35F2LVLlDtCxR95dW67f+nNDRQMP4+TjVuhitg48ySu/AT3+rCagi6Wen6VHVvH1UqY97+iYQshob9XtofJkuUV/4hhJt2K93WeQmg0VaxN1gLoWD3tSF48kbgRrjBl5/EUgZHAC6jfjV+FFitPcHugwkmAm9AvAcot83c6nD1NvAtwGxArhnvmDGSI5MQgNf4vuuJ528BHBNFB3FtKz4QSqDGPvZ3spWduHK0FL/0jzy+hgmmmcs6wXE0+vMn/mqBuQ/ev8LDVxRo2MpyKMXp8972fvMuZpiS6fAFMwJLjdUkfoK5S4rqLllfmsvo82aFzBFPHCFGTYufQm/70wGAP/EjiYeNTAZYWz2mCMdSO25HCnBfzDFUg9LEkaOq3LRJ9cF+LH6Ay+t+N636/PmJbj7D8iyvSB9fuQRCPgY1+tF5mG0p0O8Z30l7ij0AxFAhOjbCRS3Ywcd3TJ1Q8u/GHZxjRsR8BR4fsctsyc7WoHRRB7tG03UT8/QNtAJo8+jrjdbfzPp6VRhpd9JqxrucvLC2JMKhnhlpFxH9wFUwNjP0UX+YkIauu57pt2nkGWaw7qecSEc/u7ZuVUw+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(6916009)(86362001)(38100700002)(8936002)(31686004)(7416002)(54906003)(316002)(36756003)(71200400001)(83380400001)(5660300002)(6512007)(66946007)(186003)(91956017)(38070700005)(66556008)(66446008)(64756008)(66476007)(76116006)(26005)(8676002)(4326008)(508600001)(2906002)(6506007)(53546011)(966005)(6486002)(122000001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2hDNndzOW1rUksyajZXWVRHZGFydW9GSFYxeEl3Zm85UGlkUHVCaUZDWDI4?=
 =?utf-8?B?UHhucGtuRDdSeThJVDBGcnRlTnorMmRyeDlFSHlTUG5PSUJPUTNicGlMV0dS?=
 =?utf-8?B?YTZaK3ZLWUc0RFQrZEpUM24zK2ZNL1ZxcG9YanhySVVodjd4STBNRVo1S1ZO?=
 =?utf-8?B?bS9ZSGN6cXQ3K3BiQzFPa1l1TmdBbHdXQldVRkVuV0d4MVdxRUEwSWJqZmhQ?=
 =?utf-8?B?K2k2L01PcEZjY25NOTFFZnFsd3NhZGZwSEJ0bmlDTjVuU2wwZjlERmFDRnZt?=
 =?utf-8?B?RkFkSk8vME1xSDgwSkR2ZFRObkNGVzNsZnVWaWZYWlV4TE0rcVJ1N0dieGtY?=
 =?utf-8?B?UmZoMG1SZ3NHbDBmbURaMkpIRE92Z1dBeEJ6QnkwRFgyM2twSE1UTGNDN0dV?=
 =?utf-8?B?YWxvMWNySTNqWjYwZit6RU5OQ3dPa09Id2dvYzRSaXY3R2pXbmhLMFNQWG9J?=
 =?utf-8?B?UWFWcnFEeC9TRTc4c1ZobEYwcVdUemdoR2pjdnZYMWQxRHFQbCtBdU54SFhy?=
 =?utf-8?B?RGVHVFhycXVlcnBweFcwcVNnaTVCZXRrK29pV21YbE1URXJsL1JKR0xzUSt3?=
 =?utf-8?B?UVhMVUl1bk9EM1d5VzVMSVAyYUVBamt4SjNkTitlbW5DMHc4NC84QjNGVmo1?=
 =?utf-8?B?RlhsSG5JbFdKaWVnWEhsSTNSYmw1aTVnRGVIYnh5YTBiUnFxUTEwNTZHWmhJ?=
 =?utf-8?B?RHdQUmZ5RXFUR0tPYm1MOW5PV1dHQTkxbWFqcUw3NTJQcU5pYXREczdkU1Bp?=
 =?utf-8?B?Q09DY1hzaXpTcEZoNTZLOXhiL1VSZTIrSzVjSVFkbWd1dXhIZVVJNWNUdFNM?=
 =?utf-8?B?cnU2K2JCb3NGSmh2a2xxRUUyZXdQMVZtd0VxTkx1TlJEd2V1YnZrWmVhRUI2?=
 =?utf-8?B?TmtVSjZKT1dxTFBqWTkzMUtvS1poTlJnS2F5SDhGR0k5cHVjRVA1ME5GZE81?=
 =?utf-8?B?K1Zrci9ySFBoWUdkS2EyREZTeGEzSGMzT3k4Vi9Ockh6RW02UldsK3pHZFdB?=
 =?utf-8?B?c0lPVmxWa0NPY3I1OW56aVdNRUN1bUFSZVp3ZUFsc1A3TEExb0dqdVJRc2dt?=
 =?utf-8?B?dVdjVWdIL2pyU3h4WEVlTklaM1FXK3h3UzdKRWxwUmtJNW1sSFEvbHFNM0pk?=
 =?utf-8?B?bCthTkM5N2YxYTZHQ2E3Y0N3bUxzUGN5ZkdTdmUrTFVJK2hnOXRyV1BCTGtv?=
 =?utf-8?B?TlNBRTZtKy9NWHMxUUdDUnZXOGNPbFJ0WnBONC9lVmlPSWp4b1JWQ2dDL1hv?=
 =?utf-8?B?N1JlelllRGtGSVJHL0RMVXpWbWIwVnh2MnYxeGszT0NTVml4alBxYkV4ODFD?=
 =?utf-8?B?VTZTbHRFSTRxUG8yWXZnNHlvUXIvaFNxTFBWWHhLQ05VTStmd1NGdG1kQjAx?=
 =?utf-8?B?VGFVQXNlNUNMWlFWWXhjeElicW1KNDIzTlFieFZIZS82bDFHYzRzMEZ1bi9x?=
 =?utf-8?B?M1RBUFlpaVl1NzE3aWFnSlRPUkoxWXlwSDVxV0ZsNXFaMTZTSVFuWko3VFFi?=
 =?utf-8?B?L0JkenJkQys4YzgyWmJramZSbG9PVTBBZEN2K3luWlhraC9vY2ZUb0l1TDl3?=
 =?utf-8?B?MUpDOTB3bndIUjdnK0RlMGs3UGtDMWRFcGM2czUyRjhVajJYQ0lLMFZBRmNF?=
 =?utf-8?B?VkROby9ZcGJ0ZkFuVEJtMXhhbVZwa1JWSGoxWm8xZGJYbytuaVJ6eEUzOEh2?=
 =?utf-8?B?Ui9SOERta0VFTnZGWkVXT1lRRnA4NkxOS1g3dWtyaE55UGFocXZBZTIwcVJC?=
 =?utf-8?B?RVc3cXZKT09uNWJxRGRLS3hNcU9hMEJESTVmTENJRExjRUo4S0VIV01EMFVE?=
 =?utf-8?B?S1RMYmJYYkJmVWMvS3ZDZERyRW94enBWRTJiUGpIZThLd2hlUDJsNEFYallS?=
 =?utf-8?B?SVRvcExZY1hURGFseDlTYURheVVBUTBiejRRZWo1d2t0VWMxeTBGMm9PUzZv?=
 =?utf-8?B?b0RyeWRINkEzaUtWM1QyUmd5TGI2TElSTnV0WU5WQlZuUGttVzY2NndHMlBo?=
 =?utf-8?B?RWNJSVd0U0V1anhxb1ZnY0N6cndwSmczUzJKaWRQeTRFVWVYdUYwWDVwVzRv?=
 =?utf-8?B?Nmw1cy95dnRQMnpsUng2YXArcC9PQ3lEM3djUlVENlpKV0FPRFRXblRLYTZW?=
 =?utf-8?B?NFZIUkV5UWdVcDNqbnhiYnpiTVp4Vlk4L25RN2N5REhHcXppUHRncURUWDRw?=
 =?utf-8?B?aFJnSHJTS1ZhQndoY3NxUUsxSjBpVWE4ZmhLMXBWN3hjUy9UMXFwQVFUM0N3?=
 =?utf-8?B?MXhEa2ZTeEs5b1I5RmpYU2pNTUl3PT0=?=
Content-ID: <D44ADAE4C747C140A4BCC9AAF7DD5173@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd5aa6f-8cb2-40f9-c9c7-08d9f6e0a870
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 15:25:00.6363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpGXBoWuH6ZPwBKOOyH1rRYp/CWHEFpf7kJsyWIvap8hKW3JiBWdCPS0udR1P1YfSwkpnDxDGXWoyvvkc9xbICYKHex2BEWLUo1/m+dhuKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_072510_869107_96F32A52 
X-CRM114-Status: GOOD (  17.52  )
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

On 23/02/2022 15:18, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 23/02/2022 07:41:27+0000, Conor.Dooley@microchip.com wrote:
>> Hi Alessandro, Alexandre,
>> If one of you could take a look at this, that'd be great.
> 
> I actually expected someone else to apply this, what is your plan?

I was going to ask Palmer to take the series via riscv. Since I have
Rob's R-b, I was just looking for a subsystem maintainer ack/R-b before
actually asking him.

Thanks,
Conor.

> 
>> Thanks,
>> Conor.
>>
>> On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Add device tree bindings for the real time clock on
>>> the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>    .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>>>    1 file changed, 58 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>> new file mode 100644
>>> index 000000000000..a2e984ea3553
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>> @@ -0,0 +1,58 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
>>> +
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
>>> +
>>> +allOf:
>>> +  - $ref: rtc.yaml#
>>> +
>>> +maintainers:
>>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>>> +  - Lewis Hanly <lewis.hanly@microchip.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - microchip,mpfs-rtc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: |
>>> +          RTC_WAKEUP interrupt
>>> +      - description: |
>>> +          RTC_MATCH, asserted when the content of the Alarm register is equal
>>> +          to that of the RTC's count register.
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: rtc
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    rtc@20124000 {
>>> +        compatible = "microchip,mpfs-rtc";
>>> +        reg = <0x20124000 0x1000>;
>>> +        clocks = <&clkcfg 21>;
>>> +        clock-names = "rtc";
>>> +        interrupts = <80>, <81>;
>>> +    };
>>> +...
>>
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
