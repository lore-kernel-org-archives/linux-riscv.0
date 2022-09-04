Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCEDECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gh0EGD6W3Pp14U+5XyL1xFgf7345uS1VfN1E0wvHCP0=; b=1VzIBTUTD5Pe7H
	xSs0LWdUyuPhqa7tcdIcowDwht4FFxLkczFOTy0Yh/p9bUit90XTCYYFFvbZq0cHqpwv8du5SfrrS
	rPu68skDJY40LQ2U7TXBJjbP9D97uNcTyB1xENME4rMVDd/fG8SWdKvq8VFqjN39gYkERzi1F6IgL
	Clrl8CPyhJ7UlKbepJ3QpgOHrnoQ+xni+6PByu5Pt3mmHci3+ZF4qrBU1in0p1ymUooWcINRrgsc/
	/ws0m6zDlosW/XQytaqzRu/a4Z7Q0ti9hGcKsH0H6rDGgJFGDYubHDBEgnuRIWF5E9fG8Y5hnemtk
	hsilMw14rYg0ki2RQuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUq0Q-006Ybe-VN; Sun, 04 Sep 2022 13:49:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUq0L-006YUN-F2
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 13:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662299382; x=1693835382;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ew4CboirgueGJHBF+Budl880uqcyJRG7HCe07KL9FNY=;
  b=eTnpApYMpapn6xg5mn8nZBj5xPUkBuo0FbkV9spK0pWK6v2mZmOQnqCR
   GfoXACJqlCqrf73y3eQN3qbzKSODoVMKrrUZ2LUHlJi3goFQPhI/whYDj
   ch7L7WZK9NZveyiRvAP5Skuc0A2k61PKvmhBNa7dMXjo+8Iu/SV2VtG/s
   TE0LCV+zRoOcGDMlHy3SljUVng88EVgWkhTNg8JbFf8YfHFye1ai+f13L
   EPW0s9no8PphAQbrVnxZOg//ky7UboTJsHhhdm9rSsu70lHXpiN0tyR77
   4qFu96z5aClJgd+IP2ICQQGl7jVKVCSpJDE4kvF2JSpRdfIQmrb2t94rz
   w==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="178987176"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 06:49:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 06:49:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 4 Sep 2022 06:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddlSnYE8e7ZXQMwiKp1a639NQu/UPQj9mheOhWk6zR+/rLVfqbXwMqzY5V5y63jEoVjQyuJi8/R0fllSsAau3oTiW3lDhHVeBX4U1GmWVj2OQOY4DBX4E/N9VR5YOTmB9vxMGs0MHNR77J7y2vp7OPQ9yOjh1o5vACe42mxZSuXocrCNIZKG/qo/rObug9wDcBclpSY4AfNAFKQMXohPNV2g4gOzZHKqunyQj0osmDv58pBjvTAAAC7BsECYgPOdr0B1JSMaLhu+fwNsU1fZ4DHL937DSzOZdQKamD3jyUcAbndbShIbxo6XtGqgoA+cyHWx/4c/xvkRVryiBP57GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ew4CboirgueGJHBF+Budl880uqcyJRG7HCe07KL9FNY=;
 b=SM6bUDEVbwPcXHkjYU5vI4NhWNblVjf3Xlq6SXM2h5zB0yKQIVIsmKOVmDv0yAZphtUbrpAoDvVwBqwVgeK2eY9yq++OUuUKoDbzIw3KSF85Yrta94l9l4yM5hfnHOzyEygWYR6Ok2/0u3S0Lxxg+FxADPT+Adu+yBs1LVlVVFYqQXd53iaTlLHutE8V5SFQ79yOrVs0OF0EKMrGfixkd0eSnI6zQ2AQR0n8LT7D2AJrgfZpAgpuuvP+QsrC3rYPmB72YzrL5K9Vm4KbaPpP+t4ocnNf8ChE9xc8ImiUTVQlxU3RjUQgHCPeKEENDrJXBTJeUKeCDXN3QODWSC9+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ew4CboirgueGJHBF+Budl880uqcyJRG7HCe07KL9FNY=;
 b=s+ttDLAYdnCAy+HSwzey+64BRXJikT+/WCQAXdSxUA0SALVlP4APHEyv/U6QyzY3fzOcEMdp15tT4cRH3LAc1sGiyEtmr6IiFURaXMuFPFz1+zKaMgJ7PvW2g22R5hhPPn7pzBnCYpk5gkj3avDR0SC0Ru5fVBLomrA0ceXf8U8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Sun, 4 Sep
 2022 13:49:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 13:49:32 +0000
From: <Conor.Dooley@microchip.com>
To: <tjytimi@163.com>, <anup@brainfault.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alexandre.ghiti@canonical.com>, <guoren@kernel.org>, <heiko@sntech.de>,
	<akpm@linux-foundation.org>, <panqinglin2020@iscas.ac.cn>,
	<tongtiangen@huawei.com>, <sunnanyong@huawei.com>,
	<anshuman.khandual@arm.com>, <atishp@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<falcon@tinylab.org>
Subject: Re: [PATCH v2] riscv: make update_mmu_cache to support asid
Thread-Topic: [PATCH v2] riscv: make update_mmu_cache to support asid
Thread-Index: AQHYwGPrK5mEUolM90m5Gg8OY7SJ1a3PSYmA
Date: Sun, 4 Sep 2022 13:49:31 +0000
Message-ID: <7e17ceaf-6648-e099-d526-8b698eaa5a04@microchip.com>
References: <20220904133710.117263-1-tjytimi@163.com>
In-Reply-To: <20220904133710.117263-1-tjytimi@163.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb0a6b91-0e66-4c19-fb6c-08da8e7c4b75
x-ms-traffictypediagnostic: DM5PR11MB1899:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G7HwX72RqGJQooz5vqQ5BdhSHNQWCMq8llF0DYwEd2PYzsBReGgYvagcXV3UwTEOhNj5rjECEUNbUPBopt4ctt8gsIFsVbawoO1Z8VxnBZ6v+S/c8b5B3sPXy9yplONvmvb7Xxp7ExiAa1eluLAKYaR1MeB5FduYRhqr15MVD7cfU7YnFk8zIfCfVOeUG9S74q3hl/6LHTniUV70gdPpSDcri3G+E37OrbiCZVLEZSodsAVb8mrZNZrKBslQKqX8zKRTjiMnr4UojU3i5hBgf/4LiSgofCHp99u+rFzL7THXlZ2oEpfKkbYTsndEMbtbwTfNsY3C1gu+Mi4HWB5j/8UYA17GVN2YdUJKzSpz8wsLw5WZeD/FRiKW0MVd8+H2m1CiLmBbb7BySVKgG4XeR40q2Lvwt+EOSPNaiEIeHkXEuKxuSCwvcec7bjM9QylbyZj9ZrMpioO8dAQviS2GWzBD9dsnqq0iY9jYJKHNLyiTcy5i+DsJMOinEt8FdlxOQT+F15XiA3vrejQUi+dwKandVa1ydxNzPVTlXs8KozFsImZNAHHnWoubMpxTLb68XgeWGxh1JlGu2gO+E0z597g0AqvibiBrUw7q3SS+qOAgnpLwiLg+hXNsAMndk0sbGGmo4S0HpMpNO9+71bBfJHbO/yiqsQocQd3IH+ZT02HUoU3d1i4LWtvZ0yV0Cvwo1CyIwmu0qUamOwfHeWbYhqTfIxKmQS+9J0O0+yfrc4YxAGhA+zOdUB3TyWzTZXY17nDpHkuuFw8myzU8fpucjDv+sx1vmQMbfHctGAsH1SAvm61a3XMvP8iPzyQInObvyfBqpDNP0kkfqkAsehS74YKWqiqCkzYjrAIqb93eYcw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39850400004)(41300700001)(478600001)(71200400001)(6506007)(6512007)(26005)(91956017)(66476007)(64756008)(4326008)(66556008)(66946007)(2906002)(15650500001)(76116006)(66446008)(86362001)(38070700005)(31696002)(36756003)(921005)(31686004)(316002)(110136005)(54906003)(6486002)(53546011)(122000001)(38100700002)(2616005)(186003)(5660300002)(8676002)(7416002)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTcvZ1F4elRRKzgzTHVPKy9CQzhFc2lsZ0Y5VEQyeURoMFVRdGFqRjZzeEw2?=
 =?utf-8?B?Q010OU9OQUI4bnBlcXc4aTk1SnZvSVVlZ1dCSXpOYzhUTG12M0RITmpZWThS?=
 =?utf-8?B?dktCMXRyaHVkSDBha3hCS0RmSVpoVzhiSDhBTVV6NnNPVjFzTSs0bkhzQ2t6?=
 =?utf-8?B?WTBnSTl4MDRUeVVQMjlEM0tMd2JrRWc3cmoxbEg1Snl0NjJveEorZGpkVXBS?=
 =?utf-8?B?S2R0Wis0UkVpUHV6T1hOT2lMMEJzQWFMaHMzNTlFSUZOczdIa0kvNGt0d3Ri?=
 =?utf-8?B?THBuVk93Sm1IOE1TMXF3MVk1bFpERmd2M1gybWlDSXNyVTl6VHN3VGdoMzBq?=
 =?utf-8?B?S2RQVGNzOS9rRjk5aXdnQm93NTU3SmFCVzE3NWIzSXlkOEpSV3V5WXVIbE5l?=
 =?utf-8?B?OGRseDFrSGU2bEdHRENndWkwOG5xQ0lMSHNFUjhNWllTWkMwcGloUmR3RmNY?=
 =?utf-8?B?NWpoZFZDeUJtYmF6STlnSzNVSUxCcGVCdHdhekVnYXRqL1E5OVhFZXpjanBB?=
 =?utf-8?B?eVR4QmhwTXZ6YTBWbzJEdUE5NjRUb1dGcnQraXhxVkhPRXQzTEJhMDdDNVZM?=
 =?utf-8?B?UVVEdkplek50ZUlqVHBmK2ZQRlFOdnVJUXd5Q2ZsbHJnaHNCd2FhcWdMTWdD?=
 =?utf-8?B?QStleVFNK2ZIMjZvWHl2RzErTS95NUJscCtKeStlUWxEaXBYWWhwZjRIOC83?=
 =?utf-8?B?WjZ2U2JlZjVQQnVYZFVWMXFjUERRNzB4d0FVQmRDNVVwa3FzdnUwU0lscW0y?=
 =?utf-8?B?YXgxeEczUXlqZGZJSUJZbzBoSU1SQWlZdEpoL0d3SVpwa2xWMm41a2thUVJq?=
 =?utf-8?B?MHo1bmJkWE1pVUJSUnhWeEI4UWtUNkRKaUN0WGVRVGJqS2l4d2ZLUU9rdmIx?=
 =?utf-8?B?ejREeU9sWHVXdXlIYnRaWmdPZzRUemlETlVRM01BcHhuVjFEVkJpYXRnZ0Vq?=
 =?utf-8?B?TGg1RUszT1I5clNTWGRUWmh4a2NJaU1kZS9hSmhwbEs5bTZSSDlLMXNURDRS?=
 =?utf-8?B?LzdaWVR1SjdZbFpkUWJBaWU3UzRTUGhwWFFEZDJBQUxLVDE5NjdPc3lKbE5r?=
 =?utf-8?B?RmdrSkswYnNmT0VGV1MzS21pOEZxM0ZqTzM5UHMvSUlBb0ZzazZzcXRwNzdm?=
 =?utf-8?B?Z3BLWWlPRmhFVTBYelluMWRWcXhhd3BwWXE5cW5kZ0lNT0hPWEpybngxYWRz?=
 =?utf-8?B?ZkxBVEVhR3JpTVlCYU1VdU9lV3hjdlptTXc5SDg1cWhOQkJMdEcvUkFOd2c3?=
 =?utf-8?B?OFhOS0VyUDcwb1RIZkMyYnpTTlg0bnhRS1M5c1pZRzRqK2dObU0vTEZoM2RI?=
 =?utf-8?B?U2gzWEwyY3dvYm1IQ1BSeGkyWDdFaVhGbXBQVVhUVEtHTTVWT1RLS1FzcWhr?=
 =?utf-8?B?QVVzL3JzWWdELzRqWmo4WGg0OFJ6c3pvQlZETFdxbE5kQys2eDE2QkQwKzQx?=
 =?utf-8?B?a2t5U2xsaS9uY3U3WVBRdGdrYUFtNEZYMlZqVThPcEtPa1dwbTkzWS9waFg3?=
 =?utf-8?B?WkdnVE1EQXNMamlKNFg4ZjY1VVQydzV0TEY0a1l6VVNDNkl0TUdxVlUwNzk5?=
 =?utf-8?B?UEVrMkl3YWovNlFoQVBGRFgzNEtNM1FzeXY5aXlaVjl2bnpmTk1DTS9kajFt?=
 =?utf-8?B?cE1TdTgxamVZYnRiMnMyWjdGb3FLaldVV1VqRVZlTnA4TmZLYzJhVnhwdUh2?=
 =?utf-8?B?bitONUJ4dUxYK1hZZXYvZllGM1d3aDkzU3YreFFaSHc1NEF5d21pNTg2ckxC?=
 =?utf-8?B?aHZvdVdsV1JCWlNXbW9OdkVSSnEwZ0ttT214Ky85Qi9JcG4rdkpPdGM1eEtB?=
 =?utf-8?B?ZlAwSlhXKzUxKzQ2ZzF1UEZMbDZrZG9JbXBSbjlLdUZ5NHpQN28rVWdoVk1O?=
 =?utf-8?B?Yjdvc1BPcHF3Q2pDYVVubHNYSy9SU1RSMTE1U2NDMTNMWHNzY2lTdW9PVUp0?=
 =?utf-8?B?N2lyeWJzWWZRQXNZN1VuQ2dlcDhGbS9BYTBnRE56Qko3UjFhTW4yeWhSZ3o0?=
 =?utf-8?B?bktpcVoxL213TnpDRUVGS0FncXFHdHVxMG1NU3dDS3ZvaHV3NUlmRExnakdh?=
 =?utf-8?B?VEUxZEZyaFJjeFFXUnpUYytKQVIyaEJRZWI3Y3hIWXhzWXo3ZmhVZFlraGhq?=
 =?utf-8?Q?m9R4oYhqMN+SWzSB9v/fxcvOU?=
Content-ID: <38AE679CFC243643B069B1621BD2EB03@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0a6b91-0e66-4c19-fb6c-08da8e7c4b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 13:49:31.9302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQ+6IVnsRfDDlLUeW4Khi4D0sWsxdeF+eLO2MuaV1aY3+TH5S9Mva06C6Q590xIoFpSih613xVxalgpj/FsQJpoH0gObDWIMoZQzy2kE2f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_064943_113404_183A3536 
X-CRM114-Status: GOOD (  19.94  )
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

On 04/09/2022 14:37, Jinyu Tang wrote:
> The `update_mmu_cache` function in riscv flush tlb cache without asid

FWIW, when referring to functions please put the () at the end.
Makes the changelog more natural to read. You do not need to make
a v3 for that though.

Thanks,
Conor.

> information now, which will flush tlbs in other tasks' address space
> even if processor supports asid. So add a new function
> `flush_tlb_local_one_page` to flush local one page whether processor
> supports asid or not,for cases that need to flush local one page like
> function `update_mmu_cache`.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
> RFC V1 -> V2 : 
> 1.Rebased on PATCH9 of IPI imporvement series as Anup Patel
> suggestion. 
> 2.Make commit log more clear.
> 
>  arch/riscv/include/asm/pgtable.h  |  2 +-
>  arch/riscv/include/asm/tlbflush.h |  2 ++
>  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..09ccefa6b6c7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
> -	local_flush_tlb_page(address);
> +	flush_tlb_local_one_page(vma, address);
>  }
>  
>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 801019381dea..120aeb1c6ecf 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
>  void flush_tlb_all(void);
>  void flush_tlb_mm(struct mm_struct *mm);
> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end);
> @@ -42,6 +43,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  
>  #define flush_tlb_all() local_flush_tlb_all()
>  #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
> +#define flush_tlb_local_one_page(vma, addr) local_flush_tlb_page(addr)
>  
>  static inline void flush_tlb_range(struct vm_area_struct *vma,
>  		unsigned long start, unsigned long end)
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 27a7db8eb2c4..0843e1baaf34 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -41,6 +41,17 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>  		local_flush_tlb_all_asid(asid);
>  }
>  
> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr)
> +{
> +	if (static_branch_unlikely(&use_asid_allocator)) {
> +		unsigned long asid = atomic_long_read(&vma->vm_mm->context.id);
> +
> +		local_flush_tlb_page_asid(addr, asid);
> +	} else {
> +		local_flush_tlb_page(addr);
> +	}
> +}
> +
>  static void __ipi_flush_tlb_all(void *info)
>  {
>  	local_flush_tlb_all();
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
