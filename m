Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMEEcZHdVOdeTcWZFGDTslzLis2M05ZbRPX0v8NA21Q=; b=xq7jvEeVIhCXud
	+hi6EyhDt1bu7IBM/Rqg5ZyEtjt3dTyVP9GIkOYUJW7lLHtkZio0JAWfRcmfFkQYC87w3AHQs/NqL
	i5SMSP9WcGkVBVKLk0/ATmy06m+8PryKIAS/PYwTpf6j5/TzfdKfL8NIPJCeLuW0xwFLV/+FxC8Gf
	cN3a+tNs1c5Da98OHph5TUDObW4QFa/el9vNXHVKCswxy8AmFPESS6UHaxNR0Yaw/k6S13BTpnkSD
	vnkzx8sl3mn8ueOluq7WpTlS258p45TwU2GD/l8/zuaKuNX5K5Wr5rG32hwIIeZk7+F2/lPS6siKq
	Jq3K/IGve/SVNTDqeAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtAXZ-00GOuP-4p; Fri, 03 Dec 2021 15:32:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtAVa-00GOMT-5k
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 15:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638545398; x=1670081398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BQVBdw9ub4AzOmVnnqj05ewBY2aSt7kpeSd9QmXANJs=;
 b=CmH0IXHGTn3amMnmWlphBIkqPyfLY9ho7Scy5207XOr0HS5NEfhzuBPj
 BIeyXY+Tq2I/OAF5ar0UWQ1S1MBQZwh8AVQnCoSnwLJetjm3Cv4t7fFKW
 nV1mkAyKnHAfG/qM6f33T7UTcutQj7x2lCk2qwXGCqgD8RdCj+ksaOHFA
 1RmM6oBC8FTI6bIeyvuha99vTea3ip4TKrxPz7xeC/BfuoE4WlfRdVV4a
 6VXfNnG1cawUBk3e0bTGosAnsBNwaoYbW3EaGBsiXOUzWvcuDtnmwP19Y
 5kq1Y59FnkSY/0VTRz246X9Popu3z0Y01v6HQjTwTYgULGEXR/mac+GSF w==;
IronPort-SDR: +p0rzD0s7HWU7USV22VXiI+iHS57JUDmt7QK6E+BtnuUpmPifNASgV9s6JNpm7jzqPGQ3/WOhl
 RekxxkpQCcTF85x2JIHndT+JHJ2SY26WoJz/VI48qrqz6Ty11oxtjDNsmyRuZTm3zoSiLdkEgI
 BaE4QW1PwMn1VjU3E5uNs6Ap3kpej2vLBBRBsEmpCf5zreUpl+Ogm7jFXtXYRiHT4FWzf3VsA/
 wP+nBqanQgJo54IWzRuoBjWmOpc9zknblmQWpZ+axi3vOe1KJpDYl74glSEpiy1tckhjSTY59f
 mg9tuL2J8klS1tpvfToVbZht
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="154182599"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 08:29:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 08:29:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 08:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKknIseYJSuw0E1IZdBijbK6VQKkZpZNqAsQMgK1SmWe0myYT3/BodLpz1YozRRTyo2sB6RHY+N4DBGGFvYuyyrrJjaerlM9nT07X1fwm+yAMtnzto3nN/s03D8axk/WdPyg73Sod65nVDPBOi8AozRj0ZLfPjGLt5JoPQwXTNa3HaXijbGY1JTNGn+nwQa52InyO245BymGjZ8FlZ7phtp7hIMxzQnyIyvMjqm0ij6m/4SvDPmxsDaksilcab6hJpdp5GlrcDaoAyoiD2V/3EfoSLIkqCcFmhFUxgPIm16qiJI2cHFNCuKfPURXee5X2Enb8ynX3B4GviHcgU+o0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQVBdw9ub4AzOmVnnqj05ewBY2aSt7kpeSd9QmXANJs=;
 b=bQY8kMGsCwpN+no2H77G5AT7+swEM3yzJido6mi5+hHYWgOoGvrumzFfe/gzBzVUadD92EjmxLsC8HL/vm+F1Uj7qHogwNNzgOClNCRu2S5zkHwDc+HSMvz3/tgnq6H/XMYcgvkvHcWMP60yOkq1I0EP1YCbmCP0SNCRrokSl8k+7tJr6sSgqjXMV1LmSRxGd1ISsjjdB/1QiBGgQhsh+F+iANTzH4zMxk/ETtVi1aNjKGAhw0jSZ/5RyJ4nyWp/T1p374OEdYLOWXrBrZFQ2W8b7iQYaDMt7VZQ6aUuJdVk4b9S76XEkaSFZiVWwjkQG1ASPXVzbv8wUynbWw9yMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQVBdw9ub4AzOmVnnqj05ewBY2aSt7kpeSd9QmXANJs=;
 b=tsjotKBAee9FBE8MTWvSVn6Va2Q5uMLFxVrmtxRnHr2yerReAS9UwPhWN6w6dhy8tYhB/KphjhBqeoQXAfb9YWzuSKIGQ3AmufzLABhWJVDfZoyZvUdEjhWJ3tw/m1vBR4+9Dsj/lWa3pqk8VsgfADH7gWlPpxefVAVVAjFYY6A=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 15:29:23 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::f896:5b6a:7c35:fe37]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::f896:5b6a:7c35:fe37%3]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 15:29:23 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>
CC: <devicetree@vger.kernel.org>, <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <robh+dt@kernel.org>, <damien.lemoal@wdc.com>,
 <Lewis.Hanly@microchip.com>
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Topic: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Index: AQHX4hGSnfyPBPrmmEGmKCXbzlxSC6wVkVGAgAAH1ACAC1g1AA==
Date: Fri, 3 Dec 2021 15:29:23 +0000
Message-ID: <738f161a-038a-b6f1-1ff7-65674ae75d06@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
 <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
 <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
In-Reply-To: <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e21830c4-3bf0-43c0-7aa6-08d9b671af3c
x-ms-traffictypediagnostic: PH0PR11MB4919:
x-microsoft-antispam-prvs: <PH0PR11MB491984B9BFE7382E64C63E48986A9@PH0PR11MB4919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ii8KwERvynHBHgUcsL9dg6CaPi5SLQJOH2ifTPD8O0HxwW0zmxAr7XyzEPW/MomJ6pd/CuNFJTAMgZy0EVECeJI1+jZgkwP4/vPtzTyAm1pwEWjb/ZAn/VcakutnN+IfI8yBZ003629Zafvf0XwB+GowUZ29lEUj3qzSA8NeiM/mHXnf5mOdOhR5bxOqIpnWI84DmsZjbbSKPXL8gbNP0QB7QkP+5o4S5LxImz1BNFOfU69opJPEZ6+S0bqiLfDpCvipwvk8FeNMvFMy8D2ee0F9me812PiadD/5/3WOq/yQt1GzI0gXMbxAxnC3lhMgOavXivbW3eeBecjvLxMO/h69L2TAF8UEZFLXbW+fAjFujXiEnHe6x+q+q6UiWs/iSwwO8U8/r+jE3T242ZubE4n6L38otg1gqs3fXYvilc2KOhesRdO2jsCEh+oX4z46tFqiQ9yaXFCRAqq6uJUBnMo+bMEl05rDUnKMAgEJIC/qGdeFi+bXKK3HOvYTlfzjs1LBdp19b69hJjeG5l2ZtW96+A44zjqiyYlgcRll5UGRPZM0T+Kj7oTsXZ9RyrnDmxh4YxYF/97h2BWbldKROMDspshjsLolbVeJISYiZXN/ihkLmaKY2YX94/1dKn2IBLLjl741xaovu5PLl5kwQxno3HarKckbZNvdCmlEyr7tF4RCXNK5U8F0KF0Nuva1J/FVovX+Lw6Yy3XmSX+RSlJIqZ0oXPjm/9E44VMECV+P77P/NrrVdqrJW9HklaCK6TZ/otHB3SPJujf++eC3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(316002)(110136005)(36756003)(26005)(71200400001)(38070700005)(76116006)(54906003)(122000001)(91956017)(38100700002)(53546011)(6506007)(4326008)(83380400001)(86362001)(64756008)(508600001)(31696002)(66446008)(66556008)(66946007)(66476007)(6512007)(5660300002)(31686004)(8936002)(6486002)(8676002)(107886003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?di83cGhOSkpOcUc4NzduS1d4MGdVMmVEaUhtdTlsSlFwTW90SjNHbTAvQVBv?=
 =?utf-8?B?dUdWK21Eb0EwQWtmYW95ZExXbzBtM1hiaGtBcWhDTndRaFhjR0xrZGVJZlhU?=
 =?utf-8?B?KzYrT1psdWEyWTgvNStpVmVjazNQTnRQaXNtbGl5MVlMWkJHUGtRQWdSamgy?=
 =?utf-8?B?QmtkOFhMZU1OOFJYVjc3MnpWWm5mT0x0ZXBmRWZ2ejl2dys1bG4rQzl1dUUw?=
 =?utf-8?B?NkMwdlVPQmVvcjBlNEl6cHA0S1N0Uk9JczhLbmZsQ2lsdTlVR0VTaDNEZGhG?=
 =?utf-8?B?SldVRjlkcmZxMEdpa05ONC85d2RaSlRpMUYzR0ZsbjQxRW14L29YU2tRczNW?=
 =?utf-8?B?OWo1eCt2WGVsZWRtKzQzLyswVzRneFh3OWxQam1tcmVRS2p5Y1FDQm8vd1VE?=
 =?utf-8?B?aVV6RDBIOElPMmJnSXVieGJVOTJPZ2tidmN1S012T1E0Q29TM2VHYWhJdW45?=
 =?utf-8?B?ZUhFY1dMMHByZVdjeDlUT3V2dzJkWWFBNmpleE5tU0pwK2lCakJCdjNpamcv?=
 =?utf-8?B?VER3YkY0YXNCQkN5dmJHcmVEUmdnd1hzS21LSFhRczAyZGQ1TjBNTktuVjJo?=
 =?utf-8?B?RkptN1o0QlVOb2NRdjdhdUNhZkladjNnM0E5TmlSZjRURWRUa1MvV1hWV3NN?=
 =?utf-8?B?RmZIVHN5T3Q2RnZweG5WdkkyNVUvSWNJWXJ2R1RwMHdSWlVadVBrazJpMW5j?=
 =?utf-8?B?b09aVnVDMlBweWIxYXBDV1MrbVU2UDQ1ZTRsSVMvdVZheE5wa0gvc0kwdFpw?=
 =?utf-8?B?d29HU3FqWGZBbmhBL1d4cy9MeXR5K0FoRkRSQTlKTHJsVHgyeWh6czhQWkla?=
 =?utf-8?B?a1NYS3hlQWJoZThpVmhOT1VoK09aSXhWOW1Da1pLd0xuWkZkUmZpTkhyQVNv?=
 =?utf-8?B?Vzd4ODZaNzNHZ0FDV0ZCZy9kTHg2QlQyTFdZYktyUlBxYXRNUzNwSG5BRE42?=
 =?utf-8?B?ZitsWGFPYlBxVTlKWVVxQi9MVDI4Z2xFL1hQeEhrdjVDSVhqQ3IxckpJSkZT?=
 =?utf-8?B?TXEzU0E2cXVUdFUxdllpN3VNYnpRZGhoOU10MnV1L2VCd0Fnb0Fab2E0YTJl?=
 =?utf-8?B?VHU2UW9hcEFoKzk4RE1MRjBJSHA0Nlhlcm5YZlV5NEIvZ3ZtMEVFWFdBZDhu?=
 =?utf-8?B?M2NNV0dTMTJLbUFoekk5b1BWNE9aYk0ra1o1akxiTjltSW5ubGdMQkVLbitG?=
 =?utf-8?B?V3BVQkM2T08wRWczaWJxN1AxWC8vMnVhbjNZQytLc0Urbk1GU3NwVExpYWdC?=
 =?utf-8?B?TlZMNFIvcVNOV2NhS1d3RjZGZTBKaElPbGdPWnJnVndRd053cWFCMnFpK2py?=
 =?utf-8?B?NUNzQlNCN3BoMkpVVE1MZUlKUUhmaVVSZmRqNEViM1Rncjg5dVFxSGc1N0Ro?=
 =?utf-8?B?OTdLSVl6cWx3NkxMenV5YUlReFBiUlkzYXhDa0JyYmFDdzl3d1ErUzU5dUVh?=
 =?utf-8?B?ckZQc3RNRHJWOTAwa1FMTkpJUGd0ZUZyWnNxbG9uWG5QbmVESkpxa0EyTXZV?=
 =?utf-8?B?RVZkTDBNd1E5MTFid1dMOWJoRURoWWl0elgvb3VjTE1qV0tncTREb1o1dlpB?=
 =?utf-8?B?Q0NoK1NwRWpRNXMxQ3Y1VXZYcmNRRldlWitzdVhVNDAyYlZYaUp2WWJUT1Bo?=
 =?utf-8?B?bnphS2FTdElEamx1R3ArTDFsdVNGeVZ4MkNGcU5HdG9KeTZuWDVCaG9EQVR5?=
 =?utf-8?B?NWZyRWUvTkxLdjVHSUU4NC90NndaN1ZOMG9HMS9DWVVPbi9QQWphcTcwbWtE?=
 =?utf-8?B?OVdKVUNlYk1CbXIxWGVzZThoWGUrQ25qczdhY2U4YVFiOFcrM3NGODY3Tloy?=
 =?utf-8?B?R0x0NDIvbzRtZ3gvanFCTE0xL0xlc0p6MlBWejBWLzZsVE82RG43dGUrUVdT?=
 =?utf-8?B?UldvM3B1akQyb0pDeUhnOUFWbzhKeEJCSWRaRFFWUi92TWtPaE84NzBlT1cz?=
 =?utf-8?B?U3FrVjNhWmNVakdtZisvNElOajh4NkE3OU1JYTJ2bHkzbndOWlEraU1kQTFm?=
 =?utf-8?B?WDloYmg0VXhhdDZSY2EwZ0FlWkl6aUtXS2tkTVN5MHpiZldZcWptWGgrVk16?=
 =?utf-8?B?NGc5b3ZldGd5TmRKUTNhL01WMnR2ejZvdTVkdUF4NWt0VVZ2dTNWdGIwZ3Ur?=
 =?utf-8?B?RXQxdGxlTTNRQ0c3UnZCSDRScFFXOHI1THJtcGdVeUxUeGhZMEZkL1QxNXNQ?=
 =?utf-8?B?SXN6cFpDa1RLaWRCK2VNKzFpTTFUeEFralM3VjgwV1pJZ095QXlKOTZQTGJx?=
 =?utf-8?B?Wkh3ZTNDSmZqNEVSTlVtaFJRL2VBPT0=?=
Content-ID: <C925325D9FDAEC4EA0734EA99906EF90@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21830c4-3bf0-43c0-7aa6-08d9b671af3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 15:29:23.6126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OTLrh/grH7gS9YDbjBvNd5Djx9dvrDRa8Q/ldaKP47maLe7/+pnovULF6CPAVHnlrwQZk85GUvNJJ5kfu8TmjyXZpDXBPeCkfEKLRZDOPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_072958_274736_F3F12343 
X-CRM114-Status: GOOD (  17.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjYvMTEvMjAyMSAxMDoxNiwgY29ub3Igd3JvdGU6DQo+IE9uIDI2LzExLzIwMjEgMDk6NDgs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IA0KPj4gdGhlIGNv
bnRlbnQgaXMgc2FmZQ0KPj4NCj4+IE9uIDI1LzExLzIwMjEgMTY6MzEsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4+PiAibWFrZSBkdGJzX2NoZWNrIiByZXBvcnRzOg0KPj4+DQo+Pj4gwqDC
oMKgwqAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xl
LWtpdC5kdC55YW1sOiANCj4+PiBzb2M6IHJlZmNsazogeydjb21wYXRpYmxlJzogWydmaXhlZC1j
bG9jayddLCAnI2Nsb2NrLWNlbGxzJzogW1swXV0sIA0KPj4+ICdjbG9jay1mcmVxdWVuY3knOiBb
WzYwMDAwMDAwMF1dLCAnY2xvY2stb3V0cHV0LW5hbWVzJzogDQo+Pj4gWydtc3NwbGxjbGsnXSwg
J3BoYW5kbGUnOiBbWzddXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUnOiANCj4+
PiAnb2JqZWN0J30NCj4+PiDCoMKgwqDCoMKgwqAgRnJvbSBzY2hlbWE6IGR0c2NoZW1hL3NjaGVt
YXMvc2ltcGxlLWJ1cy55YW1sDQo+Pj4NCj4+PiBGaXggdGhpcyBieSBtb3ZpbmcgdGhlIG5vZGUg
b3V0IG9mIHRoZSAic29jIiBzdWJub2RlLg0KPj4+IFdoaWxlIGF0IGl0LCByZW5hbWUgaXQgdG8g
Im1zc3BsbGNsayIsIGFuZCBkcm9wIHRoZSBub3cgc3VwZXJmbHVvdXMNCj4+PiAiY2xvY2stb3V0
cHV0LW5hbWVzIiBwcm9wZXJ0eS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+Pj4gLS0tDQo+Pj4gwqAgYXJjaC9yaXNj
di9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaSB8IDEzICsrKysrKy0tLS0t
LS0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0KPj4+DQo+Pg0KPj4gSXQgaXMgYWxzbyBsb2dpY2FsIGJlY2F1c2UgcmVmY2xrIHVzdWFsbHkg
aXMgbm90IGEgcHJvcGVydHkgb2YgdGhlIFNvQy4NCj4+IEl0IGFjdHVhbGx5IG1pZ2h0IGJlIGEg
cHJvcGVydHkgb2YgYm9hcmQuLi4NCj4gVGhpcyBpcyBvbmUgb2YgdGhlIGZ1biBGUEdBaXNtcyBs
aWtlIHRoZSBHUElPIGludGVycnVwdCBjb25maWd1cmF0aW9uLiANCj4gVGhpcyBjbG9jayBzZXR0
aW5nIGlzIGRldGVybWluZWQgYnkgd2hhdCBkZXNpZ24gaGFzIGJlZW4gbG9hZGVkIG9udG8gdGhl
IA0KPiBGUEdBIC0gdGhlIG1zc3BsbCBvdXRwdXRzIGFyZSBjb25maWd1cmFibGUsIEkgY291bGQg
cmVkbyBteSBGUEdBIGRlc2lnbiANCj4gYW5kIGNoYW5nZSB0aGlzIHRvIDUwMCBNSHogZXRjLiBJ
biB0dXJuIHRoZSBtc3NwbGwgY2xvY2sgaXMgc2V0IGJ5IA0KPiBhbm90aGVyIGNsb2NrIHNvdXJj
ZSB0aGF0IGlzIGFjdHVhbGx5IG9uIHRoZSBib2FyZCBvZiBlaXRoZXIgMTAwIG9yIDEyNSANCj4g
TUh6Lg0KPiANCj4gU2luY2UgaXQncyBub3Qgc2V0IHVudGlsIGJpdHN0cmVhbSBwcm9ncmFtbWlu
ZyB0aW1lLCBJIHdvdWxkIGFncmVlIHRoYXQgDQo+IHRoYXQgcHJvcGVydHkgc2hvdWxkIGJlIG1v
dmVkIHRvIG91dCBvZiBtcGZzLmR0c2kuICh0eXBvIGZpeGVkKQ0KR2VlcnQvS3J6eXN6dG9mLA0K
V291bGQgdGhlIGZvbGxvd2luZyBtYWtlIHNlbnNlOg0KLSBTaW5jZSB0aGUgcmVmY2xrIGhhcmR3
YXJlIGlzIGEgcGFydCBvZiB0aGUgY2hpcCwgbW92ZSB0aGUgcmVmY2xrIG91dCANCm9mIHRoZSBz
b2Mgbm9kZSBidXQgbGVhdmUgaXQgaW4gbWZwcy5kdHNpDQotIFRoZSBjbGsgZnJlcSBpdHNlbGYg
aXMgc2V0IGJ5IHRoZSBmcGdhIGJpdHN0cmVhbSwgc28gbW92ZSB0aGUgDQpjbG9jay1mcmVxdWVu
Y3kgcHJvcGVydHkgdG8gbXBmcy1pY2ljbGUta2l0LmR0cz8NCj4+DQo+Pg0KPj4gQWNrZWQtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4N
Cj4+DQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gS3J6eXN6dG9mDQo+Pg0KPiANCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
