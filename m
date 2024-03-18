Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C2C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmPXujX7BFfWYmyHVEqXaTGgWBPBeRchwGxg7zWkpHU=; b=dzGjdkUhy5P7iM
	JeJOrpTuZSMPpoKUw2qpRqcyWkuC1Jxw1jlAV9JmRcbDWIbAS25vZgq8YNx/ZZsmuu6NFLn12oe0Q
	Gh2CdsHzMopKFOqWYhYiXGlR4jQscaf3Ebld8aK6ixZFXVYasWJD031V04b+bRLO1YlPEimGUV9oa
	FbafAhmluHCwJitDMM7nqnZNMBp68fUmcG9it3HLwgRQ+Jy5EcJTSSuBNWaibqJ861stXGCcNrdbo
	etGxkCdiXQQBlmIsgfsG9aacleGofpr+sCC4y4aHUXahbqvFaBZsUVaY4rDVx1JHLq9OnLeYhCy9N
	gLEJEBWpDI6YbZPGLfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFoP-00000009EIq-0TbE;
	Mon, 18 Mar 2024 16:26:09 +0000
Received: from mail-bjschn02on20701.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::701] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFoI-00000009EAd-2uKv;
	Mon, 18 Mar 2024 16:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8qzNPmTI3gzSfgww/o+TVqo/9YVn8qvEw3/7jv5g4+9P91a6y3NMwhE1fP9aMmGCd+qNneSY2I1zBTI1dfnzYZX6IS1Xa0GTNYbgQL35QSGGroeogzozzRGVDgB9OPFbMHCQUw8MoMAwptdOyQoQnEUJrTFMWONBzx4AUJFQjsJiIpgfi8VHbAQr0YY0qmP5DM2csmHlYW1/4GoodpEvOKHHFCGlQCZhny1FBI5ApPBRCB0EhCcnWLkXPLhh2cH9HJlZuBvhIKaNemWHfIJYqKqFuvyza/HBNKLINNmrbQK48hwSV34j3M9r5bTTzNoqbOtfNn0jsUKXeVjKyFbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+88kuvNIA9sxbpoRAL7RW7anMeeNYSciSngPjRwLqk=;
 b=BKFhquLPC50KSvu7SfbLFOPVbDHf2ndI0YvQortfszjsHZJfnTHKb1fXNaCZPsccwW7Im7LaEaoPsxbYVm0dEuUgjWPD52X+G0vgez5zq5CAw3HUxizM9NKyi0+kuqE8s+VuXPlmMqZqjCnQhQFsIBExyH8GC0UzbYB3CUqD8094LLoHz93i7fHnfhw1TbxTSAZxFIWowXb3h7teAMhEDvkAJ3TjHscRv85hNF2BKwGbMnpALl/ohVa8eo56DwmKCF6/iAyPq10Jyl/8BlaZtw9wj1MlAbh9aZWHosCcouZg1mzYBSO1sbDP+CRsJQ5oN/z/3AWZ6eCdcuVRbD7xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1158.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 16:25:46 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d66d:c2ff:45d:cbbc]) by ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d66d:c2ff:45d:cbbc%7]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 16:25:46 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
Thread-Topic: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST
 condition
Thread-Index: AQHaeUn+dJXfI4yliU20QqCIuRLFXrE9rEmAgAACB7A=
Date: Mon, 18 Mar 2024 16:25:46 +0000
Message-ID: <ZQ0PR01MB1160EE942B57257DEFCBED32EB2DA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20240318-emphatic-rally-f177a4fe1bdc@spud>
 <mhng-abf741db-9f86-4803-b143-2948e9a099af@palmer-ri-x1c9>
In-Reply-To: <mhng-abf741db-9f86-4803-b143-2948e9a099af@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1158:EE_
x-ms-office365-filtering-correlation-id: d658c861-9d9f-473a-334a-08dc476810cb
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bNbMjE5MJdX4v6zuWVUqiUJwhi+Kka8srIijUUNFMyhbC4719VJtMAksD3xOJ4M0I6T8x9ljLzGqiX1L99IpWm+VA9SbuZVFM57mW8Ybx1W/sC6G2loD7iFhDPgP5zMgC+OXZ3mtL28cDf2eNU/B7LPG+4uOTOYBLI+71g+KYh91EhSyjCEAn46Ie/AXN2G7/TS0Ucy/LSI6YVU2xsqjJkc2cMw2AlZ3n5Q/LPr8SyLTtcTFWrt8JoGvOUT5Jn5EnpGmzZOO1cx0kT78jm+relgZx4GsqlbB8Mviyz22MJ15mxOJcZgbG7j4DE1vLXiCM0GCQcMkfC8kzUMTntXr4tsCbiZE2N/Pfh2u3+VBIN8BA4eheGIFH6Agvfq/BAr2Kc8mo3Nrcz8/XECRt+Vh+0DrBNP5mPgKxuq9PT3ab/AYKqyosqdtT/rl0GEIcYf4iHuk/Q2CYgGUvpFZVU0Drv0mGTWbPeZxtXfemWAekPFNi1adWLNwKdfE7GQkyseQJcnlCBk1sh6XxBi065+XiuSDQggi5lRS3XnDA7xtSJIPJLBBTKPJqD058UebNmjbFHDxioIecjzPNl9YD2z7Lrt3b8NLX40tDu0arze5fbnM2J/mC1txVrnwnX7u8LC2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUY5TlU1b1owVGllTTVMaUdPdU9tSVJpNW1IV1hBVWg3OEVySFpaeXVtelEr?=
 =?utf-8?B?WUVnc2F3UE1ab1FXaTBrejVxSVorOHFGbUNOM1RYV09INFJ3VXFmdFJ2S2sr?=
 =?utf-8?B?bUo0ZU91VTFndmg0ckIzVlZQc1Z2Q3BLSEdzNEJLRXRydUFjWXNIOVhhV2VZ?=
 =?utf-8?B?VHY3VVNTY252MFBZbEMzOXhGazhZdWNBWkFJeStsNlNPZlhPTjZ0b1ZyY1p2?=
 =?utf-8?B?ZW4rM04rRUlra3RwWkVkZmJCUWZVVko0MGZPV1VpdldQc3hsSTRKMWkwNUoy?=
 =?utf-8?B?eElLWW5WeFVncGRZYm5tLzBJdlVTUVQyeXRBQnVqTU9adG1hdlExRHBFMEcv?=
 =?utf-8?B?SVVqN3dBRWxhb1VTL2IzQ0tzL0wwTzdQZ2xmOGNyYVlwcE00NFZWZlg2UEt4?=
 =?utf-8?B?VzVpSlNJZThHdWtBekRPYVNHM0tJaVdGMDk1MEk5Qlg1bEFvc0gwUGhhVmRK?=
 =?utf-8?B?aDVTb3prai9vWW9iclBFWFNpbncyaXM3ZTZFMVBxRUthMlFkTkdWSHlkS0JH?=
 =?utf-8?B?bERXZzlSdzVMOHJQUnN6bVpMcWQxVkQ3MW9iU2duM2dEVFdhNUtEM3d3aXox?=
 =?utf-8?B?THpvV2xtc0x1S2ZrZ2pZV0M4Yk41RWNhZXgwT3JWbS9GNzNxRHhja09wK05l?=
 =?utf-8?B?Vy81UFhRSW9lVThoZ2QvU0Y4dHQ2U25yL05UQzRmWElscHhyZUQ3QWxST1N0?=
 =?utf-8?B?YitwWXNBSy9aU2FremwyZUNmR2dWUXQxQ08yaEhaY0ljTEhTRjg1M2N2UlJw?=
 =?utf-8?B?UUduaUpaNTRIQzVwVWZVNXlOVUMxRUNNaGlqQmVmbDRsdFp5WmZnL3NkQ0p6?=
 =?utf-8?B?ZWloUGFkaEN6bUR0bHoyd3pxYldrUnFkZ0ZOUVg2ZEIrMkI2T0RxSk9JdHlZ?=
 =?utf-8?B?M0ExdnhMM2NyeGdrOWZkTUl4UnVNRWNZNm5BK1I2ZXRMdzVUY2xnNWYyTnpO?=
 =?utf-8?B?QXd3dFVxUlNOaE9ZUTFJR0Z2b1JpQVZpaFIvTjV6YVpIZm1Jc1dHR0lDWmo3?=
 =?utf-8?B?bUhUaWZtcmk1MkNrdEgyR21JOTNXTEJSUVpOS2doVnB6ODdsam9nRTNjUlIx?=
 =?utf-8?B?ZjNCS2FUQkk0NzJ3b3FiVGUwNXlyd0g5KzBJOFRQdVprSjBIZDJQa1VIQklt?=
 =?utf-8?B?dGIzVTZONG1XL3RtM1Y1NVNNYnZ4Vms0ZG8xQklSZWkzNDE2bzNZSXZvYnhw?=
 =?utf-8?B?SzMzTC90bjQvZWp0c1hUWlQ2ODRqZHdjcm5ITUd1aS83aENhdlp0ZWZBbEFJ?=
 =?utf-8?B?S1Z3NUZXK0NabXdaVWpucW1HOXYwTnR0TFFLK2dmMXV4OFhlcWZuRkhIS1pV?=
 =?utf-8?B?YlNMSStDaUtoWFBZb1RMZmVsQ3N4cU9mUnJyRU9qQW9DSXgvWDZQOWpuUHl1?=
 =?utf-8?B?eWdWK0VYV2tXMlNpR2dmZ0w2VzllRDZXeThObXNiVVpjU0d0eHZJQU8yY2tG?=
 =?utf-8?B?cWVxWW1LaHYycWJTMUxGYWVETkRVTDBqVHVEME5sc0w4QnQ4WXl5dnpkekhs?=
 =?utf-8?B?MVhrS25DcXhXT0RLaUY2a3JiM3U4eElFUHNaQmRxdGZleWcvNWF2c0t0YXJL?=
 =?utf-8?B?ZE9DdmVJRGNkL2IwMFFTWG5JOTJlUXdtWE1nSDNlQ041UWlXdG9aclBreTFV?=
 =?utf-8?B?V1pVeDl5Nk1SN3RjSDEzWU0wdU1sbC90bmhHdW1YbjdDUUtRUC9qY1hORFdv?=
 =?utf-8?B?M0xtZUxBWFE0M0V4NDJBU0FUUStCS2t1ditOckpNMVhzYnVjSGtqL3hOaEdz?=
 =?utf-8?B?MWJ4YnN2SmVoTkx0ZjU5QWdZaGlRKzdady91UFFLUXZUWWpRN3FSRGxCWFFI?=
 =?utf-8?B?RmxuSUV0ZS9raUxqcWFlSmpKSytWVnl3b0dEVlhxcmVURWNuNU43aG1CS3Js?=
 =?utf-8?B?U0l6L1Y4bWo1cHIvcElRTHc5dW4xMmZCcEZLS3VlbE9DYWI3aFo2WEcxeWVJ?=
 =?utf-8?B?N2NyaE9OcmdkTml5dlRIblg4ZFRnV3cyenpDMXpVci9xRjlJTWVSSDRWWGhi?=
 =?utf-8?B?dUE4ZmtsVUx0ZXB1RGFPVDNGWG4rZHNRZ0QrcXdBVS9KclJ4YnFJcUdmMkZC?=
 =?utf-8?B?bjZveUlXaGxVRklDMkRReE84SHJSZlZzUlBFMTJCTGo0dzhQSXEyZTErNmZx?=
 =?utf-8?B?U3VUenB4aDVDK1pZUVlnVmM1OExIVEg4WVV4ckdyaksxanNSR0ZZUnAwL2NP?=
 =?utf-8?B?VlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d658c861-9d9f-473a-334a-08dc476810cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 16:25:46.3067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcXw+LfifQ68TlC4kIO2ofOdPIQyyucZjvKzsX4pJgh+xaCDmAwEVJWu2eXYDTLvHntCuQDSvXcK4EcpYX1IpbA8Jcg7dGGfqv1wHlwtL20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_092602_916363_CCA9D1B5 
X-CRM114-Status: GOOD (  19.74  )
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



> -----Original Message-----
> From: Palmer Dabbelt <palmer@rivosinc.com>
> Sent: Tuesday, March 19, 2024 12:15 AM
> To: Conor Dooley <conor@kernel.org>
> Cc: linux-riscv@lists.infradead.org; Conor Dooley <conor@kernel.org>; Conor Dooley <conor.dooley@microchip.com>; Will Deacon
> <will@kernel.org>; Mark Rutland <mark.rutland@arm.com>; JiSheng Teoh <jisheng.teoh@starfivetech.com>; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
> 
> On Mon, 18 Mar 2024 08:35:04 PDT (-0700), Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > ARCH_STARFIVE is not restricted to 64-bit platforms, so while Will's
> > addition of a 64-bit only condition satisfied the build robots doing
> > COMPILE_TEST builds, Palmer ran into the same problems with writeq()
> > being undefined during regular rv32 builds.
> >
> > Promote the dependency on 64-bit to its own `depends on` so that the
> > driver can never be included in 32-bit builds.
> >
> > Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Fixes: c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
> > Fixes: f0dbc6d0de38 ("perf: starfive: Only allow COMPILE_TEST for
> > 64-bit architectures")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Will Deacon <will@kernel.org>
> > CC: Mark Rutland <mark.rutland@arm.com>
> > CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > CC: linux-arm-kernel@lists.infradead.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  drivers/perf/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig index
> > 5060e1f1ea10..7526a9e714fa 100644
> > --- a/drivers/perf/Kconfig
> > +++ b/drivers/perf/Kconfig
> > @@ -87,7 +87,8 @@ config RISCV_PMU_SBI
> >  	  filtering, counter configuration.
> >
> >  config STARFIVE_STARLINK_PMU
> > -	depends on ARCH_STARFIVE || (COMPILE_TEST && 64BIT)
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	depends on 64BIT
> >  	bool "StarFive StarLink PMU"
> >  	help
> >  	   Provide support for StarLink Performance Monitor Unit.
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
