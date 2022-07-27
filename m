Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FB4C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjqjXGDHEY/pHvFaHN0Vtmp1VQFkcr+JzUtR6YfxZfw=; b=NBb9BIoDz00hmP
	PhSw6qJ6SVU+pwEBU+67lHNnhb315a87Yj4DecvsdHqkAA+nz1tLKyTQX8Vw8SDYNWhycHSk216EM
	6rTj1OAcY++XN0BXGOl4X0HUYSnCL+r33sfUMJ4tYpPm2t/vDf4yRqvTdsl811R7dx4tkbSz3ce9O
	O+ta5EVJGb1qOWg45oJiXZPTDUWZh3gigYbQBeS0xsQLUhF7KrgwoYN677397lGHtKyrDBdR2ErrW
	LPM2uY8m17DVnRBP9VicDvexQb2P8L7PIeD/4mNR/ZutSfTn1PZc9DrTcGBUWmUV8Jk7FkxGAYKtF
	B74+Hs2wzlLq85y74k1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGh6T-00E2La-DO; Wed, 27 Jul 2022 13:29:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGh6O-00E2Fo-UI
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 13:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658928568; x=1690464568;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mm91TBiE1TlZsrImgmkcT/3A5Qw110rJF4uPxO09qjs=;
  b=Mfm8V//MkfGSLTpmTXE2XTJlObGgS82vOK1yygSTgsZc5SkONhcRc3Bh
   fRBBApJJ29t8V/yAcBLaO520fHTWO9pkJmXHbrUk3Wf3fkOuz7ptE4rY3
   IQHzUfuOdescd5CPLyQj45SRs1sJ2xm65/y+ChnasZQWzkbY2U+v1SmEu
   7cvfnMPuNPMeNvCX/X4w/1MvhobyOijWuGp/yfks2Iitrnb4qo0BKvl/h
   BurXM0qAqD9oW/YraZNnJ44MuvQ2QFBxjNwjaAsENCrOsp8XIiF4pRFSw
   St0SahobeN8JwKLsNpuaJVAsMbfdBr+TJ/S1sqLXq5fLJf9vibnJYSaRN
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="106363915"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 06:29:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 06:29:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 06:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jits8wOhUt1eYwwYJCTDoMChuNn8gQ8fHg9m1rU8HMRBm4JIqocq0L55hZnAOraiHHUMQY+c2trRX7CZdFVOUmtAyJsEIEzG31gFi3gVsN+i8JD6Z1fpdiBi25hRreaCKMfC2XV1KaZlt+PM0c5kbJ4DhEA51QzOXOlUcetEclYllvmQLDr+9xLHGhcb5IaQBzy9KWb9P/Ek7GaRbl661JKGi48vc9nBNadN7oZTcqNEM7T5umpPx3dmZbuDP9mMwyWiJx0dbv3FLywKgvf5d1teEuwb0p9EvbPtEg8/y96zuJzYmApRhqGN1ZndhjF3w+02pBElOb4yRMn2UwLJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm91TBiE1TlZsrImgmkcT/3A5Qw110rJF4uPxO09qjs=;
 b=H3LHJ6T49nPnakBkIG1QXa9dV/N/tyo2+05GW2x8L961f5Sn7/WreiamY2T23IckexOPYIYQpPYMB+K1oGs9iqu5PxklI20nGMBTIn5yxWleP0mlj63H1gRfjzwHmb+3iOOgcHbaqI7jUhS98/PvrhFcC6Y+uobOtH+v9lvhVMXA8xHQl1aLQ4IbQFao5MFOzzHjotPmIpgusoi4UvKRlESc/BSaoD7IhME8FF7r6AvNj4C2li37WkW7fTy5vDUeqKR0zUWLioSbsBepMStvdy2OQt71+2AWQ0LqaVU3GQ7dS/GCI489wVN8Uo/9Q/wtJj6ZITRjxe6ZiGupSchStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm91TBiE1TlZsrImgmkcT/3A5Qw110rJF4uPxO09qjs=;
 b=uKybLObxjPCM9KYXZ724jqJUr5QOXy13RWiaCdpAwHn1KbE9FpcVaHtFczu41Wv7CHYAGQNykWgGbvjsmeuY6hhdT4CSAiyanTPXLfRv8c0cb144Voz79FTgyUQM8U7DL3YpZwZ1AIhbpGxivJi+jGnZCqjSveef/gt6i2lDGHU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.25; Wed, 27 Jul 2022 13:29:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 13:29:11 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <biju.das.jz@bp.renesas.com>,
	<prabhakar.csengg@gmail.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
	<magnus.damm@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <anup@brainfault.org>,
	<linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Topic: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Index: AQHYoRqa9YiD9Yfw2Eu80dWx4G03OK2R6rmAgAADK4CAAA22gIAAAzUAgAAAzoCAABjHAIAAAfcAgAAKK4CAAARlgIAABXIAgAABLACAAAgYAA==
Date: Wed, 27 Jul 2022 13:29:11 +0000
Message-ID: <5292fbdd-9eae-2398-1260-cbef652f6af2@microchip.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
 <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
 <OS0PR01MB5922FDF8CFFE44A611D3783886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <75e5ace3-3255-2302-65f5-9fbef9cb1147@linaro.org>
In-Reply-To: <75e5ace3-3255-2302-65f5-9fbef9cb1147@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a4ecf91-ccb6-49fa-2aee-08da6fd3fdb2
x-ms-traffictypediagnostic: DS7PR11MB5968:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCfLte+oeFfNGyGsjTb+KxXqGSCFwTeReSXpXthMbhJooFvS+w6oUhZCNQobsJqnIoYwzV6od9Ssi8SRUfVNXMHYhH453Ci2KrRN+UU8bgldazy9oiL8OR1XQKSgh/UVewuhASc1n21UMpRSO6tzEUQKjjsoXxFbu1ZydK6tW/CJh+LWP2xXp76Cm3FLEMArHz4tHreDOAUd9JoB3J8Iq9/wB/X4FCxTrpyiJD+wKiduVI6WUGgf/KuVRoU+28tNV/0qGEhMKHXKxUHp8vtnnnY2tf332Qbg1dET8Ctr1GutCTigI7Q/rpvgDNGzG0mzb7srTpC9ElcSlFXlgeuKE6nqQg+ohQBAXQ6yTIFpQqu/zz8U9kFHw7qzRshA39TcVcJgAamVQ7+EUBbhrMPOx5ZOQfW8S5YaQJtmxaKKiuCjKPfJv24jFMVLODsMbAdqN9m2920Vix46HY9mbfhvrGZ/3Ix9QQzwblTDHdlmEDwHolliF9prz47YcMqEBbfF67fjz4lJkQb1bxQFYyBpNKeSuqh35lPHyw/o9TeSMqrUfxLqy0HeWWPJ4AZ13OkXryk/GM+wGEkuLL+qJTpk9oZkTlixFGC1tYh55BOW8k4ijoIOsHPudnyzqLQjH1EvO4XThzGpX892fDaO7sTblR4j83mYf3mwlKVNSdJr+OsozeHlaHe9xvMbwuQlm1hwWIQ0KVeYQrepe5gzN/kWjZEfELuRxPdUv14PkW7eUCZ5t9S6h0ATcRGqykXn3o3j+ayqrk+7xtg8TBi4t+4bA1XpMppm4bfzTJ4x0K8T8AdagjX82hNUhMoWW0/nx7E+NQE4iRQAOdnVFtv3LDUr510E+jsncgMmqkMxatTv873lHjvjHBLWNeUfOpbrTj49
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(396003)(346002)(366004)(64756008)(5660300002)(66476007)(8936002)(76116006)(8676002)(4326008)(31696002)(316002)(54906003)(110136005)(86362001)(7416002)(6512007)(6506007)(6486002)(38070700005)(26005)(66446008)(31686004)(53546011)(478600001)(66556008)(71200400001)(91956017)(41300700001)(36756003)(2616005)(122000001)(38100700002)(66946007)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q210V2tMaHY4ZG0zTVF0YldDTGc2NkljR2RjWTNNeStwT2YzajQrdU5uNDZM?=
 =?utf-8?B?VE9xQnB0VVkvUWxMZkpJTkUxSDFjb2p5WitCMGN0QjcvSjlGUENYbXRuWHVQ?=
 =?utf-8?B?THl6N1FXOE1aVElRWEZYRTBOWW5sSzN0SEVjbEpycTRjelFGSmRhMVlROS96?=
 =?utf-8?B?bE91b1NIV3l5VlZPUklUZjI1anFNUmFmOUxlVHdiMEJWSitqa0FBb0NpK0Fr?=
 =?utf-8?B?a3liNVQ2eFpxS1g4dUZ0SjJOUk4reGtUdmsyZFhhRm9YTTY0NHNycE8waUd0?=
 =?utf-8?B?d012Q0Q2ZmhEelY1ZGZ2dk1DanVKRmtFekVoTE5hNnpqVjVRa0Rza1k3QlZi?=
 =?utf-8?B?NHBJUXJXUHBmWjRYdnFqTlI1UHl1dC9uNXRWL3FoVkRDMCttWGpHd0V1TEpM?=
 =?utf-8?B?SzFMT2pxVkM4aUszYXF2SGxYUi83RWxqejVrSzB3N0dHSzJnd294ajRXYWZL?=
 =?utf-8?B?MXd2dHFpcWFUM0xDZnVoWkg5bkdWU0twWEFBL3VxZVYwQzExaTE4SUJmYUF5?=
 =?utf-8?B?RHUrQjFYMk5nbFUzNzJjaG53Rk1lN1prUmN3UUlZdWVldmN3L1lXMUxHSzZu?=
 =?utf-8?B?NWYyd3VPODVEZFBSVXptOUl0RVhpNi84NjRVSzhGREZQSjJLUjdFbzNhZ2cx?=
 =?utf-8?B?eW10QVpxSWxncFBWRjZXbGJIRjR4VStqMEVHMFpvQW80SzhyMTdSUTJ3bERt?=
 =?utf-8?B?WlVwUFpkN3F5SElKUHlZTWlscU4yS0N3M0dSenNxWVZsMFJ0MDBBRndrMnB0?=
 =?utf-8?B?NkwvK3BTQzdlczlpaC9ka2NDbTBoZ1VTNCtVemY5bkIzL0VXL0haWGZWUFpt?=
 =?utf-8?B?SW55WHNkbnREeTh4bmYvUHI1czlXQlYxRFh5Sm1aQUJNeThEQ2U5WiswZW1K?=
 =?utf-8?B?MGFRazEyMHRiSDF3SXRPTG9GU3dLYzhNeFhPMXE3UGRjYjhja0FrbnRGT29w?=
 =?utf-8?B?dG1Xb3FCMFlkSk8ydlE2ajZiMWx0R3VrcVVIMElpZmtrUEYxczJLZDJMOWxs?=
 =?utf-8?B?QlY4akR6RzUwM2ZZbEMxeW5GYllHZFR2ZnQvRHBrb2lFR1A0cVJVZklvTjhW?=
 =?utf-8?B?TjhzT3FCNk1WdHZRK1NidjZBMnE1Zkx5b3JBUEIyUUxGUEh2UUh5WVh1ejln?=
 =?utf-8?B?cGhwMDduZWowc1VFRnlqcWNLaEc5M0hYRmJHZnN1MjFqTGdsaFFRWGhmTXdw?=
 =?utf-8?B?WWk4UGtzN3lpZTlKOFRLMTlsT1pvaGhXVkFqdTRYTG1YVFo1WUE3YWEyMCta?=
 =?utf-8?B?RzlMWjN2Qkg0VlJkOWMwZFVBQ05RTXlMa1Y5WlhpWEJlWU5hMjFVblkyZTZQ?=
 =?utf-8?B?Wnh1K290VXlRMEh1MWxwL1hMcS9hdkVxN1d4SFdraTQ5S245a21iYjJvaFZY?=
 =?utf-8?B?dGhaOXhPRTl2Sm13NEhxV3MzSldtSi9kWU00MDJTWnlwZmoxWFFISEJGT2Fi?=
 =?utf-8?B?ZWtkemh3RVBEVTJlTllFK21uT1lNdnlOM1NDdmkwRkc5cElqOXlJOWhNMGQz?=
 =?utf-8?B?dGwvMWNUdlFyUVlKWXI0VzlIUTVUZFUyanJrZzZaR3V6Sk83UG9ERXVZV3R1?=
 =?utf-8?B?M0h0Sk4yWVF0UEZRR3IwUy9NdnpjZU9xY3NrWWtBWHhVOEVhYlZqeHY2ZTA5?=
 =?utf-8?B?OGdTN3ppeUNWV1JGU0tLWktBQngrLzVFMEZWOXJYZlJRTzFON2p0RGR2S0Zo?=
 =?utf-8?B?M1o5M1lJUXpLVW0xWloydGVwNFEzZGhZK3hidjJUQ29nVTM1VWtLakt1RUFU?=
 =?utf-8?B?VTJsNmE2SE9pdW02VCtpbENzWEIxdVhNclF4Y0dsOERzK3lta1VLVGR3eGd6?=
 =?utf-8?B?dEVldlZTdVdVVWlYUk5CWGV4b1RQYWNCNjVBMXlDa0Q4QnZBbTVHNmZXVFcy?=
 =?utf-8?B?b1Q2S1Vidmk2Z3BhWVFaY2djazhmVGc1bmZZQTRuYUh6UmV1K0RQK1NFbjdl?=
 =?utf-8?B?V1AwOUJPWGF2SnUvTExWNWVKcXFEREQyVmZySGwvTnFyV2tUeTVua010Z3kx?=
 =?utf-8?B?K3dxU0FrbnZ4S05mSkhJYUNSMHFVQmIvYllsbGNHeEM0SitKM0V4NG1rZWtw?=
 =?utf-8?B?YklLUDlOaU0rV25Sc2VNSG9PSkF4QW84eDZIaFAyY3JTMWZyMlhiNXRaa0Fu?=
 =?utf-8?Q?hkBeG6DNB4wETMLORk8YnUo6K?=
Content-ID: <F39F163C534F024B98D2B24C452C7767@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4ecf91-ccb6-49fa-2aee-08da6fd3fdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 13:29:11.1128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRsWaCg/6ayDSOgSptpgy5Fq9ceC5V3vU5F/Dnr+GuY/DMzpeGUsIzyPKXpBPkXx079JD+xsLFWYDbwcG10b2QD11ExJMSkpQewnSlEYzhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_062929_095180_638176F9 
X-CRM114-Status: GOOD (  15.56  )
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

On 27/07/2022 14:00, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/2022 14:56, Biju Das wrote:
>>>
>>> Then it is not the same SoC! Same means same, identical. CPU
>>> architecture is one of the major differences, which means it is not the
>>> same.
>>
>> Family SoC(R9A07G043) is at top level. Then it has different SoCId for taking care of
>> differences for SoC based on ARMV8 and RISC-V which has separate compatible like
>> r9a07g043u11 and r9a07g043f01?
> 
> This does not answer the concern - it's not the same SoC. The most
> generic compatible denotes the most common part. I would argue that
> instruction set and architecture are the most important differences.
> None of ARMv8 SoCs (SoCs, not CPU cores) have "arm,armv8" compatible and
> you went even more - you combined two architectures in the most generic
> compatibles.

I would have to agree with this. The most "core" part of the SoC is
its architecture and while the peripheral IPs might be the same etc
& the Renesas marketing team might have put them in the same "family",
for the purposes of a device tree I don't see how having a common
fallback makes sense.

Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
