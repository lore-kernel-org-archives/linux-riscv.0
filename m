Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A97AC61DB9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pni9iAStA5xLu47e/iLPx+GduX7eMS/jsGZwN6cCOfY=; b=nDmvbF1/oMR54p
	5BblmsoZTMmTzo3ifo1H13I7JnFY4lxdKtzCuhb3cNSbDwd7kfLHScLcl69JtctySvRJuzQUFuz+g
	tRzj1pRbdGaRoaABDZRt6n7T14H0b5PvV1BPvIOCEPRtuKzotCKO+I5ACmUjVC1bNqgZD8xKyzg3z
	knBN5s4JWorh67ZzhpjvGDsyoZLsm/YULP5+OYnM3VQOipSEiFqabOQUmvH/raGNDP8W5MfHOWqB4
	0+QvlcISa1fDflJC7emS+gpUH7t6f487qul5M1xlsaDBT5v6+vYc21hO5ni3O6mMdem6W+W/btG6E
	TQ0zmHrZtoHql5+wHChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeix-00000004bNF-0FiG;
	Thu, 27 Aug 2026 18:21:15 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeiu-00000004bIr-2Q0I
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 18:21:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcbxL4cpKQEQHO4sN5WWs7BAs9YdSD3trlu4vVMOkLPjpQieDR9713z4h2PwIjIGz7+7BjPrcaaYzL+6YqQao+mj79BHT6ebEy6UsuGld6jX27viVSJfWAp/Idlbc24q9RT8nitan0mYXmaB8xZgvIyZ6mLZjhw/Sw7DOjXYMo+SktyXqPZqop1Fh4Lgl1qyYlSPW7kxeolYxMn/n+5uDC2qV5WgDjephb5nkAFKT0IXUNMveGB2cg1W1+4RpNPk2rWkLXM5Cs6gQCj0mbKkSMEIwcY6UTw3awzAcb/OP/sYQJwyzgDmTHrwumblWbBa9eDztxLLWMxZuGaAWGE1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLmRY6s1VRZA9IqwRdCJPahEo1F3LunFQx4JKBpQ+ms=;
 b=NBaGInB9n9FuYucgDivDj193VMne4F547NDcUXmz+eOH5VMrTwGCmDt5jdSj77rndKNIRhF29X7PhtJXtiYDFRYH19xGCY6SEnkcCqo1DEUrDfQY/nOQGhp86SbFf8lEYCYHV999S1dPHO2lf1/nWViuZO5mtOeJPaaWRAhpR27PaggKcH/TrkGJcqSs+CRU7jqhYdOtBNkeTOB+I2T7YJ9f7RfI+2bZ3IQ/Q/bZ9Ub+ioLwu3QpUSMQWplS6NaGP/OPKWjeVkY8qVAc6OfWiMbWNvW24lSt7JSK1uPxIohJCXkvuyWxDVh5lSLJoTWNo9VW6473FTgd6IYsksQ07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLmRY6s1VRZA9IqwRdCJPahEo1F3LunFQx4JKBpQ+ms=;
 b=Nvg6WWmSjpTMtNqjTjtiDLhaHLfmz0wnFsNirWSSXj4g0etKJV2NvhDKfOXHX5VElwzznF1O7dUAWuFwUNq7+2CcMosHLs7oIvsAeBK9ldkpR7FMHxZyCNcllWzIWj3syKGQd3KVJyNajifju336WH9lbjasNL+5jUeT6YKVLwpYVQlKw0VTzfa3PJkBQuOdaBrIWyoE2TbWT2nUy+HG9/6K3qv84oUZ6zpL1RsnYFHbpcjGAu42AjX1BTtDXm1mcVxDDXMcSJs6skROftvy9Bkhlz8Le4xoqF8SJPTEn0EqlPjEQM1xImCw++kVVntTA3MlR3CiduXVvNgMRWVpYw==
Received: from SA3PR04MB9001.namprd04.prod.outlook.com (2603:10b6:806:398::17)
 by PH0PR04MB8504.namprd04.prod.outlook.com (2603:10b6:510:29f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:21:04 +0000
Received: from SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196]) by SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:21:04 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: Conor Dooley <conor@kernel.org>
CC: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Herbert Xu
	<herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, "Krishnamoorthy,
 Saravanakrishnan" <skrishnamoorthy@rambus.com>, Shuah Khan
	<shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Wittenauer, Joel"
	<Joel.Wittenauer@cryptography.com>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: RE: [PATCH v4 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Thread-Topic: [PATCH v4 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Thread-Index: AQHdNN9i2B1OC8UL1keFfzcIplhRvbawj4wAgACQXVCAAQVYgIAAEnSA
Date: Thu, 27 Aug 2026 18:21:04 +0000
Message-ID: <SA3PR04MB900105FDC8574A740CD3436DD7AD2@SA3PR04MB9001.namprd04.prod.outlook.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-2-aousherovitch@rambus.com>
 <20260826-unwritten-marshland-47cdf3c17cad@spud>
 <SA3PR04MB9001B48FBE7B7C3EB81C5338D7AD2@SA3PR04MB9001.namprd04.prod.outlook.com>
 <20260827-crust-giddy-6888a52871a5@spud>
In-Reply-To: <20260827-crust-giddy-6888a52871a5@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.11.2.117
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB9001:EE_|PH0PR04MB8504:EE_
x-ms-office365-filtering-correlation-id: d0253a05-e79f-48e7-167b-08df0467f4ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|38070700021|22082099003|56012099006|10067099003|4143699003|11063799006|18002099003;
x-microsoft-antispam-message-info: RB8wu+sV1WZogfGOZiWN8uP7ypyoglqCZROHR2K32GBxOEkwxdzugGOZ2CP7Nm+noBp+WgFEuYym1s1AWipOumKRSSgROIDPa9ee3tSK/2hsS2hDEMK4GDK6wmrWXTHkdFv1UMxy2ar6WKUVBtdQ2LP9aR7d9bm/vHWJNFMU6AdYStVtaxmGAQYhCLUXGssy2V648HKoarhOj8BAa6YEN/8gnm6iCh5AstJjFvimmnQRmFrOWnnEyh5GCWUoDu+4V7hcfjfCX5GFYhmK0ekawNH84YtAWM0sryH4ijmO6Td0do6fjvZsDBk+hcw5f8OcZRI/7l724Z5Kgk8aQUBEsQ60VaNC+jnSNuEi907uBGlS1EKJV3q8VrIJO/Dh2hiws1l+ruzd3gJUCLjSNkINpmOGMuo8x4shj0VfcThgp9XHdERjLXhBgU1KCih74ZFD/yQXXycRIzMU1plxx8J6a7r6/r+DH4vuHNVVCXPj2NxgOZQCW4XJpW57j0EJ8YBV1yZI70UhcMMzPUl0RQF2jpHKJ3+vYydWya9yyqVMujsP7GERk4Hsc0P/YhFkjLNfQRCy6kIOVJoXsHHmvXrOs6n04rGdQiTAK4fmhcVet8N1vKIJuIXT5eCx+d7DHAsVHdpeQuV5Y57BkC+wVf16KTpEIV5CZa280nwv91eCxC1kny2mCbtGrwbpc0/zDbOJIZrDLMBGcAbDxiJUr6IVd1qCuOG+cZ4eWsu4BD0NyXk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB9001.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(38070700021)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?seUecL22L8ck6lU5u1NzDrcU0aq33UJFXFOC0Eo1pPM0DdVJGrdMpNk7UpzE?=
 =?us-ascii?Q?C9ecDNeptUJw68hMEn60HMZiPKKb5lP2woDFad5XzSn3Q0yn55E5jNIvZRCf?=
 =?us-ascii?Q?6WtH7WE+Tw2Pwy4zVo5fDxI2UW9/ZFJcBB0GRBht39yRsWh+QlPVO4wYuOif?=
 =?us-ascii?Q?yVHdrmOHtrXijokObxLLmWW7nvaaoayWsERcLk55cnA6p0VSXrxe541y3Yye?=
 =?us-ascii?Q?DPCWgcdB7uLOoOshPeSjF75m6bAqQfMTlGj32ghFC+DFMcSGQoiCmtVbGe2D?=
 =?us-ascii?Q?XWK6iXXi08+9ONHIejcaX2seRuTx9XonHJ86ToKBRg1C1FtJ6eMcpePEEyNm?=
 =?us-ascii?Q?J64gPjKoIBkV10NbIMmQ6xPXhITFcYEbWnv5ecoxneivhjy2JcLWdSSonv9N?=
 =?us-ascii?Q?6Lsw8PsVIfm4KBKsdwqTwfuvPkDJuT8hPpnsa+qkvVA2MfmC1/cgL1R0XQ7s?=
 =?us-ascii?Q?Rtf5bUZzp97TjCGlMVfhHtr12ptuNPH2cJ54+gomM/xSTc+ZI2yHiqk0D7Fe?=
 =?us-ascii?Q?H/5+2LZH7KLu+EHkLtRMgDTJscnsJZZDIzkKMI+T6r1jM9FUC5Uc7oT8kxFa?=
 =?us-ascii?Q?85HLjxuN1ZOLvg5maDHB+gTyvlH7PaTIUCaulcKaK7gOyLjajkODn4Bwj9ph?=
 =?us-ascii?Q?U9Qv1Vd+0MbEpt/bGOM5koM5EQSQ4l2Zp8h1fNljCvrkGooKoT2sXtcJq/G+?=
 =?us-ascii?Q?pUoVpbVdX8pIfl7Q9LjMZ3y6L9HWaFWf4QpwspKAoiYDGFbir4CCI9ME3dOb?=
 =?us-ascii?Q?0Gw93aAWHE92ciATkjM3q23J5AjT9L5MyuIwfWULcaJjXBEctGOrUty6hQru?=
 =?us-ascii?Q?AQGsOITsIs3Y6N3ViqvxM8HaPaIMIJgSqGUOnfGcHE5HAIJoqjJxEBXcI7hE?=
 =?us-ascii?Q?LJw9dHEUVLCsxWpekDuldh/mDerQiknWPRS4SdaXz8m+gG3Dd6yPJtut4vwD?=
 =?us-ascii?Q?bg4rlmDt3XjWrBhoRuPbBqrFhmHkLSwJiZeGYGdg0NHa7GwmNC2I+IaXK3H1?=
 =?us-ascii?Q?i8CU1t0V371zzTLC2/GJnw9fHSq1s/sIMaGiQkacJDxcEQbNebJ1TZzasWD7?=
 =?us-ascii?Q?QUIgD69PmJQqsKqDjgN1DGyXemsAgsKojLOmh++xVGMKMiIG7EoMK+EzTWig?=
 =?us-ascii?Q?HpnVBri14ParPi/xMkTzXViiaF/gC+gdviPjio5bY038MmSsZ69uJlfVPWnV?=
 =?us-ascii?Q?XcoB47fBABv4PcK9ZIXy/CBrnYe7pBqeJUfxjHbXYgmg1Lw/Y+AFNsJDcf34?=
 =?us-ascii?Q?oM3ELfedqPcYVcHcvbXB4VX8ka7J7sxxklbA4cDEx1PG2raBE2gXY5zMk1sZ?=
 =?us-ascii?Q?edQw/b+HtD/rMVY2KPH/I2IRwcciOxgONGDowLN2LTW9K/h0NyqAtBy5/qL9?=
 =?us-ascii?Q?QzJSQSnMcMgFKeXR5ohjXIs3LBfEQ5ThLsut/0VAFWT5hVDkPAjwigP4hMfl?=
 =?us-ascii?Q?awR0XSrl9Amdzp916yiza/eJP2je8IvqT4FDLqNowHDY09ORrFF22J17+jBn?=
 =?us-ascii?Q?RxSxulLSrnoS0LZ/lkkMTdtUkUfqHDC74SZKJa2lxNixoY+BursJT25EaMlo?=
 =?us-ascii?Q?njIm4BAHTHB4BPP8COQeZUvZYxPsRtBZCueGGNC1gJOQa8zgFw3X0Nt35f6d?=
 =?us-ascii?Q?sUbmyymyRglJL0RZX1EANtH5N8eAVrErQg484T5zmPcp75GVN5PLyZ7gry+7?=
 =?us-ascii?Q?tCs39ATi6+cnuTCl91ZrzfCSXGgbwCk+DmBJGLSLeawvA5xIt8bRxWkD9HfQ?=
 =?us-ascii?Q?MxXjVBhXow=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB9001.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0253a05-e79f-48e7-167b-08df0467f4ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 18:21:04.4928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xulDMoxNLv3SOoIpLRoTYEWRwiJx9aOgmPs0UpUuIk2sHZZJixeLM6B5JTA04ZURAfgZbiL76xALeZYuZkThUwGnR3gF9S5/Vu+jpiLLDKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB8504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_112112_667573_E674230C 
X-CRM114-Status: GOOD (  14.51  )
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

On Thu, Aug 27, 2026 at 06:14:21PM +0100, Conor Dooley wrote:
> With the correct syntax, which I think the sifive example I copied from
> doesn't have, but
> Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> does, fake compatibles won't be permitted (and we would probably object
> to seeing them too). What we want is the binding to force people to use
> a soc-specific one to pass validation. Unfortunately this does mean you
> can't have an example because it won't pass the validation, which is
> annoying!

Thanks, I'll follow the eip93 model. For v5 the compatible becomes:

    compatible:
      items:
        - not: {}
          description: SoC-specific compatible, e.g. vendor,soc-cmh
        - const: rambus,cmh-v1030

and grows a oneOf branch for the concrete "vendor,soc-cmh" once the first
integrating platform is upstreamed. I'll drop the examples block for now,
as you say.

> > So I'd keep clocks (and reset-gpios) optional.  I can add a one-line,
> > hardware-framed note to the description if you'd like that rationale on
> > record.
>
> Please do, yeah.

Will do; I'll add to the description:

    Clock and reset are owned by the CMH management host; a node
    describing a non-management host has no clock or reset provider of its
    own, so clocks and reset-gpios are optional.

Thanks,
Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
