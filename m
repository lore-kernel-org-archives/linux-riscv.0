Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AE9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vp1Pr6aY8E6dRSjb9g3Q3Xc+gGAwse18FeCkTcAaYwM=; b=s5PezTvl/Jv7Xs
	KGRou2sULo/YBo0OSoE+SOaNOIs2JOubJzeyZEBG68m2KSLmksBxzsWedGPhxQeoOSfGgZHyv1Xqs
	AcaMM5FBzHYzYkiYsTzb0l6cWOg7pQhoMdABRxDA/tc/laaRdLuwkQlxAYjoxJEKVTzKiubUoDibg
	uCgcEtQNoHU8acW8+5MDq23WdcYI3rfZEiADhhDrEBTJJ9v0TuKIXSWRw6Fwvw8gon4/PLBKoVlim
	iEoPvSWC1fRRAB8aCWO2QKt9u8ZSI7vYzEXh1BUhxUlFNwa1c/qq/Cyy3qx0oJCUMqedcFPj81McK
	YQl923U9CaA3y2bn+eiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7dk8-002bHL-QV; Wed, 12 Jan 2022 13:32:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7dk3-002bGK-DL
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 13:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1641994363; x=1673530363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rWoGt7FmykwnP8eWxv1McLtq4rq/Sd5WYZ2tYwwkHuE=;
 b=Wr0Z0xioUjnSCi0EMjjEmpMt26TssExI7oCJIXhul7Mr3Xb9pliWB7Us
 H7zsA3LOBFMDmqd0HSHOVLvf4xQeUj/Q1hI2NiVPzeXC0WJgF++zN5CR4
 BO8Zs3/7FY0wZKeR+6dVfenMLm/D5CUmv7hS9xAtudRF+eP/QFgBkRWK4
 0D/dekXErqdLgWmWy/TFnE+qRW5Ai+XGghtZX61ZZZ0ZFYu70BNBy9XrK
 cHIbYriQPymg146EZ7C7dMcO4Bhm4bi118zzlKglLBevbX/pkrtZsDqKu
 TEawUGctdDRZAii5kQmqMti4sXOF/w7PxoAgrsIvOnV1/kRK+XzrHgBPV A==;
IronPort-SDR: qd9RI+JApMeBKOWVweSvtHaa10vyEEukGlg7/4ycFyFgtlP5rPYOVg03CxevI4qBOfJMa/R6ah
 6pUEuobrfB1Mrg7lSN2h6ZNsAUQ/zX7UWXrWzxeIyRVgN0VC+qKkCfjGupkgBv9XAWondFiDf1
 719lzNySSikfs+iGgW31TCe4SxsNr8m3pJndX3lSb/3Yg4otHJGY3VYDsozBNmlDBrCCG8cfuh
 bDT/HA8tgjcs1VcJQVlGwPAF+l5aXXHJYjTYOy3+iueAHpD6X5W/D0h9sN2t6fht1HkSl/YNQm
 sKNOTrn34h7dv4iHTNoCPojS
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="145184424"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jan 2022 06:32:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 06:32:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 12 Jan 2022 06:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbQ6NCzNYLOpDrjeE5CgHNfpMV6V3/4rbOBhFzE6oATNaHu5qqVdYPDXTo0PjSR4B1EIfv/+64R1VKqNFPZmk7tgBFBm6dBzu7XmLrz1jlpStutyll9Z7n0Lwp+WrcLyyQz+m96CA9RNSRgEWiygB88iofHUnmHB6yAFz8DOSWilLRgCXMbKS3OiugECTVd8aR5GJwHGn3bDo1e5MRtyxyboQL9nfKvhUanwGmLLtPyTmO+u1TE3JkpAPwz1fHll9QAh+uoHrS7ZOINVGHLadTvTEHlEaxydafmKZSEpJ7f1kzyTBgc5aTcy4XLUG/kLOAan+hJ4LbbJb2ncBlEs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWoGt7FmykwnP8eWxv1McLtq4rq/Sd5WYZ2tYwwkHuE=;
 b=ZRlPhubJ73Qs6UzUbyoQJr1AxNuUOELAmZP2Ao1g6JqKEh4px6LfpXBGM8cL59zSLMs7OjPnYzJf4X9uHM4au/XaThzJDZuIJL52iHQHBndM/VUpWPkfhzLSaxSmQeDyrza5geKvE0tGb4tEt9ohWpudQHxEsL1vjlAu2k1PFXn5Lqz+E+X3NCb883Z1pUQoNpQAcH+4DTNH/W6pL7SzzUk4SFEL/N3sGZnp4zukbGMuDp1Rj6wcB4fRP9G7ZeVROheZ1+qtbIfQhOVNDR5deTkDFomrMuFOk29uyBcM5YzadUZE1kuRIv/i/cAIR/CA1q99OBANOn7fLTK/1UGyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWoGt7FmykwnP8eWxv1McLtq4rq/Sd5WYZ2tYwwkHuE=;
 b=c3z0MGp76f5kodZRHOLktb72YQNS7tFNIHJuSwkhz/zcgAhhgTAQsye9Ur0uCbLdkftzlB436rKUGqUOcqEX1+OzZtf/To/xd8vSsrdjchUnpOkzSBFHsVRH3OxEnuEKevwfYjVOj3vaSehSMucZ3TdYAvQnXwfi2QDHTfI8RXI=
Received: from DM6PR11MB3770.namprd11.prod.outlook.com (2603:10b6:5:13c::24)
 by DM6PR11MB4186.namprd11.prod.outlook.com (2603:10b6:5:196::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 13:32:34 +0000
Received: from DM6PR11MB3770.namprd11.prod.outlook.com
 ([fe80::9572:79db:81c3:3ea5]) by DM6PR11MB3770.namprd11.prod.outlook.com
 ([fe80::9572:79db:81c3:3ea5%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 13:32:34 +0000
From: <Lewis.Hanly@microchip.com>
To: <Conor.Dooley@microchip.com>, <krzysztof.kozlowski@canonical.com>,
 <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <geert@linux-m68k.org>, <bin.meng@windriver.com>, <heiko@sntech.de>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atish.patra@wdc.com>
Subject: RE: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Thread-Topic: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Thread-Index: AQHX8ylHYgDeT78tpE6hCjWWceRWEqw2yceAgAlqgYCAH1at0A==
Date: Wed, 12 Jan 2022 13:32:34 +0000
Message-ID: <DM6PR11MB37703C8AA98A9498B88E6F3FE5529@DM6PR11MB3770.namprd11.prod.outlook.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
 <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
 <05d6a273-19f6-2147-75ba-1fff726a0f70@microchip.com>
In-Reply-To: <05d6a273-19f6-2147-75ba-1fff726a0f70@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aa82ecb-1c27-46a8-9e19-08d9d5cffe25
x-ms-traffictypediagnostic: DM6PR11MB4186:EE_
x-microsoft-antispam-prvs: <DM6PR11MB41865625FC1064AFEF8D72D1E5529@DM6PR11MB4186.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QVaCTXHZjRypIEpAEDsEQumOCrz1e2QdyRxT2+XFeNp+5Jl4hVJ6zw6sW5L4Ncl2TrpDfX55HsckGxDC/kygpDjyAITSn6n8CrNtAVUMdM/98nhFrvPIjksgpPbvS5TbC0WBWQOijid3byM3qEHlCHRndpf+SuKgpr+RD4lTYXSGQGFQIVVQ1w/V0y+tT0MMlqX5ZpCzcjYjtLWJco/UXKov82kSE45OPj9QoPfqaXeMFahFLlsMT19X0mjRMJmRKbon4R++2/esStdj712CVv3M1iMiWjay5sbDbRVyQ/yBjO9iu8CKA4NhtGrAp7oV0z48Wnc6DMTWCYA5Y0454hv/ik9BN6LYT9khq0F+Dpnx2dFM+w3s2f8wdrbaLpqK+90BMUzHFT3ziwAa7Y9UkSIWls7jmlNI8gqkco5z99z5QSXBvcpntOtmFc3LDadbxT6eFe/YpBJXlMDb2lXT6fj3LGXmU5lOklYHCJftSgdSD67WMAKp77Swi8jCwt+Qcx5cSGBbHg62rFGZObZla9HwTWAiviebCPqs5hU0f4tMStHx3uWPTZRQfoj00LCWgj2Uf3US/N0mohakyUChGda1KBmgxuUlqwLiDVcrJPSN7KTtQ0+SN2eoF6PKhb83EHVF4BZNuwDshm5/SRF37d2jz/amZtUyXkfb266zlpv10H9dpQDcHE8Axk8QBwrZsjdiJDmPCwJGXxjp0CETJ/MDjIDGXRl5v+r6E+1YTfg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3770.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(38070700005)(83380400001)(54906003)(33656002)(921005)(55016003)(316002)(86362001)(52536014)(7416002)(2906002)(71200400001)(8676002)(38100700002)(186003)(8936002)(66556008)(66446008)(15650500001)(66946007)(4326008)(76116006)(508600001)(122000001)(9686003)(26005)(5660300002)(7696005)(6506007)(53546011)(64756008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVkyc0MwT0dMcXlNcDhqTXhrK3lCOFgrZncxbXd0NGQrN2RIWnExSmo2RmNm?=
 =?utf-8?B?NkliUGVOcjJvTk43eUh6Yk5MQTJEQVp4SU5lZENkV3dRc2ZQUHgyT0Nkb3BP?=
 =?utf-8?B?dWxKbzllekttUDJJR1k4TWhpOEtTMDBIaGU5ekpTWnhyQ1c4Z3l4T2QzMysw?=
 =?utf-8?B?Yk45cDBWYitmeTlYZldWaWRsYzhMZ051Ty82Y2JtUUpNN1MwUE9TdG1YTXlN?=
 =?utf-8?B?VHVaZUVaam9QR2Jyb3A0TnRUVmswTm15bzFqdFd0V0NTU29lcnRTMWhVdmlo?=
 =?utf-8?B?UWVFckgrVWo2T2V2K0lCUnR0aU5sVnZNdTFwY3JHOFJnakJ3RFRDZXNDZExv?=
 =?utf-8?B?eG5BUUE1RmVsREtiT2lzU0xGUm9qWGpURHNTanNLNTR0V1VMUDMxaVRrQUxG?=
 =?utf-8?B?eU04UVlXTlJrc2I2ZWxMQ1JJNU5yMkJwTVBpR1VVSzgrbzBUdk1NamoyNm1P?=
 =?utf-8?B?ZUFrNHdRcVV5TVhITEJyNUJ5UlRWamxDaW5CNDdmVEg2dlBlRG5oeXdUalNj?=
 =?utf-8?B?SXE4cVVoTERITkxrWjkzSkV6WlZ5Q1JWbVo0cndiVjFTQzNUa1p2cUgyUXhm?=
 =?utf-8?B?U0RnbDM2c3AxQ2FNMVJqRWduQ29Xd0hjVzZxUmoyVStITFY3d2tCaHpJbmpE?=
 =?utf-8?B?YlFweDlwYkZpaExaOGcrTG1kbWVGenQ4S3hFU1QzTjh3RzN6QzBYeVd5U05B?=
 =?utf-8?B?akZjTmVFOW5CNSttTHhKNWZqdXdvRmd5ajRyRU5NY3k2d3YwUTZWT2NmYlN0?=
 =?utf-8?B?THJoWTNyQTlkTE84dWw2VzE2bHAyOEN0bFY3dmJmbDdzS005U1dQR2paVXZH?=
 =?utf-8?B?eW1sVE1vdVRjZTYvVGp4SDJVaXo0a2dudlBOSExTVEh3L0hoYTZ2YUI1MzI2?=
 =?utf-8?B?WFROL29TbHJMaTlRSzJlb0xVK2FIdnpZQzJzQk1KMFRHLzh3aVdQc0RVOVpm?=
 =?utf-8?B?MUxabys5NzhpSlVaaXVoWGJJcHBIampER0NweUdoOGNKcTFBMG9mRE9KMVRh?=
 =?utf-8?B?eUZQY0tOS25TaHZaSnRXYUVQcUY2TmxnOTg0czNIemlEdnhWcjY5ZkhxSW1K?=
 =?utf-8?B?ckNIYmNNMFJONGdqa3ZZNjZLRDFoUTlEZXlXVEJvMkFHZXlUejdJdkxTZm1P?=
 =?utf-8?B?bElMdCtjNEk1aGRXMmpRaHhIQ1plVC9VUUQ1a0RrSHV6OTdNQmF6YUFEZDBu?=
 =?utf-8?B?YzJ5OVNlYWNLVmlHMXg4S3NyNzlsMjZuM1V6cUxCQkZRODZBc0h0ZUdpS3Js?=
 =?utf-8?B?VGEyTkhDNzhHWC9QbVFZRG42TGoramNLSlVwb0VZUEIvZWx4MVpHOFdCckhJ?=
 =?utf-8?B?NGlkbUVKSjVGTlR1UWNId1F1bVJ3dmNncVFkYVJtQisvVDRqWTJMb2d4c1B1?=
 =?utf-8?B?VkpVMDMzK1VGVm0rVGtwWHE0UG8yV25SS0w0RnVId3VYUVNPQytqcXcySzAr?=
 =?utf-8?B?a2dzb3hBaDV3WlVlS05OZ2dYR3lHODdaVFR4MWJoTkdwUVpaaFZLU1plL2cz?=
 =?utf-8?B?NGxqRjcxM25rako0dmNpTjNhbUxYNlpQZDk1Z1lkVEFNeTZ3OUtnTk50RUdz?=
 =?utf-8?B?MFBHYWkzWjFJVHF1eGxJeE1CZG1QR3ZYb3FhUzlhMCsrQ3M4M3E4OHA4a0JP?=
 =?utf-8?B?ajFEWUs5aFIzUzZUaE51VmFhVnZuUXlnTjZIMWhiQjNxMk5SZW1EYXF6bElm?=
 =?utf-8?B?b2xkekpKQUF2eDZobHhGK0prd0tyWW9PYUVLV01ZRkVmZ3FGbHRLemI2SllW?=
 =?utf-8?B?NWs2WWYrZGVvNk0vUjR0dnlYNVBlODI5dnZlRWdEVlJoaFJHNDQ0YnA2cXlh?=
 =?utf-8?B?M1BqL1NIOHRwSWYwZC8ybFJBSnJ3NGNpeDJzQXprZVB1dzJTd2V5UThJcmZx?=
 =?utf-8?B?QUs4Vmc4ZTk5OUtTT012SFNybG5QZlloSXprR3FNUVAzOWJSZU56SWNXTVUw?=
 =?utf-8?B?TzR3cEJGMUpTWVg1SEhlZHhqVXhmWGxXQmhTTHE1N2JIaTdaS0NMaE1DM0Jt?=
 =?utf-8?B?UUx4YTlpS0xDQlVGcUU2SEo1NnpOZFpEM1JMaEUzTHBrUWc0TEtmaDdVU0c4?=
 =?utf-8?B?Z3pYL3pwZXVZYS9teFhlaXJXSWkxNitLTFpxSCt4TDAySGNkOVMwenZSY3Vh?=
 =?utf-8?B?QkVtTmREeDZHaWVzUkcxVHZyVEJudHpmWGtNdjdTWnpPOUErbTFMSERNZ0NY?=
 =?utf-8?B?aXFwdDg2OHJtRCt6U1hBc2V5WGdNaVVqQ3h2TklUcVByY0tpNldYaFZiM0xo?=
 =?utf-8?B?ZVZrTEVCV093VHFabW0vQmR2RGNBPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3770.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa82ecb-1c27-46a8-9e19-08d9d5cffe25
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 13:32:34.6898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHgIgKZJ5/Q7sARINwwV1Dx8hoI/9gyn97TPyGV6BZL6BtwlVUZZEPHmBHhDImLinUioWCx74NSUIY/Qgfx1qZvv5CuY/zfWG48Zo9c82JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_053243_556169_203E22EA 
X-CRM114-Status: GOOD (  13.82  )
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


On 17/12/2021 15:09, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
> the content is safe
> 
> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Update the RISC-V/Microchip entry by adding the microchip dts 
>> directory and myself as maintainer
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS index 
>> 7a2345ce8521..3b1d6be7bd56 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16348,8 +16348,10 @@ K:   riscv
>>
>>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>>   M:   Lewis Hanly <lewis.hanly@microchip.com>
>> +M:   Conor Dooley <conor.dooley@microchip.com>
>>   L:   linux-riscv@lists.infradead.org
>>   S:   Supported
>> +F:   arch/riscv/boot/dts/microchip/
>>   F:   drivers/mailbox/mailbox-mpfs.c
>>   F:   drivers/soc/microchip/
>>   F:   include/soc/microchip/mpfs.h
>>
> 
> Good to have the DTS covered, so FWIW:
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> You still should get Lewis' ack (unless he merges it)
Aye, it'll be an ack. We don't currently have a tree & would rather do this via risc-v than the at91/sam arm soc tree.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
