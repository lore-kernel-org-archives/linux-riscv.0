Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94EECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UfpOgDMSR+s7YzaJ1ReMS0GwUSTdzKfgPoWptJ5p8Q=; b=yseULlj/BHjGXm
	jU9UaA6n1bS9bn5gqqMl4TUfcPS5FNYJ/VepE3I4KU/gzFvHIZFxFnNYI4Fzpg+vIF6+Is7/HAuHE
	5aldjeuAJ5cNXuintywkpy/azaE1NvpKIz5QGSye9SNC7HKoaIC761orBhHEBBOA9KNdFFWyUbtSd
	xWILT4znkPGV1hUhO/Y8wrnzkr5nFaQ2MtFcUT4d/P0WoiGi8LBO77qO/4qO/Q/AY++2VQFZM1G7S
	pVoNk5XgttJvuFzK1dFAV6B1wMOKV9if4NfY/dvgFtQ3+V6BtGdSoUOMAIwrxGy86k1c2v8vMY/gJ
	KaCEhNQ7WNg92HdLH77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJD-00HX6L-1Q; Thu, 08 Sep 2022 06:46:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJA-00HX53-LU
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619601; x=1694155601;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PgrCPsIXCyPLMJbOorLEuI7xUprtCBLgY4uocmanzxQ=;
  b=buvpSmTdzgqjMkXV3wFAxyIr+KTRowDBRMAOv6ZYTXk8K2gD9C+4kmaS
   Zqj4vNZbib7VjWY+m9wfxzwkq2rmW6dpo63/agu14g/FpL+7gd3YEIsAZ
   ULiQqjeX4NUeWXVHLFjapzeBOz0TN+o42apC17Hdpy0g4C5u5oJXm6Zra
   pLxJbudJ0E0YVnXjamGPaoqEq24BTmC0sOpMELgj0ntKF1jH8TIPzCgCz
   4Sp80eUZ5E9eddWq33hjZqNLpprePT2esXkiA6VJhcXP3cVqOhi/NcUyZ
   mi8XVjClEhu5R/LTpgp/LrwQBAibI+WaLtCro63iVYNOT6sMWlmQ96dYZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="172899142"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:46:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:46:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijzN5ZVPXSABnUz4GKYn1JDSpPxWhfLjdVGB6AnicQnjKNZ8ONCW+a1KRZPRLVDJ7IOwhfKQhMZ3i35PPb2s2AwDbz4fpIozXipZCxWzRISzyOb4EDgVZRWVSj/FrCjOqjnD1bEevavuILNeiwJeFfEafd3kTfSOMelYYYmLb6r7NG6e4NiLVYRWXRRHFQ2PYJ9WarclJosZzXgt+B0FHiUxBp5kWK3+6AbyFRT381lndkKev0EzxXp7hulWRMQ6XLpACxP9dVdVCuFOcr72Zqc/HxESKy74Z0Sf/gy3AmEe8kgyp+dezPYY8xMPR6kAm857ay1KNfIybhHneBRWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgrCPsIXCyPLMJbOorLEuI7xUprtCBLgY4uocmanzxQ=;
 b=GHnCekoEg61O4IHZmMVjzpNg9qXbEO8M6vg0ukvNtZcHKU8fp2Vyn9Gk7zkad73UAWhQYawzWeFgMl3m8hoXtT5wvLpu2z77xZCUIlTiIuelUqRwOjbv31dCT7fhTgETx6KdOJ0W3frjr6ax9DQYAyCRRBCbeh/4ObP6xg5I+m//VV38/ZtrZzzuff+vcveDqHaTYKUIOSJYMLblaYE3YWrebanmxqSfk0ktVllqRjfI2WI0UDPU64Vh60TSOCgf55V5yaQQabj4mk9S/UV+h1qSObfDpIqh40BmoZaJVHhOArdxiYSXNZSJsM7dmwuPvETYx4hagSFWloq6xsm3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgrCPsIXCyPLMJbOorLEuI7xUprtCBLgY4uocmanzxQ=;
 b=lg/fpNmO4V/Z23z8NhPgWXP+k3zs+au2TycnIzUclYPudeqCkLqNfAcgg2QkUvzGX4gRELgs5+6yK7kK6qtSY9dKFgmysKE9BIibSee1SYZxWcEFbTv7/ioa9lFPu6wpI+grolLfYgSbc4VWAEA5uvTQp/QJvruDxN5HycxniHA=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:46:33 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:46:33 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 08/13] clk: microchip: mpfs: move id & offset out of
 clock structs
Thread-Topic: [PATCH v4 08/13] clk: microchip: mpfs: move id & offset out of
 clock structs
Thread-Index: AQHYw06763ZHD8mV9EWJbRnhYDMd/g==
Date: Thu, 8 Sep 2022 06:46:32 +0000
Message-ID: <4001027e-9fe1-4902-5b40-b2d582aecea7@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-8-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-8-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0831e62f-be4d-46c2-3c00-08da9165de15
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cLpgaBthfDlBKsbMjkNYiS82AlIwKn/S9XmJLDvr+amM0/Ljqdu6+XCLdIZq7C9B7RR6nQ6FQVmnrhYk5A01kWhaBjURBiNv6FTOhYXt+DGXnTsLOm50U7c+Yu00yzrhY4Ivsw12P5YDjnAHHHGLeiQwHy72eAbRK4bjHj5UQfPeuiZ1OWpGHImAS0oK8IopbggZOP58jBTbTrZiLXfURAk2+fiTbCo13sle1sq9ydP9CotUDB4/ZNNHP2TiTDWWzunI3qNcFQ7YhbN/1Ojrcv6f7hOV9Il82kkIGv0n7W2+qhfeQKmXH1kSdV5VBRisDknIiNSRpbUAAS2rQjMLOBrKIPjrzb7sytzCR6TzWA2mw0BiIyEV5YAO43nlHuAe0pvMODRkPsVWN0UzO8YS5SdUMOSJ/HEnX+8YNnkraPkPJFxXGWT/81+EwEST/B2iW63QKOAB6eB+FUYOV1vxMKxkrZKehMnk+/MouG44+4KgEByEw8f2WSDXXqnIUyzxpcJZnU2GmwNwmIyPQKSoQahRMBq2cKFZ8xvvwktq/QAUnMI4tXk6VRSzcUAGUMe4+fJOYRtOFZ912KnetS5FNN2Rq68fiWIbatYZO0eVOVJaRQaurbz30YyHtzleBI/UDmCL3CtdzIOWAHwzADjv8SpZ6Mhhjgqq2D/SAGbkiFsgdqVAG66EoXTovn+dvYrLE8QKkqwFKBmxyHjqmmeTTWT1DLmU1bdhzbOWRaDEVqFeF1jBglP5LyIhYRwALTK7kgpeMOWbGPIPx2I7to/IxNa3LD2EMwMhHJsb5+bgW5bStbjHqEroL2eoCg3sDf0LqDQsKnH0lcJC6cABj1WRBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmdZemFXSndoT3lOWldTQmJYa0dhUEZPc2xzVnZMUWRVdWNINlFMZEo4QWRq?=
 =?utf-8?B?eTBkTUhYSHpmdVRTQmptMG9rd20xWnpSSWFYUlM1YmVGMittV2QybkZYWHFh?=
 =?utf-8?B?bW1UZjZ4OEI5dzlraW50bk9ESDlEbmVCMWdJRzNHVlg3UDZ2bVd0UXlKVWhY?=
 =?utf-8?B?STk4NENXdjhBMnNCdTU2RnBmZzdmdGVnemNzNFFLZ2Q0Z3lkMjd5L2kxdE5J?=
 =?utf-8?B?NjNaUnU0VUFKRTMycU1UV3NiSmU3Rm1oSmFPT1pkVXAyOFZPZDdLWCtSeng5?=
 =?utf-8?B?Lzl0UlFDQXFZVkJTdWlMTm9VTWRCZldvTXFVTXM0RUhVd1FWbE1yOHlpeEkz?=
 =?utf-8?B?UHRGNGMrNjErTVdNWUJqQzAzM1JrRFgwZFZsVmQ3MW00UkRGV0tGMC9KN3JC?=
 =?utf-8?B?NktjQ29aYW11WS94MDBzZ2JFSndBemRUTUJCZFQ2eFMwcDh0K3hyb3ZXQlU5?=
 =?utf-8?B?aG9XNGV2K0RJMVU5OVF0cTlpRzNHSFhBeGlaOHJqOUpHOFNJOFc2bk1vdVpz?=
 =?utf-8?B?d09lT2hUQ2VCMEJDZjBpeEFBejRDMGUwQTNHSmxGZFJuckNxMHNEbkRON1lC?=
 =?utf-8?B?dzJVUUppYy9ZMVBNdGpvYmlsQ2p6YVo0TWFsVFlIU3cvMFBDUi9Ma0lvZFBu?=
 =?utf-8?B?UU43SklGZ0ZIdHdmWlZwQ1JJOFBOZytFT1hOL082Sm1yOXkwSVBKcWhtOWNO?=
 =?utf-8?B?Zmk3U2NJby9JM0JwTmhJVmhFOTN4N3Nqa2hEVmNHVUNObW83KzRURFdFdkhD?=
 =?utf-8?B?bXp0MkxnSW4rbGdOTEE4OWhiRE1MVC9XTFJsMk1uWWd2YmFDeDY4VTNXY3Fs?=
 =?utf-8?B?dlNyTXNQSTg4Ymp2Uk84MEY2Z2Job0hQK3lhYytxTmM1SDU0MWVhOHdDQXFw?=
 =?utf-8?B?aTFHa0FxaS9QcDdML0dOTUs5aXk2OFN0Y3R0MUpEcm5XeGllbm5QWkRjOFQ3?=
 =?utf-8?B?d2pjRVhEcHV5bWdNTUwvVnFaRHpoc0NvUXVDb3pyS3IyZEwrZlA2YTBlTXNs?=
 =?utf-8?B?bS9KZCs0SzhMb1V4Q3pSLzF2L0s5RW5odmdEZVFEaTBYMC9VMkVjZHU5MWZC?=
 =?utf-8?B?S1U1TElpVTUyNmlqcCtFQ2IwR1BMMCtXTkpFMjdEQ25yZE5QQnZidUc3N3pT?=
 =?utf-8?B?bnU2OGZELzBmakswOWZRODd6ZXlvelNGNHhRU0xCZ2c4SFdhZU1JeXNwRGVa?=
 =?utf-8?B?TUliaXlLYTkrSW50OG1HLzdUanhOTzV1ZTM4RmJRWFJPcEVKV3ZhN1Vscmhq?=
 =?utf-8?B?Vks4MVRZQUhkVDA0dnVCQ3VYM2UzdElrb1ZobFRhcHRIQlJyWkZUeFgyS3Rx?=
 =?utf-8?B?ZjlZRUczNGg0alJVektTNDdkMUZYd1BFSFVZMkp1WExiWFEzaUxKdUNxdFVX?=
 =?utf-8?B?WGptZjF2Y3QxL2s3clFUQUhNRjVPUURQNnlCSno1ZzMwL2VGVGNQUEFaaStN?=
 =?utf-8?B?bXJ0MGE0LzFKeWl6dkxpQm5ZS2tEeFRCRjdoTjQrdldFVzQ4dllFTzZJUXY1?=
 =?utf-8?B?MWhJeXZTa2VGNHRubXhyYlNJVlFWNm0vd1JLRG03RDZHL0RkQXgyT3VLWGM0?=
 =?utf-8?B?Mkk4WnpJOFZWR2xQc0hOdVNHNjBLQng2aHpVRVpMT1FUMHhjSHlEbHFoei9L?=
 =?utf-8?B?R3draElaRUhST2NQdGpmY3lTNU11SGlXOGs2OWdvMnMrV0lzeEVuNWhFWGIz?=
 =?utf-8?B?RnRvTlNzdnJ5Ym1keUtHOE1yMnhSNkJPZVpaS0VpcklqOXRtZ0xZTURudlJV?=
 =?utf-8?B?enZtdmVUMVBSV1o2eEVIQThLZ2cxU3dUSnQxSW9TUk96WVBCSjV1ME9MaDE1?=
 =?utf-8?B?VEJ2RUFDUGhiNnNId3BxUXlIVUxOdUluVkZncmdGcnl0WEl6cXhWc3Zlb2hP?=
 =?utf-8?B?ZjZ2OWtxRThtVnRTS2RNQlNmMDA5QmN6TXR2WVNFbDBGQm5JMHhDS2E5anZL?=
 =?utf-8?B?bUtDdXpSZlFCamZxaksyZ2ZuOE5MK3dLdml2TlBuVHFmS1pDR2Zad0NmT1JP?=
 =?utf-8?B?K0ZVNkgvM003S1Z4ZFpaRC9sNmxaQWQzcG10SEM2M1R6VW1NSnIyZlBYY3RG?=
 =?utf-8?B?T3RCbUdWajh4S0lycGpTR2hqczV1d2FPbzRjc1YxbnBxYXZMRUROcGlZRmYr?=
 =?utf-8?B?OHBJRkNEVlFZU3lOc01HL3VIQ0M0MC80QjQ2SWpMVVI0UzNZaGtGZi84Q0Ez?=
 =?utf-8?B?Snc9PQ==?=
Content-ID: <3F4883493C83844A93FD9D19F0A39793@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0831e62f-be4d-46c2-3c00-08da9165de15
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:46:32.9848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSqPnEycZ+67N85ofBsu2ibuPg+yVdiA2AH5l2cUFjtePjlczDSOaZ15iOtTUmDuwV0rcqRmFX0H3nIi/yvpnjyC3YaCrHyr8FUWC8g/GME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234640_824885_5841A781 
X-CRM114-Status: GOOD (  18.29  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> The id and offset are the only thing differentiating the clock structs
> from "regular" clock structures. On the pretext of converting to more
> normal structures, move the id and offset out of the clock structs and
> into the hw structs instead.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 008b76d81485..845658751690 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -53,8 +53,6 @@ struct mpfs_msspll_hw_clock {
>  
>  struct mpfs_cfg_clock {
>  	const struct clk_div_table *table;
> -	unsigned int id;
> -	u32 reg_offset;
>  	u8 shift;
>  	u8 width;
>  	u8 flags;
> @@ -65,12 +63,13 @@ struct mpfs_cfg_hw_clock {
>  	void __iomem *sys_base;
>  	struct clk_hw hw;
>  	struct clk_init_data init;
> +	unsigned int id;
> +	u32 reg_offset;
>  };
>  
>  #define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
>  
>  struct mpfs_periph_clock {
> -	unsigned int id;
>  	u8 shift;
>  };
>  
> @@ -78,6 +77,7 @@ struct mpfs_periph_hw_clock {
>  	struct mpfs_periph_clock periph;
>  	void __iomem *sys_base;
>  	struct clk_hw hw;
> +	unsigned int id;
>  };
>  
>  #define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
> @@ -243,7 +243,7 @@ static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long p
>  	void __iomem *base_addr = cfg_hw->sys_base;
>  	u32 val;
>  
> -	val = readl_relaxed(base_addr + cfg->reg_offset) >> cfg->shift;
> +	val = readl_relaxed(base_addr + cfg_hw->reg_offset) >> cfg->shift;
>  	val &= clk_div_mask(cfg->width);
>  
>  	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
> @@ -272,10 +272,10 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
>  		return divider_setting;
>  
>  	spin_lock_irqsave(&mpfs_clk_lock, flags);
> -	val = readl_relaxed(base_addr + cfg->reg_offset);
> +	val = readl_relaxed(base_addr + cfg_hw->reg_offset);
>  	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
>  	val |= divider_setting << cfg->shift;
> -	writel_relaxed(val, base_addr + cfg->reg_offset);
> +	writel_relaxed(val, base_addr + cfg_hw->reg_offset);
>  
>  	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
>  
> @@ -289,11 +289,11 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
>  };
>  
>  #define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
> -	.cfg.id = _id,									\
> +	.id = _id,									\
>  	.cfg.shift = _shift,								\
>  	.cfg.width = _width,								\
>  	.cfg.table = _table,								\
> -	.cfg.reg_offset = _offset,							\
> +	.reg_offset = _offset,								\
>  	.cfg.flags = _flags,								\
>  	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
>  }
> @@ -306,11 +306,11 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  	CLK_CFG(CLK_AHB, "clk_ahb", "clk_msspll", 4, 2, mpfs_div_ahb_table, 0,
>  		REG_CLOCK_CONFIG_CR),
>  	{
> -		.cfg.id = CLK_RTCREF,
> +		.id = CLK_RTCREF,
>  		.cfg.shift = 0,
>  		.cfg.width = 12,
>  		.cfg.table = mpfs_div_rtcref_table,
> -		.cfg.reg_offset = REG_RTC_CLOCK_CR,
> +		.reg_offset = REG_RTC_CLOCK_CR,
>  		.cfg.flags = CLK_DIVIDER_ONE_BASED,
>  		.hw.init =
>  			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
> @@ -338,9 +338,9 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>  		ret = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> -					     cfg_hw->cfg.id);
> +					     cfg_hw->id);
>  
> -		id = cfg_hw->cfg.id;
> +		id = cfg_hw->id;
>  		data->hw_data.hws[id] = &cfg_hw->hw;
>  	}
>  
> @@ -408,7 +408,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
>  };
>  
>  #define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
> -	.periph.id = _id,							\
> +	.id = _id,								\
>  	.periph.shift = _shift,							\
>  	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,		\
>  				  _flags),					\
> @@ -482,9 +482,9 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>  		ret = mpfs_clk_register_periph(dev, periph_hw, sys_base);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> -					     periph_hw->periph.id);
> +					     periph_hw->id);
>  
> -		id = periph_hws[i].periph.id;
> +		id = periph_hws[i].id;
>  		data->hw_data.hws[id] = &periph_hw->hw;
>  	}
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
