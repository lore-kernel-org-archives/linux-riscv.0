Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE50C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 05:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQT0aeXHIgRs/dQOpWydRG4lszJHHraogfxRliRC3S8=; b=YTz6KJ7eky3KrV
	qvk+sTMkqAOVoa0l1WAI+eVSXyo6wSNnBnGNT6VXqxaGazH0AE79bEyfgkKHNORzSqdS3x3ScV0Yz
	er9MITrfw/aUwLItKwLrJSW7up9eLf15QtcGH9xXulEwl5jeeUtT5DB3022GHFWsQgJcgg4WxzwpF
	GctS/F64TWBtEaq+8MgPPs+MBxYhBU10YmL58xJ5qm1Bw+CVVcO8HfElVs+gri9DJDdHxDEc68Rm6
	YAnzp/ISdxKHOyhGZI1OcJtnBc/F5NHAGt+AtMpUHvQdOAw7NwML3NhsCml5Noe2yM5S5f8xiwycS
	r3hlqc7ax3qhIaxkAQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8xg6-006C2f-AK; Wed, 06 Jul 2022 05:34:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8xg2-006BxB-AP
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 05:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657085659; x=1688621659;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l7Uqq+ZoqCflhiQhn+WZjtwKYnlVmFqFmVe3PEqY+d8=;
  b=VnXDLCRnY+RmoBFYMkRavPwrMMmx4Iv1XEO/mKKdwH3PN1QSULg9J1i0
   ny62GQSGrQkgBQw1gIuR4ig69BRPZSCjhpAaP0Hmjeupw/vBKeg1A9bTO
   kepNVh5Yk7oJ3hTYP8ObJz2l6sWzjZNNtr5lwkT2BnM811y0ILRArAWQs
   YNeocuFnjMs6i3pQxSsXYYerSyn3Lmvf5UDk32yQjM+GL6ZhatsDEW+7S
   GzYxATij0wfJUnp+BUyyj3J7KdJ2agCUb8Xcu/I+YkVKBC90YG5YmTy+s
   1djooxties09qcJKkT1jKJKKvy8G5rtTSlEFqOUvYTsA6JlyBLAwJhNlf
   w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="170942161"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 22:34:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 22:34:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 5 Jul 2022 22:34:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqn2QZJHA7NlqRgLUg40u2MLpU2lKp/2IEGoRjehfgGEP1l5fllLfCHUxyWPQY34G9EtP5XEype174ydmhouTnX9m8rX8xmzMXRMmxyB8wfEICNRkkfECnWBs/p4OBCpLqT8fkN/VxGQO8lF0DdhQOkVA00+F60g//XxSpBhCEqipivVOdnun//urJtGPiSoYuKOjbaBtayGAxyyNYNmXjmzeF4yZIoB9+y9tCzEXX51sSAIKkDU4hQCsmEtJ9qATtoXjZlgkTm8eJlAMn5HcP2YDjBkramoE9nxjAGaoLScIWQDIK/21/1/O4W+mFjI7hdPA1zcw6I9BqXGANIo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7Uqq+ZoqCflhiQhn+WZjtwKYnlVmFqFmVe3PEqY+d8=;
 b=bYmEAy36HnYi/CWh7Ry0fIwbhwCP/2mZ2F9rYUwmXatuCoa9Ps4SxLdsA+NJEk2sp00Q30K/aMo9EJE9aXEHVenPczaJUjgrLtgwxhOgUZ9Yaf7D+0ijf8qAn0OTlioz6D/bboGqEMIqe/wsJuEbAvrZHBPdfXIZWUaaeH1gM6KVDu2+H8yzPiY5n/8fpNvGqfs09YaDZqFUNAfDIKtEtow7vhvBn29vzVTQF5Ld8iHJ45iQNvG0EYGhm+X6ouKA336FFC5Irne4Zul+YhLlGzkQVkxBEx98yXP5SHlhatgoYnbCha+Vt21IEzGXdt9bX0MljRLuExGOee4lsJvgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7Uqq+ZoqCflhiQhn+WZjtwKYnlVmFqFmVe3PEqY+d8=;
 b=m8C5dheK6Ar8vq6vYL994HGXbW/jPRxUWP1XLkdJ8F2mviyx1t6QvYKtNXBneQUGtDjc/m1y1q9L0csrMNsh5Mh+DzuGKPJP4k7R0P2yk+qeut+GELuYix0oIRcq/SBMT9k3lWeiCkdBshs/Slg/CybXSAYJVXG4VChGRkccrSo=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by MN2PR11MB4303.namprd11.prod.outlook.com (2603:10b6:208:18b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 05:34:07 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 05:34:00 +0000
From: <Lewis.Hanly@microchip.com>
To: <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <Conor.Dooley@microchip.com>,
	<palmer@dabbelt.com>
CC: <paul.walmsley@sifive.com>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Topic: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Index: AQHYkHYQCAXtENkIrkiuOdPJtyNDq61v48KAgADvTYA=
Date: Wed, 6 Jul 2022 05:34:00 +0000
Message-ID: <c703fb7d6027e31263e280ab26ca28233159603f.camel@microchip.com>
References: <20220705134912.2740421-1-lewis.hanly@microchip.com>
	 <20220705134912.2740421-2-lewis.hanly@microchip.com>
	 <7284c221-8438-63e7-5ed1-bc0a4a36cc75@microchip.com>
In-Reply-To: <7284c221-8438-63e7-5ed1-bc0a4a36cc75@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa99079a-ae07-4456-859f-08da5f112185
x-ms-traffictypediagnostic: MN2PR11MB4303:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N62hhGbEKAAPw2LknRHhcEnsCGPnF6xNEmv/b4tIOXZ7mnzWjKCnWjywJLVbcJU5hnSeiLELSNDsgt85MPbRtBdd+52oIBz+lg1vtt8o/aQGI6i8UPYYbZ/HyiBpKbR0BDYsUn09gbjPQUNWGEdFdWV+LSPyTFmrxhykSr20xDRcAyHEfU+Iym+O2CICIqSqeEgYAX0iwUsQcjS5Ncfpza7I/aiRkhn8ATE/8N4ye3tMA4xbq2I4Q2/1vXrtjL54kr8WKy9rbDgL/KdJ6cUgRAG9TXJxbeXNQ8Z7MOOjT+4vLbcOAaMJOh6sixNbrvCIOLIvL+vF9OUa+gSH6AGc2ZCvzDbu0ytPNn5zBeLk+pBj+AaBCohIeWTxyXRVBoN1AdozsCk24eXumt/IvTDRtV84SW+MO9F4n3sOUZmnpU4BqEY8WyVylHRWW6lzeyc1Ffs5Td6CZ16xANE61XYsiI4IddRDwHlx58UVAcqVybSC9Venm9CCIy4KYsxxZNInI5HYUs2JLMEL1q90F9GiBA4nOQIQ57f4qw3dFa/DV6LHFuh8ak3/TwUjajy9E7ugf5VGt/D+7Id+6IRn4YPNAc/1Svp6UDsKUoQf4XZTYQr8SSrzKSnvkbPU1sN1sN+6AWMAyPz04M3c3Lq/JtwoSo0KdKu5sgvfLJ9xtGoR6TKLEIy+OoXgbiTKy/ZMJpPprdTvem/ue9lwhat5EBi4fb7S+ekIjrANDxdGfeP7U5tbNvQ+hq/wDdS5RMEXkUMvX25hmyLuRbtu6Rdsz4tVShGMyxg+hh/UW/0R/lq9ib6sf1xxw0OyxPpPTq6sDcqL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(366004)(396003)(39860400002)(110136005)(6486002)(26005)(54906003)(6512007)(71200400001)(186003)(36756003)(316002)(83380400001)(107886003)(86362001)(2616005)(66946007)(5660300002)(76116006)(2906002)(53546011)(478600001)(6506007)(8936002)(30864003)(64756008)(8676002)(4326008)(66476007)(66556008)(38100700002)(66446008)(38070700005)(91956017)(41300700001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dktnczdlL3Nxa2NnbGJwYWhrcmJicit0Y3p3OTZJR2RlUkhST29aWm5IMVpN?=
 =?utf-8?B?NVNadnZFOWNtUnJJNzMydUVPVmlpdEJvNFFUamZ5MVZUYmVjRXU1czd2YWIz?=
 =?utf-8?B?Q3Z1ZkhUZUVXQXdKU3l0WHRoTWdDZk9lKzJ2YWtKdE9aMW1xQ0J1YkxVUDhN?=
 =?utf-8?B?SmlwVUJiVS9hNjVpbEcvNkRsNkMrWU52STV0ZjAvaWRtTUJwaTk1d29ISlA3?=
 =?utf-8?B?QndOb0VJOXVEVjB5NVVSdStWTnA1dHE0ZkFEM09ZS3VoRnlQY3JTT0NFODFv?=
 =?utf-8?B?VkVMZ0FqRldSTkNBRGMwaGlOVHlKWDl3U3lzbFZCMkNkdDJXQ2U0STgrMUht?=
 =?utf-8?B?ZnVLdUpKK0pWVTdXODZKdWR2YjBSbTB3WVk2M1FmdUF3YktXU1hRbHBkdzl2?=
 =?utf-8?B?bTZ3eWxRcUFuRjdYUGNVWCt6OEhXa0tHZGlScFRpWkRCQ3lNZWc1TVIrWVdq?=
 =?utf-8?B?azBFT2lrQ3NSMHdBamdMNDZ3MXNQWnhKSUdxODdLM1NTMkwyYmlTVDZpb29Y?=
 =?utf-8?B?MVY2Zzd5NThYN1JUa3MvYWJhekcrTk9JTEt5MGxjMk84U3FCY0RTK0hQQzAy?=
 =?utf-8?B?UmtHaHBuVUUxREV2Vm5QWEJqSGUvSlVDUTgreGpUR0FoUXY3VHZadXNKMjZZ?=
 =?utf-8?B?aXl2Um1uQ1N0QVk1WCtULzE0OWFYenpmV01XWU1zWmIrSy9wUndMMVg1RVRk?=
 =?utf-8?B?djdFK3V4WlkrbnFxRlpmWERVOW55SlprOGk0OWYwRlk5NlJWdEdRT1FtWFRj?=
 =?utf-8?B?cUhBZjdDSEtYaUdjSXhlVzNqS29HeFlhanhxZFhQUHlIMSswYzNOWnBSdkky?=
 =?utf-8?B?c3NtRTVEUkZ1MWNXV282NWtFYTBRN2dVNHY3b0gxYlU5R2FFdDF0SVYwYVhL?=
 =?utf-8?B?dTJMUyt4SzdzSXI3OUhleVVSYVgyZjlFRVFVNGVNVjB5cWJsdG1QZ0g3RXVh?=
 =?utf-8?B?U1NPL2lVUDY2aTdPOFVTbHJRNXFHTFZzRzJaSlZ1RXBtZjJCdllEZVZOQ2Fj?=
 =?utf-8?B?Z2d6cVpuQ29jQ0RYUnhQeHRvOXNuMUUxWEVoeW9zRkZueCtVaE5SNUs3Z1lv?=
 =?utf-8?B?ejBSYlFveHRJNWtRdUJxZ2pqNWlJazR3TmhjZ0gxZ2ZKenl0TGw1NDRkUmxW?=
 =?utf-8?B?ZFp3MGNJanBjZjNIbkFvUnZ5MVh2WDlic1UzU3hKUkV5SElmMHBJKzdoMGFl?=
 =?utf-8?B?enRNR3ZGWnFjejdEdEdYVXNtdTA3VjZ2cjlZYWwrbG5pMUdFcDl3QjlQTTBk?=
 =?utf-8?B?c2hVQlJKaysyWXhNQVNaU2JGUzlWTG11bnRpOVZqTXhsd0xkNUJ0ejVlVEd1?=
 =?utf-8?B?UXVCc3UvcjJLdUZrSTlPQVg4emJ1OEQ2VUd3UlJOdE9jbjBUdC9FZTl0My8z?=
 =?utf-8?B?MGFNVklOWXNzbE9sN0djU1Z4Q1pGdEFDOXAyb0E2Vk12WXVxbUs2VTNSN3FL?=
 =?utf-8?B?M0I4U1A5bXU0RjZHNXQxWmF4WG15Y0hFT0dlMTNMc2RBRXdLUGZ2YlRRSHU0?=
 =?utf-8?B?M21QSEwrYjdRRWdRT0x4YWhCdGhkK1dWeCtYckxrMWRuRERJdXBaa2Z3YUdY?=
 =?utf-8?B?WE9YRHdHUFV1c3ZodGdJNWtTRFdHdUJZSFRIME1QQm9JTHN3azZ5VG5kcWdv?=
 =?utf-8?B?akhzUUE3ZWZJOVp6TmplU2MrSThvV1l5US9yM24vRDhXcXN6UjZDTDVUSnJ6?=
 =?utf-8?B?N25NdWs5K1FUZlVzWEZDd2JUSms3Y0hNcExRN2YvdXBtc3l2M1dZQU0zSE9G?=
 =?utf-8?B?d2JrRiswbkx4TnExU0JMeENvZEZJMDBjSVBuMWZzWUpQV1h6SkVkNlU3WVlO?=
 =?utf-8?B?bjZua1ZaaUgzZ1kxUEZhVG9XOU05SUxzdTNZSVNhYmo0QjZuOS9PQ2p2eXpQ?=
 =?utf-8?B?Y3NRN0d3UVp0Mi9TQm9oQTVveXJHcnRvY2M0b1o5MVZiT2k1UzcyL2pLUHVY?=
 =?utf-8?B?cmxLcGlIUTVCcCt5Zy9BZW9PR051OW9jUlhaT0g3NEh3RStaa05kbDdwTXIr?=
 =?utf-8?B?VzBTQSt5c2t1OXdISm9FOVRpQTRCVDFIWGdRSFlabUNBYjlBTVR5WkdMZzBW?=
 =?utf-8?B?a09SL0xvaDN4THc2YzE5RFFndXkxV2lRQTVkSEFLZlI4OXlidStjQWw3TEhv?=
 =?utf-8?B?ZVBJYmN3Z0F2M0xTNWRjZXArYU1ibExOeFA5U0R0c3FMcGdWcUFRMHU4SVZM?=
 =?utf-8?B?Snc9PQ==?=
Content-ID: <4F8D41E575806C40A02CD90D0EA710E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa99079a-ae07-4456-859f-08da5f112185
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 05:34:00.7202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBv3l8i73zsC1d7WO8gMKJDRgS+qe9i/dbkOW6SXwawTKy3qsHOn5VtlyZ5PK1eswB9svLtr3kPe7OmSUFhIMFX8+WjHu3TWSr+JyGfPxJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_223418_700349_4729C67F 
X-CRM114-Status: GOOD (  23.03  )
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

On Tue, 2022-07-05 at 15:17 +0000, Conor Dooley - M52691 wrote:
> On 05/07/2022 14:49, lewis.hanly@microchip.com wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> 
> Hey Lewis,
> Got an error building this against v5.19-rc4 w/ the default
> riscv defconfig + CONFIG_GPIO_POLARFIRE_SOC=y
> 
> /stuff/linux/drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
> /stuff/linux/drivers/gpio/gpio-mpfs.c:290:20: error: 'struct
> irq_chip' has no member named 'parent_device'
>   290 |         irq_c->chip->parent_device = dev;
>       |                    ^~
> make[5]: *** [/stuff/linux/scripts/Makefile.build:249:
> drivers/gpio/gpio-mpfs.o] Error 1
> make[4]: *** [/stuff/linux/scripts/Makefile.build:466: drivers/gpio]
> Error 2
> make[4]: *** Waiting for unfinished jobs....

Error acknowledged, will followup with version 1.
Regards,
Lewis

> 
> Also, please add the GPIO maintainers to V2:
> Linus Walleij <linus.walleij@linaro.org> (maintainer:GPIO SUBSYSTEM)
> Bartosz Golaszewski <brgl@bgdev.pl> (maintainer:GPIO SUBSYSTEM)
> 
> Thanks,
> Conor.
> 
> > ---
> >  drivers/gpio/Kconfig     |   7 +
> >  drivers/gpio/Makefile    |   1 +
> >  drivers/gpio/gpio-mpfs.c | 358
> > +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 366 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-mpfs.c
> > 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index b01961999ced..e279eac198da 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -490,6 +490,13 @@ config GPIO_PMIC_EIC_SPRD
> >  	help
> >  	  Say yes here to support Spreadtrum PMIC EIC device.
> >  
> > +config GPIO_POLARFIRE_SOC
> > +	bool "Microchip FPGA GPIO support"
> > +	depends on OF_GPIO
> > +	select GPIOLIB_IRQCHIP
> > +	help
> > +	  Say yes here to support the GPIO device on Microchip FPGAs
> > +
> >  config GPIO_PXA
> >  	bool "PXA GPIO support"
> >  	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 14352f6dfe8e..3b8b6703e593 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -119,6 +119,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+=
> > gpio-pci-idio-16.o
> >  obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
> >  obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
> >  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
> > +obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
> >  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
> >  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
> >  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
> > diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> > new file mode 100644
> > index 000000000000..df48f2836e97
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-mpfs.c
> > @@ -0,0 +1,358 @@
> > +// SPDX-License-Identifier: (GPL-2.0)
> > +/*
> > + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> > + *
> > + * Copyright (c) 2018-2022 Microchip Technology Inc. and its
> > subsidiaries
> > + *
> > + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> > + *
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define NUM_GPIO			32
> > +#define BYTE_BOUNDARY			0x04
> > +#define MPFS_GPIO_EN_INT		3
> > +#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
> > +#define MPFS_GPIO_EN_IN			BIT(1)
> > +#define MPFS_GPIO_EN_OUT		BIT(0)
> > +
> > +#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
> > +#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
> > +#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
> > +#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
> > +#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
> > +#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
> > +#define MPFS_IRQ_REG			0x80
> > +#define MPFS_INP_REG			0x84
> > +#define MPFS_OUTP_REG			0x88
> > +
> > +struct mpfs_gpio_chip {
> > +	void __iomem *base;
> > +	struct clk *clk;
> > +	spinlock_t lock; /* lock */
> > +	struct gpio_chip gc;
> > +};
> > +
> > +static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int
> > bit_offset, int value)
> > +{
> > +	u32 output = readl(addr);
> > +
> > +	if (value)
> > +		output |= BIT(bit_offset);
> > +	else
> > +		output &= ~BIT(bit_offset);
> > +
> > +	writel(output, addr);
> > +}
> > +
> > +static int mpfs_gpio_direction_input(struct gpio_chip *gc,
> > unsigned int gpio_index)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	u32 gpio_cfg;
> > +	unsigned long flags;
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return -EINVAL;
> > +
> > +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +	gpio_cfg |= MPFS_GPIO_EN_IN;
> > +	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
> > +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mpfs_gpio_direction_output(struct gpio_chip *gc,
> > unsigned int gpio_index, int value)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	u32 gpio_cfg;
> > +	unsigned long flags;
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return -EINVAL;
> > +
> > +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
> > +	gpio_cfg &= ~MPFS_GPIO_EN_IN;
> > +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> > gpio_index, value);
> > +
> > +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> > +				   unsigned int gpio_index)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	u32 gpio_cfg;
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return -EINVAL;
> > +
> > +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +	if (gpio_cfg & MPFS_GPIO_EN_IN)
> > +		return 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mpfs_gpio_get(struct gpio_chip *gc,
> > +			 unsigned int gpio_index)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return -EINVAL;
> > +
> > +	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) &
> > BIT(gpio_index));
> > +}
> > +
> > +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int
> > gpio_index, int value)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return;
> > +
> > +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> > +			     gpio_index, value);
> > +
> > +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +}
> > +
> > +static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned
> > int type)
> > +{
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +	int gpio_index = irqd_to_hwirq(data);
> > +	u32 interrupt_type;
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	u32 gpio_cfg;
> > +	unsigned long flags;
> > +
> > +	if (gpio_index >= NUM_GPIO)
> > +		return -EINVAL;
> > +
> > +	switch (type) {
> > +	case IRQ_TYPE_EDGE_BOTH:
> > +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> > +		break;
> > +
> > +	case IRQ_TYPE_EDGE_FALLING:
> > +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> > +		break;
> > +
> > +	case IRQ_TYPE_EDGE_RISING:
> > +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> > +		break;
> > +
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> > +		break;
> > +
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +	default:
> > +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> > +		break;
> > +	}
> > +
> > +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
> > +	gpio_cfg |= interrupt_type;
> > +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mpfs_gpio_irq_enable(struct irq_data *data)
> > +{
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> > +
> > +	mpfs_gpio_direction_input(gc, gpio_index);
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > gpio_index, 1);
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +			     MPFS_GPIO_EN_INT, 1);
> > +}
> > +
> > +static void mpfs_gpio_irq_disable(struct irq_data *data)
> > +{
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> > +
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > gpio_index, 1);
> > +	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +			     MPFS_GPIO_EN_INT, 0);
> > +}
> > +
> > +static struct irq_chip mpfs_gpio_irqchip = {
> > +	.name = "mpfs_gpio_irqchip",
> > +	.irq_set_type = mpfs_gpio_irq_set_type,
> > +	.irq_enable = mpfs_gpio_irq_enable,
> > +	.irq_disable = mpfs_gpio_irq_disable,
> > +	.flags = IRQCHIP_MASK_ON_SUSPEND,
> > +};
> > +
> > +static irqreturn_t mpfs_gpio_irq_handler(int irq, void
> > *mpfs_gpio_data)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = mpfs_gpio_data;
> > +	unsigned long status;
> > +	int offset;
> > +
> > +	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
> > +
> > +	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
> > +		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > offset, 1);
> > +		generic_handle_irq(irq_find_mapping(mpfs_gpio-
> > >gc.irq.domain, offset));
> > +	}
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int mpfs_gpio_probe(struct platform_device *pdev)
> > +{
> > +	struct clk *clk;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = pdev->dev.of_node;
> > +	struct mpfs_gpio_chip *mpfs_gpio;
> > +	int i, ret, ngpio;
> > +	struct gpio_irq_chip *irq_c;
> > +
> > +	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> > +	if (!mpfs_gpio)
> > +		return -ENOMEM;
> > +
> > +	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(mpfs_gpio->base)) {
> > +		dev_err(dev, "failed to allocate device memory\n");
> > +		return PTR_ERR(mpfs_gpio->base);
> > +	}
> > +	clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed
> > to get clock\n");
> > +
> > +	ret = clk_prepare_enable(clk);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to enable
> > clock\n");
> > +
> > +	mpfs_gpio->clk = clk;
> > +
> > +	spin_lock_init(&mpfs_gpio->lock);
> > +
> > +	ngpio = of_irq_count(node);
> > +	if (ngpio > NUM_GPIO) {
> > +		dev_err(dev, "too many interrupts\n");
> > +		goto cleanup_clock;
> > +	}
> > +
> > +	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> > +	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> > +	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> > +	mpfs_gpio->gc.get = mpfs_gpio_get;
> > +	mpfs_gpio->gc.set = mpfs_gpio_set;
> > +	mpfs_gpio->gc.base = -1;
> > +	mpfs_gpio->gc.ngpio = ngpio;
> > +	mpfs_gpio->gc.label = dev_name(dev);
> > +	mpfs_gpio->gc.parent = dev;
> > +	mpfs_gpio->gc.owner = THIS_MODULE;
> > +
> > +	irq_c = &mpfs_gpio->gc.irq;
> > +	irq_c->chip = &mpfs_gpio_irqchip;
> > +	irq_c->chip->parent_device = dev;
> > +	irq_c->handler = handle_simple_irq;
> > +
> > +	ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to allocate descs\n");
> > +		goto cleanup_clock;
> > +	}
> > +
> > +	/*
> > +	 * Setup the interrupt handlers. Interrupts can be
> > +	 * direct and/or non-direct mode, based on register value:
> > +	 * GPIO_INTERRUPT_FAB_CR.
> > +	 */
> > +	for (i = 0; i < ngpio; i++) {
> > +		int irq = platform_get_irq_optional(pdev, i);
> > +
> > +		if (irq < 0)
> > +			continue;
> > +
> > +		ret = devm_request_irq(&pdev->dev, irq,
> > +				       mpfs_gpio_irq_handler,
> > +				       IRQF_SHARED, mpfs_gpio-
> > >gc.label, mpfs_gpio);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to request irq %d:
> > %d\n",
> > +				irq, ret);
> > +			goto cleanup_clock;
> > +		}
> > +	}
> > +
> > +	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
> > +	if (ret)
> > +		goto cleanup_clock;
> > +
> > +	platform_set_drvdata(pdev, mpfs_gpio);
> > +	dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n",
> > ngpio);
> > +
> > +	return 0;
> > +
> > +cleanup_clock:
> > +	clk_disable_unprepare(mpfs_gpio->clk);
> > +	return ret;
> > +}
> > +
> > +static int mpfs_gpio_remove(struct platform_device *pdev)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
> > +
> > +	gpiochip_remove(&mpfs_gpio->gc);
> > +	clk_disable_unprepare(mpfs_gpio->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mpfs_gpio_match[] = {
> > +	{ .compatible = "microchip,mpfs-gpio", },
> > +	{ /* end of list */ },
> > +};
> > +
> > +static struct platform_driver mpfs_gpio_driver = {
> > +	.probe = mpfs_gpio_probe,
> > +	.driver = {
> > +		.name = "microchip,mpfs-gpio",
> > +		.of_match_table = of_match_ptr(mpfs_gpio_match),
> > +	},
> > +	.remove = mpfs_gpio_remove,
> > +};
> > +
> > +builtin_platform_driver(mpfs_gpio_driver);
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
