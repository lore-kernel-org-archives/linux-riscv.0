Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D487C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lZNktgN0cm8qVGIyrXDnBXtKc3q5pDMx91Xrp9LDus=; b=h3UQNcaU1Kvf29
	3o6hxMAqI9bQhApkEfhFMBYRsq73zMQqVLT7H6d/LssqErsJ1Hn+t+vGFwU8ztxuC0UL3SwPGAADF
	gA+CEoWvxjynkaP0J+jb24eL51yqvt99zMmhKU73S9E5NqLtjp7SvKPXlEslZ1QEB+40vOMWIXG6+
	MgsakoqAZEK7l4zfyRdNOyBrfSttwBQg3fHaHMjo+8a56FhgB3kGYVy8d7Okb1Rrw4XXc4OUjjj7m
	ZYxRur3+v6AG9yboXTw5cmyTTTm+VcXVudIAalyxSoaVe5n74SUIhUY/M/edwX15hN1LvnOOu9Gji
	CRQhe0Pp1a1eTC6D+p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ziI-001BKE-8s; Thu, 30 Jun 2022 19:20:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6zi2-001BHD-Gz; Thu, 30 Jun 2022 19:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656616815; x=1688152815;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vxXIJh80OxjVwv5zMHOfmwwiHYuAPZfkKb2eak7djAg=;
  b=IFgIQsAWJQ33Y66ubHFS5xvD4Ce7gVuO8A68gJblPfwvBygLX8gLPmOs
   aXQijBu9SiZMrxoW3AnStJBJZgBxyFCk7/FuENvQHD2mw14ebPwtdtpsF
   tWKXKl1+mDMiNRYhayyRI+W0vr8rhrz29Ito3IRuDEzkw9N1uMz+ibbry
   DYw1F52zRe/JC97FGq3C31qK6qH4rhSG7dSbaGo6k3ucFl0tD20fvUrH1
   +FaR231dIv2zSpBCfRS5UCUF0cueYh4etZK9xyKfX7Kdr7YTLGEgvMXAh
   GzgFPEyRlTjb/pe+zA67ojD7CppzDrF/sTSHlcdBXZHZTt4nDOsoXGkmP
   w==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="170308028"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 12:20:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 12:20:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 12:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBrgCccWKL6QU21uVc48R0vcjA9t4KH1vn3vR/+trG9f32sOlGt8seeo29k5g9t9sZ4v6AFo/SAL3U+aMmca4kKynFWWZaniumia+R02+7diTyq7yBx+rj3hbb3ZDrbyZQ/c8rUbih2P5sslpFO6BzI30KbzlEe2X+Z6ETq2q2JA6B4Ei0Gf94MDZ50volp5Hsup0bR5f94VqA4+X7b4Nx6gL6tDfUxOPRY5RGAoTcielleHScRfSPof6UGkvNgqMmvPbSr3An703f9N7hzFpxVHRtf7FBCk3JQv7G02ZeGkh7qhHIiHtAi3YhyMWzQfaWlqSpxy1cOCKxW4W2+AFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxXIJh80OxjVwv5zMHOfmwwiHYuAPZfkKb2eak7djAg=;
 b=Ro21huAMKlzKJGqUicxl3TqZRldjUwi5DFZqIbe+Nfk5gF3fI/DaG9n+9sJZVYVjZpXucsxnNP+LT/GlSLCioDBmTSCa1CLy+mLnAVnq53EOwLhNWsUBbHO4asEoL/r2tZQttYwZcemE73uKrqYjEcxqiPLCWBiFf09n46wZD43R+t8JSNKyOODsCu16wwtTVmhCiVn2h9e44fv4OocjfOgoVF4D0p0kIC2zcx4YjVLN2DHN0WlyJHQWeQAKyNlfz2S4IjnZggOwd6Oids2L/TJvFLr3xH4IaH/Kv5Tuj5uZy4mEP4z5k6FUnHQZwK5jMxvdL7KPv5y+SOUYH++BIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxXIJh80OxjVwv5zMHOfmwwiHYuAPZfkKb2eak7djAg=;
 b=IcBDSlBJR+Ge4ISWEc51cV+Mhmmb/+k7NQ8aKJ8hbHjCZFAPaTnx1dLMndkyNZCI2GzKU3BBbyCm4dNFkz5DOeiXSNWf+TM1FRME0cs91irkAXqd6uIARMZ8KCpqXclf5irwtrdNXtu38Tp3WKb4LtXeO0mB4S8Pp1eYM9MglSo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 19:20:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 19:20:04 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyAgAAEPgCAAAqJAIAAMFoAgAC8ZgCAAGP7gIAAEAqAgAAdSoA=
Date: Thu, 30 Jun 2022 19:20:04 +0000
Message-ID: <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
References: <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
In-Reply-To: <20220630173513.dyrrmjbpxzi3e6fe@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1c3d0ba-0e6d-4755-952d-08da5acd8944
x-ms-traffictypediagnostic: DS7PR11MB6246:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NFH0fwOVB6z28/82dixLjy9IT5a5WlylHt9rLiyDzXGFsGOCrXwottotZKyUQcAP4sTjNXwUmMzb92LWV4StKc08Il5icssn5U26/JmfUOWxz5ViaqHvRZX4yvMB+dd/x4AVHduuBQDE7WM8fMnfNiOHp+YeRR5gNvryyaptBtfQplwYp8nGe8xII4c1yH9jGfKb75UYymv5pbHAeLCpHWQimWIxK7ayMvoI3Ba2dNSOFGxMcwxlY5o6HUN7JDlJVaPUztgDAiZc7J+dTXwVaBMW/TNW9kN2d4DC/lR7A87VN6RgdFdqmptUgl/H6O2fRHk9orD950N0yXGPeY1bYAQbTQZmv9wft32aY0BLUDgrINUy+s8DllLDJvPiIsxqez8RyhYMzekyOOztahXsVtP+lm3GmyhIOI7q9xQOSDMbQ8J16Yd9aARUx+w220yJbq8xptsudXISIiISmXLeTinHItnCgQeABSzqVByesiq7pxBZlNi/MkiUL6jBTREvJIaEAAVt5/f8KVUxv1kQOVu6zFAH6sknh0SZCiC6Wu9HwMF1t0u1foD7In8TTDYm7CFyrpA55opDSBaY+V0eciPSc0FSDJM32ypkAdhpZrbTuhnqt49JKb30AUSHo7ekzjT0ZZKOcSB37E3XT2UjKTVuWyQzebAZVzHmt3exCfMsCRYEJOcEWdvJFXhzRl3aIdW7PzOoheaWuQOQ/RKXdpqW5exYP50D5yV8WvJSTd/wSAwwHcnt/y1P6eGhHrTCNu+p2an3msCDABpCeLkeIgzvTqm6lQa+A6ECG0lMD6y8qBT6rBfqZm7wy6HMmtupnXXMpQg63g7vTUubbLGJBI7sahnVcgw+KuXj5adM4Ay6/ozdr5Z8E7lDbCksB5VsFB8h1vCrKPdfUy7t6WrSyaBwZKMorvIjDlhXagzAic0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39860400002)(53546011)(316002)(36756003)(31686004)(966005)(71200400001)(7416002)(66556008)(478600001)(41300700001)(54906003)(122000001)(2906002)(86362001)(31696002)(2616005)(107886003)(5660300002)(110136005)(38070700005)(38100700002)(91956017)(66476007)(6512007)(8676002)(26005)(76116006)(66946007)(64756008)(66574015)(6486002)(6506007)(83380400001)(4326008)(66446008)(186003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWZFL1JWL1RBTkdjWHBGQXVTV2VJditMbjAvTnBtL2xhTElORjJ2K1VXSkZq?=
 =?utf-8?B?NWk3emlwd1hoS3pQRU5Hb0pMQ0tTNVhrS1lzYVk5S1FpL3dSYUE1Wkpla1BS?=
 =?utf-8?B?R01DczZZR2JZN1k3K0VoZ2tVQnZjTzNmZnU0L2JVZEpEK0NFTEd6NVhSem82?=
 =?utf-8?B?cEF0VlBGYmR3SWNZdG9kMk1TZzFEbmJxQ01ZYlJhamdrRS9DdGR0MWRMRURC?=
 =?utf-8?B?TE56N1BqYXRUa3JXcUZkc3NRRExVMURwTGRPR1BOWDllNlorZ1VSVjZJU09F?=
 =?utf-8?B?Vm5wdmwwNkxaSkwrQWhmQlQzaE9tZFh4ZE1LeVVRN1IzUDZPMGFyRkROVUhw?=
 =?utf-8?B?RDdseVBPK3dTM05oTHcyclpKMTZhYWhTSExjQkE2Si9kTS9kTDBsUXdEemZk?=
 =?utf-8?B?SjBWWWlFKzhLNXkxamducjVpSFRsa3M1TkVIc3FmNG0wNVllT0xFbUJDb2Z1?=
 =?utf-8?B?OTNqc2l1L1FaLzE4OUxzbnNyd2hBSTJadzRqUDZ2ZDJ4ZTA4blRLSzhNQm5N?=
 =?utf-8?B?a0lqaWQ0WTRGbC9aWUcrOUVELzRld3VGWExZK2FXSHYrUE40RkZTdEdNTkZx?=
 =?utf-8?B?bXRLTWZoRUoxenlsT0FZUFdjRGQ1TGVLcklCeUtEM2dZakJ3ZmlsTHpaWUtJ?=
 =?utf-8?B?RjBXSkVLMlBkWjFKWjB2MUk2bHJOelFvdjYvK1UzeU45aForTVdINFh6Z3Jn?=
 =?utf-8?B?amNyWk1VdjhqaUxSY1d5ZGYwQVAxRCtacUZKcmpiRytlY3FIQXVaaVNVbTRr?=
 =?utf-8?B?R2VQUlJlR2UxYnRDbms5Zk1SeFc4RXovNWg4c01xc1ZPcjh4amFZQk4xYkxy?=
 =?utf-8?B?L2pCZDJsbUNTK3pDYWx4M2FHc0lsL0ZDL29HeVJCMUhMOHZQQkNqcENOVDRq?=
 =?utf-8?B?YkxNUlc5M2RoblBJelI5dkVNZHgyOEJremo4azFJdzFMQ28zRjA4OEVBY2lv?=
 =?utf-8?B?STdzRTNqUXlhZUhxRW1MTUl3WEE2dy92ZUpDTlVrbkhYVlU0ZEpKRFpnVTFu?=
 =?utf-8?B?MlNWVzc5aUZwQ0JzOTdhSkhJR2ZJOG43cHZKV0d0QUJFM1dsLytiUnJOL0M0?=
 =?utf-8?B?S0dCT203dXZqZ1A0czJMdmUxSGZHWWtCMXZyRlVqdGNkaFNXODhHKzY2ZjBp?=
 =?utf-8?B?RnNCSnBjMW5RREQ2NnZ5VTVqeS82ckw3c0dIUXNtMlZ5RkoxME9BQWxNRXY1?=
 =?utf-8?B?TXp3bS9QVHdlWTl3b01ZNFZIUlRLeElRL2hPWVlhTnBQa3piRzlMV05KNDZM?=
 =?utf-8?B?VE1MWTZhNnBjdURFZ3l4Q2pvQ2ZMNUxFSTI0SEF4TmJNUE9DanpGb2Q5MUJR?=
 =?utf-8?B?UldyYVgxVnNWQ01BemJJcGVQUlpYRThVREl4c0g1eHZvTDVKSG9LcmpMTWJj?=
 =?utf-8?B?UitnWWRyT3N4RVExVHJJRnNobEI4bXh4cTlJT1JuMEZkZS82OHcvU0xNaisw?=
 =?utf-8?B?eHdZejhaRWFWa0ZMY3pXSVVsbitZVmprREdyeDV5Y3lnMkJkaDN6MlpmTGJR?=
 =?utf-8?B?WVZCSVVWaHVmNjJCSUZ1UjJONjROQVdQN2s4UklmNFVXdzV1d3JoT1BrR1dD?=
 =?utf-8?B?Rkl3b1ZUNHJaYTdiTzFaWFhiSnhDUmVvVlVpeUdyWWVFNWU1ck9wd1U5K2hJ?=
 =?utf-8?B?RGVpeXZXaHdTNll3V1gyV0h5ZktjL0gzaXRyanhJN3dUZE85Tnl5aXdOTnpB?=
 =?utf-8?B?WElMQ0Z2dkN6dnVwN0dwOFY2eXEwUVdJMk93S0NPVmh1ZXpUQjV0bUQ0MTdS?=
 =?utf-8?B?T0U3Y0dwU25TU0w5dmROLzZkMHBaZVZIOWZiRTZEeWliZWhUWVlUYlRxMUlK?=
 =?utf-8?B?NWJZckdMOENsL2dzbVMyZkRzeHJUcEZzWTEya3RyZmdqa0hGT1pxQTcxa3U2?=
 =?utf-8?B?U3FmS212ekRpb2xrTnRXSkdnTlNwM21yZXl6YjQ0TndHUkxlOUFVUEJnb1Vt?=
 =?utf-8?B?VEZxV2Nrb1pLTVd2NHlsYnhuN08vZjlOM0VqVHlsYzE2UDRMZWRISFBCZk5N?=
 =?utf-8?B?cGpIa1RyZFlYMmQ5a2pleDJNb3V0VGs3M1V1NkVHSFNCc3llVm1ZWkViOVpt?=
 =?utf-8?B?RTZhUFFjNHRMNWNnZkh6anA4VnFWRXA1Z09INEpDZ3BqNmlsYjFVRHpOWGYx?=
 =?utf-8?B?aHhQMDJoc0NpOGR3UkRjTXBxL0FjK1VrbEoyQW5tdmpGKytpZzIwQm4vUi9B?=
 =?utf-8?B?N0E9PQ==?=
Content-ID: <F19832F5D84C38489DA2D6CBD0131DE4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c3d0ba-0e6d-4755-952d-08da5acd8944
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 19:20:04.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ED2GR+uuaE/i3/mqb9NKPYX36GA1C/25IV6RdCWfo1KnmKpQQxFN33nTh3g6EahBVpxhVuJp5PEKw2UFUVR6vWqR9Kk3uN1wa8xHgBAHVzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_122014_808425_393C8A01 
X-CRM114-Status: GOOD (  21.85  )
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



On 30/06/2022 18:35, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 04:37:50PM +0000, Conor.Dooley@microchip.com wrote:
>> On 30/06/2022 11:39, Sudeep Holla wrote:
>>>
>>> I can't think of any reason for that to happen unless detect_cache_attributes
>>> is failing from init_cpu_topology and we are ignoring that.
>>>
>>> Are all RISC-V platforms failing on -next or is it just this platform ?
>>
>> I don't know. I only have SoCs with this core complex & one that does not
>> work with upstream. I can try my other board with this SoC - but I am on
>> leave at the moment w/ a computer or internet during the day so it may be
>> a few days before I can try it.
>>
> 
> Sure, no worries.
> 
>> However, Niklas Cassel has tried to use the Canaan K210 on next-20220630
>> but had issues with RCU stalling:
>> https://lore.kernel.org/linux-riscv/Yr3PKR0Uj1bE5Y6O@x1-carbon/T/#m52016996fcf5fa0501066d73352ed8e806803e06
>> Not going to claim any relation, but that's minus 1 to the platforms that
>> can be used to test this on upstream RISC-V.
>>
> 
> Ah OK, will check and ask full logs to see if there is any relation.
> 
>>> We may have to try with some logs in detect_cache_attributes,
>>> last_level_cache_is_valid and last_level_cache_is_shared to check where it
>>> is going wrong.
>>>
>>> It must be crashing in smp_callin->update_siblings_masks->last_level_cache_is_shared


So, looks like there's a problem in cache_leaves_are_shared() which is hit
by the above path. Both of the if clauses are false, and the function falls
through to return sib_leaf->fw_token == this_leaf->fw_token;
Both sib_leaf & this_leaf seem to be null.

static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
					   struct cacheinfo *sib_leaf)
{
	/*
	 * For non DT/ACPI systems, assume unique level 1 caches,
	 * system-wide shared caches for all other levels. This will be used
	 * only if arch specific code has not populated shared_cpu_map
	 */
	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
		return !(this_leaf->level == 1);

	if ((sib_leaf->attributes & CACHE_ID) &&
	    (this_leaf->attributes & CACHE_ID))
		return sib_leaf->id == this_leaf->id;

	return sib_leaf->fw_token == this_leaf->fw_token;
}

Any ideas what to look at next?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
