Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C436FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zx3kLGhe5JNA2RJRF7ts9+KF7KoSO7C3jsSrOnMnhVQ=; b=nzfQEliY3hNSX9
	4EPXFHvvjsvNnSrUpUTqGQ9bz0/ArMOp7r2k/gTphDjaiTq3AbUzVOCqjRHLa6ENOLh1fPR9pRg7K
	OhGF1uA2cLu6o0v7NeSB13tNuT0fcnv05rjVai1IPQUEvHye8OJuD9ns/ouoZAbzN7Pgu1R0yd3kO
	DYoumracK3zaQmxob67qkw2xshkFj79kyfkJHfJ9MLBdjttIbHfDkp2hyu7KKxkkskpYlBYW4GVPu
	FyYja3+5dC2Ix3nRo5FM2If8gv+sXvOf007djoAVutjSxB5VHM43E9eG58l7sujVeK/SLVD04vfvQ
	wKLG6JFHC5rqWknJ9EPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChx2-00GHiz-Kw; Sat, 16 Jul 2022 13:35:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChwz-00GHhL-5F; Sat, 16 Jul 2022 13:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657978518; x=1689514518;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rVPiLKHkTb1ncNpTpcKOHQiQ3jDYndYwNchARMKBTSY=;
  b=kHu73lNZxW4XslQ5Eux3VM2Y4ZygypNZCcpvDtdCvNkS35eI5oLC+Nzv
   O3iJcEM18mQKGOgveSWTHNI6BVB1IHUXmFWy2e6XS6Tz/yKAjANrrxxD9
   nTeXvhdgx0ZnT1FtXSZ11ial+u+/kBheopNcRWUX2PDeLuu9DMaVT1TWf
   wgddznxedvmKp4e9eSICel1CT/rSVLK2G6inYFIWoapK+4mtLV6U01tpr
   AutHY0h1Oo+/Q3iO9alfhaI5QYqAyAPAln3YvCmrqJv7QhW+Lvw0DkJM4
   yls9+FcGjVphI6WBhZlbS3QkB9RcME1DNJHyihkO6zi2jekRPjBiWX5zY
   w==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="165043669"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 06:35:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 06:35:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 06:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmWDbl/WNUyYPnBHnQjcA5rhEV+nbMPEI9IaA/pZI1lnFSO7WxFiJ3vJKUnPljJljWpTTsk8DROVdDSKADImykgz7XdR7WLu32WXSEknf0YBSTfso6ibJtXbQbeCxI+BeeMQDnv19UwzEwwIDaCiamdAGdOizx24289QGd9BGOtBFlIlZ8G+jQOmI8NgL3ZS4RE8YvZf5oEsqB859QQAQBn3lzLAEQiUP1tYGOByBzV0XcrFsCOvktVhJEig7zvNmdZZZVkV0/O4ENLNY7YAsjUQ1fhARnPH8UYhdU17QsZW2JyqMrZD9SQJDSZm3zj2Wg9I39o4c9jlVjizUbFvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVPiLKHkTb1ncNpTpcKOHQiQ3jDYndYwNchARMKBTSY=;
 b=lDZ049D35uWtu8RrXWs/2W5ZbBIC4OlSuROnO2dfZfvIgvcdx+Z20kPf+Rx6rg7wrMyRH9rOzrLfhEp92AIkHBQ/UzNP6pwhRfcP+Plae8vXzhLDuqR9u/TPZLxjEhTnF5kxNvjjmg17kzKZAU1Fb2W/9PYsDoqyHL2nNt0ntam+VS2nN9kIatiHH+NC/vcxmmn6B9WBJO3ki+qXH4MFY36H9x0pv5tbiG8XD6CJGjMQaKBzZguAd5bHxwOcQXt3yfU8co83F8QPrF++oeB1oj5t06rVnIrwaARJFOjIbqFuYkk/EB2jt5k3RtcVTNd40Plwj77nax0vdwef2DCc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVPiLKHkTb1ncNpTpcKOHQiQ3jDYndYwNchARMKBTSY=;
 b=qQfxATT+q1G2D0QBIJos1jV+v2pokrtGqRq45AyCJt3crGI0d6nSZORSxi0safToTRe8ygqYwiTmO6qaOHNl2dX6C/4zfyQfWH+zttqhtfaRYgnnt1yFfwvah8E5kTWZm4TN+H4+yOmHyp7BuzQa3/6DPdoIqJzi+MeSAPjq85I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 13:35:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.021; Sat, 16 Jul 2022
 13:35:09 +0000
From: <Conor.Dooley@microchip.com>
To: <mail@conchuod.ie>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>, <aou@eecs.berkeley.edu>, <sudeep.holla@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<guoren@kernel.org>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<heiko@sntech.de>, <philipp.tomsich@vrull.eu>, <robh@kernel.org>,
	<maz@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Thread-Topic: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Thread-Index: AQHYmHPj95q5mWrtS0GGLuvs3DXs0a2BANMA
Date: Sat, 16 Jul 2022 13:35:09 +0000
Message-ID: <b5abb978-75d4-962b-c6de-fd75dc6cc537@microchip.com>
References: <20220715175155.3567243-1-mail@conchuod.ie>
In-Reply-To: <20220715175155.3567243-1-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94837e1f-66ec-4aaa-36f5-08da6730007e
x-ms-traffictypediagnostic: PH0PR11MB5110:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: odm8tJyGQqrXd1uL5jgznMzklDWUvlt9kBg/O8EtjMBkybh5CkPuO6y9P2BgZ3u4oNpLnzKZJtrjn37CJ8EYC3wBeamJQ1IVd8HvR091kYUEVn4LJVvucZ/MY4MATjoQaxGy6o9FjlmXOTug7LL/2V9Aoq0YXSl7W33M7GxE3Dj6/0Yvq/IXEKmtvlxI6qTKr+1ETf7nsyIafOVVVnrH2W1i35hujG4FogQxt/1DS/kAXilEuGv4RZkTZ3qtKjJSowk8uOCYjn1I2Pc72tPI+2hRTE6fyG6gaDGLk/uDTmimIgWP6fwMJvr/gkdzNGICEKWMvO+8h/nDEPLP4hDWo7TGFFSF2MZ8GSZbfDstxjL1Y12386rhyA22flyhLY/mAbfJF2FSh1xw8Ua633E6S2U0qUWed4QrbbbZ9ABmh1wODqF0S1eC38R9JmkJYlgG6yTflNgt/0p+Q0jX0OAF0YPWuM0Yo2YVGHX7YKm1eNd6G4Ky/z56mn1be6gYA+SUVOc4hjqgRCNBTE6TtNRWK6OADCFsdzkOfGr5O9KMrxzz6Bru/5LN2P8RzMlyuffh/IQ8xNRk6uI/xE2HkXsGLJKdQx/yOFjU5z7WSJiidRLXp9HVY00F6KdTTpHC/6WGQqsuVPTLNePJEootOc7aqSoKbJL5TKD8zF1k6s6fiBCMAmQXlZjgvqoyFbfHm7Mkn2wrcRI6mekXPZg9el65Vmw3SCFqGLPEXu2UA4qSxL60Dbip+9Lp55uqKAPm5VEWTCd+4XBRgz+g+bIpKA0D52wY/rxbbCzEgDqx+xluI4sIpSQSwmO2oPbFc0p5BpknlEln/DJgtlZelyvVd7JXDv9NSUFJdcDHTcag0j7/8135hk9Rnzmpkomw6bIYGTKSTY6CkN+qIx+S3NMxjF6p8DT0lyjcao+qeqVUQ0hhYXw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39850400004)(376002)(346002)(366004)(396003)(83380400001)(2906002)(66556008)(2616005)(38070700005)(186003)(921005)(36756003)(76116006)(66946007)(66446008)(64756008)(4326008)(8676002)(31686004)(8936002)(7416002)(66476007)(91956017)(26005)(6512007)(5660300002)(478600001)(6506007)(41300700001)(31696002)(53546011)(38100700002)(86362001)(54906003)(71200400001)(316002)(6486002)(966005)(110136005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHRCd2NLR2d6Y1pDa2NleGd0NnRtNDNXUENDbjlUeW50cWFDdUt5bW1EWXd6?=
 =?utf-8?B?N3dGdXlrOVVtdTBEK09jNE1PY1VvQWVTSjZTc1I2cndsY0w2OGRtZGxYT1Ri?=
 =?utf-8?B?cFNhZ1JxcWhCc2ZSL2FEQk8yaXFBcWlzb3hoRFlHRXBpZzlmdXZlWVo5M1Ey?=
 =?utf-8?B?OXo3MFFoTmxPVkV4TGZZTWVES3NPeERQMjZzbEI5SWU3dGNnd0xpQnMwNnll?=
 =?utf-8?B?NEpOUW5sQy9GcERKQW9XRHl0MGtyQktodzB4Wk8zTmtoaFlaOHpHUUkvZm9T?=
 =?utf-8?B?WVd6ZjN5R0VUOTYrQjExK05GVERMdkFtMHk5bDYvMjhpWnhnUXc5cGt3Rmx4?=
 =?utf-8?B?Y3RXK29JNW1iNHQxNUJJR3dxcDFoRnJrclpuWTEwUndmVVVmTzVOdG5UbG83?=
 =?utf-8?B?YVlDOEpHS0EwKzVUbzZWR3VsblY0azhwY0x6TVJyMWJ0cjJLT3dqM3loUGNX?=
 =?utf-8?B?c1Rqc0EzOTJYQnJtVEEzUzFGUkozckc5SjdlQkpPVlVsYnlVdjVRcGVuUmNx?=
 =?utf-8?B?UXpDa0NZbGVNMHVQSFVXWExpSm96U0kyRytNWjdXMjdxVkZsUFFRRUY5WWRZ?=
 =?utf-8?B?R3RFRVdBWURsNm5KdzBzSlYrQ3Q5UGE5dXJ1TTV3R1pTRlFHZWU2WkxIM1dP?=
 =?utf-8?B?Y2ZVMHNybm1EM0w4SlBMTWQyaWp6TUFkMTJDaWU5NUhEVHBKVjduWUpCRk5q?=
 =?utf-8?B?bEVRSXJkdVp2aXhOK0lTeWduMllrWjZqVklpTmhvRWJTYWtNZENyTTRNU3NU?=
 =?utf-8?B?ODd3MVd4NlIzb3I1Z0NUNjgzT0dVblk4MUl6SXJSbGh0TkpFa3dBR2Qrdlha?=
 =?utf-8?B?WTN0VWdMUWZSVjAzb3gyVDRnakNjRk1PSHdCZTZuc2hHcUlHaFV1Z1hwakhn?=
 =?utf-8?B?Q2pBRnAwb0ZqRjVJYVBjaU9Wa1oyWXBRdzZ3cUhJOFBlM0dsL0VtTm1vZEJK?=
 =?utf-8?B?NnFhS3dnMDBDdHFlUU9zM2RDa1BuR1ZUU3B2RVBreTJVVE8vOTdKck5MNVNV?=
 =?utf-8?B?OUl2RXFyZDVOdjlTY3daTVJQdjJkMk5LZDlpM09PZ1dZeStCSklmSldkWkt4?=
 =?utf-8?B?VU9SN1IyelVQZFc2YWhaNkkzTmY2Z3QyUWVLMHJPRnhSd2Jkazh5Z2pVR2Rx?=
 =?utf-8?B?Wm92OGJPUjM1QVZuZHlsK25uS2ZaL0FFaEU3azFIVTNqUkljWmpxNytTWCt2?=
 =?utf-8?B?UURxMjNZdFNncy82bEtFYWd0Z3oyOHBGL0VYbW9YWkdNTWt1RWEvRGRUVk9x?=
 =?utf-8?B?azFlaVdnTUlpRmpueit4eFJzeWd6a2JlYXlXZHhIOXFiL1IrVUhtK3FHVWhm?=
 =?utf-8?B?V1dIVUlCYW01bEpJNmFZUjNxdlExQVVlcDNWdEtRVGxyYUVqN1lkbFF1Nnhu?=
 =?utf-8?B?TUVJYjJaY3gzUGxQcU1rZ21QcisrQW1ubXFKYnBYQU41N1RrMFhiWFZMR2xw?=
 =?utf-8?B?TDk2dkE2d3NjZ1VkNFRZOGZoYTZ5YVdTcVU1bTZTYVpXWWZIZzRzM1RSS0hy?=
 =?utf-8?B?bXI4dVVpa3lWM3lSelJWSWxPTlFWcW9HUng5emZha0hGNDdQbnZBR0Jkd1E4?=
 =?utf-8?B?aGNZdHk5azVVYm1BeGp3SlFaclVhY0p4MWl6SmNGSmRZQkxoMkdQKzhBNGNZ?=
 =?utf-8?B?dWNwaSsxTFBmSW5qOVRtTVFhRlh1UHJEaUJOZXFaQzRuNkNsL3lhQm55cDZ3?=
 =?utf-8?B?RkYrSjloOXFlRXRBaDZBQ2crSnQrMHF5d0Y5K0pvamptanAwR0VEdW8vUENM?=
 =?utf-8?B?Q09QbHRUckVrMnM3RVRGRWhna0hLdnk4eVhkWXdXdnZibDhZMEhpci9RYjVE?=
 =?utf-8?B?bzljdmx4RGo5eEQrNHJ1TlRTUWpnMXJOM3VkNTJPd0g3UklTM2NkWGM0UE9J?=
 =?utf-8?B?eTlndnF4b09ZLzVDZDR6ZXA5b2FkNmFuRHMzaXlUWk56cWZBd1Rvekd4Mks0?=
 =?utf-8?B?b0pRd25SQ0ErNGdlSitWdHgzTXJyNVBzV3N5Zm9vMzVIV2JrTmpiUkd6dU83?=
 =?utf-8?B?aHhyYUZXeEVpaXl4ZjV4MGtpeTQyWnV5NFJuV3JONFJRdlZQOGlsdVNyOTR0?=
 =?utf-8?B?Y2U3amZLUUkzdmg1Uzgrek1UYWtLOC9vNktZVHNWSHZ2WVJ3d2F5aEx5UUcw?=
 =?utf-8?Q?hcnOgAY+pO+JgxFDDUQP7wGdU?=
Content-ID: <DD0F0184D4ECBA44B8B7747306F0B0D4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94837e1f-66ec-4aaa-36f5-08da6730007e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 13:35:09.0396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vMRWOJj3OL7jLBmag3vzpnGRQVj9B3vWICOZDkACpxluCUteOSIjSkUkyAWQj6X/tzgtgHNZg8vAzQPuGLYuDZGPCfX8sTal7R7nz+qkSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_063517_294681_B76CF589 
X-CRM114-Status: GOOD (  28.27  )
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

On 15/07/2022 18:51, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> It's my first time messing around with arch/ code at all, let alone
> more than one arch, so forgive me if I have screwed up how to do a
> migration like this.
> 
> The goal here is the fix the incorrectly reported arch topology on
> RISC-V which seems to have been broken since it was added.
> cpu, package and thread IDs are all currently reported as -1, so tools
> like lstopo think systems have multiple threads on the same core when
> this is not true:
> https://github.com/open-mpi/hwloc/issues/536
> 
> arm64's topology code basically applies to RISC-V too, so it has been
> made generic along with the removal of MPIDR related code, which
> appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
> using MPIDR for topology information")' replaced the code that actually
> interacted with MPIDR with default values.
> 
> I only built tested for arm{,64} , so hopefully it is not broken when
> used. Testing on both arm64 & !SMP RISC-V would really be appreciated!

FWIW, I pushed it to a branch for the sake of LKP testing and all
archs + randconfigs built fine.
Thanks,
Conor.

> 
> For V2, I dropped the idea of doing a RISC-V specific implementation
> followed by a move to the generic code & just went for the more straight
> forward method of moving to the shared version first. I also dropped the
> RFC.
> 
> V3 moves store_cpu_topology()'s definition down inside the arch check
> alongside the init function so that boot on 32bit arm is not broken.
> 
> V4 has moved the RISC-V boot hart's call to store_cpu_topology() later
> into the boot process it is now right before SMP is brought up (or not
> in the case of !SMP). This prevents calling detect_cache_attributes()
> while we cannot allocate memory.
> 
> V4 is also rebased on next-20220715 to get Sudeep's most recent
> arch_topology patchset.
> 
> Thanks,
> Conor
> 
> Conor Dooley (2):
>   arm64: topology: move store_cpu_topology() to shared code
>   riscv: topology: fix default topology reporting
> 
>  arch/arm64/kernel/topology.c | 40 ------------------------------------
>  arch/riscv/Kconfig           |  2 +-
>  arch/riscv/kernel/smpboot.c  |  3 ++-
>  drivers/base/arch_topology.c | 19 +++++++++++++++++
>  4 files changed, 22 insertions(+), 42 deletions(-)
> 
> 
> base-commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
> --
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
