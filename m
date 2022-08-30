Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBDCECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BrWcXmkZt1arowRCw5+Zb+xNpkp2pBDulfbF4oKhN4=; b=fJBHasn/GEUUVJ
	EXX0hn2s4FbU1C7Wrfp1kDjVNJr/U9sB2o2pHKK7OIDJvtX+RK+f1rE3XUnp/M40Hs5uf3/3i+0XT
	sfRy2OdX3/hRnZvWsX5Q+FVm/uqgK1oDZeQj043a+8o5Xr0N11wz42FoLusraGKEm9QbS8PIvrfnS
	f8yPj2d11xbu47VDfpk8WSYRbsHkzyxPfswJIvx2JOaHYF6qOOMLCd4cOttMW+lwybBpRJVqaPePz
	mRFogb/sqthIYgX/h7DS/OyU7I2LEZROLSUdcg86jKNoGi/jewq8VUvFcIEs1l6seEAOJT0hVVgNd
	ZsM3SAniaT/5oEgT8STA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStDT-00E53M-1S; Tue, 30 Aug 2022 04:51:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStDN-00E50X-Pt
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661835066; x=1693371066;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8Uv6rQXSNk/5Q4uCnwHKhuXzs5ZIR/u3qVTOSODfoC4=;
  b=DZW0rZYnJ4nuLkuN1WJ+Q+nCADZASQ/HInaH5lOYXKSKgYDspOS/W4A3
   AsyRp1OvWUJo1Oo7/CXrg0te0Get8M7weiVxkonEb+2Y3gZoiY+yvi0+w
   d0dVa8pENQX1+vs0G4evIKcH0R5O9fWyPMLavGNpmbXu92I8v2GlSVFcm
   Au2qGLUTFCg4rTkC9/tVYiP7BAPapCNeIg5WqApgwa/iPMNwukIET17hT
   8KH/WwqmcaNQn7Dix8K3x58Dd7Yg5SyUUOZbVAtzn4Zx/QAy/Ei4nktif
   am6Rt6glqefONjSojj5iB5l8R4RI88Gi6hWk5anptkW7+vdAuq23E7k1+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="171523463"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 21:50:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 21:50:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 21:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTJ7t5LVkFiLJ4ZyrT//6lSaM+WU7jTPcvI1Zb1gyR9cyvlk4Ps4YVTXZrg4Ng85lSLnrMxSRi47pj4huCFcmdKwy2gMlc77pJ/3goZsA038Wr22/HoGbHBCWLYTU8kmntJf2pEh+DB4qjj3JErHlGObBcl9Mw4WSO6oiNGnN2TfmiJHDwfEl2tGnuCX/crJMnZjojpVCKd6MALX+fU9H0hp4nBX17PmLvrzh75BlyrWy1xhWtYrPkvRFKt9kEYb4l3yATzVBQfLXzn/GTxExK5y1EYle6+vzQshe/KBOB3mQnUXdnmpTai9Mtm+ve0k0mGMY8gB+9lBq2ciimO+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Uv6rQXSNk/5Q4uCnwHKhuXzs5ZIR/u3qVTOSODfoC4=;
 b=lcKt66Ud+HmhATuGCy0PCqouCK4jzQuGO/19KbUUfwBmfJvfzbKO+k0FIp3xRxBa9O5L5/7uXUl7njSVORj4gCukrpMLk1ZCe/Pf+QuvY768hn2mAB8bvDtEhaezFtlpJv51RYCZj8Sv00Tw8E1GxzOzZ2P3330FymVNOwMyt6tGZtyHHTipo5zek21tcYQ4g+BGsRLIHMyDU9lbV9mjuU4Dld8+bukVpquk5qifjKzAh9Vt7NTwzOi2Bx0jvgZezBh7yoPSj6ZCr/FoNG9j1U7Tx8s1PPFa+m6iYT7+fmzpRlFJqw9jn7OC87JDLVXJDEmkLoBrBumKGW9PyOxjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Uv6rQXSNk/5Q4uCnwHKhuXzs5ZIR/u3qVTOSODfoC4=;
 b=p/kqMI2bpADVrsZz/845ua7CAS49ZUkjL0BisMFFRnvxogejPAB0gywnkblSVNyG4h8UHwpS0kLvtprTw+Rb2uUMRfAQRBFuOywkJ+xZMBAZxQP2y+sK97FlOLtnGaaQ2vQPj7shUt8DO9PujtFygvh8K/mOuTsmHca2soZqNiE=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by PH7PR11MB6032.namprd11.prod.outlook.com (2603:10b6:510:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 04:50:40 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::d9b3:8e55:269c:b122]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::d9b3:8e55:269c:b122%6]) with mapi id 15.20.5566.014; Tue, 30 Aug 2022
 04:50:40 +0000
From: <Lewis.Hanly@microchip.com>
To: <linus.walleij@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>, <maz@kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYsJ/Hf9/ChBUZqEipNmgMsTD4GK2601kAgAwjgYA=
Date: Tue, 30 Aug 2022 04:50:40 +0000
Message-ID: <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
	 <20220815120834.1562544-2-lewis.hanly@microchip.com>
	 <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
In-Reply-To: <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5e942f0-44b4-4735-bc96-08da8a433061
x-ms-traffictypediagnostic: PH7PR11MB6032:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: osvNzLCde166D8SFOZr4sxrELZYOVuryygKRBOum1dBhYpOH7Adlv2tWAbzsHNAbjU547M9tP/vekJlFi55eHXMV4X3XV7ndAuexXKVw7V0Sx/CdXkEHI1NIniYJRTXtP4ddGlB+ju8D0ea2pexn7TPtX/lIrvadoml51gIgyZ6Z2la8LUld/os+24DRehCQd32js/ecgtvvUOrCKN45mHfRuEa6avDuSCISoTqktZzSQJlr4R/vFCoXF8ehTUsCtefr7s9uGWqNIdzNTXQbXDAwg4z30cgttc6POFwd6VTh4+kfziF+c1l5hbqaEuJBlee44RVPOEwPwHkuy/UinVFpV3WBFaOsyC+gFN8AovhD14W2lQfo/ur27NkCt+qh6gCFR2jNRlhECwAwRnJeiuq0Zi8paX4mbYiBrOlfD09rFeJGp4I6gI7nGS/WgRerx487xh7gc1cNzxlCWGS+pPuGTLFe4++Oduna7/PsjXKlRigSoYz8iy5XxROLINLJN0jNn606zY75rlzFlXRyCyECNDhzvdpbtYr/+2m0yoArauJhdzjfRn15kMpeM3bNaWNcAj3V/24CGVWfKwKxT4sVXRXKBO3ceMLRJtNYBdoSGyYlPME2Ljfz9/Bvcd7DkJ07Stvwzso2MpJ/gzJSofvsAOHyqYB8pdPnJ0cSCIR4F/SXEoSybF9ODg9KR78PywwDjJn3xehZ9tpdgjgc6gH4qq8uDDAoarl1ROtqB2pKmR0TsHIloei0wCmU0v0KnKy+W4i/nIJmxovxPegBEQY9MExEKQHUcOf1uW2Bt5A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39860400002)(396003)(136003)(366004)(26005)(86362001)(53546011)(71200400001)(966005)(478600001)(107886003)(6486002)(6506007)(41300700001)(186003)(6512007)(83380400001)(38100700002)(122000001)(38070700005)(2616005)(91956017)(64756008)(6916009)(66476007)(66556008)(4326008)(8936002)(5660300002)(8676002)(66446008)(66946007)(316002)(2906002)(54906003)(76116006)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWp6SlpOYWN0TXdVT05saTJ5WVVoQkJyaHhBTXRSTEV1T2Era2pjeWtSbThN?=
 =?utf-8?B?Y0VrUWF4NktnNjYwUHZicEM3eC9yQXIrMnRKaXhGYXBuWXZjZW96TDFkaXFI?=
 =?utf-8?B?SC9hK0pmVlZaeWliRUdBaW1wbDlNMGEvU0ovWWgzYlc2MnFVNWh3cFF4eFNC?=
 =?utf-8?B?LzYxeGxrRFh4UlZ3ZzkxNjZsTHMvQzBJNGswTDZYVmlkVkRkbzVRWEJFZk9I?=
 =?utf-8?B?bk5WY1pQZkVuYVRXN3NqY2NUcFk1cmdWSDhCZE5QOExuczRvREIxUjIzU29Y?=
 =?utf-8?B?OTNiVnk5OVpRNlJRY29ieW9NdVIxZ1Fod2hZWHIvVVpTbVAzVGNvTFVWMlpI?=
 =?utf-8?B?MXFNVEpNcFJPQk1nU3U3QkpycEw2b2llQWxKTWpHK1dhOW9tMUlnVGNuNUNa?=
 =?utf-8?B?a0xycklVK0djbXRiL3E3S3BicVFBemI3eFBEamRmcVVzdDUveXE3TjB4Z01y?=
 =?utf-8?B?b3dIWndNUUQwK3RNQ0VkOUFkZUQzdStmaC9BeitYb3hMdWJWbXhXYTdCUDZt?=
 =?utf-8?B?cndLSk90NGVkS0pDOXlWY3R3SXNRQnlKS3EzdTBMVjVXaCtFOGZtUGFtcVJo?=
 =?utf-8?B?T3BBdmxiYWFCNEpwWnlqVkhOR2NROVlVb2xLOEllMXlJdEVURDdnRSt4NlI1?=
 =?utf-8?B?Y2FIeUtKdmFTUThoQlFMOFJsbGVtVEtiWnZhZXdLTEVUWTZaY0RJQWJyM0NP?=
 =?utf-8?B?aktyamdaMGoxcVNZVkxFbHlvVVZxa3JRRm43NnlhZyttWjgxTGpaalJtYmh5?=
 =?utf-8?B?WS9aZCsxOVJqZ3JTYWV3b0RjblQ3K01BbWh3bnorYWRieEVnRW9BeEpOT29H?=
 =?utf-8?B?VDFPTWNlaXZuS3dDeTZSRVZIYmVDVkVHemlEVkgzUVBMR0hJK2lrUFhPMm91?=
 =?utf-8?B?dVdySi81ZTNYZ21ZcG42czZEL1RiZWFmWFYwOWxQeFYrNW02ODB2ZTRTUmhY?=
 =?utf-8?B?alg1NkszeVlia21IS0lRR1F3Rm05WTN3bGNaNXVFVmFMSE9XUWdpd29vRHdj?=
 =?utf-8?B?VTFUem5IblpDeUtTV0ljcG15ckwrYnZYeW16Y1diTThuMHRSaTl1QzdKNkcz?=
 =?utf-8?B?cjRGemdhaGhTZjZuUkpRaWFwdTh4SWg5aEtHaEtXd0VFa3UwSzFsd1JaM1Uv?=
 =?utf-8?B?ajJCTnNmM1ZXTXRpcS9uU1MxUG1ydC9DQTJubGRHMUErYVBUejY0ZVZkVkl0?=
 =?utf-8?B?eXFJWUFweURsWmtTK0NLRmxGM3dKVEQ3d1MySFBKcHg3T1BtYTBuRXRQNkNF?=
 =?utf-8?B?aVV1ZjVZQks0UjB6NlJLL2JkZjdpb0NNQnpabnlrZjFicVVYUU1mY0dMRFhG?=
 =?utf-8?B?d0FNS2I4ZXRpYnFZSnM1aDJNRHEza205QmFBUXh1VGRGaUpVNmdSWi9HdmFD?=
 =?utf-8?B?cmFlbFJwVXVvWk01Ui9ZSDdSRmlPQjZKcm81SWJIeGZCSnBZSEhjaGtxdEV6?=
 =?utf-8?B?enlBZ2k0cWpPZk9JeGE1aWNNVG1zeFhNeXVGMkNFSWpPcmM5eUlUL3kxYXRk?=
 =?utf-8?B?WVJHUEFyWjlQY2c4N2Z0Vkl1UzNDU1BWd1A2a3J1b1dCSEpsZFkyMU0wdlFG?=
 =?utf-8?B?T09LTlcxZFNISHBDL2l6Y3c2cTY1TnQwOWpBdEs2RTJaTEpnK2xlbS91UXY4?=
 =?utf-8?B?REg0allsTzczVHEwdGd0dVowTVg3SlZ1Rzc3elVQMVlNWUF2aGVaTjJjNW9M?=
 =?utf-8?B?UWhHQjRnRVJWSXNiTFV6UU1iemo3N0cxSzI4dlFmV2pMTTBvREVMK2ZsUHlp?=
 =?utf-8?B?WHRCcTIraENFMlJNREJoQTE3N2QvSVc2OFoybFl5WWgySEdldnZlTUw3b0VW?=
 =?utf-8?B?T3ZrK1ZrTmxsdUtPbTlTSWpZaDBuT0wzK2lJUDZZT0JMNFB0cjE5eTJ5UEYy?=
 =?utf-8?B?ZXhsdjBFbzhIWktFL3pERkdwK3ZJNUw4M0kxSUpCaWlrbUNsQlR1bHJRL01N?=
 =?utf-8?B?cUhUbGh3Sjl0eXF1eGRva1EwTyt2RndSWXRQYU1sL04zaGtEK2NUdDBwTWVm?=
 =?utf-8?B?akZWQmNwRHJaWStHTlBUNFNWMzNkQURGZkVEUk1iOWJ0TnRPMkMvWlNwTlMw?=
 =?utf-8?B?bVBMRmdBc0dWMGdjUXh1T2N1ZmxteExKL0xWRG5rOFk1YmRxT0NVR0NENkl0?=
 =?utf-8?B?NDkzZndSUHppTk9Uc2taRS9DUFM2VWVWTGlpcmZJQTdqQSs4bHY2UXlFMGJa?=
 =?utf-8?B?S0E9PQ==?=
Content-ID: <46E8D3E1F4383A47B7E8346469D1D0E2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e942f0-44b4-4735-bc96-08da8a433061
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 04:50:40.4874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UK13jj+yFNzi1Aev/Lzw5qtRLpOvWwG27AIRaNyyiMbl98cGbTOydaluZEKnjy001ItbIN0fqMo0YmRmBSiVnmy8cf7wWQrtdDdE6GecTxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_215106_194764_F96BE7C7 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, 2022-08-22 at 13:28 +0200, Linus Walleij wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Mon, Aug 15, 2022 at 2:08 PM <lewis.hanly@microchip.com> wrote:
> 
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> 
> This looks like  textbook example of a driver that can use
> CONFIG_GPIO_GENERIC
> 
> > +config GPIO_POLARFIRE_SOC
> > +       bool "Microchip FPGA GPIO support"
> > +       depends on OF_GPIO
> > +       select GPIOLIB_IRQCHIP
> 
> select GPIO_GENERIC
> 
> See e.g. drivers/gpio/gpio-ftgpio010.c for an example
> of how to use bgpio_init() to set up the helper library to handle
> the GPIO side of things and combine it with an irqchip.
> You get get/set_multiple() for free with this approach.
> Also see documentation for bgpio_init() in
> drivers/gpio/gpio-mmio.c.
> 
> Yours,
> Linus Walleij

Thank you for the feedback.
We had looked at the bpgpio_init, our controller is not fully memory
mapped to support the bgpio_init() and get all routines for free.
While we have in/out and intr (interrupt state) 32-bit registers, we
would not get as much free as other generic memory mapped controllers.



For details on the gpio controller:
https://onlinedocs.microchip.com/pr/GUID-0E320577-28E6-4365-9BB8-9E1416A0A6E4-en-US-3/index.html?GUID-A0214F3C-C68A-45A9-B81C-4695A58C4A46#GUID-A0214F3C-C68A-45A9-B81C-4695A58C4A46__ID-00000AB0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
