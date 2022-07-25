Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E03AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/8eEjDRxp+pW6bV56ijpL7pl0TdFiJAO6v0bEaRke8=; b=egUno8J2jOo2dz
	VaXRDKMTfkm/gVKRj8g6Ysn1zznIqiVT+UGk/5umDYskJT8vKR8CRz0AzRwOVgjExftPS+yO2lRhW
	JTmKujwUf3SOwd2qubXyyhWI3IaoJKx5CNjyefTGkNNBu+rKQk2Cp0cDoCwP9EaWUWbGLrjoRR1Bj
	JpGyE/TDWqepFu8rCYAmInTypErJkVm7D0wN66Ca4o+Wwpjp7XMfhpwzGcEo9YQdNMe3sNwkBbHqu
	Uyy5wvTxgUoZj30crD1lqqKy7t12QDv++M0kBT0oNtIvq2+ZyWb6UgP4nLJqNQPaK7Vv2WSM3wxKx
	Frs0aMAsxupzdcBVTdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG244-00G5k4-4V; Mon, 25 Jul 2022 17:40:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG240-00G5ih-So
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 17:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658770817; x=1690306817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oHjxxjtBPk4GbldcE8o9LUxzmivWyezNzIc3TnT2Dvs=;
  b=1RAejNEdy5Y5SB/oPAvMB8EQRv4WgiLypIPO2cSZC56BhgAyu1uZoI7O
   Rn1uOyU40BAexojTSUAxp22Kl0ps08Cmp2FGEIfsYwknYNnXPpTUq6zE3
   jqk6/xp4u/y2AZcrY4pHhVIuCwlEOHI9iIMwHThTtlfTf0kufYK6D5UKu
   0u32zGkMMbpPP3j7iI9m5EwrQpdDn3nJsFt3IEAfZ8vkRUa71fXJ48Xd+
   xh3UwdMPVYAIL6aEH0SBU8feF0F3VUq1mvFywnRkpjss9sgDLmh7QAd1Z
   XrEALlvwZE3j7xcNU3y/axwiwVK0jTZgyjKJXVbCUYg1f9PB6oDCLgm2n
   g==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="173556043"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2022 10:40:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Jul 2022 10:40:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 25 Jul 2022 10:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlaIINoimf7FtLU/t0GGXq/f0Waf8E9KKKOa71OWWqzD38pFuvwNSsDZpOnlL9g4nNfWpA+zdjDeX5CWaOn4Dm7ASBUzuWat3PrMN8Ok1V5bWT30dgLPJc09RAFtMA3Ke4tuB3bWAADRp/mAzIm0C4I9A549YRPVbxzjdS4tNGGK8Sycpa2UI+fAbhp8K8KE1dKr2t+ocsK+tHmW9vips81DjTi8pZtxYex8k7NOA9P86p9IeIsUNEFOaUDPbh5OpG3TG0LiHJ1T9whdw7q96C+N23mYyrTu/o7bND99qUwtYT9yQYVSo3p5M+eqvLs+sgr2MH/Tj2aoxsMfT9+/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHjxxjtBPk4GbldcE8o9LUxzmivWyezNzIc3TnT2Dvs=;
 b=LxlMgEZ3qRJWEM18RJIXgspJ7Z3aHwIINDc18srEtH1sFGa2qDct0h5hD1QC+iYt29RgMX0w7lD1PNNe919nd+7vxxd0gcx/jUIgMjaajhUipgw6x4jv53HNzPSOz8juWfvMEgJ3Aqm/3CJAMOrYNkZ7pL6HHHXk1ZrxgkwEdJF+VhrmyLL0anxh9UNjMAqgQIplZaiCSuXqGOXv0N78TDk7hrVJSoXSO5R+bAShoLDDde6DHH+YHZpBrWKGYWJHWi9h2ben6QcxdIeHa1HEKGxkLkvDzcFbBUA8Y3gG8XeLQFxUDPzKQ+KJa0sR+8qu3GWnVd7YQwS0bNSTIrvbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHjxxjtBPk4GbldcE8o9LUxzmivWyezNzIc3TnT2Dvs=;
 b=ZQioR1fGZiUy2PxitA+fbjKzM3IrWIGsnKdR8c9hKZv3MqlUyPk318pfZV7c3rOTVw00n0kPaMbdL+KFCUpLOaNWI82vkdOTlg6g6qHh8O6sHtxJzXdY4wdsDCUQBeQ+l3TA0hrIizQXfh2AyOXh3dWqFWRNjUYVR99HrBPwDcE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4330.namprd11.prod.outlook.com (2603:10b6:5:1dc::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 17:40:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 17:40:09 +0000
From: <Conor.Dooley@microchip.com>
To: <wafgo01@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<masahiroy@kernel.org>
Subject: Re: [PATCH] checkstack: add riscv support for scripts/checkstack.pl
Thread-Topic: [PATCH] checkstack: add riscv support for scripts/checkstack.pl
Thread-Index: AQHYlvCwadojspZxYEawbRWrHdmJT62PbUgA
Date: Mon, 25 Jul 2022 17:40:09 +0000
Message-ID: <fa77d640-a18d-ca77-ba57-6735094a224f@microchip.com>
References: <20220713194112.15557-1-wafgo01@gmail.com>
In-Reply-To: <20220713194112.15557-1-wafgo01@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0b3dd86-6726-4801-f664-08da6e64b82d
x-ms-traffictypediagnostic: DM6PR11MB4330:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: izUmdgca0sTfmf8cD/7PXLc82MZnQNA4NCjuIRDhcUVuYbbSuMQQOXt1BczM3pWJ0uAmohzxkLcvUGOgo3pSifd2JgOlR7rdApeh8Ek/0Re/U6rCBSRZqySCEyS62crGYfOxA7W6H4mhXP9779qDZ0Ttqc+ojaFuWWQ1F625ego+H07LGnH7IPjgKNOQD886/hN6YeVT9UNyF5Nnf5qL7KUrfFGYP9yozRDDLZXkpZs2bL5w27Gx6CO+CvuA2XqfYW7E8AL0To0kxUrZBVmoaAwC/2mEVd5SuFCJs20W453v1N5Ovur02FRC0iNr2Zxl0TW+pbdj1DBf2heZMuJQWOSCIX+8KCSOqAYo5cDisF84GW9TCAEUsZtZoeG/S7rrLdlBItcT7tLBxTE/H7O9fd3GwFsmZii/Oi8HELowHcHxVhxUsselGy1UC5YiN8LWHfSntkmiaSH4+8KYD7VOKOkEBVyN/Y6cAhxBbqgPgfqc2R7hkCFOHiFlEwzYg3JSf3x9GozJ9WamgGEXHrshbLXSJTNjCFtuhfiAcQFA+a+BoT7nICEIupJRp6g9GCbH+29wuFBBlmdUnsMjRlLX1Sn9I5/aNIkW+3e+RV1hN74El4lnQJkK34ynWXvwbYskYc0uFOtwVZxAQ4s9v8v0O/vI6C+CAja4Fzjiom4hDSwOMRdDrgN/wIIYyJto2og4RmjydGm8/RmLiyEif4tNgGgdhbgjILEwdVdz8pox/nEpVa94202+hXYDQEJF383rQUZYDQlmyYNqMMPcbuXZqAt7OdP4RxVGwpCTHHUh3LSlV5NAm4cTX/kN8CTsHv5MEEag2htI7jEuOe9HkZ5k5OtDUb0d+/OPy96Vv4FX0kdWHCACe1lBD3SXQW2OI2G3l17WmcTHt6DVdjPO6EjCGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(376002)(396003)(136003)(366004)(83380400001)(31686004)(86362001)(31696002)(38070700005)(6512007)(26005)(122000001)(36756003)(8936002)(186003)(38100700002)(2616005)(71200400001)(6486002)(478600001)(316002)(966005)(6506007)(6916009)(41300700001)(54906003)(4326008)(91956017)(76116006)(53546011)(5660300002)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFJLMVlTRlBJNkRLUVUrbUNLejZkNTRIdHhBTVE3dVhFaDgrOEpkajBBUGUr?=
 =?utf-8?B?dlBaSkhZcEI5SnVYUzE2S2NJTmo2WWtmYnJCOEY4cDRDMCtScHNURjltNThU?=
 =?utf-8?B?b29pT0gxbXM5M1pkVlpKNk53cWNUcDBXZTZBK2VCb3dnd3QwMFloVEo5czhi?=
 =?utf-8?B?ckllUUVxZmhDTDFuanJVU2pxMTRpc1paeWNra0JiVDlBNzZwSEhwZGxUMnBF?=
 =?utf-8?B?UHRya25ydU5uaTFiNXJKOXh2bGNpN3pZUHR3WFhjU0ZubU55VWVFZ3J6WC92?=
 =?utf-8?B?WFRZcWtBUFVueW9EZmFRRy93QS9FR3dtMktiRHIzRTAvRzR6Vy94U29GRWRB?=
 =?utf-8?B?ZmxFYkY0RDk1S3l6aENwVWFGZHhGam8zR1FsZ0MvYWxnTHdrNTlSZUlBeFdB?=
 =?utf-8?B?RU16b1dZSXF5bGI2Z3B1cXJ5cWRxZFg2eHBMS21QQmpJMjFWTkQxaE1qVzEz?=
 =?utf-8?B?QUtRWDFJSHJpdlc4QmMycTh0RDNQWDExWlNVVHZBZDc2NU9ibWlzUzE5ZERq?=
 =?utf-8?B?R3hYRmVEUkFWQXB0ZEdPZ3kvQVRMcEVqVGdBaWxFYVpGOSswb2daUzdLZWhl?=
 =?utf-8?B?dzQzaVFYOFA5N1EwN2NpRE9PQTNWcEhGR2c1UGlkNUhrVmp0KzhxSUtsNEVZ?=
 =?utf-8?B?b3N4SldXTXc2L3d0QmJ2bWkvRnYyWFdlS09TTGJoNWI2Q2hYa0l0Z0lpREU1?=
 =?utf-8?B?Y0pSNStkcDd6RzQ1NW9LL0t2RGpuNGZZVndUckVFK3R3cTIvMVd6ZmY4bk1F?=
 =?utf-8?B?VGIxd0pvbWxhd3AwR1BYSkNqR3RoWTFlREdaejQ5QWNrVVl2c2VqN0I5Q0hR?=
 =?utf-8?B?WkhZeVBFT3RrNmVwRzc1NURWRHNwZFlLcmtnODZmSDBlakR6YW9NYi9XNFla?=
 =?utf-8?B?NTUvTC81YTUyekdaemYxOHRUZ0VlQ2NhbnpvSUFEck5zUzk0SkFDV3NTVmZJ?=
 =?utf-8?B?YjdINUJyTGdVRm9uODIrNDVmUE5MdEFmdTNjR0toZ1E4cnNDQWtrNGcvU2Jx?=
 =?utf-8?B?azlnWVV6SHZURHY3SXVGM3pLb0p4TW5kbnpqS1laN0Q3djJTc2FJVXM2bmhU?=
 =?utf-8?B?RngyaG1sV0MyR2hucHd0VmhuSTltV2dYVXAxc3Mzc0hYUlhXK1pKTXpWOWlE?=
 =?utf-8?B?VDRHelBtV1BodlZ4V2dMNGFZZ0MxdHVNaFlvelVyRFhabXNpSk53U29IYWtQ?=
 =?utf-8?B?WnFJOTJDVXBhZFFHcFRJVGt6dzZUZDIyMHhWWEp4Nk51emV0b25pcHl4ZXRo?=
 =?utf-8?B?WHIzK0tIUzcySkZTVWQ2T2JZdS95MlZjK3RvOENyd0pFTEZEMjBDdmcvZmFa?=
 =?utf-8?B?dXdIR3RHZE0yaWRkL2dNdFpDbjhOU2g3N2dlbmN3V0xxazJTMjI3dExqYThk?=
 =?utf-8?B?Q2IwZ0RPVFdjUDRReVZoamMrWmRvOTFMMm1TY1M2a2ZQS2dMR2NMQmJZV1ZN?=
 =?utf-8?B?WS9jUG9XOHVRbkM0TGFYVDZnaWZyR0lMWGVjTStMVjBMTTBIQ0pPdVROVldy?=
 =?utf-8?B?RjFFTm54dTBGQm5oNDBXQ0NSWUhVRHlFeUM3VEJhOUhQSzQvcEVYL0Jha25C?=
 =?utf-8?B?bzk3WndMT1A4cS80Q2h0ZkxyYW16MDZMUGtxRmI3aHRZUldFV2hHMSt4dVcr?=
 =?utf-8?B?RTd0SFUvcG54Tk55ZWcyc3VVSTZmSHlnVEdCYmZkUGRNd0tUR1dmTVE4bjZ4?=
 =?utf-8?B?UEZFWG9VZGJMc2FSUUNPdmNQbzNVZzNFVW9YV3grbEpoRzE0azZNa0dFUlNl?=
 =?utf-8?B?c3Boc1FjZ0pDS25EK1NkSHpjOFh3bmg0d3R6QW9wQ0xHRzJHS2x6NjhUQWdC?=
 =?utf-8?B?WnNBeUcrN0hZRnhPNENzTzZOVGpSRUNWN2lCRUY0SzZCdGRxUU9PYXpoOVhj?=
 =?utf-8?B?K2I3dVhtWXZFT0JTT2NGU3J4bDZpVzAyMVE1amhFcDhGWklkRXNDV1NlVWF0?=
 =?utf-8?B?RlA0MmhySzR3cVJLVmNqN0gwZHEwZXFVTmtyRXFGRUJZSSs2eDd5Y05oZXhn?=
 =?utf-8?B?RXovYWdMQnVISmF1UGlmRmlid05RN29XcUpZM1huK2FoNGZQanRqMXo3eENm?=
 =?utf-8?B?aVFNN3U0d3hmRUJlWnVENjRvNGhiZkZQRDhQdXRGMlRvc2lTUnU1VE5KazBy?=
 =?utf-8?B?MVJKTmMvMzhCSGtKeno5cjFnR3FQc2hGVjRTYVpYUTNEeGlHYnpDZUlMMUxD?=
 =?utf-8?B?N2c9PQ==?=
Content-ID: <6C4EE9C0D81B3549B396EAF08E171BAF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b3dd86-6726-4801-f664-08da6e64b82d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 17:40:09.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACSMsdG65PGEy9PpQyZyGTH6osvv77WrAKVJ/VZLc5efZr+HJDRJDgzp92qnzQwmZpp0FUAdiBLjIXqVVtsZz8s6WShyMXIfN8591VIg3eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_104017_015461_E413BDBC 
X-CRM114-Status: GOOD (  21.15  )
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

On 13/07/2022 20:41, Wadim Mueller wrote:
> [You don't often get email from wafgo01@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 

I feel like you might've been mislead by get_maintainer for this
patch. It looks like the maintainer covering this is Masahiro
Yamada <masahiroy@kernel.org> (at least he's taken the last few
patches for it).

I'll be honest, I don't know how to verify that the output is
correct - but I did run it & it does output something that looks
sane /shrug

Thanks,
Conor.

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> scripts/checkstack.pl lacks support for the riscv architecture. Add
> support to detect "addi sp,sp,-FRAME_SIZE" stack frame generation instruction
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  scripts/checkstack.pl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> index d2c38584ece6..d48dfed6d3db 100755
> --- a/scripts/checkstack.pl
> +++ b/scripts/checkstack.pl
> @@ -16,6 +16,7 @@
>  #      AArch64, PARISC ports by Kyle McMartin
>  #      sparc port by Martin Habets <errandir_news@mph.eclipse.co.uk>
>  #      ppc64le port by Breno Leitao <leitao@debian.org>
> +#      riscv port by Wadim Mueller <wafgo01@gmail.com>
>  #
>  #      Usage:
>  #      objdump -d vmlinux | scripts/checkstack.pl [arch]
> @@ -108,6 +109,9 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
>         } elsif ($arch eq 'sparc' || $arch eq 'sparc64') {
>                 # f0019d10:       9d e3 bf 90     save  %sp, -112, %sp
>                 $re = qr/.*save.*%sp, -(([0-9]{2}|[3-9])[0-9]{2}), %sp/o;
> +       } elsif ($arch =~ /^riscv(64)?$/) {
> +               #ffffffff8036e868:      c2010113                addi    sp,sp,-992
> +               $re = qr/.*addi.*sp,sp,-(([0-9]{2}|[3-9])[0-9]{2})/o;
>         } else {
>                 print("wrong or unknown architecture \"$arch\"\n");
>                 exit
> --
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
