Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E28ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PnHjPZ6G41rhtCf1kd469J9tvztScxfqyZ6dtCa72w=; b=V8UyIODNArNYLj
	n1WdqJ6DgRj85rIMhXGfQgXCreT2UyOf4ea49/rpYNjUG+AdFgFBh7+y80Dhw71SLEEKXecE0/NTG
	wF5DovEqH5jI9AUuzpXC3mSTqNP7o3d1xlqYjsUuff6Sf1Vx4f+6OpuNq8yBLDGeTYkE1wjE3fjxh
	ljedR2+VKooqTw1HHe+k0Ny9NCYP7grXMU6ZFOGbUK7Gg6lKp3mQu5YlASdL23wbI358ZPaNh5b6J
	qk2BrCzCFjuu6Atf02qoIGeKRVxL5Y5Upwd8eLHqURrTGTmiSGb/e0N01Nhr/RnPegnDUjmI0ZMOP
	Dm8UtO/WmpzEKKKlOZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVay8-00F7IZ-7b; Tue, 06 Sep 2022 15:58:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaS6-00Elhh-51
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 15:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662477926; x=1694013926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=50LW0bEaa5JhjrLdAbzifIMU1qp48Hbx5hKFebZx64w=;
  b=g56WnVsW3K4y3daTy04rtUAI6uq0RQy1EBfchMoGbHyfGB99XT7oxlyC
   5X5lfts7UehyLUDhsVGkHb24o80xXf9U1bzfP5mryEJudMwSUniGOvNMm
   j2nkhvzTYnkhJwvwP8jyAbPpy5CnDs/DNViQDrtDOnW6qOLuJQe5L6Elg
   FTlwT71f5As4O4xTBXqaqsWDZnkQ9jxl19sLnjzkSPhgkViDcpCPPJ1Nf
   W2YhOnXYs4mgTPHeBFVWv59uXmbjAxJVKrpHJt8w43dONnGwSGeVeIC7C
   itlH9oEDzoJaZoTVRC6VXZXRgtUoqTexNF+YR9gPZkvyv8/EYCZwry1xj
   w==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="172608533"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 08:25:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 08:25:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 08:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6rmk9nELzGGLbm8taJtAu/oxSZ1rc/BTfzQJP+c0pTUbMA1AZrM8BfwxqahkaLK7UsgwICAHk/UGWaa9c9PHXcFnl2z0IEJmTst731Tf9Px6o2NiZZ0dcBExYLyyhnmm9JvVXlYEa2YBaS2uEFmjnBPlu7RP8JRugUyUmpAsDjtNyYU/DwUuFwYYCfq5szN7m2jp5da2ih52mbEXFWk4rfURutuUaLIAkwGwJ8tSHB5xZ9tG2KCDyWJ4mNDbDLrNE0YOzMyQfpQ5XQc6+3g2q1H4dmvfDQgZxSSINYhIFfs5WJJOQCdEyEmuk3F9v5j8Ql1rMmXrwClX0AWEuZZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50LW0bEaa5JhjrLdAbzifIMU1qp48Hbx5hKFebZx64w=;
 b=AjrJVE67POf9MeziPWxgZhoNU0nkrfGlniR/daD/Fug50nifkhon7hrU4k1XYxTV3VF+opjsCPKdv7lJUNZe527WOlj2OBkBI91yPzM9EdCRLMVB1wjIPAOfyjkr71c7YXWGNO1dxWBb9xUDZp1Ss3g463NU4xtN2/Q4Q30MGWh8evJ6nSetKv0VZmPFl9vIaR/yf7OPSdK3EduotsnApv3wNyDfo3Elj6yga2ZdEs3tjauWmweoxNqz2RND1s2INfk+Tnrbximt/sJs9UOa6FcnPEjYdsRXrcqJcJQpPHyZEU5GxykZ52U+3zsJYv17IPR5f3WGKYbyrXVqTxUvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50LW0bEaa5JhjrLdAbzifIMU1qp48Hbx5hKFebZx64w=;
 b=LyvW4lb48PelIvEtnVeaypig6AgCvGcJltfpw+kWgc1mC8mu1GevQSQREq74wDJzt0IKsJs8bvoP7RNVtto3E8JficO746GIzzAAFp0yMNfUHcmuDY5l2bT8ShaYNNGLLZFiMeh/u09IQvOgNIhNNxJdu8neVfBhwK9cJgJdwMk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3964.namprd11.prod.outlook.com (2603:10b6:5:19c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 15:25:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 15:25:13 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <tjytimi@163.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<anup@brainfault.org>, <alexandre.ghiti@canonical.com>, <guoren@kernel.org>,
	<akpm@linux-foundation.org>, <heiko@sntech.de>, <tongtiangen@huawei.com>,
	<sunnanyong@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <falcon@tinylab.org>
Subject: Re: [PATCH v1] riscv : support update_mmu_tlb() for riscv
Thread-Topic: [PATCH v1] riscv : support update_mmu_tlb() for riscv
Thread-Index: AQHYwesX+Yh7ruAFaUuHWKE3tuJfd63SeaUAgAAMPIA=
Date: Tue, 6 Sep 2022 15:25:13 +0000
Message-ID: <53332062-dbff-e93a-c5d4-4293525a16bb@microchip.com>
References: <20220906121921.8355-1-tjytimi@163.com>
 <20220906144126.3enx6y2mhevrc4ur@kamzik>
In-Reply-To: <20220906144126.3enx6y2mhevrc4ur@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 047a0c42-661d-438d-c847-08da901bfe89
x-ms-traffictypediagnostic: DM6PR11MB3964:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DSdfJYiThQTbozWnoEou2i1/d+ySx6+ggXrOlRW5aaujtqZ8fxUxGacAUO08NQ0NpYnHRvFSrov3ddoVjPZtOLUAMw0/5Nc2F+3Ak26tbVRrm+/yRrEUQ40QaQsMknarwaTp+RUNTJK6m0W3EMitqJybNzc2UZGSF66qPrEaGptZDrxR/8wfPieyKTUJdtKxiXNOeogajDOjH57wWsK9Te3O9+MtTw/GiP25gzfll66uKW0KXojFpHyAMLXZAG/pAmIA/7joDZPC88wBKz3noe6FYh3oTik/EAsm7cAhOyWBUjVCavDF32BP/fztNnLbJjQb4uk5EEXAhZDLGOOKVL2+GWzd8+Z4nK3LuM4Y7OcuCwG+dA0QXvn1tUH2ekHkrCNeJ+SHoCyCBD6tIFjYUVxZ6OEQOjxwMybh2bJVWUAeKhkwRHU+bNo1MmpAwPSigczIvQK733kazoODtNRC5Pg2oKbPOKnkfdrmHQbYyN0S+5uV5AmklyLvAFJ9AlYjze5L9oZJHCnKQcaclsKx4XehaNIYG9DGZLPkk4bZfTgPyrbAidJJa0AvSi/oVmj78vKR5Tfs7WdDS7Bgx3nHWkPaRhyklhhqGsGkJeZXiKsm+O3n2YQ5E7oFy1XK3rLYwiMbADe8Rec16IDa/F9pTQOC/953D6KXY44bizZfcaneMoYDhUy7XcIdF0svrGGbZxp1Ym/he/PU3QVGOUF7aRp6n1yWqFnInM6rZQJpU4npP15eN6lcmSquhor5JMxLgPun7NDDDConmN+sW/AaS+7mKniXrqibDoL1PdTZKM9ovsqXAXveTnVNuHRuytMo7p1eJfN+R5XBuGAz5YkUAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(39860400002)(346002)(376002)(66446008)(86362001)(66946007)(4326008)(8676002)(71200400001)(76116006)(66476007)(64756008)(91956017)(316002)(110136005)(478600001)(66556008)(5660300002)(41300700001)(6506007)(6512007)(31686004)(26005)(53546011)(54906003)(6486002)(38070700005)(31696002)(15650500001)(7416002)(8936002)(2906002)(2616005)(38100700002)(83380400001)(36756003)(186003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0ZxVFZOR1lFVTdJeFg5bzY5SXFUelNORUFkRU5lbTBjM3dBMzI1cmFGcUZs?=
 =?utf-8?B?ak8xTEpySHd4bE1HdW0yNmpTWllCWkp4bE0xUmY5emRPNzV3cWYra3N6c083?=
 =?utf-8?B?ZEVGQVZRdnBwQjVpbFNBU3kwZERrWjVLblQvZWJLNmtXTlR6ZldDajdyVlcx?=
 =?utf-8?B?WUR2dzJZNGJ5TlRKVGZBSXZoeVBPSWtnY3BudUNYdXFkaTdEeGNyZ1hKRVVz?=
 =?utf-8?B?WlhRaWNBNDE0SEpsaDZJWDFjbUF3cERjeDlncElqZ3pDV2o1ZVFBZllvaUl1?=
 =?utf-8?B?NzFzUW02SlpCTit6SHRsNGFwM2Z3dndwcjBNeDJiVmkvT3VoWUJNa3hwZVpX?=
 =?utf-8?B?c1BLQ1lQa2I1N1ZtaGROUFZkWlJGeUtZbk9CNVNEcGIxUkVCQnpEMkx2dHQ2?=
 =?utf-8?B?NkNzMWNLWGl2dUltZ2tYMjZ6ZXU2RzdZY3FqdUxIQjI1ODA1OTVuWUtWL0R0?=
 =?utf-8?B?QWZpRGlBOGhkeTg0Tm1FMEFTbFpoM0wreUJFcjNlMzF4eUJSbHgvcmpJZDls?=
 =?utf-8?B?aWdUWTlVeFZGNi9TUjk5SGdyYkwyZy9jSmZpVUNzd0MreGlZaDFmTGsxbDlI?=
 =?utf-8?B?cTNnMEFWMlBLV2RnT2FmVVdDUnZsd3ZEdklGellQRmdQNW54ZVFkR2Y2MVlo?=
 =?utf-8?B?T3FkUkh2cy9mYVFhc1ZnM0hGOWJqbGJKZGI4QXAwUXF3V2ZnaGo2Nmt2bEVN?=
 =?utf-8?B?ZG9odXBtMGVJSXlsZzlLVHRIM2tDK2prVzNaQ25VMndzZmtqRE1XeWo5MzA0?=
 =?utf-8?B?ZTVCTVFVSExFWjlGQ25UTDMrYTh3UjRCV08zUmhXblFVczI5ZTdhSFdab2Qx?=
 =?utf-8?B?eWUwbXdKL0tjck9SOC9pNTZZVlAyeWtOMnljZDNid0tKZXduOXBrd1c2bFdG?=
 =?utf-8?B?MS9lY2QvMHdjZlcvR2p2ZGJVZlhWM0ZYRndKRG81aVR4NGdzOVdmUXN4c1JI?=
 =?utf-8?B?ZzdCUnMzRHozaTFyYkt4TVZNNEhyQ3VOMStLR0Z2QUNydlFIOXdhRTdvQUpt?=
 =?utf-8?B?NkZuRUcvcXJ4d2FNOG1xczA2WTB3allMRERLZ1oxOFhEV2FzNXc1aU5hZWF6?=
 =?utf-8?B?K3dOc0MvQnBoL2pTTHBGcGkvODdaTU0yZmplL1NYNno5TDJhRXkzWTgvTTl0?=
 =?utf-8?B?aGwwYWp0ODVXWndmL0cxNGtjR25NZUNYSGwxd0phTllrSFM5YkFLY0JuTWlF?=
 =?utf-8?B?NUsvR3paMnpMZ2IwSHg2YWJibnhQZ3JJb3U5S3AwMnpkQ2dhRW5FYUlUbFpF?=
 =?utf-8?B?N1NBQitIREZBRTFNU09tc1FuZjdEVS9nUlhwL2w0ZDFLdURUTGYwUDlZWmpz?=
 =?utf-8?B?SW5lSmtWTUQ0cW9lYndIVEZtWXVZRXJ4NldEeGNPWHpXS3lwV2RoVHhTbGF0?=
 =?utf-8?B?c0V5UGZEL3gzb2wxb2Z3WmVmKzh1aEkyZkdPeFFpb2oxR0lPeGV5dzZWZnJ4?=
 =?utf-8?B?dUJzTitBTnVKdjJ4TlQ1WUVScWVUbkQ3a0xBdWhzK2QxQ1h5RUF4ajQyRE1a?=
 =?utf-8?B?blZwaHd5MWluVWxmYysrUGo2OFY4LzNJV05YcUZzTGtDM3laK3dhSVJMdDIw?=
 =?utf-8?B?ZlBFTEkvQVE5emVueVNHWDMvU0cwUHFQclR3SUxMSWJGUnMyTGd2ZlVORnp0?=
 =?utf-8?B?U1FtU1FueTBuS3o3VHlGUVVXTC9SbnlLYlBXRFVJN1ZBdnZjRmZhcWY1Z3Nk?=
 =?utf-8?B?ZURNY0l3ek8xeStBei80UVJaa2QzVjFPUmtaSUtnRHNMbEdkZzE2WHZoOXdt?=
 =?utf-8?B?MDdNS3hjQlpUaVhmR1ljZWJpVVJJcDhhYjZqdkVYKzNROW4rY2o3TytpSnlP?=
 =?utf-8?B?RjJ1R3Z6T2sxQnFNSnJkZG93WkorNFhvaHlpendlT3U5TlZWaVRCTGJLMU4v?=
 =?utf-8?B?NG1MV2g3Y1hzMVk4YmYweFhieC9NUlI1M0I4TlZMTkdRWm9UTEgxcTg3QkVt?=
 =?utf-8?B?aVNDaWVkWUFHcVZrWUx1Y2VWdVhOZFF2TlQrUlJpZGsrc1JUTTE1ZXA3VytB?=
 =?utf-8?B?Ym05QU1vbFR3Y2RVRnRJbTFFU1hKc054ei91NzRYNWxVVmxsTGZGNkJCU2xp?=
 =?utf-8?B?ZHlmRG1qKzRpV3pYVkNTUU9RdHB6dDkyS1RYVGFIUmQ5RnlqallSSUtybDI4?=
 =?utf-8?Q?F1+37BIeKA1GMiXsNybUmlqv3?=
Content-ID: <91951E96F7C1CD4A87CD7F856B105C34@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047a0c42-661d-438d-c847-08da901bfe89
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 15:25:13.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCXuLmYfnvG8sm/9OPr9RhMBIYfk6B+Xd6/Ioiz39zfBvQ4WXDwBKymSB8zn67dyAaZWGRUoP/6Ha5mB7wSzPXltsHAUkWHgLqPTXNmaCxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_082526_505841_A489C365 
X-CRM114-Status: GOOD (  18.28  )
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

On 06/09/2022 15:41, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Sep 06, 2022 at 08:19:21PM +0800, Jinyu Tang wrote:
> [PATCH v1] riscv : support update_mmu_tlb() for riscv

Another nit to fix when you sort out Drew's request below,
drop the space between riscv & : please.
Thanks,
Conor.

>> Add macro definition to support updata_mmu_tlb() for riscv,
>> this function is from commit:7df676974359 ("mm/memory.c:Update
>> local TLB if PTE entry exists").
>>
>> Signed-off-by: Jinyu Tang <tjytimi@163.com>
>> ---
>>  arch/riscv/include/asm/pgtable.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 7ec936910a96..84a791d54f95 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>>       local_flush_tlb_page(address);
>>  }
>>
>> +#define      __HAVE_ARCH_UPDATE_MMU_TLB
>            ^ just a single space here, please, as all the other
>              'define __HAVE's in this file
> 
>> +#define update_mmu_tlb       update_mmu_cache
>> +
>>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>>               unsigned long address, pmd_t *pmdp)
>>  {
>> --
>> 2.30.2
> 
> This seems like the right thing to do, so
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> I'm curious if this patch is the result of debugging something? Or what
> led you to post it?
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
