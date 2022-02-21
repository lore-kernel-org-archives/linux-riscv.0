Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68651C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjJQRwcl2D37DDWJFz/YGgHRchh1XMMfq46LJ2/wKuE=; b=EHD9krtPCl9Rtu
	LW2DWdbmxqgNgnhKzEk8fry1Uv+hsInROWYgvWSgy5PDRMjoJ8/RyolvrTP9zxORKOcvcueJNfjBd
	DsmwSfAqRNvTm6nUcfoyRywmRkTBcKT83DBokFHJv6zBJFGkN1x0ivMywpw8kVUoGG3txkm8+P34Y
	HrcJNurwAVLAc/XURxW64JBnqcyMcdUN/YsmiY3gH3ewDj7nyBEhzhcvmWOSkATSRlJy/xh8KGXqL
	HeeWeKGQSKZrIUf3uOXHhr4Msk6YP12lh7g68+XE9LOp1LPj1VMjM5XNBJcGs8uMuBx0BPkcWW2mR
	AKcmCIDf9JcpVD00OwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3YC-0047Ll-3V; Mon, 21 Feb 2022 07:56:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3Y8-0047KR-Tu
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 07:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645430161; x=1676966161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ayCP4nKHfqBM/8lS4w219nfPSmnApA2itUcaZKGUjJ0=;
 b=qlymYk8rYG5aF+CKuVCFobMVA3fW5FTtKSCvFgQLi3rh8CYbRPHe9oTj
 4APGvBP3cMg3pi0TwLdOOOf7QWNP+2k5xzYosmDhy+4Q9BODEhpQ7ArZ/
 /cNwQ2zj5Hz3biWDT049kB+51doLiQgw8MxfToxSvrtWwrBb56+HWA7+U
 NlEmY7RDTftA5B3Btow+9olHeTpaMNTNyjPs6qKzJnOhRRgR9D658A1Fb
 6hmlDdVB6Xfbh1stjlqCbIpwTkOsQK2TdQjgp6kXW2fhVn9H0rNGaaueK
 DR8LsLoS7P52T1LwjlbKxkUCsasnIyLLV+mbhRdiSjC9PSkv/mJJTn9kq Q==;
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="146684503"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Feb 2022 00:55:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 21 Feb 2022 00:55:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 21 Feb 2022 00:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB+livW5nQPdFHr0zVLcCicU3Rbr+fDn7egVUc5kMlNIUbzcCRGFYfh77t3nDrsiDZiKmEXaFvS7Kvcwzm0z9DIKPi/UCslZDVQpWqvxKrLipCWhfZ2OLoHyvRiGv78/IvM9ryZ+d61HzlmLzdnKkA9BCrznoOME1Pwv2VQOCp7Nonx1GbYgy8kSptfwzf2wyH4wDaZHYiToHayRiDBJkUPFCXU6SyLl7EXqy6tSriPof4WkJh5qw3+AQdshuNL2JWD6dsQeths2AWxAJYWSsa8n/+bdXYlhfGVzbHk1x4rX4/MVtNkSHddsoVI4JjGsT3LVpL48qKxV450t4N8ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayCP4nKHfqBM/8lS4w219nfPSmnApA2itUcaZKGUjJ0=;
 b=FyI3clnkRSd/ogSbsOqbxR2Bm0l2wFH2EXpGkLAn8rGCWjFF2Tgo6EryK8gRC3c3ABmHVSybyu0bt5Ro4xR6mhtaFvx2VctLUsNRjMRKjJ6Usv4yR8BW1RzSvg5m5f04jTcm19His0Z9nPKYa46JBZ4225hmb3pm8kvHO3AYrpKl9JRE+TLl80BFZolYEbXG7Ty1//PwuKFYOUQRPY00m4vh4VopxNzy47UK+dFCGG7cQcxOc3AdTwsQ5opMwPLT+ZWqzQaLTW9UBEgircMSwfFOXcRJ4d8IYcRwA6vzVGWiKMP9zDgO4PH0Hry5QqzS4YKwmL4h56FYV7REV3WZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayCP4nKHfqBM/8lS4w219nfPSmnApA2itUcaZKGUjJ0=;
 b=QVKnKSnk6GduVKqH99m1eNTRj1vOix9IYVpdbE7CM8/ZKMUPuNqoaSteBPXaMn5W1BYiwPRsnve3UQshfkfcSm/vKqAcwFyThDYZB9Q8IiCNzwuXnouGFahcovr+KYyEBYlwu6cSvBKpwB16kcPHDEhE0T5iB8SSprePuU/aoI4=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by CY4PR11MB1400.namprd11.prod.outlook.com (2603:10b6:903:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 07:55:47 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec%4]) with mapi id 15.20.4995.016; Mon, 21 Feb 2022
 07:55:47 +0000
From: <Conor.Dooley@microchip.com>
To: <u.kleine-koenig@pengutronix.de>
CC: <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
 <Ivan.Griffin@microchip.com>, <atishp@rivosinc.com>, <robh@kernel.org>,
 <palmer@rivosinc.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>, 
 <lee.jones@linaro.org>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Thread-Topic: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Thread-Index: AQHYIaqu8FMtY4E09E+qARYRW8PzIqydrn6A
Date: Mon, 21 Feb 2022 07:55:47 +0000
Message-ID: <4c470378-7aa0-deb8-e7b5-2aa4a86cac8e@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
In-Reply-To: <20220214135840.168236-6-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5af5343a-4956-416a-2074-08d9f50f923a
x-ms-traffictypediagnostic: CY4PR11MB1400:EE_
x-microsoft-antispam-prvs: <CY4PR11MB14000D59EC6DE95B60717A73983A9@CY4PR11MB1400.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cv2v2aYk+Co+OZB1LcEekUGu5uzhIkvzyWLJFNC5o3GdPWT8nh7y64P3mroa6mVuveEszKk3n+kuw9gbOJ+VE/9esrS2YzucACQhC81pmtHauBemqdfrk1Xc9iBZTv8NGknG1C8L4tJs70MUUWqtMeenHek0/MtwpL2ac6krO6Eo39NQEptd/q6zQ4SeIJZaEgV03+PXAMxVnMvatF0Cr/PrGTakTh0UjlVBhGj2vMAH6G1j6iV/fHD/i47ze7pxY0akWt817ByHhKDmvo4jRa706pKtnjIyLLWkkL0nXAkNvrHDOa53WKXZIDcOJFMXIZpCRjHW8EZ8phD7+w3afLYWPkGKlDpE4F70b9Q0ZCt/9IlkwsDywA/3ujGBG1OjhA51a/St8sPkix5BfdjYOt7qCy/dHD8nopnAiM+TuApdR5vn+GrPJnmX3uhbvS1SoGVjt2oSNo1LNJYKIbRqyIR1C+bMRKGlEQup2RQUYcwIee6LBv/1wgcgBAOdmChmooByBrItNO2P15ZOwdZFEB3A1KfxZwfd7Q2qHcxLXFl5k0H46hBJJydbwHoLRYXnXWWwE7LvzivHksv0v+bqLmwRAs6flmxy1GRUZ4UxvSUL5/24zjKW7oANiXuKTFR7ck94PhYhvPnG2/M0jYMatMYGycUh9me8HL/WIpti7tRWWuDxxwTt/4EZv4wzofnmXpz/ZEwXebuJULjz084uR0MitpSUbTq8ZXODFIfLTLFsgwH/I1SqQand7BaXSPF93ceci6JMZooNXUXzx8v3ynz/BK4mCkBsgpkn1Folv7o860qRiW1eRU7xnDR2vjvI3MgVqWn1zQPUpNRKRZmjI02CTQMl0eCxHmfjlCp6K1Qnkra4j+JQwoNZX3PsZM85y9l+ROgYjsjE9H+thkn9zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(2616005)(53546011)(6506007)(66556008)(76116006)(91956017)(66946007)(6512007)(966005)(8676002)(6916009)(54906003)(6486002)(71200400001)(66476007)(31696002)(86362001)(66446008)(316002)(508600001)(64756008)(122000001)(83380400001)(38070700005)(4326008)(38100700002)(5660300002)(8936002)(31686004)(2906002)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkthZGRqaENKa0FRbGJNcE5XVjRvOXlSS05VdFhrQVRqY29hNmk1VWNYWmlQ?=
 =?utf-8?B?UG53RHdkYlVQL1JteEZqQ1JHOHlNU0tlMWtIUXhxckJ5RVZmMGplc2RKL1NM?=
 =?utf-8?B?MjgzdzlnSzFNM09pRWxnS2x4Nmt6dWtCeGo2bUZrZXpGdEJmMTlLemJvenY4?=
 =?utf-8?B?Nk5raXRVMHh1VHdOR2NkbWUxdEM3MUJCblZWZFZuUjBlRVY3L0ZjQzc5Skcw?=
 =?utf-8?B?T2JEbjc3NnZRUms4dXRrcExheHJnR3lPRWJQaS85cThjZTFLcVFCZzI1eWIr?=
 =?utf-8?B?T3pVNFYvZWJqVHluL2hRbDFlRGRXRTd3RWpkZHJ3OVhaeVVtWTlmbkczUnZr?=
 =?utf-8?B?SVdSQ0JCMVJEek9qeHMzcTdKZmNWeE1xSXNOU3dpdEhyOTZDcHNVbGg5VVJw?=
 =?utf-8?B?OVlyOUlFeDF0aFZVMXVvcWV4QmkxckYrUWRvNnFTQUtTNnRDSGVzelFLeVpK?=
 =?utf-8?B?amIxZlRGM1hWY3dmZ01jcmNKWUlOL2tYZHY0emhrSEwwK3grdXA4V2VhZUNv?=
 =?utf-8?B?ZEU0VTArWkE1djZFQmZBOG9zZE02T09ka0pGT1JsYmh3c0FpMHNFc0NKeVBw?=
 =?utf-8?B?SmJuQnl2UGFiTzJUL0JwcnZKbm9iUzRyeG4yRHBUbW9aS3JwbVlQc2N3VTZP?=
 =?utf-8?B?TmtPTm16dDIvN04rTUNrajFKUU91SE1tOFRUTVlPQllEQURSZDVaQ2dZQmd0?=
 =?utf-8?B?azFQeGpUZG1vSWdlaDd2eWd5WnMyWXJsclhWNW5IODJTTjczTitFUlVFdGty?=
 =?utf-8?B?VzlBckxwY3V6emFWeVpSMGNKdVp0UXdUOHVKQUp6emRYMzRYbnRXZThNRnVj?=
 =?utf-8?B?bmZpaDRrUEtFZkJ4NU9vRndlM0tGcTlGRDY3cTlVRE8vdlNEaTFRcGlnVmQ2?=
 =?utf-8?B?aldkblFheGhUK2tmTVp1NEtrRCszN0hZNFhyRU1IeU5Vd1lhRHRIamVuOHBZ?=
 =?utf-8?B?Qk5KS2k1NmFTaU1vNnJyQmRNczlyOVpzOG1QdGtZMGFHekhXbnZPb0NmK29L?=
 =?utf-8?B?Y0Z2eVZRVWV4MjF3bUd3UE1ud0Y3Tno2Y3Z2VEtBWXNMNkYzUVJ1NmZOMzFu?=
 =?utf-8?B?c2V1RS9nWENMWU9IS0FFUFBkWVlHZVk3Y1B4SFdJNUpnbWMyNGdiblZodGtn?=
 =?utf-8?B?WnJBbFBLbWE3STN6MWZDWmJ1YVB6NE5OY2tmNnhtdVNZWFlCWXpsZXg0d25u?=
 =?utf-8?B?ZDA4QXFSR3Nqam5kWGpHM2ZqTWRGOXdvM0F3MTVOc2thVU01MVdpVjVoQy9C?=
 =?utf-8?B?RWJZOWRwNk1Gc1FCVFJQY2grNVRRaGJJZ1lGeDlQR3Z2N3g2ek40RXZwcGJ4?=
 =?utf-8?B?Vk50OGJOZFBPNTVOSEhCYTR0aGlHaWVRNFlieVNTWjBGdmluenFJWFA1eGtG?=
 =?utf-8?B?ZWJJTklob25xMXFQZFB4azVQOC96QzNESDNXUERiQlFSRXZZQzBRYWp1V0sx?=
 =?utf-8?B?T1k3RXVXN0JZU3JaZVZBYWRWV3VlaTVPTjN0dVVDQjdaMHVWd01ycmhDMTdk?=
 =?utf-8?B?TmVEMnlTRk8vM0YvcGtlVUZ6dkVMcVBpdXVpa1dMOXlzZm43THQ4MHplLzg4?=
 =?utf-8?B?bzZpNFR2eWZHWEJzUGVNN09xSWVySkxhdURCWGNuR3NBeDZqRmp4R2NPZk5P?=
 =?utf-8?B?U3FHQUZ4ZzNoTnRGRXpIQTB1UE5QL045UmYwQkdYR1hVeXVqTStrTzR1cDdt?=
 =?utf-8?B?M1JvTzc0Q1dHcUU1NlpOTUxRNmc5WU5rcDF4Q3JaM3R0TXJIdXMwS1VadWRu?=
 =?utf-8?B?NTkyQmhCVlZHNzIybFV3aWQ5Qzd4QTd1T0JBZ050d2hGR3JRMWw0ZnQ2Wk1Y?=
 =?utf-8?B?Uzk3ZzlNSWU5cGJvTS9qcWNXUzRYRXJSYjVsTm1CR3JUS3J4VGltWGlORE5N?=
 =?utf-8?B?ZmdOaVR1SllyaHJmdm1wRHdxbG5EbHRPdld4YkJXYlhhRGpRWkhzZ1l3MXln?=
 =?utf-8?B?Njl3YjM3SEkxcWNqMnhyTUVBZU5CWG1sRHlJa2RDN3JRU2hnTUxueWR3K0tF?=
 =?utf-8?B?dDNubkxZaElRVmZLRkU0Y1MrUEtRRmQyU3BGZmRqVDJ0TC9sZ1lPN28rd3B0?=
 =?utf-8?B?anN6WkFFUnBKVEpoMUZlNzVsaFV4TjJuTllJTUVlVHNQYk5kUXJtNVFNR2Ja?=
 =?utf-8?B?K2xiekJlZ1pIRDUxUFVySndNYXJUWnhTODFmVVU1a29aSFNhYjVUaEFOUmI4?=
 =?utf-8?B?QmRyYWZoanZpUHQyMDZ5R3crbnROeUZZVEY2cmFjazhnOVc3V0RUMUt4bkVa?=
 =?utf-8?B?Z0tIdGJncEgwUTltbytwOHdWc25BPT0=?=
Content-ID: <5CA17A23C2508749A2921731274932DC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af5343a-4956-416a-2074-08d9f50f923a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 07:55:47.4514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcgGhIP1utv8VCqDgmilU4VPic9jevdu3pQGqwjeA4zdgVE0TqB2eXMy4W1F6ofCDHTyKrNDu4tRoDikXnXTL3GqTEda1UHc7BbJvSJ7t/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_235601_091919_914EE986 
X-CRM114-Status: GOOD (  26.02  )
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

Hey Uwe,
Could you take a look at this version & see if the descriptions are 
easier to understand?
Thanks,
Conor

On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   .../bindings/pwm/microchip,corepwm.yaml       | 81 +++++++++++++++++++
>   1 file changed, 81 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> new file mode 100644
> index 000000000000..a7fae1772a81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip IP corePWM controller bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  corePWM is an 16 channel pulse width modulator FPGA IP
> +
> +  https://www.microsemi.com/existing-parts/parts/152118
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,corepwm-rtl-v4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +  microchip,sync-update-mask:
> +    description: |
> +      Depending on how the IP is instantiated, there are two modes of operation.
> +      In synchronous mode, all channels are updated at the beginning of the PWM period,
> +      and in asynchronous mode updates happen as the control registers are written.
> +      A 16 bit wide "SHADOW_REG_EN" parameter of the IP core controls whether synchronous
> +      mode is possible for each channel, and is set by the bitstream programmed to the
> +      FPGA. If the IP core is instantiated with SHADOW_REG_ENx=1, both registers that
> +      control the duty cycle for channel x have a second "shadow"/buffer reg synthesised.
> +      At runtime a bit wide register exposed to APB can be used to toggle on/off
> +      synchronised mode for all channels it has been synthesised for.
> +      Each bit of "microchip,sync-update-mask" corresponds to a PWM channel & represents
> +      whether synchronous mode is possible for the PWM channel.
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +  microchip,dac-mode-mask:
> +    description: |
> +      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
> +      a minimum period pulse train whose High/Low average is that of the chosen duty
> +      cycle. This "DAC" will have far better bandwidth and ripple performance than the
> +      standard PWM algorithm can achieve. A 16 bit DAC_MODE module parameter of the IP
> +      core, set at instantiation and by the bitstream programmed to the FPGA, determines
> +      whether a given channel operates in regular PWM or DAC mode.
> +      Each bit corresponds to a PWM channel & represents whether DAC mode is enabled
> +      for that channel.
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm@41000000 {
> +      compatible = "microchip,corepwm-rtl-v4";
> +      microchip,sync-update-mask = /bits/ 32 <0>;
> +      clocks = <&clkcfg 30>;
> +      reg = <0x41000000 0xF0>;
> +      #pwm-cells = <2>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
