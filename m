Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0F3C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRFyfwKaKNc3WXZ0Dx390wajv4DOnjvSdwv3uQQuZH4=; b=cd58WvGQdd33UW
	+fgCqJvkLR2wEr4E3l/ttXBBiL0kDLCWuHkh/T8MEVGXawzaJRhba5rpGIA+PgRoQBTmOpEadVc1G
	LMFY2onJQ0sIVVkkBEg0dS8dsM+2y+qqP99wx9Gx1AaFYG2RhDpWVFDgAIj+QqomffGG/ghOmN4cZ
	UaJc8lqACB+GwQeZtlR+Dc2h95zj2P0OnXqxaSt447YeF2hq4533Mh10+Vy5G4wWjBKXoxttIhzA+
	ApgOT8hRUur3Cxq6yso26TQFPCggu1KFqrArLykOoFTMPPO0KJy5QHlWSbuRJ7BY7lxddVZFvfvni
	Y/Yg2yXkWXnXx+YgUPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Oal-009t4i-AH; Mon, 04 Jul 2022 16:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Oai-009t3J-AF
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 16:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656950788; x=1688486788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1UnMRv7eJEhDx6g0qNYRVZINVPizRWyqaoq2BOh5ffo=;
  b=1u50ZItMJkrO3mRsVm9fFiLDSjA/rxoAXHwLMERj6rjq7qPBNCb+KJVX
   vYG4xUVVq6qxAtTg0j5iz9LY8qr3yJaBAaXK0x7odPZzBL9a+53f+9qMR
   LHw+mDoSY7KyV6iLAtiO4CkJ+RtTWJ9Tgup/Ds7LRn8plz8xLG0gDIDeg
   h4Q5ab2PlXDBKM5xD2k32hxtfqLyzhQ04PIuiszEQN3vKdu3xPNFsXHr0
   tIO+Q03KeMkYs9QpaGSL1tTXN27esXxDXZUAA8mA31Kh2QsVEXLt788Qu
   8dImcVW2WV+xl6EXCDJi3fpK+EPAJlFiKPJjUeEGH1940Hx+tKNBi4U7q
   g==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="180678326"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 09:06:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 09:06:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 09:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOrY1t2Ak/3kgC9X1OK8XrTU0tlCVKzprtKnCb3fXhiM5ACtDK9KOUwZrZGixoi7TVgqsW3+HNEtaI9dCSLDpWsdIfYbUy8ld0PQj+Fw6m5yPTZgzv5e7Mb61z8apQsV9E0/0RGr24m4LTI3PxKUHGv1mkL8ySGSWVP/mhjWtUUyXA+XJt/nP7r+c7OroGQu0naEzReJ23wm/gddfaZe0B4LsJ5eUXSSgl3LKUiA91POGIKUnhp2qH2Y0jDC65JkQ3I1MEBZpq3lFzF6gVixPGsl3b9LUqcWmXGT1933p03r7eu1BPqOzwri51sgwkfARASlQG+BYMv0bahA9HaJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UnMRv7eJEhDx6g0qNYRVZINVPizRWyqaoq2BOh5ffo=;
 b=QAKBd1JECjxEM/UQfQwOD7WE0syPe+WY/yhIWzfJzlIgmDOKrvGD3xorBo6EzvwpcGlgvon+S5q4IoLhDJH34i7HTDHDMzXsuOEyz5YMwD5y8Y7R36mCknRd1iA0FVhwSllp12uipL12KsAAWDsQBnUrjAW4GSFFj2sNClTz+ngbZMuyFs3vz7hqPlMpwH0O4099jgTT0CZYx65/55+LA3UxdC9YI2aRyB1d7/TyCSKAvkRZw4Zz30cMpaG5f5IQ7V8MV6m6uomVn4wKlwwHQ3f9WGovxtzQAgVPjS6+dpW5C+L+LHDmGlkiOj1ij8rDoZPvesYUyVcG1Qh2Um+4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UnMRv7eJEhDx6g0qNYRVZINVPizRWyqaoq2BOh5ffo=;
 b=ST0S/dGdlAN68zjUzn7/JIfevQyQhuDe+XB8C9hLnGcpQSYJdFbqeJijf5JKpOTbO8mhAfoh/zWkeHv+xVW9ujHTGnSwRz2DJ1nyw2/9CEiSsvQXtVe/34NUD0MHcx93LnePRRx6ulmDfTDyLMzZF1CmUUVNl+MVpczZrVMbK1w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3002.namprd11.prod.outlook.com (2603:10b6:5:6d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 4 Jul
 2022 16:06:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:06:20 +0000
From: <Conor.Dooley@microchip.com>
To: <kernel@esmil.dk>, <mail@conchuod.ie>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: config: enable SOC_STARFIVE in defconfig
Thread-Topic: [PATCH] riscv: config: enable SOC_STARFIVE in defconfig
Thread-Index: AQHYgnfCdvU+bEluM0mRw/6y4pmM661YzsSAgBWsSoA=
Date: Mon, 4 Jul 2022 16:06:19 +0000
Message-ID: <69e185af-bf83-2841-0932-e5b676c82ee0@microchip.com>
References: <20220617182424.324276-1-mail@conchuod.ie>
 <CANBLGcxBSkSFSH=JqzY+CLoUap1hhRN+vxukxg0oxqUNu-NHkg@mail.gmail.com>
In-Reply-To: <CANBLGcxBSkSFSH=JqzY+CLoUap1hhRN+vxukxg0oxqUNu-NHkg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0db24bb-b7b6-4bbe-da66-08da5dd72215
x-ms-traffictypediagnostic: DM6PR11MB3002:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eXh+cp3XVhmmTlkU22zlKGrv6h68Otad98kcddmLxxoC7E3GVnTFoB9jKoRwu8pLQxH9xdtlvDNgesd8FCnO1D/Xr/S7/Y3MopzwGHv3vc2iPPH69mm1e+k0DGznkfS1zTmU4yhSWZavM+HpcOjQrvccrNmbhgiGr4gYIFMrKIc8maYx4iqZaCUqrB6RcrCKbatrW1ujwYO2fUmQ5oC68lkEOoG6d4aGICRcntugrdr9aHEHaARHWeARqNYQEfTQfhJstFtwevZlyjaANcADlrhALx+F3U6AORkMQpdI6WaYtIdWhaJ1eT1iUT63fhzIoBOtr9ZsQXtSqn4QQ4MkBKpMwdbURDovY76UqGHkObVCGx/Aefa8SlKIX91k7WLwFHWM/hlPAkTJRheIXY8e+FwU+1XMzW//+x1zsVmmgTm7g7TsF32M/gPYiNbo1QkpBrci/8gkenCn2YmraZmCitQfGxpVuaGLs6A67HQLh/18vB1PIgfK4lhCjSwvowF8TccMlPdp+llr3utbOdq+2ec6VYnvzLjivEOhC6eiCTND8zYU7bsvrfAFTTflkerOGPhngA4M3VBiUfkXq/VQEmm6kLOc/rsI1IH9doXoLwX20rGh3znrs6iL7EaJvQDILFE1EoVMIrmEWR/WeB0ukh3L3biaeqotMASa//Yzr8++H+EwgxNLfE80FtRJBWJYUh0mOeOCDzCV09p63UbcKOMPZ5HT+EHkGphKPNG/yUEUh2T/ZG9wwS+qxwGdkzuyfWX+CAcVyXK4cpkfadhheDanxWdWc2IHCVRDrryYjHJjvG+gL8bDSVzNs3h5++JZzsxx/klHwW2LisMfJEUL5KF2nGtP9uFR695uZ9pP1po62EKIWoND41PHOKXL5Ewm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(376002)(346002)(396003)(66946007)(83380400001)(76116006)(66446008)(5660300002)(122000001)(6512007)(66476007)(186003)(26005)(316002)(41300700001)(86362001)(31696002)(38070700005)(66556008)(4326008)(478600001)(71200400001)(91956017)(8676002)(53546011)(6506007)(2616005)(36756003)(6486002)(38100700002)(2906002)(54906003)(31686004)(110136005)(8936002)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHRpR05IUTI0eSswczJUbHBtWkxtMVBvdnBCVW4wS2pVYzJRSEJidXpjMnlR?=
 =?utf-8?B?UGdJajlJYTlHeWJuMkY2bkF3QzNWdHNZckdCUjliVFI5L1RuZmgxMHlwdFhx?=
 =?utf-8?B?T21HSTVBcy9ab2RzS1lFblJhVExOUlMrLzJUTmYzUUxVc2VIM1lQUVBObEgr?=
 =?utf-8?B?YUx6M2ttdHRwMFEvNENPTjNJY3dvQ0RCWjZadmpDeUxRSW9qNGMzYy8yUzU5?=
 =?utf-8?B?aVA3SXdkRkVtRmwyUzdHSnkxeXNTMStPbWRiaW5rU3QxSWh2WC90UXc4SlA1?=
 =?utf-8?B?U3lSNnhISXVWTVYvMTc4ZHBMMy9jemFUWWxGbHZFZjczSzdtNHVXZkZJNm5U?=
 =?utf-8?B?cVRCcUk2T3cwUkhudjdKbUhlbnhkVWZBeFk4bGF3cW5NUmVuSmNVZVpYU0Jn?=
 =?utf-8?B?V0tHWi9YYk5MZ24yeFZLR2xBRW1nREpXL2x4QkI3MUZqMGYzT1JlUHpPalJT?=
 =?utf-8?B?VFY4aDdZUkp6ckZleUpQQ0lvYWZWQ29mcDBGa1hXSzhTY1dZWTRvaGxzVjcz?=
 =?utf-8?B?SHZrOUk3aHM2OHIzMnNFdFdjMXRsS2ljTGxmNE5vUGNvYUFVZ01hU1FwRnlI?=
 =?utf-8?B?VEZjaU5jcmUvcW9kV0dDVzZmYVJVTEt3WUw5ZGZQOUxPV1I3eUpGRVJ3TjQx?=
 =?utf-8?B?OUhuYkNUVi9mRFYvSFd4UDF1dTRVR0orenZac1NuSnVmREJSMFNHbDdjRDVl?=
 =?utf-8?B?S0hNbi9IbGw4eHdVS2xQV3NzcW9ZNjlyTXMrbHoxaXNYSWdYNHdkdHBHcG9D?=
 =?utf-8?B?bld3SUs0WXZVVHNjc1FHTzM4YW1GTGFydk1abTkvSjNHWDNIczk0QkdBTE93?=
 =?utf-8?B?S2ppdnBBZHp2ai9Yem5vUVVuSytOVkhFZDJ0YU9DM3loc0hVazlyOUczczRq?=
 =?utf-8?B?Vk9FYzkwb2JxVnQwcExya2dnSmx5NTg3MWdhU1J6TXVLbjBSU2tXQWkra1FS?=
 =?utf-8?B?NWRNSm4ydFZ2VUFtUmRZeVYreE1YbVFkNHpOZVg5V0FnRGxXVGR2UGs0SzRL?=
 =?utf-8?B?bHJ2UFFENFZMWEI0SlMxRkphbnNnaThnNFlVanZ5NDVKS1kvY2hKYTN2M1hX?=
 =?utf-8?B?bklQYXUrUjRiM3Erd3FLdkRIakgyOVQvMjVjQnBsNTR2Q2JDZmRtcG01QVg2?=
 =?utf-8?B?dXdLNlVrUXdOVnRhK0FnRFZ2NDBDVk1zNnU1YXhPRkQ0cW4yaFRZd1lTRVNn?=
 =?utf-8?B?RmlNNC9BR29iOXhGeDJ0TmsxNTduTTR3N2xmUC9uc0xZeHZXc3lPV1k1ZFV6?=
 =?utf-8?B?bjRnTUNXOUV2QlZsV096bWQxSkI4aXhmcGRoZHBYMXpsNzBpa29jWXV5Y0w4?=
 =?utf-8?B?d2RYMkhuekZCbEd1Vmp2WGdsekNRM3dEUmMzaEt1T0MwVW0zZFgwZ1JjeHRN?=
 =?utf-8?B?U0Nlb1NLTUtCTHJabFhZT3RVcFRvM3hhQnVYZTFMU3lrSDRhMjcwNWlScnlv?=
 =?utf-8?B?c3ZUQ2FGV2Q1M1ZhRkZrd2dtTERaNUZBODVlVlNoeExKSDhpbFo0UDJkNmgv?=
 =?utf-8?B?bW1wUWd2c3RlQ3FqRXE5OGtTdk5xbk9VcGVubHc1OEhBR0daaW5obUV1bDBw?=
 =?utf-8?B?OXBTNElyVVl3OWlna0c0eGJHTzFZR256MWxRQVRCOGsrVVZmd05oLzVMNDVI?=
 =?utf-8?B?Sk9HNllIVk1HKzZQR3FncWFUNC9FcDRTOUlxbTd2T1kvQU1tR1k2SlRaY3dZ?=
 =?utf-8?B?UW1MY29ySTFhZEhibU50UHAvaW42T0JLV054VlhkUTdrdWU0b1gyNy9vazYy?=
 =?utf-8?B?d0o4a3JOT1E1a3RsNG5xeFo2c2FPRmhLejQvdnVkTU9RVFZXRDJRbVBaenVq?=
 =?utf-8?B?V0kzYXJ1bkFLYVV4YmtvM3J1UkxOMm9JaURLSDV6aEJPRXBkS1l6T3RnM1Ar?=
 =?utf-8?B?QURGTEpnS0RQOFdrOGN3cDFDQjdXSnJoa1RyVmxNU3Z6RUE4Y3hUQm0vOE96?=
 =?utf-8?B?UU9QTnlXb1hLSUNIS2pEYldPQW9TY3NQdVRob1U3bnZ4WVliMUFzeE9pK3Aw?=
 =?utf-8?B?UGg4cW5YMnIxSjJQcDZTMVltOERNZk9PQ2FqdGVtdkRBWTBqeTNhK2JxQlYy?=
 =?utf-8?B?Wk04ekVuRExVeVp6UmVETjIvOWtLREFUTEMzN294WUJlRERQajAxRXpuRnd0?=
 =?utf-8?Q?Er7G695y+MUF7AJD+yfeopDd6?=
Content-ID: <37B5934993EFA7409B3DC43CE7E46B50@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0db24bb-b7b6-4bbe-da66-08da5dd72215
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 16:06:19.7243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yvq6eGYhCBvBBnFlrqPn5eaTF/1uKQ3nY6sgZw6Yz6t0FLZhe/MtixxwvFSMiucn2vZy7Qsjq8hSp3x46pEDWkmb6i+cJ34tOn3bqhGFTdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_090628_389546_0F10978B 
X-CRM114-Status: GOOD (  16.42  )
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

Hey Palmer,
This should be good to take for 5.20.
Thanks,
Conor

On 20/06/2022 22:08, Emil Renner Berthing wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, 17 Jun 2022 at 19:26, Conor Dooley <mail@conchuod.ie> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> SOC_STARFIVE is the odd one out among the (compatible) SOC_FOO options
>> as it is not enabled in the default defconfig. Add it to make catching
>> dt regressions etc easier.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks, this would be great.
> Acked-by: Emil Renner Berthing <kernel@esmil.dk>
> 
>>
>> git send-email gave me an error that was unclear as to whether anything
>> got sent. Checked lore (and my inbox) but didn't see it come through so
>> hopefully this isn't a resend.
>>
>>  arch/riscv/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 0cc17db8aaba..f8d7d9527c6e 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -18,6 +18,7 @@ CONFIG_EXPERT=y
>>  CONFIG_PROFILING=y
>>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>>  CONFIG_SOC_SIFIVE=y
>> +CONFIG_SOC_STARFIVE=y
>>  CONFIG_SOC_VIRT=y
>>  CONFIG_SMP=y
>>  CONFIG_HOTPLUG_CPU=y
>> --
>> 2.36.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
