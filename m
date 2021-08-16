Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AAAC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 12:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310B263279
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 12:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310B263279
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0u9RxE5fN8PClcOMfdeyM4WfQHdlbjkARTxu0plQtI=; b=m8JaA1Nvnvv1Qi
	9Ll2adtxEPwgX6y8dlkz4ZBYB4tIUVvJKJN84mJ5J/LybObe43/S36kkbp6cFb7rS5+G+w+b3u5IF
	IJn7FKW/tLimrwNyeIMJ3igj84S/LTP37q+bhTYSLXVzuPmYm5e6U9MsYbRzc+VV6GM54s3ffKRwG
	dqEvC6BOAinm3qZf+jTJQTuRjnw2W8y7laPjf6DqTmCt2FAw1SigwOGYd6eF0phCSZaREj91PX5il
	0ybNiTCDilm5UDsBz7dD0KzTNRuL3XmNja/seqVdzBgDruyJs41xDVUNx8R30X0l0UlwHSsmkYFXy
	VPjxpzcW5O+85kB/3EXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFc85-00GzjQ-PH; Mon, 16 Aug 2021 12:54:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFc7z-00Gzi0-R7
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 12:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629118447; x=1660654447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OYLcIh/TLtJaPM2ac05g739DX7ZuUEUJFshrLsE/M34=;
 b=FGDH8xRgUfq1se/5zFpcdE1xOXa5w28DZU44u/y7hTdvg1JKBH/eEoiT
 7HFvY3CtZ28NIiVU+0hP6bEBGlbDsEKUZF5MRCn1mxVsakeuvwCgbrfKy
 g+mV6Vogesf51Vmyq6jOlZNNc3uvT9KIdzgfkornvteBIq6Dw5NomUKkN
 JHlqYuwNtrh6Htk2t98LWyWfGUtS17W6HGKlFxNb26xEPGyN0VUlHb8yx
 uF9QBNfXkPi2WhPX2XxGw/cp6uYtejyYkqY93zxr/MrWc+pD/vK3M8MkY
 SczKrYhOe/N677ntHpr41HIgpDbXYvIIGltBP1l8NcwJGJxlYjZYgXIjQ A==;
IronPort-SDR: PzWapLCzJfD8TTJCp/EaabWhg32ujco4u1oMyF/msk2P5fFLfKBYv0dVdNlVKejKo/DSV8TYvO
 XTIfkHDln9+re+/ZtwKox1wq+KTx/7M5JGC41a04XkQlfW72i0I023wiL9BZbhMhUWiQzKIW/0
 /IBTH7KZC3Pwi+hKHAZ22ZVWPgEvthtWqdoofcl+fSyQxM39eZ2AI6FLBBgACY0zGeQIl2q+gw
 s5TeQGvIopw6ztnWPM5NQKeLtiOrBuutPTUFdDkNlaPzzVzqzKPNOWkAootKqsrj/jt8MDC5Vv
 3HLHunUQLJZXgMUPMyMNa0Yh
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="140255809"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2021 05:54:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 Aug 2021 05:54:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 16 Aug 2021 05:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmhkRuatxTh6Ieb/9ioF/zwP2BxC1rDoyCbetTwB79bkDepQ8hZqsc9GLKYEYin96szrTyraI1Cnm7dmwdR+OYlCGLC7Gzc5ruDx9ku8QFHZkBpyUHft8g7fnBMlhCwXyrwe1oY+ImZKQxbBR31yxXtIrzVyNi53emgfr6Ii7z9Mp1vI0WhTDGHNC/ccun3ou+OdWbrThtB9iSW/EEgkgYofXhAi2xnx1fV2mjV5Z6+0NHfjjNtNdsyfAQsw33e28rPd5gieV+K1cl4HcW7s9fpkLLv6FEDjZ5QPld/cFlnSaC+I1pX4S5cWaFdCqUDVRfl7O4xv16aiQ3a2O2drdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYLcIh/TLtJaPM2ac05g739DX7ZuUEUJFshrLsE/M34=;
 b=AO+RvQkx2kraneuEE7G1ENHpr9cjyn5EGMVBCiN7/WhEDP6WLwenMxFCSLSXUj5BNbHpasL/ckO+s+GYE5FeA1ZmZnCNjInuWAgcfWkeANF+WFF9fYmLiDvDut803ndU0G9AOZSMgqvXboyau4sFPKTVFs+RTD5g8EJ1DF/sePIGNBSXa9KCHMqk45a7y43IPP5+ka5Lbrt03KErt2X7rKw/P8ZM4s55jG4bnqwk4DTOc/DBbmkY+vjf+IFWMY4P8jJ4DwZ9sqosV9TNznA1Kxgehm3p0fpT+EwAJJKp2ORfIWZmb/w6Sm8NGuF7rUzMo5s+is5JHh+zVCgsDoR+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYLcIh/TLtJaPM2ac05g739DX7ZuUEUJFshrLsE/M34=;
 b=V9xyAhjxr+T1w+1FFEadizlgnwET9ryRZDrmuAoa3ppjc2MPoJc8PRf7UTHLxNe2YrwqK0t+dQ9Uji0zXwGIQ63zwUo4FSBGWoOLg8r1YJsjTCJo1vN55Xk9JRfJWVZqVE9vZKkKeaaB4b4KUayL4I26oL/TWfvnxSWQUfc9QMw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2336.namprd11.prod.outlook.com (2603:10b6:300:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 12:54:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::e821:ccab:5d1e:a168]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::e821:ccab:5d1e:a168%8]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:54:01 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <Lewis.Hanly@microchip.com>, <Cyril.Jean@microchip.com>,
 <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v9 4/5] soc: add polarfire soc system controller
Thread-Topic: [PATCH v9 4/5] soc: add polarfire soc system controller
Thread-Index: AQHXaQoB8UnFxEPoMkOk7mwKbr+HRqt2aXwA
Date: Mon, 16 Aug 2021 12:54:01 +0000
Message-ID: <fdf085ef-9c88-ad3a-6033-f5a5ce48b7aa@microchip.com>
References: <20210624150144.11590-1-conor.dooley@microchip.com>
In-Reply-To: <20210624150144.11590-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4404a2-ac93-498f-070a-08d960b4eba3
x-ms-traffictypediagnostic: MWHPR1101MB2336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB233604FBFD3CE40635CB7BDF98FD9@MWHPR1101MB2336.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j+jnUcvTFlRDO9jvMQ9nBAF/XjnJLQSaUv2fFMV68k+vwSYwrL/pBTomeH1JADMYwv/m2CyXkK4BzYHQMp6/cHWAme+V9Gmca1cfH9WOZq6KQ6rYG/P64iRZwwg4OL69rXa9SspQj6VVvN4zUGgJwF6WuUTVP9QdKZXdQBqTKoTv5rlUzSqtlfW1OibU4ptBBcVLuTNanlkn9LlP0ohh8OhBmr6iUK7mFF3iPMmAJNYQVxsl4D6MA1i0ri9cGtD07EMgFgsuC7WUxb9vEisIEd0Aoa3/lt4Ch62P+XAeX1pciZVvzROZ6dgT6ZeckO9tBWSwQv+q1/0X+aXUm3iNGwNT3sbZbzXrxRSkbWeTwvKEqe+ts9N7/jhykSvlKvKAcy0ngvcUfZYRsqdNly2kuo2N5RbVjoQA3z59ZUwknawc53uz7t/3pUTFXDoreuzxCw/uph0gJnlnF3lLwXdKibPqd/QbzoNYdVrdKVr5DDezxEMdmGHfgz5jZRcEMRmzyUqVpwttxAipXxehbYTOXrxk2adcaHfuYiGiigqsVqOWbvcjW2sYfR5rmWhGgeSqMxo5L10f1ZGx0cLdFxtlzhDcTzL2FvtOKfCsNUSH+cKCE3qS8FdITmNXWobao2Kq2WQC8Ykcwbpsa5N9bsdJTH/2QJnruGxsJ7U6h7e5aqRcRvqK+gXCalt0zqdRfKuSyEKEFOnZ3k2LOPrTJXi0uRlPA9YeI8Ed+AG3/gi0+/6wDG/8Owcx3QyhJFLdbK/311bAo7z756hnFfUJf2a+P5XSBtW+BjSWJgd6dP1TQH0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(53546011)(2616005)(6506007)(316002)(83380400001)(71200400001)(31696002)(38070700005)(26005)(186003)(86362001)(38100700002)(122000001)(8936002)(31686004)(66556008)(5660300002)(66476007)(4326008)(66946007)(36756003)(2906002)(110136005)(64756008)(7416002)(478600001)(66446008)(8676002)(76116006)(54906003)(6512007)(6486002)(921005)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2JGaHU0L3hTMVhudm8wano3aEZDUGZTenBZRUY0d0dCbXUybUtRTk9tbWxF?=
 =?utf-8?B?U2dOSHJ2RmN3TGROZ0FDWjZOckNtZVlidTY0OEJ0QXlrSjJkNUFCNkZQOHZm?=
 =?utf-8?B?c1FDR1ZES2NLVUhWQ0tpbEtWMUtwdEE5eXVNWVVkQStrNUdmT29WVXdQVzNu?=
 =?utf-8?B?Yzhkc1N1anFvOEUvUUZFdlYvZmk3WlVEMlNQYjJKMXVxR2Y4NTBDaVhoZTJo?=
 =?utf-8?B?VnlsMHZoeFJRZlZXUjBHWGNQYXNYZVBNWHlEbzdvczNnZEhuWUV1VXkwd0h5?=
 =?utf-8?B?TXJBb2VvcHFkcDZEMmhMT3NNalRoL09ReUNqc2s3V3JZcnh3SWFlQ3g2YXdE?=
 =?utf-8?B?b3RNU1hHdkU5cVNEYmxkWjFJWHE4aXJhSVF5Y3E4SEdYR1hqdDcvZkIwMHVY?=
 =?utf-8?B?NFZrQXFPdzNiTGJmRC9ETzM3aGxZK2psK2pJWTU4NzIyYWYyb1poK1JualJ6?=
 =?utf-8?B?aDVXdFBCVi9xNGhFSnRLMEthMFExZ3pDN3V1K00zM1l2SkFaVm5MSU85M1E4?=
 =?utf-8?B?QXRvWkkzMmZSV3dBTVJydDhQelNEOEd0TU4xcmJYeSs3MFh0QUZDTEJqVmhp?=
 =?utf-8?B?K2Z5NFQ2NE9zcFlhdXFQVjNJZE9KNDl6NmpLcVpiR21WWm1PN0Y0OE4yY1ds?=
 =?utf-8?B?NkFZckU1VENJdEkwY1ZvbWgwSCtZcmZ0bEluM0hacHV1bmd0cU56bHpsMkVO?=
 =?utf-8?B?Vlh5UGRqZmdKU2c1SWFuUTFOdnA5c3VlajlVRVZOM0NDRENFQ3VtaE5KbUpJ?=
 =?utf-8?B?Y3FFSDR3NkxMT2U0ZkhsZk9jbjJGeC83T05Ecyt4UU12L3MxNml0NDdxYTJL?=
 =?utf-8?B?YUdWdVE1WmdsUDUwVnlmYjFicUpLRTgzOFFVRjhpRVo0RGVPaW1hZWpmdlN2?=
 =?utf-8?B?RnJwNEF1VkxhU2NlaDVpaTNpTndjcjRySS8rMURDN3BJWWJXWXIrNDVTaDJK?=
 =?utf-8?B?d3lRdnpiV3ptS2xBRGhoODFpUlBOSDJrNFc1MHBsTTREcnBCbS9qdTNyamhi?=
 =?utf-8?B?UzZZQXBuWkhaVTk4NGJua2tiaVNJZmZJR2g3TFByMHBmV2xVb2hsVVM3SFZ0?=
 =?utf-8?B?NllKYTZhRStYRTBoMFRvSDJXMG44aXN2THZYdEdSSkJJaFFhY1FrbXR3YStP?=
 =?utf-8?B?T29BMDJiNE9oNjNPMXJlMnVvU1dtTGhFZ3N2ZE9yMDdnazEyWDNPN2NCd2p1?=
 =?utf-8?B?ZEkwVU9KTlBNSzVmaTFmeXFGTjJQWFlLc0NTWFBwWk91SjJtdVVvMnU4UDhk?=
 =?utf-8?B?TnhhNS9VaVdHUzdjZW5XNWE1K05FWW05LzZvSFR2dVltd2FYVi9zeGp0WTJs?=
 =?utf-8?B?b2V4bDE5VXZ2RGhXejRFTHNTVk1FQ0VxZ0h3UGFqdjlZSVpveGJtT3JNZlEz?=
 =?utf-8?B?WmdHQitaTWJxOUNnNTYyRlZub0dZS3ZjUWIyeWZwZzMwK1lRV1doUlBPV241?=
 =?utf-8?B?UThxZXkxdGdwRXhSamRxRkpidmNFNTN1Q2JpeHdXcTd1NTRrdU04VFVKVHgy?=
 =?utf-8?B?R1hrMUd4NXJvZWlBVi9yWk5SeVRTZlIwVUdYMXhybDJGclo1U2N5ekZFSEtE?=
 =?utf-8?B?ZU9jRHBRTG5KdEZ2Y0ZicERocm9IdGI3S1BPY2MwRzdOYitaallhSG1XZm4w?=
 =?utf-8?B?S1hmODQ5OXNvV0JiTXQ2Y0NRMm1KYUQ1L21sTjNmMmdCWGUvTlk4S012Ynpy?=
 =?utf-8?B?MU91d3M2LzBkM2VEZnhEdEtUc0VMaVJtQ2N5SStWSWE3VlRmelNGTXlTei9I?=
 =?utf-8?Q?S637/hlnW3nkR3JXO8=3D?=
Content-ID: <0BD50CA77B548F4D9D6FC322624B2C8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4404a2-ac93-498f-070a-08d960b4eba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 12:54:01.2568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAf61PIxysWFTmfPDq1qvr/mM6GcqlAkHJczUUHR2qi8EulEylldozgPpNqf/kZpg3DBkOT6CTaYcinPlWYuq0VpFwLXl523UHScGeYfQz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_055407_943966_5F232DA5 
X-CRM114-Status: GOOD (  22.83  )
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

Just bumping this, rest of the series seems to have made it into 
5.14-rc* via the mailbox tree but this patch did not.
Assume the lack of any approvals caused it.
On 24/06/2021 16:01, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> This driver provides an interface for other drivers to access the
> functions of the system controller on the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/soc/Kconfig                         |   1 +
>   drivers/soc/Makefile                        |   1 +
>   drivers/soc/microchip/Kconfig               |  10 ++
>   drivers/soc/microchip/Makefile              |   1 +
>   drivers/soc/microchip/mpfs-sys-controller.c | 121 ++++++++++++++++++++
>   5 files changed, 134 insertions(+)
>   create mode 100644 drivers/soc/microchip/Kconfig
>   create mode 100644 drivers/soc/microchip/Makefile
>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index e8a30c4c5aec..b33142e020e0 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -12,6 +12,7 @@ source "drivers/soc/imx/Kconfig"
>   source "drivers/soc/ixp4xx/Kconfig"
>   source "drivers/soc/litex/Kconfig"
>   source "drivers/soc/mediatek/Kconfig"
> +source "drivers/soc/microchip/Kconfig"
>   source "drivers/soc/qcom/Kconfig"
>   source "drivers/soc/renesas/Kconfig"
>   source "drivers/soc/rockchip/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index f678e4d9e585..10cfdcd972c7 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
>   obj-$(CONFIG_SOC_XWAY)		+= lantiq/
>   obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
>   obj-y				+= mediatek/
> +obj-y				+= microchip/
>   obj-y				+= amlogic/
>   obj-y				+= qcom/
>   obj-y				+= renesas/
> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
> new file mode 100644
> index 000000000000..eb656b33156b
> --- /dev/null
> +++ b/drivers/soc/microchip/Kconfig
> @@ -0,0 +1,10 @@
> +config POLARFIRE_SOC_SYS_CTRL
> +	tristate "POLARFIRE_SOC_SYS_CTRL"
> +	depends on POLARFIRE_SOC_MAILBOX
> +	help
> +	  This driver adds support for the PolarFire SoC (MPFS) system controller.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called mpfs_system_controller.
> +
> +	  If unsure, say N.
> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
> new file mode 100644
> index 000000000000..14489919fe4b
> --- /dev/null
> +++ b/drivers/soc/microchip/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
> new file mode 100644
> index 000000000000..b5c23cb5df2c
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip PolarFire SoC (MPFS) system controller driver
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_platform.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/platform_device.h>
> +#include <soc/microchip/mpfs.h>
> +
> +static DEFINE_MUTEX(transaction_lock);
> +
> +struct mpfs_sys_controller {
> +	struct mbox_client client;
> +	struct mbox_chan *chan;
> +	struct completion c;
> +	u32 enabled;
> +};
> +
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> +{
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&transaction_lock);
> +	if (ret)
> +		return ret;
> +
> +	reinit_completion(&mpfs_client->c);
> +
> +	ret = mbox_send_message(mpfs_client->chan, msg);
> +	if (ret >= 0) {
> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
> +			ret = 0;
> +		} else {
> +			ret = -ETIMEDOUT;
> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout\n");
> +		}
> +	} else {
> +		dev_err(mpfs_client->client.dev,
> +			"mpfs sys controller transaction returned %d\n", ret);
> +	}
> +
> +	mutex_unlock(&transaction_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mpfs_blocking_transaction);
> +
> +static void rx_callback(struct mbox_client *client, void *msg)
> +{
> +	struct mpfs_sys_controller *mpfs_client =
> +		container_of(client, struct mpfs_sys_controller, client);
> +
> +	complete(&mpfs_client->c);
> +}
> +
> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_sys_controller *mpfs_client;
> +
> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
> +	if (!mpfs_client)
> +		return -ENOMEM;
> +
> +	mpfs_client->client.dev = dev;
> +	mpfs_client->client.rx_callback = rx_callback;
> +	mpfs_client->client.tx_block = 1U;
> +
> +	mpfs_client->chan = mbox_request_channel(&mpfs_client->client, 0);
> +	if (IS_ERR(mpfs_client->chan))
> +		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
> +				     "Failed to get mbox channel\n");
> +
> +	init_completion(&mpfs_client->c);
> +
> +	platform_set_drvdata(pdev, mpfs_client);
> +
> +	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
> +
> +	return 0;
> +}
> +
> +struct mpfs_sys_controller *
> +mpfs_sys_controller_get(struct device_node *mss_node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(mss_node);
> +
> +	if (!pdev)
> +		return NULL;
> +
> +	return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> +
> +static const struct of_device_id mpfs_sys_controller_of_match[] = {
> +	{.compatible = "microchip,polarfire-soc-sys-controller", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_sys_controller_of_match);
> +
> +static struct platform_driver mpfs_sys_controller_driver = {
> +	.driver = {
> +		.name = "mpfs-sys-controller",
> +		.of_match_table = mpfs_sys_controller_of_match,
> +	},
> +	.probe = mpfs_sys_controller_probe,
> +};
> +module_platform_driver(mpfs_sys_controller_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("MPFS system controller driver");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
