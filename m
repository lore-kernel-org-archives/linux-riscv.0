Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFE7C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TJnKV4TT48oqIwBrn78FyHjGJZ1kEFbX6q5EQ5pTsc=; b=sBeRLEDCBFLULs
	rPJgBw8o3+KX9547miVAy/xBlD7ILRBoEq8ezfQ27748Wn3bfcucE1yyq5h+3KYwtzu8ZBbFLt+Iq
	pSaEYEb1UjKcXZ6pz58fD9LHDw5VQU5QRlWE6jqLkA0yseXCWK74r1jjEaM1QM6mUCqesZDU/Ar4j
	X2vIMRvOKo3cHxLDglCgyLqrUy9pK35eqkW4VWpV33vCERe9M08bVKmgIdMXyFJmoglV74+gZBnF6
	Hl79Ll+elj2BIBYy53QuTu6ZU/j6gBVjHpLzF85FE8Hrq9Yr/rURZKqO5JM3AE3U5wrBaekPWkivA
	zd/om/mVxvUhKbACh5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjDX-007m5R-Cg; Wed, 13 Jul 2022 20:44:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjDT-007m3S-Mw
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 20:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657745056; x=1689281056;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=67BFlQxIk71xz3ho4t3VAWwB3+RrDgjrKJ592cbJEo4=;
  b=KUtIfKNhfNiN2se8BnnM/bTqeSJAuwFJ0PZwSwFykR3Y3aFjbbQN+D80
   fmy7rFgrs62NOydaEG07eJxLuWFs/k1atXAc+lR/EL2VmqJhfdR3ZGUQU
   D8T54wwb8p9kbfpMaEJhAijVVtctrEJD2NOHMG8+wpOqkBTqaSCjK8i1A
   aYwkyDhbjjuPFDt4QctKy/G73EuTGM7G2mJdfBi/QxdsCm5eugI8ppSGH
   +08fRACz8AQXrrv3NQ86r0VRvAkhs51qpw5gHdo12tl6MAsaBQXxmtcx7
   j74jFSeawLBwgLBPcsH+mggcPzHtiMIn7L/FbZouFrAsz/uvvZ5u1KH3F
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="104351584"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 13:44:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 13:44:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Jul 2022 13:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM5jd6lKt4IKFv9kgDXv0LUXbkMRNgVME1wOUqfwaJL+UmPdRzx39v4ZJUA7122OdJETBdJf8Ly8Gd3kyv4yxlrKyDP8wQ2HiOa0w5o2f/uiUjaVtsWyII96XBLO+BHY57GonC89zK5eBASfk4AWacxTL6MIDahFq2CAFX9mjY00V5lWhP3fcTL3Ncslq7kU5QRmEY1PixOPl5HOZu9tacdOob2hkg3zcGkJ6GzGJaYl1UXeqFHo0JJJ+Ivt8P0oR5UWzB0JhTACse+PsjOsXEJuqk91cULagjbMtmAYGQwQSR0nkakiMeqU+mXn0+TgxHMCTYBlxnlK+LHW3VJq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67BFlQxIk71xz3ho4t3VAWwB3+RrDgjrKJ592cbJEo4=;
 b=EnBegWqu66NbyQYHgKPXBV3JNHSrqT07KbNwKFbYlt2yZTIBaJCcb2bBLm/4e8TH5Bi2BGQVCa+oCgVFiAzpzkmNhtVS1GGGHXOAv50jbMipNZLzIPu46gCqC9MTJHqqgWqBHGI6AZe912mlJvH3hSI/Et/z3SJQK/cTqW77bhjwe0DaozzNfo/x5f/UmBAnJNDqGXPigI1xuHrepoTvh6e/or2SrrAfKWNhdehkOJCa0vqh/n/J4PvZ2AT+galFn6lKs+heX09Zsw08kXv8Aff2vR1/yLoy81TMDLaxl3fEjUg/QUsR9PcHmCr7OyjWUcJONeJi5h/QXbKhwhz70A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67BFlQxIk71xz3ho4t3VAWwB3+RrDgjrKJ592cbJEo4=;
 b=GQcofysMyjVSAco3OoX206EI1OYwppxtdh03+W9EHrMqI8yAcm5R/TOGoNKkd9pQhuX1pJHSfX2jLYlXWO9XNbXio8ybHm/pQpFP2xbouhGl8YS8nTOyzwfvw8KVhTd4Jzb29idFZhLO1qPl9gfc7O0OPQHtrJRTbZ6u4moGZBo=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 20:44:03 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 20:44:03 +0000
From: <Lewis.Hanly@microchip.com>
To: <andy.shevchenko@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemr2KX1URl4Eaxdmj5tFzD4a18MrcAgACSioA=
Date: Wed, 13 Jul 2022 20:44:03 +0000
Message-ID: <abdf389cfd049f60b951447c047bbd186fa19469.camel@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
	 <20220713105910.931983-2-lewis.hanly@microchip.com>
	 <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
In-Reply-To: <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27bb05d1-b6b6-4b89-03dc-08da65106c1c
x-ms-traffictypediagnostic: MW5PR11MB5930:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dj4nEYF8OVXZ2Wfk1Y0JaYuLTP6aCekSIkzq+elvIVYjzFi4ES62FlhZWht1vcU+euoahiZMY82XklPHPBhjqSxTk28Ejcb4B9XlAjmgY3TIhLdDcVvraOA2JNhEY/iDMMHC/qdr/KRCz0eESkAJt/4qw3yT3CpGaBsMFO88lO+outBwPzCniWpDzz+ljbP1YnPIpMcwcRZ6XowV7LlYn6/5seG/yqC/Qh8K3C36lj8P5r/0Xx/6glBJ1kXsxGO5TmUUhOKDrrhUMH8bfq6woNJgBYczX7ANFkZ0zDgGxrhZHTlyb/jr6Uk7wd4QNu28ViZ4qXNyNrQPAZECFxoHp3wUbKrrhDktZHN1dVlx3IIAJ8Demvcw1TB1+92fbHS3k0jDoEFtPFnJlOp13fHlgPD0eugDWosmEf+eDAWYpoetB3us1+UkEjyHchm5IGTd2s+FVmGO6S4lLQdlR4F2EzMmLTmNABeuheYFqF0PrVrWeAos1OEyL34kfpjhiepHzDZb0XY+aPLfS3uFdKtjbbFrdJPcJd6iMaD6w8k7BD5O3DkmodsudDXPHSuO2KO2xJaDGHJ52fQU5Vw0iR2m1vj9zfbG/p+Xyo74159BOp9ufs1fX70WT9R7K2v3jV/7LvyIBwpdVoKFnwUsxzy82bX0GJYTeYm/T93Cb/i128cx0gi5WVuuODHFSp/fQCPO5zPaspb0gZzYiliuYkzMODn9Cal0cvnTWcqLNbAqQ7JwpuV9T5Qo0q9kXybF4OAnDLs2Tme9ZqpNIun7JVQ9V30kLKFFacEiasCs9PbsxQzbUKzcJiF/hL1SpvHKfdCZCUY63v9mn72NQSwVdglTQNYm0Am+O7zylIfteDXqcNs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(39860400002)(346002)(6486002)(83380400001)(71200400001)(6506007)(66946007)(38070700005)(76116006)(4326008)(8676002)(6916009)(66556008)(2616005)(122000001)(91956017)(107886003)(66446008)(64756008)(54906003)(478600001)(66476007)(186003)(86362001)(316002)(36756003)(38100700002)(41300700001)(26005)(6512007)(53546011)(2906002)(8936002)(5660300002)(341764005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnY2ek5tNUxuZ1l3VkF0TkJqRWM4b00wMERlZUV0U2tQRndvOUdkeW1HRkFM?=
 =?utf-8?B?Yk9qOURRUjlQMTZrY2pncytDT1NXUHRMOS83TkxGN2RTbUU1bHFOeEpkWDJJ?=
 =?utf-8?B?SWNxYzFNVDRPWW5ocjFkVmtlR3Nuc3E4Qzg5NjB1L1loanpLV3RzeUZVSWFn?=
 =?utf-8?B?Nm5GZ0J3SDBCQlJLb2JqV2F3ZEIvL3M2cXdXRGpEQSsranBuc21uUUlKQWJF?=
 =?utf-8?B?d1FneDZoa0Ezc2tSbDNyRWxnbmlDa1dYai9McEh0VnJsNEtKd3pTc2ZmZmNR?=
 =?utf-8?B?L3o2V1lkcWVEcERVU3E5USswTHRGSEFjOEZFZW1FS2xGY3dESWlYZWRjV3d4?=
 =?utf-8?B?a2FSbDFYL1dNVm5Ka2NOZGtZZFh5U3pGMmNKZS9ZL040b1FnN0RQQmVDajYw?=
 =?utf-8?B?WDJJZ25Hek5udUt4SW5TR3Q0bk9xM3RBT0Zvc2lxblFZaHczZ09vSUdXQUxk?=
 =?utf-8?B?ajVlbmlxK3pYWmVIdjFEUFBEcWY4bXN3Wk1ZSGR5T0VpSmcyZllVOG9JYXZY?=
 =?utf-8?B?TTdDTGpJNEcxSU8vUjNOSWdWTW9kaFd1dzVVK3pOWjNjTW15bktKSi84b0gy?=
 =?utf-8?B?UkY2TTBBQjJ5Rkx2dU5MNmg3RnNCZ2lxWlZhWXR3blM2aVVBMjVycUxRV0Yy?=
 =?utf-8?B?cjBKdEhITTVSdG9MR1BXSTN4MVN4U3hHNS8veXRlcjVyVytnem4zQW5KbkZD?=
 =?utf-8?B?NHBJMjdUcE5TSWZlZ0xEWXl5QkxQQkhEY2ppRW9mVXJXR3hOVzZaaDBUYTB0?=
 =?utf-8?B?WkhjYVdhaGZJemZDUTB4SkVMVmdmK2dHM09Qa3QwUWNwcHNDQkZTeHV1M25n?=
 =?utf-8?B?ZCt6dUpEQ1VWdkhySENWQU9TMi9CbHJESmJvdDlsalRRNXB3b0J1OUllSW96?=
 =?utf-8?B?RTlrS3RBVnpXR3NxaXgzdFdhOWRIOTBmL2JlTFpVUmI4VDh6dnJqem5ZYjdB?=
 =?utf-8?B?a1UyZjJ2V3dSc0xTL0daTUZwOFRtSUIvQ2pzdWppNVZ0WWxZRGk2a2pFV3Zj?=
 =?utf-8?B?MXBNYnBXc0M5WHFRV0h3Sjd5VEZhUU5vNFZCOExEYnZ2VXZ3d0NPeEU2ZUVY?=
 =?utf-8?B?MjBRT2RQM2xDQUlrOVVsbm9Ia3MwUzZkQkZ2Zm85aEpiSTlSeGFYcW5UWU1G?=
 =?utf-8?B?eks5bnA4Sm95MkU2UTNPcnZFS0NsZS9aQlpDcjNaRVBpcG5pK0JSdDArbTFH?=
 =?utf-8?B?dWVKVlIxY1RjK2VJbnJab1JucUF1SXJXWk1KRWI3U2luRklyVUJjMS9vNVd0?=
 =?utf-8?B?WnVUOGxqdWhVS0JhVDRnVmlEZHlQS1lBeU42eVBUOVczUFhQZzg3UnI2bXFj?=
 =?utf-8?B?RVlzYWNjYndxeXpEMnZSQjZkNyt6L3BqQmUybXczSS9SanVhTU9TTXJQcEZr?=
 =?utf-8?B?Y3hKV3dGMTdZcC9IdjRuNnpvM2IvMkFPZ21Yd1l2V2JnT1g3V2Fsb0NDTnJO?=
 =?utf-8?B?eUgxamFOcDJ6cHNWWFdtV3ptNUZtejdZb2J5bDRodU1zdllFNmU1NzNMOFRx?=
 =?utf-8?B?cEo3bnB4am5wOHRQQjJORzkvWnc5QTVzdFhzYnlvenF4dDY0VEdHUjRvcWJ4?=
 =?utf-8?B?ckdSTHZJVjZiSzl6eHpLcitnejdJRXFuNlFHVy9FdXBkY20vdldjbngzaVpa?=
 =?utf-8?B?OFVOK2VnRzRhcjZtK3MyNTRJMC9KbW5OcTh4TzRiRm9RVkh1dCtPaVc4SkZ1?=
 =?utf-8?B?ZzdrTEUrSHVqaE1oY0FGWml4NXRuNmEvU3B6cU9JWVc0NTdWZXhKYUJnSDBY?=
 =?utf-8?B?eVpTS040bmVORTNUaTBwbTZBUzZMenpNS0R0M3J3ak9KQk5kZ0p0TW9EdDF3?=
 =?utf-8?B?MHNsSWplOVlkbDZXNmtMbEhkVkJVY281dTR3NkdRNE9pT1FXNGZjeDdFc1Ir?=
 =?utf-8?B?UkMwa01TbmhZTXBtajAyUkdXMU1rZmlkS255K0MvVzNWSjBlT3pNNG96MHF2?=
 =?utf-8?B?emlsM2lDZ2lud0g1ZHhISW1lcTAzT3c1dW1OeTZ2SjNkbUlMMXNpRDlkTEVm?=
 =?utf-8?B?RFF6dWp4NE5hY254UWRKdGp1c2FXbzlsMFlkSUhGd01zdjdTR2xoM2kxTjE1?=
 =?utf-8?B?b1FobktKdDhRMHBkZ1pkNFR5bnk5clFab0xXbjJuczMxZTFXZUZWVlV5bW9o?=
 =?utf-8?B?ZTJucmxQSFQvNjBLbm1nM1VIZjZzVEhVbjljb3cyWS8ydXRiOFdWYkZSYlRx?=
 =?utf-8?B?REE9PQ==?=
Content-ID: <222DFEB846206F46BBEE222B94B25B4A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bb05d1-b6b6-4b89-03dc-08da65106c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 20:44:03.3691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBvTwQfm/QcJZ99UKKJUN2LIZu6ZSu9WatVebE8/DHs8OGtuvIRpZiLT03soiJ3dMQjxkzZ8z4mK/wHAjuMlEenpNp8jyOj9BdULlymZR68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_134416_111586_A09947F8 
X-CRM114-Status: GOOD (  29.79  )
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

Thanks Andy for the feedback.
Points noted and updates will be in next revision.

On Wed, 2022-07-13 at 13:59 +0200, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Wed, Jul 13, 2022 at 1:00 PM <lewis.hanly@microchip.com> wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> 
> GPIO
> 
> ...
> 
> Below my comments, I have tried hard not to duplicate what Conor
> already mentioned. So consider this as additional part.
> 
> ...
> 
> > +config GPIO_POLARFIRE_SOC
> > +       bool "Microchip FPGA GPIO support"
> 
> Why not tristate?
OK.
> 
> > +       depends on OF_GPIO
> 
> Why?
> 
> > +       select GPIOLIB_IRQCHIP
> > +       select IRQ_DOMAIN_HIERARCHY
> 
> More naturally this line looks if put before GPIOLB_IRQCHIP one.
Yes
> 
> > +       select GPIO_GENERIC
> > +       help
> > +         Say yes here to support the GPIO device on Microchip
> > FPGAs.
> 
> When allowing it to be a module, add a text that tells how the driver
> will be called.
Not loading as a module.
> 
> ...
> 
> > +/*
> > + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> > + *
> > + * Copyright (c) 2018-2022 Microchip Technology Inc. and its
> > subsidiaries
> > + *
> > + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> > + *
> 
> This line is not needed.
OK
> 
> > + */
> 
> ...
> 
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> 
> Why?
Not sure, will check again.
> 
> Also don't forget mod_devicetable.h.
Can't see why I need this header.
> 
> ...
> 
> > +#define NUM_GPIO                       32
> > +#define BYTE_BOUNDARY                  0x04
> 
> Without namespace?
> 
> ...
> 
> > +       gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> 
> Unneeded line.
> 
> > +       if (gpio_cfg & MPFS_GPIO_EN_IN)
> > +               return 1;
> > +
> > +       return 0;
> 
> Don't we have specific definitions for the directions?
No defines in file.
> 
> ...
> 
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +       int gpio_index = irqd_to_hwirq(data);
> > +       u32 interrupt_type;
> > +       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> 
> This line naturally looks better before interrupt_type definition.
> Try to keep the "longest line first" everywhere in the driver.
OK
> 
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> 
> ...
> 
> > +       switch (type) {
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> > +               break;
> > +
> 
> Unneeded line here and everywhere in the similar cases in the entire
> code.
OK
> 
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> > +               break;
> > +
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> > +               break;
> > +
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> > +               break;
> > +
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> > +               break;
> > +       }
> 
> ...
> 
> > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                            MPFS_GPIO_EN_INT, 1);
> 
> Too many parentheses.
I do think it makes reading easier.
> 
> ...
> 
> > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                            MPFS_GPIO_EN_INT, 0);
> 
> Ditto.
> 
> ...
> 
> > +static int mpfs_gpio_irq_set_affinity(struct irq_data *data,
> > +                                     const struct cpumask *dest,
> > +                                     bool force)
> > +{
> > +       if (data->parent_data)
> > +               return irq_chip_set_affinity_parent(data, dest,
> > force);
> > +
> > +       return -EINVAL;
> > +}
> 
> Why do you need this? Isn't it taken care of by the IRQ chip core?
Yes I believe we do/should, data->parent_data is used in
irq_chip_set_affinity_parent(..) without checking so hence checked
before calling.
> 
> ...
> 
> > +       struct clk *clk;
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *node = pdev->dev.of_node;
> > +       struct device_node *irq_parent;
> 
> Why do you need these?
Yes they are needed. Both of the same type but used in different
places. I don't think I can reuse.

> 
> > +       struct gpio_irq_chip *girq;
> > +       struct irq_domain *parent;
> > +       struct mpfs_gpio_chip *mpfs_gpio;
> > +       int i, ret, ngpio;
> 
> ...
> 
> > +       clk = devm_clk_get(&pdev->dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               dev_err(&pdev->dev, "devm_clk_get failed\n");
> > +               return PTR_ERR(clk);
> > +       }
> 
> return dev_err_probe(...);
> 
> It's not only convenient, but here it fixes a bug.
Will use return dev_err_probe.
> 
> > +       ret = clk_prepare_enable(clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to enable clock\n");
> > +               return ret;
> 
> return dev_err_probe(...);
Yes
> 
> > +       }
> 
> Make it managed as well in addition to gpiochip_add_data(), otherwise
> you will have wrong ordering.
> 
> ...
> 
> > +       ngpio = of_irq_count(node);
> > +       if (ngpio > NUM_GPIO) {
> > +               dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> > +                       NUM_GPIO);
> > +               ret = -ENXIO;
> > +               goto cleanup_clock;
> 
> return dev_err_probe(...);
I need to cleanup clock before returning, will use dev_err_probe.
> 
> > +       }
> > +
> > +       irq_parent = of_irq_find_parent(node);
> > +       if (!irq_parent) {
> > +               dev_err(dev, "no IRQ parent node\n");
> > +               ret = -ENODEV;
> > +               goto cleanup_clock;
> 
> Ditto.
> 
> > +       }
> > +       parent = irq_find_host(irq_parent);
> > +       if (!parent) {
> > +               dev_err(dev, "no IRQ parent domain\n");
> > +               ret = -ENODEV;
> > +               goto cleanup_clock;
> 
> Ditto.
> 
> > +       }
> 
> Why do you need all these? Seems a copy'n'paste from gpio-sifive,
> which is the only GPIO driver using this pattern.
Yes I believe we do need all this information. Yes it is similiar
implementation to sifive. Not the only driver using this pattern, check
gpio-ixp4xxx.c

> 
> ...
> 
> > +               mpfs_gpio_assign_bit(mpfs_gpio->base + (i *
> > BYTE_BOUNDARY),
> > +                                    MPFS_GPIO_EN_INT, 0);
> 
> Too many parentheses.
> 
> 
> > +       girq->fwnode = of_node_to_fwnode(node);
> 
> This is an interesting way of
> 
>     ...->fwnode = dev_fwnode(dev);
> 
> 
> ...
> 
> > +       dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n",
> > ngpio);
> 
> Noise.
Maybe, but useful information to know the ngpio.
> 
> ...
> 
> > +               .of_match_table = of_match_ptr(mpfs_gpio_match),
> 
> Please, avoid using of_match_ptr(). It brings more harm than
> usefulness.
OK
> 
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
