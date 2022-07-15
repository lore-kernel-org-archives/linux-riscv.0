Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E17CCA47C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BY6f5EhnUKJnn/UZnGGPpzE9lWzWEywQLwGCrM3Q09w=; b=Lt6DF6lgfzv/L2
	LmD/QIchBWTj0YAg/1APqyZeslkTsm3ZTEehCegIQqaeFNW4eW0XFZYtFdII+bUQtjQZc5Toc5Jal
	FgULFMkXlSCSCXVCHxibYmMR4fa10qaUI9ouBjWuSCAyoMtm0RuQ7dYzIszAGAUqdl3r0xhIGd2RT
	8zJmxPsy2SabwEwvpEU72vYio2KCVR+79Akqnmsf3COecuHWyxviQ4YFS3WPQEyUrkpoI4tZELBFP
	AqFGDjGfsuAdiVDlW+5BqEC0vX6BrqKz/eP81MKCewv43ok7LeTFGZrsEa+EnnvyR6F4C6YjxQ6lg
	EE1PEULoWDQmQ6XM0qWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHQy-0063ye-7q; Fri, 15 Jul 2022 09:16:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHQm-0063ud-MF; Fri, 15 Jul 2022 09:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657876577; x=1689412577;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ylAEe82ygy57AZoCHvF4dVyWSZlsFPwHaJCsXWu7CVQ=;
  b=n2bq5tHbrR72XjsZiJa/mWX3M0pY5TAw0F8zVSxXBoSn5G0At+YQM6Uj
   rEMMbKC2bEuqEoedRpYeumkFrqbStw/5j1z+ku88q0wLTr/Dm+AJmHJRn
   jtEsNLSMAp9PVrjQZQuDydllylG7SBrY/uDjCTgCl7+DqACDaLaygvr2x
   /Jxoa/Vswc0QVbRsKcwgCgn6/ltSTe6bMvgZYk+1iudyxModNViLyB/nR
   Htj+e3ntPekDq3fxwdfSNhkMUr9IoCHwdpfOrEcq1EILbjcHum1kMVWrj
   Hsr/uRUxAMU5h3UaBVs9fFYMt8/PGy86OGMxecD9dVX7GSSJ2jUTBIvW/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; 
   d="scan'208";a="164883033"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jul 2022 02:16:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 02:16:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 02:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McVwZD0bcxdyfaM/01GjnIj/mC6C4MyGp24SqklMjmfO3OeT24bKCbSeLId/xpgx12bzWdaUhie34ViFqBZemXxQPEHzq5XHkhiCxnfWibVBX/qbEAjjKv0xk0IaTizllDThL2oV3OO8GaaaySu/Qt+0QFVFDZJYNJ2On/T6OmZMExinwQc+YrhWtvYBhZTBNJGp0qNBsVBokMvE2m5DGm34eurXYSbk2cvlmUeRKKlnrocskrzeD1gzsVGSm9WWCWcWgTnj1hd7V6ZfJz58Xd2NLDLlcFOuZ3czd6E5jqTatkjE1Q/lANygiDJdTAhu5CNRS4TlWHbT4HXcaQatbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylAEe82ygy57AZoCHvF4dVyWSZlsFPwHaJCsXWu7CVQ=;
 b=L3pWDE6OspGCGep/M0W9a+C9zVMatoUIygul+iPgYSVIWKwsb5IackkjTJDtiUu6b3vxbbOT8NRP1Q/jGZ8Vxoh4dovYtX8cFNMlUGNTguCrux97c9Gji61E8oeWx97m9wYvQGVnJlve4FUcY/JuWYynBoLqxAIPnptfV1QAIryidV2+BADnlJ3ih4n2ud+xkmWUAvfYc6exZQDB0YNtf4NOfVmTdGC1MFrut2BJbWCxEF2Kdy4+dEjdng5Upo3zhw4wqig2AEUv7fw4vMPkL7Dl7UwSKAp+eohEPx7c5bCxXn9Cq9x+Wx5jH/AmnjS6cIciu0dhoai7YQuiN1Qg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylAEe82ygy57AZoCHvF4dVyWSZlsFPwHaJCsXWu7CVQ=;
 b=rj9XCrUpJEUEKRXfzxwAQIcTokrhm+vkYhgcBm09ykuN4f6C2MyDmQZYaZOzTaiMAeGMBPyn7qlM9Hce9UJv5arIhU7B1dD+LwjZ2Qycqy2XLtlu5bS0ZHwz4SlakDztajRFzO03fnUJyOfvCuBO80vDI8s6f83CfzU49obgrPo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Fri, 15 Jul
 2022 09:16:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 09:16:05 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q19638AgAAMFQCAAAdOgIAACUEAgAAC4oCAAR0zgIAAAWOA
Date: Fri, 15 Jul 2022 09:16:05 +0000
Message-ID: <8146f6e0-0682-4876-95d0-01e99141330d@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
 <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
 <20220714160016.honjpzg35ccq4fto@bogus>
 <50b3316b-aed0-2ef1-a7ff-69aa3991d7e4@microchip.com>
 <20220715091121.mvwsopbh52c3zztc@bogus>
In-Reply-To: <20220715091121.mvwsopbh52c3zztc@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a7214d2-cda8-4368-1b45-08da6642a5a1
x-ms-traffictypediagnostic: BN6PR11MB1409:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QrhvIqE9rYdFw1j7BITIFCTJjt9dsarFgOcJHUvtCOIZ6qQYdOisvuL36Fl2upDzNsDWQU3XOArQ7ZGvSJAmwJIVkLg5D15KKTXgb0+x0ABFcUkC1bE090AnA6re/j91ZUP8CDLxffi5Pj97my/E0E3CVoSAVKRIPmtAnCtaxHQNx5cS1wRz5iO7FI9xiYk6s1ziKpEqaTwsbG8dr9cwBd23yadBej1GSuIcL9G5ZPi17bFf3ZJaG57Wouq7TT764U5vZMgtl3I9MG8koZmTV9prfFMwpI/Q8c//nrHAZB2djtabXZbP9NGSKrEHKV36Du7wufeEGokTyC4bFIVN5hYUYnmlf22/FDVELyuoqoWI2XXxTSRqidNnzLA5Q+HDVL33ziDxHq4VghDmd7ldkcUBsW2RzIPe90JcQ1OzwXEkbOBISEE9M2LkoJdsZX0A9vwCxYhsGQi7BDiqdGQJJSU4t4ob4gvi5GO7bT+Ceqoex5YL+cwO0i5y40MYkIdBTe7BK+gzRbX05W0cUFa47+Gr4sj7oG3TtV1uLoKypr4k0AKSP76ipPI6VSSvwWCjEX4iLJrA4G0xRkWDx/NX3kPNRHm/URJOM1CnlnEfox6+iAXPlvLRfmD63huS29zjC6O7Lk2VXUcuiQyuVyfO9uwQfd6PMWtY+IO5Zt9BSdhwTa8geIAR6P9CzWWCxBpuw+VLODgeRSCqfapbcI7jR6IbD2kb3fN4fdbRTMjTzkbswuN6yBHa1C/nJdjKZJWcmGrFDBAuPJBLR/t1mzYwW7O9EH36GYBrFXUt1oh4+VXpBN1J8LM298ALJhniyg/YwA+GlRyXaPBQqdnTlY+EA6Hgd78dDA1IciU18a6+JpaJB+MwnFGZGYkrYspPPAh1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(366004)(136003)(396003)(31686004)(122000001)(36756003)(38100700002)(83380400001)(2906002)(5660300002)(8936002)(4744005)(86362001)(66476007)(186003)(8676002)(54906003)(66556008)(6486002)(316002)(66946007)(4326008)(66446008)(2616005)(64756008)(6506007)(53546011)(41300700001)(38070700005)(6916009)(91956017)(478600001)(71200400001)(76116006)(26005)(31696002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFvbVFQTWtncnBUejlJckhDV1BWNnMvZWJVN0hJQ21JaDdVNlFOb3lYYWNk?=
 =?utf-8?B?WUt4T2dmRUFnZllpWkxsOW1lTm9WZ1FxRGVoRVljeEE2bCs3M1hCcUVGVy9I?=
 =?utf-8?B?Q3ZoNVcvY0VDME5BWE53MjZ6bUJWVlh1UkJrdEE3dW5xZlQ1MlgvTVAvNGk1?=
 =?utf-8?B?Zk9KR0VFdU5xYjdra1hmSXREOEZxNFF5L0VXWFh4ODFzNjhYcTM0U0dGdWN3?=
 =?utf-8?B?S3VEZUdKb1lzSCtPQ0M2elduazJ1T2NlRW9Iem96VlBXMmlXblMreGxybmlH?=
 =?utf-8?B?dUdDRW4xRXRUU3FlaGNPT0xPNzdEQUR5OXFTd1k5YWwyYnFnRkRxOFFrMVBP?=
 =?utf-8?B?dXQzT3A3OHoyRFJVWFBob2hjTjV4RVhtK000VVNjajdTdXlId0JnY1MrbHd3?=
 =?utf-8?B?Q3ZWdmo5QU9xOFZnRVN4c3V0ejU2UFg2TUU1Mks1K1ovVnRFMWRqVXd3dDNV?=
 =?utf-8?B?RGRIVzkrMHBabHVCSEl5Zm5pZU5MMGM1UmszN3BPMzcvbmZKNWM4RmsyRGhw?=
 =?utf-8?B?M1JFVTFYL3BONmRjcXo3a1cyd1ZKZU5KTVNKZnI1aVduazhncVF3MW1hczN6?=
 =?utf-8?B?U09pQ0hQQ0pOQmYvSzlkcW1WY3daT2Yydk9HOXRCYTRhRGxUdis5OFRNdEov?=
 =?utf-8?B?SjdLZ0g2d3F4cVN5M3NKSXhMMHZmR3hPaC9IajFCbHhteXVEdXpOTkRLZkpW?=
 =?utf-8?B?S2RZd3drRURJek9Xd1lTaWtzdjM0dGcvZ1ZFcHIvRVJIRUlJOWgyQjJZNGdD?=
 =?utf-8?B?Y2hCcFNCK2MydFpRUzk1Unl4eGVmSGgvcFVBSkhlNldWMEJYT0pwV2RqSDFD?=
 =?utf-8?B?QkQwRjJFNnp5TzkwZG1wdGZtMmlkT01RdmJaM0x2UXc0WGNaSFFxS2tHT2FU?=
 =?utf-8?B?eHBYWGZJY1ZKTW9UeHM4b3dRay8vT3JIZHRyckd1SERvMGNYRENFQ0d6UkdC?=
 =?utf-8?B?T1ZWOG5naU1MMDVCaERnOE8rRkxHQVNGQy92Y1ZScmJsNEMrMmtFY0NSbmU5?=
 =?utf-8?B?dWN1MVZ4MElqT2ZjUEswamRTajlVVlRHWHBtcms1cGtpWFJjOERwTzNqSHdq?=
 =?utf-8?B?Ui85S0o2WW9SOTFjQ0t3NWw0VUNyQXZTYk9ncEptTEQwTEtqYjE4eUk1TzdY?=
 =?utf-8?B?d1JCbFNwdkhDOGk0MmhaQXlacDA0RnNyVE9FSUE5azlOTjc1alN1ZEg1N25G?=
 =?utf-8?B?N1pKdCt0bEl2NTBPQnpnRlc2RjRVQXF1VHZlcitObUh2blcyaWdjakxrTWRZ?=
 =?utf-8?B?VVdkcmxxcUZ4b3JjenU5aDBUTHpvTWtmM1dITDBKR2ZtK2tIREdjWFBneHdE?=
 =?utf-8?B?anpHRlpMbEYwN2duNmI0TjZmeitxanpVWXdWQkpXSHpFUUdhSC9hZnl5N1VL?=
 =?utf-8?B?UkNCVEhpTTZsVzZ5d0J1ODB2dkVTbVF3YWcxU0pKdzZaYXBjRWhzYVM0allX?=
 =?utf-8?B?NklGT0FLNUhQT1pmZks0elpQN3RYTmp0Z1Q5NkJXSDZ5a1Vhc09tcVc0UzFr?=
 =?utf-8?B?UVlGUklUZGg3QmFPa1MxV3J0WmJ3Ty8rZVBNd0wyU2JjaE15VVlzKzlSTXM1?=
 =?utf-8?B?YWhKTmpFdnhIZWR2a285YWwxalN6Rno5SFh3dU9qcTlUNmxkRlFZY1RQMWl3?=
 =?utf-8?B?aEQzd2tiRVpCOENTNU9PTW9IMUgzQjBvTFJOZ0VpWVVGZFpnNTEvbFRjc3pD?=
 =?utf-8?B?QlVIQmJyQ3YxaDJWdW9URHM4WGJ4TWw3RkdPcXl0RHhoRkJ5TzUwbWJIeS8y?=
 =?utf-8?B?cU4yTnAyS1dEeStOYzRjam1EblRXRllYRjRmN295ZC9Bd3REMFFYazZWM0Z5?=
 =?utf-8?B?U0VPU0plamtTWmdQL2dEUG83bG0yUElKMGRyWnFQMVV2L1VNMTNpalh3NXcr?=
 =?utf-8?B?bHRtQXBJdi9kQkVOYnF5REFUOHp3ekZ4MUY3b0JoZ2JtcGZjbm1zdTRGQ2Nw?=
 =?utf-8?B?dU1vUnBJZG5GdFg4d0MvcDBuQnNVeWpTSUZQdUVWTkRDcVJ2SFNmYjhyanZ3?=
 =?utf-8?B?M1NKb09WSE5EQXZtalhhd2VoRmhiS1pMdCtJMEx1ODlBZWVtbWswQ3BCRWRD?=
 =?utf-8?B?UW1KOTFVM2FZdkcwKzJpUGJEVVFJT2o4b3VGR0JwZWhUREJPOVRWNVhtVmEz?=
 =?utf-8?Q?hZtzL23aWqWC1tA3M8RNmCklB?=
Content-ID: <75EAFC6EB6B5D2469EB519F51F5E53D6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7214d2-cda8-4368-1b45-08da6642a5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 09:16:05.8864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/ect1hm6WsPO9DSQ/bnEkj/mE8LvYcjdUYXNFjyCM8n41BcKuLk9eaOOzphxRSA3ZSSt6m+mEjxtKUVXpgtDJEZbAd2mX3iLnpQ5lzboss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_021616_983670_477E4EAC 
X-CRM114-Status: GOOD (  14.23  )
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

On 15/07/2022 10:11, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Jul 14, 2022 at 04:10:36PM +0000, Conor.Dooley@microchip.com wrote:
>> With the GFP_ATOMIC, behaviour is the same as before for me.
>>
> 
> So you still get -ENOMEM failure on your platform. It is fine, just that
> I am bit curious to know why as it succeeds at device_initcall later.
> I was hoping this might fix your memory allocation failure.

Correct. I have been staring at RISC-V init code the last days b/c of
another problem, I'll do a little more staring today and see if I can
figure out what's going on.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
