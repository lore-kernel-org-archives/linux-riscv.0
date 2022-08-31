Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15465ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqSGHAf4SlYShM8qajNH5jqSsyrfMNS1yfsMNWU8jXs=; b=ZL8wDz+xQu9SIz
	PXaZ8q0xLoG6tWI01VIPT07yQCnZp8IbS0ojTOPOBBNlVK/n4Qqk1u53+8xVAjN40L7sBbPXU0Bys
	i7o2ep9aQ3k4EfSf8foCZuV/9fP78D5JegNhG38rbzB85QxDbYSOuQmg7EZg/pHZ1fTLBjR46lPAN
	YpvP+h9mBR5E/fXPpi01dTyA+LFkO9LvARnZZCb8Ao47EeQFKY2mn+HqS1zuowZejlWw7J8UaefYB
	/AxhHvLwaqEh4+k3Xm+d15y8wG0OfSQGGkweflS6vrN8tmwANTiOSlMSL7RiXa+0DMsnY0RegA1Ho
	NXbKMp0pPjczcqtpuaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTR8J-007Jlv-JE; Wed, 31 Aug 2022 17:04:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTR8F-007Jin-Uo
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661965444; x=1693501444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zhr1IOEE1Uwxo26lV/4RnhIlALPcI5Ls3AbciC4Mx/w=;
  b=0jhGcS1aglTEhc1mfyqNbC3+Dp0TRgwuFSfURsjxkIhl74Hqz4QjtqYU
   PJRYs3FG2omR1/JByCtLDxmF8B9WmZvDD+fw8SpYKeeLHOaoDIiD2SknT
   r77GzHHIdJAQczYPsJQ4t16Qz9yyxdjNMa1KzPqE8pEazAn3n1Fz8zGRw
   +ZKsynOZEjak5ehgMQ8AkdWTjuajQxxXrMO72pm4u90gTn3Ty5vV4fJvh
   sTcprKg3ADeteT0RVXBSkwXXcRuyqyvHwpvKIW3JR/6ERkTgv3f8yrlB0
   iFr91IadbexhKf0+NliFUpWA5dgMpVe7OJkyyuvRQOVqFyVAYaKJ50msn
   A==;
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="171818486"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2022 10:03:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 31 Aug 2022 10:03:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 31 Aug 2022 10:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOIRr13AHLYAMF823YCU04QP5h8Z8zLQP+a381j7klVYv1+Sr0/jOJM5a55kSN45YM1oIcHF91QrFvF1l+5PESVH8XHfPSsXzUcF7fcQAEGc9lit7vzutVK21PsIXqKCwPJcVgQIViiCkPwIp2+7JOU5R3eSe5HgvKHHFkm6uLoemvxRc2j611XD60xszmDpZTr4EAX+rTZxmpBPdDR4TMtQWPy/V0EBwqjSziJU5zaRVKLFAlMlZFswh7/oRPF4F6CeyQKS/DzD6PlMNXSSdTwZ53JFEySQKfc2l7tsHC/YNwJxbBXrWGsMbVOMT2bhSABSwwNsY2ClTBd7WyK0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhr1IOEE1Uwxo26lV/4RnhIlALPcI5Ls3AbciC4Mx/w=;
 b=E7i/sB7Z/HBBgexFXI6dEwvssPfF/xiXF846smKkJKuBltC6ZLc8e8AvYTA9J9wfYeSkQ8lXlk9RUOfBQQkwwtlzCimigVyK05h2u5FzjECFS1wbEWSVp8DsOPnkLiMq+doITbYJv+x0BnAAwE/QzAl232Dtl1e2RsCmmxVNPWKs4rQjtCu5+lBUBc7SU74TkUspVTC8kYwYpZNy5R7zssfzLB0GiVdIHBvToKTtwNz4An6tXGnJMZYXJxtRwAjDHNKCAw8weue7hlHgyAGc1hwWOkKIV70fRx41Ac5LsyWG92aLr6AptAFbZKRAMKEg600hrdN9yLsP4JOy9JQWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhr1IOEE1Uwxo26lV/4RnhIlALPcI5Ls3AbciC4Mx/w=;
 b=l5r3SrQaAcB+Fm+/QZiCYHUOvZGFM1hRVvdJKBqJeiGyIDNBXBWdQb7gSL87sG/F6FOvww5ufVMxo1Zy+o+WL5oWsDhoiOAWS+CiEoW2LD7pCMIP9ZmykbIswKyqLfizYej+9TyQLIZk8iWb1dNpZUFBSGYi8Mit2psmPQCDiVQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5581.namprd11.prod.outlook.com (2603:10b6:a03:305::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 17:03:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 17:03:53 +0000
From: <Conor.Dooley@microchip.com>
To: <sboyd@kernel.org>, <Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<Claudiu.Beznea@microchip.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <nathan@kernel.org>
Subject: Re: [PATCH v4 01/13] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Topic: [PATCH v4 01/13] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Index: AQHYvG98o22tTG+7mU6lxnNYP43gca3JPmyA
Date: Wed, 31 Aug 2022 17:03:53 +0000
Message-ID: <a0bcd9fb-d79f-c774-29f9-9fd184827b98@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-1-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 282c8a35-a455-451e-5be2-08da8b72c8a4
x-ms-traffictypediagnostic: SJ0PR11MB5581:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QvHHztrtcSPRvxEnTI+IMq4FZAr0Dru29odj5D/iwTxJGyy3YMroqr3UAJFvY3Bhm3nY4OFx3a+T9VgplPkIqmSOXC0+DvBrW3PMipcTNPwXRvb1BD5v2InvhEDLq5rLC2rgQAK1lCiTUlRzO6EEgiRmiVPSYIi0V2Dy24JlozbtxyiBuclsJqWQY4dZLrUrxwdw/V08qYsHcxtAqTkO1LfqFSYx+m1dsrPd8nUAzzU6r5oVCWiyP1fZUFqApY18bxjQJfYFSkrwBquywPcKW/4eFbRv8SUnIywMJMesLesMi7RshmM4czOHDIkXQ88l/DLZoeqVVnTScxidhu5CBV8N99Pi6/EeZyvHC5CRcQ5nvJr1uoTuLDAgxaxKXHhIX6pOHDJj9LMbIqRBpm+Bk+K1/p6MxhJRF68K5FsVT/kKwmYXekuBoIBG338ROQu1Q6KlieSMcHXF+JkToif/lGw+rQt66j0tWlTBvYmAbiWo2Lg36wgl8CzxTyNCTEUk8Gcy5KiII6oPLX68KW77IXGdbd6RB6SoAYmjR+t8tq+a9W8Flk7xhVs0dxDseqvhqDFXX3eLLjTCo774mLlnCdorWoA2S9Hm1J1YoTA9ZJAJ3qIVDyfXa1e4d8gOs7K5IenGTxDiOTIbANC5ORZRYb3XeaUeaiV6+jgbwen8/IdFaE/15ReDnMFUX9FOopUmQ+8a/WCgykQSI7mpmZ434816SkXSzHZKE2rq/gMo/q6hAAf2CdTaC8Vzpeq5b7luJk8FQnbu7FmOaNZ0aKShZrlkb2AJLwv/hiNffRkwAldNaCGFUEkuJJu1XHX4JUTT+YY2e6LYfo/LwlGwO659Pw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(4326008)(64756008)(8676002)(478600001)(6486002)(66446008)(66476007)(91956017)(66556008)(66946007)(76116006)(2616005)(53546011)(86362001)(31696002)(2906002)(6512007)(26005)(38070700005)(6506007)(8936002)(41300700001)(45080400002)(5660300002)(7416002)(83380400001)(38100700002)(316002)(6636002)(186003)(71200400001)(54906003)(36756003)(110136005)(122000001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1BRU1RXbDhHVnNmTE01UVRuaktCUld1d0ZUUnRYakJ0RnZkYmhyWnNMMDgr?=
 =?utf-8?B?MjFyZ1ZpL2FhUnlTTnU4RCsweW44V3UzWC9JZVFEVjdYS09mWE4xdDQ2STdM?=
 =?utf-8?B?UUZ2UWcvMmRoVUFrajBPcWFaT1lKNy95QVF3cGF5MFIxRzdCdXpDUEM4S3Vx?=
 =?utf-8?B?QkxTQUdubTYzYk92bFhtNW94QWJZbUlGMG9ETUlDVUVIYUcvY3B4SXRjMVdF?=
 =?utf-8?B?MTZaR1RtSStjL1NHRDlhV1FXY0sxaXE2OVFYTUpYeE9XajhtelNRNnA0ZHU1?=
 =?utf-8?B?UHVYYWZBNUdtUmdOODNISnozYnpWbGx2dER4VDNQOHA5L0Z5UE91bkkvWEpo?=
 =?utf-8?B?NHliUHUwNDRIV3RibzlEWjJZcUdyWHNhMEZxbkg4NC9NMEplQnp3aHVrWFNJ?=
 =?utf-8?B?MWVMbVZtM0JRMnhtaEwzZzNrMng3NmMrTVNVRXp4eVNhdHIvZDJIcGpnSlFv?=
 =?utf-8?B?Z0JBblZQM29aZlZyd0xiL2J6Z0REaTBOTUhnUDNyMUVzNlFNcW1sdEJRQVNh?=
 =?utf-8?B?a1Z6ekJPRC9aODEycVh3TktWQlZhbVp1VlRvcStJcnFaaHF4RGJnS0E0akNQ?=
 =?utf-8?B?ZlQ2R3hQY1pFdkQ0QWNOcys1ckxRcm5FeFFlS21KVUpLUTZPdVo5dGk1dFNv?=
 =?utf-8?B?QTh3aklZS2dxL2JtUUV2S1M2WllEQk1pOTFVeUpXeGxId2RNWEdhREJmRWwx?=
 =?utf-8?B?T1h0Y3R2eC9qdzVNZVkxWm1XRVJQSkwra0NuZ243c2xacXpmMUlNRWZwSHFm?=
 =?utf-8?B?VTBmRXg3WGMyT3E4akZEU2xidmFlVDhGeE14bnFML21iZHlhUzdvb3ZOdVBM?=
 =?utf-8?B?RnZGVUJUS2E3Ylk3MnVrWHhsTWRENjlnbXQ0TWFZeHZOMGQrV2J4QmFTek80?=
 =?utf-8?B?ZnE0MXNENnY4dlQ3bVpobGh1UGFSVURWaXN5U2NrdzdpcERscEtKRXpQM0VE?=
 =?utf-8?B?YWk0NlFxSGZUZDRYeFZxYUZuVjVydmIxT2pCcGlMYmQwNm9NYmtia2FtNFMz?=
 =?utf-8?B?cU5wbDJCcUFuUGRib3BSQ1RWaVl1SlFleEdkenVhR3dkMXRNMXcwdXNBcGVu?=
 =?utf-8?B?MFMwNGl4NlZITzNJNkt1WGRQVWtWVnlDZVptOW9kRktjYy9qMzZGeUdSU0NG?=
 =?utf-8?B?RmluQmxHWXVvL2VvK094dWZSVnVWc3lMQkhvSFhnc2dTRjFDVERqQ2dYUDhm?=
 =?utf-8?B?TVdqbTZFV0kwbXU1Y256R3JhQktnWE1SaHlnazkrNGNadDk4Sk0xTmhwVDhs?=
 =?utf-8?B?cnJRL3QwczNPa1pTNTdCWlZwbjdsUGg2RGJGbmkwTzIxd3JodzBBSlNJWUd3?=
 =?utf-8?B?R0hZMXdwUWR2VXNxVDhIdWt1MUFJdnZoYXF2MHZxMUVpN1A1RnhwKzdVQWNk?=
 =?utf-8?B?RDk5SHorWFJRckRDL0UzVzdhSVNQdWprd3BwdFdHS1NIejdHQzRyeE9RUEdB?=
 =?utf-8?B?Q1VNWEFSVEhwQTBhYnRwRk5FalZ1Vmpoa2ZUY1NWWWxwSWJrTnYveUhtNitI?=
 =?utf-8?B?ZjFqWDc2WHRPaEJ3ak9VYXhZS2gzZytZNGI2dTZ6N25NaTFQNUhnczNHY1A1?=
 =?utf-8?B?UlQ1cUZvdkZwVS8wSTJlakhYUmpZanlybDg2K21NK2VGQk16RmRNaTFhZ1ZJ?=
 =?utf-8?B?ZVk3bmJJWGZKN1dzb05xTjJWakkwV3ZDUXZCZml5OVpFSlp5aHFBUzZIQmpL?=
 =?utf-8?B?TlR5TnZnaUlzMGVFUFpHU3A4T2tOU3YxOHpuWU56MDAxbnZ6WjNlcTh1SUx2?=
 =?utf-8?B?L25DUjdDdXZDbEFnRzBGZGs0ZkkydUl6d2s2cGtqWkF3RGs4cmI4MWw2SHRL?=
 =?utf-8?B?UXloRXB1TDVrdzIxU3p3ZzZsR09ybmt6ZjIzNmhpc1dWMnpBVlVyK2dEclN2?=
 =?utf-8?B?bFFsSFdzbVF4ZEtKK0c1Vk5mYU5mbDAxVzNmdmdUUFZyTlFpQkFUSGl3REtK?=
 =?utf-8?B?N0VtNEJRdmNJZnFxaXFzS3VoQXE2eVhibHRFT05kMzY3SGszTDI2SmR2akY0?=
 =?utf-8?B?VnQ5UXJjMkpDOFEwaDFQSGJUaFJOemZhMVpUbmR6QksvbXllRmM2bnJYSG1l?=
 =?utf-8?B?bmRvNlN2RjFybnZ3K2NrZlFVK3YyTTFCSmhZZi9FazdxMHpOTG1zNDNud0gz?=
 =?utf-8?B?TnJQVjZJSjRjYnRndjl3dVNZQ09OalNTbmVlUkFYZmZmdUlwTHBOaDhFY0VL?=
 =?utf-8?B?MXc9PQ==?=
Content-ID: <26DCBF8240DF104BA3D28883A309993F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282c8a35-a455-451e-5be2-08da8b72c8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 17:03:53.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ku228HRdmMOf9NGIyKdJpGEDyBCJ3Fllz0oo1rBH5+XgG2yrKETSkXcm+lAvhGE+QRgen+bQIxM6xI0UgzHDFrA21NArkARPQ3wviJ+dszk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_100404_107179_B0B5B384 
X-CRM114-Status: GOOD (  26.90  )
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

Hey Stephen,

On 30/08/2022 13:52, Conor Dooley wrote:
> Unnoticed in current code, there is an array bounds violation present

Looks like the "Unnoticed in current code" is not accurate. For certain
compiler/kernel version combinations that can be triggered without the
rest of the patchset. Apparently the default yocto gcc used by our BSP &
v6.0-rcN does the trick...

Could you take this one patch onto clk-fixes or would you like me to
resend individually?

Thanks,
Conor.

> during clock registration. This seems to fail gracefully in v6.0-rc1,
> and life carrys on. While converting the driver to use standard clock
> structs/ops, kernel panics were seen during boot when built with clang:
> 
> [    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
> [    0.591520] Oops [#1]
> [    0.594045] Modules linked in:
> [    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
> [    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.613012] epc : __clk_register+0x4a6/0x85c
> [    0.617759]  ra : __clk_register+0x49e/0x85c
> [    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
> [    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
> [    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
> [    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
> [    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
> [    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
> [    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
> [    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
> [    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
> [    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
> [    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
> [    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
> [    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244
> 
> It fails on "clk_periph_timer" - which uses a different parent, that it
> tries to find using the macro:
> \#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
> 
> If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
> which is well beyond the end of the array. Amazingly, builds with GCC
> 11.1 see no problem here, booting correctly and hooking the parent up
> etc. Builds with clang-15 do not, with the above panic.
> 
> Drop the macro for the RTCREF and use the array directly to avoid the
> panic, using a newly added define that brings the index into the valid
> range.
> 
> Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
> CC: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/clk-mpfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 070c3b896559..9e41f07b3fa6 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -27,6 +27,8 @@
>  #define MSSPLL_POSTDIV_WIDTH	0x07u
>  #define MSSPLL_FIXED_DIV	4u
>  
> +#define RTCREF_OFFSET		(CLK_RTCREF - CLK_ENVM)
> +
>  struct mpfs_clock_data {
>  	void __iomem *base;
>  	void __iomem *msspll_base;
> @@ -381,7 +383,8 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>  	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
>  	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
>  	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
> -	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(RTCREF), 4, 0),
> +	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
> +		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),
>  	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
>  	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
>  	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
