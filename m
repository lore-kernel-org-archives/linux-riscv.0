Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65536C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rmY/pyj8O7xOdAgJMCZXCWM7Flvxsq7IWWpTNeF5pc=; b=v6dVHLykp0Mc4p
	OpQ9KYkGbBpuM0RPORrrU+RNY5+4zHswureHIx4hJvLw24avOO4P6H/CNwiuxXWakdEmaA24jB9dt
	cLSs/ruwaRxZ5/FJ/FK8xblhjji1S+H6exAzih6bXRLvQV/ZlgOM0+iX08FqcU/i9i3jO7ZAo4YY/
	jgSq91dPba6+ejjykjuBx812YVgZtr3XOkmlDsl33ksXfhc+7Ckf+o/yK3K+zjwpU1gZkL/xhHjfZ
	MtDAFwuSpdwOPnVN8QFjJfOx1jfKekw73DO21IS3NyvMPuIjdcpcn6sQJlZK3ftWjuAk0KsjI4ZAR
	+zm9MOXgiJ1BeS97/j0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8rH-0096nI-4u; Wed, 04 May 2022 06:51:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8rE-0096ls-BF
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 06:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651647092; x=1683183092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KJGek/6Fj/cA9LzPuwsgNg9IypPOebLscLoe8xMNKFA=;
 b=VgyXP8TqqWcwE1ZWUWEibAJbxEwkjvo3iyFYDq8x2B+skVZgDhGVIEXD
 Kx5e6QjqlC5Pm+Ep+WMVT5LJXV1OnWdBh8v3LB6YmXIfisLhlI2o0m1L2
 k2oB9mgofzu1q1vqW9EVYvq9wNW2Xigl4HulXv/1HSmjYadWeV0cMgXkf
 QKqfbfwJIJBydMRHz+59jbpKK4Ac6TbT4L88j38B7qPr1Pk3M1LgDKNGV
 nZQJSaFR2tQ911PRmQbMWTwPnySiRYeSkdCn4ztx1p2qaix10AFb+qRm8
 yVcrCOln30peA9aI2pCNTiHhZK7RmL38IYk1dYzPf9fqe66ihoPJKRkQq A==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="162662590"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 23:51:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 23:51:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 3 May 2022 23:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVLfJCqILKmiPevTgocxnWmXdVXNz+rTeHKdzqcV6E04tOTw7DFvRvqfU9uCqJHBGoKSCvjTmmd5pCqb8kd6AevJcWxIf8PlED//vIltSWoMvapUxXWF22aQJOF0kBEo9BN/H5t58vcXIs2pcB20HTJg7OZdSWw3ZpPuBkUogX7VkKD0aSu+gnnp+sXoIM3jQLwJGb4aOnK2Evc0QGYY0jl5qFtcdeKQVUTLtjS/NIcM0mOm+sL93sqshTDBT+DUTf9PNNX0Ya5bHJ8uiP/qKeft35sTCKVBq63vNBrcCCUtuzf/DAS2dgMp5jhY6pN4zcCAal5OP0URbB/GRywrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJGek/6Fj/cA9LzPuwsgNg9IypPOebLscLoe8xMNKFA=;
 b=LkkINqLY5W0cpfCzboJbmvM1N5iAM5RGDRyRnGsIHlLP7LyJzNYXb4t61FH0zpo/S6q3gUK6BKWEIrnMr/HeoFKI/rYclwvYho39uYhBRcJMlH9aJUl81OWzZ5SXSJ6VwvovnONwfbUn2tqYANFzrwLh42B09G0xa+xnAFZprJ9LZtGv9Iq7e+52iiSgN5S6A/wVWl/hwkHMoliq2IfAIeILHgfvxEeoxKt1r8LSAhMvHRm6ntBy146eL8UhqIvcy1bMUWySv3bWgsU6Awk5phMf3YbYjhQmqDzSjS2h+h1MORYRI7d88x8r11jRmfeMMipt8hO4McNjFQqb2FgEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJGek/6Fj/cA9LzPuwsgNg9IypPOebLscLoe8xMNKFA=;
 b=fWxJrvWeDqVcxWwF5MW1jKozh07jbaJDD6vP89pytZHbEivvG2o5kakB9Bn+XOlU0tiAr/hw5RMmuRojchveQZgauUJRs0Smo+I5Jw2jgAluLHH0F6Uabor1LmMBp8eN8U160qPC8qjdEf/frxpsGoQeRV13d7zspUEyf4JsV+c=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1453.namprd11.prod.outlook.com (2603:10b6:301:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 06:51:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 06:51:16 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <krzk+dt@kernel.org>, <palmer@dabbelt.com>,
 <robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <palmer@rivosinc.com>,
 <arnd@arndb.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <mail@conchuod.ie>
Subject: Re: [PATCH v3 8/8] riscv: dts: microchip: add the sundance polarberry
Thread-Topic: [PATCH v3 8/8] riscv: dts: microchip: add the sundance polarberry
Thread-Index: AQHYXZF5fIfQ0jWbJEK3P2cnEzmA3q0N13UAgAB0AwA=
Date: Wed, 4 May 2022 06:51:16 +0000
Message-ID: <b9b30e83-4f9e-e26d-56aa-446d33f422ac@microchip.com>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-9-mail@conchuod.ie> <3101012.5fSG56mABF@phil>
In-Reply-To: <3101012.5fSG56mABF@phil>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd9b8d07-c15d-4dac-ab66-08da2d9a7caa
x-ms-traffictypediagnostic: MWHPR11MB1453:EE_
x-microsoft-antispam-prvs: <MWHPR11MB14533A17A5D082563F8C1E8798C39@MWHPR11MB1453.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5oX4vVDYAAQdzxQLqiW5TQcR3gI+gWAeUZz6BvkfDtSH4qRcWADycpDP6OousUVOCRmu4r79z29Cc1d69MrPliTuiaRuKbJuE2xJvVCiIG11W6JUjEWYmCGlkY4FxQ9d4XpA4fvE2rCZlE8A5bLLgilPweoedCKcl/Jfepio9A2hDDOuFBRpLUEmp++BjzRXBUa22xTPhcAR9s3FbNYezL/DnBxiYW8128gRq0txMak1fjOM2B2/EEAP+6eHtzI5cclgtFlFLTFZK7wtP3RnIAEFtuUkqDoentxMLKsllf1vBpZlmBqjSrl/EMFWZaYmLj5hjrf/jgtYmTtbGQcCSmfp4pk6tMn8WqWA3ZB2XNK56lQcaaDM9fjVqmb406djssygSYJvWxoFDMwCf60g3g58Cb5L0lc+Jey9EhRRI5DfqBMC4a21AvwuTe0Ku7nPCG4TCMoGYE/4R3LhJTED3hhW0BDQ9XDAGrScuKc1nZWZ6qU4BY+BIluT8FDCZ5uy1/eRhlCmoxGOfIFlgcTRDar0wqetYVJj6wTjEJpC3xNRisFx1naW1cbFfnazGZ+qj8RHlgaMBcwkDW047XhDJEc7giMUeAtnSdZ18F/m2bAPZdu7ELY5zIpc9JhGQkNnLhXgdB86nMRUIQIEou4fHS0VbD1nhKaAr3Ks+9zu+yxs3s3DmVXFa+xapYz1YJR5M8/Aax+75KmTWCcTgj3yx9ohaqhBm6yuV59Dv7Qx9P/biAXc/M4Sg8CIc5lYrHXQulsso10ETD9PA2wAOWNl1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(71200400001)(76116006)(66446008)(66556008)(64756008)(66476007)(8676002)(4326008)(6486002)(54906003)(31696002)(8936002)(36756003)(2906002)(31686004)(186003)(316002)(91956017)(110136005)(38100700002)(6506007)(5660300002)(38070700005)(7416002)(508600001)(53546011)(122000001)(86362001)(26005)(6512007)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2dsRG9oVVg4a0crOGRCVDBnMkZNcCt2dmFRUWNaRitwZTBRZ2lmZzJEUUtK?=
 =?utf-8?B?d2lTRGN2L2VESFVLc3J3bVdVL2J1UXY2TVZDa21rc2NHU2tWSFB2ZDFyYXJ4?=
 =?utf-8?B?QVNUU1hnWmdTSjJ0Z2xySkY5MDZDNkJqanMrc3N6VHJGYmxtYVFrK3BmQ3Bi?=
 =?utf-8?B?VWl5SWVRK1VrZmZWdXJWRThMalcwU0Fna2NEcGJmcUVhN0NOQzBCTU5QQ2RY?=
 =?utf-8?B?WUpjZzZMdUYva253N2NSQmdqc05Dd1RUalNXUDdQMmlpeEZiS3RLaU5RR2FG?=
 =?utf-8?B?UW5LY205R1JxcG1LMVJmaWxOM0pDdE1Zc1hGWXFrTkhpR3M3TXFaRGI3M3ZI?=
 =?utf-8?B?b3lickxJYVNsM3cvTGxsR1VkQllEeGJkczNlRC9kWGJvWW5NM3FvdjVvY29R?=
 =?utf-8?B?aTIxU2ZLUFdLSVVtQVUvS1pPeEZVMW5YTjZyd29IYmZRdWZXZmdwU1Q2OVNi?=
 =?utf-8?B?YzUySzJzOVFtSjZSdFFheTRUYlBBTWxuN2xwams2Nm5jTHlyY2w0N3I0M2Yy?=
 =?utf-8?B?cGl6NlA4RjdoaWFDalZYUDZ5WmhZUlF5YTI3V0lkVVl3ZGpacWhDeTBiNEU3?=
 =?utf-8?B?c0VMVTJjS2JQUmZUVmVFT2p3ZzFBYlhuWHNMZmZKZSsveXF2eUdGZWE4RzBQ?=
 =?utf-8?B?UjNTSnV5OTl1aDRFQ1ZESTNmcUdQNEwxZmtNeGVMaENNbXVoaDhoSXN6YXZB?=
 =?utf-8?B?amNtMVNwV3R5bkpTb0xqZU96bmM2enpZRWEyQXBoZEZTRGpiNDVPUE8rSS9N?=
 =?utf-8?B?U2JUdkJWeE9Ud2hPd3RSYjVzZlBXcGEybmw4UUtxVHpTbXl6aURvK3g0YzJs?=
 =?utf-8?B?Uzl4V0ZQdzdORnkrTHd5UThJckFsblhuSXdjeFRrbWtTeTBEQ3oxWlQyTEpt?=
 =?utf-8?B?UUJFNXlacVZNM1hxR0N6UzFRSTR1dVRJRXkwNVgyOW9uM2k1YWpaV1hxS3Mw?=
 =?utf-8?B?NlNhZEk2eDhRek9vaS9Mb001RXNDallaRFdsM1NpUkFhdnhUSUVTbjcvVHFk?=
 =?utf-8?B?U1ZCVjQrenhTUmN1U1BvU1N0NVl6Y0JMSkE3cWE0OWhOYTBpMlhTUWptNmlm?=
 =?utf-8?B?SXdmYVNESjYyc2xsUHhhRE1ZSHQ5Snl2QkNZdm9ML0RwYXIrVENmaVJpL0VE?=
 =?utf-8?B?d08zNmpmTVhBbzArK3VhT3pic1ozVmtZem12eHhlSC9heXBBM0FvdS9udjJl?=
 =?utf-8?B?NWVQVWNJUFAyMFV1STQvTDN6T3VOMmh6cDZKd3owUitoL0U4ejE0aTFxTUlN?=
 =?utf-8?B?N1E3NVBNbDdzbEU2K1liRWhrd3BKWkRJU2VLMUlzV2pxVnpMR1QyWHJBTXJy?=
 =?utf-8?B?SzQ1N20xWXdVOVJCWnhKOTcxV0J1bWVCcm4rVW5NQnhNL0F6YlduOXZFZ3hx?=
 =?utf-8?B?SFRrY1ZCOFhBRWcwd2dBNjBaMU1qb3drU2djUHpSZzZyOHpkaTc3MkZNOGo0?=
 =?utf-8?B?WFpjclpKUXpqNUNOcit6c0hnNVp1LzN0M3hwb2c2UFRReG5ZbFdZbUQ2NWFU?=
 =?utf-8?B?WVlqTlFIckVtR2RnbFc1MUR2UjFiTW03SlNMSDlERXFYWHIrN1BCclRiSFJ6?=
 =?utf-8?B?VEJOaWhmK2czV2FUSnNTWFNnZHhJQytpem1PYUxBNENqckJ6K1pBQ05XM2hl?=
 =?utf-8?B?U2hnQTFmRitaN2g2bHNFV2NHam1lU21jTW9uTDlJZGtWNytscmNxTnhJQWJh?=
 =?utf-8?B?Qjk0VURYWGJRaUJONURGMllYTGo3VnpnUWVKWkI1NU1rWG1xV2pzdUlHZzVm?=
 =?utf-8?B?YXpzdVpsdTZjMjh6dVJ0bzFaQ1lQZFF2QldFZGtKMzBDRkErTFR2VDRadGtH?=
 =?utf-8?B?ekxwVGhGcEJoRjBrTzZEYjFRRlQvTlVmek0zbjVyMmp2bzA4L0VOWjVIYnc3?=
 =?utf-8?B?UW1HWjZ6U3hJa3FzYVhldnNYc3F2QThlTmFCcmVpdmdzVmFvTkdDaXIrb3RI?=
 =?utf-8?B?enl4VGc1Y2xKRVZ2U0hFN21udURHbkFjeDlrcDUxQVZVTzRxaFMxbHpQN0di?=
 =?utf-8?B?cnpOU0cwT295b3RJeEJ1NFhBV0pzWGtveDd4U0JaRGZGb0VxaWZrbFByRmtv?=
 =?utf-8?B?ZlJFeUN3dEN2TUFMVVVyaGdOWmJ3REZQS2FjZFA3NW5xWkZEWU1pS01xeGFN?=
 =?utf-8?B?dnc2RWswTnBtcjZaRk0rUDJ6emNVWnBMRmJsNjRacy9FQ1AyL3hYNGQzOFRB?=
 =?utf-8?B?SDA2Tk82Z1BOT2FZU3RTZHlRWkFpZUMzem82bDM1bnZJUTJkTno1aTgxa0t4?=
 =?utf-8?B?YnhHb2xpWFVmREppSVdvTWRaVmk4OVU1UXRGVkxXaFliNXRWWUpoRzUwRmVu?=
 =?utf-8?B?OGZNd1VqeStUNzJMdkt0aG5JYnZ5VEFjOHdyb0UxeVVtMFBrdk9zbURlYVRK?=
 =?utf-8?Q?kw7Twm76DiGXzmo4=3D?=
Content-ID: <2429B67A5B97954F9CEB6F0FEAAE21EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9b8d07-c15d-4dac-ab66-08da2d9a7caa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 06:51:16.5494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUeepGMqFG9WYEwag7oOFOqkL4+TiURCzuHzSIcp3cJ7f+0wc90nD5uiEXs5K96y0Ul0WQMfpnvTKp2zub+FPhKTfPPtbrZTCOoRN7rcZWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_235132_435770_54990D56 
X-CRM114-Status: GOOD (  22.68  )
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

On 04/05/2022 00:55, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am Sonntag, 1. Mai 2022, 21:25:59 CEST schrieb Conor Dooley:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add a minimal device tree for the PolarFire SoC based Sundance
>> PolarBerry.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]
> 
>> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
>> new file mode 100644
>> index 000000000000..96ec589d1571
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2022 Microchip Technology Inc */
>> +
>> +/dts-v1/;
>> +
>> +#include "mpfs.dtsi"
>> +#include "mpfs-polarberry-fabric.dtsi"
>> +
>> +/* Clock frequency (in Hz) of the rtcclk */
>> +#define MTIMER_FREQ  1000000
>> +
>> +/ {
>> +     model = "Sundance PolarBerry";
>> +     compatible = "sundance,polarberry", "microchip,mpfs";
>> +
>> +     aliases {
>> +             serial0 = &mmuart0;
>> +             ethernet0 = &mac1;
> 
> I guess you could sort them alphabetically (ethernet above serial0)
> 

I suppose so. I had just matched the order in the icicle but sure.

>> +     };
>> +
>> +     chosen {
>> +             stdout-path = "serial0:115200n8";
>> +     };
>> +
>> +     cpus {
>> +             timebase-frequency = <MTIMER_FREQ>;
>> +     };
>> +
>> +     ddrc_cache_lo: memory@80000000 {
>> +             device_type = "memory";
>> +             reg = <0x0 0x80000000 0x0 0x2e000000>;
>> +             status = "okay";
> 
> "okay" is implied I think, so when you only add the node
> here, you probably don't need to specify the status.
> 

Good point.

>> +     };
>> +
>> +     ddrc_cache_hi: memory@1000000000 {
>> +             device_type = "memory";
>> +             reg = <0x10 0x00000000 0x0 0xC0000000>;
>> +             status = "okay";
>> +     };
>> +};
>> +
>> +&refclk {
>> +     clock-frequency = <125000000>;
>> +};
>> +
>> +&mmuart0 {
>> +     status = "okay";
>> +};
>> +
>> +&mmc {
>> +     status = "okay";
> 
> having the status property last (below sd-uhssdr104) can be helpful
> for readability, as readers would know where to expect it.

Ditto

> 
>> +     bus-width = <4>;
>> +     disable-wp;
>> +     cap-sd-highspeed;
>> +     cap-mmc-highspeed;
>> +     card-detect-delay = <200>;
>> +     mmc-ddr-1_8v;
>> +     mmc-hs200-1_8v;
>> +     sd-uhs-sdr12;
>> +     sd-uhs-sdr25;
>> +     sd-uhs-sdr50;
>> +     sd-uhs-sdr104;
>> +};
>> +
>> +&mac1 {
>> +     status = "okay";
>> +     phy-mode = "sgmii";
>> +     phy-handle = <&phy1>;
>> +     phy1: ethernet-phy@5 {
>> +             reg = <5>;
>> +             ti,fifo-depth = <0x01>;
>> +     };
>> +     phy0: ethernet-phy@4 {
>> +             reg = <4>;
>> +             ti,fifo-depth = <0x01>;
>> +     };
>> +};
>> +
>> +&mac0 {
>> +     status = "disabled";
> 
> mac0 is already disabled in the mpfs.dtsi, so you either don't
> need to duplicate it here, or if it's a reminder of something,
> I guess a comment for the "why" would be helpful.

It's a reminder that the SoM does not have a second ethernet
port but the phy is wired up (and usable with the carrier).
I will add a comment.

> 
>> +     phy-mode = "sgmii";
>> +     phy-handle = <&phy0>;
>> +};
>> +
>> +&rtc {
>> +     status = "okay";
>> +};
>> +
>> +&mbox {
>> +     status = "okay";
>> +};
>> +
>> +&syscontroller {
>> +     status = "okay";
>> +};
> 
> My personal preference would be alphabetical sorting also for
> phandles, so
> 
> &mac0 {}
> &mac1 {}
> &mbox {}
> &refclk {}
> &rtc {}
> 
> etc - makes finding things a lot easier in the long run
> especially when files get longer.

Sure, why not.

Thanks for the review,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
