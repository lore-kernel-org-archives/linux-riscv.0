Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCED4C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFhrORSw4kRlUgRKcP4yy4AIV978tajA+8x8d2pKlZg=; b=ITh38302pv6gd7
	B9Hjv17dXFGRd57mfFDeraSijBmWrVYJXioVFX0ZWvZ9t8FyF185AT1gBW2ZLkxyYwdKZdCo9eM30
	GFoxv/kUrbKDVq3n+zm3HmAieMU7N4QA+LNMRlOSV1kTXOo/zeCUBS5Lg37WEaG5fsDqghFfJDM0q
	ggCKUItoF/4RKTkX0EsdNXsf21gpDRbnZvSylMadryO5OUI1WrSIKqwLkIIfbCW67bmCWF5pVVs8C
	wwIyNoaJmxbQhxmyZV6yEMUjjy5Wrcu93ipABQT0UI+chYbvVrETqOQF7dM42DYdAkKkktgwp1DcR
	GamGFD1GAAFhs3hiLvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yvj-0013RH-Vz; Thu, 30 Jun 2022 18:30:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yvg-0013QN-SX
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 18:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656613816; x=1688149816;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
  b=NTU726DfutExnfPNQbQ6JqCesx7vyWWL0dDTW87AwIqP1j5/cS+0eTxh
   613pFmEERLoQNzG3lslVekGK6lD027dvPaB2O3Yb65gLcAvxbkVCyZfJb
   HVJKdyabLDjwCcXBUwQU49ajBBBvCyxW4VWpCUdaCpV9SHOmcyDE2MmEz
   bvLM6/IIRoZ8Irqwte5PE8ltbYq6P7gAfLPsjDD2IxlXc6TxJagDnd94k
   y36FaZqfDjFKVKpJ9CgsdTeKmEqj87kJXItRBcl5w+RsxsxxzZJqVz7/6
   0USSNkCqjrxl6iUUvjGbP/N+xKG6P6JAPChWja4iD6dtYgQmUwL+ceK4C
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="165884828"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 11:30:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 11:30:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 11:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7L1l5lRh/vDfEKIBLs7oouLfghKC1Zzl0fCIIKs2vSVlhNEcEhNtIw8DPoQKzgHGHY/aFz/FGrZIonIhAtSY67MiBvtb1B3sSyy6uZhkwp2uClM+lOkq7PP0ocl7WPpZbL8GxzL216w6ArjUMmE7AKczs0wEJA2QUsyPsYGgCNeMnef5xzcjGDNoU9gDTjUBqOoRtZaBA523JQXUQdb3YGcEqKVB5fRgemq2i0UsHI+Fefhhd3wfRmgNWGh2MwP8Yc0JckLjgZkunYrvYavzi3Ksnw0nXsoHJ/WAeSYLwTjTvzZxTQGWTwA/6t2PwS0O85s/1Xli5DwKsDx72fMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
 b=ZotRLJYe5WLTnNux2QMFHXNUo90l00qP3MSNBzPO2QTHW/odTkrcBdVQzdNbTfD8+41yqAv/QGCwqn+yYQtWsGwsnEgRYQZuauYcZjp2Rw289GX8Y9iWhzrHfSfKRII8ItVVsby4HKK3sBJaRjJ5FvtmCOX4yKycwUAcJEsSLWVLNmoAjrEqAR8csP3OjkHPJw3aRUnKIjx6gJeYuux69zmLgasnmu6nemJNwa/SJIGED1YeYSRsNuerJ/ux/K+EORTQvINmcT5iUZrKNmh4N+ByzLZeUJGu6TmBh3yGscBtoZnxYmAB/Ry1oO2qQZQI3xgOt047X0Mq9R2c1wCzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
 b=HU1GEVjbyqWr8SBixJz6clOUxFjLJufU2kUOXqw8OK0ZSAhYLL5mNyxpN2Kj14/KUlRYUJIT88fniAT9EluO/RKVm0WtZqH0vz0/Hx2wnEYYUUqJH++oathGGlYPjrkAhf/fnZjKKMppKhBr3V166opqbxSvxWFVned6foNAZnk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 18:30:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 18:30:07 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <Niklas.Cassel@wdc.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAAXtgCAAAIwAIAABacAgAACcQA=
Date: Thu, 30 Jun 2022 18:30:07 +0000
Message-ID: <99425a7b-ba31-c03f-e819-35860a1f0f9e@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
 <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
 <20220630182122.j7m32mh3xmxwatga@bogus>
In-Reply-To: <20220630182122.j7m32mh3xmxwatga@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 833e5b89-bef8-4b8d-7fcb-08da5ac68ee4
x-ms-traffictypediagnostic: BN0PR11MB5712:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4qseTUh/AYy82twPQYIC8bRK562Yt04Zr1q17oorNU8ZqAcW9yjVj0oIcBjLOHpjnivKoO+tsGMPi6HfGUjtbWhqtJxXB8rP2NmP4EqlFJ86yeqvxHQJpIlhjhQ39ryR9raIVXCLmyZXJbXmvCk3KXQ+VhMIOl2n+0lAB2UtJBv60NcZVP7BKfbV8D6SB58PZo3zjmZKeS1tBFxwtZ15p/4UhmLAErOOcfifDlwCZJoaxMSj5VbVNxdQ9PW1vl9jOzgMv/aPDo0yDCKn702KaTnjdsHExvQx594fmv4EmU983oi+jjOfl2rRyDx1ZMC2Yhp3f/fWaZkP8MVzMKwq7T8hboN2K9moArIh9r+Fv2pLRqS1T0+yLvzD5JYVe9tQbNpEFTh2vOAOvBFf5HSfbURNMLd3dqFP/uQ36PjcH7bjFczIbxY4X8jrNAnXr8+GkaOPns3tqSG2yAKzVpcljkVBtUGHAh+eJ6He2BuCeD97DsCvzOuzuw/n7YsMLHlyeBtCyw9Z8vo6JvsAEyqjJrFvQmab5GiI7psPZLCrHeXM0IAMEhla59+OIs+s0k8IO5yZtRETBbehL/QuXLWrcTrharCIZ4ZWMWZsCvNEMQmFdarieRWHmx9CuFYS/iBBJ1Rq0lWhviFONReGN8DFwOuvoL65ZTburpx4RI19uE03p1BqBRp7bZWr1hC85qpJTbJBLE+1Sj5oFe9ubUoEHEONbaZ8h9opXztSn7vmy1Nrj9Jy75tA491Lu3Bh4qt974pSUh345pyB1HPtwP4wFo9T5aZbELPIfxtIJ5iO8PIOhzzvlfYpwxZCXL8y4nWLKG9dxYN7csGCTAxYwqMMumjJV+EDhy7HhvVSPRRET65qVIWf8kvyLZ6XDN0cPTE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(396003)(366004)(346002)(66446008)(66946007)(7416002)(7406005)(4326008)(5660300002)(66476007)(66556008)(8936002)(64756008)(8676002)(26005)(2906002)(76116006)(31696002)(86362001)(38070700005)(38100700002)(83380400001)(6486002)(71200400001)(478600001)(186003)(54906003)(110136005)(41300700001)(316002)(6512007)(122000001)(91956017)(53546011)(2616005)(6506007)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnhkcDNCSVNnUkhYYlRjR29GVjI2ZGVlbTRrajlSSG1zOHhPT1RaWTNicktN?=
 =?utf-8?B?L1orQk4xOEZzQUVxZXB3VFl0WUtlZmtJUHJ3NGJ3cXNRekgxcllvQkkyb0hF?=
 =?utf-8?B?WFFVcHdJallGb2hZN0xrYWpjTnVCKzlqcFRlVFNRaHlkT1Q1VVRENDJ5Ymc3?=
 =?utf-8?B?MktWMVlkbmhPR2l0eGo4QlFKUkIyWE8rYXVSb0FSOE9xMTEwR1VDbXQ1OWJo?=
 =?utf-8?B?Z1psY2wvMGpyOFhqZkVYVzZyWWVRclF6eUFDaFdkdkdaYkE1MTJ3c2dVVTRo?=
 =?utf-8?B?QW9jcVorZWNCZTU0cWNQZTMxaDQrN0M3WlBzdFNRemg5OHp1ZWhWdW9ncklP?=
 =?utf-8?B?bWpMZ25YNnpmbDJrWDA2M2RmdSs4UHM0bFQ0eTFadmhvNnJNcnEvUHl0WEtD?=
 =?utf-8?B?b2syblF3TkFIa3ovWTVaeGRRUlovOGpJTmFwYllhSjF5Q3pHblBKSjdlWFZ2?=
 =?utf-8?B?VktFbmMyZDlDQmQ3eXV4b24wL2hzUTUzYkdLTGxlZ2hwSlF5eE9naGJOSE1V?=
 =?utf-8?B?S2JPRDNWSEpvU1ZRMU81UUwrOENaRGtXV0pTeEFpKzR6R1gvTzQ5SUU0c29M?=
 =?utf-8?B?ejhLa25BalB2T1kzcU41eEZFck91amp2Q3VzbnRuZkltdjRoQmdNVUFLUnpC?=
 =?utf-8?B?OWF1Ykp6T2ltRU5CNkJwaXI1WkhQeTlIMytheURYeUxtZ0NGc0x0d3BYbTAv?=
 =?utf-8?B?NUVlVURQZk1zQ3U1RnhZL0pDbTVZSXRQN0kzS0cxc2hWWCtEcUVZN3pyL3dH?=
 =?utf-8?B?dmh1K1c5WFZrK1JQQTZlQWlnSkZsdmVJWUNST1drVk9xN2JIcVplSHZ3RWRB?=
 =?utf-8?B?b1VJOWZ1WVpOdGVldkVQemszZi9JRE5tZFBKOU5VZkk0dzJablZ6RVBScyto?=
 =?utf-8?B?dHFVNFpCOFZVQldhNVlXZlRmeE1VMEk2S3I3azllYXBJMnRKQmpVME55K0Fw?=
 =?utf-8?B?R296Z3NkdUprcUxGaVhJS1BkaG90ellkYjVzdE1Jb2VCMWo2UjA1VUZpZkQ4?=
 =?utf-8?B?OTJmVXNrYVpUaFR2TGoySTl1MTU0ang1NitqWU9vbnMzZ3hlM0ozTjJOWloz?=
 =?utf-8?B?dTZNVlp0TWxmSEtTOVo5c3ZlekN1cG1HTkx4LzNjeTNIb2YvdEE5aEk0b3hD?=
 =?utf-8?B?YWRIamM5aFRDQWFuMDFkMWdZSTRxeU1MS2NHOTZVUVl4WTFhN041cWQzZ1Y2?=
 =?utf-8?B?VlZWbnc5QVZYeWdKOEo5ZmVvYm5USEZaT1JKZXZmQzMzc3IrVm5YWG82UXNz?=
 =?utf-8?B?dVhja01XZWVQeGNQeWdZOW9wOFo1Y1lNTFF3a0JtbjNTRWxDbDROZUt5SmY5?=
 =?utf-8?B?QlQyM3UxWkFnYzFHUUZxZVJ4YzFpeThNZ2xBNDRDMXU1TkM1aVdSRnUxVWYz?=
 =?utf-8?B?RFpLajdJclVyUmJRNG9WUzBpYmpaWlB4SS9nUkpqMHF2c3J0SXZtdWpmbVZS?=
 =?utf-8?B?V1E3cUY4aHZUU2xwR3R3RUZRalVIVlU5MENYb0l5MnRxaDZETWhHUlFRdUhT?=
 =?utf-8?B?S3VUZktqdlo3dC9XenlNdzNrRWVaZjBKMFJWdWV5cSs3THZaR3RTdEZvcXpM?=
 =?utf-8?B?OU5GU3lRYzZOT2x0ZnpZS0h2dTAva1pyYkVYck1aS1BoSVFGVFZjeTVLOHEr?=
 =?utf-8?B?SWJ1TkpxY2tSUWZoeXo4Vmxhc2dxdm9qb3k2eHBGa0VmaDBJdXduU0lLblR2?=
 =?utf-8?B?TWcvS0wzNVJybmc4TlBzaytpb3hIL0g1Q1MybFYvSTZ0OGdaTlV2MC8zSk16?=
 =?utf-8?B?bDZWM2ZtZUNEMmtvbnh2N1ZlUk56ZmZoL3BENy9xZW1rUmpDWDhHbWwrYzhG?=
 =?utf-8?B?MzRkZ2l4NElxc2QreEd6L3BKNEtNcmhTeWYrWk1nSW1QdXNPUFZuOFQzYjFG?=
 =?utf-8?B?UEpCVEhIcjJ0NU93RmxWSGRWUjdLZHY2N1pPWjlDQ0RnMnlZZGgwcEIza1E3?=
 =?utf-8?B?WUlwVkNYb2ZxcUNja2d2MXh5Q0xJY0x0bEJRMWV0ZlZpNCtwOFR5M2RYS2lx?=
 =?utf-8?B?Nm1QVGJCL3ZtVDVaaHA5OGF2cFlFaU9EcFptZ0VxZjdiQXA3M0RndzJaQkVD?=
 =?utf-8?B?bkh4Nkh2Vy9ZbXd0VWxBYmt0b2krMlMrSUFUTllIVFZIdHYwT0NxNWNkRlJ5?=
 =?utf-8?B?RFVaaTk1WE8zZi9vQVJISm1jNjNEakg2RWljd20xR1ZWZEZ5YjdZWWV0MGJH?=
 =?utf-8?B?VVE9PQ==?=
Content-ID: <381021914F19C343AB300E3326982C66@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833e5b89-bef8-4b8d-7fcb-08da5ac68ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 18:30:07.3085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt4/XtKDFsBdc1in/eBiMe+FkwV7kEiP/M+P0vPqiaZrppZwsZisFel7HfTF5nn/+Arow3paVoIHSEMZ11PnCHRxnUwhP28HuiJJny0Wcuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_113017_063323_2779E549 
X-CRM114-Status: GOOD (  17.62  )
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



On 30/06/2022 19:21, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 06:01:09PM +0000, Conor.Dooley@microchip.com wrote:
>> On 30/06/2022 18:53, Sudeep Holla wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
>>>> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Hey all,
>>>>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
>>>>> based boards. To make keeping it that way a little easier, I changed the
>>>>> Canaan devicetree Makefile so that it would build all of the devicetrees
>>>>> in the directory if SOC_CANAAN.
>>>>>
>>>>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>>>>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>>>>> out of the limited stockists none seemed to want to deliver to Ireland :(
>>>>> I based the series on next-20220617.
>>>>>
>>>>
>>>> I first tried to apply your series on top of next-20220630,
>>>> but was greeted by a bunch of different warnings on boot,
>>>> including endless RCU stall warnings.
>>>> However, even when booting next-20220630 without your patches,
>>>> I got the same warnings and RCU stall.
>>>>
>>>
>>> Is it possible to share the boot logs please ?
>>> Conor is having issues with my arch_topology/cacheinfo updates in -next.
>>> I would like to know if your issue is related to that or not ?
>>>
>>>> So I tested your series on top of v5.19-rc4 +
>>>> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
>>>> spi-peripheral-props.yaml") cherry-picked,
>>>> (in order to avoid conflicts when applying your series,)
>>>> and the board was working as intended, no warnings or RCU stalls.
>>>>
>>>
>>> If possible can you give this branch[1] a try where my changes are and doesn't
>>> have any other changes from -next. Sorry to bother you.
>>>
>>> Conor seem to have issue with this commit[2], so if you get issues try to
>>> check if [3] works.
>>
>> FWIW, my problems with that are not on canaan hw.
> 
> I understand that, just helps to eliminate and see what are the possible
> issues.

No no, I meant that for Niklas' benefit not yours.
I get why you wanna know :)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
