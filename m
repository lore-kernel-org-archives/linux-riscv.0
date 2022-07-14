Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3360C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 06:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnbXGOmTAbhwrRv9Tze7F0gQT/wu4qokozEFrKwVyfI=; b=UiSoIDplxpSsDy
	3yRobpO/JLCxGwrKUkYt9R04eT1viwEpxLFapb96FlxPb+it+zYX15H7/cTSo9eExmcN0dV79er8V
	4YdYr2qRdU29fldiWdWmCRTth8frlWugx5DFX1A825/FzPYtRclxvwosKjz7io8tyYBiZSL4QcYU1
	ie0juQI7tLqshnXTAUOsgZHFFOKXVizG4Gjusgo1hdPrWq9Tko2KWHA1iEMx5JtUrQbPx0zUepdfM
	YiRLqN9KPFra+o0UhxUfoqnbz5na7e9bdwpPYbmJ/3jRLAOcJd6VWMaxIa/WOnHeMNdDfFr7NA69j
	h5vkfGWKrCN86ZWxWuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsCQ-00BNoz-4z; Thu, 14 Jul 2022 06:19:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsCN-00BNm4-7u
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 06:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657779583; x=1689315583;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LgDNh+vkS22vWiUqbKTqhG8rBowmu0MTSj0P2jcSdoI=;
  b=X2/DWOxT++tGcTJbbYwGdWCu8OZxAxJfDlsk0bnAVZZBIzuYVfZupDnO
   K+qpALCkBGzLI/j0Ge7ljhHscbh7FCrpmdjkUwNvid32jB2Rhu2VemIoP
   IhXB+dmrMNUMZRmkCCAO7RUmJYNUoV8lpBfkiV/NKnjTgErmfa55cg7gE
   IWemug/ZOb7yO+eHIrBQC4SpZw4oUGgzz3uLOGZeBZZ1JLL1wuxhMyPQv
   7hiLxor44yKDvAYlILh9d3MwHEHUDpSng6F5t6GdQY80lv1Q02v0cjK9f
   AwfCU8isHS5mixhDNp/zzZhRuQcrk+w5D62fQmMM+GHfsshGUpE9gnET2
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="182098211"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 23:19:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 23:19:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 23:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DebPixHtHR45N74osLnLucjZUptZMY4QGQAsaRF7sfPXQsJ4GiMKU2o8d9jFQHwMssMtzzQgSWpFQkNw0qJuMgnIQOxmwmhWhq4PTiHrjBXyoASEP7VqVS2mTfPJDT2mAR9aMyRgpuiizgCuCF1vmFPTU8MtgqytUl4pQz4vCBZoxnAmCQ4D8btaHA93BytEk+MQmNh4hVIJhkQxB8dmHAwPEK3z/JXi3g3tqbF9s6EUcDMHT8aOLvHEuktf2Wg1vs5fITT3fN0Agpo/tTEA+9fB5Hv6Y+/RF/QJLOQnexBKuHPKnAl5ndl+QYroXwjSfAEPodxHdB67eYdS49RtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgDNh+vkS22vWiUqbKTqhG8rBowmu0MTSj0P2jcSdoI=;
 b=B4ol3mLoCAzeEzsEt8FifO9NR0+xasdqHa04cxfQ5w8vCK/ltF69/6fFsquWeuJff56vZf43Xy9X0MmBFs6Dd8fhnhZjYvjCdjI3KatTcOkRUg91q1vQ0yCL+pVg3OJtIGbvntbo8g/8oRdZvaaEwgEkRvJNvnQQLZja73Dl7M47UWeaEnN6XntQHNaazBN/V4BCYYcR/jeHVTDRcS2STh1SpFnFHusY7xDkLHMu7gkkDLUDGWeej37r0lYGuYYy9x+QbFY6wcDdgh6V0Nkkb1CHtBlKeo2ib2MXvd3wN8Z3r49JiWvfwq272GR/wgQwAVkffj+i0FSBDPE7bL/p7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgDNh+vkS22vWiUqbKTqhG8rBowmu0MTSj0P2jcSdoI=;
 b=tqPLjeCVtlPXjxBSM2ZHCxeY0d/+N7F5GFgrX1LNjfLIGu/OXzBhcaLV1b5tYrRio7XvmGGd2Mbfg5thyp2i023qgmofsO797URyst74v92iuvc624hVOgKF10J3sllyEeIxngXsRfrcOor3f6T5Uk5LxZlmWClMMTtlVaF627w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3547.namprd11.prod.outlook.com (2603:10b6:5:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 06:19:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 06:19:32 +0000
From: <Conor.Dooley@microchip.com>
To: <Lewis.Hanly@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <brgl@bgdev.pl>,
	<andy.shevchenko@gmail.com>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <palmer@dabbelt.com>, <maz@kernel.org>,
	<linux-kernel@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemVrcQOBoUV020qkXDgR8Pgq18MrcAgACSjICAABlAgIAAh5gA
Date: Thu, 14 Jul 2022 06:19:32 +0000
Message-ID: <9107c441-73b7-fd7c-9c25-e8a31afbe563@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
 <20220713105910.931983-2-lewis.hanly@microchip.com>
 <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
 <abdf389cfd049f60b951447c047bbd186fa19469.camel@microchip.com>
 <CAHp75VeX8p4m7Bi=9Zvk5=MRTOb=BTmcuDbtW1ZUOr_-1mHvyQ@mail.gmail.com>
In-Reply-To: <CAHp75VeX8p4m7Bi=9Zvk5=MRTOb=BTmcuDbtW1ZUOr_-1mHvyQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dfdddf2-2b8d-4ff1-6efe-08da6560d13e
x-ms-traffictypediagnostic: DM6PR11MB3547:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfuV/4yJz4PId8TB/Fi5dmalcW3xOod53XYrhyLmEXUT2WaZYF1aHJ7dwUBvykF/DKG3tNxw6+lda+vrmpKeNiDQlw+R0h+r1CmBJc6yo0ZDv72IElm5EoXW6/4RHIg8+1YPGLuMAckm9IqKa9gwbVRmn/g1Fy6xMOFVUti+XCfmrF4ZX4b81eGHhZSbBs0CnLi/q9fsAwJPbXHKb7MqZj36MAacUjNc2oDZrOCwERFggDGlNSNPweZ3yKeswsD8MBjD3FkOLx433SsxseZT/2f4IDQEmBQKqyKWXgRC5/rBmWlXEMq9UvNOnLsclAJEI6bdpsnCGGV1AMI6MX3gwTcEIhlxW8baUsE9dL3zVnEjg6SwmVG0rG9zmgxWLqVFcJdzWddJ3DWftWG12CIQXBpJ3z+6iPVfDdL6QOCKNQAOyeGg1FEzg1puBlwTb2uUSQU4KUrsN/Iyc+OwWU4IjCkSLdoPN5ED0fZ4O4HFLCRD6Qcd6VlqneUYTYDPSDHSdQ/njgZLNSyFDnLJZvQbeTdKnJiVq45MKoLUOv58P9vx7iid7QW0epk7aeD3C3RuaaoQjTTp+I+Pa4ApkRYal+dn7erkvyiINeu3wBWCdB5O/3e39uaE7fsBHHlV0MTO2V91IdN3zsgVZZNaDltClLcCPuKrdeGtZRKMuJLe2BJgalHhDf/f94P0BE2Ymwno4/hDmEpeUwNc+H2xSLywlwcpqdxKFpCch1cBKpqIHnRF2oM7tUs0uIR2NhMgG8LUZxuFhh5+s2odjPDsaSA0x1DogtKWG273FVXx+Bhf9onTevfuRGp4V4zrNRKE18mWPIpRehogBooP6HCnuoCPUuqL7EvHM2GlEradfA0cn66RWE6yVwIKsdbpkZAn24Z4a5rO85yZGlWRzUZZB7Hs4FHbcpaziGqzyyjLWf6mIuc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(396003)(39860400002)(91956017)(6862004)(122000001)(64756008)(76116006)(966005)(41300700001)(38070700005)(86362001)(6506007)(8676002)(66476007)(4326008)(2906002)(66556008)(6486002)(8936002)(66446008)(71200400001)(66946007)(5660300002)(36756003)(4744005)(6512007)(31696002)(6636002)(37006003)(31686004)(186003)(38100700002)(54906003)(2616005)(26005)(107886003)(316002)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTFmMk90Tm5KU1VGdUZtRHZpYmhac3JJd1pxZ1hUUnJIclFXUmExOXFzSG1U?=
 =?utf-8?B?T2lDNDd2RUtnUk9TTVRqR295cEN4YVEzcnBOUDQ5aUJjUGpmYXBDNWlteUIy?=
 =?utf-8?B?TlR6TUxpRGNrNGZWSDdKVXl2MXpxVnlONXJDMzdwUXpnRW5BQVlCUFVJbE1m?=
 =?utf-8?B?Tkdwa2puemxLaElKZWpzTVh1MXJCbUE5MmNZcmNldllTeENZSEVPSkRxVGZt?=
 =?utf-8?B?emI3R0o5NUpHOEVrcXRkNnRFc1JISFBPKzRQVVROV2JabDJrZ1RmNElJZ1Nr?=
 =?utf-8?B?WitrbUJLckNzeVlzbjdEbFBRbkhNSlNuOUIyak4yaDYxL0l0ZDZJSHpWQVNJ?=
 =?utf-8?B?akFhUWFIVFVZVXpjK1pjV1NxeVMwa29zTWVyMW5XSjZrakd0dHBoMzZkRFdz?=
 =?utf-8?B?WlVuamM0RzNuMUdvSXZKbTZRMUhHRkNXNDdmMnFzSHhCeUVWdFZCc2daUmZG?=
 =?utf-8?B?ODN4SnFVdFczM2gyaE8zd29lVDB6VDh3SkFRbk5uU1U1Y0FyRkgyNG0ybGNZ?=
 =?utf-8?B?LzFQSGh4VXI2UFFFVUtZTkJVMmNFdGdUNmlSU0VCcmxlTDZ4dkV1cExlTU9h?=
 =?utf-8?B?NUc0UnBXR3NnZSs2cE5namFrRmtQZHBZOXloUXhTWVhQbFJlOTdvZFF4Vk15?=
 =?utf-8?B?NEhWZm8wM1hHek1kampPWFF6a2t3ajFPMkQrSUFyVEdibFlEalF2dmxVQVY1?=
 =?utf-8?B?bXltZjYzVVhOd21qYm1FUHRkNkw2KzRHVGRRdjh0VlhOemZFdGR6Vzl0ZVd5?=
 =?utf-8?B?TGZYb005ZXFxRDUrajZoekVvbUQ2M1RxTE5uR0ljajJ5Yjh5blJQMlZJQlY2?=
 =?utf-8?B?bnlCbThzMG5zYllZVlRWTEdtR1RLL0IreVZhem9VQ09ZUFloRVJxMTZndjAw?=
 =?utf-8?B?a2ppcVVLQ0Mrc3B4V1gycWpjUzU3VC9GaVVlTjU5cS9KNngyNGlRanA2Q1dq?=
 =?utf-8?B?Ykt0R3JtZGlCdWZZb2xtRDZ6SVJCSDJKaTMrREYrb1ZVbUVtbHg5Q2VwTXV3?=
 =?utf-8?B?MnR0Z3FMUytqck12d2hWYTlvNW5DbnVGYXl0Tm9SYXhrVUlnNHNPRnNSbXRj?=
 =?utf-8?B?V0JuUTc4Zk1zYlZjcGdrbCsvazNscFhkM2ZZcmJDbmdjRlJzelRWS252M3RG?=
 =?utf-8?B?QU1zNjFLMlkvMGlVVFd1Tkx1dXNxWjZWTmM5VkRFNGhkbUdibytXUDVCMUVL?=
 =?utf-8?B?VGpNcjJwYkZtYVVIRW1GRmc2LzZxcWdJK2w5RXc0UUJ2cVZWNVhDc2FyQ1B2?=
 =?utf-8?B?RXQyQlpmUlorQS9zQ2VnWFdRMUxJOWtzd1VEYmsxKysxdVN3R1ZCMU9JQ2M0?=
 =?utf-8?B?R2ZqY0llVUJ6dExxNUlzbFlBQXdSbENmNDF2U2IvbUVFR21rRTE4eE51QURy?=
 =?utf-8?B?Y2FjS3FjUGVWUjVTR1hEdllGeXFhdXBPUXk2cU1TRjhxVTZQeHV3czROK2R4?=
 =?utf-8?B?bUNYT1FSUEpQMzlSZktjNjRnRk0zQWxEalJaQm1qMHRkZW9lUGJTYUhOZFVv?=
 =?utf-8?B?VDVRbGI1KzNEWGtyUWtVYzMvS2JZbE41d0YxdkFOYVoxL2d6ZmhsTmR2M3FM?=
 =?utf-8?B?V3YvZmRzeHJJTDk2L0c5L2RwMWg4YnZQZ0kwUXRsbkhsc1lyWGpnb1d6Rllv?=
 =?utf-8?B?UDl3V2o4aXU0cWNjLzhGN2xUWXY3cmNER0RVZlFVNHhFODJ3R3NxbGtpYVJw?=
 =?utf-8?B?L0Z6QStSV1pRcVJ4ZmdVQ2RBd2tQVmxlK1dkYnRMZkJIbjlSV2gzcTQ4bWF2?=
 =?utf-8?B?Qm8yMHZSSlZXK3VhenJ1UG5Gci9SYSt3YXRwTk12K3NMUXlmVjAvVE8yMmRU?=
 =?utf-8?B?Qm8vK0hhTVdWL2d0UDZ4L1JPd2MvUDgyelNVUmJoTmpxNFpzTnNHck9XY0tt?=
 =?utf-8?B?RGNLbnRFeDhtd0NuYVY4NHJxK1ZTdW5xRDdKVDZIU0lBRStOZFE2N21uKzlS?=
 =?utf-8?B?SUkzWGJ5Q0VNZytieE9SS0xTdWV3TUR4dEZpNHo1UFlLUVo0OUVQZThsZnJU?=
 =?utf-8?B?U0VKR1libnVXaE5lYnh5SE8xTkJobTBUM0JNUW5ZUVMvbUwvdEplL1BNMytY?=
 =?utf-8?B?NHlIUmlCU2NWdXFOZERlZ2s1OTd6ZnowaW96aFF0OWc5aisyK3cxMkFWYUVz?=
 =?utf-8?Q?B3OZbKOQZgrINd9m5prnyNrcW?=
Content-ID: <4E69EB3F6AA38441BEFD7FC52AA19479@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfdddf2-2b8d-4ff1-6efe-08da6560d13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 06:19:32.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIk1Z38zMBcCooIPoUmYPv7xnp4W2xx/6kQMa3r/6n2+0X98mFReXco00jhiMYN+GzQjgTz4aWCWZTBmCnFHk3G5PwvYsKePgQN/7H6JbLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_231943_540565_0CC6C0DE 
X-CRM114-Status: GOOD (  11.16  )
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

On 13/07/2022 23:14, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jul 13, 2022 at 10:44 PM <Lewis.Hanly@microchip.com> wrote:
>> On Wed, 2022-07-13 at 13:59 +0200, Andy Shevchenko wrote:
>>> On Wed, Jul 13, 2022 at 1:00 PM <lewis.hanly@microchip.com> wrote:
>>>> +       if (gpio_cfg & MPFS_GPIO_EN_IN)
>>>> +               return 1;
>>>> +
>>>> +       return 0;
>>>
>>> Don't we have specific definitions for the directions?
>> No defines in file.
> 
> We have. Please, check again.

I said what they were on another reply Lewis:
https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/driver.h#L25
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
