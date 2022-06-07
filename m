Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Wxv7rCohBA27maHmrxhQpZmLf4Br2CMjlA5C7d6nLg=; b=vQcYNkvkr8IkWD
	Sb4UCSbbWJCnmWoysJuuyQNgYpNdGo+1YAFw2cNySzFZfF8yA/a91WlfRY8DzyF6we4/lRX7bL2jn
	U/E+rSmJsEC67EHl0llDgmiM/wPQqTpjv6fjOuVu0WU/i1nRoezTotvBDzRTu09o/a0sR0NFT7DNv
	NAjgrFYwNG8npDECzvSA4qfEq0TTTQzS9RmcYooqDPsUo7OZTfwr3Ru5739eSgIA8OBO4zArIAPrh
	ExXjYsDC2ePC+KhtcZsrj9a2D0e4C14OTqPJ0tm9f1+2bhLAmISp0nytQR8bTmFBaVDCF78yTvpJ1
	ZJTKsGY9DyQuE2UlE3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyU47-005dKj-4u; Tue, 07 Jun 2022 07:55:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyU11-005bl6-E1
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 07:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654588359; x=1686124359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D9WNYxhzSeICbl/66g6y2KWGS/aGlNpAz0i15OmerkY=;
  b=JNSzFXue9Rwjj+cyl0+xPh1ByUqbd4OQzJ8COyWbKLaYw9ZtJ/ZjRd8g
   jOnYJOhvVRqWM6sF0N9Ni0U90tPruDeOCERH4pyjBV9OzGEtgmzKfEROk
   mkH9kHmHwecCCfAA+fV/UpP413Skmn8y1lSB0Eg0IoAicansTcMvEwfn2
   LDiJuz5RqPTz+/KH21detI+md+pqbbXRRaAqe6xjunD4K46jU9vEiKN6a
   9H+WeqcBNDn/0VGxe1gkXKMT9MWBJbVdDI7PlsaMLsdFQ1VjDTZCXzVhA
   MhuE9wRlPqkEb5HJzT+xurBN7ixIiUCjGZg1fABr0THVd/pkJwGrsydPR
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="162183282"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 00:52:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 00:52:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 00:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i53t2CpEQqUFE+n1GRG9gozLeCchJLvOUVxmKdIo1F9et2pFcuDmKJ1SDb+7W7AiIfd5hIXXdv81jK7bIL5/IFo72DWTEbPwKng5CwNn9wL1/d3CiiSiElKc0E5qoyuh5f2ys9/Hdoy9biw2tSII9UEt3uDuhZGGv8/xEbWo7DkVJ81a1JuxUe+gyDQngjdbp9MOpf41NXGh/EzVD/ohqylCSD37DrxZACBvxd88sOO24urNYE84ziNltI2qTbYbOisDFQM1SZXEcRc1bt5z1ZkPXsfukBzIR+h4VsIAN1NGnpa33RJj2Uuag7w0qtE7L3QYqobBR67YDsuY0BZJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9WNYxhzSeICbl/66g6y2KWGS/aGlNpAz0i15OmerkY=;
 b=NTRUk/BGDJVvC2F+y+lDnQT4CKQDT99gR+XQenxy2LY8IKESi1L19hnzNRfs9E5ZkxTJlS8GOYVhe0/RelwU33nQIe6XbvKfIlEUnjZspQCcb7zNECDFsQz58lQllsTcmj8XtnnOv/RkNUbRN2a9fuTqSr1d9vibrod/UAM+emTfgHX5RLmhbgKRXwqflndhcHlWyhni/WG0sJQBGP1jCzwrysEgQ9WyrYYsl+dtNeiH8uSVzxSwV56OP8NJZzV+AUEkzXvqfNI1uyiD+I7WK5sP6LDZzEzRQV6cAI4bsmslfTcIdqQnyK/JHuSe8VN5BW3sCoHNsdfkSANhcODimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9WNYxhzSeICbl/66g6y2KWGS/aGlNpAz0i15OmerkY=;
 b=Ueg0+cNipiii5jBv+AYLqAaXMQeGsux1nyoYS+NPC7awkHhJVQggAhnQpsgGi5m6rOdM33zqkQ+oD/HWd5lsImfsOcSXV2c9SuDftDjlKeSurtT3XsKdmqenLyJCfInkb51Gg82zOzWudCo/FK8DrIr8u43Bk2XAfS5oOjjBl7I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 07:52:31 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:52:30 +0000
From: <Conor.Dooley@microchip.com>
To: <mkl@pengutronix.de>, <Conor.Dooley@microchip.com>
CC: <wg@grandegger.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Topic: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Index: AQHYejvb6k0j61Qol0aP+WnBuEsVo61DiDiAgAAJ94A=
Date: Tue, 7 Jun 2022 07:52:30 +0000
Message-ID: <51e8e297-0171-0c3f-ba86-e61add04830e@microchip.com>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
 <20220607071519.6m6swnl55na3vgwm@pengutronix.de>
In-Reply-To: <20220607071519.6m6swnl55na3vgwm@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5feab8d-cf1a-4cbb-1693-08da485aacc3
x-ms-traffictypediagnostic: CO1PR11MB4881:EE_
x-microsoft-antispam-prvs: <CO1PR11MB4881AD5A280B9891A67FC93098A59@CO1PR11MB4881.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rCQtRGOTYZO8X7CW/hnpLLbRllnlN99HdneKAqnaBDsg5E9I0tv80c3rXms/YiQEg9HSbSJNAFVqo8Fqp0ryhq38f2SRx7182blU2prjfelmiWgcah9EGB5NeKzdt9/2y5jmg0NPg8nINqbZ9YJObFdelQOSw4isy4C7AvTBEd8Y0TB3Lr86dJpeunYzKVXQUmAqVfh4WktY1nYwRjdRgZgJuNrzKPxJfjoE0BF199HMcYzgaS7Fk7a93v/tRMtuyNbCmrukuXUe4x36bEjbFUB/GTh2fA/F4OMCalC960HVeMM9aiHqC+WMf/nrHyBIniqqWjqdSxdIV3i1D4Hyn9YbKdCiGDNiJwsZh7jVENwgTjCdiFcihrgHx0gsWBBRaXRV2bE5miHQ1XRMOKZbZGDbOtWxInmC+2LXsGl0z/LjBRw+yoBsr65VbLaImnUQIsGvqHM8j6tsb5Wwn7D13p0R2Bf6eRbNDvjXFUpQzXj38EsV/TvJvM4mmSgYY4erHIuuG7ziwI+rlLgCULLwmmyhmNNo/bTa0rNi6GpDWZvlryRxRPRlQfFm7rjvNi5XlCbsQvo9yJDECn8PyJ33heN7hueMegBuGG0XnAvpdHAzpu83Q+RnYVEVsS4nvWuzf8DwcZbvuDOrZl/gSl9x4Qz+rPttN5OFGC06cmvhtniKb0tIR5XjPWock8PtAUtkIt49imprqOk6Pm2HPgQnPSkvz5cVwjLOljYGyCDDr1df4B4Z8m/fYqsXLnU7ELpvh7qyITDiaexC1i55qQ1+nl+jFrMT62xrv/9CRLXoK06PgMn80bzBWptJiYWr//Mvr8QeM2nyJTXE49Ov+P6YQkAFfsRpM+YPpPgoeckV9XcDd7671fgwQjc2QDSOHY1cZh2nq1/jYdYJY9P93iHGcA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(966005)(4326008)(7416002)(36756003)(316002)(8676002)(122000001)(66446008)(6506007)(38070700005)(4744005)(2906002)(5660300002)(31696002)(8936002)(76116006)(110136005)(66946007)(66476007)(66556008)(91956017)(6512007)(86362001)(26005)(6486002)(186003)(508600001)(38100700002)(53546011)(2616005)(54906003)(83380400001)(31686004)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHFlNUVsaU1hanFVWEJsNjNvOVhaWU9WcVF3V1ZMNyt3bkxWV1VTZzlHSjdj?=
 =?utf-8?B?R2RFNU1QQTUyTUMwOXBqYkxueC9QaUpsb3ZNd3VoYmYyUmJUeEdkWVA5UExF?=
 =?utf-8?B?N1hMaEJteWszalZvTUxxcys1OXl2UjBYYnBrc2pQcmxpRnBwSmRRNFlLN0p6?=
 =?utf-8?B?L25yRE1ORXZEd29NOTFNMmFLZ3VXb09sWThRVGw5ZTZ0VStXQ0hVcHR3MFl6?=
 =?utf-8?B?L3ZuTHFDVG93Q2I1VUx1TjJ1K0syQ0NIbUJOQUUvRHk1bGZ1elBHM1d6TG96?=
 =?utf-8?B?cnEzNDR3NXNIbjZzbEVxTnBrdU1zOXdDOUM3VE9CSllzb2EySzlaTjlYNVFj?=
 =?utf-8?B?UW1PUGtOV3J0ajcya0w0c1NaTlpxZXRrNUpOeGtVeTlhQzNMdC9UUVJjM1FY?=
 =?utf-8?B?a2tyS1cwdTJDN1VpbERYZWp3R2hqTnhIczVoN3o5MEdLbm5wTXlvUi9xVzZN?=
 =?utf-8?B?NHNKeTUrS0M1RTAxZjd2dEJoY2NhQ1B6TGZxb1J6U1l5MTZudmRISmdvelFo?=
 =?utf-8?B?b3RZY1VHTEZFeUtzVEd6MjZQT2ZRbFpwaUxhWVF4dC9CMVpvOWU1ZnFqR0Jv?=
 =?utf-8?B?ano1SU01K3VDYmRoTjViUUhRV1dvOFZ5SzZac3BVNWd6L3FSUmlVM0ZTTnR5?=
 =?utf-8?B?RnNEK2ZWV0lxUlEvWm4xcHhxQm80TUUxUndsdkRVZVh6dkk2VHl4aWt3aGdx?=
 =?utf-8?B?YVpqc3hZVWloUDM1dnNIekF5Z2ZkVXp6S3JXL0svOG5sSWhzL0J3SXNzTU9j?=
 =?utf-8?B?bkRVQm41UVozU3hWbnBiVmVFUVliZVJiT25rZnE4aFZQc0p6TmN1NkxYRVFX?=
 =?utf-8?B?TERUdGFyK0hwQjh1R29qeXZKcnN3MEU1dGZRR2hnQnJTdkZEYXRZY2lWWFYz?=
 =?utf-8?B?VnJ2N3Mwa3ZKMWw5aUprWkEyd29DYStmazJPRk1jMjFUVnB2TmV3WndmaVhu?=
 =?utf-8?B?RWl2RzNESjlxdkNXbXNocHhPVHoxT2RJRzRvbmJqQ0xIQ29wT1lQN2JadS9I?=
 =?utf-8?B?RzNLR2hQQ0JhTHVJMXBOY0dtUHpVNTNiM0wrUGVyWnQxN2xEa1FWalBTQnQ2?=
 =?utf-8?B?ZzJSY3kvUktOaU5HamIrMjJaS3lBekJLb21uSjMvNzJKc3Y2YnEzWVgrbjYv?=
 =?utf-8?B?S1dsOUpubHpiOEJHQTZmSWFmY2dhVnFoNUFyUFNrTUFCdGpRemZEL3k1V0wy?=
 =?utf-8?B?YkZjU3N5YXZrQkdjN2hhN0dtMXE0N21iTC9rbVlLaG1mUGhFTjBrcmZUMEd6?=
 =?utf-8?B?NkFEQzNRVksrc2tETlZuVDJiZ0NSLy9RWS8xU21oUnI5TjQzc0RlSEU1RWk3?=
 =?utf-8?B?b25QUTNqL3Ixd01oSHpORWRLZnNQblIrYzRsTFZsbVdKcVU4V1RDTk56Tkkx?=
 =?utf-8?B?WFFQRGF6eXVlZDErYnJBeVZldFVSa0thNmRtNldXT0dKZm9PckNlcFRUUFZD?=
 =?utf-8?B?dkNPM2wvK3BJMk1RWTNoOTk0Vi9FQk5yYnNuSTE3SGdkN2FjZXJrZG5JbVBn?=
 =?utf-8?B?Ukc0NldiQVVJZWdzSmk5Nmc0d2hUNDVKYzVreUVtRjduOE1xakNSS1JLTXIz?=
 =?utf-8?B?TE5JenJoMHZBVk85U1c5Z2VUdDZDaFFhUVl4dzhOcUtiL2hqS1cwWUY2QXQ1?=
 =?utf-8?B?MzZ6VysrNFUvL1JJNkpJcHF4bGpuTXJxU3FQVEFsbERaNE9kY3RHT2FEUzVY?=
 =?utf-8?B?RDk2OHQyRHF1QzUxTDNoSE5UNEwrOFhwUm1naWNjQ2tyeGZXMDQwRGM3U1ZU?=
 =?utf-8?B?V3FwaHFnclI2Vm1pM3FpdGp4cklCak5CVmJxbUxPemlYSTZseTR4Wm1YdDVR?=
 =?utf-8?B?NmRLaGFNY0ZtckJoZ0FMOFl1TlFBSkllbEIrUHQ4TFhqOHFUTE1hNXR6eFAz?=
 =?utf-8?B?RTJaYWNuajdLVzFxY015a3I4QVRScFAvUTNTNjl4NC85STJPWndjM1NqWTE4?=
 =?utf-8?B?SmZCWVFVQkVNbXBFU2ZzV3ZmZEdSeEg0bk9yNEhwd2tOT3NtSEVGdTFJVEVx?=
 =?utf-8?B?NGs3Y2VGZkZ5QnpIU1pDK2dhaXUvaGl4Tkl4L3ZpZWg5NTZkcm40SFlUNkhY?=
 =?utf-8?B?Mm1HaXc0RVFlLzBHV2FwbWplY3M1YWE1MGJYalNQMjlKZ01FQXcyWmVLWGNo?=
 =?utf-8?B?TGQzbldoZkZoMnhPeDFZQTgwbk5HL0V6UTNrUWx4MGRhM0hrK2FKbnIxVzVY?=
 =?utf-8?B?Y0JJZEVBQWYyVE5SaXFETzRmQS9MT0dqTG5RTmdWODAyODZrNjQzRVpraExP?=
 =?utf-8?B?eXFjZ0VIVlZIQWFvTnArQkhSaldZNTZyNXlTczIyUkQ5eGtaNnVrWUxuZFhl?=
 =?utf-8?B?b2o3VnBUeGlYYXJWSDQxWjRTRkl4WHhUSk44NzJtOVh5dnQ4UFdNdz09?=
Content-ID: <4D1C5E0D01F60147BCC1FE4D4A981465@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5feab8d-cf1a-4cbb-1693-08da485aacc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 07:52:30.8757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h76C3qtOQHCSta1Kk20oot515AoaMZDNEFc/QNRYMx2fV+HeF7vHtttr3sl4pNoH9oqGrq8+Smk9tw6TXz47iPwCvZcWZ89JjUSmqb8lcSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_005239_602057_4B9612C2 
X-CRM114-Status: GOOD (  11.23  )
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

On 07/06/2022 08:15, Marc Kleine-Budde wrote:
> On 07.06.2022 07:54:58, Conor Dooley wrote:
>> When adding the dts for PolarFire SoC, the can controllers were
>                                               ^^^
>> omitted, so here they are...
> 
> Nitpick:
> Consider writing "CAN" in capital letters to avoid confusion for the not
> informed reader.

Yeah, sure. I'll try to get over my fear of capital letters ;)

> 
> Is the documentation for the CAN controller openly available? Is there a
> driver somewhere?

There is a driver /but/ for now only a UIO one so I didn't send it.
There's an online doc & if the horrible link doesn't drop you there
directly, its section 6.12.3:
https://onlinedocs.microchip.com/pr/GUID-0E320577-28E6-4365-9BB8-9E1416A0A6E4-en-US-3/index.html?GUID-A362DC3C-83B7-4441-BECB-B19F9AD48B66

And a PDF direct download here, see section 4.12.3 (page 72):
https://www.microsemi.com/document-portal/doc_download/1245725-polarfire-soc-fpga-mss-technical-reference-manual

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
