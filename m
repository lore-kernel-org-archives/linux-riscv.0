Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46465C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLqskC0mt6fk1hO7R/d8NtAfk6wTGOTdhyvvNYFyfi8=; b=0CJM6QNu8i5ROk
	DoxAjHe5AKUkLTczt3t1SpNBcX+t+9vIf88um4gc/TKELmRKV9XpXGmrw62LSu62ar7zhcyZcho6k
	Ho4MObTeketacWQiCBEvZP4Q83BbzcRwmKXB5W3RgRLCEJ74UJl+FzSqQsGYXLSZtw3uIUs+w4b6u
	sI8UCYdFfTLOg1pVHx1T202ZErEeTcCDVDs/KFl3c1TF9GXubu9F9Kt5BuLRbm+DN8o6UToqkIw0X
	saWHxgvw2pu+5N81xtSm6KP6TxNsL3Pch3Ua6WFcK+InrtdJWWErT0S6xKtXP002UYJgkvojyo1CH
	J+o484e36fBLVtArCpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Obr-002Vht-G2; Mon, 20 Jun 2022 21:06:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Obn-002VgZ-87
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 21:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655759215; x=1687295215;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
  b=GepwvKtjLgwp3xs3NqjmWA78Ph1GUR3wySPFufbBrAmDqkVkfjvP4C9O
   7sdCeXdw42AC+b28/k1E0fGK55lZghh2XWCwkar+t25+fzc0IQ1IRv/TC
   te2+Hnb14Zpy9syt7rJZkd/ymfeJmQFFq9J8vQAAKwu65yYrq197b84A8
   Zr3gBDLfSo8mAfPXDgZelyYa7QUz3QEYY9Z82I60+OnK93nLfyXUsaPoM
   HWvnh227L63kPLTvB6MYKsyzZoElKRFizfcyaL8HafFkQV/44jk3UJLn0
   52VRNI3+dFugY25zXqklOUyjNKmsmzSKP9dKafKmAEPGYnjKtjqMcYzkQ
   A==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="164249685"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2022 14:06:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 14:06:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Jun 2022 14:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noAbmqMXRICSsWnVKpgF95kfDDHvAj4prw9TST8mAXuTHgmtcxDeUs00tWcMhQ3MzwSv1NNMSiT62v+TcEl1nXcs55XDW6wGEzIYyUkdVCKcmRCmCzgstfRXqgE8CENlRJwZ/iivUrT/T3pPjZPElLVt64qG3T8pslzvVAZYXYxPDLWotgsGITTKlrhkUYEkN8h9G5JNfuGL3dt0Jvy1ko0tD1efmBbr07FZVla1vcZ9ClEcaVdfFrkEWKUJFRU1TBYCDmDpnoLe2ZPC2Yf+y4JVh9dL64E3jQ4HYPe/MXqpk6DoL4OVmqmKH3Ri3fhM3UKje/QJW5E3eYeqDqgwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
 b=Zjs2AQzXUIln2SvwqqRa+YbGWkl2dLCZ9G33crkoYCu9xoNCqMbkpfeKAKw7YHKRQycDa4iWz5rmIWgUvjMv4au7egEzSCxoFKVe5Ma3OlUjzBVv0ZhF02RczO4ZWzXR609RbXc5yCPrYcmWVLAaet0UgVCUovJWzvmBpTxw4m1pMpgLHJaq3Pt7utq8QOAMbA32lry1GmJlJdBVlN4XQIdtk6F1IhBnih10LzA0B7XNU7I0PUc1NBUg46XFeyvEccUaRSYzWpfMbYSZ/SjiXsonSZ9vdeP7HVj4krtpd4EYcp7WnpQtNAxmwle5q0yha1XAIY8Epf+pVcHITyLiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
 b=sRiI9D/i6mfPIkf5HbO6F9TaaedRSrmbG4MrLyn2yLnIte4Tj1J0u8bSi5knPn2/dWCVlPF2kzHGixN0ag2Oun7SkygzTbxPVEvmyIDwiBNlN8Fvf2HcAbfuaUctNyU81kv3UTYyK0YNJH+744yxiq1IZrMm7mfkJX2BNefRsH4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1369.namprd11.prod.outlook.com (2603:10b6:3:c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Mon, 20 Jun 2022 21:06:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 21:06:34 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<joabreu@synopsys.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361YymsAgAACs4A=
Date: Mon, 20 Jun 2022 21:06:34 +0000
Message-ID: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
In-Reply-To: <20220620205654.g7fyipwytbww5757@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98191401-a40b-4860-4048-08da5300c1cd
x-ms-traffictypediagnostic: DM5PR11MB1369:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1369CCDAD4E9F13B1565018D98B09@DM5PR11MB1369.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGAIfuk63a/wCOaZyZHFf2quYMtxaAK935xqNhKBmlh1fs5bQJ58C3ozKq/haLipMqFbvnzQEVqW2w9qw0whgf8q2qHKjcNKASXBpweAPlStMbF/bl/l4bPGQ0LfsZLBItCSCSvpe48GCFY93wL3AgnEeoKX11biJJsi8mmBUHAoRlKN+R0PnAM9AKS82QDepaKptOZdeCfuNKdbd/g/46MlGe0Zg4SK6SIxD8nYCAbwG3DwYflLOKGi4bPKi5J9M/8hOS0FJWvP4IgmBMg5UnleGM42IdsehHHeoPRiMqFnfqRaTHcCq4WHHcSK+SFvm/a8w5GpsyykGQxfmNewS7NftdqV4EmDhvyZNqkS66D7HHMNWNuED2jZ/6e1wYL7Kj0lpK5a41QTlVFSM/SHRFP2/ViW3UJrtXQIZ2CDJaEyMMSZgUmOzlsVM84MaCBcdDP2YVwHmWjXEq8iFPOhhEJ8YDjuriiHSeukoHA3GblyfEbzyll/eMfxJzhW/i5raj099j1K81fCMCkZ4EX/b3LUZeblEiA8iNW5+/35Dj5x7OiqaoHVNXVojK0eC5u00zGAWgUifqwwAjhdgMj9vnItlbj5TvVaVVV1eEkiwdHnrKftyc8xLKhQnTk58ZruYmJtHeZJZrBAsInKdFcdcxaupM8vPJTUcodISptLexRVtiY9IM58aYhAIzXM/h7f4vD9mIoosmGMJPH6rr2s/HMUFXpltw4dcC6MUUGSUuM4ju0F433/CKKkC1g2BDhkP5/rKwU+IPGz1O8P1XzMvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(136003)(376002)(396003)(53546011)(6506007)(2616005)(86362001)(38100700002)(41300700001)(31686004)(26005)(6512007)(36756003)(7406005)(7416002)(5660300002)(8936002)(64756008)(15650500001)(6486002)(31696002)(2906002)(66556008)(110136005)(38070700005)(66446008)(54906003)(122000001)(66476007)(71200400001)(478600001)(8676002)(4326008)(186003)(91956017)(76116006)(66946007)(83380400001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUdXQ2NNeFNXeDRrWC8zSUQybE5VMStsUWxSd2YwV3RvRVkxaDY5YWp6b1dT?=
 =?utf-8?B?cFZ3UGt5RWtNUTduZG5xZnNBOUlkc3Qwd1B4NVo1V0RlYmVvR0ZJQXg1LzNX?=
 =?utf-8?B?dDFZd0xuRTNuZFpBclpIbXMvMDV4SlQwc21hbmg1RFpJUEp5Z1E2UFBTbEs3?=
 =?utf-8?B?Nk1wVHhlbzY1TGNYTGRlZ0xrK3dTeFFhMkJFVlBlU0N5REVXMHRJTUZGNDU0?=
 =?utf-8?B?VGNsb3hLL2dNWXBQUUdCckRGalNxRG42TG85ZlREbjlJcFlBSWQzVmVVTGNK?=
 =?utf-8?B?TlpBVVpLSnJCZnYxSHdUR0F4ZVhwTktET3dpd0xHZjFqQmc0ckp3ZDlyL1RQ?=
 =?utf-8?B?QVBtbkZCMWh2RGFJOEN4bjV3VkU2cHJmUFM3UmcxNTh5REhZVzYxMHFVYUhx?=
 =?utf-8?B?TG9aMUhBWFE5V0RmZXk3dHdHem1kT0UvMzBuYlVrVWJIZGt1MFZPQXpWdmFy?=
 =?utf-8?B?MDNMRUFYOWRsWlVNemRDcHZ3THdWQjEvYloyTUliUW5jTjQ4dnFYRjJKeXpH?=
 =?utf-8?B?YWM2VjIvbG5OUHc2anQ5SjBrUTE5bmRXRG9rMU83RTNZQ1JOcUZtekptY2ZX?=
 =?utf-8?B?TnRiUjlxY1UvOGRYR25FWkMxNTZMR1hMelA5T0l5SWlkbit0cktkb0I0ZFor?=
 =?utf-8?B?M0tNVXJLclY2ckpDV3F5UUVzWVgxMmRzQ3R5Mnp3NzhBK1g0Wi9tUlZNbVpN?=
 =?utf-8?B?Y1A1N2lldjdxOTZwUEMyeWJ0cThvT3AzTHJqYXF3amNzQm81SlZSS201Ri9y?=
 =?utf-8?B?REU3bkI3UWFrM1V5SUlhTWgyVE9HekpUdkNOTWc4Vk9VSmt2TEhjL1hxVWV4?=
 =?utf-8?B?UXNwNnlnc3VEVjFRVVl2cWd0a2l4bktWK3dNVTFLazFGR1d6eFUvNUlHdjJu?=
 =?utf-8?B?a29Vd0ozNmpIMEVyODNxdTRJckxyVW9Uak45UWJKS3FiaGhDdkRycGtYYlBZ?=
 =?utf-8?B?QTRDM0ZSR0Q2LzJ4OXdnSVZNamJFZ2JCYUcvejZQWkZkeE40T1doc1VkN3J6?=
 =?utf-8?B?L3k3ZzR2TmlpcXdPYnIxb29TK1dJRWxsc2c0RWpXM0JycGMxbmh5YVkxenFZ?=
 =?utf-8?B?N3Ayakx3eityZThQaXpySXdKdXJTQ2Mra0JqVHVCWVFHNmdDWTEzdzlvZkx1?=
 =?utf-8?B?NFp5a2VlUkdoa3BtN1lvekJDSlFheElGN3NvMFljMU5GbHd3bkhuell5bHpS?=
 =?utf-8?B?ZG9uY0dpdXR0Y3QrdysyVnVJVEFyODc3TlNEUzlBYWxweVRvNmpIMkF6RGJ4?=
 =?utf-8?B?dVlzZ3VaNDdaUzJwa0JlNDQ3bVpaaDkxMDBsV05BTE40cDhUUk16eExPU09X?=
 =?utf-8?B?KzhhQlhEM0RDV2lFK21hNFNhZkNRYTBtYXRYSDU5WUZ1ZVo5cTRHSkh0SFdl?=
 =?utf-8?B?Mi9FYm1oVGxnR3htYzdGSU9Pc0xERFNUYXNBNU1aVFd6TlorZzlMZEpKYUlP?=
 =?utf-8?B?dUZvdkZIQjdDSFR5cVNCN3ozY1hwc0FTYUlXQmdSbTJyY2VWRUlDcTFPNDhR?=
 =?utf-8?B?M1ZGbzJvTXpFdERoVU00bW5zb3h6bG8zN0EzWUZmVElFS21ONyswdnh1a1Vj?=
 =?utf-8?B?UWRieHFqMC9FaFVhM3pZOG80aHN5RG9tOWdibUFJZ01pZWo3ZnNRWTZBamE3?=
 =?utf-8?B?S3ZxRWtiQWsvMGlmQU9mMUIyczJ4SlFxK25xOFpyYWNQVmpqKytJVHdxQndN?=
 =?utf-8?B?MThvYnhBbkM2aHBEem1QUStscUx6QnM0ckVtZGM0eklHUUtWbDJvNVhWeUFp?=
 =?utf-8?B?aDc3OWx2R3VXRWhLQVRjTVoxS0JGQTBlMU1rK0locnRVeVhoRHg2blhFOTVt?=
 =?utf-8?B?QXBZb2U5bHNwT1ZEYWswcEJuRlcxcDlIcWh4WE9uNzRVOVVQR3NZd2Q5TnV5?=
 =?utf-8?B?OUlVajFGT0xyWlVuQmVxT2l3dGdacXg4cUQvOE9pS1RjYktxbnQzOVlKUDh5?=
 =?utf-8?B?N3lPUWFGNXBWaUZIUVUwZ2d1RmRjWkFjcEhldFp6R29wSldsajJlZkxRS1hh?=
 =?utf-8?B?R0d0aTdtbHlzTU45dUkvK0NPRVN1aEFhRldHUE1tUFlmOU9vNlU0Tm9LNDJk?=
 =?utf-8?B?bEIyUWVQL3RnM3NsekNuUlluUTRNcW9WQVdrODJ4czNhS1VIY0tQR0IxVS96?=
 =?utf-8?B?dDNRbjhDSnNpN2N4ZzlyQzQ3MkdnQmtVYXpHaFFyODRycFV5R3QzSjhGWTZL?=
 =?utf-8?B?cWdBanF5NFlublo1VUVYOWNXRHkrUjdDQTFjNTVmMG5CSlRGTzBLS09XZjJK?=
 =?utf-8?B?MmQ0bS85UldIVk9IZ1I1M0QzZTZ0TytwTVp3NXpGdTVpK2ZwaENuT0sydmxh?=
 =?utf-8?B?VE1NaTVxZ1Y5azROcE0wTlJUL3Vycmc5T1doVXJVdzd4enpjYTFtQU9UWXhL?=
 =?utf-8?Q?3OtIZlEhAggXJfIA=3D?=
Content-ID: <A3E4481921BBFB47A8FB3B3E0FA84B98@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98191401-a40b-4860-4048-08da5300c1cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 21:06:34.2593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robQqOLeTa72v7tn1QTiZ2ZLKcqQIOr6Cbc8j/N27Cw8pUHKiuFXXW9dKXV1zq9HKET4ihaQe2lYzmExHqbc34yH6/5SA5kbDXnmi7wVjoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_140655_640238_60E772D6 
X-CRM114-Status: GOOD (  21.79  )
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

On 20/06/2022 21:56, Serge Semin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>> this.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> index e25d44c218f2..f2b9e3f062cd 100644
>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> @@ -135,19 +135,41 @@ properties:
>>        of the designware controller, and the upper limit is also subject to
>>        controller configuration.
>>
>> -patternProperties:
>> -  "^.*@[0-9a-f]+$":
>> -    type: object
>> -    properties:
>> -      reg:
>> -        minimum: 0
>> -        maximum: 3
>> -
>> -      spi-rx-bus-width:
>> -        const: 1
>> -
>> -      spi-tx-bus-width:
>> -        const: 1
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: snps,dwc-ssi-1.01a
>> +
>> +then:
>> +  patternProperties:
>> +    "^.*@[0-9a-f]+$":
>> +      type: object
>> +      properties:
>> +        reg:
>> +          minimum: 0
>> +          maximum: 3
>> +
>> +        spi-rx-bus-width:
>> +          const: 4
>> +
>> +        spi-tx-bus-width:
>> +          const: 4
>> +
>> +else:
>> +  patternProperties:
>> +    "^.*@[0-9a-f]+$":
>> +      type: object
>> +      properties:
>> +        reg:
>> +          minimum: 0
>> +          maximum: 3
>> +
>> +        spi-rx-bus-width:
>> +          const: 1
>> +
>> +        spi-tx-bus-width:
>> +          const: 1
> 
> You can just use a more relaxed constraint "enum: [1 2 4 8]" here

8 too? sure.

> irrespective from the compatible string. The modern DW APB SSI
> controllers of v.4.* and newer also support the enhanced SPI Modes too
> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> run-time there is no way to create a DT-schema correctly constraining
> the Rx/Tx SPI bus widths. So let's keep the
> compatible-string-independent "patternProperties" here but just extend
> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> properties values.

SGTM!

> 
> Note the DW APB SSI/AHB SSI driver currently doesn't support the
> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> activated by means of the corresponding CSR. So most likely the DW AHB
> SSI controllers need some specific setups too.

hmm, well I'll leave that up to people that have Canaan hardware!
Thanks,
Conor.

> 
> -Sergey
> 
>>
>>  unevaluatedProperties: false
>>
>> --
>> 2.36.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
