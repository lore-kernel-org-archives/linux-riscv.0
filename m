Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDC2ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Qgfgnx7KXP39jCh4MrWWgKb5pPwylWFDaqpSisqaNg=; b=PhYEVvd1JlOnTI
	hsy8x9FzRsxdsradJI8wWbv0+IDqT4s0mCmkjC2Ob2EkqqPuMhjmRaBnUUtrn/hSTiYKe0P34EAYH
	DsC08Hqo4SeRxY2ZBTIGhVJYn52CGCHdWwHboP8lyaQxKm2Aa+j6bggkQwhDnVTFInjIQgaxX0J6w
	kbDgwMdsxF+Nsgwfrwwk5WQcXsJMACV6fLwLvB2s0ddNwq+xyFSbdZ0mpIZwoww/9Z/ajqP32yLLi
	sfhBkgD+imApIEXLOLMQu+xZXwb6vnVr3YdKBlTig6/7JSbT9dUV5JDp1xfCGriXytJGVmxPzx2G9
	gnP2dKbKO0ZqbSRnXUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsqy-00EVge-Dw; Thu, 15 Sep 2022 17:40:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsqu-00EVZx-ES
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 17:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663263640; x=1694799640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P1aTFhylKfVUcenMTseMO98tTk6Stdzyh3deG+naL7I=;
  b=AiL15jxDX3HySn9BF9B+wAPMi0JxpAEhUGBaHSfu/lgYNr8qaB13EhIP
   yt/RG5xVEx93nldybkMEso7tsNsvxGFdo+mZn6L3iWf0lOs+4QMMbUeSI
   ht7eraC4RdAtevlHuPrdsRvkG/ZQ9TdQArYjb+fCOOMMzBqpqv43LsBS0
   szK7cgsAA9ND03paSwoO1P1KYBVL5XUGo1eTF1rn3ypBt15ySYFJ/oC/1
   hI5rK5geuI+7kHaSpR+nio7UZ9Qtm7KfSTr3L5y0I/p6dBjrnRc9uvkDJ
   QSw+fyWCv5xz2eycuk0kytfb+r3dnc0HEcaC0Ngg9YsT9+SyCNuN58Z6c
   w==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="191029549"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 10:40:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 10:40:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 10:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwCm7F2yh6WZ3yS1DVC+Qwx6j1KvozRW9UZ4G5f9opGRqZOOqYVuEOBgMAgL2iuBRnCq5Ne1LU+5SNyB1xVOd3TcWA86qqV6/KypUi7p9RXAum+gOjjqZzOeluut3e5Z0iU6EZ9xzPkR8E0ZGPnPAYbjopu3FIEya86G6sTfZl9t4MyMjvg/4RovaZSOp5aOtHPH2Ixd6eF9Tofa11Xw822vB+L2ja0QK+cPKVs02F9qLekrGEuJySNf+wcO/DMzs2gzYZdw2I7upuCqJ37hQOMHIvzvLHjyxHef57wDtOE5YNYGZrpsVBYSxVIMTubxcwjuaAaWEQNIO7hAGDq/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1aTFhylKfVUcenMTseMO98tTk6Stdzyh3deG+naL7I=;
 b=lswi74jCAkFbowMrlCladfQXxjOyNSL6ajrup8l5o0oa2YUL0alQkIhpj2fA8tFkU5dazxg278hT3U8lso/lXdBnWj39zflD5C4ZCcT0XXH0M9Ryel3AdaEBjFqf1f0ExGSIvYIKoURcwkXfTG8DnlfddSE8dBP7pIuNU7gznUb3zBKQQzlSIWFLRbK5P+zOgx7Gk7Tv06MXb3kRaBCqbON4DjNGRpLwOvLtZ123lS4NZOsPQScTSebk8vJ+c1G6ko4K12rjjEMdYPB6P9Xhapm6pwMJM5E3NKXCwyZ1GL+QXzvmWMsuprkLZcgxnGhweuM/5F0jc+RcpV70fjI+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1aTFhylKfVUcenMTseMO98tTk6Stdzyh3deG+naL7I=;
 b=qw8bj1g76tcPHAduxlrogg+v/jtqZ/Y3de8PJXFDIlV90tNAm6UbRFPAQYbBbCsyrCkGX/IDtoWXjp9EVnE/kp2dY8fynl69jMHQr/dFOjkTcCHrQJhrEkzdVYL78LWzIx9yerRgM6J4ZAXjE9zUHuv7bvFhdDVElLKm0dEUjyM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Thu, 15 Sep
 2022 17:40:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 17:40:23 +0000
From: <Conor.Dooley@microchip.com>
To: <abrestic@rivosinc.com>, <Conor.Dooley@microchip.com>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<coelacanthus@outlook.com>, <dramforever@live.com>, <c141028@gmail.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<atishp@rivosinc.com>
Subject: Re: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
Thread-Topic: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
Thread-Index: AQHYxJMWnJEOeg8890KCWf/MA/STJq3gvxUAgAAIf4CAAAO8gA==
Date: Thu, 15 Sep 2022 17:40:23 +0000
Message-ID: <aba1be51-6951-6251-0802-9db573ea2aef@microchip.com>
References: <20220909212731.1373355-1-abrestic@rivosinc.com>
 <20220909212731.1373355-2-abrestic@rivosinc.com>
 <d46d6340-b985-49b2-babb-0082f1759c7b@microchip.com>
 <CALE4mHrBC-ni3HunRzxRzM8QJDHb=FuJquccum6OcnB4jZ6KbQ@mail.gmail.com>
In-Reply-To: <CALE4mHrBC-ni3HunRzxRzM8QJDHb=FuJquccum6OcnB4jZ6KbQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MN0PR11MB6059:EE_
x-ms-office365-filtering-correlation-id: 60aeff8d-483f-40e8-982d-08da97415e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWHRLQZSzdZVg5yCQQKUXl5/3sJa4fd69CPJz439aR06cwCzBbQ3R7hTMBul3td31J6vEFxidtlxl86Rg8a36b/pywXLyO+H7JKUIR23NGSEODCBtuuY9LzH6sf0475SZ5pmlQExtIdDnE3kRfLdSv1fkOG3qDvp2kxLTQ2v4G3ns96VqgnpMKdSItxSehSQhk8adiV0JuVowDMtSqhT6xfRTzi+tQLKOSFyR909GDkB1IjM3yIpAovBiwVtZpqdpmr5DNHBeyUF/37iIL5HVGx/iZhOsfmkRma6z6VfqABqG93lDQ/eW+UKaZtIyiT4czfNY4J1a+pWr/ld8Qq04y9eEBgKqu8HsSJWCaJvqDkCcJw0hYokQwkI5Vuhkpdjq8dvlVk1JbCCs3/czBkYvu1I7nereKrzZ7iCW3hj1Uk8HX+kECoEs3J9Bmho2cj81PjmqNRCLZva8LS2WLQJYZQy5dzozE91VSz65cExu5dSk//CYeITGI+sB1QlSUl+nZyMQrQ/f4qPRjcQonN7Wpe8dOE+I9U7VZtptQq/FvtnQy5mR6e6zKRR6geugGH/spI/CWkfGHsiMWR/sCQ1ilHwOyzDwyMoAMF0KSbHEfWVbZM4a716wbB6AqobA8BdFEtSH7DRTnNkCay9jqLxVEwJGMGIUeEyXov4eg9jlsALpL465FXtdHz3zduVbLH3eeWesAjAvc7p5pa0Qte6P1ACaQpPVnXd5fGjANw3cNt486MpBxbOrDy4lRdIazZ7h6dG3/T3vDOK/mDM/+ylWo90ft48HXaY26jhme14s2RVkMAi7OTG/Q2zkzG/jkWk2rcW7nQohC+eehC1kxPOBGkp+FJsJBXHZWO7Z76B8z0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(36756003)(53546011)(5660300002)(186003)(478600001)(54906003)(316002)(83380400001)(6486002)(86362001)(38100700002)(64756008)(71200400001)(91956017)(76116006)(26005)(66946007)(31696002)(122000001)(66476007)(8936002)(66446008)(2616005)(8676002)(66556008)(4326008)(41300700001)(6512007)(966005)(38070700005)(31686004)(2906002)(110136005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGhXVDgwVDRrOCswTjNWY2FiRSsxdzVOKzJvRlhEWUFCS3krQUZ4ZmhQM2Ur?=
 =?utf-8?B?MDNPSHJYN001T3R0OCtwSDJwUWN3UUtYQ1pLdXlHelRKL3ZHL2R6L0N0bDdV?=
 =?utf-8?B?NUowbGZNRkVHMFBrUUdpSUF5TjlaWnNZS1BYazlDNUNEb01xdWtYVTBTQ2NW?=
 =?utf-8?B?aWhrOWdzWkIySGpFY2xPQlhPRzBXTC9XVVY3VGZaTWV0dkllK1hGTjFYdWlP?=
 =?utf-8?B?VUtFZ1U2enJQa3B0cjRLNUcvRnA4T1I1VlRCQTM2cjgvWFdQQ1g1L1BRTWZt?=
 =?utf-8?B?cXlKMmxpN0ZrN29Ja2JPRGo1dXd0ZHA4NWhPaHBmVi8zN2VhVEpYYnRGek1X?=
 =?utf-8?B?NkhKQnpTWUlCNVZwQ1huMjNtVDBlUWVOKzJnemwrWUt2aklqSyt5SmtWWll1?=
 =?utf-8?B?VXE4NmRHT0x4ekx2aU9KWTNXK2RwdEozK0RFTmtJYWNteTVaclRvTTRLWjQz?=
 =?utf-8?B?bE4vWkVBcWhzcm8ycG1CbWVObnN3MHZEZ0I0TzBVbHJiNVgreFpmK0Nxbnhm?=
 =?utf-8?B?OUpQK1YvdERJTVU1ZjlqdTZiQ0xhbGlaZTNYWGwwTC82cXIrY0lnTkFuRHVq?=
 =?utf-8?B?QWtiV1pkMVVhUjFvaXNYYnQvNkZVZGhYSFZsc3ZndG5ac29KWmZmdU1PNnFr?=
 =?utf-8?B?TlMzRFQwd29JanE5UVpjKzhkRG04czlMYkx3cFhLd3lnK29qYWJsZnNlSkRX?=
 =?utf-8?B?UWVBcEt6dGFwNUdtRmRHekhPSzBJVHdtTlgvWjVyVCtqNVZuT0V3cEtwclo1?=
 =?utf-8?B?OVdQSmhRSFB1WkQ4MXZGcXZ5R0orRDZmZWRFcDJvQzJJSWRtaUZDWW1rUmpQ?=
 =?utf-8?B?K2RiVlNQUDByazZSc2ZzNG9xN2duS1FXaTArT2dvcDZ6K2NDTm5xYlFqNGsv?=
 =?utf-8?B?OVFTd2MxWGJxamF1TnRZV2R2c3BpNk03c3dRTzB3R3YxeE05YVpGL1M4aTVL?=
 =?utf-8?B?WE5rU1cwTXpuaDM2WDBGcXFteURwNytubmk5Y2hteTBqTDVsSEgvditxMG5Y?=
 =?utf-8?B?RlY4WEZjcHFjb3BDSWJEb2lYYXMzWmk0WmszYko5UTBCMWVoUFFWbmtQd3Q3?=
 =?utf-8?B?cjM2K3lUdW84RWNCKzlZcURPL2Q2Q2M3TGw1M1JxdWQ1NzlpeklsOHdXUGpt?=
 =?utf-8?B?MnN4NGd2WEZvSGdaQUlqS0xaMkJMcmZYNUNWcTQzMWc5Y3VPWkVvdFNibFls?=
 =?utf-8?B?Qm5jTFFuWXIrQldvY0tCcTd6Y1FMbTQ3a2szSDNTZWM4c2RFVVFLTEFMczlL?=
 =?utf-8?B?WkF0UC92a0hTVjR6U2tKRHE4aW9IUWpuWERNbVB0LzBiMDVVVWVqNGdHRWpS?=
 =?utf-8?B?aUliVlFTeEljUFZtWE5hcm4zNDRvQTZTS0NIcURjK2UrOEdITlFKVWh3bmlj?=
 =?utf-8?B?ZlQyNllNbUFyS2kxc1FkMTIwNkNCSHdDWkxtaHUxRmJwcFV1N2ppLzV4bGp2?=
 =?utf-8?B?VytscndJLzBURTArd0pQMmVTMFlNSHJBTzZxRmdFTEFXVTY3cU9VbFFvbFFr?=
 =?utf-8?B?Mk5VNTBXM1grZTVMMWw5TlhQRHFaaDVDYlpGbGd0NWJCRUhON1cxUlRUdWcr?=
 =?utf-8?B?Nm92blhSUWkxbVpkZ3ZPQnQyZU8rUlNkYVA3WExYMVRwbEo4OW81QnY2bmFR?=
 =?utf-8?B?Y2dnalhocTAyMnFOaHBUY2xadnRWcS93eklqSU1wdkljZXZDZFFXWkpQVzlS?=
 =?utf-8?B?QTRTZWkzbXRBNi82TFlyTGgxcGY2UDJ3c1lsSzJKdGhqTFF5U1F3SVczZ2VR?=
 =?utf-8?B?cTV0SDloUXowdms1QU1MSkFDS3REdDRUVDVrNzMwU0U0Wk1qL2F0VkZObitU?=
 =?utf-8?B?MG56K2cwT09qVXFIcWxRdUh6N2JTMmQvUWZjU3F2aFh5WUpZUVdxL3d0MGNz?=
 =?utf-8?B?eG9jckU2RGtlb3BZRVVXVzUxOFFzSXNyQUZhT0czY0YyaWV2QlNUbzArSStl?=
 =?utf-8?B?QjhIRXlBeFZadStvUVFKZko2bkYvcW1kTkx2dUcvbU13UVBCYU9sRVIwN0s2?=
 =?utf-8?B?VWYzSndGcUhJc1hpMjQySjhzcEtKTkxjVmoxUkc4aW41ODc4Skk1SlJ4UEx4?=
 =?utf-8?B?NUx3U2tRZGdRWHBKbFRXdGs5NmhBNUR3ZDM0TnEydk1abFgrbll5TkR0VHBo?=
 =?utf-8?B?ekI5aldQeWh4TXFodjZBaGg2M0gxcHpwY21KNndPU3VRaFRKYzdkWW51bXEz?=
 =?utf-8?B?OHc9PQ==?=
Content-ID: <C1C31D282CFF4B43B1E2959E58DCF06A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aeff8d-483f-40e8-982d-08da97415e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 17:40:23.7133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcE5GpYRAeS/OU+ZRteSATQ3xBJSurHFsAJdScJ4blDk64E/1Bbjh3LlgklN6U5oZs6kHJSR4n4YO8YWLvXvbvjJ7wozzdNSTv8RaXLXUqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_104040_519794_132BB37E 
X-CRM114-Status: GOOD (  20.66  )
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

On 15/09/2022 18:27, Andrew Bresticker wrote:
> On Thu, Sep 15, 2022 at 12:56 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 09/09/2022 22:27, Andrew Bresticker wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
>>> invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
>>> PROT_READ with the justification that a write-only PTE is considered a
>>> reserved PTE permission bit pattern in the privileged spec. This check
>>> is unnecessary since we let VM_WRITE imply VM_READ on RISC-V, and it is
>>> inconsistent with other architectures that don't support write-only PTEs,
>>> creating a potential software portability issue. Just remove the check
>>> altogether and let PROT_WRITE imply PROT_READ as is the case on other
>>> architectures.
>>>
>>> Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
>>> disallowed prior to the aforementioned commit; PROT_READ is implied in
>>> such mappings as well.
>>>
>>> Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
>>
>> For the naive members of the audience such as myself, this patch
>> came after a non-fixes patch in the series. What is the dependence
>> of this patch on the other one (if any)?
> 
> This patch is dependent on the first. Happy to re-spin with a "Fixes"
> tag on the first patch (or maybe Palmer can add when applying).

If it is a fix, then it should have a fixes tag. If it's cosmetic reorg
to make the fix easier then no & it should be moved after the fix. If
it is neither then you should prob mention it in the cover or under the
--- /shrug

Thanks,
Conor.

>>> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>>> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
>>> ---
>>> v1 -> v2: Update access_error() to account for write-implies-read
>>> v2 -> v3: Separate into two commits
>>> ---
>>>  arch/riscv/kernel/sys_riscv.c | 3 ---
>>>  1 file changed, 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
>>> index 571556bb9261..5d3f2fbeb33c 100644
>>> --- a/arch/riscv/kernel/sys_riscv.c
>>> +++ b/arch/riscv/kernel/sys_riscv.c
>>> @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>>         if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>>>                 return -EINVAL;
>>>
>>> -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
>>> -               return -EINVAL;
>>> -
>>>         return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>>>                                offset >> (PAGE_SHIFT - page_shift_offset));
>>>  }
>>> --
>>> 2.25.1
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
