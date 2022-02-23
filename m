Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08260C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfvzM+FVhadh+czeT24ihego4nEN5dTKp4+nVgV/k9U=; b=hDbGNFNeq6B6bl
	6BI3HHxHxqshJdipQGhr5Yw98E1x1IBxm8PD0lLQPi5FoY6jZDylsr/GperSjf4csKbSMW/je8BRd
	CpHviPRd6y/FdtH19YCi7s2PqOFru+jtVl2M41EQp9hQYCuaPO30c2kCDJlFh3PUgMstwY7OGprWQ
	L4/RNaZ0cP2BuB3rh0MzchMLm8chD3ofImtXQLA+P6PsJ1K8meqaTMbvRmL7jKSFw7m45MgzkG3p1
	FV/f+sDHrksMHjMNaE3EL8rYBwXcl0HmRTkB46a3mZI82UQ/8Xv9x14oOBOtpSvVjn8Zd0cFRxLvx
	i0n9eQfwQg5N4UsGPYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMmHM-00D9ad-Ve; Wed, 23 Feb 2022 07:41:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMmHI-00D9a4-Ph
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 07:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645602096; x=1677138096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r70NBIG9KHueUVtk7xgfVuNM7I0zn2eTmRvYH5PZCqs=;
 b=LxHthAwQAmJJCAFGNbT/1ZT/qc6fetqgi3gJfmdjlHU5UpN8KkQ8GvoZ
 IwBxPSzStIdCcyuO0abIdpzwVYf8jNK+29/+IHhI4+3C+7pLhi+sLP2BU
 s6iVXcOb1fzg/HVLUxx6I7qIFlboyP0cyqAQ5MKdF/DWhBryGxn9BGYca
 zUSUnR/ft3Z/F83XOE6rLfqFCOHgkqoWq+JvHwAw284fvOgiO2b/GYH/A
 kE+PyqeYPcRtdeZwnF/P0SW4c1Qui9/TSQl3uzz33bqPIK3/BIfOyNlV7
 plswiM4LsBosmkTZr9+Y8WpF4i4gC5sOjgiJY2zlc2dd54P0I5Clr9TTn A==;
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="154555208"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2022 00:41:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 00:41:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 23 Feb 2022 00:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtJVfGsLk/KEQuRj8iVv3e09aS5p5nTY2Cv5VNSuE52fQpMfM6WzkJL0lNDsejoxIU+gBjEbWtskdSnMaddrueT7KynH81kdQXfIlX3XvJrboz/FKN0dfVCVpgkDZy18b+WMR11zrD8Yo+jGwvAYXDquaOLBYqx8yxtds7S091tfNFKw7An94fEox+xhjc3/8yIzo/wgtJo8Y9THdmLQyoQY3pNv53v282mUMc3cSorJZXUfd7xDi3EAauknREPvGFzR1nBCyc+b2uZ16rhb8t0V1QPfa4DFpqRHZGAAsY3k74kEPrNh7jKS1/67CkflS+yZd4jLnKELvJJ35nN1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r70NBIG9KHueUVtk7xgfVuNM7I0zn2eTmRvYH5PZCqs=;
 b=JGU4QgznyiQ7V92kSs33GliVaMensrsB/oCsmc5dviAjGgRYnGjyOJB5i1awHfx4YQg3CpKC+jj+5I+akCo00P0Lc0QCfIQasMq10Gv34R/dCJklO1lGjvYe6Z7yYIEZZupduRFQp1uPGdwMSbSZXcUWewQKkd0VEPLNjfLW288/1F0C/AZtuu/eewYhEy4q0SZscqocKMf9eOA4gB7vW0le7v9fQjvmd0zF0IyKTdnci77XonAyZ+eanPiAz+gkxK4+IYVyoPxNmARXO5I0H4NLZDI3PCogztae5vMQzARDfUYQhnwGWDp5CIzYRfGpxIF62BmeYQ8conQH+NneqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r70NBIG9KHueUVtk7xgfVuNM7I0zn2eTmRvYH5PZCqs=;
 b=T6BK5NpPOsJoqvoiv4wNQa2PxYDxoupdx8XlF6wBXc0NdVALS4OnVXtWU/5cSFQzywRZQAj6z5rqxwbfGBghAHFmSsTFk/TcjZ0bLKKcTretNAiZWAizBVGfihDMMRk5+WRxN6mu8h19+0yn3SkQjdIBvEbLIXScdj5u17Au5Rc=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by SN6PR11MB3278.namprd11.prod.outlook.com (2603:10b6:805:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Wed, 23 Feb
 2022 07:41:27 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec%4]) with mapi id 15.20.4995.016; Wed, 23 Feb 2022
 07:41:27 +0000
From: <Conor.Dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
 <Ivan.Griffin@microchip.com>, <atishp@rivosinc.com>, <palmer@rivosinc.com>,
 <robh@kernel.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>, 
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
Thread-Index: AQHYIaqttStvU5ae7EKFzk9c8SSw/KygzymA
Date: Wed, 23 Feb 2022 07:41:27 +0000
Message-ID: <5b0681a0-ff46-7eb4-3644-0d1173c1f0d4@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-4-conor.dooley@microchip.com>
In-Reply-To: <20220214135840.168236-4-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34229e3d-7b2e-4cae-30c9-08d9f69fe661
x-ms-traffictypediagnostic: SN6PR11MB3278:EE_
x-microsoft-antispam-prvs: <SN6PR11MB327869C900577C9E864D94F7983C9@SN6PR11MB3278.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mI/KB1OoXJ0a0pGGzterbUFbVs0TDrVBVYAvnqGix/jKnLw/uz+qpbaqUgus+BzaEgaAkXxU7OGbsIgMRCXHtDAVXqEdIlQfZMV/wxHNXUddnVuCIK4Q1BCODRIpi4OQ0BroK7n4uFFm+a+RGbACTYP4Vb0bpZCfoiRVTqyVWZBAgaPYJjqpZtCQ6v3trem7uUlkPH0/KLwA8fB0czVGh5cm/Au5yftaKIEr41dE6EZOdjr/YzpwS5H8bioeJZAbXHc1FPkEqLatl8IBKTSUtHmage8mYJDU1PGKX6jhm0Co1/5ycu5SjLqcJWiB8UMfmyC67mxskGcx96CJ7mBM/E4H+za4vDlxcYC9LHnYEuHPOEklTrKp3o1tD2IvxAC4oC4p9Z9wD9zOAVHUJzYjRCutFeWtnjTrMbTflDjOrv7XDjGiQH3GjQyC4cDfk0c7CPsYS87nEp31PZ6opquPpz3Sb9KEdE9Y9E9mwxgJL3vDAKvYhVfSWWCr0HGPlHniQDrwe3YeMs4xKoRxYU7BVygpS2i3a33mSBw0++Ro6YI19faQNFajQ+5hfPvioY5mfQLpoOPUP1cxLn9/Q4PJMbeUEFX9Jn+1VbCQ5kTqTQhSCK/28mFhZQTwF/pfHR2FsOCaGsv9kz8lIieQdIW1mer4k3MjCb6h1lLGmi9ADyMUoqsXwCtKIHoAmHnWC7WPHd1RQwtljp92PzGDJJyb+MLKcn1/+RXdcKgWfpIL5sqvo6Af4JyQ2rmj7hoaGrPzu1FfFganQDOJUyBKMupbEfzxc6ubU4ivXNzeQTr59VolBrlXTOsqzuIfbZ0UD96UqzBxX7wVRiSFhJBfN0kOirbFQWTaWknnCZ0xdMET73uKD6lFAiZOkfo7c/nzYQjrpkXty7k85mvY8X1V+44eDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(36756003)(71200400001)(122000001)(54906003)(316002)(38100700002)(110136005)(31696002)(6506007)(6512007)(86362001)(91956017)(66556008)(2906002)(508600001)(66946007)(66476007)(83380400001)(8676002)(4326008)(64756008)(966005)(6486002)(8936002)(5660300002)(38070700005)(26005)(186003)(7416002)(53546011)(76116006)(2616005)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDNmdmc5WlVlNFFBVlNVUGxERGhheHFSTE5qRnZkWEN5WUJCQmQ1aEVqZ1Fm?=
 =?utf-8?B?MXNVY3g0NSttc3ZVUU1Bek1wRk5WOUN6TXo1RmEvZGVELytXSXJMZnB3T3Az?=
 =?utf-8?B?NHU0RktCNUxpWW1IckhEY2VkL0xOUEMvbjlPdVNZNEpXTTRWY1k3Vlc0UlVX?=
 =?utf-8?B?ZXdJdkhMdkx5RDJUS1ZTakdSS3MrcC93L2d5bjJQQTdwSGN5KzRVaTl3MW9y?=
 =?utf-8?B?UDM5Q3FGbTNyZnJHTjNQYmY2R2ZIYTR1V2w0cUczclA4Y25DeUF6OFp5ZWFX?=
 =?utf-8?B?U1lkdmRJMEdqdmNNeDFpUUR0Unh4bmNUeCtseHhnU05kM1pWcTRwQzBIUkU1?=
 =?utf-8?B?ZXhOS0h1TmkxUzhucmV2bVNBTUdWZ040c0dCQ2JEazV2US9BYzZZM0k4L2pi?=
 =?utf-8?B?MkQvekpzV05TdXYyV3FkNG5yOXVJdWFqcEFrZHcvWGszdDdjUWdwOXZta1E1?=
 =?utf-8?B?OXdwcnc5SEIxcGQzeTRSbFJtQmdTS2UxRmpzQW5hTDEzT2taNzh1NlB5UEds?=
 =?utf-8?B?aDZyNVh1VXpkVklLUm0raUZOMUJyM1BmQ3RUVkVoQlo0Mldjcnh2endlc0E2?=
 =?utf-8?B?azUzTzFybFRnaWtRQ3NjZHB1ZEZBTGgzUkV4NzhnVGxTYTlvMUh4ZWo0My9K?=
 =?utf-8?B?bndRanVsN0NyZHBYTFFtRkFZUWlWWWdKVlFyazV5M2NMOXNDSkhNbWpPVURJ?=
 =?utf-8?B?UkxqOVdUanRZOE9HdVExWnd2bW9CeU9vcFVndldVZlJpSzZiR08xZlA5QVpy?=
 =?utf-8?B?Ym05dnZleGpxSCtCOWdzTlVVcUY2QzRQdldqSWVWN2lvblFUMW51b0dmV0dD?=
 =?utf-8?B?VUNCNWNwTFF1eWVnaHlIU0Y5ZE5aQmZzNml6VUhSU2c2MnY2dXViT0tqWUcv?=
 =?utf-8?B?TGZCOUpyNHhrdkUxbzRLcmxWY2xaQzZFaXJVL0VzTFh4YjRKOHJEdVVxdGpN?=
 =?utf-8?B?YnlEWU9RMnBaaFQxMU5CL3crcG1lRy93Z3czWjhSQkZEYWsyYzlCS1FoK2NM?=
 =?utf-8?B?ZUhJUmlWdU1aZ2xjUGF0clMxdHNrOCtMQnk3aWRDemh5RitvZThveXVPODMr?=
 =?utf-8?B?SlF4eHdPUnNMUXdBem52NFNad2VrTjFzSkV0bnlpckZ1bEJ6Z0N4d0p6UzVE?=
 =?utf-8?B?WVZzUHozRXlub3JKSGZLMUJyZ3JhNFZmTjB3YUlOajlaSG0wOGRqd3l2YjVX?=
 =?utf-8?B?cXNyUGR3VzFOSGtCR3M5NWlmMHRPZXE4QjRqZ04wNUtGb1c1UWVuN2hBTlFW?=
 =?utf-8?B?Sk5Ebkhhak5hNThjcHU3K2hiSnFwMDV5cXpRVk5rRy81VlVHTjNlckJXUTN5?=
 =?utf-8?B?aEsrN0lPMzl4L0E1L1Q3K2UwWTlpUzlKcDZESnk0YkUyUC9UUHdpdk40RENR?=
 =?utf-8?B?SFhpNmhLVFFQVDFrYnpiTWhHOHgzV0N5Mkd4RllmeGRPR0l4YjZvZnpScXkx?=
 =?utf-8?B?N0NoU3E4dVNaVTlkT2lEWCtoSExqdTB1MXB6NHJPWGxOaFBJWUhnTkF0eW1k?=
 =?utf-8?B?d1Y3Y0Ywb3NEejdIeWFmZmlGQThkZGNuclVEeE04b01LTWx4a1EzeVc0VHZh?=
 =?utf-8?B?eHhiY21MZEhaZWpUWmxkOFFBSU1ZTGxVby9iUWVESnIxR1cvOUJmN3BMQlAx?=
 =?utf-8?B?WTF4dHNHN2pRVlBZeGlSSEh3Z2NHUWNlR1dRZ1Vlc0pnZEthRnNvWC95bTVm?=
 =?utf-8?B?K0NCZ3RPeG1kczlXckQ1QTRDNUVPL0hOUzZVVEdTdDZRVFJKRUJYYjArcStj?=
 =?utf-8?B?VkNWNUh6TWVqL09Va09EOExmeFp6RGwxZHV3RjM5eGZqSk9tZlFFYkJzWGZ1?=
 =?utf-8?B?Z1kvMkovdFY1MTFPZU1VUHFLNHhUNkhsRkVMR1EvWDJFaENSSVY1a0RxQWVz?=
 =?utf-8?B?YmFPQ1kya2tPMWhITTZFMzdsWitXRUFyNGUyRjQxamdKek95blJCMUF0bzRB?=
 =?utf-8?B?M2JsajRyNy9MbDV4MUlmRXNPc2tMZVFGalRaR0Jka21MQVdvcklJcFlFQUtV?=
 =?utf-8?B?bnR5aHNNU2ZCakYzR3gyRk1ISXRzMGJwKzBRdmJPc0pZdVpnOGRjREZEMm1U?=
 =?utf-8?B?SDJOb2dpRkI3eWZObWYrYTlHblA4WVRSTE41WW1HQkd6ajBDMkFIcVdRQ3hu?=
 =?utf-8?B?RzFFOWFlVE5rdktqOFlac1VsS1FVQW16WU1oTWtMaXcxNUEzTXR3S05iT3JL?=
 =?utf-8?B?VUlmMnlUeTFISHc1b1RjdHJFV25jWmJCMEU1Y3ZzSnNqeFNuUkpOd3M1djZL?=
 =?utf-8?B?OXh6Umc2S0NEMFR2R0dBaGRHWU13PT0=?=
Content-ID: <1CE277C3C3DABA4EB1F3B8D0ED926F6E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34229e3d-7b2e-4cae-30c9-08d9f69fe661
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 07:41:27.4216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJ0W5EZxdGZXO5uNjwjwt9lQMYcDCtPUl0iNhWWFEyUsQ2o+OOa/1Wzjy0/c1lEOvgoFPS7MqR3fx0Q37SL//JxIQ8CINZFD9dORuM/kgq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_234136_948382_556D84A8 
X-CRM114-Status: GOOD (  17.37  )
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

Hi Alessandro, Alexandre,
If one of you could take a look at this, that'd be great.
Thanks,
Conor.

On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>   1 file changed, 58 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..a2e984ea3553
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: |
> +          RTC_WAKEUP interrupt
> +      - description: |
> +          RTC_MATCH, asserted when the content of the Alarm register is equal
> +          to that of the RTC's count register.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rtc@20124000 {
> +        compatible = "microchip,mpfs-rtc";
> +        reg = <0x20124000 0x1000>;
> +        clocks = <&clkcfg 21>;
> +        clock-names = "rtc";
> +        interrupts = <80>, <81>;
> +    };
> +...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
