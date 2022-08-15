Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B9C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4tW+i0dTu3TZBSpH9ceZS+eArn0hlJBD2hWyPG+55M=; b=3zinv/QfOhVlHc
	Y2S3CfpUdQ5OUZea5jIclk9GxpcWfFtnq45Ipr6GDVw/CInonf7q1RWQF7OH9hRbyauR747NO+d17
	KkkP1L2e1UNQDhp0Gfew091WinPdzzLcSyRWASyF2RXXJFxlpuklhqp/7P5o+xe/pUX+LqdFqAWyr
	i2fISKXB09ZUmY9cDgA9Ro0dTZIl1VJxCNPn0FPR9qnATFUZAU3KF0AUYuZlpCpjRN1GhShtXXYsi
	mQIZhjKwRBtTxtuNYCoM2cf7UtZ0QJEgHg/Ar8DTtZy9GpMF+WUXa1ZVjZA2fSEYcTXWB4ymtzJ4m
	AbRR+jLQE4KGZBIdLo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfXy-003q12-L9; Mon, 15 Aug 2022 19:14:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfXt-003pt2-Ef
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660590881; x=1692126881;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SSPciaYSkCEE9I/C5ilQUfsAEGUTm0g5M7dRXUTbs3w=;
  b=Qg/7cRW94M1IRPFrSmcnicpZlpjWUdWFS64u7YupUtBTaTAFVmpP6HRe
   X5pYPXmYCDFpdCITEr+Une2w7hjkBI/3Bye9bJ0Kmrwfu3OJIHz/Z79bH
   OM8/e82VUjnELcGdE3N0Po79NkC8wX32UHuLJBJr84w4Pb+ESI4jtsNsA
   lFmDKkVCPN6HtqnKZfFQtJQqhcFgd1GASMIJExdAdO+SHCEP84p9AZl02
   LazH4f/l0g6opMSxS/tgWI9oFeVzYK5FzLsFdz50g0mEey3wAwx1eKBVG
   j4uyw7xYH5icDo/BRSC9pK72kkvnwQ4FN0mUEg/iSWgJc0C/wn8nOEvAq
   w==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="169373542"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:14:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:14:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 12:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1jY6+ySySAZ0d/15aHKBJvtzykBAd1k0aj0teZg7FbgcOL2UkmeGTrQTjoUNkQj503PFF6yA+C4nJCexvrQ6tn8gBX8GrYHVz35EBVkuRg0YSg/JGxX0/FISQVrVWZdqVCS4YL9MADg1CwoPAgd1VhkJaH9yWgKuZXMk+yNfad9NQdeC7Yzh8u22vFKGyxL4LzTMqe78IGABm6wl31d5Hfj2SCGq7ZkJ3jcsjzuo6fusaUk4Ux5Q3n7KxlA+Rke02ZfHHKTiyGEXCRUqfR8mm49AnHiskNorznZLOrUUvljIHoDtvcXIlZ2l5xUDAmoZ1SXmzi/Bhc3TKKGMDea0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSPciaYSkCEE9I/C5ilQUfsAEGUTm0g5M7dRXUTbs3w=;
 b=M3pkHSzyLhzisFhbag/+6BmR145FCTWHNrkqyFLkHDmUcBurtahIT0lMtL0Hbr6r4DlVUQ2YdexRkPpcaAtVwX2H8WDkuO7SE6ja0K6ev88FUzoqVcMFeaqPpQJs0DKNXHDJD5mybRfaxZsQM/vgcXhUnuHHBJpqjL7jusrgoY7LtknclZqJlhjkJ3n/alytSfdMppNPo2KKhHS1qkR1kYsw5l+5NhRGzJaDTW/3somwIkXeblWebQfAPrT659KOo6BDNO1IzVB3uiNR4TWPw4XXs4Ezkm4/nPbciUgTehWaImAT3oT+RMntmw9snJrhRRgvCKeisNGSW64XEImsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSPciaYSkCEE9I/C5ilQUfsAEGUTm0g5M7dRXUTbs3w=;
 b=KAWObnUXgU1Uqr1DEUBPQewuu8T4Allk6unQKmPFuNAY4n1ewg5eHV3EG3OSI3kqv5QKhJvWJEf8l/ZtfxyVso9TZ5c54jsO9D1OoidOjKAs5G13WRnULD8+v3F3sIxVpK6Am30K3AcVhktWhz/Vk2rJJ9hLawHWtv4oUN0K0Mw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 19:14:37 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:14:37 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Thread-Topic: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Thread-Index: AQHYsLn3v99KeFhKkECk1bkoK2HiZq2wVRAA
Date: Mon, 15 Aug 2022 19:14:37 +0000
Message-ID: <57e17d1e-e809-065e-831f-cdd3a8602e0a@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0618ab99-d380-4427-e409-08da7ef2654c
x-ms-traffictypediagnostic: DM4PR11MB5232:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EmFQ/0L+nRAtATNfpBsObmxCtSgQhy0/Mt2nawpWPkmOSVc5XvUtuhewNEPceSjM41xUmoj3IWCnYBEx/n0BrJJ4fV21Bn4Jla78KJoPkMzNaduVtEWx92dWQko3KPx2rmFIj32TvpAdO75ElfRKZA4t2+jBRqets0T4gy6dBAElO21j+OJFWv7ONCmykf8x925I6C09Tpg7rr4Phykn/obzog0WJh1t/A95erMDuZwiq6vCZ7HVkWrkmYUryBdok6+4gxZsCqtzjmKSZ/eAhYs8kIy30Bx16DaSbPyBNvLG5imD29cehTbVAqrLKaFG/qsa2NRfE1UfnLc8OUE51Sl2fh4ZQ+Uu6DimVAf5OpEdSKTz3tbQxlMZo0Kbkfoloc6eFqIqW78V0ZpsCF+nZa8ppdsjI6m87e6F9iS3HV+tEmEiqUqz+lJMVOmJLXuNu+IL99aEIfdjF3bXqsKk/1z+rdJAmXCrPNP5dacYh1khF92VQrXomZg0FdQPBlTQOK1OWnaQeZIjHJpzDGDyXe6siMSHi3hihmjwtP+sb+ILpJPt4Kg/gSREYv91ldSjMyp+GPJijZG39PZcpq9oKvkciFo2/4cwHRs7XPym7DR6xaXToTSc/drLs/BtAejZ69UvngDlF5Y7SxE5OITfg8ZtJpi70ICmeG2S0zksZjzvLNr3SrJNDwKvSigAUDlUKemWr7prYmh3tg69AlrcLZ4klhVnKXri2O/WwFvLjRqoZ6BqtBAJ38Y392PtJlvPcFN9UTWIfIwmGD1gZ3RmqD7hDvfm00CA0N/6iREvWMY4q56mW4R+NoHvJQXvGIctL8ZDPxCScJ8naJP60mm8oBgu8m6tfMd/Fd3l5bA+LXipAF+ha4q9r1vFRj9qajwikDqzl4u5oKhYNfUU/Jmhew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(39860400002)(376002)(366004)(64756008)(54906003)(2906002)(41300700001)(76116006)(316002)(8676002)(66476007)(4326008)(36756003)(66946007)(2616005)(83380400001)(31686004)(110136005)(186003)(66556008)(122000001)(38100700002)(26005)(66446008)(6506007)(6512007)(7416002)(31696002)(38070700005)(8936002)(71200400001)(966005)(91956017)(6486002)(86362001)(53546011)(478600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjZuOFE4U0Vvb1U1dXNLYU0vc1lWaXV1RHh4NFlBcVovWExDOGVPL2JtMC9B?=
 =?utf-8?B?YytwdlhKTDJtVjl4VkIvaG1uSERPWDJQd212ZUF3OWU4bjBCWVZsWmN1RVU3?=
 =?utf-8?B?YXUvdXJsRll4MHlEeHozanBsQ2pNTUJDUFhPclVTUWNJb3dxSHVmQ2NIaCt5?=
 =?utf-8?B?RTUzZVNoMGFROTE1NGFvbjNHek1yeXBvVnpWV09wZ21oMEFxdkN4RlVBZGtJ?=
 =?utf-8?B?TGpRSVNna0k3eEJrV3ZINXU1czRaTUovc0lpaGdTYjdUbnVtd1NvaC94d2g0?=
 =?utf-8?B?UkxCME40NFlTTGRsL2o5dVFrM2V6QzNZa2RKV3hPWExOOGFJekNJY0lCWWtr?=
 =?utf-8?B?OVNqOTE5QmMzdDZnWTJpVDN3ODZGRERjRFo3b2FLTE9YdVZyZ1FNRC9vNFdu?=
 =?utf-8?B?cXZTb0lHQ1k4RnBtai81R1d0MzhLWW02TW9hZVQvTlJObW83ZVR0eEc2b1Bi?=
 =?utf-8?B?bUZkR3BxSTdJSlZhbnZmdWw0Mzl0YzNWZFBaSk52TGxyUEMvM3ViUUF1anhU?=
 =?utf-8?B?WUJKOUxjT0IyTmpmVlh4OEYrclhpRnY1SDRzYWtGOExsNk1CUVVPQ1puZXNO?=
 =?utf-8?B?eWQ4M1czS2g4VUdpd0t1cTdIOUc1SnV0NkVBYWRLSjh6QzY3Q3E4VFRFYXBX?=
 =?utf-8?B?RElwZTF2bkp0T0tsSUJYYVp4emt2eWFSV1RyYlFRVFF6VWJ4QW5Qb0hxK3VP?=
 =?utf-8?B?LzZVOWFVVlRxMmR3UTZnaDBxN0xFTGdKcGtraHZrdUVGS21uRnE1NFQ0QkJn?=
 =?utf-8?B?TEJoejdCWDF4WHNGN1c0RE9Nd3ZZVXlab2VreXM4QU9DQjMxQVQzcXMwYzhU?=
 =?utf-8?B?MFhlTHpwaVlMZ0FHdmxsbTFuRXYyL1pPb01TNldiOGJEdmN2ZTk1UEgxQ0FE?=
 =?utf-8?B?d1V3b2hvaEk2VFIybkJSN1daTEJqT1R2c0VPNmhobnJoNXRvRVEyNEpjNlRF?=
 =?utf-8?B?QTUvbVJoemJGWnY5Mm1jRUJtd2hFWkxtZ2NTa29pQVNZTVpmdUpQNktwaHpi?=
 =?utf-8?B?S0lNcU9BNmlCS2pwVDB6NjQ0V00zNFJHTlJaRlBkSkg4WjFmeGxpQzBuZFE3?=
 =?utf-8?B?a1UvYVNxaTExMUlJZmZ5Nk9iamE4OTJOWFFtM2NIOVhZT2JpYXNyQ0tidEc3?=
 =?utf-8?B?VEhKdEtVN2wwdVdqWFpNcVAwUExVY3JvWUNJZ25XRGhpdEFBS2ZEa2lwZjdI?=
 =?utf-8?B?bG1wZGQwUWFXSS9CR09Cd00yYi9mVC85SFhSaDF1VzRmWmlPMlZDcW9ueEJk?=
 =?utf-8?B?Yk5nVGNLMitNYTFDaFNSenNVa21ZWlorTndGQlZHU200b3Z6M2RMT0Y1RlJ6?=
 =?utf-8?B?VnY1WTI1UXNwUXdCYjAwUGlaOEpiR3BJeDJWMzJYUEIrSkxqcHh6RmZIczFz?=
 =?utf-8?B?Z1I5ZWNsQWM5c3pZeVhqY3pESzNJZWtVdHlOVnNGeFFBS3RxQkZGbmZqUnpQ?=
 =?utf-8?B?ZldaOTlYQ1czR08wM3MzaHNpa21ZZTZENmFuMEtTZTBvSTVqOEhMYXl5RU9y?=
 =?utf-8?B?ZzRHU0pEWlU1K2J1bXBKNjdJcFFYdjUvS1RBUkQrS0ZaRVAvcDQvUERzcFgx?=
 =?utf-8?B?N21KNjhTNGxUZWhlL3NlV2FxbkhKNFF5bWQvTTA3ZmplTHhTUktZYXczS3Nv?=
 =?utf-8?B?WTQzZStUVTY1UWNQcWVCN1Y5QkRhcFFZZmxlYlRuQ3dDRmNKYmVZbGNpSlM1?=
 =?utf-8?B?RkFhWm1kdEY3ZUJ2ak9vUUN2dm1Cci8wRkRWb1RTUndHU0xSYW00UU5jT2VM?=
 =?utf-8?B?VW9UaFp5cnVmeVVpTUl6cG1ZS3NGNzd5MHUyVzltaU1mWVlGN2dyU3BnYWcv?=
 =?utf-8?B?L1BmS0srM1kzN09mQ0pDV1Nmdjc4aUFHS29lZm1ycHRYZjQwVlRaaTNVMzc5?=
 =?utf-8?B?cnBaOFBBdnA1UVJUUTZidVJGMXdjeVR5NEduQ0tCZlhHZ1VmL1B0QjliQ1hL?=
 =?utf-8?B?dmRLWGJCai83NTJiWk5vZjdnMGtrRlZsQkZOaDlUQzBnUHFEMHlDM3Azc1Rm?=
 =?utf-8?B?YVJFTWpCYU9STGFFWU5wNTRvL1dwNWxlN3VHaTlqYUVRcHlUYS9CWk1RVFph?=
 =?utf-8?B?S1IvRzIzUmptUVBzMjFYMnRBZ1lwS0ZmQTFQZU9hSm1TaDhZMkU2S2VkRUJ4?=
 =?utf-8?Q?cAsUEwYZmUaJ1558tP/OAvx0a?=
Content-ID: <FB9A15512056D74E9572B1A8140E9010@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0618ab99-d380-4427-e409-08da7ef2654c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:14:37.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9lbPpkCmgxD+XcUeGqYG2ow/krP5bx2RU87OJsPpFRh9pApBsTfyz9lqLvB+lJ/M8yRNIbShpY7Ur2cXLWi/GGVg0JYO0aB5X4uJB9tWbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_121441_595146_322CDB19 
X-CRM114-Status: GOOD (  14.70  )
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

On 15/08/2022 16:14, Lad Prabhakar wrote:
> dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC 

Hey Lad,

Maybe I am missing something on the arm side, but "soc"?
Was the intent to move this to Documentation/devicetree/bindings/soc
but you moved it back to arm by accident?

Thanks,
Conor.


> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Document Renesas RZ/Five (R9A07G043) SoC.
> 
> More info about RZ/Five SoC:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * New patch
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index ff80152f092f..233847eb23fd 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -415,11 +415,12 @@ properties:
>                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
>            - const: renesas,r9a06g032
> 
> -      - description: RZ/G2UL (R9A07G043)
> +      - description: RZ/Five and RZ/G2UL (R9A07G043)
>          items:
>            - enum:
>                - renesas,smarc-evk # SMARC EVK
>            - enum:
> +              - renesas,r9a07g043f01 # RZ/Five (RISC-V core)
>                - renesas,r9a07g043u11 # RZ/G2UL Type-1
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
