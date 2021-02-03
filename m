Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6892C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:38:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3923564F84
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3923564F84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nLYkxkvptxdEyEDXysU8iACYnEuhB+2TA0O7AzMByhY=; b=NHyz2F2XL3Oz1IdYUiXEXWI7I
	dzNCNvELnwX+nS635X4/z83YhqHmq4cUMn02/+tlvjdyG8cUDnA7e8NubfzcbJ00ckVJ0eDCzvwCf
	FWsBdweYI7SwfmY1UnAIryHcXR/sziLB6jvwGnneJZtqrCTTchIjYpb6a5LnL4wycRvVT/giIdh7i
	A7RT7ujxj/Rua96wnwzcRDuj1ZT/wCDJ05UxUn17AYbbu2reQJOkytNNQObq8ytVfX7DW9d4JqOrJ
	uOWbSQURA+otIXt0F2kY1rcfpB07xK6zwfqCocovRz/XFExLis3QrrASNZC2i+PlNSSD9NNyfG0fQ
	vmcygV4CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HQg-0002cQ-3M; Wed, 03 Feb 2021 12:38:42 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HQb-0002an-Bq
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357012; x=1643893012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=naT9OvLTUosYkt2Ockrja29DFDpVPcu45OkQXS5f7gw=;
 b=Wzz9FMXPd2Xfpvec/fDdKvk0VVGgwtyB1hOjiayrLmOuCYrlDPAjHxca
 2UOHJiUP31YLMb8KmT8EAIFCF8sHP4Ewn8cfs+GdzyVBMGzZVTo7E1Nfs
 81EJ3lp/RGqLK2VXUsgzxC2y/lgCtU3wCvYBtmpaXKhESNh4Er5nyMPwy
 w6kwPHKgrzzdZFxdNVDdRINbPRLnpc8YQjQvnDWa2/kPSZOhdKNtdHjcn
 DAr+6I+LxN1x4Qh/fCw4Tckv+Z2VNGwySw0pj4l60m/4EAF1vlU7aNNkX
 VHqgnIXXdaHlAW4HnHbU+QnoGZMnJtv0uMkI+u6C5iDuoejL9fQCZQtE6 w==;
IronPort-SDR: dVrJoyKSzXYLpa6Ca0FgiNnZF8lcu9XsfTfaeVhwOSKWFqEMIWH45fmqd1bV0jv2bx9NweNDBT
 ipm4DN5FLj+OzNtcD7uJIDTnqiUtplgM1X5b00TnFgDIB+W98mvEKIk0059FSD/LpBtyQEKVac
 gAUvcrzNJYDamNVIrcfyZQ/C2E1LBcTManXb3dOJoMmacQUeUbez6/vCaO0L1hnipcZ8jSkI8A
 qyEwDzVhsaTwawY+V8qDORKImBZNFLZpo6blPGFK3X4g0OkejYRSF5nvBjOI9hnoUYkL70pYmg
 deM=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="263105992"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:56:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR60PClpWM2fXBimBkizBXs4O+NtfT7NrWXym1N1Ktb56jLLaPyk/MDdT/GEwABeVqYyg2PKlVstgKD3aL3zb0G3CZNdwXxaQXXIHB6PSuadPT0KXF8e8wU37Foek1AAPDAhty7z8+qc6ZPCnAQqmXBJ8DI/VLPDzvhV/+WybTSKvKwumN+TeQz/Fuk83Yc18bcSI2IuzlZ1k7LI+UgU1HM0mP0kYRvjFbrhWyScoMTUOlNKkkkW/wDjr4CI3HIbvU7VZRSLgljzRipZjiyXMLjTxNXBi7cW27vnmT/FHpP9me052c72LtuJonLH3GlRfAzkFZXEuWKjLmulKy97lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naT9OvLTUosYkt2Ockrja29DFDpVPcu45OkQXS5f7gw=;
 b=Vv7PgN0sfMb/dF+HGyt9MCS9ZAwS+iTzazxtW8T55f9eRVfQfQqVQeEuIEhQ1NtUtXPpmj39m5qm19QlFfQ6zsz9vvpOXutweeNItOYrJ9dves9v8TaoeuaLlguf6tAPMQFU+DbDJfKpKeQZD7psYyhGemoQAkS0MS8LagFXasfhacYNY4jCY9MFgcR7mh3xGlUvxu6JPsUUhGazAPxa8SI8bKGxfS+/2LaEvdKti4EgT6lxrfVliYKT/m6Xa9w4wGUZGG9A1dj8Jd63LOLvYi+hhRR9UzTX7dW8stRDWBVgMwwUo5QIemqiAmkkIwrglfMmEtigjVqoe/S42UOEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naT9OvLTUosYkt2Ockrja29DFDpVPcu45OkQXS5f7gw=;
 b=Q0Ci6S3L57NIWYSENUgKVBUuQuH4dD9sVMxxZbNCfgZrD2JmyOm6g2bnbps5da7907S7iCQdSSl95ykTLs60QSutjox3tY70JUxzV7Iyi4N9qJzXywzz+oCEl27sAf4akys33mvPQqCFBN+T0eAlNp0/URiFQqVqbWEqyZJMbwI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4609.namprd04.prod.outlook.com (2603:10b6:208:4a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Wed, 3 Feb
 2021 12:38:30 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 12:38:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "atishp@atishpatra.org" <atishp@atishpatra.org>
Subject: Re: [PATCH v14 04/16] dt-bindings: update sifive plic compatible
 string
Thread-Topic: [PATCH v14 04/16] dt-bindings: update sifive plic compatible
 string
Thread-Index: AQHW+U9Pb+lH+K5RoE+Q4owdWSDG76pFL02AgAExBQA=
Date: Wed, 3 Feb 2021 12:38:29 +0000
Message-ID: <467aabb1c33707b0ac5d3367326d08e5a47bf460.camel@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-5-damien.lemoal@wdc.com>
 <CAOnJCUKZ82o_BihhJ-1WmUhjiiUDrUc7Wps7JRLMrDeWA012uw@mail.gmail.com>
In-Reply-To: <CAOnJCUKZ82o_BihhJ-1WmUhjiiUDrUc7Wps7JRLMrDeWA012uw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ec4e31b-7683-4eb2-3fc1-08d8c8409c69
x-ms-traffictypediagnostic: BL0PR04MB4609:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB460904EF9B7329214645386BE7B49@BL0PR04MB4609.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MeRi6VYkV/ltwM4LT/KPQp0Cba25zzm9cIuiA/3NUU7/DDfIdFtiHXw9TvyST+cQBi0HuVNDSbut0YLdj+lQJHqoRpJPpIUNaN2me0RzZGbthurKBOPr1IBIcsEPJ5aphdBkJJKG357wOW9R5ZqB+sXAKAodonWUddxPdt6ts+LrjXHlQXX4RfBGk6QoihdW9wGhPqZRQntcHbrf9UR7jRNxDDBBzKHei/H65Yto/s0ETIBDweoOoNlCWoZAUZC65OrmFwW2wf+/879rXshO5LhnUDmIocTsNJ9qw4oTMhXoSi3dT/ekDA7RRNeCd+8pv8qZnYHPR6OxEYne0G88CQHwXIAXTkCJOjkHP2r3uir/joHeSVwVyEwF5zvnOBcNCOs7kkCj/c28zA0PZx6zd+Yjhva0QSL4HUGKcQ95ePZRhWAE4hqro675ZzyfasJpff2cGy3tnpL+i+syldVuU2enKMeUe2ZW0lU4/XbGKR7V+ms28v/GrNLURwLvvuIsAI9NPDLq7se1fEkzfJSuvct+gbt3uZdYe4oIugv7XRCBVAfEyTDX7nsOE0oHJsXeYKGxggF7LZTdRrq+q8ddQ7+6xWa0rJuKQtr/UP/4J8w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(6512007)(5660300002)(54906003)(15650500001)(2906002)(8936002)(8676002)(316002)(6916009)(36756003)(4326008)(478600001)(71200400001)(186003)(66946007)(66476007)(66446008)(66556008)(64756008)(966005)(76116006)(83380400001)(91956017)(53546011)(6486002)(86362001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VWtjQUJCaDZ2NGZYekFETDJpdEtoVC9mVlRjdEhIWU41blR0MVNKeWYrMlRX?=
 =?utf-8?B?NmdPRk4vSDFGYkxKS1FoeTZ4QWVuRWpGVHU5TzR5VzRVV0FndnE1ZkRmcUNF?=
 =?utf-8?B?TFJTK0RySTN5YWZXaXZmeU11V2RyZ1dHamZZY2kzNFZYaHFCSktub29zbm52?=
 =?utf-8?B?dm5NOVgySDhWK1JkN0d5enhBZEd1eElBY1NmbXF1NkQ2NDBtK1BUWUlFU0VL?=
 =?utf-8?B?SkQ1UTdxU3h3Y1dOZVBpK3Vxdm5NNWNuR3pXSVM3dFdrbzJOaGJLVForTFVs?=
 =?utf-8?B?Ui80NXFGTTM2QTJSUDhmZFZVTDlScDhhMFFkczdNVHhIOEV2dkQ5WU54RTRl?=
 =?utf-8?B?TjU5ajJXM2NIczViNzk1MnZyZmQ2eDdQVDVrOStITjQyd0VGZW54NWlpQ2t3?=
 =?utf-8?B?NFZLYWpPTlEyWTlCTzBaZGpoamVCRHVwNDZDSjZnWDl0Q3dDTUFUZXlmRU5o?=
 =?utf-8?B?cGwwTmhJWVl1TDhoWTdOLzQ1RE05S1pXWFF6Q0pzRzRmTDJpclJET2psQ2Ja?=
 =?utf-8?B?d3J6UWs0VHVpTUllN1ljZnU5TUFnaFdGTTh3NFZEbDhEaFN4emJjSXVRUERi?=
 =?utf-8?B?bmdOaHN6enpySENqR284OWJid0NacjJ1SytHYkNtKzlBUVQyTGQzcmV1M3Ex?=
 =?utf-8?B?U09PWnMzdEZZNFhNRTExellZYjRhQWZoU1Brc1NKSHVzWjlhcWNYOGxpcWJN?=
 =?utf-8?B?ajkvZlVaNHVrUFhkQ3VOYkFiZDcyajNZTVNGSGJZN3ZLdndXWE1xQlIvT1FM?=
 =?utf-8?B?N2l0c3hyNmRrQ0t0MlNBWktubnZKRURTTEEvclVkWk92UEc5ai9tV1ZoRTdr?=
 =?utf-8?B?RWI0MVpYRVVjSUFBSHJKdEkvNU1WQjBMN2FtL3pSWlhVamJOT0VnU2pTS0tQ?=
 =?utf-8?B?V21ZZ1Q5SmZXdktIeEZGc1FzemtqRzczdkJtWVRpdGdsU0pqYUpvekI0eVRZ?=
 =?utf-8?B?WVFKZXlQT0N4R09ieitDR0U5SHkxMHhoQXY1STY3b3UzK09rZ0dZbDYzVzkr?=
 =?utf-8?B?QUhONFFsYUxyRUN6RHpoa295ZGpROVpVVjBOTXEvMW1iYXdRbjd0djZOaWpm?=
 =?utf-8?B?T0lFUnpzRXFkQzdwMkRualBLY3d1dllRV2F1SUM0SCt5U3VJaTRPNjY4Ym02?=
 =?utf-8?B?SGp5YXZqcUIyM0F6RHd2ZDB3YisvWGhibktEam9tbFYvUWtoL3pNdkR2M0wy?=
 =?utf-8?B?SEZLeGlZMW1TeTk4SmdkYUQ4UGswRHVKU3VEc0luRDFJVnpEelA3QVhHU2Jo?=
 =?utf-8?B?dVY4bUNHejdnaUFnQkQ2U00zZHNkbHVFbFdzWGd5bHlSckpOVUx0N3hBUUM3?=
 =?utf-8?B?YXFYM2ZXblRjcW9ybTFpREd1cjdUS3VHZ21iTVRQTHloOEx6Z3RlS1lTZU85?=
 =?utf-8?B?L1g0WkdvL3REOGx0R09ENkQ4c015K2pSOGZMTGozeU9RRWlkNVo4WGNRS0d1?=
 =?utf-8?B?VXFZeEloUk50alV6bUZrcXpvOWoyeDBWVW5Vdy9UZnoxb1lFTUlSTWtxa241?=
 =?utf-8?B?ODNIcDhKQW41aWRvYVBLUDhiQ0JEYWxIQjh0TmQ2enNJckttcmg0dXBLTkNX?=
 =?utf-8?B?amM1OXBNeHcyME1JaGZ0TXowdGV5Yjlpa2Zyd1FEMWpyT004TmR5ckZXOW1D?=
 =?utf-8?B?ZjFHcmd4emhBTjJVUEJUbXFUK1MvWXRYb0l1NnVxOXN4YWhpRmhMVHExaS80?=
 =?utf-8?B?RTdZUGN0b2c0R2o0d2wxb1p4S2ZBZnIwVjROa0I5STRUL09ERTd6eUFOOTNx?=
 =?utf-8?B?T1ZkRE1vZEM3OEQraCtMNmlZK0doR2hpZFh4V2dBMFVmNkFJT0FnZTFPMnJt?=
 =?utf-8?B?VWoyWWhtNjJ6OWFzUmFXaVV4TWlVTjFRUCtpSlU4dTFieGphK1l4cFZnd0Rh?=
 =?utf-8?B?VWVQZnBPR1JBc2tDeVIycDhmK0ZxYXBrTjl2RU5kZnlycmc9PQ==?=
Content-ID: <A425DF393505744CBA029808D666B639@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec4e31b-7683-4eb2-3fc1-08d8c8409c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 12:38:29.9515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbnSjAh8AMI39TWZPIU4oIAoz0W4h6mVdn4zKYDi8niEEyLb+L2xbgsdZYg18yCLY6ZGmnMIUXYkdT0D3oaDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_073837_933751_D7178DCD 
X-CRM114-Status: GOOD (  26.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIxLTAyLTAyIGF0IDEwOjI2IC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToNCj4g
T24gVHVlLCBGZWIgMiwgMjAyMSBhdCAyOjM3IEFNIERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVt
b2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
ImNhbmFhbixrMjEwLXBsaWMiIHRvIHRoZSBTaWZpdmUgcGxpYyBiaW5kaW5ncw0KPiA+IHRvIGlu
ZGljYXRlIHRoZSB1c2Ugb2YgdGhlICJzaWZpdmUscGxpYy0xLjAuMCIgSVAgYmxvY2sgaW4gdGhl
IENhbmFhbg0KPiA+IEtlbmRyeXRlIEsyMTAgU29DLiBUaGUgZGVzY3JpcHRpb24gaXMgYWxzbyB1
cGRhdGVkIHRvIHJlZmxlY3QgdGhpcw0KPiA+IGNoYW5nZSwgdGhhdCBpcywgdGhhdCBTb0NzIGZy
b20gb3RoZXIgdmVuZG9ycyBtYXkgYWxzbyB1c2UgdGhpcyBwbGljDQo+ID4gaW1wbGVtZW50YXRp
b24uDQo+ID4gDQo+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNv
bT4NCj4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiBDYzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8
ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrLS0tLS0tLQ0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4w
LnlhbWwNCj4gPiBpbmRleCBiOWE2MWM5Zjc1MzAuLjNkYjg2ZDMyOWUxZSAxMDA2NDQNCj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1s
DQo+ID4gQEAgLTgsMTAgKzgsMTEgQEAgJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gwqB0aXRsZTogU2lGaXZlIFBsYXRmb3JtLUxldmVs
IEludGVycnVwdCBDb250cm9sbGVyIChQTElDKQ0KPiA+IA0KPiA+IMKgZGVzY3JpcHRpb246DQo+
ID4gLSAgU2lGaXZlIFNPQ3MgaW5jbHVkZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgUGxhdGZv
cm0tTGV2ZWwgSW50ZXJydXB0IENvbnRyb2xsZXINCj4gPiAtICAoUExJQykgaGlnaC1sZXZlbCBz
cGVjaWZpY2F0aW9uIGluIHRoZSBSSVNDLVYgUHJpdmlsZWdlZCBBcmNoaXRlY3R1cmUNCj4gPiAt
ICBzcGVjaWZpY2F0aW9uLiBUaGUgUExJQyBjb25uZWN0cyBhbGwgZXh0ZXJuYWwgaW50ZXJydXB0
cyBpbiB0aGUgc3lzdGVtIHRvIGFsbA0KPiA+IC0gIGhhcnQgY29udGV4dHMgaW4gdGhlIHN5c3Rl
bSwgdmlhIHRoZSBleHRlcm5hbCBpbnRlcnJ1cHQgc291cmNlIGluIGVhY2ggaGFydC4NCj4gPiAr
ICBTaUZpdmUgb3RoZXIgUklTQy1WIGFuZCBvdGhlciBTb0NzIGluY2x1ZGUgYW4gaW1wbGVtZW50
YXRpb24gb2YgdGhlDQo+ID4gKyAgUGxhdGZvcm0tTGV2ZWwgSW50ZXJydXB0IENvbnRyb2xsZXIg
KFBMSUMpIGhpZ2gtbGV2ZWwgc3BlY2lmaWNhdGlvbiBpbg0KPiA+ICsgIHRoZSBSSVNDLVYgUHJp
dmlsZWdlZCBBcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbi4gVGhlIFBMSUMgY29ubmVjdHMgYWxs
DQo+IA0KPiBUaGUgbGF0ZXN0IHByaXZpbGVnZSBzcGVjIGRvZXNuJ3Qgc3BlY2lmeSBQTElDIGFu
eW1vcmUuDQoNCkkga2VwdCB0aGUgdGV4dCBhcyBpdCB3YXMsIG9ubHkgYWRkaW5nIHRoZSByZWZl
cmVuY2UgdG8gdGhlIEsyMTAuIEEgc2VwYXJhdGUNCnBhdGNoIHNob3VsZCBmaXggdGhpcy4gSSB3
aWxsIGZpeCB0aGUgdHlwbyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBzZW50ZW5jZQ0KdGhvdWdo
IChqdXN0IG5vdGljZWQgaXQgbm93KS4NCg0KPiANCj4gPiArICBleHRlcm5hbCBpbnRlcnJ1cHRz
IGluIHRoZSBzeXN0ZW0gdG8gYWxsIGhhcnQgY29udGV4dHMgaW4gdGhlIHN5c3RlbSwgdmlhDQo+
ID4gKyAgdGhlIGV4dGVybmFsIGludGVycnVwdCBzb3VyY2UgaW4gZWFjaCBoYXJ0Lg0KPiA+IA0K
PiA+IMKgwqDCoEEgaGFydCBjb250ZXh0IGlzIGEgcHJpdmlsZWdlIG1vZGUgaW4gYSBoYXJkd2Fy
ZSBleGVjdXRpb24gdGhyZWFkLiBGb3IgZXhhbXBsZSwNCj4gPiDCoMKgwqBpbiBhbiA0IGNvcmUg
c3lzdGVtIHdpdGggMi13YXkgU01ULCB5b3UgaGF2ZSA4IGhhcnRzIGFuZCBwcm9iYWJseSBhdCBs
ZWFzdCB0d28NCj4gPiBAQCAtNDEsOSArNDIsMTQgQEAgbWFpbnRhaW5lcnM6DQo+ID4gDQo+ID4g
wqBwcm9wZXJ0aWVzOg0KPiA+IMKgwqDCoGNvbXBhdGlibGU6DQo+ID4gLSAgICBpdGVtczoNCj4g
PiAtICAgICAgLSBjb25zdDogc2lmaXZlLGZ1NTQwLWMwMDAtcGxpYw0KPiA+IC0gICAgICAtIGNv
bnN0OiBzaWZpdmUscGxpYy0xLjAuMA0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gaXRl
bXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUsZnU1NDAtYzAwMC1wbGljDQo+ID4g
KyAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUscGxpYy0xLjAuMA0KPiA+ICsNCj4gPiArICAgICAg
LSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGNhbmFhbixrMjEwLXBsaWMNCj4gPiAr
ICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4wDQo+ID4gDQo+ID4gwqDCoMKgcmVn
Og0KPiA+IMKgwqDCoMKgwqBtYXhJdGVtczogMQ0KPiA+IC0tDQo+ID4gMi4yOS4yDQo+ID4gDQo+
ID4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QNCj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdg0KPiANCj4gb3RoZXIgdGhhbiB0aGF0LA0KPiANCj4gUmV2aWV3ZWQtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiANCg0KLS0gDQpEYW1pZW4gTGUg
TW9hbA0KV2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
