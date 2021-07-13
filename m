Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBF2C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:29:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F226023F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F226023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vgArC1UFI7XbhC95aeKqYegZpIvpaQqIUjkreqG0Bg=; b=awaBt1ZBQ/V4gj
	KOnfr0GgVWwvOxKeUACIMMCFE5fuMr3+b2Tl2qigPX1SUebOfmpPYVAE3t68jLFuVgSCWqSkm1hQX
	gW+M/PYKIcmvgtowOiR95wvSZFcBl1ADbwPcSxqtm7p30wk5Uc1P9KIcE+Ib6O/Nu6ViGiYRVc/aB
	/rf525BXdu4Y8dj+Lqy4G9zqZyZK1LjT0tlz3VZM1gHdc/yZbshIzirNteCWKOS2af/aAtBBkH8Yb
	xwQFv0+919YfYaRPv6LbMKVvr3tcgIAmBeaQerCqKi5vmIwDEGUhFSxU+ngVS3p2ovL01St1geanV
	WGX77FLK3oAKg1ztabCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3KLj-00Am7D-EI; Tue, 13 Jul 2021 15:29:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3KLg-00Am6G-Dx
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 15:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1626190168; x=1657726168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=22HAZvqCfZMO8V1tbI6lZoXxN8nrqUzuG/AFZT6N4IA=;
 b=2YVAtc37PR2Y8djygCdsfcflwgr8sGBBmr7vt0LrFSnoc7j4Hyfth8VJ
 SN6JkvrhjCrOzID03nP++WCV0hX0qDzL7OctuJMlJ8/HqIRnUykClibMX
 81i768Zg4aIdYpQ/3jrmASSIjADtE9D0lfpczQqLPKdzZXlljtDNYsCUZ
 9IHjZH3kckdLsYRAeeqkKefIK4AKrLOFHpovtJwiBp+tuRy5MugpigoPM
 JEo164K/+6M2rFVIEx+HmF/HOOrofgP6+HpKqIXFRMgI8ken0/MJdWlGi
 XX86JJ+FXfpyf+fAcnArmuGBwJmRWdIRhtSkYzWJ/A5OZmhL9Leme931D g==;
IronPort-SDR: Mugh2Yr0WkvYlwNq56Io4dfjij4LWXw/za5ch/BTiYWxuwHmFI2k7wKzCkFP/7N/lEHbtZleiE
 Iu5TSDiy22GEbY6oMN7/k3RDbX6Gln37X+DOPqe7nW91YtGxyw1W6bWg45WD5+SizeiJZ53XSj
 QMBvEPAJjj2JjEo4++0tdQWj8jzEGGLe/x6WaOiBK7VS4OC2G+Fb6ejDwfysFc4qgovmvgI5vF
 vbdRS803Wb4GuE0eiNUtOsGKdwLid7IQciPBzLcVOhjo8Ylrt919BFO8+h1xD3mj3/sNjjnBrE
 drY=
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="62067133"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2021 08:29:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 08:29:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 13 Jul 2021 08:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9h2yQysvJa+w8B14zMQyiNGli7voSipjHfkRbtSyx3Dhn/8KqY+kQWsMLhWX18HRPSU+yYoH1iPecW4ZfOfpkvrNJnMKI4Ol/hes262m/WNAuu4VwKSZqVHv5e93CTvQOMWTVICRh/9yrSVEnIIaxRF4+pGMGb2x/sPxEYbbPiQ/375FxHwkrnTIdvN2S/OcDY6AdlWHJGPk7RHSfAdyHA5cyTiGpof/8BRGQ8CN/24sSecq9eG6E9eyRoWIXDVbf6kIJR8NmTw3blU12UNqWSoH6OYEqd8g6sp4JpoAFjJeVmB6vAfuMASARqloSp0vURyfJxjMWSvMh0f4XR3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22HAZvqCfZMO8V1tbI6lZoXxN8nrqUzuG/AFZT6N4IA=;
 b=VFtacwt5N4EfLyQLlPb46tx+ylyDkU2kOq3sFdHSDim2EK7XRWVG0MMn/P5OxqsFPcjUm1EzIRwkRzHVRpmUma0apLLodmeglxUgxf6GcBkIZsreDNIaBwPWkmraOOKfInztGZcNKK/VuXAWk1fDY3bSCwAzQ4g0K7aWirXWklkajpnPzcQjDXqCfvuAooa26aF7iVgWBLAqpk0zDfDNdd5C9D/u8SQkr/8+RFjO/T1LpZszUClIE0/l3+75ZIhU8f+HD5CG5q2S9K3hBErKwDfmDQk8mJ09tGm9zZjWEcqy9OzSV+GnWknz/xBtpYFJg46kescBgjdk7Gu2ZSzTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22HAZvqCfZMO8V1tbI6lZoXxN8nrqUzuG/AFZT6N4IA=;
 b=JI+w3STSDyRuP59RJqcgPTXm5+CANAVzdwT0wENwDrJttJbNzR3W7Z4qAsFvqbELmqU1Zky+xPXAFJBI3PDMfflAutTIod3oXAhBU38Aay3eU2ZryTj/kSQMlhH084+GkF4fnjvMV+JTpAv2JZLcToPtWKLLcUgRFCNejj2pRSE=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 13 Jul
 2021 15:29:24 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:29:24 +0000
From: <Conor.Dooley@microchip.com>
To: <bmeng.cn@gmail.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Fix wrong interrupt numbers of
 DMA
Thread-Topic: [PATCH 2/2] riscv: dts: microchip: Fix wrong interrupt numbers
 of DMA
Thread-Index: AQHXYnVNgNmVTr9430+f+2ci16MR+6tBMsuA
Date: Tue, 13 Jul 2021 15:29:24 +0000
Message-ID: <cf738ebe-daea-76d9-b46e-ff4e319e2946@microchip.com>
References: <20210616060251.398444-1-bmeng.cn@gmail.com>
 <20210616060251.398444-2-bmeng.cn@gmail.com>
In-Reply-To: <20210616060251.398444-2-bmeng.cn@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2904fef-67a9-4695-89d3-08d94612fea5
x-ms-traffictypediagnostic: PH0PR11MB4981:
x-microsoft-antispam-prvs: <PH0PR11MB49819F8A5C626C3DCECE792F98149@PH0PR11MB4981.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDmqRFLnytMI+gI41MV8C33hOfsDh+2+v1V8eYcEueJgiw8LNCrTKPykKhV47eJQ8d6C5yXwaq58TmK2DOpJQLd4pjiH9U6hVgMJ0mYH7c2fkBZ3kmyCOia9GlbEC4sqYBdc6/1Fo3s+ZIBGX974mEEFN/DyHzLET0pn2kSlHvowHtK1CivR9kOSKgM7B+Iw7regJFcEIAfMp2nqJ5DhY70DhvZUamI20CCoo2FYKsEHrXZAcuVSvKHJb+LBe5t7hLzeFqtaGGRfBm0xd6zJorRbnimmBKNthp7xBK0p/+APxOYbBhD6V+BZOviLlTp2HyVThcKT3YQ0t0NTQSCDs795SRTxnBqCDRdyTdzyvGLocUDI9LzvoRmx3ksIMU355Ywf2C5vNReM9Vp/HYtfhJKc+R6JbvmgakMXM2U15EnJsIovg5bJgjb2OmtTIYaHk5KhD4wniBPgW/DCwKmUmNxFdJirdecvuu9HRFQTCE7uKWIr8vMunH0J+uyydTKGCeJRpzBTfCe3HI/m8tgsejo7Ei5T14oW83rr97NX0/xdd2mR1v7krOCbYEZh7eLwr6YK9oNL7PaO/uSD4xY0bit0t9207Le9ZYm2L4q9wDKDdtyyBbKHQlqe9R6yStSuUcBImcAGSP9E5ROLAlu64htl3ydkrODJG1fRpmGsq07KTcAxxaBOWJrndqzpNRAhXPVhy6fYqu6OoifwMnnBPi2e0IPAGPy/RjFeJBrxFfX7OhkTSNwkpOcaZC+gRAgQcF00+pdYRBUUR6slXwzyVQbsOhuC9E5ZxaeEYZfX8SRAExC45wV6E1MPaZFCdHd0yK1CjWOCd6VK/PULEb4HK/Gr1LJZ63fKqzQM1MBeeAU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(136003)(346002)(376002)(71200400001)(53546011)(6506007)(31686004)(91956017)(66946007)(86362001)(66446008)(6486002)(2906002)(8676002)(478600001)(36756003)(66556008)(122000001)(316002)(26005)(8936002)(66476007)(83380400001)(4326008)(2616005)(5660300002)(38100700002)(64756008)(186003)(110136005)(76116006)(966005)(6512007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWw0L0ZtNkpqZ3dFMTJ3T24vRkZGSVhXN3JNQ1lENW9DVTB0U3VJZk9taWta?=
 =?utf-8?B?T2NhSnI2SFc2TWlKKzhxRE92ekJ1V0Z5U0h3Q01pR2pNVnU0alFESGN0MEhT?=
 =?utf-8?B?Mm5rN1RSTWZ0U3dmOEVMbzVJRjlLQjRtNkxsUU9sSW1hd0pPdmZwTWtWdFJl?=
 =?utf-8?B?MTdEZFBZdHM4OXE4K3BPWkZjMkJMNkNaejNrWUEwSGRJanVHRXN0Qzh2VS9h?=
 =?utf-8?B?aFhGcUlNVnNYWmVuYjBxVDlZWWxQTVRmcFdyeWlXeW9CWThCY1hhMnFXbmZV?=
 =?utf-8?B?U0tEQzRCb3VTR3FISFl4Zk5mK2puYjZnSU5Xc28zemx1dVdxcDBCdndFcnVX?=
 =?utf-8?B?WWZ6VE8yVVZ5Q0pwdG01M244d1kwTWpsdi9jN3RiUkN0RjNMcGpTTGhzS2Ux?=
 =?utf-8?B?Yk55LzQ2Rmw1aEdpN21EYzQ3ZXN3KzcyYTRVOFhjdXRERGZpeS9lai9ZM0JZ?=
 =?utf-8?B?Ym56MkhranA5aVBLVDg2SFRlR29NV01GeXNUaThoaVQwNmtwUXovL0xUQmR1?=
 =?utf-8?B?SytqNzFZQVlXYm40aEltQWFubElJcVVFbkp3MGtHQ2JWU0t3SVcxZG9iVGNE?=
 =?utf-8?B?NGIxRUhqVllVMW1IWjV2QVY3QTlENHd6M2dqa3dpN1RmQnppMlVKNVJEdm1q?=
 =?utf-8?B?M0xETkI5YVpXT29qUFRWWkEyczZXYWpxWHlReGtkeTNVR0tURWVhWUR6UGtl?=
 =?utf-8?B?TmV6VTdUQ1p0Ymw0Q0ZTeHYrY1RIVm0rTnJoU1JtNXV4R2NrNVpnL2lRZzdN?=
 =?utf-8?B?K2FNaGthWTVOTkdzQ1ZEQmRxWVlkaU5WbU5VQmJkditSZTBEbEd2bFFheGQw?=
 =?utf-8?B?aStuYXVzTUJsTzY1Q0hDOGhodTByWlR2WFY1cEx2QWVscy90RWFsc3YxNUN2?=
 =?utf-8?B?bWdoUi9vejRHa3RpMTJYdkRVK1Q0WjB1SlNieGQxSTArcXJHamZJVFhkczZh?=
 =?utf-8?B?VjJuQjAzWkNmZjJmU3BXaFpDWmNmY1R2ZWFnTE1wSWdTQkY1NWVSOEdSaEY3?=
 =?utf-8?B?QnFnUmZEdEdUSnZGNnY1b2JQYk1vNVBSWFhiSTUybGtocFZET1pDcmJYaEU5?=
 =?utf-8?B?WDJWd2VyQS9xVUc4OW5uVUZ2TklvTCtsT0dWWUR1R0c0NW1kY2xXZFA0TU01?=
 =?utf-8?B?RVN1UXgyeHNpM2lFb0RlNW1RaHVNVVd2VVUraWUxd3A5Qnk2WFJyK045TDF6?=
 =?utf-8?B?c25CMzFRSW5ZMnpoS2txTlZRbjhoOW94Wmwvc0JxZk1ITndpSGw1a1FSVVp3?=
 =?utf-8?B?STA5SnYyY293YnlIWjdYOENPSW8vU1JTTGwrdFg5ZXc1aVdrcXVTQ3N0TzJp?=
 =?utf-8?B?bzhMdkpzWEZyMTVXakV4aU5vT1ZES3IzRms4Y3Bwb0JzeG8wVTRDU0tnVXdr?=
 =?utf-8?B?T3ZZeVJpVEJwczNIbFQ5cVBlZS9NLzZLbTJMd24vVDIxYmNvQlA1aUxTNU9D?=
 =?utf-8?B?QTdIUEFINGRkRzFZNWpMNW92aEwrWXZIWUhaWm1OajY1QUtlY0hURnBZNnFz?=
 =?utf-8?B?NFJNOThma1gvMXpQOWZxRHZwajk3T3JZSjlrWVJGWUhwMnVpSmJoNTlwQUdp?=
 =?utf-8?B?ZmNiOWtxQmNaNnBEc0l4Y1ZtMmlOSThGUXA0aWFOUW0vZnJJTm1XdjNtUUpQ?=
 =?utf-8?B?T25zQ0xTY1dmd0U4WTk5aG9RNHRSalgxY2FvM2psYlNXRmJMUmliSi9IOXRV?=
 =?utf-8?B?TGRCTG9XanJmRFowSEJDcFVuQ2YwUkZLZ0Z3cVo0bEpVMkFmM1E5Q3BSbmxm?=
 =?utf-8?Q?xNLdI8e7qsilW5z6jgd4D2bjnzlxbLEqn47XBGf?=
x-ms-exchange-transport-forked: True
Content-ID: <5A19DF6E36DE144A808C06B0FBAC9E03@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2904fef-67a9-4695-89d3-08d94612fea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 15:29:24.4337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAJ07GuDT3jCU1nWLXcx9dZ/Oh6vATBkXnvMCMrNln7gMyNNU6XmzW0DZsqCc0FfRvuz5UR73S8c9neEwdDi3wbP6URpy6oe6akOwuD+OJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_082928_583447_1F0BD079 
X-CRM114-Status: GOOD (  15.96  )
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

On 16/06/2021 07:02, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per chapter 5.2.2, interrupt sources in the PolarFire MSS doc [1],
> the correct interrupt numbers for DMA are <5,6,...,12>.
>
> [1] https://www.microsemi.com/document-portal/doc_download/
>      1245725-polarfire-soc-fpga-mss-technical-reference-manual
>
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index ee54878b3f89..a00d9dc560d3 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -182,7 +182,7 @@ dma@3000000 {
>                          compatible = "sifive,fu540-c000-pdma";
>                          reg = <0x0 0x3000000 0x0 0x8000>;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       interrupts = <5 6 7 8 9 10 11 12>;
>                          #dma-cells = <1>;
>                  };
>
> --
> 2.25.1

Reviewed-by: conor dooley<conor.dooley@microchip.com>

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
