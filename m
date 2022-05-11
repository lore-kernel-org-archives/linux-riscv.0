Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA53C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLeRXGNpH8/KJ+NRdDjuXnkhs+rdPKyKI51B3AiW43w=; b=PoDAk/hPdFxyg9
	h3e6d9as5nSQ1GQbgeGYlJxsvBaGfEVv3/6mm/IwWmDMqLhaYrUQa2AcCMC23q8ZCjzfoPEpOX72g
	xNcKV9ff6fMsT4VmsafyqF20IPosniR06TF0/3hJYFGhkVLPW/DGB6vT4nHcd8/tK7KX5Rnm1L4Ic
	3EwrE2CPobsKNlbeE00KpZk54kto+/Bq574h9p6Nnai7bGZO73Eg7Hy/zHNIjddbDy0pDcv4J/UoU
	mZE+yS6dJmnrEJaIGEWmhVntGw3E8Sg6NXh6LVxO34PbuDrflTpVArNYagVaK5ARlMQ5pfnwjqXc7
	d5xegGOPD9AfH2GtFPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noka7-006VrU-Lo; Wed, 11 May 2022 11:32:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noka4-006Vpr-2Q
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 11:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652268755; x=1683804755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mO1eQMxb1y7hDEnQBFFyxNaop8H2Bu1R4FdlFzBSQEU=;
 b=YPVqmI4M8Gi3IqMjbDJMM7/+m8Qyjahp2d2bFyDGjnQFplLnCdolnV/1
 FKO0XSKp0d/jNStlQRI2q9TQDwLT8pl/QhcLzEF6ju5B3jWrer8X1/Otg
 mv4vTUVQzzLi0jP0KsLYPzFeD6o3weEWvd84LoSVHA+iKp39iZQ3DSOrn
 i/hu1tvjWbIMedZ7/pk1C1kchNrRpv/ru/+NvtPoL6guD2vu8roukrlaJ
 xZ+NK35/97QhJmreFf1l9dfrpqbi/0eOv9Do/tOwKeuDA2JdCB9+pnpTe
 ezntWTGJfXdpyZqpZoQ3DUA2SvKC135DghKm6hA49n3b/cr4I9RNzhbZa Q==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="95328625"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2022 04:32:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 11 May 2022 04:32:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 11 May 2022 04:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqQcYTBaR/5C9wUw8H9zxg+g3n929k0XYoRoc/KRn+2ASX0j2YgMOtA9D8pBy0DepcMEUQ2fI397BeNeJpW1Bri7KIu0v8eZfkjxmIB+3VohuHywBEMFj+hTev8MusmKxOb+mIr9sxK7TqxurfLcKfCYXI0vWaKQFDBEKIH9C8/TOW6sqBYCTrJ22W+d1vBbSjFW5eufrpiKaZLtZ6F5K7BGpCxV+xv85RbmYIguMnFsMkkHNnlJYcVnrYD7qi/zq8w53MiejqAJHyyXCjUZdat2A0Vu0IDNjQmxSiDcK3KpQpoL/Gb5S3dZj1QCgvl0TW8ak2M7tyI2gKAyVMw0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO1eQMxb1y7hDEnQBFFyxNaop8H2Bu1R4FdlFzBSQEU=;
 b=hzWV1p/DdIS26j8uLYe4Z9AIjBZzu70Hzph79dopU3bUqCt0blEp0a1Mk2ZCD3eH6NaTgJCvp+JZdYpbbqVPpzkvY1xqDFiHIrtnpqqLjcEEOewGa0usK+zxm8+RIxqSGvjOQhFC16wqT2wBrnTdrh6R82Pm4dveZG9+ls5+BYoJdwd23I1H6BYQM9sgreVUbHqHlVkQMDAjZEoQmE3z7YgH1gNAXMjx6r/45P3QlVq9oWDa7ZIlgP6TN5Phd4rEYqqDXu3h0WBr1tUboQlT/kQh2YC2Y8cdELGuPdUaL5uuLbLNguJ71l+PbgjzHwF9u2q22uPCYbFK7EJ08N7dtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO1eQMxb1y7hDEnQBFFyxNaop8H2Bu1R4FdlFzBSQEU=;
 b=ZhoxqbRyI2fX019JaQJQ2jsMlZolQGakBjfLDDhc1scvNpL3dPaCPFVfx6dwIVji6JgITYkjXqZI+6bLF8t3UKxeHGLblYDuyy+PDmrrdbcvQOogFC+trPobl22qzqrWCeft3Dq1eULn6gLqhCM4z9Y6ohhWQXX487GAFOXtZMY=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by SN6PR11MB3519.namprd11.prod.outlook.com (2603:10b6:805:d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 11:32:23 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e%8]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 11:32:23 +0000
From: <Conor.Dooley@microchip.com>
To: <xianting.tian@linux.alibaba.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <akpm@linux-foundation.org>,
 <anup@brainfault.org>, <wangkefeng.wang@huawei.com>, <rppt@kernel.org>,
 <alex@ghiti.fr>, <twd2.me@gmail.com>, <david@redhat.com>,
 <seanjc@google.com>, <petr.pavlu@suse.com>, <atishp@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <guoren@kernel.org>, <jianghuaming.jhm@alibaba-inc.com>, <mick@ics.forth.gr>
Subject: Re: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
Thread-Topic: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
Thread-Index: AQHYZSm8+0TwSlE59UKl1CUeebE3tq0ZitGA
Date: Wed, 11 May 2022 11:32:23 +0000
Message-ID: <c6c9c8d2-cc6b-cd5b-a066-44bd970f9292@microchip.com>
References: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85363d83-d753-42b6-851d-08da3341eac2
x-ms-traffictypediagnostic: SN6PR11MB3519:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3519C337DBA0C3CF1DEBF27A98C89@SN6PR11MB3519.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7QITX0YsrZYVwcZocLxxTq7LMRfuPZ1LnbwlZeBU9RI0iU2ZYwNT7gXHPW3nrfn7JIraiGxb6f+JK2avDVnMS18TQmv9sp1CYO4o7hUuP+7poWmtxz9MkLOTVxj8p5cfiCXvNsSWJIiqejzNyy5gfjnNUDFb599/Ld49xGP85Kq4e/yoWx60cqC8KaciL7bZwRevT+jabHHVPXdMuiOPWXs8s4uwDiPK4z0qEMouxfRD1/CjWVisQrlnLZsvyrQeMN0CgCFG4BWsOSenFkXZAvyGWIcR3uYQbypcWEezvINXwzmNZMi34HBS9ZAB2EgbXQi5pIOqBycZNaI2EyllE23OFEPvT9LqmJPoX3iCDcLo2xHjsqXyWlnNdk6YGCvxJ1lb67Kt/J79BaNcjyH1XvXMABlZMRv1SiUlsarQijqq4uLgi/POYplCV2MTOcELNteQdU3caIizUvcshzzhtdQHuK2JcJfXqe3/xfkMN4irpmGA6XlY0FlK9i80B9h2T+iuyt5JbZFGDRwPwRYksliAQbIXsv/PCUjCIanWnTtq7YJxwIAQdHj+cm81G751PHpA72pRJ+hjcr7VXKLImKyvYvNlcv8rXq/OQcyJ5tyEDhYPuRZvGpqL4zrxGIab7T6+/uN8vprJl0MbHGV0bsRtfftRZMo6K9p0/Y6R4PY6AvaP+ZFfmjJhSLHogwHEYa/urwFtoqczjSyi/zBMX21u3Tty0LQR2ZOraYecEwGapaSa1CQqwCorWQv6w3uGokwD1+t3YsY7eKISvsMnlLjv0nDC/zbYK7/ouA16Ybs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(38100700002)(31686004)(76116006)(36756003)(4326008)(316002)(66946007)(66476007)(64756008)(66556008)(66446008)(2906002)(8676002)(921005)(71200400001)(110136005)(54906003)(91956017)(122000001)(86362001)(5660300002)(186003)(53546011)(6506007)(31696002)(6486002)(508600001)(8936002)(7416002)(2616005)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWI1d1U5RGtmV3lObEQ5RkQycjFzMlByVGJ2YXhiTHJ2NVFsMHZXYUQ2OTBl?=
 =?utf-8?B?MGJWL00rMGpnKzlsVHdaTXh4dHVCOHQwMjIyc2NoNUIzVWVBemtlRkNndVlz?=
 =?utf-8?B?Y3pxNWU3QndxN1k1YUtKVzFMZVZWMnYzb0lJYVpub0JzNUFRd3k3cG1FK25o?=
 =?utf-8?B?V0ZLUnAyQ0ZJWVNsVW54ZjhWYjZ5YXVuWFIzQTI5dU1Ca0JTbSszeTBiZzRw?=
 =?utf-8?B?dERWU0wrVnJBVzJVRXl0dHNVTStuR0lScHNLdEVIWWRLdXdYeG41NTRoa2ZV?=
 =?utf-8?B?WVdVeFExeE5ydHJpUXhWTDE3aXllVGhXR1RwNHV2dVJIOHFzdnJRQUdybnRh?=
 =?utf-8?B?RnFteEdpa3J2d2pKTUlhR2hiTVc2QlQyUVhSTTNaeWtyazdVMjBCRjB3S2RT?=
 =?utf-8?B?eUh6SUMrS3AzS3hTbkN4R2taRVJudlJ4QThxVy9sTU1scFZLNDY5NWg4T0cr?=
 =?utf-8?B?ZlV4ZS9LK3l3RnhqTXgveUtmeGx3dXZmVFVLM1NMdlM1UHVzbm5VZGdUdElv?=
 =?utf-8?B?OUc4U29iVG1ONU1leEl5UTRWNXhrRUJoNUhuNndLVFMvcXdLZkhXTmJDUVps?=
 =?utf-8?B?cDkwNzVaWVl2RkNrWXlEOEd0TlVDSGFSMCtQV252M0dQdnZYM1RqR0dKMGtl?=
 =?utf-8?B?V3lUYWJLdklqY25JOXZUVDNEM2dNd3p5Y1l6K0gwMEVUbTlaY2c0ZEJkOVpP?=
 =?utf-8?B?ZFlvaGJhSTFlZ2YxK05LZm5KdzFKV1NHaWRETGx1c04wZDNnMVZtTVFSRUVO?=
 =?utf-8?B?b0hwOFJpbVQvYkdha0FLdkJ1RWFRN0FoWU5vczIzd0wvbEwzanhERWoyVWJW?=
 =?utf-8?B?WVQxclloaGo1cmpLNE1HR2dkRm5ERWFRTkxCbW9QUlZXTGV0WEt4b2VWR0x2?=
 =?utf-8?B?cUFzNVpQTExTY1Q1QzZ1dkFJYkcyU3lzTTRLQU5TL1dNbUE1eXFKRmg4eGVs?=
 =?utf-8?B?c1pZZmRqb2ljeVhMVVVtZ0RITmdQeHdqdVR2MWRkL1RSb1hrZFYxbkZTR3U3?=
 =?utf-8?B?R2JpU2dEWCsvM0o4R2JtdE0xcHlTNWdvQmNaU05LeFZhRU9rV1Q5TFdkVlZt?=
 =?utf-8?B?SDRpeStWb2N4UlkvSDZDRHMzV2dVMDMzblIrVVN1WVZ4L2d1YWtpS2JES3VC?=
 =?utf-8?B?S1BCYjBuZXVwMDZXbGgzNlREU0NBbzI4em9RblhGeHRzWU9mOWFaQVdhY1lu?=
 =?utf-8?B?UWQrcTFFbkk5SU1VYkl4ODhnSWh5T2l0UjhCakFhMWE4Qi8xSm43V21XWC8r?=
 =?utf-8?B?N0xzTnlsd1VzSktOL2NsVUVodHlXQmhTOW1JVFFkVzZsVExBd3NCSTFoc3Zu?=
 =?utf-8?B?RnNRTTBFWG9Qak9JcmlPVWtMV2liNi9CbVNUb3JRTksraGhPakVtYkR1dDZC?=
 =?utf-8?B?SnBQQTR4ODV6T3JBazNhWExmUHp1M01RM3dIVG85VkVtSkkyb1N2M3VueFVQ?=
 =?utf-8?B?U3I2S1V4QmJFWUsxV3RoWmNOd25ySDBJeHYxbUVEMU43eXE2S3VSdHU3ZGNa?=
 =?utf-8?B?d21WbStNRCtwUHU2d3Q2V1J4bFBZcnQ0bkNkekJLSUY3ckREM2RvUVRsTWFO?=
 =?utf-8?B?ZEUxNUcxMU9ScnUwMGpQOEltbGkrTE4rdUdBMzJPb1pTbDczZG9McUhwOVdZ?=
 =?utf-8?B?aHQrMzQ3U2lFVFpsaUd4MlM2aTZJc3BRbTJLejRzUDNTNHNuYjhWaUpYL09p?=
 =?utf-8?B?MzR0ektqODh4ZzB4cVp6L3ZzK1F5Smh2am9COVFuREhVaklEaXNaYkFCUnZN?=
 =?utf-8?B?MCtYanhNR1JpQVY1Y1FUQXVrUmNVeWc4WjdreW5UUVZoUkxjWGtPWUF2MzY0?=
 =?utf-8?B?OVkxN3R1MVRSOUw2TndXK2RTcWNJelJYS2NsNUJpc0JHSHhyMmQzMFdIU0FR?=
 =?utf-8?B?SUFNTmozMUhJSFhyZG1WVXVmSEJiQXZ2QkVRdEU0SDZIVFJRSTRpNVAwaFQ4?=
 =?utf-8?B?T3VZZDJJbzFIQ1crcmREREM5R3B2dzg5Z2c5ckVkalpXVWRCeU1ZMXU0bmxq?=
 =?utf-8?B?SXVTeHpRWXN2VHBZT25vTmh2NmFqUVZ6OHZlbERCWkg2MCtHK25FTGdzSHNo?=
 =?utf-8?B?TU1kQTJ6NkFSUTdsN3Fld3RQR29PdThWSzd0Q3JwSnRrNFcwZnlUa3hycmZo?=
 =?utf-8?B?Umx5YjFrRys1MXAzZ3YrME9UODQ1VDJsNDJrU1pia0NZY0plUXhOWUZNV0FI?=
 =?utf-8?B?VEREWTY2ek1SYXJZNUZjelEzb3FpcktETWErRFNCbU00RlFiU25FSjBmNlZy?=
 =?utf-8?B?NndRNVdnbi9FVUZ2cHVDQXpKRE9MWlFVcUJZR1RIdlZMSDVMeHpVZXp6d2t2?=
 =?utf-8?B?TW9Gb2pKRmNPVWplUlV2eTBISHBnTlVPWnRtRnhpYXlWbHlmQ0JiZz09?=
Content-ID: <3C59E3C7818CA94F94738865FAA2D230@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85363d83-d753-42b6-851d-08da3341eac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 11:32:23.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OAaNNf5ifp/H17fzJTslwduYEODDrfDNgf9sy0EJzdHpJioKjBl4nO1n9N7Rqbmzo0Hi8QD4xasE74xZDUShCa0ZJ1gjLyTvoFDRI2Mq6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_043236_466334_806A478C 
X-CRM114-Status: GOOD (  12.16  )
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

On 11/05/2022 12:24, Xianting Tian wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> added IORESOURCE_BUSY flag for no-map reserved memory, this casued
> devm_ioremap_resource() failed for the no-map reserved memory in subsequent
> operations of related driver, so remove the IORESOURCE_BUSY flag.
> 
> The code to reproduce the issue,
> dts:
>          mem0: memory@a0000000 {
>                  reg = <0x0 0xa0000000 0 0x1000000>;
>                  no-map;
>          };
> 
>          &test {
>                  status = "okay";
>                  memory-region = <&mem0>;
>          };
> 
> code:
>          np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>          ret = of_address_to_resource(np, 0, &r);
>          base = devm_ioremap_resource(&pdev->dev, &r);
>          // base = -EBUSY
> 
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> CC: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

Hey Xianting,
This resend is no different to the patch you sent 5 mins ago, right?
Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
