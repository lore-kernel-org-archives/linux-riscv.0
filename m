Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA83C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RqOlJEeN2IUHQZiOG9ZQBubNtRnynf2/+CWSVxOggU=; b=unhpLDwmDzFoCn
	gQ2u+1fH9eczkYUIrFrrSh0VtGoA018y2VzEkg/zpzizcd2MVTRtlI2wrb2FkjR/JUsfr/fyr8WOX
	JFRhQ8GYnua44cTeGFmh/4hb5/Z/Z0VoEIFlve2IXM4dfnYOXP/B2paKZnDqpaK3+nvdCU62nB/L8
	kWC1uFXpqlAza2QRYtk9zuD6zvtWqqg6NO9VnuplDbeNW933qIrFzPL1v1h3Nbyj0EQpcOcvdrMm0
	jEVYBn/a13DBUJujwKOTADnJhF4CD7ONL9wznLRdmDpndKRPKDuv1Th9lw6y0o6/YpGpI0qB2SkCA
	okLNCwVkeCGrNuSc/egg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cLh-00DTpC-Of; Wed, 29 Jun 2022 18:23:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cGo-00DRxd-Ky; Wed, 29 Jun 2022 18:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656526715; x=1688062715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4lydrkeNPjVug/kvLF5iZK2q1i1y7oYev4S8Q7Zs9bA=;
  b=oQ8M/Ehc5Vya0FxFAgTotsNOxWWESwKg1XebylcQ65WnMsvwpnN37miZ
   HF5C9yov5PiKYK+BoWqQjwFFL+XBmBoG054Wa9lLYY8ufdHGOvhH13tDG
   1xGT82qB3w5Q/2k+GlTdurhNKaAV+qDQBA3316Q1sBU2bMsaxcdCeKh6C
   acEJp5Y8l6tEeghEHeEr55iLe9s+NSYwna4JGs5rPvUhaiIhAEVYO/rVh
   b2k8eG040Wmd6Q0ZhrOKPyCaoeF9rSsmq/cDXjXM72uTZR3r7cTZcq8mO
   RVBAtYOw1PWgBcE8wNSy0ZbEREE3ize5009qpMfnSk9CTLP4KjCwLRXbF
   g==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="162633887"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 11:18:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 11:18:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 29 Jun 2022 11:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMqme5sNTPOqcQJ74ehvGG+Psxy0px7Okun03Cz7/HVWtlsUNyz0BXeMn4Jnmza8rt8/QDCtlhbZEtEzpJoZvUAubJvpeh7JGnbUZL9RlDiXTvxXyAsszUYhyaBocJwT50irXqr7Ef0JR7/vPNyO8pdC89P0VpjTTGbcRuzDhiKvRaWiCDKiJ4gPVMsq4r1OBSN8Mr9KhJtvyUyzQGCyZi9cEeKg9fhnlOWbqQzSnBLLZOal3QQrU2XCuTdzJMFqKEnEntGrcyvN+cSMCte5buViW7sojqtDhKdXsR2lwrDmPdcRg4aScT6i9+0WnEFn5QHGtjCDVe6JdhTGneugCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lydrkeNPjVug/kvLF5iZK2q1i1y7oYev4S8Q7Zs9bA=;
 b=Cep7NYzfRsMgBLxaC8MM4qtxF57p76AqYkCgpsmgRlyKpOte7D/UTLk932omba7N1WhIqlBVsB0S1jQLOpkn5Dzdp8rsNEoABgg1aKvii8NVHlYK6R9koSzUCIGVUYxiBS/WUp9y4MsU5ZuAK5oivogIyGR6+ov+YaHpVXTe/S22BqApAkhbTDF0tbBJrHvMh5zTKxcnqJ8HNNPZ+0oHgdBGblXvRJtIan2R1T7863CW7WagM5XvC2YcYuVx36BGVdEw3ul56o9iXoiNHLXNr+1OxwByWc0p07W9H7LJjexl1edB8XuugJK0cfxCmOMkQJj2wuKVGaSrKAjN7QeIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lydrkeNPjVug/kvLF5iZK2q1i1y7oYev4S8Q7Zs9bA=;
 b=MqxweOI9aFKZavwaO/aSZrdii26JZgIjuqA11Y0JtlyJ6Br9k5HRr0PtNnZkOCTGMeVYw5C8CVg4mbOgI/o67Hgib6iTUaZNMVtbGBIaIw8Idq2KsTTzZcZM19ktzaScTF5Rs6rltOp5B8iqE0uyaBKmR75pQR4JHIri328awxU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1384.namprd11.prod.outlook.com (2603:10b6:903:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 18:18:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 18:18:25 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <atishp@atishpatra.org>,
	<atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIIA=
Date: Wed, 29 Jun 2022 18:18:25 +0000
Message-ID: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
In-Reply-To: <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9870fd2-681d-4690-edc8-08da59fbc246
x-ms-traffictypediagnostic: CY4PR11MB1384:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FeIhjG/n388V0rQVnrsM3LnMyCZKKXRLud+w0sv0BBW0u5YMfLYgMuzc0UhlwG8oGAatFodCFHA155qWpvor6ryG4woKb3qsvCVXpNoE7+tA9N5aJ1XWWH0w1rQZiG+Sm4FIsylf8IxAUqLbX5bIzI33S0pIc/OpdX+sNea5ra2zKqHd0Jg7sa6soKSBn6avNywHQNx6k0uC5FP2sW8euTLmEnYQnWYviPwqGSNGWX2thIlouXnRSAVTgNIwxUtxAAqpBDyY0u1jo/Qo0KFwbGoGHWz3ozRaalCsS/sH/mTYFZ7IOjLuyj2Tf79zT6joSsaEL6RHNUdRfgxGNRPMkYC8Ws9U7Qv0VI+wYcmub4/lF1TZwryaGiXO8uB49WR++0jcug7ldfsuDKiNgrMF0r7mcxJ5b4d6XiGTGiwPIwxonEY0JeZ/lZ/rviykiPb2miORAW6xqoWakdWlvpDXhMEKxxM9alDoB1390c/ASiBcMTsaJdr22+xizrBrhqEJHWAZRkVHa073m2HlqqjoNxzk/j+tRyKKYN0T80otm4Aa/uf3JIn9wnjp+4JoO+Ctu0J6+7FZE+pzmRpx5185EfwV6uiYi6ukFUWI/v35CAXZ9STUNlzKocoNSjuzSlXWKvCaJaPOarZK85yGTSoHhYKYk4DQKWk6BwozkORJm6HfzUwXTNq34O54HKLCssrOMKItYgtLvJv2RpAkeEykx271cFkZU7UKXe69pKgrJBO6O7qkVAJvCovEQSfGaSauptGQYt51cX3jmMXOnNxKpOPWOBu8qVWnLDvDFdqbYf4zNsG7e2hy6+EwtQctdzQj/yMo0zEWConMXbje3QZSYYkPFInp1oklu63JSQ8Bkhghb2HRUMJONeAlSXMiImiKxuSBR0Z6eCLQenCZFnZfGdCchmOlFZdMWt6Rxi2YuHY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(136003)(346002)(366004)(107886003)(186003)(38070700005)(8676002)(36756003)(54906003)(91956017)(38100700002)(4326008)(64756008)(110136005)(2616005)(316002)(76116006)(83380400001)(71200400001)(66946007)(66476007)(66446008)(66556008)(6512007)(31696002)(966005)(31686004)(478600001)(6486002)(7416002)(6506007)(26005)(2906002)(5660300002)(8936002)(86362001)(122000001)(53546011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TER1WEZiTVpwcGd6WmZCd1VYNHhZR1A0cUVJeUlZTFlwNUZ1UU8xOVdtZ3NN?=
 =?utf-8?B?K3VOeWVjMWQ5cWNiMHYxdW1YaUE0NXB1ZnQraVFGRXhBTXVwckdOaDNkU1Jo?=
 =?utf-8?B?YU52MkJyOGpqamhCeUdOcU5hZ08xdWpYOTJPZUJJZ0ZoRWkwdHpjdEN6bnIx?=
 =?utf-8?B?WW1Sc3dIa01lVGhpYU84ekFzSThGRmNXV1JzN05VaFMrT3lGRWJDNEtjaVg3?=
 =?utf-8?B?TVFTRVBiWWdna3Y0cWhST0IxQVk5UjZ4Um1oOHMrTUFFSEsrOEJjam90enJH?=
 =?utf-8?B?NHgrZGxPcm8rOWlNRTFYSjRJUkdvVmptamdDck9udkt1TWxxdGZWSnF0WjR0?=
 =?utf-8?B?TjFFVUZVRExFVmxTSjNZS2NUSkNoVDhEMW9QUGlLMXhHaHZwNWo1V3ZxSjhm?=
 =?utf-8?B?Z0JKTDIyVGJjNDVORFlBTk5DYTFLYnVzRHljK2hGU1FYSHFpa3ZRbk1VR0lt?=
 =?utf-8?B?SDEzKy9SUzYvc1dHejZYa0NkS0dEQ1dOU1NkeUpTOWoraFJGOWZiVks4UVhF?=
 =?utf-8?B?alEyTW1BRUF2aWxWcjZTdHNzcVBkcWxPZU1zTFVaQ2piYytuUHpRWk1vaU0z?=
 =?utf-8?B?TzJxVkdNeHFPVk5zUkxwUXpERzJQaWlsRVlkQXFjNFRKMVJCYk11MkZQVTFH?=
 =?utf-8?B?ZnRDSTRLVXE2RENGa3FKWk9CSnNBQmJHYks4cEFtV3dibFpMakVNZ2Z2YThK?=
 =?utf-8?B?M3c0TEtibC9EWnc3RlREWmhZa0dEYTAzTitLSFk1VXRwV3FFUlFFb2wrNkVw?=
 =?utf-8?B?QktRMVE2dmhhV0QxeWVZZGg5R0x5V21mYXFQV3dGcjZSMS90N1IxdXl2cVB4?=
 =?utf-8?B?cG1IRUFMODhJTDJ2NC9MYmVuUVI3a3JLdVdQblBZUC9JaGF0VFBSeC8zb1Aw?=
 =?utf-8?B?WC9XaG51dVpnNU85SjVVTjZ4THVtbFM4MmxoVnlTR3BtSC9MUkJLNGduWEQx?=
 =?utf-8?B?UEVxdjRYalhQZVN2TWFxZWF2TEdaNEdXSEpBWnloSGZuSnNlRVk0WmFWdjdG?=
 =?utf-8?B?V0s4VjlWSWR5dWpVdkwzL0cwbkRuUXpnOE05eGJTTlp0Z1gvV1RUTlNveUxL?=
 =?utf-8?B?VURRcVVQOFRQMVZMSGJYUFhubngxdXFGNjJOSU1FK003MUw4eEpiOG41bG9J?=
 =?utf-8?B?WWFuUVhEbXJPWEZyRlozenNUVStkRDhtamFFVVphYzkvb1pnRklpL0x4WVU1?=
 =?utf-8?B?WDE3RVVTMFpjUUZ0YmZkRTQyVkJ5VTUwT0grTWJRbjludUg0dmtJdExrMWxl?=
 =?utf-8?B?OFRENjUyRStiaUEzNVlaMElLZHBQRlVDL3lNMDVEQjhWanQ3N09wRVlkaVBU?=
 =?utf-8?B?UGh5V0sydmF1cjZuUmxWRjBabjFHN3NZc1JHWFVoVUFNNVJFMHVnSjRmc24r?=
 =?utf-8?B?amZSRndzbEFZSnBuOGFZTkZJQ240YmpRZ2p6MkwyTmcwRFVERWEzblZmR1RE?=
 =?utf-8?B?aE5DT3ZMc0h2OUUwaVRNdkZ4dnVLNlRibHgwWkJmNHlhSW00akNtS3hjMzRi?=
 =?utf-8?B?T01XTFhsYzNIUm9rSFBVenZjV28wSG52c2NzYWM5TWJ0WU1CRkdkdlVOS3Er?=
 =?utf-8?B?a2xGTFRrd1VtL2hIQ1ZIaXFkT0x0MWFYYWhSN2dzZlFRNmlIS0JNdW8wWmdX?=
 =?utf-8?B?NE1CaEpCN0hmS1F1a3hHYi92KzRHNDlmTXR1NENhYVUzdnVLZHZJRXIybmZm?=
 =?utf-8?B?M2hyT2hMQTdtcVBwcWpqY2FFQWNEQTY5Rldzc0ZqZ3o1TDIzS2pnMEJCWUtC?=
 =?utf-8?B?QWpFZFVGOFdGSG1xanhQRXJJb3RhaUUzYVlBMWdBS2NhL2tXWGxoSDlnRGt5?=
 =?utf-8?B?RHIzd09mMnJtcll6NnpoYXhlMDcvVXRjdzZXY2xwVC9yUGFNdkR4RlM4RVIz?=
 =?utf-8?B?R1ZwQVgyWHVZNjlaQXJxMFRSZXREeHFvODFQZHZIMEphYnlZOXRMRmdVMGdD?=
 =?utf-8?B?NE9HSzh0eGpzdk9ZQTZhUG1LWHFzaUxDcStjbERUS2dvVWdsNlhLR1R1cmda?=
 =?utf-8?B?VTJlWDRDU2xmUXBqUkNLa3Zhc3RkNzJOZHdMbXlleHUxcnQ4K0dRVXJFd0x1?=
 =?utf-8?B?U2lqUG9UeC9VRXdSTGZwMTlmVFlqZVJESm1DaFYzRExBem5wVlFYdzFuc0lk?=
 =?utf-8?B?UktKd29zdmdZS09NT2pJMktnc0c2WUVyMjUyQUcvREFaTFdTczR3VUNObkJF?=
 =?utf-8?B?YkE9PQ==?=
Content-ID: <31FA09677DEC594FA40DDAB40DE05355@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9870fd2-681d-4690-edc8-08da59fbc246
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 18:18:25.7125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzQHtQMwcPEW3elMbr92knKrlaCdtlMGbjjCyPyJSPznwKDd4wn39qjkIdTlgj5JwZvOjahsKcMyGA2FsguxaeJf3VLIrroJel9MTTlTWoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_111834_908429_62FE0A55 
X-CRM114-Status: GOOD (  21.13  )
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

On 29/06/2022 18:49, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/06/2022 17:50, Sudeep Holla wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The cacheinfo is now initialised early along with the CPU topology
>> initialisation. Instead of relying on the LLC ID information parsed
>> separately only with ACPI PPTT elsewhere, migrate to use the similar
>> information from the cacheinfo.
>>
>> This is generic for both DT and ACPI systems. The ACPI LLC ID information
>> parsed separately can now be removed from arch specific code.
> 
> Hey Sudeep,
> I bisected broken boot on PolarFire SoC to this patch in next-20220629 :/
> I suspect the issue is a missing "next-level-cache" in the the dt:
> arch/riscv/boot/dts/microchip/mpfs.dtsi
> 
> Adding next-level-cache = <&cctrllr> fixes the boot.

No, no it doesn't. Not sure what I was thinking there.
Prob tested that on the the last commit that bisect tested
rather than the one it pointed out the problem was with.

Either way, boot is broken in -next.

> Not sure what the resolution here is, old devicetrees are meant to keep
> booting, right?
> 
> Thanks,
> Conor.
> 
>>
>> Link: https://lore.kernel.org/r/20220621192034.3332546-10-sudeep.holla@arm.com
> 
> btw, why is this link in the patch? Why is a link to v4 relevant?
> Links to both v4 and v5 exist in your for-linux-next branch.
> 
> Log:
> git bisect start
> # bad: [c4ef528bd006febc7de444d9775b28706d924f78] Add linux-next specific files for 20220629
> git bisect bad c4ef528bd006febc7de444d9775b28706d924f78
> # good: [b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3] Linux 5.19-rc2
> git bisect good b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> # bad: [95c758a8899c4e8825a35a62a6f31667991217f9] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
> git bisect bad 95c758a8899c4e8825a35a62a6f31667991217f9
> # bad: [5cbb9aeefe0070b627cd5c5528e6e63701561d57] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
> git bisect bad 5cbb9aeefe0070b627cd5c5528e6e63701561d57
> # good: [2e6556bae3e453cf27f3fb9c6144080e2a61707e] Merge branch 'libnvdimm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
> git bisect good 2e6556bae3e453cf27f3fb9c6144080e2a61707e
> # good: [17efe76af33f6af09a821acce2e2e4e84819d381] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
> git bisect good 17efe76af33f6af09a821acce2e2e4e84819d381
> # good: [5aeeaf40d31288e8efa6ff2cbd952b13de077aa9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
> git bisect good 5aeeaf40d31288e8efa6ff2cbd952b13de077aa9
> # bad: [f64dfa36b325d107d8aca9727410343bd86d37dc] Merge branch 'stm32-next' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
> git bisect bad f64dfa36b325d107d8aca9727410343bd86d37dc
> # good: [89459a2aef8832f044c8fbbec54b46cec05156c8] Merge branch 'next/dt' into for-next
> git bisect good 89459a2aef8832f044c8fbbec54b46cec05156c8
> # bad: [24cdefc96973ff1a1f6702470ad91ab019e5fedd] Merge branch 'arch_topology' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next
> git bisect bad 24cdefc96973ff1a1f6702470ad91ab019e5fedd
> # bad: [0d71f236f0a1067aba7660d056a9061b5877bf52] arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
> git bisect bad 0d71f236f0a1067aba7660d056a9061b5877bf52
> # good: [be6ab2e822888b8d9983d670fdabc09d753fd24f] cacheinfo: Use cache identifiers to check if the caches are shared if available
> git bisect good be6ab2e822888b8d9983d670fdabc09d753fd24f
> # bad: [854a3115f9ec0b889015c6854fbc0c1d69a46e4a] arm64: topology: Remove redundant setting of llc_id in CPU topology
> git bisect bad 854a3115f9ec0b889015c6854fbc0c1d69a46e4a
> # bad: [3b23bb2573e65b11be8f4b89023296dee7f06c0b] arch_topology: Use the last level cache information from the cacheinfo
> git bisect bad 3b23bb2573e65b11be8f4b89023296dee7f06c0b
> # good: [2f7b757eb69df296554bd39b0b2b2f4da678c736] arch_topology: Add support to parse and detect cache attributes
> git bisect good 2f7b757eb69df296554bd39b0b2b2f4da678c736
> # first bad commit: [3b23bb2573e65b11be8f4b89023296dee7f06c0b] arch_topology: Use the last level cache information from the cacheinfo
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
