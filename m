Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C00ECAAD6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9wP/mzgVhEex8+7Bf5EI2CaAL/8Lhsy0mgWKtcUJfs=; b=IxSJ+gK7EaZ+b9
	Pv3uv+CR7VrOrkC0eY6P6/PIgC5BDP7GBDSr0hAEF8Jzhjcb+SBE+rgcuGPV70LaGQGfSnuL1Wjrw
	gaKFk5yzfk4kdTIG2GH4lIGWvnUDNrT7wZACQ5plBu1oNS/1tSxJNA8tpvm2s5QUb949hd/azYA0u
	75oD+Kn5D6DiNjIIhW6kQFupfDaapBLvVhWNJIUFFgyHAJNOjOoGYyHlVj84KF5pL2VvOa9tZkSrA
	Sg33VNSyuIFP4Qkdg5uJmJ4vEqjS0gKX1+szdRlxpxciPmi9iyXLZjj6Xpw0CMJ4B93IZLJtyro8F
	qe69UPhOeFYcRNEVOcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRej8-00ARBs-5s; Fri, 26 Aug 2022 19:10:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oReNt-00ADQh-P9
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 18:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661539730; x=1693075730;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=h9AW0N6cGmj60f83RcUV+kjTEb1MOh7DBMn6c5lIYfw=;
  b=XabXRF57yJCryD3s8xc3ub59rswLHR2YOlOo2Dk5+ZtPRYxTPojh5QI8
   AIIhawXQsayMsiEAAUROzNnt99u3T0JZubegn6YoPgODdJI3D/1ognlY/
   Wgj6zzaaAk/lD78mpYrSXI9HmcM6i0Q/FH/9Nhu454/I+HJXRPpUvU+o0
   ONByBXKHcjL2TIznK96GudgnKvb1cGZZCMGqaAM/Nnp1wYU7yskI6GSks
   1vmjvkujK4kZqC0ozjKmw0eLlSNDSCocAyaeydyrzV6gkjfoHCef2GxJe
   CdWq+uUdGIUER8XK+U6lBFMCiT5LnXwWz36asRWM8e6Q4qE3NhW1qJt+9
   w==;
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; 
   d="scan'208";a="177922036"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 11:48:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 11:48:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 11:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEqfMt+eoXr2A8wwDv3FYwTnyuIRMgXw88OGpUTFxuUGPI9OxzFPxUq4fQT8cM22VgENZL7HY70cC0nRV18P21n2sgiJZvcdspeWYeDsXFotf7NspTqBUv3JGA/eTPB5T8xOdH00Coyhk1r0O7J/iS/Qfix0WrXXfsD31y6qtPbKOKzNSqIggGOTFNlazQbEHYRhswaUtr8dEPLx9syclUDnRmC1FFUT0ZfywUifPeBxwLyeJDurc/xDOdDGqtZWlHSMJcgWA7AUDGneH6w2Bc53QXpGb0ROeUYf6bGYQ0Kw4If/3phCintdREN1l0/YW+OA3iT/pLn0gVCyduRPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9AW0N6cGmj60f83RcUV+kjTEb1MOh7DBMn6c5lIYfw=;
 b=BggWf5wDO0CQtwkTIdT6ditdkfdtpWLfLbUtW4YZhkuudNzOjXHrRYau/+ixcm5p5nEahoZi3niM1OyvVVKwCiHypt5OcV3uXobN9fOQi0SpxVr2DEtDPWyawNMUPk591xPMtIjUMRKxBn0vFcokL780tCXKMnoINsgI4IGogWfiXQbnEbyC0ICzzUbDXq5pmDmqXa34MQn0r4ZQsZK65kbAgIkbbJKAAx8FhUNbIjZK13Qw9ZVDRi1YT2XMFgUvxy75pzVAxoe0XTLPfgLHGB/m5mjHGIn+Hp1H/MXHwjllg+j1dgMxZFavYBGTN7pUtteEPo/qHpK2Xwp83q2fbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9AW0N6cGmj60f83RcUV+kjTEb1MOh7DBMn6c5lIYfw=;
 b=OWIbsHu8xba1l7jc6/3FfDHl7dHReydpo3lgq+fY+Iwc9+1/bcYZIJRU4mKRM6+pesx7I/ze/3D0Ys1WNRaTFaoM8bxfEVu9JxsUEMfnglL++3cbXxJU/U1lCZXoGJf+WcXhhKw/cjf5mkiDHmfriBfd/YhMOG/kQL189FejEOo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 18:48:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 18:48:42 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<daniel.lezcano@linaro.org>
CC: <atishp@atishpatra.org>, <Alistair.Francis@wdc.com>,
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 4/7] RISC-V: Treat IPIs as normal Linux IRQs
Thread-Topic: [PATCH v8 4/7] RISC-V: Treat IPIs as normal Linux IRQs
Thread-Index: AQHYtGH8EQj33i+To06esLFkfCu/9a3BkCeA
Date: Fri, 26 Aug 2022 18:48:42 +0000
Message-ID: <8f4ae429-0f12-2096-c07b-fe43b3abb4fe@microchip.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
 <20220820065446.389788-5-apatel@ventanamicro.com>
In-Reply-To: <20220820065446.389788-5-apatel@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c469f96-e039-4fe8-7fce-08da879398fe
x-ms-traffictypediagnostic: PH0PR11MB4967:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12JS7UdHv0tploP1UQjkLLr/Ghsx4HkxhE0Lj9JUV0f6kaiINg6mS7A+YF0QC2/S9RFMEUjR/VaTds9WvNEeGgDeX7GqAw4TRzGE1hLQIvSJiOkeJTViWgbOF/4L0kRdX+tjTkpC7OVepPEvVA2iHS2v+jYAeI2730FgI8gvAn0Q/0wbdzQhlj48dyzfsiZMB/14vqBM2yhKsIGb3QwID9A4P+6h/FdvqZwssMxgLLa2gKV68c+OiuxafgJiNyedMngHTrAj4Nl/xmGgnfHIFljAbrbsqXJ6ieJ0aIpzjgQSnkfL1yQZgcPwSv9W3COpXmLRmLqQsMne3uaIXMvyDwX6MjL3oZR/lh0jBMoPctON8cWHMxBdpTZF3/jHlcpI2rCNKCYwJwL1lBZsffWQpv6WVs+/i9+XAFuw5O+I0XvYdKxAy68lPMGrfjoQbPkNvWKY66eDIkFkQgTB9Y+s4BHliA1+oHAPFNQjKPC/WiUyYmozUgCewaoDr/lynPBPRn9rW0d/mQDGzDBTExNTVFDUnTxiYKFcrEkmBt0AVFJQZ8Os8ZpSKkL1+YVsIpmmBMFHLrHCeAYaPt+l2RfxUyuRUurSBnMSV0DY/zl+bL0D2K6rwytXCTRkxP7+q55HGl5g3geN5IYLRKKqNMTIwNxBKcXU7GvwCc/xLHSkaSlO3xgVUiI8WB1Y6QM8+Ot+ZhFrZPRd+hpRFt39HSWXpqcXveRRowh54DRb7zFCjNgyN4rWop1mpEWIXPAXeilvyH8n6M8OtsRcRWjNrWLRmeZJG8HqC2WYM22labQu4rckPWcoVPhrRDKgNDLGlWVUH/zsaAWBPlbVuf/FHxJ2/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(376002)(396003)(186003)(83380400001)(5660300002)(2616005)(7416002)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(41300700001)(2906002)(6506007)(31686004)(36756003)(8936002)(6486002)(26005)(71200400001)(53546011)(478600001)(6512007)(38070700005)(86362001)(31696002)(91956017)(316002)(54906003)(122000001)(110136005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjlISXIreDlWb3h4Rnc2NGhlRk5icU1EdGYwd1AydWdwRk1aeWtHSGdBUGdY?=
 =?utf-8?B?MTdBMTdtMlNYc2xqNnNPQ0NoR1Q0QnRPTFBoeVBaRWo5Q3VrR2JUY1RpaGNt?=
 =?utf-8?B?ZHpqajlkTHY0OWJBcVJiUmVwcjQ2OXhnUW9nTCswVDlwTWh6RnE3ZS9yYzkr?=
 =?utf-8?B?VHpGY0JMNVAyQ2hkWHRlWmx6dFN3RG53dTdobnpIaW9ENWF6MmxRcks0Ti9X?=
 =?utf-8?B?cmZmOWVNM2llREFudHFXQS9naDNNemJHM3IwNllmZVhsQ1VmeHVxUmJqK204?=
 =?utf-8?B?QkxZeHlvLzNIS01GakF6N2NmVHFYYkNJNnlCNGsraGhWUGFZMVdwMktodDlJ?=
 =?utf-8?B?MWdLVDl2UzBzVkFwRVo4bG9ldFZkTFVYbTRQTHJYQnV2TUFmYzdGbWVTazg4?=
 =?utf-8?B?NlZlT2k0QndabE9DY1U0ZGQ1dkEwY3FFTUdrOE13ZmlEeFFjQ1owbjhYWkZQ?=
 =?utf-8?B?a2daSG42SzRqSCt5M0tKc0E5Z05mZ3RnUVlzMThGL29xTHp1NHNjWG90THFL?=
 =?utf-8?B?VGVBbVZ4c2RoSE5XcHFOazRPditNSU5FK3dOZ2RXUGxIdGRCT0V6R3lkRjZO?=
 =?utf-8?B?Y2RJanQrZXM3SmpTVnNESXpvRitQaGtFeE9WVUpxZWgzU1V2L05oc1RtQnc5?=
 =?utf-8?B?cTBZTHhKMUpmaUhlYmR5MUVmeEthYU82TUJZWWpOdEZ1QlhjTGhlc3JOSE0z?=
 =?utf-8?B?eHk4a2FreS9RU3p4ckNpNTkrelArTkI0cEIxbmhrcFU0M2NOMDVvcVdWQ1BJ?=
 =?utf-8?B?ZHBlNHIxN1ZiUGxlejdjVC9pb2ZZY1AweGpzdEEzaWUzc3U3VGlyMFVpMFZC?=
 =?utf-8?B?S3Vod3pVdG5XSTZsaWZPeFY1MVVFZzdFb2FUeVhqL2h1OE9IaFgxN3pyY284?=
 =?utf-8?B?NUZhbjRNMkk2MzhTcUU0cXJhendpMG1YN1FON253S2UvMXFJUVU2T1FhKzBH?=
 =?utf-8?B?SHYwTnpXVm5DQkVsRnB0RTQ1SXlZUERuSFRqRVVqVERpNkpnTEVQYS9VM3RY?=
 =?utf-8?B?ZDBuYmVBOXRXOEZIMDUyRjhZYkFuNm1PZ2c0dWtaRFdUQ0M0eCsyTUI2amNK?=
 =?utf-8?B?dXJZenhjUWxyWTVJZGNDWlBRNS85OFlUMmp3c1N0aHpIMlU1SWpoMHFZdjZx?=
 =?utf-8?B?ZUxVSWxTcERUWElaRjNnQVVMNlRvWEV5ZHRIYzlqazQwMVArYlNKTFdYSVg1?=
 =?utf-8?B?ZnVPdmFMOXQyZ2w5aEhyWVJoekROa2I0cHl2eXY3SXREMWNUZlh0bXBzUXU2?=
 =?utf-8?B?aUR4T3dDVGh3K3VQZkZIbUlNRGVnWENpbVFoR2Y1cW1PUjdmR2tSUEh2R3RL?=
 =?utf-8?B?M1AwbzFpSjJVNnB4Z1MyeTJycUYrMEFqSjMvWWxPdnFuZ2p0YUJHN0xCRDI0?=
 =?utf-8?B?MzR0VldqejY1TlQ5TXhPckk4UFNVL1Vwdng0cnc5Q1k2UmZoaW1Ya0t5UlB5?=
 =?utf-8?B?QkZpcVJlZmsvaCtUYWxXeHAwTHVibGg1RWorY3BwTm50VzlRdUNvWDdBY3VL?=
 =?utf-8?B?QzUwRjBCbExob2JsdE9UTE1IWTVjeCs1NWM5VVVSSVdiTUFBUldDUExscFB1?=
 =?utf-8?B?WjgwaXNsOUdwalpRZjhramI2a0tDTVRvVHEwWm1LUml2T0hjN21EaGxtZnNH?=
 =?utf-8?B?WTRGYmN3bmZENFJDb0dIbFhYSDl1NVVDd2tCL1pIQThTZm9WRzFQaVdLMVdU?=
 =?utf-8?B?MEtZR3FEWW5DYlFBS2NMWG9tMDZseTBZemxKTlBjRTZzaVY2bGV6TVh5ZFFu?=
 =?utf-8?B?QWVuOTVDNUN1Z1hnTHRPV0dicS9iazNRZGdiOFljajcva2gwN3ZheGZHVE03?=
 =?utf-8?B?RThRaVE1bjYwTW81Qm9kQkRjM0hPcS9BcXdDTmVaZTJKbGIxVGltY1I0TU41?=
 =?utf-8?B?bUIzL3JyZlJ5Z2NHNnFCNDZ2dHI3SEkwbEhhUnFFYkZURjV2TktLdnRRZ1Fz?=
 =?utf-8?B?WnF3S0k5Wk0raDZFKzBlV213WFZPb2FtY3lLUmR2OGJVZTkvQTAwUWxqbm9w?=
 =?utf-8?B?am9RbGJCdXN1QjJhdm9hUlhBM0poRFhRZ3BKRW4yeFNMQ01XU3JFbVZvd1NP?=
 =?utf-8?B?WngrM0lzZXZJZ2MyV1AyYlhoc21NV0FrWUkrY1o4NXVjbUFxeFJEdnBoSXU0?=
 =?utf-8?B?VFRPRjlSamdBM3pTSndMN3JWZDFPZ1lNK1ozYjFod0lQdWxIY0JDNzN1ZG1h?=
 =?utf-8?B?eGc9PQ==?=
Content-ID: <2AB64CF8C21A5144B3909DC3B704C675@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c469f96-e039-4fe8-7fce-08da879398fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 18:48:42.2635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nT0TzQEuAUYlb0iQv9yFOMYGKME4mqEdbI+xp4jxBrbepYX+aSiw6DjATz9sNjM1a4D91eZauU3OTYDmJFXdcxeUwKx3tjRRYFF1YmQQVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_114849_850250_8A0F381D 
X-CRM114-Status: GOOD (  17.98  )
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

On 20/08/2022 07:54, Anup Patel wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Currently, the RISC-V kernel provides arch specific hooks (i.e.
> struct riscv_ipi_ops) to register IPI handling methods. The stats
> gathering of IPIs is also arch specific in the RISC-V kernel.
> 
> Other architectures (such as ARM, ARM64, and MIPS) have moved away
> from custom arch specific IPI handling methods. Currently, these
> architectures have Linux irqchip drivers providing a range of Linux
> IRQ numbers to be used as IPIs and IPI triggering is done using
> generic IPI APIs. This approach allows architectures to treat IPIs
> as normal Linux IRQs and IPI stats gathering is done by the generic
> Linux IRQ subsystem.
> 
> We extend the RISC-V IPI handling as-per above approach so that arch
> specific IPI handling methods (struct riscv_ipi_ops) can be removed
> and the IPI handling is done through the Linux IRQ subsystem.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

> +void riscv_ipi_set_virq_range(int virq, int nr)
> +{
> +       int i, err;
> 
> -               if (ops & (1 << IPI_IRQ_WORK)) {
> -                       stats[IPI_IRQ_WORK]++;
> -                       irq_work_run();
> -               }
> +       if (WARN_ON(ipi_virq_base))
> +               return;
> 
> -#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> -               if (ops & (1 << IPI_TIMER)) {
> -                       stats[IPI_TIMER]++;
> -                       tick_receive_broadcast();
> -               }
> -#endif
> -               BUG_ON((ops >> IPI_MAX) != 0);
> +       WARN_ON(nr < IPI_MAX);
> +       nr_ipi = min(nr, IPI_MAX);
> +       ipi_virq_base = virq;
> +
> +       /* Request IPIs */
> +       for (i = 0; i < nr_ipi; i++) {
> +               err = request_percpu_irq(ipi_virq_base + i, handle_IPI,
> +                                        "IPI", &ipi_virq_base);

FWIW, ?sparse? does not like this:
arch/riscv/kernel/smp.c:163:50: warning: incorrect type in argument 4 (different address spaces)
arch/riscv/kernel/smp.c:163:50:    expected void [noderef] __percpu *percpu_dev_id
arch/riscv/kernel/smp.c:163:50:    got int *

> +               WARN_ON(err);
> 
> -               /* Order data access and bit testing. */
> -               mb();
> +               ipi_desc[i] = irq_to_desc(ipi_virq_base + i);
> +               irq_set_status_flags(ipi_virq_base + i, IRQ_HIDDEN);
>         }
> +
> +       /* Enabled IPIs for boot CPU immediately */
> +       riscv_ipi_enable();
>  }
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
