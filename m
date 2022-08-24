Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE54C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Fpj64Bv+SYh4OEliv30GsMSg1WAKfyoTZbKxZOzFE0=; b=SRWH2vIeRpCAm4
	htmYw5PY+5fGvuv2ZvjLi6Dggoc8eYzkN1q79KCK09BII1ydN3oOsL4M5xk9m1SB3jwosYsOuWkDi
	z3nkS4WJb0v9PadCODfekar1GbwAXDC9gnBumi/rDFTuhN83WCPzdiiiO4/DdU040xvzcRFmfFlwP
	rVa1ni0mVy6r86akzyoWBVvCLOk566ATooZ0DmlimySRgOQDQBh3A3Ryb8AoXWk93rgE+tLFobn4H
	i+xGxUXDmBA3SmCHJ4/vEJCK0XdqvcPuGu8HA61V4s6JDvGgfQytwVy11hS6TTm9Y8sJeSGAwhe1m
	rggghnOZqJWTm7d6r7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQn9r-00BtzD-OG; Wed, 24 Aug 2022 09:58:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQn9n-00Btx0-WB
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661335123; x=1692871123;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QIlZ8/UhnQGhKTJXTGKWR8gTGG6/qcPkgKzPd5wxjIQ=;
  b=iLCvNwC40+oMGyjwNev9Bzit4JFLDSNkPMjJaqMlBWC1m2iKemvCzk/c
   RJuK4rt7NzbVzIzpXdEH+mJAvLIkd4UxT/3uBCbFHcK5JfoibxG0swThz
   IlExJxug6CAh9N+9ak7SimI8hiwgk2ONFqvkvPGyPnCl6LivsXvbP0lgF
   +Wyv8KleFcl7S7YigoXRaP+OMYBpW6Q5UsKx8dpw/4q8tYDIR9W3boiBc
   SyZfyLHkGLP3MUakpNjHOOFZT7h4xfkuuRQdbksgBR7Ew/dRME8+bmoQa
   wmENJTW2F2LSafafYGssSBIm0ZF5VfLzPRaRIW//uaBh6hUmEHWTXqmNg
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="177673183"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:58:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:58:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 24 Aug 2022 02:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4oG4tFs6Ds6A/S+KEj+4tOTsI6AxJ0cRIJBxZN7bxNw1B2kqXWgpvSrW2EJfg3wAwSfOg4IvkXuv/JfeRv4AoaIFVASgRm58ME8Rv/bHoh80MTfn7kcPpn2Zaheu9mb3ccQrYo/E88UzEVqgJJLAMeWjPwig9n/kUZVdGK6JArti+zCu++TWn50M5KZBGoHhvuiYIDChH8WV4NAFkAdJx1Xm063eko/toKb/5Fa4jVMcZ8ituEWfgz8RmTyG3utjiEBlJ54Uo6l8YdOwtmYLAjA1IrkmXAoGrRTIElLoSAGfxK/4aPLo5ZN1uo4naKLepPANbhLFACFJ/i/yH9d6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIlZ8/UhnQGhKTJXTGKWR8gTGG6/qcPkgKzPd5wxjIQ=;
 b=WrrJkzoV80THc9mZcNQ1Uc6ANUjsSLi+HdrzFK5KzPHIZH52lSJ7sQODvFj4TbWA863U8ZQfQwGne8f6ffSDASYV2UTHnsBoOQZD+sFbNIU/iwCvVwXO9tXhQ7nbXPpI2pf8rPar837BRzbKcc+4AKmGIzqnG9t2k934jaGr8MraIKL/sovjrLd/45NjP+xqdRUVyGZfYsi/aeVW82PD5+QyWALhOYyKInYgnnbh+8wuUsZsmDhW9zVByR7lNifFmGD7tbs2bu6SBhIUsMv6DZgBxnvcMLugjetgQZMmSiHGBBMis7BmErqyifhuACriCc2a8Wbpn/Ay8wpgLc6pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIlZ8/UhnQGhKTJXTGKWR8gTGG6/qcPkgKzPd5wxjIQ=;
 b=spnIhYDsPyt1skTxxue1K2znVPYKudKOhfKtIFEsEBtz4+cvTFxYLmJa4tNLG9e0PMiTMFCRLI4+3OwybjSyFrcwKOzZo5D6NaNMbhLyiw+5r4gCILPrmH8dEcF1O9oOo+fs5xXIy1iil2yIMfGSqlxeORn6EbWK+i+MfI5AO1s=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by DM5PR11MB1564.namprd11.prod.outlook.com (2603:10b6:4:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Wed, 24 Aug 2022 09:58:35 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::b5a8:a5c9:beb5:70b0]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::b5a8:a5c9:beb5:70b0%4]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 09:58:35 +0000
From: <Conor.Dooley@microchip.com>
To: <christophe.jaillet@wanadoo.fr>, <Daire.McNamara@microchip.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Thread-Topic: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Thread-Index: AQHYt5IndXqzWMJbz0OfuNYZ1M2LkK290O0A
Date: Wed, 24 Aug 2022 09:58:35 +0000
Message-ID: <f76fb247-5160-61ed-a0a3-037d2f40d2f9@microchip.com>
References: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 473ceec8-d31d-4696-375f-08da85b735c0
x-ms-traffictypediagnostic: DM5PR11MB1564:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xISuxwolJHGP5MnWuWsEtmJvnXrVnxp/SBFMfUKhLyoCqe16aZXWKaf991HOJDHJuvzY/JIxFR9Hkh4p0X+oeR4j+LhyWGXq18UzOdhb8EdnY7PYW/bOIh/3JHdHqbmnBfXVtTgLPB+Ddu9YTL8RmYFtezyvt6AED/IIQ/i8sjEYLYnpnXgEh7K37vHOXStH3fjnRs4n0B2OCAX3P+m8BolpBdVKdOIZG1ZpCDaUXPopj6IWE6QErCoGrpIZpEDuST9SGZfLwxKvrGsiX5x5WmaFJyP2GNV3fDHS3JEABU+1GArdsyyA64YFtVYVaHhEaVwjDOvssU+WPekMXfJCCWIEWP+Nc+gKyaRZnVNaQImHhyHm3O/yGLSuaBTmyQtl4NdNPyta1wdvizCE6n99q3Zkv5O8qa0zYO5FJPspI9LPwg9lZG7es007JqUXzDtOSgwONqvNnn3ww0N1evmwXl3yQSNAQCZ4H6b0ju5JyeOqKXzci5qnqidImF34air/rv5GBaCKLe2MXCyd09MIylGFCZVO3IZs5bE9MOraJeSnFNjMPit5mlZDfNN/loVaR/Kbldgf+RGGHOSCrzaMNJ7fRSGLEi01CMvsormSNrocJm0yDDWYclHGDPG5LYjEqvJgONXSPo35XzARNuwXBix8SbeYEIJ+zjar8vuBgtiED2OFPNmeDqeMT6Qji3/6ZJndyRiMi/LmaRSbT/mu6scZyPU8ZDmbtEFaaSmzD+nBHRdpAwwUh+jpcPCmbRw55LxNqcwUq2rRmkgWKl07e/vPaqJorTu5xV4PueSyrHs5D22W3FOAZO6EK7XcdgCIi38skPH4JN2KMHAY+h3+abQD4NYyEN1wMrNqCDcB0k4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(366004)(396003)(54906003)(66556008)(110136005)(86362001)(8676002)(64756008)(66946007)(76116006)(91956017)(66476007)(31696002)(316002)(4326008)(38070700005)(66446008)(186003)(2616005)(83380400001)(6486002)(966005)(478600001)(38100700002)(71200400001)(53546011)(26005)(6506007)(6512007)(41300700001)(122000001)(5660300002)(31686004)(8936002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW0vYndIeTltS3lvdE9xMm5TblhJSmt2NVFwRVRqNm1yVGN3ZWNHUDAzUkxF?=
 =?utf-8?B?aXg2QVZIdzZDeGcvMkpGYk5NaTV0MWIvMEhiUU9UQkpLWm9KM21VV00yUk4x?=
 =?utf-8?B?cWkyU1BkNGI3MXFuOVRiSFB4b21wQ3lYejZjR0ltckVBTDdxQ1lmeWNpSmRC?=
 =?utf-8?B?cTBzQ0thR2RHM2FEeUk2aHVoVm90aDJkZ2FlT1F4aVVDaHBrRUZRZ3pyQVB5?=
 =?utf-8?B?ODdwV3JkNVFwZUlQQ2NaVHJLVzF0UWowem14T0JxTXB0Nmp4TElaMmtDblNu?=
 =?utf-8?B?dUJwMUNlalR0T1UyZW5HNXZjUTNsUnlqait6ZFlQMzdoL0FTbTFKUEgrc295?=
 =?utf-8?B?SnYzc1AwOGpYWTFBTFVxeVJmR2w0K2JOVHlSejRiYkRTRTVNOUFOOFNTRWp6?=
 =?utf-8?B?OVkweVpGalFOeUYxaGg4MkF6eXpyMGFZUEhlaitVV25ROTE5TERuQVZJUEE5?=
 =?utf-8?B?dTg4d2pIWmRHbXRtUklLdU9hZWhGMUpTYmZEUGIxSEhMU3R2KzRaUXNHMFVQ?=
 =?utf-8?B?Qi9XZzBIbzJhVmJJZldFNVBvMk1CeVdaVjgwVFEzc3poWVptTGdUWElXbHZ4?=
 =?utf-8?B?ODdwWEU3WlN0aFRsQnhsNXZOT3BsRGhUVkUwM2FpRnBhTXFVa1JsZHdnbndH?=
 =?utf-8?B?N3VLSGF0OEMzTVlmSVFSZEIyT1ZVVW1GR1hucnFZN0xnaXB0NmM2SFBia2Zx?=
 =?utf-8?B?cWRhbk1yZVJ0Q2QxWUNrU1MzVm1zR0c5RGsyNC9TQjY5Nmt5L2Y4QXNuQi9W?=
 =?utf-8?B?MnM3d29LdkhqUFhhU1hSdDNxbjBjY2xWK0RNaW5UdW4xU3lJY0ltelFFUUYy?=
 =?utf-8?B?ck9xVE9XVkRoTjhSbUJoQXlVV0VqRzZJMTVhUXdlY1gvVzZJSEpRbnBTNUZp?=
 =?utf-8?B?QVJUN3hkRmxUMFBhbGdncHpKVFVuUXNYaGZSeTdwQTc0NjVFS1p6bFI4VmU4?=
 =?utf-8?B?RnJTN0tlZmNTWTVDN0tzSmdCb29xMk1SSTErZURLa1FLSnM2K3JUdmJZY2dl?=
 =?utf-8?B?RGU4MGFybVZQOWtRam9XaDVzU0ZFNWlJTnRvVmlyRGpmUGpJRVVzS29GcllE?=
 =?utf-8?B?MXpCaStQNE1MdU5uMlJOYzVvU0ExcDdQSVhRZVllcFdGQXYxTk1GVEZYUmZr?=
 =?utf-8?B?ZjUzYWhDTTlPdzF2elVVVU1GYVJSLzkvWDZFbDhrTWtETzBKR0pTb3I2VnZF?=
 =?utf-8?B?OGZQSVdNL29sOXc2a3h2U1QyVENuMzl1U1d4NzFWYmI2b2gyK1FPQk5OZWRG?=
 =?utf-8?B?U0phMnFCeW43YlVCN2JkczVLZzRpYStBSXlFYnlWVzdBSThBdHdpK3hCZjdD?=
 =?utf-8?B?RzdCeno5STdGaTJ2VGRjZm5PbTNVem94YW9KdjRTTTB4bWU5N0dvdmw0djUz?=
 =?utf-8?B?U2plNWZwNjh4dk1keWZ4Zjh2RHZZeG0vV1d5a05pbzNwMnpzVVRvcDJGQzZ4?=
 =?utf-8?B?UlQzS211ZkROYWZHL09ydyt6bjhCbUNkbWZXVnIvT2dmODJKYW1jUkZNeVBs?=
 =?utf-8?B?V3NpYS84V0htUDBQK0xyTXhhTml0ZmpQenlMYjk4ckQyY2JOTkdHV0hydmhN?=
 =?utf-8?B?bEhncDkwZXJYb1JyWjFJdTlJdDhsOVlWTlhPdU9ndS8xc1pSQnNFQzgwOGM4?=
 =?utf-8?B?RjVKVXlWWGJHeEtnNmxTR0xvQXpvTGQwd2ZPeGFHOHBXcU45OHJjcWZ1MFMr?=
 =?utf-8?B?UVJJdFNmbVFud0c3Zjg5NTJIbVNOdE1uVS9MelFIbUR6ZUszWWVPdHJ6M3Ni?=
 =?utf-8?B?Qm5wcnpQcUk0VjliNnp0VFZzQXhZR3RlWWdHRXEyUlN3QWtyc20vRDJUSU1C?=
 =?utf-8?B?dlYza1owMTZHQ1NZWEd6NnBsQzhxV251bGdPWjBzcW5wOTI1UzBoeVIraG5M?=
 =?utf-8?B?UXNYdVhJZ2ptS0x6UE95NENsb05kc0xKdDF6eGRBSllJUE4zSmp6SHhnMnBn?=
 =?utf-8?B?SjM2N21vQ1RxMG5uejVMNmJkOXdwY1pBQmNpUlNwZjFwdUFVTnJzTlhxVS9z?=
 =?utf-8?B?MVBoQm94M2RUcWlhcjdwcEhkZXJJWFdTSm5WVlFOY2d4MjJJNVBuTVk5Snla?=
 =?utf-8?B?amFyWUY3bUFMNWlablV3Tld6clZjNlZ4a0hIa1NEU3BYMnMxdm5HVHBLSkht?=
 =?utf-8?Q?yWjZHQAPzXFWJ10civl4L2s/1?=
Content-ID: <3C793923F8F9AA47B4CE19A9B872C5A6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473ceec8-d31d-4696-375f-08da85b735c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 09:58:35.3176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ItCJZXqeW8rmOJPe+vZ+IDcJ4H3+6AhP0AXmwPEufbp5IWj+Mgfnz6Zie7DYGTkwWQPWfAYd1iM9EBOH0xd6e2RXe/hpTDouBsL3VVeRyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_025844_068343_CCB7D68E 
X-CRM114-Status: GOOD (  35.27  )
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

Hey Christope,
Thanks for your patch.

On 24/08/2022 09:18, Christophe JAILLET wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code, the error handling paths and avoid the need of
> a dedicated function used with devm_add_action_or_reset().
> 
> That said, mpfs_rtc_init_clk() is the same as devm_clk_get_enabled(), so
> use this function directly instead.

Firstly, I think something is missing from the commit description here.
devm_clk_get_enabled() is not just a blanket "use this instead of get(),
prepare_enable()" & is only intended for cases where the clock would
be kept prepared or enabled for the whole lifetime of the driver. I think
it is worth pointing that out to help people who do not keep up with
every helper that is added.

I had a bit of a look through the documentation to see if the block would
keep track of time without the AHB clock enabled, but it does not seem to.
There is no reason to turn off the clock here (in fact it would seem
counter productive to disable it..) so it looks like the shoe fits in that
regard.

However...

> 
> This also fixes an (unlikely) unchecked devm_add_action_or_reset() error.
> 
> Based on my test with allyesconfig, this reduces the .o size from:
>     text    data     bss     dec     hex filename
>     5330    2208       0    7538    1d72 drivers/rtc/rtc-mpfs.o
> down to:
>     5074    2208       0    7282    1c72 drivers/rtc/rtc-mpfs.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> devm_clk_get_enabled() is new and is part of 6.0-rc1
> ---
>   drivers/rtc/rtc-mpfs.c | 19 +------------------
>   1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 944ad1036516..2a479d44f198 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -193,23 +193,6 @@ static int mpfs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>          return 0;
>   }
> 
> -static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
> -{
> -       struct clk *clk;
> -       int ret;
> -
> -       clk = devm_clk_get(dev, "rtc");
> -       if (IS_ERR(clk))
> -               return clk;
> -
> -       ret = clk_prepare_enable(clk);
> -       if (ret)
> -               return ERR_PTR(ret);
> -
> -       devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);

... this bit here concerns me a little. I don't think we should be
registering a callback here at all - if we power down Linux this is
going to end up stopping the RTC isn't it?

I think this is left over from the v1 driver submission that reset
the block during probe & should be removed.

Thanks,
Conor.

> -       return clk;
> -}
> -
>   static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
>   {
>          struct mpfs_rtc_dev *rtcdev = dev;
> @@ -251,7 +234,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
>          /* range is capped by alarm max, lower reg is 31:0 & upper is 10:0 */
>          rtcdev->rtc->range_max = GENMASK_ULL(42, 0);
> 
> -       clk = mpfs_rtc_init_clk(&pdev->dev);
> +       clk = devm_clk_get_enabled(&pdev->dev, "rtc");
>          if (IS_ERR(clk))
>                  return PTR_ERR(clk);
> 
> --
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
