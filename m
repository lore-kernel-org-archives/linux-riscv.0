Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDD7CD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBUlCPC646ksjq2Vn95bA70w1eAjKGLb7aP9rs6/67A=; b=Ge1oakQVMYiESE
	j3tXPcL9h2GoZCo9N52U94vyEIiY5UN2iaDvpPbyyfrNL9FIKze8k0MEPewsiyMR2MkD3C2zZ23WR
	/Bnl4EklqtOQg7vBmkUkHJRGxl/eLPw3ILI9wA3scKEmzlio8WocAg850hZu+nUplQdOQw4gxO42d
	KaD7vaQYaVp238fu4wuyAiwnmLq8klvvbCcrVoSIGuBmFhlQkfAtn2LTlkCGgzw5TtNTDTVE+bwME
	5zxXQSF+Znpvx1ZKYxwQ6HpAaTFuCsyKuinMeFZxiR9310MyAVbQFtEnCmDbGbgqYHO3577Eh221j
	QCYcoXzSmIyq4YsxEHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsX2-00000005Asx-0cNn;
	Tue, 09 Jun 2026 09:14:00 +0000
Received: from mail-sh0chn02on20710.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::710] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsWx-00000005Aql-2gMy
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 09:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJwG9jCfeL6yxAJY5EpCAO+XA3R8SnAgG1f8zT82tk6xz+pTQlqdTjwCCJfhTpEqykNAHl9uTzYc1Z7uMpj+ls8ljzaCmtr0CXrZ8LWlcEph3+KvsLilBwNXNPJmHO1JtJ8wY+/Urm7VXDRz6PJ66RDpVQs32s1K6wltCRI7jaCezIvlZeosu2dyWG3CiTDjm6kD91ObK9okbIbHlK9zr7dG8gdxjyBoepRvZAsFMIrUH+wYLuDRILJRo4QnTO7lsUtwdfiePOT4IXprAn0RzgsbiTiFxoS61LP3mx0VnIizoFzGTrkuHhjDnDplJ2XFpvJ26k/+2t4zIDmcZbj/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82+AfVPcJ1ejgkuxD8IkmJXCk7yzXy+q4XlrX2WU518=;
 b=Uw2D/69XAotJADTZupTUPyVNWPCo5oDRtEiT+nkJIiovW9E2DMcrnrM2PVQ6rKxrQ0dtbhw6KokMkfLW7BQbOz/66T2tq/nH7ZxOfKuNU1rDDw1NFe5WGr/0xuj0K0MaWBj+nKkABHJ/SZZBfVMjeHn37J/7KmB7P14hiakMBxoioDyTFvAcBHsxHEM7t9lvq/n2Z+M91WJnqSzLQ4PD8PO/BxtMQacUPb3tWNrQK9mSFY3jeq/bdZB4cc1+hHeTUrQWWTCyALne167Mgkbtw1zZoAtV3xdtZpDo9vPXrOp+4iTdEp8glZwyi8jGlFBx+gUr0HOGrzP0szzyueLTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 09:13:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.011; Tue, 9 Jun 2026 09:13:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
Thread-Topic: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
Thread-Index: AQHc8x1tp2Au4C5gdUyj+dl+vOcD87Y0xL0AgAE1iUA=
Date: Tue, 9 Jun 2026 09:13:37 +0000
Message-ID: <ZQ4PR01MB1202592BD39A138751CE14F1F21D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-19-changhuang.liang@starfivetech.com>
 <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
In-Reply-To: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
x-ms-office365-filtering-correlation-id: 24535645-a37f-410d-94f6-08dec60763ed
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|18002099003|3023799007|56012099006|5023799004|4143699003;
x-microsoft-antispam-message-info: NfK16NmSn3k6wQLzyUxOG+4eiCTUlc4uqv5JIYEBBjT/Cc/WCUrr1DWdtUkGCQSbOoXDUyqZyR/C3yKYln5k8QvmdP4r3i7q6WaQrQ+ZS3N6hldXY6fjHPqppuWbUzvwhKx2zMPL5AQzCSu/6Pp2wV88zustfnpHzyneqEnkdxpElnoCYnEVVA6HRInsiqLYkOdtd5Km5bK7cruezLZ1O77w2uS/dpt5euxa8AzfM3c8R23jKric3KLsEYA/oc0W7/wGlWvo2DkMBpPt3NhxDh2gm/7Dwhe/Ir3kqskE+HiVwDMzq5AVCfcaPhP6V687B7X7AB12grBzAfjGMDgEekkC2jFPCS/sXWAM7c48urKShtMroNFXN6CgHaBDUqfDk+DNW/dkENfrNMASwKZCF8y1d8whE7bkVSJcvowK9gbnOReM4jbmb0FA9ZJnCW7eFgRRNIs31lXuxeeCJMusEbXD4Vqxldv1G9VyldotfcHRbiypYIGDNEWx/RWzFddI9LjmDG1iuz1nPHNbbSVQyNT6jJ2B92SJi4sVY5pgn3m09HElxoNodQCZrVr1/3hI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEgrSTAvdlMvajhmVVcvYlZiUDJjZDIxQjFNdFl0eTRRWVFBSStXM3grRkNO?=
 =?utf-8?B?aFBERU0wSkx6NXN6UEdseU5lMU5BekJUdk40YTcwQkJPVTVGOUlvVkR0VjQr?=
 =?utf-8?B?ZGJpRFl4ZTZqUkI5R1JXQTFNbW1PR1NNRGxSZGxOZWRkMXRNNXVOampnWmx2?=
 =?utf-8?B?S1U2b2tkWWt5ME53QTBNOTJhajJYMENVcWRGMjdPKzM0aE0vSnhYNmxmWnA2?=
 =?utf-8?B?WXRwS0EyK1ZlR2pjYnpETlBVWjA2ZkF5Wkp1TEU2elZIK0ZPYzl2bDcycW56?=
 =?utf-8?B?Rit5SVNxUVVwc2hwWmNyNjlBQnd5K2FaRU1hRThrZGlFeTFzckFwRTB6ejFv?=
 =?utf-8?B?cXhVRFNaWkJscWU1Uzdham9neGtwaDBsSEZJNnJwZnZuU2hmVDY2TmFObDN0?=
 =?utf-8?B?eis5NTVtT0YzV0lOREJOVUlDYURVeW9RWFFOUU5pdCsrQU9EdSsrckZhWkt1?=
 =?utf-8?B?NWg3K3VxV1g4M25ieExmaThrUCtNM21JQ1ZlZHlEYm14T0hjWS9JL2k3b2J1?=
 =?utf-8?B?SEtqZGordlBQSU1DODZERjZ3clo4L0RNSDdJYjNEcEV5NkkrWkpyVmRsNUhQ?=
 =?utf-8?B?a25GTUFkdEpHaVdpWk1vejM5V2hUd01aREk3MzA3VnR3SFhMeUthVkdaQnYr?=
 =?utf-8?B?VHZ5dVNMaUJXU2pZVlV3alAxTjVicnZOU2NkdlhTZWNQbEpQc2R1RFpRd3cy?=
 =?utf-8?B?VWg2WGtzMFdaYjF3dS90QWFLWDgvRkg5am5lUEtZYlN1S0VnbWxmSk9haC9Z?=
 =?utf-8?B?cWRYYkxyclhCME04VUhRUi80d25oQzBFNDhzMGp4czNjOFl4bXQ0M0cxVXhW?=
 =?utf-8?B?WVoyWEJDM2Z0bHdvNGNnck5EdTJiNUM0cHRNSkU1dDBsaGFJWGVBbGhhQitw?=
 =?utf-8?B?QTQ1eFVWYWsrSndtZjhBR1hmMC84N0VTOEV6Z0lIcitkSWMxcG5aRWJqODdu?=
 =?utf-8?B?VVRVZE1yR3JUamRvbFVMMi9KQUljT05qN1pFaU8zYXZKMTFvOXJSMUJzSXNS?=
 =?utf-8?B?WGtxbHNvSkJubzNFLysrdHVLVThPUnRGRDZ2U2xhQU9qME1GellKVHA5WUFS?=
 =?utf-8?B?cEp2L2lYNlZaZVpJbzRKNlZrcW1xRWY4eFR3eFJVTjR2eEFCOGUrYVVGLzRS?=
 =?utf-8?B?bEZsZnV5WDhENHBMdnU0VmVpZVRRVmRBd2d3MEFUVHRzdjFrYlIyNXYyMklv?=
 =?utf-8?B?OTRRei9TNUswZ014eCsyRWZCYXgrbm13ZkFtMkZsenhyZ3F4ZStNc0pCSHgy?=
 =?utf-8?B?bU00dExCVGwxRGtwRjFQejhteER4dWRvWEZlVzVGeTdxZmR1dURqenFRRmZq?=
 =?utf-8?B?dThCQnk5QURtMVZYLzNaQWVybG01Vm0rZXFyeTZ2a09OcStWUndEK3gwZHRt?=
 =?utf-8?B?OER4VkpUb2FqTDFuWUlERlBIakc2Z3hYN1VSelpKeURxMEdNSnpXOEwxNmpN?=
 =?utf-8?B?cGh5cDlPOEZWNFRIN0Q1VWd5aUl4QnJ2RlpuOEVWdmF3SGhWY1cxdm5aOXFE?=
 =?utf-8?B?QTFFNjhYVkFQeGlLTjBOY3lQam5xQjJRajAraEdmbTNhVTNEdXlXMXhkTEt6?=
 =?utf-8?B?UEloRzIrWXdBM2FiZXVEdTRVUzIvZjhwUVhDd0VsdWE4MjZGVk5oNXVzUExT?=
 =?utf-8?B?R1p0a2UvSjVlNDgzeHBtRk1OMVJXYjJUdkx3V0xsNEhlQXQvNXgzNk9rVmJo?=
 =?utf-8?B?UXNYeEhPdUMydzZnRkl6c1dSSmY2SXppNktSckdEdnM0Z1JQUmJ3U0k2azYr?=
 =?utf-8?B?dzlpdVY4c21FVGJEVnpjT2haczFrM0JvaFBWb1lDL1FxUExxM1llQVlRbGV2?=
 =?utf-8?B?ZjRKTXluYTBNLzFvbG5vdjBzazFtSzFMdGpKOGZJTC8rQ3psZStDb1JmNWZH?=
 =?utf-8?B?M3B3ZHNzM2hxc0pkSjBJRC95UjI5UDkvVDdYWWt6TlQ2aFhpWDlOcFZLY3lG?=
 =?utf-8?B?c2lLeTRPaFJhYkVSODdDMXdXeGZDZVN5Q1dTZ0hqRGJoVjhPcEt6aG1RMkxn?=
 =?utf-8?B?M2ttbVZtVDhUZTVVUXZJbkxvSjNvY2M5bWQxVDVoUWlKOXhiOVA2OG1qYXFY?=
 =?utf-8?B?REszdzhURDhPVUJCcW5TSlN4aEJzUm1aNTJxZGI1V3htZndPTzNuQSsvVzJ0?=
 =?utf-8?B?R3NBYTVxaHlXSkxGalZheDIwaVdON1AvUG9ja2lFMlZBUkhRR1VZM2pZRFZD?=
 =?utf-8?B?UlV1b015bVBZbDUvZE14RGdhc1ZYUDhlbjR1QVpHYithY2tidUxuNE1ONzJz?=
 =?utf-8?B?SEczckxuQkRZQngwUGlIMmlPOUZUMm41NlNqN2lmdlRsYWRtaW5LN0pSSFJ3?=
 =?utf-8?B?bHhZbHBwNzRCQm5LQW0vSGJVdS9ta1Myc2ZqUU5mVWZEdGNDNHB1Wjd6ampO?=
 =?utf-8?Q?7ztXOaLNRuCsx+1w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 24535645-a37f-410d-94f6-08dec60763ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 09:13:37.6523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cttVYhBY+VuevdqtMAyeuojwg2ZB9xkKjNeuPCKMeyPKJsMSZ+inlug6/hQUaZNJ7qGn2XqkuAFXP7lVFgDdnQNadFsTgx0WML7Y1S36bVV7aEB6yec1myap89J9w7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_021355_680082_95E46E7A 
X-CRM114-Status: GOOD (  15.95  )
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

Hi, Bartosz

Thanks for the review.

> On Wed, 3 Jun 2026 07:53:44 +0200, Changhuang Liang
> <changhuang.liang@starfivetech.com> said:
> > Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
> > (per2pok) pinctrl controller.
> >
> > Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/pinctrl/starfive/Kconfig              | 12 +++
> >  drivers/pinctrl/starfive/Makefile             |  1 +
> >  .../pinctrl-starfive-jhb100-per2pok.c         | 97
> +++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >  create mode 100644
> > drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
> >
> > diff --git a/drivers/pinctrl/starfive/Kconfig
> > b/drivers/pinctrl/starfive/Kconfig
> > index edc3b6d9c8d7..bf5915e0a5f2 100644
> > --- a/drivers/pinctrl/starfive/Kconfig
> > +++ b/drivers/pinctrl/starfive/Kconfig
> > @@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
> >  	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
> >  	  and interrupts on input changes.
> >
> > +config PINCTRL_STARFIVE_JHB100_PER2POK
> > +	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO
> driver"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	depends on OF
> 
> I don't see any real dependency on CONFIG_OF here, am I missing something?
> The OF ID matching is available even with !CONFIG_OF.

I will move it under config PINCTRL_STARFIVE_JHB100.

> 
> Same elsewhere.
> 
> Bart

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
