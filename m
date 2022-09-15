Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F69ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 07:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuhIXdaU9nK6WJ4xi+E1XUeK1Gc5XUNrAOvMZ5Sl9cI=; b=pJxe9l//X1au20
	yAXEIs6XC3ndFy1lonO9RBoYxqkZ35+4vpc91ESpOwGD8TVUe4mMMVO6rlZaymJjPBZyfOD+1o+4z
	MLdZUMJ+mITJuNuRAul1z0QP1SVUIYspDyL/3mhMxAunhc+6G+isL98Jb8h4KDyrONIa2xMx02Y6E
	mz4s4zueF3q7cS7Q7+nvxIiWWSdyfTgKfE2B85XsUZ03uhGD4YrgL4+ZSeMoIIts0+ZlyKL0g4HPr
	/8xm4RdDtrKs9C+lSuFnqsPLWZLrQZW5OIQ7iMGbTERDjqQuOyY/36djQ8EN2cbuS/QSsujkh+gUk
	F16PIXJA7EU++EVRSZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYixp-002SoD-Tb; Thu, 15 Sep 2022 07:07:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiuP-002Pup-PY
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 07:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663225417; x=1694761417;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lSM149F9PA9/Aw8vPLv0+UUq65D2t5hxWdcgo3EqA5c=;
  b=swTZvxix2UEPE7hASB2gEKleHw6G0/V2930WDGPAR2UnOocSqUBgyNdN
   ll3Mim90pDji9aa5EuxQtBvsMykRzjzoPottc0GyJY6127LttX6/ormMC
   BD0pzpmkswr9GL9ZemG3zJ/1x8GBFRdYCAuHm7dEWwTxG7ezpUvkmj2pr
   nEE5ZJVGwaMxFqIXwuuQRSttbpcsmjp1hRtxtUCgKxUJ2wr83HvmOc0Hr
   5yReI1k7VPwWCx8zNbMSl8GUJKoP5N0ml/VQn6FkR6bmxthFWHTGHvJ7L
   v6za6HOq5Soq4vo6iI63XUyTZcYItSlL+em8zdqzXGf+S3a4p13SJf/xu
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="177252671"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 00:03:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 00:03:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 00:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+RjgSxIr/lM3KfT4prJ6iBiZYPagfKmjjr0NjJJq2F45LdqezXLYQVuAW8orCJsnrbPQC7IMsoB2n4zrqUOiqhb2Oe61Vt7gAMv5owpJGSAOyzcN6r8JnvUKq3O1ZGyJj9gbNVUsHycgYQHi5jQHhKDa9TOZPfgOS/pDcE1ZPD3nilhW5roDukXe5rRFCqAqr4zW2BM9eqVgphhR7pWRJ3IVF0G7ZExIbcAgd+M3itaKc/va/MDpdWaZn8HSjn9PoeXdjYYxz7bCruJv0iKm/LmIyTFM83GkcMGz6lTmD/P0+xooBrj5jCxA190ZU9piW+YCAFsHx+0084DZzf51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSM149F9PA9/Aw8vPLv0+UUq65D2t5hxWdcgo3EqA5c=;
 b=lFvpmCQ6AYcIGSCqK5QtO73iIShIJgwLf/3D1yFU948nr9R5hC9V4JrjW518oCb3BFlUHlrctsFeOnC579YGjaWEwQ6wrZ6Y14UpWON6Zdm19kon13KLODbumuoZnpLHz/WAqwnRt2Ggf4a+S6bCVplNSa/Q1oZmjiMm7JXYouUhtmmCODxq6QYM7cCOUCHWcGYg+8sKmsN3YwMOiLOpCAR/xtCSq/xYsLaiRXkzFeehP/Q/GenlyV3SgwqydV/udYNBEQ2CMtPBPk4BqxUnmBDZ3EWx/KRldQg1YokQZnyAsoDmOQhc9jTd+FZ2IV7EPSdH/iKNB18Vd2t6LBSDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSM149F9PA9/Aw8vPLv0+UUq65D2t5hxWdcgo3EqA5c=;
 b=swS+4exPhDrPlstRwF6r6XFuTx4F7iq3GD6LuIYD52uVa/XzIuFvb8c9JWMp+CvaTiHWOyVuK+LcHQngufza/ytYQBHuYHSkGFsXYjzQ+mQlq/aDwW4wUMEI4dTPsvbod/Y6epjJXN43apvAcJP5PfEEPNXqDY2hFeWUWKPjXCI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 07:03:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 07:03:17 +0000
From: <Conor.Dooley@microchip.com>
To: <u.kleine-koenig@pengutronix.de>
CC: <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <Daire.McNamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 2/4] riscv: dts: fix the icicle's #pwm-cells
Thread-Topic: [PATCH v10 2/4] riscv: dts: fix the icicle's #pwm-cells
Thread-Index: AQHYt5m2DCGLvAO/0EyFcG3/U8mMOK3feeAAgAC5TYA=
Date: Thu, 15 Sep 2022 07:03:17 +0000
Message-ID: <22d74656-3243-82be-8475-6ed72eaaf35b@microchip.com>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-3-conor.dooley@microchip.com>
 <20220914195946.eadkppkgqwgwdace@pengutronix.de>
In-Reply-To: <20220914195946.eadkppkgqwgwdace@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CH0PR11MB5348:EE_
x-ms-office365-filtering-correlation-id: add618fd-4b2e-4a7c-dde3-08da96e85dae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K9Yeqqpbo2sdXRAh4AE4R45GxotAM6R8wUgJcPVG3gy+jepYtozw/0dPOgAPsElwTxxsSRhpKK1dVKeCp234BNa+2q4Uv6F+aOQo9eWrSBiiVYg054+5zzut8T4zHW9Bs4CiqOL3BwI+hHPJZ6lLto6wmA6zVvisvt13U+RxV8/8NVL0WczOUlMYW8inT/fiqCcH0FNdVWldUs+LlgA1l89+S95iXlgxEI7I9cyUJq2JgedmbAPFRDdcX9Kb+X7+d5xsBXbklOMXG04E76qkvATQGc+wqLDcmcmrpUVY+i1EpJej4+sLBYMx/ft72Q+0I8gEGSlw4uFL9osjUM3wKH8V+dK9kUUmLSuTJLj69/38mtWqv2yYSPapCJnlD6jG/qF4ctFfdPWJExSLRRewnMP/3Js6ToiZGwQQjCwADz6BBnuMgkIKnnp62kRlus2eBjnGG5g1aauwBDEBvQYC3ql0k3TGmAbtMwfA6khNGQr5TPwBFWyCUB8s/ieth49UTHANrswXsrDiGE/U7Zz5HtXkwp5AFj+m9bKkMuIIFtdG01leDoAyVofQ0ihzm6X0hDRiUuVZaOwc5ypvJaXd5+fSMTj7Hrll2V/dEKYq5wzMheNdWpANkTYy6k2xNoSVqj517cDF9OGjPJFopvCoxP1PpW1oHlEv4o0mwjeShkEuiuC6TZXICVeuDE/aIb5ffAR14IsZTdqVwWYmC+iZ92HIoiGxZtc8cL4JjzG2uwkjIj1UoFylfmkgDPh/TSyPdzofqEctsDVbR3nijy5Mu1OhWWffKaOiIywfNlSjGqGLwFZOmvrU7MPmeWm88P1nnaw+ZlYcF6P4GAE3tEoMtg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(2906002)(316002)(6916009)(31686004)(54906003)(71200400001)(38100700002)(6506007)(53546011)(31696002)(41300700001)(66946007)(66476007)(66556008)(66446008)(26005)(6512007)(64756008)(8936002)(122000001)(5660300002)(2616005)(38070700005)(8676002)(4744005)(6486002)(186003)(86362001)(76116006)(478600001)(36756003)(4326008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU5YSmlQYzV1cEdnU1FOclhSMlhJVDlEMDY0cHo3VklOR2lsQmhGYmIzSnRW?=
 =?utf-8?B?a2Mvb1I5VUM4RUZqKzNUNzlDUzZEWWpPOUlyWXhQRXBPUjA2ZWhBVlV1SE1L?=
 =?utf-8?B?cWoxRFNtSkJnaEF5Z2d3Z1Q1QmdjMWNVcUJIeHpNQTVLd1AwdXpDaFdVSE9R?=
 =?utf-8?B?ampkMmJyRTc3OC9mSWVVb3FuNk11WEF3UmR5L1NHMGRzZWk0QlJVSUd0NDdJ?=
 =?utf-8?B?SjRoZXZsUWxkcm5lblVLWm83RGJXWVJRV0lSNHUyaXVSOW5EeE1DV3YvQmNJ?=
 =?utf-8?B?SkVKU3RVdjc3NEFGeVRhcjdPeXNQQ3ZFNkdpVk1XY3RqRVl4emNuZXVnR2h5?=
 =?utf-8?B?NU9pUkkwekhnM1RUb0lyL3JNaWFuM2J1bWJCeGJrY2Vjc0daVkdSamhvMXgr?=
 =?utf-8?B?L0x3dU9PZjJpeEF4MzE4SDk4NWozbVFCUkJxMllTMGxPZE1WNWptK2VPa2Y3?=
 =?utf-8?B?TlZuRlRIQkVxUGN2THJ0L0VNaVBhRFVvWDYvV2hmaUgweUJZUEZ2TDdrN1BO?=
 =?utf-8?B?QmgrQ2xpYnpWZ1U0TnNzTERNeUVtQzQyajQ3Y29hMk9WL0Ztekw2WktzdnZw?=
 =?utf-8?B?eUN3WFg4dG5CY1NRTC9BMlBGMGhmQnhDVmE2NWhYZlNVdFJSdVYxOEloa2I1?=
 =?utf-8?B?WUtia0wvc3Bxd1pzOTJlcUlVWWQ3SzF6MWJvQmt5ZmdQSUlkVzJoRGpXOURK?=
 =?utf-8?B?UWM4V0h2S0YxS3NTSytmOUJMd25TcjBSQUc3Sm1rVGVGK1I1bDlQajNsWit0?=
 =?utf-8?B?VEFJamRnK3I3dlVaR1UyWXNCc3pFdmJGSWhWV0pIK2orU1d5bjNyRWhTaWdW?=
 =?utf-8?B?VWI1ajQ3TmhxZW1wRGl3dUJxdi9BSkp2c1BKaGNVUFdDVWlNR2U5UWQrRE9j?=
 =?utf-8?B?dUZmTG93S0dLejdjZXdDSDJleG5xdmNkbWwvZWtTVjFJQ1VUeVNob1hXQUZ1?=
 =?utf-8?B?cEtUc1UzOUJiRU1ReEV5VGlNNk5PbVAzTzAzeHVxWnFGU3NNM1lnYmJYL2NQ?=
 =?utf-8?B?YmVxTDI1OERydnEvbENhMURVS2hYNzZrY0lxOHdMV3BiUXB1ZENJUlVwaDdH?=
 =?utf-8?B?MzdqbkVBaWIzK3FoZ0M5YUtabHZRNzh4Y1RGMW1BZ3dqb2hycmVEQlBFYnk0?=
 =?utf-8?B?VGZrQ0VPcFA3T21DRVA2amhyalRmN0ZOZ1NPcyttQmtYTFhOdEQvamUzZDFJ?=
 =?utf-8?B?UTNMalhzZ2RwclcxQjVlZG5LSERWKzBiRU0vZDFEcUp4SFRvb1N0ZW0zdy8r?=
 =?utf-8?B?dXhMS0pNcTRvWUlCMURzRjJYMXFiTDZHY2dueWFZNTUxMmloL3RxZ2RPazRk?=
 =?utf-8?B?cnFzUTd6dzlsSU1aZnRaelVKcUtjY0xYNjBGR3dETjBIRzRMTnowK0k1MW9u?=
 =?utf-8?B?MFA3WDIzRWF6VEVwRjRUWmtJcDJoa1o5Wm0zZk9kMEgzQXZ5aTNScG5XSDd6?=
 =?utf-8?B?MzlvSDJYR282b2NacUhRTjN0NkI5c2tFdVNycjNYWXpxanN5bzNtaFJadnll?=
 =?utf-8?B?QlJ4TnBLUUJtSDNaRzZFS1dQRjl5NC9IRWR2cDRUbFFCQUFRUk9naWJmcmNS?=
 =?utf-8?B?MGtKMHdEaTJjTlRNc3NXRVk1WnpwQ0dVODZNcVNOU013N0RqbzU4ZXhreVVM?=
 =?utf-8?B?T1I1UmNaMW5VcVRDdHhoTGNnNWN2cTZsSXgxUU0xUUhPbllCa29UMnlxWFpa?=
 =?utf-8?B?SGtJS3NNL1BpbzFQZ0R4VjhBVTFJaHdKMzZ6THdYYmNXYmVyU1lPM3FqU0hh?=
 =?utf-8?B?UENOUGIvYWRSWjkxbThzZDBySnBSaS9qa3R2Zm10a2JkTzhCMUFQME53WGli?=
 =?utf-8?B?bDcrQWNGNFFwRlB5Yzc4Sk1xNzVsS3VCejFZYk0zM3BhTzZzSzNNTHBoc2Fl?=
 =?utf-8?B?Nmdnb1FyVmpTdGt4RE9qaU43OElCVWdqa2trc00rY3VGY1EwZkFEZVpwZk9x?=
 =?utf-8?B?K01VVTFhSEc0bHI4TW9kSFlPUWdxSHZ2WUJPbWRxbDI0cERyS01jUjhUUUVp?=
 =?utf-8?B?RWttTnhXcDFGWkRJeUNvUDBXQWFNYWFDdTY1cVlSVmsvdUVybXRtTnZXZnFl?=
 =?utf-8?B?MzI3eGVzeS9Uam45THNSenBVRFlxQW5Qb0JwR2ZNY2RNek9veHZxWUtqQjNZ?=
 =?utf-8?Q?YMXOIB43P/qjQraBYCW7Lzgld?=
Content-ID: <1EEC3FB166C676418DCFD3A5762D2940@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add618fd-4b2e-4a7c-dde3-08da96e85dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 07:03:17.4354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4OZdEoVR6Th1HSylaHKQs9Th1kJtEI0Gi4WqBRSeynDh51VMeI/6oaC0byjCl8MvqfWmAlx135UIt4qpDQgELs5+bdsSvRldnPRH1HXtvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_000337_938381_D8590955 
X-CRM114-Status: GOOD (  10.62  )
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

T24gMTQvMDkvMjAyMiAyMDo1OSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiB0aGVyZSBhcmUgbm8gcGhhbmRsZXMgb24gdGhh
dCBQV00sIHNvIHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBuZWVkcyBhDQo+IGZvbGxvd3VwIGFkYXB0
aW9uLg0KDQo+IFJldmlld2VkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPg0KDQpIZXkgVXdlLA0KVGhhbmtzIGZvciBjaGVja2luZyB0aGUgcHdt
IGNvbnN1bWVycyA6KQ0KDQpJIGFzc3VtZSB5b3UgZ29pbmcgdG8gdGFrZSB0aGUgY29ycmVzcG9u
ZGluZyBiaW5kaW5nIGNoYW5nZSB2aWENCmVpdGhlciBwd20tZml4ZXMgb3IgcHdtLWZvci1uZXh0
LCBJIHRoaW5rIHlvdSBjYW4gdGFrZSB0aGUgZHRzIHRvbywgSQ0KZG9uJ3QgdGhpbmsgdGhlIGRl
cGVuZGVuY3kgSSBwcmV2aW91c2x5IHRob3VnaHQgZXhpc3RlZCBleGlzdHMuDQpGb3IgdGhhdCBw
dXJwb3NlOg0KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+DQoNClRoYW5rcywNCkNvbm9yLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
