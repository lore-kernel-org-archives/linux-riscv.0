Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF3FC25B0E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 06:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keKx/3PrI4DhQ6tUN4MgQE5tXBUVyWFdnXjZNKVaJS8=; b=q4h95KhMVPdbKO
	uG8K/6A2JCsSFZ0n6qpVE1BFWfkvo6sOrxtBfhItOUikaCFaFcgPGN0DQyAooKSk9bvAGRQmYiur0
	d9mvvyPgiHw0PqSZyrd2SNXNQfjWVaDkL5OJUYl6rNqI7HY9LRkkIKJRt6B6VRKsQeEpP42m5hnjT
	Bd8BlO0ozyyHfARs/TjNGjY/PAXL9iPIZfNCC3M383+R9taZu+JwTmfrmR3vr+huAJT/7iKSltiXw
	jd9GZWlM6F9oAPxoLLT0Tk49GX8+DZAysVnetVojYuY7Cd/376a94AYMrbODIw+1w7boDSKKtgUWX
	DY/Y910TQLOK1mj1uwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYxG-00H1Fs-GT; Thu, 18 Aug 2022 06:24:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYxB-00H187-Km
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 06:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660803869; x=1692339869;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nJAEEZsSElK15N2slgWUJ6QqtwL65kB1RA07yR2WQ1g=;
  b=n/ttmqAerl0TRdRsP39v9XvvyO48gecZguLs3blrI80a0+DtArlLj21y
   +Acb+/YQyg4zg09oaqg/cyIqWWhhrAQSHFYC5qX68vyuW1W+5IK35FyX5
   YhtMytNIWkwgooDD9dNb8JflFYgbrvsRk44voCfmgmgxQmuIFrqhNg/Mx
   hsxLIhqSbSGnhxZClQWs75kKhG93v2DVuFrFIsNWR+T2Xn9j7b+5GYg2M
   Q3J81Zuf3qWwqIF55gCAahUz4WtBy9UPzZ6VwD2SepJJWYFM/cyK1JPRN
   +6p4Kf2nNB9zG3262yaGnsuOksERKJvqFR6WR4u28bCDqOR9We0wQ0Rg6
   w==;
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="172975790"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Aug 2022 23:24:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 17 Aug 2022 23:24:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 17 Aug 2022 23:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQoFSaUO6/s5JC/yW+5zM0I3qS44Ek1IC5Jf5fRfrylxksoI/8GGKqccgWM10AKjklNJYeTC4UY6md/OvVUAb7y9MiUmBIEAvp2ekabtHtpAzR2wKznXPOqqWGsDwLbmTYvm81gzs69/NZ+Uh5qk42BbFaEfZxLTHhFNBRcGduGjpYdORcBIRpTgNwdUO60agOu/n3wdHcaEQijgdwxS6qXqvfletZO6aRjiRAn2mDevHQYtd3XEPmqOKKyVFCym1d2GmTl8MS/EO6/XL5a3aFvDoMkn5hNB9r82oBhzUfedFU4/15FHZbaTUCjWFCR2C1gSmQoDj6uN/9xop+Bmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJAEEZsSElK15N2slgWUJ6QqtwL65kB1RA07yR2WQ1g=;
 b=oSMtVUdnOfZocZxuvccLxlKuOSRUTT1/+d1xDBw+ZoAbLt6g6YvsgazkeXkcfYNFqAVEoVqkaBEEjmCpFvuKC3LsWJn88/nHSYFdJO5UWZMNBs3ohJL5KoahEXX8O5ARwBs5Pqpv4iEJlGuaQp6IDdr38mQ38blgWpGKaOF+Km8cgSCYPpUczauDvvIuc11Fj2cj8r/ybNuguAS9wlDohDcUusA76uhEDfhKhmouNRn0XtO+bG9IrEbVBhEhTS2mYqhCON7ppdlLld17AvZRF7cz9pUurQpKrma0Zz1EAf39M6F0e6pS46wrYE7tnKckL1u9mkYn5P6tEC/nPsi9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJAEEZsSElK15N2slgWUJ6QqtwL65kB1RA07yR2WQ1g=;
 b=IKReGLWaGJ51kL1Y4vWx4pO8BSGGoQQqVtajn2lcz7LHgw2YI+6x+jTeS559YoG8VRbRAaSm8A8+YmeJynkI16CE22l1S7St6tSAVILdxkOK4y1chSFqFcpc2o6yXNSOkdZfYIjCq2XH9q9EKO2K/5joKmqiuA03uf8kVj1jq0I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2354.namprd11.prod.outlook.com (2603:10b6:404:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 06:24:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 06:24:17 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <mail@conchuod.ie>
CC: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<daniel.lezcano@linaro.org>, <anup@brainfault.org>, <guoren@kernel.org>,
	<sagar.kadam@sifive.com>, <jrtc27@jrtc27.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>, <robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: riscv: add new riscv,isa strings for
 emulators
Thread-Topic: [PATCH v3 3/4] dt-bindings: riscv: add new riscv,isa strings for
 emulators
Thread-Index: AQHYsnXJCuqPnPdbO0SYHDj1BIYcZa20JQ4AgAACa4CAAAnQAA==
Date: Thu, 18 Aug 2022 06:24:17 +0000
Message-ID: <f88d52d6-9cc3-951f-cdd7-c50c405540d0@microchip.com>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-4-mail@conchuod.ie>
 <20220818054014.wad7uqqnmoc2wrbp@kamzik>
 <20220818054853.7rivuc4qyojzeu3s@kamzik>
In-Reply-To: <20220818054853.7rivuc4qyojzeu3s@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c6a0e7e-64ce-472f-f352-08da80e2472c
x-ms-traffictypediagnostic: BN6PR1101MB2354:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3dNwmYCNlgqT8RmtFRHXx1pFfkSywTMhQce4ORBhsZP+CHPPHz3IWvf2HKwgK8R+JJajrBxclk/rJP5S9C5Ph1RimyzML0GWwyy776D+vQhhENhNBoWVYEP6wcVLZLFCS89Ctf+8hH580S68QJaKF5Kxk/zdvlZxEWeaC27b/zR0Td/s2z/1i0N2rninq3j+6ZBEjM5QNf20wJGA7B5xutqeiOpJrFIq4WPvOs7ogUMcMPQbkJ8xf4AuCyi/fnBwBe3e9VD2i0tPcMWNERebmO3l/bPafefVIgzsj+JJkILvJzI2q79sqUoSfptf2+Ep65z57ZqV/gdWx8ZIEFm1pWCCnV8pvMPaGJzPBqzDKk9Sat+JBr0RcJyQMnFxKPm+0P2H6t3lbAp4piKrSJEnH7qcb2fvi5kJ2Rq/8WTx8fcrLCcpmU0EbFRKHLZuzcffOSoKSVmjhXhlcasXtzTeURQaHb3cj7LPKAzjCOoalEh5QC92DUodWSQyGEb0A2a4Gvi4jnn9omW5xLqlDB3Sw1EXUxWeIR2xXgqPpvJpjUC83AqqaT9HjCD1XJa4f248IJEo2FxdTe7Z9SYaq2rIs0dXH9xlAupvbhTFkgG360d7ADGQzNiZaon6pUBAIaGa/B4pN0n2I2xVi8aPopkej3Yy+wbz4/n6DpljLUOm3kjXy7+sFk3GhkA6L0mVrU4cJ46WlPtQNC9AhHwcoy3pPkr2rzs09eQpuyDDludHUZiL+5CPVONKuIeT3suiQ22nUblqBe9y/sS1ntu9hOSUt9LHEZ/huAUzh4O3dLNKVCJnrUj/urT3t8y3xVQ+aD7YzftITVn4OclG8FHjNL/9m8PRfC5T3XTvfELAwHSPsCO+Ey7OZYzeJUxWk4IksdWUMOY+pVI7iJ4FgJrcW5EwLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(39860400002)(376002)(186003)(966005)(31696002)(2616005)(2906002)(6506007)(86362001)(5660300002)(41300700001)(7416002)(122000001)(478600001)(6512007)(26005)(38070700005)(53546011)(38100700002)(110136005)(83380400001)(66446008)(8676002)(8936002)(6486002)(54906003)(36756003)(66556008)(91956017)(66476007)(316002)(71200400001)(4326008)(66946007)(64756008)(31686004)(76116006)(45980500001)(43740500002)(569394003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3dyOUZnWU5jWmM5OHVERS9RU21yL1VsWSs2Z0wvNnVrUDJhVmNPcTgzU0oz?=
 =?utf-8?B?cEVBYjR4Uk83cmcxN3U1R2dDUlJqaDVidWpmcGYxdC9vR2x3MmJ5cUQvL2xt?=
 =?utf-8?B?NHE4eG9HODVUQVByWW1Ya2tpWkkvdUZNcHdmUDNvdnF3YnduMituWWJxdkZy?=
 =?utf-8?B?cDFWLzFTNERCNWhGamVuRkdDK0NPUE1VL2JHaHZuKzVQZVhWc1Z1ZVdrNDZS?=
 =?utf-8?B?aDJiWnk0dmxsYkQ4dmZsRll1RFVBRG1oMk0wWVpaT1pMR09ldUprRWhqNEh5?=
 =?utf-8?B?NnJ0U0hQeXVIUVBRajNQRU8wbXc2UCtMNHZ4TjFSU1N0NnNzNE90dGoyRXV3?=
 =?utf-8?B?Sk1FcGQ5UWNtbU9DRDd1cC9KMWs5OUNPZ3RUUEVLNWExdzIvblRJQXd0d3c1?=
 =?utf-8?B?OW1OUzhoZUNUZHVrdENkTEVibVRVbk50NVpuQnZYMkVHaG9ob3czT20yM1Q0?=
 =?utf-8?B?SFByR29jMVAvWncxVWpGWnJrV0U3TVJXc0E3ZStvWWNwMlV6L0xWNDNmdG5i?=
 =?utf-8?B?UlBFS0Jxa2U3ODNLT3Vuckxud3VTa1ZibVB1Nk4xRmhxWWJCZU1kdVVXT2dp?=
 =?utf-8?B?aTZnMlBmcjhoeG1KK1hZRWovTWdKV2dKVmdXTk9mVGQyTFYwQ0ZZQmg1cGVS?=
 =?utf-8?B?WlcrSFB2TmJPa05QY29tbHk2WlNHVFhhTEZ0S0NvMHpVUEdoeFFHdmVPaCtU?=
 =?utf-8?B?ei8rVWI3ZFZiZmNzT1ZSZVpITTd1S1V0NW9PQUtvUEhsS1FxRERtS2tPRVh0?=
 =?utf-8?B?dk1WaC9Fa285ZVJOZEJ0THhuNFlxSzhQMU5WUkJXYUJBMGZqYm12bEVMZVBF?=
 =?utf-8?B?MzVmY0wvQnpJN1U0WWtzMnJPL2xRSWRoR2NlWit1ZDQ4d1gwQXMySUcrZ3Fs?=
 =?utf-8?B?RTdMUFJZdTEwVkcvMUdkWEpIQTJydDN4SlhSSDJKamxTNG5KaUNlQVd6eFBx?=
 =?utf-8?B?VVdxcUVHRXFvRUJrNytiK1JrNFQwUndoUVMzZFQ0L3AwNUh6b3lwakdQWElp?=
 =?utf-8?B?OHU1NnBBTmNMdHRLS2RqYkRZZlYva1R5Ui9IQklzVkYydmRPMnNyeHU1c3Rz?=
 =?utf-8?B?dVZWeGR0VlhBbXR6SlVRWjFmVE43S0ZlcEpMSEhYRm1oemNPajI1a29mMFNC?=
 =?utf-8?B?Nm11YjhEZ3BGekljUnp0MVlRbDJTZGtTeHc3K2RqM3M1VVRuSTMwcng3dUNZ?=
 =?utf-8?B?QVNFZVhTWGxwcW03SVhUZ29yNW50VkRTZTliNWNVUEJhWHIyQUk5eTFONmVZ?=
 =?utf-8?B?dGR3cnEweExPOXRPMVZmY2Yxc0xISXN1cnQrWkRLWVV5dm1tbGlOUEloYStq?=
 =?utf-8?B?YVg4SjdteFpqcmV2Zzd1NlFtUVZFRi9Kb1hxbmtwTFVhU0hldlIwSE9hdEp4?=
 =?utf-8?B?UUt2OFRYK2x0Q3lFM0syT0ZIZ3F3dTdVTHBzY3B4a2lJUjFkSFhVaEVIZXZx?=
 =?utf-8?B?Y0prODhzUkRUYng1M2pkNHRTcm5ZY2I4U1h3QWFBMHh6U0d3Zkx6MmpiTTln?=
 =?utf-8?B?ODluZnFSSTNJY1o4Vlg5Q1R2eTc2bjJDMHBiSG9Ga1BaTzZWVmQ2bWpnaWEy?=
 =?utf-8?B?QSs5SldKTDloVmhjMEd1VVAweUFpNnpvUU1GL2dTcDdjS0VLT3IvbjJmYk1q?=
 =?utf-8?B?SWxlMXVGSndqMnVJV24xS3VsS203cGtGYjJPWGx5bkhGS29zY0ZPeGtEL25j?=
 =?utf-8?B?amZwQnRYakZ6QkUxNUZEb28vTWdvZW4zSUU2STlaYmFUS2tDZnphRXdhWk8z?=
 =?utf-8?B?ZE5Ec3lCeWFLZEtZdllYRkMrWlRIMGhZdEVlanhVa2c0UEJFMXdYQ3hSdzM3?=
 =?utf-8?B?eEdFR24rSXRpVzdIZWxXL2hOcGFHYlNabGx6Y1RxS1REWkkxaVQvVXRkVGpO?=
 =?utf-8?B?TFBGclEwTmtKYTJtbFk1cUl1TStQdTljeHk2ZEdxQWdNdENlNVhROGJrUlk1?=
 =?utf-8?B?WHlBQm5LdFNWREVtZ1d6VktrSzVsTzhrWFlEcWkxRHNrdUJPNzk4UnVUNHJs?=
 =?utf-8?B?RWxXaHJUMXo1aWNUL3dFRm40T2lLTUlORnpEWFJya0dqSlNZdmlLcnpVNk5s?=
 =?utf-8?B?cE5PRXVnVW1YVHhYRHlrWVc1ZDRYNmNNdmNhMXV6OXJuNEhHM0RqUmJsUWRt?=
 =?utf-8?Q?+NBfQwd8JoOHRhIc4F8cEhhba?=
Content-ID: <CA7A6259C025A34CA14B6130FD573797@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6a0e7e-64ce-472f-f352-08da80e2472c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 06:24:17.0814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pr5MdIUrmHIJcBAj2csczwZA6xkJojRznE/E+heboRK8jNKL+4Uz5CzWQk9xGANxWpqYMgjLs9VQnVgMcSQbFJwPgTwvzFD6vhsY+/mAD2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_232429_800836_03F775AD 
X-CRM114-Status: GOOD (  19.92  )
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

On 18/08/2022 06:48, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Aug 18, 2022 at 07:40:14AM +0200, Andrew Jones wrote:
>> On Wed, Aug 17, 2022 at 09:12:12PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The QEMU virt and spike machines currently export a riscv,isa string of
>>> "rv64imafdcsuh",
>>>
>>> While the RISC-V foundation has been ratifying a bunch of extenstions
>>> etc, the kernel has remained relatively static with what hardware is
>>> supported - but the same is not true of QEMU. Using the virt machine
>>> and running dt-validate on the dumped dtb fails, partly due to the
>>> unexpected isa string.
>>>
>>> Rather than enumerate the many many possbilities, change the pattern
>>> to a regex, with the following assumptions:
>>> - the single letter order is fixed & we don't care about things that
>>>    can't even do "ima"
>>> - the standard multi letter extensions are all in a "_z<foo>" format
>>>    where the first letter of <foo> is a valid single letter extension
>>> - _s & _h are used for supervisor and hyper visor extensions.
>>> - after the first two chars, a standard multi letter extension name
>>>    could be an english   word (ifencei anyone?) so it's not worth
>>>    restricting the charset
>>> - vendor ISA extensions begind with _x and have no charset restrictions
>>> - we don't care about an e extension from an OS pov
>>> - that attempting to validate the contents of the multiletter extensions
>>>    with dt-validate beyond the formatting is a futile, massively verbose
>>>    or unwieldy exercise at best.
>>> - ima are required
>>>
>>> The following limitations also apply:
>>> - multi letter extension ordering is not enforced. dt-schema does not
>>>    appear to allow for named match groups, so the resulting regex would
>>>    be even more of a headache.
>>> - ditto for the numbered extensions.
>>>
>>> Finally, add me as a maintainer of the binding so that when it breaks
>>> in the future, I can be held responsible!
>>>
>>> Reported-by: Rob Herring <robh@kernel.org>
>>> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> Palmer, feel free to drop the maintainer addition. I just mostly want
>>> to clean up my own mess on this when they decide to ratify more
>>> extensions & this comes back up again.
>>> ---
>>>   Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> index 873dd12f6e89..c0e0bc5dce04 100644
>>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> @@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
>>>   maintainers:
>>>     - Paul Walmsley <paul.walmsley@sifive.com>
>>>     - Palmer Dabbelt <palmer@sifive.com>
>>> +  - Conor Dooley <conor@kernel.org>
>>>
>>>   description: |
>>>     This document uses some terminology common to the RISC-V community
>>> @@ -79,9 +80,7 @@ properties:
>>>         insensitive, letters in the riscv,isa string must be all
>>>         lowercase to simplify parsing.
>>>       $ref: "/schemas/types.yaml#/definitions/string"
>>> -    enum:
>>> -      - rv64imac
>>> -      - rv64imafdc
>>> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
> 
> Actually we don't want S and H extensions to be treated like Z, but rather
> like X. Only Z extensions have the category character convention. (And I'm
> still tempted to just drop the enforcement from Z too, since it adds
> additional maintenance and we've already settled for something less than
> complete.)

Yeah, I think you are probably right there. I'll let this one sit for
a few days & if nothing else comes in I'll send a v4 with the charset
restriction dropped.

Thanks Drew,
Conor.

> 
> Thanks,
> drew
> 
>>>
>>>     # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>>>     timebase-frequency: false
>>> --
>>> 2.37.1
>>>
>>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
