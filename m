Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B8CC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3EXC3+qjeCwxhKwv4ZPKBrVaKRTFkRhrh1JvEX+BQU=; b=FW1g3DmN+kJ9fB
	ADIsZgPd7zHe3i1krXRaduIKkaEGNJALRKXs2+5ZMJc/5MCBw33+D6wk+zf8TNKyW4KIoyZTv9cts
	1M192+q0fy6lCHP/Wn4Tf9iZwxLON5gYVs9Ztl5B7OJctnubDb80cYt6VlvcfAi+CL8sbTj8qdK3V
	tvk1PX6kalpo+HGvnRNOXnMQGYzz60F5nfJqi6VfPBU2T5wlD7pecotsx7wdBHT7DQk0L4uEWx94t
	nggyuS4hyD+uEsxL7ijefChv8FSG6j2IFkH7hvzcJLTn7VbGyXYrYrpPI6FldEYeAroNd9TX6/8JP
	lvlCus/f2b4skeAQg2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDv9-001ZbR-J8; Mon, 06 Jun 2022 14:41:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDv5-001ZZL-Tc
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 14:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654526487; x=1686062487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
  b=KV4s7hmcMHt+alLvlkTmz80PDbeSTh0X8Cf43HVm73QTLXDiMs/tklRB
   FNG0yL2LprQ2ZJ0ebFIPDP9/zH6KN1mTSy8xuWzxgpuhD/HGQUjsSaCao
   gTK+Pso7ZQXUxBMcmqPE/ThgK3NmA1ap4K3NwihTMAHQ40quvXUDzq/r/
   vPg9zqr3g0UbPaQuCX4Cc/fLq0zCbA/vkQzNa/oz+xfqP8flX+IX+1xPu
   rIBkqr7X48DnbpUz7ROJ2VlDCHdk2eNi+R3nQCqVYaECUGxUYGmKDVIzu
   8BNasJq+MrLiAkNUwKBwL2o00ng0z3F6bmQx739YYzljlqlQ+T7HnLHuY
   A==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="167256912"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 07:41:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 07:41:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 07:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MauDhJO2siZ7+GdfeQufC3dDqaXfNuRdRRAO7tnciqPL2ecZJHMgS8AUwzMlkO3/dVezmy4YITIM7xlRBwwSj3qvKLyASzkDL/1sz/iGT4yuRpkWdRvqbBAqIp7wswV6RfXGb23WLpoRTq8mD6urwsiMrvCtKYqP1vq7H7FheE+CdhXa1H6KxfDdqQ65E/rUaVFpRQjrzDJaAzRQcNQVVVD8djysYXtKZg0LfwA1SGBJzGoxInorz//j8M9NngEhA5e9YwQNRamJQErCCuAn1xar0ar1A8p+55gAHb262xIHlqwBBJB9mT60VO/FzydauzU3hyZqBTzdO2HFdeqYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
 b=R9ji2O8mLTe0490sqpYZAFu1VO+6y+9Vgk860T673T04TyFxwV/E4xpsCGqdwFL2VtJTGlrnPoOiroqCAfW8qdabZ5HvHZsIuHWxaiFSMHEXWi+Qa+79vgu51jHUjmO9Bk9uQp1GV0hDXHepekoa1XAxbAf1N0aheyUn3kJUFgOQ0sjHi+fJjKByDN4H8xFvq0bEQu7ujoflC0XiMqyXf5y+ucqMQxTbkSUqya+b9DKZH4ufRepumggHzmXE/9Li+zi7gQ/ORDT3PqUsMc8rh9D5SAnNwevpW9Gd1WJplBujZsKDBbI0kYqPvz7adNxFZCpUwMIHV8AeEnJUyLmtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
 b=ihXzsxwnK4Hf+Upk0yWgRgkaTkq50lpmCoqqXW+tkgFxnaipRQxmrbQv+pHqMCFhrGheriXEG3QVnhZoBLGNqZKwjX1mYsUU3B3sndnde9t+J9Kxc2gCY1r/NgrUlhxnafD+XLsTfGKZaINsTr82kC1rtSyp1k8lePcwpq8QgZc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2273.namprd11.prod.outlook.com (2603:10b6:405:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 14:41:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 14:41:16 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, <andrew@lunn.ch>,
	<support.opensource@diasemi.com>, <lee.jones@linaro.org>,
	<ulf.hansson@linaro.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <stwiss.opensource@diasemi.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <atulkhare@rivosinc.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Thread-Topic: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Thread-Index: AQHYeODhWt1cxuRBKEiR4wocm9c1mK1CBa+AgABvgoA=
Date: Mon, 6 Jun 2022 14:41:15 +0000
Message-ID: <32934e96-cd37-0ddb-0e4d-1bae7f964549@microchip.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <20220605133300.376161-3-mail@conchuod.ie>
 <7ed076fb-ee3d-a7ad-7b15-add8c5ffee7f@linaro.org>
In-Reply-To: <7ed076fb-ee3d-a7ad-7b15-add8c5ffee7f@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d620f4-92c7-4b92-c156-08da47ca9c77
x-ms-traffictypediagnostic: BN6PR1101MB2273:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB22732CDF5EB1F418591E4D6398A29@BN6PR1101MB2273.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkfeRA4/t1N387wvUNpIIx06frrHnQF/zAtUIZhxZQLNe/gt8ko3QJiD3GuyoFJBqLnxpmNxQpE7AxcM/Orc71JSDHjpMM7Vw23WseMyWG5L5gOS1oi0XpAX79oqYHFzoR0RM+mFtNDss+g9LNTm4/ZKfSZEFf69/QX8VluiPz082GvPFi9P0HcjlF4NdlR29y3MPLzKKjFt2tzQvZGAuWlYBbDlUaHNJ3eJHhgEYumiyLQuoCNyjN7ujUzXq6VR3HmqtpDHahEkFT6gxbndESZ6GlfvawqBCmSZ30DeyXMU1PKIn73fuC38FmRnz0y0+sJj5il93PA7PS8Y4GKj9CrnhXQuNSzzyQ5Nd7ISo7jsM4Tmt1VYk2r7PUJ2dL0HBnw2tD0lU2H40XTqhqn8fAmzYgdB0d5zLM8bctBvBPbt89DgBq6svrzAXu9QakDI7wONVYJ+Vjw03ol95mAdcHDpgLly1WzUm8MmYaR84DyG1/P/ItSPPw77Dqg1qCc/FUZ9muiO5q0lsk3J1fmUcVzWsSQsrcDf5IbwdZDc4WoaF9ZX3Oaq5gc7GLi9WcWmFuIWFGw6PBXD2YXrBl++hfhBO/tzm7yZXInb24yQbyIGsrrB6s2v9USbr0GzoAjNuG4AoUEZ/IYcneGDm8W8PKbkQ+4pH/69vjhioLEzBfswa20975ut1WfVRQ9TbU91ayilJlqO93I1++FBBzQR44qPNCdTjA2ZjKXxvFEBqHeQImo9M+9S4Q5UXZpn1XIkGCYmaZsG6BjOTFIw9zmPQZKi02eO5yLFtjzFLyqsDl0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(7416002)(64756008)(38100700002)(66446008)(66556008)(66476007)(31686004)(4326008)(31696002)(66946007)(71200400001)(8676002)(36756003)(921005)(5660300002)(2906002)(76116006)(508600001)(122000001)(91956017)(38070700005)(26005)(316002)(6486002)(2616005)(8936002)(83380400001)(53546011)(6506007)(110136005)(6512007)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEpMY2dSRk9NWm9mM1IzU2ZPT0Q1MFc1bWNPbUFSRGxHeUZpU1pHMFFxUzV6?=
 =?utf-8?B?UzNrTCtQTFFLa3BPY3Y1cHc0cDVtcmdkWTV2emI1dFcrcWhjaUF1T0JuYnJm?=
 =?utf-8?B?aXV3eUg4MDdMWmxoVGFMcE51aWRJRzdYVUZWUy9oZy9oTE9qZzVkWlNHbFFB?=
 =?utf-8?B?R3RYbGswRjVHSURRcWc5a1AySW8vUmxWc0M4em1WcVVDQWNqOFV1Q1lFOUxD?=
 =?utf-8?B?WEx4T3FjcWllaEZlSjlRWWpWNEQ0L1Y2S0VPMkM5UG8waTBTL1o1Q2Jwcmp1?=
 =?utf-8?B?bVFycmV3M3BMR3ZuT1NkYjNsM1VIVGovV3FqNkdVT3doZUJ5V2QzN3lUb0tS?=
 =?utf-8?B?ampqa2pNdGlBcWFBaVhYTmdCdlRKUnRMaGtJZFl0U1M2NTQxc3hySkRYMnRL?=
 =?utf-8?B?QUVlZmdJQ1NlTUFacTN0RmgyU3RsUk1OeGt6cXhuU1Q1VWFRRjlmaHNLZzB2?=
 =?utf-8?B?R3VXVnhlVGh6bk91SFd5bVRnamZTNnZ1bXVrNEdvNVZzeTloTWRrRVZDYUFo?=
 =?utf-8?B?aTV0OU5wSFVSTEpvc1pkVUM2NzNVdHRqMytIWVRNT3g5TjJaRkhRRjAzcGRC?=
 =?utf-8?B?NHdzOUlXbVptWU5VSjljc0EvalZhbjlnQXUweEFPTFFBb1o0WStNOUVBZWtW?=
 =?utf-8?B?VUlQSzA2Ylk5b2RhdHhCOWwxUTk0enRKdnpkOS9kOW1BZE1qaFZOQ01GdFU5?=
 =?utf-8?B?TUo2ZjhMbG54aVNMeml2MHBEQXpFSktmc0FnUVpQQVYybENEcE50Rm83WXNh?=
 =?utf-8?B?T2lZTWFweWZtODhCTHVKSktBT1AzVm1tWjcyanVxZnR4eEpzU1FEWXUrZ2ZD?=
 =?utf-8?B?K1FvUFBKTXZ3ZjZxZ0J0REVtaVNPQnNPWE5QcHNMQzlrSW14TGpLWXBQNklU?=
 =?utf-8?B?Qks4RHdWeW1uak45ZExFSjJpZGpQa1NPeW1xMDRaU09iVGhCNjh5Ym1tQzJF?=
 =?utf-8?B?SDdQd0IrNTl0QnpCeDk5MndQTzNUTm5lcnVML1o4STJiKzZseXQ1M2pPazNG?=
 =?utf-8?B?TlllTFBwVVkvRm1GVnhFWm5laXhZQjlkeEQ5U0ZsSE42TTZiT3FwWDdvR3E4?=
 =?utf-8?B?NlVwYXdxM2tnOWc1S1BZUUM2U2R2SE5tY04xcFl5ME9MOUZFNEVWM0lmdWdM?=
 =?utf-8?B?RFdQK0pmVllRMmlxU0t6TEF3ZXcwZmRVSUpBaTZ0ODZwajZmSThoQ28wdEZK?=
 =?utf-8?B?K1NyT3U3eldEU1YwbEtXaWViN1NzTlkydzB3aVVNOTE1aGxudWxFTUVlY2oz?=
 =?utf-8?B?LytsMjBuWi8yZXZJVnZrbWRxanlyMHhQTEFUbUkyK2M3dU5oa3hHYlJwcmFj?=
 =?utf-8?B?MFVLOGZ3RGNlMytsWVFESCtxaDBFTWxhK2d5b3NiZkF2bkRjbEQ3L0dkYXNo?=
 =?utf-8?B?dGtQc3RPbHFTZ29adlBXYlZIRG5DN0s3UE0yV0Q2N2xWY2tGYmNvRVloRlBj?=
 =?utf-8?B?OFkvNERJcWpPMFRKODFoMVhNVEpNMVEvaytBVVJDbmZ1L2VWU0c4WEZhY0NY?=
 =?utf-8?B?Mkppbk1tRGVseGF3OVVoR2F2VkhKZnkyVWlOMktNSlRkQ3drMEdTc1RpcXNO?=
 =?utf-8?B?eFc3ZlIvTVJ3SmhXcko0UmlrZFE1U3g4emt2RHBsdGNYSHpuQ055TmEzcUVP?=
 =?utf-8?B?VFhUckd3b2hjMlJrZ2txcXhNbXhabTlzQVh1ZXJBd0lqWXhnOGRVTmR0eXVT?=
 =?utf-8?B?azROazM3R1BlUi9KeUVpdXJtdGRVY2FCd3doNmgrVmZYL0dOWGFRTW5VR0Fa?=
 =?utf-8?B?cTVlekFsSUlvdzBOODBBM0o5bWdnNUxOWFRhVGlrRzVUUGF5NE5ESzZGYlZG?=
 =?utf-8?B?YVd0RzFtbDdpRnZFWU1FR3BKTVdwV2lDak44YlREMXNFYS93eXp5Z2xRVHpD?=
 =?utf-8?B?ZW9vMU9LcEJGMFlRajZwUlNJY3RQZWZsQXZEVmdNenM4eEpkVGEyM3BQd0Uw?=
 =?utf-8?B?Ujg5Y3Rsd29NWWdJVDg5Q1NPNk5SczcyMDUrTE1xMnNJV3dFREV0V3Z1dkF4?=
 =?utf-8?B?SkJYU0RydjVIUWNLSmZBSFdZRXZyTEZpU3FiSkx2aE1xYUtidndWVlBZUzZQ?=
 =?utf-8?B?WSt4SVhrSjZGaHVkbURKWWtVZk5aczlrZS8rdlhKbGJNNjdlVFFhL3pabFQ1?=
 =?utf-8?B?THpoRmxMM0dCWTVOS3dsMnQvN3BGSmlDVWpHMEFKalZFK3F3VzQzVGtrTHZ1?=
 =?utf-8?B?VmJlVjV2YjF5RllOWDNkdG5wZlJ2K0JjcTMzdExra3E4ZndiOUdvWEVFMmZK?=
 =?utf-8?B?VktycklMZThsTWxvc09yZ1FQVUVoN215N2J3VDMxaGVTdHBMb1hDQk9RWnBG?=
 =?utf-8?B?cDJObW91QWs0QzRzWEhVSTlXcGg2Q2dOMFN2cFczVzJnUk14ZXNFZDQ2YWMx?=
 =?utf-8?Q?oRJMfbQYOwKuXgsY=3D?=
Content-ID: <220E5608A248264EB3A8F15E895C17B8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d620f4-92c7-4b92-c156-08da47ca9c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 14:41:15.9937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9pTIHcQflqbt6itSpWYu24we34ZBUiSNVSz4mhx2hSmBGUZjKp5FMs0xIX1+9ZSCGcZeV9OqRZBRhGzpvZbxABedhhnWgGHJL5Nv0WLS/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_074128_244102_7212CCDA 
X-CRM114-Status: GOOD (  19.23  )
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

On 06/06/2022 09:02, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 05/06/2022 15:32, mail@conchuod.ie wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Convert the open cores i2c controller binding from text to yaml.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>>  2 files changed, 132 insertions(+), 78 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
>>
---8<---
>> +  reg-shift:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> No need for ref, it is coming from the dtschema.
> 
>> +    description: |
>> +      device register offsets are shifted by this value
> 
> I guess 0 is default?
> 

I had a look around:
sifive and the users of opencores,i2c-ocores use 2
aeroflexgaisler,i2cmst does not exist in a devicetree

From the driver, it looks like if neither this nor regstep
is present it just carries on without setting a value.
So yeah, I guess it is zero.

> 
>> +
>> +  regstep:
>> +    description: |
>> +      deprecated, use reg-shift above
>> +    deprecated: true
>> +
>> +  opencores,ip-clock-frequency:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Frequency of the controller clock in Hz. Mutually exclusive with clocks.
>> +      See the note above.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +oneOf:
>> +  - required:
>> +      - opencores,ip-clock-frequency
>> +  - required:
>> +      - clocks
> 
> This is correct if your intention was to require one of these
> properties, which seems to match the old bindings.


Cool, thanks! I did test adding both and got a wall-of-text error
from dt_binding_check, so it seemed about right.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
