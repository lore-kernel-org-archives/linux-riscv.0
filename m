Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E08C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVlpMabNVvNns60JsfbUk00i5OlFIp4j9N7PsRErYPo=; b=lrAECoeIzO2dri
	yd5PnRj2SmihB9v37vS7NicAR6GTzR8Q40QeqonQy0s+VQW2e+VfeBSWZHoinIQZR3nqpyAFK+cs1
	dvrg46dQ4LCidMLGnHeiCF36eKfX9k1DlOF6oJcC/zBlfIGZFR4vTDUuwbC9ICV+cHaosE7aQY3Ff
	/A9w+YB4bnxBMzg+l5gWP/Uxg7Mbn3LK9upMN6hH75p+3rsiPb7JZV6I4a+nZNm5ET4JwFuYrghgY
	GYHEsqXemfrOd7Cd2Hdg7Zeyj6aIgta2FLsoVT7AUuvbI8wTXdMEpVp2cXv+80GXlhQbaKE0H41Lq
	HKheX/vsNOD784vsUp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9koY-0035qU-MT; Fri, 08 Jul 2022 10:02:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9koU-0035n9-JZ; Fri, 08 Jul 2022 10:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657274538; x=1688810538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BB6/BRDiT39RZQ2VFb89lrbmk03msFMFBbrWTK8za0Q=;
  b=jleGJXKhZmkpfezyJb1/9PoJv11MgQf2G7jgmwLherbVF3CA3DdtCuW2
   QAVyl8bgoLEP+5JJ1wmgN+0hXiaM9lvX3FTEMQAUz/vTXSuPdho1mh8GU
   zq848WvMnZxQRW9RH3HomELPkRH/uzp0g/5hPYgexTI6L/72UUGyqyUA3
   4fWdGCL9nvxzY7mNokw8YH4r3Qr0Kx0lDiuaad1i/hwcfrdS4cqvbdsYV
   8ew6FkqZPdtVYr8Yy7pS2U2UwqQtQfevPByGXVaXhUnRMk1PP4M7pihGy
   uQqI+jiZIdu8+RwtpMwDlR++SXND8QdOBL9/N7mt+4XuYdLUbc7Cd5tzj
   A==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="171302533"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 03:02:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 03:02:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 03:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5RDHpXzb1cceBt2rl9h1mKzmfriXgDBc/q3QbH0rji4SpEJl+28FCxt3PCn2Q/7dPP6khjecwCmPWF+h1P5uANArF0ntaLL7CGadIN4RVGXo+bPaX3jWSl+bLS4sBOoIlJVLuq5vvGl38D+qQmrSzg8zqcL/cLQVZUp1sf6ElhQJ+fkjz2Jv58tYlP4jjBpJddAARuQLhTEjf+HbolGEy3wmSUYPmtHdWj06RU+7m0dhShpZYDSAvsZKO8EkyZhpGmCk6aKht5VVZs7Iz+A1OPqeq+JjBbkSPJF0ZlKaxT0bUOFTqS6oMK/9/bhYdYwe15RcZyXyijIYBn4llh1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB6/BRDiT39RZQ2VFb89lrbmk03msFMFBbrWTK8za0Q=;
 b=SlnrXjiFA4Dp64vihsyDmr12Jkc28WcEWPFpvS3pvRFmx8/83COMvya4Y4JpaGE94fk0vF2Za233G/+7SIzfWykr26C4B1w/NErsjaR8z15GDRUtpbvGMhucfcqH927qxWNzFS+Eea/uAHwzhXfkpJg0RkscXd4dV0tjQq+UIbX6Hrs/kGGvwlb0kIqD7CfhZp/Ft84gQCM9euzxdIDmxDc2Omxh8G1HlmDk84DPj1E2ZNVdj8jMlEWTRXryCFeG7KjrMIag+MgPMEL0oe+bLQ/sWjNcjnxe0M/RtZYeUyNGra4a3sVKjls8/cT5Fn3A4c7bh3zKygtQ3u55qiKYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB6/BRDiT39RZQ2VFb89lrbmk03msFMFBbrWTK8za0Q=;
 b=qozqL32aQGrVwC2snN0eVcCBxI5c5iE1oKHvRtibdNENT6kVzQmTF7neX+WTotk3LOFxUKrTtcbKJrbEFTeQJqEwP2v2W/drnSVVrXak3vWiN4VJSelVR5WhfF2b68mnD6hrq9b3KRnRHa5zLmp3m0VCN9XLO/DFKYv3Me78cO4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1398.namprd11.prod.outlook.com (2603:10b6:903:2a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 10:02:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 10:02:10 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<guoren@kernel.org>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<changbin.du@intel.com>, <heiko@sntech.de>, <philipp.tomsich@vrull.eu>,
	<robh@kernel.org>, <maz@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Brice.Goglin@inria.fr>
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Thread-Topic: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Thread-Index: AQHYkk3HIdduEfI8FU+fdqjoS8H9IK10I72AgAADKgCAAAyQAIAAC4eA
Date: Fri, 8 Jul 2022 10:02:10 +0000
Message-ID: <f48b21a9-e5f0-6aff-c563-f89b37037f00@microchip.com>
References: <20220707220436.4105443-1-mail@conchuod.ie>
 <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus>
 <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
 <20220708092100.c6mgmnt7e2k7u634@bogus>
In-Reply-To: <20220708092100.c6mgmnt7e2k7u634@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fadbe04-2634-4993-ca9a-08da60c8ec81
x-ms-traffictypediagnostic: CY4PR11MB1398:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+AJYgDGowF9j3A0qABEMc4Y3YKZ57U9J2GC4lwXTGsQqEAyByH6aLrp6sYu2Bs7Nx8uCCwqRRl/SToU+M8MeVCb0R5Zg2/I0+kMZSoi134FJjOFJTM0LnG/s8dRPXVbRL0z8+6v3xOeuINcnNzFkQlEpWiKv0opMziz0ZIRwd8hwV0i5wPPJdlr+SzR5S1vZ1kgmCXPTPFjr78r13AYnt4Rx9u6ZKC/yX6mTxoEUPPuxpFPkB7xwODXm+eczfkXi2y2eVoSgX3eBYkeXK8S1oaHWg+V2JNw8CovV/VJVsfUARG43KW2wpR5nKzC6JgtkCHDfVBI+3qz47QikPSOgqV6DlmD74NzHbU5lNNNfY/olxRgrHDgG2LJCLu3cXd6qleRvLnb56K12p9pjqvwl8VoS1WihK2/iNJ16upv+nwdCDOm0lg4gH9Y2wQBPhpySywznYfs/1V9bOJ9ZjahWfCrdDiRDTcf8djGoMMVLhYZrGuAbcFyR6pqNFpZofkm+4fxWug/0QTRMbNKIiVJxGeq3PXW4GQPS7wfGxRkpHcUCFHZP7MTO3BkFJyQl+LTy0Jr5kCGELXLzOxRhMt4nBKNqgPFGFPkhy7fFX25E6pBu69NhSBbw64BTfr9QFugBj4z42LEeOkfZG/6MihWlDBxmc/FE/bEMEVCDTGHIl404k8PrM3tPeVjzZnC+GXVzkcvnJPdkfWodKUBhSh938KeSMx2ntrcgTr2mYs3O4ova3r4Ibd4pYZOMSaYhrfPJEZN4S6hL0GsEQ45zjZteEZmRdntNtlZ6i3tRCsRqbQYd7vr5oUmioPdCJHBk8E7g0yAQMiYNLmyD23doPusl3cU2mzx449ySTcXkWJctd2uXlUJ1+DAANRSMr5BPokQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(396003)(39860400002)(376002)(316002)(2616005)(186003)(6512007)(38100700002)(36756003)(54906003)(6486002)(91956017)(6916009)(31686004)(7416002)(83380400001)(71200400001)(38070700005)(4326008)(8676002)(31696002)(86362001)(53546011)(76116006)(64756008)(6506007)(5660300002)(26005)(122000001)(66556008)(478600001)(2906002)(66446008)(41300700001)(8936002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1pqN1F6MlVMTy9mM0FpNWM2ZzhLMTZtWTBBeXpTeXlvUS9JOUQyZ0QyR0lS?=
 =?utf-8?B?NmFoRzhTdURPSTlUZ2lCQUNWMTZHNXdhQ3FOeGR6S3JuL1hzM3lEOThMR3gx?=
 =?utf-8?B?WWVGdnRDQWJDb1JyMnBiMXhrSWt2SE9mNlIwSCtEL1F4ajBiTFB1UStqb2tN?=
 =?utf-8?B?cFV4dFBhaElKbEQ1NmtTV2s0RkNWby9Fc3JISlFGMVA5Q1FSd1RJOWRUOU8v?=
 =?utf-8?B?S21JTXQzQjdkQ3h1SS81MXlDVzRrbmdmNDB6dzdBOC91M09QUWRsQVU3dnBa?=
 =?utf-8?B?VTNWK0VycHl2S3g2OG8wYUxMWkhncWdUSmpWMGFmVXBVSXA1Nk14WjV6Zmpy?=
 =?utf-8?B?dGlTbTRKS0pJMFpTT1lPZG5QSklWMmt6cHdHTkIzc0UvVE5UNmZBLzloRmZP?=
 =?utf-8?B?RzZydmRpU1FtOGw0QlhCaE1ZWkMxRUZuSlhpOHd1S05Jait6TG5vR2pxN1Nx?=
 =?utf-8?B?NmdHa0Z0VllEd29PU1NMZThpZkNpczh4ZDVZRUl3ZmxaUFNhSWQ4RkxuZGR4?=
 =?utf-8?B?dmlhelJjRm96Y25GL1lVWTlMSnh0a0xkY1hDYitFT0VuVGpOaTY2NGJUTHZP?=
 =?utf-8?B?Yzh6SUtVUFJIQUcxVUQwa1gyd210MzhTTmJRbFk1aXJsYVdKRmFJVXZQYmtm?=
 =?utf-8?B?TSs2eXhDYnlPc28zajF2eUtIaHNHZkVlWGdkeEpTUkh0ZzJRSkg2bG5ac0JG?=
 =?utf-8?B?WTNCd05Bdy9hVHdITUp5cWllOWtjaDBjOUFSamx0anF4eXlOeEtBRndYM3o3?=
 =?utf-8?B?LythV0s5d3ZIdXBSb2JrVkFPSG5SWHJYekNYTmN5a0ZBVUJQaUw3UEh5Ym95?=
 =?utf-8?B?NUcvUXFvSkRIUVQzeFowU09zT215VUhwU1FzN3VnT24wQ0lGRmVlRWdQdEo0?=
 =?utf-8?B?THFlanV5Z25NbnN5dzE1WCtTelhpY2xJeUE5QU1yNzNoZURGVFJETjB6bGh6?=
 =?utf-8?B?RFBTaXRQUFk4WmJOVVcvc000L3ZzUWV2WmFUQTgzKzRac3poVnhzQ2dWQVdB?=
 =?utf-8?B?MlRWeTF2WHFrV1FEWEZWdnZjZUNRU2RhVFR2eWs1cW5ON2doMmVOYlJIOUZU?=
 =?utf-8?B?QmZUMHp6VFdybmo0cERSeG94TFhVVFFIZThNa0pROW5QRFpMajFMRUVGMkFh?=
 =?utf-8?B?NUM5dTdZNEU3RGF2K2MrMTh1LzJHdmZ2UGZYOHl2QWlnN1Z2RTNab2dzcXVG?=
 =?utf-8?B?bGVseHltc0F2OTVLYkVaSHhXUFpYZ24vcGVyTVlSQ1I5bENoMmN6Tm1nQmUw?=
 =?utf-8?B?TXFod3lQSFZHOXB5a1FhcWd4eVlZRis4NGtJd0dvZ0dxZ2pCeSs1cEdkQWtq?=
 =?utf-8?B?K0lEaXh1WWVGdmtSR3lFamJBdGEwVCsxbjNSZ0lad2VRQjVqK3QzdGpkTkVh?=
 =?utf-8?B?cDhRdGtyemUyNFd2eGFyS2N6UGpYN3BjcmNUeXV5Mnp5Mzhrcng5T0dHQzY1?=
 =?utf-8?B?ZUIyejl0cnFJdmE5Ui9MYk5QbzBsSW1mWFBidGhBWDdnTVZ3dFllY1doK3py?=
 =?utf-8?B?b1pzOUZuUU5VNkxxWVhyMC8zeFhGNzlJbjRHRytVbnNjdW4zU0FOSmtxZUNV?=
 =?utf-8?B?cmZiODlqaHpjT0t5b1JZdDBrdm5QbjZSSkN2ZloyODUzM1h1Wm5ZZXNtZ09t?=
 =?utf-8?B?N1hOT3RzZmQweUYvdnhlNkNNU1FqUVhlUG5qbkFFRlpMNmJpV0ZsdVdIczJI?=
 =?utf-8?B?OUtldisrYnBTODFMMGFXVy9oUU9oelF5bFNqTnVUNlllcUlWNGtUVzdWNXlV?=
 =?utf-8?B?UEhBRnpoTlZPY0pXTHBSRTZLeStURVo5THJKRWkxZm5pN0VHQlB2T2w2NWU5?=
 =?utf-8?B?SVVYcXEwZUFuYXY1ZWp3YkFqRWJLVDYxdkNGeWNIRjVocVhzU2lwQTBRVW9Z?=
 =?utf-8?B?c3c4bXk4d0NmdGZLbldTU2FucmV5eGdvTEFEdVZSMTBQdFVZaUVvWkphRFhE?=
 =?utf-8?B?am4vZkRwc1A4K0hjd1h6QTN4ekcyZFZJeTFwOU1oajNVY0N2S01wTW1GNHAx?=
 =?utf-8?B?V0xkVm5YZzBvNkdzSVBNRjEramhZdGxQdGo2eVE1cktRSkRYc3lpcEVCV1BY?=
 =?utf-8?B?NFlrMTFyMURCMVRZTXh2VEt6aDlNWmNDY0IzSE1qeHc1Q1lNaGpaNlBldGhv?=
 =?utf-8?Q?WVTZ7uP/z0QPNq1VpWIa6eVw3?=
Content-ID: <8582FD00557D4F459559EF8D6E83D9EA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fadbe04-2634-4993-ca9a-08da60c8ec81
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 10:02:10.3376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSEqvVTEGlHipPdwN0be2S6MU2xGGnLET1fQ7OdF2vj7YpOLkrYWvASxiHv3ZY3RaW3oT1Nhn2hW2uFnZEkpwmBxuH8BtmbzIrXzgqa3RC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_030218_902409_CFE42667 
X-CRM114-Status: GOOD (  21.96  )
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

On 08/07/2022 10:21, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Jul 08, 2022 at 08:35:57AM +0000, Conor.Dooley@microchip.com wrote:
>> On 08/07/2022 09:24, Sudeep Holla wrote:
>>> On Thu, Jul 07, 2022 at 11:04:35PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> RISC-V & arm64 both use an almost identical method of filling in
>>>> default vales for arch topology. Create a weakly defined default
>>>> implementation with the intent of migrating both archs to use it.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>    drivers/base/arch_topology.c  | 19 +++++++++++++++++++
>>>>    include/linux/arch_topology.h |  1 +
>>>>    2 files changed, 20 insertions(+)
>>>>
>>>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>>>> index 441e14ac33a4..07e84c6ac5c2 100644
>>>> --- a/drivers/base/arch_topology.c
>>>> +++ b/drivers/base/arch_topology.c
>>>> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
>>>>     }
>>>>    }
>>>>
>>>> +void __weak store_cpu_topology(unsigned int cpuid)
>>
>> Does using __weak here make sense to you?
>>
> 
> I don't want any weak definition and arch to override as we know only
> arm64 and RISC-V are the only users and they are aligned to have same
> implementation. So weak definition doesn't make sense to me.

Right. I had used __weak b/c I didn't know how to split the migration
into smaller patches per arch without breaking the build due to
multiple definitions of store_cpu_topology().

> 
>>>
>>> I prefer to have this as default implementation. So just get the risc-v
>>> one pushed to upstream first(for v5.20) and get all the backports if required.
>>> Next cycle(i.e. v5.21), you can move both RISC-V and arm64.
>>>
>>
>> Yeah, that was my intention. I meant to label patch 1/4 as "PATCH"
>> and (2,3,4)/4 as RFC but forgot. I talked with Palmer about doing
>> the risc-v impl. and then migrate both on IRC & he seemed happy with
>> it.
>>
> 
> Ah OK, good.
> 
>> If you're okay with patch 1/4, I'll resubmit it as a standalone v2.
>>
> 
> That would be great, thanks. You can most the code to move to generic from
> both arm64 and risc-v once we have this in v5.20-rc1

Right, that sounds like a plan (well, pending geert's concerns).
Could I have your R-b on patch 1? The comments you made about
removing the duplicate function should be resolved.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
