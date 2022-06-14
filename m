Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7996C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diDJAp6bfHrg1F183WRpSPuP/D9ODbCun1CFck456ic=; b=nhvWa2cQJRV8Xh
	WuqxlUYMbKI11BIFDQp7UyQnPI2WIlrY98LHyzLhVinK3G6RQ7lq/KaaNFEupQHrXOJAAS0lTmr6C
	EtXt47M8uqxogLatsOjmVQIeWWFY9ZXoDJzsiMyhUyb+PX6IryCo7C7Zuo84SA1fP2UPkBQtWOwKJ
	l/F/FMHLcq311pmZJTaDxfxhKMyNWefZxFOglWhFKm5gLsB74/9Yogoy3UXLa/HlYk46Ksdge9MVd
	xowYBMZlzbUkj6PsDIIlk7ezoecwMYNi6tTDiwYtjXggBTorROMcXWGNfTeG5/pxmL3+aZzehhF6R
	MC45KjxtY5VM3i+09VJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13sE-0093mr-UG; Tue, 14 Jun 2022 10:34:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13sA-0093lV-VX
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 10:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655202850; x=1686738850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vzTtE5IGO8+9zph3qrrk39yCwFS6ZAJtD5fKT5XtDPw=;
  b=IvJUEwkMETgKfe5MvJWcEHG2E5ljzjc3tOn9Ujj8fFC8Vlo7+5CVFVDM
   jdMg0Bsr1xo2wFNx0KbG8z/mHprA3q9HHXSIO5E8jqf47kCHC9CaFe6oM
   jjOnm2YTYY7mG38zMh7oLJ6hG6llGK0R4Oi3z9g2vAcLM++0mCZDh3Tie
   w4WynCLoeX8D6tI6jHYLEHBsvwvRTHIerpdbZK+Vuw0xBIpdocuN5KaJU
   +VdZ1YEPBbKHmqJywN9PohYP/PYslyMdNjZ8YmQB6pyyDWEY/vv7PoFDi
   5NYi0PUl9JIZ1jazsDdhummHqcXo3gzEkiYazwqPHznrR4VUrowyeeJ0S
   g==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="163256528"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 03:34:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 03:34:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 14 Jun 2022 03:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi/9f4Te94O5ZlKSzX9LEV8DwSX3wzl+5TmB2uim3IONOgN6REgBYZZkjeN8ZRyTz3bWYgaCPxcLRQNX4Z45+gmOUvk7EcZMgcr5ruk9cVjcgQsJ05dZ+1PrzD7ZIAeUog939NJ68pGNt5XvJAc9FC0XKvseCjIkNoz4ZkRBdb5Xe1IKU5xsNr9ZlROAANIJZmThyShgEbSwR1HN1HzTKE4N43dc3dpzG+a7eJWlxe4VXOQxxL5A1zBSNaCARyR9gHCWtnDLTcDgSdyzN21IBzVryj9IzWEMywlLFz+AdmDyXrD4sHvpSSgZo3F49bnug3W5ivJwMcnS6A3Jas7Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzTtE5IGO8+9zph3qrrk39yCwFS6ZAJtD5fKT5XtDPw=;
 b=LcGbbUC0oWgUeOts7332CbzFjXAT9+X9SGJ7swvi+4CX5Toqk2F1MCylSr6xHVPjbAlJbC6Fi0Rdk0AyxpW0tgdDIPylphaaLRXlFxp44gapE7jUAPCePkHdYRCQo/HMYqXZbkL66H9Q0FtfDj984MUz8087p7vhzd2U802aLKQnsba60U2dZJvLL+hnOFR8YXBtP38TjkiK+U+DUT+EYX0sf6m3GplTU5HxHOGXEeBZ/wxvijjI+ll8FoQksOkk1WuL3A2XU9eowpI5z0bdEeWFVge68XRbckPBLp1g+1wWDGUziDF/fwWVA8vbeIGTgzVDal0Qx6/7lSAuidsTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzTtE5IGO8+9zph3qrrk39yCwFS6ZAJtD5fKT5XtDPw=;
 b=a1qjcO0/31l+xD2LgFqhFO7TjE40R2JtRHVxhmiqreDX5QVIuzKDXioVCZ5731Dm0+lyo3tqQEmwkChPtZfoWjeyFo+CW2hE7pklXdIy0QkmxyaQznrDvzTMPp+La1VqRCzMx8Yc7trH1xy8pTodyTPI3X63Xr71ORKPRoDwoXQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Tue, 14 Jun
 2022 10:34:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 10:34:01 +0000
From: <Conor.Dooley@microchip.com>
To: <lkp@intel.com>, <Conor.Dooley@microchip.com>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>
CC: <kbuild-all@lists.01.org>, <Daire.McNamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] pwm: add microchip soft ip corePWM driver
Thread-Topic: [PATCH v2 1/2] pwm: add microchip soft ip corePWM driver
Thread-Index: AQHYfxeRlKP8nH9DZkyscP+LOLkrSK1Os++AgAAB+oA=
Date: Tue, 14 Jun 2022 10:34:00 +0000
Message-ID: <63334bed-17ba-fed5-9463-9fd52fd57351@microchip.com>
References: <20220613111759.1550578-2-conor.dooley@microchip.com>
 <202206141813.qgogbMAN-lkp@intel.com>
In-Reply-To: <202206141813.qgogbMAN-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12db9c92-9cc1-4281-1cf6-08da4df1656c
x-ms-traffictypediagnostic: BYAPR11MB2600:EE_
x-microsoft-antispam-prvs: <BYAPR11MB2600B117A68F55BF0EF6772C98AA9@BYAPR11MB2600.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkdyoeQBCv1LngAN7CF2RF48vobr5vMor7YBHr6hHPozuU9/VqLzUP0Bj4le0F9CvawhGYlcUQFsGc4CnpXR4fDUQ2teK5YRTCQ9pKEATVrsPNM2loJlwcGQ8F5P+/sQAgYYMBzmRAKZGiVuDDrLuinQh6mdEeoBV5bsk5o8XZphZTicMNPsgdoceTwhfbkdGULV+XfObGgG1LyVqFno4Qf5JwZAg++bmUAAWWgQUo1AKytMOUU07f8IIcZGRTWzr4JnuHhinb3x7gOeG+pjdqjGF1qPKavAalQ9vqPWOeFx0FLgknJkKn7fj+bLE4EZUlQNDE9yrzrD1dFcShqn7WK088GRDflddP4YQncK8t+aG/l6i2Bi0/sRxYQKbf4O7dhk/BILpPcF9/IB51RdKCIbDTZBof9x6nUve2qZsXUUgcdV9NpUdd6I7VCuzFLoHtk7g7HmBn666TbxNB+5SCLkiR6g8+DKe2hPzjvatnJLbvMv+OTRfuB7BJkDaa52B7jt/NLPbJqQu00/ktPLcJkTmqTtAGv8U4lcAYlHyqA+EZbVR/v0zo1YiJ/fWYCyawf3KP7/6GAOL2Uhrbkxh/ePu7uG6OLk8vxKvMaeVIh9HiKdYpi2In3NsEyQgdkem3YYJaXW5kcqk+xBOQxeovOWDhicp+/QIMgfsQq6M5MzF6PxLDv5bXb90r2eqSp1+0w4QB0tKYyD/v+xBg+XD5wyWxmmPT79rwvNFJzuL278zdOgn/kDqfShK2ROwTnbOvhZI341kivkhYYgpUriR5zh3K0iWcauTS97IRfnbZLdoq0yGYEFOMqmrjxYjGUvB5ugfhinQVe7f+S6c8N8el4cYWu/Tzjxj2XcD1rCfrbobitlnr1q31e4wMondKcCJgQ6M4v0AYpdVc2aVJtELg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66476007)(64756008)(66556008)(76116006)(2616005)(8676002)(4326008)(66446008)(66946007)(6486002)(38070700005)(508600001)(71200400001)(966005)(36756003)(31696002)(91956017)(86362001)(186003)(83380400001)(31686004)(316002)(122000001)(5660300002)(30864003)(53546011)(26005)(110136005)(6512007)(8936002)(6506007)(54906003)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnB1ejZwNDRyVkVkVERlUnNzZnNFYmhuUlVOUVJJN21peEZhUENlV3kzaTZu?=
 =?utf-8?B?Y0NTaUJ3S0NNNUloU3crRCtDemFvZSt0RE15Z1U1WjE1bXpPclRFRk10ZUov?=
 =?utf-8?B?Q3lCZEhrV3gzT1loN2NpNzJEcFQ3b1ZibnZlSllWYnFxTzE1ZWZURnhmTE5K?=
 =?utf-8?B?VW00YkF5VjFEOVAwVTQrSkhOY0Q4MWxTRFBmYkFNeDNFa1VtOXNKMEJ6azJY?=
 =?utf-8?B?eVBsTWl6NGtGZFNBVmFRaCtsRFk1ZVV6VTB0NmIza1A1U2ZxT0pCVG91amZK?=
 =?utf-8?B?Q3FPSWYrTWFQWGRSVmVhK3E0RnFoUllyQkFhUzQxd3lrVkJDTWtya0d2K05N?=
 =?utf-8?B?cjZGK0xKdmRWU1U4clhJMmQwWmNGYmtLOHRLQXcyelZrYkxReXZoSU8xUnAy?=
 =?utf-8?B?WjlTQ3d4a1FpSm9WSnI2eDBlbnZORGtYNVVHaWkxaGs1djdrWDQ5Y0NDVnV0?=
 =?utf-8?B?Z1g3MDBBdW9jaW5ueERyN2wrNDM5Wng0d0o2SnQ2NjJvMDVCdytpbmYzOUZj?=
 =?utf-8?B?ZkVTTHBKa2tBdllXeEE3cUJRVklLSUNCV1BhaDFQOUdqR3NRVy9YN25YREsw?=
 =?utf-8?B?TWU1eHdsSkpuK0xKdmdzMzRhRjdsYUJLUmVFUkE4cDVsKzRXZEZaemFXU3RL?=
 =?utf-8?B?MWs1bDE2OTlybkdiS09HTzB3ajNmMzVDTk03Ym9MV1pRTjVPVXI3aXFQajZO?=
 =?utf-8?B?b2pXRnM3MjdOandzdGlMV2RURXUvM0drbklXenZBNERTY01zeUFHVWxwOWZz?=
 =?utf-8?B?TENKcDhhRmNoSEtUTEtaSEN5ZG1iMXYvYTJ0c3ZlS1ExR1pKV2JFMElmY1Iv?=
 =?utf-8?B?V3QvK3ovNm9YU0RmWWN6bUxMdER2aEg2QVE4aU1uSzNKdHhDZUNMaWRtbm9U?=
 =?utf-8?B?RjBFbG5iMXFXTEsyRG95cXBsWGYveENzeVlPdCtwSW9TNmJ0MkdmQWF1cTN4?=
 =?utf-8?B?OFFTZmY2V2EwUTNNT0xiVVFoR1l2WjRVKzI4VHUvS21PVFdPZ21BZ1BXY3Rx?=
 =?utf-8?B?K2dXa3JsUGZlNnI0Nk02dzUvMWN2SzU5MGwvT0MxdUU2UmEzeE9oSklScHpF?=
 =?utf-8?B?VldUVUJqdEJDbWhMZmtMdFJ4NnFFUFkzUUc0SUhCN3lhbUlJVlM1dHBua0Ny?=
 =?utf-8?B?VCtRcnpZNnpHMTFwUGVDdW02dE80NVVVaS9WV1FTNWNYKzBmaldxcDZIK2dH?=
 =?utf-8?B?a2NvRDZ5MW1JVER4QXlVSEQwN0gwdFNldmxZTWVqMVR2L05LNjlTNmlyRWpw?=
 =?utf-8?B?SHdIOGNCQUxRN0s0U1kvZlVlU3VweW0vYkpkUWt2bjUrMEtZVWpZWDRaUVMx?=
 =?utf-8?B?bjRUYWpZRUgrQUtQaVVrYVJOcFcwdVFxOVo1d2p1WE5TanMyUFNNZU9iZWd5?=
 =?utf-8?B?MEhlSUZsTzVPSDNxbE9CNDFBM2xHZFEvOUl4NkI1N0JsY0w2akN1NXcwSmY3?=
 =?utf-8?B?amZnWXgrc0tPVWZKSnpzR1BZb2NvcVlSTThxZ1Fpb3JmN1lWYXFMME00Mnpm?=
 =?utf-8?B?ZjBWcTBOSlgzbklZL0JGOE12MzlmQlJaeURCeWFrQUhXdWQ2TWNzMkVTVndF?=
 =?utf-8?B?ZHdCMFNDSlhHOHhYa3NHdE1QS3F5Q1FiS3hBcTJwa1Ixd290Vkc4S01lK0ZT?=
 =?utf-8?B?T0JST2xnbkJrakN3UUh4ZnI3MWtYZXhxUWVvbmszeVpYZ0YxZHkvWHJ6YkJC?=
 =?utf-8?B?UVo4Tko3THpaNk5qZTRSeFlhYUViWHZyR2lVYmxSVFg4VXJkTTZZWXpJSk4r?=
 =?utf-8?B?MGlOMk4vcm1lanI2N0w2am5tWlVmbGgxL0hJdXJCWEdvbENVVXpWbXNvZjl3?=
 =?utf-8?B?WFplbjJEUnJLR21PVTRUbjF4WllxTXNrQmZOVjBpd24xT3NHRlpaL0ZyVjQ0?=
 =?utf-8?B?dFVZNkhkYWIrZzJYVzdGaW5KRnFUSmpDQmI4UFdQME1WdTZtWGpGMjU0djUr?=
 =?utf-8?B?TDd1eXJaeWZ5QTRGMDBYOUtIM2t3UzBuU0JEV0JST2pnYzllc2FxVVUwRFRT?=
 =?utf-8?B?Z21ERXZ2V21DVXU5bXV5dWllSHRNV0N4djdwQjJpQXdIU3pwY25YRWpSU2Zo?=
 =?utf-8?B?dis3VWVtaUlOa0k3RE5kanVhTjVYYmJibjhQcGJuQjltcWhqeUlZdFhxbmhu?=
 =?utf-8?B?YTNOU0NlbHA2MnR3UkpIZTVMU1RFZWpXSCtzdnpYSEYxTDZXUGFVdi85S3VK?=
 =?utf-8?B?MS9XR1lUdGZzdGgzemFlQVFWa0hXK0N3R1RmNHR1a3pheXh5S1NJcDQxWGRV?=
 =?utf-8?B?OHJHS28xSTduY1NFRDE3R1p3VHUrbTJPbHVNck5ZTTBCZ21kRkJEM1RUczBs?=
 =?utf-8?B?WGJ3cC9HN2k1QjV3VkZNZnE0czhRdUs4WGF5Tkk0SE5CSE0yQkp3Z1R5QkV2?=
 =?utf-8?Q?iA0spbLfnbr6db3A=3D?=
Content-ID: <3F0774450C15D44DA28C620DE4D9BF61@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12db9c92-9cc1-4281-1cf6-08da4df1656c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 10:34:00.9762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhNIw51jb5sI3aBeIAIEnpT/tDTewg9RTG79RbwerED4aLCkdoSMoxC1eJQ8h5OLM4pjFkHQIVPPCtsIfP85Om2luakypBTXSyMPI27Zl8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_033411_223042_06707C44 
X-CRM114-Status: GOOD (  15.69  )
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

>     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_enable.isra.0':
>>> pwm-microchip-core.c:(.text+0x380): undefined reference to `__udivdi3'
>     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_apply':
>     pwm-microchip-core.c:(.text+0x586): undefined reference to `__udivdi3'

I assume this is me using functions that are only defined for 64 bit...

On 14/06/2022 11:25, kernel test robot wrote:
> Hi Conor,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on thierry-reding-pwm/for-next]
> [also build test ERROR on linus/master v5.19-rc2 next-20220614]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20220613-211851
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
> config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20220614/202206141813.qgogbMAN-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/4451a8420f9fd16ee9a0801fcf02f1ec04bb8ab0
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20220613-211851
>          git checkout 4451a8420f9fd16ee9a0801fcf02f1ec04bb8ab0
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     `.exit.text' referenced in section `__jump_table' of fs/cifs/cifsfs.o: defined in discarded section `.exit.text' of fs/cifs/cifsfs.o
>     `.exit.text' referenced in section `__jump_table' of fs/cifs/cifsfs.o: defined in discarded section `.exit.text' of fs/cifs/cifsfs.o
>     `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
>     `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
>     `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
>     `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
>     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_enable.isra.0':
>>> pwm-microchip-core.c:(.text+0x380): undefined reference to `__udivdi3'
>     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_apply':
>     pwm-microchip-core.c:(.text+0x586): undefined reference to `__udivdi3'
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
>     `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/vt8623fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/vt8623fb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/vt8623fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/vt8623fb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
>     `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
>     `.exit.text' referenced in section `__jump_table' of drivers/misc/habanalabs/common/habanalabs_drv.o: defined in discarded section `.exit.text' of drivers/misc/habanalabs/common/habanalabs_drv.o
>     `.exit.text' referenced in section `__jump_table' of drivers/misc/habanalabs/common/habanalabs_drv.o: defined in discarded section `.exit.text' of drivers/misc/habanalabs/common/habanalabs_drv.o
>     `.exit.text' referenced in section `__jump_table' of drivers/scsi/fcoe/fcoe.o: defined in discarded section `.exit.text' of drivers/scsi/fcoe/fcoe.o
>     `.exit.text' referenced in section `__jump_table' of drivers/scsi/fcoe/fcoe.o: defined in discarded section `.exit.text' of drivers/scsi/fcoe/fcoe.o
>     `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o
>     `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o
>     `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
>     `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/ray_cs.o: defined in discarded section `.exit.text' of drivers/net/wireless/ray_cs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/ray_cs.o: defined in discarded section `.exit.text' of drivers/net/wireless/ray_cs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/mac80211_hwsim.o: defined in discarded section `.exit.text' of drivers/net/wireless/mac80211_hwsim.o
>     `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/mac80211_hwsim.o: defined in discarded section `.exit.text' of drivers/net/wireless/mac80211_hwsim.o
>     `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
>     `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
>     `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/g_ffs.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/g_ffs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/g_ffs.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/g_ffs.o
>     `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
>     `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
>     `.exit.text' referenced in section `__jump_table' of drivers/vme/bridges/vme_fake.o: defined in discarded section `.exit.text' of drivers/vme/bridges/vme_fake.o
>     `.exit.text' referenced in section `__jump_table' of drivers/vme/bridges/vme_fake.o: defined in discarded section `.exit.text' of drivers/vme/bridges/vme_fake.o
>     `.exit.text' referenced in section `.data' of sound/soc/codecs/tlv320adc3xxx.o: defined in discarded section `.exit.text' of sound/soc/codecs/tlv320adc3xxx.o
>     `.exit.text' referenced in section `__jump_table' of net/netfilter/nf_conntrack_h323_main.o: defined in discarded section `.exit.text' of net/netfilter/nf_conntrack_h323_main.o
>     `.exit.text' referenced in section `__jump_table' of net/netfilter/nf_conntrack_h323_main.o: defined in discarded section `.exit.text' of net/netfilter/nf_conntrack_h323_main.o
>     `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
>     `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
>     `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
>     `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
